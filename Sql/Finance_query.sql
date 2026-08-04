
select * from financial_loan

-- Total Application

select COUNT(id) as Total_Loan_Applications from financial_loan;

-- MTD Total Application

select COUNT(issue_date) as MTD_Total_Loan_Applications from financial_loan
where MONTH(issue_date)=12 AND YEAR(issue_date)=2021;

-- PMTD Total Application

select COUNT(issue_date) as PMTD_Total_Loan_Applications from financial_loan
where MONTH(issue_date)=11 AND YEAR(issue_date)=2021;


-- Total funded amount

select SUM(loan_amount) as Total_Funded_Amount from financial_loan;

-- MTD Total funded amount

select SUM(loan_amount) as MTD_Total_Funded_Amount from financial_loan
where MONTH(issue_date)=12 AND YEAR(issue_date)=2021;

-- PMTD Total funded amount

select SUM(loan_amount) as PMTD_Total_Funded_Amount from financial_loan
where MONTH(issue_date)=11 AND YEAR(issue_date)=2021;


-- Total amount Recived

select SUM(total_payment) as Total_Recived_Amount from financial_loan;

-- MTD Total amount Recived

select SUM(total_payment) as MTD_Total_Recived_Amount from financial_loan
where MONTH(issue_date)=12 AND YEAR(issue_date)=2021;

-- PMTD Total amount Recived

select SUM(total_payment) as PMTD_Total_Recived_Amount from financial_loan
where MONTH(issue_date)=11 AND YEAR(issue_date)=2021;

-- Average Interest Rate


select round(AVG(int_rate),2)*100 as Average_Interest_Rate from financial_loan;

-- MTD Average Interest Rate

select round(AVG(int_rate),2)*100 as MTD_Average_Interest_Rate from financial_loan
where MONTH(issue_date)=12 AND YEAR(issue_date)=2021;

-- PMTD Average Interest Rate

select round(AVG(int_rate),2)*100 as PMTD_Average_Interest_Rate from financial_loan
where MONTH(issue_date)=11 AND YEAR(issue_date)=2021;

-- avg Dti 

SELECT AVG(dti)*100 AS Avg_DTI FROM financial_loan;

-- MTD Avg Dti

SELECT AVG(dti)*100 AS MTD_Avg_DTI FROM financial_loan
WHERE MONTH(issue_date) = 12

-- PMTD Avg Dti

SELECT AVG(dti)*100 AS PMTD_Avg_DTI FROM financial_loan
WHERE MONTH(issue_date) = 11


-- Good Loan 


--- 1.	Good Loan Application Percentage: 



select  distinct loan_status from financial_loan;

select 
		COUNT(case 
					when loan_status= 'Fully Paid'
					OR loan_status= 'Current'
					then id
			  end)*100/
		count(id) as Good_loan_percentage
			  from financial_loan;

-- Good Loan Applications

SELECT COUNT(id) AS Good_Loan_Applications FROM financial_loan
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'



-- Good Loan Funded Amount

SELECT SUM(loan_amount) AS Good_Loan_Funded_amount FROM financial_loan
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

-- Good Loan Total Recived Amount

SELECT SUM(total_payment) AS Good_Loan_amount_received FROM financial_loan
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'


-- Good Loan 


--- 2.	Bad Loan Application Percentage: 



select  distinct loan_status from financial_loan;

select 
		COUNT(case 
					when loan_status= 'Charged Off'
					then id
			  end)*100/
		count(id) as Bad_loan_percentage
			  from financial_loan;

-- Bad Loan Applications

SELECT COUNT(id) AS Bad_Loan_Applications FROM financial_loan
WHERE loan_status= 'Charged Off'



-- Bad Loan Funded Amount

SELECT SUM(loan_amount) AS Bad_Loan_Funded_amount FROM financial_loan
WHERE loan_status= 'Charged Off'

-- Bad Loan Total Recived Amount

SELECT SUM(total_payment) AS Bad_Loan_amount_received FROM financial_loan
WHERE loan_status= 'Charged Off'

-- Loan Status 

select 
	loan_status,
	COUNT(id) As Loan_Count,
	sum(loan_amount) As Total_Amount_Funded,
	sum(total_payment) As Total_Amount_Recived,
	Avg(int_Rate*100) As Avg_Interest_Rate,
	AVG(dti*100) As Avg_Dti
from financial_loan
group by loan_status;

SELECT 
	loan_status, 
	SUM(total_payment) AS MTD_Total_Amount_Received, 
	SUM(loan_amount) AS MTD_Total_Funded_Amount 
FROM financial_loan
WHERE MONTH(issue_date) = 12 
GROUP BY loan_status


-- Month

SELECT 
	MONTH(issue_date) AS Month_Munber, 
	DATENAME(MONTH, issue_date) AS Month_name, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM financial_loan
GROUP BY MONTH(issue_date), DATENAME(MONTH, issue_date)
ORDER BY MONTH(issue_date)


-- state

SELECT 
	address_state AS State, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM financial_loan
GROUP BY address_state
ORDER BY address_state

-- Term

SELECT 
	term AS Term, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM financial_loan
GROUP BY term
ORDER BY term

-- Emp Length wise 

SELECT 
	emp_length AS Employee_Length, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM financial_loan
GROUP BY emp_length
ORDER BY emp_length

-- Purpose

SELECT 
	purpose AS PURPOSE, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM financial_loan
GROUP BY purpose
ORDER BY purpose

-- Home Ownership wise 


SELECT 
	home_ownership AS Home_Ownership, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM financial_loan
GROUP BY home_ownership
ORDER BY home_ownership

SELECT 
	purpose AS PURPOSE, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM financial_loan
WHERE grade = 'A'
GROUP BY purpose
ORDER BY purpose

	











