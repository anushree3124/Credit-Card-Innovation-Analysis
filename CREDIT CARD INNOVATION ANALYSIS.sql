-- CREATING DATABASE
CREATE DATABASE MITRON_BANK;

-- DEFAULT DATABASE
USE MITRON_BANK;

-- CREATING TABLE
CREATE TABLE fact_spends(customer_id varchar(100),
                         month char(100),
                         category char(100),
                         payment_type char(100),
                         spend int)
                         
SELECT * FROM dim_customers;
SELECT * FROM fact_spends;

-- DEMOGRAPHIC CLASSIFICATION
-- BASED ON GENDER
SELECT gender,
       COUNT(customer_id) AS customer_count
FROM dim_customers
GROUP BY 1
ORDER BY 2 DESC;
     
-- BASED ON AGE GROUP
SELECT age_group,
       COUNT(customer_id) AS customer_count
FROM dim_customers
GROUP BY 1
ORDER BY 2 DESC;

-- BASED ON OCCUPATION
SELECT occupation,
       COUNT(customer_id) AS customer_count
FROM dim_customers
GROUP BY 1
ORDER BY 2 DESC;

-- BASED ON CITY
SELECT city,
       COUNT(customer_id) AS customer_count
FROM dim_customers
GROUP BY 1
ORDER BY 2 DESC;

-- BASED ON MARITAL STATUS
SELECT `marital status`,
       COUNT(customer_id) AS customer_count
FROM dim_customers
GROUP BY 1
ORDER BY 2 DESC;

-- CUSTOMER SPENDING ANALYSIS 
-- BASED ON GENDER:-
SELECT 
      gender, 
      SUM(spend) as total_spend
FROM dim_customers C 
JOIN fact_spends S ON C.customer_id=S.customer_id
GROUP BY 1
ORDER BY 2 DESC;

-- BASED ON AGE-GROUP:-
SELECT age_group, SUM(spend) as total_spend
FROM dim_customers C 
JOIN fact_spends S 
ON C.customer_id=S.customer_id
GROUP BY 1
ORDER BY 2 DESC;

-- BASED ON MARITAL_STATUS:-
SELECT `marital status`, 
      SUM(spend) as total_spend
FROM dim_customers C JOIN fact_spends S 
ON C.customer_id=S.customer_id
GROUP BY 1
ORDER BY 2 DESC;

-- MONTHLY SPENDING ANALYSIS:-
SELECT month, SUM(spend) as total_spend
FROM fact_spends
GROUP BY 1
ORDER BY 2 DESC;

-- REGIONAL SPENDING PATTERNS:-
SELECT city, SUM(spend) as total_spend
FROM dim_customers C 
JOIN fact_spends S 
ON C.customer_id=S.customer_id
GROUP BY 1
ORDER BY 2 DESC;

-- OCCUPATION INFLUENCE ON SPENDING:-
SELECT occupation, 
	  SUM(spend) as total_spend
FROM dim_customers C 
JOIN fact_spends S 
ON C.customer_id=S.customer_id
GROUP BY 1
ORDER BY 2 DESC;

-- CATEGORY SPENDING PATTERNS:-
SELECT category, SUM(spend) as total_spend
FROM fact_spends
GROUP BY 1
ORDER BY 2 DESC;

-- PAYMENT TYPE SPENDING PATTERNS:-
SELECT payment_type, SUM(spend) as total_spend
FROM fact_spends
GROUP BY 1
ORDER BY 2 DESC;

-- AVERAGE INCOME UTILIZATION
-- BASED ON CUSTOMER
SELECT
    c.customer_id,
    ROUND((avg(spend) / avg(c.avg_income))*100,2) AS spending_ratio
FROM dim_customers c
JOIN fact_spends s ON c.customer_id = s.customer_id
GROUP BY 1, c.avg_income
ORDER BY 2 DESC
limit 10;

-- BASED ON AGE GROUP
SELECT c.age_group,
       ROUND((avg(spend) / avg(c.avg_income))*100,2) AS spending_ratio
FROM dim_customers c
JOIN fact_spends s 
ON c.customer_id = s.customer_id
GROUP BY c.age_group
ORDER BY 2 DESC;

-- BASED ON CITY
SELECT c.city,
      ROUND((avg(spend) / avg(c.avg_income))*100,2) AS spending_ratio
FROM dim_customers c
JOIN fact_spends s 
ON c.customer_id = s.customer_id
GROUP BY c.city
ORDER BY 2 DESC;

-- BASED ON OCCUPATION
SELECT c.occupation,
       ROUND((avg(spend) / avg(c.avg_income))*100,2) AS spending_ratio
FROM dim_customers c
JOIN fact_spends s 
ON c.customer_id = s.customer_id
GROUP BY c.occupation
ORDER BY 2 DESC;

-- BASED ON GENDER
SELECT c.gender,
       ROUND((avg(spend) / avg(c.avg_income))*100,2) AS spending_ratio
FROM dim_customers c
JOIN fact_spends s 
ON c.customer_id = s.customer_id
GROUP BY c.gender
ORDER BY 2 DESC;

-- BASED ON MARITAL STATUS
SELECT `marital status`,
        ROUND((avg(spend) / avg(c.avg_income))*100,2) AS spending_ratio
FROM dim_customers c
JOIN fact_spends s ON c.customer_id = s.customer_id
GROUP BY `marital status`
ORDER BY 2 DESC;





