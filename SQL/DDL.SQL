--CREATING DATABASE--
CREATE DATABASE dbms_project;

--CREATING DEPARTMENT RELATION--
CREATE TABLE Department (
    Department_ID INTEGER PRIMARY KEY,
    Department_Name VARCHAR(50) NOT NULL UNIQUE,
    HOD VARCHAR(50) NOT NULL,
    Office_No VARCHAR(10) NOT NULL
);

--CREATING FACULTY RELATION--
CREATE TABLE Faculty (
    Faculty_ID INTEGER PRIMARY KEY,
    Faculty_Name VARCHAR(50) NOT NULL,
    Qualification VARCHAR(30),
    Phone VARCHAR(10) UNIQUE,
    Email VARCHAR(60) UNIQUE,
    Department_ID INTEGER NOT NULL,
    CONSTRAINT FK_Faculty_Department
    FOREIGN KEY (Department_ID)
    REFERENCES Department(Department_ID)
);

--CREATING STUDENT RELATION--
CREATE TABLE Student (
    Student_ID INTEGER PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Gender CHAR(1),
    DOB DATE,
    Phone VARCHAR(10) UNIQUE,
    Email VARCHAR(60) UNIQUE,
    Address VARCHAR(100),
    Department_ID INTEGER NOT NULL,
    CONSTRAINT CHK_Gender
    CHECK (Gender IN ('M','F')),
    CONSTRAINT FK_Student_Department
    FOREIGN KEY (Department_ID)
    REFERENCES Department(Department_ID)
);


--CREATING COURSE RELATION--
CREATE TABLE Course (
    Course_ID INTEGER PRIMARY KEY,
    Course_Name VARCHAR(60) NOT NULL,
    Credits INTEGER CHECK(Credits BETWEEN 1 AND 5),
    Semester INTEGER CHECK(Semester BETWEEN 1 AND 8),
    Faculty_ID INTEGER NOT NULL,
    Department_ID INTEGER NOT NULL,
    CONSTRAINT FK_Course_Faculty
    FOREIGN KEY(Faculty_ID)
    REFERENCES Faculty(Faculty_ID),
    CONSTRAINT FK_Course_Department
    FOREIGN KEY(Department_ID)
    REFERENCES Department(Department_ID)
);

--CREATING ENROLLMENT RELATION--
CREATE TABLE Enrollment (
    Enrollment_ID INTEGER PRIMARY KEY,
    Student_ID INTEGER NOT NULL,
    Course_ID INTEGER NOT NULL,
    Semester INTEGER,
    Academic_Year VARCHAR(10),
    CONSTRAINT FK_Enroll_Student
    FOREIGN KEY(Student_ID)
    REFERENCES Student(Student_ID),
    CONSTRAINT FK_Enroll_Course
    FOREIGN KEY(Course_ID)
    REFERENCES Course(Course_ID)
);
--CREATING ATTENDANCE RELATION--
CREATE TABLE Attendance (
    Attendence_ID INTEGER PRIMARY KEY,
    Student_ID INTEGER NOT NULL,
    Course_ID INTEGER NOT NULL,
    Date INTEGER,
    Status VARCHAR(10),
    CONSTRAINT FK_Attendance_Student
    FOREIGN KEY(Student_ID)
    REFERENCES Student(Student_ID),
    CONSTRAINT FK_Attendance
    FOREIGN KEY(Course_ID)
    REFERENCES Course(Course_ID)
);


--CREATING EXAM RELATION--
CREATE TABLE Exam (
    Exam_ID INTEGER PRIMARY KEY,
    Course_ID INTEGER NOT NULL,
    Exam_Type VARCHAR(20),
    Exam_Date DATE,
    Maximum_Marks INTEGER DEFAULT 100,
    CONSTRAINT FK_Exam_Course
    FOREIGN KEY(Course_ID)
    REFERENCES Course(Course_ID)
);

--CREATING RESULT RELATION--
CREATE TABLE Result (
    Result_ID INTEGER PRIMARY KEY,
    Student_ID INTEGER NOT NULL,
    Exam_ID INTEGER NOT NULL,
    Marks INTEGER CHECK(Marks BETWEEN 0 AND 100),
    Grade CHAR(2),
    CONSTRAINT FK_Result_Student
    FOREIGN KEY(Student_ID)
    REFERENCES Student(Student_ID),
    CONSTRAINT FK_Result_Exam
    FOREIGN KEY(Exam_ID)
    REFERENCES Exam(Exam_ID)
);