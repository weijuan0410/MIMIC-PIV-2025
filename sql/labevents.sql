WITH bb AS (

SELECT DISTINCT

labevents.subject_id,

labevents.hadm_id,

icustays.stay_id,

labevents.charttime,

labevents.VALUENUM,

ROW_NUMBER ( ) OVER ( PARTITION BY icustays.stay_id ORDER BY labevents.charttime ) AS rn

FROM

( mimiciv_hosp.labevents LEFT JOIN mimiciv_icu.icustays ON ( ( icustays.hadm_id = labevents.hadm_id ) ) )

WHERE

( ( labevents.itemid = 50853) AND ( labevents.charttime &gt;= icustays.intime ) and ( labevents.charttime &lt; icustays.intime + interval '1' day ) ) ),

aa AS (SELECT

bb.subject_id,

bb.hadm_id,

bb.stay_id,

bb.charttime,

bb.VALUENUM as firstXX

FROM bb WHERE bb.rn = '1' ),

cc AS ( SELECT bb.stay_id,

MIN ( bb.VALUENUM ) as MINXX ,

MAX ( bb.VALUENUM ) as MAXXX,

cast (AVG(bb.VALUENUM ) as numeric) as AVGXX

FROM bb GROUP BY bb.stay_id )

SELECT

aa.stay_id,

aa.firstXX as firstXX,

cc.MINXX as minXX,

cc.MAXXX as maxXX,

cc.AVGXX as avgXX

FROM aa LEFT JOIN cc ON aa.stay_id = cc.stay_id
