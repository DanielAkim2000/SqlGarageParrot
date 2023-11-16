-- Création de la base de données
CREATE DATABASE garageparrotdb;

-- Utilisation de la base de données
\c garageparrotdb;

-- Création de la table Contacts
CREATE TABLE contacts (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(255) NOT NULL,
    prenom VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    numero_telephone VARCHAR(20),
    message TEXT NOT NULL,
    sujet VARCHAR(255),
    voiture_id INTEGER,
    FOREIGN KEY (voiture_id) REFERENCES voituresoccasion(id)
);

-- Création de la table JourSemaine
CREATE TABLE jour_semaine (
    id VARCHAR(20) PRIMARY KEY
);

-- Insertion dans la table Jour_semaine les differents jour de la semaine
INSERT INTO jour_semaine(id) VALUES('Lundi'),('Mardi'),('Mercredi'),('Jeudi'),('Vendredi'),('Samedi'),('Dimanche');

-- Création de la table Horairesouverture
CREATE TABLE horairesouverture (
    id SERIAL PRIMARY KEY,
    jour_semaine_id VARCHAR(20) REFERENCES jour_semaine(id),
    heure_ouverture TIME NOT NULL,
    heure_fermeture TIME NOT NULL
);

-- Création de la table Services
CREATE TABLE services (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(255) NOT NULL,
    description TEXT,
    imageName VARCHAR(255),
    imageSize INT,
    imageFile BYTEA
);

-- Création de la table Temoignages
CREATE TABLE temoignages (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(255),
    commentaire TEXT NOT NULL,
    note INTEGER,
    modere BOOLEAN
);

-- Création de la table Utilisateurs
CREATE TABLE utilisateurs (
    id UUID PRIMARY KEY,
    firstname VARCHAR(255) NOT NULL,
    lastname VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    roles ARRAY NOT NULL
);

-- Création de la table Voituresoccasion
CREATE TABLE voituresoccasion (
    id UUID PRIMARY KEY,
    marque VARCHAR(255) NOT NULL,
    modele VARCHAR(255) NOT NULL,
    annee_mise_en_circulation INTEGER NOT NULL,
    prix DECIMAL(10, 2) NOT NULL,
    kilometrage INTEGER NOT NULL,
    imagePath VARCHAR(255),
    imageFile BYTEA,
    description TEXT
);

