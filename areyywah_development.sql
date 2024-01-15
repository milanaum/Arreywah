-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 15, 2023 at 10:04 AM
-- Server version: 5.7.39
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `areyywah_development`
--

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

CREATE TABLE `authors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `full_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile_number` bigint(20) NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `passion_id` int(10) UNSIGNED NOT NULL,
  `dob` date NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '0:in active,1:active',
  `is_admin` tinyint(4) DEFAULT NULL,
  `is_email_verified` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0:not verified,1:verified',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `verification_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `about` longtext COLLATE utf8mb4_unicode_ci,
  `website` longtext COLLATE utf8mb4_unicode_ci,
  `instagram_url` longtext COLLATE utf8mb4_unicode_ci,
  `facebook_url` longtext COLLATE utf8mb4_unicode_ci,
  `linked_in_url` longtext COLLATE utf8mb4_unicode_ci,
  `youtube_url` longtext COLLATE utf8mb4_unicode_ci,
  `twitter_url` longtext COLLATE utf8mb4_unicode_ci,
  `password_reset_link` longtext COLLATE utf8mb4_unicode_ci,
  `link_created_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Triggers `authors`
--
DELIMITER $$
CREATE TRIGGER `unique_author_code_after_insert` BEFORE INSERT ON `authors` FOR EACH ROW BEGIN
                declare ready int default 0;
                declare rnd_str text;
                if(new.code is null or new.code="") then
                   while not ready do
                    set rnd_str := concat("AT",lpad(conv(floor(rand()*pow(36,8)), 10, 36), 8, 0));
                    if not exists (select * from authors where code = rnd_str) then
                      set new.code = rnd_str;
                      set ready := 1;
                    end if;
                   end while;
                end if;
              END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `author_status_histories`
--

CREATE TABLE `author_status_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `author_id` int(10) UNSIGNED NOT NULL,
  `reason` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '0:In-Active;1:Active',
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(64) CHARACTER SET utf8mb4 DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '0:In-Active;1:Active',
  `reason` longtext COLLATE utf8mb4_unicode_ci,
  `is_admin` tinyint(4) DEFAULT NULL,
  `call_to_action` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0:Do not show call,1:Show call',
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `code`, `title`, `description`, `image`, `status`, `reason`, `is_admin`, `call_to_action`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'BG5GYP05YO', 'Success Starts with Passion', '<p>What is passion?</p>\r\n\r\n<p>&bull; It&rsquo;s to be always eager</p>\r\n\r\n<p>&bull; It&rsquo;s about going the extra mile</p>\r\n\r\n<p>&bull; It&rsquo;s about finding the inner fuel when you thought the tank was empty</p>\r\n\r\n<p>&bull; It&rsquo;s your positive attitude in a world full of negativity</p>\r\n\r\n<p>&bull; Being excited without fear of embarrassment</p>\r\n\r\n<p>&bull; It&rsquo;s doing the unexpected</p>\r\n\r\n<p>&bull; It&rsquo;s the unwillingness to accept second best or &ldquo;good enough&rdquo;</p>\r\n\r\n<p>&bull; It&rsquo;s always enthusiastic</p>\r\n\r\n<p>&bull; It lets you execute when you&rsquo;re exhausted</p>\r\n\r\n<p>One day you will die. Knowing this, how will you best live your life?</p>\r\n\r\n<p>I think a life full of passion, blood and enthusiasm is the only noble way to live.</p>\r\n\r\n<p>And why?</p>\r\n\r\n<p>It is impossible to fake passion in life. You cannot fake enthusiasm.</p>\r\n\r\n<p>If you follow your passion in life, you will never run out of motivation or inspiration. And why? You will be driven by that inner fire, you will not need others to spur you on to do anything. You will do all your activities out of &ldquo;autotelic&rdquo; motivation (you do it for the sake of It).</p>\r\n\r\n<p>You will no longer care so much about the recognition of others because you are doing it for yourself.</p>', 'blog/2023/7/IMG-20230309-WA0005_1688215425.jpg', 1, NULL, 1, 0, 9, 9, '2023-07-01 12:43:45', '2023-07-01 12:52:02'),
(2, 'BG1M8Y03PZ', 'Why following your passion is important?', '<p>Passion is often described as an intense, burning desire to pursue something that excites you, fills you with purpose and motivates you to strive towards excellence. While it may seem like a luxury to follow your passion, it is actually crucial for leading a fulfilling and satisfying life. Here are some reasons why it is important to follow your passion:</p>\r\n\r\n<p>Sense of Purpose</p>\r\n\r\n<p>When you are following your passion, you are driven by a deep sense of purpose. You have a clear goal in mind and are willing to put in the time, effort, and resources needed to achieve it. This purpose gives you a sense of direction and focus, and helps you to prioritize your activities and make decisions that align with your goals.</p>\r\n\r\n<p>Greater Happiness</p>\r\n\r\n<p>Pursuing your passion can bring great joy and fulfillment to your life. When you are doing something you love, you are more likely to feel satisfied, happy and content. You will be more engaged in your work, have a positive attitude, and be more resilient to stress.</p>\r\n\r\n<p>Personal Growth</p>\r\n\r\n<p>Following your passion can be a journey of self-discovery and personal growth. You will be pushed out of your comfort zone, face challenges and obstacles, and learn from your experiences. You will develop new skills, improve your confidence, and build resilience, which will help you to grow as a person.</p>\r\n\r\n<p>Improved Performance</p>\r\n\r\n<p>When you are doing something you are passionate about, you are more likely to excel at it. Passion gives you a strong motivation to work hard and persevere through difficulties, leading to improved performance and success. You will be more creative, innovative, and driven to achieve your goals.</p>\r\n\r\n<p>Inspiration to Others</p>\r\n\r\n<p>Following your passion can inspire others around you. When people see how dedicated and motivated you are in pursuing your passion, they may be encouraged to pursue their own passions and goals. This can create a positive ripple effect, inspiring others to lead a more fulfilling and satisfying life.</p>', 'blog/2023/7/IMG-20230309-WA0008_1688215600.jpg', 1, NULL, 1, 0, 9, NULL, '2023-07-01 12:46:40', '2023-07-01 12:46:40'),
(3, 'BG1IFXEV6M', 'True meaning of Success', '<p>Before we talk about passion and explain its meaning, we must first define the true meaning of success. Usually, when we think of success, we think of large sums of wealth or achieving a certain level of fame, but true success that satisfies does not only have to do with money.</p>\r\n\r\n<p>Success is better defined as the achievement of a desired goal or purpose. More than money or fame, most people desire to align their own passions with their work while earning a sustainable income. Money brings in less and less the more you earn, making it an elusive definition of success.</p>\r\n\r\n<p>For most people, success means taking pride in their accomplishments and being part of something that matters. This is especially true if the work is meaningful. When a person chooses to follow their passion, money and traditional success are more likely to follow because the time and effort invested in the endeavour is matched by enthusiasm and zeal.</p>\r\n\r\n<p>Why Passion Is So Important</p>\r\n\r\n<p>When enthusiasm and passion are present, people tend to be more resilient when they encounter obstacles. People who are passionate about what they do and not just &quot;about the money&quot; usually have a more positive attitude and can overcome difficulties by solving problems.</p>', 'blog/2023/7/IMG-20230309-WA0006_1688215645.jpg', 1, NULL, 1, 0, 9, NULL, '2023-07-01 12:47:25', '2023-07-01 12:47:25'),
(4, 'BGSKZPL5NV', 'Why don’t most of the parents let their children follow their passions?', '<p>There are several reasons why some parents may not let their children follow their passions:</p>\r\n\r\n<p>Fear of failure: Parents may fear that their children will not be successful or financially stable if they pursue their passions. They may want their children to pursue more traditional and secure career paths.</p>\r\n\r\n<p>Cultural or societal expectations: Some cultures and societies place a lot of emphasis on certain professions or career paths, and parents may feel pressured to encourage their children to follow these paths rather than their passions.</p>\r\n\r\n<p>Lack of understanding: Parents may not fully understand their childrens passions or may not see them as viable career options. They may not be aware of the potential opportunities in those fields or may not understand the value of pursuing something that brings their child joy.</p>\r\n\r\n<p>Personal biases: Parents may have their own personal biases or beliefs that limit their ability to support their childs passions. For example, they may believe that certain hobbies or interests are not appropriate for their gender, race, or social class.</p>\r\n\r\n<p>Its important for parents to recognize the importance of supporting their childrens passions and interests. By doing so, they can help their children develop a sense of purpose and fulfillment, and ultimately lead happier and more fulfilling lives.</p>', 'blog/2023/7/IMG-20230309-WA0007_1688215877.jpg', 1, NULL, 1, 0, 9, 9, '2023-07-01 12:51:17', '2023-07-01 12:52:47');

--
-- Triggers `blogs`
--
DELIMITER $$
CREATE TRIGGER `unique_blog_code_after_insert` BEFORE INSERT ON `blogs` FOR EACH ROW BEGIN
                declare ready int default 0;
                declare rnd_str text;
                if(new.code is null or new.code="") then
                   while not ready do
                    set rnd_str := concat("BG",lpad(conv(floor(rand()*pow(36,8)), 10, 36), 8, 0));
                    if not exists (select * from blogs where code = rnd_str) then
                      set new.code = rnd_str;
                      set ready := 1;
                    end if;
                   end while;
                end if;
              END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `blog_comments`
--

CREATE TABLE `blog_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `blog_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comments` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) DEFAULT NULL COMMENT '0:Pending;1:Published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog_comments`
--

INSERT INTO `blog_comments` (`id`, `blog_id`, `name`, `email`, `comments`, `status`, `created_at`, `updated_at`) VALUES
(2, 3, '🌍 Hello World! https://national-team.top/go/hezwgobsmq5dinbw?hs=2201805b87ac6169b7792116c0dab920 🌍', 'xsoog@merepost.com', '2trfcq', 0, '2023-07-10 08:18:39', '2023-07-10 08:18:39'),
(3, 2, '🌍 Hello World! https://national-team.top/go/hezwgobsmq5dinbw?hs=f7d414823ab67295a808cb0c2aa09440 🌍', 'xsoog@merepost.com', 'ivh0qi', 0, '2023-07-10 08:18:58', '2023-07-10 08:18:58'),
(4, 1, '🌍 Hello World! https://national-team.top/go/hezwgobsmq5dinbw?hs=45a58ec033ceff7977ae574b570adcf4 🌍', 'xsoog@merepost.com', 'qrkkjc', 0, '2023-07-10 08:19:05', '2023-07-10 08:19:05'),
(5, 4, '🌍 Hello World! https://national-team.top/go/hezwgobsmq5dinbw?hs=33b6925c1d24ad7d395144c9e87bedc4 🌍', 'xsoog@merepost.com', 'ul7evy', 0, '2023-07-10 08:19:10', '2023-07-10 08:19:10'),
(6, 3, '🌍 Hello World! https://national-team.top/go/hezwgobsmq5dinbw?hs=2201805b87ac6169b7792116c0dab920 🌍', 'guuema@mailto.plus', 'm5x12l', 0, '2023-07-29 16:53:11', '2023-07-29 16:53:11'),
(7, 2, '🌍 Hello World! https://national-team.top/go/hezwgobsmq5dinbw?hs=f7d414823ab67295a808cb0c2aa09440 🌍', 'guuema@mailto.plus', '3fcboc', 0, '2023-07-29 16:53:16', '2023-07-29 16:53:16'),
(8, 1, '🌍 Hello World! https://national-team.top/go/hezwgobsmq5dinbw?hs=45a58ec033ceff7977ae574b570adcf4 🌍', 'guuema@mailto.plus', '08ul91', 0, '2023-07-29 16:53:22', '2023-07-29 16:53:22'),
(12, 4, '🌍 Hello World! https://national-team.top/go/hezwgobsmq5dinbw?hs=33b6925c1d24ad7d395144c9e87bedc4 🌍', 'guuema@mailto.plus', 'xquqrb', 0, '2023-07-29 16:53:59', '2023-07-29 16:53:59');

-- --------------------------------------------------------

--
-- Table structure for table `blog_views`
--

CREATE TABLE `blog_views` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `blog_id` int(10) UNSIGNED NOT NULL,
  `ip_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `views` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog_views`
--

INSERT INTO `blog_views` (`id`, `blog_id`, `ip_address`, `views`, `created_at`, `updated_at`) VALUES
(1, 1, '106.51.186.116', 1, '2023-07-01 12:48:23', '2023-07-01 12:48:23'),
(2, 4, '103.185.199.66', 1, '2023-07-01 12:53:07', '2023-07-01 12:53:07'),
(3, 3, '103.185.199.66', 1, '2023-07-01 12:53:21', '2023-07-01 12:53:21'),
(4, 2, '103.185.199.66', 1, '2023-07-01 12:53:33', '2023-07-01 12:53:33'),
(5, 1, '103.185.199.66', 1, '2023-07-01 12:53:54', '2023-07-01 12:53:54'),
(6, 4, '106.51.186.116', 1, '2023-07-01 13:13:43', '2023-07-01 13:13:43'),
(7, 4, '122.171.16.63', 1, '2023-07-01 13:14:55', '2023-07-01 13:14:55'),
(8, 4, '167.86.166.132', 1, '2023-07-01 13:16:06', '2023-07-01 13:16:06'),
(9, 3, '106.51.186.116', 1, '2023-07-01 13:45:48', '2023-07-01 13:45:48'),
(10, 2, '106.51.187.8', 1, '2023-07-01 17:00:42', '2023-07-01 17:00:42'),
(11, 1, '49.205.141.68', 1, '2023-07-02 01:59:42', '2023-07-02 01:59:42'),
(12, 4, '49.205.141.68', 1, '2023-07-02 02:00:01', '2023-07-02 02:00:01'),
(14, 2, '106.51.185.206', 1, '2023-07-03 10:43:43', '2023-07-03 10:43:43'),
(15, 4, '49.205.136.56', 1, '2023-07-03 14:37:04', '2023-07-03 14:37:04'),
(16, 4, '122.171.17.126', 1, '2023-07-04 09:15:12', '2023-07-04 09:15:12'),
(17, 3, '122.171.17.126', 1, '2023-07-04 09:15:18', '2023-07-04 09:15:18'),
(18, 3, '106.51.185.206', 1, '2023-07-04 10:46:43', '2023-07-04 10:46:43'),
(19, 2, '49.205.136.56', 1, '2023-07-04 14:09:10', '2023-07-04 14:09:10'),
(20, 3, '157.50.49.107', 1, '2023-07-07 14:11:22', '2023-07-07 14:11:22'),
(21, 3, '223.231.165.211', 1, '2023-07-10 13:40:33', '2023-07-10 13:40:33'),
(22, 3, '152.58.208.147', 1, '2023-07-12 07:59:47', '2023-07-12 07:59:47'),
(23, 4, '171.76.87.114', 1, '2023-07-13 07:26:23', '2023-07-13 07:26:23'),
(24, 1, '49.205.138.205', 1, '2023-07-14 16:42:03', '2023-07-14 16:42:03'),
(25, 1, '106.51.186.236', 1, '2023-07-15 06:13:01', '2023-07-15 06:13:01'),
(35, 4, '152.58.209.154', 1, '2023-07-19 05:22:51', '2023-07-19 05:22:51'),
(39, 4, '115.97.176.41', 1, '2023-07-23 17:57:51', '2023-07-23 17:57:51'),
(40, 3, '103.5.135.74', 1, '2023-07-24 05:36:26', '2023-07-24 05:36:26'),
(45, 3, '103.5.135.35', 1, '2023-08-07 07:18:40', '2023-08-07 07:18:40'),
(46, 1, '103.5.135.35', 1, '2023-08-07 07:25:40', '2023-08-07 07:25:40'),
(49, 1, '49.205.144.232', 1, '2023-08-09 07:09:14', '2023-08-09 07:09:14'),
(50, 4, '103.5.135.35', 1, '2023-08-11 05:57:18', '2023-08-11 05:57:18'),
(51, 2, '103.5.135.35', 1, '2023-08-11 05:58:18', '2023-08-11 05:58:18'),
(59, 4, '106.51.185.231', 1, '2023-08-14 04:28:13', '2023-08-14 04:28:13');

-- --------------------------------------------------------

--
-- Table structure for table `brand_stories`
--

CREATE TABLE `brand_stories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(64) CHARACTER SET utf8mb4 DEFAULT NULL,
  `full_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `instagram_url` longtext COLLATE utf8mb4_unicode_ci,
  `facebook_url` longtext COLLATE utf8mb4_unicode_ci,
  `linked_in_url` longtext COLLATE utf8mb4_unicode_ci,
  `youtube_url` longtext COLLATE utf8mb4_unicode_ci,
  `twitter_url` longtext COLLATE utf8mb4_unicode_ci,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '0:in active,1:active',
  `reason` longtext COLLATE utf8mb4_unicode_ci,
  `call_to_action` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0:Do not show call,1:Show call',
  `is_admin` tinyint(4) DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brand_stories`
--

INSERT INTO `brand_stories` (`id`, `code`, `full_name`, `description`, `instagram_url`, `facebook_url`, `linked_in_url`, `youtube_url`, `twitter_url`, `logo`, `status`, `reason`, `call_to_action`, `is_admin`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'BSRZQ92GGH', 'The Brand Story of Amul', '<p>Amul&rsquo;s history dates back to 1946 when it was established as a dairy cooperative in Anand, Gujarat, India. Founded by Tribhuvandas Patel and Dr. Verghese Kurien, Amul aimed to empower farmers by creating a collective ownership model. It revolutionized the dairy industry with innovative practices, modern technology, and a robust supply chain.</p>\r\n\r\n<p>Over the years, Amul grew into a globally recognized brand, offering a wide range of dairy products loved by millions. Its success lies in its commitment to quality, its iconic Amul girl mascot, and its unwavering dedication to farmers&rsquo; welfare. Amul&rsquo;s inspiring history showcases the power of collective action, innovation, and the ability to create a brand deeply rooted in the values of empowerment and excellence.</p>', NULL, NULL, NULL, NULL, NULL, 'brand_story/2023/7/IMG-20230312-WA0007_1688213101.jpg', 1, NULL, 0, 1, 9, 9, '2023-07-01 12:05:01', '2023-07-01 12:33:40'),
(2, 'BS9ZBQ99PN', 'The Brand Story of Dabur', '<p>Dabur has a rich history that spans over 135 years. Founded in 1884 by Dr. S.K. Burman, Dabur began as a small Ayurvedic medicine company in Kolkata, India. With a firm belief in the healing power of nature and Ayurveda, Dabur gradually expanded its product offerings to include healthcare, personal care, and food products.</p>\r\n\r\n<p>Today, Dabur stands as a trusted household name, both in India and globally, known for its ingredients, and promotion of a holistic and healthy lifestyle. Dabur&rsquo;s remarkable journey is characterized commitment to quality, use of natural by its continuous innovation, customer trust, and its relentless dedication to the principles of Ayurveda.</p>', NULL, NULL, NULL, NULL, NULL, 'brand_story/2023/7/IMG-20230312-WA0010_1688213146.jpg', 1, NULL, 0, 1, 9, 9, '2023-07-01 12:05:46', '2023-07-01 12:34:03'),
(3, 'BS87X74WOD', 'The Brand Story of PhonePe', '<p>Launched in 2015 as a UPI-based payment app, PhonePe quickly gained popularity and disrupted the digital payments landscape in India. Its user-friendly interface, seamless transactions, and innovative features captured the attention of millions of users.</p>\r\n\r\n<p>With strategic partnerships, aggressive marketing, and a focus on customer experience, PhonePe rapidly expanded its user base and emerged as one of the leading digital payment platforms in India. Its success story is characterized by its ability to adapt to the evolving needs of the market, build customer trust, and provide convenient and secure digital payment solutions.</p>', NULL, NULL, NULL, NULL, NULL, 'brand_story/2023/7/IMG-20230312-WA0005_1688213197.jpg', 1, NULL, 0, 1, 9, 9, '2023-07-01 12:06:37', '2023-07-01 12:34:26'),
(4, 'BS83TQCFT6', 'The Brand Story of boAt', '<p>Established in 2016, boAt began as a start-up with a mission to provide high-quality, stylish audio products at affordable prices. Through its focus on innovation, cutting-edge design, and understanding of customer preferences, boAt quickly gained traction in the market.</p>\r\n\r\n<p>Its range of headphones, earphones, speakers, and other audio accessories resonated with the youth and fitness enthusiasts. Today, boAt stands as a leading audio brand in India, known for its trendy designs, superior sound quality, and value for money.</p>', NULL, NULL, NULL, NULL, NULL, 'brand_story/2023/7/IMG-20230312-WA0014_1688213251.jpg', 1, NULL, 0, 1, 9, 9, '2023-07-01 12:07:31', '2023-07-01 12:34:49'),
(5, 'BSB1C5ZURY', 'The Brand Story of Parle-G', '<p>Established in 1939 by the Parle Products company in India, Parle-G quickly became a household name. It gained immense popularity due to its affordable price, high-quality ingredients, and delicious taste. Parle-G&rsquo;s biscuits became a staple in Indian households, offering a convenient and tasty snack option for people of all ages.</p>\r\n\r\n<p>Over the years, Parle-G has consistently maintained its position as a market leader, capturing a significant share of the biscuit market in India. Parle-G&rsquo;s journey exemplifies its ability to establish a strong emotional connection with consumers, making it one of the most loved and trusted biscuit brands in India.</p>', NULL, NULL, NULL, NULL, NULL, 'brand_story/2023/7/IMG-20230312-WA0003_1688213356.jpg', 1, NULL, 0, 1, 9, 9, '2023-07-01 12:09:16', '2023-07-01 12:35:12'),
(6, 'BS09H0785S', 'The Brand Story of Nestle', '<p>Nestl&eacute;, a global food and beverage company, founded in 1866 by Henri Nestl&eacute;. The company initially focused on infant nutrition, introducing the world&#39;s first infant formula. Over the years, Nestl&eacute; expanded its product portfolio to include a wide range of food and beverage offerings, including coffee, dairy products, confectionery, and more.</p>\r\n\r\n<p>With a commitment to quality and innovation, today, Nestl&eacute; is a global leader in the food industry, operating in over 180 countries. Its success lies in its ability to adapt to changing consumer preferences, invest in research and development, and build strong relationships with customers worldwide.</p>', NULL, NULL, NULL, NULL, NULL, 'brand_story/2023/7/IMG-20230312-WA0016_1688213393.jpg', 1, NULL, 0, 1, 9, 9, '2023-07-01 12:09:53', '2023-07-01 12:35:35'),
(7, 'BS5TJR96TB', 'The Brand Story of MTR (Mavalli Tiffin Rooms)', '<p>Founded in 1924 in Bangalore, MTR started as a small restaurant serving traditional South Indian vegetarian dishes. With a focus on authentic flavors, impeccable quality, and preserving culinary traditions, MTR gained a loyal following.</p>\r\n\r\n<p>Over the years, the brand expanded into packaged food products, including ready-to-eat meals, spice mixes, and snacks. Today, MTR is a household name in India, known for its delicious and convenient food offerings. Its success can be attributed to its unwavering commitment to quality, heritage recipes, and a deep understanding of Indian taste preferences.</p>', NULL, NULL, NULL, NULL, NULL, 'brand_story/2023/7/IMG-20230312-WA0013_1688213460.jpg', 1, NULL, 0, 1, 9, 9, '2023-07-01 12:11:00', '2023-07-01 12:35:51'),
(8, 'BSDAW2KAHC', 'The Brand Story of Big Bazaar', '<p>Big Bazaar, launched in 2001, revolutionized retail in India with its hypermarket concept. Offering a wide range of affordable products under one roof, it quickly gained popularity.</p>\r\n\r\n<p>Expanding nationwide, Big Bazaar became India&rsquo;s largest retail chain, catering to the needs of the middle-class with convenience and value. Innovative marketing, festive offers, and customer satisfaction propelled its enduring success in the competitive retail market</p>', NULL, NULL, NULL, NULL, NULL, 'brand_story/2023/7/IMG-20230312-WA0002_1688213505.jpg', 1, NULL, 0, 1, 9, 9, '2023-07-01 12:11:45', '2023-07-01 12:36:08'),
(9, 'BS9KP58FE7', 'The Brand Story of Flipkart', '<p>Flipkart, founded in 2007 by Sachin Bansal and Binny Bansal, has a remarkable history and success story. Starting as an online bookstore, Flipkart quickly expanded its product offerings and transformed into India&rsquo;s leading e-commerce platform.</p>\r\n\r\n<p>With its customer-centric approach, wide selection of products, and innovative features like cash on delivery, Flipkart revolutionized online shopping in India. The company&rsquo;s relentless focus on customer satisfaction, competitive pricing, and efficient delivery systems helped it gain a massive customer base and become a household name.</p>', NULL, NULL, NULL, NULL, NULL, 'brand_story/2023/7/IMG-20230312-WA0017_1688213570.jpg', 1, NULL, 0, 1, 9, 9, '2023-07-01 12:12:50', '2023-07-01 12:36:29'),
(10, 'BSJ1FP3DU2', 'The Brand Story of Britannia', '<p>Britannia Industries, founded in 1892, has a rich history and an inspiring success story. It started as a small bakery in Kolkata, India, and over the years, has grown into one of India&rsquo;s leading food companies. From introducing iconic products like Britannia Marie Gold and Good Day biscuits to expanding its portfolio with dairy products, cakes, and bread, Britannia has become a household name in India.</p>\r\n\r\n<p>Its relentless focus on delivering superior taste and consistent quality has earned the trust and loyalty of millions of consumers. Britannia&rsquo;s success story reflects its ability to adapt to changing consumer preferences, build strong brand equity, and consistently deliver delightful food experiences</p>', NULL, NULL, NULL, NULL, NULL, 'brand_story/2023/7/IMG-20230312-WA0011_1688213653.jpg', 1, NULL, 0, 1, 9, 9, '2023-07-01 12:14:13', '2023-07-01 12:36:46'),
(11, 'BSMMWEKYSS', 'The Brand Story of Bata', '<p>From its humble beginnings in Zl&iacute;n, Czech Republic, Bata expanded globally and became synonymous with quality and style. With its innovative approach to shoemaking, Bata introduced mass production techniques, affordable pricing, and a wide range of designs to cater to diverse consumer needs.</p>\r\n\r\n<p>The company&#39;s success lies In its commitment to crafting comfortable and fashionable footwear, adapting to changing market trends, and building a strong retail network. Bata&rsquo;s history and success story epitomize its dedication to providing affordable, durable, and stylish shoes to customers worldwide</p>', NULL, NULL, NULL, NULL, NULL, 'brand_story/2023/7/IMG-20230312-WA0000_1688213693.jpg', 1, NULL, 0, 1, 9, 9, '2023-07-01 12:14:53', '2023-07-01 12:37:02'),
(12, 'BSEAZPSG20', 'The Brand Story of Unilever', '<p>Unilever, founded in 1929, is a multinational consumer goods company with a remarkable history and a story of success. The company&rsquo;s roots can be traced back to the merger of two companies, Lever Brothers and Margarine Unie, which united to form Unilever.</p>\r\n\r\n<p>Throughout its history, Unilever has focused on producing and marketing a wide range of products, including food, beverages, cleaning agents, and personal care items. Through strategic acquisitions, brand diversification, and global expansion, Unilever has become one of the world&rsquo;s leading consumer goods companies, trusted by billions of consumers and recognized for its iconic brands.</p>', NULL, NULL, NULL, NULL, NULL, 'brand_story/2023/7/IMG-20230312-WA0004_1688213739.jpg', 1, NULL, 0, 1, 9, 9, '2023-07-01 12:15:39', '2023-07-01 12:37:27'),
(13, 'BS9AO1RSWA', 'The Brand Story of Nike', '<p>Originally started as a distributor of Japanese athletic shoes, Nike evolved into a groundbreaking athletic footwear and apparel brand. The company&#39;s success can be attributed to its relentless innovation, iconic branding, and strategic partnerships with world-renowned athletes.</p>\r\n\r\n<p>Nike revolutionized the industry with its innovative designs, technologies like Air cushioning, and memorable marketing campaigns. Through continuous product innovation, expansion into new markets, and sponsorship of high-profile athletes and teams, Nike has become a dominant force in the global sportswear market, synonymous with excellence, performance, and style.</p>', NULL, NULL, NULL, NULL, NULL, 'brand_story/2023/7/IMG-20230312-WA0015_1688213865.jpg', 1, NULL, 0, 1, 9, 9, '2023-07-01 12:17:45', '2023-07-01 12:37:53'),
(14, 'BSG14I0R99', 'The Passion Story of Maruti Suzuki', '<p>Maruti Suzuki was founded on February 24, 1981, to manufacture cars for middle-class Indians. The company was established as a government company called Maruti Udyog Ltd. With Suzuki as its minor partner. Maruti Udyog later signed a joint venture agreement with Suzuki Motor Corporation, Japan, which began a long-lasting and successful partnership.</p>\r\n\r\n<p>Maruti 800 was the first car it launched . Since it was affordable back then, it was extremely popular. Until today, this model of Maruti remains a classic.In the Indian context, they were successful in launching cars with excellent features at a budget-friendly price, making them &lsquo;people&rsquo;s cars&rsquo;. Until today, the company&rsquo;s cars are known to date to be within the price range of a middle-class buyer.</p>', NULL, NULL, NULL, NULL, NULL, 'brand_story/2023/7/IMG-20230312-WA0012_1688213918.jpg', 1, NULL, 0, 1, 9, 9, '2023-07-01 12:18:39', '2023-07-01 12:38:34'),
(15, 'BSXF057YSB', 'The Brand Story of Samsung', '<p>The South Korean company Samsung was originally founded by Lee Byung-Chull as a grocery producer and delivery business in 1938. The company initially traded noodles and other products produced in Taegu and exported them to nearby cities and provinces in China. During its journey to becoming the world&rsquo;s second largest tech company, boasting a profit of $41 billion in 2018, it has faced trials, accusations and setbacks. Following the Korean War in the early 1950s, Byung-Chull expanded the grocery trading business into textiles, opening the largest woollen mill in Korea.</p>\r\n\r\n<p>However, it wasn&rsquo;t until 1969 that Samsung entered the electronics industry, opening electronic-focused divisions within the company. With the proper research, management, and leadership, Samsung has become one of the biggest global brands. Today this prestigious company is the global leader and an award-winning innovator producing smarter gadgets every day.</p>', NULL, NULL, NULL, NULL, NULL, 'brand_story/2023/7/IMG-20230312-WA0009_1688214206.jpg', 1, NULL, 0, 1, 9, 9, '2023-07-01 12:23:26', '2023-07-01 12:38:59'),
(16, 'BSNJBXZ12S', 'The Brand Story of Amazon', '<p>Amazon, most of you know it as the online marketplace, where you can buy anything. Yeah, Amazon sells pretty much everything, in fact, they currently have a selection of over 100 million different products to choose from. Well, it actually started off with fairly modest beginnings. In this story of Amazon, let us take you all the way back to the 1990s.</p>\r\n\r\n<p>In 1994 a young Wall Street executive named Jeff Bezos has been paying attention to the growth of the internet and decided to leave his Wall Street firm in order to start an e-commerce company. Mr. Bezos packed up moved to Seattle and began to work on a business plan for his new e-commerce company which he called &ldquo;Cadabra Inc&rdquo; which was later named as &ldquo;Amazon&rdquo;. From books to Music CDs to Electronics to Groceries to Sporting Fashion, today Amazon success story claims it as the largest E-commerce leader in the world.</p>\r\n\r\n<p>What Shaped Amazon? Because its focus is on the customer&rsquo;s demands and perspective and not on building itself against the competitor. The success of Amazon is largely attributed to its ideas and innovation.</p>', NULL, NULL, NULL, NULL, NULL, 'brand_story/2023/7/IMG-20230312-WA0008_1688214253.jpg', 1, NULL, 0, 1, 9, 9, '2023-07-01 12:24:13', '2023-07-01 12:39:25'),
(17, 'BSAHZOV0YJ', 'The Brand Story of Royal Enfield', '<p>Royal Enfield, a leading Indian motorcycle manufacturer, has a rich history that traces back to its founding in 1892 in England. Initially manufacturing bicycle components, the company ventured into motorcycles and achieved success with significant orders during World Wars I and II. Royal Enfield entered the Indian market in 1949 and gained popularity when the Indian government adopted their motorcycles for the army and police.</p>\r\n\r\n<p>Facing challenges and ownership changes, the company found renewed success under the leadership of Siddhartha Lal, who revitalized the brand by focusing on performance improvements while preserving its vintage charm.Through effective marketing and strategic positioning, Royal Enfield became a market leader and a significant contributor to the profits of Eicher Motors. Siddhartha Lal&#39;s dedication and vision transformed Royal Enfield into a thriving business, exemplifying the power of passion and perseverance.</p>', NULL, NULL, NULL, NULL, NULL, 'brand_story/2023/7/IMG-20230312-WA0001_1688214435.jpg', 1, NULL, 0, 1, 9, NULL, '2023-07-01 12:27:15', '2023-07-01 12:27:15'),
(18, 'BS6B7PK7UL', 'The Brand Story of Balaji Wafers', '<p>Balaji Wafers, a leading regional potato wafer and snacks brand, has achieved significant success since its humble beginnings in 1982. Founder Chandubhai Virani started the business with a small investment and a shed in his home compound, initially facing challenges with unreliable suppliers. Recognizing the potential of potato wafers, Chandubhai and his brothers established Balaji Wafers Private Limited in 1992.</p>\r\n\r\n<p>With determination and relentless effort, they overcame setbacks, including a failed machinery installation, and focused on delivering quality products and excellent service. Today, Balaji Wafers operates four plants, with a substantial processing capacity and a diverse range of snack varieties, solidifying its position as a major player in the potato wafer and snacks market. The success of Balaji Wafers exemplifies the power of perseverance, adaptability, and commitment to quality.</p>', NULL, NULL, NULL, NULL, NULL, 'brand_story/2023/7/IMG-20230312-WA0006_1688214682.jpg', 1, NULL, 0, 1, 9, 9, '2023-07-01 12:31:22', '2023-07-01 12:40:12');

--
-- Triggers `brand_stories`
--
DELIMITER $$
CREATE TRIGGER `unique_brand_story_code_after_insert` BEFORE INSERT ON `brand_stories` FOR EACH ROW BEGIN
                declare ready int default 0;
                declare rnd_str text;
                if(new.code is null or new.code="") then
                   while not ready do
                    set rnd_str := concat("BS",lpad(conv(floor(rand()*pow(36,8)), 10, 36), 8, 0));
                    if not exists (select * from brand_stories where code = rnd_str) then
                      set new.code = rnd_str;
                      set ready := 1;
                    end if;
                   end while;
                end if;
              END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `brand_story_comments`
--

CREATE TABLE `brand_story_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `brand_story_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comments` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) DEFAULT NULL COMMENT '0:Pending,1:Published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brand_story_comments`
--

INSERT INTO `brand_story_comments` (`id`, `brand_story_id`, `name`, `email`, `comments`, `status`, `created_at`, `updated_at`) VALUES
(1, 15, 'ASG HARISH KUMAR', 'ahk.harishkumar@gmail.com', 'inspiring story', 1, '2023-07-01 13:54:14', '2023-07-01 13:54:31'),
(4, 7, '🌍 Hello World! https://national-team.top/go/hezwgobsmq5dinbw?hs=15e2e8c6966473262a229b5d78b272b5 🌍', 'xsoog@merepost.com', 'wyc71l', 0, '2023-07-10 08:19:35', '2023-07-10 08:19:35'),
(5, 4, '🌍 Hello World! https://national-team.top/go/hezwgobsmq5dinbw?hs=b1db496a3930a69d96d61d441af6dfb1 🌍', 'xsoog@merepost.com', 'vf69mt', 0, '2023-07-10 08:19:47', '2023-07-10 08:19:47'),
(6, 9, '🌍 Hello World! https://national-team.top/go/hezwgobsmq5dinbw?hs=12ca284eebb53b0da7dd2b19ff4c3d1a 🌍', 'xsoog@merepost.com', 'szbpw6', 0, '2023-07-10 08:19:59', '2023-07-10 08:19:59'),
(7, 8, '🌍 Hello World! https://national-team.top/go/hezwgobsmq5dinbw?hs=0971a3dac610eeb57a8c7fbf7010de0b 🌍', 'xsoog@merepost.com', 'lpe8d1', 0, '2023-07-10 08:20:21', '2023-07-10 08:20:21'),
(9, 14, '🌍 Hello World! https://national-team.top/go/hezwgobsmq5dinbw?hs=beb1457c41bb2b6abfe2b0938ae440f9 🌍', 'xsoog@merepost.com', 'ufk6fv', 0, '2023-07-10 08:21:18', '2023-07-10 08:21:18'),
(10, 10, '🌍 Hello World! https://national-team.top/go/hezwgobsmq5dinbw?hs=9b6c28584e77ddf8a7884d66708b3f5d 🌍', 'xsoog@merepost.com', 'ld11w3', 0, '2023-07-10 08:21:30', '2023-07-10 08:21:30'),
(11, 16, '🌍 Hello World! https://national-team.top/go/hezwgobsmq5dinbw?hs=cc7b62b2bc32a97cadda8af3ff16ea31 🌍', 'xsoog@merepost.com', 'mb8t0c', 0, '2023-07-10 08:21:39', '2023-07-10 08:21:39'),
(12, 1, '🌍 Hello World! https://national-team.top/go/hezwgobsmq5dinbw?hs=2fed763d52ecbc371a7840ab0f63549e 🌍', 'xsoog@merepost.com', 'fh06nk', 0, '2023-07-10 08:21:47', '2023-07-10 08:21:47'),
(13, 15, '🌍 Hello World! https://national-team.top/go/hezwgobsmq5dinbw?hs=1d666222b08a34dadcaf180f4d8f8ff1 🌍', 'xsoog@merepost.com', 'aiabcf', 0, '2023-07-10 08:21:55', '2023-07-10 08:21:55'),
(17, 16, '🌍 Hello World! https://national-team.top/go/hezwgobsmq5dinbw?hs=cc7b62b2bc32a97cadda8af3ff16ea31 🌍', 'guuema@mailto.plus', '78ivdw', 0, '2023-07-29 16:54:50', '2023-07-29 16:54:50');

-- --------------------------------------------------------

--
-- Table structure for table `brand_story_views`
--

CREATE TABLE `brand_story_views` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `brand_story_id` int(10) UNSIGNED NOT NULL,
  `ip_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `views` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brand_story_views`
--

INSERT INTO `brand_story_views` (`id`, `brand_story_id`, `ip_address`, `views`, `created_at`, `updated_at`) VALUES
(1, 3, '106.51.186.116', 1, '2023-07-01 12:17:43', '2023-07-01 12:17:43'),
(2, 9, '106.51.186.116', 1, '2023-07-01 12:30:08', '2023-07-01 12:30:08'),
(3, 18, '103.185.199.66', 1, '2023-07-01 12:41:26', '2023-07-01 12:41:26'),
(4, 16, '103.185.199.66', 1, '2023-07-01 12:41:34', '2023-07-01 12:41:34'),
(5, 15, '103.185.199.66', 1, '2023-07-01 12:41:42', '2023-07-01 12:41:42'),
(6, 14, '103.185.199.66', 1, '2023-07-01 12:41:48', '2023-07-01 12:41:48'),
(7, 12, '103.185.199.66', 1, '2023-07-01 12:41:57', '2023-07-01 12:41:57'),
(8, 17, '106.51.186.116', 1, '2023-07-01 13:45:24', '2023-07-01 13:45:24'),
(9, 16, '106.51.186.116', 1, '2023-07-01 13:46:18', '2023-07-01 13:46:18'),
(10, 15, '106.51.186.116', 1, '2023-07-01 13:53:59', '2023-07-01 13:53:59'),
(11, 2, '106.51.191.136', 1, '2023-07-02 11:09:05', '2023-07-02 11:09:05'),
(14, 18, '122.171.17.126', 1, '2023-07-04 09:09:08', '2023-07-04 09:09:08'),
(15, 16, '122.171.17.126', 1, '2023-07-04 09:10:24', '2023-07-04 09:10:24'),
(16, 6, '122.171.17.126', 1, '2023-07-04 09:11:40', '2023-07-04 09:11:40'),
(17, 1, '122.171.17.126', 1, '2023-07-04 09:11:51', '2023-07-04 09:11:51'),
(18, 14, '122.171.17.126', 1, '2023-07-04 09:12:04', '2023-07-04 09:12:04'),
(19, 15, '122.171.17.126', 1, '2023-07-04 09:34:36', '2023-07-04 09:34:36'),
(20, 17, '106.51.185.206', 1, '2023-07-04 10:46:16', '2023-07-04 10:46:16'),
(21, 17, '223.228.243.13', 1, '2023-07-06 12:20:26', '2023-07-06 12:20:26'),
(24, 4, '51.159.171.251', 1, '2023-07-07 03:54:50', '2023-07-07 03:54:50'),
(25, 9, '51.159.130.155', 1, '2023-07-07 03:56:18', '2023-07-07 03:56:18'),
(26, 8, '51.159.159.88', 1, '2023-07-07 03:57:59', '2023-07-07 03:57:59'),
(27, 18, '51.159.139.127', 1, '2023-07-07 04:01:20', '2023-07-07 04:01:20'),
(28, 6, '51.159.129.73', 1, '2023-07-07 04:19:56', '2023-07-07 04:19:56'),
(29, 7, '51.159.170.221', 1, '2023-07-07 04:39:42', '2023-07-07 04:39:42'),
(30, 17, '51.159.159.33', 1, '2023-07-07 05:37:48', '2023-07-07 05:37:48'),
(31, 5, '51.159.169.246', 1, '2023-07-07 05:46:18', '2023-07-07 05:46:18'),
(32, 3, '51.159.156.215', 1, '2023-07-07 06:29:31', '2023-07-07 06:29:31'),
(33, 2, '51.159.173.202', 1, '2023-07-07 06:44:27', '2023-07-07 06:44:27'),
(34, 11, '51.159.171.182', 1, '2023-07-07 09:02:30', '2023-07-07 09:02:30'),
(35, 10, '51.159.183.13', 1, '2023-07-07 16:16:39', '2023-07-07 16:16:39'),
(36, 6, '51.158.116.66', 1, '2023-07-08 20:06:40', '2023-07-08 20:06:40'),
(37, 18, '212.47.245.58', 1, '2023-07-08 20:07:27', '2023-07-08 20:07:27'),
(38, 4, '51.158.112.247', 1, '2023-07-08 20:12:47', '2023-07-08 20:12:47'),
(39, 17, '51.15.136.30', 1, '2023-07-08 22:18:42', '2023-07-08 22:18:42'),
(40, 14, '223.186.81.48', 1, '2023-07-09 06:44:16', '2023-07-09 06:44:16'),
(42, 9, '163.172.157.219', 1, '2023-07-09 16:41:12', '2023-07-09 16:41:12'),
(43, 13, '49.205.144.141', 1, '2023-07-09 16:41:54', '2023-07-09 16:41:54'),
(55, 18, '43.247.158.112', 1, '2023-07-10 00:58:24', '2023-07-10 00:58:24'),
(57, 11, '103.180.2.231', 1, '2023-07-10 05:26:40', '2023-07-10 05:26:40'),
(67, 5, '106.51.172.169', 1, '2023-07-10 07:20:43', '2023-07-10 07:20:43'),
(70, 10, '152.58.232.10', 1, '2023-07-10 13:18:11', '2023-07-10 13:18:11'),
(74, 17, '202.168.86.102', 1, '2023-07-12 11:49:21', '2023-07-12 11:49:21'),
(96, 9, '27.56.23.250', 1, '2023-07-16 11:09:30', '2023-07-16 11:09:30'),
(98, 17, '223.228.254.147', 1, '2023-07-17 15:19:08', '2023-07-17 15:19:08'),
(115, 15, '106.216.224.105', 1, '2023-07-18 04:26:16', '2023-07-18 04:26:16'),
(130, 17, '122.171.21.133', 1, '2023-07-23 10:45:07', '2023-07-23 10:45:07'),
(135, 4, '157.33.253.48', 1, '2023-07-23 13:42:42', '2023-07-23 13:42:42'),
(141, 1, '122.177.138.86', 1, '2023-07-24 08:38:16', '2023-07-24 08:38:16'),
(147, 7, '202.131.143.38', 1, '2023-07-26 07:17:49', '2023-07-26 07:17:49'),
(159, 17, '106.51.190.139', 1, '2023-07-29 04:47:11', '2023-07-29 04:47:11');

-- --------------------------------------------------------

--
-- Table structure for table `careers`
--

CREATE TABLE `careers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(64) CHARACTER SET utf8mb4 DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` text COLLATE utf8mb4_unicode_ci,
  `cv` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0:Open;1:Closed',
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Triggers `careers`
--
DELIMITER $$
CREATE TRIGGER `unique_career_code_after_insert` BEFORE INSERT ON `careers` FOR EACH ROW BEGIN
                declare ready int default 0;
                declare rnd_str text;
                if(new.code is null or new.code="") then
                   while not ready do
                    set rnd_str := concat("CAR",lpad(conv(floor(rand()*pow(36,8)), 10, 36), 8, 0));
                    if not exists (select * from careers where code = rnd_str) then
                      set new.code = rnd_str;
                      set ready := 1;
                    end if;
                   end while;
                end if;
              END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `career_histories`
--

CREATE TABLE `career_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `career_id` int(10) UNSIGNED NOT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `emagazines`
--

CREATE TABLE `emagazines` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(64) CHARACTER SET utf8mb4 DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cover_image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pdf_file` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '0:in active,1:active',
  `is_admin` tinyint(4) DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Triggers `emagazines`
--
DELIMITER $$
CREATE TRIGGER `unique_emagazine_code_after_insert` BEFORE INSERT ON `emagazines` FOR EACH ROW BEGIN
                declare ready int default 0;
                declare rnd_str text;
                if(new.code is null or new.code="") then
                   while not ready do
                    set rnd_str := concat("EM",lpad(conv(floor(rand()*pow(36,8)), 10, 36), 8, 0));
                    if not exists (select * from emagazines where code = rnd_str) then
                      set new.code = rnd_str;
                      set ready := 1;
                    end if;
                   end while;
                end if;
              END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `emagazine_subscriptions`
--

CREATE TABLE `emagazine_subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `full_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `passion_id` int(10) UNSIGNED NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '0:in active,1:active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `enquiries`
--

CREATE TABLE `enquiries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(64) CHARACTER SET utf8mb4 DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0:Open;1:Closed',
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Triggers `enquiries`
--
DELIMITER $$
CREATE TRIGGER `unique_enquiry_code_after_insert` BEFORE INSERT ON `enquiries` FOR EACH ROW BEGIN
                declare ready int default 0;
                declare rnd_str text;
                if(new.code is null or new.code="") then
                   while not ready do
                    set rnd_str := concat("ENQ",lpad(conv(floor(rand()*pow(36,8)), 10, 36), 8, 0));
                    if not exists (select * from enquiries where code = rnd_str) then
                      set new.code = rnd_str;
                      set ready := 1;
                    end if;
                   end while;
                end if;
              END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `enquiry_histories`
--

CREATE TABLE `enquiry_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `enquiry_id` int(10) UNSIGNED NOT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `feedbacks`
--

CREATE TABLE `feedbacks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `full_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `feedback` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '0:In-Active;1:Active',
  `is_admin` tinyint(4) DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `first_level_menus`
--

CREATE TABLE `first_level_menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `main_menu_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '0:in-active,1:active',
  `priority` int(11) DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `first_level_menus`
--

INSERT INTO `first_level_menus` (`id`, `main_menu_id`, `name`, `url`, `status`, `priority`, `icon`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 2, 'Dashboard', '/admin/dashboard', 1, 1, 'fas fa-tachometer-alt', 1, 1, '2022-07-13 16:16:44', '2022-07-15 04:38:56'),
(2, 3, 'Roles', '/admin/roles', 1, 6, 'fas fa-id-badge', 1, 1, '2022-07-13 16:17:59', '2022-07-14 13:33:21'),
(3, 1, 'My Profile', '/admin/profile', 1, 2, 'fas fa-user', 1, 1, '2022-07-14 12:11:41', '2022-07-14 13:33:21'),
(4, 3, 'Manage Menus', NULL, 1, 9, 'fas fa-qrcode', 1, 1, '2022-07-14 12:17:53', '2022-07-14 13:33:21'),
(5, 1, 'Change Password', '/admin/change-password', 1, 3, 'fas fa-key', 1, 1, '2022-07-14 12:23:43', '2022-07-14 13:33:21'),
(6, 1, 'Notifications', '/admin/notifications', 1, 4, 'fas fa-bell', 1, 1, '2022-07-14 12:26:38', '2022-07-14 13:33:21'),
(7, 3, 'Permissions', '/admin/permissions', 1, 7, 'fas fa-lock', 1, 1, '2022-07-14 12:30:49', '2022-07-14 13:33:21'),
(8, 3, 'Error Logs', '/log-viewer/dashboard', 1, 8, 'fas fa-bug', 1, 1, '2022-07-14 12:32:49', '2022-07-14 13:33:21'),
(9, 3, 'Admin Users', '/admin/admin-users', 1, 5, 'fas fa-user-cog', 1, 1, '2022-07-14 12:34:29', '2022-07-14 13:33:21'),
(11, 2, 'Enquiries', '/admin/enquiries', 1, 14, 'fas fa-envelope', 1, 1, '2023-03-04 03:34:56', '2023-04-26 02:50:24'),
(12, 2, 'Careers', '/admin/careers', 1, 15, 'fas fa-file-alt', 1, 1, '2023-03-04 07:16:17', '2023-04-26 02:50:24'),
(13, 2, 'User Stories', NULL, 1, 11, 'fas fa-user-edit', 1, 1, '2023-03-04 09:52:42', '2023-03-15 16:07:14'),
(14, 2, 'E-Magazine', NULL, 1, 13, 'fas fa-book', 1, 1, '2023-03-14 07:50:13', '2023-04-26 02:50:24'),
(15, 2, 'Authors', '/admin/authors', 1, 10, 'fas fa-users', 1, 1, '2023-03-15 15:23:33', '2023-03-15 16:07:14'),
(16, 2, 'Notices', '/admin/notices', 1, 16, 'fas fa-mail-bulk', 1, 1, '2023-03-18 04:28:03', '2023-03-18 04:28:19'),
(17, 2, 'Feedbacks', '/admin/feedbacks', 1, 17, 'fas  fa-comment-alt', 1, 1, '2023-03-18 07:11:09', '2023-03-18 07:12:24'),
(18, 2, 'Website Settings', NULL, 1, 19, 'fas fa-cog', 1, 1, '2023-03-19 04:04:52', '2023-05-04 11:31:55'),
(19, 2, 'Podcast', NULL, 1, 12, 'fas fa-microphone-alt', 1, 1, '2023-04-26 02:49:19', '2023-04-26 02:50:24'),
(20, 2, 'Passion', '/admin/passion', 1, 18, 'fas fa-hand-holding-heart', 1, 1, '2023-05-04 11:31:42', '2023-05-04 14:18:34');

-- --------------------------------------------------------

--
-- Table structure for table `first_level_menu_permissions`
--

CREATE TABLE `first_level_menu_permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_level_menu_id` int(10) UNSIGNED NOT NULL,
  `permission_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `first_level_menu_permissions`
--

INSERT INTO `first_level_menu_permissions` (`id`, `first_level_menu_id`, `permission_id`, `created_at`, `updated_at`) VALUES
(1, 1, 16, '2022-07-14 11:51:50', '2022-07-14 11:51:50'),
(2, 2, 9, '2022-07-14 11:53:41', '2022-07-14 11:53:41'),
(3, 5, 2, '2022-07-14 12:24:18', '2022-07-14 12:24:18'),
(4, 3, 1, '2022-07-14 12:24:57', '2022-07-14 12:24:57'),
(5, 6, 21, '2022-07-14 12:28:07', '2022-07-14 12:28:07'),
(6, 7, 12, '2022-07-14 12:31:21', '2022-07-14 12:31:21'),
(7, 8, 15, '2022-07-14 12:33:20', '2022-07-14 12:33:20'),
(8, 9, 4, '2022-07-14 12:35:18', '2022-07-14 12:35:18'),
(9, 9, 5, '2022-07-14 12:39:17', '2022-07-14 12:39:17'),
(10, 9, 17, '2022-07-14 12:39:51', '2022-07-14 12:39:51'),
(11, 9, 7, '2022-07-14 12:40:21', '2022-07-14 12:40:21'),
(12, 9, 6, '2022-07-14 12:40:36', '2022-07-14 12:40:36'),
(13, 9, 3, '2022-07-14 12:41:04', '2022-07-14 12:41:04'),
(14, 2, 26, '2022-07-14 12:41:36', '2022-07-14 12:41:36'),
(15, 2, 18, '2022-07-14 12:41:56', '2022-07-14 12:41:56'),
(16, 7, 27, '2022-07-14 12:42:40', '2022-07-14 12:42:40'),
(17, 7, 19, '2022-07-14 12:42:54', '2022-07-14 12:42:54'),
(18, 7, 14, '2022-07-14 12:43:07', '2022-07-14 12:43:07'),
(19, 7, 13, '2022-07-14 12:43:21', '2022-07-14 12:43:21'),
(20, 8, 20, '2022-07-14 12:44:03', '2022-07-14 12:44:03'),
(21, 6, 25, '2022-07-14 12:44:44', '2022-07-14 12:44:44'),
(22, 6, 24, '2022-07-14 12:44:59', '2022-07-14 12:44:59'),
(23, 6, 23, '2022-07-14 12:45:13', '2022-07-14 12:45:13'),
(24, 6, 22, '2022-07-14 12:45:30', '2022-07-14 12:45:30'),
(25, 9, 8, '2022-07-14 12:46:26', '2022-07-14 12:46:26'),
(26, 4, 43, '2022-07-14 13:22:41', '2022-07-14 13:22:41'),
(27, 4, 32, '2022-07-14 13:23:00', '2022-07-14 13:23:00'),
(28, 4, 31, '2022-07-14 13:23:32', '2022-07-14 13:23:32'),
(29, 4, 30, '2022-07-14 13:23:49', '2022-07-14 13:23:49'),
(30, 4, 29, '2022-07-14 13:24:11', '2022-07-14 13:24:11'),
(31, 4, 28, '2022-07-14 13:24:29', '2022-07-14 13:24:29'),
(32, 4, 44, '2022-07-14 13:25:03', '2022-07-14 13:25:03'),
(33, 4, 37, '2022-07-14 13:25:28', '2022-07-14 13:25:28'),
(34, 4, 36, '2022-07-14 13:25:47', '2022-07-14 13:25:47'),
(35, 4, 35, '2022-07-14 13:26:21', '2022-07-14 13:26:21'),
(36, 4, 34, '2022-07-14 13:26:48', '2022-07-14 13:26:48'),
(37, 4, 33, '2022-07-14 13:28:53', '2022-07-14 13:28:53'),
(38, 4, 45, '2022-07-14 13:29:26', '2022-07-14 13:29:26'),
(39, 4, 42, '2022-07-14 13:29:58', '2022-07-14 13:29:58'),
(40, 4, 41, '2022-07-14 13:30:32', '2022-07-14 13:30:32'),
(41, 4, 40, '2022-07-14 13:30:48', '2022-07-14 13:30:48'),
(42, 4, 39, '2022-07-14 13:31:04', '2022-07-14 13:31:04'),
(43, 4, 38, '2022-07-14 13:31:19', '2022-07-14 13:31:19'),
(49, 11, 51, '2023-03-04 03:35:50', '2023-03-04 03:35:50'),
(50, 11, 52, '2023-03-04 03:36:24', '2023-03-04 03:36:24'),
(51, 11, 53, '2023-03-04 03:36:49', '2023-03-04 03:36:49'),
(52, 11, 54, '2023-03-04 03:37:16', '2023-03-04 03:37:16'),
(53, 11, 55, '2023-03-04 03:37:40', '2023-03-04 03:37:40'),
(54, 11, 56, '2023-03-04 03:38:09', '2023-03-04 03:38:09'),
(55, 11, 57, '2023-03-04 04:35:17', '2023-03-04 04:35:17'),
(56, 12, 58, '2023-03-04 07:18:43', '2023-03-04 07:18:43'),
(57, 12, 59, '2023-03-04 07:19:01', '2023-03-04 07:19:01'),
(58, 12, 60, '2023-03-04 07:19:22', '2023-03-04 07:19:22'),
(59, 12, 61, '2023-03-04 07:19:45', '2023-03-04 07:19:45'),
(60, 12, 62, '2023-03-04 07:20:05', '2023-03-04 07:20:05'),
(61, 12, 63, '2023-03-04 07:20:37', '2023-03-04 07:20:37'),
(62, 12, 64, '2023-03-04 07:21:25', '2023-03-04 07:21:25'),
(63, 12, 65, '2023-03-04 09:32:57', '2023-03-04 09:32:57'),
(64, 13, 66, '2023-03-04 10:04:02', '2023-03-04 10:04:02'),
(65, 13, 67, '2023-03-04 10:04:31', '2023-03-04 10:04:31'),
(66, 13, 68, '2023-03-04 10:04:51', '2023-03-04 10:04:51'),
(67, 13, 69, '2023-03-04 10:05:54', '2023-03-04 10:05:54'),
(68, 13, 70, '2023-03-04 10:07:02', '2023-03-04 10:07:02'),
(69, 13, 71, '2023-03-04 10:07:28', '2023-03-04 10:07:28'),
(70, 13, 72, '2023-03-04 11:06:28', '2023-03-04 11:06:28'),
(71, 13, 73, '2023-03-04 11:07:00', '2023-03-04 11:07:00'),
(72, 13, 74, '2023-03-04 11:07:30', '2023-03-04 11:07:30'),
(73, 13, 75, '2023-03-04 11:08:17', '2023-03-04 11:08:17'),
(74, 13, 76, '2023-03-04 11:08:46', '2023-03-04 11:08:46'),
(75, 13, 77, '2023-03-04 11:09:10', '2023-03-04 11:09:10'),
(76, 13, 78, '2023-03-04 11:10:12', '2023-03-04 11:10:12'),
(77, 13, 79, '2023-03-04 11:10:34', '2023-03-04 11:10:34'),
(78, 13, 80, '2023-03-04 11:10:55', '2023-03-04 11:10:55'),
(79, 13, 81, '2023-03-04 11:11:27', '2023-03-04 11:11:27'),
(80, 13, 82, '2023-03-04 11:11:49', '2023-03-04 11:11:49'),
(81, 13, 83, '2023-03-04 11:12:04', '2023-03-04 11:12:04'),
(82, 19, 84, '2023-03-04 11:13:01', '2023-04-27 14:19:30'),
(83, 19, 85, '2023-03-04 11:13:38', '2023-04-27 14:19:54'),
(84, 19, 86, '2023-03-04 11:13:58', '2023-04-27 14:20:14'),
(85, 19, 87, '2023-03-04 11:14:16', '2023-04-27 14:20:32'),
(86, 19, 88, '2023-03-04 11:14:35', '2023-04-27 14:20:47'),
(87, 19, 89, '2023-03-04 11:14:55', '2023-04-27 14:21:04'),
(88, 14, 90, '2023-03-14 07:51:31', '2023-03-14 07:51:31'),
(89, 14, 91, '2023-03-14 07:51:56', '2023-03-14 07:51:56'),
(90, 14, 92, '2023-03-14 07:52:19', '2023-03-14 07:52:19'),
(91, 15, 93, '2023-03-15 16:08:02', '2023-03-15 16:08:02'),
(92, 15, 94, '2023-03-15 16:08:26', '2023-03-15 16:08:26'),
(93, 15, 95, '2023-03-15 16:08:54', '2023-03-15 16:08:54'),
(94, 15, 96, '2023-03-15 16:09:15', '2023-03-15 16:09:15'),
(95, 15, 97, '2023-03-15 16:09:43', '2023-03-15 16:09:43'),
(96, 14, 98, '2023-03-16 03:34:02', '2023-03-16 03:34:02'),
(97, 14, 99, '2023-03-16 03:34:40', '2023-03-16 03:34:40'),
(98, 14, 100, '2023-03-16 03:35:06', '2023-03-16 03:35:06'),
(99, 14, 101, '2023-03-16 03:35:36', '2023-03-16 03:35:36'),
(100, 14, 102, '2023-03-16 03:36:04', '2023-03-16 03:36:04'),
(101, 14, 103, '2023-03-16 03:36:30', '2023-03-16 03:36:30'),
(102, 16, 104, '2023-03-18 04:29:09', '2023-03-18 04:29:09'),
(103, 16, 105, '2023-03-18 04:29:39', '2023-03-18 04:29:39'),
(104, 16, 106, '2023-03-18 04:30:06', '2023-03-18 04:30:06'),
(105, 16, 107, '2023-03-18 04:30:34', '2023-03-18 04:30:34'),
(106, 16, 108, '2023-03-18 04:31:03', '2023-03-18 04:31:03'),
(107, 16, 109, '2023-03-18 04:31:27', '2023-03-18 04:31:27'),
(108, 17, 110, '2023-03-18 07:14:46', '2023-03-18 07:14:46'),
(109, 17, 111, '2023-03-18 07:15:11', '2023-03-18 07:15:11'),
(110, 17, 112, '2023-03-18 07:15:37', '2023-03-18 07:15:37'),
(111, 17, 113, '2023-03-18 07:16:04', '2023-03-18 07:16:04'),
(112, 17, 114, '2023-03-18 07:16:25', '2023-03-18 07:16:25'),
(113, 17, 115, '2023-03-18 07:16:42', '2023-03-18 07:16:42'),
(114, 18, 116, '2023-03-19 04:07:37', '2023-03-19 04:07:37'),
(115, 18, 117, '2023-03-19 04:08:02', '2023-03-19 04:08:02'),
(116, 18, 118, '2023-03-19 04:08:27', '2023-03-19 04:08:27'),
(117, 18, 119, '2023-03-19 04:08:57', '2023-03-19 04:08:57'),
(118, 18, 120, '2023-03-19 04:09:42', '2023-03-19 04:09:42'),
(119, 18, 121, '2023-03-19 04:10:37', '2023-03-19 04:10:37'),
(120, 18, 122, '2023-03-19 04:11:02', '2023-03-19 04:11:02'),
(121, 18, 50, '2023-03-19 05:52:49', '2023-03-19 05:52:49'),
(122, 18, 49, '2023-03-19 05:53:05', '2023-03-19 05:53:05'),
(123, 18, 48, '2023-03-19 05:53:20', '2023-03-19 05:53:20'),
(124, 18, 47, '2023-03-19 05:53:35', '2023-03-19 05:53:35'),
(125, 18, 46, '2023-03-19 05:53:50', '2023-03-19 05:53:50'),
(126, 13, 123, '2023-04-26 02:56:34', '2023-04-26 02:56:34'),
(127, 13, 124, '2023-04-26 02:57:05', '2023-04-26 02:57:05'),
(128, 13, 125, '2023-04-26 02:57:35', '2023-04-26 02:57:35'),
(129, 13, 126, '2023-04-26 02:58:00', '2023-04-26 02:58:00'),
(130, 13, 127, '2023-04-26 02:58:35', '2023-04-26 02:58:35'),
(131, 13, 128, '2023-04-26 02:58:59', '2023-04-26 02:58:59'),
(132, 13, 129, '2023-04-26 02:59:47', '2023-04-26 02:59:47'),
(133, 13, 130, '2023-04-26 03:00:25', '2023-04-26 03:00:25'),
(134, 13, 131, '2023-04-26 03:00:53', '2023-04-26 03:00:53'),
(135, 19, 132, '2023-04-26 03:01:25', '2023-04-26 03:01:25'),
(136, 19, 133, '2023-04-26 03:01:54', '2023-04-26 03:01:54'),
(137, 19, 134, '2023-04-26 03:02:26', '2023-04-26 03:02:26'),
(138, 19, 135, '2023-04-26 03:02:52', '2023-04-26 03:02:52'),
(139, 19, 136, '2023-04-26 03:03:22', '2023-04-26 03:03:22'),
(140, 20, 137, '2023-05-04 11:32:45', '2023-05-04 11:32:45'),
(141, 20, 138, '2023-05-04 11:33:15', '2023-05-04 11:33:15'),
(142, 20, 139, '2023-05-04 11:33:39', '2023-05-04 11:33:39'),
(143, 20, 140, '2023-05-04 11:33:58', '2023-05-04 11:33:58');

-- --------------------------------------------------------

--
-- Table structure for table `general_settings`
--

CREATE TABLE `general_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` longtext COLLATE utf8mb4_unicode_ci,
  `instagram` longtext COLLATE utf8mb4_unicode_ci,
  `facebook` longtext COLLATE utf8mb4_unicode_ci,
  `twitter` longtext COLLATE utf8mb4_unicode_ci,
  `linkedin` longtext COLLATE utf8mb4_unicode_ci,
  `youtube` longtext COLLATE utf8mb4_unicode_ci,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google_analytics` longtext COLLATE utf8mb4_unicode_ci,
  `google_map` longtext COLLATE utf8mb4_unicode_ci,
  `facebook_chat` longtext COLLATE utf8mb4_unicode_ci,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '0:in active,1:active',
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `general_settings`
--

INSERT INTO `general_settings` (`id`, `email`, `mobile`, `address`, `instagram`, `facebook`, `twitter`, `linkedin`, `youtube`, `logo`, `google_analytics`, `google_map`, `facebook_chat`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'support@areyywah.com', '8179305787', '<p>No.162/2,JJ. Complex,3rd Floor 18th cross,MC layout,vijay nagar, Bengaluru 560040</p>', 'https://www.instagram.com/pasclubs/', 'https://www.facebook.com/Pasclubs/', 'https://twitter.com/pasclubs/', 'https://www.linkedin.com/company/areyywah/', 'https://www.youtube.com/@Pasclubs/', 'general_settings/2023/7/2_1688732470.png', NULL, '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3888.1861730412434!2d77.52900601534309!3d12.95993581863945!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3bae3f28f4853b51%3A0x62c1e2c43926b8d!2sAreyywah%3AFollow%20your%20passion!5e0!3m2!1sen!2sin!4v1649407703493!5m2!1sen!2sin\" width=\"100%\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>', '<!-- Messenger Chat Plugin Code -->\r\n<div id=\"fb-root\"></div>\r\n\r\n<!-- Your Chat Plugin code -->\r\n<div id=\"fb-customer-chat\" class=\"fb-customerchat\">\r\n</div>\r\n\r\n<script>\r\n  var chatbox = document.getElementById(\'fb-customer-chat\');\r\n  chatbox.setAttribute(\"page_id\", \"104891415717132\");\r\n  chatbox.setAttribute(\"attribution\", \"biz_inbox\");\r\n</script>\r\n\r\n<!-- Your SDK code -->\r\n<script>\r\n  window.fbAsyncInit = function() {\r\n    FB.init({\r\n      xfbml            : true,\r\n      version          : \'v16.0\'\r\n    });\r\n  };\r\n\r\n  (function(d, s, id) {\r\n    var js, fjs = d.getElementsByTagName(s)[0];\r\n    if (d.getElementById(id)) return;\r\n    js = d.createElement(s); js.id = id;\r\n    js.src = \'https://connect.facebook.net/en_US/sdk/xfbml.customerchat.js\';\r\n    fjs.parentNode.insertBefore(js, fjs);\r\n  }(document, \'script\', \'facebook-jssdk\'));\r\n</script>', 1, NULL, 8, NULL, '2023-07-07 12:21:10');

-- --------------------------------------------------------

--
-- Table structure for table `home_sliders`
--

CREATE TABLE `home_sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` int(10) UNSIGNED DEFAULT NULL,
  `web_image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile_image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '0:in active,1:active',
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `home_sliders`
--

INSERT INTO `home_sliders` (`id`, `name`, `priority`, `web_image`, `mobile_image`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'Slider 1', NULL, 'home_slider_web/2023/7/N-Slider-1_1688627141.jpg', 'home_slider_mobile/2023/7/N-Mob-Slider-1_1688627141.jpg', 1, 8, 8, '2023-06-30 10:13:40', '2023-07-06 07:05:41'),
(2, 'Slider 2', NULL, 'home_slider_web/2023/7/N-Slider-3 (1)_1688454094.jpg', 'home_slider_mobile/2023/7/N-Mob-Slider-3 (1)_1688464127.jpg', 1, 8, 8, '2023-06-30 10:15:08', '2023-07-04 09:48:47'),
(3, 'Slider 3', NULL, 'home_slider_web/2023/6/D-Slider-4_1688120244.jpg', 'home_slider_mobile/2023/6/Mobile-Slider-4_1688120244.jpg', 0, 8, 8, '2023-06-30 10:17:24', '2023-07-03 14:07:55'),
(4, 'Slider 4', NULL, 'home_slider_web/2023/7/N-Slider-2_1688626000.jpg', 'home_slider_mobile/2023/7/N-Mob-Slider-2 (1)_1688455767.jpg', 1, 8, 8, '2023-07-03 13:54:04', '2023-07-06 06:46:40'),
(5, 'Slider 5', NULL, 'home_slider_web/2023/7/D-Slider-7_1688484272.jpg', 'home_slider_mobile/2023/7/WhatsApp Image 2023-05-08 at 10_1688484272.29', 0, 8, 8, '2023-07-04 15:24:32', '2023-07-04 15:25:43');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `main_menus`
--

CREATE TABLE `main_menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '0:in-active,1:active',
  `priority` int(11) DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `main_menus`
--

INSERT INTO `main_menus` (`id`, `name`, `status`, `priority`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'Account Settings', 1, 2, 1, 1, '2022-07-13 16:03:45', '2022-07-13 16:03:45'),
(2, 'Manage Modules', 1, 1, 1, 1, '2022-07-13 16:04:19', '2022-07-13 16:04:19'),
(3, 'Configurations', 1, 3, 1, 1, '2022-07-13 16:04:37', '2022-07-13 16:04:37');

-- --------------------------------------------------------

--
-- Table structure for table `main_menu_permissions`
--

CREATE TABLE `main_menu_permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `main_menu_id` int(10) UNSIGNED NOT NULL,
  `permission_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `main_menu_permissions`
--

INSERT INTO `main_menu_permissions` (`id`, `main_menu_id`, `permission_id`, `created_at`, `updated_at`) VALUES
(1, 1, 2, '2022-07-13 16:13:44', '2022-07-13 16:13:44'),
(2, 1, 1, '2022-07-13 16:14:34', '2022-07-13 16:14:34'),
(3, 3, 9, '2022-07-13 16:14:34', '2022-07-13 16:14:34'),
(4, 3, 10, '2022-07-13 16:14:34', '2022-07-13 16:14:34'),
(5, 3, 11, '2022-07-13 16:14:34', '2022-07-13 16:14:34'),
(6, 1, 21, '2022-07-14 12:28:07', '2022-07-14 12:28:07'),
(7, 3, 12, '2022-07-14 12:31:21', '2022-07-14 12:31:21'),
(8, 3, 15, '2022-07-14 12:33:20', '2022-07-14 12:33:20'),
(9, 3, 4, '2022-07-14 12:35:18', '2022-07-14 12:35:18'),
(10, 3, 5, '2022-07-14 12:39:17', '2022-07-14 12:39:17'),
(11, 3, 17, '2022-07-14 12:39:51', '2022-07-14 12:39:51'),
(12, 3, 7, '2022-07-14 12:40:21', '2022-07-14 12:40:21'),
(13, 3, 6, '2022-07-14 12:40:36', '2022-07-14 12:40:36'),
(14, 3, 3, '2022-07-14 12:41:04', '2022-07-14 12:41:04'),
(15, 3, 26, '2022-07-14 12:41:35', '2022-07-14 12:41:35'),
(16, 3, 18, '2022-07-14 12:41:56', '2022-07-14 12:41:56'),
(17, 3, 27, '2022-07-14 12:42:40', '2022-07-14 12:42:40'),
(18, 3, 19, '2022-07-14 12:42:54', '2022-07-14 12:42:54'),
(19, 3, 14, '2022-07-14 12:43:07', '2022-07-14 12:43:07'),
(20, 3, 13, '2022-07-14 12:43:21', '2022-07-14 12:43:21'),
(21, 3, 20, '2022-07-14 12:44:03', '2022-07-14 12:44:03'),
(22, 1, 25, '2022-07-14 12:44:44', '2022-07-14 12:44:44'),
(23, 1, 24, '2022-07-14 12:44:59', '2022-07-14 12:44:59'),
(24, 1, 23, '2022-07-14 12:45:13', '2022-07-14 12:45:13'),
(25, 1, 22, '2022-07-14 12:45:30', '2022-07-14 12:45:30'),
(26, 3, 8, '2022-07-14 12:46:26', '2022-07-14 12:46:26'),
(27, 3, 43, '2022-07-14 13:22:41', '2022-07-14 13:22:41'),
(28, 3, 32, '2022-07-14 13:23:00', '2022-07-14 13:23:00'),
(29, 3, 31, '2022-07-14 13:23:32', '2022-07-14 13:23:32'),
(30, 3, 30, '2022-07-14 13:23:49', '2022-07-14 13:23:49'),
(31, 3, 29, '2022-07-14 13:24:11', '2022-07-14 13:24:11'),
(32, 3, 28, '2022-07-14 13:24:29', '2022-07-14 13:24:29'),
(33, 3, 44, '2022-07-14 13:25:03', '2022-07-14 13:25:03'),
(34, 3, 37, '2022-07-14 13:25:28', '2022-07-14 13:25:28'),
(35, 3, 36, '2022-07-14 13:25:47', '2022-07-14 13:25:47'),
(36, 3, 35, '2022-07-14 13:26:21', '2022-07-14 13:26:21'),
(37, 3, 34, '2022-07-14 13:26:48', '2022-07-14 13:26:48'),
(38, 3, 33, '2022-07-14 13:28:53', '2022-07-14 13:28:53'),
(39, 3, 45, '2022-07-14 13:29:26', '2022-07-14 13:29:26'),
(40, 3, 42, '2022-07-14 13:29:58', '2022-07-14 13:29:58'),
(41, 3, 41, '2022-07-14 13:30:32', '2022-07-14 13:30:32'),
(42, 3, 40, '2022-07-14 13:30:48', '2022-07-14 13:30:48'),
(43, 3, 39, '2022-07-14 13:31:04', '2022-07-14 13:31:04'),
(44, 3, 38, '2022-07-14 13:31:19', '2022-07-14 13:31:19'),
(45, 2, 46, '2023-03-04 03:07:27', '2023-03-04 03:07:27'),
(46, 2, 47, '2023-03-04 03:08:01', '2023-03-04 03:08:01'),
(47, 2, 48, '2023-03-04 03:08:25', '2023-03-04 03:08:25'),
(48, 2, 49, '2023-03-04 03:08:50', '2023-03-04 03:08:50'),
(49, 2, 50, '2023-03-04 03:31:15', '2023-03-04 03:31:15'),
(50, 2, 51, '2023-03-04 03:35:50', '2023-03-04 03:35:50'),
(51, 2, 52, '2023-03-04 03:36:24', '2023-03-04 03:36:24'),
(52, 2, 53, '2023-03-04 03:36:49', '2023-03-04 03:36:49'),
(53, 2, 54, '2023-03-04 03:37:16', '2023-03-04 03:37:16'),
(54, 2, 55, '2023-03-04 03:37:40', '2023-03-04 03:37:40'),
(55, 2, 56, '2023-03-04 03:38:09', '2023-03-04 03:38:09'),
(56, 2, 57, '2023-03-04 04:35:17', '2023-03-04 04:35:17'),
(57, 2, 58, '2023-03-04 07:18:43', '2023-03-04 07:18:43'),
(58, 2, 59, '2023-03-04 07:19:01', '2023-03-04 07:19:01'),
(59, 2, 60, '2023-03-04 07:19:22', '2023-03-04 07:19:22'),
(60, 2, 61, '2023-03-04 07:19:45', '2023-03-04 07:19:45'),
(61, 2, 62, '2023-03-04 07:20:05', '2023-03-04 07:20:05'),
(62, 2, 63, '2023-03-04 07:20:37', '2023-03-04 07:20:37'),
(63, 2, 64, '2023-03-04 07:21:25', '2023-03-04 07:21:25'),
(64, 2, 65, '2023-03-04 09:32:57', '2023-03-04 09:32:57'),
(65, 2, 66, '2023-03-04 10:04:02', '2023-03-04 10:04:02'),
(66, 2, 67, '2023-03-04 10:04:31', '2023-03-04 10:04:31'),
(67, 2, 68, '2023-03-04 10:04:51', '2023-03-04 10:04:51'),
(68, 2, 69, '2023-03-04 10:05:54', '2023-03-04 10:05:54'),
(69, 2, 70, '2023-03-04 10:07:02', '2023-03-04 10:07:02'),
(70, 2, 71, '2023-03-04 10:07:28', '2023-03-04 10:07:28'),
(71, 2, 72, '2023-03-04 11:06:28', '2023-03-04 11:06:28'),
(72, 2, 73, '2023-03-04 11:07:00', '2023-03-04 11:07:00'),
(73, 2, 74, '2023-03-04 11:07:30', '2023-03-04 11:07:30'),
(74, 2, 75, '2023-03-04 11:08:17', '2023-03-04 11:08:17'),
(75, 2, 76, '2023-03-04 11:08:46', '2023-03-04 11:08:46'),
(76, 2, 77, '2023-03-04 11:09:10', '2023-03-04 11:09:10'),
(77, 2, 78, '2023-03-04 11:10:12', '2023-03-04 11:10:12'),
(78, 2, 79, '2023-03-04 11:10:34', '2023-03-04 11:10:34'),
(79, 2, 80, '2023-03-04 11:10:55', '2023-03-04 11:10:55'),
(80, 2, 81, '2023-03-04 11:11:27', '2023-03-04 11:11:27'),
(81, 2, 82, '2023-03-04 11:11:49', '2023-03-04 11:11:49'),
(82, 2, 83, '2023-03-04 11:12:04', '2023-03-04 11:12:04'),
(83, 2, 84, '2023-03-04 11:13:01', '2023-03-04 11:13:01'),
(84, 2, 85, '2023-03-04 11:13:38', '2023-03-04 11:13:38'),
(85, 2, 86, '2023-03-04 11:13:58', '2023-03-04 11:13:58'),
(86, 2, 87, '2023-03-04 11:14:16', '2023-03-04 11:14:16'),
(87, 2, 88, '2023-03-04 11:14:35', '2023-03-04 11:14:35'),
(88, 2, 89, '2023-03-04 11:14:55', '2023-03-04 11:14:55'),
(89, 2, 90, '2023-03-14 07:51:31', '2023-03-14 07:51:31'),
(90, 2, 91, '2023-03-14 07:51:56', '2023-03-14 07:51:56'),
(91, 2, 92, '2023-03-14 07:52:19', '2023-03-14 07:52:19'),
(92, 2, 93, '2023-03-15 16:08:02', '2023-03-15 16:08:02'),
(93, 2, 94, '2023-03-15 16:08:26', '2023-03-15 16:08:26'),
(94, 2, 95, '2023-03-15 16:08:54', '2023-03-15 16:08:54'),
(95, 2, 96, '2023-03-15 16:09:15', '2023-03-15 16:09:15'),
(96, 2, 97, '2023-03-15 16:09:43', '2023-03-15 16:09:43'),
(97, 2, 98, '2023-03-16 03:34:02', '2023-03-16 03:34:02'),
(98, 2, 99, '2023-03-16 03:34:40', '2023-03-16 03:34:40'),
(99, 2, 100, '2023-03-16 03:35:06', '2023-03-16 03:35:06'),
(100, 2, 101, '2023-03-16 03:35:36', '2023-03-16 03:35:36'),
(101, 2, 102, '2023-03-16 03:36:04', '2023-03-16 03:36:04'),
(102, 2, 103, '2023-03-16 03:36:30', '2023-03-16 03:36:30'),
(103, 2, 104, '2023-03-18 04:29:09', '2023-03-18 04:29:09'),
(104, 2, 105, '2023-03-18 04:29:39', '2023-03-18 04:29:39'),
(105, 2, 106, '2023-03-18 04:30:06', '2023-03-18 04:30:06'),
(106, 2, 107, '2023-03-18 04:30:34', '2023-03-18 04:30:34'),
(107, 2, 108, '2023-03-18 04:31:03', '2023-03-18 04:31:03'),
(108, 2, 109, '2023-03-18 04:31:27', '2023-03-18 04:31:27'),
(109, 2, 110, '2023-03-18 07:14:46', '2023-03-18 07:14:46'),
(110, 2, 111, '2023-03-18 07:15:11', '2023-03-18 07:15:11'),
(111, 2, 112, '2023-03-18 07:15:37', '2023-03-18 07:15:37'),
(112, 2, 113, '2023-03-18 07:16:04', '2023-03-18 07:16:04'),
(113, 2, 114, '2023-03-18 07:16:25', '2023-03-18 07:16:25'),
(114, 2, 115, '2023-03-18 07:16:42', '2023-03-18 07:16:42'),
(115, 2, 116, '2023-03-19 04:07:37', '2023-03-19 04:07:37'),
(116, 2, 117, '2023-03-19 04:08:02', '2023-03-19 04:08:02'),
(117, 2, 118, '2023-03-19 04:08:27', '2023-03-19 04:08:27'),
(118, 2, 119, '2023-03-19 04:08:57', '2023-03-19 04:08:57'),
(119, 2, 120, '2023-03-19 04:09:42', '2023-03-19 04:09:42'),
(120, 2, 121, '2023-03-19 04:10:37', '2023-03-19 04:10:37'),
(121, 2, 122, '2023-03-19 04:11:02', '2023-03-19 04:11:02'),
(122, 2, 123, '2023-04-26 02:56:34', '2023-04-26 02:56:34'),
(123, 2, 124, '2023-04-26 02:57:05', '2023-04-26 02:57:05'),
(124, 2, 125, '2023-04-26 02:57:35', '2023-04-26 02:57:35'),
(125, 2, 126, '2023-04-26 02:58:00', '2023-04-26 02:58:00'),
(126, 2, 127, '2023-04-26 02:58:35', '2023-04-26 02:58:35'),
(127, 2, 128, '2023-04-26 02:58:59', '2023-04-26 02:58:59'),
(128, 2, 129, '2023-04-26 02:59:47', '2023-04-26 02:59:47'),
(129, 2, 130, '2023-04-26 03:00:25', '2023-04-26 03:00:25'),
(130, 2, 131, '2023-04-26 03:00:53', '2023-04-26 03:00:53'),
(131, 2, 132, '2023-04-26 03:01:25', '2023-04-26 03:01:25'),
(132, 2, 133, '2023-04-26 03:01:54', '2023-04-26 03:01:54'),
(133, 2, 134, '2023-04-26 03:02:26', '2023-04-26 03:02:26'),
(134, 2, 135, '2023-04-26 03:02:52', '2023-04-26 03:02:52'),
(135, 2, 136, '2023-04-26 03:03:22', '2023-04-26 03:03:22'),
(136, 2, 137, '2023-05-04 11:32:45', '2023-05-04 11:32:45'),
(137, 2, 138, '2023-05-04 11:33:15', '2023-05-04 11:33:15'),
(138, 2, 139, '2023-05-04 11:33:39', '2023-05-04 11:33:39'),
(139, 2, 140, '2023-05-04 11:33:58', '2023-05-04 11:33:58');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2019_08_19_000000_create_failed_jobs_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 2),
(4, '2022_07_13_182226_laravel_entrust_setup_tables', 2),
(5, '2021_09_18_080758_add_status_user_table', 3),
(6, '2021_09_23_050732_add_created_by_updated_by_on_user_table', 3),
(7, '2021_09_23_053748_add_created_by_updated_by_on_role_table', 3),
(8, '2021_09_23_053810_add_created_by_updated_by_on_permission_table', 3),
(9, '2021_09_24_054106_create_main_menus_table', 3),
(10, '2021_09_24_054133_create_first_level_menus_table', 3),
(11, '2021_09_24_054208_create_second_level_menus_table', 3),
(12, '2021_09_24_063050_create_main_menu_permissions_table', 3),
(13, '2021_09_24_063100_create_first_level_menu_permissions_table', 3),
(14, '2021_09_24_063109_create_second_level_menu_permissions_table', 3),
(15, '2021_09_24_125358_add_icon_on_first_level_menu_table', 3),
(16, '2021_09_25_031533_add_icon_on_second_level_menu_table', 3),
(17, '2021_09_27_051901_add_priority_on_main_menu_table', 3),
(18, '2021_09_27_052309_add_priority_on_first_level_menu_table', 3),
(19, '2021_09_27_052341_add_priority_on_second_level_menu_table', 3),
(20, '2021_11_30_081214_create_notification_table', 3),
(21, '2021_11_30_081233_create_notification_user_table', 3),
(22, '2022_07_14_195759_create_jobs_table', 4),
(23, '2022_07_18_152208_add_deleted_at_on_user_table', 5),
(24, '2022_09_19_101141_create_web_page_table', 6),
(25, '2022_10_25_202203_add_show_on_footer', 7),
(26, '2022_09_23_141735_create_enquiry_table', 8),
(27, '2022_09_24_181111_create_enquiry_history_table', 8),
(28, '2022_09_23_141735_create_career_table', 9),
(29, '2022_09_24_181111_create_career_history_table', 9),
(30, '2023_03_06_161716_create_passion_story_table', 10),
(31, '2023_03_06_142907_create_brand_story_table', 11),
(32, '2023_03_07_130231_create_blog_table', 12),
(33, '2023_03_13_121232_create_podcast_table', 13),
(34, '2023_03_13_113830_emagazine', 14),
(35, '2023_03_13_120326_emagazine_subscription', 14),
(36, '2023_03_14_175215_create_author_table', 15),
(37, '2023_03_15_202630_create_author_status_histories', 15),
(38, '2023_03_16_151344_create_notice_author_table', 16),
(39, '2023_03_16_151401_create_notice_table', 17),
(40, '2023_03_16_173303_create_feedback_table', 18),
(41, '2023_03_17_111822_home_sliders', 19),
(42, '2023_03_17_112448_general_settings', 20),
(43, '2023_03_24_191343_alter_author_table', 21),
(44, '2023_03_28_180913_add_email_verified_on_author_table', 22),
(45, '2023_03_29_150821_add_is_admin_on_feedback_table', 23),
(46, '2023_04_06_160710_add_call_to_action_to_brand_story_table', 24),
(47, '2023_04_06_165702_add_call_to_action_on_passion_story_table', 24),
(48, '2023_04_09_192123_create_brand_story_view_table', 24),
(49, '2023_04_10_133310_create_passion_story_comment_table', 24),
(50, '2023_04_10_134141_create_passion_story_view_table', 24),
(51, '2023_04_11_112840_create_blog_comment_table', 24),
(52, '2023_04_11_113525_create_blog_view_table', 24),
(53, '2023_04_11_122445_add_call_to_action_on_blog_table', 24),
(54, '2023_04_13_102220_create_brand_story_comment_table', 24),
(55, '2023_04_15_111412_add_reason_on_brand_story_table', 24),
(56, '2023_04_16_161429_add_reason_on_passion_story_table', 24),
(57, '2023_04_18_165713_create_podcast_application_table', 24),
(58, '2023_04_22_183214_add_reason_on_blog_table', 24),
(59, '2023_04_25_102914_add_reason_on_podcast_application_table', 24),
(60, '2023_05_03_121530_create_passion_table', 25),
(62, '2023_05_19_095137_rename_passion_on_author_table', 26),
(63, '2023_05_19_100754_change_passion_datatype_on_author_table', 27),
(64, '2023_06_01_092213_rename_passion_on_emagazine_subscription_table', 28),
(65, '2023_06_01_092247_change_passion_datatype_on_emagazine_subscription_table', 29),
(66, '2023_07_04_201351_add_meta_on_web_page_table', 30);

-- --------------------------------------------------------

--
-- Table structure for table `notices`
--

CREATE TABLE `notices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `subject` text COLLATE utf8mb4_unicode_ci,
  `message` longtext COLLATE utf8mb4_unicode_ci,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '0:in active,1:active',
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notice_authors`
--

CREATE TABLE `notice_authors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `author_id` int(10) UNSIGNED NOT NULL,
  `notice_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notification_users`
--

CREATE TABLE `notification_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `notification_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED DEFAULT NULL,
  `read_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0:Not Read;1:Read',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `passions`
--

CREATE TABLE `passions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '0:inactive,1:active',
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `passions`
--

INSERT INTO `passions` (`id`, `name`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'Acting and Theater', 1, 8, NULL, '2023-06-30 10:18:23', '2023-06-30 10:18:23'),
(2, 'Adventure and Exploration', 1, 8, NULL, '2023-06-30 10:18:34', '2023-06-30 10:18:34'),
(3, 'Animal Welfare and Pet Care', 1, 8, NULL, '2023-06-30 10:18:45', '2023-06-30 10:18:45'),
(4, 'Archaeology and Anthropology', 1, 8, NULL, '2023-06-30 10:18:57', '2023-06-30 10:18:57'),
(5, 'Art and Design', 1, 8, NULL, '2023-06-30 10:19:09', '2023-06-30 10:19:09'),
(6, 'Astronomy and Astrophysics', 1, 8, NULL, '2023-06-30 10:19:19', '2023-06-30 10:19:19'),
(7, 'Baking and Pastry', 1, 8, NULL, '2023-06-30 10:19:31', '2023-06-30 10:19:31'),
(8, 'Beauty and Fashion', 1, 8, NULL, '2023-06-30 10:19:44', '2023-06-30 10:19:44'),
(9, 'Biology and Biotechnology', 1, 8, NULL, '2023-06-30 10:19:54', '2023-06-30 10:19:54'),
(10, 'Business and Entrepreneurship', 1, 8, NULL, '2023-06-30 10:20:36', '2023-06-30 10:20:36'),
(11, 'Camping and Hiking', 1, 8, NULL, '2023-06-30 10:20:45', '2023-06-30 10:20:45'),
(12, 'Charity and Volunteering', 1, 8, NULL, '2023-06-30 10:21:00', '2023-06-30 10:21:00'),
(13, 'Chemistry and Chemical Engineering', 1, 8, NULL, '2023-06-30 10:21:11', '2023-06-30 10:21:11'),
(14, 'Coding and Software Development', 1, 8, NULL, '2023-06-30 10:21:21', '2023-06-30 10:21:21'),
(15, 'Cooking and Culinary Arts', 1, 8, NULL, '2023-06-30 10:21:32', '2023-06-30 10:21:32'),
(16, 'Creative Writing and Poetry', 1, 8, NULL, '2023-06-30 10:21:42', '2023-06-30 10:21:42'),
(17, 'Dance and Choreography', 1, 8, NULL, '2023-06-30 10:21:53', '2023-06-30 10:21:53'),
(18, 'Digital Marketing and Advertising', 1, 8, NULL, '2023-06-30 10:22:05', '2023-06-30 10:22:05'),
(19, 'DIY and Crafts', 1, 8, NULL, '2023-06-30 10:22:17', '2023-06-30 10:22:17'),
(20, 'Drawing and Illustration', 1, 8, NULL, '2023-06-30 10:22:30', '2023-06-30 10:22:30'),
(21, 'Education and Teaching', 1, 8, NULL, '2023-06-30 10:22:38', '2023-06-30 10:22:38'),
(22, 'Environmentalism and Sustainability', 1, 8, NULL, '2023-06-30 10:22:49', '2023-06-30 10:22:49'),
(23, 'Event Planning and Coordination', 1, 8, NULL, '2023-06-30 10:22:59', '2023-06-30 10:22:59'),
(24, 'Film and Television Production', 1, 8, NULL, '2023-06-30 10:23:10', '2023-06-30 10:23:10'),
(25, 'Finance and Investing', 1, 8, NULL, '2023-06-30 10:23:21', '2023-06-30 10:23:21'),
(26, 'Food and Beverage Tasting', 1, 8, NULL, '2023-06-30 10:23:31', '2023-06-30 10:23:31'),
(27, 'Foreign Languages and Linguistics', 1, 8, NULL, '2023-06-30 10:23:45', '2023-06-30 10:23:45'),
(28, 'Gaming and Game Development', 1, 8, NULL, '2023-06-30 10:23:56', '2023-06-30 10:23:56'),
(29, 'Genealogy and Family History', 1, 8, NULL, '2023-06-30 10:24:07', '2023-06-30 10:24:07'),
(30, 'Graphic Design and Animation', 1, 8, NULL, '2023-06-30 10:24:17', '2023-06-30 10:24:17'),
(31, 'Health and Wellness', 1, 8, NULL, '2023-06-30 10:24:30', '2023-06-30 10:24:30'),
(32, 'History and Historiography', 1, 8, NULL, '2023-06-30 10:24:41', '2023-06-30 10:24:41'),
(33, 'Home Decor and Interior Design', 1, 8, NULL, '2023-06-30 10:24:52', '2023-06-30 10:24:52'),
(34, 'Horticulture and Gardening', 1, 8, NULL, '2023-06-30 10:25:01', '2023-06-30 10:25:01'),
(35, 'Human Rights and Social Justice', 1, 8, NULL, '2023-06-30 10:25:13', '2023-06-30 10:25:13'),
(36, 'Improv and Stand-up Comedy', 1, 8, NULL, '2023-06-30 10:25:26', '2023-06-30 10:25:26'),
(37, 'Information Technology and Cybersecurity', 1, 8, NULL, '2023-06-30 10:25:36', '2023-06-30 10:25:36'),
(38, 'Journalism and News Writing', 1, 8, NULL, '2023-06-30 10:25:44', '2023-06-30 10:25:44'),
(39, 'Law and Legal Studies', 1, 8, NULL, '2023-06-30 10:25:54', '2023-06-30 10:25:54'),
(40, 'Leadership and Management', 1, 8, NULL, '2023-06-30 10:26:03', '2023-06-30 10:26:03'),
(41, 'Makeup and Cosmetics', 1, 8, NULL, '2023-06-30 10:26:12', '2023-06-30 10:26:12'),
(42, 'Mathematics and Statistics', 1, 8, NULL, '2023-06-30 10:26:21', '2023-06-30 10:26:21'),
(43, 'Meditation and Mindfulness', 1, 8, NULL, '2023-06-30 10:26:34', '2023-06-30 10:26:34'),
(44, 'Music and Music Production', 1, 8, NULL, '2023-06-30 10:26:43', '2023-06-30 10:26:43'),
(45, 'Nutrition and Dietetics', 1, 8, NULL, '2023-06-30 10:26:54', '2023-06-30 10:26:54'),
(46, 'Painting and Fine Arts', 1, 8, NULL, '2023-06-30 10:27:06', '2023-06-30 10:27:06'),
(47, 'Parenting and Family', 1, 8, NULL, '2023-06-30 10:27:21', '2023-06-30 10:27:21'),
(48, 'Performing Arts and Music Theater', 1, 8, NULL, '2023-06-30 10:27:32', '2023-06-30 10:27:32'),
(49, 'Philosophy and Ethics', 1, 8, NULL, '2023-06-30 10:27:41', '2023-06-30 10:27:41'),
(50, 'Photography and Videography', 1, 8, NULL, '2023-06-30 10:27:52', '2023-06-30 10:27:52'),
(51, 'Physical Fitness and Training', 1, 8, NULL, '2023-06-30 10:28:32', '2023-06-30 10:28:32'),
(52, 'Physics and Astronomy', 1, 8, NULL, '2023-06-30 10:28:42', '2023-06-30 10:28:42'),
(53, 'Podcasting and Audio Production', 1, 8, NULL, '2023-06-30 10:28:58', '2023-06-30 10:28:58'),
(54, 'Political Science and International Relations', 1, 8, NULL, '2023-06-30 10:29:08', '2023-06-30 10:29:08'),
(55, 'Pottery and Ceramics', 1, 8, NULL, '2023-06-30 10:29:17', '2023-06-30 10:29:17'),
(56, 'Psychology and Neuroscience', 1, 8, NULL, '2023-06-30 10:29:30', '2023-06-30 10:29:30'),
(57, 'Public Speaking and Communication', 1, 8, NULL, '2023-06-30 10:29:42', '2023-06-30 10:29:42'),
(58, 'Reading and Literature', 1, 8, NULL, '2023-06-30 10:29:51', '2023-06-30 10:29:51'),
(59, 'Renewable Energy and Green Technology', 1, 8, NULL, '2023-06-30 10:30:00', '2023-06-30 10:30:00'),
(60, 'Robotics and Automation', 1, 8, NULL, '2023-06-30 10:30:11', '2023-06-30 10:30:11'),
(61, 'Science and Innovation', 1, 8, NULL, '2023-06-30 10:32:57', '2023-06-30 10:32:57'),
(62, 'Sculpture and Installation Art', 1, 8, NULL, '2023-06-30 10:33:05', '2023-06-30 10:33:05'),
(63, 'Social Media and Community Management', 1, 8, NULL, '2023-06-30 10:33:15', '2023-06-30 10:33:15'),
(64, 'Spirituality and Religion', 1, 8, NULL, '2023-06-30 10:33:26', '2023-06-30 10:33:26'),
(65, 'Sports and Athletic Competition', 1, 8, NULL, '2023-06-30 10:33:35', '2023-06-30 10:33:35'),
(66, 'Sustainable Agriculture and Farming', 1, 8, NULL, '2023-06-30 10:33:44', '2023-06-30 10:33:44'),
(67, 'Technology and Engineering', 1, 8, NULL, '2023-06-30 10:33:54', '2023-06-30 10:33:54'),
(68, 'Theater and Performing Arts', 1, 8, NULL, '2023-06-30 10:34:04', '2023-06-30 10:34:04'),
(69, 'Travel and Tourism', 1, 8, NULL, '2023-06-30 10:34:11', '2023-06-30 10:34:11'),
(70, 'Veterinary Medicine and Animal Science', 1, 8, NULL, '2023-06-30 10:34:20', '2023-06-30 10:34:20'),
(71, 'Video Game Design and Development', 1, 8, NULL, '2023-06-30 10:34:30', '2023-06-30 10:34:30'),
(72, 'Visual Effects and Motion Graphics', 1, 8, NULL, '2023-06-30 10:34:38', '2023-06-30 10:34:38'),
(73, 'Web Design and Development', 1, 8, NULL, '2023-06-30 10:34:51', '2023-06-30 10:34:51'),
(74, 'Wine and Beverage Tasting', 1, 8, NULL, '2023-06-30 10:35:00', '2023-06-30 10:35:00'),
(75, 'Writing and Publishing', 1, 8, NULL, '2023-06-30 10:35:10', '2023-06-30 10:35:10'),
(76, 'Yoga and Pilates', 1, 8, NULL, '2023-06-30 10:35:19', '2023-06-30 10:35:19'),
(77, 'Zoology and Wildlife Conservation', 1, 8, NULL, '2023-06-30 10:35:28', '2023-06-30 10:35:28'),
(78, 'Astronomy and Space Exploration', 1, 8, NULL, '2023-06-30 10:35:36', '2023-06-30 10:35:36'),
(79, 'Astrology and Horoscopes', 1, 8, NULL, '2023-06-30 10:35:57', '2023-06-30 10:35:57'),
(80, 'Archery and Target Shooting', 1, 8, NULL, '2023-06-30 10:36:06', '2023-06-30 10:36:06'),
(81, 'Backpacking and Camping', 1, 8, NULL, '2023-06-30 10:36:16', '2023-06-30 10:36:16'),
(82, 'Barbecuing and Grilling', 1, 8, NULL, '2023-06-30 10:36:24', '2023-06-30 10:36:24'),
(83, 'Beekeeping and Apiary', 1, 8, NULL, '2023-06-30 10:36:33', '2023-06-30 10:36:33'),
(84, 'Carpentry and Woodworking', 1, 8, NULL, '2023-06-30 10:36:44', '2023-06-30 10:36:44'),
(85, 'Competitive Sports and Activities', 1, 8, NULL, '2023-06-30 10:36:54', '2023-06-30 10:36:54'),
(86, 'Digital Art and Graphic Design', 1, 8, NULL, '2023-06-30 10:37:02', '2023-06-30 10:37:02'),
(87, 'Diving and Scuba', 1, 8, NULL, '2023-06-30 10:37:12', '2023-06-30 10:37:12'),
(88, 'Fashion Design and Textile Arts', 1, 8, NULL, '2023-06-30 10:37:20', '2023-06-30 10:37:20'),
(89, 'Floral Design and Arrangement', 1, 8, NULL, '2023-06-30 10:37:29', '2023-06-30 10:37:29'),
(90, 'Glassblowing and Stained Glass', 1, 8, NULL, '2023-06-30 10:37:37', '2023-06-30 10:37:37'),
(91, 'Horseback Riding and Equestrianism', 1, 8, NULL, '2023-06-30 10:37:49', '2023-06-30 10:37:49'),
(92, 'Ice Skating and Figure Skating', 1, 8, NULL, '2023-06-30 10:38:00', '2023-06-30 10:38:00'),
(93, 'Magic and Illusion', 1, 8, NULL, '2023-06-30 10:38:11', '2023-06-30 10:38:11'),
(94, 'Martial Arts and Self Defense', 1, 8, NULL, '2023-06-30 10:38:22', '2023-06-30 10:38:22'),
(95, 'Organic Farming and Agriculture', 1, 8, NULL, '2023-06-30 10:38:51', '2023-06-30 10:38:51'),
(96, 'Sewing and Needlecraft', 1, 8, NULL, '2023-06-30 10:39:03', '2023-06-30 10:39:03'),
(97, 'Snowboarding and Skiing', 1, 8, NULL, '2023-06-30 10:39:20', '2023-06-30 10:39:20'),
(98, 'Surfing and Kiteboarding', 1, 8, NULL, '2023-06-30 10:39:29', '2023-06-30 10:39:29'),
(99, 'Acting and Drama Therapy', 1, 8, NULL, '2023-06-30 10:39:38', '2023-06-30 10:39:38'),
(100, 'Adult Education and Training', 1, 8, NULL, '2023-06-30 10:39:47', '2023-06-30 10:39:47'),
(101, 'Cricket and other Sports', 1, 8, NULL, '2023-06-30 10:40:00', '2023-06-30 10:40:00'),
(102, 'Education and Skill Development', 1, 8, NULL, '2023-06-30 10:40:10', '2023-06-30 10:40:10'),
(103, 'Social Justice and Advocacy', 1, 8, NULL, '2023-06-30 10:40:25', '2023-06-30 10:40:25'),
(104, 'Travel and Adventure', 1, 8, NULL, '2023-07-04 06:44:02', '2023-07-04 06:44:02'),
(105, 'Trading and Investments', 1, 8, NULL, '2023-07-04 06:45:21', '2023-07-04 06:45:21'),
(106, 'Photography and Visual Arts', 1, 8, NULL, '2023-07-04 06:45:44', '2023-07-04 06:45:44'),
(107, 'Medical and Healthcare', 1, 8, NULL, '2023-07-04 06:50:00', '2023-07-04 06:50:00'),
(108, 'Content Creation and Blogging', 1, 8, NULL, '2023-07-04 06:51:20', '2023-07-04 06:51:20'),
(109, 'Brand Strategist and Branding Consultant', 1, 8, NULL, '2023-08-09 04:40:54', '2023-08-09 04:40:54');

-- --------------------------------------------------------

--
-- Table structure for table `passion_stories`
--

CREATE TABLE `passion_stories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(64) CHARACTER SET utf8mb4 DEFAULT NULL,
  `full_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '0:In-Active;1:Active',
  `reason` longtext COLLATE utf8mb4_unicode_ci,
  `call_to_action` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0:Do not show call,1:Show call',
  `is_admin` tinyint(4) DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `passion_stories`
--

INSERT INTO `passion_stories` (`id`, `code`, `full_name`, `description`, `image`, `status`, `reason`, `call_to_action`, `is_admin`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(2, 'PS08NI5A0W', 'The Passion Story of Vineeta Singh', '<p>Here&rsquo;s the story of Vineeta Singh, the women who took sugar cosmetics to the pinnacle of success. After completing her Business Studies, she firmly planned on building her own start up and hence she rejected a 1 Crore job offer in order to do that.</p>\r\n\r\n<p>&nbsp;Vineeta aimed at creating makeup products solely for Indian skin tones which will be made in India for India. Despite a lot of discouragement from people, she founded SUGAR Cosmetics, which has raised millions of dollars and sells about 650,000 products per month today.</p>', 'passion_story/2023/7/IMG-20230223-WA0004_1688203540.jpg', 1, NULL, 0, 1, 9, 9, '2023-07-01 09:25:40', '2023-07-01 09:43:15'),
(3, 'PSO50RJHHN', 'The Passion Story of Aman Guptha', '<p>The co-founder and Chief Marketing Officer (CMO) of boAt had worked for a number of companies before joining boAt. Finally, he discovered his true Passion in the world of business.</p>\r\n\r\n<p>It Is now one of India&rsquo;s biggest earwear companies, with revenues exceeding Rs. 1000 crores. Aman Gupta is also one of the Shark Tank India investors. Aman&rsquo;s passion and hard work for his company are really encouraging. The secret to success is hard effort. It teaches us perseverance and determination.</p>', 'passion_story/2023/7/IMG-20230223-WA0018_1688203594.jpg', 1, NULL, 0, 1, 9, 9, '2023-07-01 09:26:34', '2023-07-01 09:42:44'),
(4, 'PS4S9739U1', 'The Passion Story of Anubhav Dubey', '<p>One of India&rsquo;s youngest most successful entrepreneurs, Anubhav Dubey, is the co-founder of CHAI SUTTA BAR. A small town boy, who was preparing for IAS, quit the UPSC dream to build a multi-crore business. And today, his life has become an inspiring story for all.</p>\r\n\r\n<p>In the early days of the business, he and his co-founder Anand Nayak had to go through a lot of struggles and criticism. Anubhav was mocked for leaving his IAS dream to sell tea. Gradually the name became popular and the shop started overflowing with customers. Today the brand has 165 outlets and around 18 lakh customers across the country.</p>', 'passion_story/2023/7/IMG-20230223-WA0019_1688203777.jpg', 1, NULL, 0, 1, 9, 9, '2023-07-01 09:29:37', '2023-07-01 09:42:18'),
(5, 'PSIT3FXSCI', 'The Passion Story of Prafull Billore (MBA Chaiwala)', '<p>When Prafull failed to pass the CAT on his third attempt, he was crushed. He went to cities in quest of work. He went to work at a McDonald&rsquo;s restaurant. After a lot of struggles Prafull Billore decided to instead follow his Passion of becoming an entrepreneur by founding a chai shop, famously known as MBA Chaiwala.</p>\r\n\r\n<p>The 22-year-old is now a crorepati with his brand at 22 locations across the country and plans to open an international location soon. He finished 2020 with an annual turnover in excess of Rs 3 crore.</p>', 'passion_story/2023/7/IMG-20230318-WA0004_1688203978.jpg', 1, NULL, 0, 1, 9, 9, '2023-07-01 09:32:58', '2023-07-01 09:40:33'),
(6, 'PSR1GFE2JR', 'The Passion Story of Ashish Chanchlani', '<p>Ashish Chanchlani, the YouTube star with over 20 million subscribers, is one of the most important figures in the Indian paradigm of the internet. Even after being an Engineering student he worked hardly upon his acting skills which was his Passion.</p>\r\n\r\n<p>He started making videos, following the footsteps of famous western YouTubers. He used this opportunity to make an Indianized version of the same and that blew up almost immediately. He never gave up on his dreams and transformed his passion into a successful career and now he is one of the top 5 youtube influencers in india.</p>', 'passion_story/2023/7/IMG-20230304-WA0055_1688204058.jpg', 1, NULL, 0, 1, 9, 9, '2023-07-01 09:34:18', '2023-07-01 09:39:57'),
(7, 'PSEXMI9KH8', 'The Passion Story of Bruce Lee', '<p>Lee Jun Fan, better known as Bruce Lee, had the taste in three areas that he was always passionate about: philosophy, martial arts and cinema. American-born film actor who was renowned for his martial arts and who helped popularize martial arts movies in the 1970s.</p>\r\n\r\n<p>Studied philosophy in United States, he developed his own technique&mdash;jeet kune do, a blend of ancient kung fu, fencing, boxing, and philosophy. He was know as America&rsquo;s first highest paid Asian superstar. No one else could bring together and combine his passions better than Bruce Lee.</p>', 'passion_story/2023/7/IMG-20230304-WA0013_1688204197.jpg', 1, NULL, 0, 1, 9, 9, '2023-07-01 09:36:37', '2023-07-01 09:39:05'),
(8, 'PS2FI43D4B', 'The Passion Story of Saina Nehwal', '<p>Saina Nehwal started playing badminton at the age of 8. But the expenses were too much for her parents to bear. It was at this time she started winning and sponsors started taking interest in her, and things gradually took a turn.</p>\r\n\r\n<p>Saina had suffered numerous injuries being a sportsperson but that didn&rsquo;t stop her and make her disheartened. She won many awards and Trophies in her badminton career. And now she is working on building her academy to help all those who are passionate about badminton.</p>\r\n\r\n<p>&nbsp;</p>', 'passion_story/2023/7/IMG-20230304-WA0042_1688204292.jpg', 1, NULL, 0, 1, 9, NULL, '2023-07-01 09:38:12', '2023-07-01 09:38:12'),
(9, 'PSQ0N9KJBA', 'The Passion Story of Paras Shahdadpuri', '<p>From being a seasoned diplomat, Paras Shahdadpuri &ndash; chairman, Nikai Group of Companies &ndash; decided to change the course of his career at the age of 42.</p>\r\n\r\n<p>Shahdadpuri gave up a thriving diplomatic career, to pursue his dreams in business. And now his company is known as largest electronics suppliers in the GCC.</p>', 'passion_story/2023/7/IMG-20230304-WA0031_1688205050.jpg', 1, NULL, 0, 1, 9, 9, '2023-07-01 09:50:50', '2023-07-01 09:52:27'),
(10, 'PSA0MHJEC7', 'The Passion Story of Navdeep Saini', '<p>In the beginning he was disapproved by DDCA Selection Committee as he was from Haryana and not a player from Delhi. And later he was scouted by Gautam Gambhir in the domestic circuit.</p>\r\n\r\n<p>&nbsp;In 2019, Saini ultimately got sold for a whopping amount of Rs. 3 crores by RCB.</p>\r\n\r\n<p>However, his passion and hard work for cricket impressed almost everybody and soon calls began to grow for Saini to be drafted into the Indian team. Saini is currently one of the brightest stars in the cricketing horizon.</p>', 'passion_story/2023/7/IMG-20230304-WA0028_1688205116.jpg', 1, NULL, 0, 1, 9, 9, '2023-07-01 09:51:56', '2023-07-01 10:04:45'),
(11, 'PSMBFH7DV2', 'The Passion Story of Omkar Shinde', '<p>Omkar Shinde, the Managing Director of Bhagya Group in London, UK, defied the odds and pursued his passion for entrepreneurship and community management.</p>\r\n\r\n<p>Despite initial setbacks, including the failure of his first startup, he persevered and successfully built four more startups. Today, as the CEO of Bhagya Group, Omkar works remotely with global teams on their dream projects. He believes in following one&rsquo;s heart, making wise decisions, and maintaining self-belief to conquer dreams.</p>', 'passion_story/2023/7/IMG-20230304-WA0027_1688205223.jpg', 1, NULL, 0, 1, 9, 9, '2023-07-01 09:53:43', '2023-07-01 10:04:10'),
(12, 'PSO2HJMDU6', 'The Passion Story of Kriti Tiwari', '<p>Kriti Tiwari, an introvert by nature, defies stereotypes by excelling in communication and public speaking. Driven by her passion to motivate others and unlock their potential, she embraces content creation on Instagram as a means to engage and connect with people.</p>\r\n\r\n<p>Despite facing the challenge of lacking support, Kriti yearns for a supportive network that stands by her side, even during her moments of vulnerability</p>', 'passion_story/2023/7/IMG-20230304-WA0022_1688205300.jpg', 1, NULL, 0, 1, 9, 9, '2023-07-01 09:55:00', '2023-07-01 10:03:48'),
(13, 'PSR36HM5NM', 'The Passion Story of Suryakumar Yadav', '<p>Suryakumar Yadav, a calm and composed batsman, developed a passion for cricket from an early age. His talent came to the forefront when he was signed by the Kolkata Knight Riders in 2014, impressing with quick scores and flamboyant play. Returning to the Mumbai Indians, Suryakumar became a household name. However, his journey to the Indian cricket team was not easy.</p>\r\n\r\n<p>Despite debuting for Mumbai, he had to wait 11 years, facing challenges and allegations along the way. Yet, he believed in continuous growth and gave his best. Suryakumar&#39;s story teaches us that hard work and dedication can lead to fulfilling our dreams</p>', 'passion_story/2023/7/IMG-20230304-WA0035_1688205369.jpg', 1, NULL, 0, 1, 9, 9, '2023-07-01 09:56:09', '2023-07-01 10:01:31'),
(14, 'PSJ6U0QVSC', 'The Passion Story of Ratan Tata', '<p>Ratan Tata, the legendary Indian industrialist, led Tata Group to unprecedented heights during his tenure as Chairman. His strategic vision and bold decisions propelled the conglomerate&rsquo;s global expansion and diversification, acquiring renowned brands and launching innovative products.</p>\r\n\r\n<p>Ratan Tata&rsquo;s unwavering commitment to social responsibility and ethical business practices set new standards for the industry. His remarkable success story combines business acumen, social impact, and a legacy that continues to inspire generations.</p>', 'passion_story/2023/7/IMG-20230304-WA0065_1688205454.jpg', 1, NULL, 0, 1, 9, 9, '2023-07-01 09:57:34', '2023-07-01 10:03:10'),
(15, 'PSPLQFUNL6', 'The Passion Story of Narayana Murthy', '<p>Narayana Murthy, the co-founder of Infosys, has a remarkable success story. In 1981, along with six other entrepreneurs, he started Infosys with a modest capital and a vision to become a global leader in technology services. Through his exceptional leadership and innovation, Murthy transformed Infosys into one of the world&rsquo;s most admired and respected IT companies.</p>\r\n\r\n<p>His relentless pursuit of excellence, commitment to ethical practices propelled Infosys to incredible success, making it a global powerhouse and a symbol of India&rsquo;s technological prowess. Narayana Murthy&rsquo;s story is a testament to the power of perseverance, integrity, and visionary leadership in shaping a company&rsquo;s destiny.</p>', 'passion_story/2023/7/IMG-20230304-WA0059_1688205632.jpg', 1, NULL, 0, 1, 9, 9, '2023-07-01 10:00:32', '2023-07-01 10:02:50'),
(16, 'PSC2VYT2CI', 'The Passion Story of Deepika Padukone', '<p>Deepika Padukone began her acting career in Bollywood with her debut film in 2007 and quickly garnered attention for her remarkable talent and on-screen presence. Deepika&rsquo;s dedication, versatility, and sheer brilliance in portraying diverse characters propelled her to the top of the industry.</p>\r\n\r\n<p>With numerous critically acclaimed performances and blockbuster hits to her credit, she has become one of the highest-paid actresses in India and a global icon. Deepika&#39;s success story not only reflects her exceptional acting skills but also her determination, hard work, and ability to break barriers, making her an inspiration for aspiring actors around the world</p>', 'passion_story/2023/7/IMG-20230304-WA0062_1688206030.jpg', 1, NULL, 0, 1, 9, 9, '2023-07-01 10:07:10', '2023-07-01 10:07:54'),
(17, 'PSACFQK20C', 'The Passion Story of Kanchanmala Pandey', '<p>Kanchanmala Pande is an Indian para-swimmer. Despite being visually impaired, she overcame numerous challenges to achieve remarkable feats. Pande started swimming at a young age. She made her international debut in 2017 in Mexico, where she won a bronze medal.</p>\r\n\r\n<p>Pande&#39;s breakthrough moment came in 2018 when she won four medals, including two gold, at the Asian Para Games in Jakarta, Indonesia. Her remarkable performances earned her accolades and recognition, making her a symbol of determination and resilience. Kanchanmala Pande&#39;s story is a testament to the power of perseverance and the ability to overcome adversity in pursuit of one&#39;s dreams.</p>', 'passion_story/2023/7/IMG-20230304-WA0067_1688206293.jpg', 1, NULL, 0, 1, 9, 9, '2023-07-01 10:11:33', '2023-07-01 10:14:51'),
(18, 'PSTSBHI3WK', 'The Passion Story of Kalpana Chawla', '<p>Kalpana Chawla was an Indian-American astronaut and the first woman of Indian origin to venture into space. Born in India, Chawla pursued her passion for aerospace engineering and earned a Master&#39;s degree in the field. She began her career at NASA and became a naturalized U.S. citizen. Chawla&#39;s historic journey came in 1997 when she served as a mission specialist on the space shuttle Columbia.</p>\r\n\r\n<p>She completed her first space mission successfully and later embarked on a second mission in 2003. Tragically, the Columbia disintegrated during re-entry, resulting in the loss of Chawla and her fellow crew members. Despite this tragedy, Chawla&#39;s pioneering spirit, dedication, and contributions to space exploration have left an indelible mark on history, inspiring future generations to reach for the stars.</p>', 'passion_story/2023/7/IMG-20230304-WA0068_1688206375.jpg', 1, NULL, 0, 1, 9, 9, '2023-07-01 10:12:55', '2023-07-01 10:15:21'),
(19, 'PS8ILG86QO', 'The Passion Story of Varun aditya', '<p>Varun Aditya is an Indian wildlife photographer who has gained recognition for his stunning wildlife and nature photography. With a deep passion for the natural world, Aditya embarked on a journey to capture the beauty and diversity of wildlife through his lens.</p>\r\n\r\n<p>Aditya&#39;s work has been widely appreciated and has garnered numerous accolades and awards. His photographs have been featured in prestigious publications and exhibited in renowned galleries. Through his artistry and dedication, Varun Aditya has become a prominent name in the field of wildlife photography, inspiring others to appreciate and conserve the wonders of nature.</p>', 'passion_story/2023/7/IMG-20230304-WA0066_1688206459.jpg', 1, NULL, 0, 1, 9, 9, '2023-07-01 10:14:19', '2023-07-01 10:16:25'),
(20, 'PSO2DTDU8T', 'The Passion Story of Shanthanu Narayan', '<p>Shantanu Narayen, the CEO of Adobe Inc., has achieved remarkable success in leading the company&#39;s transformation into a leading software provider. Under his guidance, Adobe embraced a subscription-based model with Creative Cloud, revolutionizing the digital media industry.</p>\r\n\r\n<p>Narayen&#39;s strategic vision and commitment to innovation have propelled Adobe&#39;s growth. Recognized as one of the world&#39;s best CEOs, he is known for his inclusive leadership style and dedication to diversity and sustainability. Narayen&#39;s story exemplifies his business acumen and ability to drive success in the digital age.</p>', 'passion_story/2023/7/IMG-20230304-WA0069_1688207304.jpg', 1, NULL, 0, 1, 9, 9, '2023-07-01 10:28:24', '2023-07-01 10:29:10'),
(21, 'PS54RFS53V', 'The Passion Story of Indra Nooyi', '<p>Indra Nooyi, an Indian-American businesswoman, served as the CEO of PepsiCo from 2006 to 2018. Under her leadership, PepsiCo experienced significant growth and transformation.</p>\r\n\r\n<p>Nooyi played a pivotal role in diversifying the company&#39;s product portfolio, focusing on healthier options, and expanding its global presence. She is recognized for her strategic vision, innovative thinking, and commitment to sustainability. Indra Nooyi&#39;s success story is a testament to her leadership prowess and trailblazing achievements in the business world.</p>', 'passion_story/2023/7/IMG-20230304-WA0058_1688207473.jpg', 1, NULL, 0, 1, 9, 9, '2023-07-01 10:31:13', '2023-07-01 10:52:12'),
(22, 'PSTLD64WH0', 'The Passion Story of Satya Nadella', '<p>Satya Nadella, the CEO of Microsoft, is an Indian-American business executive who revitalized the company. He focused on cloud computing, artificial intelligence, and innovation, leading Microsoft&#39;s successful initiatives like Azure and the LinkedIn acquisition.</p>\r\n\r\n<p>Nadella&#39;s inclusive leadership style and strategic vision helped Microsoft regain its position as a technology leader, with its market value surpassing $2 trillion. He is widely recognized for his transformative impact and is considered one of the most influential people in the world.</p>', 'passion_story/2023/7/IMG-20230304-WA0063_1688207546.jpg', 1, NULL, 0, 1, 9, 9, '2023-07-01 10:32:26', '2023-07-01 10:52:27'),
(23, 'PSVTS2NUKU', 'The Passion Story of Sridevi', '<p>Sridevi, an iconic Indian actress, gained fame and success in the film industry. Her versatile performances in films like &quot;Sadma&quot; and &quot;Chandni&quot; established her as a leading actress. Sridevi&#39;s exceptional talent, graceful dancing, and expressive acting captivated audiences.</p>\r\n\r\n<p>She received international acclaim for &quot;English Vinglish&quot; and won numerous awards, becoming one of the industry&#39;s most influential and highest-paid actresses. Although her untimely passing in 2018 was a tragedy, Sridevi&#39;s legacy as a talented and inspiring artist lives on, touching the hearts of millions of fans worldwide.</p>', 'passion_story/2023/7/IMG-20230304-WA0064_1688207618.jpg', 1, NULL, 0, 1, 9, 9, '2023-07-01 10:33:38', '2023-07-01 10:52:45'),
(24, 'PSARKQREN5', 'The Passion Story of Aishwarya Rai Bachchan', '<p>Aishwarya Rai Bachchan, a renowned Indian actress and former Miss World, captivated audiences with her beauty and acting skills. She gained international recognition through films like &quot;Devdas&quot; and received prestigious awards, including the Padma Shri.</p>\r\n\r\n<p>Aishwarya is also known for her humanitarian work and as a Goodwill Ambassador for UNAIDS. With her talent and dedication, she continues to be a prominent and admired figure in the entertainment industry, representing India globally.</p>', 'passion_story/2023/7/IMG-20230304-WA0061_1688207728.jpg', 1, NULL, 0, 1, 9, 9, '2023-07-01 10:35:28', '2023-07-01 10:53:00'),
(26, 'PS8T3IYY8Q', 'The Passion Story of Ankur Warikoo', '<p>Ankur Warikoo dropped out of his PhD programme as he was unhappy with his work and joined MBA. After MBA, he founded Nearbuy.com. Later he left his CEO position to pursue his passion as a content creator.</p>\r\n\r\n<p>Ankur says that failures motivate us to move forward. So make every failure a ladder. He says &ldquo;I am a witness to many rejections and failures. Not once but many times&rdquo;. Today Ankur Warikoo is one of the popular faces of social media. Whether it is YouTube or LinkedIn, you will find millions of Ankur&rsquo;s followers everywhere. He also launched his book &ldquo;Do Epic Shit&rdquo; in 2021.</p>', 'passion_story/2023/7/IMG-20230223-WA0005_1688286965.jpg', 1, NULL, 0, 1, 9, 9, '2023-07-02 08:36:05', '2023-07-02 08:36:45'),
(27, 'PS7J9LM7LH', 'The Passion Story of Harshak Sinha', '<p>Harshak sinha&rsquo;s consistent interest in making content and helping people made him start his own journey. He sometimes struggled to balance his three tuition classes, his NGO and his content on all social media platforms with his podcast. But still managed to stay consistent.</p>\r\n\r\n<p>People tried to pull him down multiple times. Sometimes even he doubted himself and faced multiple burnouts because of multitasking but soon learned delegating and balancing. He was certain about it that his passion is helping people find their passion and to improve their lives. He says &ldquo;It&rsquo;s all about all the experiences life throws at you which makes you realise that we have do something different.&rdquo;</p>\r\n\r\n<p>&nbsp;</p>', 'passion_story/2023/7/IMG-20230223-WA0006_1688293856.jpg', 1, NULL, 0, 1, 9, NULL, '2023-07-02 10:30:56', '2023-07-02 10:30:56'),
(28, 'PSPFES5SJZ', 'The Passion Story of Rahul Baviskar', '<p>This is the story of Mr. Rahul Baviskar a Mechanical Engineer, innovator and emerging entrepreneur. When he was in the last semester of his engineering, he and his friend started one start up called &ldquo;Swadeshi Handicrafts Private Limited&rdquo;. It was very difficult for him to convince his parents to support him in this start-up as they always wanted him to be a successful engineer.</p>\r\n\r\n<p>This ISO certified company sells pure handicrafts products to offline/online platforms and provides average earnings sources to artisans across India. They not only sell products, they promote the artist as well. Today this company secured &ldquo;Top 7&rdquo; position in &ldquo;Global Students Entrepreneurship Awards in 2021. The formula to his success was following his own USP i.e. Unique, Smart and Passionate. He is indeed a start-up star!</p>\r\n\r\n<p>&nbsp;</p>', 'passion_story/2023/7/IMG-20230223-WA0007_1688293917.jpg', 1, NULL, 0, 1, 9, NULL, '2023-07-02 10:31:57', '2023-07-02 10:31:57'),
(29, 'PSF5A323N7', 'The Passion Story of Deepak Rawath', '<p>IAS Deepak Rawat is an officer who works with utmost honesty and passion. The journey to become an IAS is not as smooth and as simple as it seems. Surely, it was not kind to Deepak Rawat either.</p>\r\n\r\n<p>Even after thorough practice and hard work, could not crack the UPSC Civil Services exam in his first two attempts. In his third attempt he got selected for the IRS and not IAS; therefore, he thoroughly prepared for it again and grabbed the position of IAS that he always desired in 2007. Today he is an inspiration to every UPSC aspirant.</p>\r\n\r\n<p>&nbsp;</p>', 'passion_story/2023/7/IMG-20230223-WA0008_1688293976.jpg', 1, NULL, 0, 1, 9, NULL, '2023-07-02 10:32:56', '2023-07-02 10:32:56'),
(30, 'PSWHU9SRCC', 'The Passion Story of Khushi Panjwani', '<p>Despite having a medical background, Khushi Panjwani chose to follow her passion for being Digital Media entrepreneurship. The zeal she had to do something out of the box and her passion for business, kept her moving forward.</p>\r\n\r\n<p>Doing a business especially in digital media and fintech was not from her background and the journey was not easy. Khushi says &ldquo;Struggles are an unavoidable part of any startup or business, but they help you shine. The major challenge I encountered was acquiring clients, but it was my &ldquo;Never Give Up&rdquo; mentality that helped me create income and clientele&rdquo;. She is truly an inspiration to a lot of the little girls out there.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>', 'passion_story/2023/7/IMG-20230223-WA0009_1688294059.jpg', 1, NULL, 0, 1, 9, NULL, '2023-07-02 10:34:19', '2023-07-02 10:34:19'),
(31, 'PSYAWUQGE3', 'The Passion Story of Suhani Shah', '<p>Suhani Shah, the only female magician/illusionist in India. At the age of 7, she performed her first show in front of people. To turn her passion into a profession, Suhani quit her schooling midway and focused on learning magic and improving her skills. She was homeschooled between her shows and performances, and she managed to do well in both the fields.</p>\r\n\r\n<p>Her Innocent, beautiful face has not only changed the image of a magician, but Suhani&rsquo;s skill has changed the very definition of magic.</p>\r\n\r\n<p>&nbsp;</p>', 'passion_story/2023/7/IMG-20230223-WA0010_1688294127.jpg', 1, NULL, 0, 1, 9, NULL, '2023-07-02 10:35:27', '2023-07-02 10:35:27'),
(32, 'PSZGYCNTNP', 'The Passion Story of Harshal Fuse', '<p>When the world was struggling with COVID-19 lockdown and was caged inside 4 walls this 21 year old Harshal Fuse, the only MBA grad from his small village started this new venture called InternIn . Harshal felt the hardships of students in pandemic and identified this situation as an opportunity for creating a student-centric platform that catered to the internship and job related needs of students. That&rsquo;s when InternIn came into being. His passion for entrepreneurship enabled him to spot opportunities even in the most difficult phase.</p>\r\n\r\n<p>He always has set a perfect example of &ldquo;Passion taking you ahead in life&rdquo; with his failures, taking up risks, and standing up to the challenges of life without fearing the consequences. He had fought it all. Today, Harshal&rsquo;s venture serves thousands of companies and colleges across the globe and helps students to land the right opportunity.</p>\r\n\r\n<p>&nbsp;</p>', 'passion_story/2023/7/IMG-20230223-WA0011_1688294248.jpg', 1, NULL, 0, 1, 9, NULL, '2023-07-02 10:37:28', '2023-07-02 10:37:28'),
(33, 'PS7OQ99KR5', 'The Passion Story of Nikhil Kamath', '<p>From being a school student who was tired of the conventional methods of education to starting a business at the age of 14 and eventually founding Zerodha, India&rsquo;s biggest stock brokerage company in terms of volume, let us shed a light on Nikhil Kamath&rsquo;s journey to success.</p>\r\n\r\n<p>After dropping out from the school, he got his first job in call centre at 17 after he faked his birth certificate. He worked there for 4PM to 1AM and in the day time he tried his hand at trading. And around 18, he began trading stocks properly. Later he quit his call centre job to launch Zerodha with his brother which has successfully transformed into a mega fintech business self-valued at a whopping 1 billion dollars.</p>\r\n\r\n<p>&nbsp;</p>', 'passion_story/2023/7/IMG-20230223-WA0012_1688294387.jpg', 1, NULL, 0, 1, 9, NULL, '2023-07-02 10:39:47', '2023-07-02 10:39:47'),
(34, 'PSQ70A0AOE', 'The Passion Story of Digital Pratik', '<p>Pratiksinh Chudasma, aka Digital Pratik, is known for his Digital Marketing skills. Pratik was an excellent in studies. But chose to drop his engineering studies with just Rs. 300 in his pocket to pursue his Passion and started his digital journey without any training and guidance.</p>\r\n\r\n<p>Pratik followed Digital Marketing experts like Vick Strizheus and now Gary Vaynerchuk. He has worked for more than 1000 professionals. And now he has become India&rsquo;s one of the leading digital marketer and consultant, a social media influencer on Facebook, Instagram, TikTok and a digital content creator.</p>\r\n\r\n<p>&nbsp;</p>', 'passion_story/2023/7/IMG-20230223-WA0013_1688294507.jpg', 1, NULL, 0, 1, 9, NULL, '2023-07-02 10:41:47', '2023-07-02 10:41:47'),
(35, 'PS5Q4FZNON', 'The Passion Story of Nuseir Yassin', '<p>The name Nuseir Yassin might not land on many ears, but there is a strong chance that internet users have come across his work. Known by his moniker Nas Daily, Yassin earned global fame after producing 1000 one-minute videos in 1000 days and posting them on his Facebook page.</p>\r\n\r\n<p>This 25year old left an engineering job at Venmo to chase his passion of making daily one-minute videos and posting them on Facebook. His 260 videos were unsuccessful but later he found success in that field, gaining over 700K followers and 110M views on his videos in Facebook and 3.1m followers in Instagram.</p>\r\n\r\n<p>&nbsp;</p>', 'passion_story/2023/7/Nuseir-Yassin_1688294588.jpg', 1, NULL, 0, 1, 9, NULL, '2023-07-02 10:43:08', '2023-07-02 10:43:08'),
(36, 'PS8YONOEUJ', 'The Passion Story of Jugadu Kamlesh', '<p>This is the story of Kamlesh Nanasaheb Ghumare, aka Jugadu Kamlesh, who recently appeared on the Shark Tank India show with his partner Naru winning the hearts of the judges and viewers.</p>\r\n\r\n<p>Hailing from an agrarian family, it was not hard for him to understand some of the common problems faced by farmers while spraying chemicals or pesticides on the crops. His versatile bicycle would allow farmers to spray pesticides, sow seeds, and transport goods. His idea of a unique pesticide trolley spray took the panelist by surprise since he doesn&rsquo;t boast of any fancy degree.</p>\r\n\r\n<p>&nbsp;</p>', 'passion_story/2023/7/IMG-20230223-WA0016_1688294645.jpg', 1, NULL, 0, 1, 9, NULL, '2023-07-02 10:44:05', '2023-07-02 10:44:05'),
(37, 'PSTKZKW287', 'The Passion Story of Ranveer Allahbadia', '<p>Ranveer allahbadia was a failed engineer student who was also an alcoholic person. He was highly in pain due to heartbreak with girlfriend, failure, and alcoholism. But his family always stood by him and supported him to get out of this. After recovering from this depression, he created &lsquo;BeerBiceps&rsquo; youtube channel and &ldquo;Monk Entertainments&rdquo;. Today &lsquo;The Ranveer Show&rsquo; in BeerBiceps is India&rsquo;s smartest podcast, where they host the country&rsquo;s greatest success stories and try digging out their secrets to success.</p>\r\n\r\n<p>From alcohol addict to Fitness Freak, From an unemployed engineer to an extraordinary entrepreneur, from depression to social media sensation, from beer to biceps Ranveer has really come a long way to achieve his Passion</p>\r\n\r\n<p>&nbsp;</p>', 'passion_story/2023/7/IMG-20230223-WA0017_1688295621.jpg', 1, NULL, 0, 1, 9, NULL, '2023-07-02 11:00:21', '2023-07-02 11:00:21'),
(38, 'PS4QYXH7EP', 'The Passion Story of Ajey Nagar', '<p>Ajey Nagar, also known as CarryMinati, is one of India&rsquo;s youngest and most successful YouTube personalities. YouTube was his passion and he was keen on making it his profession. He dropped out of school to continue his YouTube career full-time.</p>\r\n\r\n<p>Today he has more than 1.5 billion views on his main channel CarryMinati and over 500 million views on his live gaming channel CarryIsLive. His passion and Involvement in his domain at such a young age is what made him what he is today.</p>\r\n\r\n<p>&nbsp;</p>', 'passion_story/2023/7/IMG-20230304-WA0030_1688295789.jpg', 1, NULL, 0, 1, 9, NULL, '2023-07-02 11:03:09', '2023-07-02 11:03:09'),
(39, 'PSTA1PP8XR', 'The Passion Story of Khan Sir', '<p>Khan Sir Patna is 28 Years old man who is a Youtuber and Teacher. He got popular His way to Teach on his YouTube Channel.</p>\r\n\r\n<p>He Is the founder-director of GS Research Center in Patna. He gets popular after lockdown. When he started teaching his students online. On his YouTube channel, he has more than 10.4 Million Subscribers.</p>', 'passion_story/2023/7/IMG-20230318-WA0005_1688295856.jpg', 1, NULL, 0, 1, 9, NULL, '2023-07-02 11:04:16', '2023-07-02 11:04:16'),
(40, 'PS02Z0P7A3', 'The Passion Story of Srishti Sharma', '<p>Srishti Sharma, a serial entrepreneur and social activist, 4 times TEDx speaker, and Asia&rsquo;s most innovative women entrepreneur and the founder of GAME and is building Asia&rsquo;s first online esports marketplace.</p>\r\n\r\n<p>Her Initial start up days were not at all easy. From being judged, to reject, to facing discrimination because of age and gender the journey became very very difficult. The only thing that kept her going was her spirit, a never defeating attitude and her Ultimate Passion to change lives through her work</p>\r\n\r\n<p>&nbsp;</p>', 'passion_story/2023/7/IMG-20230304-WA0041_1688296197.jpg', 1, NULL, 0, 1, 9, NULL, '2023-07-02 11:09:57', '2023-07-02 11:09:57'),
(41, 'PSJ5WUZOAF', 'The Passion Story of Stephen Edwin King', '<p>As a paranoid, troubled child, tormented by nightmares and raised in poverty, it is no surprise that Stephen King grew up to the title: &ldquo;Master of Horror&rdquo;.</p>\r\n\r\n<p>An addiction to drugs and alcohol were his mechanisms to cope with the unhappiness he felt with his life. These intense emotions were those that he focused onto his writing. Writing became his new coping mechanism, and this is how the master author we know today grew to success.</p>\r\n\r\n<p>&nbsp;</p>', 'passion_story/2023/7/IMG-20230304-WA0036_1688296399.jpg', 1, NULL, 0, 1, 9, NULL, '2023-07-02 11:13:19', '2023-07-02 11:13:19'),
(42, 'PS3Y337PYN', 'The Passion Story of Bhuvan Bam', '<p>Bhuvan Bam, one of the top YouTubers in India, was an average student in school but always had a passion to entertain people. He is the young Indian sensation who runs his insanely famous Youtube channel &lsquo;BB Ki vines&rsquo;.</p>\r\n\r\n<p>His video teasing one of a reporter went viral in YouTube and gave him ultimate success. He is the first Indian to cross 10 million subscribers on YouTube.</p>\r\n\r\n<p>&nbsp;</p>', 'passion_story/2023/7/IMG-20230304-WA0056_1688296519.jpg', 1, NULL, 0, 1, 9, NULL, '2023-07-02 11:15:19', '2023-07-02 11:15:19'),
(43, 'PSCZN9V4XP', 'The Passion Story of Aditya Arora', '<p>Aditya Arora &ndash; the man who went all-in to achieve his ambitions; ambitions of making the world a better place. Nineteen years old, Aditya joined Faad as an Intern but got promoted to the CEO of the company by the time he reached 21, which itself speaks for itself.</p>\r\n\r\n<p>Not only has his work been appreciated locally but globally as well. He has won many accolades for the same. From struggling to make ends meet to now investing in startups, Aditya is the perfect story for anyone who wants to start young and make it big.</p>\r\n\r\n<p>&nbsp;</p>', 'passion_story/2023/7/IMG-20230304-WA0047_1688296629.jpg', 1, NULL, 0, 1, 9, NULL, '2023-07-02 11:17:09', '2023-07-02 11:17:09'),
(44, 'PS86TSZZ56', 'The Passion Story of Arijit Singh', '<p>Arijit singh was one of those many talents who thrived unrecognized and unidentified. His 1st 2 albums were complete fail and never got released. It would have shattered anyone, but Arijit Singh never lost out on hope and passion.</p>\r\n\r\n<p>He set up his own rented studio and began composing music. Later he received several opportunities from industry, after which our Arijit finally had his moment of victory and today he is known as King of Playback Music in Bollywood.</p>\r\n\r\n<p>&nbsp;</p>', 'passion_story/2023/7/IMG-20230304-WA0054_1688296709.jpg', 1, NULL, 0, 1, 9, NULL, '2023-07-02 11:18:29', '2023-07-02 11:18:29'),
(45, 'PSWLBCT4FC', 'The Passion Story of Harekala Hajabba', '<p>Harekala Hajabba, an orange vendor from Mangalore, built a primary school with his earnings of Rs 150 per day. He never had the opportunity to access education, and he did not want the children in the village to suffer the same fate</p>\r\n\r\n<p>His village called Newpadapu, did not have a school for many years. All the village children were deprived of their right to education. Then, in 2000, Harekala Hajabba invested all his life savings and started a school on one acre of land.</p>\r\n\r\n<p>Today, the school has 175 students with classes up to the 10th standard. And in 2020, this 66-year-old man was conferred with the India&rsquo;s second-highest civilian award Padma Shri for his efforts in providing education to children of his village.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>', 'passion_story/2023/7/IMG-20230304-WA0014_1688296801.jpg', 1, NULL, 0, 1, 9, NULL, '2023-07-02 11:20:01', '2023-07-02 11:20:01'),
(46, 'PSAIGV43JV', 'The Passion Story of Neha Kakkar', '<p>Neha Kakkar belongs to a small town and middle class family. Her father was a samosa seller. Started singing at the age of 4 to earn money. She has never had any formal training for her singing.</p>\r\n\r\n<p>Once she was rejected in a Reality Show &rdquo;Indian Idol&rdquo;. She started singing on albums. Her break through was when she got to collaborate with Pritam for the movie Cocktail. After that, there was no looking back. And Now she is judge of&rdquo;Indian Idol&rdquo; Show.</p>\r\n\r\n<p>&nbsp;</p>', 'passion_story/2023/7/IMG-20230304-WA0029_1688296857.jpg', 1, NULL, 0, 1, 9, NULL, '2023-07-02 11:20:57', '2023-07-02 11:20:57'),
(47, 'PSVADLYIBK', 'The Passion Story of Kapil Sharma', '<p>Got rejected for the &lsquo;Laughter Challenge&rsquo; in his first audition. He could not even afford to buy engagement ring for his sister&rsquo;s marriage.</p>\r\n\r\n<p>But did not get stuck to the problems, he used them as a confidence booster and later won many reality shows and started his own production house and came to his show titled &lsquo;Comedy Nights With Kapil&rsquo; which gave him immense popularity.</p>\r\n\r\n<p>&nbsp;</p>', 'passion_story/2023/7/IMG-20230304-WA0020_1688296924.jpg', 1, NULL, 0, 1, 9, NULL, '2023-07-02 11:22:04', '2023-07-02 11:22:04'),
(48, 'PS1M0HP7KA', 'The Passion Story of Sachin Bansal', '<p>Sachin Bansal, the former co-founder of Flipkart which is now owned by Walmart, was one of the first people to build up an online business website in India. Sachin Bansal and his partner Binny had to quit their well paid job at Amazon India to pursue their passion of stating their own business.</p>\r\n\r\n<p>At that time, It was challenging to change buyers&rsquo; mentality who believed in buying things only from their local shopkeepers. But he decided to tiake the risk and launched Flipkart in 2007. And the rest is the history of Indian startup up and e-commerce. After the E-commerce industry now he is in Fintech Industry with his start-up NAVI which is valued at 650 million dollars.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>', 'passion_story/2023/7/IMG-20230304-WA0037_1688297037.jpg', 1, NULL, 0, 1, 9, NULL, '2023-07-02 11:23:57', '2023-07-02 11:23:57'),
(49, 'PSYG4VEV2G', 'The Passion Story of Rahul Dravid', '<p>Inspired by his father and to pursue his all time passion, he started playing cricket at the age of 12. Five years of playing in domestic cricket matches, he turned to play for India.</p>\r\n\r\n<p>Coming from a middle class family and performing very badly in the initial few matches, it was Rahul&rsquo;s passion, dedication, motivation and enthusiasm that made him improve his game and got him an irreplaceable place in the world of international cricket. He is also know as &ldquo;The wall&rdquo; and is currently appointed as head coach for Indian Team.</p>\r\n\r\n<p>&nbsp;</p>', 'passion_story/2023/7/IMG-20230304-WA0019_1688297093.jpg', 1, NULL, 0, 1, 9, NULL, '2023-07-02 11:24:53', '2023-07-02 11:24:53'),
(50, 'PS7VZMNP7T', 'The Passion Story of Kunal Bahl', '<p>Kunal Bahl is the Co-founder and CEO of Snapdeal. The 37-year-old&rsquo;s journey has been an inspirational one, yet filled with many obstacles.</p>\r\n\r\n<p>His H-1B visa got rejected. And the rejection turned out to be an opportunity for Bahl. Along with his friend Rohit Bansal he launched Snapdeal.</p>\r\n\r\n<p>Snapdeal is the Ecommerce Platform which made his dreams come true. And today he is one of the most successful entrepreneurs of India.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>', 'passion_story/2023/7/IMG-20230304-WA0053_1688297218.jpg', 1, NULL, 0, 1, 9, NULL, '2023-07-02 11:26:58', '2023-07-02 11:26:58'),
(51, 'PS9U3761VF', 'The Passion Story of Vijay Shekhar Sharma', '<p>Son of a humble school teacher, Vijay Shekhar Sharma- Converted the Obstacles into Opportunities.</p>\r\n\r\n<p>Vijay Shekhar never gave up on his dreams due to his Struggles or weak English.</p>\r\n\r\n<p>He began Paytm with Rs. 10 in his pocket. In 2 years it had become a popular name in the world of e-commerce. And now he is the owner and CEO of a $16 billion company.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>', 'passion_story/2023/7/IMG-20230304-WA0039_1688297407.jpg', 1, NULL, 0, 1, 9, NULL, '2023-07-02 11:30:07', '2023-07-02 11:30:07'),
(52, 'PSWUJEKM3G', 'The Passion Story of Shankar Mahadevan', '<p>Shankar Mahadevan, A student of the Ramrao Adik Institute of Technology in Navi Mumbai, bagged a degree in computer science and software engineering in 1988. He also worked as a software engineer for Leading Edge.</p>\r\n\r\n<p>But he chose to pursue his passion of singing over his degree and now he is known as an immensely talented singer in Bollywood.</p>\r\n\r\n<p>&nbsp;</p>', 'passion_story/2023/7/IMG-20230304-WA0043_1688297508.jpg', 1, NULL, 0, 1, 9, NULL, '2023-07-02 11:31:48', '2023-07-02 11:31:48'),
(53, 'PSK8N25T6M', 'The Passion Story of Dev Anand', '<p>There was a time when Dev Anand was a simple clerk in the Censor Board Office earning peanuts.</p>\r\n\r\n<p>After a lot of strugglings he opt to follow his Passion and today he&rsquo;s an evergreen part of Indian Cinema whose name will forever be remembered.</p>\r\n\r\n<p>&nbsp;</p>', 'passion_story/2023/7/IMG-20230304-WA0015_1688297566.jpg', 1, NULL, 0, 1, 9, NULL, '2023-07-02 11:32:46', '2023-07-02 11:32:46'),
(54, 'PSGIA851Z3', 'The Passion Story of Anil Kumble', '<p>Kumble has a BE degree in Mechanical Engineering from Rashtreeya Vidyalaya College of Engineering, Bangalore.</p>\r\n\r\n<p>But he had a great Passion for cricket and he chose to pursue on his Passion. He is the most famous engineer turned Indian cricketer</p>\r\n\r\n<p>And as a result he was India&rsquo;s main strike bowler for most of his career and has been foxing the batsmen across the world.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>', 'passion_story/2023/7/IMG-20230304-WA0050_1688297687.jpg', 1, NULL, 0, 1, 9, NULL, '2023-07-02 11:34:47', '2023-07-02 11:34:47'),
(55, 'PSZTUWPOQ4', 'The Passion Story of Dilip Kumar', '<p>A fruit seller by the roadside whose life revolved around trying to earn enough money to sustain himself.</p>\r\n\r\n<p>But always looking ahead, always keeping in touch with his dreams and passion, he never gave up and became one of Bollywood&rsquo;s greatest acting legends.</p>\r\n\r\n<p>&nbsp;</p>', 'passion_story/2023/7/IMG-20230304-WA0016_1688297817.jpg', 1, NULL, 0, 1, 9, NULL, '2023-07-02 11:36:57', '2023-07-02 11:36:57'),
(56, 'PSVYGJ3KP2', 'The Passion Story of Sriram Subramanya', '<p>Grew up in Pondicherry and started work in the auto ancillary business, and later moved into the desktop publishing business, migrating from print designs to digital content.</p>\r\n\r\n<p>His wife had to sell her jewellery at one stage to fund the growth of the company, INTEGRA.</p>\r\n\r\n<p>A tight focus on quality, precision, business culture and his passion towards his work helped grow the company into one of the world&rsquo;s Top 10 in publishing BPO.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>', 'passion_story/2023/7/IMG-20230304-WA0049_1688297956.jpg', 1, NULL, 0, 1, 9, NULL, '2023-07-02 11:39:16', '2023-07-02 11:39:16'),
(57, 'PSNEJV9MLC', 'The Passion Story of Wanindu Hasaranga', '<p>Hasaranga is a world class bowler from Sri Lanka. He had developed a passion for cricket like his cricketer elder brother.</p>\r\n\r\n<p>At the age of 20, this Sri Lankan player robbed all the headlines overnight by taking a hat-trick in the debut ODI, became the third bowler in the world to do so in the first match</p>\r\n\r\n<p>Wanindu then started playing in IPL and Test matches and now reached his best ranking number 2 bowler in the Twenty20 rankings.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>', 'passion_story/2023/7/IMG-20230304-WA0052_1688298048.jpg', 1, NULL, 0, 1, 9, NULL, '2023-07-02 11:40:48', '2023-07-02 11:40:48'),
(58, 'PS3FO4YSOP', 'The Passion Story of AB De Villiers', '<p>A livewire like no other, a merciless marauder and an absolute leader. AB is a champion sportsman with immensely versatile passion during his growing years.</p>\r\n\r\n<p>ABD shot to be known as the second fastest and the second youngest player from South Africa to have attained 1000 test runs after the Graeme Pullock.</p>\r\n\r\n<p>AB De Villiers has scored 21 Test, 24 ODI and 2 IPL centuries. He is the highest century maker for South Africa in ODIs, and sixth highest of all time. He was retained for 11 cr by RBC in IPL 2021 auction.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>', 'passion_story/2023/7/IMG-20230304-WA0011_1688298123.jpg', 1, NULL, 0, 1, 9, NULL, '2023-07-02 11:42:03', '2023-07-02 11:42:03'),
(59, 'PS2SLI80OO', 'The Passion Story of Yash', '<p>Backed by middle class family, Yash always wanted to become an actor. His passion for movies first took him to the small screen, where he acted in the TV serial. Later to become an actor, he ran away from home with Rs 300 in his pocket. With almost no contact with the film industry, he grabbed and utilized every opportunity that knocked on his door. He even promoted one of his films riding an auto.</p>\r\n\r\n<p>However, in the year 2018 his blockbuster film KGF changed his life totally. And KGF Chapter 2 has been released today and receiving blockbuster reviews from everywhere.</p>\r\n\r\n<p>&nbsp;</p>', 'passion_story/2023/7/IMG-20230304-WA0040_1688298370.jpg', 1, NULL, 0, 1, 9, NULL, '2023-07-02 11:46:10', '2023-07-02 11:46:10'),
(60, 'PS44594XAQ', 'The Passion Story of Sathish Ray', '<p>An academically sharp and a state level topper Satish Ray, eventually developed a passion for literature, art, acting and started acting in plays. Slowly he started curating content and created 3-4 channels, which didn&rsquo;t work out, but that didn&rsquo;t deter him from what he wanted to achieve in life. He worked very hard and then got a break in TVF. His famous character Imandar Sharma got viral in Instagram and Tik tok.</p>\r\n\r\n<p>Currently, he is associated with TVF, Timelines and many other sketch videos. And also started his own channel on Youtube where he creates videos individually.</p>\r\n\r\n<p>&nbsp;</p>', 'passion_story/2023/7/IMG-20230304-WA0045_1688298476.jpg', 1, NULL, 0, 1, 9, NULL, '2023-07-02 11:47:56', '2023-07-02 11:47:56'),
(61, 'PS9DA4FENA', 'The Passion Story of Jitendra Kumar', '<p>He was an Engineer who did not find passion in his job and realized that he only knew and loved one thing and it was acting. His family did not favour his decision. Moreover, he was rejected from the National School of Drama. But Jitendra Kumar did not give up. And Eventually, Jitendra succeeded in convincing his parents.</p>\r\n\r\n<p>Jitendra taught Physics at a JEE coaching institute in Bombay for a stable salary. The rest of his time was devoted to acting. His debut web series Pitchers was a hit among youngsters. Instant fame gave a boost to his self-confidence which had fallen earlier. And the rest is history.</p>\r\n\r\n<p>&nbsp;</p>', 'passion_story/2023/7/IMG-20230304-WA0017_1688298549.jpg', 1, NULL, 0, 1, 9, NULL, '2023-07-02 11:49:09', '2023-07-02 11:49:09'),
(62, 'PSH7MID3BO', 'The Passion Story of Rinku Singh', '<p>Rinku Singh, who comes from a lower middle-class family had to save money from his daily allowances to help his father pay off a loan. And at one time he contemplated quitting cricket and taking up work as a domestic help, sweeping and mopping floors, to contribute to his family&rsquo;s income.</p>\r\n\r\n<p>Indeed, Rinku&rsquo;s is a remarkable story that has a huge dose of hardships, rejection, dejection and heartbreak. Rinku survived all those setbacks, scored a pile of runs for Uttar Pradesh at the domestic level and slowly and steadily achieved success. Rinku was bought by KKR for Rs 80 lakhs at the IPL Auction &amp; the life changed post that IPL Contract.</p>\r\n\r\n<p>&nbsp;</p>', 'passion_story/2023/7/IMG-20230304-WA0034_1688298657.jpg', 1, NULL, 0, 1, 9, NULL, '2023-07-02 11:50:57', '2023-07-02 11:50:57'),
(63, 'PSXAZIESU6', 'The Passion Story of Rajkumar Rao', '<p>The actor was born in Gurgaon, India, in a lower-middle-class family. He came to explore his passion for acting when he actively participated in plays during his school time. Rajkummar started his acting career in 10th grade with theatre. He completed his graduation in 2008 from Film and Television Institute and then shifted to Mumbai to try his foot in the Bollywood industry. After shifting to Mumbai, according to the reports, Rajkummar almost spent a year and a half visiting studios and meeting directors. He finally got his big break in the movie Love Sex Aur Dhokha in 2010. He is appreciated for many Bollywood movies like Kai Po Che, Shahid, Queen, Bareilly ki barfi, Stree, and many more.</p>\r\n\r\n<p>His journey in Bollywood has been surreal and rewarding but not without its share of challenges. The actor said his late mother&rsquo;s faith in him kept him going even on days when he had nothing when he moved to Mumbai from Gurgaon to chase his passion. At present, Rajkummar is the busiest actor in B-town and he has back-to-back film releases. He is the recipient of several awards including the National Film Award, three Filmfare awards, and the Asia Pacific screen award.</p>\r\n\r\n<p>&nbsp;</p>', 'passion_story/2023/7/IMG-20230304-WA0026_1688298732.jpg', 1, NULL, 0, 1, 9, NULL, '2023-07-02 11:52:12', '2023-07-02 11:52:12'),
(64, 'PS965DOZBH', 'The Passion Story of Vivek Arora/ Karma', '<p>Vivek Arora Aka Karma is a renowned Hip-Hop Rapper in India. He was born and brought up in Dehradun, Uttarakhand, India. He realized his passion for Rapping when he was pursuing his BSc degree and, he dropped out of college to pursue his dreams. In his initial days, he struggled a lot due to limited money. He did all sorts of odd jobs to earn some extra money. He used to work in a bank at 4000 INR Per month. He was also working in a call center for 2 years. There were days where he lost all his hope and got disappointed because of the lesser views he gets on his video but he decided not to give up on his passion.</p>\r\n\r\n<p>The turning point In Krama&rsquo;s life was the day when he met with Raftaar and Raftaar impressed by his talent offered one project to him. There was no going back after that. Along with Rapping, he is also a well-known singer, Songwriter, and Music Composer. Karma is a viral rapper for his songs Karmasutra (2019), Rap Karte Hain (2018), Warm Up (2019), We Wake Up (2018), Main Wahi Hoon (2019), and Take Diss (2019).</p>\r\n\r\n<p>&nbsp;</p>', 'passion_story/2023/7/IMG-20230304-WA0051_1688298848.jpg', 1, NULL, 0, 1, 9, NULL, '2023-07-02 11:54:08', '2023-07-02 11:54:08');
INSERT INTO `passion_stories` (`id`, `code`, `full_name`, `description`, `image`, `status`, `reason`, `call_to_action`, `is_admin`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(65, 'PSQ6R8VF48', 'The Passion Story of Krishna Kaul', '<p>Krishna is a very popular Indian Rapper and Writer known for his amazing Songs. Formerly known as Young Prospekt, he is one of the earliest rappers to emerge in the desi hip hop scene. The full name of Krsna is Krishna Kaul and people call him KRI$NA. Being exposed to Hip Hop music at an early age, He developed his interest in music at a very young age and wanted to pursue music as his career. But, as his parents wanted him to do a 9 to 5 job for his living &amp; expenses, so he started doing other jobs for his living.. But it didn&rsquo;t stop him from working on his passion</p>\r\n\r\n<p>Kaul started recording and releasing songs on his MySpace page in 2006, by 2008 he had gained a small local fanbase. His first shot of success came with the release of the music video for &ldquo;Kaisa Mera Desh&rdquo; in 2010, becoming the first Indian hip hop song on YouTube and earning a #2 ranking as one of the most watched music videos in India overnight following its release. And there was no look back after that. His major rise to success in his career is because of his hard work and ability to not to give up.</p>\r\n\r\n<p>&nbsp;</p>', 'passion_story/2023/7/IMG-20230304-WA0021_1688298998.jpg', 1, NULL, 0, 1, 9, NULL, '2023-07-02 11:56:38', '2023-07-02 11:56:38'),
(66, 'PS2SDHW55E', 'The Passion Story of Harsh Beniwal', '<p>Harsh Beniwal belongs to a middle-class family. He has done bachelor&rsquo;s in Computer Application but he dropped out in the second year to pursue his passion for acting. Initially, he begins with his sister on the Dubmash apps. Then he started his journey on the social platforms Facebook and Instagram. Even after continuously working for a full year, he got only 5000 likes on his Facebook page. Harsh Beniwal got very demotivated by this slow growth but he didn&rsquo;t stop creating videos. His habit of working consistently eventually made him very successful.</p>\r\n\r\n<p>Gradually, his followers increased miraculously then he started his youtube channel with his own name. Now, Harsh Beniwal is a very successful YouTuber and has more than 13 million subscribers on his YouTube channel and 4 million followers on Instagram. He also acted in Student of the Year 2 and played the role of Puggi. Thanks to his success as a YouTuber, because of that he has been able to realize his childhood dream of becoming a Bollywood actor. This story of Harsh Beniwal, from YouTube to Movies is an exciting but more importantly an inspiring one as well. If you stick to what you love doing the most then success is sure to follow and soon!</p>\r\n\r\n<p>&nbsp;</p>', 'passion_story/2023/7/IMG-20230304-WA0018_1688299133.jpg', 1, NULL, 0, 1, 9, NULL, '2023-07-02 11:58:53', '2023-07-02 11:58:53'),
(67, 'PS1RY184BL', 'The Passion Story of Amit Bhadana', '<p>Amit was an average Indian kid from Faridabad. A boy from a lower-middle-class family. He lost his dad when he was small. He loved bringing smiles on the faces of people and he never had an interest in studying. He was spending most of the time on YouTube. He started his YouTube career posting other&rsquo;s content but due to copyright, his content use to get deleted from his channel. Later he posted his own content based on comedy and gained a few subscribers but he didn&#39;t inform his family about it because his family never supported him and wanted him to study.</p>\r\n\r\n<p>But when Amit reached 10000 subscribers he was invited to a YouTube feast where other content creators made fun of his content and said him desi and useless. But all this never affected him. It just made him work more harder. He focused on comedy without using bad language in his content. His work started speaking and he became the first YouTuber to reach 20 million subscribers. He is also followed by many celebrities today.</p>\r\n\r\n<p>&nbsp;</p>', 'passion_story/2023/7/IMG-20230304-WA0048_1688299299.jpg', 1, NULL, 0, 1, 9, NULL, '2023-07-02 12:01:39', '2023-07-02 12:01:39'),
(68, 'PSWXYNV6UE', 'The Passion Story of Subhash Dubey', '<p>IPS Subhash Dubey, whose full name is Subhash Chandra Dubey, is an IPS officer of the 2005 batch and his tenure has been 15 to 16 years. IPS Subhash Dubey was very good in his studies since childhood. He had thought during high school that he has to prepare for UPSC and become an officer. After studying in his village, he enrolled in Allahabad University and from there continued his college studies during college he also started preparing for civil service.</p>\r\n\r\n<p>He also sat in the JRF E exam after his college and became successful in the first time itself, he never resorted to coaching for the preparation of UPSC even though he is from Hindi medium school and did complete preparation through self-study, as a result of which he secured 74th rank in the examination. He is always in the discussion for better policing and always came forward to help the poor people even during the Corona epidemic. They have also got a token of appreciation on the occasion of Independence Day.</p>\r\n\r\n<p>&nbsp;</p>', 'passion_story/2023/7/IMG-20230304-WA0033_1688299452.jpg', 1, NULL, 0, 1, 9, NULL, '2023-07-02 12:04:12', '2023-07-02 12:04:12'),
(69, 'PS94QEXKBG', 'The Passion Story of Divya Gandotra Tandon', '<p>Divya Gandotra Tandon is a dynamic young entrepreneur, celebrity manager, social media manager, and influential figure. She disliked studying as a student, but her true interest was in technology. Her thirst for technology and desire to comprehend everything led her to YouTube. When Divya discovered YouTube, she immersed herself in the platform&rsquo;s videos, both enjoying and learning. Unlike most people her age, who spend their time watching music videos or funny pranks, her interest was in researching and learning about people who came from nowhere and succeeded in life. She was drawn to Zero to Hero stories. She discovered her passion after watching inspirational stories on YouTube.She realised at that point that all she wanted to do was become a YouTuber.</p>\r\n\r\n<p>However, things were not as simple as she had assumed. She started a YouTube channel called Technical Divya, where she recorded videos and put in all of her effort. Unfortunately, the response was negative, and she was heartbroken. She decided to start over and created a new channel, Tech Divya. She had more success with this channel than with the previous one. Despite problems and negative responses, she decided to pursue her passion without looking back. Finally, her two years of hard work paid off when she received the Entrepreneur Young Achievers Award in Delhi and the Incredible Indian Icon Award in Indore.</p>\r\n\r\n<p>&nbsp;</p>', 'passion_story/2023/7/IMG-20230304-WA0025_1688299542.jpg', 0, NULL, 0, 1, 9, 9, '2023-07-02 12:05:42', '2023-07-03 11:32:14'),
(70, 'PSPOW0NJD1', 'The Passion Story of Tilak Mehta', '<p>Tilak Mehta, a 13 year old 8th grade student once forgot some books at his uncle&rsquo;s place which he had to read for his school test, scheduled on the next day. When he asked his uncle to get the books the same day, his uncle wasn&rsquo;t able to do that. As a result, he wished there was a service that could deliver his books the same day.While he was thinking this, he came across a Mumbai Dabbawala in his building and the idea for PAPERS N PARCELS struck and his entrepreneurial journey began. He was only 15 years old who start his company at this age. He was also studying managing his company.</p>\r\n\r\n<p>In his paper n parcels business, he offers delivery services for all kinds of essential, everyday items, including pick-ups and doorstep deliveries. He has since expanded his business to become one of India&rsquo;s most successful young entrepreneurs.Many young people in India who want to start their own businesses are inspired by his success story.He also wins the &ldquo;Young entrepreneur title at the India Maritime Awards in 2018&rdquo;.</p>\r\n\r\n<p>&nbsp;</p>', 'passion_story/2023/7/IMG-20230304-WA0044_1688299651.jpg', 1, NULL, 0, 1, 9, NULL, '2023-07-02 12:07:31', '2023-07-02 12:07:31'),
(71, 'PSN58M9CN4', 'The Passion Story of Paritosh Sharma', '<p>Paritosh Sharma is the Founder of MBA PLUS. He belongs to a family of teachers and the armed forces. Since childhood, he has always learnt the value of trust and respect in this world from his father. He always knew how difficult it was to earn those 2 things in life. So he started to figure out his career. But it was not as easy as it seemed. He had to go through many ups and downs to connect with the networks. And in these difficult times, he found his passion for teaching and helping people to gain more clarity in their career and in their business.</p>\r\n\r\n<p>He planned to help SME&#39;s and students to gain more knowledge about how the internet companies&rsquo; business modules work. He always wanted to contribute to the country and the teachings from his childhood helped him to build great communities. He believes that people&rsquo;s passion evolve as they get different experiences in life. But very few actually use their passion to create something. Mostly people remain consumers. So he aims to create a talent base and teach 10 million Indians to be valuable as talent for SME&rsquo;s and start-ups of our country or the world. He also says that social media has increased noise. People are wasting their time on consuming click-bait content. This is why he is curating the most valuable content on the internet in the MBA+ app</p>\r\n\r\n<p>&nbsp;</p>', 'passion_story/2023/7/IMG-20230304-WA0023_1688299720.jpg', 1, NULL, 0, 1, 9, NULL, '2023-07-02 12:08:40', '2023-07-02 12:08:40'),
(72, 'PSRHE0CYMS', 'The Passion Story of Akhilendra Sahu', '<p>17 year old Akhilendra Sahu started his entrepreneurship journey as a freelancer. His dream was different than most of the youngsters of his age. His passion was to start his own company and he worked tirelessly for achieving it. There were many difficulties that he faced then. He was often called too young and crazy to have such big dreams. But he never let it affect him. He toiled hard to achieve what he has now.</p>\r\n\r\n<p>During his freelancing work, he gained good amount of exposure to business tactics and based on them he started ASTNT Technologies Private Limited. He was into digital marketing where he brought success to number of clients in India. But he wanted to grow more. He didn&rsquo;t want to be limited to one particular niche. So in the following two years, he founded a few more companies catering to different client needs. He&rsquo;s also known as the &ldquo;World&rsquo;s Youngest Serial Entrepreneur.&rdquo; His advise to all the budding young entrepreneurs is simple- if you wish to be successful in life, never let anyone to limit your potential. Success can be achieved only if you are willing to give your everything for it.</p>\r\n\r\n<p>&nbsp;</p>', 'passion_story/2023/7/IMG-20230304-WA0024_1688299946.jpg', 1, NULL, 0, 1, 9, NULL, '2023-07-02 12:12:26', '2023-07-02 12:12:26'),
(73, 'PSA21O8DPJ', 'The Passion Story of Saurabh Ghadge', '<p>Saurabh Ghadge, professionally known as Saurabh, is a comedian, content creator, YouTuber, and social media personality from India.. He began his career on TikTok in 2020, but his true fame and recognition came through Youtube Shorts and Instagram clips. Saurabh is mainly popular for his funny videos which he used to upload on his official YouTube channel named Saurabh Ghadge, where he has more than 310k subscribers and he has 700K Instagram followers.</p>\r\n\r\n<p>He Is a self-made celebrity with an amazing sense of humor and acting skills. He is capable to bring a smile to the face of his audience through his videos within a few seconds. Saurabh Ghadge was born in a middle-class family of mumbai, studied in a government school, and overcame all these hurdles to become a successful YouTuber today and established himself as a successful social media celebrity.</p>', 'passion_story/2023/7/IMG-20230304-WA0032_1688300059.jpg', 1, NULL, 0, 1, 9, NULL, '2023-07-02 12:14:19', '2023-07-02 12:14:19'),
(74, 'PS1VIEYEBD', 'The Passion Story of Vineeth Vincent', '<p>Beatboxing has spread from the West to the rest of the world for decades. It arrived in India a few years ago, and the familiarity has grown since then. The art first piqued the interest of young people in the Northeast, and it later found listeners in the south, who continued to appreciate the music rather than viewing it as a one-time spectacle. Across the country, people practise and listen to beatboxing.</p>\r\n\r\n<p>Vineeth Vincent, perhaps India&rsquo;s greatest beatboxer, has performed thousands of shows. Let&rsquo;s look at how his passion drove him to success in this story.</p>\r\n\r\n<p>He began his career as an emcee in Bangalore in 2007. He began to find a balance between being on stage as a host and using the little bit of musicality that was stuck in his head after a successful career as an emcee and a failed career as a musician.</p>\r\n\r\n<p>In 2008, he took a year off from Christ College to devote more time to music and beatboxing. He spent a month in Ahmedabad at Mrinalini Sarabhai&rsquo;s Darpana Academy of Performing Arts, where he met artists and experimented with beatboxing. He soon returned to Bangalore and books, though he was preoccupied with beatboxing and learning tricks on his own.</p>\r\n\r\n<p>He appeared with &lsquo;The Boxettes&rsquo; and the Austrian beatboxing group &lsquo;Bauchklang.&rsquo; In 2011, he created the largest human beatbox ensemble and entered the &lsquo;Limca Book of Records&rsquo; at an event called &lsquo;Can You Say Beat Box?&rsquo; The beat-boxer, 33, is known as &ldquo;India&rsquo;s biggest beat-boxer.&rdquo; Despite the fact that the path of his passion was less traveled, he did not give up and succeeded. He had nearly 1700 shows by the end of 2017 and held two titles, one for the Guinness Book of World Records and one for the Limca Book of World Records. He owns &lsquo;Musical Cubicle,&rsquo; a music studio, &lsquo;Side Step,&rsquo; an artist management company, and &lsquo;Meditating Monkey,&rsquo; a backpacking hostel.</p>', 'passion_story/2023/7/IMG-20230304-WA0046_1688300206.jpg', 1, NULL, 0, 1, 9, NULL, '2023-07-02 12:16:46', '2023-07-02 12:16:46'),
(75, 'PSDZCMOVGY', 'The Passion Story of Binny Bansal', '<p>Binny Bansal is a software engineer and an Indian Internet entrepreneur from India. He is from the capital of Punjab and Haryana State, Chandigarh and was brought up there as well. After studying at St. Anne&rsquo;s in Chandigarh, he went to the Indian Institute of Technology at Delhi (IIT-Delhi).</p>\r\n\r\n<p>In 2007 he co-founded the famous online e-commerce site, &lsquo;Flipkart&rsquo; with his friend, Sachin Bansal. He was twice rejected by Google prior to co-founding Flipkart. Binny worked also for an online company, Amazon as a software engineer for nine months. Previously, Bansal had worked for the Sarnoff Corporation, developing automotive lane sensors.</p>\r\n\r\n<p>Binny Bansal and his business partner Sachin Bansal realized that the E-commerce market in India was very small. In 2007 they left Amazon and planned to launch an online bookstore, later they founded Flipkart in a two-storeyed building in Koramangala as an e-commerce company.</p>\r\n\r\n<p>Many people think that Binny Bansal and Sachin Bansal are both brothers. They both worked at Amazon, an American multinational technology company, before founding Flipkart. Binny Bansal and Sachin Bansal distributed books on scooters in the early days of their business. Because of his efforts and hard work, Flipkart gradually grew and expanded into several categories, such as electrical equipment, electronics, fashion, sports, home appliances, books, etc.</p>\r\n\r\n<p>His role as the Chief Operating Officer from 2007 to 2016 earned him the title &lsquo;The Operational Guy&rsquo;, as well as &lsquo;The Executioner&rsquo;. In 2016, he became CEO and in 2017, he became Group CEO. Employees at Flipkart described Binny as calm, approachable, and friendly person. Even though he ran a multimillion-dollar firm successfully, he was always open to learning. Flipkart emerged as the first e-commerce company in India. Walmart acquired a 77% stake in the Flipkart group In 2018. After the acquisition, Binny Bansal continued as Group CEO. He was named as the 86th richest person in India by Forbes India Rish List, with a total net worth of more than $1.3 billion. But due to some internal issue Binny Bansal stepped down from his position as CEO of the company in November, 2018.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>', 'passion_story/2023/7/IMG-20230304-WA0060_1688300585.jpg', 1, NULL, 0, 1, 9, NULL, '2023-07-02 12:23:05', '2023-07-02 12:23:05'),
(79, 'PSD2RDKADX', 'The Passion Story of Kapil Dev', '<p>Taking the world by storm with his on-point sports skills and wonderful willpower, Haryana Hurricane Kapil Dev brought India the honor to hold the Cricket World Cup trophy for the first time. Ironically, his autobiography, 83, was released in 2021. Better known as Kapil Dev, the former Indian cricketer has won many titles to his name. Born in Chandigarh, his confident and positive personality helped the Indian team win the World Cup under his leadership. As a result of his achievements in cricket, Wisden awarded him the title of &#39;Indian Cricketer of the Century&#39; in 2002. In 1980 he married to Romi Bhatia.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Kapil began his cricket career by playing domestically for Haryana. In 1978-79, he also played a test series against Pakistan for the Indian team, where he showed outstanding bowling skills. By taking two 5-wicket hauls against Australia, Dev also won the Ranji trophy and became India&#39;s premier fast bowler. In 1982-83, he became the captain following Sunil Gavaskar and went on to play in the World Cup. The road to becoming a sensation for Kapil Dev was not without obstacles. In 1980-91, he suffered a groin injury during India&#39;s tour of Australia. India was about to loose the match. Even though he was injured, Kapil managed to win the match with his spectacular bowling, which ranks among his five best bowling performances. India came close to losing the World Cup, but Kapil&#39;s motivational personality boosted team morale and helped the country win.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>He is the greatest Indian pace bowler and the only cricketer to score more than 5,000 runs and has taken more than 400 wickets in International Test cricket. He led India&#39;s bowling attack for the next two decades after 1978-79. He had scored 434 wickets in 131 matches by the end of his Test cricket career. Having retired in 1994, he became the coach of the Indian team in 1999. Dev has been awarded with two of India&rsquo;s highest civilian honours: the Padma Shri in 1982 and the Padma Bhushan in 1991. In 2002 he was named the Indian Cricketer of the Century, and he was inducted into the International Cricket Council&rsquo;s Hall of Fame in 2010.</p>', 'passion_story/2023/7/kapil dev_1688905480.jpg', 1, NULL, 0, 1, 9, NULL, '2023-07-09 12:24:40', '2023-07-09 12:24:40'),
(80, 'PSGAYUCGJZ', 'The Passion Story of Anushka Sharma', '<p>Anushka Sharma, born in 1988, is a prominent Indian actress, producer, and entrepreneur. She made her acting debut in Bollywood in 2008 and quickly gained recognition for her versatile performances. Her breakthrough came with the film &ldquo;Rab Ne Bana Di Jodi.&rdquo;</p>\r\n\r\n<p>She has portrayed diverse characters and received accolades for films like &ldquo;NH10&rdquo; and &ldquo;Sultan.&rdquo; Sharma co-founded Clean Slate Filmz and launched her clothing line, Nush. Her talent, versatility, and entrepreneurial spirit have earned her numerous awards and inspire aspiring artists and entrepreneurs.</p>\r\n\r\n<p>&nbsp;</p>', 'passion_story/2023/7/Anushka Sharma_1688905746.jpg', 1, NULL, 0, 1, 9, NULL, '2023-07-09 12:29:06', '2023-07-09 12:29:06'),
(81, 'PSS48X5Q95', 'The Passion Story of Abhinav Bindra', '<p>Abhinav Bindra, born in 1982, is an accomplished Indian shooter and Olympic gold medalist. He made history as India&rsquo;s first individual Olympic gold medalist at the 2008 Beijing Olympics. Bindra&rsquo;s success is a result of his relentless pursuit of excellence, meticulous preparation, and mental resilience.</p>\r\n\r\n<p>He has also excelled at the Commonwealth Games, Asian Games, and World Championships. Beyond his sporting achievements, Bindra is respected for his humility and dedication. His journey inspires aspiring athletes worldwide.</p>\r\n\r\n<p>&nbsp;</p>', 'passion_story/2023/7/Abhinav Bindra_1688906541.jpg', 1, NULL, 0, 1, 9, NULL, '2023-07-09 12:42:21', '2023-07-09 12:42:21'),
(82, 'PSRX2CKK6U', 'The Passion Story of Mukesh Ambani', '<p>Mukesh Ambani, Chairman of Reliance Industries Limited (RIL), transformed the company from a textile and petrochemical business into a diversified conglomerate. His notable achievement was launching Reliance Jio, disrupting India&rsquo;s telecom industry.</p>\r\n\r\n<p>Ambani&rsquo;s strategic vision, focus on innovation, and customer-centric approach propelled RIL&rsquo;s success. He is a globally recognized entrepreneur and has received numerous awards. Ambani&rsquo;s story inspires aspiring entrepreneurs, showcasing the importance of innovation and adaptability in building a thriving business empire.</p>\r\n\r\n<p>&nbsp;</p>', 'passion_story/2023/7/Mukesh Ambani_1688906713.jpg', 1, NULL, 0, 1, 9, NULL, '2023-07-09 12:45:13', '2023-07-09 12:45:13'),
(83, 'PSBWGMWT5Y', 'The Passion Story of Kunal Shah', '<p>Kunal Shah is an Indian business person and investor who is the founder of CRED. Kunal was born in a middle-class family. He began working at a very young age to meet his family&rsquo;s financial expenses. Shah had prior dispatched adventures like PaisaBack, a cashback and special markdown crusade stage for retailers.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Till 2016, he functioned as CEO at FreeCharge, an organization that he established in 2010. Then in 2018, he established Cred, an Indian fintech organization which permits clients to make credit card installments through its application. Shah, since his early days, has worked hard to achieve his goals and now stands as a prominent entrepreneur of India.</p>', 'passion_story/2023/7/Kunal Shah_1688907933.jpg', 1, NULL, 0, 1, 9, NULL, '2023-07-09 13:05:33', '2023-07-09 13:05:33'),
(84, 'PSE3W0LNNQ', 'The Passion Story of Sushmita Sen', '<p>Sushmita Sen, an Indian actress and former Miss Universe. She made history by being the first Indian woman to win Miss Universe in 1994. Sen entered the film industry after her pageant victory and garnered praise for her versatile acting skills.</p>\r\n\r\n<p>Apart from her successful acting career, Sen is known for her philanthropy and support for causes like child welfare and education. Sushmita Sen&rsquo;s journey exemplifies determination, talent, and breaking barriers. She serves as an inspiration to aspiring actors and individuals worldwide, representing empowerment and making a positive impact.</p>\r\n\r\n<p>&nbsp;</p>', 'passion_story/2023/7/Sushmita Sen_1688908059.jpg', 1, NULL, 0, 1, 9, NULL, '2023-07-09 13:07:39', '2023-07-09 13:07:39'),
(85, 'PS53U96ETI', 'The Passion Story of Lata Mangeshkar', '<p>Lata Mangeshkar is a legendary Indian playback singer. Her captivating voice and exceptional range made her an instant sensation in the 1940s. Mangeshkar recorded thousands of songs in various languages, showcasing her versatility and earning critical acclaim. She received numerous awards, including the prestigious Bharat Ratna.</p>\r\n\r\n<p>Her dedication, passion, and unmatched talent have made her an iconic figure in Indian music. Lata Mangeshkar continues to inspire aspiring singers and music lovers across generations.</p>\r\n\r\n<p>&nbsp;</p>', 'passion_story/2023/7/Lata Mangeshkar_1688908139.jpg', 1, NULL, 0, 1, 9, NULL, '2023-07-09 13:08:59', '2023-07-09 13:08:59'),
(86, 'PS41ETGMJX', 'The Passion Story of Sania Mirza', '<p>Sania Mirza, born in 1986, is a renowned Indian tennis player and one of the most successful athletes in the country. Sania Mirza&rsquo;s journey began at a young age when she showed exceptional talent in tennis. She turned professional in 2003 and quickly climbed the ranks, winning her first Grand Slam title in 2005.</p>\r\n\r\n<p>Mirza&rsquo;s achievements, including reaching the top 30 in singles rankings and holding the world No. 1 doubles ranking, have inspired aspiring tennis players in India. She is a symbol of empowerment and an example of passion and perseverance in sports.</p>\r\n\r\n<p>&nbsp;</p>', 'passion_story/2023/7/Sania Mirza_1688908199.jpg', 1, NULL, 0, 1, 9, NULL, '2023-07-09 13:09:59', '2023-07-09 13:09:59'),
(87, 'PSS2L6K1TV', 'The Passion Story of Milkha Singh', '<p>Milkha Singh, the &ldquo;Flying Sikh,&rdquo; was born in India in 1929. Despite a traumatic childhood during the partition, he became a legendary sprinter. Representing India in international competitions, Milkha Singh earned acclaim for his speed and endurance, becoming one of India&rsquo;s greatest athletes.</p>\r\n\r\n<p>Although he narrowly missed an Olympic medal in 1960, his inspiring performance inspired a generation. His story embodies resilience and determination, overcoming personal tragedies. His inspiring journey continues to motivate athletes, reminding them of the power of determination and hard work.</p>\r\n\r\n<p>&nbsp;</p>', 'passion_story/2023/7/Milkha Singh_1688908262.jpg', 1, NULL, 0, 1, 9, NULL, '2023-07-09 13:11:02', '2023-07-09 13:11:02'),
(88, 'PSXKPJH3T7', 'The Passion Story of Bhaichung Bhutia', '<p>Bhaichung Bhutia, a legendary Indian footballer who represented the country in prestigious tournaments like the Asian Games and the AFC Asian Cup. He made history as the first Indian footballer to sign a professional contract abroad, paving the way for others.</p>\r\n\r\n<p>As the highest goal scorer for the Indian national team, Bhutia played a crucial role in promoting football in India. His remarkable journey earned him esteemed awards such as the Arjuna Award and the Padma Shri.</p>\r\n\r\n<p>&nbsp;</p>', 'passion_story/2023/7/Bhaichung Bhutia_1688908336.jpg', 1, NULL, 0, 1, 9, NULL, '2023-07-09 13:12:16', '2023-07-09 13:12:16'),
(89, 'PSR7VVNU1U', 'The Passion Story of Leander Peas', '<p>Leander Paes is a legendary Indian tennis player known for his success in doubles. Paes achieved fame by winning a bronze medal at the 1996 Atlanta Olympics, becoming the first Indian to win an individual Olympic tennis medal in decades.</p>\r\n\r\n<p>He excelled in doubles, winning multiple Grand Slam titles, including Wimbledon and the Australian Open. Paes&rsquo; sportsmanship and passion for the game have made him an inspiration to aspiring tennis players in India. His contributions to tennis earned him prestigious awards, including the Padma Bhushan.</p>\r\n\r\n<p>&nbsp;</p>', 'passion_story/2023/7/Leander Paes_1688908401.jpg', 1, NULL, 0, 1, 9, NULL, '2023-07-09 13:13:21', '2023-07-09 13:13:21'),
(90, 'PS4LJRC5N2', 'The Passion Story of Dutee Chand', '<p>Dutee Chand is an accomplished Indian sprinter who overcame challenges to achieve success in women&rsquo;s athletics. She made history as the first Indian female sprinter to win a medal at the World Junior Championships in 2014. Her breakthrough came at the 2018 Asian Games, where she won two silver medals in the women&rsquo;s 100 meters and 200 meters events.</p>\r\n\r\n<p>Chand&rsquo;s success has paved the way for women athletes in India and sparked conversations about gender equality in sports. Her journey exemplifies perseverance, resilience, and breaking barriers, inspiring young athletes and empowering Indian athletics.</p>\r\n\r\n<p>&nbsp;</p>', 'passion_story/2023/7/Dutee Chand_1688908506.jpg', 1, NULL, 0, 1, 9, NULL, '2023-07-09 13:15:06', '2023-07-09 13:15:06'),
(91, 'PS4301JO0J', 'The Passion Story of Viswanathan Anand', '<p>Viswanathan Anand, born in 1969, is a legendary Indian chess player known for his strategic brilliance and numerous victories. Anand&rsquo;s journey in chess began at a young age, and he quickly displayed exceptional talent and dedication to the game. He became the youngest Indian to achieve the title of International Master at the age of 15.</p>\r\n\r\n<p>His breakthrough came In 2000 when he won the FIDE World Chess Championship, becoming the first Asian to claim the prestigious title. Throughout his career, Anand has achieved numerous victories, including winning the World Chess Championship on multiple occasions. He has popularized chess in India and inspired a new generation of players.</p>\r\n\r\n<p>&nbsp;</p>', 'passion_story/2023/7/Viswanathan Anand_1688908572.jpg', 1, NULL, 0, 1, 9, NULL, '2023-07-09 13:16:12', '2023-07-09 13:16:12'),
(92, 'PS902WZ7PE', 'The Passion Story of Raj Shamani', '<p>A self-proclaimed &lsquo;useless kid&rsquo; who wasn&rsquo;t great at studies. Started his business with making soaps and going door to door to sell them. Had to borrow Rs 10,000 from his dad to help him expand his business and also pull up new ventures. This was Raj Shamani at 16. But he was not the one to quit and run away from the challenges.&nbsp;</p>\r\n\r\n<p>As a result today, at 24, he is one of the youngest entrepreneurs in India with a Rs 200-crore turnover company and he is also a Key Note Public Speaker, Content Creator and Podcaster who inspires millennials everyday with his speaches.</p>', 'passion_story/2023/7/Raj Shamani_1688909044.jpg', 1, NULL, 0, 1, 9, NULL, '2023-07-09 13:24:04', '2023-07-09 13:24:04'),
(93, 'PSVUOJC2JD', 'The Passion Story of Azim Premji', '<p>Azim Premji, an Indian business tycoon and philanthropist, transformed his family&#39;s vegetable oil business into the global IT giant Wipro Limited. Under his leadership, Wipro became a major player in the IT industry, expanding globally and becoming one of India&#39;s largest software exporters.</p>\r\n\r\n<p>Premji&#39;s entrepreneurial vision and commitment to innovation propelled Wipro&#39;s success. Recognized as one of the world&#39;s most generous individuals, Premji&#39;s story showcases the power of business leaders to drive positive change.</p>\r\n\r\n<p>&nbsp;</p>', 'passion_story/2023/7/Azim Premji_1688909190.jpg', 1, NULL, 0, 1, 9, NULL, '2023-07-09 13:26:30', '2023-07-09 13:26:30'),
(94, 'PSJPAP157X', 'The Passion Story of Sushil Kumar', '<p>This renowned Indian World Champion wrestler hails from a lower-middle class family and his father was a DTC bus driver and his mother is a housewife. Sushil Kumar was inspired to taken on wrestling by his cousin Sandeep, who eventually quit wrestling as their family could support only one wrestler. Despite the minimal funds available, poor training facilities and lack of dietary supplements, Sushil Kumar has become an world-renowned Wrestling Champion through hard work and sheer determination.</p>', 'passion_story/2023/7/Sushil Kumar_1688909319.jpg', 1, NULL, 0, 1, 9, NULL, '2023-07-09 13:28:39', '2023-07-09 13:28:39'),
(95, 'PS3IOVB79W', 'The Passion Story of Sandeep Maheshwari', '<p>Sandeep Maheshwari, an Indian entrepreneur and motivational speaker, overcame challenges to find success. He founded ImagesBazaar, the world&#39;s largest collection of Indian images, and turned his passion for photography into a thriving business.</p>\r\n\r\n<p>Through his YouTube channel and live seminars, Maheshwari has inspired millions with his wisdom and personal development insights. His story of resilience and dedication has made him a revered figure in India&#39;s entrepreneurship and motivation space, empowering countless individuals along the way.</p>\r\n\r\n<p>&nbsp;</p>', 'passion_story/2023/7/Sandeep maheshwari_1688909479.jpg', 1, NULL, 0, 1, 9, NULL, '2023-07-09 13:31:19', '2023-07-09 13:31:19'),
(96, 'PSVI8DMD4V', 'The Passion Story of A R Rahman', '<p>A.R. Rahman, the renowned Indian musician and composer, achieved global recognition for his unique style that blends Indian classical music with contemporary elements. His breakthrough came with the film &quot;Roja&quot; in 1992, leading to a successful career in composing for movies like &quot;Dil Se&quot; and &quot;Slumdog Millionaire,&quot; earning him two Academy Awards.</p>\r\n\r\n<p>Rahman&#39;s soulful melodies and innovative soundscapes have touched millions worldwide. With accolades like Grammy Awards and the Padma Bhushan, he continues to inspire aspiring musicians, showcasing his musical genius and ability to transcend cultural boundaries.</p>\r\n\r\n<p>&nbsp;</p>', 'passion_story/2023/7/AR Rahman_1688909565.jpg', 1, NULL, 0, 1, 9, NULL, '2023-07-09 13:32:45', '2023-07-09 13:32:45'),
(97, 'PSQ7EY4T4N', 'The Passion Story of Kiran Mazumdar Shaw', '<p>Kiran Mazumdar-Shaw is an Indian entrepreneur and the founder of Biocon Limited, a biopharmaceutical company based in Bangalore, India. She started Biocon in 1978 with a vision to develop affordable and accessible medicines.</p>\r\n\r\n<p>She faced numerous challenges in the early years, including limited resources and a male-dominated industry.</p>\r\n\r\n<p>However, she persevered and built Biocon into one of India&#39;s largest biotech companies. Her innovative leadership led to milestones like FDA approval for a biosimilar drug. Mazumdar-Shaw&#39;s success earned her global recognition and awards. She inspires aspiring entrepreneurs, especially women, with her story of determination and innovation in the biotechnology industry.</p>\r\n\r\n<p>&nbsp;</p>', 'passion_story/2023/7/Kiran Mazumdar-Shaw_1688909897.jpg', 1, NULL, 0, 1, 9, NULL, '2023-07-09 13:38:17', '2023-07-09 13:38:17'),
(98, 'PSZNAK9W7O', 'The Passion Story of Priyanka Chopra', '<p>Priyanka Chopra Jonas an acclaimed Indian actress, singer, and producer. She rose to fame after winning the Miss World pageant in 2000 and becoming a leading Bollywood actress. Chopra made her mark in Hollywood as the first South Asian actress to headline an American network drama series, &ldquo;Quantico.&rdquo;</p>\r\n\r\n<p>She showcased her musical talent through collaborations with international artists. Chopra also established her production company and ventured into film production. Her remarkable achievements include awards like the National Film Award and recognition on Time magazine&rsquo;s 100 Most Influential People list.</p>\r\n\r\n<p>&nbsp;</p>', 'passion_story/2023/7/Priyanka Chopra_1688909983.jpg', 1, NULL, 0, 1, 9, NULL, '2023-07-09 13:39:43', '2023-07-09 13:39:43'),
(99, 'PSBOA2Z5H9', 'The Passion Story of Nandan Nilekani', '<p>Nandan Nilekani, co-founder of Infosys, played a pivotal role in driving the company&rsquo;s global success. Known for his visionary leadership, Infosys became a symbol of excellence in the IT sector under his guidance.</p>\r\n\r\n<p>Nandan Nilekani&rsquo;s contributions extend beyond Infosys. He played a crucial role in the development of India&rsquo;s unique identification program, Aadhaar, which provides a biometric-based identification system for Indian citizens. His entrepreneurial spirit and technological expertise have earned him recognition as one of India&rsquo;s prominent technocrats.</p>\r\n\r\n<p>&nbsp;</p>', 'passion_story/2023/7/Nandan Nilekani_1688910171.jpg', 1, NULL, 0, 1, 9, NULL, '2023-07-09 13:42:51', '2023-07-09 13:42:51');

--
-- Triggers `passion_stories`
--
DELIMITER $$
CREATE TRIGGER `unique_passion_story_code_after_insert` BEFORE INSERT ON `passion_stories` FOR EACH ROW BEGIN
                declare ready int default 0;
                declare rnd_str text;
                if(new.code is null or new.code="") then
                   while not ready do
                    set rnd_str := concat("PS",lpad(conv(floor(rand()*pow(36,8)), 10, 36), 8, 0));
                    if not exists (select * from passion_stories where code = rnd_str) then
                      set new.code = rnd_str;
                      set ready := 1;
                    end if;
                   end while;
                end if;
              END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `passion_story_comments`
--

CREATE TABLE `passion_story_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `passion_story_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comments` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) DEFAULT NULL COMMENT '0:Pending;1:Published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `passion_story_views`
--

CREATE TABLE `passion_story_views` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `passion_story_id` int(10) UNSIGNED NOT NULL,
  `ip_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `views` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`, `created_by`, `updated_by`, `deleted_at`) VALUES
(1, 'my_profile_show', 'Show My Profile Details', 'Show My Profile Details', '2022-07-13 16:00:11', '2022-07-14 12:24:57', NULL, 1, NULL),
(2, 'change_password', 'Change Password', 'Change Password', '2022-07-13 16:00:11', '2022-07-14 12:24:18', NULL, 1, NULL),
(3, 'admin_user_create', 'Create New Admin User', 'Create New Admin User', '2022-07-13 16:00:11', '2022-07-14 12:41:04', NULL, 1, NULL),
(4, 'admin_user_list', 'Admin User Listing', 'Admin User Listing', '2022-07-13 16:00:11', '2022-07-14 12:35:18', NULL, 1, NULL),
(5, 'admin_user_update', 'Update Admin User Details', 'Update Admin User Details', '2022-07-13 16:00:11', '2022-07-14 12:39:17', NULL, 1, NULL),
(6, 'admin_user_show', 'Show Admin User Details', 'Show Admin User Details', '2022-07-13 16:00:11', '2022-07-14 12:40:36', NULL, 1, NULL),
(7, 'admin_user_delete', 'Delete Admin User', 'Delete Admin User', '2022-07-13 16:00:11', '2022-07-14 12:40:21', NULL, 1, NULL),
(8, 'admin_user_reset_password', 'Reset Admin User password', 'Reset Admin User Password', '2022-07-13 16:00:11', '2022-07-14 12:46:26', NULL, 1, NULL),
(9, 'role_list', 'Role Listing', 'Role Listing', '2022-07-13 16:00:11', '2022-07-13 16:00:11', NULL, NULL, NULL),
(10, 'role_update', 'Update Role Details', 'Update Role Details', '2022-07-13 16:00:11', '2022-07-13 16:00:11', NULL, NULL, NULL),
(11, 'role_show', 'Show Role Details', 'Show Role Details', '2022-07-13 16:00:11', '2022-07-13 16:00:11', NULL, NULL, NULL),
(12, 'permission_list', 'Permission Listing', 'Permission Listing', '2022-07-13 16:00:11', '2022-07-14 12:31:21', NULL, 1, NULL),
(13, 'permission_update', 'Update Permission Details', 'Update Permission Details', '2022-07-13 16:00:11', '2022-07-14 12:43:21', NULL, 1, NULL),
(14, 'permission_show', 'Show Permission Details', 'Show Permission Details', '2022-07-13 16:00:11', '2022-07-14 12:43:07', NULL, 1, NULL),
(15, 'error_log_show', 'Error Logs Listing', 'Error Logs Listing', '2022-07-13 16:00:11', '2022-07-14 12:33:20', NULL, 1, NULL),
(16, 'dashboard_show', 'Dashboard Listing', 'Dashboard Listing', '2022-07-13 16:00:11', '2022-07-13 16:00:11', NULL, NULL, NULL),
(17, 'admin_user_count', 'Admin User Counts', 'Admin User Counts', '2022-07-13 16:00:11', '2022-07-14 12:39:51', NULL, 1, NULL),
(18, 'role_count', 'Role Counts', 'Role Counts', '2022-07-13 16:00:11', '2022-07-14 12:41:56', NULL, 1, NULL),
(19, 'permission_count', 'Permission Counts', 'Permission Counts', '2022-07-13 16:00:11', '2022-07-14 12:42:54', NULL, 1, NULL),
(20, 'error_logs_count', 'Error Logs Counts', 'Error Logs Counts', '2022-07-13 16:00:11', '2022-07-14 12:44:03', NULL, 1, NULL),
(21, 'notification_list', 'Notification Listing', 'Notification Listing', '2022-07-13 16:00:11', '2022-07-14 12:28:07', NULL, 1, NULL),
(22, 'notification_delete', 'Delete Notification', 'Delete Notification', '2022-07-13 16:00:11', '2022-07-14 12:45:30', NULL, 1, NULL),
(23, 'notification_show', 'Show Notification Details', 'Show Notification Details', '2022-07-13 16:00:11', '2022-07-14 12:45:13', NULL, 1, NULL),
(24, 'notification_clear_all', 'Clear All Notifications', 'Clear All Notifications', '2022-07-13 16:00:11', '2022-07-14 12:44:59', NULL, 1, NULL),
(25, 'notification_count', 'Notification Counts', 'Notification Counts', '2022-07-13 16:00:11', '2022-07-14 12:44:44', NULL, 1, NULL),
(26, 'role_create', 'Create New Role', 'Create New Role', '2022-07-13 16:00:11', '2022-07-14 12:41:35', NULL, 1, NULL),
(27, 'permission_create', 'Create New Permission', 'Create New Permission', '2022-07-13 16:00:11', '2022-07-14 12:42:40', NULL, 1, NULL),
(28, 'mainmenu_create', 'Create New Main Menu', 'Create New Main Menu', '2022-07-13 16:00:11', '2022-07-14 13:24:29', NULL, 1, NULL),
(29, 'mainmenu_list', 'Main Menu Listing', 'Main Menu Listing', '2022-07-13 16:00:11', '2022-07-14 13:24:11', NULL, 1, NULL),
(30, 'mainmenu_update', 'Update Main Menu Details', 'Update Main Menu Details', '2022-07-13 16:00:11', '2022-07-14 13:23:49', NULL, 1, NULL),
(31, 'mainmenu_show', 'Show Main Menu Details', 'Show Main Menu Details', '2022-07-13 16:00:11', '2022-07-14 13:23:32', NULL, 1, NULL),
(32, 'mainmenu_count', 'Main Menu Counts', 'Main Menu Counts', '2022-07-13 16:00:11', '2022-07-14 13:23:00', NULL, 1, NULL),
(33, 'firstlevelmenu_create', 'Create New First Level Menu', 'Create New First Level Menu', '2022-07-13 16:00:11', '2022-07-14 13:28:53', NULL, 1, NULL),
(34, 'firstlevelmenu_list', 'First Level Menu Listing', 'First Level Menu Listing', '2022-07-13 16:00:11', '2022-07-14 13:26:48', NULL, 1, NULL),
(35, 'firstlevelmenu_update', 'Update First Level Menu Details', 'Update First Level Menu Details', '2022-07-13 16:00:11', '2022-07-14 13:26:21', NULL, 1, NULL),
(36, 'firstlevelmenu_show', 'Show First Level Menu Details', 'Show First Level Menu Details', '2022-07-13 16:00:11', '2022-07-14 13:25:47', NULL, 1, NULL),
(37, 'firstlevelmenu_count', 'First Level Menu Counts', 'First Level Menu Counts', '2022-07-13 16:00:11', '2022-07-14 13:25:28', NULL, 1, NULL),
(38, 'secondlevelmenu_create', 'Create New Second Level Menu', 'Create New Second Level Menu', '2022-07-13 16:00:11', '2022-07-14 13:31:19', NULL, 1, NULL),
(39, 'secondlevelmenu_list', 'Second Level Menu Listing', 'Second Level Menu Listing', '2022-07-13 16:00:11', '2022-07-14 13:31:04', NULL, 1, NULL),
(40, 'secondlevelmenu_update', 'Update Second Level Menu Details', 'Update Second Level Menu Details', '2022-07-13 16:00:11', '2022-07-14 13:30:48', NULL, 1, NULL),
(41, 'secondlevelmenu_show', 'Show Second Level Menu Details', 'Show Second Level Menu Details', '2022-07-13 16:00:11', '2022-07-14 13:30:32', NULL, 1, NULL),
(42, 'secondlevelmenu_count', 'Second Level Menu Counts', 'Second Level Menu Counts', '2022-07-13 16:00:11', '2022-07-14 13:29:58', NULL, 1, NULL),
(43, 'mainmenu_priority', 'Main Menu Priority', 'Main Menu Priority', '2022-07-13 16:00:11', '2022-07-14 13:22:41', NULL, 1, NULL),
(44, 'firstlevelmenu_priority', 'First Level Menu Priority', 'First Level Menu Priority', '2022-07-13 16:00:11', '2022-07-14 13:25:03', NULL, 1, NULL),
(45, 'secondlevelmenu_priority', 'Second Level Menu Priority', 'Second Level Menu Priority', '2022-07-13 16:00:11', '2022-07-14 13:29:26', NULL, 1, NULL),
(46, 'web_page_list', 'Web Page Listing', 'Web Page Listing', '2023-03-04 03:07:27', '2023-03-19 05:53:50', 1, 1, NULL),
(47, 'web_page_create', 'Create a new web page', 'Create a new web page', '2023-03-04 03:08:01', '2023-03-19 05:53:35', 1, 1, NULL),
(48, 'web_page_update', 'Update web page details', 'Update web page details', '2023-03-04 03:08:25', '2023-03-19 05:53:20', 1, 1, NULL),
(49, 'web_page_delete', 'Delete a web page', 'Delete a web page', '2023-03-04 03:08:50', '2023-03-19 05:53:05', 1, 1, NULL),
(50, 'web_page_count', 'Web Pages Count', 'Web Pages Count', '2023-03-04 03:31:15', '2023-03-19 05:52:49', 1, 1, NULL),
(51, 'enquiry_list', 'Enquiry Listing', 'Enquiry Listing', '2023-03-04 03:35:50', '2023-03-04 03:35:50', 1, NULL, NULL),
(52, 'enquiry_export', 'Export Enquiries', 'Export Enquiries', '2023-03-04 03:36:24', '2023-03-04 03:36:24', 1, NULL, NULL),
(53, 'enquiry_delete', 'Delete Enquiry', 'Delete Enquiry', '2023-03-04 03:36:49', '2023-03-04 03:36:49', 1, NULL, NULL),
(54, 'enquiry_delete_all', 'Clear All Enquiries', 'Clear All Enquiries', '2023-03-04 03:37:16', '2023-03-04 03:37:16', 1, NULL, NULL),
(55, 'enquiry_show', 'Show Enquiry Details', 'Show Enquiry Details', '2023-03-04 03:37:40', '2023-03-04 03:37:40', 1, NULL, NULL),
(56, 'enquiry_update', 'Reply to enquiry', 'Reply to enquiry', '2023-03-04 03:38:09', '2023-03-04 03:38:09', 1, NULL, NULL),
(57, 'enquiry_count', 'Enquiries Count', 'Enquiries Count', '2023-03-04 04:35:17', '2023-03-04 04:35:17', 1, NULL, NULL),
(58, 'career_list', 'Career Enquiry Listing', 'Career Enquiry Listing', '2023-03-04 07:18:43', '2023-03-04 07:18:43', 1, NULL, NULL),
(59, 'career_export', 'Career Enquiry Export', 'Career Enquiry Export', '2023-03-04 07:19:01', '2023-03-04 07:19:01', 1, NULL, NULL),
(60, 'career_delete', 'Delete Career Enquiry', 'Delete Career Enquiry', '2023-03-04 07:19:22', '2023-03-04 07:19:22', 1, NULL, NULL),
(61, 'career_delete_all', 'Clear All Career Enquiries', 'Clear All Career Enquiries', '2023-03-04 07:19:45', '2023-03-04 07:19:45', 1, NULL, NULL),
(62, 'career_show', 'Show Career Enquiry Details', 'Show Career Enquiry Details', '2023-03-04 07:20:05', '2023-03-04 07:20:05', 1, NULL, NULL),
(63, 'career_update', 'Reply To Career Enquiry', 'Reply To Career Enquiry', '2023-03-04 07:20:37', '2023-03-04 07:20:37', 1, NULL, NULL),
(64, 'career_count', 'Career Enquiries Count', 'Career Enquiries Count', '2023-03-04 07:21:25', '2023-03-04 07:21:25', 1, NULL, NULL),
(65, 'career_preview_resume', 'Preview & Download Resume', 'Preview & Download Resume', '2023-03-04 09:32:57', '2023-03-04 09:32:57', 1, NULL, NULL),
(66, 'passion_list', 'Passion Story Listing', 'Passion Story Listing', '2023-03-04 10:04:02', '2023-05-04 11:35:28', 1, 1, NULL),
(67, 'passion_create', 'Create New Passion Story', 'Create New Passion Story', '2023-03-04 10:04:31', '2023-03-04 10:04:31', 1, NULL, NULL),
(68, 'passion_edit', 'Edit Passion Story', 'Edit Passion Story', '2023-03-04 10:04:51', '2023-03-04 10:04:51', 1, NULL, NULL),
(69, 'passion_delete', 'Delete Passion Story', 'Delete Passion Story', '2023-03-04 10:05:54', '2023-03-04 10:05:54', 1, NULL, NULL),
(70, 'passion_show', 'Show Passion Story', 'Show Passion Story', '2023-03-04 10:07:02', '2023-03-04 10:07:02', 1, NULL, NULL),
(71, 'passion_count', 'Passion Story Counts', 'Passion Story Counts', '2023-03-04 10:07:28', '2023-03-04 10:07:28', 1, NULL, NULL),
(72, 'brand_list', 'Brands Story Listing', 'Brands Story Listing', '2023-03-04 11:06:28', '2023-05-04 11:35:56', 1, 1, NULL),
(73, 'brand_create', 'Create a new brand', 'Create a new brand', '2023-03-04 11:07:00', '2023-03-04 11:07:00', 1, NULL, NULL),
(74, 'brand_edit', 'Edit Brand Details', 'Edit Brand Details', '2023-03-04 11:07:30', '2023-03-04 11:07:30', 1, NULL, NULL),
(75, 'brand_delete', 'Delete Brand Story', 'Delete Brand Story', '2023-03-04 11:08:17', '2023-03-04 11:08:17', 1, NULL, NULL),
(76, 'brand_show', 'Show Brand Details', 'Show Brand Details', '2023-03-04 11:08:46', '2023-03-04 11:08:46', 1, NULL, NULL),
(77, 'brand_count', 'Brands Count', 'Brands Count', '2023-03-04 11:09:10', '2023-03-04 11:09:10', 1, NULL, NULL),
(78, 'blog_list', 'Blogs Listing', 'Blogs Listing', '2023-03-04 11:10:12', '2023-03-04 11:10:12', 1, NULL, NULL),
(79, 'blog_create', 'Create a new blog', 'Create a new blog', '2023-03-04 11:10:34', '2023-03-04 11:10:34', 1, NULL, NULL),
(80, 'blog_edit', 'Edit Blog Details', 'Edit Blog Details', '2023-03-04 11:10:55', '2023-03-04 11:10:55', 1, NULL, NULL),
(81, 'blog_delete', 'Delete Blog', 'Delete Blog', '2023-03-04 11:11:27', '2023-03-04 11:11:27', 1, NULL, NULL),
(82, 'blog_show', 'Show Blog Details', 'Show Blog Details', '2023-03-04 11:11:49', '2023-03-04 11:11:49', 1, NULL, NULL),
(83, 'blog_count', 'Blogs Count', 'Blogs Count', '2023-03-04 11:12:04', '2023-03-04 11:12:04', 1, NULL, NULL),
(84, 'podcast_list', 'Podcast Listing', 'Podcast Listing', '2023-03-04 11:13:01', '2023-04-27 14:19:30', 1, 1, NULL),
(85, 'podcast_create', 'Create a new podcast', 'Create a new podcast', '2023-03-04 11:13:38', '2023-04-27 14:19:54', 1, 1, NULL),
(86, 'podcast_edit', 'Edit Podcast Details', 'Edit Podcast Details', '2023-03-04 11:13:58', '2023-04-27 14:20:14', 1, 1, NULL),
(87, 'podcast_delete', 'Delete Podcast', 'Delete Podcast', '2023-03-04 11:14:16', '2023-04-27 14:20:32', 1, 1, NULL),
(88, 'podcast_show', 'Show Podcast Details', 'Show Podcast Details', '2023-03-04 11:14:35', '2023-04-27 14:20:47', 1, 1, NULL),
(89, 'podcast_count', 'Podcast Count', 'Podcast Count', '2023-03-04 11:14:55', '2023-04-27 14:21:04', 1, 1, NULL),
(90, 'emagazine_subscription_list', 'E-Magazine Subscription Listing', 'E-Magazine Subscription Listing', '2023-03-14 07:51:31', '2023-03-16 03:33:17', 1, 1, NULL),
(91, 'emagazine_subscription_export', 'Export E-Magazine Subscribers', 'Export E-Magazine Subscribers', '2023-03-14 07:51:56', '2023-03-16 03:33:03', 1, 1, NULL),
(92, 'emagazine_subscription_count', 'E-Magazine Subscription Counts', 'E-Magazine Subscription Counts', '2023-03-14 07:52:19', '2023-03-16 03:32:51', 1, 1, NULL),
(93, 'author_list', 'Author Listing', 'Author Listing', '2023-03-15 16:08:02', '2023-03-15 16:08:02', 1, NULL, NULL),
(94, 'author_export', 'Export Author', 'Export Author', '2023-03-15 16:08:26', '2023-03-15 16:08:26', 1, NULL, NULL),
(95, 'author_show', 'Show Author Details', 'Show Author Details', '2023-03-15 16:08:54', '2023-03-15 16:08:54', 1, NULL, NULL),
(96, 'author_count', 'Author Counts', 'Author Counts', '2023-03-15 16:09:15', '2023-03-15 16:09:15', 1, NULL, NULL),
(97, 'author_status_update', 'Update Author Status', 'Update Author Status', '2023-03-15 16:09:43', '2023-03-15 16:09:43', 1, NULL, NULL),
(98, 'emagazine_list', 'E-Magazine Listing', 'E-Magazine Listing', '2023-03-16 03:34:02', '2023-03-16 03:34:02', 1, NULL, NULL),
(99, 'emagazine_create', 'Add New E-Magazine', 'Add New E-Magazine', '2023-03-16 03:34:40', '2023-03-16 03:34:40', 1, NULL, NULL),
(100, 'emagazine_edit', 'Update E-Magazine Details', 'Update E-Magazine Details', '2023-03-16 03:35:05', '2023-03-16 03:35:05', 1, NULL, NULL),
(101, 'emagazine_delete', 'Delete E-Magazine', 'Delete E-Magazine', '2023-03-16 03:35:36', '2023-03-16 03:35:36', 1, NULL, NULL),
(102, 'emagazine_show', 'Show E-Magazine Details', 'Show E-Magazine Details', '2023-03-16 03:36:04', '2023-03-16 03:36:04', 1, NULL, NULL),
(103, 'emagazine_count', 'E-Magazine Counts', 'E-Magazine Counts', '2023-03-16 03:36:30', '2023-03-16 03:36:30', 1, NULL, NULL),
(104, 'notice_list', 'Notice Listing', 'Notice Listing', '2023-03-18 04:29:09', '2023-03-18 04:29:09', 1, NULL, NULL),
(105, 'notice_show', 'Show Notice Details', 'Show Notice Details', '2023-03-18 04:29:39', '2023-03-18 04:29:39', 1, NULL, NULL),
(106, 'notice_create', 'Create New Notice', 'Create New Notice', '2023-03-18 04:30:06', '2023-03-18 04:30:06', 1, NULL, NULL),
(107, 'notice_delete', 'Delete Notice', 'Delete Notice', '2023-03-18 04:30:34', '2023-03-18 04:30:34', 1, NULL, NULL),
(108, 'notice_delete_all', 'Delete All Notices', 'Delete All Notices', '2023-03-18 04:31:03', '2023-03-18 04:31:03', 1, NULL, NULL),
(109, 'notice_count', 'Notice Counts', 'Notice Counts', '2023-03-18 04:31:27', '2023-03-18 04:31:27', 1, NULL, NULL),
(110, 'feedback_list', 'Feedback Listing', 'Feedback Listing', '2023-03-18 07:14:46', '2023-03-18 07:14:46', 1, NULL, NULL),
(111, 'feedback_create', 'Create New Feedback', 'Create New Feedback', '2023-03-18 07:15:11', '2023-03-18 07:15:11', 1, NULL, NULL),
(112, 'feedback_edit', 'Update Feedback Details', 'Update Feedback Details', '2023-03-18 07:15:37', '2023-03-18 07:15:37', 1, NULL, NULL),
(113, 'feedback_delete', 'Delete Feedback', 'Delete Feedback', '2023-03-18 07:16:04', '2023-03-18 07:16:04', 1, NULL, NULL),
(114, 'feedback_show', 'Show Feedback Details', 'Show Feedback Details', '2023-03-18 07:16:25', '2023-03-18 07:16:25', 1, NULL, NULL),
(115, 'feedback_count', 'Feedback Counts', 'Feedback Counts', '2023-03-18 07:16:42', '2023-03-18 07:16:42', 1, NULL, NULL),
(116, 'home_list', 'Home Sliders Listing', 'Home Sliders Listing', '2023-03-19 04:07:37', '2023-03-19 04:07:37', 1, NULL, NULL),
(117, 'home_create', 'Create New Home Slider', 'Create New Home Slider', '2023-03-19 04:08:02', '2023-03-19 04:08:02', 1, NULL, NULL),
(118, 'home_edit', 'Edit Home Slider', 'Edit Home Slider', '2023-03-19 04:08:27', '2023-03-19 04:08:27', 1, NULL, NULL),
(119, 'home_delete', 'Delete Home Slider', 'Delete Home Slider', '2023-03-19 04:08:57', '2023-03-19 04:08:57', 1, NULL, NULL),
(120, 'home_priority', 'Home Slider Priority', 'Home Slider Priority', '2023-03-19 04:09:42', '2023-03-19 04:09:42', 1, NULL, NULL),
(121, 'home_count', 'Home Slider Counts', 'Home Slider Counts', '2023-03-19 04:10:37', '2023-03-19 04:10:37', 1, NULL, NULL),
(122, 'general_edit', 'Edit General Settings', 'Edit General Settings', '2023-03-19 04:11:02', '2023-03-19 04:11:02', 1, NULL, NULL),
(123, 'brand_comments', 'Brand Story Comments', 'Brand Story Comments', '2023-04-26 02:56:34', '2023-04-26 02:56:34', 1, NULL, NULL),
(124, 'passion_comments', 'Passion Story Comments', 'Passion Story Comments', '2023-04-26 02:57:05', '2023-04-26 02:57:05', 1, NULL, NULL),
(125, 'passion_status_update', 'Update Passion Story Status', 'Update Passion Story Status', '2023-04-26 02:57:35', '2023-04-26 02:57:35', 1, NULL, NULL),
(126, 'brand_status_update', 'Update Brand Story Status', 'Update Brand Story Status', '2023-04-26 02:58:00', '2023-04-26 02:58:00', 1, NULL, NULL),
(127, 'blog_comments', 'Blog Comments', 'Blog Comments', '2023-04-26 02:58:35', '2023-04-26 02:58:35', 1, NULL, NULL),
(128, 'blog_status_update', 'Blog Status Update', 'Blog Status Update', '2023-04-26 02:58:59', '2023-04-26 02:58:59', 1, NULL, NULL),
(129, 'blog_comment_status_update', 'Blog Comments Status Update', 'Blog Comments Status Update', '2023-04-26 02:59:47', '2023-04-26 02:59:47', 1, NULL, NULL),
(130, 'brand_comment_status_update', 'Brand Story Comments Status Update', 'Brand Story Comments Status Update', '2023-04-26 03:00:25', '2023-04-26 03:00:25', 1, NULL, NULL),
(131, 'passion_comment_status_update', 'Passion Story Comments Status Update', 'Passion Story Comments Status Update', '2023-04-26 03:00:53', '2023-04-26 03:00:53', 1, NULL, NULL),
(132, 'podcast_application_list', 'Podcast Application Listing', 'Podcast Application Listing', '2023-04-26 03:01:25', '2023-04-26 03:01:25', 1, NULL, NULL),
(133, 'podcast_application_show', 'Show Podcast Application Details', 'Show Podcast Application Details', '2023-04-26 03:01:54', '2023-04-26 03:01:54', 1, NULL, NULL),
(134, 'podcast_application_count', 'Podcast Application Counts', 'Podcast Application Counts', '2023-04-26 03:02:26', '2023-04-26 03:02:26', 1, NULL, NULL),
(135, 'podcast_application_export', 'Export Podcast Applications', 'Export Podcast Applications', '2023-04-26 03:02:52', '2023-04-26 03:02:52', 1, NULL, NULL),
(136, 'podcast_application_status_update', 'Podcast Application Status Update', 'Podcast Application Status Update', '2023-04-26 03:03:22', '2023-04-26 03:03:22', 1, NULL, NULL),
(137, 'passions_list', 'Passion Listing', 'Passion Listing', '2023-05-04 11:32:45', '2023-05-04 11:32:45', 1, NULL, NULL),
(138, 'passions_create', 'Create New Passion', 'Create New Passion', '2023-05-04 11:33:15', '2023-05-04 11:33:15', 1, NULL, NULL),
(139, 'passions_edit', 'Update Passion Details', 'Update Passion Details', '2023-05-04 11:33:39', '2023-05-04 11:33:39', 1, NULL, NULL),
(140, 'passions_counts', 'Passion Counts', 'Passion Counts', '2023-05-04 11:33:58', '2023-05-04 11:33:58', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(11, 1),
(12, 1),
(14, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1),
(67, 1),
(68, 1),
(69, 1),
(70, 1),
(71, 1),
(72, 1),
(73, 1),
(74, 1),
(75, 1),
(76, 1),
(77, 1),
(78, 1),
(79, 1),
(80, 1),
(81, 1),
(82, 1),
(83, 1),
(84, 1),
(85, 1),
(86, 1),
(87, 1),
(88, 1),
(89, 1),
(90, 1),
(91, 1),
(92, 1),
(93, 1),
(94, 1),
(95, 1),
(96, 1),
(97, 1),
(98, 1),
(99, 1),
(100, 1),
(101, 1),
(102, 1),
(103, 1),
(104, 1),
(105, 1),
(106, 1),
(107, 1),
(108, 1),
(109, 1),
(110, 1),
(111, 1),
(112, 1),
(113, 1),
(114, 1),
(115, 1),
(116, 1),
(117, 1),
(118, 1),
(119, 1),
(120, 1),
(121, 1),
(122, 1),
(123, 1),
(124, 1),
(125, 1),
(126, 1),
(127, 1),
(128, 1),
(129, 1),
(130, 1),
(131, 1),
(132, 1),
(133, 1),
(134, 1),
(135, 1),
(136, 1),
(137, 1),
(138, 1),
(139, 1),
(140, 1),
(1, 2),
(2, 2),
(16, 2),
(21, 2),
(22, 2),
(23, 2),
(24, 2),
(25, 2),
(51, 2),
(52, 2),
(53, 2),
(54, 2),
(55, 2),
(56, 2),
(57, 2),
(58, 2),
(59, 2),
(60, 2),
(61, 2),
(62, 2),
(63, 2),
(64, 2),
(66, 2),
(67, 2),
(68, 2),
(69, 2),
(70, 2),
(71, 2),
(72, 2),
(73, 2),
(74, 2),
(75, 2),
(76, 2),
(77, 2),
(78, 2),
(79, 2),
(80, 2),
(81, 2),
(82, 2),
(83, 2),
(90, 2),
(91, 2),
(92, 2),
(95, 2),
(110, 2),
(111, 2),
(112, 2),
(113, 2),
(114, 2),
(115, 2),
(123, 2),
(124, 2),
(125, 2),
(126, 2),
(127, 2),
(128, 2),
(129, 2),
(130, 2),
(131, 2),
(132, 2),
(133, 2),
(134, 2),
(135, 2),
(136, 2),
(1, 3),
(2, 3),
(3, 3),
(4, 3),
(5, 3),
(6, 3),
(7, 3),
(8, 3),
(9, 3),
(10, 3),
(11, 3),
(12, 3),
(13, 3),
(14, 3),
(15, 3),
(16, 3),
(17, 3),
(18, 3),
(19, 3),
(20, 3),
(21, 3),
(22, 3),
(23, 3),
(24, 3),
(25, 3),
(26, 3),
(27, 3),
(28, 3),
(29, 3),
(30, 3),
(31, 3),
(32, 3),
(33, 3),
(34, 3),
(35, 3),
(36, 3),
(37, 3),
(38, 3),
(39, 3),
(40, 3),
(41, 3),
(42, 3),
(43, 3),
(44, 3),
(45, 3),
(46, 3),
(47, 3),
(48, 3),
(49, 3),
(50, 3),
(51, 3),
(52, 3),
(53, 3),
(54, 3),
(55, 3),
(56, 3),
(57, 3),
(58, 3),
(59, 3),
(60, 3),
(61, 3),
(62, 3),
(63, 3),
(64, 3),
(65, 3),
(66, 3),
(67, 3),
(68, 3),
(69, 3),
(70, 3),
(71, 3),
(72, 3),
(73, 3),
(74, 3),
(75, 3),
(76, 3),
(77, 3),
(78, 3),
(79, 3),
(80, 3),
(81, 3),
(82, 3),
(83, 3),
(84, 3),
(85, 3),
(86, 3),
(87, 3),
(88, 3),
(89, 3),
(90, 3),
(91, 3),
(92, 3),
(93, 3),
(94, 3),
(95, 3),
(96, 3),
(97, 3),
(98, 3),
(99, 3),
(100, 3),
(101, 3),
(102, 3),
(103, 3),
(104, 3),
(105, 3),
(106, 3),
(107, 3),
(108, 3),
(109, 3),
(110, 3),
(111, 3),
(112, 3),
(113, 3),
(114, 3),
(115, 3),
(116, 3),
(117, 3),
(118, 3),
(119, 3),
(120, 3),
(121, 3),
(122, 3),
(123, 3),
(124, 3),
(125, 3),
(126, 3),
(127, 3),
(128, 3),
(129, 3),
(130, 3),
(131, 3),
(132, 3),
(133, 3),
(134, 3),
(135, 3),
(136, 3),
(137, 3),
(138, 3),
(139, 3),
(140, 3);

-- --------------------------------------------------------

--
-- Table structure for table `podcasts`
--

CREATE TABLE `podcasts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(64) CHARACTER SET utf8mb4 DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `youtube_url` longtext COLLATE utf8mb4_unicode_ci,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '0:In-Active;1:Active',
  `is_admin` tinyint(4) DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `podcasts`
--

INSERT INTO `podcasts` (`id`, `code`, `title`, `youtube_url`, `status`, `is_admin`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'PCJD8VSH0F', 'Being a Woman Entrepreneurship Journey is Not Easy', 'https://www.youtube.com/embed/-yTPgDQFX04', 1, 1, 8, NULL, '2023-07-01 12:24:12', '2023-07-01 12:24:12'),
(2, 'PCFYEP3PH6', '1st Generation Entrepreneur Build a Successful Startup', 'https://www.youtube.com/embed/jx3ddqfGeHs', 1, 1, 8, NULL, '2023-07-01 12:25:08', '2023-07-01 12:25:08'),
(3, 'PCBZ816JDM', 'Passion To Clarity,How Paritosh Did it?', 'https://www.youtube.com/embed/Zw7JGmWF7-c', 1, 1, 8, NULL, '2023-07-01 12:26:55', '2023-07-01 12:26:55');

--
-- Triggers `podcasts`
--
DELIMITER $$
CREATE TRIGGER `unique_podcast_code_after_insert` BEFORE INSERT ON `podcasts` FOR EACH ROW BEGIN
                declare ready int default 0;
                declare rnd_str text;
                if(new.code is null or new.code="") then
                   while not ready do
                    set rnd_str := concat("PC",lpad(conv(floor(rand()*pow(36,8)), 10, 36), 8, 0));
                    if not exists (select * from podcasts where code = rnd_str) then
                      set new.code = rnd_str;
                      set ready := 1;
                    end if;
                   end while;
                end if;
              END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `podcast_applications`
--

CREATE TABLE `podcast_applications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reason_to_come` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `podcast_date` date NOT NULL,
  `values_for_listeners` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '0:Rejected;1:Accepted;2:Processing',
  `reason` longtext COLLATE utf8mb4_unicode_ci,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Triggers `podcast_applications`
--
DELIMITER $$
CREATE TRIGGER `unique_podcast_application_code_after_insert` BEFORE INSERT ON `podcast_applications` FOR EACH ROW BEGIN
                declare ready int default 0;
                declare rnd_str text;
                if(new.code is null or new.code="") then
                   while not ready do
                    set rnd_str := concat("PC",lpad(conv(floor(rand()*pow(36,8)), 10, 36), 8, 0));
                    if not exists (select * from podcast_applications where code = rnd_str) then
                      set new.code = rnd_str;
                      set ready := 1;
                    end if;
                   end while;
                end if;
              END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 'super_admin', 'Super Admin', 'Super Admin User', '2022-07-13 15:33:47', '2022-07-14 13:39:58', NULL, 1),
(2, 'admin', 'Admin', 'Admin User', '2022-07-13 15:33:47', '2022-07-14 13:42:26', NULL, 1),
(3, 'developer', 'Developer', 'Developer User', '2022-07-13 15:33:47', '2022-07-14 12:00:31', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`role_id`, `user_id`) VALUES
(1, 8),
(2, 9),
(3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `second_level_menus`
--

CREATE TABLE `second_level_menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_level_menu_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '0:in-active,1:active',
  `priority` int(11) DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `second_level_menus`
--

INSERT INTO `second_level_menus` (`id`, `first_level_menu_id`, `name`, `url`, `status`, `priority`, `icon`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 4, 'Main Menus', '/admin/menus/main-menus', 1, 1, 'fas fa-align-justify', 1, 1, '2022-07-14 12:18:59', '2023-03-04 10:01:41'),
(2, 4, 'First Level Menus', '/admin/menus/first-level-menus', 1, 2, 'fas fa-align-left', 1, 1, '2022-07-14 12:19:25', '2023-03-04 10:01:41'),
(3, 4, 'Second Level Menus', '/admin/menus/second-level-menus', 1, 3, 'fas fa-align-right', 1, 1, '2022-07-14 12:20:13', '2023-03-04 10:01:41'),
(4, 13, 'Passion Stories', '/admin/user-stories/passion-stories', 1, 4, 'fas fa-heart', 1, 1, '2023-03-04 09:55:37', '2023-03-04 10:01:41'),
(5, 13, 'Brand Stories', '/admin/user-stories/brand-stories', 1, 5, 'fas fa-bookmark', 1, 1, '2023-03-04 09:56:48', '2023-03-04 11:06:02'),
(6, 13, 'Blogs', '/admin/user-stories/blogs', 1, 6, 'fab fa-blogger-b', 1, 1, '2023-03-04 09:59:26', '2023-03-04 11:09:45'),
(8, 14, 'Subscriptions', '/admin/e-magazine/subscriptions', 1, 10, 'fas fa-user-check', 1, 1, '2023-03-16 03:30:36', '2023-04-26 02:52:35'),
(9, 14, 'Manage E-Magazine', '/admin/e-magazines', 1, 11, 'fas fa-book', 1, 1, '2023-03-16 03:31:03', '2023-04-26 02:52:35'),
(10, 18, 'Home Sliders', '/admin/website-settings/home-sliders', 1, 12, 'fas fa-images', 1, 1, '2023-03-19 04:06:04', '2023-04-26 02:52:35'),
(11, 18, 'General Settings', '/admin/website-settings/general-settings/edit', 1, 14, 'fas fa-cog', 1, 1, '2023-03-19 04:06:31', '2023-04-26 02:52:35'),
(12, 18, 'Web Pages', '/admin/website-settings/web-pages', 1, 13, 'fas fa-desktop', 1, 1, '2023-03-19 05:51:35', '2023-04-26 02:52:35'),
(13, 19, 'Podcast Applications', '/admin/podcast/application', 1, 8, 'fas fa-file-alt', 1, 1, '2023-04-26 02:51:25', '2023-04-26 02:52:35'),
(14, 19, 'Manage Podcast', '/admin/podcasts', 1, 9, 'fas fa-microphone-alt', 1, 1, '2023-04-26 02:51:47', '2023-04-26 02:52:35');

-- --------------------------------------------------------

--
-- Table structure for table `second_level_menu_permissions`
--

CREATE TABLE `second_level_menu_permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `second_level_menu_id` int(10) UNSIGNED NOT NULL,
  `permission_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `second_level_menu_permissions`
--

INSERT INTO `second_level_menu_permissions` (`id`, `second_level_menu_id`, `permission_id`, `created_at`, `updated_at`) VALUES
(1, 1, 43, '2022-07-14 13:22:41', '2022-07-14 13:22:41'),
(2, 1, 32, '2022-07-14 13:23:00', '2022-07-14 13:23:00'),
(3, 1, 31, '2022-07-14 13:23:32', '2022-07-14 13:23:32'),
(4, 1, 30, '2022-07-14 13:23:49', '2022-07-14 13:23:49'),
(5, 1, 29, '2022-07-14 13:24:11', '2022-07-14 13:24:11'),
(6, 1, 28, '2022-07-14 13:24:29', '2022-07-14 13:24:29'),
(7, 2, 44, '2022-07-14 13:25:03', '2022-07-14 13:25:03'),
(8, 2, 37, '2022-07-14 13:25:28', '2022-07-14 13:25:28'),
(9, 2, 36, '2022-07-14 13:25:47', '2022-07-14 13:25:47'),
(10, 2, 35, '2022-07-14 13:26:21', '2022-07-14 13:26:21'),
(11, 2, 34, '2022-07-14 13:26:48', '2022-07-14 13:26:48'),
(12, 2, 33, '2022-07-14 13:28:53', '2022-07-14 13:28:53'),
(13, 3, 45, '2022-07-14 13:29:26', '2022-07-14 13:29:26'),
(14, 3, 42, '2022-07-14 13:29:58', '2022-07-14 13:29:58'),
(15, 3, 41, '2022-07-14 13:30:32', '2022-07-14 13:30:32'),
(16, 3, 40, '2022-07-14 13:30:48', '2022-07-14 13:30:48'),
(17, 3, 39, '2022-07-14 13:31:04', '2022-07-14 13:31:04'),
(18, 3, 38, '2022-07-14 13:31:19', '2022-07-14 13:31:19'),
(19, 4, 66, '2023-03-04 10:04:02', '2023-03-04 10:04:02'),
(20, 4, 67, '2023-03-04 10:04:31', '2023-03-04 10:04:31'),
(21, 4, 68, '2023-03-04 10:04:51', '2023-03-04 10:04:51'),
(22, 4, 69, '2023-03-04 10:05:54', '2023-03-04 10:05:54'),
(23, 4, 70, '2023-03-04 10:07:02', '2023-03-04 10:07:02'),
(24, 4, 71, '2023-03-04 10:07:28', '2023-03-04 10:07:28'),
(25, 5, 72, '2023-03-04 11:06:28', '2023-03-04 11:06:28'),
(26, 5, 73, '2023-03-04 11:07:00', '2023-03-04 11:07:00'),
(27, 5, 74, '2023-03-04 11:07:30', '2023-03-04 11:07:30'),
(28, 5, 75, '2023-03-04 11:08:17', '2023-03-04 11:08:17'),
(29, 5, 76, '2023-03-04 11:08:46', '2023-03-04 11:08:46'),
(30, 5, 77, '2023-03-04 11:09:10', '2023-03-04 11:09:10'),
(31, 6, 78, '2023-03-04 11:10:12', '2023-03-04 11:10:12'),
(32, 6, 79, '2023-03-04 11:10:34', '2023-03-04 11:10:34'),
(33, 6, 80, '2023-03-04 11:10:55', '2023-03-04 11:10:55'),
(34, 6, 81, '2023-03-04 11:11:27', '2023-03-04 11:11:27'),
(35, 6, 82, '2023-03-04 11:11:49', '2023-03-04 11:11:49'),
(36, 6, 83, '2023-03-04 11:12:04', '2023-03-04 11:12:04'),
(43, 8, 92, '2023-03-16 03:32:51', '2023-03-16 03:32:51'),
(44, 8, 91, '2023-03-16 03:33:03', '2023-03-16 03:33:03'),
(45, 8, 90, '2023-03-16 03:33:17', '2023-03-16 03:33:17'),
(46, 9, 98, '2023-03-16 03:34:02', '2023-03-16 03:34:02'),
(47, 9, 99, '2023-03-16 03:34:40', '2023-03-16 03:34:40'),
(48, 9, 101, '2023-03-16 03:35:36', '2023-03-16 03:35:36'),
(49, 9, 102, '2023-03-16 03:36:04', '2023-03-16 03:36:04'),
(50, 9, 103, '2023-03-16 03:36:30', '2023-03-16 03:36:30'),
(51, 10, 116, '2023-03-19 04:07:37', '2023-03-19 04:07:37'),
(52, 10, 119, '2023-03-19 04:08:57', '2023-03-19 04:08:57'),
(53, 10, 120, '2023-03-19 04:09:42', '2023-03-19 04:09:42'),
(54, 10, 121, '2023-03-19 04:10:37', '2023-03-19 04:10:37'),
(55, 11, 122, '2023-03-19 04:11:02', '2023-03-19 04:11:02'),
(56, 12, 50, '2023-03-19 05:52:49', '2023-03-19 05:52:49'),
(57, 12, 49, '2023-03-19 05:53:05', '2023-03-19 05:53:05'),
(58, 12, 48, '2023-03-19 05:53:20', '2023-03-19 05:53:20'),
(59, 12, 47, '2023-03-19 05:53:35', '2023-03-19 05:53:35'),
(60, 12, 46, '2023-03-19 05:53:50', '2023-03-19 05:53:50'),
(61, 5, 123, '2023-04-26 02:56:34', '2023-04-26 02:56:34'),
(62, 4, 124, '2023-04-26 02:57:05', '2023-04-26 02:57:05'),
(63, 4, 125, '2023-04-26 02:57:35', '2023-04-26 02:57:35'),
(64, 5, 126, '2023-04-26 02:58:00', '2023-04-26 02:58:00'),
(65, 6, 127, '2023-04-26 02:58:35', '2023-04-26 02:58:35'),
(66, 6, 128, '2023-04-26 02:58:59', '2023-04-26 02:58:59'),
(67, 6, 129, '2023-04-26 02:59:47', '2023-04-26 02:59:47'),
(68, 5, 130, '2023-04-26 03:00:25', '2023-04-26 03:00:25'),
(69, 4, 131, '2023-04-26 03:00:53', '2023-04-26 03:00:53'),
(70, 13, 132, '2023-04-26 03:01:25', '2023-04-26 03:01:25'),
(71, 13, 133, '2023-04-26 03:01:54', '2023-04-26 03:01:54'),
(72, 13, 134, '2023-04-26 03:02:26', '2023-04-26 03:02:26'),
(73, 13, 135, '2023-04-26 03:02:52', '2023-04-26 03:02:52'),
(74, 13, 136, '2023-04-26 03:03:22', '2023-04-26 03:03:22'),
(75, 14, 84, '2023-04-27 14:19:30', '2023-04-27 14:19:30'),
(76, 14, 85, '2023-04-27 14:19:54', '2023-04-27 14:19:54'),
(77, 14, 86, '2023-04-27 14:20:14', '2023-04-27 14:20:14'),
(78, 14, 87, '2023-04-27 14:20:32', '2023-04-27 14:20:32'),
(79, 14, 88, '2023-04-27 14:20:47', '2023-04-27 14:20:47'),
(80, 14, 89, '2023-04-27 14:21:04', '2023-04-27 14:21:04');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '0:In-Active;1:Active',
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `status`, `created_by`, `updated_by`, `deleted_at`) VALUES
(1, 'Akhilesh Rao P', 'akhileshrao@designwebtech.com', NULL, '$2y$10$PYpbLbGBDrXw1SqZVASOu.pWP.PMkEyWb8AspCWJ1zG1hybfyzAae', 'Yln8wE206lFgwivCyDrP605S4D1IV3bqwTuiDCzGSjm8oetwq5HMgZ3YACED', '2022-07-13 06:07:50', '2023-05-30 11:20:41', 1, NULL, NULL, NULL),
(8, 'Harish', 'harish@areyywah.com', NULL, '$2y$10$MG2CTddzdxWqNyRYHkvOyuK1CxgtKVoxkQ1UwPjgHny9hslvHaTR2', 'nEtG1soyMOu3TfIo24vls1fhgfPp9YknASqqvgZVzazkyp4DItZPpNaYjCED', '2023-05-30 11:25:22', '2023-06-01 03:09:34', 1, 1, NULL, NULL),
(9, 'Mehnaz Nishar', 'mehnaz.alfalahksa@gmail.com', NULL, '$2y$10$2HoxzfPxN681MDvBKUBo8.y4GSb6JlJJIZnbVBesB/MezldfipZ8K', 'LUJTTL6CTPoztmDzRk3gYGmAc6GjXSK6h9UAMrpqHRiRrN5iaOVHaJQmEwSo', '2023-07-01 07:08:58', '2023-07-01 07:08:58', 1, 8, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `web_pages`
--

CREATE TABLE `web_pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '0:In-Active;1:Active',
  `show_on_footer` tinyint(4) NOT NULL DEFAULT '1' COMMENT '0:Invisible, 1:Visible',
  `meta_title` longtext COLLATE utf8mb4_unicode_ci,
  `meta_description` longtext COLLATE utf8mb4_unicode_ci,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `web_pages`
--

INSERT INTO `web_pages` (`id`, `title`, `url`, `description`, `status`, `show_on_footer`, `meta_title`, `meta_description`, `created_by`, `updated_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Community Guidelines', 'community-guidelines', '<p>The ever increasing use of the internet have turned most of the communication in a virtual format. Meetings and connections are now-a-days happening online through various social media platforms. Areyywah is one such platform that allows the Registered Users to &#39;Make Collaborater&#39; with someone who shares similar interests. Hence, for us it becomes necessary that our Registered Users follow a set of community guidelines in which they would abide by the privacy, authenticity, safety and dignity of other users.</p>\r\n\r\n<p>Our community guidelines are in the ever-improving stage which will be amended and notified to our users based on the comments, feedbacks and communication received from them. These inputs are well received and reviewed by the experts in the fields of technology, public safety and human rights. To ensure that everyone&#39;s voice is valued, we take great care to craft policies that are inclusive of different views and beliefs, in particular those of people and communities that might otherwise be overlooked or marginalized.</p>\r\n\r\n<p>Our Community guidelines are a guide for what is and isn&#39;t allowed on Areyywah. It is in the spirit that we ask Registered Members of Areyywah community to follow these guidelines. This present version of Community Guidelines are the most accurate and up-to-date guidelines, and they would be amended as our community grows and they give inputs for the same. All such changes will be notified.</p>\r\n\r\n<hr />\r\n<p>I. VIOLENCE AND INCITEMENT: The Areyywah community is against the use of material, or images that demonstrate violence in any form, sexually explicit material, nudity in any form, etc. The developers or the Areyywah Admin has inherent powers to remove such abusive content in any form or images from the website and database, and hence notify against the wrong behaviour of such Registered Member who has uploaded such content. If such act is repeated by the Registered Member, Areyywah shall block him and delete the account of the Registered Member.</p>\r\n\r\n<p>DO NOT POST:</p>\r\n\r\n<ul>\r\n	<li>Content to create violence</li>\r\n	<li>Content which should affect others&#39; lives</li>\r\n	<li>Content to harm others</li>\r\n	<li>Content that exposes users&#39; identity</li>\r\n	<li>Content with unparliamentarily language</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>Content with any nude data or unwanted images</li>\r\n	<li>Content that harms women and children</li>\r\n	<li>Content that demonstrates/reflects/incites committing/commission of a crime.</li>\r\n	<li>Content against the rules and regulations of government policies.</li>\r\n	<li>Content posted without the person&#39;s permission.</li>\r\n</ul>\r\n\r\n<ol>\r\n</ol>\r\n\r\n<hr />\r\n<p>II. DANGEROUS INDIVIDUALS AND ORGANIZATIONS: Content that should harm people is a punishable offence and membership and facility to make partner cannot be given to individuals and organizations involved in the following:</p>\r\n\r\n<ul>\r\n	<li>Terrorist Activity</li>\r\n	<li>Human Trafficking</li>\r\n	<li>Drug Trafficking</li>\r\n	<li>Homicide</li>\r\n	<li>Arms Trafficking</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>Identity Theft</li>\r\n	<li>Money Laundering</li>\r\n	<li>Assault</li>\r\n	<li>Kidnapping</li>\r\n	<li>Sexual Exploitation</li>\r\n</ul>\r\n\r\n<ol>\r\n</ol>\r\n\r\n<hr />\r\n<p>III. COORDINATING HARM AND PUBLICIZING CRIME: Content to pollute people&#39;s minds to commit any violence is a punishable offence. Content that gives ideas to admit a crime is strictly prohibited and we cannot give any permission to post such unwanted posts.</p>\r\n\r\n<p>DO NOT POST:</p>\r\n\r\n<ol>\r\n	<li>Acts of physical harm against humans including acts of domestic violence except harmed people put defense against committed persons.</li>\r\n	<li>Content to encourage in a bad way to commit crimes.</li>\r\n	<li>Acts of physical harm against animals like hunting, fishing, blast crackers in front of animals, harasses with weapons.</li>\r\n	<li>Acts to hack any electronic system without government permission.</li>\r\n	<li>Vandalism</li>\r\n	<li>Act to buy/sell votes, illegal participation.</li>\r\n	<li>Misrepresentation of census ratings and misguide the companies to commit damage to companies.</li>\r\n	<li>Content having soft information from government organizations like Navy, Air Force, Army, etc.</li>\r\n</ol>\r\n\r\n<hr />\r\n<p>IV. REGULATED GOODS: Areyywah shall best endeavour to prohibit attempts of the manufacturers and retailers to buy/sell any unauthorized products, non-medical drugs, gifts and exchanges to do unwanted things that would result in loss to the government and trustful organization without any rules and regulations. Such cases shall be strictly reported in writing to the executing authority which may result in authorities taking cognizance under the punishable offences of the Indian Penal Code, the Arms Act and other applicable laws to that context.</p>\r\n\r\n<p>DO NOT POST:</p>\r\n\r\n<ol>\r\n	<li>Content that display invitation to offer to buy/sell armed weapons without any government permission.</li>\r\n	<li>Content that display invitation to offer to buy/sell un-prescribed non-medical drugs, the trade of which is banned by the law of the land.</li>\r\n	<li>Content that display invitation to offer to buy/sell goods injurious to health, including but not limited to, alcohol and tobacco products.</li>\r\n	<li>Content that display invitation to offer to buy/sell any valuable articles, piece of art, statues of God, and other materials that would hurt the sentiments of the registered members.</li>\r\n	<li>Content that display invitation to offer to buy/sell illegally body organ to third party.</li>\r\n	<li>Content that display invitation to offer to buy/sell harmful body products and other unregistered and unauthorized cosmetic beauty products.</li>\r\n</ol>\r\n\r\n<hr />\r\n<p>V. FRAUD AND DECEPTION: Content that mislead peoples&#39; minds with false narrative of getting jobs, buying/selling of properties, shortcuts to getting scholarships using fabricated or false documents, quick educational loans, etc. Areyywah always strives to create awareness of any reported frauds on its website.</p>\r\n\r\n<hr />\r\n<p>VI. SUICIDE AND SELF-INJURY: Areyywah promotes good online behaviour of our registered members. The registered members should refrain from posting or publishing online on the website any sensitive information that can become a reason for harassment to anyone and provoke suicide.</p>\r\n\r\n<p>Pictures, image, videos and post that affect the minds of the people and provoke them to commit suicide shall strictly be avoided. In case any of the members is reported to have posted such content, the membership account of the said member shall be deactivated and blocked from the website, and the act shall be reported to the nearest local police station as per the IP address. The data of such blocked member shall be compulsorily be stored by Areyywah till the final disposal of the complaint by the Executive / Judicial Magistrate.</p>\r\n\r\n<hr />\r\n<p>VII. CHILD EXPLOITATION, ABUSE AND NUDITY: Areyywah shall not allow any unwanted images, pictures and information relating to child pornography that pollute the minds of our members. We shall ensure that any such post or information be removed from the website, and reported to the authorities for further action.</p>\r\n\r\n<p>DO NOT POST:</p>\r\n\r\n<ol>\r\n	<li>Sexual images involving child pornography</li>\r\n	<li>Images of Sex toys</li>\r\n	<li>Images displaying Children in stripped clothes</li>\r\n	<li>Seducing images involving children</li>\r\n	<li>Images showing Obscene dresses for children</li>\r\n</ol>\r\n\r\n<hr />\r\n<p>VIII. SEXUAL EXPLOITS OF ADULTS: Areyywah only supports creative content to make their peoples&#39; lives better and do new things not only to support technology but also to protect environment in a good manner. We will not permit any unwanted content to inspire and commit body crimes.</p>\r\n\r\n<p>DO NOT POST:</p>\r\n\r\n<ol>\r\n	<li>Nude videos</li>\r\n	<li>Nude images</li>\r\n	<li>Seductive photos and images</li>\r\n</ol>\r\n\r\n<hr />\r\n<p>IX. BULLYING AND HARRASMENT: Bullying and harassment is very common. We do not promote any activity to bully or harass any registered member of Areyywah. Every user is important and Areyywah gives equal preference to people and don&#39;t permit any bullying and harassment messages and posts.</p>\r\n\r\n<p>DO NOT POST:</p>\r\n\r\n<ol>\r\n	<li>Content that tease the quality, body structure, behaviour, etc. of the registered members.</li>\r\n</ol>\r\n\r\n<hr />\r\n<p>X. CYBERSECURITY: We give utmost respect to the users and their data. We do not mislead any data of users and give good safety and security to our database. We prevent any attempt to hack accounts of our registered members, and protect the data at our level best. We do not sell or disclose private details of the registered members to any third party. This is encompassed in our Privacy Policy in the Data Security.</p>\r\n\r\n<hr />\r\n<p>XI. TRUTH: We know that so many people are using Areyywah to post important and truthful events. Due to this, Areyywah deserves all the rights to remove any content that it may find inappropriate to the users and false in nature.</p>\r\n\r\n<hr />\r\n<p>XII. CHILD SAFETY: Areyywah gives utmost importance to children who are using it. Areyywah strives that the children only see the content which is creative and meaningful.</p>\r\n\r\n<p>POSTS SHOULD COVER THE BELOW MENTIONED POINTS AND BE RELATED TO, BUT NOT LIMITED TO</p>\r\n\r\n<ol>\r\n	<li>Content that promotes skill development for children</li>\r\n	<li>Content that suggests children to enhance their skills</li>\r\n	<li>Content that is inspirational and motivating</li>\r\n	<li>Live videos of Q&amp;A with children and skillful persons</li>\r\n</ol>\r\n\r\n<hr />\r\n<p>XIII. GENUINENESS: Genuineness is the ultimate thing to every application and Areyywah strives to promote only real and genuine content on its website / app. We strongly oppose any false or misleading content that may be harmful to the users at large.</p>\r\n\r\n<p>WE DO NOT ALLOW</p>\r\n\r\n<ol>\r\n	<li>Accounts that may harm sentiments of any community</li>\r\n	<li>Users who violate guidelines</li>\r\n	<li>Accounts using fake credentials to create problem to certain users</li>\r\n	<li>Accounts that breach the present applicable laws and rules laid down by the Government of India.</li>\r\n</ol>\r\n\r\n<hr />\r\n<p>XIV. ADDITIONAL INFORMATION:</p>\r\n\r\n<ol>\r\n	<li>The Areyywah Community is against the use of abusive language in the text form.</li>\r\n	<li>No promotion or uploading of hate/seditious speech shall be entertained by the Areyywah community. It is against the idea of secularism.</li>\r\n	<li>The Registered members must not bully other members&#39; interests and hobbies whether or not they partner with the member.</li>\r\n</ol>\r\n\r\n<hr />\r\n<p>XV. AMENDMENTS TO THE COMMUNITY GUIDELINES: Areyywah deserves full rights to amend the community guidelines as per the changes made in its user interface and registered members&#39; database. The amendments made shall be effective immediately after due notification to the registered users by displaying the same on the website or app of Areyywah. The decision made by the Areyywah to the amendments to the Community Guidelines shall be binding upon all the unregistered members who do not register with Areyywah. It is for the unregistered members to go through the Community Guidelines before posting any content, and for self-verifying that the content so posted is acceptable by the Areyywah community at large.</p>', 1, 1, 'Community Guidelines for Areyywah - Follow Your Passion', 'Areyywah\'s community guidelines ensure privacy, safety, and dignity of users. Get support to pursue your passion and collaborate with like-minded individuals.', 1, 8, NULL, '2023-03-04 03:19:14', '2023-07-16 02:48:32'),
(2, 'Intellectual Property', 'intellectual-property', '<p>Intellectual property (IP) is one of the most valuable assets today. Areyywah has a consistent policy of identification of our intangible assets, and also envisages protection and management of its own IP well, internally and with the users of the Areyywah platform. We also want to respect the IP of others as we develop our Areyywah platform through various products and services.</p>\r\n\r\n<hr />\r\n<p>Applicability</p>\r\n\r\n<p>This IP Policy is applicable to everyone using the Areyywah platform. The Platform also extends its policy to the non-members who are one-time users, or who have simply visited Areyywah platform.</p>\r\n\r\n<hr />\r\n<p>Policies , Procedures, And Records</p>\r\n\r\n<ol>\r\n	<li>Areyywah shall respect intellectual property (IP) of itself and others as well, and manage the Areyywah platform in compliance with the IP-related laws as applicable in the jurisdiction of Republic of India and its agreements with the registered members and non-members.</li>\r\n	<li>Areyywah shall actively protect its own IP.</li>\r\n	<li>Areyywah shall maintain an effective system of IP asset management, including maintaining an inventory and records of IP-related assets and agreements.</li>\r\n	<li>Areyywah shall not knowingly infringe a third party&#39;s intellectual property in its products, services, or components, or disclose or use a third party&#39;s trade secrets without the express or implied consent of the owner or as permitted by law.</li>\r\n	<li>Areyywah shall not knowingly purchase or use counterfeit or other infringing goods and services in running its business, including counterfeit trademark goods or infringing copyright material (such as software, publications, video, audio, or other content).</li>\r\n	<li>Areyywah shall document and maintain written records of all substantial transactions and uses that involve the exercise of IP rights. (This includes, for example, licenses or assignments of rights; manufacture, reproduction or distribution of patented, trademarked or copyrighted items; and disclosure and use of trade secrets.)</li>\r\n	<li>Areyywah shall require, through binding policies or agreements with employees and contractors that its personnel comply with the applicable IP laws and the Areyywah&#39;s IP policies and IP-related provisions in agreements with other companies.</li>\r\n	<li>Areyywah shall develop and implement a management system to help ensure that all personnel follow its IP policies. This management system shall encompass all IP-related policies, procedures and adequate and accurate records necessary to implement, measure, and improve Areyywah&#39;s IP protection and compliance program.</li>\r\n</ol>\r\n\r\n<hr />\r\n<p>IP Compliance Team</p>\r\n\r\n<p>Areyywah&#39;s IP protection and management shall be implemented through a cross-functional compliance team, overseen by the management of Areyywah. The said compliance team may appoint or engage any advocate or expert from within and/or outside the Areyywah to seek their opinion in carrying out their responsibilities as stated under this IP Policy.</p>\r\n\r\n<p>pIn case of any grievance related to the infringement or misuse of IP on the Areyywah platform, the aggrieved person may write to Areyywah on the email id areyywah@gmail.com.</p>\r\n\r\n<hr />\r\n<p>Scope And Quality Of Risk Assessment</p>\r\n\r\n<p>Areyywah shall include in its risk assessment of new products, services, and business opportunities, any relevant IP protection risks.</p>\r\n\r\n<hr />\r\n<p>Management of Business Partners</p>\r\n\r\n<ol>\r\n	<li>Areyywah shall require its business partners to conduct their arrangements with the Areyywah in accordance with Areyywah&#39;s relevant IP protection policies.</li>\r\n	<li>Areyywah shall conduct initial risk assessment and due diligence on all prospective business partners, which shall include an assessment of such companies&#39; IP protection and management.</li>\r\n</ol>\r\n\r\n<hr />\r\n<p>Security And Confidentiality Management</p>\r\n\r\n<ol>\r\n	<li>Areyywah shall maintain physical security designed to effectively protect trade secrets(where applicable) and other confidential information, and IP-related records, masters, tools, inventory and related materials.</li>\r\n	<li>Areyywah shall maintain computer and network security effective for protecting trade secrets, other confidential and proprietary information, and IP related records, and for discouraging violations of Areyywah&#39;s IP policies on the Areyywah&#39;s computers and networks.</li>\r\n	<li>Areyywah and its personnel shall only make trade secrets and other proprietary information available to third parties on a &ldquo;need to know&quot; basis, and subject to Areyywah procedures and written agreements containing adequate confidentiality and other protections.</li>\r\n	<li>Areyywah shall execute written confidential or Non-disclosure agreements with third parties prior to disclosure of any confidential information of the Areyywah to any third party.</li>\r\n	<li>Any IP generated, created or developed by any of the employees/representatives and agents of the Areyywah and/or consultants engaged by the Areyywah, during the term of their employment or engagement as the case may be, for and/or on behalf of the Areyywah, shall be &ldquo;work made for hire&quot; and shall be assigned by such persons to the Areyywah. Further, Areyywah shall have the sole and exclusive ownership to such IP generated, developed or created unless otherwise agreed by the Areyywah by way of a written contract or as may be applicable by the relevant IP law.</li>\r\n</ol>\r\n\r\n<hr />\r\n<p>Training And Capacity Building</p>\r\n\r\n<ol>\r\n	<li>Areyywah shall provide ongoing appropriate level training on IP protection and management to all relevant personnel.</li>\r\n	<li>Areyywah shall provide specialized training to those personnel responsible for the development and implementation of the IP protection, management, and compliance program.</li>\r\n	<li>Areyywah shall provide appropriate level training on IP protection and management for relevant supply chain members.</li>\r\n</ol>\r\n\r\n<hr />\r\n<p>Monitoring And Measurement</p>\r\n\r\n<ol>\r\n	<li>Areyywah shall establish and operate a system to monitor its performance in meeting the Areyywah&#39;s relevant IP policies.</li>\r\n	<li>Areyywah shall incorporate the information gained from the IP compliance team through the monitoring system into the overall evaluation of its departments.</li>\r\n	<li>Corrective Actions And Improvements</li>\r\n	<li>Areyywah shall maintain a system to track and deal with problems in IP protection, management and compliance found through the monitoring process. The tracking system will identify the corrective action to be taken, the timeline, and the responsible party.</li>\r\n	<li>Areyywah shall develop and implement an annual or other regular improvement plan for IP protection, management, and compliance.</li>\r\n	<li>In case of violation/infringement of any IPR such as trademark infringement by any employee/representative or any third party infringing upon the IPR of the Areyywah, the Compliance Team of the Areyywah would first investigate the matter in association with its Advocates and make recommendations to the Director for resolution of such violation/infringement including need for any legal course of action.</li>\r\n</ol>\r\n\r\n<hr />\r\n<p>IP Licensing and Transfer</p>\r\n\r\n<ol>\r\n	<li>The Areyywah may license its IP to any of its Subsidiaries, Affiliates or a third party through various modes of licensing strategy such as: Exclusive licensing, Sole licensing, Non-Exclusive Licensing, Sub-licensing and licensing in general. The Areyywah shall document such IP licensing through a license Agreement where each such license agreement shall define the terms and conditions for the proper use of IP of the Areyywah.</li>\r\n	<li>The Areyywah may transfer its IP to any of its Subsidiaries, Affiliates or a third party (ies) through a signed IP transfer agreement on the conditions as may be deemed to be fit and proper to the Areyywah.</li>\r\n</ol>\r\n\r\n<hr />\r\n<p>Jurisdiction</p>\r\n\r\n<p>This Policy shall be governed by the laws of the Republic of India and the courts at Bangalore, Karnataka shall have the jurisdiction to the same.</p>', 1, 1, 'Intellectual Property Policy - Protecting and Managing Innovation', 'Areyywah\'s Intellectual Property Policy ensures the protection and management of IP assets. Learn more about our commitment to innovation and compliance.', 1, 8, NULL, '2023-03-04 03:23:35', '2023-07-16 02:47:40');
INSERT INTO `web_pages` (`id`, `title`, `url`, `description`, `status`, `show_on_footer`, `meta_title`, `meta_description`, `created_by`, `updated_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(3, 'Terms & Conditions', 'terms-conditions', '<p>These Terms &amp; Conditions (&ldquo;Terms&rdquo;) of (a) use of our website www.areyywah.com (&ldquo;Website&rdquo;), our applications (&ldquo;Application&rdquo;) or any products or services in connection with the Application/, Website/products (&ldquo;Services&rdquo;) or (b) any modes of registrations or usage of products, including through SD cards, tablets or other storage/transmitting device are between Think &amp; Learn Private Limited (&ldquo;Company/We/Us/Our&rdquo;) and its users (&ldquo;User/You/Your&rdquo;).</p>\r\n\r\n<p>These Terms constitute an electronic record in accordance with the provisions of the Information Technology Act, 2000 and the Information Technology (Intermediaries guidelines) Rules, 2011 thereunder, as amended from time to time.</p>\r\n\r\n<p>Please read the Terms and the privacy policy of the Company (&ldquo;Privacy and Data Protection Policy&rdquo;) with respect to registration with us, the use of the Application, Website, Services and products carefully before using the Application, Website, Services or products. In the event of any discrepancy between the Terms and any other policies with respect to the Application or Website or Services or products, the provisions of the Terms shall prevail.</p>\r\n\r\n<p>Your use/access/browsing of the Application or Website or the Services or products or registration (with or without payment/with or without subscription) through any means shall signify Your acceptance of the Terms and Your agreement to be legally bound by the same.</p>\r\n\r\n<p>If you do not agree with the Terms or the Privacy Policy, please do not use the Application or Website or avail the Services or products. Any access to our Services/Application/products through registrations/subscription is non transferable.</p>\r\n\r\n<hr />\r\n<ol>\r\n	<li>Except as mentioned below, all information, content, material, trademarks, services marks, trade names, and trade secrets including but not limited to the software, text, images, graphics, video, script and audio, contained in the Application, Website, Services and products are proprietary property of the Company (&ldquo;Proprietary Information&rdquo;). No Proprietary Information may be copied, downloaded, reproduced, modified, republished, uploaded, posted, transmitted or distributed in any way without obtaining prior written permission from the Company and nothing on this Application or Website or Services shall be or products deemed to confer a license of or any other right, interest or title to or in any of the intellectual property rights belonging to the Company, to the User. You may own the medium on which the information, content or materials resides, but the Company shall at all times retain full and complete title to the information, content or materials and all intellectual property rights inserted by the Company on such medium. Certain contents on the Website may belong to third parties. Such contents have been reproduced after taking prior consent from said party and all rights relating to such content will remain with such third party. Further, you recognize and acknowledge that the ownership of all trademarks, copyright, logos, service marks and other intellectual property owned by any third party shall continue to vest with such party and You are not permitted to use the same without the consent of the respective third party.</li>\r\n	<li>Your use of our products, Website, Application and Services is solely for Your personal and non-commercial use. Any use of the Application, Website, Services or products or their contents other than for personal purposes is prohibited. Your personal and non-commercial use of this Application, Website, products and / or our Services shall be subjected to the following restrictions:\r\n	<ul>\r\n		<li>You may not decompile, reverse engineer, or disassemble the contents of the Application and / or our Website and/or Services/ products or modify, copy, distribute, transmit, display, perform, reproduce, publish, license, create derivative works from, transfer, or sell any information or software obtained from the Application and / or our Website and/or Services/products, or remove any copyright, trademark registration, or other proprietary notices from the contents of the Application and / or and / or our Website and/or Services/products.</li>\r\n		<li>You will not (a) use this Application and / or our Website and/or any of our product/s or Service/s for commercial purposes of any kind, or (b) advertise or sell the Application or any products, Services or domain names or otherwise (whether or not for profit), or solicit others (including, without limitation, solicitations for contributions or donations) or use any public forum for commercial purposes of any kind, or (c) use the Application and / or Website/our products and Services in any way that is unlawful, or harms the Company or any other person or entity as determined by the Company.</li>\r\n		<li>No User shall be permitted to perform any of the following prohibited activities while availing our Services:\r\n		<ul>\r\n			<li>Making available any content that is misleading, unlawful, harmful, threatening, abusive, tortious, defamatory, libelous, vulgar, obscene, child-pornographic, lewd, lascivious, profane, invasive of another&#39;s privacy, hateful, or racially, ethnically or otherwise objectionable;</li>\r\n			<li>Stalking, intimidating and/or harassing another and/or inciting other to commit violence;</li>\r\n			<li>Transmitting material that encourages anyone to commit a criminal offence, that results in civil liability or otherwise breaches any relevant laws, regulations or code of practice;</li>\r\n			<li>Interfering with any other person&#39;s use or enjoyment of the Application/Website/Services;</li>\r\n			<li>Making, transmitting or storing electronic copies of materials protected by copyright without the permission of the owner, committing any act that amounts to the infringement of intellectual property or making available any material that infringes any intellectual property rights or other proprietary rights of anyone else;</li>\r\n			<li>Make available any content or material that You do not have a right to make available under any law or contractual or fiduciary relationship, unless You own or control the rights thereto or have received all necessary consents for such use of the content;</li>\r\n			<li>Impersonate any person or entity, or falsely state or otherwise misrepresent Your affiliation with a person or entity;</li>\r\n			<li>Post, transmit or make available any material that contains viruses, trojan horses, worms, spyware, time bombs, cancelbots, or other computer programming routines, code, files or such other programs that may harm the Application/services, interests or rights of other users or limit the functionality of any computer software, hardware or telecommunications, or that may harvest or collect any data or personal information about other Users without their consent;</li>\r\n			<li>Access or use the Application/Website/Services/products in any manner that could damage, disable, overburden or impair any of the Application&#39;s/Website&#39;s servers or the networks connected to any of the servers on which the Application/Website is hosted;</li>\r\n			<li>Intentionally or unintentionally interfere with or disrupt the services or violate any applicable laws related to the access to or use of the Application/Website/Services/products, violate any requirements, procedures, policies or regulations of networks connected to the Application/Website/Services/products, or engage in any activity prohibited by these Terms;</li>\r\n			<li>Disrupt or interfere with the security of, or otherwise cause harm to, the Application/Website/Services/products, materials, systems resources, or gain unauthorized access to user accounts, passwords, servers or networks connected to or accessible through the Application/Website/Services/products or any affiliated or linked sites;</li>\r\n			<li>Interfere with, or inhibit any user from using and enjoying access to the Application/Website/ Services/products, or other affiliated sites, or engage in disruptive attacks such as denial of service attack on the Application/Website/Services/products;</li>\r\n			<li>Use deep-links, page-scrape, robot, spider or other automatic device, program, algorithm or methodology, or any similar or equivalent manual process, to increase traffic to the Application/Website/Services/products, to access, acquire, copy or monitor any portion of the Application /Website/Services/products, or in any way reproduce or circumvent the navigational structure or presentation of the Application, or any content, to obtain or attempt to obtain any content, documents or information through any means not specifically made available through the Application/ Website/Services/products;</li>\r\n			<li>Alter or modify any part of the Services;</li>\r\n			<li>Use the Services for purposes that are not permitted by: (i) these Terms; and (ii) any applicable law, regulation or generally accepted practices or guidelines in the relevant jurisdiction; or</li>\r\n			<li>Violate any of the terms specified under the Terms for the use of the Application /Website/Services/products.</li>\r\n		</ul>\r\n		</li>\r\n	</ul>\r\n	</li>\r\n	<li>By submitting content on or through the Services (your &ldquo;Material&rdquo;), you grant us a worldwide, non-exclusive, royalty-free license (with the right to sublicense) to use, copy, reproduce, process, adapt, modify, publish, transmit, display and distribute such Material in any and all media or distribution methods (now known or later developed) and to associate your Material with you, except as described below. You agree that others may use Your Material in the same way as any other content available through the Services. Other users of the Services may fork, tweak and repurpose your Material in accordance with these Terms. If you delete your user account your Material and name may remain available through the Services.</li>\r\n	<li>In the preparation of the Application/Website/Services/products and contents therein, every effort has been made to offer the most current, correct, and clearly expressed information possible. Nevertheless, inadvertent errors may occur. In particular, but without limiting anything here, the Company disclaims any responsibility for any errors and accuracy of the information that may be contained in the Application. Any feedback from User is most welcome to make the Application and contents thereof error free and user friendly. Company also reserves the right and discretion to make any changes/corrections or withdraw/add contents at any time without notice. Neither the Company nor any third parties provide any warranty or guarantee as to the accuracy, timeliness, performance, completeness or suitability of the information and materials found or offered on Application/Website/Services/products for any particular purpose. You acknowledge that such information and materials may contain inaccuracies or errors and we expressly exclude liability for any such inaccuracies or errors to the fullest extent permitted by law.</li>\r\n	<li>Our Website provides Users with access to compiled educational information and related sources. Such information is provided on an As Is basis and We assume no liability for the accuracy or completeness or use or non obsolescence of such information. We shall not be liable to update or ensure continuity of such information contained on the Website. We would not be responsible for any errors, which might appear in such information, which is compiled from third party sources or for any unavailability of such information. From time to time the Website may also include links to other websites. These links are provided for your convenience to provide further information. They do not signify that we endorse the website(s). We have no responsibility for the content of the linked website(s). You may not create a link to the Website from another website or document without the Company&#39;s prior written consent.</li>\r\n	<li>The contents of the Application/Services/products are developed on the concepts covered in the structured curriculum syllabus prescribed for students of various courses. The usage of the Application/Services/products is not endorsed as a substitution to the curriculum based education provided by the educational institutions but is intended to supplement the same by explaining and presenting the concepts in a manner enabling easy understanding. The basic definitions and formulae of the subject matter would remain the same. The Company acknowledges that there are various means of delivering structured curriculum pedagogy and inclusion of methods in the Application/Services/products does not imply endorsement of any particular method nor exclusion imply disapproval. Subscription to the Application or usage of our Services/Website/products does not in any manner guarantee admission to any educational institutions or passing of any exams or achievement of any specified percentage of marks in any examinations.</li>\r\n	<li>Certain contents in the Application/Services/Website/products (in particular relating to assistance in preparations for administrative services) may contain opinions and views. The Company shall not be responsible for such opinions or any claims resulting from them. Further, the Company makes no warranties or representations whatsoever regarding the quality, content, completeness, or adequacy of such information and data.</li>\r\n	<li>Some parts of the Services are interactive, and we encourage contributions by Users, which may or may not be subject to editorial control prior to being posted. The Company accepts no responsibility or liability for any material communicated by third parties in this way. The Company reserves the right at its sole discretion to remove, review, edit or delete any content. Similarly, We will not be responsible or liable for any content uploaded by Users directly on the Website, irrespective of whether We have certified any answer uploaded by the User. We would not be responsible to verify whether such questions/answers or contents placed by any User contain infringing materials or not.</li>\r\n	<li>The Company (including but not limited to its subsidiaries/affiliates) may, based on any form of access to the Application (including free download/trials) or Services or Website or registrations through any source whatsoever, contact the User through sms, email and call, to give information about their offerings and products as well as notifications on various important updates and/or to seek permission for demonstration of its products. The User expressly grants such permission to contact him/her through telephone, SMS, e-mail and holds the Company (including but not limited to its subsidiaries/affiliates) indemnified against any liabilities including financial penalties, damages, expenses in case the User&#39;s mobile number is registered with Do not Call (DNC) database. By registering yourself, you agree to make your contact details available to Our employees, associates, subsidiaries,affiliates and partners so that you may be contacted for education information, offerings and promotions through telephone, SMS, email etc.</li>\r\n	<li>While the Company may, based on the User&#39;s confirmation, facilitate the demonstration of its products at the location sought by the User, the User acknowledges that he/she has not been induced by any statements or representations of any person with respect to the quality or conditions of the products and that User has relied solely on the investigations, examinations and inspections as the User has chosen to make and that the Company has afforded the User the opportunity for full and complete investigations, examinations and inspections.</li>\r\n	<li>Upon registration through any means whatsoever, the Company may contact You through the registered mobile number or e-mail or any other mobile number or contact number or email provided by You to enable effective provision of Services. The User expressly permits the Company to contact him/her and the student utilising the Services, through the above mentioned means at any time post registration. .-. Further, the Company shall have the right to monitor the download and usage of the Application/Services/products and the contents thereof by the User/student, to analyze such usage and discuss the same with the User/student to enable effective and efficient usage of the Services. The User expressly permits the Company to clear the doubts of the student using the Application/Services/online portal by answering the questions placed before it, providing study plans, informing of the progress, providing feedback, communicating with the student and mentoring the student through telephone or e-mail on express consent of the legal guardian/parent of the User or through any other forum.</li>\r\n	<li>While the Company has made efforts to train the personnel engaged in the sales and services relating to its products to enable quality control, it makes no warranties or representations whatsoever regarding the quality and competence of such personnel and would not be responsible for any deviant behavior of any such personnel. Any feedback from User relating to the same is most welcome and the Company reserves the right and discretion to take any action in this regard.</li>\r\n	<li>Access to certain elements of the Services including doubt clearance, mentoring services etc may be subject to separate terms, conditions and fair usage policy. The Company reserves the right to determine the criteria for provision of various elements of Services to the different categories of Users based on its policies. Hence, subscription to the Application/products or registrations do not automatically entitle the User to any and all elements of Services provided by the Company and the Company shall be entitled to exercise its discretion while providing access to and determining continuity of certain elements of Services. We reserve the right to extend, cancel, discontinue, prematurely withdraw or modify any of Our Services at Our discretion.</li>\r\n	<li>The Company&#39;s products and / or Services, including the Application and content, are compatible only with certain devices/tablets/instruments/hardware. The Company shall not be obligated to provide workable products and / or services for any instruments that are not recognized by the Company or those instruments that may be purchased from any third party which are not compatible with the Company&#39;s products and ServicesThe company reserves the right to upgrade the table/ type of compatible devices as required from time to time.</li>\r\n	<li>The Company shall have no responsibility for any loss or damage caused to the tablet or any other hardware and / or software and/or instrument, including loss of data or effect on the processing speed, resulting from Your use of our products and Services.</li>\r\n	<li>You have to specify the address to which the shipment has to be made at the time of purchase. All product(s) shall be delivered directly to the address as specified at the point of ordering and You cannot, under any circumstances whatsoever, change the address after the order is processed. In case of any change in the address, You need to specify the same to us in writing well in advance to the shipping date. Any inconsistencies in name or address will result in non-delivery of the product(s).</li>\r\n	<li>\r\n	<ul>\r\n		<li>For return of product(s) damaged at the time of delivery, the shipping charges shall be borne by the Company. However, for return of any of the product(s) for any other reasons, it shall be the responsibility of the User to arrange for the return of such canceled product(s) and the shipping charges shall be borne by such User.</li>\r\n		<li>We request You not to accept any product package that seems to be tampered with, opened or damaged at the time of delivery. The products must be returned in the same condition as delivered by the Company. Any products returned showing signs of any use or damage in any manner shall not be accepted for return.</li>\r\n		<li>All requests for return of products have to be placed within 15 (fifteen) days from the date of delivery. Please note that no refunds shall be claimed or will be entertained post 15 (fifteen) days from the date of delivery.</li>\r\n	</ul>\r\n	</li>\r\n	<li>You acknowledge that the Company is not the manufacturer of the instrument/medium/hardware and hence, any defect relating to the same shall be reported to the manufacturer whose details shall be specified on the packaging and the Company shall not be in any manner responsible for the same. The Company does not provide any guarantee or warranty relating to the instrument/medium/hardware.</li>\r\n	<li>IIn order to access the Services and to avail the use of the Application/products, You shall be required to register yourself with the Application/Services/products, and maintain an account with the Application/Services/products. You will be required to furnish certain information and details, including Your name, mobile number, e-mail address, residential address, grade/class of the student, school name, payment information (credit/debit card details) if required, and any other information deemed necessary by the Application. With respect to the provision of information, the following may be noted:-\r\n	<ul>\r\n		<li>It is Your sole responsibility to ensure that the account information provided by You is accurate, complete and latest.</li>\r\n		<li>You shall be responsible for maintaining the confidentiality of the account information and for all activities that occur under Your account. You agree to<br />\r\n		<strong>(a)</strong> ensure that You successfully log out from Your account at the end of each session; and<br />\r\n		<strong>(b)</strong> immediately notify the Company of any unauthorized use of Your account. If there is reason to believe that there is likely to be a breach of security or misuse of Your account, we may request You to change the password or we may suspend Your account without any liability to the Company, for such period of time as we deem appropriate in the circumstances. We shall not be liable for any</li>\r\n		<li>You acknowledge that Your ability to use Your account is dependent upon external factors such as internet service providers and internet network availability and the Company cannot guarantee accessibility to the Application at all times. In addition to the disclaimers set forth in the Terms, the Company shall not be liable to You for any damages arising from Your inability to log into Your account and access the services of the Application at any time.</li>\r\n	</ul>\r\n	</li>\r\n	<li>Persons who are &quot;competent/capable&quot; of contracting within the meaning of the Indian Contract Act, 1872 shall be eligible to register for the Application and all Our products or Services. Persons who are minors, un-discharged insolvents etc. are not eligible to register for Our products or Services. As a minor if You wish to use Our products or Services, such use shall be made available to You by Your legal guardian or parents, who has agreed to these Terms. In the event a minor utilizes the Application/Website/Services, it is assumed that he/she has obtained the consent of the legal guardian or parents and such use is made available by the legal guardian or parents. The Company will not be responsible for any consequence that arises as a result of misuse of any kind of Our Application or any of Our products or Services that may occur by virtue of any person including a minor registering for the Services/products provided. By using the products or Services You warrant that all the data provided by You is accurate and complete and that the student using the Application has obtained the consent of parent/legal guardian (in case of minors). The Company reserves the right to terminate Your subscription and / or refuse to provide You with access to the products or Services if it is discovered that You are under the age of 18 (eighteen) years and the consent to use the products or Services is not made by Your parent/legal guardian or any information provided by You is inaccurate. You acknowledge that the Company does not have the responsibility to ensure that You conform to the aforesaid eligibility criteria. It shall be Your sole responsibility to ensure that You meet the required qualification. Any persons under the age of 18 (eighteen) should seek the consent of their parents/legal guardians before providing any Information about themselves or their parents and other family members on the Application.</li>\r\n	<li>You agree to defend, indemnify and hold harmless the Company, its officers, directors, employees and agents, from and against any and all claims, damages, obligations, losses, liabilities, costs or debt, and expenses (including but not limited to attorney&#39;s fees) arising from: (i) Your use of and access of the Application/Website/Services; (ii) Your violation of any term of these Terms or any other policy of the Company; (iii) Your violation of any third party right, including without limitation, any copyright, property, or privacy right; or (iv) any claim that Your use of the Application/Website/Services has caused damage to a third party. This defense and indemnification obligation will survive these Terms.</li>\r\n	<li>In no event shall the Company, its officers, directors, employees, partners or agents be liable to You or any third party for any special, incidental, indirect, consequential or punitive damages whatsoever, including those resulting from loss of use, data or profits or any other claim arising out, of or in connection with, Your use of, or access to, the Application.</li>\r\n	<li>In the event of Your breach of these Terms, You agree that the Company will be irreparably harmed and may not have an adequate remedy in money or damages. The Company therefore, shall be entitled in such event to obtain an injunction against such a breach from any court of competent jurisdiction. The Company&#39;s right to obtain such relief shall not limit its right to obtain other remedies.</li>\r\n	<li>Any violation by You of the terms of this Clause may result in immediate suspension or termination of Your Accounts apart from any legal remedy that the Company can avail. In such instances, the Company may also disclose Your Account Information if required by any Governmental or legal authority. You understand that the violation of these Terms could also result in civil or criminal liability under applicable laws.</li>\r\n	<li>The Terms shall be governed by and construed in accordance with the laws of India, without regard to conflict of law principles. Further, the Terms shall be subject to the exclusive jurisdiction of the competent courts located in Bangalore and You hereby accede to and accept the jurisdiction of such courts.</li>\r\n	<li>The Company has the right to change, modify, suspend, or discontinue and/or eliminate any aspect(s), features or functionality of the Application or the Services as it deems fit at any time without notice. Further, the Company has the right to amend these Terms from time to time without prior notice to you. The Company makes no commitment, express or implied, to maintain or continue any aspect of the Application. You agree that the Company shall not be liable to You or any third party for any modification, suspension or discontinuance of the Application/Services. All prices are subject to change without notice</li>\r\n	<li><strong>DISCLAIMER:</strong> THIS WEBSITE, THE APPLICATION AND THE SERVICES ARE PROVIDED ON AN &quot;AS IS&quot; BASIS WITH ALL FAULTS AND WITHOUT ANY WARRANTY OF ANY KIND. THE COMPANY HEREBY DISCLAIMS ALL WARRANTIES AND CONDITIONS WITH REGARD TO THE WEBSITE, APPLICATION/PRODUCTS AND THE SERVICES, INCLUDING WITHOUT LIMITATION, ALL IMPLIED WARRANTIES AND CONDITIONS OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, TITLE, ACCURACY, TIMELINESS. PERFORMANCE, COMPLETENESS, SUITABILITY AND NON-INFRINGEMENT. ADDITIONALLY, THE COMPANY SHALL NOT BE LIABLE FOR ANY DAMAGES ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SITE, OR THE APPLICATION OR THE SERVICES. YOUR USE OF ANY INFORMATION OR MATERIALS ON THIS WEBSITE/APPLICATION/SERVICES/PRODUCTS IS ENTIRELY AT YOUR OWN RISK, FOR WHICH WE SHALL NOT BE LIABLE. IT SHALL BE YOUR OWN RESPONSIBILITY TO ENSURE THAT SERVICES PROVIDED BY US MEET YOUR SPECIFIC REQUIREMENTS.</li>\r\n	<li><strong>General Provisions:</strong>\r\n	<ul>\r\n		<li>Notice: All notices served by the Company shall be provided via email to Your account or as a general notification on the Application. Any notice to be provided to the Company should be sent to info@areyywah.com</li>\r\n		<li>Entire Agreement: The Terms, along with the Privacy Policy, and any other guidelines made applicable to the Application from time to time, constitute the entire agreement between the Company and You with respect to Your access to or use of the Application, Website and the Services thereof.</li>\r\n		<li>Assignment: You cannot assign or otherwise transfer Your obligations under the Terms, or any right granted hereunder to any third party. The Company&#39;s rights under the Terms are freely transferable by the Company to any third parties without the requirement of seeking Your consent.</li>\r\n		<li>Severability: If, for any reason, a court of competent jurisdiction finds any provision of the Terms, or portion thereof, to be unenforceable, that provision shall be enforced to the maximum extent permissible so as to give effect to the intent of the parties as reflected by that provision, and the remainder of the Terms shall continue in full force and effect.</li>\r\n		<li>Waiver: Any failure by the Company to enforce or exercise any provision of the Terms, or any related right, shall not constitute a waiver by the Company of that provision or right.</li>\r\n		<li>Relationship: You acknowledge that Your participation on the Application, does not make You an employee or agency or partnership or joint venture or franchise of the Company.</li>\r\n		<li>The Company provides these Terms so that You are aware of the terms that apply to your use of the Website/Application and Services. You acknowledge that the Company has given You a reasonable opportunity to review these Terms and that You have agreed to them.</li>\r\n	</ul>\r\n	</li>\r\n	<li><strong>Feedback:</strong>\r\n	<ul>\r\n		<li>Any feedback You provide with respect to the Application shall be deemed to be non-confidential. The Application shall be free to use such information on an unrestricted basis. Further, by submitting the feedback, You represent and warrant that (i) Your feedback does not contain confidential or proprietary information of You or of third parties; (ii) the Company is not under any obligation of confidentiality, express or implied, with respect to the feedback; (iii) the Application may have something similar to the feedback already under consideration or in development; and (iv) You are not entitled to any compensation or reimbursement of any kind from the Company for the feedback under any circumstances, unless specified.</li>\r\n		<li>Under no circumstances shall the Company be held responsible in any manner for any content provided by other users even if such content is offensive, hurtful or offensive. Please exercise caution while accessing the Application.</li>\r\n	</ul>\r\n	</li>\r\n	<li><strong>Customer Care:</strong> We make all best endeavors to provide You with a pleasant experience. In the unlikely event that You face any issues, please contact us at info@areyywah.com.</li>\r\n</ol>', 1, 1, 'Areyywah Terms & Conditions - Follow Your Passion Legally', 'Read and understand the Terms & Conditions of Areyywah. Protect your passion while using our platform and accessing our services.', 1, 8, NULL, '2023-03-04 03:25:01', '2023-07-16 02:47:16'),
(4, 'Privacy Policy', 'Privacy-Policy', '<p>Welcome to Areyywah. We understand that online privacy is important to the users of our website, especially when connecting socially. This statement governs our privacy policies with respect to those users of the Site (&ldquo;Visitors&rdquo;) who visit without transacting business, or registering themselves on our site, and Visitors who register on our site to socially connect with people and transact business on the Site and make use of the various services offered by Areyywah.com (collectively, &ldquo;Services&rdquo;) (&ldquo;Registered Members&rdquo;).</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>1. &ldquo;Personally Identifiable Information&rdquo;</strong></p>\r\n\r\n<p>Refers to any information that identifies or can be used to identify, contact, or locate the person to whom such information pertains, including, but not limited to, name, address, phone number, fax number, email address, financial profiles, social security number, and credit card information. Personally, Identifiable Information does not include information that is collected anonymously (that is, without identification of the individual user) or demographic information not connected to an identified individual.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>2. What Personally Identifiable Information is collected?</strong></p>\r\n\r\n<p>We may collect basic user profile information from all of our Visitors. We collect the following additional information from our Registered Members: the names, addresses, phone numbers, and email addresses, the nature and size of the work or profession that is being carried out by the Registered Member, and the images and photos uploaded by them.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>3. What organizations are collecting the information?</strong></p>\r\n\r\n<p>While we collect direct information from our registered members, no part of the data is being shared with any third party vendors till now. The vendors responsible for developing the website and user interface have used dummy data and have manufactured random data for them to use it during the time of development of the site. However, while in the developing stage, we may require our developers to access the Registered Members&rsquo; data that may be accessed by our developers to provide you better services in terms of social connectivity. We do not control how the developers use such information, but we do ask them to disclose how they use personal information provided to them from Visitors and Registered Members. No part of your data is stored separately with the developers, and the developers do have an obligation to not store, retain, or use the information given to them.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>4. How does the Site use Personally Identifiable Information?</strong></p>\r\n\r\n<p>We use Personally Identifiable Information to customize the Site, make appropriate offerings, and fulfill connection requests on the Site. We may email Visitors and Registered Members about research or purchase and selling opportunities on the Site or information related to the subject matter of the Site. We may also use Personally Identifiable Information to contact Visitors and Registered Members in response to specific inquiries or to provide requested information.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>5. To whom may the information be shared?</strong></p>\r\n\r\n<p>Our site is used for socially connecting with people online. The Registered Members who make Partners with the other Registered Members on the site will be able to see the Personally Identifiable Information about the Partnered Registered Members. may be shared with other Authorized Customers who wish to evaluate potential transactions with other Authorized Customers. We may share aggregated information about our Visitors, including the demographics of our Visitors and Authorized Customers, with our affiliated agencies, developers and third-party vendors. We also offer the opportunity to &ldquo;opt-out&rdquo; of receiving information or being contacted by us or by any agency acting on our behalf.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>6. How is Personally Identifiable Information stored?</strong></p>\r\n\r\n<p>Personally Identifiable Information collected by Areyywah is securely stored and is not accessible to third parties or employees of Areyywah except for use as indicated above.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>7. What choices are available to Visitors regarding the collection, use, and distribution of the information?</strong></p>\r\n\r\n<p>Visitors and Registered Members may opt-out of receiving unsolicited information from or being contacted by us and/or our vendors and affiliated agencies by responding to emails as instructed, or by contacting us.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>8. Cookies</strong></p>\r\n\r\n<p>A cookie is a string of information that a website stores on a visitor&rsquo;s computer, and that the visitor&rsquo;s browser provides to the website each time the visitor returns.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>(a) Are Cookies Used on the Site?</strong></p>\r\n\r\n<p>Cookies are used for a variety of reasons. We use Cookies to obtain information about the preferences of our Visitors and the services they select. We also use Cookies for security purposes to protect our Registered Members. For example, if a Registered Member is logged on and the site is unused for more than 10 minutes, we will automatically log the Registered Member off. Visitors who do not wish to have cookies placed on their computers should set their browsers to refuse the cookies before using the link: [https://areyywah.com/admin_work/home/login], with the drawback that certain features of the website may not function properly without the aid of cookies.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>(b) Cookies used by our service providers</strong></p>\r\n\r\n<p>Our service providers use cookies and those cookies may be stored on your computer when you visit our website. You can find more details about which cookies are used on our cookies info page.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>9. How does Areeywah use login information?</strong></p>\r\n\r\n<p>Areyywah uses login information, including, but not limited to, IP addresses, ISPs, and browser types, to analyze trends, administer the Site, track a user&rsquo;s movement and use, and gather broad demographic information.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>10. How does the Site keep Personally Identifiable Information secure?</strong></p>\r\n\r\n<p>All of our employees are familiar with our security policy and practices. The Personally Identifiable Information of our Visitors and Registered Member is only accessible to a limited number of qualified employees who are given a password in order to gain access to the information. We audit our security systems and processes on a regular basis. Sensitive information, such as credit card numbers or social security numbers, is protected by encryption protocols, in place to protect information sent over the Internet. While we take commercially reasonable measures to maintain a secure site, electronic communications and databases are subject to errors, tampering, and break-ins, and we cannot guarantee or warrant that such events will not take place and we will not be liable to Visitors or Registered Member for any such occurrences.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>11. How can Visitors correct any inaccuracies in Personally Identifiable Information?</strong></p>\r\n\r\n<p>Visitors and Registered Members can edit their Personally Identifiable Information through the &lsquo;Edit Profile&rsquo; option available under the &ldquo;Profile&rdquo; page once the Registered Member has signed in. If the Registered Member faces any difficulty in updating the Personally Identifiable Information about them or to correct any inaccuracies they may contact us through email.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>12. Can a Visitor delete or deactivate Personally Identifiable Information collected by the Site?</strong></p>\r\n\r\n<p>We provide Visitors and Registered Members with a mechanism to deactivate the Registered Member Profile from the Site by clicking on the option &ldquo;Deactivate My Account&rdquo; in the Settings Page in own Profile. However, because of backups and records of deletions, it may be impossible to delete a Visitor&rsquo;s and the Registered Members&rsquo; entry without retaining some residual information. An individual who requests to have Personally Identifiable Information deactivated will have this information functionally deleted. We are still discussing the Right to Privacy judgement which encompasses the Right to Forget. So we are going to introduce the option to &ldquo;Delete Profile&rdquo; which will erase all the material and Personal Identifiable Information from our database.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>13. Your rights</strong></p>\r\n\r\n<p>These are summarized rights that you have under the data protection law</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong>The right to access</strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong>The right to rectification</strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong>The right to erasure</strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong>The right to restrict processing</strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong>The right to object to processing</strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong>The right to data portability</strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong>The right to complain to a supervisory authority</strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong>The right to withdraw consent</strong></p>\r\n	</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>14. What happens if the Privacy Policy Changes?</strong></p>\r\n\r\n<p>We will let our Visitors and Registered Members know about changes to our privacy policy by posting such changes on the Site. However, if we are changing our privacy policy in a manner that might cause disclosure of Personally Identifiable Information that a Visitor or Registered Member has previously requested not be disclosed, we will contact such Visitor or Registered Member to allow such Visitor or Registered Member to prevent such disclosure.</p>\r\n\r\n<p><strong>We encourage our &lsquo;Visitors&rsquo; and &lsquo;Registered Members&rsquo; to read the privacy policy statements.</strong></p>', 1, 1, NULL, NULL, 8, 8, NULL, '2023-07-15 06:44:51', '2023-07-16 02:46:54');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `authors_mobile_number_unique` (`mobile_number`),
  ADD UNIQUE KEY `authors_email_unique` (`email`),
  ADD UNIQUE KEY `authors_code_unique` (`code`);

--
-- Indexes for table `author_status_histories`
--
ALTER TABLE `author_status_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `blogs_title_unique` (`title`);

--
-- Indexes for table `blog_comments`
--
ALTER TABLE `blog_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_views`
--
ALTER TABLE `blog_views`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brand_stories`
--
ALTER TABLE `brand_stories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `brand_stories_full_name_unique` (`full_name`);

--
-- Indexes for table `brand_story_comments`
--
ALTER TABLE `brand_story_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brand_story_views`
--
ALTER TABLE `brand_story_views`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `careers`
--
ALTER TABLE `careers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `careers_code_unique` (`code`);

--
-- Indexes for table `career_histories`
--
ALTER TABLE `career_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emagazines`
--
ALTER TABLE `emagazines`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `emagazines_title_unique` (`title`);

--
-- Indexes for table `emagazine_subscriptions`
--
ALTER TABLE `emagazine_subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `emagazine_subscriptions_email_unique` (`email`);

--
-- Indexes for table `enquiries`
--
ALTER TABLE `enquiries`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `enquiries_code_unique` (`code`);

--
-- Indexes for table `enquiry_histories`
--
ALTER TABLE `enquiry_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feedbacks`
--
ALTER TABLE `feedbacks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `feedbacks_full_name_unique` (`full_name`);

--
-- Indexes for table `first_level_menus`
--
ALTER TABLE `first_level_menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `first_level_menu_permissions`
--
ALTER TABLE `first_level_menu_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `general_settings`
--
ALTER TABLE `general_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `home_sliders`
--
ALTER TABLE `home_sliders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `home_sliders_name_unique` (`name`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `main_menus`
--
ALTER TABLE `main_menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `main_menu_permissions`
--
ALTER TABLE `main_menu_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notices`
--
ALTER TABLE `notices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notice_authors`
--
ALTER TABLE `notice_authors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification_users`
--
ALTER TABLE `notification_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `passions`
--
ALTER TABLE `passions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `passions_name_unique` (`name`);

--
-- Indexes for table `passion_stories`
--
ALTER TABLE `passion_stories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `passion_stories_full_name_unique` (`full_name`);

--
-- Indexes for table `passion_story_comments`
--
ALTER TABLE `passion_story_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `passion_story_views`
--
ALTER TABLE `passion_story_views`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_unique` (`name`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_role_id_foreign` (`role_id`);

--
-- Indexes for table `podcasts`
--
ALTER TABLE `podcasts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `podcasts_title_unique` (`title`);

--
-- Indexes for table `podcast_applications`
--
ALTER TABLE `podcast_applications`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `podcast_applications_code_unique` (`code`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `role_user_role_id_foreign` (`role_id`);

--
-- Indexes for table `second_level_menus`
--
ALTER TABLE `second_level_menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `second_level_menu_permissions`
--
ALTER TABLE `second_level_menu_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `web_pages`
--
ALTER TABLE `web_pages`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `authors`
--
ALTER TABLE `authors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `author_status_histories`
--
ALTER TABLE `author_status_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `blog_comments`
--
ALTER TABLE `blog_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `blog_views`
--
ALTER TABLE `blog_views`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `brand_stories`
--
ALTER TABLE `brand_stories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `brand_story_comments`
--
ALTER TABLE `brand_story_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `brand_story_views`
--
ALTER TABLE `brand_story_views`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=194;

--
-- AUTO_INCREMENT for table `careers`
--
ALTER TABLE `careers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `career_histories`
--
ALTER TABLE `career_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `emagazines`
--
ALTER TABLE `emagazines`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `emagazine_subscriptions`
--
ALTER TABLE `emagazine_subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `enquiries`
--
ALTER TABLE `enquiries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `enquiry_histories`
--
ALTER TABLE `enquiry_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `feedbacks`
--
ALTER TABLE `feedbacks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `first_level_menus`
--
ALTER TABLE `first_level_menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `first_level_menu_permissions`
--
ALTER TABLE `first_level_menu_permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=144;

--
-- AUTO_INCREMENT for table `general_settings`
--
ALTER TABLE `general_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `home_sliders`
--
ALTER TABLE `home_sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `main_menus`
--
ALTER TABLE `main_menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `main_menu_permissions`
--
ALTER TABLE `main_menu_permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=140;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `notices`
--
ALTER TABLE `notices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notice_authors`
--
ALTER TABLE `notice_authors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notification_users`
--
ALTER TABLE `notification_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `passions`
--
ALTER TABLE `passions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT for table `passion_stories`
--
ALTER TABLE `passion_stories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

--
-- AUTO_INCREMENT for table `passion_story_comments`
--
ALTER TABLE `passion_story_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `passion_story_views`
--
ALTER TABLE `passion_story_views`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=141;

--
-- AUTO_INCREMENT for table `podcasts`
--
ALTER TABLE `podcasts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `podcast_applications`
--
ALTER TABLE `podcast_applications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `second_level_menus`
--
ALTER TABLE `second_level_menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `second_level_menu_permissions`
--
ALTER TABLE `second_level_menu_permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `web_pages`
--
ALTER TABLE `web_pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
