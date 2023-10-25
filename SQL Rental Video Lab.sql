Use sakila;
-- 1.1 Determine the shortest and longest movie durations and name the values as max_duration and min_duration.
select max(length) from film;
select min(length) from film;
-- 1.2. Express the average movie duration in hours and minutes. Don't use decimals. Hint: Look for floor and round functions.
select round(avg(length)) DIV 60 AS hours,
round(avg(length)) MOD 60 AS minutes from film;
-- 2.1 Calculate the number of days that the company has been operating.
-- Hint: To do this, use the rental table, and the DATEDIFF() function to subtract the earliest date in the rental_date column from the latest date.
select max(rental_date) from rental;
select min(rental_date) from rental;
SELECT DATEDIFF(MAX(rental_date), MIN(rental_date)) AS open_days
FROM rental;
-- 2.2 Retrieve rental information and add two additional columns to show the month and weekday of the rental. Return 20 rows of results.
select rental_date from rental;

-- Retrieve the film titles and their rental duration. If any rental duration value is NULL, replace it with the string 'Not Available'. Sort the results of the film title in ascending order.
select title, IFNULL(rental_duration, 'Not Available') AS rental_duration FROM film;

-- 2.3 Bonus: Retrieve rental information and add an additional column called DAY_TYPE with values 'weekend' or 'workday', depending on the day of the week.
-- Hint: use a conditional expression.


Select dayofweek(rental_date) AS day_of_week;
ALTER TABLE rental
ADD COLUMN day_type INT;
SET day_type = 
    CASE 
        WHEN (day_of_week = 1) THEN 'Weekend' -- Assign a value if previous_column is 'value1'
        WHEN (day_of_week = 7) THEN 'Weekend'
        ELSE 'Workday' -- Assign a default value for other cases
    END;



-- 1.1 The total number of films that have been released.
 Select distinct Count(title) from film;
 
-- 1.2 The number of films for each rating.
-- 1.3 The number of films for each rating, sorting the results in descending order of the number of films. This will help you to better understand the popularity of different film ratings and adjust purchasing decisions accordingly.

Select rating, COUNT(rating) AS quantity
From film
group by rating
order by quantity desc;

-- 2.1 The mean film duration for each rating, and sort the results in descending order of the mean duration. 
-- Round off the average lengths to two decimal places. 
-- This will help identify popular movie lengths for each category.

Select rating, COUNT(rating) AS quantity
From film
group by rating
order by quantity desc;

-- 2.2 Identify which ratings have a mean duration of over two hours.

select rating, round(avg(length),2) AS avg_length
from film group by rating;

select rating, round(avg(length),2) AS avg_length
from film group by rating
having avg_length > 120;


