-- List all employees name with their department names.

SELECT e.employee_name, d.department_name
FROM employees_large e
JOIN departments d ON e.department_id = d.department_id;


-- Show the sale amount and sale date for each sale made by employees in the "Sales" department.

SELECT s.sale_amount, s.sale_date
FROM sales_larges s
JOIN employees_large e ON s.employee_id = e.employee_id
JOIN department d ON e.department_id = d.department_id
WHERE d.department_name = 'Sales';

-- Display the names and salaries of employees who have made sales in the "West" region.
SELECT DISTINCT e.employee_name, e.salary
FROM employees_large e
JOIN sales_larges s ON e.employee_id = s.employee_id
WHERE s.region = 'West';

-- Find the department name for each employee who was hired after 2022-01-01.
SELECT e.employee_name, d.department_name
FROM employees_large e
JOIN departments d ON e.department_id = d.department_id
WHERE e.hire_date > '2022-01-01';

-- List all regions where employees from the "Operations" department have made sales.
-- SELECT DISTINCT s.region
-- FROM sales_larges s
-- JOIN employees_large e ON s.employee_id = e.employee_id
-- JOIN departments d ON e.department_id = d.department_id
-- WHERE d.department_name = 'Operations';

-- Show employee names along with their hire dates and the region where they made a sale.
SELECT e.employee_name, e.hire_date, s.region
FROM employees_large e
JOIN sales_larges s ON e.employee_id = s.employee_id;

-- Display the total sales amount for each employee.
SELECT e.employee_name, SUM(s.sale_amount) AS total_sales
FROM employees_large e
JOIN sales_larges s ON e.employee_id = s.employee_id
GROUP BY e.employee_name;

-- Get a list of employees who have not made any sales.
SELECT e.employee_name
FROM employees_large e
LEFT JOIN sales_larges s ON e.employee_id = s.employee_id
WHERE s.sale_id IS NULL;

-- Show all sales along with the name of the employee who made them.
SELECT s.sale_id, s.sale_amount, e.employee_name
FROM sales_larges s
JOIN employees_large e ON s.employee_id = e.employee_id;

-- List all employees in the "Finance" department, including their salary
SELECT e.employee_name, e.salary
FROM employees_large e
JOIN department d ON e.department_id = d.department_id
WHERE d.department_name = 'Finance';
