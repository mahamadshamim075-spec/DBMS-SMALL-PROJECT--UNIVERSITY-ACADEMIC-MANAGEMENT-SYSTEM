--SOME SELECT QUERIES--
SELECT * FROM STUDENT;
select* from attendance;
select * from course;
select * from department;
select * from enrollment;
select * from exam;
select * from faculty;
select * from result;


--AGGREGATE QUERIES--
SELECT COUNT(*) AS total_students
FROM Student;

--JOIN QUERIES--
SELECT s.Name AS Student_Name, c.Course_Name
FROM Student s
JOIN Enrollment e
ON s.Student_ID = e.Student_ID
JOIN Course c
ON e.Course_ID = c.Course_ID;

--CRUD QUERIES--
UPDATE Student
SET Phone = '9999999999'
WHERE Student_ID = 101;

--SUB QUERIES--
SELECT Name
FROM Student
WHERE Department_ID = (
    SELECT Department_ID
    FROM Student
    GROUP BY Department_ID
    ORDER BY COUNT(*) DESC
    LIMIT 1
);

