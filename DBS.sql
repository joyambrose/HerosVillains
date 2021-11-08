
SELECT name, database_id, create_date  
FROM sys.databases ;  
-- -- GO 
USE SwinJoy;

IF OBJECT_ID('HERO') IS NOT NULL
DROP TABLE HERO;

IF OBJECT_ID('VILLAIN') IS NOT NULL
DROP TABLE VILLAIN;

IF OBJECT_ID('GAME') IS NOT NULL
DROP TABLE GAME;

IF OBJECT_ID('ACTION') IS NOT NULL
DROP TABLE ACTION;

CREATE TABLE HERO (
    HEROID INT,
    HERONAME NVARCHAR(20),
    DICEMIN INT,
    DICEMAX INT,
    USESLEFT INT,
PRIMARY KEY (HEROID)
);

CREATE TABLE VILLAIN (
    VILLAINID INT,
    VILLAINNAME NVARCHAR(20),
PRIMARY KEY (VILLAINID)
);

CREATE TABLE GAME (
    GAMEID INT,
    STARTDATETIME DATETIME,
PRIMARY KEY (GAMEID)
);

CREATE TABLE ACTION (
    HEROID INT,
    VILLAINID INT,
    GAMEID INT,
    TURNCOUNTER INT,
PRIMARY KEY (HEROID, VILLAINID, GAMEID, TURNCOUNTER),
FOREIGN KEY (HEROID) REFERENCES HERO (HEROID),
FOREIGN KEY (VILLAINID) REFERENCES VILLAIN (VILLAINID),
FOREIGN KEY (GAMEID) REFERENCES GAME (GAMEID)
);

INSERT INTO HERO (HEROID, HERONAME, DICEMIN, DICEMAX, USESLEFT) VALUES (222, 'TUPAC SHAKUR', 2, 10, 7)
INSERT INTO HERO (HEROID, HERONAME, DICEMIN, DICEMAX, USESLEFT) VALUES (101, 'AMY WINEHOUSE', 4, 9, 8)
INSERT INTO HERO (HEROID, HERONAME, DICEMIN, DICEMAX, USESLEFT) VALUES (306, 'MICHAEL JACKSON', 7, 5, 9)

INSERT INTO VILLAIN (VILLAINID, VILLAINNAME) VALUES (666, 'DONALD TRUMP')
INSERT INTO VILLAIN (VILLAINID, VILLAINNAME) VALUES (3, 'WHITEROSE')

INSERT INTO GAME (GAMEID, STARTDATETIME)
VALUES (1, '2021-10-04')

INSERT INTO ACTION (HEROID, VILLAINID, GAMEID, TURNCOUNTER)
VALUES (222, 666, 1, 4)

SELECT * FROM HERO;
GO
SELECT * FROM VILLAIN;
GO
SELECT * FROM ACTION;
GO
SELECT * FROM GAME;