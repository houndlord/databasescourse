CREATE TABLE users
    (
     userid INTEGER PRIMARY KEY NOT NULL,
     name VARCHAR(1000) 
	);

CREATE TABLE movies
    (
     movieid INTEGER PRIMARY KEY NOT NULL,
     title VARCHAR(1000)
	);
	
CREATE TABLE taginfo
	(
	tagid INTEGER PRIMARY KEY NOT NULL,
	content VARCHAR(1000)
	);
    
CREATE TABLE genres
	(
	genreid INTEGER PRIMARY KEY,
	name VARCHAR(1000) 
	);


CREATE TABLE ratings
    (
     userid INTEGER,
     movieid INTEGER,
     rating NUMERIC PRIMARY KEY NOT NULL,
     timestamp BIGINT NOT NULL,
	 /*CHECK(rating <=5 AND rating >=1),*/
	 FOREIGN KEY (userid) REFERENCES users(userid),
	 FOREIGN KEY (movieid) REFERENCES movie(movieid)
	);
    
    CREATE TABLE tags
	(
	userid INTEGER NOT NULL,
	movieid INTEGER NOT NULL,
	tagid INTEGER NOT NULL,
	timestamp BIGINT,
    FOREIGN KEY (userid) REFERENCES users(userid),
    FOREIGN KEY (movieid) REFERENCES movies(movieid),
    FOREIGN KEY (tagid) REFERENCES taginfo(tagid)
    );
    
CREATE TABLE hasagenre
	(
	movieid INTEGER,
	genreid INTEGER NOT NULL,
	FOREIGN KEY (movieid) REFERENCES movies(movieid),
	FOREIGN KEY (genreid) REFERENCES genres(genreid)
	);
	

