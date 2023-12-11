CREATE TABLE Members (
    membershipID SERIAL PRIMARY KEY,
    firstName VARCHAR(255) NOT NULL,
    lastName VARCHAR(255) NOT NULL,
    dateOfBirth DATE NOT NULL,
    healthMetrics VARCHAR(255),
    fitnessGoals VARCHAR(255)
);

CREATE TABLE Trainers (
    trainerID SERIAL PRIMARY KEY,
    firstName VARCHAR(255) NOT NULL,
    lastName VARCHAR(255) NOT NULL,
    schedule VARCHAR(255)
);

CREATE TABLE Admins (
    adminID SERIAL PRIMARY KEY,
    firstName VARCHAR(255) NOT NULL,
    lastName VARCHAR(255) NOT NULL
);

CREATE TABLE Events (
    eventID SERIAL PRIMARY KEY,
    eventType VARCHAR(255) NOT NULL,
    participants VARCHAR(255),
    eventDate DATE NOT NULL,
    eventTime TIME NOT NULL,
    roomNumber VARCHAR(5)
);

CREATE TABLE Equipment (
    equipmentID SERIAL PRIMARY KEY,
    maintenanceDate DATE
);

CREATE TABLE Payments (
    paymentID SERIAL PRIMARY KEY,
    paymentReason VARCHAR(255) NOT NULL,
    amount NUMERIC(7,2) NOT NULL,
    membershipID INT,
    FOREIGN KEY (membershipID) REFERENCES Members (membershipID)
);

CREATE TABLE TrainingSessions (
    sessionID SERIAL PRIMARY KEY,
    sessionDate DATE NOT NULL,
    sessionTime TIME NOT NULL,
    trainerID INT,
    membershipID INT,
    FOREIGN KEY (trainerID) REFERENCES Trainers (trainerID),
    FOREIGN KEY (membershipID) REFERENCES Members (membershipID)
);

CREATE TABLE ViewsProfile (
    membershipID INT,
    trainerID INT,
    PRIMARY KEY (membershipID, trainerID),
    FOREIGN KEY (membershipID) REFERENCES Members (membershipID),
    FOREIGN KEY (trainerID) REFERENCES Trainers (trainerID)
);

CREATE TABLE Participates (
    membershipID INT,
    eventID INT,
    PRIMARY KEY (membershipID, eventID),
    FOREIGN KEY (membershipID) REFERENCES Members (membershipID),
    FOREIGN KEY (eventID) REFERENCES Events (eventID)
);

CREATE TABLE Monitors (
    adminID INT,
    eventID INT,
    PRIMARY KEY (adminID, eventID),
    FOREIGN KEY (adminID) REFERENCES Admins (adminID),
    FOREIGN KEY (eventID) REFERENCES Events (eventID)
);

CREATE TABLE Manages (
    adminID INT,
    equipmentID INT,
    PRIMARY KEY (adminID, equipmentID),
    FOREIGN KEY (adminID) REFERENCES Admins (adminID),
    FOREIGN KEY (equipmentID) REFERENCES Equipment (equipmentID)
);

CREATE TABLE Processes (
    adminID INT,
    paymentID INT,
    PRIMARY KEY (adminID, paymentID),
    FOREIGN KEY (adminID) REFERENCES Admins (adminID),
    FOREIGN KEY (paymentID) REFERENCES Payments (paymentID)
);

CREATE TABLE TrainingNotes (
    trainerID INT PRIMARY KEY,
    notes VARCHAR(255),
    FOREIGN KEY (trainerID) REFERENCES Trainers (trainerID)
);

CREATE TABLE LoyaltyPoints (
    membershipID INT PRIMARY KEY,
    LoyaltyPoints INT,
    FOREIGN KEY (membershipID) REFERENCES Members (membershipID)
);