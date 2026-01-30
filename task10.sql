 use intern_training_db;

#Create a complex query joining employees and departments
CREATE TABLE department1 (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);


CREATE TABLE employee11 (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary INT,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES department1(dept_id)
);

INSERT INTO department1 VALUES
(1, 'IT'),
(2, 'HR'),
(3, 'Finance');

INSERT INTO employee11 VALUES
(101, 'Amit', 60000, 1),
(102, 'Neha', 45000, 2),
(103, 'Rahul', 70000, 1),
(104, 'Priya', 55000, 3),
(105, 'Karan', 40000, 2);

#Create a Complex JOIN Query
SELECT e.emp_id, e.emp_name, e.salary, d.dept_name
FROM employee11 e
JOIN department1 d
ON e.dept_id = d.dept_id;

#Convert JOIN Query into a VIEW
CREATE VIEW employee11_department1_view AS
SELECT e.emp_id, e.emp_name, e.salary, d.dept_name
FROM employee11 e
JOIN department1 d
ON e.dept_id = d.dept_id;

#Query Data from the VIEW
SELECT * FROM employee11_department1_view;

#Apply Filtering and Sorting on VIEW
SELECT *
FROM employee11_department1_view
WHERE salary > 50000
ORDER BY salary DESC;

CREATE VIEW employee_public_view AS
SELECT emp_id, emp_name, dept_name
FROM employee11_department1_view;

INSERT INTO employee11_department1_view
VALUES (106, 'Sneha', 50000, 'IT');

#Drop and Recreate View Safely                               
DROP VIEW IF EXISTS employee11_department1_view;

CREATE VIEW employee_department_view AS
SELECT e.emp_id, e.emp_name, e.salary, d.dept_name
FROM employees e
JOIN departments d
ON e.dept_id = d.dept_id;

#Map Views to Reporting Dashboards
SELECT dept_name, COUNT(emp_id) AS total_employees
FROM employee_department_view
GROUP BY dept_name;
