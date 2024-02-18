-- Add your sql here
SELECT customers.customer_name AS 'Customer',
   SUM(subscriptions.price_per_month * subscriptions.subscription_length) AS 'Amount Due'
FROM orders
JOIN customers ON orders.customer_id = customers.customer_id
JOIN subscriptions ON orders.subscription_id = subscriptions.subscription_id
WHERE orders.order_status = 'unpaid' 
  AND subscriptions.description = 'Fashion Magazine'
GROUP BY customers.customer_name;