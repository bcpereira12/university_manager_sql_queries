--Query1: The average grade given by each professor--
SELECT professor_name, AVG(grade_value)
FROM grades g
JOIN courses c
ON g.grade_course_id = c.course_id
JOIN professors p
ON p.professor_course_id = c.course_id
GROUP BY p.professor_name;



--Query2: The top grades for each student--
SELECT student_first, MAX(grade_value)
FROM students s
JOIN grades g
ON s.student_id = g.grade_student_id
GROUP BY student_first;



--Query3: Group students by the courses that they are enrolled in--
SELECT student_first, course_name
FROM students s
JOIN enrollments e
ON student_id = enrollment_student_id
JOIN courses c
ON course_id = enrollment_course_id
ORDER BY course_name;



--Query4: Create a summary report of courses and their average grades, sorted by the most challenging course (course with the lowest average grade) to the easiest course--
SELECT course_name, AVG(grade_value)
FROM grades g
JOIN courses c
ON grade_course_id = course_id
GROUP BY course_name
ORDER BY course_name;



--Query5: Finding which student and professor have the most courses in common--
SELECT COUNT(course_name) as "Courses in Common", student_first, professor_name
FROM students s
JOIN enrollments e
ON student_id = enrollment_student_id
JOIN courses c
ON enrollment_course_id = course_id
JOIN professors p
ON course_id = professor_course_id
WHERE professor_course_id = enrollment_course_id
GROUP BY student_first, professor_name
ORDER BY COUNT(course_name);
