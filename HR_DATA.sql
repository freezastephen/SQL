USE employee;##database creation nd using
SELECT* FROM EMPLOYEE;
##adding values to table
INSERT INTO EMPLOYEE
VALUES
(1,"John Smith","2020-01-15",30,"Software Engineer","New York",80000),
(2,'Jane Doe','2019-03-22',28,'HR Manager','Los Angeles',75000);
SELECT* FROM EMPLOYEE;
##deleting values completly we use truncate
TRUNCATE TABLE EMPLOYEE;
SELECT* FROM EMPLOYEE;
##inserting values into table
INSERT INTO EMPLOYEE
VALUES
(1,"John Smith","2020-01-15",30,"Software Engineer","New York",80000),
(2,'Jane Doe','2019-03-22',28,'HR Manager','Los Angeles',75000);
INSERT INTO EMPLOYEE (Emp_id,Emp_name,Join_date,Age,Emp_role,Location,Salary)
VALUES(3,"Alice Johnson","2021-06-10",35,"Data AnalysT","Chicago",70000),
(4,"Bob Brown","2022-02-05",40,"Project Manager","Houston",90000),
(5,"Charlie White","2023-05-30",26,"Intern","Miami",30000),
(6,"David Wilson","2021-08-12",32,"Software Engineer","Seattle",82000),
(7,"Emily Davis","2020-11-20",29,"HR Assistant","San Francisco",60000),
(8,"Frank Miller","2019-07-15",38,"Data Scientist","Boston",95000),
(9,"Grace Lee","2022-03-18",31,"Project Coordinator","Denver",72000),
(10,"Henry Garcia","2023-01-25",27,"Intern","Austin",35000),
(11,"Isabella Martinez","2021-04-30",34,"Software Engineer","New York",81000),
(12,"Jack Thompson","2020-09-10",36,"HR Manager","Los Angeles",77000),
(13,"Karen Robinson","2021-12-05",29,"Data Analyst","Chicago",71000),
(14,"Liam Anderson","2022-05-15",41,"Project Manager","Houston",92000),
(15,"Mia Clark","2023-03-20",25,"Intern","Miami",32000);
SELECT * FROM EMPLOYEE;
##adding primary key to the existing table
ALTER TABLE EMPLOYEE
ADD CONSTRAINT
PRIMARY KEY(Emp_id);
INSERT INTO EMPLOYEE(Emp_id,Emp_name,Emp_role)
values
(16,"freeza","DA");
##modifying primary key as auto increment
ALTER TABLE EMPLOYEE 
MODIFY Emp_id INT AUTO_INCREMENT;
INSERT INTO EMPLOYEE(Emp_name,Join_date,Age,Emp_role,Location,Salary)
VALUES("STEPHEN","2023-03-20",33,"HR MANAGER","BANGALORE",90000);
SELECT* FROM EMPLOYEE;
##creating new table with foreign key 
CREATE TABLE DEPARTMENT
( D_ID INT,
D_NAME VARCHAR(50),
Emp_id INT,
FOREIGN KEY(Emp_id)REFERENCES EMPLOYEE(Emp_id)); 

INSERT INTO DEPARTMENT(D_ID,D_NAME,Emp_id)
VALUES(1,"IT",1),
(1,"IT",6),
(1,"IT",11),
(2,"HR",2),
(2,"HR",7),
(2,"HR",12),
(3,"Data Science",3),
(3,"Data Science",8),
(3,"Data Science",13),
(4," Project Management",4),
(4,"Project Management",9),
(4,"Project Management",14),
(5,"Interns",5),
(5,"Interns",10),
(5,"Interns",15);
SELECT* FROM DEPARTMENT;
SELECT * FROM EMPLOYEE;
##total salary particular depart
SELECT SUM(Salary) 
AS TOTAL_DAsalary
FROM EMPLOYEE
WHERE Emp_role="Data analyst";
##counting no of emplyee above 30 
SELECT COUNT(*) 
AS EMP_ABOVE30
FROM EMPLOYEE
WHERE Age>30;
##counting employee below 30
SELECT COUNT(*) 
AS EMP_BELOW30
FROM EMPLOYEE
WHERE Age<30;
SELECT * FROM EMPLOYEE;
##saalry of particular department employee
SELECT SUM(Salary)
AS T_is
FROM EMPLOYEE
WHERE Emp_role="Intern";
SELECT* FROM EMPLOYEE;
##finding employee who are working from very early stage
SELECT MIN(Join_date)
AS s_date
FROM employee;
Select *
FROM EMPLOYEE
WHERE s_date>'2019-03-22';
##showing employee who are working from start sate to til now
SELECT* 
FROM EMPLOYEE
WHERE Join_date >
'2019-03-22';
##finding employee who are working from start date using sub query
SELECT * FROM 
EMPLOYEE
WHERE Join_date=( SELECT 
MIN(Join_date) FROM 
EMPLOYEE);
##sub query to find employee who joined at last
SELECT * FROM 
EMPLOYEE
WHERE Join_date=(SELECT 
MAX(Join_date) FROM EMPLOYEE);
SELECT * FROM EMPLOYEE 
WHERE Join_date=(select COUNT(Join_date)
FROM EMPLOYEE);
SELECT COUNT(Emp_name) AS TOT_EMP
FROM EMPLOYEE
WHERE Join_date= (SELECT MAX(Join_date)
FROM EMPLOYEE);
SELECT  COUNT(*)
AS EMP_LOWS
FROM EMPLOYEE
WHERE Salary=(SELECT MAX(salary) FROM EMPLOYEE);
SELECT* FROM EMPLOYEE ;
SElect * FROM EMPLOYEE 
WHERE Emp_role="Data Scientist";
SELECT COUNT(*) FROM EMPLOYEE
WHERE Emp_role="Data Scientist";
SELECT * FROM DEPARTMENT;
##displaying employee name nd emp_role with department id usimg joins
SELECT EMPLOYEE.Emp_name,EMPLOYEE.Emp_role,DEPARTMENT.D_ID
FROM EMPLOYEE
JOIN DEPARTMENT ON EMPLOYEE.Emp_id= DEPARTMENT.Emp_id;
##finding average saalry of employee
SELECT AVG(SALARY)
AS AVG_SALARY
FROM EMPLOYEE;
##showing employee name nd employee role , salary who is above avg salary
SELECT Emp_name,Salary,Emp_role
FROM EMPLOYEE
WHERE Salary >( SELECT AVG(Salary)
FROM EMPLOYEE);
SELECT COUNT(*) AS 
COUNT_SALARY
FROM EMPLOYEE
WHERE Salary > (SELECT AVG(SALARY) FROM EMPLOYEE);
SELECT COUNT(*) FROM EMPLOYEE;
SELECT Emp_name,Emp_role,Salary
FROM EMPLOYEE
WHERE Salary< (SELECT AVG(Salary) FROM EMPLOYEE);
	SELECT COUNT(*) AS COUNT_BAVG
    FROM 
	EMPLOYEE 
	WHERE Salary <(SELECT AVG(Salary) FROM EMPLOYEE);
    ##COUNTING EMPLOYEE WHO IS HAVING
   SELECT COUNT(*) AS COUNT_AVG
    FROM 
	EMPLOYEE 
	WHERE Salary =(SELECT AVG(Salary) FROM EMPLOYEE);
    ##SHOWING WHO IS HAVING NULL SALARY
    SELECT * FROM 
    EMPLOYEE 
    WHERE Salary is NULL;
    ##SHOWING DETAILS WHO IS BELOW AVG SALARY
    SELECT Emp_name,emp_role,SALARY
    FROM EMPLOYEE
    WHERE SALARY<(SELECT AVG(SALARY)
    FROM EMPLOYEE);
  ##SHOWING THE DEPARTMENT WHO IS GETTING MAXIMUM SALARY  
SELECT Emp_role, MAX(SALARY)
AS MAX_SALARYDEPARTMENT
FROM EMPLOYEE
GROUP BY Emp_role
ORDER BY MAX_SALARYDEPARTMENT DESC
LIMIT 1;
##by using join function 
SELECT DEPARTMENT.D_ID,MAX(EMPLOYEE.Salary)
AS MAX_SALARYDEPARMENT 
FROM EMPLOYEE
JOIN DEPARTMENT ON DEPARTMENT.D_ID=EMPLOYEE.Emp_id
GROUP BY employee.Emp_id
ORDER BY MAX_SALARYDEPARMENT DESC
LIMIT 5;
  SELECT * FROM EMPLOYEE;
  SELECT* FROM DEPARTMENT;
  ##max salary of eachdep
  SELECT Emp_role AS DEPART, MAX(Salary) AS max_salary
  FROM EMPLOYEE
  GROUP BY Emp_role;
  SELECT DEPARTMENT.D_NAME,MAX(EMPLOYEE.SALARY) 
  AS MAXSALARY 
  FROM EMPLOYEE
  JOIN DEPARTMENT ON EMPLOYEE.Emp_ID=DEPARTMENT.D_id
  GROUP BY DEPARTMENT.D_NAME;
  SELECT EMP_ROLE AS DEPARTMIN,MIN(Salary)AS MINSALARY
  FROM EMPLOYEE
  GROUP BY EMP_ROLE;
  SELECT * FROM 
  EMPLOYEE 
  WHERE Emp_role="Project Manager";
  SELECT* FROM EMPLOYEE;
  SELECT 
  EMPLOYEE.EMP_NAME,
  EMPLOYEE.EMP_ROLE,
  DEPARTMENT.D_ID,
  DEPARTMENT.D_NAME
  FROM EMPLOYEE
  RIGHT JOIN  DEPARTMENT ON EMPLOYEE.EMP_ROLE=DEPARTMENT.D_ID
  ORDER BY DEPARTMENT.D_ID;
    SELECT EMPLOYEE.EMP_NAME,
   EMPLOYEE.EMP_ROLE,
  DEPARTMENT.D_ID,
  DEPARTMENT.D_NAME
  FROM EMPLOYEE
  INNER JOIN  DEPARTMENT ON EMPLOYEE.EMP_ID=DEPARTMENT.D_ID
  ORDER BY DEPARTMENT.D_ID;
  ##RANK ND LIMIT
  SELECT DISTINCT SALARY,EMP_NAME,EMP_ROLE##DISTINCT REMOVES THE DUPLICATE VALUES
  FROM EMPLOYEE
  ORDER BY SALARY DESC
  LIMIT 1 OFFSET 2;##LIMITS ONLY ONE ROW OFFSET SKIPS FIRST TWO VALUES 
  SELECT* FROM EMPLOYEE;
  ##FINDING EMPLOYEES WHO WORK ON SAME DEPARTMENT OF JOHN SMITH
  ##using subquery
  SELECT EMP_NAME 
  FROM EMPLOYEE
  WHERE EMP_ROLE=
  (SELECT EMP_ROLE 
  FROM EMPLOYEE 
  WHERE EMP_NAME="John Smith");
  ##employee who gets salary greater than jane doe
  SELECT EMP_NAME,EMP_ROLE,SALARY
  FROM EMPLOYEE
  WHERE SALARY>(SELECT SALARY FROM 
  EMPLOYEE
  WHERE EMP_NAME="JANE DOE");
  ##FINDING DEPART WHO IS MORE THA TWO EMPLOYEE
  SELECT EMP_ROLE,COUNT(EMP_ID) AS EMP_COUNT
  FROM EMPLOYEE
  GROUP BY EMP_ROLE
  HAVING COUNT(EMP_ID)>2;
  