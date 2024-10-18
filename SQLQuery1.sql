-- Creación de la base de datos

CREATE DATABASE DB_Colegio;
GO

USE DB_Colegio;

GO


-- Tabla SCHOOL
CREATE TABLE SCHOOL (
    SchoolId INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    SchoolName VARCHAR(50) NOT NULL,
    Description VARCHAR(1000),
    Address VARCHAR(50),
    Phone VARCHAR(50),
    PostCode VARCHAR(50),
    PostAddress VARCHAR(50)
);

-- Tabla CLASS
CREATE TABLE CLASS (
    ClassId INT PRIMARY KEY IDENTITY(1,1)NOT NULL,
    SchoolId INT NOT NULL,
    ClassName VARCHAR(100) NOT NULL,
    Description VARCHAR(1000),
    CONSTRAINT FK_Class_School FOREIGN KEY (SchoolId) REFERENCES SCHOOL(SchoolId)
);

-- Tabla TEACHER
CREATE TABLE TEACHER (
    TeacherId INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    SchoolId INT NOT NULL,
    TeacherName VARCHAR(50) NOT NULL,
    Description VARCHAR(1000),
    CONSTRAINT FK_Teacher_School FOREIGN KEY (SchoolId) REFERENCES SCHOOL(SchoolId)
);

-- Tabla COURSE
CREATE TABLE COURSE (
    CourseId INT PRIMARY KEY IDENTITY(1,1)NOT NULL,
    CourseName VARCHAR(50) NOT NULL,
    SchoolId INT,
    Description VARCHAR(1000)NOT NULL,
    CONSTRAINT FK_Course_School FOREIGN KEY (SchoolId) REFERENCES SCHOOL(SchoolId)
);

-- Tabla STUDENT
CREATE TABLE STUDENT (
    StudentId INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    ClassId INT NOT NULL,
    StudentName VARCHAR(100) NOT NULL,
    StudentNumber VARCHAR(20) NOT NULL,
    TotalGrade float,
    Address NVARCHAR(100),
    Phone VARCHAR(20),
    Email VARCHAR(100),
    CONSTRAINT FK_Student_Class FOREIGN KEY (ClassId) REFERENCES CLASS(ClassId)
);

-- Tabla TEACHER_COURSE
CREATE TABLE TEACHER_COURSE (
    TeacherId INT NOT NULL,
    CourseId INT NOT NULL,
    CONSTRAINT FK_TeacherCourse_Teacher FOREIGN KEY (TeacherId) REFERENCES TEACHER(TeacherId),
    CONSTRAINT FK_TeacherCourse_Course FOREIGN KEY (CourseId) REFERENCES COURSE(CourseId)
);

-- Tabla STUDENT_COURSE
CREATE TABLE STUDENT_COURSE (
    StudentId INT NOT NULL,
    CourseId INT NOT NULL,
    CONSTRAINT FK_StudentCourse_Student FOREIGN KEY (StudentId) REFERENCES STUDENT(StudentId),
    CONSTRAINT FK_StudentCourse_Course FOREIGN KEY (CourseId) REFERENCES COURSE(CourseId)
);

-- Tabla GRADE
CREATE TABLE GRADE (
    GradeId INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    StudentId INT NOT NULL,
    CourseId INT NOT NULL,
    Grade float,
    Comment VARCHAR(1000),
    CONSTRAINT FK_Grade_Student FOREIGN KEY (StudentId) REFERENCES STUDENT(StudentId),
    CONSTRAINT FK_Grade_Course FOREIGN KEY (CourseId) REFERENCES COURSE(CourseId)
);
