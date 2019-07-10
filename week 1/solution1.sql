CREATE TABLE users
    (
     userid INTEGER PRIMARY KEY NOT NULL,
     name TEXT NOT NULL 
	);

CREATE TABLE movies
    (
     movieid INTEGER PRIMARY KEY NOT NULL,
     title TEXT NOT NULL
	);
	
CREATE TABLE taginfo
	(
	tagid INTEGER PRIMARY KEY NOT NULL,
	content TEXT NOT NULL
	);
    
CREATE TABLE genres
	(
	genreid INTEGER PRIMARY KEY,
	name TEXT NOT NULL
	);


CREATE TABLE ratings
    (
     userid INTEGER REFERENCES users(userid),
     movieid INTEGER REFERENCES movie(movieid),
     rating NUMERIC NOT NULL CHECK(RATING>=0 AND RATING<=5),
     timestamp BIGINT NOT NULL,
	 PRIMARY KEY (userid, movieid)
	);
    
    CREATE TABLE tags
	(
	userid INTEGER REFERENCES users(userid),
	movieid INTEGER NOT NULL REFERENCES movies(movieid),
	tagid INTEGER REFERENCES taginfo(tagid),
	timestamp BIGINT NOT NULL,
	PRIMARY KEY (userid, movieid, tagid)
    );
    
CREATE TABLE hasagenre
	(
	movieid INTEGER,
	genreid INTEGER NOT NULL,
	FOREIGN KEY (movieid) REFERENCES movies(movieid),
	FOREIGN KEY (genreid) REFERENCES genres(genreid)
	);
	

