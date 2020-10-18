-- Deliverable 1

SELECT employees.emp_no, employees.first_name, employees.last_name,
titles.title, titles.from_date, titles.to_date
INTO retirement_titles
FROM employees
INNER JOIN titles
on employees.emp_no = titles.emp_no
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY employees.emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) retirement_titles.emp_no,
retirement_titles.first_name,
retirement_titles.last_name,
retirement_titles.title
INTO unique_titles
FROM retirement_titles
ORDER BY retirement_titles.emp_no ASC, retirement_titles.to_date DESC;


--Title counts
SELECT COUNT (title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT(title) DESC;

-- Deliverable 2


SELECT employees.emp_no, employees.first_name, employees.last_name, employees.birth_date,
dept_employees.from_date, dept_employees.to_date,
titles.title
INTO mentorship_eligibility_duplicates
FROM employees
INNER JOIN dept_employees
ON employees.emp_no = dept_employees.emp_no
INNER JOIN titles
ON employees.emp_no = titles.emp_no
WHERE (employees.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (dept_employees.to_date = '9999-01-01')
ORDER BY employees.emp_no ASC;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) mentorship_eligibility_duplicates.emp_no,
mentorship_eligibility_duplicates.first_name,
mentorship_eligibility_duplicates.last_name,
mentorship_eligibility_duplicates.birth_date,
mentorship_eligibility_duplicates.from_date,
mentorship_eligibility_duplicates.to_date,
mentorship_eligibility_duplicates.title

INTO mentorship_eligibility
FROM mentorship_eligibility_duplicates
ORDER BY mentorship_eligibility_duplicates.emp_no ASC
SELECT * FROM mentorship_eligibility;