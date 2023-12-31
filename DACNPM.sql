USE [master]
GO
/****** Object:  Database [DACNPM]    Script Date: 30/05/2023 1:16:58 CH ******/
CREATE DATABASE [DACNPM]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DACNPM', FILENAME = N'D:\SQLServer\MSSQL15.SQLEXPRESS01\MSSQL\DATA\DACNPM.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DACNPM_log', FILENAME = N'D:\SQLServer\MSSQL15.SQLEXPRESS01\MSSQL\DATA\DACNPM.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DACNPM] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DACNPM].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DACNPM] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DACNPM] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DACNPM] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DACNPM] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DACNPM] SET ARITHABORT OFF 
GO
ALTER DATABASE [DACNPM] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DACNPM] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DACNPM] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DACNPM] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DACNPM] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DACNPM] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DACNPM] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DACNPM] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DACNPM] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DACNPM] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DACNPM] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DACNPM] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DACNPM] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DACNPM] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DACNPM] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DACNPM] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DACNPM] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DACNPM] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DACNPM] SET  MULTI_USER 
GO
ALTER DATABASE [DACNPM] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DACNPM] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DACNPM] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DACNPM] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DACNPM] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DACNPM] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [DACNPM] SET QUERY_STORE = OFF
GO
USE [DACNPM]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 30/05/2023 1:16:59 CH ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 30/05/2023 1:16:59 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [nchar](10) NOT NULL,
	[CategoryName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 30/05/2023 1:16:59 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderDetailID] [int] IDENTITY(1,1) NOT NULL,
	[Quantity] [int] NULL,
	[SubPrice] [float] NULL,
	[ProductID] [nchar](10) NULL,
	[OrderID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 30/05/2023 1:16:59 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](50) NULL,
	[Email] [nvarchar](150) NULL,
	[Phone] [nchar](10) NULL,
	[Address] [nvarchar](max) NULL,
	[Note] [nvarchar](150) NULL,
	[CreatedAt] [datetime] NULL,
	[Status] [int] NULL,
	[UserID] [nchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 30/05/2023 1:16:59 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [nchar](10) NOT NULL,
	[ProductName] [nvarchar](250) NULL,
	[ProductImageURL] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Price] [float] NULL,
	[CreatedAt] [datetime] NULL,
	[TypeID] [nchar](10) NULL,
	[CategoryID] [nchar](10) NULL,
	[Stock] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductType]    Script Date: 30/05/2023 1:16:59 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductType](
	[TypeID] [nchar](10) NOT NULL,
	[Type] [nchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 30/05/2023 1:16:59 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 30/05/2023 1:16:59 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [nchar](10) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Email] [nvarchar](150) NULL,
	[Password] [nvarchar](100) NULL,
	[Phone] [nchar](10) NULL,
	[FullAddress] [nvarchar](max) NULL,
	[CreatedAt] [datetime] NULL,
	[RoleID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (N'CA0001    ', N'BEST SELLING')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (N'CA0002    ', N'NEW')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (N'CA0003    ', N'NORMAL')
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([OrderDetailID], [Quantity], [SubPrice], [ProductID], [OrderID]) VALUES (17, 1, 599, N'POD0001   ', 22)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [Quantity], [SubPrice], [ProductID], [OrderID]) VALUES (18, 3, 2097, N'POD0004   ', 23)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [Quantity], [SubPrice], [ProductID], [OrderID]) VALUES (21, 8, 6392, N'POD0002   ', 26)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [Quantity], [SubPrice], [ProductID], [OrderID]) VALUES (22, 3, 2397, N'POD0002   ', 27)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [Quantity], [SubPrice], [ProductID], [OrderID]) VALUES (23, 1, 1090, N'POD0007   ', 28)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [Quantity], [SubPrice], [ProductID], [OrderID]) VALUES (24, 3, 1797, N'POD0001   ', 29)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [Quantity], [SubPrice], [ProductID], [OrderID]) VALUES (25, 1, 240, N'POD0034   ', 30)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [Quantity], [SubPrice], [ProductID], [OrderID]) VALUES (26, 1, 1090, N'POD0007   ', 30)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderID], [FullName], [Email], [Phone], [Address], [Note], [CreatedAt], [Status], [UserID]) VALUES (22, N'Văn Lê', N'vanle16032001@gmail.com', N'0372484585', N'ngõ 85 lê văn hiến , phường đức thắng , bắc từ liêm', NULL, CAST(N'2023-05-28T23:36:36.840' AS DateTime), 0, N'USER0001  ')
INSERT [dbo].[Orders] ([OrderID], [FullName], [Email], [Phone], [Address], [Note], [CreatedAt], [Status], [UserID]) VALUES (23, N'Văn Lê', N'vanle16032001@gmail.com', N'0372484585', N'ngõ 85 lê văn hiến , phường đức thắng , bắc từ liêm', NULL, CAST(N'2023-05-28T23:37:55.363' AS DateTime), 0, N'USER0001  ')
INSERT [dbo].[Orders] ([OrderID], [FullName], [Email], [Phone], [Address], [Note], [CreatedAt], [Status], [UserID]) VALUES (26, N'doremon doremi', N'abcdoremi222@gmail.com', N'0372484585', N'vanle16032001@gmail.com', NULL, CAST(N'2023-05-28T23:59:01.363' AS DateTime), 1, N'USER0002  ')
INSERT [dbo].[Orders] ([OrderID], [FullName], [Email], [Phone], [Address], [Note], [CreatedAt], [Status], [UserID]) VALUES (27, N'Văn Lê', N'vanle16032001@gmail.com', N'0372484585', N'HN', NULL, CAST(N'2023-05-29T07:33:36.290' AS DateTime), 1, N'USER0001  ')
INSERT [dbo].[Orders] ([OrderID], [FullName], [Email], [Phone], [Address], [Note], [CreatedAt], [Status], [UserID]) VALUES (28, N'Văn Lê', N'vanle16032001@gmail.com', N'0372484585', N'HN', NULL, CAST(N'2023-05-30T01:29:33.893' AS DateTime), 0, N'USER0001  ')
INSERT [dbo].[Orders] ([OrderID], [FullName], [Email], [Phone], [Address], [Note], [CreatedAt], [Status], [UserID]) VALUES (29, N'Admin Test', N'admin@gmail.com', N'0987654321', N'TH', NULL, CAST(N'2023-05-30T13:07:58.293' AS DateTime), 0, N'USER0003  ')
INSERT [dbo].[Orders] ([OrderID], [FullName], [Email], [Phone], [Address], [Note], [CreatedAt], [Status], [UserID]) VALUES (30, N'Customer Test', N'customer@gmail.com', N'0987865432', N'HN', N'K co gi ', CAST(N'2023-05-30T13:09:14.833' AS DateTime), 0, N'USER0004  ')
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductImageURL], [Description], [Price], [CreatedAt], [TypeID], [CategoryID], [Stock]) VALUES (N'POD0001   ', N'iPhone 12 64GB Genuine', N'https://cdn-v2.didongviet.vn/files/media/catalog/product/i/p/iphone-12-64gb-mau-tim-didongviet.jpg', N'iPhone 12 64GB Genuine orthodox, cheaper than CHEAP TYPES only available at Smartpoint. This smartphone is equipped with a 6.1-inch wide OLED screen for a vivid, realistic experience. Besides, the device is equipped with Apple A14 Bionic chipset (5 nm) with strong performance. Book now for a more than genuine shopping experience.

iPhone 12 64GB VN/A version with good price is the iPhone 12 that you should buy, unless you want the Max or mini version. Compact design but still carries in it high-end configuration and features.



iPhone 12 64GB VN/A – New and familiar design
Not only the 64GB iPhone 12, but this year, all iPhone 12 series devices are completed by an aluminum frame with a flat beveled edge that makes a difference when placed next to last year''s iPhone 11.

Despite the flat edges, the edges and corners of the iPhone 12 are beveled just enough for a comfortable grip.



However, the return to this style has brought a noticeable effect when helping the iPhone 12 64GB give it a more rugged and premium feel. Overall, the phone still shows elegance with two eye-catching front and back glass. This design style is not only more beautiful, but also offers a different grip experience.



Rich iPhone 12 64GB colors and remarkable durability
Instead of narrowing the framework in neutral colors, the Apple iPhone 12 64GB offers a splash of color with five colors including navy blue, red (PRODUCT RED), black, mint green and white. In particular, navy blue is a new color tone and is expected to create a new trend in the mobile village in the near future.

OLED screens are superior to LCDs because they show blacks with deeper colors. The screen has no complaints about color accuracy.



At the event, the Apple representative emphasized the lightweight durable aluminum frame and nanoceramic glass with good bearing capacity. Owners of 64GB iPhone 12 will reduce their worries when the phone encounters an unexpected impact on the screen.



The emergence of 5G and MagSafe technology
As the 5G connection network with the outstanding advantages of 4G LTE is gradually spreading around the world, Apple is also ahead of the trend when bringing the 5G feature to the 64GB iPhone 12. Smart data throttling technology automatically adjusts between 5G or 4G LTE connections to ensure the fastest connection speeds.

iPad 10.2 (2020) 32GB Wifi Genuine (VN/A)

In terms of features, the 64GB iPhone 12 has MagSafe magnet technology on the back, which helps the phone to charge wirelessly faster and combine it with accessories more flexibly.', 599, CAST(N'2023-05-29T08:56:33.873' AS DateTime), N'TYP0001   ', N'CA0001    ', 25)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductImageURL], [Description], [Price], [CreatedAt], [TypeID], [CategoryID], [Stock]) VALUES (N'POD0002   ', N'iPhone 14 128GB Genuine', N'https://cdn-v2.didongviet.vn/files/media/catalog/product/i/p/iphone-14-128gb-didongviet_1.jpg', N'iPhone 14 128GB Genuine orthodox, cheaper than CHEAP TYPEs only available at Smartpoint. With a trendy design and modern features, this smartphone will give you an emotional experience with endless creativity from 2 12MP cameras, combined with powerful performance from Apple A15 Bionic 6 chipset core. Besides, with a large battery capacity allows users to experience a long time. Book now for a more than genuine shopping experience.

The recently released 128GB iPhone 14 continues to stir up the smartphone market and is enthusiastically welcomed by iFan. Super product iPhone 14 has many improvements in design as well as performance to bring many interesting experiences to users.
The super-powerful Apple A15 Bionic chip manufactured on the 5nm process helps iPhone 14 achieve impressive performance when the GPU is up to 35% and the CPU is up to 42% compared to its predecessor.

Thanks to improved performance, users get a better experience on their phones when using photo editing applications or fighting high-graphics games smoothly.', 799, CAST(N'2023-05-29T08:58:41.090' AS DateTime), N'TYP0001   ', N'CA0002    ', 30)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductImageURL], [Description], [Price], [CreatedAt], [TypeID], [CategoryID], [Stock]) VALUES (N'POD0004   ', N'iPhone 13 128GB Genuine ', N'https://cdn-v2.didongviet.vn/files/media/catalog/product/i/p/iphone-13-128gb-didongviet_1.jpg', N'iPhone 13 128GB Genuine orthodox, cheaper than CHEAP TYPEs only available at Smartpoint. With a trendy design and modern features, this smartphone will give you an emotional experience with endless creativity from 2 12MP cameras, combined with powerful performance from Apple A15 Bionic 6 chipset core. Besides, with a large battery capacity allows users to experience a long time. Book now for a more than genuine shopping experience.

The recently released 128GB iPhone 14 continues to stir up the smartphone market and is enthusiastically welcomed by iFan. Super product iPhone 14 has many improvements in design as well as performance to bring many interesting experiences to users.
The super-powerful Apple A15 Bionic chip manufactured on the 5nm process helps iPhone 14 achieve impressive performance when the GPU is up to 35% and the CPU is up to 42% compared to its predecessor.

Thanks to improved performance, users get a better experience on their phones when using photo editing applications or fighting high-graphics games smoothly.', 699, CAST(N'2023-05-29T09:03:16.080' AS DateTime), N'TYP0001   ', N'CA0001    ', 10)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductImageURL], [Description], [Price], [CreatedAt], [TypeID], [CategoryID], [Stock]) VALUES (N'POD0005   ', N'OPPO Find N2 Flip 256GB Genuine', N'https://cdn-v2.didongviet.vn/files/media/catalog/product/o/p/oppo-find-n2-flip-256gb-1-didongviet.jpg', N'OPPO Find N2 Flip 256GB has a youthful and modern design. This smartphone is equipped with a 6.8-inch AMOLED screen with Full HD resolution to provide a smooth experience. Besides, it also has strong operation ability for users to comfortably use tasks from basic to advanced.
OPPO Find N2 Flip - Folding screen without folds, impressive mirror camera
OPPO Find N2 Flip is OPPO''s first folding phone launched in Vietnam market. The next generation of OPPO brand''s folding screen smartphone still possesses a sophisticated appearance that makes it easy to pocket and carry around. In addition, the phone''s photo quality is also better upgraded with new photography technology.
OPPO Find N2 Flip brings a whole new experience with stealth folds. Thanks to the premium hinge with a teardrop shape, the phone has less wrinkles than many other folding phones on the market. The durability of the device is also appreciated thanks to the use of specialized materials in the aviation field. This is the result of the company''s 5-year research on this phone segment.
OPPO Find N2 Flip owns a pair of main cameras arranged vertically, parallel to the secondary screen. In particular, the wide-angle camera has a 50MP sensor with f/1.8 aperture and an 8MP ultra-wide-angle camera with f/2.2 aperture. In particular, OPPO has cooperated with Hasselblad to develop an imaging system for the camera. An NPU image processor called MariSilicon X helps capture images with better natural colors as well as allows users to customize the sensor color,...
OPPO Find N2 Flip owns a battery with a capacity of 4300mAh. This is an impressive battery level combined with the excellent power savings of the Dimensity 9000+ chip. This helps optimize usage time higher than, allowing users to watch videos continuously for 20 hours. In addition, users can also surf social networks for 16 hours and video calls for 6 hours. This shows that the daily use needs of users are well met.', 850, CAST(N'2023-05-29T08:36:45.157' AS DateTime), N'TYP0007   ', N'CA0002    ', 6)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductImageURL], [Description], [Price], [CreatedAt], [TypeID], [CategoryID], [Stock]) VALUES (N'POD0006   ', N'iPhone 14 Plus 128GB Genuine', N'https://cdn-v2.didongviet.vn/files/media/catalog/product/i/p/iphone-14-plus-128gb-didongviet_1.jpg', N'iPhone 14 128GB Genuine orthodox, cheaper than CHEAP TYPEs only available at Smartpoint. With a trendy design and modern features, this smartphone will give you an emotional experience with endless creativity from 2 12MP cameras, combined with powerful performance from Apple A15 Bionic 6 chipset core. Besides, with a large battery capacity allows users to experience a long time. Book now for a more than genuine shopping experience.

The recently released 128GB iPhone 14 continues to stir up the smartphone market and is enthusiastically welcomed by iFan. Super product iPhone 14 has many improvements in design as well as performance to bring many interesting experiences to users.
The super-powerful Apple A15 Bionic chip manufactured on the 5nm process helps iPhone 14 achieve impressive performance when the GPU is up to 35% and the CPU is up to 42% compared to its predecessor.

Thanks to improved performance, users get a better experience on their phones when using photo editing applications or fighting high-graphics games smoothly.', 890, CAST(N'2023-05-29T09:04:51.817' AS DateTime), N'TYP0001   ', N'CA0001    ', 10)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductImageURL], [Description], [Price], [CreatedAt], [TypeID], [CategoryID], [Stock]) VALUES (N'POD0007   ', N'iPhone 14 Pro Max 256GB Genuine', N'https://cdn-v2.didongviet.vn/files/media/catalog/product/i/p/iphone-13-pro-max-128gb-didongviet_1_1.jpg', N'iPhone 14 Pro Max 256GB Genuine orthodox, cheaper than CHEAP TYPEs only available at Smartpoint. With a trendy design and modern features, this smartphone will give you an emotional experience with endless creativity from 2 12MP cameras, combined with powerful performance from Apple A15 Bionic 6 chipset core. Besides, with a large battery capacity allows users to experience a long time. Book now for a more than genuine shopping experience.

The recently released 128GB iPhone 14 continues to stir up the smartphone market and is enthusiastically welcomed by iFan. Super product iPhone 14 has many improvements in design as well as performance to bring many interesting experiences to users.
The super-powerful Apple A15 Bionic chip manufactured on the 5nm process helps iPhone 14 achieve impressive performance when the GPU is up to 35% and the CPU is up to 42% compared to its predecessor.

Thanks to improved performance, users get a better experience on their phones when using photo editing applications or fighting high-graphics games smoothly.', 1090, CAST(N'2023-05-29T09:06:29.837' AS DateTime), N'TYP0001   ', N'CA0002    ', 10)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductImageURL], [Description], [Price], [CreatedAt], [TypeID], [CategoryID], [Stock]) VALUES (N'POD0008   ', N'iPhone 14 Pro 128GB Genuine', N'https://cdn-v2.didongviet.vn/files/media/catalog/product/i/p/iphone-13-pro-256gb-didongviet_1.jpg', N'iPhone 14 Pro 128GB Genuine orthodox, cheaper than CHEAP TYPEs only available at Smartpoint. With a trendy design and modern features, this smartphone will give you an emotional experience with endless creativity from 2 12MP cameras, combined with powerful performance from Apple A15 Bionic 6 chipset core. Besides, with a large battery capacity allows users to experience a long time. Book now for a more than genuine shopping experience.

The recently released 128GB iPhone 14 continues to stir up the smartphone market and is enthusiastically welcomed by iFan. Super product iPhone 14 has many improvements in design as well as performance to bring many interesting experiences to users.
The super-powerful Apple A15 Bionic chip manufactured on the 5nm process helps iPhone 14 achieve impressive performance when the GPU is up to 35% and the CPU is up to 42% compared to its predecessor.

Thanks to improved performance, users get a better experience on their phones when using photo editing applications or fighting high-graphics games smoothly.', 990, CAST(N'2023-05-29T09:07:30.030' AS DateTime), N'TYP0001   ', N'CA0001    ', 10)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductImageURL], [Description], [Price], [CreatedAt], [TypeID], [CategoryID], [Stock]) VALUES (N'POD0009   ', N'iPhone 13 Pro 128GB Genuine ', N'https://cdn-v2.didongviet.vn/files/media/catalog/product/i/p/iphone-13-pro-128gb-didongviet.jpg', N'iPhone 13 Pro 128GB Genuine orthodox, cheaper than CHEAP TYPEs only available at Smartpoint. With a trendy design and modern features, this smartphone will give you an emotional experience with endless creativity from 2 12MP cameras, combined with powerful performance from Apple A15 Bionic 6 chipset core. Besides, with a large battery capacity allows users to experience a long time. Book now for a more than genuine shopping experience.

The recently released 128GB iPhone 14 continues to stir up the smartphone market and is enthusiastically welcomed by iFan. Super product iPhone 14 has many improvements in design as well as performance to bring many interesting experiences to users.
The super-powerful Apple A15 Bionic chip manufactured on the 5nm process helps iPhone 14 achieve impressive performance when the GPU is up to 35% and the CPU is up to 42% compared to its predecessor.

Thanks to improved performance, users get a better experience on their phones when using photo editing applications or fighting high-graphics games smoothly.', 799, CAST(N'2023-05-29T09:09:04.687' AS DateTime), N'TYP0001   ', N'CA0001    ', 10)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductImageURL], [Description], [Price], [CreatedAt], [TypeID], [CategoryID], [Stock]) VALUES (N'POD0010   ', N'iPhone 13 ProMax 128GB Genuine ', N'https://cdn-v2.didongviet.vn/files/media/catalog/product/i/p/iphone-13-pro-max-128gb-didongviet.jpg', N'iPhone 13 ProMax 128GB Genuine orthodox, cheaper than CHEAP TYPEs only available at Smartpoint. With a trendy design and modern features, this smartphone will give you an emotional experience with endless creativity from 2 12MP cameras, combined with powerful performance from Apple A15 Bionic 6 chipset core. Besides, with a large battery capacity allows users to experience a long time. Book now for a more than genuine shopping experience.

The recently released 128GB iPhone 14 continues to stir up the smartphone market and is enthusiastically welcomed by iFan. Super product iPhone 14 has many improvements in design as well as performance to bring many interesting experiences to users.
The super-powerful Apple A15 Bionic chip manufactured on the 5nm process helps iPhone 14 achieve impressive performance when the GPU is up to 35% and the CPU is up to 42% compared to its predecessor.

Thanks to improved performance, users get a better experience on their phones when using photo editing applications or fighting high-graphics games smoothly.', 990, CAST(N'2023-05-29T09:10:29.460' AS DateTime), N'TYP0001   ', N'CA0001    ', 10)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductImageURL], [Description], [Price], [CreatedAt], [TypeID], [CategoryID], [Stock]) VALUES (N'POD0011   ', N'iPhone 12 128GB Genuine', N'https://cdn-v2.didongviet.vn/files/media/catalog/product/i/p/iphone-12-64gb-didongviet.jpeg', N'iPhone 12 128GB Genuine orthodox, cheaper than CHEAP TYPES only available at Smartpoint. This smartphone is equipped with a 6.1-inch wide OLED screen for a vivid, realistic experience. Besides, the device is equipped with Apple A14 Bionic chipset (5 nm) with strong performance. Book now for a more than genuine shopping experience.

iPhone 12 64GB VN/A version with good price is the iPhone 12 that you should buy, unless you want the Max or mini version. Compact design but still carries in it high-end configuration and features.



iPhone 12 64GB VN/A – New and familiar design
Not only the 64GB iPhone 12, but this year, all iPhone 12 series devices are completed by an aluminum frame with a flat beveled edge that makes a difference when placed next to last year''s iPhone 11.

Despite the flat edges, the edges and corners of the iPhone 12 are beveled just enough for a comfortable grip.



However, the return to this style has brought a noticeable effect when helping the iPhone 12 64GB give it a more rugged and premium feel. Overall, the phone still shows elegance with two eye-catching front and back glass. This design style is not only more beautiful, but also offers a different grip experience.



Rich iPhone 12 64GB colors and remarkable durability
Instead of narrowing the framework in neutral colors, the Apple iPhone 12 64GB offers a splash of color with five colors including navy blue, red (PRODUCT RED), black, mint green and white. In particular, navy blue is a new color tone and is expected to create a new trend in the mobile village in the near future.

OLED screens are superior to LCDs because they show blacks with deeper colors. The screen has no complaints about color accuracy.



At the event, the Apple representative emphasized the lightweight durable aluminum frame and nanoceramic glass with good bearing capacity. Owners of 64GB iPhone 12 will reduce their worries when the phone encounters an unexpected impact on the screen.



The emergence of 5G and MagSafe technology
As the 5G connection network with the outstanding advantages of 4G LTE is gradually spreading around the world, Apple is also ahead of the trend when bringing the 5G feature to the 64GB iPhone 12. Smart data throttling technology automatically adjusts between 5G or 4G LTE connections to ensure the fastest connection speeds.

iPad 10.2 (2020) 32GB Wifi Genuine (VN/A)

In terms of features, the 64GB iPhone 12 has MagSafe magnet technology on the back, which helps the phone to charge wirelessly faster and combine it with accessories more flexibly.', 650, CAST(N'2023-05-29T09:11:56.577' AS DateTime), N'TYP0001   ', N'CA0001    ', 10)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductImageURL], [Description], [Price], [CreatedAt], [TypeID], [CategoryID], [Stock]) VALUES (N'POD0012   ', N'Samsung Galaxy S23 Ultra 5G 256GB Genuine', N'https://cdn-v2.didongviet.vn/files/media/catalog/product/s/a/samsung-galaxy-s23-ultra-5g-mau-xanh.png', N'Galaxy S23 Ultra 5G 256GB has a premium design with a 6.8-inch screen with a resolution of 3088 x 1440 pixels, Dynamic AMOLED 2X panel with 120Hz refresh rate, powerful configuration with Snapdragon 8 Gen 2 processor. 200MP main camera. delivers top-notch photography that supports a variety of shooting modes.

Samsung Galaxy S23 Ultra 5G 256GB will surely stir up SamFan with the great upgrades that the brand is ready to present to its customers. Especially important upgrade in chipset and camera cluster with super high resolution. Please continue to follow the article below to find out in detail why this phone is so hot.
The flagship Samsung Galaxy S23 Ultra 5G 256GB was launched with a large screen - 6.8 inches to serve customers who have an important need for screen configuration when buying a phone. Coupled with the 6.8-inch size is a Dynamic AMOLED 2X panel, LTPO 2.0 technology with a resolution of 1-120Hz that automatically adjusts to the light to save more battery and protect your eyes in all lighting conditions. bright. Galaxy S23 Ultra 256GB will operate on the unprecedented "terrible" power once again from the manufacturer of processors for high-end smartphones - Qualcomm. The chipset is called Snapdragon 8 Gen 2. A fresh upgrade in general performance so that the device can meet all your work and entertainment needs.', 999, CAST(N'2023-05-29T09:15:46.663' AS DateTime), N'TYP0002   ', N'CA0002    ', 10)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductImageURL], [Description], [Price], [CreatedAt], [TypeID], [CategoryID], [Stock]) VALUES (N'POD0013   ', N'Samsung Galaxy S22 Ultra 5G 256GB Genuine', N'https://cdn-v2.didongviet.vn/files/media/catalog/product/s/a/samsung-galaxy-s22-ultra-256gb-didongviet_4.jpg', N'Galaxy S22 Ultra 5G 256GB has a premium design with a 6.8-inch screen with a resolution of 3088 x 1440 pixels, Dynamic AMOLED 2X panel with 120Hz refresh rate, powerful configuration with Snapdragon 8 Gen 2 processor. 200MP main camera. delivers top-notch photography that supports a variety of shooting modes.

Samsung Galaxy S23 Ultra 5G 256GB will surely stir up SamFan with the great upgrades that the brand is ready to present to its customers. Especially important upgrade in chipset and camera cluster with super high resolution. Please continue to follow the article below to find out in detail why this phone is so hot.
The flagship Samsung Galaxy S22 Ultra 5G 256GB was launched with a large screen - 6.8 inches to serve customers who have an important need for screen configuration when buying a phone. Coupled with the 6.8-inch size is a Dynamic AMOLED 2X panel, LTPO 2.0 technology with a resolution of 1-120Hz that automatically adjusts to the light to save more battery and protect your eyes in all lighting conditions. bright. Galaxy S22 Ultra 256GB will operate on the unprecedented "terrible" power once again from the manufacturer of processors for high-end smartphones - Qualcomm. The chipset is called Snapdragon 8 Gen 2. A fresh upgrade in general performance so that the device can meet all your work and entertainment needs.', 899, CAST(N'2023-05-29T09:17:21.983' AS DateTime), N'TYP0002   ', N'CA0001    ', 10)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductImageURL], [Description], [Price], [CreatedAt], [TypeID], [CategoryID], [Stock]) VALUES (N'POD0014   ', N'Samsung Galaxy S22 Plus 5G 256GB Genuine', N'https://cdn-v2.didongviet.vn/files/media/catalog/product/s/a/samsung-galaxy-s22-plus-256gb-didongviet.jpg', N'Samsung Galaxy S22 Plus 5G 256GB has a premium design with a 6.8-inch screen with a resolution of 3088 x 1440 pixels, Dynamic AMOLED 2X panel with 120Hz refresh rate, powerful configuration with Snapdragon 8 Gen 2 processor. 200MP main camera. delivers top-notch photography that supports a variety of shooting modes.

Samsung Galaxy S23 Ultra 5G 256GB will surely stir up SamFan with the great upgrades that the brand is ready to present to its customers. Especially important upgrade in chipset and camera cluster with super high resolution. Please continue to follow the article below to find out in detail why this phone is so hot.
The flagship Samsung Galaxy S23 Ultra 5G 256GB was launched with a large screen - 6.8 inches to serve customers who have an important need for screen configuration when buying a phone. Coupled with the 6.8-inch size is a Dynamic AMOLED 2X panel, LTPO 2.0 technology with a resolution of 1-120Hz that automatically adjusts to the light to save more battery and protect your eyes in all lighting conditions. bright. Galaxy S23 Ultra 256GB will operate on the unprecedented "terrible" power once again from the manufacturer of processors for high-end smartphones - Qualcomm. The chipset is called Snapdragon 8 Gen 2. A fresh upgrade in general performance so that the device can meet all your work and entertainment needs.', 750, CAST(N'2023-05-29T09:18:32.220' AS DateTime), N'TYP0002   ', N'CA0001    ', 10)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductImageURL], [Description], [Price], [CreatedAt], [TypeID], [CategoryID], [Stock]) VALUES (N'POD0015   ', N'Samsung Galaxy S23 Plus 5G 256GB Genuine', N'https://cdn-v2.didongviet.vn/files/media/catalog/product/s/a/samsung-galaxy-s23-mau-tim-1-didongviet_1.jpg', N'Samsung Galaxy S23 Plus 5G 256GB Genuine has a premium design with a 6.8-inch screen with a resolution of 3088 x 1440 pixels, Dynamic AMOLED 2X panel with 120Hz refresh rate, powerful configuration with Snapdragon 8 Gen 2 processor. 200MP main camera. delivers top-notch photography that supports a variety of shooting modes.

Samsung Galaxy S23 Ultra 5G 256GB will surely stir up SamFan with the great upgrades that the brand is ready to present to its customers. Especially important upgrade in chipset and camera cluster with super high resolution. Please continue to follow the article below to find out in detail why this phone is so hot.
The flagship Samsung Galaxy S23 Ultra 5G 256GB was launched with a large screen - 6.8 inches to serve customers who have an important need for screen configuration when buying a phone. Coupled with the 6.8-inch size is a Dynamic AMOLED 2X panel, LTPO 2.0 technology with a resolution of 1-120Hz that automatically adjusts to the light to save more battery and protect your eyes in all lighting conditions. bright. Galaxy S23 Ultra 256GB will operate on the unprecedented "terrible" power once again from the manufacturer of processors for high-end smartphones - Qualcomm. The chipset is called Snapdragon 8 Gen 2. A fresh upgrade in general performance so that the device can meet all your work and entertainment needs.', 850, CAST(N'2023-05-29T09:19:36.140' AS DateTime), N'TYP0002   ', N'CA0002    ', 10)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductImageURL], [Description], [Price], [CreatedAt], [TypeID], [CategoryID], [Stock]) VALUES (N'POD0016   ', N'Samsung Galaxy S23 5G 256GB Genuine', N'https://cdn-v2.didongviet.vn/files/media/catalog/product/s/a/samsung-galaxy-s23-mau-den-1-didongviet_6.jpg', N'Samsung Galaxy S23 5G 256GB Genuine has a premium design with a 6.8-inch screen with a resolution of 3088 x 1440 pixels, Dynamic AMOLED 2X panel with 120Hz refresh rate, powerful configuration with Snapdragon 8 Gen 2 processor. 200MP main camera. delivers top-notch photography that supports a variety of shooting modes.

Samsung Galaxy S23 Ultra 5G 256GB will surely stir up SamFan with the great upgrades that the brand is ready to present to its customers. Especially important upgrade in chipset and camera cluster with super high resolution. Please continue to follow the article below to find out in detail why this phone is so hot.
The flagship Samsung Galaxy S23 Ultra 5G 256GB was launched with a large screen - 6.8 inches to serve customers who have an important need for screen configuration when buying a phone. Coupled with the 6.8-inch size is a Dynamic AMOLED 2X panel, LTPO 2.0 technology with a resolution of 1-120Hz that automatically adjusts to the light to save more battery and protect your eyes in all lighting conditions. bright. Galaxy S23 Ultra 256GB will operate on the unprecedented "terrible" power once again from the manufacturer of processors for high-end smartphones - Qualcomm. The chipset is called Snapdragon 8 Gen 2. A fresh upgrade in general performance so that the device can meet all your work and entertainment needs.', 899, CAST(N'2023-05-29T09:20:53.680' AS DateTime), N'TYP0002   ', N'CA0003    ', 10)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductImageURL], [Description], [Price], [CreatedAt], [TypeID], [CategoryID], [Stock]) VALUES (N'POD0017   ', N'Samsung Galaxy Z Flip4 5G 256GB Genuine', N'https://cdn-v2.didongviet.vn/files/media/catalog/product/s/a/samsung-galaxy-z-flip4-5g-256gb-didongviet_1_1_1.jpg', N'Genuine Samsung Galaxy Z Flip4 256GB 5G (BHĐT) has a luxurious new design, bringing many upgrades with a large screen, Full HD + resolution. The device runs on Android 12 operating system along with many valuable upgrades. Battery capacity for all day use. 
Z Flip4 5G 256GB (HDD) was born following the success of its predecessor Galaxy Z Flip3. In this version, the Samsung family has only slightly changed the external appearance because they focus on perfecting the internal performance for the device to become complete and meet the needs of users.
Samsung Z Flip4 256GB 5G (BOD) possesses a compact design combined with a perfectly curved edge to provide a comfortable and firm grip for users.

Besides, this smartphone has a variety of color versions for users to freely choose according to their own preferences and style.
Samsung Galaxy Z Flip4 5G 256GB version (BHĐT) is equipped with Dynamic AMOLED 2X screen technology with Full HD + resolution for brilliant display colors, every detail is reproduced in a true way.

With a 6.7-inch wide screen, it gives users a screen experience just enough for entertainment, reading newspapers, watching movies.', 1050, CAST(N'2023-05-29T09:22:29.913' AS DateTime), N'TYP0002   ', N'CA0003    ', 10)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductImageURL], [Description], [Price], [CreatedAt], [TypeID], [CategoryID], [Stock]) VALUES (N'POD0018   ', N'Samsung Galaxy Z Fold4 5G 512GB Genuine', N'https://cdn-v2.didongviet.vn/files/media/catalog/product/s/a/samsung-galaxy-z-fold4-512gb-didongviet_1.jpg', N'Genuine Samsung Galaxy Z Flip4 256GB 5G (BHĐT) has a luxurious new design, bringing many upgrades with a large screen, Full HD + resolution. The device runs on Android 12 operating system along with many valuable upgrades. Battery capacity for all day use. 
Z Flip4 5G 256GB (HDD) was born following the success of its predecessor Galaxy Z Flip3. In this version, the Samsung family has only slightly changed the external appearance because they focus on perfecting the internal performance for the device to become complete and meet the needs of users.
Samsung Z Flip4 256GB 5G (BOD) possesses a compact design combined with a perfectly curved edge to provide a comfortable and firm grip for users.

Besides, this smartphone has a variety of color versions for users to freely choose according to their own preferences and style.
Samsung Galaxy Z Flip4 5G 256GB version (BHĐT) is equipped with Dynamic AMOLED 2X screen technology with Full HD + resolution for brilliant display colors, every detail is reproduced in a true way.

With a 6.7-inch wide screen, it gives users a screen experience just enough for entertainment, reading newspapers, watching movies.', 980, CAST(N'2023-05-29T09:23:58.530' AS DateTime), N'TYP0002   ', N'CA0003    ', 5)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductImageURL], [Description], [Price], [CreatedAt], [TypeID], [CategoryID], [Stock]) VALUES (N'POD0019   ', N'Samsung Galaxy A53 128GB Genuine', N'https://cdn-v2.didongviet.vn/files/media/catalog/product/s/a/samsung-galaxy-a53-5g-128gb-didongviet.jpg', N'Samsung Galaxy A53 has a trendy design, 6.5-inch Super AMOLED screen, Full HD + resolution, strong performance with Exynos 1200 processor, 5000mAh large battery capacity combined with 25W fast charging. This is a smartphone suitable for users who like youthful, wide-screen devices at an affordable price.
This year, with the message "Brilliant Original", Samsung''s latest phone launches 4 youthful and fresh color versions. Those are the colors: Black, White, Peach Orange and Blue that are extremely suitable for dynamic and personality young people. At the same time, it is also suitable for those who love soft and gentle tones.

Samsung Galaxy A53 has dimensions of 159.6 x 74.8 x 8.1mm with a weight of 189g very compact. Accordingly, the device is designed from high-quality monolithic plastic and provides a gentle grip. Combined with the back surface is rough to help users limit fingerprints left on here.', 300, CAST(N'2023-05-29T09:27:03.040' AS DateTime), N'TYP0002   ', N'CA0003    ', 10)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductImageURL], [Description], [Price], [CreatedAt], [TypeID], [CategoryID], [Stock]) VALUES (N'POD0020   ', N'iPhone 11 64GB Genuine', N'https://cdn-v2.didongviet.vn/files/products/2023/4/9/1/1683605592281_thumb_iphone_11_didongviet.jpg', N'Genuine iPhone 11 128GB (VN/A) orthodox, cheaper than CHEAP TYPEs only available at Smartpoint. With a trendy design and modern features, this smartphone will bring you an emotional experience with endless creativity from 2 12MP cameras, combined with powerful performance from Apple A13 Bionic chipset. produced on the 7nm process. Besides, with a large battery capacity allows users to experience a long time. Book now for a more than genuine shopping experience.', 589, CAST(N'2023-05-29T09:29:58.210' AS DateTime), N'TYP0001   ', N'CA0001    ', 10)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductImageURL], [Description], [Price], [CreatedAt], [TypeID], [CategoryID], [Stock]) VALUES (N'POD0021   ', N'Samsung Galaxy A73 128GB Genuine', N'https://cdn-v2.didongviet.vn/files/media/catalog/product/s/a/samsung-galaxy-a73-didongviet_1.jpg', N'Samsung Galaxy A73 has a trendy design, 6.5-inch Super AMOLED screen, Full HD + resolution, strong performance with Exynos 1200 processor, 5000mAh large battery capacity combined with 25W fast charging. This is a smartphone suitable for users who like youthful, wide-screen devices at an affordable price.
This year, with the message "Brilliant Original", Samsung''s latest phone launches 4 youthful and fresh color versions. Those are the colors: Black, White, Peach Orange and Blue that are extremely suitable for dynamic and personality young people. At the same time, it is also suitable for those who love soft and gentle tones.

Samsung Galaxy A53 has dimensions of 159.6 x 74.8 x 8.1mm with a weight of 189g very compact. Accordingly, the device is designed from high-quality monolithic plastic and provides a gentle grip. Combined with the back surface is rough to help users limit fingerprints left on here.', 400, CAST(N'2023-05-29T09:31:27.220' AS DateTime), N'TYP0002   ', N'CA0003    ', 20)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductImageURL], [Description], [Price], [CreatedAt], [TypeID], [CategoryID], [Stock]) VALUES (N'POD0022   ', N' Samsung Galaxy A04s 64GB Genuine', N'https://cdn-v2.didongviet.vn/files/media/catalog/product/g/a/galaxy-a04s-didongviet.jpg', N'Samsung Galaxy A53 has a trendy design, 6.5-inch Super AMOLED screen, Full HD + resolution, strong performance with Exynos 1200 processor, 5000mAh large battery capacity combined with 25W fast charging. This is a smartphone suitable for users who like youthful, wide-screen devices at an affordable price.
This year, with the message "Brilliant Original", Samsung''s latest phone launches 4 youthful and fresh color versions. Those are the colors: Black, White, Peach Orange and Blue that are extremely suitable for dynamic and personality young people. At the same time, it is also suitable for those who love soft and gentle tones.

Samsung Galaxy A53 has dimensions of 159.6 x 74.8 x 8.1mm with a weight of 189g very compact. Accordingly, the device is designed from high-quality monolithic plastic and provides a gentle grip. Combined with the back surface is rough to help users limit fingerprints left on here.', 189, CAST(N'2023-05-29T09:32:21.520' AS DateTime), N'TYP0002   ', N'CA0003    ', 20)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductImageURL], [Description], [Price], [CreatedAt], [TypeID], [CategoryID], [Stock]) VALUES (N'POD0023   ', N'Samsung Galaxy A54 5G 128GB Genuine', N'https://cdn-v2.didongviet.vn/files/media/catalog/product/s/a/samsung-galaxy-a54-128gb-den-didongviet.jpg', N'Samsung Galaxy A53 has a trendy design, 6.5-inch Super AMOLED screen, Full HD + resolution, strong performance with Exynos 1200 processor, 5000mAh large battery capacity combined with 25W fast charging. This is a smartphone suitable for users who like youthful, wide-screen devices at an affordable price.
This year, with the message "Brilliant Original", Samsung''s latest phone launches 4 youthful and fresh color versions. Those are the colors: Black, White, Peach Orange and Blue that are extremely suitable for dynamic and personality young people. At the same time, it is also suitable for those who love soft and gentle tones.

Samsung Galaxy A53 has dimensions of 159.6 x 74.8 x 8.1mm with a weight of 189g very compact. Accordingly, the device is designed from high-quality monolithic plastic and provides a gentle grip. Combined with the back surface is rough to help users limit fingerprints left on here.', 250, CAST(N'2023-05-29T09:33:01.763' AS DateTime), N'TYP0002   ', N'CA0001    ', 20)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductImageURL], [Description], [Price], [CreatedAt], [TypeID], [CategoryID], [Stock]) VALUES (N'POD0024   ', N'Samsung Galaxy A23 5G 128GB Genuine', N'https://cdn-v2.didongviet.vn/files/media/catalog/product/s/a/samsung-galaxy-a23-5g-mau-cam-didongviet.jpg', N'Samsung Galaxy A53 has a trendy design, 6.5-inch Super AMOLED screen, Full HD + resolution, strong performance with Exynos 1200 processor, 5000mAh large battery capacity combined with 25W fast charging. This is a smartphone suitable for users who like youthful, wide-screen devices at an affordable price.
This year, with the message "Brilliant Original", Samsung''s latest phone launches 4 youthful and fresh color versions. Those are the colors: Black, White, Peach Orange and Blue that are extremely suitable for dynamic and personality young people. At the same time, it is also suitable for those who love soft and gentle tones.

Samsung Galaxy A53 has dimensions of 159.6 x 74.8 x 8.1mm with a weight of 189g very compact. Accordingly, the device is designed from high-quality monolithic plastic and provides a gentle grip. Combined with the back surface is rough to help users limit fingerprints left on here.', 240, CAST(N'2023-05-29T09:33:53.283' AS DateTime), N'TYP0002   ', N'CA0001    ', 20)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductImageURL], [Description], [Price], [CreatedAt], [TypeID], [CategoryID], [Stock]) VALUES (N'POD0025   ', N'Xiaomi Redmi Note 11S 128G Genuine', N'https://cdn-v2.didongviet.vn/files/media/catalog/product/x/i/xiaomi-redmi-note-11s-128gb-didongviet.jpg', N'Xiaomi Redmi Note 11s 128GB is a cheap phone from Xiaomi, it has a screen of 6.43 inches. Stable configuration with Helio G96 chipset. In addition, the device also has a cluster of 4 cameras with a 108MP sensor, suitable for all users.
Regarding the design of Xiaomi Redmi Note 11S, there is no need to discuss too much because it possesses an extremely modern, youthful and solid design. This smartphone is suitable for all subjects from students, students to working people.

The thickness of the Redmi Note 11S is only 8.09mm and the weight is 179g, a phone with a moderate size you can take anywhere. The back of the device is finished from gray plastic material to increase friction. when holding and at the same time limiting fingerprints. Xiaomi Redmi Note 11S phone has strong performance power with octa-core MediaTek Helio G96. All tasks are handled quickly and smoothly thanks to 2 cores running at 2.05 GHz and 6 cores at 2.0 GHz. Combined with 8GB of Ram memory for a good experience, all applications from light to heavy are responded to instantly.', 299, CAST(N'2023-05-29T09:36:15.717' AS DateTime), N'TYP0003   ', N'CA0001    ', 20)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductImageURL], [Description], [Price], [CreatedAt], [TypeID], [CategoryID], [Stock]) VALUES (N'POD0026   ', N'Xiaomi 12T 128GB Genuine', N'https://cdn-v2.didongviet.vn/files/media/catalog/product/x/i/xiaomi-12t-128gb-didongviet.jpg', N'Xiaomi 12T 128GB Genuine is a cheap phone from Xiaomi, it has a screen of 6.43 inches. Stable configuration with Helio G96 chipset. In addition, the device also has a cluster of 4 cameras with a 108MP sensor, suitable for all users.
Regarding the design of Xiaomi Redmi Note 11S, there is no need to discuss too much because it possesses an extremely modern, youthful and solid design. This smartphone is suitable for all subjects from students, students to working people.

The thickness of the Redmi Note 11S is only 8.09mm and the weight is 179g, a phone with a moderate size you can take anywhere. The back of the device is finished from gray plastic material to increase friction. when holding and at the same time limiting fingerprints. Xiaomi Redmi Note 11S phone has strong performance power with octa-core MediaTek Helio G96. All tasks are handled quickly and smoothly thanks to 2 cores running at 2.05 GHz and 6 cores at 2.0 GHz. Combined with 8GB of Ram memory for a good experience, all applications from light to heavy are responded to instantly.', 450, CAST(N'2023-05-29T09:37:34.337' AS DateTime), N'TYP0003   ', N'CA0001    ', 7)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductImageURL], [Description], [Price], [CreatedAt], [TypeID], [CategoryID], [Stock]) VALUES (N'POD0027   ', N'Xiaomi Redmi A1 32GB Genuine', N'https://cdn-v2.didongviet.vn/files/media/catalog/product/x/i/xiaomi-redmi-a1-didongviet.png', N'Xiaomi Redmi A1 32GB Genuine is a cheap phone from Xiaomi, it has a screen of 6.43 inches. Stable configuration with Helio G96 chipset. In addition, the device also has a cluster of 4 cameras with a 108MP sensor, suitable for all users.
Regarding the design of Xiaomi Redmi Note 11S, there is no need to discuss too much because it possesses an extremely modern, youthful and solid design. This smartphone is suitable for all subjects from students, students to working people.

The thickness of the Redmi Note 11S is only 8.09mm and the weight is 179g, a phone with a moderate size you can take anywhere. The back of the device is finished from gray plastic material to increase friction. when holding and at the same time limiting fingerprints. Xiaomi Redmi Note 11S phone has strong performance power with octa-core MediaTek Helio G96. All tasks are handled quickly and smoothly thanks to 2 cores running at 2.05 GHz and 6 cores at 2.0 GHz. Combined with 8GB of Ram memory for a good experience, all applications from light to heavy are responded to instantly.', 150, CAST(N'2023-05-29T09:38:27.057' AS DateTime), N'TYP0003   ', N'CA0003    ', 20)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductImageURL], [Description], [Price], [CreatedAt], [TypeID], [CategoryID], [Stock]) VALUES (N'POD0028   ', N'Xiaomi 13 256GB Genuine', N'https://cdn-v2.didongviet.vn/files/media/catalog/product/x/i/xiaomi-13-256gb-didongviet.png', N'Xiaomi 13 256GB has a luxurious design, 6.36-inch wide screen - 120Hz refresh rate, up to 50MP camera, powerful with Snapdragon 8+ Gen 2 chipset, Android 12 - MIUI 14 operating system. Large battery capacity of 4500mAh and Support fast charging and convenient wireless charging.
Regarding the design of Xiaomi Redmi Note 11S, there is no need to discuss too much because it possesses an extremely modern, youthful and solid design. This smartphone is suitable for all subjects from students, students to working people.

The thickness of the Redmi Note 11S is only 8.09mm and the weight is 179g, a phone with a moderate size you can take anywhere. The back of the device is finished from gray plastic material to increase friction. when holding and at the same time limiting fingerprints. Xiaomi Redmi Note 11S phone has strong performance power with octa-core MediaTek Helio G96. All tasks are handled quickly and smoothly thanks to 2 cores running at 2.05 GHz and 6 cores at 2.0 GHz. Combined with 8GB of Ram memory for a good experience, all applications from light to heavy are responded to instantly.', 799, CAST(N'2023-05-29T09:39:32.730' AS DateTime), N'TYP0003   ', N'CA0002    ', 7)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductImageURL], [Description], [Price], [CreatedAt], [TypeID], [CategoryID], [Stock]) VALUES (N'POD0029   ', N'Xiaomi 13 Lite 256GB Genuine', N'https://cdn-v2.didongviet.vn/files/media/catalog/product/x/i/xiaomi-13-lite-256gb-didongviet.jpg', N'Xiaomi 13 Lite 256GB has a luxurious design, 6.55-inch wide screen, AMOLED panel with Full HD resolution to bring a voyeuristic experience. Besides, it is also equipped with a camera cluster with a resolution of up to 64 MP to help capture memorable moments. At the same time, the device also possesses strong performance from the Snapdragon 780G chipset.
Regarding the design of Xiaomi Redmi Note 11S, there is no need to discuss too much because it possesses an extremely modern, youthful and solid design. This smartphone is suitable for all subjects from students, students to working people.

The thickness of the Redmi Note 11S is only 8.09mm and the weight is 179g, a phone with a moderate size you can take anywhere. The back of the device is finished from gray plastic material to increase friction. when holding and at the same time limiting fingerprints. Xiaomi Redmi Note 11S phone has strong performance power with octa-core MediaTek Helio G96. All tasks are handled quickly and smoothly thanks to 2 cores running at 2.05 GHz and 6 cores at 2.0 GHz. Combined with 8GB of Ram memory for a good experience, all applications from light to heavy are responded to instantly.', 650, CAST(N'2023-05-29T09:40:19.537' AS DateTime), N'TYP0003   ', N'CA0002    ', 5)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductImageURL], [Description], [Price], [CreatedAt], [TypeID], [CategoryID], [Stock]) VALUES (N'POD0030   ', N'Xiaomi Redmi Note 12 128GB Genuine', N'https://cdn-v2.didongviet.vn/files/media/catalog/product/x/i/xiaomi-redmi-note-12-didongviet_1.png', N'Xiaomi Redmi Note 12 possesses a youthful appearance, meticulously crafted design. The back is finished square. Besides, this smartphone also owns a 6.67-inch AMOLED panel with a 120Hz refresh rate. With Snapdragon 685 octa-core chipset gives you the ability to handle tasks smoothly and quickly.
Regarding the design of Xiaomi Redmi Note 11S, there is no need to discuss too much because it possesses an extremely modern, youthful and solid design. This smartphone is suitable for all subjects from students, students to working people.

The thickness of the Redmi Note 11S is only 8.09mm and the weight is 179g, a phone with a moderate size you can take anywhere. The back of the device is finished from gray plastic material to increase friction. when holding and at the same time limiting fingerprints. Xiaomi Redmi Note 11S phone has strong performance power with octa-core MediaTek Helio G96. All tasks are handled quickly and smoothly thanks to 2 cores running at 2.05 GHz and 6 cores at 2.0 GHz. Combined with 8GB of Ram memory for a good experience, all applications from light to heavy are responded to instantly.', 209, CAST(N'2023-05-29T09:41:11.067' AS DateTime), N'TYP0003   ', N'CA0001    ', 8)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductImageURL], [Description], [Price], [CreatedAt], [TypeID], [CategoryID], [Stock]) VALUES (N'POD0031   ', N'Xiaomi Redmi Note 12S 256GB Genuine', N'https://cdn-v2.didongviet.vn/files/products/2023/4/10/1/1683732400888_xiaomi_redmi_note_12s_green_didongviet_thumb_min.jpg', N'Xiaomi Redmi Note 12S 256GB Genuine is the new mid-range phone from Xiaomi. The phone has a 6.43-inch screen with stable configuration with Helio G96 chipset. In addition, the device also has a cluster of 3 cameras with a 108MP sensor, suitable for all users.
Regarding the design of Xiaomi Redmi Note 11S, there is no need to discuss too much because it possesses an extremely modern, youthful and solid design. This smartphone is suitable for all subjects from students, students to working people.

The thickness of the Redmi Note 11S is only 8.09mm and the weight is 179g, a phone with a moderate size you can take anywhere. The back of the device is finished from gray plastic material to increase friction. when holding and at the same time limiting fingerprints. Xiaomi Redmi Note 11S phone has strong performance power with octa-core MediaTek Helio G96. All tasks are handled quickly and smoothly thanks to 2 cores running at 2.05 GHz and 6 cores at 2.0 GHz. Combined with 8GB of Ram memory for a good experience, all applications from light to heavy are responded to instantly.', 400, CAST(N'2023-05-29T09:42:03.613' AS DateTime), N'TYP0003   ', N'CA0003    ', 5)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductImageURL], [Description], [Price], [CreatedAt], [TypeID], [CategoryID], [Stock]) VALUES (N'POD0032   ', N'Vivo Y22S 128GB Genuine', N'https://cdn-v2.didongviet.vn/files/media/catalog/product/v/i/vivo-y22s-8gb-128gb-didongviet.jpg', N'Vivo Y22S 128GB is designed with a modern and luxurious style. This smartphone owns a 6.55-inch wide screen with HD + resolution. The device has stable performance thanks to the Qualcomm Snapdragon 680 processor. In addition, the device also owns a battery capacity of up to 5000mAh allowing users to enjoy a smooth experience.
Now, users will no longer have the fear of running out of battery interrupting the experience. Because Vivo Y22S 128GB phone is equipped with a battery with a capacity of up to 5000mAh. Moreover, the manufacturer also supports fast charging technology up to 18W to help users charge quickly.', 350, CAST(N'2023-05-29T09:44:54.177' AS DateTime), N'TYP0004   ', N'CA0003    ', 5)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductImageURL], [Description], [Price], [CreatedAt], [TypeID], [CategoryID], [Stock]) VALUES (N'POD0033   ', N'Vivo Y21s 128GB Genuine', N'https://cdn-v2.didongviet.vn/files/media/catalog/product/v/i/vivo-y21s-4gb-128gb-didongviet.jpg', N'Vivo Y21s 128GB has a more upgraded design, equipped with a large 6.51-inch IPS LCD screen with a 60Hz refresh rate. Main camera 50MP - 2 Secondary 2MP, 2MP. The device owns MediaTek Helio G80 octa-core chipset, 4GB RAM - 128GB internal memory and runs on Android 11 operating system. Large capacity 5000mAh.
The mysterious blue version uses AG matte technology for a sophisticated matte back, the blue color reflects in a subtle and elegant way. Meanwhile, the pearl white version is made up of a nano coating combined with a new reflective coating, creating a color that shines like sparkling pearls, seductively luxurious. In addition, it also helps people have more choices in color as well as in accordance with their own personality.
Vivo Y21s 128GB is a phone equipped with 3 rear cameras with a 50MP main sensor. The macro camera and 2 MP depth sensor let you keep up with the new trends with diverse shooting styles in different conditions.', 140, CAST(N'2023-05-29T09:46:22.040' AS DateTime), N'TYP0004   ', N'CA0003    ', 8)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductImageURL], [Description], [Price], [CreatedAt], [TypeID], [CategoryID], [Stock]) VALUES (N'POD0034   ', N'Realme C55 256GB Genuine ', N'https://cdn-v2.didongviet.vn/files/media/catalog/product/r/e/realme-c55-256gb-didongviet.jpg', N'Genuine Realme C55 256GB is one of two versions of the Realme C55 in the mid-range segment. The phone continues to maintain a thin and light design combined with a back that changes color according to light effects. The stable performance from the Helio G88 chip also provides a great user experience. The 64MP main camera also enhances the quality of photos, making the device an attractive ''mobile camera'' in its price range. Genuine Realme C55 256GB has a beautiful sunny design with stable performance in the price range. . This is considered a highlight to help the phone attract technology followers on the first day of its launch. The device makes a strong breakthrough of Realme, once again affirming the quality of Realme phones in the mid-range segment. Realme C55 is a mid-range phone with the largest screen in the segment with a size of 6.72 inches. This screen uses IPS LCD technology and has a resolution of Full HD + 1080 x 2400 pixels, for clear and true images. The highlight of the Realme C55 screen is the 90Hz refresh rate and 180Hz touch frequency, making screen activities such as playing games, watching videos or surfing the web smooth and comfortable.', 240, CAST(N'2023-05-29T09:48:24.290' AS DateTime), N'TYP0006   ', N'CA0002    ', 8)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductImageURL], [Description], [Price], [CreatedAt], [TypeID], [CategoryID], [Stock]) VALUES (N'POD0035   ', N'OPPO A17 64GB Genuine ', N'https://cdn-v2.didongviet.vn/files/products/2023/4/23/1/1684833559188_oppo_a17_64gb_didongviet_da_kich_hoat_1.jpg', N'OPPO A17 has a luxurious design, 6.56-inch wide screen - 60Hz refresh rate, up to 50MP camera. Powerful performance with 8-core MediaTek Helio G35 chipset that meets the needs of use, 5000mAh large battery capacity with up to 10W charging. OPPO A17 is considered a bold combination of unique design and leather material. High-end has made a premium phone. The premium leather back cover gives users a luxurious and durable feel in the hand. With a size of up to 6.56 inches, the OPPO A17 phone allows users to experience content comfortably and easily. easier. HD + resolution and 60Hz refresh rate are equipped to ensure the best display quality. OPPO A Series A17 version is equipped with an 8-core Helio G35 chipset manufactured on 12nm process, with the highest clock speed. up to 2.3GHz, allowing the machine to operate smoothly and save good power consumption when handling basic multitasking tasks such as surfing the web, playing games or watching movies.', 150, CAST(N'2023-05-29T09:50:32.323' AS DateTime), N'TYP0007   ', N'CA0002    ', 9)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductImageURL], [Description], [Price], [CreatedAt], [TypeID], [CategoryID], [Stock]) VALUES (N'POD0036   ', N'OPPO Reno8 T 256GB Genuine ', N'https://cdn-v2.didongviet.vn/files/media/catalog/product/o/p/oppo-reno8-t-4g-edit-mau-den-didongviet.jpg', N'OPPO RENO 8T 4G 256GB has a slim, light, square design. Owns a 6.4-inch wide AMOLED screen. Powerful performance thanks to the Helio G99 chip, 5000mAh battery capacity with fast charging up to 33W. Camera gives users sharp and professional videos and images. OPPO A17 has a luxurious design, 6.56-inch wide screen - 60Hz refresh rate, up to 50MP camera. Powerful performance with 8-core MediaTek Helio G35 chipset that meets the needs of use, 5000mAh large battery capacity with up to 10W charging. OPPO A17 is considered a bold combination of unique design and leather material. High-end has made a premium phone. The premium leather back cover gives users a luxurious and durable feel in the hand. With a size of up to 6.56 inches, the OPPO A17 phone allows users to experience content comfortably and easily. easier. HD + resolution and 60Hz refresh rate are equipped to ensure the best display quality. OPPO A Series A17 version is equipped with an 8-core Helio G35 chipset manufactured on 12nm process, with the highest clock speed. up to 2.3GHz, allowing the machine to operate smoothly and save good power consumption when handling basic multitasking tasks such as surfing the web, playing games or watching movies.', 450, CAST(N'2023-05-29T09:54:56.097' AS DateTime), N'TYP0007   ', N'CA0002    ', 12)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductImageURL], [Description], [Price], [CreatedAt], [TypeID], [CategoryID], [Stock]) VALUES (N'POD0037   ', N'OPPO Reno8 T 5G 128GB Genuine ', N'https://cdn-v2.didongviet.vn/files/media/catalog/product/o/p/oppo-reno8-t-5g-didongviet_2.png', N'OPPO RENO8 T 5G 128GB has a slim, square design with a shiny back. This device owns a 6.7-inch AMOLED screen. Powerful performance thanks to 8-core Snapdragon 695 5G chip, 4800mAh battery capacity with 67W fast charging. The 108MP main camera gives users sharp and professional videos and images.OPPO A17 has a luxurious design, 6.56-inch wide screen - 60Hz refresh rate, up to 50MP camera. Powerful performance with 8-core MediaTek Helio G35 chipset that meets the needs of use, 5000mAh large battery capacity with up to 10W charging. OPPO A17 is considered a bold combination of unique design and leather material. High-end has made a premium phone. The premium leather back cover gives users a luxurious and durable feel in the hand. With a size of up to 6.56 inches, the OPPO A17 phone allows users to experience content comfortably and easily. easier. HD + resolution and 60Hz refresh rate are equipped to ensure the best display quality. OPPO A Series A17 version is equipped with an 8-core Helio G35 chipset manufactured on 12nm process, with the highest clock speed. up to 2.3GHz, allowing the machine to operate smoothly and save good power consumption when handling basic multitasking tasks such as surfing the web, playing games or watching movies.', 460, CAST(N'2023-05-29T09:54:37.167' AS DateTime), N'TYP0007   ', N'CA0001    ', 8)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductImageURL], [Description], [Price], [CreatedAt], [TypeID], [CategoryID], [Stock]) VALUES (N'POD0038   ', N'OPPO A96 4G 128GB Genuine', N'https://cdn-v2.didongviet.vn/files/media/catalog/product/o/p/oppo-a96-5g-didongviet.jpg', N'OPPO A96 128GB possesses a modern, sophisticated and extremely thin design with a thickness of only 8.4mm. The device is equipped with a 6.59" IPS screen with 90Hz refresh rate, powerful configuration with Snapdragon 680 processor. OPPO A96 has a dual camera system with a main camera of up to 50MP.OPPO A17 has a luxurious design, 6.56-inch wide screen - 60Hz refresh rate, up to 50MP camera. Powerful performance with 8-core MediaTek Helio G35 chipset that meets the needs of use, 5000mAh large battery capacity with up to 10W charging. OPPO A17 is considered a bold combination of unique design and leather material. High-end has made a premium phone. The premium leather back cover gives users a luxurious and durable feel in the hand. With a size of up to 6.56 inches, the OPPO A17 phone allows users to experience content comfortably and easily. easier. HD + resolution and 60Hz refresh rate are equipped to ensure the best display quality. OPPO A Series A17 version is equipped with an 8-core Helio G35 chipset manufactured on 12nm process, with the highest clock speed. up to 2.3GHz, allowing the machine to operate smoothly and save good power consumption when handling basic multitasking tasks such as surfing the web, playing games or watching movies.', 300, CAST(N'2023-05-29T09:54:07.323' AS DateTime), N'TYP0007   ', N'CA0003    ', 6)
GO
INSERT [dbo].[ProductType] ([TypeID], [Type]) VALUES (N'TYP0001   ', N'IPHONE              ')
INSERT [dbo].[ProductType] ([TypeID], [Type]) VALUES (N'TYP0002   ', N'SAMSUNG             ')
INSERT [dbo].[ProductType] ([TypeID], [Type]) VALUES (N'TYP0003   ', N'XIAOMI              ')
INSERT [dbo].[ProductType] ([TypeID], [Type]) VALUES (N'TYP0004   ', N'VIVO                ')
INSERT [dbo].[ProductType] ([TypeID], [Type]) VALUES (N'TYP0006   ', N'REALME              ')
INSERT [dbo].[ProductType] ([TypeID], [Type]) VALUES (N'TYP0007   ', N'OPPO                ')
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (1, N'admin               ')
INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (2, N'customer            ')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [Email], [Password], [Phone], [FullAddress], [CreatedAt], [RoleID]) VALUES (N'USER0001  ', N'Văn', N'Lê', N'vanle16032001@gmail.com', N'1234567890', N'0372484585', N'HN', CAST(N'2023-05-29T11:04:26.210' AS DateTime), 1)
INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [Email], [Password], [Phone], [FullAddress], [CreatedAt], [RoleID]) VALUES (N'USER0002  ', N'doremon', N'doremi', N'abcdoremi222@gmail.com', N'1234567890', N'0372484585', N'TB', CAST(N'2023-05-30T13:06:37.333' AS DateTime), 2)
INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [Email], [Password], [Phone], [FullAddress], [CreatedAt], [RoleID]) VALUES (N'USER0003  ', N'Admin', N'Test', N'admin@gmail.com', N'123456', N'0987654321', N'TH', CAST(N'2023-05-30T13:05:53.277' AS DateTime), 1)
INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [Email], [Password], [Phone], [FullAddress], [CreatedAt], [RoleID]) VALUES (N'USER0004  ', N'Customer', N'Test', N'customer@gmail.com', N'123456', N'0987865432', N'HN', CAST(N'2023-05-30T13:04:49.413' AS DateTime), 2)
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Users]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_ProductType] FOREIGN KEY([TypeID])
REFERENCES [dbo].[ProductType] ([TypeID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_ProductType]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([RoleID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
USE [master]
GO
ALTER DATABASE [DACNPM] SET  READ_WRITE 
GO
