1. -- Create a new tables to store the 1NF compliant data

CREATE TABLE Orders (
  orderID INT PRIMARY KEY,
  customerName VARCHAR(100)
);

INSERT INTO Orders (orderID, customerName) VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');


CREATE TABLE Products (
  productID INT PRIMARY KEY AUTO_INCREMENT,
  productName VARCHAR(150)
);

INSERT INTO Products (productName) VALUES
('Laptop'),
('Mouse'),
('Tablet'),
('Keyboard'),
('Phone');



CREATE TABLE OrderItems (
  orderItemID INT PRIMARY KEY AUTO_INCREMENT,
  orderID INT,
  productID INT,
  FOREIGN KEY (orderID) REFERENCES Orders(orderID),
  FOREIGN KEY (productID) REFERENCES Products(productID)
);

-- John Doe ordered Laptop and Mouse
INSERT INTO OrderItems (orderID, productID) VALUES
(101, 1),  -- Laptop
(101, 2);  -- Mouse

-- Jane Smith ordered Tablet, Keyboard, Mouse
INSERT INTO OrderItems (orderID, productID) VALUES
(102, 3),  -- Tablet
(102, 4),  -- Keyboard
(102, 2);  -- Mouse

-- Emily Clark ordered Phone
INSERT INTO OrderItems (orderID, productID) VALUES
(103, 5);  -- Phone




-- 2. SQL query to transform table into 2NF by removing partial dependencies. 
-- Ensuring that each non-key column fully depends on the entire primary key.

-- (a) Create Orders table (no partial dependencies)
CREATE TABLE Orders (
  orderID INT PRIMARY KEY,
  customerName VARCHAR(100)
);

INSERT INTO Orders (orderID, customerName) VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');

-- (b) Create OrderDetails table (fully dependent on orderID + product)
CREATE TABLE OrderDetails (
  orderID INT,
  product VARCHAR(100),
  quantity INT,
  PRIMARY KEY (orderID, product),
  FOREIGN KEY (orderID) REFERENCES Orders(orderID)
);

INSERT INTO OrderDetails (orderID, product, quantity) VALUES
(101, 'Laptop', 2),
(101, 'Mouse', 1),
(102, 'Tablet', 3),
(102, 'Keyboard', 1),
(102, 'Mouse', 2),
(103, 'Phone', 1);
