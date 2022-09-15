#1. How many olympics games have been held?
SELECT COUNT(DISTINCT GAMES) FROM Olympics.athlete_events ae 

#2. List down all Olympics games held so far.
SELECT DISTINCT YEAR,SEASON,CITY FROM Olympics.athlete_events ae 
ORDER BY YEAR

#3. Mention the total no of nations who participated in each olympics game?
SELECT DISTINCT GAMES, COUNT(DISTINCT NOC) FROM Olympics.athlete_events ae 
GROUP BY GAMES

#4. Which year saw the highest and lowest no of countries participating in olympics
WITH COUNTRIES AS
(SELECT DISTINCT GAMES, COUNT(DISTINCT NOC) AS TCOUNTRIES FROM Olympics.athlete_events ae 
GROUP BY GAMES),  
COUNTRIES2 AS
(SELECT GAMES,MIN(TCOUNTRIES) AS MINC, MAX(TCOUNTRIES) AS MAXC FROM COUNTRIES
GROUP BY GAMES)
SELECT CONCAT(GAMES, '-', MINC) AS Lowest
FROM COUNTRIES2
ORDER BY MINC
LIMIT 1;
#FOR THIS ONE I WASN'T ABLE TO PUT THE HIGHEST ONE AT THE SAME TIME, IDK WHY
#CONCAT(GAMES, '-', MAXC) AS Highest 

#5. Which nation has participated in all of the olympic games
WITH TOT_GAMES AS
(SELECT COUNT(DISTINCT GAMES) AS Total_Games FROM Olympics.athlete_events),
COUNTRIES AS
(SELECT DISTINCT GAMES, nr.REGION AS COUNTRY FROM Olympics.athlete_events ae
JOIN Olympics.noc_regions nr ON nr.NOC = ae.NOC GROUP BY GAMES,nr.REGION),
COUNTRIES2 as
(SELECT COUNTRY, COUNT(1) as Total_Games
FROM COUNTRIES GROUP BY COUNTRY)
SELECT c.*
FROM COUNTRIES2 c
JOIN TOT_GAMES tg ON tg.Total_Games = c.Total_Games
ORDER BY 1;


