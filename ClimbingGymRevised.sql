
/*
Milestone 4 SQL Script

Haiden Murphy
Jauseff Dait
Nick Nguyen
Khushi

This script contains all tables for the Rock Climbing Gym Database. Each table is populated with five tuples of sample data.

*/

CREATE TABLE Gym(
   GymID INT PRIMARY KEY,
   Address VARCHAR(100),
   Owner VARCHAR(50)
);

INSERT INTO Gym VALUES (1,'123 Main St','John');
INSERT INTO Gym VALUES (2,'45 Rock Rd','Sarah');
INSERT INTO Gym VALUES (3,'89 Climb Ave','Alex');
INSERT INTO Gym VALUES (4,'77 Boulder Ln','Mike');
INSERT INTO Gym VALUES (5,'12 Summit St','Emma');


CREATE TABLE AddressPostal(
   Address VARCHAR(100) PRIMARY KEY,
   PostalCode VARCHAR(10)
);


INSERT INTO AddressPostal VALUES ('123 Main St','V1A1A1');
INSERT INTO AddressPostal VALUES ('45 Rock Rd','V2B2B2');
INSERT INTO AddressPostal VALUES ('89 Climb Ave','V3C3C3');
INSERT INTO AddressPostal VALUES ('77 Boulder Ln','V4D4D4');
INSERT INTO AddressPostal VALUES ('12 Summit St','V5E5E5');


CREATE TABLE ClimbingWalls(
   WID INT PRIMARY KEY,
   GymID INT,
   Name VARCHAR(50),
   PrevResetDate DATE,
   ClimbingStyle VARCHAR(50),
   FOREIGN KEY (GymID) REFERENCES Gym(GymID)
);


INSERT INTO ClimbingWalls VALUES (1, 1, 'V0', '2026-02-10', 'Boulder Wall');
INSERT INTO ClimbingWalls VALUES (2, 1, 'V1', '2026-03-01', 'Rope Wall');
INSERT INTO ClimbingWalls VALUES (5, 1, 'V5', '2026-01-05', 'Power Wall');
INSERT INTO ClimbingWalls VALUES (10, 2, 'V10', '2025-10-27', 'Speed Wall');
INSERT INTO ClimbingWalls VALUES (9, 1, 'V9', '2025-11-19', 'Boulder Wall');


CREATE TABLE Equipment(
eID INT PRIMARY KEY,
GymID INT,
eName VARCHAR(30),
Section INT,
NextMaintenanceDate DATE,
FOREIGN KEY (GymID) REFERENCES Gym(GymID)
);

INSERT INTO Equipment VALUES (001, 1, 'dry chalk', '2', '2027-01-01');
INSERT INTO Equipment VALUES (002, 1, 'wet chalk', '1', '2027-01-01');
INSERT INTO Equipment VALUES (003, 1, 'harness', '2', '2028-09-01');
INSERT INTO Equipment VALUES (004, 1, 'helmet', '2', '2027-07-31');
INSERT INTO Equipment VALUES (005, 1, 'gloves', '2', '2027-12-01');

CREATE TABLE Classes(
ClassID INT PRIMARY KEY,
Time TIME,
Date DATE,
ClassName VARCHAR(30)
);

INSERT INTO Classes VALUES (1, '02:00:00', '2026-04-12', 'Beginners Speed Climbing');
INSERT INTO Classes VALUES (2,'03:00:00', '2026-04-14' ,'Intermediate Speed Climbing');
INSERT INTO Classes VALUES (3, '01:00:00', '2026-04-16', 'Advanced Speed Climbing');
INSERT INTO Classes VALUES (4, '02:30:00', '2026-04-20','Beginners Bouldering');
INSERT INTO Classes VALUES (5, '03:30:00', '2026-04-22', 'Intermediate Bouldering');

CREATE TABLE Waitlist_IsOn(
QueueNumber INT,
ClassID INT,
ClimberID INT,
PRIMARY KEY (QueueNumber, ClassID),
FOREIGN KEY (ClassID) REFERENCES Classes(ClassID),
FOREIGN KEY (ClimberID) REFERENCES Members(ClimberID)
);

INSERT INTO Waitlist_IsOn VALUES (1, 1, 1003);
INSERT INTO Waitlist_IsOn VALUES (2, 1, 1004);
INSERT INTO Waitlist_IsOn VALUES (3, 1, 1001);
INSERT INTO Waitlist_IsOn VALUES (4, 1, 1005);
INSERT INTO Waitlist_IsOn VALUES (5, 1, 1010);

CREATE TABLE Uses(
WID INT,
ClimberID INT,
Time TIME,
GymID INT,
Duration INT,
PRIMARY KEY (WID, ClimberID, Time),
FOREIGN KEY (WID) REFERENCES ClimbingWall(WID),
FOREIGN KEY (ClimberID) REFERENCES Members(ClimberID),
FOREIGN KEY (GymID) REFERENCES Gym(GymID)
);


INSERT INTO Uses VALUES (4, 1001, '01:15:00', 1, 45);
INSERT INTO Uses VALUES (4, 1023, '02:00:00', 1, 60);
INSERT INTO Uses VALUES (4, 1118, '03:15:00', 1, 45);
INSERT INTO Uses VALUES (4, 1071, '04:15:00', 1, 45);
INSERT INTO Uses VALUES (4, 1011, '03:00:00', 1, 45);

CREATE TABLE Members(
ClimberID INT PRIMARY KEY,
DateJoined DATE
);

INSERT INTO Members VALUES (1001, '2020-02-12');
INSERT INTO Members VALUES (1002, '2019-04-06');
INSERT INTO Members VALUES (1003, '2022-12-19');
INSERT INTO Members VALUES (1004, '2025-09-22');
INSERT INTO Members VALUES (1005, '2025-09-22');
INSERT INTO Members VALUES (1010, '2021-02-12');
INSERT INTO Members VALUES (1098, '2020-04-06');

CREATE TABLE Staff(
ClimberID INT PRIMARY KEY,
YearsOfExperience INT
);

INSERT INTO Staff VALUES (1098, 4);
INSERT INTO Staff VALUES (1076, 2);
INSERT INTO Staff VALUES (1010, 8);
INSERT INTO Staff VALUES (1058, 7);
INSERT INTO Staff VALUES (1077, 7);

CREATE TABLE Teaches(
ClassID INT,
ClimberID INT,
Role CHAR(50),
PRIMARY KEY (ClassID, ClimberID),
FOREIGN KEY (ClimberID) REFERENCES Members(ClimberID),
FOREIGN KEY (ClassID) REFERENCES Classes(ClassID)
);

INSERT INTO Teaches VALUES (1, 1098, 'Instructor');
INSERT INTO Teaches VALUES (2, 1098, 'Safety Demonstrator');
INSERT INTO Teaches VALUES (3, 1098, 'Instructor');
INSERT INTO Teaches VALUES (4, 1010, 'Instructor');
INSERT INTO Teaches VALUES (5, 1010, 'Instructor');
