USE [master]
GO
/****** Object:  Database [CourseDb]    Script Date: 9/26/2023 1:49:01 PM ******/
CREATE DATABASE [CourseDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CourseDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\CourseDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CourseDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\CourseDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [CourseDb] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CourseDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CourseDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CourseDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CourseDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CourseDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CourseDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [CourseDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CourseDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CourseDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CourseDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CourseDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CourseDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CourseDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CourseDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CourseDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CourseDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CourseDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CourseDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CourseDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CourseDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CourseDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CourseDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CourseDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CourseDb] SET RECOVERY FULL 
GO
ALTER DATABASE [CourseDb] SET  MULTI_USER 
GO
ALTER DATABASE [CourseDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CourseDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CourseDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CourseDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CourseDb] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'CourseDb', N'ON'
GO
ALTER DATABASE [CourseDb] SET QUERY_STORE = OFF
GO
USE [CourseDb]
GO
/****** Object:  User [adina]    Script Date: 9/26/2023 1:49:01 PM ******/
CREATE USER [adina] FOR LOGIN [adina] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 9/26/2023 1:49:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 9/26/2023 1:49:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Status] [nvarchar](20) NOT NULL,
	[Title] [nvarchar](20) NOT NULL,
	[CoursePrice] [int] NOT NULL,
	[CourseTypeId] [int] NOT NULL,
 CONSTRAINT [PK_Courses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CourseTypes]    Script Date: 9/26/2023 1:49:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CourseName] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_CourseTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Statuses]    Script Date: 9/26/2023 1:49:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Statuses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StatusOption] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Statuses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IX_Courses_CourseTypeId]    Script Date: 9/26/2023 1:49:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_Courses_CourseTypeId] ON [dbo].[Courses]
(
	[CourseTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD  CONSTRAINT [FK_Courses_CourseTypes_CourseTypeId] FOREIGN KEY([CourseTypeId])
REFERENCES [dbo].[CourseTypes] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Courses] CHECK CONSTRAINT [FK_Courses_CourseTypes_CourseTypeId]
GO
USE [master]
GO
ALTER DATABASE [CourseDb] SET  READ_WRITE 
GO
