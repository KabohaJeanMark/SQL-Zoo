/* SELECT basics and quiz answers*/

SELECT population FROM world
  WHERE name = 'Germany';

SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway', 'Denmark');

SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000;

SELECT name, population
  FROM world
 WHERE population BETWEEN 1000000 AND 1250000;


Table-E
Albania	3200000
Algeria	32900000


SELECT name FROM world
 WHERE name LIKE '%a' OR name LIKE '%l';

name	length(name)
Italy	5
Malta	5
Spain	5

Andorra	936

SELECT name, area, population
  FROM world
 WHERE area > 50000 AND population < 10000000;


SELECT name, population/area
  FROM world
 WHERE name IN ('China', 'Nigeria', 'France', 'Australia');

/* SELECT FROM WORLD TUTORIAL */
SELECT name, continent, population FROM world;

SELECT name
  FROM world
 WHERE population >= 200000000;

SELECT name, gdp/population AS PerCapitaGDP
FROM world
WHERE population <= 200000000;

SELECT name, population/1000000 AS PopulationInMillions
FROM world
WHERE continent = 'South America';

SELECT name, population
FROM world
WHERE name in ('France', 'Germany', 'Italy');

SELECT name 
FROM world
WHERE name LIKE '%United%';

SELECT name, population, area
FROM world
WHERE area > 3000000 OR population > 250000000;

/* XOR Exclusive OR */
SELECT name, population, area
FROM world
WHERE (area > 3000000 AND population <= 250000000)
OR (area <= 3000000 AND population > 250000000);

SELECT name, ROUND(population/1000000,2), ROUND(gdp/1000000000, 2)
FROM world
WHERE continent = 'South America';

/* rounded off to nearest 1000 by using -3 https://sqlzoo.net/wiki/ROUND */
SELECT name, ROUND(gdp/population, -3) AS PerCapitaGDP
FROM world
WHERE gdp >= 1000000000000;

SELECT name, capital
  FROM world
 WHERE LEN(name) = LEN(capital);

SELECT name,capital
FROM world
WHERE LEFT(name,1) = LEFT(capital, 1) AND name != capital;

SELECT name
FROM world
WHERE 
name LIKE '%a%'
AND name LIKE '%e%'
AND name LIKE '%i%'
AND name LIKE '%o%'
AND name LIKE '%u%'
AND name NOT LIKE '% %';

/* BBC QUIZ ANSWERS */
SELECT name
  FROM world
 WHERE name LIKE 'U%'

SELECT population
  FROM world
 WHERE name = 'United Kingdom'

'name' should be name


Nauru	9

SELECT name, population
  FROM world
 WHERE continent IN ('Europe', 'Asia')90

SELECT name FROM world
 WHERE name IN ('Cuba', 'Togo')


Brazil
Colombia

/* SELECT NOBEL PRIZE TUTORIAL*/
SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950;

SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'Literature';

SELECT yr, subject
FROM nobel
WHERE winner = 'Albert Einstein';

SELECT winner
FROM nobel
WHERE subject = 'peace' AND yr >= 2000;

SELECT *
FROM nobel
WHERE subject = 'Literature' AND  yr <= 1989 AND yr >= 1980;

SELECT * FROM nobel
WHERE winner IN 
('Theodore Roosevelt',
'Woodrow Wilson',
'Jimmy Carter',
'Barack Obama');

SELECT winner 
FROM nobel
WHERE winner LIKE 'John%';

SELECT yr, subject, winner
FROM nobel
WHERE (subject = 'Physics' AND yr = 1980)
OR (subject = 'Chemistry' AND yr = 1984);

SELECT yr, subject, winner
FROM nobel
WHERE yr = 1980 AND subject NOT IN ('Chemistry', 'Medicine');

SELECT yr, subject, winner
FROM nobel
WHERE (yr < 1910 AND subject = 'Medicine')
OR (yr >= 2004 AND subject = 'Literature');

SELECT * 
FROM nobel
WHERE winner LIKE '%PETER GR%';

SELECT * 
FROM nobel
WHERE winner = 'EUGENE O''NEILL';

SELECT winner, yr, subject
FROM nobel
WHERE winner LIKE 'Sir%' ORDER BY yr DESC, winner;

SELECT winner, subject
  FROM nobel
 WHERE yr=1984
 ORDER BY subject IN ('Physics','Chemistry'), subject, winner

/* Nobel quiz */

SELECT winner FROM nobel
 WHERE winner LIKE 'C%' AND winner LIKE '%n'

SELECT COUNT(subject) FROM nobel
 WHERE subject = 'Chemistry'
   AND yr BETWEEN 1950 and 1960

SELECT COUNT(DISTINCT yr) FROM nobel
 WHERE yr NOT IN (SELECT DISTINCT yr FROM nobel WHERE subject = 'Medicine')


Medicine	Sir John Eccles
Medicine	Sir Frank Macfarlane Burnet


SELECT yr FROM nobel
 WHERE yr NOT IN(SELECT yr 
                   FROM nobel
                 WHERE subject IN ('Chemistry','Physics'))

SELECT DISTINCT yr
  FROM nobel
 WHERE subject='Medicine' 
   AND yr NOT IN(SELECT yr FROM nobel 
                  WHERE subject='Literature')
   AND yr NOT IN (SELECT yr FROM nobel
                   WHERE subject='Peace')
            

Chemistry	1
Literature	1
Medicine	2
Peace	1
Physics	1

SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia');

SELECT name 
FROM world
WHERE continent='Europe' AND gdp/population > (SELECT gdp/population 
FROM world
WHERE name='United Kingdom');

SELECT name, continent
FROM world
WHERE continent IN (
SELECT continent
FROM world
WHERE name IN ('Argentina', 'Australia')
)
ORDER BY name;

SELECT name, population
FROM world
WHERE population > (
SELECT population 
FROM world
WHERE name = 'Canada'
)
AND population < (
SELECT population 
FROM world
WHERE name = 'Poland');

SELECT name,
CONCAT(
  ROUND(
    100*population/
         (SELECT population FROM world WHERE name = 'Germany')
  ,0)
,'%')
FROM world
WHERE continent = 'Europe';

SELECT name FROM world
WHERE gdp >
(SELECt MAX(gdp) FROM world WHERE continent = 'Europe');

SELECT continent, name, area FROM world x
  WHERE area >= ALL
    (SELECT area FROM world y
        WHERE y.continent=x.continent
          AND area>0);

SELECT continent, name FROM world x
  WHERE name <= ALL
    (SELECT name FROM world y
        WHERE y.continent=x.continent
          AND area>0);

SELECT name, continent, population FROM world x
  WHERE 25000000>=ALL (SELECT population FROM world y
                         WHERE x.continent=y.continent
                         AND population>0);

SELECT name,continent FROM world x
WHERE population >= ALL(
SELECT population*3
FROM world y
WHERE x.continent = y.continent
AND x.name <> y.name  
);

SELECT region, name, population FROM bbc x WHERE population <= ALL (SELECT population FROM bbc y WHERE y.region=x.region AND population>0);

SELECT name,region,population FROM bbc x WHERE 50000 < ALL (SELECT population FROM bbc y WHERE x.region=y.region AND y.population>0);

SELECT name, region FROM bbc x
 WHERE population < ALL (SELECT population/3 FROM bbc y WHERE y.region = x.region AND y.name != x.name);

Table-D
France
Germany
Russia
Turkey

SELECT name FROM bbc
 WHERE gdp > (SELECT MAX(gdp) FROM bbc WHERE region = 'Africa');

 SELECT name FROM bbc
 WHERE population < (SELECT population FROM bbc WHERE name='Russia')
   AND population > (SELECT population FROM bbc WHERE name='Denmark');

   Table-B
Bangladesh
India
Pakistan
