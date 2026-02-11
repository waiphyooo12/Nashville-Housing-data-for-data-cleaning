🏡 Nashville Housing Data Cleaning Project (SQL)
📌 Project Overview

This project focuses on cleaning and preparing a real estate dataset using SQL. The dataset contains housing transaction records from Nashville, and the goal is to transform raw, messy data into a clean, structured, and analysis-ready format.

The project demonstrates practical data cleaning, transformation, and quality improvement techniques commonly used in real-world data analytics and data engineering workflows.

🎯 Objectives

Standardize inconsistent date formats

Handle missing values effectively

Split complex address fields into structured columns

Normalize categorical values

Identify and remove duplicate records

Drop unnecessary columns to optimize the dataset

🛠 Skills & Techniques Used

SQL data cleaning

Data transformation

String manipulation

Joins & self-joins

Common Table Expressions (CTEs)

Window functions

Duplicate detection & removal

Schema modification

🔄 Data Cleaning Workflow
1. Standardizing Date Format

Converted sale date values into a consistent date format to ensure reliable time-based analysis.

2. Handling Missing Property Addresses

Used self-joins based on Parcel ID to populate missing property addresses from matching records.

3. Splitting Address Fields

Separated combined address fields into:

Street Address

City

This improves readability, filtering, and analysis.

4. Splitting Owner Address

Extracted:

Owner Street

Owner City

Owner State

to allow better geographical and ownership analysis.

5. Normalizing Categorical Values

Standardized values in the Sold As Vacant column into consistent YES / NO values to improve data consistency.

6. Removing Duplicate Records

Identified duplicate transactions using:

Parcel ID

Legal Reference

Sale Date

Sale Price

Property Address

and removed redundant rows while keeping the most reliable record.

7. Dropping Unnecessary Columns

Removed unused columns after transformation to improve dataset clarity and efficiency.

📊 Final Outcome

Cleaned, standardized, and structured dataset

Improved data quality

Optimized schema for analysis

Ready for visualization, reporting, and modeling

🚀 Why This Project Matters

This project demonstrates end-to-end SQL data cleaning, which is a critical skill for:

Data Analysts

Data Engineers

Business Intelligence Developers

It reflects real-world data preparation workflows, making it ideal for portfolio and job applications.

🧠 What I Learned

Advanced SQL transformation techniques

Handling messy real-world datasets

Using window functions to detect duplicates

Designing clean and analysis-friendly schemas

📁 Dataset

Nashville Housing Dataset – public real estate transaction data.
