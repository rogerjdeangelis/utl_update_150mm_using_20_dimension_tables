
SAS: Update master table using 23 dimension tables 14 minutes not 20-30 hrs

This is not a big data problem.

This requires the free SPDE product on a workstation.

inspired by
https://goo.gl/tzSYvK
https://communities.sas.com/t5/Base-SAS-Programming/Join-Many-Tables-to-One-Master-Table/m-p/311889

I have a base master table of about 150 million rows.  I have a series of about 20 different
tables that I need to link into the master table in order to fill out additional columns.
These additional tables range in size from 500 rows to 30 million rows.  Each one has a unique
key that can be used to link to the master table.  What is my best bet in creating one massive base table
with all the columns I need filled out?  I have tried a series of inner and left joins through
proc sql but it takes way too long, probably 20-30 hours if I let it continue to run.


I don't see how this can take 20-30hrs. It took 14 minutes on my $600 2008 Dell T7400,
probably cheaper now.


LOG
NOTE: The data set WORK.MASTER has 150,000,000 observations and 35 variables.
NOTE: DATA statement used (Total process time):
      real time           14:18.11
      cpu time            19:15.79


Adding descriptions from 23 dimension tables to one master table.
For small tables like these I do nto parallelize.

HAVE a MASTER table with 150 million obs
=========================================

NOTE: There were 150000000 observations read from the data set SPDE.MM150.

AND 23 Dimension tables
=======================

NOTE: There were 500 observations read from the data set SPDE.DIM500.
NOTE: There were 1000 observations read from the data set SPDE.DIM1000.
NOTE: There were 2000 observations read from the data set SPDE.DIM2000.
NOTE: There were 4000 observations read from the data set SPDE.DIM4000.
NOTE: There were 8000 observations read from the data set SPDE.DIM8000.
NOTE: There were 10000 observations read from the data set SPDE.DIM10000.
NOTE: There were 20000 observations read from the data set SPDE.DIM20000.
NOTE: There were 40000 observations read from the data set SPDE.DIM40000.
NOTE: There were 80000 observations read from the data set SPDE.DIM80000.
NOTE: There were 100000 observations read from the data set SPDE.DIM100000.
NOTE: There were 200000 observations read from the data set SPDE.DIM200000.
NOTE: There were 400000 observations read from the data set SPDE.DIM400000.
NOTE: There were 802140 observations read from the data set SPDE.DIM800000.
NOTE: There were 1000000 observations read from the data set SPDE.DIM1000000.
NOTE: There were 2000000 observations read from the data set SPDE.DIM2000000.
NOTE: There were 4054055 observations read from the data set SPDE.DIM4000000.
NOTE: There were 8333334 observations read from the data set SPDE.DIM8000000.
NOTE: There were 10000000 observations read from the data set SPDE.DIM10000000.
NOTE: There were 21428572 observations read from the data set SPDE.DIM20000000.
NOTE: There were 30000000 observations read from the data set SPDE.DIM30000000.
NOTE: There were 10000000 observations read from the data set SPDE.DIM10000000.
NOTE: There were 21428572 observations read from the data set SPDE.DIM20000000.
NOTE: There were 30000000 observations read from the data set SPDE.DIM30000000.


MASTER

Middle Observation(75000000 ) of SPDE.MM150 - Total Obs 150,000,000

14 variable, note the use of codes instead of descriptions
this is goo practice


 -- CHARACTER --
C1                    C    1       A
C2                    C    1       A
C3                    C    1       A
C4                    C    1       A
C5                    C    1       A
C6                    C    1       A
C7                    C    1       A
C8                    C    1       A
C9                    C    1       A
C10                   C    1       A


 -- NUMERIC --
N1                    N    8       1111
N2                    N    8       2222
N3                    N    8       3333
N4                    N    8       4444
KEY                   N    8       75000000


ONE OF THE DIMENSION TABLES

Up to 40 obs from SPDE.DIM500 total obs=500

Obs         KEY    DIM300000

  1           1      MALE
  2      300001      MALE
  3      600001      MALE
  4      900001      MALE
  5     1200001      MALE


WANT NEW MATER TABLE with all the dimension information


Middle Observation(1 ) of Last dataset = WORK.XUNDER1MM - Total Obs 1


 -- CHARACTER --
C1                               C    1       A                   C1
C2                               C    1       A                   C2
C3                               C    1       A                   C3
C4                               C    1       A                   C4
C5                               C    1       A                   C5
C6                               C    1       A                   C6
C7                               C    1       A                   C7
C8                               C    1       A                   C8
C9                               C    1       A                   C9
C10                              C    1       A                   C10
DIM300000                        C    4       MALE                DIM300000
DIM150000                        C    2       VT                  DIM150000
DIM75000                         C    3       OLD                 DIM75000
DIM37500                         C    4       BLUE                DIM37500
DIM18750                         C    3       TOP                 DIM18750
DIM15000                         C    3       LOW                 DIM15000
DIM7500                          C    4       HIGH                DIM7500
DIM3750                          C    4       PRES                DIM3750
DIM1875                          C    4       BEST                DIM1875
DIM1500                          C    4       GROW                DIM1500
DIM750                           C    4       POOR                DIM750
DIM375                           C    4       RICH                DIM375
DIM187                           C    3       KID                 DIM187
DIM150                           C    4       POOL                DIM150
DIM75                            C    4       MEAN                DIM75
DIM37                            C    3       MIN                 DIM37
DIM18                            C    3       MAX                 DIM18
DIM15                            C    3       OUT                 DIM15
DIM7                             C    3       DEM                 DIM7
DIM5                             C    3       GOP                 DIM5


 -- NUMERIC --
KEY                              N    8       1                   KEY
N1                               N    8       1111                N1
N2                               N    8       2222                N2
N3                               N    8       3333                N3
N4                               N    8       4444                N4


Join Many Tables to One Master Table

I have a base master table of about 150 million rows.  I have a series of about 20 different
tables that I need to link into the master table in order to fill out additional columns.
These additional tables range in size from 500 rows to 30 million rows.  Each one has a unique
key that can be used to link to the master table.  What is my best bet in creating one massive base table
with all the columns I need filled out?  I have tried a series of inner and left joins through
proc sql but it takes way too long, probably 20-30 hours if I let it continue to run.

I am a SAS novice but have a good understanding of SQL.  Any tips for me?


%let pgm=utl_complex_update;

libname spde spde
 ('c:\wrk\spde_c','d:\wrk\spde_d','e:\wrk\spde_e','g:\wrk\spde_g','h:\wrk\spde_h')
    metapath =('c:\wrk\spde_c\metadata')
    indexpath=(
          'c:\wrk\spde_c'
          ,'d:\wrk\spde_d'
          ,'e:\wrk\spde_e'
          ,'g:\wrk\spde_g'
          ,'h:\wrk\spde_h')

    datapath =(
          'c:\wrk\spde_c'
          ,'d:\wrk\spde_d'
          ,'e:\wrk\spde_e'
          ,'g:\wrk\spde_g'
          ,'h:\wrk\spde_h')
    partsize=500m
;

* CREATE SOME DATA;
* it is not unusual to use codes in a fact table instead of long descriptions;
data spde.mm150(index=(key/unique));
   array nums[4] n1-n4 (1111,2222,3333,4444);
   array codes[10] $1 c1-c10 (10*'A');
   do key=1 to 150000000;
      output;
   end;
run;quit;

%macro mke020(obs,txt);
  %let interval=%eval(150000000/&obs);
  data spde.dim&obs;
    retain key 0 dim&interval "&txt";
    do key=1 to 150000000 by &interval;
       output;
    end;
  run;quit;
%mend mke020;

%mke020(500      ,MALE);
%mke020(1000     ,VT  );
%mke020(2000     ,OLD );
%mke020(4000     ,BLUE);
%mke020(8000     ,TOP );
%mke020(10000    ,LOW );
%mke020(20000    ,HIGH);
%mke020(40000    ,PRES);
%mke020(80000    ,BEST);
%mke020(100000   ,GROW);
%mke020(200000   ,POOR);
%mke020(400000   ,RICH);
%mke020(800000   ,KID );
%mke020(1000000  ,POOL);
%mke020(2000000  ,MEAN);
%mke020(4000000  ,MIN );
%mke020(8000000  ,MAX );
%mke020(10000000 ,OUT );
%mke020(20000000 ,DEM );
%mke020(30000000 ,GOP );


data master;
 merge spde.mm150(in=master)
       spde.dim500
       spde.dim1000
       spde.dim2000
       spde.dim4000
       spde.dim8000
       spde.dim10000
       spde.dim20000
       spde.dim40000
       spde.dim80000
       spde.dim100000
       spde.dim200000
       spde.dim400000
       spde.dim800000
       spde.dim1000000
       spde.dim2000000
       spde.dim4000000
       spde.dim8000000
       spde.dim10000000
       spde.dim20000000
       spde.dim30000000
       spde.dim10000000
       spde.dim20000000
       spde.dim30000000
  ;
  by key;
  if master;
  if mod(_n_,10000000)=0 then put _n_=;
run;quit;

NOTE: There were 150000000 observations read from the data set SPDE.MM150.
NOTE: There were 500 observations read from the data set SPDE.DIM500.
NOTE: There were 1000 observations read from the data set SPDE.DIM1000.
NOTE: There were 2000 observations read from the data set SPDE.DIM2000.
NOTE: There were 4000 observations read from the data set SPDE.DIM4000.
NOTE: There were 8000 observations read from the data set SPDE.DIM8000.
NOTE: There were 10000 observations read from the data set SPDE.DIM10000.
NOTE: There were 20000 observations read from the data set SPDE.DIM20000.
NOTE: There were 40000 observations read from the data set SPDE.DIM40000.
NOTE: There were 80000 observations read from the data set SPDE.DIM80000.
NOTE: There were 100000 observations read from the data set SPDE.DIM100000.
NOTE: There were 200000 observations read from the data set SPDE.DIM200000.
NOTE: There were 400000 observations read from the data set SPDE.DIM400000.
NOTE: There were 802140 observations read from the data set SPDE.DIM800000.
NOTE: There were 1000000 observations read from the data set SPDE.DIM1000000.
NOTE: There were 2000000 observations read from the data set SPDE.DIM2000000.
NOTE: There were 4054055 observations read from the data set SPDE.DIM4000000.
NOTE: There were 8333334 observations read from the data set SPDE.DIM8000000.
NOTE: There were 10000000 observations read from the data set SPDE.DIM10000000.
NOTE: There were 21428572 observations read from the data set SPDE.DIM20000000.
NOTE: There were 30000000 observations read from the data set SPDE.DIM30000000.
NOTE: There were 10000000 observations read from the data set SPDE.DIM10000000.
NOTE: There were 21428572 observations read from the data set SPDE.DIM20000000.
NOTE: There were 30000000 observations read from the data set SPDE.DIM30000000.
NOTE: The data set WORK.UNDER1MM has 150000000 observations and 35 variables.
NOTE: DATA statement used (Total process time):
      real time           14:18.11
      cpu time            19:15.79


