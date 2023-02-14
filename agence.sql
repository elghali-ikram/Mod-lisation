-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 14 fév. 2023 à 13:44
-- Version du serveur : 10.4.27-MariaDB
-- Version de PHP : 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `agence`
--

-- --------------------------------------------------------

--
-- Structure de la table `announce`
--

CREATE TABLE `announce` (
  `numero_annouce` int(11) NOT NULL,
  `titre` varchar(50) DEFAULT NULL,
  `prix` int(11) DEFAULT NULL,
  `date_publication` date DEFAULT NULL,
  `date_modification` date DEFAULT NULL,
  `categorie` varchar(50) NOT NULL,
  `Type` varchar(50) DEFAULT NULL,
  `code_postal` int(11) DEFAULT NULL,
  `Ville` varchar(50) DEFAULT NULL,
  `numero_client` int(11) NOT NULL
) ;

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `numero_client` int(11) NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `prenom` varchar(50) DEFAULT NULL,
  `adresse_email` varchar(500) DEFAULT NULL,
  `mot_passe` varchar(50) DEFAULT NULL,
  `telephone` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `images`
--

CREATE TABLE `images` (
  `id_image` int(11) NOT NULL,
  `image` varbinary(3000) NOT NULL,
  `check_image` tinyint(1) NOT NULL,
  `numero_annouce` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `announce`
--
ALTER TABLE `announce`
  ADD PRIMARY KEY (`numero_annouce`),
  ADD KEY `numero_client` (`numero_client`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`numero_client`);

--
-- Index pour la table `images`
--
ALTER TABLE `images`
  ADD KEY `numero_annouce` (`numero_annouce`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `announce`
--
ALTER TABLE `announce`
  MODIFY `numero_annouce` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `numero_client` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `announce`
--
ALTER TABLE `announce`
  ADD CONSTRAINT `announce_ibfk_1` FOREIGN KEY (`numero_client`) REFERENCES `client` (`numero_client`);

--
-- Contraintes pour la table `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `images_ibfk_1` FOREIGN KEY (`numero_annouce`) REFERENCES `announce` (`numero_annouce`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
