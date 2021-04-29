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
