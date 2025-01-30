# Load necessary libraries
library(tidyverse)

# Set working directory
setwd("C:/Users/sanuz/Desktop/RM1BDEEM/U3/")

# Import CSV files into tibbles
customers <- read_csv("customers.csv", show_col_types = FALSE)
reviews <- read_csv("reviews.csv", show_col_types = FALSE)

# Merge datasets
merged_data <- left_join(reviews, customers, by = "CustomerID")

# Display merged data
print(merged_data)

# Plot bar chart of reviews by country
ggplot(merged_data, aes(x = ResCountry, fill = ResCountry)) +
  geom_bar() +
  labs(title = "Number of Reviews by Country", x = "Country", y = "Count") +
  theme_minimal()

# Count reviews by country
country_counts <- merged_data %>%
  group_by(ResCountry) %>%
  summarise(count = n())

# Print country count results
print(country_counts)

# Plot number of reviews by country
ggplot(country_counts, aes(x = ResCountry, y = count)) +
  geom_bar(stat = "identity", fill = "skyblue") +
  labs(title = "Number of Reviews by Country", x = "Country", y = "Count") +
  theme_minimal()

# Histogram of review scores
ggplot(merged_data, aes(x = Review)) +
  geom_histogram(fill = "#C0C0C0", color = "black") +
  labs(title = "Distribution of Review Scores", x = "Review Score", y = "Frequency") +
  theme_minimal()

# Filter reviews containing the word "interface"
interface_reviews <- merged_data %>%
  filter(str_detect(Comment, "interface"))

# Print filtered data
print(interface_reviews)

# Histogram for reviews mentioning "interface"
ggplot(interface_reviews, aes(x = Review)) +
  geom_histogram(binwidth = 5, fill = "lightblue", color = "black") +
  labs(title = "Distribution of Reviews Containing 'Interface'", x = "Review Score", y = "Frequency") +
  theme_minimal()

# Scatter plot: Age vs. Review Score
ggplot(merged_data, aes(x = Age, y = Review)) +
  geom_point(color = "blue", alpha = 0.6) +
  labs(title = "Relationship between Age and Review Score", x = "Age", y = "Review Score") +
  theme_minimal()

# Create Age Groups and calculate mean review score
age_grouped_data <- merged_data %>%
  mutate(AgeGroup = case_when(
    Age >= 18 & Age <= 24 ~ "18-24",
    Age >= 25 & Age <= 34 ~ "25-34",
    Age >= 35 & Age <= 44 ~ "35-44",
    Age >= 45 & Age <= 54 ~ "45-54",
    Age >= 55 & Age <= 64 ~ "55-64",
    Age >= 65 ~ "65+",
    TRUE ~ "Unknown"
  )) %>%
  group_by(AgeGroup) %>%
  summarise(MeanReviewScore = mean(Review, na.rm = TRUE))

# Plot mean review score by age group
ggplot(age_grouped_data, aes(x = AgeGroup, y = MeanReviewScore)) +
  geom_point(color = "blue") +
  geom_line(group = 1, color = "red") +
  labs(title = "Mean Review Score by Age Group", x = "Age Group", y = "Mean Review Score") +
  theme_minimal()
