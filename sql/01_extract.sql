SELECT
mimiciv_hosp.diagnoses_icd.subject_id,
mimiciv_hosp.diagnoses_icd.hadm_id
FROM
mimiciv_hosp.diagnoses_icd
INNER JOIN mimiciv_hosp.d_icd_diagnoses ON mimiciv_hosp.d_icd_diagnoses.icd_code = mimiciv_hosp.diagnoses_icd.icd_code
WHERE
mimiciv_hosp.diagnoses_icd.icd_code IN ('5770   ',
'K8590  ',
'K8510  ',
'K8520  ',
'K859   ',
'K8580  ',
'K8591  ',
'K851   ',
'K8521  ',
'K852   ',
'K8500  ',
'K8592  ',
'K8511  ',
'K8530  ',
'K8581  ',
'K858   ',
'K8522  ',
'K8512  ',
'K853   ',
'K8582  ',
'K8501  ',
'K8502  ',
'K850   ',
'K8531  '




)

