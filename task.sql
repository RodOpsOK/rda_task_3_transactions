-- Use our database
USE ShopDB; 

-- Some data should be created outside the transaction (here)
INSERT INTO Orders (CustomerID, Date) 
VALUES (1, '2023-01-01');

SET @order_count = 1;

-- Start the transaction 
START TRANSACTION; 

-- And some data should be created inside the transaction
INSERT INTO OrderItems (OrderID, ProductID, Count) 
VALUES (LAST_INSERT_ID(), 1, @order_count);

UPDATE Products 
SET WarehouseAmount = WarehouseAmount - @order_count 
WHERE ID = 1;

COMMIT;
