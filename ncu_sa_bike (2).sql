-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2023-12-28 14:07:11
-- 伺服器版本： 10.4.28-MariaDB
-- PHP 版本： 8.2.4

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `ncu_sa_bike`
--

-- --------------------------------------------------------

--
-- 資料表結構 `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(30) NOT NULL,
  `account` varchar(50) NOT NULL,
  `admin_password` varchar(30) NOT NULL,
  `modified` datetime NOT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- 傾印資料表的資料 `tbl_admin`
--

INSERT INTO `tbl_admin` (`admin_id`, `admin_name`, `account`, `admin_password`, `modified`, `created`) VALUES
(1, '黃柏翰', '10601hbh', '10601hbh', '2023-12-28 09:29:08', '2023-12-28 09:29:08');

-- --------------------------------------------------------

--
-- 資料表結構 `tbl_bike`
--

CREATE TABLE `tbl_bike` (
  `bike_id` int(11) NOT NULL,
  `station_id` int(5) NOT NULL,
  `available` tinyint(1) NOT NULL,
  `modified` datetime NOT NULL,
  `created` datetime NOT NULL,
  `bike_note` varchar(255) DEFAULT NULL,
  `borrow_times` int(5) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- 傾印資料表的資料 `tbl_bike`
--

INSERT INTO `tbl_bike` (`bike_id`, `station_id`, `available`, `modified`, `created`, `bike_note`, `borrow_times`) VALUES
(1, 1, 1, '2023-12-23 10:39:18', '2023-12-23 10:39:18', '狀況良好', 0),
(2, 1, 1, '2023-12-23 10:40:56', '2023-12-23 10:40:56', '狀況良好', 0),
(3, 2, 1, '2023-12-23 10:52:15', '2023-12-23 10:52:15', '狀況良好', 0),
(4, 1, 0, '2023-12-24 10:00:52', '2023-12-24 10:00:52', '待修理', 0),
(5, 3, 1, '2023-12-24 12:34:35', '2023-12-24 12:34:35', '狀況良好', 0),
(6, 3, 1, '2023-12-24 12:34:59', '2023-12-24 12:34:59', '狀況良好', 0),
(7, 3, 1, '2023-12-24 12:35:20', '2023-12-24 12:35:20', '狀況普通', 0),
(8, 3, 1, '2023-12-24 12:35:54', '2023-12-24 12:35:54', '狀況普通', 0),
(9, 3, 0, '2023-12-24 12:36:19', '2023-12-24 12:36:19', '待修理', 0),
(10, 4, 1, '2023-12-24 12:36:41', '2023-12-24 12:36:41', '狀況良好', 0),
(11, 4, 1, '2023-12-24 12:37:04', '2023-12-24 12:37:04', '狀況普通', 0),
(12, 4, 0, '2023-12-24 12:37:19', '2023-12-24 12:37:19', '待修理', 0),
(13, 4, 0, '2023-12-24 12:37:35', '2023-12-24 12:37:35', '待修理', 0),
(14, 5, 1, '2023-12-24 12:38:15', '2023-12-24 12:38:15', '狀況良好', 0),
(15, 5, 0, '2023-12-24 12:38:33', '2023-12-24 12:38:33', '待修理', 0);

-- --------------------------------------------------------

--
-- 資料表結構 `tbl_member`
--

CREATE TABLE `tbl_member` (
  `student_id` int(9) NOT NULL,
  `student_name` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `student_password` varchar(30) NOT NULL,
  `modified` datetime NOT NULL,
  `created` datetime NOT NULL,
  `point` int(5) NOT NULL DEFAULT 0,
  `mission_id` int(11) DEFAULT NULL,
  `riding_times` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- 傾印資料表的資料 `tbl_member`
--

INSERT INTO `tbl_member` (`student_id`, `student_name`, `email`, `student_password`, `modified`, `created`, `point`, `mission_id`, `riding_times`) VALUES
(110403020, '黃柏翰', 'bohane42@gmail.com', '123465abc', '2023-12-28 12:50:47', '2023-12-28 09:58:26', 0, NULL, 0);

-- --------------------------------------------------------

--
-- 資料表結構 `tbl_mission`
--

CREATE TABLE `tbl_mission` (
  `mission_id` int(11) NOT NULL,
  `mission_name` varchar(45) NOT NULL,
  `content` varchar(255) NOT NULL,
  `target_times` int(11) NOT NULL,
  `reward` int(1) NOT NULL DEFAULT 2
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- 傾印資料表的資料 `tbl_mission`
--

INSERT INTO `tbl_mission` (`mission_id`, `mission_name`, `content`, `target_times`, `reward`) VALUES
(1, '輕鬆騎乘', '騎乘1次', 1, 2),
(2, '說走就走', '騎乘2次', 2, 2),
(3, '騎乘大師', '騎乘3次', 3, 2);

-- --------------------------------------------------------

--
-- 資料表結構 `tbl_order`
--

CREATE TABLE `tbl_order` (
  `order_id` int(11) NOT NULL,
  `student_id` int(9) NOT NULL,
  `bike_id` int(11) NOT NULL,
  `station1_id` int(11) NOT NULL,
  `station2_id` int(11) NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `cost` int(5) NOT NULL DEFAULT 0,
  `point_used` int(5) NOT NULL DEFAULT 0,
  `total_amount` int(5) NOT NULL DEFAULT 0,
  `report_content` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `tbl_station`
--

CREATE TABLE `tbl_station` (
  `station_id` int(11) NOT NULL,
  `station_name` varchar(45) NOT NULL,
  `num_of_bike` int(2) NOT NULL DEFAULT 0,
  `station_note` varchar(255) DEFAULT NULL,
  `station_full` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- 傾印資料表的資料 `tbl_station`
--

INSERT INTO `tbl_station` (`station_id`, `station_name`, `num_of_bike`, `station_note`, `station_full`) VALUES
(1, '小木屋鬆餅站', 3, NULL, 0),
(2, '松苑餐廳站', 1, NULL, 0),
(3, '行政大樓站', 5, NULL, 0),
(4, '宵夜街站', 4, NULL, 0),
(5, '運動場站', 2, NULL, 0);

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `admin_id_UNIQUE` (`admin_id`),
  ADD UNIQUE KEY `account_UNIQUE` (`account`);

--
-- 資料表索引 `tbl_bike`
--
ALTER TABLE `tbl_bike`
  ADD PRIMARY KEY (`bike_id`),
  ADD UNIQUE KEY `bike_id_UNIQUE` (`bike_id`),
  ADD KEY `station_id` (`station_id`);

--
-- 資料表索引 `tbl_member`
--
ALTER TABLE `tbl_member`
  ADD PRIMARY KEY (`student_id`),
  ADD UNIQUE KEY `student_id_UNIQUE` (`student_id`),
  ADD UNIQUE KEY `email_UNIQUE` (`email`),
  ADD KEY `mission_id_idx` (`mission_id`);

--
-- 資料表索引 `tbl_mission`
--
ALTER TABLE `tbl_mission`
  ADD PRIMARY KEY (`mission_id`),
  ADD UNIQUE KEY `mission_id_UNIQUE` (`mission_id`);

--
-- 資料表索引 `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD PRIMARY KEY (`order_id`),
  ADD UNIQUE KEY `order_id_UNIQUE` (`order_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `bike_id` (`bike_id`),
  ADD KEY `station1_id` (`station1_id`),
  ADD KEY `station2_id` (`station2_id`);

--
-- 資料表索引 `tbl_station`
--
ALTER TABLE `tbl_station`
  ADD PRIMARY KEY (`station_id`),
  ADD UNIQUE KEY `station_id_UNIQUE` (`station_id`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `tbl_bike`
--
ALTER TABLE `tbl_bike`
  MODIFY `bike_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `tbl_station`
--
ALTER TABLE `tbl_station`
  MODIFY `station_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- 已傾印資料表的限制式
--

--
-- 資料表的限制式 `tbl_bike`
--
ALTER TABLE `tbl_bike`
  ADD CONSTRAINT `station_id` FOREIGN KEY (`station_id`) REFERENCES `tbl_station` (`station_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- 資料表的限制式 `tbl_member`
--
ALTER TABLE `tbl_member`
  ADD CONSTRAINT `mission_id` FOREIGN KEY (`mission_id`) REFERENCES `tbl_mission` (`mission_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- 資料表的限制式 `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD CONSTRAINT `bike_id` FOREIGN KEY (`bike_id`) REFERENCES `tbl_bike` (`bike_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `station1_id` FOREIGN KEY (`station1_id`) REFERENCES `tbl_station` (`station_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `station2_id` FOREIGN KEY (`station2_id`) REFERENCES `tbl_station` (`station_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `student_id` FOREIGN KEY (`student_id`) REFERENCES `tbl_member` (`student_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
SET FOREIGN_KEY_CHECKS=1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
