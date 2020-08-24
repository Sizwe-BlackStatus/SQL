SELECT * FROM CUSTOMERS;

SELECT firstname FROM Customers;

SELECT firstname from Customers WHERE CustomerID = 1;

UPDATE customers
SET firstname = 'Lerato',
    lastname = 'Mabitso'
WHERE CustomerId = 1;

DELETE FROM customers WHERE CustomerID = 2;

SELECT COUNT (DISTINCT Status)
  FROM orders;

SELECT MAX(amount_r)
FROM payments;

SELECT *
FROM customers
ORDER BY country;

SELECT ProductName 
from products 
WHERE BuyPrice_r BETWEEN '100' AND '600';

SELECT * FROM customers 
WHERE country = 'Germany' and city = 'Berlin';

SELECT * FROM customers 
WHERE city = 'Cape Town' or city = 'Durban';

SELECT * FROM products WHERE BuyPrice_r > '500';

SELECT SUM (amount_r) AS total
FROM payments;

SELECT COUNT (Status)
FROM orders 
WHERE Status = 'Shipped';

SELECT 'Rands:R' || AVG(buyprice_r)::numeric(5,2),
'Dollar:$' || AVG(buyprice_r/12)::numeric(5,2)
FROM products;

SELECT *
FROM payments
INNER JOIN customers USING(customerid)
ORDER BY paymentdate;

SELECT * FROM products
WHERE description LIKE '%Turnable front Wheels%';
