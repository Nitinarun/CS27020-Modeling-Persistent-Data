-- *********************************************
-- This script creates an example database
--        for CS27020 practical 2021/2022. 
--
-- This is a database for organising your music
-- There are three tables, one for Artists,
-- one for Albums and one for Songs
-- *********************************************
-- If using your own server you can create a seperate 
-- database to hold this data. If using the central or
-- dcs servers you will not have permission
--
-- drop database music;
-- CREATE DATABASE IF NOT EXISTS music DEFAULT CHARACTER SET utf8;
-- use music;

\echo Dropping tables if they exist
DROP TABLE IF EXISTS record_label;
DROP TABLE IF EXISTS artist;
DROP TABLE IF EXISTS album;


\echo Creating record_label table
-- Record Label table
CREATE TABLE record_label (
  id 		INT NOT NULL,
  name 		VARCHAR(50) NOT NULL,
  PRIMARY KEY (id)
);

\echo Creating artist table
-- Artist table
CREATE TABLE artist (
  id  			INT NOT NULL,
  record_label_id	INT NOT NULL,
  name 			VARCHAR(50) NOT NULL,
  PRIMARY KEY (id)
);

\echo Creating album table
-- Album Table
CREATE TABLE album (
  id 		INT NOT NULL,
  artist_id  	INT NOT NULL,
  name     	VARCHAR(50) NOT NULL,
  year     	INT,
  sales		INT,
  PRIMARY KEY (id)
);


\echo Inserting into tables
-- Record Label data
INSERT INTO record_label (id,name) VALUES
(1,'EMI/Parlophone'),
(2,'Polydor'),
(3,'Parlophone'),
(4,'XL'),
(5,'Creation'),
(6,'Epic'),
(7,'Harvest'),
(8,'Vertigo'),
(9,'Blackened'),
(10,'Warner Bros'),
(11,'Universal'),
(12,'MCA'),
(13,'Elektra'),
(14,'Capitol'),
(15,'AJR Productions');


-- Artist data
INSERT INTO artist (id, record_label_id, name) VALUES
(1,1,'Queen'),
(2,2,'ABBA'),
(3,3,'The Beatles'),
(4,4,'Adele'),
(5,5,'Oasis'),
(6,6,'Michael Jackson'),
(7,7,'Pink Floyd'),
(8,8,'Dire Straits'),
(9,9,'Metallica'),
(10,9,'Megadeth'),
(11,9,'Anthrax'),
(12,10,'Eric Clapton'),
(13,10,'ZZ Top'),
(14,10,'Van Halen'),
(15,11,'Lynyrd Skynyrd'),
(16,11,'AC/DC'),
(17,15,'AJR');


-- Album data
INSERT INTO album (id, artist_id, name, year, sales) VALUES
(1, 9, '...And Justice For All',1988,8000000),
(2, 9, 'Black Album',1991,30000000),
(4, 10, 'Endgame',2009,150000),
(5, 10, 'Peace Sells',1986,636000),
(7, 12, 'Unplugged',1992,26000000),
(8, 12, 'Riding with the King',2000,700000),
(9, 13, 'Greatest Hits',1992,25000000),
(10, 14, 'Greatest Hits',null,572000),
(11, 15, 'All-Time Greatest Hits',1975,28000000),
(12, 16, 'Back in Black',1980,29600000),
(13, 3, 'Sgt. Pepper''s Lonely Hearts Club Band', 1967,18200000),
(14, 1, 'Greatest Hits',1981,6600000),
(15, 2, 'Gold: Greatest Hits',1992,23000000),
(16, 4, '21',2011,26400000),
(17, 5, '(What''s the Story) Morning glory',1995,4940000),
(18, 6, 'Thriller',1982,48900000),
(19, 7, 'The Dark Side of the Moon',1973,24400000),
(20, 8, 'Brother in Arms',1985,4350000),
(21, 6, 'Bad',1987,20700000),
(22, 17, 'Neotheater',2019,32000),
(23, 11, 'The Greater of 2 Evils',2004,null);

SELECT Album.id, Album.artist_id, Album.name, Album.year, Album.sales 
FROM Album
WHERE Album.year BETWEEN 1990 AND 2010
AND Album.sales IS NOT NULL
ORDER BY Album.sales DESC
LIMIT 5;

SELECT Album.id, Artist.name, Album.name, Album.year, Album.sales, Artist.record_label_id
FROM Album
INNER JOIN Artist On Album.artist_id = Artist.id
AND Album.sales IS NOT NULL
ORDER BY Album.sales DESC
LIMIT 5;

SELECT Artist.name, Album.name, Album.sales
FROM Album
INNER JOIN Artist On Album.artist_id = Artist.id
AND Album.sales IS NOT NULL
ORDER BY Album.sales DESC
LIMIT 10;

SELECT Artist.name, Album.name, Album.year, Album.sales, Artist.record_label_id
FROM Album
INNER JOIN Artist On Album.artist_id = Artist.id
INNER JOIN record_label On Artist.record_label_id = record_label.id
WHERE Album.year IS NOT NULL
AND Album.sales IS NOT NULL
ORDER BY Album.sales DESC;

EXPLAIN ANALYZE SELECT Artist.name, Album.name, Album.year, Album.sales, Artist.record_label_id, record_label.name
FROM Album
INNER JOIN Artist On Album.artist_id = Artist.id
INNER JOIN record_label On Artist.record_label_id = record_label.id
WHERE record_label.name LIKE '%Parlophone%'
AND record_label.name LIKE '%EMI/Parlophone%'
AND Album.sales IS NOT NULL
ORDER BY Album.sales DESC;

SELECT COUNT (Artist.name) AS art_nme, record_label.name
FROM Artist
RIGHT JOIN record_label On Artist.record_label_id = record_label.id
GROUP BY record_label.name
ORDER BY art_nme DESC;
