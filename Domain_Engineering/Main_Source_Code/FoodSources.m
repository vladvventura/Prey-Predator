%================================================================
%        Prey-Predator Simulation Family Member Generator
%================================================================
%
% Name of File: FoodSources.m
%
% Description: This is an auto-generated file generated by
%   PreyPredatorFamilyGenerator.exe AML compiler & composer.
%   
%   Contains algorithms to process the food sources inputs for
%   the prey-predator populations simulation.
%
% Copyright:
%  This software is open source and reuseable by anyone within
%  the organization.
%================================================================
classdef FoodSources
    properties
        f; %size of food
        %similar to SpeciesPopulations, this needs to have an updated
        %food to update AFTER all calculations are made.
        updatedFoods;
        gr; %array of growth rate for food
        FM; %array of foods' growth multipliers
        feeds=[]; %array of species that feeds on this food source.
        numMeals=[]; %array corresponding to feeds for a species' number of meals
        %on this food source. For example, if feeds(1) is rabbit
        %nummeals(1) is the number of times the rabbit eats this food
        %source.
        S; %scaling factor.
        season; %season as a character sequence char('')
        seasonNum; %season number
        weeks=0; %numofWeeks that have passed;
        
        
    end
    
    methods
        function food = FoodSources(initialSize, growthRate, foodMult, feeds, numMeals, S, season)
            food.f = initialSize;
            food.gr = growthRate;
            food.FM = foodMult;
            food.feeds = feeds;
            food.numMeals = numMeals;
            food.S = S;
            food.season = season;
            switch season
                case char('Winter')
                    food.seasonNum=4;
                case char('Spring')
                    food.seasonNum=1;
                case char('Summer')
                    food.seasonNum=2;
                case char ('Fall')
                    food.seasonNum=3;
                otherwise
                    food.seasonNum=1;
            end
        end
        function outputf = getf()
            outputf = food.f;
        end
        function calculateUpdate(time)
            %factor in season:
            switch food.seasonNum
                case 1 %Spring doesn't affect avg growth rate much
                    seasonalgrowth = food.gr;
                case 2 %Summer causes an increase in vegetation as
                    %sunlight becomes more abundant
                    seasonalgrowth = food.gr*2;
                case 3 %Fall causes avg growth rates in certain 
                    %vegetation to go back down to avg
                    seasonalgrowth = food.gr;
                case 4 %Winter causes a decrease in deciduous
                    %vegetation, BUT an increase in underground
                    %vegetation and some above-ground vegetation
                    %(e.g. certain fruits).
                    %We are not considering underground
                    %habitats, so therefore growth rate overall
                    %goes slightly down.
                    seasonalgrowth = food.gr*0.8;
                otherwise
                    seasonalgrowth = food.gr;
            end
            f1 = seasonalgrowth*food.FM*food.f; %total affected growth rate
            
            
            
            f2 = 0;
            
                
                
                
            for idx=1:numel(food.feeds)
                thisSpecies = food.feeds(indx);
                f2= f2 + food.numMeals(idx)*food.f*thisSpecies.getx()/food.S;
            end
           
                    
            
            
            food.updatedFoods = food.f + (f1-f2)*time;
            %see SpeciesPopulations on the whole time bit.
        end
        function update()
            %call this function to update all foods AFTER all calculations
            %are made
            food.f = food.updatedFoods;
            food.weeks = food.weeks +1;
            weeksFromSeason = mod(food.weeks, 52);
            if (weeksFromSeason==13 || weeksFromSeason == 26 || weeksFromSeason == 39 || weeksFromSeason ==0) %season change.
                food.seasonNum = food.seasonNum + 1;
                switch food.seasonNum
                    case 1
                        food.season = char('Spring');
                    case 2
                        food.season = char('Summer');
                    case 3
                        food.season = char('Fall');
                    case 4
                        food.season = char('Winter');
                    case 5
                        food.seasonNum = 1;
                        food.season = char('Spring');
                    otherwise
                        disp('error');
                end
            end
        end
    end
    
end
%================================================================
%----------------------------------------------------------------
% 2015-11-29:
%  Auto-generated file.
%----------------------------------------------------------------
%================================================================