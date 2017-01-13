-- phpMyAdmin SQL Dump
-- version 4.5.5.1
-- http://www.phpmyadmin.net
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 13 Oca 2017, 05:10:31
-- Sunucu sürümü: 5.7.11
-- PHP Sürümü: 5.6.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `onlineticket`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `event`
--

CREATE TABLE `event` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `info` varchar(45) NOT NULL,
  `date` date NOT NULL,
  `price` int(11) NOT NULL,
  `place_id` int(11) NOT NULL,
  `region_id` int(11) NOT NULL,
  `event_type_id` int(11) NOT NULL,
  `organizer` varchar(45) NOT NULL,
  `seat_id` int(11) NOT NULL,
  `status` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `event`
--

INSERT INTO `event` (`id`, `name`, `info`, `date`, `price`, `place_id`, `region_id`, `event_type_id`, `organizer`, `seat_id`, `status`) VALUES
(1, 'deneme1', 'deneme1', '2017-01-08', 60, 2, 3, 3, 'emre', 30, 'Accepted'),
(2, 'deneme2', 'yeni', '2017-06-06', 55, 3, 2, 1, 'emre', 35, 'Canceled by Client'),
(3, 'deneme3', 'deneme3', '2017-04-04', 35, 3, 1, 1, 'emre', 30, 'Accepted'),
(4, 'deneme4', 'deneme4', '2017-03-03', 30, 2, 1, 4, 'emre', 27, 'Accepted'),
(5, 'abccc', 'asdasdasd', '2017-01-15', 52, 3, 2, 1, 'emre', 32, 'Accepted'),
(6, 'abcccc', 'asdasd', '2017-01-12', 56, 2, 4, 3, 'emre', 35, 'Accepted');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `event_type`
--

CREATE TABLE `event_type` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `event_type`
--

INSERT INTO `event_type` (`id`, `name`) VALUES
(3, 'cinema'),
(1, 'concert'),
(5, 'jazz*'),
(4, 'sport'),
(2, 'theatre');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `member`
--

CREATE TABLE `member` (
  `id` int(11) NOT NULL,
  `user_name` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `e_mail` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `status` varchar(45) NOT NULL,
  `member_type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `member`
--

INSERT INTO `member` (`id`, `user_name`, `password`, `e_mail`, `name`, `status`, `member_type`) VALUES
(1, 'emre', 'emre', 'emre@emre.com', 'emre', 'Accepted', 1),
(2, 'hasan', 'hasan', 'hasan@hasan.com', 'hasan', 'Accepted', 0),
(3, 'ertan', 'ertan', 'ertan@ertan.com', 'ertan', 'Accepted', 2);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `place`
--

CREATE TABLE `place` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `country` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  `postalCode` int(11) NOT NULL,
  `address` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `place`
--

INSERT INTO `place` (`id`, `name`, `country`, `city`, `postalCode`, `address`) VALUES
(1, 'metrogarden', 'turkey', 'istanbul', 34444, 'address1'),
(2, 'buyaka', 'turkey', 'istanbul', 654654, 'asdasd'),
(3, 'capitol', 'turkey', 'istanbul', 32654, 'address3'),
(4, 'zorlu', 'turkey', 'istanbul', 65656, 'address4'),
(5, 'xxx*', 'turkey', 'edirne', 31562, 'address5');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `region`
--

CREATE TABLE `region` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `region`
--

INSERT INTO `region` (`id`, `name`) VALUES
(3, 'akdeniz'),
(2, 'ege'),
(4, 'ic anadolu'),
(5, 'karadeniz*'),
(1, 'marmara');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `ticket`
--

CREATE TABLE `ticket` (
  `id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `ticket`
--

INSERT INTO `ticket` (`id`, `member_id`, `event_id`, `quantity`) VALUES
(5, 3, 4, 3),
(6, 3, 4, 3),
(7, 3, 4, 2),
(8, 3, 1, 1),
(9, 3, 1, 2),
(10, 3, 1, 1),
(11, 3, 2, 1),
(12, 3, 5, 3);

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD UNIQUE KEY `name_UNIQUE` (`name`),
  ADD KEY `fk_event_place1_idx` (`place_id`),
  ADD KEY `fk_event_region1_idx` (`region_id`),
  ADD KEY `fk_event_event_type1_idx` (`event_type_id`);

--
-- Tablo için indeksler `event_type`
--
ALTER TABLE `event_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD UNIQUE KEY `name_UNIQUE` (`name`);

--
-- Tablo için indeksler `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD UNIQUE KEY `name_UNIQUE` (`user_name`);

--
-- Tablo için indeksler `place`
--
ALTER TABLE `place`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD UNIQUE KEY `name_UNIQUE` (`name`);

--
-- Tablo için indeksler `region`
--
ALTER TABLE `region`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD UNIQUE KEY `name_UNIQUE` (`name`);

--
-- Tablo için indeksler `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_ticket_member1_idx` (`member_id`),
  ADD KEY `fk_ticket_event1_idx` (`event_id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `event`
--
ALTER TABLE `event`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Tablo için AUTO_INCREMENT değeri `event_type`
--
ALTER TABLE `event_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Tablo için AUTO_INCREMENT değeri `member`
--
ALTER TABLE `member`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Tablo için AUTO_INCREMENT değeri `place`
--
ALTER TABLE `place`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Tablo için AUTO_INCREMENT değeri `region`
--
ALTER TABLE `region`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Tablo için AUTO_INCREMENT değeri `ticket`
--
ALTER TABLE `ticket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `event`
--
ALTER TABLE `event`
  ADD CONSTRAINT `fk_event_event_type1` FOREIGN KEY (`event_type_id`) REFERENCES `event_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_event_place1` FOREIGN KEY (`place_id`) REFERENCES `place` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_event_region1` FOREIGN KEY (`region_id`) REFERENCES `region` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Tablo kısıtlamaları `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `fk_ticket_event1` FOREIGN KEY (`event_id`) REFERENCES `event` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ticket_member1` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
