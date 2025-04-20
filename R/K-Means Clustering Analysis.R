# ===============================================================
# K-Means Clustering on Regional Sales Data
# Author: Brian Mwenda
# Assessment Task: DENACO Analytics – Data Science Technical Mentor
# Description:
# Perform k-means clustering to group regions based on quantity sold
# and revenue. Visualize the clusters and derive insights for 
# targeted marketing strategies.
# ===============================================================

# -------------------------------
# 1. Load Required Libraries
# -------------------------------
library(ggplot2)
library(dplyr)

# -------------------------------
# 2. Set Working Directory
# -------------------------------
# (Adjust this path as needed if running elsewhere)
setwd("C:/Users/brian/Downloads/R")

# -------------------------------
# 3. Load Dataset
# -------------------------------
data <- read.csv("regional_sales_data.csv")

# View structure of the data
str(data)

# -------------------------------
# 4. Clean and Prepare the Data
# -------------------------------
# Remove any missing values
data <- na.omit(data)

# -------------------------------
# 5. Normalize the Numeric Features
# -------------------------------
data_norm <- data %>%
  select(Quantity, Revenue) %>%
  scale()

# -------------------------------
# 6. Perform K-Means Clustering
# -------------------------------
set.seed(123)  # For reproducibility
kmeans_result <- kmeans(data_norm, centers = 3, nstart = 25)

# Add cluster assignments to the original dataset
data$Cluster <- as.factor(kmeans_result$cluster)

# -------------------------------
# 7. Visualize the Clusters
# -------------------------------
ggplot(data, aes(x = Quantity, y = Revenue, color = Cluster)) +
  geom_point(size = 3, alpha = 0.8) +
  theme_minimal() +
  labs(
    title = "K-Means Clustering of Regional Sales Data",
    x = "Quantity Sold",
    y = "Revenue",
    color = "Cluster"
  )

