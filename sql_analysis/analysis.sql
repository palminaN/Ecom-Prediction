USE Ecom;

SELECT * FROM olist_order_reviews_dataset LIMIT 10;

SELECT * FROM olist_orders_dataset LIMIT 10;

SELECT * FROM olist_products_dataset  LIMIT 10;

SELECT * FROM olist_order_items_dataset LIMIT 10;

SELECT * FROM olist_orders_dataset LIMIT 10;

SELECT * FROM product_category_name_translation  LIMIT 10;

SELECT * FROM olist_sellers_dataset LIMIT 10;

SELECT * FROM olist_order_payments_dataset LIMIT 10;

# Analysis of payment installments can be interesting

# Are Customers usually satisfied with their experience with the website
SELECT AVG(r.review_score) FROM olist_order_reviews_dataset as r;

# Which products categories sell the best
SELECT  tr.product_category_name_english, COUNT(*) AS "#sold" FROM  olist_products_dataset as p 
JOIN product_category_name_translation as tr ON p.product_category_name = tr.product_category_name 
RIGHT JOIN olist_order_items_dataset o on p.product_id = o.product_id
GROUP BY product_category_name_english ORDER BY COUNT(*) DESC; 

# Which category made  money (modification required)
SELECT  tr.product_category_name_english, COUNT(*) AS "#sold" FROM  olist_products_dataset as p 
JOIN product_category_name_translation as tr ON p.product_category_name = tr.product_category_name 
RIGHT JOIN olist_order_items_dataset o on p.product_id = o.product_id
GROUP BY product_category_name_english ORDER BY COUNT(*) DESC; 

# average quantity bought for each product
WITH order_products_quantity AS ( SELECT p.product_id, o.order_id, COUNT(*) AS quantity, tr.product_category_name_english FROM  olist_products_dataset as p 
JOIN product_category_name_translation as tr ON p.product_category_name = tr.product_category_name 
RIGHT JOIN olist_order_items_dataset o on p.product_id = o.product_id
GROUP BY product_id, o.order_id)
SELECT * FROM order_products_quantity LIMIT 10;

# Which sellers have bad reviews 

# How many orders each month in 2017