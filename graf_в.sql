CREATE DATABASE WritersWork;

USE WritersWork;

CREATE TABLE Writer 
(
 id INT NOT NULL PRIMARY KEY,
 name NVARCHAR(50) NOT NULL
) AS NODE;

INSERT INTO Writer  (id, name)
VALUES (1, N'Ը��� �����������'),
       (2, N'��������� ������'),
	   (3, N'���� ����'),
	   (4, N'������� ���������'),
	   (5, N'���� ����'),
	   (6, N'����� ������'),
	   (7, N'���� ������'),
	   (8, N'����� ����'),
	   (9, N'���� �������'),
	   (10, N'��� �����');

SELECT *
FROM Writer;

CREATE TABLE Book
(
 id INT NOT NULL PRIMARY KEY,
 name NVARCHAR(30) NOT NULL,
 genre NVARCHAR(30) NOT NULL,
) AS NODE;

CREATE TABLE PublishingHouses
(
 id INT NOT NULL PRIMARY KEY,
 name NVARCHAR(30) NOT NULL,
 city NVARCHAR(30) NOT NULL,
) AS NODE;

CREATE TABLE WriterBook AS EDGE; -- �������� ����� �����
CREATE TABLE WriterPublishingHouses AS EDGE; -- �������� ������� � �����������
CREATE TABLE PublishingHousesBook AS EDGE; -- ������������ ����� �����

ALTER TABLE WriterBook ADD CONSTRAINT EC_WriterBook CONNECTION (Book TO Writer);
ALTER TABLE WriterPublishingHouses ADD CONSTRAINT EC_WriterPublishingHouses CONNECTION (Writer TO PublishingHouses);
ALTER TABLE PublishingHousesBook ADD CONSTRAINT EC_PublishingHousesBook CONNECTION (Book TO  PublishingHouses);

INSERT INTO Book (id, name, genre)
VALUES (1, N'������������ � ���������', N'�����'),
       (2, N'������� ����������', N'�����'),
	   (3, N'���� � ��������', N'��������'),
	   (4, N'������ �����', N'����������'),
	   (5, N'������������ ���', N'�����'),
	   (6, N'���', N'�����'),
	   (7, N'�������� ������', N'��������'),
	   (8, N'����� ��� ����� ��������', N'�������'),
	   (9, N'������ �������', N'����������'),
	   (10, N'���-���������', N'�����������');
GO
SELECT *
FROM Book;

INSERT INTO PublishingHouses (id, name, city)
VALUES (1, N'�����', N'�����'),
       (2, N'����', N'������'),
	   (3, N'����� �����', N'������'),
	   (4, N'��������', N'������'),
	   (5, N'������', N'�����'),
	   (6, N'��������', N'�����'),
	   (7, N'������', N'�����'),
	   (8, N'�����', N'������'),
	   (9, N'�����', N'������'),
	   (10, N'������', N'������');
GO
SELECT *
FROM PublishingHouses;

INSERT INTO WriterBook ($from_id, $to_id)
VALUES ((SELECT $node_id FROM Book WHERE ID = 3),(SELECT $node_id FROM Writer WHERE ID = 1)),
       ((SELECT $node_id FROM Book WHERE ID = 4),(SELECT $node_id FROM Writer WHERE ID = 1)),
	   ((SELECT $node_id FROM Book WHERE ID = 5),(SELECT $node_id FROM Writer WHERE ID = 2)),
	   ((SELECT $node_id FROM Book WHERE ID = 7),(SELECT $node_id FROM Writer WHERE ID = 2)),
	   ((SELECT $node_id FROM Book WHERE ID = 7),(SELECT $node_id FROM Writer WHERE ID = 3)),
	   ((SELECT $node_id FROM Book WHERE ID = 8),(SELECT $node_id FROM Writer WHERE ID = 3)),
	   ((SELECT $node_id FROM Book WHERE ID = 9),(SELECT $node_id FROM Writer WHERE ID = 4)),
	   ((SELECT $node_id FROM Book WHERE ID = 8),(SELECT $node_id FROM Writer WHERE ID = 5)),
	   ((SELECT $node_id FROM Book WHERE ID = 6),(SELECT $node_id FROM Writer WHERE ID = 5)),
	   ((SELECT $node_id FROM Book WHERE ID = 1),(SELECT $node_id FROM Writer WHERE ID = 6)),
	   ((SELECT $node_id FROM Book WHERE ID = 1),(SELECT $node_id FROM Writer WHERE ID = 7)),
	   ((SELECT $node_id FROM Book WHERE ID = 2),(SELECT $node_id FROM Writer WHERE ID = 7)),
	   ((SELECT $node_id FROM Book WHERE ID = 4),(SELECT $node_id FROM Writer WHERE ID = 8)),
	   ((SELECT $node_id FROM Book WHERE ID = 5),(SELECT $node_id FROM Writer WHERE ID = 8)),
	   ((SELECT $node_id FROM Book WHERE ID = 6),(SELECT $node_id FROM Writer WHERE ID = 9)),
	   ((SELECT $node_id FROM Book WHERE ID = 2),(SELECT $node_id FROM Writer WHERE ID = 9)),
	   ((SELECT $node_id FROM Book WHERE ID = 10),(SELECT $node_id FROM Writer WHERE ID = 10));
      
INSERT INTO WriterPublishingHouses ($from_id, $to_id)
VALUES ((SELECT $node_id FROM Writer WHERE ID = 1),(SELECT $node_id FROM PublishingHouses WHERE ID = 1)),
       ((SELECT $node_id FROM Writer WHERE ID = 2),(SELECT $node_id FROM PublishingHouses WHERE ID = 2)),
	   ((SELECT $node_id FROM Writer WHERE ID = 3),(SELECT $node_id FROM PublishingHouses WHERE ID = 3)),
	   ((SELECT $node_id FROM Writer WHERE ID = 4),(SELECT $node_id FROM PublishingHouses WHERE ID = 4)),
	   ((SELECT $node_id FROM Writer WHERE ID = 5),(SELECT $node_id FROM PublishingHouses WHERE ID = 5)),
	   ((SELECT $node_id FROM Writer WHERE ID = 6),(SELECT $node_id FROM PublishingHouses WHERE ID = 6)),
	   ((SELECT $node_id FROM Writer WHERE ID = 7),(SELECT $node_id FROM PublishingHouses WHERE ID = 7)),
	   ((SELECT $node_id FROM Writer WHERE ID = 8),(SELECT $node_id FROM PublishingHouses WHERE ID = 8)),
	   ((SELECT $node_id FROM Writer WHERE ID = 9),(SELECT $node_id FROM PublishingHouses WHERE ID = 9)),
	   ((SELECT $node_id FROM Writer WHERE ID = 10),(SELECT $node_id FROM PublishingHouses WHERE ID = 10));

INSERT INTO PublishingHousesBook ($from_id, $to_id)
VALUES ((SELECT $node_id FROM Book WHERE ID = 1),(SELECT $node_id FROM PublishingHouses WHERE ID = 1)),
       ((SELECT $node_id FROM Book WHERE ID = 2),(SELECT $node_id FROM PublishingHouses WHERE ID = 2)),
	   ((SELECT $node_id FROM Book WHERE ID = 3),(SELECT $node_id FROM PublishingHouses WHERE ID = 3)),
	   ((SELECT $node_id FROM Book WHERE ID = 4),(SELECT $node_id FROM PublishingHouses WHERE ID = 4)),
	   ((SELECT $node_id FROM Book WHERE ID = 5),(SELECT $node_id FROM PublishingHouses WHERE ID = 5)),
	   ((SELECT $node_id FROM Book WHERE ID = 6),(SELECT $node_id FROM PublishingHouses WHERE ID = 6)),
	   ((SELECT $node_id FROM Book WHERE ID = 7),(SELECT $node_id FROM PublishingHouses WHERE ID = 7)),
	   ((SELECT $node_id FROM Book WHERE ID = 8),(SELECT $node_id FROM PublishingHouses WHERE ID = 8)),
	   ((SELECT $node_id FROM Book WHERE ID = 9),(SELECT $node_id FROM PublishingHouses WHERE ID = 9)),
	   ((SELECT $node_id FROM Book WHERE ID = 10),(SELECT $node_id FROM PublishingHouses WHERE ID = 10)),
	   ((SELECT $node_id FROM Book WHERE ID = 4),(SELECT $node_id FROM PublishingHouses WHERE ID = 2)),
	   ((SELECT $node_id FROM Book WHERE ID = 7),(SELECT $node_id FROM PublishingHouses WHERE ID = 5)),
	   ((SELECT $node_id FROM Book WHERE ID = 9),(SELECT $node_id FROM PublishingHouses WHERE ID = 6));

--5. ��������� ������� MATCH, �������� �� ����� 5 ��������� �������� � ����������� �������� ���� ������.
--1. ����� ���� ����
SELECT Writer.name, Book.name 
FROM Writer,
	 WriterBook,
	 Book
WHERE MATCH(Book - (WriterBook) -> Writer)
	  AND Writer.name = N'���� ����';

--2. ������������ ����� �������
SELECT Writer.name, PublishingHouses.name 
FROM Writer,
	 WriterPublishingHouses,
	 PublishingHouses
WHERE MATCH(Writer - (WriterPublishingHouses) -> PublishingHouses)
	  AND Writer.name = N'���� ������';

--3. � ����� ����� �������� � ������
SELECT Book.name, Book.genre, PublishingHouses.name, PublishingHouses.city 
FROM Book,
	 PublishingHousesBook,
	 PublishingHouses
WHERE MATCH(Book - (PublishingHousesBook) -> PublishingHouses)
	  AND Book.genre = N'�����'
	  AND PublishingHouses.city = N'�����';

--4. ������ ����� ������ �����
SELECT Writer.name, Book.name 
FROM Writer,
	 WriterBook,
	 Book
WHERE MATCH(Book - (WriterBook) -> Writer)
	  AND Book.name = N'������ �����';
	        
--5. ������ ��� ����� � ����� ����������� 
SELECT Writer.name, Book.name 
FROM Writer,
	 WriterBook,
	 Book
WHERE MATCH(Book - (WriterBook) -> Writer)
	  AND Book.genre = N'�����������'
	  AND Writer.name = N'��� �����';

--6. ��������� ������� SHORTEST_PATH, �������� �� ����� 2 ��������� �������� � ����������� �������� ���� ������
--1.����������� ���������� ������� �����
SELECT Book.name AS BookName
 , STRING_AGG(Writer.name, '->') WITHIN GROUP (GRAPH PATH) AS
Writers
FROM Book
 , WriterBook FOR PATH AS wb
 , Writer FOR PATH 
WHERE MATCH(SHORTEST_PATH(Book(-(wb)->Writer)+))
 AND Book.name = N'������������ ���';

--.����������� ����������  ����������� �����
SELECT Book.name AS PersonName
 , STRING_AGG(PublishingHouses.name, '->') WITHIN GROUP (GRAPH PATH) AS Friends
FROM Book
 , PublishingHousesBook FOR PATH AS pb
 , PublishingHouses FOR PATH 
WHERE MATCH(SHORTEST_PATH(Book(-(pb)->PublishingHouses)+))
 AND Book.name = N'������ �������';

 --8
 SELECT @@SERVERNAME
-- ������: HP\HP
-- ���� ������: SocialNetwork
--https://github.com/LobikovaLiza/Tect/blob/main/IMG/b_1.png
SELECT B.ID IdFirst
 , B.name AS First
 , CONCAT(N'b_',B.id) AS [First image name]
 , W.ID AS IdSecond
 , W.name AS Second
 , CONCAT(N'w_',W.id) AS [Second image name]
FROM dbo.Book AS B
 , dbo.WriterBook AS WB
 , dbo.Writer AS W
WHERE MATCH (B-(WB)->W)
 SELECT @@SERVERNAME
-- ������: HP\HP
-- ���� ������: SocialNetwork
--https://github.com/LobikovaLiza/Tect/blob/main/IMG/b_1.png
SELECT W.ID IdFirst
 , W.name AS First
 , CONCAT(N'w_',W.id) AS [First image name]
 , P.ID AS IdSecond
 , P.name AS Second
 , CONCAT(N'i_',P.id) AS [Second image name]
FROM dbo.Writer AS W
 , dbo.WriterPublishingHouses AS WP
 , dbo.PublishingHouses AS P
WHERE MATCH (W-(WP)->P)

 SELECT @@SERVERNAME
-- ������: HP\HP
-- ���� ������: SocialNetwork
--https://github.com/LobikovaLiza/Tect/blob/main/IMG/b_1.png
SELECT B.ID IdFirst
 , B.name AS First
 , CONCAT(N'w_',B.id) AS [First image name]
 , P.ID AS IdSecond
 , P.name AS Second
 , CONCAT(N'i_',P.id) AS [Second image name]
FROM dbo.Book AS B
 , dbo.PublishingHousesBook AS PB
 , dbo.PublishingHouses AS P
WHERE MATCH (B-(PB)->P)

BACKUP DATABASE WritersWork
TO DISK = 'C:\skl(��)\WritersWork.bak'
WITH FORMAT, MEDIANAME = 'SQLServerBackups',
NAME = 'Full Backup of WritersWork';