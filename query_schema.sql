-- Exported from QuickDBD: https://www.quickdatatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/ZMN12l
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.
--------------------------------------------------------------------------------------------------------------------------------------------
-- DELETE TABLES
-- DROP ALL
DROP TABLE departments, employees, dept_emp, dept_manager, salaries, titles CASCADE;
-- DROP ONE AT A TIME
DROP TABLE departments;
DROP TABLE employees;
DROP TABLE dept_emp;
DROP TABLE dept_manager;
DROP TABLE salaries;
DROP TABLE titles;
--------------------------------------------------------------------------------------------------------------------------------------------
-- CREATE TABLES

CREATE TABLE "departments" (
    "dept_no" varchar NOT NULL,
	"dept_name" varchar NOT NULL,
	CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
    
);
CREATE TABLE "employees" (
    "emp_no" varchar NOT NULL,
	"emp_title_id" varchar not null,
    "birth_date" date NOT NULL,
    "first_name" varchar NOT NULL,
    "last_name" varchar NOT NULL,
    "sex" varchar(1) NOT NULL,
    "hire_date" date NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "dept_emp" (
    "emp_no" varchar NOT NULL,
    "dept_no" varchar NOT NULL);
	
CREATE TABLE "dept_manager" (
    "dept_manager" varchar NOT NULL,
    "emp_no" varchar NOT NULL);

CREATE TABLE "salaries" (
    "emp_no" varchar NOT NULL,
    "salary" int NOT NULL);
	
CREATE TABLE "titles" (
    "emp_no" varchar NOT NULL,
    "title" varchar NOT NULL);
	
--------------------------------------------------------------------------------------------------------------------------------------------
--Data Analysis 1: List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT e.emp_no as "Employee Number",	
SELECT e.emp_no as "Employee Number",
		e.last_name as "Last Name",
		e.first_name as "First Name",
		e.sex as "Sex",
		s.salary as "Salary"
FROM employees e
JOIN salaries s
ON (e.emp_no = s.emp_no);

--------------------------------------------------------------------------------------------------------------------------------------------
----Data Analysis 2: List employees who were hired in 1986.
SELECT e.emp_no as "Employee Number",
		e.last_name as "Last Name",
		e.first_name as "First Name",
		e.hire_date as "Hire Date"
FROM employees e
WHERE e.hire_date > '1985-12-31' AND e.hire_date <'1987-01-01'
ORDER BY e.hire_date;

--------------------------------------------------------------------------------------------------------------------------------------------
--Data Analysis 3: List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name, and start and end employment dates
SELECT d.dept_no as "Department Number",
		d.dept_name as "Department Name",
		m.emp_no as "Manager Employee Number",
		e.last_name as "Last Name",
		e.first_name as "First Name"
		
FROM dept_manager m
JOIN departments d ON (d.dept_no = m.dept_manager)
JOIN employees e ON (m.emp_no = e.emp_no);

--------------------------------------------------------------------------------------------------------------------------------------------
--Data Analysis 4: List the department of each employee with the following information: employee number, last name, first name, and department name
SELECT e.emp_no as "Employee Number",
		e.last_name as "Last Name",
		e.first_name as "First Name",
		d.dept_name as "Department Name"
FROM dept_emp t
JOIN departments d on (t.dept_no = d.dept_no)
JOIN employees e on (e.emp_no = t.emp_no);

--------------------------------------------------------------------------------------------------------------------------------------------
--Data Analysis 5: List all employees whose first name is "Hercules" and last names begin with "B."
SELECT e.last_name as "Last Name",
		e.first_name as "First Name",
		e.emp_no as "Employee Number"
FROM employees e
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

--------------------------------------------------------------------------------------------------------------------------------------------
--Data Analysis 6: List all employees in the Sales department, including their employee number, last name, first name, and department name
SELECT e.emp_no as "Employee Number",
		e.last_name as "Last Name",
		e.first_name as "First Name",
		d.dept_name as "Department Name"
FROM dept_emp t
JOIN departments d on (t.dept_no = d.dept_no)
JOIN employees e on (e.emp_no = t.emp_no)
WHERE d.dept_name = 'Sales';

--------------------------------------------------------------------------------------------------------------------------------------------
--Data Analysis 7: List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name
SELECT e.emp_no as "Employee Number",
		e.last_name as "Last Name",
		e.first_name as "First Name",
		d.dept_name as "Department Name"
FROM dept_emp t
JOIN departments d on (t.dept_no = d.dept_no)
JOIN employees e on (e.emp_no = t.emp_no)
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development';

--------------------------------------------------------------------------------------------------------------------------------------------
--Data Analysis 8: In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name as "Last Name", count(last_name) as "Frequency Counts"
FROM employees
GROUP BY last_name
ORDER BY "Frequency Counts" DESC;

--------------------------------------------------------------------------------------------------------------------------------------------
--Epilogue: "Search your ID number." You look down at your badge to see that your employee ID number is 499942
SELECT last_name as "Last Name", first_name as "First Name"
FROM employees
WHERE emp_no = '499942';