/*****************************************
تحليل البيانات المالية والاقتصادية باستخدام ستاتا
د.رمضان مفتاح الفيتوري
ramfaitori@mail.com
******************************************/

*open file wage1.dta
list wage educ exper tenure female married lwage tenursq in 1/5

*open file prminwge.dta
list year avgmin avgwage in 1/5

*open file hprice3.dta
list year price rooms baths lprice y81 in 178/183

*open file wagepan.dta
list nr year agric exper

clear all

sysuse auto2, clear

tab rep78
tab rep78, miss
tabulate rep78, missing
histogram rep78, discrete frequency
graph pie, over(rep78) plabel(_all percent)
summarize price
summarize price, d
mean price
mean price, level(99)
tabstat price, stats(mean sd range var count)
tabstat price, stats(mean sd range var count) by(rep78)
summarize price rep78
tab rep78, nolabel
tab1 rep78 foreign
tab rep78 foreign, sum(mpg)
histogram mpg, frequency
graph box mpg
summarize mpg, d
graph box mpg, by(foreign)

clear all
sysuse nlsw88, clear
pwcorr tenure hours collgrad wage, star(5)
ttest wage, by(collgrad)
tab race, sum(wage)
anova wage race
pwcompare race, pveffects
tab union collgrad, col chi2