--Selecting first 20 rows of each table
SELECT * FROM stream 
LIMIT 20;
SELECT * FROM chat 
LIMIT 20;

--Selecting Unique game's in the stream table
SELECT DISTINCT game 
FROM stream;

--Selecting Unique channel's in the stream table
SELECT DISTINCT channel 
FROM stream;

--Selecting most popular games
SELECT game, COUNT(*) 
FROM stream 
GROUP BY 1 
ORDER BY 2 DESC;

--Selecting where LOL stream viewers are located
SELECT country, COUNT(*) 
FROM stream 
WHERE game = 'League of Legends' 
GROUP BY 1 
ORDER BY 2 DESC;

--Selecting players and their number of streamers
SELECT player, COUNT(*) 
FROM stream 
GROUP BY 1 
ORDER BY 2 DESC;

--Creating a new column named genre for each of the games.
  SELECT game,
  CASE
  WHEN game = 'Dota 2'
      THEN 'MOBA'
  WHEN game = 'League of Legends' 
      THEN 'MOBA'
  WHEN game = 'Heroes of the Storm'
      THEN 'MOBA'
    WHEN game = 'Counter-Strike: Global Offensive'
      THEN 'FPS'
    WHEN game = 'DayZ'
      THEN 'Survival'
    WHEN game = 'ARK: Survival Evolved'
      THEN 'Survival'
  ELSE 'Other'
  END AS 'genre',
  COUNT(*)
FROM stream
GROUP BY 1
ORDER BY 3 DESC;

--Selecting time column from stream
SELECT time
FROM stream
LIMIT 10;

--strftime takes two arguement(format, column)
SELECT time,
   strftime('%S', time)
FROM stream
GROUP BY 1
LIMIT 20;

SELECT strftime('%H', time),
   COUNT(*)
FROM stream
WHERE country = 'US'
GROUP BY 1;
--joining stream and chat using device_id
SELECT * FROM stream
JOIN chat
  ON stream.device_id = chat.device_id;