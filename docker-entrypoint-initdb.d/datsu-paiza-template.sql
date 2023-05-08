CREATE DATABASE IF NOT EXISTS tq_quest;

USE tq_quest;

-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- ホスト: mysql
-- 生成日時: 2021 年 2 月 04 日 05:05
-- サーバのバージョン： 5.7.32-log
-- PHP のバージョン: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- データベース: `tq_quest`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `categories`
--

CREATE TABLE `categories`
(
    `id`         int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '管理番号',
    `name`       varchar(255) NOT NULL COMMENT 'カテゴリ名',
    `user_id`    int(11) NOT NULL COMMENT 'ユーザーID',
    `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '作成日時',
    `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日時'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='カテゴリ情報';

--
-- テストデータ
--

INSERT INTO `categories`(`name`, `user_id`) VALUES
('住宅費', 1),
('水道光熱費', 1),
('通信料', 1),
('交際費', 1);

-- --------------------------------------------------------

--
-- テーブルの構造 `incomes`
--

CREATE TABLE `incomes`
(
    `id`                 int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '管理番号',
    `user_id`            int(11) NOT NULL COMMENT 'ユーザーID',
    `income_source_id`   int(11) NOT NULL COMMENT 'カテゴリ管理番号',
    `amount`             int(11) NOT NULL COMMENT '金額',
    `accrual_date`       date NOT NULL COMMENT '発生した日付',
    `created_at`         timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '作成日時',
    `updated_at`         timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日時'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='収入情報';

--
-- テストデータ
--

INSERT INTO `incomes`(`user_id`, `income_source_id`, `amount`, `accrual_date`) VALUES 
(1, 1, 300000, '2022-01-25'),
(1, 2, 50000, '2022-01-28'),
(1, 1, 300000, '2022-02-25'),
(1, 2, 48000, '2022-02-28'),
(1, 1, 300000, '2022-03-25'),
(1, 2, 53000, '2022-03-28'),
(1, 1, 300000, '2022-04-25'),
(1, 2, 55000, '2022-04-28'),
(1, 1, 300000, '2022-05-25'),
(1, 2, 50000, '2022-05-28'),
(1, 1, 300000, '2022-06-25'),
(1, 2, 40000, '2022-06-28'),
(1, 1, 300000, '2022-07-25'),
(1, 2, 43000, '2022-07-28'),
(1, 1, 300000, '2022-08-25'),
(1, 2, 56000, '2022-08-28'),
(1, 1, 300000, '2022-09-25'),
(1, 2, 38000, '2022-09-28'),
(1, 1, 300000, '2022-10-25'),
(1, 2, 66000, '2022-10-28'),
(1, 1, 300000, '2022-11-25'),
(1, 2, 54000, '2022-11-28'),
(1, 1, 300000, '2022-12-25'),
(1, 2, 50000, '2022-12-28');

-- --------------------------------------------------------

--
-- テーブルの構造 `income_sources`
--

CREATE TABLE `income_sources`
(
    `id`           int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '管理番号',
    `name`         varchar(255) NOT NULL COMMENT '収入源名',
    `user_id`      int(11) NOT NULL COMMENT 'ユーザーID',
    `created_at`   timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '作成日時',
    `updated_at`   timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日時'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='収入源情報';

--
-- テストデータ
--

INSERT INTO `income_sources`(`name`, `user_id`) VALUES 
('本業', 1),
('副業', 1);

-- --------------------------------------------------------

--
-- テーブルの構造 `spendings`
--

CREATE TABLE `spendings`
(
    `id`           int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '管理番号',
    `name`         varchar(255) NOT NULL COMMENT '支出名',
    `user_id`      int(11) NOT NULL COMMENT 'ユーザーID',
    `category_id`  int(11) NOT NULL COMMENT 'カテゴリID', 
    `amount`       int(11) NOT NULL COMMENT '金額',
    `accrual_date` date NOT NULL COMMENT '発生日',
    `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '作成日時',
    `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日時'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='支出情報';

--
-- テストデータ
--

INSERT INTO `spendings`(`name`, `user_id`, `category_id`, `amount`, `accrual_date`) VALUES
('家賃',1, 1, 63000, '2022-01-20'),
('駐車場代',1, 1, 10000, '2022-01-20'),
('水道代',1, 2, 2300, '2022-01-20'),
('電気代',1, 2, 1800, '2022-01-20'),
('ネット',1, 3, 4000, '2022-01-15'),
('携帯',1, 3, 4500, '2022-01-15'),
('飲み会',1, 4, 3000, '2022-01-05'),
('誕生日会',1, 4, 5000, '2022-01-15'),
('TDL',1, 4, 13000, '2022-01-19'),
('家賃',1, 1, 63000, '2022-02-20'),
('駐車場代',1, 1, 10000, '2022-02-20'),
('水道代',1, 2, 2400, '2022-02-20'),
('電気代',1, 2, 1900, '2022-02-20'),
('ネット',1, 3, 4000, '2022-02-15'),
('携帯',1, 3, 4100, '2022-02-15'),
('飲み会',1, 4, 3800, '2022-02-05'),
('飲み会',1, 4, 5000, '2022-02-15'),
('デート',1, 4, 10000, '2022-02-19'),
('家賃',1, 1, 63000, '2022-03-20'),
('駐車場代',1, 1, 10000, '2022-03-20'),
('水道代',1, 2, 2300, '2022-03-20'),
('電気代',1, 2, 1800, '2022-03-20'),
('ネット',1, 3, 4000, '2022-03-15'),
('携帯',1, 3, 4600, '2022-03-15'),
('家賃',1, 1, 63000, '2022-04-20'),
('駐車場代',1, 1, 10000, '2022-04-20'),
('水道代',1, 2, 2800, '2022-04-20'),
('電気代',1, 2, 1900, '2022-04-20'),
('ネット',1, 3, 4000, '2022-04-15'),
('携帯',1, 3, 3800, '2022-04-15'),
('飲み会',1, 4, 3000, '2022-04-05'),
('家賃',1, 1, 63000, '2022-05-20'),
('駐車場代',1, 1, 10000, '2022-05-20'),
('水道代',1, 2, 2000, '2022-05-20'),
('電気代',1, 2, 1800, '2022-05-20'),
('ネット',1, 3, 4000, '2022-05-15'),
('携帯',1, 3, 4000, '2022-05-15'),
('お花見',1, 4, 3500, '2022-05-05'),
('家賃',1, 1, 63000, '2022-06-20'),
('駐車場代',1, 1, 10000, '2022-06-20'),
('水道代',1, 2, 2100, '2022-06-20'),
('電気代',1, 2, 2300, '2022-06-20'),
('ネット',1, 3, 4000, '2022-06-15'),
('携帯',1, 3, 4600, '2022-06-15'),
('飲み会',1, 4, 8000, '2022-06-05'),
('家賃',1, 1, 63000, '2022-07-20'),
('駐車場代',1, 1, 10000, '2022-07-20'),
('水道代',1, 2, 2100, '2022-07-20'),
('電気代',1, 2, 1600, '2022-07-20'),
('ネット',1, 3, 4000, '2022-07-15'),
('携帯',1, 3, 4500, '2022-07-15'),
('家賃',1, 1, 63000, '2022-08-20'),
('駐車場代',1, 1, 10000, '2022-08-20'),
('水道代',1, 2, 2100, '2022-08-20'),
('電気代',1, 2, 2300, '2022-08-20'),
('ネット',1, 3, 4000, '2022-08-15'),
('携帯',1, 3, 4600, '2022-08-15'),
('飲み会',1, 4, 3000, '2022-08-05'),
('キャンプ',1, 4, 13000, '2022-08-15'),
('家賃',1, 1, 63000, '2022-09-20'),
('駐車場代',1, 1, 10000, '2022-09-20'),
('水道代',1, 2, 2300, '2022-09-20'),
('電気代',1, 2, 1800, '2022-09-20'),
('ネット',1, 3, 4000, '2022-09-15'),
('携帯',1, 3, 4500, '2022-09-15'),
('飲み会',1, 4, 3000, '2022-09-05'),
('BBQ',1, 4, 5000, '2022-09-15'),
('家賃',1, 1, 63000, '2022-10-20'),
('駐車場代',1, 1, 10000, '2022-10-20'),
('水道代',1, 2, 2200, '2022-10-20'),
('電気代',1, 2, 2300, '2022-10-20'),
('ネット',1, 3, 4000, '2022-10-15'),
('携帯',1, 3, 4400, '2022-10-15'),
('飲み会',1, 4, 3000, '2022-10-05'),
('家賃',1, 1, 63000, '2022-11-20'),
('駐車場代',1, 1, 10000, '2022-11-20'),
('水道代',1, 2, 2300, '2022-11-20'),
('電気代',1, 2, 2400, '2022-11-20'),
('ネット',1, 3, 4000, '2022-11-15'),
('携帯',1, 3, 4500, '2022-11-15'),
('飲み会',1, 4, 6300, '2022-11-05'),
('家賃',1, 1, 63000, '2022-12-20'),
('駐車場代',1, 1, 10000, '2022-12-20'),
('水道代',1, 2, 2300, '2022-12-20'),
('電気代',1, 2, 1800, '2022-12-20'),
('ネット',1, 3, 4000, '2022-12-15'),
('携帯',1, 3, 4500, '2022-12-15'),
('飲み会',1, 4, 3000, '2022-12-05'),
('飲み会',1, 4, 5000, '2022-12-16'),
('忘年会',1, 4, 7000, '2022-12-27');

-- --------------------------------------------------------

