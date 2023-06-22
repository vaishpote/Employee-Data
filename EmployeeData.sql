SELECT *
FROM EmployeeDatab.dbo.employeeDemographics


SELECT Firstname , Lastname , Age
FROM EmployeeDatab.dbo.EmployeeDemographics

SELECT Top 5*
FROM EmployeeDatab.dbo.EmployeeDemographics

SELECT DISTINCT (EmployeeID)
FROM EmployeeDatab.dbo.EmployeeDemographics



SELECT DISTINCT (Gender)
FROM EmployeeDatab.dbo.EmployeeDemographics

SELECT COUNT (LastName)
FROM EmployeeDatab.dbo.EmployeeDemographics

SELECT COUNT (LastName) AS LastNameCount
FROM EmployeeDatab.dbo.EmployeeDemographics


SELECT*
FROM EmployeeDatab.dbo.EmployeeSalary

SELECT MAX (Salary) AS Maxsalary
FROM EmployeeDatab.dbo.EmployeeSalary 

SELECT Avg (Salary) AS Avgsal
FROM EmployeeDatab.dbo.EmployeeSalary 

SELECT EmployeeID , JobTitle
FROM EmployeeDatab.dbo.EmployeeSalary 


SELECT *
FROM EmployeeDatab.dbo.EmployeeDemographics

SELECT*
FROM EmployeeDemographics
WHERE FirstName <> 'Jim'

SELECT*
FROM EmployeeDemographics
WHERE Age > 30

SELECT*
FROM EmployeeDemographics
WHERE Age <= 30

SELECT*
FROM EmployeeDemographics
WHERE Age <=32	AND Gender = 'Male'

SELECT*
FROM EmployeeDemographics
WHERE Age <=32	OR Gender = 'Male'

SELECT*
FROM EmployeeDemographics
WHERE LastName Like '%s%c%'

SELECT*
FROM EmployeeDemographics
WHERE FirstName is NOT NULL

SELECT*
FROM EmployeeDemographics
WHERE FirstName = 'Jim'

SELECT*
FROM EmployeeDemographics
WHERE FirstName In ('Jim' , 'micheal')


SELECT DISTINCT  (Gender)
FROM EmployeeDemographics
GROUP BY Gender

SELECT Gender , COUNT (Gender)
FROM EmployeeDemographics
GROUP BY Gender

SELECT Gender , Age , Count (Gender) AS Countgender
FROM EmployeeDemographics
Group by Gender , Age

SELECT Gender , COUNT (Gender) AS CountGender
FROM EmployeeDemographics
WHERE Age > 31
GROUP By Gender
Order By Gender ASC

SELECT *
FROM EmployeeDemographics
ORDER BY Age , Gender DESC

/*
Joins
*/

SELECT *
FROM EmployeeDatab.dbo.EmployeeDemographics
Join EmployeeDatab.dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID


SELECT*
FROM EmployeeDatab.dbo.EmployeeDemographics
Inner join EmployeeDatab.dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID


SELECT *
FROM EmployeeDatab.dbo.EmployeeDemographics
Full Outer Join EmployeeDatab.dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID


SELECT*
FROM EmployeeDatab.dbo.EmployeeDemographics
Left outer join EmployeeDatab.dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID


SELECT EmployeeDemographics.EmployeeID , FirstName , LastName , JobTitle , Salary
FROM EmployeeDatab.dbo.EmployeeDemographics
Inner join EmployeeDatab.dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID



SELECT EmployeeDemographics.EmployeeID , FirstName , LastName , JobTitle , Salary
FROM EmployeeDatab.dbo.EmployeeDemographics
Right outer join EmployeeDatab.dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID


SELECT EmployeeDemographics.EmployeeID , FirstName , LastName , JobTitle , Salary
FROM EmployeeDatab.dbo.EmployeeDemographics
Left Outer Join EmployeeDatab.dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID


SELECT EmployeeDemographics.EmployeeID , FirstName , LastName , JobTitle , Salary
FROM EmployeeDatab.dbo.EmployeeDemographics
Right outer join EmployeeDatab.dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
ORDER BY Salary DESC


SELECT JobTitle , AVG (salary)
FROM EmployeeDatab.dbo.EmployeeDemographics
Inner join EmployeeDatab.dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
WHERE JobTitle = 'Salesman'
GROUP By JobTitle


/*
CASE Statement
*/

SELECT FirstName , LastName , Age  
FROM EmployeeDatab.dbo.EmployeeDemographics
WHERE Age is NOT NULL
ORDER BY Age 

SELECT FirstName , LastName , Age ,
CASE
	WHEN Age > 30 THEN 'Old'
	WHEN Age BETWEEN 27 AND 30 THEN 'Young'
	ELSE 'Baby'
END AS Genaration
FROM EmployeeDatab.dbo.EmployeeDemographics
WHERE Age is NOT NULL
ORDER BY Age


SELECT FirstName , LastName , JobTitle , Salary,
CASE
	WHEN JobTitle = 'Salesman' THEN Salary + (salary * .10)
	WHEN JobTitle = 'Accountant' THEN Salary + (Salary * .05)
	WHEN JobTitle = 'HR' THEN Salary + (Salary * .03)
	ELSE Salary + (Salary * .04)
END AS SalaryAfterRaise
FROM EmployeeDatab.dbo.EmployeeDemographics
JOIN EmployeeDatab.dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID


/*
Having clause
*/

SELECT JobTitle , Avg (Salary) AS CountSalary
FROM EmployeeDatab.dbo.EmployeeDemographics
Join EmployeeDatab.dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
GROUP BY JobTitle
Having Count (JobTitle) > 1


SELECT JobTitle , Avg (Salary) AS CountSalary
FROM EmployeeDatab.dbo.EmployeeDemographics
Join EmployeeDatab.dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
GROUP BY JobTitle
Having  Avg (salary) > 45000
Order by avg (salary)


/*
update and deleting data
*/

SELECT*
FROM EmployeeDatab.dbo.EmployeeDemographics

UPDATE EmployeeDatab.dbo.EmployeeDemographics
SET EmployeeID = 1012
WHERE FirstName = 'Holly' AND LastName = 'Flax'


UPDATE EmployeeDatab.dbo.EmployeeDemographics
SET Age = 31 , Gender = 'Female'
WHERE FirstName = 'Holly' AND LastName = 'Flax'


DELETE:
DELETE FROM EmployeeDatab.dbo.EmployeeDemographics
WHERE EmployeeID = 1005


SELECT*
FROM EmployeeDatab.dbo.EmployeeDemographics
WHERE EmployeeID = 1004


Aliasing:
SELECT FirstName AS FName
FROM EmployeeDatab.dbo.EmployeeDemographics

SELECT FirstName + '  ' + LastName AS FullName
FROM EmployeeDatab.dbo.EmployeeDemographics


SELECT AVG (Age) AS AvgAge
FROM EmployeeDatab.dbo.EmployeeDemographics


SELECT Demo.EmployeeID , Sal.Salary
FROM EmployeeDatab.dbo.EmployeeDemographics AS Demo
Join EmployeeDatab.dbo.EmployeeSalary AS Sal
	ON Demo.EmployeeID = Sal.EmployeeID


Partition By:

SELECT*
FROM EmployeeDatab.dbo.EmployeeDemographics

SELECT*
FROM EmployeeDatab.dbo.EmployeeSalary

SELECT FirstName , LastName , Gender , Salary , COUNT (Gender) AS CountGender
FROM EmployeeDatab.dbo.EmployeeDemographics dem
Join EmployeeDatab.dbo.EmployeeSalary sal
	ON dem.EmployeeID = Sal.EmployeeID
GROUP BY FirstName , LastName , Gender , Salary


SELECT FirstName , LastName , Gender , Salary 
,COUNT (Gender) OVER (Partition by Gender) AS TotalGender
FROM EmployeeDatab.dbo.EmployeeDemographics dem
Join EmployeeDatab.dbo.EmployeeSalary sal
	ON dem.EmployeeID = Sal.EmployeeID


SELECT Gender
FROM EmployeeDatab.dbo.EmployeeDemographics dem
Join EmployeeDatab.dbo.EmployeeSalary sal
	ON dem.EmployeeID = Sal.EmployeeID
GROUP BY Gender


/* 
CTEs (Common table expression)
*/

WITH CTE_Employee as
(
SELECT FirstName , LastName , Gender , Salary
, COUNT (Gender) OVER (Partition by Gender) AS TotalGender
,AVG (Salary) OVER (Partition by Gender) AS AvgSalary
FROM EmployeeDatab.dbo.EmployeeDemographics Emp
Join EmployeeDatab.dbo.EmployeeSalary Sal
	ON Emp.EmployeeID = Sal.EmployeeID
WHERE Salary > 45000
)


Create Table WareHouseEmployeeDemographics 
(EmployeeID int, 
FirstName varchar(50), 
LastName varchar(50), 
Age int, 
Gender varchar(50)
)

Insert into WareHouseEmployeeDemographics VALUES
(1013, 'Darryl', 'Philbin', NULL, 'Male'),
(1050, 'Roy', 'Anderson', 31, 'Male'),
(1051, 'Hidetoshi', 'Hasagawa', 40, 'Male'),
(1052, 'Val', 'Johnson', 31, 'Female')

/*
 String Functions - TRIM , LTRIM , RTRIM , Replace Substring , Upper , Lower
*/

--Drop Table EmployeeErrors;

CREATE TABLE EmployeeErrors (
EmployeeID varchar (50)
,FirstName varchar(50)
,LastName varchar(50)
)

INSERT INTO EmployeeErrors VALUES
(1001 , 'Jimbo' , 'Halbert'),
(1002, 'pamela' , 'beasely'),
(1005 , 'Toby' , 'Flederson - Fired')

SELECT *
FROM EmployeeErrors

-- Using TRIM , LTRIM , RTRIM

SELECT EmployeeID , TRIM(employeeID) AS IDTRIM
FROM EmployeeERRORS

SELECT FirstName, RTRIM(FirstName) AS FirstRTRIM
FROM EmployeeErrors

SELECT LastName , LTRIM(LastName) as LastRTRIM
FROM EmployeeErrors

-- Using Replace

SELECT LastName , REPLACE(LastName, '-Fired', '') AS LastNameFixed
FROM EMployeeErrors

--Using Substring

Select Substring(err.FirstName,1,3) AS errf, Substring(dem.FirstName,1,3) AS errd, Substring(err.LastName,1,3) AS errl, Substring(dem.LastName,1,3) AS deml
FROM EmployeeErrors err
JOIN EmployeeDemographics dem
	on Substring(err.FirstName,1,3) = Substring(dem.FirstName,1,3)
	and Substring(err.LastName,1,3) = Substring(dem.LastName,1,3)


--Using Upper and Lower

SELECT FirstName , Lower(firstname) AS LowF
FROM EmployeeErrors

SELECT FirstName , UPPER (FirstName) AS UppF
FROM EmployeeErrors

/*
Subqueries (in the select ,    from , And Where Statement)
*/

SELECT EmployeeID , JobTitle , Salary
FROM EmployeeSalary

SELECT EmployeeID , salary ,(Select Avg(Salary) FROM EmployeeSalary) AS AllAvgSalary
FROM EmployeeSalary

--How to do it with Partition By

SELECT EmployeeID , Salary , Avg(Salary) over () as AllAvgSalary
FROM EmployeeSalary

-- Why Group by doesn't work
SELECT EmployeeID , Salary , AVG(Salary) as AllAvgSalary
FROM EmployeeSalary
Group by EmployeeID , Salary
Order by EmployeeID


-- Subquery in FROM

SELECT a.EmployeeID, AllAvgSalary
FROM
		(SELECT EmployeeID, Salary , Avg(Salary) over () as AllAvgSalary
		FROM EmployeeSalary) a
Order by a.EmployeeID


--Subquery in where

SELECT EmployeeID , JobTitle , Salary
FROM EmployeeSalary
WHERE EmployeeID in (
		SELECT EmployeeID
		FROM EmployeeDemographics
		WHERE Age > 30)


Create table #temp_employee2 (
EmployeeID int,
JobTitle varchar(100),
Salary int
)

Select * From #temp_employee2

Insert into #temp_employee2 values (
'1001', 'HR', '45000'
)

Insert into #temp_employee2 
SELECT * From EmployeeDatab..EmployeeSalary

Select * From #temp_employee2

DROP TABLE IF EXISTS #temp_employee3
Create table #temp_employee3 (
JobTitle varchar(100),
EmployeesPerJob int ,
AvgAge int,
AvgSalary int
)

Insert into #temp_employee3
SELECT JobTitle, Count(JobTitle), Avg(Age), AVG(salary)
FROM EmployeeDatab..EmployeeDemographics emp
JOIN EmployeeDatab..EmployeeSalary sal
	ON emp.EmployeeID = sal.EmployeeID
group by JobTitle


Select * 
From #temp_employee3

SELECT AvgAge * AvgSalary AS AgeSal
FROM #temp_employee3


