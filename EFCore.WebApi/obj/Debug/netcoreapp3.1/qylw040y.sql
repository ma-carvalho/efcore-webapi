IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;

GO

CREATE TABLE [Battles] (
    [Id] int NOT NULL IDENTITY,
    [Name] nvarchar(max) NULL,
    [Description] nvarchar(max) NULL,
    [StartDate] datetime2 NOT NULL,
    [EndDate] datetime2 NOT NULL,
    CONSTRAINT [PK_Battles] PRIMARY KEY ([Id])
);

GO

CREATE TABLE [Heroes] (
    [Id] int NOT NULL IDENTITY,
    [Name] int NOT NULL,
    [BattleId] int NOT NULL,
    CONSTRAINT [PK_Heroes] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Heroes_Battles_BattleId] FOREIGN KEY ([BattleId]) REFERENCES [Battles] ([Id]) ON DELETE CASCADE
);

GO

CREATE TABLE [Weapons] (
    [Id] int NOT NULL IDENTITY,
    [Name] nvarchar(max) NULL,
    [HeroId] int NOT NULL,
    CONSTRAINT [PK_Weapons] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Weapons_Heroes_HeroId] FOREIGN KEY ([HeroId]) REFERENCES [Heroes] ([Id]) ON DELETE CASCADE
);

GO

CREATE INDEX [IX_Heroes_BattleId] ON [Heroes] ([BattleId]);

GO

CREATE INDEX [IX_Weapons_HeroId] ON [Weapons] ([HeroId]);

GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20200813143240_initial', N'3.1.7');

GO

