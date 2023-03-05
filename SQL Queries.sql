SELECT *
FROM olympic_games.dbo.athletes_event_results

------------------------------------------------------------------------------------------------------

SELECT *
FROM olympic_games.dbo.team_info

------------------------------------------------------------------------------------------------------

--- Distinct Ages for age group brackets

SELECT DISTINCT(Age)
FROM olympic_games.dbo.athletes_event_results
ORDER BY Age

-------------------------------------------------------------------------------------------------------

SELECT
	ID,
	Name AS "Competitor_Name",
CASE
	WHEN Sex = 'M' THEN 'Male'
	ELSE 'Female'
END AS Gender,
	Age,
CASE
	WHEN Age < 18 THEN 'Under 18'
	WHEN Age BETWEEN 18 AND 25 THEN '18 - 25'
	WHEN Age BETWEEN 25 AND 30 THEN '25 - 30'
	WHEN Age BETWEEN 30 AND 35 THEN '30 - 35'
	WHEN Age BETWEEN 40 AND 45 THEN '45 - 50'
	ELSE 'Over 50'
END AS Age_Grouping,
	Height, 
	Weight,
	LEFT(Games, CHARINDEX(' ', Games)-1) AS Year, -- Split column to isolate year based on space
	RIGHT(Games, CHARINDEX(' ', REVERSE(Games))-1) AS Season, -- Split column to isolate Season based on space
	NOC,
	Event,
	Sport,
	Event,
CASE
	WHEN Medal = 'NA' THEN 'Not Registered'
	ELSE Medal
END AS Medal
FROM olympic_games.dbo.athletes_event_results 