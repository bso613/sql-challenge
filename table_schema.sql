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