# FraudCheck
As an analyst for the state, working with auditors to identify fraud is a common task.
To avoid any private information being shared, all tables and fields have been altered for sharing 
and the original data files will not be shared due to PII regulations, both files were Flat Files
prior to being uploaded to SSMS.

In this case, I am reviewing a health care transaction table as well as a death records table
at different time periods. Specifically, I check for transactions 0-6 months after said customer 
died, 7-12 months following, 12+ months following, and 24+ months following.

I was able to inner join these tables by medical ID or by SSN depending on which were available for each time period.
From there, I could pull more specific attributes from each row to allow for further analysis following the 
join. 

This query allows me to identify which customers had fradulent transactions, how much the sum 
of these transactions were at each time period, and how likely the transactions may have been fraudulent.

By utilizing a 6 month date buffer (it is normal for there to be some transactions up to 6 months after 
passing) I can show only the most likely fradulent cases to allow more significant findings.

Overall, this query allowed for me to identify multiple people to follow up with the auditors on and 
flag various transactions with over $100,000 in value.
