-- Create retirement_titles table
SELECT e.emp_no,
    e.first_name,
    e.last_name,
    t.title,
    t.from_date,
    t.to_date
INTO retirement_titles
FROM employees as e
    LEFT JOIN titles as t 
    ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER by e.emp_no;

-- Create unique titles table using DISTINCT ON to get unique employees
SELECT DISTINCT ON (emp_no) emp_no,
	first_name,
	last_name,
	title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

-- Create retiring titles table that groups count of employees by title
SELECT COUNT(emp_no)
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT(emp_no) DESC;

-- Create mentorship eligibility table
SELECT DISTINCT ON (e.emp_no) e.emp_no,
    e.first_name,
	e.last_name,
    e.birth_date,
    de.from_date,
    de.to_date,
	t.title
INTO mentorship_eligibility
FROM employees as e
	LEFT JOIN dept_emp as de
		ON (e.emp_no = de.emp_no)
	LEFT JOIN titles as t
		ON (e.emp_no = t.emp_no)
WHERE (de.to_date = '9999-01-01')
AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER by e.emp_no;