-- 1. Populates Members table
INSERT INTO Members (firstName, lastName, dateOfBirth, healthMetrics, fitnessGoals)
VALUES ('Bob', 'Smith', '2001-01-01', 'Height: 5 feet 9 inches, Weight: 175 pounds', 'I would like to work on my cardio and gain more arm strength and definition');

-- 2. Returns all values in Members table
SELECT *
FROM Members;

-- 3. Populate Trainers table
INSERT INTO Trainers (firstName, lastName, schedule)
VALUES ('Jordan', 'Lee', 'Free Mon-Wed from 3-8 PM'),
('Melissa', 'Stanford', 'Free on weekends from 1-6 PM'),
('Joey', 'Cranston', 'Free on Fri from 10 AM - 7 PM');

-- 4. Returns all values in Trainers table
SELECT *
FROM Trainers;

-- 5. Update a trainer's schedule
UPDATE Trainers
SET schedule = 'Free on weekends from 9 AM - 4 PM'
WHERE trainerID = 2;

-- 6. Returns value in Trainers table with the specific ID
SELECT *
FROM Trainers
WHERE trainerID = 2;

-- 7. Populate TrainingSessions table
INSERT INTO TrainingSessions (sessionDate, sessionTime, trainerID, membershipID)
VALUES ('2023-12-20', '16:00:00', '1', '1'),
('2023-12-17', '10:00:00', '2', '1');

-- 8. Update TrainingSessions table
UPDATE TrainingSessions
SET sessionTime = '11:00:00'
WHERE trainerID = '2' AND membershipID = '1';

-- 9. Returns all values in TrainingSessions table that occur before noon
SELECT *
FROM TrainingSessions
WHERE sessionTime < '12:00:00';

-- 10. Delete tuple specified from Trainers table
DELETE FROM Trainers
WHERE trainerID = 3;