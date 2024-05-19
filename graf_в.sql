CREATE DATABASE WritersWork;

USE WritersWork;

CREATE TABLE Writer 
(
 id INT NOT NULL PRIMARY KEY,
 name NVARCHAR(50) NOT NULL
) AS NODE;

INSERT INTO Writer  (id, name)
VALUES (1, N'Фёдор достоевский'),
       (2, N'Александр Пушкин'),
	   (3, N'Анна Рэйн'),
	   (4, N'Пелагея Антропова'),
	   (5, N'Кэти Флам'),
	   (6, N'Акира Натиро'),
	   (7, N'Иван Томкин'),
	   (8, N'Жанна Эсли'),
	   (9, N'Катя Мышкина'),
	   (10, N'Жук Олень');

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

CREATE TABLE WriterBook AS EDGE; -- писатель пишет книгу
CREATE TABLE WriterPublishingHouses AS EDGE; -- писатель состоит в идательстве
CREATE TABLE PublishingHousesBook AS EDGE; -- издательство издаёт книгу

ALTER TABLE WriterBook ADD CONSTRAINT EC_WriterBook CONNECTION (Book TO Writer);
ALTER TABLE WriterPublishingHouses ADD CONSTRAINT EC_WriterPublishingHouses CONNECTION (Writer TO PublishingHouses);
ALTER TABLE PublishingHousesBook ADD CONSTRAINT EC_PublishingHousesBook CONNECTION (Book TO  PublishingHouses);

INSERT INTO Book (id, name, genre)
VALUES (1, N'Преступление и Наказание', N'Роман'),
       (2, N'Барышня Крестьянка', N'Роман'),
	   (3, N'Ночь в особнеке', N'Детектив'),
	   (4, N'Страна чедес', N'Фантастика'),
	   (5, N'Девятихвосты Лис', N'Ужасы'),
	   (6, N'Ива', N'Драма'),
	   (7, N'Разбитая посуда', N'Трагедия'),
	   (8, N'Всего три капли алкоголя', N'Комедия'),
	   (9, N'Вечный страник', N'Фантастика'),
	   (10, N'Кот-Разбойник', N'Приключение');
GO
SELECT *
FROM Book;

INSERT INTO PublishingHouses (id, name, city)
VALUES (1, N'Книга', N'Минск'),
       (2, N'Перо', N'Москва'),
	   (3, N'Инная земля', N'Гомель'),
	   (4, N'Киравник', N'Гродно'),
	   (5, N'Писарь', N'Питер'),
	   (6, N'Летопись', N'Брест'),
	   (7, N'Яблоко', N'Пинск'),
	   (8, N'Древо', N'Полоцк'),
	   (9, N'Валир', N'Жлобин'),
	   (10, N'Пиксав', N'Гомель');
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

--5. Используя функцию MATCH, напишите не менее 5 различных запросов к построенной графовой базе данных.
--1. книги Анны Рэйн
SELECT Writer.name, Book.name 
FROM Writer,
	 WriterBook,
	 Book
WHERE MATCH(Book - (WriterBook) -> Writer)
	  AND Writer.name = N'Анна Рэйн';

--2. издательства Ивана Томкина
SELECT Writer.name, PublishingHouses.name 
FROM Writer,
	 WriterPublishingHouses,
	 PublishingHouses
WHERE MATCH(Writer - (WriterPublishingHouses) -> PublishingHouses)
	  AND Writer.name = N'Иван Томкин';

--3. в жанре роман изданные в Минске
SELECT Book.name, Book.genre, PublishingHouses.name, PublishingHouses.city 
FROM Book,
	 PublishingHousesBook,
	 PublishingHouses
WHERE MATCH(Book - (PublishingHousesBook) -> PublishingHouses)
	  AND Book.genre = N'Роман'
	  AND PublishingHouses.city = N'Минск';

--4. авторы книги Страна чедес
SELECT Writer.name, Book.name 
FROM Writer,
	 WriterBook,
	 Book
WHERE MATCH(Book - (WriterBook) -> Writer)
	  AND Book.name = N'Страна чедес';
	        
--5. работы Жук Олень в жанре приключения 
SELECT Writer.name, Book.name 
FROM Writer,
	 WriterBook,
	 Book
WHERE MATCH(Book - (WriterBook) -> Writer)
	  AND Book.genre = N'Приключение'
	  AND Writer.name = N'Жук Олень';

--6. Используя функцию SHORTEST_PATH, напишите не менее 2 различных запросов к построенной графовой базе данных
--1.минимальное количество авторов книги
SELECT Book.name AS BookName
 , STRING_AGG(Writer.name, '->') WITHIN GROUP (GRAPH PATH) AS
Writers
FROM Book
 , WriterBook FOR PATH AS wb
 , Writer FOR PATH 
WHERE MATCH(SHORTEST_PATH(Book(-(wb)->Writer)+))
 AND Book.name = N'Девятихвосты Лис';

--.минимальное количество  издательств книги
SELECT Book.name AS PersonName
 , STRING_AGG(PublishingHouses.name, '->') WITHIN GROUP (GRAPH PATH) AS Friends
FROM Book
 , PublishingHousesBook FOR PATH AS pb
 , PublishingHouses FOR PATH 
WHERE MATCH(SHORTEST_PATH(Book(-(pb)->PublishingHouses)+))
 AND Book.name = N'Вечный страник';

 --8
 SELECT @@SERVERNAME
-- Сервер: HP\HP
-- База данных: SocialNetwork
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
-- Сервер: HP\HP
-- База данных: SocialNetwork
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
-- Сервер: HP\HP
-- База данных: SocialNetwork
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
TO DISK = 'C:\skl(му)\WritersWork.bak'
WITH FORMAT, MEDIANAME = 'SQLServerBackups',
NAME = 'Full Backup of WritersWork';