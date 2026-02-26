# ===============================
# Kaggle EDA Project (RStudio)
# FIFA Player Market Value Dataset
# ===============================

# Load libraries
library(tidyverse)
library(DataExplorer)

# Load dataset
data <- read_csv("C:/Users/MUHAMAD ANIQ/Downloads/archive/fifa_player_performance_market_value.csv")

# -------------------------------
# 1. Exploratory Data Analysis
# -------------------------------

# Preview data
head(data)

# Structure of dataset
glimpse(data)

# Summary statistics
summary(data)

# Check missing values
colSums(is.na(data))

# -------------------------------
# 2. Data Cleaning
# -------------------------------

# Remove duplicate rows
data <- distinct(data)

# Convert categorical variables to factors
data$injury_prone <- as.factor(data$injury_prone)
data$transfer_risk_level <- as.factor(data$transfer_risk_level)
data$position <- as.factor(data$position)
data$nationality <- as.factor(data$nationality)
data$club <- as.factor(data$club)

# -------------------------------
# 3. Data Visualisation
# -------------------------------

# Histogram: Age distribution
ggplot(data, aes(x = age)) +
  geom_histogram(bins = 30, fill = "skyblue", color = "black")
ggsave("plots/age_histogram.png")

# Bar chart: Players by position
ggplot(data, aes(x = position)) +
  geom_bar(fill = "orange") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
ggsave("plots/position_bar_chart.png")

# Scatter plot: Rating vs Market Value
ggplot(data, aes(x = overall_rating, y = market_value_million_eur)) +
  geom_point(color = "red")
ggsave("plots/rating_vs_market_value.png")

# -------------------------------
# 4. Automatic EDA Report
# -------------------------------
create_report(data)

install.packages("writexl")
library(writexl)
write_xlsx(data, "data/cleaned_fifa_players.xlsx")

