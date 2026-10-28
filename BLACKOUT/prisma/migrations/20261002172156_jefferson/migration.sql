-- CreateTable
CREATE TABLE `Cliente` (
    `idCliente` INTEGER NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(100) NOT NULL,
    `email` VARCHAR(250) NOT NULL,
    `senha` VARCHAR(100) NOT NULL,
    `telefone` VARCHAR(20) NULL,

    UNIQUE INDEX `Cliente_email_key`(`email`),
    PRIMARY KEY (`idCliente`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Administrador` (
    `idAdmin` INTEGER NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(100) NOT NULL,
    `senha` VARCHAR(100) NOT NULL,

    PRIMARY KEY (`idAdmin`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Designer` (
    `idDesigner` INTEGER NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(100) NOT NULL,
    `email` VARCHAR(250) NOT NULL,
    `senha` VARCHAR(100) NOT NULL,

    UNIQUE INDEX `Designer_email_key`(`email`),
    PRIMARY KEY (`idDesigner`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Carrinho` (
    `idCarrinho` INTEGER NOT NULL AUTO_INCREMENT,
    `dataCriacao` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `idCliente` INTEGER NOT NULL,

    PRIMARY KEY (`idCarrinho`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Pedido` (
    `idPedido` INTEGER NOT NULL AUTO_INCREMENT,
    `dataPedido` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `idCliente` INTEGER NOT NULL,

    PRIMARY KEY (`idPedido`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Modelo` (
    `idModelo` INTEGER NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(100) NOT NULL,
    `descricao` VARCHAR(500) NULL,
    `precoBase` DECIMAL(10, 2) NOT NULL,
    `idDesigner` INTEGER NOT NULL,

    PRIMARY KEY (`idModelo`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Estampa` (
    `idEstampa` INTEGER NOT NULL AUTO_INCREMENT,
    `nomeEstampa` VARCHAR(100) NOT NULL,
    `arquivoImagem` LONGBLOB NOT NULL,
    `idDesigner` INTEGER NOT NULL,

    PRIMARY KEY (`idEstampa`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `CamisaPersonalizada` (
    `idCamisa` INTEGER NOT NULL AUTO_INCREMENT,
    `textoPersonalizado` VARCHAR(500) NULL,
    `imagemUpload` LONGBLOB NULL,
    `preview` LONGBLOB NULL,
    `idModelo` INTEGER NOT NULL,
    `idEstampa` INTEGER NULL,
    `idCarrinho` INTEGER NULL,
    `idPedido` INTEGER NULL,

    PRIMARY KEY (`idCamisa`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Carrinho` ADD CONSTRAINT `Carrinho_idCliente_fkey` FOREIGN KEY (`idCliente`) REFERENCES `Cliente`(`idCliente`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Pedido` ADD CONSTRAINT `Pedido_idCliente_fkey` FOREIGN KEY (`idCliente`) REFERENCES `Cliente`(`idCliente`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Modelo` ADD CONSTRAINT `Modelo_idDesigner_fkey` FOREIGN KEY (`idDesigner`) REFERENCES `Designer`(`idDesigner`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Estampa` ADD CONSTRAINT `Estampa_idDesigner_fkey` FOREIGN KEY (`idDesigner`) REFERENCES `Designer`(`idDesigner`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CamisaPersonalizada` ADD CONSTRAINT `CamisaPersonalizada_idModelo_fkey` FOREIGN KEY (`idModelo`) REFERENCES `Modelo`(`idModelo`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CamisaPersonalizada` ADD CONSTRAINT `CamisaPersonalizada_idEstampa_fkey` FOREIGN KEY (`idEstampa`) REFERENCES `Estampa`(`idEstampa`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CamisaPersonalizada` ADD CONSTRAINT `CamisaPersonalizada_idCarrinho_fkey` FOREIGN KEY (`idCarrinho`) REFERENCES `Carrinho`(`idCarrinho`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CamisaPersonalizada` ADD CONSTRAINT `CamisaPersonalizada_idPedido_fkey` FOREIGN KEY (`idPedido`) REFERENCES `Pedido`(`idPedido`) ON DELETE SET NULL ON UPDATE CASCADE;
