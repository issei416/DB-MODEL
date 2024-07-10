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
    student_id INT,
    task_id INT,
    mark FLOAT,
    eval_mentor_id INT,
    FOREIGN KEY (task_id) REFERENCES tasks(id),
    FOREIGN KEY (eval_mentor_id) REFERENCES mentors(id)
);

DESCRIBE marks;

CREATE TABLE students (
	id INT PRIMARY KEY AUTO_INCREMENT,
    student_name TEXT,
    course_id INT,
    batch_id INT,
    tasks_completed INT,
    FOREIGN KEY (course_id) REFERENCES courses(id),
    FOREIGN KEY (batch_id) REFERENCES batches(id)
);

ALTER TABLE marks ADD FOREIGN KEY (student_id) REFERENCES students(id);

DESCRIBE students;

DESCRIBE marks;

CREATE TABLE  dashboard (
	id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    tasks_completed INT,
    marks_totals FLOAT,
    FOREIGN KEY (student_id) REFERENCES students(id)
);

DESCRIBE dashboard;

CREATE TABLE leaderboard (
	id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    student_rank INT,
    FOREIGN KEY (student_id) REFERENCES students(id)
);

DESCRIBE leaderboard;

CREATE TABLE queries (
	id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    assigned_mentor_id INT,
    query_tag TEXT,
    query_status TINYINT,
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (assigned_mentor_id) REFERENCES mentors(id)
);

DESCRIBE queries;

CREATE TABLE feedbacks (
	id INT PRIMARY KEY AUTO_INCREMENT,
    batch_id INT,
    student_id INT,
    mentor_id INT,
    session_rating FLOAT,
    session_feedback TEXT,
    mentor_rating FLOAT,
    mentor_feedback TEXT,
    FOREIGN KEY (batch_id) REFERENCES batches(id),
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (mentor_id) REFERENCES mentors(id)
);

DESCRIBE feedbacks;

SHOW TABLES from zen_class;










