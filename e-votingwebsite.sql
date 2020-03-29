-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 29 Mar 2020 pada 14.39
-- Versi server: 10.4.11-MariaDB
-- Versi PHP: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `e-votingwebsite`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_acara`
--

CREATE TABLE `data_acara` (
  `ID_Acara_Pemilu` char(10) NOT NULL,
  `Nama_Acara` varchar(30) NOT NULL,
  `Tanggal_Mulai` date NOT NULL,
  `Waktu_Mulai` time NOT NULL,
  `Tangga_Berakhir` date NOT NULL,
  `Waktu_Berakhir` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_admin`
--

CREATE TABLE `data_admin` (
  `id_Admin` char(10) NOT NULL,
  `username` varchar(15) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(15) NOT NULL,
  `id_mahasiswa` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_mahasiswa`
--

CREATE TABLE `data_mahasiswa` (
  `id_Mahasiswa` char(10) NOT NULL,
  `Nama_Mahasiswa` varchar(30) NOT NULL,
  `NIM` varchar(10) NOT NULL,
  `Jenis_Kelamin` varchar(1) NOT NULL,
  `Angkatan` varchar(4) NOT NULL,
  `Jurusan` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_panitia`
--

CREATE TABLE `data_panitia` (
  `id_Panitia` char(10) NOT NULL,
  `id_Mahasiswa` char(10) NOT NULL,
  `username` varchar(15) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_paslon`
--

CREATE TABLE `data_paslon` (
  `id_Paslon` char(10) NOT NULL,
  `id_Calon_Ketua` char(10) NOT NULL,
  `id_Calon_Wakil` char(10) NOT NULL,
  `No_Urut` varchar(2) NOT NULL,
  `Visi` varchar(100) NOT NULL,
  `Misi` varchar(100) NOT NULL,
  `ID_Acara_Pemilu` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_pemilih`
--

CREATE TABLE `data_pemilih` (
  `id_Pemilih` char(10) NOT NULL,
  `Token` varchar(5) NOT NULL,
  `Status_Token` varchar(6) NOT NULL,
  `id_Mahasiswa` char(10) NOT NULL,
  `id_Paslon_Pilihan` char(10) NOT NULL,
  `id_nama_Acara_Pemilu` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_superadmin`
--

CREATE TABLE `data_superadmin` (
  `id_SuperAdmin` char(10) NOT NULL,
  `username` varchar(15) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(15) NOT NULL,
  `id_Mahasiswa` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `data_acara`
--
ALTER TABLE `data_acara`
  ADD PRIMARY KEY (`ID_Acara_Pemilu`);

--
-- Indeks untuk tabel `data_admin`
--
ALTER TABLE `data_admin`
  ADD PRIMARY KEY (`id_Admin`),
  ADD KEY `id_mahasiswa` (`id_mahasiswa`);

--
-- Indeks untuk tabel `data_mahasiswa`
--
ALTER TABLE `data_mahasiswa`
  ADD PRIMARY KEY (`id_Mahasiswa`);

--
-- Indeks untuk tabel `data_panitia`
--
ALTER TABLE `data_panitia`
  ADD PRIMARY KEY (`id_Panitia`),
  ADD KEY `id_Mahasiswa` (`id_Mahasiswa`);

--
-- Indeks untuk tabel `data_paslon`
--
ALTER TABLE `data_paslon`
  ADD PRIMARY KEY (`id_Paslon`),
  ADD KEY `id_Calon_Ketua` (`id_Calon_Ketua`),
  ADD KEY `id_Calon_Wakil` (`id_Calon_Wakil`),
  ADD KEY `ID_Acara_Pemilu` (`ID_Acara_Pemilu`);

--
-- Indeks untuk tabel `data_pemilih`
--
ALTER TABLE `data_pemilih`
  ADD PRIMARY KEY (`id_Pemilih`),
  ADD KEY `id_Paslon_Pilihan` (`id_Paslon_Pilihan`),
  ADD KEY `id_nama_Acara_Pemilu` (`id_nama_Acara_Pemilu`),
  ADD KEY `id_Mahasiswa` (`id_Mahasiswa`);

--
-- Indeks untuk tabel `data_superadmin`
--
ALTER TABLE `data_superadmin`
  ADD PRIMARY KEY (`id_SuperAdmin`),
  ADD KEY `id_Mahasiswa` (`id_Mahasiswa`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `data_admin`
--
ALTER TABLE `data_admin`
  ADD CONSTRAINT `data_admin_ibfk_1` FOREIGN KEY (`id_mahasiswa`) REFERENCES `data_mahasiswa` (`id_Mahasiswa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `data_panitia`
--
ALTER TABLE `data_panitia`
  ADD CONSTRAINT `data_panitia_ibfk_1` FOREIGN KEY (`id_Mahasiswa`) REFERENCES `data_mahasiswa` (`id_Mahasiswa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `data_paslon`
--
ALTER TABLE `data_paslon`
  ADD CONSTRAINT `data_paslon_ibfk_1` FOREIGN KEY (`id_Calon_Ketua`) REFERENCES `data_mahasiswa` (`id_Mahasiswa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `data_paslon_ibfk_2` FOREIGN KEY (`id_Calon_Wakil`) REFERENCES `data_mahasiswa` (`id_Mahasiswa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `data_paslon_ibfk_3` FOREIGN KEY (`ID_Acara_Pemilu`) REFERENCES `data_acara` (`ID_Acara_Pemilu`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `data_pemilih`
--
ALTER TABLE `data_pemilih`
  ADD CONSTRAINT `data_pemilih_ibfk_1` FOREIGN KEY (`id_Mahasiswa`) REFERENCES `data_mahasiswa` (`id_Mahasiswa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `data_pemilih_ibfk_2` FOREIGN KEY (`id_Paslon_Pilihan`) REFERENCES `data_paslon` (`id_Paslon`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `data_pemilih_ibfk_3` FOREIGN KEY (`id_nama_Acara_Pemilu`) REFERENCES `data_acara` (`ID_Acara_Pemilu`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `data_superadmin`
--
ALTER TABLE `data_superadmin`
  ADD CONSTRAINT `data_superadmin_ibfk_1` FOREIGN KEY (`id_Mahasiswa`) REFERENCES `data_mahasiswa` (`id_Mahasiswa`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
