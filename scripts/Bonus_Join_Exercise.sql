--Question 1: Find the total worldwide gross and average imdb rating by decade. Then alter your query so it returns JUST the second highest average imdb rating and its decade. This should result in a table with just one row.

SELECT AVG(rev.worldwide_gross) AS wwg_avg
		, AVG(rat.imdb_rating) AS imdb_avg
		, s.release_year AS year
FROM revenue AS rev
RIGHT JOIN rating AS rat
	ON rev.movie_id=rat.movie_id
LEFT JOIN specs AS s
	ON rev.movie_id = s.movie_id
GROUP BY s.release_year
ORDER BY year DESC

--Answer:

/*Question 2: Our goal in this question is to compare the worldwide gross for movies compared to their sequels.   
	a.	Start by finding all movies whose titles end with a space and then the number 2.*/  
	
	--b.	For each of these movies, create a new column showing the original film’s name by removing the last two characters of the film title. For example, for the film “Cars 2”, the original title would be “Cars”.
	
	--c.	Bonus: This method will not work for movies like “Harry Potter and the Deathly Hallows: Part 2”, where the original title should be “Harry Potter and the Deathly Hallows: Part 1”. Modify your query to fix these issues.  
	
	--d.	Now, build off of the query you wrote for the previous part to pull in worldwide revenue for both the original movie and its sequel. Do sequels tend to make more in revenue? Hint: You will likely need to perform a self-join on the specs table in order to get the movie_id values for both the original films and their sequels. Bonus: A common data entry problem is trailing whitespace. In this dataset, it shows up in the film_title field, where the movie “Deadpool” is recorded as “Deadpool “. One way to fix this problem is to use the TRIM function. Incorporate this into your query to ensure that you are matching as many sequels as possible.

/*Question 3:	Sometimes movie series can be found by looking for titles that contain a colon. For example, Transformers: Dark of the Moon is part of the Transformers series of films.  
	
	a.	Write a query which, for each film will extract the portion of the film name that occurs before the colon. For example, “Transformers: Dark of the Moon” should result in “Transformers”.  If the film title does not contain a colon, it should return the full film name. For example, “Transformers” should result in “Transformers”. Your query should return two columns, the film_title and the extracted value in a column named series. Hint: You may find the split_part function useful for this task.*/
	
	--b.	Keep only rows which actually belong to a series. Your results should not include “Shark Tale” but should include both “Transformers” and “Transformers: Dark of the Moon”. Hint: to accomplish this task, you could use a WHERE clause which checks whether the film title either contains a colon or is in the list of series values for films that do contain a colon.  
	
	--c.	Which film series contains the most installments?  
	
	--d.	Which film series has the highest average imdb rating? Which has the lowest average imdb rating?

--Question 4:	How many film titles contain the word “the” either upper or lowercase? How many contain it twice? three times? four times?

--Question 5:	For each distributor, find its highest rated movie. Report the company name, the film title, and the imdb rating. 

--Question 6:	Follow-up: Another way to answer 5 is to use DISTINCT ON so that your query returns only one row per company.

--Question 7.	Which distributors had movies in the dataset that were released in consecutive years? For example, Orion Pictures released Dances with Wolves in 1990 and The Silence of the Lambs in 1991.

