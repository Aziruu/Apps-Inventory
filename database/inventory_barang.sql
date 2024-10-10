-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 10, 2024 at 04:03 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inventory_barang`
--

-- --------------------------------------------------------

--
-- Table structure for table `td_peminjaman_barang`
--

CREATE TABLE `td_peminjaman_barang` (
  `pbd_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `pb_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `br_kode` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `pdb_tgl` date DEFAULT NULL,
  `pdb_sts` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tm_barang_inventaris`
--

CREATE TABLE `tm_barang_inventaris` (
  `br_kode` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `jns_brg_kode` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_id` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `br_nama` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `br_tgl_terima` date DEFAULT NULL,
  `br_tgl_entry` datetime DEFAULT NULL,
  `br_status` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tm_peminjaman`
--

CREATE TABLE `tm_peminjaman` (
  `pb_id` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `pb_tgl` datetime DEFAULT NULL,
  `pb_no_siswa` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `pd_nama_siswa` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `pb_harus_kembali_tgl` datetime DEFAULT NULL,
  `pb_stat` varchar(2) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tm_pengembalian`
--

CREATE TABLE `tm_pengembalian` (
  `kembali_id` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `pb_id` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_id` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `kembali_tgl` datetime DEFAULT NULL,
  `kembali_sts` varchar(2) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tm_user`
--

CREATE TABLE `tm_user` (
  `user_id` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `user_nama` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_pass` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_hak` varchar(2) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_sts` varchar(2) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tr_jenis_barang`
--

CREATE TABLE `tr_jenis_barang` (
  `jns_brg_kode` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `jns_brg_nama` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `td_peminjaman_barang`
--
ALTER TABLE `td_peminjaman_barang`
  ADD PRIMARY KEY (`pbd_id`),
  ADD KEY `pb_id` (`pb_id`),
  ADD KEY `br_kode` (`br_kode`);

--
-- Indexes for table `tm_barang_inventaris`
--
ALTER TABLE `tm_barang_inventaris`
  ADD PRIMARY KEY (`br_kode`),
  ADD KEY `jns_brg_kode` (`jns_brg_kode`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `tm_peminjaman`
--
ALTER TABLE `tm_peminjaman`
  ADD PRIMARY KEY (`pb_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `tm_pengembalian`
--
ALTER TABLE `tm_pengembalian`
  ADD PRIMARY KEY (`kembali_id`),
  ADD KEY `pb_id` (`pb_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `tm_user`
--
ALTER TABLE `tm_user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `tr_jenis_barang`
--
ALTER TABLE `tr_jenis_barang`
  ADD PRIMARY KEY (`jns_brg_kode`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `td_peminjaman_barang`
--
ALTER TABLE `td_peminjaman_barang`
  ADD CONSTRAINT `td_peminjaman_barang_ibfk_1` FOREIGN KEY (`pb_id`) REFERENCES `tm_peminjaman` (`pb_id`),
  ADD CONSTRAINT `td_peminjaman_barang_ibfk_2` FOREIGN KEY (`br_kode`) REFERENCES `tm_barang_inventaris` (`br_kode`);

--
-- Constraints for table `tm_barang_inventaris`
--
ALTER TABLE `tm_barang_inventaris`
  ADD CONSTRAINT `tm_barang_inventaris_ibfk_1` FOREIGN KEY (`jns_brg_kode`) REFERENCES `tr_jenis_barang` (`jns_brg_kode`),
  ADD CONSTRAINT `tm_barang_inventaris_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `tm_user` (`user_id`);

--
-- Constraints for table `tm_peminjaman`
--
ALTER TABLE `tm_peminjaman`
  ADD CONSTRAINT `tm_peminjaman_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tm_user` (`user_id`);

--
-- Constraints for table `tm_pengembalian`
--
ALTER TABLE `tm_pengembalian`
  ADD CONSTRAINT `tm_pengembalian_ibfk_1` FOREIGN KEY (`pb_id`) REFERENCES `tm_peminjaman` (`pb_id`),
  ADD CONSTRAINT `tm_pengembalian_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `tm_user` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
