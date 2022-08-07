create database olympics;

SELECT * FROM olympics.`my_olympics_data_31-05-2022`;

ALTER TABLE `my_olympics_data_31-05-2022` 
			CHANGE 
					Date_Given Participation_Date date;

ALTER TABLE `Olympics` RENAME TO OlympicsData;

SELECT * FROM OlympicsData;

/* 1) Find the average number of medals won by each country */

SELECT 
    ROUND(AVG(total_medal)), country
FROM
    OlympicsData
GROUP BY country;

/* Observations : 
By using aggregate function "avg(average)" function we can able to find the average number of medals won
and to obtain by each country we have use "GROUP BY" function as above. */ 


/* 2) Display the countries and the number of gold medals they have won in decreasing order */

SELECT 
    country, SUM(gold_medal) AS Total_No_of_Gold_Medals
FROM
    OlympicsData
GROUP BY (country)
ORDER BY Total_No_of_Gold_Medals DESC;

/* Observations :- 
To obtain the no.of gold medals by each country, we have to use Gold_medal column and country column.
We have to use "group by" function to country to get seggregate by each country with out repetation.
And as per our requirement to get the result in descending order on total no.of gold medals we have "desc(descending) function 

So, United states got highest no.of Gold Medals and china got 2nd highest */ 

/* 3) Display the list of people and the medals they have won in descending order, grouped by their country */

SELECT 
    name, country, sum(total_medal) AS Total_No_of_Medals
FROM
    OlympicsData
GROUP BY (country)
ORDER BY Total_No_of_Medals DESC;

/* Observations :-
We have athelets who won and not won medals in Olympic games.
So, we need to get the Athelets names with their Total no.of medals got we have to take name and country columns from the table.
As asked We should group by "country" to get the desired output
And we have to use aggregate function sum on total medal column to get the total no.of medals by an athelete according their country.

So, as per the result Michael Phelps from United States got the highest no.of medals.  */ 

/* 4) Display the list of people with the medals they have won according to their their age */

SELECT 
    name, country, age, sum(total_medal) AS Total_No_of_Medals
FROM
    OlympicsData
GROUP BY (age)
ORDER BY Total_No_of_Medals DESC;

/* Observations :- 
We have different athelets from different countries with different ages participated in games.
The data given on Olympics games are conducted in different years, so we have many atheletes who are participated again and their ages will be differ accordingly.

So, accroding to the Athelete age we can able to find the total no.of medals he/she got.

To find that I have used name,age and total_medal columns.
Which is grouped by their age and sum by total medals to get the total no.of medals and ordered by descending order
 */ 

/* 5) Which country has won the most number of medals (cumulative) */

SELECT 
    country,
    SUM(total_medal) AS Cumulative_No_of_Medals_by_Each_Country
FROM
    OlympicsData
GROUP BY country
ORDER BY Cumulative_No_of_Medals_by_Each_Country DESC;

/* Observations :- The country called United States own the Highest no.of Medals,which is a cumulative result. */ 






