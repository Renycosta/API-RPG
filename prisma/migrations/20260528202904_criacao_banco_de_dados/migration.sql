-- CreateTable
CREATE TABLE `personagens` (
    `Id_personagem` INTEGER NOT NULL AUTO_INCREMENT,
    `Nome_personagem` VARCHAR(40) NOT NULL,
    `Classe` ENUM('Guerreiro', 'Mago', 'ladrão', 'Clérigo', 'Monge', 'Druida', 'Necromante') NOT NULL,
    `Nivel` SMALLINT NOT NULL,
    `Pontos` SMALLINT NOT NULL,

    PRIMARY KEY (`Id_personagem`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `habilidades` (
    `Id_habilidade` INTEGER NOT NULL AUTO_INCREMENT,
    `Nome_habilidade` VARCHAR(40) NOT NULL,
    `Descricao` VARCHAR(120) NOT NULL,
    `Tipo` ENUM('Ativa', 'Passiva', 'Magia', 'Tecnica', 'Ultimato') NOT NULL,
    `Nivel_necessario` SMALLINT NOT NULL,
    `Pontos_necessarios` SMALLINT NOT NULL,

    PRIMARY KEY (`Id_habilidade`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `comprar_habilidades` (
    `Personagem_Id` INTEGER NOT NULL,
    `Habilidade_Id` INTEGER NOT NULL,
    `Data` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `Pontos_gastos` SMALLINT NOT NULL,
    `Analise_nivel` SMALLINT NOT NULL,

    PRIMARY KEY (`Personagem_Id`, `Habilidade_Id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `personagem_habilidades` (
    `Id` INTEGER NOT NULL AUTO_INCREMENT,
    `Personagem_Id` INTEGER NOT NULL,
    `Habilidade_Id` INTEGER NOT NULL,
    `Data` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    PRIMARY KEY (`Id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `comprar_habilidades` ADD CONSTRAINT `comprar_habilidades_Personagem_Id_fkey` FOREIGN KEY (`Personagem_Id`) REFERENCES `personagens`(`Id_personagem`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `comprar_habilidades` ADD CONSTRAINT `comprar_habilidades_Habilidade_Id_fkey` FOREIGN KEY (`Habilidade_Id`) REFERENCES `habilidades`(`Id_habilidade`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `personagem_habilidades` ADD CONSTRAINT `personagem_habilidades_Personagem_Id_fkey` FOREIGN KEY (`Personagem_Id`) REFERENCES `personagens`(`Id_personagem`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `personagem_habilidades` ADD CONSTRAINT `personagem_habilidades_Habilidade_Id_fkey` FOREIGN KEY (`Habilidade_Id`) REFERENCES `habilidades`(`Id_habilidade`) ON DELETE RESTRICT ON UPDATE CASCADE;
