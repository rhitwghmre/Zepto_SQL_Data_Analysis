<h1><b>🛒 DATA ANALYTICS PROJECT – ZEPTO INVENTORY ANALYSIS (SQL)</b></h1>
<p><b>From Raw Inventory Data to Actionable Business Insights using PostgreSQL</b></p>

<hr>

<h2><b>Executive Summary</b></h2>
<p>
This project presents a complete, end-to-end SQL-based data analytics workflow built on a real-world inventory dataset inspired by Zepto, one of India’s fastest-growing quick-commerce platforms.
</p>
<p>
The objective of this project is to simulate how data analysts in retail and e-commerce organizations explore raw catalog data, clean inconsistencies, and generate meaningful business insights related to pricing, inventory, discounts, and revenue optimization using SQL.
</p>

<hr>

<h2><b>Business Problem</b></h2>
<p>
E-commerce platforms manage thousands of SKUs across multiple categories, package sizes, and pricing structures. Raw inventory data often contains inconsistencies such as invalid pricing, duplicate product entries, stock availability issues, and unstructured weight and quantity formats.
</p>
<p>
Without proper data cleaning and structured analysis, businesses struggle to:
</p>
<ul>
  <li>Understand pricing inefficiencies</li>
  <li>Identify revenue leakage due to stock-outs</li>
  <li>Evaluate discount strategies</li>
  <li>Optimize inventory and product assortment</li>
</ul>

<hr>

<h2><b>Project Objectives</b></h2>
<ul>
  <li>Design a structured PostgreSQL database for an e-commerce inventory system</li>
  <li>Perform exploratory data analysis (EDA) using SQL</li>
  <li>Clean and standardize messy real-world data</li>
  <li>Answer business-driven analytical questions using SQL</li>
  <li>Demonstrate job-ready SQL skills for data analyst roles</li>
</ul>

<hr>

<h2><b>Dataset Overview</b></h2>
<p>
Each row in the dataset represents a unique SKU (Stock Keeping Unit). Duplicate product names exist because the same product may appear in different package sizes, weights, discounts, or categories — a common scenario in real e-commerce catalogs.
</p>

<p><b>Key Columns</b></p>
<ul>
  <li><b>sku_id</b> – Unique identifier for each product (Primary Key)</li>
  <li><b>name</b> – Product name as displayed on the app</li>
  <li><b>Category</b> – Product category (Fruits, Snacks, Beverages, etc.)</li>
  <li><b>mrp</b> – Maximum Retail Price (₹)</li>
  <li><b>discountPercent</b> – Discount percentage applied</li>
  <li><b>discountedSellingPrice</b> – Final selling price after discount (₹)</li>
  <li><b>availableQuantity</b> – Units available in inventory</li>
  <li><b>weightInGms</b> – Product weight in grams</li>
  <li><b>outOfStock</b> – Stock availability flag (TRUE / FALSE)</li>
  <li><b>quantity</b> – Number of units per package</li>
</ul>

<hr>

<h2><b>Methodology</b></h2>
<ol>
  <li>Designed a PostgreSQL table with appropriate data types and constraints</li>
  <li>Imported raw CSV data and resolved encoding issues</li>
  <li>Performed exploratory data analysis (EDA) to understand data distribution</li>
  <li>Identified and removed invalid pricing records</li>
  <li>Standardized pricing values for analytical consistency</li>
  <li>Executed business-focused SQL queries to extract insights</li>
</ol>

<hr>

<h2><b>SQL Skills Demonstrated</b></h2>

<p><b>Core SQL Concepts</b></p>
<ul>
  <li>Filtering, sorting, and grouping data</li>
  <li>Aggregate functions (SUM, AVG, COUNT)</li>
  <li>CASE WHEN logic for categorization</li>
  <li>Business metric calculations</li>
</ul>

<p><b>Analytical SQL</b></p>
<ul>
  <li>Revenue estimation by category</li>
  <li>Discount analysis and ranking</li>
  <li>Inventory availability analysis</li>
  <li>Price-per-unit and value-for-money evaluation</li>
</ul>

<hr>

<h2><b>Key Business Insights</b></h2>
<ul>
  <li>Identified top-value products offering the highest discounts</li>
  <li>Detected high-MRP products that are unavailable due to stock-outs</li>
  <li>Estimated potential revenue contribution by product category</li>
  <li>Highlighted categories with aggressive discounting strategies</li>
  <li>Segmented products based on weight for inventory planning</li>
  <li>Calculated total inventory weight by category</li>
</ul>

<hr>

<h2><b>Results & Business Impact</b></h2>
<p>
This analysis enables business stakeholders to:
</p>
<ul>
  <li>Improve pricing and discount strategies</li>
  <li>Reduce revenue loss caused by out-of-stock products</li>
  <li>Optimize inventory distribution across categories</li>
  <li>Identify value-for-money products for promotions</li>
</ul>

<hr>

<h2><b>How to Run the Project</b></h2>
<ol>
  <li>Clone the repository</li>
  <li>Create a PostgreSQL database</li>
  <li>Run the SQL file to create tables</li>
  <li>Import the dataset (ensure UTF-8 encoding)</li>
  <li>Execute the SQL queries for analysis</li>
</ol>

<hr>

<h2><b>Next Steps</b></h2>
<ol>
  <li>Integrate the dataset with Power BI or Tableau</li>
  <li>Create automated data refresh pipelines</li>
  <li>Apply window functions for advanced analytics</li>
  <li>Extend analysis to customer behavior and demand forecasting</li>
</ol>

<hr>

