-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 15, 2022 at 05:26 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `opd`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `categorieId` int(12) NOT NULL,
  `categorieName` varchar(255) NOT NULL,
  `categorieDesc` text NOT NULL,
  `categorieCreateDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`categorieId`, `categorieName`, `categorieDesc`, `categorieCreateDate`) VALUES
(23, 'Grocery', 'All Grocery Items In Kitchen', '2022-02-06 16:35:23'),
(24, 'Baby & Mother Care', 'Mothercare Online Sale offers wide range of discounted deals on kids clothing, baby clothing, baby t-shirt, baby beds, etc', '2022-02-06 16:38:15'),
(25, 'Household Products', 'The best household items and household appliances make the home comfortable.', '2022-02-06 16:39:51'),
(26, 'Stationery', 'Buy stationery items at great price from sn mart', '2022-02-06 16:41:45'),
(27, 'Personal Care', 'We have a huge variety of over the counter Personal Care products at best price.', '2022-02-06 16:43:50'),
(28, 'Kitchen Care Essentials', 'Buy all the KITCHEN CARE ESSENTIALS products online from carttray.com at low price, and get a free home delivery on order above 499', '2022-02-06 16:45:09'),
(29, 'Winter Care', 'Oxyglow Herbals Winter Care Cold Cream For All Type Of Skin |Sunflower Oil, Almond Oil, Coconut Extract, Glycerin, Carrot Extract And Aloe Vera Extract ', '2022-02-06 16:46:15'),
(30, 'Covid Essentials', 'Essential products at home during COVID-19 pandemic Dry cough Fever Tiredness Sore throat Breathlessness Loss of smell and taste', '2022-02-06 16:47:10');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `contactId` int(21) NOT NULL,
  `userId` int(21) NOT NULL,
  `email` varchar(35) NOT NULL,
  `phoneNo` bigint(21) NOT NULL,
  `orderId` int(21) NOT NULL DEFAULT 0 COMMENT 'If problem is not related to the order then order id = 0',
  `message` text NOT NULL,
  `time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`contactId`, `userId`, `email`, `phoneNo`, `orderId`, `message`, `time`) VALUES
(1, 2, 'abu@gmail.com', 7083420331, 0, 'heyyy.. im getting problem', '2022-02-06 16:17:09'),
(2, 9, 'hema@gmail.com', 1234567890, 0, 'hiissss', '2022-02-13 22:33:22');

-- --------------------------------------------------------

--
-- Table structure for table `contactreply`
--

CREATE TABLE `contactreply` (
  `id` int(21) NOT NULL,
  `contactId` int(21) NOT NULL,
  `userId` int(23) NOT NULL,
  `message` text NOT NULL,
  `datetime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contactreply`
--

INSERT INTO `contactreply` (`id`, `contactId`, `userId`, `message`, `datetime`) VALUES
(1, 1, 2, 'okkk...', '2022-02-06 16:17:54');

-- --------------------------------------------------------

--
-- Table structure for table `deliverydetails`
--

CREATE TABLE `deliverydetails` (
  `id` int(21) NOT NULL,
  `orderId` int(21) NOT NULL,
  `deliveryBoyName` varchar(35) NOT NULL,
  `deliveryBoyPhoneNo` bigint(25) NOT NULL,
  `deliveryTime` int(200) NOT NULL COMMENT 'Time in minutes',
  `dateTime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `deliverydetails`
--

INSERT INTO `deliverydetails` (`id`, `orderId`, `deliveryBoyName`, `deliveryBoyPhoneNo`, `deliveryTime`, `dateTime`) VALUES
(1, 1, 'pappu', 7083420331, 6, '2022-02-06 17:47:45');

-- --------------------------------------------------------

--
-- Table structure for table `orderitems`
--

CREATE TABLE `orderitems` (
  `id` int(21) NOT NULL,
  `orderId` int(21) NOT NULL,
  `pizzaId` int(21) NOT NULL,
  `itemQuantity` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orderitems`
--

INSERT INTO `orderitems` (`id`, `orderId`, `pizzaId`, `itemQuantity`) VALUES
(1, 1, 38, 4),
(2, 1, 39, 2),
(3, 1, 40, 1),
(4, 1, 75, 2),
(5, 1, 78, 1),
(6, 1, 77, 1),
(7, 2, 37, 3),
(8, 2, 38, 2),
(9, 2, 69, 1),
(10, 3, 37, 1),
(11, 3, 38, 1),
(12, 3, 39, 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orderId` int(21) NOT NULL,
  `userId` int(21) NOT NULL,
  `address` varchar(255) NOT NULL,
  `zipCode` int(21) NOT NULL,
  `phoneNo` bigint(21) NOT NULL,
  `amount` int(200) NOT NULL,
  `paymentMode` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0=cash on delivery, \r\n1=online ',
  `orderStatus` enum('0','1','2','3','4','5','6') NOT NULL DEFAULT '0' COMMENT '0=Order Placed.\r\n1=Order Confirmed.\r\n2=Preparing your Order.\r\n3=Your order is on the way!\r\n4=Order Delivered.\r\n5=Order Denied.\r\n6=Order Cancelled.',
  `orderDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`orderId`, `userId`, `address`, `zipCode`, `phoneNo`, `amount`, `paymentMode`, `orderStatus`, `orderDate`) VALUES
(1, 2, 'FL-B/2 SN-147/2/4/6 UJWALDEEP APT GARMAL DHAYARI PUNE 411041, driving sch', 411041, 7083420331, 1473, '0', '3', '2022-02-06 17:46:33'),
(2, 7, 'FL-B/2 SN-147/2/4/6 UJWALDEEP APT GARMAL DHAYARI PUNE 411041, driving sch', 411041, 7083420331, 197, '0', '0', '2022-02-11 21:25:10'),
(3, 9, 'zzz, zzz', 411251, 9860897643, 105, '0', '0', '2022-02-13 22:35:30');

-- --------------------------------------------------------

--
-- Table structure for table `pizza`
--

CREATE TABLE `pizza` (
  `pizzaId` int(12) NOT NULL,
  `pizzaName` varchar(255) NOT NULL,
  `pizzaPrice` int(12) NOT NULL,
  `pizzaDesc` text NOT NULL,
  `pizzaCategorieId` int(12) NOT NULL,
  `pizzaPubDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pizza`
--

INSERT INTO `pizza` (`pizzaId`, `pizzaName`, `pizzaPrice`, `pizzaDesc`, `pizzaCategorieId`, `pizzaPubDate`) VALUES
(37, 'Lipton Ice Tea', 25, ' 250ml', 23, '2021-03-17 22:12:53'),
(38, 'Mirinda', 35, '500ml', 23, '2021-03-17 22:13:38'),
(39, 'PEPSI BLACK CAN', 45, 'PEPSI BLACK CAN', 23, '2021-03-17 22:14:24'),
(40, 'Pepsi', 52, '500ml', 23, '2021-03-17 22:16:29'),
(53, 'Packaged Drinking Water', 20, 'Drinking Water	', 23, '2021-03-18 08:20:40'),
(69, 'Rajdhani Papad 200Gm', 52, '200gm', 23, '2022-02-06 16:57:13'),
(70, 'Rajdhani Poha 500Gm', 39, '500gm', 23, '2022-02-06 16:58:20'),
(71, 'Mdh Masala - Shahi Paneer 100 G', 68, 'Shahi Paneer 100 G', 23, '2022-02-06 17:00:50'),
(72, 'Catch Amchur (Dry Mango)Powder 100Gm', 60, '100Gm', 23, '2022-02-06 17:02:23'),
(73, 'Catch Chicken Masala 100Gm', 56, '100gm', 23, '2022-02-06 17:03:02'),
(75, 'Kelloggs Chocos 385gm', 170, '385gm', 23, '2022-02-06 17:06:53'),
(76, 'Saffola Masala Oats Veggie Twist-500gm', 177, '500gm', 23, '2022-02-06 17:09:03'),
(77, 'Farlin Baby Clothing Detergent -1000Ml', 468, '1000Ml', 24, '2022-02-06 17:36:01'),
(78, 'Chicco Baby Body Lotion -500ml', 383, '500ml', 24, '2022-02-06 17:36:55'),
(79, 'Olemessa Baby Soap- 75gm', 43, '75gm', 24, '2022-02-06 17:37:57'),
(80, 'Pigeon Baby Diaper Pants S- 40', 399, 'S- 40', 24, '2022-02-06 17:38:48'),
(81, 'Duracell Ultra AA6 (Pack of 6) Battery', 207, 'Pack of 6', 25, '2022-02-06 17:40:18'),
(82, 'Omnigel- 20gm', 71, '20gm', 25, '2022-02-06 17:41:05'),
(83, 'Oral-B Pro Health Sensitive Toothbrush- 1', 56, 'Toothbrush- 1', 25, '2022-02-06 17:41:59'),
(84, 'Mothercare All We Know Baby Body Wash- 300ml', 303, '300ml', 25, '2022-02-06 17:44:15');

-- --------------------------------------------------------

--
-- Table structure for table `sitedetail`
--

CREATE TABLE `sitedetail` (
  `tempId` int(11) NOT NULL,
  `systemName` varchar(21) NOT NULL,
  `email` varchar(35) NOT NULL,
  `contact1` bigint(21) NOT NULL,
  `contact2` bigint(21) DEFAULT NULL COMMENT 'Optional',
  `address` text NOT NULL,
  `dateTime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sitedetail`
--

INSERT INTO `sitedetail` (`tempId`, `systemName`, `email`, `contact1`, `contact2`, `address`, `dateTime`) VALUES
(1, 'Smart Bazaar', 'shubhamnivangune16@gmail.com', 7083420332, 7083420332, 'pune', '2021-03-23 19:56:25');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(21) NOT NULL,
  `username` varchar(21) NOT NULL,
  `firstName` varchar(21) NOT NULL,
  `lastName` varchar(21) NOT NULL,
  `email` varchar(35) NOT NULL,
  `phone` bigint(20) NOT NULL,
  `userType` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0=user\r\n1=admin',
  `password` varchar(255) NOT NULL,
  `joinDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `firstName`, `lastName`, `email`, `phone`, `userType`, `password`, `joinDate`) VALUES
(1, 'admin', 'admin', 'admin', 'admin@gmail.com', 1111111111, '1', '$2y$10$7IZbSvNik.5zPrrNYzGdO.a3H4oXQMdIL6KhnNnu5MQwMoI1xedgm', '2021-04-11 11:40:58'),
(6, 'shubham', 'shubham', 'nivangune', 'shubham@gmail.com', 7083420331, '0', '$2y$10$OXG/AUl4zkDVIrpi6ubFoeCu0Wvc4SsxdLYMuwuXNoW3R4lGPT0ra', '2022-02-11 21:15:46'),
(8, 'hey', 'hey', 'hey', 'hey@gmail.com', 9860897643, '0', '$2y$10$7IZbSvNik.5zPrrNYzGdO.a3H4oXQMdIL6KhnNnu5MQwMoI1xedgm', '2022-02-13 22:17:05'),
(9, 'hema', 'hema', 'hema', 'hema@gmail.com', 1234567890, '0', '$2y$10$/8Oso.9zIXEyWNFASiJxaO8Q5z2CkXzs/MX7WfijAQLO3KjmhV4om', '2022-02-13 22:32:55');

-- --------------------------------------------------------

--
-- Table structure for table `viewcart`
--

CREATE TABLE `viewcart` (
  `cartItemId` int(11) NOT NULL,
  `pizzaId` int(11) NOT NULL,
  `itemQuantity` int(100) NOT NULL,
  `userId` int(11) NOT NULL,
  `addedDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `viewcart`
--

INSERT INTO `viewcart` (`cartItemId`, `pizzaId`, `itemQuantity`, `userId`, `addedDate`) VALUES
(7, 37, 2, 3, '2022-02-08 10:32:38'),
(8, 38, 4, 3, '2022-02-08 10:32:39'),
(9, 39, 1, 3, '2022-02-08 10:32:40'),
(13, 37, 1, 6, '2022-02-13 22:01:21'),
(14, 38, 1, 6, '2022-02-13 22:01:22'),
(18, 37, 1, 9, '2022-02-13 22:44:19'),
(19, 39, 1, 9, '2022-02-13 22:44:20');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`categorieId`);
ALTER TABLE `categories` ADD FULLTEXT KEY `categorieName` (`categorieName`,`categorieDesc`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`contactId`);

--
-- Indexes for table `contactreply`
--
ALTER TABLE `contactreply`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deliverydetails`
--
ALTER TABLE `deliverydetails`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orderId` (`orderId`);

--
-- Indexes for table `orderitems`
--
ALTER TABLE `orderitems`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orderId`);

--
-- Indexes for table `pizza`
--
ALTER TABLE `pizza`
  ADD PRIMARY KEY (`pizzaId`);
ALTER TABLE `pizza` ADD FULLTEXT KEY `pizzaName` (`pizzaName`,`pizzaDesc`);

--
-- Indexes for table `sitedetail`
--
ALTER TABLE `sitedetail`
  ADD PRIMARY KEY (`tempId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `viewcart`
--
ALTER TABLE `viewcart`
  ADD PRIMARY KEY (`cartItemId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `categorieId` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `contactId` int(21) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `contactreply`
--
ALTER TABLE `contactreply`
  MODIFY `id` int(21) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `deliverydetails`
--
ALTER TABLE `deliverydetails`
  MODIFY `id` int(21) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orderitems`
--
ALTER TABLE `orderitems`
  MODIFY `id` int(21) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `orderId` int(21) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pizza`
--
ALTER TABLE `pizza`
  MODIFY `pizzaId` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `sitedetail`
--
ALTER TABLE `sitedetail`
  MODIFY `tempId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(21) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `viewcart`
--
ALTER TABLE `viewcart`
  MODIFY `cartItemId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
