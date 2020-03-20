-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  Dim 09 fév. 2020 à 18:32
-- Version du serveur :  5.7.26
-- Version de PHP :  7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `banque`
--

-- --------------------------------------------------------

--
-- Structure de la table `agence`
--

DROP TABLE IF EXISTS `agence`;
CREATE TABLE IF NOT EXISTS `agence` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifiant` int(11) NOT NULL,
  `adresse` varchar(255) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `nbreclient` int(11) NOT NULL,
  `debitagence` double NOT NULL,
  `creditagence` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `agence`
--

INSERT INTO `agence` (`id`, `identifiant`, `adresse`, `nom`, `nbreclient`, `debitagence`, `creditagence`) VALUES
(1, 12, 'banque', 'tunis', 450, -20, 60350),
(2, 123, 'biat', 'tunis', 1450, 122, 23);

-- --------------------------------------------------------

--
-- Structure de la table `client_normal`
--

DROP TABLE IF EXISTS `client_normal`;
CREATE TABLE IF NOT EXISTS `client_normal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prenom` varchar(255) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `cin` int(11) NOT NULL,
  `profession` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `client_normal`
--

INSERT INTO `client_normal` (`id`, `prenom`, `nom`, `cin`, `profession`) VALUES
(1, 'bouchrika', 'safa', 132558371, 'etudiant'),
(2, 'bouchrika', 'safa', 132558371, 'etudiant'),
(3, 'bouchrika', 'safa', 132558371, 'etudiant'),
(4, 'ben ahmed', 'jamil', 13258371, 'prof');

-- --------------------------------------------------------

--
-- Structure de la table `client_vip`
--

DROP TABLE IF EXISTS `client_vip`;
CREATE TABLE IF NOT EXISTS `client_vip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cin` int(11) NOT NULL,
  `nom` text NOT NULL,
  `prenom` text NOT NULL,
  `profession` text NOT NULL,
  `nomEntreprise` text NOT NULL,
  `chiffreAffaire` double NOT NULL,
  `nombreEmploye` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `client_vip`
--

INSERT INTO `client_vip` (`id`, `cin`, `nom`, `prenom`, `profession`, `nomEntreprise`, `chiffreAffaire`, `nombreEmploye`) VALUES
(1, 1325317, 'safa', 'bouchrika', 'etudiante', 'linedata', 123, 65),
(2, 1325317, 'safa', 'bouchrika', 'etudiante', 'linedata', 123, 65),
(3, 14589652, 'abir', 'mahfoudhi', 'etudiant', 'devplus', 123, 25);

-- --------------------------------------------------------

--
-- Structure de la table `compte`
--

DROP TABLE IF EXISTS `compte`;
CREATE TABLE IF NOT EXISTS `compte` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rib` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `agence_id` int(11) NOT NULL,
  `montant` double NOT NULL,
  `debitglobaldelabanque` double NOT NULL,
  `nbreclient` int(11) NOT NULL,
  `creditglobaldelabanque` double NOT NULL,
  `numCompte` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `compte_ibfk_1` (`agence_id`),
  KEY `compte_ibfk_2` (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `compte`
--

INSERT INTO `compte` (`id`, `rib`, `client_id`, `agence_id`, `montant`, `debitglobaldelabanque`, `nbreclient`, `creditglobaldelabanque`, `numCompte`) VALUES
(1, 12, 1, 2, 23, 8945, 9854, 74, 1);

-- --------------------------------------------------------

--
-- Structure de la table `compte_epargne`
--

DROP TABLE IF EXISTS `compte_epargne`;
CREATE TABLE IF NOT EXISTS `compte_epargne` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `rib` int(11) NOT NULL,
  `agence_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `montant` int(11) NOT NULL,
  `Resteversement` int(11) NOT NULL,
  `solde` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `compte_epargne_ibfk_1` (`agence_id`),
  KEY `compte_epargne_ibfk_2` (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `compte_epargne`
--

INSERT INTO `compte_epargne` (`id`, `rib`, `agence_id`, `client_id`, `montant`, `Resteversement`, `solde`) VALUES
(1, 123, 1, 2, 12135, 74, 15715),
(2, 123, 1, 2, 12135, 74, 15715),
(3, 123, 1, 2, 12135, 74, 15715),
(4, 123, 1, 2, 12135, 74, 15715),
(5, 123, 1, 2, 12135, 74, 15715),
(6, 569, 2, 1, 578, 145, 230),
(7, 785, 2, 1, 58, 145, 230),
(8, 1032, 2, 1, 58, 145, 230),
(9, 1032, 1, 2, 7854, 145, 10230),
(10, 1032, 1, 2, 7854, 145, 10230);

-- --------------------------------------------------------

--
-- Structure de la table `compte_salarie`
--

DROP TABLE IF EXISTS `compte_salarie`;
CREATE TABLE IF NOT EXISTS `compte_salarie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rib` int(11) NOT NULL,
  `agence_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `montant` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `compte_salarie_ibfk_1` (`agence_id`),
  KEY `compte_salarie_ibfk_2` (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `compte_salarie`
--

INSERT INTO `compte_salarie` (`id`, `rib`, `agence_id`, `client_id`, `montant`) VALUES
(7, 55, 2, 1, 52);

-- --------------------------------------------------------

--
-- Structure de la table `compte_vip`
--

DROP TABLE IF EXISTS `compte_vip`;
CREATE TABLE IF NOT EXISTS `compte_vip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rib` int(11) NOT NULL,
  `agence_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `montant` int(11) NOT NULL,
  `chiffreAffaire` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `compte_vip_ibfk_1` (`agence_id`),
  KEY `compte_vip_ibfk_2` (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `compte_vip`
--

INSERT INTO `compte_vip` (`id`, `rib`, `agence_id`, `client_id`, `montant`, `chiffreAffaire`) VALUES
(13, 52, 1, 2, 85, 22);

-- --------------------------------------------------------

--
-- Structure de la table `login`
--

DROP TABLE IF EXISTS `login`;
CREATE TABLE IF NOT EXISTS `login` (
  `utilisateur` text NOT NULL,
  `mpasse` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `login`
--

INSERT INTO `login` (`utilisateur`, `mpasse`) VALUES
('safa', 'root'),
('safa', 'root');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `compte`
--
ALTER TABLE `compte`
  ADD CONSTRAINT `compte_ibfk_1` FOREIGN KEY (`agence_id`) REFERENCES `agence` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compte_ibfk_2` FOREIGN KEY (`client_id`) REFERENCES `client_normal` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `compte_epargne`
--
ALTER TABLE `compte_epargne`
  ADD CONSTRAINT `compte_epargne_ibfk_1` FOREIGN KEY (`agence_id`) REFERENCES `agence` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compte_epargne_ibfk_2` FOREIGN KEY (`client_id`) REFERENCES `client_normal` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `compte_salarie`
--
ALTER TABLE `compte_salarie`
  ADD CONSTRAINT `compte_salarie_ibfk_1` FOREIGN KEY (`agence_id`) REFERENCES `agence` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compte_salarie_ibfk_2` FOREIGN KEY (`client_id`) REFERENCES `client_normal` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `compte_vip`
--
ALTER TABLE `compte_vip`
  ADD CONSTRAINT `compte_vip_ibfk_1` FOREIGN KEY (`agence_id`) REFERENCES `agence` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compte_vip_ibfk_2` FOREIGN KEY (`client_id`) REFERENCES `client_vip` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
