CREATE DATABASE ESportsManagement;
USE ESportsManagement;

CREATE TABLE Team (
	TeamID INT PRIMARY KEY AUTO_INCREMENT, 
    TeamName VARCHAR(100), 
    Country VARCHAR(100), 
    OwnerTeam VARCHAR(100), 
    Year_Publish YEAR
);

CREATE TABLE Player (
	TeamID INT,
	PlayerID INT PRIMARY KEY AUTO_INCREMENT,
    PlayerName VARCHAR(100),
    NickName VARCHAR(100),
    Competition_venue VARCHAR(100),
    Salary DECIMAL(12,0),
    FOREIGN KEY (TeamID) REFERENCES Team(TeamID)
);


CREATE TABLE The_match (
	TeamID INT,
	MatchID VARCHAR(8) PRIMARY KEY,
    Start_time TIME,
    Result INT,
    FOREIGN KEY (TeamID) REFERENCES Team(TeamID)
);


CREATE TABLE Match_Statistic (
	PlayerID INT,
	Kills INT,
    Deaths INT,
    Assists INT,
    FOREIGN KEY (PlayerID) REFERENCES Player(PlayerID)
);

-- phần 2
ALTER TABLE The_match
ADD COLUMN Award INT;

ALTER TABLE Team
RENAME COLUMN Country TO Area;

DROP TABLE Match_Statistic;
DROP TABLE The_match;


-- DROP TABLE Team;
-- DROP TABLE Player;


-- phần 3
INSERT INTO Team (TeamName, Area, OwnerTeam, Year_Publish)
VALUES
('CNTT1', 'Việt Nam', 'Sang Lê', 2022),
('CNTT2', 'Đu Bai', 'Tuấn', 1999),
('CNTT3', 'Ấn Độ', 'Minh Đạo', 2002),
('CNTT4', 'Việt Nam', NULL, 2017),
('CNTT5', 'Lào', 'Sang Lê', 2007);

INSERT INTO Player (TeamID, PlayerName, NickName, Competition_venue, Salary)
VALUES
(2, 'Phạm Ngọc Quỳnh Như', 'Mii', 'Tấn công', 200000000),
(4, 'Nguyễn Thị Thu Hiền', 't_hien', 'Hỗ trợ', 18000000),
(1, 'Nguyễn Vân Trường', 'vtruong', 'Đi rừng', 150000000),
(3, 'Huỳnh Công Danh', 'cdanh', 'Tấn công', 50000000),
(5, 'Hồ Hữu Hoài Nam', 'hnam', 'Phòng thủ', 20000000);

INSERT INTO The_match 
VALUES
(2, 'MS_002', '12:30:00', 5, 1),
(4, 'MS_006', '14:30:00', 7, 2),
(5, 'MS_003', '16:30:00', 2, 3),
(1, 'MS_007', '18:30:00', 3, 3),
(3, 'MS_008', '20:30:00', 1, 2);

INSERT INTO Match_Statistic
VALUES 
(1, 20, 7, 2),
(2, 2, 3, 18),
(5, 6, 5, 5),
(3, 2, 3, 7),
(4, 12, 5, 3);

set sql_safe_updates = 0;

UPDATE Player
SET Salary = Salary * 1.2
WHERE Competition_venue = 'Đi rừng';

DELETE FROM Team
WHERE OwnerTeam IS NULL;

-- phần 4
SELECT * FROM Player
WHERE Salary >= 50000000 AND Salary <= 150000000;

SELECT * FROM The_match
WHERE MatchID = 'MS_007';

