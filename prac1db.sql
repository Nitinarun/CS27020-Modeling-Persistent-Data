CS27020 Practical 1 11/10/2021

DROP TABLE [ IF EXISTS ] albums;
CREATE TABLE albums ( 
	Album varchar(255)
	Artist varchar(255)
	Label varchar(255)
	Year int
	Sales int 
);


INSERT INTO albums (Albums)
VALUES (Greatest Hits, Gold: Greatest Hits, Sgt. Peppers Lonely Hearts, Club Band, 21, (What's the story) Morning Glory?,
Thriller, The Dark Side of the Moon, Brothers in Arms, Bad, Greatest Hits II);

INSERT INTO albums (Artist)
VALUES (Queen, ABBA, The Beatles, Adele, Oasis, Michael Jackson, Pink Floyd, Dire Straits, Michael Jackson, Queen);

INSERT INTO albums (Label)
VALUES (EMI/Parlophone, Plydor, Parlophone, XL, Creation, Epic, Harvest, Vertigo, Epic, EMI/Parlophone);

INSERT INTO albums (Year)
VALUES (1981, 1992, 1967, 2011, 1995, 1982, 1973, 1985, 1987, 1991);

INSERT INTO albums (Sales)
VALUES (6600600, 5580000, 5340000, 5200000, 4940000, 4470000, 4470000, 4350000, 4140000, 3990000 );


SELECT Year FROM albums 


ALTER TABLE albums 
ADD chart_peak int


UPDATE albums 
SET chart_peak = int 2 
WHERE Albums = The Dark Side of the Moon, Artist = Pink Floyd ;


SELECT DISTINCT Artist, Album, Sales 
FROM albums 
ORDER BY Artist, Album DESC;


SELECT DISTINCT Artist, Album, Sales, chart_peak 
FROM albums
WHERE Albums LIKE Greatest 
ORDER BY Year ASC; 