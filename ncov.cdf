(* Content-type: application/vnd.wolfram.cdf.text *)

(*** Wolfram CDF File ***)
(* http://www.wolfram.com/cdf *)

(* CreatedBy='Mathematica 12.0' *)

(***************************************************************************)
(*                                                                         *)
(*                                                                         *)
(*  Under the Wolfram FreeCDF terms of use, this file and its content are  *)
(*  bound by the Creative Commons BY-SA Attribution-ShareAlike license.    *)
(*                                                                         *)
(*        For additional information concerning CDF licensing, see:        *)
(*                                                                         *)
(*         www.wolfram.com/cdf/adopting-cdf/licensing-options.html         *)
(*                                                                         *)
(*                                                                         *)
(***************************************************************************)

(*CacheID: 234*)
(* Internal cache information:
NotebookFileLineBreakTest
NotebookFileLineBreakTest
NotebookDataPosition[      1088,         20]
NotebookDataLength[    502731,      12754]
NotebookOptionsPosition[    497119,      12661]
NotebookOutlinePosition[    497457,      12676]
CellTagsIndexPosition[    497414,      12673]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{

Cell[CellGroupData[{
Cell["COVID-19, analysis", "Chapter",
 CellChangeTimes->{{3.788862394274722*^9, 3.788862399291037*^9}, {
  3.791413733053494*^9, 3.791413734212346*^9}, {3.7923735772288723`*^9, 
  3.792373578454595*^9}},ExpressionUUID->"4906a22a-258a-442f-a1c7-\
6028cb52df08"],

Cell[CellGroupData[{

Cell["Data sources", "Section",
 CellChangeTimes->{{3.7888624043650217`*^9, 3.788862404849378*^9}, {
  3.790142272668675*^9, 3.790142273546082*^9}, {3.791416553430428*^9, 
  3.791416557367297*^9}, {3.792489970218508*^9, 
  3.7924899722758923`*^9}},ExpressionUUID->"739ef86d-63ab-4ad4-a449-\
645d0b059bf2"],

Cell["\<\
Many data tables can be found from
https://en.wikipedia.org/wiki/2019\[Dash]20_coronavirus_outbreak_by_country_\
and_territory

We can convert Wikipedia Table into csv by using
https://wikitable2csv.ggor.de\
\>", "Text",
 CellChangeTimes->{{3.78886240970892*^9, 3.788862421351185*^9}, 
   3.7889499031816063`*^9, {3.789303290503276*^9, 3.7893033043974037`*^9}, {
   3.790142321359178*^9, 3.790142331315675*^9}, {3.7901698443588543`*^9, 
   3.790169846608799*^9}, {3.790699528934585*^9, 3.7906995302614527`*^9}, {
   3.7912391817759027`*^9, 3.791239188569998*^9}, {3.791401898150732*^9, 
   3.791401919577359*^9}, {3.791413751808576*^9, 3.791413752629108*^9}, {
   3.791413950612677*^9, 3.791413955537649*^9}, {3.7914142359054527`*^9, 
   3.7914142647935877`*^9}, {3.791414789779759*^9, 3.7914147906413307`*^9}, {
   3.791415955296208*^9, 3.791415985418305*^9}, {3.791416377112173*^9, 
   3.7914164256844473`*^9}, {3.791416566401537*^9, 3.7914166578202057`*^9}, {
   3.791467677471148*^9, 3.791467678863143*^9}, {3.79151411312497*^9, 
   3.791514113542842*^9}, {3.791514468979497*^9, 3.791514493781928*^9}, {
   3.7918368086275682`*^9, 3.791836809677231*^9}, 3.792031968768201*^9, 
   3.792032008879589*^9, {3.792199658617199*^9, 3.792199665543672*^9}, 
   3.792327454987705*^9, {3.7924064507879343`*^9, 3.792406461588375*^9}, {
   3.7924110367594337`*^9, 3.792411068541353*^9}, {3.792489103636265*^9, 
   3.792489104592122*^9}},
 Background->RGBColor[
  0.88, 1, 0.88],ExpressionUUID->"5d27d43b-71c1-4281-8f3f-3e2b8a6eb55b"],

Cell["\<\
Worldwide data from \
\[LineSeparator]https://en.wikipedia.org/wiki/Template:2019%E2%80%9320_\
coronavirus_outbreak_data/International_medical_cases

Chinese data from (slightly outdated)
https://en.wikipedia.org/wiki/Timeline_of_the_2019%E2%80%9320_coronavirus_\
outbreak
   and use the 3rd table, National (inclusive), to exclude clinical cases in \
Hubei, Feb 12-15. For more recent data, subtratc \
\[OpenCurlyDoubleQuote]Confirmed (cumulative)\[CloseCurlyDoubleQuote] in
https://en.wikipedia.org/wiki/Template:2019%E2%80%9320_coronavirus_outbreak_\
data/China_medical_cases
   or look at the official daily reports, \
\:65b0\:589e\:786e\:8bca\:75c5\:4f8b in
http://www.nhc.gov.cn/yjb/pzhgli/new_list.shtml

Note that the sum mismatches for the wikipedia data in Henan. Nanjing data \
from\[LineSeparator]http://wjw.jiangsu.gov.cn/

Japan
https://en.wikipedia.org/wiki/Template:2019%E2%80%9320_coronavirus_outbreak_\
data/Japan_medical_cases

Diamond Princess
https://en.wikipedia.org/wiki/Template:2019%E2%80%9320_coronavirus_outbreak_\
data/Diamond_Princess_medical_cases

Seoul City and Busan
http://www.seoul.go.kr/coronaV/coronaStatus.do?tab=6
http://www.busan.go.kr/corona19/index
   also Summary website
https://wuhanvirus.kr/

Iran
https://en.wikipedia.org/wiki/2020_coronavirus_outbreak_in_Iran
  the regional data has N/A\[CloseCurlyQuote]s in Mar 2 & 3, and the sum does \
not agree if we regard N/A  as 0. I interpoltaed the missing numbers
  
Italy
https://en.wikipedia.org/wiki/Template:2019%E2%80%9320_coronavirus_outbreak_\
data/Italy_medical_cases
  
Germany
https://en.wikipedia.org/wiki/2020_coronavirus_outbreak_in_Germany\
\>", "Text",
 CellChangeTimes->{{3.7923275717357073`*^9, 3.7923275965036993`*^9}, {
   3.7923281286516027`*^9, 3.792328142185321*^9}, {3.792330521766509*^9, 
   3.792330542998542*^9}, {3.7923306578067083`*^9, 3.7923306595493727`*^9}, {
   3.792330706586851*^9, 3.792330710670088*^9}, {3.792405269521007*^9, 
   3.792405280052005*^9}, {3.792405475375341*^9, 3.792405526428578*^9}, {
   3.792406349210929*^9, 3.7924063627668324`*^9}, {3.792406617101194*^9, 
   3.792406639875226*^9}, {3.792407711746214*^9, 3.792407712923979*^9}, {
   3.792408509131435*^9, 3.7924085868145523`*^9}, {3.792408735091146*^9, 
   3.7924087954362097`*^9}, {3.792410045891746*^9, 3.7924100500534363`*^9}, {
   3.792410945060914*^9, 3.792410971159336*^9}, {3.792411016172714*^9, 
   3.7924110314045267`*^9}, {3.7924886764266768`*^9, 3.792488730167684*^9}, 
   3.7924891881112127`*^9, {3.792491307493*^9, 3.7924913110814962`*^9}},
 Background->RGBColor[
  1, 0.9, 0.8],ExpressionUUID->"c05a8c32-b20c-4867-b5c2-f97b11958594"]
}, Closed]],

Cell[CellGroupData[{

Cell["Input", "Section",
 CellChangeTimes->{{3.7888624043650217`*^9, 3.788862404849378*^9}, {
  3.790142272668675*^9, 
  3.790142273546082*^9}},ExpressionUUID->"3f09f26c-951e-4053-9c1d-\
d7258e3806da"],

Cell[BoxData[
 RowBox[{
  RowBox[{"keyList", "=", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"china", ",", "international", ",", "worldwide"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
      "hokkaido", ",", "tokyo", ",", "aichi", ",", "osaka", ",", "japan"}], 
      "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"DPtested", ",", "DPconfirmed", ",", "DPasymptomatic"}], "}"}], 
     ",", 
     RowBox[{"{", 
      RowBox[{"seoul", ",", "busan", ",", "rok"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"qom", ",", "tehran", ",", "iran"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"lombardy", ",", "veneto", ",", "emiliaRomagna", ",", "italy"}],
       "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
      "badenWurttemberg", ",", "bavaria", ",", "northRhineWestpharia", ",", 
       "germany"}], "}"}], ",", 
     RowBox[{"{", "singapore", "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"henan", ",", "jiangsu", ",", "nanjing"}], "}"}]}], "}"}]}], 
  ";"}]], "Input",
 CellChangeTimes->{{3.7924043550971813`*^9, 3.792404383594626*^9}, {
   3.792404730101157*^9, 3.792404744749571*^9}, {3.792405042286276*^9, 
   3.792405043488316*^9}, {3.792405984347612*^9, 3.792405986787937*^9}, {
   3.7924060366264887`*^9, 3.792406040720572*^9}, {3.792407011093957*^9, 
   3.792407013815044*^9}, {3.792407077754159*^9, 3.792407086378648*^9}, {
   3.7924075753924417`*^9, 3.792407587247004*^9}, {3.7924077660580463`*^9, 
   3.792407771042336*^9}, {3.7924088073728857`*^9, 3.7924088114679117`*^9}, 
   3.792408906487417*^9, {3.792408951522723*^9, 3.792408954086349*^9}, {
   3.792410461652341*^9, 3.792410485770794*^9}, {3.792410670088064*^9, 
   3.792410670285345*^9}, {3.792411396109852*^9, 3.792411414716303*^9}, {
   3.792411766016963*^9, 3.7924117668139553`*^9}, {3.792416742773209*^9, 
   3.7924167448519506`*^9}, {3.792488491169726*^9, 3.7924885004948673`*^9}},
 CellLabel->"In[1]:=",ExpressionUUID->"636d3c4a-13cf-4ca5-acce-61e3014aa782"],

Cell[CellGroupData[{

Cell["Worldwide", "Subsection",
 CellChangeTimes->{{3.792331172768057*^9, 
  3.792331179855277*^9}},ExpressionUUID->"552443f6-3ed9-4acd-8be4-\
3fd5b3c2c2ba"],

Cell[BoxData[{
 RowBox[{
  RowBox[{
   RowBox[{"data", "[", "china", "]"}], "=", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 11 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "11"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "41"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 12 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "12"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "41"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 13 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "13"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "41"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 14 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "14"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "41"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 15 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "15"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "41"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 16 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "16"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "45"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 17 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "17"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "62"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 18 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "18"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "121"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 19 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "19"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "199"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 20 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "20"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "291"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 21 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "21"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "440"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 22 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "22"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "571"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 23 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "23"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "830"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 24 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "24"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1287"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 25 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "25"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1975"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 26 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "26"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "2744"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 27 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "27"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "4515"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 28 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "28"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "5974"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 29 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "29"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "7710"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 30 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "30"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "9689"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 31 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "31"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "11790"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 1 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "1"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "14376"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 2 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "2"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "17203"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 3 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "3"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "20437"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 4 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "4"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "24324"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 5 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "5"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "28018"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 6 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "6"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "31147"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 7 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "7"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "34542"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 8 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "8"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "37109"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 9 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "9"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "40160"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 10 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "10"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "42638"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 11 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "11"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "44653"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 12 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "12"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "46473"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 13 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "13"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "48468"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 14 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "14"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "49971"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 15 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "15"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "51092"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 16 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "16"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "53140"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 17 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "17"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "55026"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 18 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "18"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "56775"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 19 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "19"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "57448"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 20 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "20"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "58337"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 21 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "21"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "58734"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 22 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "22"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "59382"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 23 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "23"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "59791"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 24 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "24"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "60299"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 25 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "25"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "60705"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 26 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "26"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "61138"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 27 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "27"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "61465"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 28 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "28"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "61892"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 29 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "29"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "62465"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 1 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "1"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "62667"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 2 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "2"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "62792"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 3 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "3"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "62911"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 4 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "4"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "63050"}], "}"}]}], "}"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"data", "[", "international", "]"}], "=", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 11 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "11"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 12 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "12"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 13 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "13"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 14 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "14"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 15 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "15"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "2"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 16 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "16"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "2"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 17 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "17"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "3"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 18 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "18"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "3"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 19 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "19"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "3"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 20 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "20"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "4"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 21 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "21"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "6"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 22 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "22"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "9"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 23 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "23"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "15"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 24 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "24"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "30"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 25 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "25"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "40"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 26 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "26"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "56"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 27 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "27"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "66"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 28 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "28"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "84"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 29 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "29"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "102"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 30 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "30"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "125"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 31 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "31"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "153"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 1 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "1"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "168"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 2 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "2"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "180"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 3 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "3"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "184"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 4 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "4"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "212"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 5 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "5"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "241"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 6 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "6"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "275"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 7 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "7"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "325"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 8 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "8"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "352"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 9 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "9"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "379"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 10 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "10"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "461"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 11 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "11"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "476"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 12 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "12"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "521"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 13 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "13"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "583"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 14 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "14"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "604"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 15 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "15"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "693"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 16 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "16"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "777"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 17 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "17"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "892"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 18 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "18"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "995"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 19 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "19"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1113"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 20 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "20"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1198"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 21 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "21"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1378"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 22 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "22"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1711"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 23 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "23"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "2047"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 24 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "24"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "2421"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 25 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "25"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "2742"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 26 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "26"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "3304"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 27 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "27"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "4257"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 28 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "28"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "5302"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 29 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "29"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "6676"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 1 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "1"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "8955"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 2 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "2"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "10640"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 3 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "3"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "12679"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 4 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "4"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "13185"}], "}"}]}], "}"}]}], ";"}]}], "Input",
 CellChangeTimes->{{3.792328348332663*^9, 3.792328356127132*^9}, {
  3.792328798781341*^9, 3.792328800491914*^9}, {3.792330972716902*^9, 
  3.792331024895331*^9}, {3.7923310611241703`*^9, 3.7923311501103067`*^9}, {
  3.79240438637388*^9, 3.792404395037075*^9}, {3.7924048926463747`*^9, 
  3.792404908966415*^9}, {3.7924050320184307`*^9, 3.792405038184486*^9}, {
  3.792405423442897*^9, 3.792405424274914*^9}},
 CellLabel->"In[2]:=",ExpressionUUID->"40ab8a21-7e5a-476d-9ca1-3ef16c7ba825"],

Cell[BoxData[
 RowBox[{
  RowBox[{
   RowBox[{"data", "[", "worldwide", "]"}], "=", 
   RowBox[{"Table", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{
        RowBox[{"data", "[", "international", "]"}], "[", 
        RowBox[{"[", 
         RowBox[{"ii", ",", "1"}], "]"}], "]"}], ",", 
       RowBox[{
        RowBox[{
         RowBox[{"data", "[", "international", "]"}], "[", 
         RowBox[{"[", 
          RowBox[{"ii", ",", "2"}], "]"}], "]"}], "+", 
        RowBox[{
         RowBox[{"data", "[", "china", "]"}], "[", 
         RowBox[{"[", 
          RowBox[{"ii", ",", "2"}], "]"}], "]"}]}]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"ii", ",", 
       RowBox[{"Length", "@", 
        RowBox[{"data", "[", "international", "]"}]}]}], "}"}]}], "]"}]}], 
  ";"}]], "Input",
 CellChangeTimes->{3.7924049436411247`*^9},
 CellLabel->"In[4]:=",ExpressionUUID->"844c9131-cd26-4497-96b7-722fb3a2c3a8"]
}, Closed]],

Cell[CellGroupData[{

Cell["Japan, prefectures", "Subsection",
 CellChangeTimes->{{3.7924059491228113`*^9, 3.7924059496617517`*^9}, {
  3.792406487553383*^9, 
  3.792406503889235*^9}},ExpressionUUID->"1358e2ae-01ea-4fde-9ed0-\
17c027a7a7f0"],

Cell[BoxData[{
 RowBox[{
  RowBox[{
   RowBox[{"data", "[", "hokkaido", "]"}], "=", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 24 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "24"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 25 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "25"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 26 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "26"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 28 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "28"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 29 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "29"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 30 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "30"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 31 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "31"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 1 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "1"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 4 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "4"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 5 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "5"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 8 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "8"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 11 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "11"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 12 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "12"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 13 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "13"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 14 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "14"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "2"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 15 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "15"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "2"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 16 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "16"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "2"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 17 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "17"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "2"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 18 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "18"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "2"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 19 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "19"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "4"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 20 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "20"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "5"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 21 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "21"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "8"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 22 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "22"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "17"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 23 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "23"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "26"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 24 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "24"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "30"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 25 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "25"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "35"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 26 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "26"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "39"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 27 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "27"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "54"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 28 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "28"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "66"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 29 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "29"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "70"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 1 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "1"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "72"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 2 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "2"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "77"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 3 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "3"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "79"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 4 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "4"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "82"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 5 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "5"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "83"}], "}"}]}], "}"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"data", "[", "tokyo", "]"}], "=", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 24 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "24"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 25 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "25"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "2"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 26 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "26"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "2"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 28 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "28"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "2"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 29 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "29"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "2"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 30 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "30"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "3"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 31 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "31"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "3"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 1 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "1"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "3"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 4 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "4"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "3"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 5 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "5"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "3"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 8 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "8"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "3"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 11 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "11"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "3"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 12 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "12"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "3"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 13 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "13"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "4"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 14 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "14"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "6"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 15 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "15"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "14"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 16 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "16"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "18"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 17 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "17"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "18"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 18 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "18"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "21"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 19 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "19"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "24"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 20 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "20"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "24"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 21 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "21"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "27"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 22 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "22"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "29"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 23 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "23"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "29"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 24 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "24"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "32"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 25 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "25"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "32"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 26 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "26"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "35"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 27 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "27"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "36"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 28 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "28"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "36"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 29 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "29"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "37"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 1 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "1"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "39"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 2 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "2"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "40"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 3 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "3"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "41"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 4 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "4"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "45"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 5 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "5"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "53"}], "}"}]}], "}"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"data", "[", "aichi", "]"}], "=", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 24 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "24"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 25 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "25"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 26 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "26"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 28 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "28"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "2"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 29 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "29"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "2"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 30 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "30"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "2"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 31 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "31"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "2"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 1 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "1"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "2"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 4 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "4"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "2"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 5 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "5"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "2"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 8 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "8"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "2"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 11 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "11"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "2"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 12 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "12"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "2"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 13 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "13"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "2"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 14 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "14"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "3"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 15 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "15"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "4"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 16 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "16"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "5"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 17 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "17"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "6"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 18 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "18"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "7"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 19 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "19"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "8"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 20 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "20"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "9"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 21 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "21"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "11"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 22 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "22"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "15"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 23 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "23"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "17"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 24 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "24"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "17"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 25 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "25"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "20"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 26 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "26"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "25"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 27 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "27"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "27"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 28 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "28"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "28"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 29 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "29"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "29"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 1 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "1"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "32"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 2 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "2"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "32"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 3 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "3"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "41"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 4 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "4"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "50"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 5 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "5"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "58"}], "}"}]}], "}"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"data", "[", "osaka", "]"}], "=", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 24 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "24"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 25 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "25"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 26 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "26"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 28 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "28"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 29 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "29"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 30 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "30"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 31 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "31"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 1 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "1"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 4 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "4"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 5 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "5"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 8 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "8"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 11 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "11"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 12 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "12"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 13 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "13"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 14 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "14"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 15 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "15"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 16 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "16"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 17 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "17"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 18 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "18"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 19 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "19"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 20 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "20"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 21 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "21"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 22 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "22"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 23 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "23"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 24 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "24"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 25 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "25"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 26 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "26"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 27 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "27"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "2"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 28 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "28"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "4"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 29 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "29"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "4"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 1 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "1"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "4"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 2 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "2"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "6"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 3 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "3"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "8"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 4 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "4"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "17"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 5 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "5"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "19"}], "}"}]}], "}"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"data", "[", "japan", "]"}], "=", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 8 Dec 2019\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2019", ",", "12", ",", "8"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 10 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "10"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 15 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "15"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 16 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "16"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 17 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "17"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 18 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "18"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 19 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "19"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 20 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "20"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 21 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "21"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 22 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "22"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 23 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "23"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 24 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "24"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "2"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 25 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "25"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "3"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 26 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "26"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "4"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 27 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "27"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "4"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 28 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "28"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "7"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 29 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "29"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "8"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 30 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "30"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "12"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 31 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "31"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "13"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 1 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "1"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "20"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 2 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "2"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "20"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 3 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "3"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "20"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 4 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "4"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "23"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 5 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "5"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "25"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 6 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "6"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "25"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 7 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "7"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "25"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 8 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "8"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "26"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 9 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "9"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "26"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 10 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "10"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "26"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 11 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "11"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "28"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 12 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "12"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "29"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 13 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "13"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "33"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 14 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "14"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "41"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 15 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "15"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "53"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 16 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "16"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "59"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 17 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "17"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "66"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 18 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "18"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "74"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 19 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "19"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "84"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 20 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "20"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "94"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 21 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "21"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "109"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 22 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "22"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "135"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 23 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "23"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "147"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 24 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "24"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "160"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 25 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "25"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "171"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 26 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "26"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "189"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 27 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "27"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "214"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 28 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "28"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "233"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 29 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "29"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "242"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 1 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "1"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "256"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 2 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "2"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "274"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 3 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "3"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "293"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 4 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "4"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "329"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 5 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "5"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "360"}], "}"}]}], "}"}]}], ";"}]}], "Input",
 CellChangeTimes->{{3.792405951340003*^9, 3.7924059750044317`*^9}, {
   3.7924060194323187`*^9, 3.792406027991622*^9}, {3.792406064514945*^9, 
   3.792406136141341*^9}, {3.792411726545581*^9, 3.792411754877542*^9}, 
   3.792491137722192*^9, {3.792491180410233*^9, 3.792491252890461*^9}},
 CellLabel->"In[5]:=",ExpressionUUID->"b0fc84cd-8a74-41f0-acc2-a9015dcc7402"]
}, Closed]],

Cell[CellGroupData[{

Cell["Diamond Princess", "Subsection",
 CellChangeTimes->{{3.792406586230802*^9, 
  3.7924065890087*^9}},ExpressionUUID->"78eff8d8-fdc5-4b2a-9219-591edd3e3785"],

Cell[BoxData[{
 RowBox[{
  RowBox[{
   RowBox[{"data", "[", "DPtested", "]"}], "=", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 5 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "5"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "31"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 6 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "6"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "102"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 7 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "7"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "273"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 8 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "8"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "279"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 9 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "9"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "336"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 10 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "10"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "439"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 12 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "12"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "492"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 13 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "13"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "713"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 15 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "15"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "930"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 16 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "16"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1219"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 17 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "17"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1723"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 18 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "18"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "2404"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 19 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "19"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "3011"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 20 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "20"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "3063"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 26 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "26"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "4061"}], "}"}]}], "}"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"data", "[", "DPconfirmed", "]"}], "=", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 5 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "5"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "10"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 6 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "6"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "20"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 7 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "7"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "61"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 8 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "8"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "64"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 9 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "9"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "70"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 10 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "10"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "135"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 12 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "12"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "174"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 13 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "13"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "218"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 15 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "15"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "285"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 16 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "16"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "355"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 17 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "17"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "454"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 18 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "18"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "542"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 19 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "19"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "621"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 20 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "20"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "634"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 26 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "26"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "705"}], "}"}]}], "}"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"data", "[", "DPasymptomatic", "]"}], "=", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 5 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "5"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 6 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "6"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 7 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "7"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 8 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "8"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 9 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "9"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 10 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "10"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 12 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "12"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 13 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "13"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 15 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "15"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "73"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 16 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "16"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "111"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 17 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "17"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "189"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 18 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "18"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "254"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 19 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "19"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "322"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 20 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "20"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "328"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 26 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "26"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "392"}], "}"}]}], "}"}]}], ";"}]}], "Input",
 CellChangeTimes->{{3.7924069969532537`*^9, 3.792407008541153*^9}, {
   3.79240705897561*^9, 3.792407125827339*^9}, 3.7924071848507442`*^9},
 CellLabel->"In[10]:=",ExpressionUUID->"f4da4b24-2359-4f95-8f8f-122a4eb48cb4"]
}, Closed]],

Cell[CellGroupData[{

Cell["South Korea", "Subsection",
 CellChangeTimes->{{3.7924059491228113`*^9, 3.7924059496617517`*^9}, {
  3.792406487553383*^9, 3.792406503889235*^9}, {3.7924075529799747`*^9, 
  3.792407555026664*^9}},ExpressionUUID->"180f556c-8c14-4bc5-a15b-\
edd336ad69dd"],

Cell[BoxData[{
 RowBox[{
  RowBox[{
   RowBox[{"data", "[", "seoul", "]"}], "=", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 8 Dec 2019\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2019", ",", "12", ",", "8"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 10 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "10"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 15 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "15"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 16 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "16"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 17 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "17"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 18 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "18"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 19 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "19"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 20 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "20"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 21 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "21"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 22 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "22"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 23 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "23"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 24 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "24"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 25 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "25"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 26 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "26"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 27 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "27"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 28 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "28"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 29 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "29"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 30 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "30"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "4"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 31 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "31"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "7"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 1 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "1"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "7"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 2 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "2"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "8"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 3 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "3"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "8"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 4 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "4"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "8"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 5 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "5"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "10"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 6 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "6"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "11"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 7 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "7"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "12"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 8 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "8"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "12"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 9 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "9"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "12"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 10 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "10"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "12"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 11 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "11"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "12"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 12 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "12"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "12"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 13 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "13"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "12"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 14 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "14"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "12"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 15 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "15"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "12"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 16 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "16"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "14"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 17 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "17"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "14"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 18 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "18"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "14"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 19 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "19"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "16"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 20 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "20"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "21"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 21 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "21"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "23"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 22 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "22"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "27"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 23 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "23"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "31"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 24 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "24"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "35"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 25 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "25"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "51"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 26 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "26"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "61"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 27 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "27"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "74"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 28 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "28"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "82"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 29 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "29"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "87"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 1 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "1"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "92"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 2 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "2"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "98"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 3 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "3"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "98"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 4 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "4"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "105"}], "}"}]}], "}"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"data", "[", "busan", "]"}], "=", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 8 Dec 2019\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2019", ",", "12", ",", "8"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 10 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "10"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 15 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "15"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 16 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "16"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 17 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "17"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 18 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "18"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 19 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "19"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 20 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "20"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 21 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "21"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 22 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "22"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 23 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "23"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 24 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "24"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 25 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "25"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 26 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "26"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 27 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "27"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 28 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "28"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 29 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "29"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 30 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "30"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 31 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "31"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 1 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "1"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 2 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "2"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 3 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "3"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 4 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "4"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 5 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "5"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 6 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "6"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 7 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "7"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 8 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "8"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 9 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "9"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 10 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "10"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 11 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "11"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 12 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "12"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 13 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "13"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 14 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "14"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 15 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "15"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 16 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "16"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 17 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "17"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 18 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "18"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 19 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "19"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 20 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "20"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 21 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "21"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "2"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 22 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "22"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "15"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 23 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "23"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "31"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 24 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "24"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "45"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 25 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "25"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "56"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 26 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "26"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "59"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 27 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "27"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "64"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 28 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "28"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "66"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 29 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "29"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "75"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 1 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "1"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "78"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 2 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "2"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "79"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 3 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "3"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "83"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 4 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "4"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "84"}], "}"}]}], "}"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"data", "[", "rok", "]"}], "=", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 8 Dec 2019\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2019", ",", "12", ",", "8"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 10 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "10"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 15 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "15"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 16 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "16"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 17 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "17"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 18 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "18"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 19 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "19"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 20 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "20"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 21 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "21"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 22 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "22"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 23 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "23"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 24 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "24"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "2"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 25 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "25"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "2"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 26 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "26"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "3"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 27 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "27"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "4"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 28 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "28"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "4"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 29 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "29"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "4"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 30 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "30"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "7"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 31 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "31"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "11"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 1 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "1"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "12"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 2 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "2"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "15"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 3 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "3"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "15"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 4 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "4"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "16"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 5 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "5"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "21"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 6 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "6"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "24"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 7 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "7"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "24"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 8 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "8"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "24"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 9 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "9"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "27"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 10 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "10"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "28"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 11 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "11"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "28"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 12 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "12"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "28"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 13 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "13"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "28"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 14 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "14"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "28"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 15 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "15"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "28"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 16 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "16"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "30"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 17 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "17"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "30"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 18 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "18"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "39"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 19 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "19"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "51"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 20 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "20"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "104"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 21 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "21"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "204"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 22 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "22"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "433"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 23 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "23"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "602"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 24 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "24"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "833"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 25 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "25"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "977"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 26 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "26"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1261"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 27 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "27"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1766"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 28 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "28"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "2337"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 29 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "29"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "3150"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 1 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "1"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "4212"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 2 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "2"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "4812"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 3 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "3"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "5328"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 4 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "4"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "5766"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 5 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "5"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "6284"}], "}"}]}], "}"}]}], ";"}]}], "Input",
 CellChangeTimes->{{3.7924077838559713`*^9, 3.792407830214768*^9}, {
   3.792408963109198*^9, 3.792408967530655*^9}, 3.792409008083391*^9, 
   3.792409046879936*^9, {3.792409099768856*^9, 3.792409136364286*^9}, {
   3.792489282581387*^9, 3.7924893596406918`*^9}, {3.792489389667388*^9, 
   3.792489389757371*^9}, {3.7924894249460773`*^9, 3.792489425040147*^9}, 
   3.7924896680441647`*^9, {3.792489706010386*^9, 3.792489772898851*^9}, {
   3.792489852178585*^9, 3.792489852349531*^9}, {3.7924899225501738`*^9, 
   3.792489936530566*^9}, {3.792490674822529*^9, 3.792490697162973*^9}, {
   3.79249073839147*^9, 3.792490740147924*^9}},
 CellLabel->"In[13]:=",ExpressionUUID->"5857984b-0e61-419b-9ed3-60bace8ddb01"]
}, Closed]],

Cell[CellGroupData[{

Cell["Iran", "Subsection",
 CellChangeTimes->{{3.792407845428505*^9, 
  3.792407845888639*^9}},ExpressionUUID->"b46d4f93-d739-429c-b08b-\
f9375ef80102"],

Cell[BoxData[{
 RowBox[{
  RowBox[{
   RowBox[{"data", "[", "qom", "]"}], "=", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 19 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "19"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "2"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 20 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "20"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "4"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 21 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "21"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "11"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 22 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "22"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "19"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 23 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "23"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "26"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 24 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "24"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "34"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 25 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "25"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "50"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 26 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "26"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "65"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 27 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "27"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "72"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 28 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "28"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "88"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 29 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "29"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "109"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 1 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "1"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "139"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 2 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "2"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "196"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 3 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "3"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "253"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 4 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "4"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "354"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 5 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "5"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "386"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 6 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "6"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "523"}], "}"}]}], "}"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"data", "[", "tehran", "]"}], "=", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 19 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "19"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 20 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "20"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 21 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "21"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "4"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 22 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "22"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "6"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 23 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "23"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "10"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 24 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "24"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "13"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 25 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "25"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "21"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 26 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "26"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "25"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 27 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "27"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "63"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 28 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "28"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "127"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 29 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "29"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "179"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 1 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "1"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "349"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 2 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "2"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "696"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 3 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "3"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1043"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 4 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "4"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1296"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 5 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "5"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1352"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 6 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "6"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1413"}], "}"}]}], "}"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"data", "[", "iran", "]"}], "=", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 19 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "19"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "2"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 20 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "20"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "5"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 21 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "21"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "18"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 22 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "22"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "28"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 23 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "23"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "43"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 24 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "24"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "61"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 25 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "25"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "95"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 26 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "26"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "139"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 27 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "27"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "245"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 28 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "28"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "388"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 29 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "29"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "593"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 1 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "1"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "978"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 2 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "2"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1501"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 3 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "3"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "2336"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 4 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "4"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "2922"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 5 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "5"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "3513"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 6 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "6"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "4747"}], "}"}]}], "}"}]}], ";"}]}], "Input",
 CellChangeTimes->{{3.792408325618189*^9, 3.792408332628201*^9}, {
  3.792408418103574*^9, 3.7924084265547867`*^9}, {3.792408491711178*^9, 
  3.792408491905612*^9}, {3.792408593283194*^9, 3.792408594767592*^9}, {
  3.792408727208715*^9, 3.792408728726267*^9}, {3.792408875317275*^9, 
  3.792408892562455*^9}, {3.792490246955002*^9, 3.792490297696144*^9}, {
  3.792490330853587*^9, 3.792490357916664*^9}},
 CellLabel->"In[16]:=",ExpressionUUID->"29b45378-c32a-4d18-9fca-51a21d6e8412"]
}, Closed]],

Cell[CellGroupData[{

Cell["Italy", "Subsection",
 CellChangeTimes->{{3.7924065108746233`*^9, 3.7924065124830437`*^9}, {
  3.792408895765637*^9, 
  3.792408897004243*^9}},ExpressionUUID->"acb0c4e1-ed36-4927-9945-\
eaa6faf42bd7"],

Cell[BoxData[{
 RowBox[{
  RowBox[{
   RowBox[{"data", "[", "lombardy", "]"}], "=", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 31 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "31"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 6 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "6"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 21 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "21"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "15"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 22 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "22"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "55"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 23 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "23"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "112"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 24 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "24"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "173"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 25 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "25"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "240"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 26 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "26"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "305"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 27 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "27"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "403"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 28 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "28"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "531"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 29 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "29"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "615"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 1 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "1"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "984"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 2 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "2"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1254"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 3 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "3"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1520"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 4 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "4"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1820"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 5 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "5"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "2251"}], "}"}]}], "}"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"data", "[", "veneto", "]"}], "=", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 31 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "31"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 6 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "6"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 21 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "21"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "2"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 22 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "22"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "18"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 23 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "23"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "25"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 24 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "24"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "32"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 25 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "25"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "43"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 26 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "26"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "71"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 27 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "27"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "111"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 28 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "28"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "151"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 29 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "29"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "191"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 1 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "1"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "263"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 2 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "2"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "273"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 3 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "3"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "307"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 4 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "4"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "360"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 5 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "5"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "407"}], "}"}]}], "}"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"data", "[", "emiliaRomagna", "]"}], "=", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 31 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "31"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 6 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "6"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 21 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "21"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 22 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "22"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "2"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 23 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "23"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "9"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 24 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "24"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "18"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 25 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "25"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "26"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 26 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "26"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "47"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 27 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "27"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "97"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 28 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "28"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "145"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 29 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "29"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "217"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 1 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "1"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "285"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 2 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "2"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "335"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 3 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "3"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "420"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 4 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "4"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "544"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 5 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "5"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "698"}], "}"}]}], "}"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"data", "[", "italy", "]"}], "=", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 31 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "31"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "2"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 6 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "6"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "3"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 21 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "21"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "20"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 22 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "22"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "79"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 23 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "23"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "150"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 24 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "24"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "227"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 25 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "25"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "320"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 26 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "26"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "445"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 27 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "27"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "650"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 28 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "28"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "888"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 29 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "29"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1128"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 1 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "1"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1694"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 2 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "2"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "2036"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 3 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "3"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "2502"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 4 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "4"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "3089"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 5 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "5"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "3858"}], "}"}]}], "}"}]}], ";"}]}], "Input",
 CellChangeTimes->{{3.792410416156583*^9, 3.792410424312682*^9}, {
  3.792410553019689*^9, 3.792410596562765*^9}, {3.792410658212964*^9, 
  3.792410663466379*^9}, {3.792410727875389*^9, 3.792410728113961*^9}, {
  3.792491443559314*^9, 3.792491511715762*^9}},
 CellLabel->"In[19]:=",ExpressionUUID->"0ed97899-2df3-4ea4-9298-2a341c18e047"]
}, Closed]],

Cell[CellGroupData[{

Cell["Germany", "Subsection",
 CellChangeTimes->{{3.7924065108746233`*^9, 3.7924065124830437`*^9}, {
  3.792408895765637*^9, 3.792408897004243*^9}, {3.7924109217038193`*^9, 
  3.7924109255402613`*^9}},ExpressionUUID->"a86e61cc-6045-44ae-92d3-\
1bc102ff65a6"],

Cell[BoxData[{
 RowBox[{
  RowBox[{
   RowBox[{"data", "[", "badenWurttemberg", "]"}], "=", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 24 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "24"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 25 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "25"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 26 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "26"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "3"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 27 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "27"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "6"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 28 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "28"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "10"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 29 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "29"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "14"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 1 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "1"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "15"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 2 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "2"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "19"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 3 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "3"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "26"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 4 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "4"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "44"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 5 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "5"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "65"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 6 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "6"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "91"}], "}"}]}], "}"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"data", "[", "bavaria", "]"}], "=", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 24 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "24"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "14"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 25 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "25"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "14"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 26 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "26"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "14"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 27 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "27"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "14"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 28 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "28"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "15"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 29 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "29"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "15"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 1 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "1"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "19"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 2 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "2"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "25"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 3 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "3"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "35"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 4 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "4"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "48"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 5 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "5"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "52"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 6 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "6"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "79"}], "}"}]}], "}"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"data", "[", "northRhineWestpharia", "]"}], "=", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 24 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "24"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 25 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "25"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 26 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "26"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "2"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 27 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "27"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "4"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 28 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "28"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "25"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 29 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "29"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "30"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 1 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "1"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "66"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 2 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "2"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "86"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 3 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "3"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "101"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 4 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "4"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "111"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 5 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "5"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "175"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 6 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "6"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "281"}], "}"}]}], "}"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"data", "[", "germany", "]"}], "=", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 24 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "24"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "16"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 25 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "25"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "18"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 26 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "26"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "21"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 27 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "27"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "26"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 28 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "28"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "53"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 29 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "29"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "66"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 1 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "1"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "117"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 2 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "2"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "150"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 3 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "3"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "188"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 4 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "4"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "240"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 5 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "5"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "349"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 6 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "6"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "534"}], "}"}]}], "}"}]}], ";"}]}], "Input",
 CellChangeTimes->{{3.7924113618762617`*^9, 3.792411388336501*^9}, {
  3.792411419467105*^9, 3.7924114258652*^9}, {3.792411464979887*^9, 
  3.7924114748374577`*^9}, {3.792411508844974*^9, 3.792411514843701*^9}, {
  3.79241155087743*^9, 3.792411551050804*^9}, {3.7924913533082867`*^9, 
  3.792491402137035*^9}},
 CellLabel->"In[23]:=",ExpressionUUID->"4eb011af-d459-49ed-b93d-9844852ea573"]
}, Closed]],

Cell[CellGroupData[{

Cell["Singapore", "Subsection",
 CellChangeTimes->{{3.792416695183041*^9, 
  3.792416696375733*^9}},ExpressionUUID->"d46d0b4d-4057-4c21-b30f-\
910c7bee53b3"],

Cell[BoxData[
 RowBox[{
  RowBox[{
   RowBox[{"data", "[", "singapore", "]"}], "=", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 8 Dec 2019\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2019", ",", "12", ",", "8"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 10 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "10"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 15 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "15"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 16 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "16"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 17 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "17"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 18 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "18"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 19 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "19"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 20 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "20"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 21 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "21"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 22 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "22"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 23 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "23"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 24 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "24"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "3"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 25 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "25"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "3"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 26 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "26"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "4"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 27 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "27"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "5"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 28 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "28"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "7"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 29 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "29"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "10"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 30 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "30"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "13"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 31 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "31"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "16"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 1 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "1"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "18"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 2 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "2"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "18"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 3 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "3"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "18"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 4 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "4"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "24"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 5 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "5"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "28"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 6 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "6"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "30"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 7 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "7"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "33"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 8 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "8"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "40"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 9 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "9"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "43"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 10 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "10"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "45"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 11 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "11"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "47"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 12 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "12"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "50"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 13 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "13"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "58"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 14 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "14"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "67"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 15 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "15"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "72"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 16 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "16"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "75"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 17 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "17"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "77"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 18 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "18"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "81"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 19 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "19"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "84"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 20 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "20"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "85"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 21 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "21"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "86"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 22 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "22"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "89"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 23 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "23"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "89"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 24 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "24"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "90"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 25 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "25"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "91"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 26 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "26"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "93"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 27 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "27"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "96"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 28 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "28"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "98"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 29 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "29"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "102"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 1 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "1"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "106"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 2 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "2"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "108"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 3 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "3"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "110"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 4 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "4"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "112"}], "}"}]}], "}"}]}], ";"}]], "Input",
 CellChangeTimes->{{3.792416723772366*^9, 3.79241673757131*^9}},
 CellLabel->"In[27]:=",ExpressionUUID->"a1174f9d-800e-4ff5-ae51-9844c48f05fe"]
}, Closed]],

Cell[CellGroupData[{

Cell["China, provinces", "Subsection",
 CellChangeTimes->{{3.7924059491228113`*^9, 3.7924059496617517`*^9}, {
  3.792406487553383*^9, 3.792406503889235*^9}, {3.79248823012183*^9, 
  3.792488232608021*^9}},ExpressionUUID->"aa3a5ecc-161f-4bf5-b68b-\
fac158ec287c"],

Cell[BoxData[{
 RowBox[{
  RowBox[{
   RowBox[{"data", "[", "henan", "]"}], "=", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 11 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "11"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 12 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "12"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 13 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "13"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 14 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "14"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 15 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "15"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 16 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "16"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 17 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "17"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 18 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "18"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 19 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "19"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 20 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "20"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 21 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "21"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 22 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "22"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "5"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 23 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "23"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "9"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 24 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "24"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "32"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 25 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "25"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "83"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 26 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "26"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "128"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 27 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "27"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "168"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 28 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "28"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "206"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 29 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "29"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "278"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 30 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "30"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "352"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 31 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "31"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "422"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 1 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "1"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "493"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 2 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "2"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "566"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 3 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "3"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "675"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 4 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "4"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "764"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 5 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "5"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "851"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 6 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "6"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "914"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 7 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "7"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "980"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 8 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "8"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1033"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 9 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "9"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1073"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 10 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "10"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1105"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 11 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "11"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1135"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 12 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "12"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1169"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 13 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "13"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1184"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 14 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "14"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1212"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 15 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "15"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1231"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 16 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "16"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1246"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 17 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "17"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1257"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 18 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "18"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1262"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 19 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "19"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1266"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 20 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "20"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1268"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 21 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "21"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1271"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 22 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "22"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1272"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 23 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "23"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1272"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 24 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "24"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1272"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 25 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "25"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1272"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 26 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "26"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1273"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 27 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "27"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1273"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 28 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "28"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1273"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 29 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "29"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1273"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 1 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "1"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1273"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 2 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "2"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1273"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 3 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "3"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1273"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 4 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "4"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1273"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 5 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "5"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "1273"}], "}"}]}], "}"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"data", "[", "jiangsu", "]"}], "=", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 8 Dec 2019\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2019", ",", "12", ",", "8"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 10 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "10"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 15 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "15"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 16 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "16"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 17 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "17"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 18 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "18"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 19 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "19"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 20 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "20"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 21 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "21"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 22 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "22"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "4"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 23 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "23"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "9"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 24 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "24"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "18"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 25 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "25"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "31"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 26 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "26"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "47"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 27 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "27"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "70"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 28 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "28"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "99"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 29 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "29"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "129"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 30 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "30"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "168"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 31 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "31"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "202"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 1 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "1"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "236"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 2 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "2"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "271"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 3 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "3"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "308"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 4 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "4"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "341"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 5 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "5"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "373"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 6 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "6"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "408"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 7 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "7"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "439"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 8 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "8"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "468"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 9 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "9"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "492"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 10 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "10"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "515"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 11 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "11"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "543"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 12 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "12"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "570"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 13 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "13"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "593"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 14 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "14"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "604"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 15 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "15"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "617"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 16 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "16"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "626"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 17 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "17"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "629"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 18 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "18"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "631"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 19 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "19"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "631"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 20 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "20"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "631"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 21 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "21"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "631"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 22 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "22"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "631"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 23 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "23"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "631"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 24 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "24"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "631"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 25 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "25"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "631"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 26 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "26"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "631"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 27 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "27"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "631"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 28 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "28"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "631"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 29 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "29"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "631"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 1 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "1"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "631"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 2 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "2"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "631"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 3 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "3"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "631"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 4 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "4"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "631"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 5 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "5"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "631"}], "}"}]}], "}"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"data", "[", "nanjing", "]"}], "=", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 8 Dec 2019\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2019", ",", "12", ",", "8"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 10 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "10"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 15 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "15"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 16 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "16"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 17 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "17"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 18 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "18"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 19 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "19"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 20 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "20"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 21 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "21"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 22 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "22"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "2"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 23 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "23"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "3"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 24 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "24"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "4"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 25 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "25"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "7"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 26 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "26"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "7"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 27 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "27"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "10"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 28 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "28"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "14"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 29 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "29"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "19"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 30 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "30"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "25"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 31 Jan 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "1", ",", "31"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "28"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 1 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "1"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "35"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 2 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "2"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "40"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 3 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "3"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "44"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 4 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "4"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "47"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 5 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "5"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "52"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 6 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "6"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "57"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 7 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "7"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "65"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 8 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "8"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "71"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 9 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "9"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "78"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 10 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "10"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "84"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 11 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "11"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "87"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 12 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "12"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "90"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 13 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "13"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "91"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 14 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "14"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "91"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 15 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "15"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "92"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 16 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "16"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "92"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 17 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "17"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "92"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 18 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "18"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "93"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 19 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "19"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "93"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 20 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "20"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "93"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 21 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "21"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "93"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 22 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "22"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "93"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 23 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "23"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "93"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 24 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "24"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "93"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 25 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "25"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "93"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 26 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "26"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "93"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 27 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "27"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "93"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Fri 28 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "28"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "93"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sat 29 Feb 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "2", ",", "29"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "93"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Sun 1 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "1"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "93"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Mon 2 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "2"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "93"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Tue 3 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "3"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "93"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Wed 4 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "4"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "93"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       TemplateBox[{RowBox[{
           StyleBox[
           "\"Day: \"", FontColor -> GrayLevel[0.5], FontWeight -> Plain], 
           "\"Thu 5 Mar 2020\""}],RowBox[{"DateObject", "[", 
           RowBox[{
             RowBox[{"{", 
               RowBox[{"2020", ",", "3", ",", "5"}], "}"}], ",", "\"Day\"", 
             ",", "\"Gregorian\"", ",", "8.`"}], "]"}]},
        "DateObject",
        Editable->False], ",", "93"}], "}"}]}], "}"}]}], ";"}]}], "Input",
 CellChangeTimes->{{3.792488473082945*^9, 3.792488510755028*^9}, {
  3.7924885450553837`*^9, 3.792488546496451*^9}, {3.792488593376514*^9, 
  3.7924886615762157`*^9}},
 CellLabel->"In[28]:=",ExpressionUUID->"2990918d-396e-41de-baf5-e9b38efc4df5"]
}, Closed]]
}, Closed]],

Cell[CellGroupData[{

Cell["Log plots", "Section",
 CellChangeTimes->{{3.7888624043650217`*^9, 3.788862404849378*^9}, {
  3.790142272668675*^9, 3.790142273546082*^9}, {3.7923311909146843`*^9, 
  3.792331192275591*^9}, {3.7924108873348427`*^9, 
  3.792410888841764*^9}},ExpressionUUID->"70a2c939-a0a5-43e3-993c-\
951bfa596cb6"],

Cell[CellGroupData[{

Cell["Definitions", "Subsection",
 CellChangeTimes->{{3.7924108916656017`*^9, 
  3.7924108930719337`*^9}},ExpressionUUID->"8003d00d-de35-421b-ae44-\
941251564497"],

Cell[BoxData[{
 RowBox[{"<<", "MaTeX`"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"FS", "=", "FullSimplify"}], ";"}]}], "Input",
 CellLabel->"In[31]:=",ExpressionUUID->"2795cdbc-d9bd-4efa-8850-383d99f6b973"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"count", " ", "the", " ", "length", " ", "of", " ", "keys"}], " ", 
   "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{
     RowBox[{"lengthSum", "[", "Ltt_List", "]"}], ":=", 
     RowBox[{"Table", "[", 
      RowBox[{
       RowBox[{"Sum", "[", 
        RowBox[{
         RowBox[{"Ltt", "[", 
          RowBox[{"[", "i1", "]"}], "]"}], ",", 
         RowBox[{"{", 
          RowBox[{"i1", ",", "j1"}], "}"}]}], "]"}], ",", 
       RowBox[{"{", 
        RowBox[{"j1", ",", 
         RowBox[{"Length", "@", "Ltt"}]}], "}"}]}], "]"}]}], ";"}], 
   "\[IndentingNewLine]", "\[IndentingNewLine]", 
   RowBox[{"(*", " ", 
    RowBox[{
     RowBox[{"count", " ", "the", " ", "days", " ", "since", " ", "2020"}], 
     ",", " ", 
     RowBox[{"Apply", " ", 
      RowBox[{"Log", "[", 
       RowBox[{"10", ",", "#"}], "]"}], " ", "to", " ", "the", " ", "number", 
      " ", "of", " ", "confirmed", " ", "cases"}]}], " ", "*)"}], 
   "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{
     RowBox[{"generateDiffLog", "[", "input_", "]"}], ":=", 
     RowBox[{"Module", "[", 
      RowBox[{
       RowBox[{"{", "inputDiff", "}"}], ",", "\[IndentingNewLine]", 
       RowBox[{
        RowBox[{"inputDiff", "=", 
         RowBox[{
          RowBox[{"Table", "[", 
           RowBox[{
            RowBox[{"Join", "[", 
             RowBox[{
              RowBox[{"{", 
               RowBox[{"DateDifference", "[", 
                RowBox[{
                 RowBox[{"DateObject", "[", 
                  RowBox[{
                   RowBox[{"{", 
                    RowBox[{"2019", ",", "12", ",", "31"}], "}"}], ",", 
                   "\"\<Day\>\""}], "]"}], ",", 
                 RowBox[{"input", "[", 
                  RowBox[{"[", 
                   RowBox[{"ii", ",", "1"}], "]"}], "]"}], ",", 
                 "\"\<Day\>\""}], "]"}], "}"}], ",", 
              RowBox[{"input", "[", 
               RowBox[{"[", 
                RowBox[{"ii", ",", 
                 RowBox[{"2", ";;"}]}], "]"}], "]"}]}], "]"}], ",", 
            RowBox[{"{", 
             RowBox[{"ii", ",", 
              RowBox[{"Length", "@", "input"}]}], "}"}]}], "]"}], "/.", 
          RowBox[{
           TagBox[
            StyleBox[
             RowBox[{"Quantity", "[", 
              RowBox[{"x_", ",", "\"\<Days\>\""}], "]"}],
             ShowSpecialCharacters->False,
             ShowStringCharacters->True,
             NumberMarks->True],
            FullForm], "\[Rule]", "x"}]}]}], ";", "\[IndentingNewLine]", 
        RowBox[{"N", "[", 
         RowBox[{
          RowBox[{
           RowBox[{"{", 
            RowBox[{
             RowBox[{"#", "[", 
              RowBox[{"[", "1", "]"}], "]"}], ",", 
             RowBox[{"Log", "[", 
              RowBox[{"10", ",", 
               RowBox[{"#", "[", 
                RowBox[{"[", "2", "]"}], "]"}]}], "]"}]}], "}"}], "&"}], "/@",
           "inputDiff"}], "]"}]}]}], "\[IndentingNewLine]", "]"}]}], 
    ";"}]}]}]], "Input",
 CellChangeTimes->{{3.792404952257535*^9, 3.792404965318914*^9}, {
  3.792406225058473*^9, 3.792406225482078*^9}, {3.792411868753656*^9, 
  3.7924118714195538`*^9}, {3.7924119123244553`*^9, 3.792411922180119*^9}},
 CellLabel->"In[33]:=",ExpressionUUID->"0106ad6f-9774-4a7b-975c-56ef3c026944"],

Cell[BoxData[{
 RowBox[{"keyLengths", "=", 
  RowBox[{
   RowBox[{"Length", "/@", "keyList"}], "//", 
   "lengthSum"}]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"tableDataDL", "=", 
   RowBox[{"Table", "[", 
    RowBox[{
     RowBox[{"generateDiffLog", "@", 
      RowBox[{"data", "[", "keys", "]"}]}], ",", 
     RowBox[{"{", 
      RowBox[{"keys", ",", 
       RowBox[{"Flatten", "@", "keyList"}]}], "}"}]}], "]"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{"Length", "@", "tableDataDL"}]}], "Input",
 CellChangeTimes->{{3.792407620560524*^9, 3.7924076220895967`*^9}, {
  3.792411926432687*^9, 3.79241196689145*^9}},
 CellLabel->"In[35]:=",ExpressionUUID->"ff5b3e1f-0813-480f-bd5d-9d613cb6de1d"]
}, Closed]],

Cell[CellGroupData[{

Cell["List plots", "Subsection",
 CellChangeTimes->{{3.79240484370514*^9, 3.792404844851715*^9}, 
   3.792410897144473*^9, {3.7924121999807663`*^9, 
   3.792412200880723*^9}},ExpressionUUID->"12236821-699f-4437-a262-\
7ccc305fe20e"],

Cell[TextData[StyleBox["Little difference between China and Worldwide data",
 FontColor->RGBColor[0.5, 0, 0.5]]], "Text",
 CellChangeTimes->{{3.792405049019814*^9, 
  3.792405058066016*^9}},ExpressionUUID->"ad21bd10-b4dc-42ad-bdd5-\
062b1052191a"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"ListPlot", "[", 
    RowBox[{
     RowBox[{"tableDataDL", "[", 
      RowBox[{"[", 
       RowBox[{";;", 
        RowBox[{"keyLengths", "[", 
         RowBox[{"[", "1", "]"}], "]"}]}], "]"}], "]"}], ",", 
     RowBox[{"PlotLegends", "\[Rule]", 
      RowBox[{"keyList", "[", 
       RowBox[{"[", "1", "]"}], "]"}]}], ",", 
     RowBox[{"ImageSize", "\[Rule]", "400"}]}], "]"}], ",", 
   RowBox[{"ListPlot", "[", 
    RowBox[{
     RowBox[{"tableDataDL", "[", 
      RowBox[{"[", 
       RowBox[{
        RowBox[{
         RowBox[{"keyLengths", "[", 
          RowBox[{"[", "8", "]"}], "]"}], "+", "1"}], ";;", 
        RowBox[{"keyLengths", "[", 
         RowBox[{"[", "9", "]"}], "]"}]}], "]"}], "]"}], ",", 
     RowBox[{"PlotLegends", "\[Rule]", 
      RowBox[{"keyList", "[", 
       RowBox[{"[", "9", "]"}], "]"}]}], ",", 
     RowBox[{"ImageSize", "\[Rule]", "400"}]}], "]"}]}], "}"}]], "Input",
 CellChangeTimes->{{3.792407676114832*^9, 3.7924076783849382`*^9}, 
   3.792409913314866*^9, {3.7924119795934877`*^9, 3.792411981545884*^9}, {
   3.7924889310762863`*^9, 3.792488968381795*^9}, {3.792490069322221*^9, 
   3.7924900788386517`*^9}},
 CellLabel->"In[38]:=",ExpressionUUID->"67f741f5-25ea-414a-935f-7b2b5f53a90d"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"ListPlot", "[", 
    RowBox[{
     RowBox[{"tableDataDL", "[", 
      RowBox[{"[", 
       RowBox[{
        RowBox[{
         RowBox[{"keyLengths", "[", 
          RowBox[{"[", "1", "]"}], "]"}], "+", "1"}], ";;", 
        RowBox[{"keyLengths", "[", 
         RowBox[{"[", "2", "]"}], "]"}]}], "]"}], "]"}], ",", 
     RowBox[{"Joined", "\[Rule]", "True"}], ",", 
     RowBox[{"PlotLegends", "\[Rule]", 
      RowBox[{"keyList", "[", 
       RowBox[{"[", "2", "]"}], "]"}]}], ",", 
     RowBox[{"ImageSize", "\[Rule]", "400"}]}], "]"}], ",", 
   RowBox[{"ListPlot", "[", 
    RowBox[{
     RowBox[{"tableDataDL", "[", 
      RowBox[{"[", 
       RowBox[{
        RowBox[{
         RowBox[{"keyLengths", "[", 
          RowBox[{"[", "2", "]"}], "]"}], "+", "1"}], ";;", 
        RowBox[{"keyLengths", "[", 
         RowBox[{"[", "3", "]"}], "]"}]}], "]"}], "]"}], ",", 
     RowBox[{"Joined", "\[Rule]", "True"}], ",", 
     RowBox[{"PlotLegends", "\[Rule]", 
      RowBox[{"keyList", "[", 
       RowBox[{"[", "3", "]"}], "]"}]}], ",", 
     RowBox[{"ImageSize", "\[Rule]", "400"}]}], "]"}]}], "}"}]], "Input",
 CellChangeTimes->{{3.7924098321669292`*^9, 3.792409833252754*^9}, {
  3.792411985681341*^9, 3.792412008411683*^9}},
 CellLabel->"In[39]:=",ExpressionUUID->"d12c1522-107a-4910-8fda-62d932476355"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"ListPlot", "[", 
    RowBox[{
     RowBox[{"tableDataDL", "[", 
      RowBox[{"[", 
       RowBox[{
        RowBox[{
         RowBox[{"keyLengths", "[", 
          RowBox[{"[", "3", "]"}], "]"}], "+", "1"}], ";;", 
        RowBox[{"keyLengths", "[", 
         RowBox[{"[", "4", "]"}], "]"}]}], "]"}], "]"}], ",", 
     RowBox[{"Joined", "\[Rule]", "True"}], ",", 
     RowBox[{"PlotLegends", "\[Rule]", 
      RowBox[{"keyList", "[", 
       RowBox[{"[", "4", "]"}], "]"}]}], ",", 
     RowBox[{"ImageSize", "\[Rule]", "400"}]}], "]"}], ",", 
   "\[IndentingNewLine]", 
   RowBox[{"ListPlot", "[", 
    RowBox[{
     RowBox[{"tableDataDL", "[", 
      RowBox[{"[", 
       RowBox[{
        RowBox[{
         RowBox[{"keyLengths", "[", 
          RowBox[{"[", "4", "]"}], "]"}], "+", "1"}], ";;", 
        RowBox[{"keyLengths", "[", 
         RowBox[{"[", "5", "]"}], "]"}]}], "]"}], "]"}], ",", 
     RowBox[{"Joined", "\[Rule]", "True"}], ",", 
     RowBox[{"PlotLegends", "\[Rule]", 
      RowBox[{"keyList", "[", 
       RowBox[{"[", "5", "]"}], "]"}]}], ",", 
     RowBox[{"ImageSize", "\[Rule]", "400"}]}], "]"}]}], "}"}]], "Input",
 CellChangeTimes->{{3.792409206775073*^9, 3.792409214013227*^9}, {
  3.792409879819529*^9, 3.79240989385042*^9}, {3.7924120143706903`*^9, 
  3.792412024656868*^9}},
 CellLabel->"In[40]:=",ExpressionUUID->"19547657-a872-49f9-ae31-1047e9f52c97"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"ListPlot", "[", 
    RowBox[{
     RowBox[{"tableDataDL", "[", 
      RowBox[{"[", 
       RowBox[{
        RowBox[{
         RowBox[{"keyLengths", "[", 
          RowBox[{"[", "5", "]"}], "]"}], "+", "1"}], ";;", 
        RowBox[{"keyLengths", "[", 
         RowBox[{"[", "6", "]"}], "]"}]}], "]"}], "]"}], ",", 
     RowBox[{"Joined", "\[Rule]", "True"}], ",", 
     RowBox[{"PlotLegends", "\[Rule]", 
      RowBox[{"keyList", "[", 
       RowBox[{"[", "6", "]"}], "]"}]}], ",", 
     RowBox[{"ImageSize", "\[Rule]", "400"}]}], "]"}], ",", 
   "\[IndentingNewLine]", 
   RowBox[{"ListPlot", "[", 
    RowBox[{
     RowBox[{"tableDataDL", "[", 
      RowBox[{"[", 
       RowBox[{
        RowBox[{
         RowBox[{"keyLengths", "[", 
          RowBox[{"[", "6", "]"}], "]"}], "+", "1"}], ";;", 
        RowBox[{"keyLengths", "[", 
         RowBox[{"[", "7", "]"}], "]"}]}], "]"}], "]"}], ",", 
     RowBox[{"Joined", "\[Rule]", "True"}], ",", 
     RowBox[{"PlotLegends", "\[Rule]", 
      RowBox[{"keyList", "[", 
       RowBox[{"[", "7", "]"}], "]"}]}], ",", 
     RowBox[{"ImageSize", "\[Rule]", "400"}]}], "]"}]}], "}"}]], "Input",
 CellChangeTimes->{{3.792410749575594*^9, 3.792410762998015*^9}, {
  3.792411569300171*^9, 3.792411584864916*^9}, {3.792412029510743*^9, 
  3.7924120386303387`*^9}},
 CellLabel->"In[41]:=",ExpressionUUID->"f8c395d1-8f5c-4ddd-bfba-f85f071514b4"],

Cell[BoxData["keyList"], "Input",
 CellChangeTimes->{{3.792411661861949*^9, 3.792411662997383*^9}},
 CellLabel->"In[42]:=",ExpressionUUID->"a9e34469-adf0-444a-8507-a9e00ff4ab17"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"ListPlot", "[", 
    RowBox[{
     RowBox[{"tableDataDL", "[", 
      RowBox[{"[", 
       RowBox[{"{", 
        RowBox[{
        "1", ",", "8", ",", "14", ",", "17", ",", "21", ",", "25", ",", 
         "26"}], "}"}], "]"}], "]"}], ",", 
     RowBox[{"Joined", "\[Rule]", "True"}], ",", 
     RowBox[{"PlotLegends", "\[Rule]", 
      RowBox[{"{", 
       RowBox[{
       "\"\<PRC\>\"", ",", "\"\<Japan\>\"", ",", "\"\<ROK\>\"", ",", 
        "\"\<Iran\>\"", ",", "\"\<Italy\>\"", ",", "\"\<Germany\>\"", ",", 
        "\"\<Singapore\>\""}], "}"}]}], ",", 
     RowBox[{"ImageSize", "\[Rule]", "400"}]}], "]"}], ",", 
   "\[IndentingNewLine]", 
   RowBox[{"ListPlot", "[", 
    RowBox[{
     RowBox[{"tableDataDL", "[", 
      RowBox[{"[", 
       RowBox[{"{", 
        RowBox[{"1", ",", "4", ",", "14", ",", "21", ",", "25"}], "}"}], 
       "]"}], "]"}], ",", 
     RowBox[{"Joined", "\[Rule]", "True"}], ",", 
     RowBox[{"PlotLegends", "\[Rule]", 
      RowBox[{"{", 
       RowBox[{
       "\"\<PRC\>\"", ",", "\"\<Hokkaido\>\"", ",", "\"\<ROK\>\"", ",", 
        "\"\<Italy\>\"", ",", "\"\<Germany\>\""}], "}"}]}], ",", 
     RowBox[{"ImageSize", "\[Rule]", "400"}]}], "]"}]}], "}"}]], "Input",
 CellChangeTimes->{{3.792411658914178*^9, 3.792411659351799*^9}, {
  3.792412056723051*^9, 3.7924121134443703`*^9}, {3.7924167645411177`*^9, 
  3.792416771774617*^9}, {3.7924197673876343`*^9, 3.792419827234136*^9}},
 CellLabel->"In[43]:=",ExpressionUUID->"87572a55-b552-4dcd-a65b-51a5a57a1410"]
}, Closed]]
}, Open  ]],

Cell[CellGroupData[{

Cell["Fit", "Section",
 CellChangeTimes->{{3.792414025333708*^9, 
  3.792414026658732*^9}},ExpressionUUID->"8e3a97b3-377a-4861-80ad-\
ac1f12780e47"],

Cell[CellGroupData[{

Cell["Parallel translation ansatz", "Subsection",
 CellChangeTimes->{{3.792414028279345*^9, 3.792414031012329*^9}, {
  3.7924196049651127`*^9, 3.7924196056285458`*^9}, {3.792490392887279*^9, 
  3.792490393696813*^9}},ExpressionUUID->"14fe9a97-08de-4000-903e-\
413af7fb7fdc"],

Cell[TextData[StyleBox["We obtain the logistic fit of Chinese data, and move \
it by parallel translation to fit the data for other countries",
 FontSize->16,
 FontColor->RGBColor[0.5, 0, 0.5]]], "Text",
 CellChangeTimes->{{3.792412972277194*^9, 3.792413039698742*^9}, {
  3.792419595110043*^9, 
  3.792419597798645*^9}},ExpressionUUID->"1ce7c1ea-0d17-4c16-b046-\
4d2cf02d1366"],

Cell[BoxData[{
 RowBox[{
  RowBox[{
   RowBox[{"fl", "[", "x_", "]"}], "=", 
   RowBox[{"ca", "+", 
    RowBox[{"Log", "[", 
     FractionBox["1", 
      RowBox[{"1", "+", 
       RowBox[{"Exp", "[", 
        RowBox[{"cc", "+", 
         RowBox[{"cd", "*", "x"}]}], "]"}]}]], "]"}]}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"fl2", "[", "x_", "]"}], "=", 
   RowBox[{"ce", "+", 
    FractionBox["110", "23"], "+", 
    RowBox[{"Log", "[", 
     FractionBox["1", 
      RowBox[{"1", "+", 
       SuperscriptBox["\[ExponentialE]", 
        RowBox[{"cf", "+", 
         FractionBox["266", "43"], "-", 
         FractionBox[
          RowBox[{"16", " ", "x"}], "81"]}]]}]], "]"}]}]}], ";"}]}], "Input",
 CellChangeTimes->{{3.792415350279331*^9, 3.792415350440317*^9}, {
  3.792490949807394*^9, 3.7924909568296967`*^9}},
 CellLabel->"In[44]:=",ExpressionUUID->"f670800e-181a-4d57-a5dd-553b6533cb45"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "China", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{
     RowBox[{"fit", "[", 
      RowBox[{"1", ",", "x_"}], "]"}], "=", 
     RowBox[{
      RowBox[{"fl", "[", "x", "]"}], "/.", 
      RowBox[{"FindFit", "[", 
       RowBox[{
        RowBox[{"tableDataDL", "[", 
         RowBox[{"[", 
          RowBox[{"1", ",", 
           RowBox[{"8", ";;"}]}], "]"}], "]"}], ",", 
        RowBox[{"fl", "[", "x", "]"}], ",", 
        RowBox[{"{", 
         RowBox[{"ca", ",", "cc", ",", "cd"}], "}"}], ",", "x"}], "]"}]}]}], 
    ";"}], "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{"pfit", "[", 
     RowBox[{"1", ",", "days_"}], "]"}], "=", 
    RowBox[{
     RowBox[{"fit", "[", 
      RowBox[{"1", ",", "days"}], "]"}], "/.", 
     RowBox[{
      TagBox[
       StyleBox[
        RowBox[{"Plus", "[", 
         RowBox[{"ca_", ",", 
          RowBox[{"Log", "[", 
           RowBox[{"Power", "[", 
            RowBox[{
             RowBox[{"Plus", "[", 
              RowBox[{"1", ",", 
               RowBox[{"Power", "[", 
                RowBox[{"E", ",", 
                 RowBox[{"Plus", "[", 
                  RowBox[{"cb_", ",", 
                   RowBox[{"Times", "[", 
                    RowBox[{"cc_", ",", "days"}], "]"}]}], "]"}]}], "]"}]}], 
              "]"}], ",", 
             RowBox[{"-", "1"}]}], "]"}], "]"}]}], "]"}],
        ShowSpecialCharacters->False,
        ShowStringCharacters->True,
        NumberMarks->True],
       FullForm], "\[RuleDelayed]", 
      TagBox[
       StyleBox[
        RowBox[{"Plus", "[", 
         RowBox[{
          RowBox[{
           RowBox[{
            RowBox[{"Rationalize", "[", 
             RowBox[{"#", ",", 
              SuperscriptBox["10", 
               RowBox[{"-", "3"}]]}], "]"}], "&"}], "@", 
           RowBox[{"N", "[", "ca", "]"}]}], ",", 
          RowBox[{"Log", "[", 
           RowBox[{"Power", "[", 
            RowBox[{
             RowBox[{"Plus", "[", 
              RowBox[{"1", ",", 
               RowBox[{"Power", "[", 
                RowBox[{"E", ",", 
                 RowBox[{"Plus", "[", 
                  RowBox[{
                   RowBox[{
                    RowBox[{
                    RowBox[{"Rationalize", "[", 
                    RowBox[{"#", ",", 
                    SuperscriptBox["10", 
                    RowBox[{"-", "3"}]]}], "]"}], "&"}], "@", 
                    RowBox[{"N", "[", "cb", "]"}]}], ",", 
                   RowBox[{"Times", "[", 
                    RowBox[{
                    RowBox[{
                    RowBox[{
                    RowBox[{"Rationalize", "[", 
                    RowBox[{"#", ",", 
                    SuperscriptBox["10", 
                    RowBox[{"-", "3"}]]}], "]"}], "&"}], "@", 
                    RowBox[{"N", "[", "cc", "]"}]}], ",", "days"}], "]"}]}], 
                  "]"}]}], "]"}]}], "]"}], ",", 
             RowBox[{"-", "1"}]}], "]"}], "]"}]}], "]"}],
        ShowSpecialCharacters->False,
        ShowStringCharacters->True,
        NumberMarks->True],
       FullForm]}]}]}]}]}]], "Input",
 CellChangeTimes->{
  3.792414097506675*^9, {3.7924141859296494`*^9, 3.792414202006119*^9}, {
   3.792414283730913*^9, 3.79241435072346*^9}, {3.792414386748294*^9, 
   3.792414417301793*^9}, {3.7924145589436293`*^9, 3.792414559009358*^9}, {
   3.792490895953706*^9, 3.7924909074607353`*^9}},
 CellLabel->"In[46]:=",ExpressionUUID->"6043ee0f-0e5c-4dda-8302-fa30ee99fc83"],

Cell[BoxData[
 RowBox[{"Show", "[", 
  RowBox[{
   RowBox[{"Plot", "[", 
    RowBox[{
     RowBox[{"pfit", "[", 
      RowBox[{"1", ",", "days"}], "]"}], ",", 
     RowBox[{"{", 
      RowBox[{"days", ",", "10", ",", "80"}], "}"}], ",", 
     RowBox[{"PlotStyle", "\[Rule]", "Cyan"}]}], "]"}], ",", 
   RowBox[{"ListPlot", "[", 
    RowBox[{"tableDataDL", "[", 
     RowBox[{"[", "1", "]"}], "]"}], "]"}]}], "]"}]], "Input",
 CellChangeTimes->{{3.792414434357861*^9, 3.792414502662058*^9}},
 CellLabel->"In[48]:=",ExpressionUUID->"e3e4d4f8-f0ca-4742-aef8-95c17fcb7739"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"South", " ", "Korea"}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{"ClearAll", "[", 
     RowBox[{"ind", ",", "init"}], "]"}], ";"}], "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{"ind", "=", "14"}], ";"}], "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{"init", "=", 
     RowBox[{"-", "13"}]}], ";"}], "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{
     RowBox[{"fit", "[", 
      RowBox[{"ind", ",", "x_"}], "]"}], "=", 
     RowBox[{
      RowBox[{"fl", "[", "x", "]"}], "/.", 
      RowBox[{"FindFit", "[", 
       RowBox[{
        RowBox[{"tableDataDL", "[", 
         RowBox[{"[", 
          RowBox[{"ind", ",", 
           RowBox[{"init", ";;"}]}], "]"}], "]"}], ",", 
        RowBox[{"fl", "[", "x", "]"}], ",", 
        RowBox[{"{", 
         RowBox[{"ca", ",", "cc", ",", "cd"}], "}"}], ",", "x", ",", 
        RowBox[{"WorkingPrecision", "\[Rule]", "50"}]}], "]"}]}]}], ";"}], 
   "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{"pfit", "[", 
     RowBox[{"ind", ",", "days_"}], "]"}], "=", 
    RowBox[{
     RowBox[{"fit", "[", 
      RowBox[{"ind", ",", "days"}], "]"}], "/.", 
     RowBox[{
      TagBox[
       StyleBox[
        RowBox[{"Plus", "[", 
         RowBox[{"ca_", ",", 
          RowBox[{"Log", "[", 
           RowBox[{"Power", "[", 
            RowBox[{
             RowBox[{"Plus", "[", 
              RowBox[{"1", ",", 
               RowBox[{"Power", "[", 
                RowBox[{"E", ",", 
                 RowBox[{"Plus", "[", 
                  RowBox[{"cb_", ",", 
                   RowBox[{"Times", "[", 
                    RowBox[{"cc_", ",", "days"}], "]"}]}], "]"}]}], "]"}]}], 
              "]"}], ",", 
             RowBox[{"-", "1"}]}], "]"}], "]"}]}], "]"}],
        ShowSpecialCharacters->False,
        ShowStringCharacters->True,
        NumberMarks->True],
       FullForm], "\[RuleDelayed]", 
      TagBox[
       StyleBox[
        RowBox[{"Plus", "[", 
         RowBox[{
          RowBox[{
           RowBox[{
            RowBox[{"Rationalize", "[", 
             RowBox[{"#", ",", 
              SuperscriptBox["10", 
               RowBox[{"-", "3"}]]}], "]"}], "&"}], "@", 
           RowBox[{"N", "[", "ca", "]"}]}], ",", 
          RowBox[{"Log", "[", 
           RowBox[{"Power", "[", 
            RowBox[{
             RowBox[{"Plus", "[", 
              RowBox[{"1", ",", 
               RowBox[{"Power", "[", 
                RowBox[{"E", ",", 
                 RowBox[{"Plus", "[", 
                  RowBox[{
                   RowBox[{
                    RowBox[{
                    RowBox[{"Rationalize", "[", 
                    RowBox[{"#", ",", 
                    SuperscriptBox["10", 
                    RowBox[{"-", "3"}]]}], "]"}], "&"}], "@", 
                    RowBox[{"N", "[", "cb", "]"}]}], ",", 
                   RowBox[{"Times", "[", 
                    RowBox[{
                    RowBox[{
                    RowBox[{
                    RowBox[{"Rationalize", "[", 
                    RowBox[{"#", ",", 
                    SuperscriptBox["10", 
                    RowBox[{"-", "3"}]]}], "]"}], "&"}], "@", 
                    RowBox[{"N", "[", "cc", "]"}]}], ",", "days"}], "]"}]}], 
                  "]"}]}], "]"}]}], "]"}], ",", 
             RowBox[{"-", "1"}]}], "]"}], "]"}]}], "]"}],
        ShowSpecialCharacters->False,
        ShowStringCharacters->True,
        NumberMarks->True],
       FullForm]}]}]}], "\[IndentingNewLine]", "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{
     RowBox[{"lfit", "[", 
      RowBox[{"ind", ",", "x_"}], "]"}], "=", 
     RowBox[{
      RowBox[{"fl2", "[", "x", "]"}], "/.", 
      RowBox[{"FindFit", "[", 
       RowBox[{
        RowBox[{"tableDataDL", "[", 
         RowBox[{"[", 
          RowBox[{"ind", ",", 
           RowBox[{"init", ";;"}]}], "]"}], "]"}], ",", 
        RowBox[{"fl2", "[", "x", "]"}], ",", 
        RowBox[{"{", 
         RowBox[{"ce", ",", "cf"}], "}"}], ",", "x"}], "]"}]}]}], ";"}], 
   "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{"plfit", "[", 
     RowBox[{"ind", ",", "days_"}], "]"}], "=", 
    RowBox[{
     RowBox[{"lfit", "[", 
      RowBox[{"ind", ",", "days"}], "]"}], "/.", 
     RowBox[{
      TagBox[
       StyleBox[
        RowBox[{"Plus", "[", 
         RowBox[{"ca_", ",", 
          RowBox[{"Log", "[", 
           RowBox[{"Power", "[", 
            RowBox[{
             RowBox[{"Plus", "[", 
              RowBox[{"1", ",", 
               RowBox[{"Power", "[", 
                RowBox[{"E", ",", 
                 RowBox[{"Plus", "[", 
                  RowBox[{"cb_", ",", 
                   RowBox[{"Times", "[", 
                    RowBox[{"cc_", ",", "days"}], "]"}]}], "]"}]}], "]"}]}], 
              "]"}], ",", 
             RowBox[{"-", "1"}]}], "]"}], "]"}]}], "]"}],
        ShowSpecialCharacters->False,
        ShowStringCharacters->True,
        NumberMarks->True],
       FullForm], "\[RuleDelayed]", 
      TagBox[
       StyleBox[
        RowBox[{"Plus", "[", 
         RowBox[{
          RowBox[{
           RowBox[{
            RowBox[{"Rationalize", "[", 
             RowBox[{"#", ",", 
              SuperscriptBox["10", 
               RowBox[{"-", "3"}]]}], "]"}], "&"}], "@", 
           RowBox[{"N", "[", "ca", "]"}]}], ",", 
          RowBox[{"Log", "[", 
           RowBox[{"Power", "[", 
            RowBox[{
             RowBox[{"Plus", "[", 
              RowBox[{"1", ",", 
               RowBox[{"Power", "[", 
                RowBox[{"E", ",", 
                 RowBox[{"Plus", "[", 
                  RowBox[{
                   RowBox[{
                    RowBox[{
                    RowBox[{"Rationalize", "[", 
                    RowBox[{"#", ",", 
                    SuperscriptBox["10", 
                    RowBox[{"-", "3"}]]}], "]"}], "&"}], "@", 
                    RowBox[{"N", "[", "cb", "]"}]}], ",", 
                   RowBox[{"Times", "[", 
                    RowBox[{
                    RowBox[{
                    RowBox[{
                    RowBox[{"Rationalize", "[", 
                    RowBox[{"#", ",", 
                    SuperscriptBox["10", 
                    RowBox[{"-", "3"}]]}], "]"}], "&"}], "@", 
                    RowBox[{"N", "[", "cc", "]"}]}], ",", "days"}], "]"}]}], 
                  "]"}]}], "]"}]}], "]"}], ",", 
             RowBox[{"-", "1"}]}], "]"}], "]"}]}], "]"}],
        ShowSpecialCharacters->False,
        ShowStringCharacters->True,
        NumberMarks->True],
       FullForm]}]}]}]}]}]], "Input",
 CellChangeTimes->{{3.792414714792603*^9, 3.792414728178721*^9}, {
   3.792414814323546*^9, 3.7924148435972767`*^9}, 3.7924153465348988`*^9, {
   3.792490786674951*^9, 3.792490869165153*^9}, {3.792490969810691*^9, 
   3.792490985362088*^9}},
 CellLabel->"In[49]:=",ExpressionUUID->"580ac337-6de2-4716-96bb-3433c1fc610b"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"Show", "[", 
    RowBox[{
     RowBox[{"Plot", "[", 
      RowBox[{
       RowBox[{"pfit", "[", 
        RowBox[{"14", ",", "days"}], "]"}], ",", 
       RowBox[{"{", 
        RowBox[{"days", ",", "10", ",", "80"}], "}"}], ",", 
       RowBox[{"PlotStyle", "\[Rule]", "Cyan"}], ",", 
       RowBox[{"PlotRange", "\[Rule]", 
        RowBox[{"{", 
         RowBox[{"0", ",", "4.5"}], "}"}]}]}], "]"}], ",", 
     RowBox[{"ListPlot", "[", 
      RowBox[{"tableDataDL", "[", 
       RowBox[{"[", "14", "]"}], "]"}], "]"}], ",", 
     RowBox[{"ImageSize", "\[Rule]", "300"}]}], "]"}], ",", 
   RowBox[{"Show", "[", 
    RowBox[{
     RowBox[{"Plot", "[", 
      RowBox[{
       RowBox[{"plfit", "[", 
        RowBox[{"14", ",", "days"}], "]"}], ",", 
       RowBox[{"{", 
        RowBox[{"days", ",", "10", ",", "80"}], "}"}], ",", 
       RowBox[{"PlotStyle", "\[Rule]", "Cyan"}], ",", 
       RowBox[{"PlotRange", "\[Rule]", 
        RowBox[{"{", 
         RowBox[{"0", ",", "4.5"}], "}"}]}]}], "]"}], ",", 
     RowBox[{"ListPlot", "[", 
      RowBox[{"tableDataDL", "[", 
       RowBox[{"[", "14", "]"}], "]"}], "]"}], ",", 
     RowBox[{"ImageSize", "\[Rule]", "300"}]}], "]"}]}], "}"}]], "Input",
 CellChangeTimes->{{3.792414795717857*^9, 3.792414803419549*^9}, 
   3.792415139163083*^9, {3.792415395752967*^9, 3.7924154057799883`*^9}},
 CellLabel->"In[56]:=",ExpressionUUID->"df70346c-6ab9-4a2d-8943-d0cfd68d0330"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "Iran", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{"ClearAll", "[", 
     RowBox[{"ind", ",", "init"}], "]"}], ";"}], "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{"ind", "=", "17"}], ";"}], "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{"init", "=", "8"}], ";"}], "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{
     RowBox[{"fit", "[", 
      RowBox[{"ind", ",", "x_"}], "]"}], "=", 
     RowBox[{
      RowBox[{"fl", "[", "x", "]"}], "/.", 
      RowBox[{"FindFit", "[", 
       RowBox[{
        RowBox[{"tableDataDL", "[", 
         RowBox[{"[", 
          RowBox[{"ind", ",", 
           RowBox[{"init", ";;"}]}], "]"}], "]"}], ",", 
        RowBox[{"fl", "[", "x", "]"}], ",", 
        RowBox[{"{", 
         RowBox[{"ca", ",", "cc", ",", "cd"}], "}"}], ",", "x", ",", 
        RowBox[{"WorkingPrecision", "\[Rule]", "50"}]}], "]"}]}]}], ";"}], 
   "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{"pfit", "[", 
     RowBox[{"ind", ",", "days_"}], "]"}], "=", 
    RowBox[{
     RowBox[{"fit", "[", 
      RowBox[{"ind", ",", "days"}], "]"}], "/.", 
     RowBox[{
      TagBox[
       StyleBox[
        RowBox[{"Plus", "[", 
         RowBox[{"ca_", ",", 
          RowBox[{"Log", "[", 
           RowBox[{"Power", "[", 
            RowBox[{
             RowBox[{"Plus", "[", 
              RowBox[{"1", ",", 
               RowBox[{"Power", "[", 
                RowBox[{"E", ",", 
                 RowBox[{"Plus", "[", 
                  RowBox[{"cb_", ",", 
                   RowBox[{"Times", "[", 
                    RowBox[{"cc_", ",", "days"}], "]"}]}], "]"}]}], "]"}]}], 
              "]"}], ",", 
             RowBox[{"-", "1"}]}], "]"}], "]"}]}], "]"}],
        ShowSpecialCharacters->False,
        ShowStringCharacters->True,
        NumberMarks->True],
       FullForm], "\[RuleDelayed]", 
      TagBox[
       StyleBox[
        RowBox[{"Plus", "[", 
         RowBox[{
          RowBox[{
           RowBox[{
            RowBox[{"Rationalize", "[", 
             RowBox[{"#", ",", 
              SuperscriptBox["10", 
               RowBox[{"-", "3"}]]}], "]"}], "&"}], "@", 
           RowBox[{"N", "[", "ca", "]"}]}], ",", 
          RowBox[{"Log", "[", 
           RowBox[{"Power", "[", 
            RowBox[{
             RowBox[{"Plus", "[", 
              RowBox[{"1", ",", 
               RowBox[{"Power", "[", 
                RowBox[{"E", ",", 
                 RowBox[{"Plus", "[", 
                  RowBox[{
                   RowBox[{
                    RowBox[{
                    RowBox[{"Rationalize", "[", 
                    RowBox[{"#", ",", 
                    SuperscriptBox["10", 
                    RowBox[{"-", "3"}]]}], "]"}], "&"}], "@", 
                    RowBox[{"N", "[", "cb", "]"}]}], ",", 
                   RowBox[{"Times", "[", 
                    RowBox[{
                    RowBox[{
                    RowBox[{
                    RowBox[{"Rationalize", "[", 
                    RowBox[{"#", ",", 
                    SuperscriptBox["10", 
                    RowBox[{"-", "3"}]]}], "]"}], "&"}], "@", 
                    RowBox[{"N", "[", "cc", "]"}]}], ",", "days"}], "]"}]}], 
                  "]"}]}], "]"}]}], "]"}], ",", 
             RowBox[{"-", "1"}]}], "]"}], "]"}]}], "]"}],
        ShowSpecialCharacters->False,
        ShowStringCharacters->True,
        NumberMarks->True],
       FullForm]}]}]}], "\[IndentingNewLine]", "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{
     RowBox[{"lfit", "[", 
      RowBox[{"ind", ",", "x_"}], "]"}], "=", 
     RowBox[{
      RowBox[{"fl2", "[", "x", "]"}], "/.", 
      RowBox[{"FindFit", "[", 
       RowBox[{
        RowBox[{"tableDataDL", "[", 
         RowBox[{"[", 
          RowBox[{"ind", ",", 
           RowBox[{"init", ";;"}]}], "]"}], "]"}], ",", 
        RowBox[{"fl2", "[", "x", "]"}], ",", 
        RowBox[{"{", 
         RowBox[{"ce", ",", "cf"}], "}"}], ",", "x"}], "]"}]}]}], ";"}], 
   "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{"plfit", "[", 
     RowBox[{"ind", ",", "days_"}], "]"}], "=", 
    RowBox[{
     RowBox[{"lfit", "[", 
      RowBox[{"ind", ",", "days"}], "]"}], "/.", 
     RowBox[{
      TagBox[
       StyleBox[
        RowBox[{"Plus", "[", 
         RowBox[{"ca_", ",", 
          RowBox[{"Log", "[", 
           RowBox[{"Power", "[", 
            RowBox[{
             RowBox[{"Plus", "[", 
              RowBox[{"1", ",", 
               RowBox[{"Power", "[", 
                RowBox[{"E", ",", 
                 RowBox[{"Plus", "[", 
                  RowBox[{"cb_", ",", 
                   RowBox[{"Times", "[", 
                    RowBox[{"cc_", ",", "days"}], "]"}]}], "]"}]}], "]"}]}], 
              "]"}], ",", 
             RowBox[{"-", "1"}]}], "]"}], "]"}]}], "]"}],
        ShowSpecialCharacters->False,
        ShowStringCharacters->True,
        NumberMarks->True],
       FullForm], "\[RuleDelayed]", 
      TagBox[
       StyleBox[
        RowBox[{"Plus", "[", 
         RowBox[{
          RowBox[{
           RowBox[{
            RowBox[{"Rationalize", "[", 
             RowBox[{"#", ",", 
              SuperscriptBox["10", 
               RowBox[{"-", "3"}]]}], "]"}], "&"}], "@", 
           RowBox[{"N", "[", "ca", "]"}]}], ",", 
          RowBox[{"Log", "[", 
           RowBox[{"Power", "[", 
            RowBox[{
             RowBox[{"Plus", "[", 
              RowBox[{"1", ",", 
               RowBox[{"Power", "[", 
                RowBox[{"E", ",", 
                 RowBox[{"Plus", "[", 
                  RowBox[{
                   RowBox[{
                    RowBox[{
                    RowBox[{"Rationalize", "[", 
                    RowBox[{"#", ",", 
                    SuperscriptBox["10", 
                    RowBox[{"-", "3"}]]}], "]"}], "&"}], "@", 
                    RowBox[{"N", "[", "cb", "]"}]}], ",", 
                   RowBox[{"Times", "[", 
                    RowBox[{
                    RowBox[{
                    RowBox[{
                    RowBox[{"Rationalize", "[", 
                    RowBox[{"#", ",", 
                    SuperscriptBox["10", 
                    RowBox[{"-", "3"}]]}], "]"}], "&"}], "@", 
                    RowBox[{"N", "[", "cc", "]"}]}], ",", "days"}], "]"}]}], 
                  "]"}]}], "]"}]}], "]"}], ",", 
             RowBox[{"-", "1"}]}], "]"}], "]"}]}], "]"}],
        ShowSpecialCharacters->False,
        ShowStringCharacters->True,
        NumberMarks->True],
       FullForm]}]}]}]}]}]], "Input",
 CellChangeTimes->{{3.7924155954998083`*^9, 3.792415597794024*^9}, {
  3.7924158130574913`*^9, 3.7924158251162987`*^9}, {3.792490451390607*^9, 
  3.792490618825358*^9}, {3.792490993345237*^9, 3.792491002378441*^9}},
 CellLabel->"In[57]:=",ExpressionUUID->"bd21eaed-6fce-471e-b1b7-75b8179a396d"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"Show", "[", 
    RowBox[{
     RowBox[{"Plot", "[", 
      RowBox[{
       RowBox[{"pfit", "[", 
        RowBox[{"17", ",", "days"}], "]"}], ",", 
       RowBox[{"{", 
        RowBox[{"days", ",", "40", ",", "90"}], "}"}], ",", 
       RowBox[{"PlotStyle", "\[Rule]", "Cyan"}], ",", 
       RowBox[{"PlotRange", "\[Rule]", 
        RowBox[{"{", 
         RowBox[{"0", ",", "5"}], "}"}]}]}], "]"}], ",", 
     RowBox[{"ListPlot", "[", 
      RowBox[{"tableDataDL", "[", 
       RowBox[{"[", "17", "]"}], "]"}], "]"}], ",", 
     RowBox[{"ImageSize", "\[Rule]", "300"}]}], "]"}], ",", 
   RowBox[{"Show", "[", 
    RowBox[{
     RowBox[{"Plot", "[", 
      RowBox[{
       RowBox[{"plfit", "[", 
        RowBox[{"17", ",", "days"}], "]"}], ",", 
       RowBox[{"{", 
        RowBox[{"days", ",", "40", ",", "90"}], "}"}], ",", 
       RowBox[{"PlotStyle", "\[Rule]", "Cyan"}], ",", 
       RowBox[{"PlotRange", "\[Rule]", 
        RowBox[{"{", 
         RowBox[{"0", ",", "5"}], "}"}]}]}], "]"}], ",", 
     RowBox[{"ListPlot", "[", 
      RowBox[{"tableDataDL", "[", 
       RowBox[{"[", "17", "]"}], "]"}], "]"}], ",", 
     RowBox[{"ImageSize", "\[Rule]", "300"}]}], "]"}]}], "}"}]], "Input",
 CellChangeTimes->{{3.792415436860469*^9, 3.792415461059317*^9}, {
  3.792491030964357*^9, 3.792491035418231*^9}},
 CellLabel->"In[64]:=",ExpressionUUID->"bbb9e265-3cc3-4861-8fa8-d9b09563ffe0"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "Italy", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{"ClearAll", "[", 
     RowBox[{"ind", ",", "init"}], "]"}], ";"}], "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{"ind", "=", "21"}], ";"}], "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{"init", "=", "7"}], ";"}], "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{
     RowBox[{"fit", "[", 
      RowBox[{"ind", ",", "x_"}], "]"}], "=", 
     RowBox[{
      RowBox[{"fl", "[", "x", "]"}], "/.", 
      RowBox[{"FindFit", "[", 
       RowBox[{
        RowBox[{"tableDataDL", "[", 
         RowBox[{"[", 
          RowBox[{"ind", ",", 
           RowBox[{"init", ";;"}]}], "]"}], "]"}], ",", 
        RowBox[{"fl", "[", "x", "]"}], ",", 
        RowBox[{"{", 
         RowBox[{"ca", ",", "cc", ",", "cd"}], "}"}], ",", "x", ",", 
        RowBox[{"WorkingPrecision", "\[Rule]", "50"}]}], "]"}]}]}], ";"}], 
   "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{"pfit", "[", 
     RowBox[{"ind", ",", "days_"}], "]"}], "=", 
    RowBox[{
     RowBox[{"fit", "[", 
      RowBox[{"ind", ",", "days"}], "]"}], "/.", 
     RowBox[{
      TagBox[
       StyleBox[
        RowBox[{"Plus", "[", 
         RowBox[{"ca_", ",", 
          RowBox[{"Log", "[", 
           RowBox[{"Power", "[", 
            RowBox[{
             RowBox[{"Plus", "[", 
              RowBox[{"1", ",", 
               RowBox[{"Power", "[", 
                RowBox[{"E", ",", 
                 RowBox[{"Plus", "[", 
                  RowBox[{"cb_", ",", 
                   RowBox[{"Times", "[", 
                    RowBox[{"cc_", ",", "days"}], "]"}]}], "]"}]}], "]"}]}], 
              "]"}], ",", 
             RowBox[{"-", "1"}]}], "]"}], "]"}]}], "]"}],
        ShowSpecialCharacters->False,
        ShowStringCharacters->True,
        NumberMarks->True],
       FullForm], "\[RuleDelayed]", 
      TagBox[
       StyleBox[
        RowBox[{"Plus", "[", 
         RowBox[{
          RowBox[{
           RowBox[{
            RowBox[{"Rationalize", "[", 
             RowBox[{"#", ",", 
              SuperscriptBox["10", 
               RowBox[{"-", "3"}]]}], "]"}], "&"}], "@", 
           RowBox[{"N", "[", "ca", "]"}]}], ",", 
          RowBox[{"Log", "[", 
           RowBox[{"Power", "[", 
            RowBox[{
             RowBox[{"Plus", "[", 
              RowBox[{"1", ",", 
               RowBox[{"Power", "[", 
                RowBox[{"E", ",", 
                 RowBox[{"Plus", "[", 
                  RowBox[{
                   RowBox[{
                    RowBox[{
                    RowBox[{"Rationalize", "[", 
                    RowBox[{"#", ",", 
                    SuperscriptBox["10", 
                    RowBox[{"-", "3"}]]}], "]"}], "&"}], "@", 
                    RowBox[{"N", "[", "cb", "]"}]}], ",", 
                   RowBox[{"Times", "[", 
                    RowBox[{
                    RowBox[{
                    RowBox[{
                    RowBox[{"Rationalize", "[", 
                    RowBox[{"#", ",", 
                    SuperscriptBox["10", 
                    RowBox[{"-", "3"}]]}], "]"}], "&"}], "@", 
                    RowBox[{"N", "[", "cc", "]"}]}], ",", "days"}], "]"}]}], 
                  "]"}]}], "]"}]}], "]"}], ",", 
             RowBox[{"-", "1"}]}], "]"}], "]"}]}], "]"}],
        ShowSpecialCharacters->False,
        ShowStringCharacters->True,
        NumberMarks->True],
       FullForm]}]}]}], "\[IndentingNewLine]", "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{
     RowBox[{"lfit", "[", 
      RowBox[{"ind", ",", "x_"}], "]"}], "=", 
     RowBox[{
      RowBox[{"fl2", "[", "x", "]"}], "/.", 
      RowBox[{"FindFit", "[", 
       RowBox[{
        RowBox[{"tableDataDL", "[", 
         RowBox[{"[", 
          RowBox[{"ind", ",", 
           RowBox[{"init", ";;"}]}], "]"}], "]"}], ",", 
        RowBox[{"fl2", "[", "x", "]"}], ",", 
        RowBox[{"{", 
         RowBox[{"ce", ",", "cf"}], "}"}], ",", "x"}], "]"}]}]}], ";"}], 
   "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{"plfit", "[", 
     RowBox[{"ind", ",", "days_"}], "]"}], "=", 
    RowBox[{
     RowBox[{"lfit", "[", 
      RowBox[{"ind", ",", "days"}], "]"}], "/.", 
     RowBox[{
      TagBox[
       StyleBox[
        RowBox[{"Plus", "[", 
         RowBox[{"ca_", ",", 
          RowBox[{"Log", "[", 
           RowBox[{"Power", "[", 
            RowBox[{
             RowBox[{"Plus", "[", 
              RowBox[{"1", ",", 
               RowBox[{"Power", "[", 
                RowBox[{"E", ",", 
                 RowBox[{"Plus", "[", 
                  RowBox[{"cb_", ",", 
                   RowBox[{"Times", "[", 
                    RowBox[{"cc_", ",", "days"}], "]"}]}], "]"}]}], "]"}]}], 
              "]"}], ",", 
             RowBox[{"-", "1"}]}], "]"}], "]"}]}], "]"}],
        ShowSpecialCharacters->False,
        ShowStringCharacters->True,
        NumberMarks->True],
       FullForm], "\[RuleDelayed]", 
      TagBox[
       StyleBox[
        RowBox[{"Plus", "[", 
         RowBox[{
          RowBox[{
           RowBox[{
            RowBox[{"Rationalize", "[", 
             RowBox[{"#", ",", 
              SuperscriptBox["10", 
               RowBox[{"-", "3"}]]}], "]"}], "&"}], "@", 
           RowBox[{"N", "[", "ca", "]"}]}], ",", 
          RowBox[{"Log", "[", 
           RowBox[{"Power", "[", 
            RowBox[{
             RowBox[{"Plus", "[", 
              RowBox[{"1", ",", 
               RowBox[{"Power", "[", 
                RowBox[{"E", ",", 
                 RowBox[{"Plus", "[", 
                  RowBox[{
                   RowBox[{
                    RowBox[{
                    RowBox[{"Rationalize", "[", 
                    RowBox[{"#", ",", 
                    SuperscriptBox["10", 
                    RowBox[{"-", "3"}]]}], "]"}], "&"}], "@", 
                    RowBox[{"N", "[", "cb", "]"}]}], ",", 
                   RowBox[{"Times", "[", 
                    RowBox[{
                    RowBox[{
                    RowBox[{
                    RowBox[{"Rationalize", "[", 
                    RowBox[{"#", ",", 
                    SuperscriptBox["10", 
                    RowBox[{"-", "3"}]]}], "]"}], "&"}], "@", 
                    RowBox[{"N", "[", "cc", "]"}]}], ",", "days"}], "]"}]}], 
                  "]"}]}], "]"}]}], "]"}], ",", 
             RowBox[{"-", "1"}]}], "]"}], "]"}]}], "]"}],
        ShowSpecialCharacters->False,
        ShowStringCharacters->True,
        NumberMarks->True],
       FullForm]}]}]}]}]}]], "Input",
 CellChangeTimes->{{3.792415506668648*^9, 3.792415585412244*^9}, {
   3.792415658435273*^9, 3.792415683385867*^9}, {3.792415743789377*^9, 
   3.792415743878335*^9}, {3.792490626984022*^9, 3.792490629142158*^9}, 
   3.7924910556815157`*^9},
 CellLabel->"In[65]:=",ExpressionUUID->"4b21ca47-e704-43c0-8697-d1e24906946a"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"Show", "[", 
    RowBox[{
     RowBox[{"Plot", "[", 
      RowBox[{
       RowBox[{"pfit", "[", 
        RowBox[{"21", ",", "days"}], "]"}], ",", 
       RowBox[{"{", 
        RowBox[{"days", ",", "30", ",", "80"}], "}"}], ",", 
       RowBox[{"PlotStyle", "\[Rule]", "Cyan"}], ",", 
       RowBox[{"PlotRange", "\[Rule]", 
        RowBox[{"{", 
         RowBox[{"0", ",", "5"}], "}"}]}]}], "]"}], ",", 
     RowBox[{"ListPlot", "[", 
      RowBox[{"tableDataDL", "[", 
       RowBox[{"[", "21", "]"}], "]"}], "]"}], ",", 
     RowBox[{"ImageSize", "\[Rule]", "300"}]}], "]"}], ",", 
   RowBox[{"Show", "[", 
    RowBox[{
     RowBox[{"Plot", "[", 
      RowBox[{
       RowBox[{"plfit", "[", 
        RowBox[{"21", ",", "days"}], "]"}], ",", 
       RowBox[{"{", 
        RowBox[{"days", ",", "30", ",", "80"}], "}"}], ",", 
       RowBox[{"PlotStyle", "\[Rule]", "Cyan"}], ",", 
       RowBox[{"PlotRange", "\[Rule]", 
        RowBox[{"{", 
         RowBox[{"0", ",", "5"}], "}"}]}]}], "]"}], ",", 
     RowBox[{"ListPlot", "[", 
      RowBox[{"tableDataDL", "[", 
       RowBox[{"[", "21", "]"}], "]"}], "]"}], ",", 
     RowBox[{"ImageSize", "\[Rule]", "300"}]}], "]"}]}], "}"}]], "Input",
 CellChangeTimes->{{3.792415436860469*^9, 3.792415461059317*^9}, {
  3.792415621116345*^9, 3.792415646743339*^9}, {3.792491069788734*^9, 
  3.792491070665296*^9}},
 CellLabel->"In[72]:=",ExpressionUUID->"4e96b262-0b62-4137-ac39-1b9bc77ebec6"],

Cell[BoxData[{
 RowBox[{
  RowBox[{"ClearAll", "[", 
   RowBox[{"ind", ",", "init"}], "]"}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"ind", "=", "26"}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"init", "=", "14"}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"fit", "[", 
    RowBox[{"ind", ",", "x_"}], "]"}], "=", 
   RowBox[{
    RowBox[{"fl", "[", "x", "]"}], "/.", 
    RowBox[{"FindFit", "[", 
     RowBox[{
      RowBox[{"tableDataDL", "[", 
       RowBox[{"[", 
        RowBox[{"ind", ",", 
         RowBox[{"init", ";;"}]}], "]"}], "]"}], ",", 
      RowBox[{"fl", "[", "x", "]"}], ",", 
      RowBox[{"{", 
       RowBox[{"ca", ",", "cc", ",", "cd"}], "}"}], ",", "x", ",", 
      RowBox[{"WorkingPrecision", "\[Rule]", "50"}]}], "]"}]}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"pfit", "[", 
    RowBox[{"ind", ",", "days_"}], "]"}], "=", 
   RowBox[{
    RowBox[{"fit", "[", 
     RowBox[{"ind", ",", "days"}], "]"}], "/.", 
    RowBox[{
     TagBox[
      StyleBox[
       RowBox[{"Plus", "[", 
        RowBox[{"ca_", ",", 
         RowBox[{"Log", "[", 
          RowBox[{"Power", "[", 
           RowBox[{
            RowBox[{"Plus", "[", 
             RowBox[{"1", ",", 
              RowBox[{"Power", "[", 
               RowBox[{"E", ",", 
                RowBox[{"Plus", "[", 
                 RowBox[{"cb_", ",", 
                  RowBox[{"Times", "[", 
                   RowBox[{"cc_", ",", "days"}], "]"}]}], "]"}]}], "]"}]}], 
             "]"}], ",", 
            RowBox[{"-", "1"}]}], "]"}], "]"}]}], "]"}],
       ShowSpecialCharacters->False,
       ShowStringCharacters->True,
       NumberMarks->True],
      FullForm], "\[RuleDelayed]", 
     TagBox[
      StyleBox[
       RowBox[{"Plus", "[", 
        RowBox[{
         RowBox[{
          RowBox[{
           RowBox[{"Rationalize", "[", 
            RowBox[{"#", ",", 
             SuperscriptBox["10", 
              RowBox[{"-", "3"}]]}], "]"}], "&"}], "@", 
          RowBox[{"N", "[", "ca", "]"}]}], ",", 
         RowBox[{"Log", "[", 
          RowBox[{"Power", "[", 
           RowBox[{
            RowBox[{"Plus", "[", 
             RowBox[{"1", ",", 
              RowBox[{"Power", "[", 
               RowBox[{"E", ",", 
                RowBox[{"Plus", "[", 
                 RowBox[{
                  RowBox[{
                   RowBox[{
                    RowBox[{"Rationalize", "[", 
                    RowBox[{"#", ",", 
                    SuperscriptBox["10", 
                    RowBox[{"-", "3"}]]}], "]"}], "&"}], "@", 
                   RowBox[{"N", "[", "cb", "]"}]}], ",", 
                  RowBox[{"Times", "[", 
                   RowBox[{
                    RowBox[{
                    RowBox[{
                    RowBox[{"Rationalize", "[", 
                    RowBox[{"#", ",", 
                    SuperscriptBox["10", 
                    RowBox[{"-", "3"}]]}], "]"}], "&"}], "@", 
                    RowBox[{"N", "[", "cc", "]"}]}], ",", "days"}], "]"}]}], 
                 "]"}]}], "]"}]}], "]"}], ",", 
            RowBox[{"-", "1"}]}], "]"}], "]"}]}], "]"}],
       ShowSpecialCharacters->False,
       ShowStringCharacters->True,
       NumberMarks->True],
      FullForm]}]}]}], "\[IndentingNewLine]"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"lfit", "[", 
    RowBox[{"ind", ",", "x_"}], "]"}], "=", 
   RowBox[{
    RowBox[{"fl2", "[", "x", "]"}], "/.", 
    RowBox[{"FindFit", "[", 
     RowBox[{
      RowBox[{"tableDataDL", "[", 
       RowBox[{"[", 
        RowBox[{"ind", ",", 
         RowBox[{"init", ";;"}]}], "]"}], "]"}], ",", 
      RowBox[{"fl2", "[", "x", "]"}], ",", 
      RowBox[{"{", 
       RowBox[{"ce", ",", "cf"}], "}"}], ",", "x"}], "]"}]}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"plfit", "[", 
   RowBox[{"ind", ",", "days_"}], "]"}], "=", 
  RowBox[{
   RowBox[{"lfit", "[", 
    RowBox[{"ind", ",", "days"}], "]"}], "/.", 
   RowBox[{
    TagBox[
     StyleBox[
      RowBox[{"Plus", "[", 
       RowBox[{"ca_", ",", 
        RowBox[{"Log", "[", 
         RowBox[{"Power", "[", 
          RowBox[{
           RowBox[{"Plus", "[", 
            RowBox[{"1", ",", 
             RowBox[{"Power", "[", 
              RowBox[{"E", ",", 
               RowBox[{"Plus", "[", 
                RowBox[{"cb_", ",", 
                 RowBox[{"Times", "[", 
                  RowBox[{"cc_", ",", "days"}], "]"}]}], "]"}]}], "]"}]}], 
            "]"}], ",", 
           RowBox[{"-", "1"}]}], "]"}], "]"}]}], "]"}],
      ShowSpecialCharacters->False,
      ShowStringCharacters->True,
      NumberMarks->True],
     FullForm], "\[RuleDelayed]", 
    TagBox[
     StyleBox[
      RowBox[{"Plus", "[", 
       RowBox[{
        RowBox[{
         RowBox[{
          RowBox[{"Rationalize", "[", 
           RowBox[{"#", ",", 
            SuperscriptBox["10", 
             RowBox[{"-", "3"}]]}], "]"}], "&"}], "@", 
         RowBox[{"N", "[", "ca", "]"}]}], ",", 
        RowBox[{"Log", "[", 
         RowBox[{"Power", "[", 
          RowBox[{
           RowBox[{"Plus", "[", 
            RowBox[{"1", ",", 
             RowBox[{"Power", "[", 
              RowBox[{"E", ",", 
               RowBox[{"Plus", "[", 
                RowBox[{
                 RowBox[{
                  RowBox[{
                   RowBox[{"Rationalize", "[", 
                    RowBox[{"#", ",", 
                    SuperscriptBox["10", 
                    RowBox[{"-", "3"}]]}], "]"}], "&"}], "@", 
                  RowBox[{"N", "[", "cb", "]"}]}], ",", 
                 RowBox[{"Times", "[", 
                  RowBox[{
                   RowBox[{
                    RowBox[{
                    RowBox[{"Rationalize", "[", 
                    RowBox[{"#", ",", 
                    SuperscriptBox["10", 
                    RowBox[{"-", "3"}]]}], "]"}], "&"}], "@", 
                    RowBox[{"N", "[", "cc", "]"}]}], ",", "days"}], "]"}]}], 
                "]"}]}], "]"}]}], "]"}], ",", 
           RowBox[{"-", "1"}]}], "]"}], "]"}]}], "]"}],
      ShowSpecialCharacters->False,
      ShowStringCharacters->True,
      NumberMarks->True],
     FullForm]}]}]}]}], "Input",
 CellChangeTimes->{{3.792416815335041*^9, 3.792416815402726*^9}, {
  3.7924169036519747`*^9, 3.792416904133401*^9}, {3.792416964178178*^9, 
  3.7924169716666203`*^9}, {3.792491080071822*^9, 3.792491080205729*^9}},
 CellLabel->"In[73]:=",ExpressionUUID->"c1be5820-f5c7-4b5e-b374-bf5439ca4355"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"Show", "[", 
    RowBox[{
     RowBox[{"Plot", "[", 
      RowBox[{
       RowBox[{"pfit", "[", 
        RowBox[{"26", ",", "days"}], "]"}], ",", 
       RowBox[{"{", 
        RowBox[{"days", ",", "10", ",", "80"}], "}"}], ",", 
       RowBox[{"PlotStyle", "\[Rule]", "Cyan"}], ",", 
       RowBox[{"PlotRange", "\[Rule]", 
        RowBox[{"{", 
         RowBox[{"0", ",", "5"}], "}"}]}]}], "]"}], ",", 
     RowBox[{"ListPlot", "[", 
      RowBox[{"tableDataDL", "[", 
       RowBox[{"[", "26", "]"}], "]"}], "]"}], ",", 
     RowBox[{"ImageSize", "\[Rule]", "300"}]}], "]"}], ",", 
   RowBox[{"Show", "[", 
    RowBox[{
     RowBox[{"Plot", "[", 
      RowBox[{
       RowBox[{"plfit", "[", 
        RowBox[{"26", ",", "days"}], "]"}], ",", 
       RowBox[{"{", 
        RowBox[{"days", ",", "10", ",", "80"}], "}"}], ",", 
       RowBox[{"PlotStyle", "\[Rule]", "Cyan"}], ",", 
       RowBox[{"PlotRange", "\[Rule]", 
        RowBox[{"{", 
         RowBox[{"0", ",", "5"}], "}"}]}]}], "]"}], ",", 
     RowBox[{"ListPlot", "[", 
      RowBox[{"tableDataDL", "[", 
       RowBox[{"[", "26", "]"}], "]"}], "]"}], ",", 
     RowBox[{"ImageSize", "\[Rule]", "300"}]}], "]"}]}], "}"}]], "Input",
 CellChangeTimes->{{3.792416922156007*^9, 3.792416929647707*^9}},
 CellLabel->"In[80]:=",ExpressionUUID->"9e4d085a-7bc0-4ef4-9a33-1c1caee57825"]
}, Closed]],

Cell[CellGroupData[{

Cell["Summary", "Subsection",
 CellChangeTimes->{{3.792416811250204*^9, 
  3.79241681221775*^9}},ExpressionUUID->"a681592c-b0e0-461c-a84f-\
6584eb43075f"],

Cell[BoxData[
 RowBox[{"Show", "[", 
  RowBox[{
   RowBox[{"Plot", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"pfit", "[", 
        RowBox[{"1", ",", "days"}], "]"}], ",", 
       RowBox[{"pfit", "[", 
        RowBox[{"14", ",", "days"}], "]"}], ",", 
       RowBox[{"pfit", "[", 
        RowBox[{"17", ",", "days"}], "]"}], ",", 
       RowBox[{"pfit", "[", 
        RowBox[{"21", ",", "days"}], "]"}]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"days", ",", "10", ",", "80"}], "}"}], ",", 
     RowBox[{"PlotStyle", "\[Rule]", 
      RowBox[{"{", 
       RowBox[{"Cyan", ",", 
        RowBox[{"Lighter", "@", "Pink"}], ",", 
        RowBox[{"Lighter", "@", "Green"}], ",", "LightMagenta"}], "}"}]}], 
     ",", 
     RowBox[{"PlotRange", "\[Rule]", 
      RowBox[{"{", 
       RowBox[{"0", ",", "5"}], "}"}]}]}], "]"}], ",", 
   RowBox[{"ListPlot", "[", 
    RowBox[{"tableDataDL", "[", 
     RowBox[{"[", 
      RowBox[{"{", 
       RowBox[{"1", ",", "14", ",", "17", ",", "21"}], "}"}], "]"}], "]"}], 
    "]"}]}], "]"}]], "Input",
 CellChangeTimes->{{3.792415924545906*^9, 3.792416030093034*^9}, {
  3.792416062495305*^9, 3.7924160650263433`*^9}},
 CellLabel->"In[81]:=",ExpressionUUID->"0ca27859-3996-4836-8b1b-0cd1aee2b8ee"],

Cell[TextData[StyleBox["Long-term prediction ",
 FontSize->18,
 FontColor->RGBColor[0.5, 0, 0.5]]], "Text",
 CellChangeTimes->{{3.792488847742337*^9, 3.792488850352298*^9}, 
   3.7924901780202723`*^9},ExpressionUUID->"cfa8fe8f-b3f3-4457-9bfa-\
a1b637923b51"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"China", ",", " ", "Korea", ",", " ", "Iran", ",", " ", "Italy"}], 
   " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{"10", "^", 
     RowBox[{"(", "#", ")"}]}], "&"}], "/@", 
   RowBox[{"N", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"pfit", "[", 
        RowBox[{"1", ",", "days"}], "]"}], ",", 
       RowBox[{"pfit", "[", 
        RowBox[{"14", ",", "days"}], "]"}], ",", 
       RowBox[{"pfit", "[", 
        RowBox[{"17", ",", "days"}], "]"}], ",", 
       RowBox[{"pfit", "[", 
        RowBox[{"21", ",", "days"}], "]"}]}], "}"}], "/.", 
     RowBox[{"days", "\[Rule]", "150"}]}], "]"}]}]}]], "Input",
 CellChangeTimes->{{3.79249015805508*^9, 3.79249019663899*^9}},
 CellLabel->"In[82]:=",ExpressionUUID->"01e89891-e496-4826-8998-39581ee569c8"],

Cell[BoxData[
 RowBox[{"plParallel", "=", 
  RowBox[{"Show", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"Plot", "[", 
       RowBox[{
        RowBox[{"{", 
         RowBox[{
          RowBox[{"pfit", "[", 
           RowBox[{"1", ",", "days"}], "]"}], ",", 
          RowBox[{"plfit", "[", 
           RowBox[{"14", ",", "days"}], "]"}], ",", 
          RowBox[{"plfit", "[", 
           RowBox[{"21", ",", "days"}], "]"}]}], "}"}], ",", 
        RowBox[{"{", 
         RowBox[{"days", ",", "10", ",", "85"}], "}"}], ",", 
        RowBox[{"PlotStyle", "\[Rule]", 
         RowBox[{"{", 
          RowBox[{"Cyan", ",", 
           RowBox[{"Lighter", "@", "Pink"}], ",", 
           RowBox[{"Lighter", "@", "Green"}]}], "}"}]}], ",", 
        RowBox[{"PlotRange", "\[Rule]", 
         RowBox[{"{", 
          RowBox[{"0", ",", "5"}], "}"}]}]}], "]"}], ",", 
      RowBox[{"ListPlot", "[", 
       RowBox[{
        RowBox[{"tableDataDL", "[", 
         RowBox[{"[", 
          RowBox[{"{", 
           RowBox[{"1", ",", "14", ",", "21"}], "}"}], "]"}], "]"}], ",", 
        RowBox[{"PlotLegends", "\[Rule]", 
         RowBox[{"MaTeX", "[", 
          RowBox[{
           RowBox[{"{", 
            RowBox[{
            "\"\<\\\\text{PRC}\>\"", ",", "\"\<\\\\text{ROK}\>\"", ",", 
             "\"\<\\\\text{Italy}\>\"", ",", "\"\<\\\\text{Singapore}\>\""}], 
            "}"}], ",", 
           RowBox[{"FontSize", "\[Rule]", "20"}]}], "]"}]}]}], "]"}], ",", 
      "\[IndentingNewLine]", 
      RowBox[{"ListPlot", "[", 
       RowBox[{
        RowBox[{"tableDataDL", "[", 
         RowBox[{"[", 
          RowBox[{"{", 
           RowBox[{"8", ",", "25"}], "}"}], "]"}], "]"}], ",", 
        RowBox[{"PlotStyle", "\[Rule]", 
         RowBox[{"{", 
          RowBox[{"Gray", ",", 
           RowBox[{"Directive", "[", 
            RowBox[{"Purple", ",", "Dotted"}], "]"}]}], "}"}]}], ",", 
        RowBox[{"Joined", "\[Rule]", "True"}], ",", 
        RowBox[{"PlotLegends", "\[Rule]", 
         RowBox[{"MaTeX", "[", 
          RowBox[{
           RowBox[{"{", 
            RowBox[{
            "\"\<\\\\text{Japan}\>\"", ",", "\"\<\\\\text{Germany}\>\""}], 
            "}"}], ",", 
           RowBox[{"FontSize", "\[Rule]", "20"}]}], "]"}]}]}], "]"}]}], "}"}],
     ",", "\[IndentingNewLine]", 
    RowBox[{"AxesLabel", "\[Rule]", 
     RowBox[{"{", 
      RowBox[{
      "\"\<Days from 01/Jan\>\"", ",", 
       "\"\<\!\(\*SubscriptBox[\(Log\), \(10\)]\)(Cases)\>\""}], "}"}]}], ",", 
    RowBox[{"AxesStyle", "\[Rule]", "16"}], ",", 
    RowBox[{"ImageSize", "\[Rule]", "700"}]}], "]"}]}]], "Input",
 CellChangeTimes->{{3.792416045337788*^9, 3.79241609181281*^9}, {
  3.7924161485598593`*^9, 3.792416149221871*^9}, {3.792416181600998*^9, 
  3.792416249764758*^9}, {3.792416291380535*^9, 3.792416294394271*^9}, {
  3.79241638107868*^9, 3.7924165474225492`*^9}, {3.792416633622933*^9, 
  3.7924166559983797`*^9}, {3.792416992742669*^9, 3.7924170316034193`*^9}, {
  3.7924170621941767`*^9, 3.7924172268852797`*^9}},
 CellLabel->"In[83]:=",ExpressionUUID->"c39f92c8-2e29-456f-a90e-6ce5f8e12d1c"],

Cell[BoxData[
 RowBox[{"(*", "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"SetDirectory", "[", "\"\<~/Desktop\>\"", "]"}], ";", 
   "\[IndentingNewLine]", 
   RowBox[{"Export", "[", 
    RowBox[{"\"\<plots1.png\>\"", ",", "plParallel"}], "]"}], ";"}], 
  "\[IndentingNewLine]", "*)"}]], "Input",
 CellChangeTimes->{
  3.7924163200932837`*^9, {3.7924915696031523`*^9, 
   3.792491576216455*^9}},ExpressionUUID->"04bc2853-5219-4d4e-8dab-\
181c62c4543a"]
}, Open  ]]
}, Open  ]]
}, Open  ]]
},
WindowSize->{1362, 990},
WindowMargins->{{18, Automatic}, {Automatic, 10}},
FrontEndVersion->"12.0 for Mac OS X x86 (64-bit) (April 8, 2019)",
StyleDefinitions->"Default.nb"
]
(* End of Notebook Content *)

(* Internal cache information *)
(*CellTagsOutline
CellTagsIndex->{}
*)
(*CellTagsIndex
CellTagsIndex->{}
*)
(*NotebookFileOutline
Notebook[{
Cell[CellGroupData[{
Cell[1510, 35, 260, 4, 69, "Chapter",ExpressionUUID->"4906a22a-258a-442f-a1c7-6028cb52df08"],
Cell[CellGroupData[{
Cell[1795, 43, 305, 5, 67, "Section",ExpressionUUID->"739ef86d-63ab-4ad4-a449-645d0b059bf2"],
Cell[2103, 50, 1534, 26, 143, "Text",ExpressionUUID->"5d27d43b-71c1-4281-8f3f-3e2b8a6eb55b"],
Cell[3640, 78, 2655, 59, 810, "Text",ExpressionUUID->"c05a8c32-b20c-4867-b5c2-f97b11958594"]
}, Closed]],
Cell[CellGroupData[{
Cell[6332, 142, 201, 4, 53, "Section",ExpressionUUID->"3f09f26c-951e-4053-9c1d-d7258e3806da"],
Cell[6536, 148, 1966, 41, 73, "Input",ExpressionUUID->"636d3c4a-13cf-4ca5-acce-61e3014aa782"],
Cell[CellGroupData[{
Cell[8527, 193, 157, 3, 54, "Subsection",ExpressionUUID->"552443f6-3ed9-4acd-8be4-3fd5b3c2c2ba"],
Cell[8687, 198, 52610, 1314, 691, "Input",ExpressionUUID->"40ab8a21-7e5a-476d-9ca1-3ef16c7ba825"],
Cell[61300, 1514, 933, 27, 30, "Input",ExpressionUUID->"844c9131-cd26-4497-96b7-722fb3a2c3a8"]
}, Closed]],
Cell[CellGroupData[{
Cell[62270, 1546, 219, 4, 38, "Subsection",ExpressionUUID->"1358e2ae-01ea-4fde-9ed0-17c027a7a7f0"],
Cell[62492, 1552, 93299, 2350, 1218, "Input",ExpressionUUID->"b0fc84cd-8a74-41f0-acc2-a9015dcc7402"]
}, Closed]],
Cell[CellGroupData[{
Cell[155828, 3907, 160, 2, 38, "Subsection",ExpressionUUID->"78eff8d8-fdc5-4b2a-9219-591edd3e3785"],
Cell[155991, 3911, 22197, 560, 288, "Input",ExpressionUUID->"f4da4b24-2359-4f95-8f8f-122a4eb48cb4"]
}, Closed]],
Cell[CellGroupData[{
Cell[178225, 4476, 260, 4, 38, "Subsection",ExpressionUUID->"180f556c-8c14-4bc5-a15b-edd336ad69dd"],
Cell[178488, 4482, 76180, 1911, 1032, "Input",ExpressionUUID->"5857984b-0e61-419b-9ed3-60bace8ddb01"]
}, Closed]],
Cell[CellGroupData[{
Cell[254705, 6398, 152, 3, 38, "Subsection",ExpressionUUID->"b46d4f93-d739-429c-b08b-f9375ef80102"],
Cell[254860, 6403, 25307, 636, 381, "Input",ExpressionUUID->"29b45378-c32a-4d18-9fca-51a21d6e8412"]
}, Closed]],
Cell[CellGroupData[{
Cell[280204, 7044, 206, 4, 38, "Subsection",ExpressionUUID->"acb0c4e1-ed36-4927-9945-eaa6faf42bd7"],
Cell[280413, 7050, 31537, 796, 505, "Input",ExpressionUUID->"0ed97899-2df3-4ea4-9298-2a341c18e047"]
}, Closed]],
Cell[CellGroupData[{
Cell[311987, 7851, 258, 4, 38, "Subsection",ExpressionUUID->"a86e61cc-6045-44ae-92d3-1bc102ff65a6"],
Cell[312248, 7857, 23908, 605, 381, "Input",ExpressionUUID->"4eb011af-d459-49ed-b93d-9844852ea573"]
}, Closed]],
Cell[CellGroupData[{
Cell[336193, 8467, 157, 3, 38, "Subsection",ExpressionUUID->"d46d0b4d-4057-4c21-b30f-910c7bee53b3"],
Cell[336353, 8472, 25150, 631, 319, "Input",ExpressionUUID->"a1174f9d-800e-4ff5-ae51-9844c48f05fe"]
}, Closed]],
Cell[CellGroupData[{
Cell[361540, 9108, 262, 4, 38, "Subsection",ExpressionUUID->"aa3a5ecc-161f-4bf5-b68b-fac158ec287c"],
Cell[361805, 9114, 77756, 1953, 1032, "Input",ExpressionUUID->"2990918d-396e-41de-baf5-e9b38efc4df5"]
}, Closed]]
}, Closed]],
Cell[CellGroupData[{
Cell[439610, 11073, 304, 5, 53, "Section",ExpressionUUID->"70a2c939-a0a5-43e3-993c-951bfa596cb6"],
Cell[CellGroupData[{
Cell[439939, 11082, 163, 3, 54, "Subsection",ExpressionUUID->"8003d00d-de35-421b-ae44-941251564497"],
Cell[440105, 11087, 211, 4, 52, "Input",ExpressionUUID->"2795cdbc-d9bd-4efa-8850-383d99f6b973"],
Cell[440319, 11093, 3335, 87, 199, "Input",ExpressionUUID->"0106ad6f-9774-4a7b-975c-56ef3c026944"],
Cell[443657, 11182, 705, 18, 73, "Input",ExpressionUUID->"ff5b3e1f-0813-480f-bd5d-9d613cb6de1d"]
}, Closed]],
Cell[CellGroupData[{
Cell[444399, 11205, 232, 4, 38, "Subsection",ExpressionUUID->"12236821-699f-4437-a262-7ccc305fe20e"],
Cell[444634, 11211, 247, 4, 35, "Text",ExpressionUUID->"ad21bd10-b4dc-42ad-bdd5-062b1052191a"],
Cell[444884, 11217, 1278, 32, 52, "Input",ExpressionUUID->"67f741f5-25ea-414a-935f-7b2b5f53a90d"],
Cell[446165, 11251, 1358, 35, 52, "Input",ExpressionUUID->"d12c1522-107a-4910-8fda-62d932476355"],
Cell[447526, 11288, 1433, 37, 52, "Input",ExpressionUUID->"19547657-a872-49f9-ae31-1047e9f52c97"],
Cell[448962, 11327, 1434, 37, 52, "Input",ExpressionUUID->"f8c395d1-8f5c-4ddd-bfba-f85f071514b4"],
Cell[450399, 11366, 178, 2, 30, "Input",ExpressionUUID->"a9e34469-adf0-444a-8507-a9e00ff4ab17"],
Cell[450580, 11370, 1548, 37, 73, "Input",ExpressionUUID->"87572a55-b552-4dcd-a65b-51a5a57a1410"]
}, Closed]]
}, Open  ]],
Cell[CellGroupData[{
Cell[452177, 11413, 148, 3, 67, "Section",ExpressionUUID->"8e3a97b3-377a-4861-80ad-ac1f12780e47"],
Cell[CellGroupData[{
Cell[452350, 11420, 274, 4, 54, "Subsection",ExpressionUUID->"14fe9a97-08de-4000-903e-413af7fb7fdc"],
Cell[452627, 11426, 378, 7, 36, "Text",ExpressionUUID->"1ce7c1ea-0d17-4c16-b046-4d2cf02d1366"],
Cell[453008, 11435, 922, 27, 99, "Input",ExpressionUUID->"f670800e-181a-4d57-a5dd-553b6533cb45"],
Cell[453933, 11464, 3506, 95, 117, "Input",ExpressionUUID->"6043ee0f-0e5c-4dda-8302-fa30ee99fc83"],
Cell[457442, 11561, 569, 14, 30, "Input",ExpressionUUID->"e3e4d4f8-f0ca-4742-aef8-95c17fcb7739"],
Cell[458014, 11577, 6913, 190, 287, "Input",ExpressionUUID->"580ac337-6de2-4716-96bb-3433c1fc610b"],
Cell[464930, 11769, 1468, 37, 52, "Input",ExpressionUUID->"df70346c-6ab9-4a2d-8943-d0cfd68d0330"],
Cell[466401, 11808, 6836, 187, 287, "Input",ExpressionUUID->"bd21eaed-6fce-471e-b1b7-75b8179a396d"],
Cell[473240, 11997, 1439, 37, 52, "Input",ExpressionUUID->"bbb9e265-3cc3-4861-8fa8-d9b09563ffe0"],
Cell[474682, 12036, 6861, 188, 287, "Input",ExpressionUUID->"4b21ca47-e704-43c0-8697-d1e24906946a"],
Cell[481546, 12226, 1488, 38, 52, "Input",ExpressionUUID->"4e96b262-0b62-4137-ac39-1b9bc77ebec6"],
Cell[483037, 12266, 6501, 185, 266, "Input",ExpressionUUID->"c1be5820-f5c7-4b5e-b374-bf5439ca4355"],
Cell[489541, 12453, 1390, 36, 52, "Input",ExpressionUUID->"9e4d085a-7bc0-4ef4-9a33-1c1caee57825"]
}, Closed]],
Cell[CellGroupData[{
Cell[490968, 12494, 154, 3, 38, "Subsection",ExpressionUUID->"a681592c-b0e0-461c-a84f-6584eb43075f"],
Cell[491125, 12499, 1261, 34, 52, "Input",ExpressionUUID->"0ca27859-3996-4836-8b1b-0cd1aee2b8ee"],
Cell[492389, 12535, 258, 5, 38, "Text",ExpressionUUID->"cfa8fe8f-b3f3-4457-9bfa-a1b637923b51"],
Cell[492650, 12542, 858, 23, 52, "Input",ExpressionUUID->"01e89891-e496-4826-8998-39581ee569c8"],
Cell[493511, 12567, 3113, 76, 116, "Input",ExpressionUUID->"c39f92c8-2e29-456f-a90e-6ce5f8e12d1c"],
Cell[496627, 12645, 452, 11, 94, "Input",ExpressionUUID->"04bc2853-5219-4d4e-8dab-181c62c4543a"]
}, Open  ]]
}, Open  ]]
}, Open  ]]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature ru0Ov0vpKxUFEC1cdeCWODDt *)
