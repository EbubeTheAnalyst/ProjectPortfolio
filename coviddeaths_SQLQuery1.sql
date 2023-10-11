Select *
from CovidDeaths
where continent is NOT NULL
order by 3,4

Select *
from CovidVacinations
order by 3,4

select location, date, total_cases, new_cases, total_deaths, population
from CovidDeaths
order by 1,2

--case to death ratio in nigeria

select location, date, total_cases, total_deaths, (Cast (total_cases as integer)/cast (total_deaths as integer)) as CasetoDeathRatio
from CovidDeaths
where location = 'Nigeria'
order by 1,2

--Total cases vs Population

select location, date, population, total_cases, (total_cases/population)*100 as InfectionRate
from CovidDeaths
where location = 'Nigeria'
Order by 1,2

--Highest Infection Rate Worldwide

select location, population, MAX(cast(total_cases as int)) as HighestInfectionCount, MAX((cast(total_cases as int)/population)*100) as InfectionRate
from CovidDeaths
--where location like '%igeria'
Group By Location, population 
Order by 1,2 Desc

--Highest Death Count 

select location, MAX(Cast(total_deaths as int)) as TotalDeathCount
from CovidDeaths
where location = 'Nigeria'
Group By Location, population 
Order by TotalDeathCount desc


select location, MAX(Cast(total_deaths as int)) as TotalDeathCount
from CovidDeaths
--where location like '%igeria'
where continent is NULL
Group By location
Order by TotalDeathCount desc

select date, SUM(new_cases), SUM(new_deaths)--, total_deaths, (Cast (total_deaths as integer)/cast (total_cases as integer))*100 as DeathPercentage
from CovidDeaths
--where location like '%igeria'
where continent is not null
group by date
order by 1,2

Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
from CovidDeaths dea
join CovidVacinations vac
on dea.location = vac.location and dea.date = vac.date
where dea.continent is not null
order by 2,3