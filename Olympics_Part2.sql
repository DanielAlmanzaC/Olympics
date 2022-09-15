#6. Identify the sport which was played in all summer olympics.
WITH AGAMES AS
(SELECT DISTINCT GAMES, SPORT FROM Olympics.athlete_events ae 
WHERE SEASON = 'Summer'),
TOT_G AS
(SELECT SPORT, COUNT(1) AS Total_Games
FROM AGAMES GROUP BY SPORT)
SELECT *
FROM TOT_G
WHERE Total_Games = (SELECT COUNT(DISTINCT GAMES) FROM Olympics.athlete_events WHERE SEASON = 'Summer')
#Recordatorio que para el último where se tiene que hacer otra subquery, pues SQL no permite hacer Where con datos que se calculan durante el código.

#7. Which Sports were just played only once in the olympics.
WITH AGAMES AS
(SELECT DISTINCT GAMES, SPORT FROM Olympics.athlete_events ae 
WHERE SEASON = 'Summer'),
TOT_G AS
(SELECT SPORT, COUNT(1) AS Total_Games
FROM AGAMES GROUP BY SPORT)
SELECT *
FROM TOT_G
WHERE Total_Games = 1
ORDER BY SPORT
#Solo cambié el Where respecto al query anterior. En este caso sí se puede hacer así porque solo se está comparando con un número; no con el resultado de otro Select.

#8. Fetch the total no of sports played in each olympic games.
