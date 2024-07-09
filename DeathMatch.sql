-- JOIN for Death Match over 24mo by plan ID
SELECT *, SUM(paid_amount) AS total_paid_amount
FROM Transactions_FY23
INNER JOIN DeathRecord24 ON plan_id_num = plan_unique_id
GROUP BY Transactions_FY23.id, DeathRecord24.plan_unique_id;
-- END 24mo
 
-- JOIN for Death Match over 12mo by plan ID 
SELECT DISTINCT plan_member_id, SUM(paid_amount) AS total_paid_amount
FROM Transactions_FY23
INNER JOIN DeathRecord12 ON plan_id_num = plan_member_id
GROUP BY plan_member_id;
-- All transactions, no 6 month buffer
SELECT DISTINCT first_name, last_name, plan_member_id, paid_amount, paid_date, service_end_date, Death_Date
FROM Transactions_FY23
INNER JOIN DeathRecord12 ON plan_id_num = plan_member_id
ORDER BY paid_amount DESC;
-- Using the plan ID found from the previous query, identify the transactions where service end date is 6 months or more past death date
SELECT DISTINCT first_name, last_name, plan_member_id, paid_amount, paid_date, service_end_date, Death_Date, SUM(paid_amount) AS total_paid_amount
FROM Transactions_FY23
INNER JOIN DeathRecord12 ON plan_id_num = plan_member_id
WHERE ABS(DATEDIFF(MONTH, service_end_date, Death_Date)) > 6
GROUP BY first_name, last_name, plan_member_id, paid_amount, paid_date, service_end_date, Death_Date
ORDER BY paid_amount DESC;
-- END 12mo
 
-- JOIN for Death Match over 7-12mo by plan ID 
SELECT DISTINCT plan_member_id, SUM(paid_amount) AS total_paid_amount
FROM Transactions_FY23
INNER JOIN DeathRecord712 ON plan_id_num = plan_member_id
GROUP BY plan_member_id;
-- All transactions, no buffer 
SELECT DISTINCT first_name, last_name, plan_member_id, paid_amount, paid_date, service_end_date, Death_Date
FROM Transactions_FY23
INNER JOIN DeathRecord712 ON plan_id_num = plan_member_id
ORDER BY paid_amount DESC;
-- Use previous found results to subquery or transactions with a 6 month buffer
SELECT DISTINCT first_name, last_name, plan_member_id, paid_amount, paid_date, service_end_date, Death_Date, SUM(paid_amount) AS total_paid_amount
FROM Transactions_FY23
INNER JOIN DeathRecord712 ON plan_id_num = plan_member_id
WHERE ABS(DATEDIFF(MONTH, service_end_date, Death_Date)) > 6
GROUP BY first_name, last_name, plan_member_id, paid_amount, paid_date, service_end_date, Death_Date
ORDER BY paid_amount DESC;
-- END 7-12mo
 
-- JOIN for Death Match over 0-6mo by plan ID  
SELECT DISTINCT plan_member_id, SUM(paid_amount) AS total_paid_amount
FROM Transactions_FY23
INNER JOIN DeathRecord06 ON plan_id_num = plan_member_id
GROUP BY plan_member_id;
-- Use previous found results to subquery or transactions
SELECT DISTINCT first_name, last_name, plan_member_id, paid_amount, paid_date, service_end_date, Death_Date
FROM Transactions_FY23
INNER JOIN DeathRecord06 ON plan_id_num = plan_member_id
ORDER BY paid_amount DESC;
-- END 0-6mo
