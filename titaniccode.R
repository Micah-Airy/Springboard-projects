write.csv(titanic3, "titanic_original.csv")

titanic_original

titanic_original$embarked %>% replace_na("S") -> testdf
view(testdf)

df <- titanic_original

df$age[is.na(df$age)] <- mean(df$age, na.rm=TRUE)


df$boat <- replace_na("None")

df <- df %>% mutate(has_cabin_number = if_else(cabin=="",0,1,))

df$has_cabin_number[is.na(df$has_cabin_number)] <- 0


titanic_clean <- df

write.csv(titanic_clean, "titanic_complete.csv")
