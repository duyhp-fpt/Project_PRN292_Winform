USE [master]
GO
/****** Object:  Database [LibraryManagement]    Script Date: 22-Mar-21 8:51:34 PM ******/
CREATE DATABASE [LibraryManagement] ON  PRIMARY 
( NAME = N'LibraryManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\LibraryManagement.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LibraryManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\LibraryManagement_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LibraryManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LibraryManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LibraryManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LibraryManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LibraryManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LibraryManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [LibraryManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LibraryManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LibraryManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LibraryManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LibraryManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LibraryManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LibraryManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LibraryManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LibraryManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LibraryManagement] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LibraryManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LibraryManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LibraryManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LibraryManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LibraryManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LibraryManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LibraryManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LibraryManagement] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [LibraryManagement] SET  MULTI_USER 
GO
ALTER DATABASE [LibraryManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LibraryManagement] SET DB_CHAINING OFF 
GO
USE [LibraryManagement]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 22-Mar-21 8:51:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[BookID] [int] IDENTITY(1,1) NOT NULL,
	[BookName] [varchar](50) NULL,
	[Quantity] [int] NULL,
	[BookPrice] [float] NULL,
	[Author] [varchar](50) NULL,
 CONSTRAINT [PK_Books] PRIMARY KEY CLUSTERED 
(
	[BookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Borrows]    Script Date: 22-Mar-21 8:51:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Borrows](
	[BorrowID] [int] IDENTITY(1,1) NOT NULL,
	[StaffID] [int] NULL,
	[StudentEmail] [varchar](50) NULL,
	[BorrowDate] [datetime] NULL,
	[ReturnDate] [datetime] NULL,
	[BookID] [int] NULL,
	[Returned] [bit] NULL,
 CONSTRAINT [PK_Borrows] PRIMARY KEY CLUSTERED 
(
	[BorrowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 22-Mar-21 8:51:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](50) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 22-Mar-21 8:51:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[RoleID] [int] NULL,
	[UserName] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Password] [varbinary](150) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Books] ON 

INSERT [dbo].[Books] ([BookID], [BookName], [Quantity], [BookPrice], [Author]) VALUES (1, N'abcee', 20, 2000, N'Awaken')
INSERT [dbo].[Books] ([BookID], [BookName], [Quantity], [BookPrice], [Author]) VALUES (2, N'hhh', 10, 999000, N'Huy')
INSERT [dbo].[Books] ([BookID], [BookName], [Quantity], [BookPrice], [Author]) VALUES (3, N'eee', 120, 9200, N'Duy')
SET IDENTITY_INSERT [dbo].[Books] OFF
GO
SET IDENTITY_INSERT [dbo].[Borrows] ON 

INSERT [dbo].[Borrows] ([BorrowID], [StaffID], [StudentEmail], [BorrowDate], [ReturnDate], [BookID], [Returned]) VALUES (11, 6, N'student@gmail.com', CAST(N'2021-03-22T17:02:47.160' AS DateTime), CAST(N'2021-03-23T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[Borrows] ([BorrowID], [StaffID], [StudentEmail], [BorrowDate], [ReturnDate], [BookID], [Returned]) VALUES (12, 6, N'student@gmail.com', CAST(N'2021-03-22T17:06:33.123' AS DateTime), CAST(N'2021-03-23T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[Borrows] ([BorrowID], [StaffID], [StudentEmail], [BorrowDate], [ReturnDate], [BookID], [Returned]) VALUES (13, 6, N'student@gmail.com', CAST(N'2021-03-22T17:07:01.077' AS DateTime), CAST(N'2021-03-23T00:00:00.000' AS DateTime), 3, 0)
SET IDENTITY_INSERT [dbo].[Borrows] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (1, N'student')
INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (2, N'librarian')
INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (3, N'admin')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [RoleID], [UserName], [Email], [Password], [Status]) VALUES (5, 1, N'Student', N'student@gmail.com', 0xEC278A38901287B2771A13739520384D43E4B078F78AFFE702DEF108774CCE24, 1)
INSERT [dbo].[Users] ([UserID], [RoleID], [UserName], [Email], [Password], [Status]) VALUES (6, 2, N'Librarian', N'librarian@gmail.com', 0xEC278A38901287B2771A13739520384D43E4B078F78AFFE702DEF108774CCE24, 1)
INSERT [dbo].[Users] ([UserID], [RoleID], [UserName], [Email], [Password], [Status]) VALUES (7, 3, N'Admin', N'admin@gmail.com', 0xEC278A38901287B2771A13739520384D43E4B078F78AFFE702DEF108774CCE24, 1)
INSERT [dbo].[Users] ([UserID], [RoleID], [UserName], [Email], [Password], [Status]) VALUES (8, 1, N'Thuc Pham', N'thucsh2@gmail.com', 0xEC278A38901287B2771A13739520384D43E4B078F78AFFE702DEF108774CCE24, 0)
INSERT [dbo].[Users] ([UserID], [RoleID], [UserName], [Email], [Password], [Status]) VALUES (9, 1, N'AwakenKayz', N'awaken@gmail.com', 0xEC278A38901287B2771A13739520384D43E4B078F78AFFE702DEF108774CCE24, 0)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Users]    Script Date: 22-Mar-21 8:51:34 PM ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [IX_Users] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Borrows] ADD  CONSTRAINT [DF_Borrows_Returned]  DEFAULT ((0)) FOR [Returned]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_RoleID]  DEFAULT ((1)) FOR [RoleID]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Borrows]  WITH CHECK ADD  CONSTRAINT [FK_Borrows_Books] FOREIGN KEY([BookID])
REFERENCES [dbo].[Books] ([BookID])
GO
ALTER TABLE [dbo].[Borrows] CHECK CONSTRAINT [FK_Borrows_Books]
GO
ALTER TABLE [dbo].[Borrows]  WITH CHECK ADD  CONSTRAINT [FK_Borrows_Users] FOREIGN KEY([StaffID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Borrows] CHECK CONSTRAINT [FK_Borrows_Users]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([RoleID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
USE [master]
GO
ALTER DATABASE [LibraryManagement] SET  READ_WRITE 
GO
