USE [master]
GO
/****** Object:  Database [Student_GradeManagement_System]    Script Date: 7/17/2022 4:03:45 PM ******/
CREATE DATABASE [Student_GradeManagement_System]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Student_GradeManagement_System', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Student_GradeManagement_System.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Student_GradeManagement_System_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Student_GradeManagement_System_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Student_GradeManagement_System] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Student_GradeManagement_System].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Student_GradeManagement_System] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Student_GradeManagement_System] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Student_GradeManagement_System] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Student_GradeManagement_System] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Student_GradeManagement_System] SET ARITHABORT OFF 
GO
ALTER DATABASE [Student_GradeManagement_System] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Student_GradeManagement_System] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Student_GradeManagement_System] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Student_GradeManagement_System] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Student_GradeManagement_System] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Student_GradeManagement_System] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Student_GradeManagement_System] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Student_GradeManagement_System] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Student_GradeManagement_System] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Student_GradeManagement_System] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Student_GradeManagement_System] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Student_GradeManagement_System] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Student_GradeManagement_System] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Student_GradeManagement_System] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Student_GradeManagement_System] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Student_GradeManagement_System] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Student_GradeManagement_System] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Student_GradeManagement_System] SET RECOVERY FULL 
GO
ALTER DATABASE [Student_GradeManagement_System] SET  MULTI_USER 
GO
ALTER DATABASE [Student_GradeManagement_System] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Student_GradeManagement_System] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Student_GradeManagement_System] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Student_GradeManagement_System] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Student_GradeManagement_System] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Student_GradeManagement_System] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Student_GradeManagement_System', N'ON'
GO
ALTER DATABASE [Student_GradeManagement_System] SET QUERY_STORE = OFF
GO
USE [Student_GradeManagement_System]
GO
/****** Object:  Table [dbo].[Assessment]    Script Date: 7/17/2022 4:03:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Assessment](
	[AssessmentID] [nvarchar](10) NOT NULL,
	[CategoryID] [nvarchar](20) NOT NULL,
	[Part] [int] NULL,
	[Duration] [nvarchar](20) NOT NULL,
	[CLO] [nvarchar](150) NULL,
	[Question Type] [nvarchar](150) NULL,
 CONSTRAINT [PK_Assessment] PRIMARY KEY CLUSTERED 
(
	[AssessmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 7/17/2022 4:03:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [nvarchar](20) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[Weight] [float] NOT NULL,
	[Completion Criteria] [nvarchar](2) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 7/17/2022 4:03:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[CourseID] [nvarchar](6) NOT NULL,
	[CourseName] [nvarchar](150) NOT NULL,
	[Total] [int] NOT NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course_Asessment]    Script Date: 7/17/2022 4:03:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course_Asessment](
	[CourseID] [nvarchar](6) NOT NULL,
	[AssessmentID] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_Course_Asessment] PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC,
	[AssessmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Enroll]    Script Date: 7/17/2022 4:03:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Enroll](
	[GroupID] [nvarchar](6) NOT NULL,
	[SemesterID] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Enroll] PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC,
	[SemesterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Grade]    Script Date: 7/17/2022 4:03:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grade](
	[StudentID] [nvarchar](8) NOT NULL,
	[AssessmentID] [nvarchar](10) NOT NULL,
	[Score] [float] NOT NULL,
	[SemesterID] [nvarchar](50) NOT NULL,
	[Part] [int] NOT NULL,
 CONSTRAINT [PK_Grade] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC,
	[AssessmentID] ASC,
	[SemesterID] ASC,
	[Part] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Group]    Script Date: 7/17/2022 4:03:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group](
	[GroupID] [nvarchar](6) NOT NULL,
	[Major] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Group] PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Join]    Script Date: 7/17/2022 4:03:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Join](
	[StudentID] [nvarchar](8) NOT NULL,
	[GroupID] [nvarchar](6) NOT NULL,
 CONSTRAINT [PK_Join] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC,
	[GroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lecture]    Script Date: 7/17/2022 4:03:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lecture](
	[LectureID] [nvarchar](20) NOT NULL,
	[Full Name] [nvarchar](150) NOT NULL,
	[Mail] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Lecture] PRIMARY KEY CLUSTERED 
(
	[LectureID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Semester]    Script Date: 7/17/2022 4:03:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Semester](
	[SemesterID] [nvarchar](50) NOT NULL,
	[CourseID] [nvarchar](6) NOT NULL,
	[StartTime] [date] NOT NULL,
	[EndTime] [date] NOT NULL,
 CONSTRAINT [PK_Semester] PRIMARY KEY CLUSTERED 
(
	[SemesterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 7/17/2022 4:03:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[StudentID] [nvarchar](8) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Gender] [bit] NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[Mail] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teach]    Script Date: 7/17/2022 4:03:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teach](
	[LectureID] [nvarchar](20) NOT NULL,
	[SemesterID] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Teach] PRIMARY KEY CLUSTERED 
(
	[LectureID] ASC,
	[SemesterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[View]    Script Date: 7/17/2022 4:03:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[View](
	[StudentID] [nvarchar](8) NOT NULL,
	[SemesterID] [nvarchar](50) NOT NULL,
	[Avarage] [float] NOT NULL,
	[Status] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_View_1] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC,
	[SemesterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Assessment]  WITH CHECK ADD  CONSTRAINT [FK_Assessment_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[Assessment] CHECK CONSTRAINT [FK_Assessment_Category]
GO
ALTER TABLE [dbo].[Course_Asessment]  WITH CHECK ADD  CONSTRAINT [FK_Course_Asessment_Assessment] FOREIGN KEY([AssessmentID])
REFERENCES [dbo].[Assessment] ([AssessmentID])
GO
ALTER TABLE [dbo].[Course_Asessment] CHECK CONSTRAINT [FK_Course_Asessment_Assessment]
GO
ALTER TABLE [dbo].[Course_Asessment]  WITH CHECK ADD  CONSTRAINT [FK_Course_Asessment_Course] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([CourseID])
GO
ALTER TABLE [dbo].[Course_Asessment] CHECK CONSTRAINT [FK_Course_Asessment_Course]
GO
ALTER TABLE [dbo].[Enroll]  WITH CHECK ADD  CONSTRAINT [FK_Enroll_Group] FOREIGN KEY([GroupID])
REFERENCES [dbo].[Group] ([GroupID])
GO
ALTER TABLE [dbo].[Enroll] CHECK CONSTRAINT [FK_Enroll_Group]
GO
ALTER TABLE [dbo].[Enroll]  WITH CHECK ADD  CONSTRAINT [FK_Enroll_Semester] FOREIGN KEY([SemesterID])
REFERENCES [dbo].[Semester] ([SemesterID])
GO
ALTER TABLE [dbo].[Enroll] CHECK CONSTRAINT [FK_Enroll_Semester]
GO
ALTER TABLE [dbo].[Grade]  WITH CHECK ADD  CONSTRAINT [FK_Grade_Assessment] FOREIGN KEY([AssessmentID])
REFERENCES [dbo].[Assessment] ([AssessmentID])
GO
ALTER TABLE [dbo].[Grade] CHECK CONSTRAINT [FK_Grade_Assessment]
GO
ALTER TABLE [dbo].[Grade]  WITH CHECK ADD  CONSTRAINT [FK_Grade_Semester] FOREIGN KEY([SemesterID])
REFERENCES [dbo].[Semester] ([SemesterID])
GO
ALTER TABLE [dbo].[Grade] CHECK CONSTRAINT [FK_Grade_Semester]
GO
ALTER TABLE [dbo].[Grade]  WITH CHECK ADD  CONSTRAINT [FK_Grade_Students] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Students] ([StudentID])
GO
ALTER TABLE [dbo].[Grade] CHECK CONSTRAINT [FK_Grade_Students]
GO
ALTER TABLE [dbo].[Join]  WITH CHECK ADD  CONSTRAINT [FK_Join_Group] FOREIGN KEY([GroupID])
REFERENCES [dbo].[Group] ([GroupID])
GO
ALTER TABLE [dbo].[Join] CHECK CONSTRAINT [FK_Join_Group]
GO
ALTER TABLE [dbo].[Join]  WITH CHECK ADD  CONSTRAINT [FK_Join_Students] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Students] ([StudentID])
GO
ALTER TABLE [dbo].[Join] CHECK CONSTRAINT [FK_Join_Students]
GO
ALTER TABLE [dbo].[Semester]  WITH CHECK ADD  CONSTRAINT [FK_Semester_Course] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([CourseID])
GO
ALTER TABLE [dbo].[Semester] CHECK CONSTRAINT [FK_Semester_Course]
GO
ALTER TABLE [dbo].[Teach]  WITH CHECK ADD  CONSTRAINT [FK_Teach_Lecture] FOREIGN KEY([LectureID])
REFERENCES [dbo].[Lecture] ([LectureID])
GO
ALTER TABLE [dbo].[Teach] CHECK CONSTRAINT [FK_Teach_Lecture]
GO
ALTER TABLE [dbo].[Teach]  WITH CHECK ADD  CONSTRAINT [FK_Teach_Semester1] FOREIGN KEY([SemesterID])
REFERENCES [dbo].[Semester] ([SemesterID])
GO
ALTER TABLE [dbo].[Teach] CHECK CONSTRAINT [FK_Teach_Semester1]
GO
ALTER TABLE [dbo].[View]  WITH CHECK ADD  CONSTRAINT [FK_View_Semester] FOREIGN KEY([SemesterID])
REFERENCES [dbo].[Semester] ([SemesterID])
GO
ALTER TABLE [dbo].[View] CHECK CONSTRAINT [FK_View_Semester]
GO
ALTER TABLE [dbo].[View]  WITH CHECK ADD  CONSTRAINT [FK_View_Students] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Students] ([StudentID])
GO
ALTER TABLE [dbo].[View] CHECK CONSTRAINT [FK_View_Students]
GO
USE [master]
GO
ALTER DATABASE [Student_GradeManagement_System] SET  READ_WRITE 
GO
