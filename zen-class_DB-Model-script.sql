CREATE DATABASE zen_class;

USE zen_class;

CREATE TABLE tasks (
	id INt PRIMARY KEY AUTO_INCREMENT,
    taskname TEXT,
    tasklink TEXT,
    tags TEXT,
    batch_id INT
);

DESCRIBE tasks;

CREATE TABLE courses (
	id INT PRIMARY KEY AUTO_INCREMENT,
    course_name TEXT,
    course_price FLOAT,
    course_type VARCHAR(30)
);

DESCRIBE courses;

CREATE TABLE mentors (
	id INT PRIMARY KEY AUTO_INCREMENT,
    mentor_name TEXT,
    instructed_course_id INT,
    FOREIGN KEY (instructed_course_id) REFERENCES courses(id),
    mentor_rating FLOAT
);

DESCRIBE mentors;

CREATE TABLE batches (
	id INT PRIMARY KEY AUTO_INCREMENT,
    batch_name TEXT,
    batch_language VARCHAR(30),
    mentor_id INT,
    FOREIGN KEY (mentor_id) REFERENCES mentors(id),
    course_id int,
    FOREIGN KEY (course_id) REFERENCES courses(id)
);

DESCRIBE batches;

CREATE TABLE marks (
	id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INt,check
)


