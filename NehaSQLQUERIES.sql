
/*
    Neha Singh
   Furniture Company SQL QUERIES
    
    */
--1. Contents of Table Customber in order by customer name.

SELECT * FROM CUSTOMER
            ORDER BY NAME;

--2. Information for each customer in New York, ordered by customer ID.
SELECT * FROM CUSTOMER
        WHERE STATE='NY'
            ORDER BY CUSTOMERID;
            
 --3. The names of all customers with the word 'Furniture' anywhere in their name.
SELECT NAME FROM CUSTOMER
        WHERE NAME Like '%Furniture%';
        
        
 --4. The name, city and state for all customers in California and in Florida
SELECT NAME, CITY, STATE FROM CUSTOMER
    WHERE (STATE = 'CA') or (STATE='FL')
    ORDER BY STATE;       
           
--5. All states that appear in the table, in alphabetical order, with duplicates removed.

SELECT STATE FROM CUSTOMER
        GROUP BY STATE
        ORDER BY STATE; 
        
 --6. (ON THE PRODUCT TABLE) The description, material and price of each product in the table, sorted alphabetically by
description, and price from high to low.

SELECT DESCRIPTION, MATERIAL, PRICE
            FROM PRODUCT
            ORDER BY DESCRIPTION, PRICE DESC;   
            
--7.(ORDERTABLE) Show, for each date, the date and how many orders were placed on that date.  Sort from oldest to newest orders

SELECT ORDERDATE, QUANTITY
    FROM ORDERTABLE INNER JOIN ORDERLINE ON ORDERTABLE.ORDERID=ORDERLINE.ORDERID
    ORDER BY ORDERDATE;

--8.  Show, for each order ID, the order ID and total amount of items requested in that order. Sort from smallest to largest amount

        SELECT SUM(QUANTITY), ORDERID
FROM ORDERLINE
GROUP BY ORDERID
ORDER BY SUM(QUANTITY) ASC;

--9. For each order ID, show the order ID together with the name, city and zip code of the customer who placed the order. Sort the output by the order ID. (Hint: Do the appropriate join of CUSTOMER and ORDERTABLE first, then work on the display and sorting.)

SELECT NAME, CITY, ZIP, ORDERID
FROM ORDERTABLE LEFT OUTER JOIN CUSTOMER ON ORDERTABLE.CUSTOMERID= CUSTOMER.CUSTOMERID
ORDER BY ORDERID;

--10. For each product ID, show the product ID together with the total amount of that product that was ordered over all of the orders. Be sure to include products that no one ordered in your output too . Sort the output by product ID.        
           
SELECT O.PRODUCTID, SUM(QUANTITY)
FROM ORDERLINE O LEFT OUTER JOIN PRODUCT P ON O.PRODUCTID=P.PRODUCTID
GROUP BY O.PRODUCTID;

