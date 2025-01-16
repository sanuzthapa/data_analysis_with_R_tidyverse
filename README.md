# Hi 👋, I'm THAPA Sanuz  
### Student of Behavioral Economics at UFC, Besançon  

---

## 🔭 About the Project  

This project is designed for the analysis of **Customer and Review Data** using **Tidyverse in R**.  

### Methodology:
- Filtering and validating data  
- Cleaning data  
- Combining and creating relationships between datasets  
- Data visualization and manipulation  
- Interactive dashboard design  
- Advanced data manipulation techniques  

---

## Easy Navigation  

### Analysis of Age Groups and Review Scores  

### Table of Contents  
- [Introduction](#introduction)  
- [Data Preparation](#data-preparation)  
- [Count vs Country](#count-vs-country)  
- [Histogram of Review Scores](#histogram-of-review-scores)  
- [Keyword Filtering: "Interface"](#keyword-filtering-interface)  
- [Distribution of Reviews](#distribution-of-reviews)  
- [Relationship Between Age and Reviews](#relationship-between-age-and-reviews)  
- [Mean Review vs Age Group](#mean-review-vs-age-group)  
- [Conclusion](#conclusion)  

---

## Introduction  

This exercise focuses on analyzing customer reviews using graphical representations to extract meaningful insights. Two datasets are provided:  

### 1. `customers.csv`  
Contains details about all potential reviewers of the app:  
- **CustomerID**: Unique identifier for customers  
- **Gender**: Declared gender ("male", "female", or "other")  
- **Age**: Age in years  
- **ResCountry**: Country of residence  

### 2. `reviews.csv`  
Contains app reviews posted between January 1 and June 30, 2023:  
- **CustomerID**: Matches with `customers.csv`  
- **ReviewDate**: Date of the review  
- **Review**: Score (0–100) indicating recommendation level  
- **Favorite**: Favorite feature (from preselected options)  
- **Comment**: General comment left by the customer  

---

## Data Preparation  

![Dashboard Overview](https://github.com/sanuzthapa/data_analysis_with_R_tidyverse/blob/main/img/1intro.png)  

---

## Count vs Country  

```r
ggplot(data = country_counts, aes(x = ResCountry, y = count)) +
  geom_bar(stat = "identity", fill = "skyblue") +
  labs(x = "Country", y = "Count", title = "Number of Reviews by Country") +
  theme_minimal()
```  

![Count vs Country](https://github.com/sanuzthapa/data_analysis_with_R_tidyverse/blob/main/img/bycountry.png)  

---

## Histogram of Review Scores  

```r
plot = ggplot(data = data, aes(x = Review))
plot + geom_histogram(fill="#C0C0C0", color="black")
```  

![Histogram](https://github.com/sanuzthapa/data_analysis_with_R_tidyverse/blob/main/img/img3.png)  

---

## Keyword Filtering: "Interface"  

```r
filteringInterface = data %>%
  filter(str_detect(Comment,"interface"))

print(filteringInterface)
```  

![Keyword Filtering](https://github.com/sanuzthapa/data_analysis_with_R_tidyverse/blob/main/img/img4.png)  

---

## Distribution of Reviews  

```r
data %>%
  filter(str_detect(Comment, "interface")) %>%
  ggplot(aes(x = Review)) +
  geom_histogram(binwidth = 5, fill = "lightblue", color = "black") +
  labs(title = "Distribution of Reviews",
       x = "Review Score",
       y = "Frequency") +
  theme_minimal()
```  

![Distribution of Reviews](https://github.com/sanuzthapa/data_analysis_with_R_tidyverse/blob/main/img/img5.png)  

---

## Relationship Between Age and Reviews  

```r
ggplot(data = data, aes(x = Age, y = Review)) +
  geom_point(color = "blue", alpha = 0.6) +
  labs(x = "Age", y = "Review Score", title = "Relationship between Age and Review Score") +
  theme_minimal()
```  

![Age vs Review](https://github.com/sanuzthapa/data_analysis_with_R_tidyverse/blob/main/img/img6.png)  

---

## Mean Review vs Age Group  

```r
data %>%
  mutate(AgeGroup = case_when(
    Age >= 18 & Age <= 24 ~ "18-24",
    Age >= 25 & Age <= 34 ~ "25-34",
    Age >= 35 & Age <= 44 ~ "35-44",
    Age >= 45 & Age <= 54 ~ "45-54",
    Age >= 55 & Age <= 64 ~ "55-64",
    Age >= 65 ~ "65+"
  )) %>%
  group_by(AgeGroup) %>%
  summarise(mean_review = mean(Review)) %>%
  ggplot(aes(x = AgeGroup, y = mean_review)) +
  geom_point(color = "blue") +
  geom_line(group = 1, color = "red") +
  labs(title = "Mean Review Score by Age Group",
       x = "Age Group",
       y = "Mean Review Score") +
  theme_minimal()
```  

![Mean Review vs Age Group](https://github.com/sanuzthapa/data_analysis_with_R_tidyverse/blob/main/img/img7.png)  

---

## Conclusion  

Summarizes findings and insights from the analysis.  

---

### 💬 Connect with Me  
- 📫 **Email**: [sanuzh.thapa@gmail.com](mailto:sanus.thapa@gmail.com)  
- 🌐 **LinkedIn**: [Sanuz Thapa](https://linkedin.com/in/sanuz-thapa)  

---

### 🛠️ Languages and Tools  
- **R** (Tidyverse, ggplot2)  
- **Markdown** for reporting  
