USE [master]
GO
/****** Object:  Database [MYPHAM]    Script Date: 8/7/2024 8:53:31 AM ******/
CREATE DATABASE [MYPHAM]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MYPHAM', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\MYPHAM.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MYPHAM_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\MYPHAM_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MYPHAM] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MYPHAM].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MYPHAM] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MYPHAM] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MYPHAM] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MYPHAM] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MYPHAM] SET ARITHABORT OFF 
GO
ALTER DATABASE [MYPHAM] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MYPHAM] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MYPHAM] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MYPHAM] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MYPHAM] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MYPHAM] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MYPHAM] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MYPHAM] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MYPHAM] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MYPHAM] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MYPHAM] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MYPHAM] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MYPHAM] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MYPHAM] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MYPHAM] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MYPHAM] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MYPHAM] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MYPHAM] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MYPHAM] SET  MULTI_USER 
GO
ALTER DATABASE [MYPHAM] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MYPHAM] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MYPHAM] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MYPHAM] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MYPHAM] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MYPHAM] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [MYPHAM] SET QUERY_STORE = OFF
GO
USE [MYPHAM]
GO
/****** Object:  Table [dbo].[ChiTietDonHang]    Script Date: 8/7/2024 8:53:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietDonHang](
	[CTDonHangID] [int] IDENTITY(1,1) NOT NULL,
	[MaDH] [int] NULL,
	[MaSP] [int] NULL,
	[SoLuongMua] [int] NULL,
	[GiaTien] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CTDonHangID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DanhMuc]    Script Date: 8/7/2024 8:53:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhMuc](
	[MaDM] [int] IDENTITY(1,1) NOT NULL,
	[TenDanhMuc] [nvarchar](100) NOT NULL,
	[Anh] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonHang]    Script Date: 8/7/2024 8:53:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHang](
	[MaDH] [int] IDENTITY(1,1) NOT NULL,
	[NgayDatHang] [date] NOT NULL,
	[TongGiaDonHang] [int] NOT NULL,
	[TrangThai] [nvarchar](50) NOT NULL,
	[TaiKhoanID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GioiThieu]    Script Date: 8/7/2024 8:53:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GioiThieu](
	[MaGioiThieu] [int] IDENTITY(1,1) NOT NULL,
	[TieuDe] [nvarchar](255) NOT NULL,
	[NoiDung] [nvarchar](max) NOT NULL,
	[Anh] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaGioiThieu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 8/7/2024 8:53:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSP] [int] IDENTITY(1,1) NOT NULL,
	[TenSanPham] [nvarchar](100) NOT NULL,
	[AnhSanPham] [nvarchar](255) NOT NULL,
	[Gia] [int] NOT NULL,
	[SoLuong] [int] NOT NULL,
	[MoTa] [nvarchar](255) NOT NULL,
	[MaDM] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 8/7/2024 8:53:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[TaiKhoanID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
	[Permission] [int] NOT NULL,
	[SDT] [nvarchar](20) NOT NULL,
	[DiaChi] [nvarchar](255) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TaiKhoanID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TinTuc]    Script Date: 8/7/2024 8:53:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TinTuc](
	[MaTin] [int] IDENTITY(1,1) NOT NULL,
	[TieuDe] [nvarchar](255) NOT NULL,
	[NoiDung] [nvarchar](max) NOT NULL,
	[Anh] [nvarchar](255) NOT NULL,
	[NgayDang] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaTin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ChiTietDonHang] ON 

INSERT [dbo].[ChiTietDonHang] ([CTDonHangID], [MaDH], [MaSP], [SoLuongMua], [GiaTien]) VALUES (1, 1, 3, 1, 300000)
INSERT [dbo].[ChiTietDonHang] ([CTDonHangID], [MaDH], [MaSP], [SoLuongMua], [GiaTien]) VALUES (3, 3, 5, 1, 300000)
INSERT [dbo].[ChiTietDonHang] ([CTDonHangID], [MaDH], [MaSP], [SoLuongMua], [GiaTien]) VALUES (4, 4, 5, 1, 300000)
INSERT [dbo].[ChiTietDonHang] ([CTDonHangID], [MaDH], [MaSP], [SoLuongMua], [GiaTien]) VALUES (5, 4, 2, 1, 200000)
INSERT [dbo].[ChiTietDonHang] ([CTDonHangID], [MaDH], [MaSP], [SoLuongMua], [GiaTien]) VALUES (6, 5, 7, 1, 300000)
INSERT [dbo].[ChiTietDonHang] ([CTDonHangID], [MaDH], [MaSP], [SoLuongMua], [GiaTien]) VALUES (7, 5, 1, 1, 100000)
INSERT [dbo].[ChiTietDonHang] ([CTDonHangID], [MaDH], [MaSP], [SoLuongMua], [GiaTien]) VALUES (16, 12, 3, 1, 300000)
INSERT [dbo].[ChiTietDonHang] ([CTDonHangID], [MaDH], [MaSP], [SoLuongMua], [GiaTien]) VALUES (17, 13, 7, 1, 300000)
INSERT [dbo].[ChiTietDonHang] ([CTDonHangID], [MaDH], [MaSP], [SoLuongMua], [GiaTien]) VALUES (18, 14, 3, 1, 300000)
INSERT [dbo].[ChiTietDonHang] ([CTDonHangID], [MaDH], [MaSP], [SoLuongMua], [GiaTien]) VALUES (19, 15, 12, 1, 270000)
INSERT [dbo].[ChiTietDonHang] ([CTDonHangID], [MaDH], [MaSP], [SoLuongMua], [GiaTien]) VALUES (20, 15, 8, 1, 300000)
SET IDENTITY_INSERT [dbo].[ChiTietDonHang] OFF
GO
SET IDENTITY_INSERT [dbo].[DanhMuc] ON 

INSERT [dbo].[DanhMuc] ([MaDM], [TenDanhMuc], [Anh]) VALUES (1, N'Chăm sóc cơ thể', N'im1.png')
INSERT [dbo].[DanhMuc] ([MaDM], [TenDanhMuc], [Anh]) VALUES (2, N'Son môi', N'im3.png')
INSERT [dbo].[DanhMuc] ([MaDM], [TenDanhMuc], [Anh]) VALUES (3, N'Chăm sóc da', N'im4.png')
INSERT [dbo].[DanhMuc] ([MaDM], [TenDanhMuc], [Anh]) VALUES (4, N'Thiết bị làm đẹp', N'im5.png')
INSERT [dbo].[DanhMuc] ([MaDM], [TenDanhMuc], [Anh]) VALUES (5, N'Trang điểm', N'im6.png')
INSERT [dbo].[DanhMuc] ([MaDM], [TenDanhMuc], [Anh]) VALUES (6, N'Dưỡng trắng', N'im2.png')
SET IDENTITY_INSERT [dbo].[DanhMuc] OFF
GO
SET IDENTITY_INSERT [dbo].[DonHang] ON 

INSERT [dbo].[DonHang] ([MaDH], [NgayDatHang], [TongGiaDonHang], [TrangThai], [TaiKhoanID]) VALUES (1, CAST(N'2024-08-05' AS Date), 300000, N'Đã giao', 5)
INSERT [dbo].[DonHang] ([MaDH], [NgayDatHang], [TongGiaDonHang], [TrangThai], [TaiKhoanID]) VALUES (3, CAST(N'2024-08-05' AS Date), 300000, N'Chờ xử lý', 2)
INSERT [dbo].[DonHang] ([MaDH], [NgayDatHang], [TongGiaDonHang], [TrangThai], [TaiKhoanID]) VALUES (4, CAST(N'2024-08-05' AS Date), 500000, N'Chờ xử lý', 2)
INSERT [dbo].[DonHang] ([MaDH], [NgayDatHang], [TongGiaDonHang], [TrangThai], [TaiKhoanID]) VALUES (5, CAST(N'2024-08-05' AS Date), 400000, N'Chờ xử lý', 2)
INSERT [dbo].[DonHang] ([MaDH], [NgayDatHang], [TongGiaDonHang], [TrangThai], [TaiKhoanID]) VALUES (6, CAST(N'2024-08-06' AS Date), 900000, N'Chờ xử lý', 5)
INSERT [dbo].[DonHang] ([MaDH], [NgayDatHang], [TongGiaDonHang], [TrangThai], [TaiKhoanID]) VALUES (7, CAST(N'2024-08-06' AS Date), 200000, N'Chờ xử lý', 3)
INSERT [dbo].[DonHang] ([MaDH], [NgayDatHang], [TongGiaDonHang], [TrangThai], [TaiKhoanID]) VALUES (8, CAST(N'2024-08-06' AS Date), 300000, N'Chờ xử lý', 2)
INSERT [dbo].[DonHang] ([MaDH], [NgayDatHang], [TongGiaDonHang], [TrangThai], [TaiKhoanID]) VALUES (9, CAST(N'2024-08-06' AS Date), 300000, N'Chờ xử lý', 5)
INSERT [dbo].[DonHang] ([MaDH], [NgayDatHang], [TongGiaDonHang], [TrangThai], [TaiKhoanID]) VALUES (11, CAST(N'2024-08-06' AS Date), 100000, N'Chờ xử lý', 2)
INSERT [dbo].[DonHang] ([MaDH], [NgayDatHang], [TongGiaDonHang], [TrangThai], [TaiKhoanID]) VALUES (12, CAST(N'2024-08-06' AS Date), 300000, N'Chờ xử lý', 2)
INSERT [dbo].[DonHang] ([MaDH], [NgayDatHang], [TongGiaDonHang], [TrangThai], [TaiKhoanID]) VALUES (13, CAST(N'2024-08-06' AS Date), 300000, N'Chờ xử lý', 2)
INSERT [dbo].[DonHang] ([MaDH], [NgayDatHang], [TongGiaDonHang], [TrangThai], [TaiKhoanID]) VALUES (14, CAST(N'2024-08-06' AS Date), 300000, N'Chờ xử lý', 6)
INSERT [dbo].[DonHang] ([MaDH], [NgayDatHang], [TongGiaDonHang], [TrangThai], [TaiKhoanID]) VALUES (15, CAST(N'2024-08-07' AS Date), 570000, N'Chờ xử lý', 2)
SET IDENTITY_INSERT [dbo].[DonHang] OFF
GO
SET IDENTITY_INSERT [dbo].[GioiThieu] ON 

INSERT [dbo].[GioiThieu] ([MaGioiThieu], [TieuDe], [NoiDung], [Anh]) VALUES (1, N'K-Star Anh Hơn Cả Một Thương Hiệu', N'Với thế mạnh là mảng hợp tác thương mại quốc tế cùng kinh nghiệm hơn 10 năm sống và làm việc tại Hàn Quốc của lãnh đạo K-Star Anh, chúng tôi tự hào là đơn vị có nhiều đóng góp cho ngành làm đẹp Việt Nam & Hàn Quốc.
            Đặc biệt, trong lĩnh vực sản xuất, nhà máy của chúng tôi tại Hàn Quốc luôn dẫn đầu về công nghệ nghiên cứu gốc trong ngành sản xuất mỹ phẩm, thực phẩm chức năng.
            Với hệ sinh thái quy trình chuẩn hóa về vùng nguyên liệu, phòng nghiên cứu, quản lý sản xuất, quản lý vệ sinh, quản lý chất lượng, tiêu chuẩn sản phẩm, kiểm soát chất lượng hoàn hảo khoa học với hệ thống kiểm soát quy trình nghiệm ngặt – K Star Cosmetics cam kết đem đến người tiêu dùng những sản phẩm chất lượng nhất.
            Đáp ứng mọi tiêu chuẩn và nhu cầu về OEM, ODM trong ngành sản xuất mỹ phẩm, Thực phẩm chức năng', N'anhgioithieu.png')
INSERT [dbo].[GioiThieu] ([MaGioiThieu], [TieuDe], [NoiDung], [Anh]) VALUES (2, N'Mỹ Phẩm Hàn Quốc YONLIE', N'Sản phẩm mang thương hiệu Yonlie đều được sản xuất trên dây chuyền công nghệ hiện đại Hàn Quốc cùng các chuyên gia hàng đầu về lĩnh vực mỹ phẩm đem đến một trải nghiệm làm đẹp riêng biệt, tái tạo và nuôi dưỡng làn da không tuổi cho phụ nữ Việt.
Tương lai Yonlie sẽ trở thành thương hiệu mỹ phẩm nổi tiếng không chỉ trong nước mà còn cả trên thị trường quốc tế. Với sự phát triển không ngừng cùng sự vận hành của hệ thống phân phối trải dài trên cả nước, Yonlie sẽ còn vươn xa hơn nữa trên con đường khẳng định vị thế của thị trường mỹ phẩm.', N'anhgioithieu1.jpg')
SET IDENTITY_INSERT [dbo].[GioiThieu] OFF
GO
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([MaSP], [TenSanPham], [AnhSanPham], [Gia], [SoLuong], [MoTa], [MaDM]) VALUES (1, N'Refreshing Facial Wash', N'sp1.png', 100000, 10, N'Sửa rửa mặt làm sạch da mặt, lấy đi bụi bẩn,giảm nguy cơ bị mụn trứng cá, mụn đầu đen, dưỡng trắng da, độ pH cân bằng sẽ giúp làn da khôn bị khô căng rát sau khi rửa mặt, ngăn chặn tia UV và cung cấp độ ẩm cho da', 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSanPham], [AnhSanPham], [Gia], [SoLuong], [MoTa], [MaDM]) VALUES (2, N'Perfect White Arbutin Cleanser', N'sp2.png', 200000, 20, N'Sửa rửa mặt làm sạch da mặt, bụi bẩn, bã nhờn và tập chất ẩn sau trong lỗ chân lông mà vẫn êm dịu với làn da nhờ có công thức dưỡng ẩm HA đột phá từ Nhật Bản, dưỡng trắng sáng da, giảm thâm mụn, ngăn chặn tia UV và cung cấp độ ẩm cho da', 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSanPham], [AnhSanPham], [Gia], [SoLuong], [MoTa], [MaDM]) VALUES (3, N'Anthelios 50+ Dry Touch Finish Mattifying Effect', N'sp3.png', 300000, 30, N'Kem chống nắng bảo vệ da khỏi tác hại của tia UV, kem chống nắng dành cho da dầu giúp kiểm soát bóng nhờn và bảo vệ da trước tác hại từ ánh nắng và ô nhiễm, ngăn chặn các tác nhân gây lão hóa sớm, giảm bóng nhờn.', 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSanPham], [AnhSanPham], [Gia], [SoLuong], [MoTa], [MaDM]) VALUES (4, N'Sunplay Skin Aqua Clear White', N'sp4.png', 300000, 30, N'Kem chống nắng Cung cấp khả năng bảo vệ mạnh mẽ khỏi tia UV, giúp ngăn ngừa đen sạm, nám , tàn nhan, cháy nắng, giữ ẩm tối ưu cho da khi tiếp xúc với ánh nắng, dưỡng da trắng mịn, phù hợp với da dầu, da thường, da hỗn hợp. Giúp làn da luôn ẩm mượt', 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSanPham], [AnhSanPham], [Gia], [SoLuong], [MoTa], [MaDM]) VALUES (5, N'Hada Labo Acne Care', N'sp5.png', 300000, 30, N'Kem rửa mặt sạch sâu dịu nhẹ, ngăn ngừa mụn và dưỡng ẩm chứa thành phần làm sạch gốc tự nhiên giúp lấy sạch bụi bẩn, vi khuẩn, bã nhờn ẩn sâu trong lỗ chân lông, nguyên nhân chính gây nên mụn', 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSanPham], [AnhSanPham], [Gia], [SoLuong], [MoTa], [MaDM]) VALUES (6, N'Neutrogena Hydro Boost Water Gel', N'sp6.png', 300000, 30, N'Kem dưỡng ẩm khả năng cấp ẩm Bảo vệ da khỏi tác hại của tia UV, kem chống nắng dành cho da dầu giúp kiểm soát bóng nhờn và bảo vệ da trước tác hại từ ánh nắng và ô nhiễm, ngăn chặn các tác nhân gây lão hóa sớm,trị mụn, giảm bóng nhờn.', 6)
INSERT [dbo].[SanPham] ([MaSP], [TenSanPham], [AnhSanPham], [Gia], [SoLuong], [MoTa], [MaDM]) VALUES (7, N'Cọ trang điểm của thương hiệu MAC', N'sp7.png', 300000, 30, N'Bộ cọ bao gồm nhiều loại cọ khác nhau, phục vụ cho các mục đích trang điểm khác nhau như phấn nền, phấn má, che khuyết điểm, cọ phủi phấn và đánh má hồng, lược chảy lông mày và cọ trang điểm mắt.', 6)
INSERT [dbo].[SanPham] ([MaSP], [TenSanPham], [AnhSanPham], [Gia], [SoLuong], [MoTa], [MaDM]) VALUES (8, N'Bộ 3 trang điểm', N'sp8.png', 300000, 30, N'Bộ trang điểm đầy đủ món, Bb Cream kem che khuyết điểm, lớp phủ bột sản phẩm ở dạng bột với độ che phủ tuyệt vời, phấn mắt, chì kẻ mày lâu trôi, son môi lì, mascara, phấn hồng, dao tỉa lông mày, bảng phấn mắt', 4)
INSERT [dbo].[SanPham] ([MaSP], [TenSanPham], [AnhSanPham], [Gia], [SoLuong], [MoTa], [MaDM]) VALUES (9, N'Serum Garnier Bright Complete Anti-Acne Booster', N'sp9.png', 300000, 30, N'Tinh chất giảm mụn sáng da, sản phẩm serum đến từ thương hiệu mỹ phẩm, với công thức Vitamin C, BHA, AHA, có công dụng giảm mụn, mờ vết thâm và vết thâm do mụn giúp da giảm tình trạng mụn trứng cá, trị mụn, mụn viêm', 4)
INSERT [dbo].[SanPham] ([MaSP], [TenSanPham], [AnhSanPham], [Gia], [SoLuong], [MoTa], [MaDM]) VALUES (10, N'Serum Kiểm Soát Mụn LÁ HOUSE', N'sp10.png', 300000, 30, N'Serum Chăm Sóc Da Mụn với các chiết xuất từ thiên nhiên, được bào chế giúp dưỡng trắng da, giúp làm dịu da, giúp dưỡng ẩm da, giúp ngăn ngừa mụn, giúp làm mờ vết thâm mụn, se khít lỗ chân lông, giúp phục hồi diện mạo của da, giảm nếp nhăn trên da hiệu quả', 5)
INSERT [dbo].[SanPham] ([MaSP], [TenSanPham], [AnhSanPham], [Gia], [SoLuong], [MoTa], [MaDM]) VALUES (11, N'Xịt khoáng dưỡng ẩm Kyung Lab Therapy Mist', N'sp11.png', 450000, 30, N'Xịt Khoáng Dưỡng Ẩm là sản phẩm dưỡng da hoàn hảo, Cấp ẩm sâu cho da căng mịn
Làm dịu da, chống oxy hoá
Thúc đẩy chữa lành tổn thương trên da
Hỗ trợ trẻ hoá da, ngăn ngừa lão hoá
Cân bằng độ pH trên da
Thúc đẩy tái tạo hàng rào bảo vệ da', 3)
INSERT [dbo].[SanPham] ([MaSP], [TenSanPham], [AnhSanPham], [Gia], [SoLuong], [MoTa], [MaDM]) VALUES (12, N'Xịt khoáng Avene cấp nước, Làm dịu da kích ứng ', N'sp12.jpg', 270000, 30, N'Nước xịt khoáng làm dịu da Avène Thermal Spring Water phù hợp với mọi loại da, kể cả da nhạy cảm. Dùng sau thủ thuật da liễu hay can thiệp thẩm mỹ. Dùng cho tình trạng da mẩn đỏ, da nhạy cảm - dễ kích ứng, da dễ bị viêm, da dễ bị chứng dày sừng, da có vảy', 3)
SET IDENTITY_INSERT [dbo].[SanPham] OFF
GO
SET IDENTITY_INSERT [dbo].[TaiKhoan] ON 

INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [Username], [Password], [Permission], [SDT], [DiaChi], [Email]) VALUES (1, N'admin', N'111', 1, N'0123456789', N'123 Đường A, Quận B, Thành phố C', N'admin@example.com')
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [Username], [Password], [Permission], [SDT], [DiaChi], [Email]) VALUES (2, N'Nguyen Thi Tuong Vy', N'123', 2, N'0987654321', N'456 Đường X, Quận Y, Thành phố Z', N'user1@example.com')
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [Username], [Password], [Permission], [SDT], [DiaChi], [Email]) VALUES (3, N'Nguyễn Thị Hằng', N'12345', 2, N'0912345678', N'789 Đường M, Quận N, Thành phố P', N'user2@example.com')
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [Username], [Password], [Permission], [SDT], [DiaChi], [Email]) VALUES (5, N'Nguyễn Kim Phước', N'12345', 2, N'0799673700', N'Đồng Tháp', N'vygach@gmail.com')
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [Username], [Password], [Permission], [SDT], [DiaChi], [Email]) VALUES (6, N'Nguyễn Ngọc Mai', N'123', 2, N'0799673000', N'Đồng tháp', N'nguyenmaicute2111@gmail.com')
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [Username], [Password], [Permission], [SDT], [DiaChi], [Email]) VALUES (7, N'Nguyễn Kim Liên ', N'123', 2, N'0799673000', N'Đồng tháp', N'nguyenmaicute2111@gmail.com')
SET IDENTITY_INSERT [dbo].[TaiKhoan] OFF
GO
SET IDENTITY_INSERT [dbo].[TinTuc] ON 

INSERT [dbo].[TinTuc] ([MaTin], [TieuDe], [NoiDung], [Anh], [NgayDang]) VALUES (1, N'Top 5 Màu Son Gucci Đẹp Nhất Nâng Tầm Sắc Đẹp Của Nàng', N'Khi nói đến thương hiệu mỹ phẩm và thời trang danh tiếng, tên gọi “Gucci” luôn đọng lại trong tâm trí chúng ta với vẻ đẹp tinh tế và sự phá cách không giới hạn. Không chỉ nổi tiếng với ...', N'tt1.png', CAST(N'2024-07-24' AS Date))
INSERT [dbo].[TinTuc] ([MaTin], [TieuDe], [NoiDung], [Anh], [NgayDang]) VALUES (2, N'Những Chai Nước Hoa Nữ Tinh Tế Sang Trọng Làm Quà', N'Ngày 20 tháng 10 không chỉ là dịp để tri ân và tôn vinh phụ nữ, mà còn là cơ hội để chúng ta thể hiện tình yêu, sự quan tâm và sự trân trọng đối với những người phụ ...', N'tt2.jpg', CAST(N'2024-07-23' AS Date))
INSERT [dbo].[TinTuc] ([MaTin], [TieuDe], [NoiDung], [Anh], [NgayDang]) VALUES (3, N'Top 5 Chai Nước Hoa Đắt Nhất Thế Giới', N'Trong thế giới nước hoa, có những sản phẩm mang trong mình sự đắt đỏ và quý phái, mang đến cho người dùng một trải nghiệm thượng lưu và độc nhất vô nhị. Hôm nay, KYO sẽ cùng bạn khám ...', N'tt3.png', CAST(N'2024-07-22' AS Date))
INSERT [dbo].[TinTuc] ([MaTin], [TieuDe], [NoiDung], [Anh], [NgayDang]) VALUES (4, N'Son Dưỡng DHC - Bí Quyết Cho Đôi Môi Mềm Mịn và Tươi Tắn', N'Đôi môi quyến rũ và mềm mại luôn mịn màng là một yếu tố quan trọng để tạo nên vẻ đẹp tự tin và cuốn hút. Và khi đến với công cuộc làm đẹp cho đôi môi, son DHC đã ...', N'tt4.jpg', CAST(N'2024-07-21' AS Date))
INSERT [dbo].[TinTuc] ([MaTin], [TieuDe], [NoiDung], [Anh], [NgayDang]) VALUES (5, N'Top 3 Loại Xịt Khoáng Làm Sạch Da Hiệu Quả Hiện Nay', N'Trong cuộc sống bận rộn hiện đại, việc chăm sóc da mặt một cách hiệu quả và tiết kiệm thời gian đã trở thành ưu tiên hàng đầu của nhiều người. Và xịt khoáng đã trở thành một trong những ...', N'tt5.png', CAST(N'2024-07-20' AS Date))
INSERT [dbo].[TinTuc] ([MaTin], [TieuDe], [NoiDung], [Anh], [NgayDang]) VALUES (6, N'Cách Sử Dụng Phấn Má Hồng Hiệu Quả', N'Phấn má hồng là một bước quan trọng trong quy trình trang điểm để tạo sắc hồng tự nhiên và làm nổi bật gò má của bạn. Tuy nhiên, việc sử dụng phấn má hồng một cách hiệu quả có ...', N'tt6.jpg', CAST(N'2024-07-19' AS Date))
INSERT [dbo].[TinTuc] ([MaTin], [TieuDe], [NoiDung], [Anh], [NgayDang]) VALUES (7, N'Top 3 Loại Tẩy Trang Tốt Cho Da Dầu Chất Lượng Giá Bình Dân', N'Nước tẩy trang là một trong những đồ mỹ phẩm không thể thiếu trong bộ chăm sóc da. Việc chọn lựa nước tẩy trang cũng vô cùng quan trọng đối với việc chăm sóc và nuôi dưỡng làn da, nhất ...', N'tt7.png', CAST(N'2024-07-24' AS Date))
INSERT [dbo].[TinTuc] ([MaTin], [TieuDe], [NoiDung], [Anh], [NgayDang]) VALUES (9, N'tintuc1', N'hh
', N'anh1.jpg', CAST(N'2024-08-02' AS Date))
SET IDENTITY_INSERT [dbo].[TinTuc] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__TaiKhoan__536C85E46695703A]    Script Date: 8/7/2024 8:53:31 AM ******/
ALTER TABLE [dbo].[TaiKhoan] ADD UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD FOREIGN KEY([MaDH])
REFERENCES [dbo].[DonHang] ([MaDH])
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD FOREIGN KEY([TaiKhoanID])
REFERENCES [dbo].[TaiKhoan] ([TaiKhoanID])
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD FOREIGN KEY([MaDM])
REFERENCES [dbo].[DanhMuc] ([MaDM])
GO
ALTER TABLE [dbo].[TaiKhoan]  WITH CHECK ADD CHECK  (([Permission]=(2) OR [Permission]=(1)))
GO
USE [master]
GO
ALTER DATABASE [MYPHAM] SET  READ_WRITE 
GO
