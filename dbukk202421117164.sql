-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Waktu pembuatan: 23. April 2024 jam 13:42
-- Versi Server: 5.5.16
-- Versi PHP: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `dbukk202421117164`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE IF NOT EXISTS `barang` (
  `ID_BARANG` int(11) NOT NULL AUTO_INCREMENT,
  `NAMA_BARANG` varchar(250) NOT NULL,
  `KATEGORI` varchar(100) NOT NULL,
  `SATUAN` varchar(200) NOT NULL,
  `HARGA_BELI` double NOT NULL,
  `HARGA_JUAL` double NOT NULL,
  `STOK` double NOT NULL,
  `KETERANGAN` varchar(250) NOT NULL,
  `BARCODE` varchar(200) NOT NULL,
  PRIMARY KEY (`ID_BARANG`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data untuk tabel `barang`
--

INSERT INTO `barang` (`ID_BARANG`, `NAMA_BARANG`, `KATEGORI`, `SATUAN`, `HARGA_BELI`, `HARGA_JUAL`, `STOK`, `KETERANGAN`, `BARCODE`) VALUES
(7, 'qe', 'wr', 'wf', 434, 250, 1, 'sr', 'sf');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE IF NOT EXISTS `pelanggan` (
  `ID_PELANGGAN` int(11) NOT NULL AUTO_INCREMENT,
  `NAMA_PELANGGAN` varchar(50) NOT NULL,
  `ALAMAT` varchar(250) NOT NULL,
  `NOMOR_TELEPON` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_PELANGGAN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pemasok`
--

CREATE TABLE IF NOT EXISTS `pemasok` (
  `ID_PEMASOK` int(11) NOT NULL AUTO_INCREMENT,
  `NAMA_PEMASOK` varchar(50) NOT NULL,
  `ALAMAT` varchar(250) NOT NULL,
  `NOMOR_TELEPON` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_PEMASOK`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data untuk tabel `pemasok`
--

INSERT INTO `pemasok` (`ID_PEMASOK`, `NAMA_PEMASOK`, `ALAMAT`, `NOMOR_TELEPON`) VALUES
(5, 'fsf', 'fsfd', 'FASF');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembelian`
--

CREATE TABLE IF NOT EXISTS `pembelian` (
  `ID_PEMBELIAN` int(11) NOT NULL AUTO_INCREMENT,
  `TANGGAL` datetime NOT NULL,
  `ID_PEMASOK` int(11) NOT NULL,
  `TOTAL_PEMBELIAN` double NOT NULL,
  `POTONGAN` double NOT NULL,
  `METODE_PEMBAYARAN` varchar(50) NOT NULL,
  `KETERANGAN` varchar(250) NOT NULL,
  `ID_PENGGUNA` int(11) NOT NULL,
  PRIMARY KEY (`ID_PEMBELIAN`),
  KEY `ID_PEMASOK` (`ID_PEMASOK`),
  KEY `ID_PENGGUNA` (`ID_PENGGUNA`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data untuk tabel `pembelian`
--

INSERT INTO `pembelian` (`ID_PEMBELIAN`, `TANGGAL`, `ID_PEMASOK`, `TOTAL_PEMBELIAN`, `POTONGAN`, `METODE_PEMBAYARAN`, `KETERANGAN`, `ID_PENGGUNA`) VALUES
(1, '2024-04-23 00:00:00', 5, 434, 0, 'UTANG', '', 6);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembelian_detil`
--

CREATE TABLE IF NOT EXISTS `pembelian_detil` (
  `ID_PEMBELIAN` int(11) NOT NULL,
  `ID_BARANG` int(11) NOT NULL,
  `HARGA_SATUAN` double NOT NULL,
  `JUMLAH` double NOT NULL,
  `TOTAL_HARGA` double NOT NULL,
  KEY `ID_PEMBELIAN` (`ID_PEMBELIAN`),
  KEY `ID_BARANG` (`ID_BARANG`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pembelian_detil`
--

INSERT INTO `pembelian_detil` (`ID_PEMBELIAN`, `ID_BARANG`, `HARGA_SATUAN`, `JUMLAH`, `TOTAL_HARGA`) VALUES
(1, 7, 434, 1, 434);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengguna`
--

CREATE TABLE IF NOT EXISTS `pengguna` (
  `ID_PENGGUNA` int(11) NOT NULL AUTO_INCREMENT,
  `NAMA_PENGGUNA` varchar(50) NOT NULL,
  `ALAMAT` varchar(250) NOT NULL,
  `NOMOR_TELEPON` varchar(50) NOT NULL,
  `USERNAME` varchar(100) NOT NULL,
  `PASSWORD` varchar(100) NOT NULL,
  `HAK_AKSES` varchar(100) NOT NULL,
  PRIMARY KEY (`ID_PENGGUNA`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data untuk tabel `pengguna`
--

INSERT INTO `pengguna` (`ID_PENGGUNA`, `NAMA_PENGGUNA`, `ALAMAT`, `NOMOR_TELEPON`, `USERNAME`, `PASSWORD`, `HAK_AKSES`) VALUES
(6, 'faisal jordan', 'gunungsari', '09731', 'faisal', '123', 'ADMIN');

-- --------------------------------------------------------

--
-- Struktur dari tabel `penjualan`
--

CREATE TABLE IF NOT EXISTS `penjualan` (
  `ID_PENJUALAN` int(11) NOT NULL AUTO_INCREMENT,
  `TANGGAL` datetime NOT NULL,
  `ID_PELANGGAN` int(11) NOT NULL,
  `TOTAL_PENJUALAN` double NOT NULL,
  `POTONGAN` double NOT NULL,
  `METODE_PEMBAYARAN` varchar(50) NOT NULL,
  `KETERANGAN` varchar(250) NOT NULL,
  `ID_PENGGUNA` int(11) NOT NULL,
  PRIMARY KEY (`ID_PENJUALAN`),
  KEY `ID_PELANGGAN` (`ID_PELANGGAN`),
  KEY `ID_PENGGUNA` (`ID_PENGGUNA`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `penjualan_detil`
--

CREATE TABLE IF NOT EXISTS `penjualan_detil` (
  `ID_PENJUALAN` int(11) NOT NULL,
  `ID_BARANG` int(11) NOT NULL,
  `HARGA_SATUAN` double NOT NULL,
  `JUMLAH` double NOT NULL,
  `TOTAL_HARGA` double NOT NULL,
  KEY `ID_PENJUALAN` (`ID_PENJUALAN`),
  KEY `ID_BARANG` (`ID_BARANG`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `pembelian`
--
ALTER TABLE `pembelian`
  ADD CONSTRAINT `pembelian_ibfk_1` FOREIGN KEY (`ID_PEMASOK`) REFERENCES `pemasok` (`ID_PEMASOK`) ON UPDATE CASCADE,
  ADD CONSTRAINT `pembelian_ibfk_2` FOREIGN KEY (`ID_PENGGUNA`) REFERENCES `pengguna` (`ID_PENGGUNA`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `pembelian_detil`
--
ALTER TABLE `pembelian_detil`
  ADD CONSTRAINT `pembelian_detil_ibfk_1` FOREIGN KEY (`ID_PEMBELIAN`) REFERENCES `pembelian` (`ID_PEMBELIAN`) ON UPDATE CASCADE,
  ADD CONSTRAINT `pembelian_detil_ibfk_2` FOREIGN KEY (`ID_BARANG`) REFERENCES `barang` (`ID_BARANG`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `penjualan`
--
ALTER TABLE `penjualan`
  ADD CONSTRAINT `penjualan_ibfk_1` FOREIGN KEY (`ID_PENGGUNA`) REFERENCES `pengguna` (`ID_PENGGUNA`) ON UPDATE CASCADE,
  ADD CONSTRAINT `penjualan_ibfk_2` FOREIGN KEY (`ID_PELANGGAN`) REFERENCES `pelanggan` (`ID_PELANGGAN`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `penjualan_detil`
--
ALTER TABLE `penjualan_detil`
  ADD CONSTRAINT `penjualan_detil_ibfk_1` FOREIGN KEY (`ID_PENJUALAN`) REFERENCES `penjualan` (`ID_PENJUALAN`) ON UPDATE CASCADE,
  ADD CONSTRAINT `penjualan_detil_ibfk_2` FOREIGN KEY (`ID_BARANG`) REFERENCES `barang` (`ID_BARANG`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
