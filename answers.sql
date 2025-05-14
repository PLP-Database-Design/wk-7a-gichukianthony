-- 1NF Transformation: Split multiple products into separate rows
SELECT 
    OrderID, 
    CustomerName, 
    TRIM(product) AS Product
FROM (
    SELECT 
        OrderID, 
        CustomerName, 
        UNNEST(STRING_TO_ARRAY(Products, ',')) AS product
    FROM ProductDetail
) AS normalized;
-- Orders table: remove partial dependency
SELECT DISTINCT 
    OrderID, 
    CustomerName
FROM OrderDetails;
-- OrderItems table: each product tied to an order
SELECT 
    OrderID, 
    Product, 
    Quantity
FROM OrderDetails;
