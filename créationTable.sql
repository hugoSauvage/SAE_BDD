-- Drop tables if they already exist (respect order for foreign keys)
DROP TABLE IF EXISTS matches CASCADE;
DROP TABLE IF EXISTS pages CASCADE;
DROP TABLE IF EXISTS games CASCADE;
DROP TABLE IF EXISTS icons CASCADE;
DROP TABLE IF EXISTS tiers CASCADE;
DROP TABLE IF EXISTS tournaments CASCADE;
DROP TABLE IF EXISTS links CASCADE;

-- Table: pages
CREATE TABLE pages (
    pageId INT PRIMARY KEY,
    pagename VARCHAR(50),
    namespace INT,
    objectname VARCHAR(50),
    tickername VARCHAR(50),
    shortname VARCHAR(50)
);

-- Table: tournaments
CREATE TABLE tournaments (
    tournamentId SERIAL PRIMARY KEY,
    name VARCHAR(50),
    section VARCHAR(50),
    extradata VARCHAR(50)
);

-- Table: matches
CREATE TABLE matches (
    pageId INT PRIMARY KEY,
    match2bracketid VARCHAR(50),
    status VARCHAR(50),
    winner VARCHAR(50),
    walkover VARCHAR(50),
    resulttype VARCHAR(50),
    finished BOOLEAN,
    mode VARCHAR(50),
    type VARCHAR(50),
    bestof INT,
    dateMatch DATE,
    dateexact BOOLEAN,
    stream VARCHAR(50),
    vod VARCHAR(50),
    tournamentId INT,
    parent VARCHAR(50),
    match2bracketdata VARCHAR(50),
    match2games VARCHAR(50),
    match2opponents VARCHAR(50),
    FOREIGN KEY (pageId) REFERENCES pages(pageId),
    FOREIGN KEY (tournamentId) REFERENCES tournaments(tournamentId)
);

-- Table: games
CREATE TABLE games (
    pageId INT PRIMARY KEY,
    game VARCHAR(50),
    patch VARCHAR(50),
    FOREIGN KEY (pageId) REFERENCES matches(pageId)
);

-- Table: icons
CREATE TABLE icons (
    pageId INT PRIMARY KEY,
    icon VARCHAR(50),
    iconurl VARCHAR(50),
    icondarck VARCHAR(50),
    icondarkurl VARCHAR(50),
    FOREIGN KEY (pageId) REFERENCES matches(pageId)
);

-- Table: tiers
CREATE TABLE tiers (
    pageId INT PRIMARY KEY,
    liquipediatier VARCHAR(50),
    publishertier VARCHAR(50),
    FOREIGN KEY (pageId) REFERENCES matches(pageId)
);

-- Table: links
CREATE TABLE links (
    pageId INT PRIMARY KEY,
    links BYTEA,
    FOREIGN KEY (pageId) REFERENCES matches(pageId)
);
