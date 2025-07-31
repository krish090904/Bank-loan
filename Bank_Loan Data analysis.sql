Create database KRISHBANK;
USE  KRISHBANK;


DROP TABLE IF EXISTS BankLoanApplications;

CREATE TABLE BankLoanApplications (
    Id INT PRIMARY KEY,
    Address_State VARCHAR(2),
    Application_Type VARCHAR(20),
    Emp_Length VARCHAR(10),
    Emp_Title VARCHAR(255),
    Grade CHAR(1),
    Home_Ownership VARCHAR(20),
   
    Issue_Date INT,
    Last_Credit_Pull_Date INT,
    Last_Payment_Date INT,
    Loan_Status VARCHAR(50),
    Next_Payment_Date INT,
    Member_Id INT,
    Purpose VARCHAR(100),
    Sub_Grade VARCHAR(5),
    Term VARCHAR(20),
    Verification_Status VARCHAR(50),
    Annual_Income DECIMAL(18, 2),
    Dti DECIMAL(10, 4), -- Debt-to-Income Ratio
    Installment DECIMAL(10, 2),
    Int_Rate DECIMAL(10, 4), -- Interest Rate
    Loan_Amount DECIMAL(18, 2),
    Total_Acc INT, -- Total number of credit accounts
    Total_Payment DECIMAL(18, 2)
);




SELECT
    Loan_Status,
    COUNT(Id) AS NumberOfLoans,
    SUM(Loan_Amount) AS TotalLoanValue
FROM
    BankLoanApplications
GROUP BY
    Loan_Status
ORDER BY
    NumberOfLoans DESC;


SELECT
    Address_State,
    SUM(Loan_Amount) AS TotalLoanAmount,
    AVG(Int_Rate) * 100 AS AverageInterestRate
FROM
    BankLoanApplications
GROUP BY
    Address_State
ORDER BY
    TotalLoanAmount DESC
LIMIT 10;


SELECT
    Grade,
    COUNT(Id) AS NumberOfLoans,
    AVG(Dti) AS AverageDTI,
    AVG(Int_Rate) AS AverageInterestRate
FROM
    BankLoanApplications
GROUP BY
    Grade
ORDER BY
    Grade ASC;


