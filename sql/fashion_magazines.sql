-- Add your sql here
-- Select the two columns I want, CUSTOMER and Amount DUE
SELECT customers.customer_name AS 'Customer',

-- SUM function will take the price and months not paid for each customer and multiply to get a sum total for each customer.
   PRINTF('$%.2f', SUM(subscriptions.price_per_month * subscriptions.subscription_length)) AS 'Amount Due'

-- Orders will be the base table for all operations   
FROM orders

-- Join Customers and Subscriptions tables to orders where customer id and subscription id match
JOIN customers ON orders.customer_id = customers.customer_id
JOIN subscriptions ON orders.subscription_id = subscriptions.subscription_id

-- Restrict lits to where orders are unpaid and only for fashion magazines
WHERE orders.order_status = 'unpaid' 
  AND subscriptions.description = 'Fashion Magazine'

-- Group by must be used when intially defining my select with customer name and amount due. Use Customer Name as Group BY  
GROUP BY customers.customer_name;