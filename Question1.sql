-- the colleges table
CREATE TABLE colleges (
    id INTEGER PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

-- the students table
CREATE TABLE students (
    id INTEGER PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    collegeId INTEGER,
    FOREIGN KEY (collegeId) REFERENCES colleges(id)
);

-- the rankings table
CREATE TABLE rankings (
    studentId INTEGER,
    ranking INTEGER NOT NULL,
    year INTEGER NOT NULL,
    FOREIGN KEY (studentId) REFERENCES students(id)
);


-- dummy data

INSERT INTO colleges (id, name) VALUES 
(1, 'Harvard University'),
(2, 'Stanford University'),
(3, 'MIT');

INSERT INTO students (id, name, collegeId) VALUES 
(1, 'John Smith', 1),
(2, 'Emily Johnson', 2),
(3, 'Michael Brown', 1),
(4, 'Sarah Williams', 3),
(5, 'David Lee', 2);

INSERT INTO rankings (studentId, ranking, year) VALUES 
(1, 2, 2015),
(1, 4, 2016),
(2, 1, 2015),
(2, 1, 2016),
(3, 3, 2015),
(3, 6, 2016),
(4, 1, 2015),
(5, 5, 2016),
(5, 3, 2015);


-- Question 1 solution 

--solution using implicit join

SELECT c.name, best_rank, no_of_students
FROM colleges c, (

                    SELECT s.collegeId as collegeID, min(r.ranking) as best_rank, count(s.id) as no_of_students
                    FROM students s, rankings r
                    WHERE s.id = r.studentId AND r.year = '2015' AND r.ranking between 1 AND 3
                    GROUP BY s.collegeId

                 ) AS temp

WHERE c.id = collegeID;

-- alternative solution using explicit join

SELECT c.name, best_rank, no_of_students
FROM colleges c INNER JOIN (

                    SELECT s.collegeId as collegeID, min(r.ranking) as best_rank, count(s.id) as no_of_students
                    FROM students s, rankings r
                    WHERE s.id = r.studentId AND r.year = '2015' AND r.ranking between 1 AND 3
                    GROUP BY s.collegeId

                 ) AS temp 

ON c.id = collegeID;

