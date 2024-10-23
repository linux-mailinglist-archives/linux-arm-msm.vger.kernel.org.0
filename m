Return-Path: <linux-arm-msm+bounces-35620-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 315829AD3B5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 20:13:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DF03E28516F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 18:13:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CA891D0F73;
	Wed, 23 Oct 2024 18:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="atiPE3Jy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2D01D0420;
	Wed, 23 Oct 2024 18:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729707202; cv=none; b=H9qn/rhu/LSf8iJJKw9wbFi36t0KOp8uYOTGEzYRipF5yWiBVduX81Nmz6ZTUEW0d9c4FC3wrNla9l0Ihr6nXKbnTOsl+reyQGIL/VWzWmDYZaffMgxvL+Nkx3YUN4ncBNF4C35r8r51bLM7j/3s64dOn9eiIKseBGdg6qHu+Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729707202; c=relaxed/simple;
	bh=oMZ6DMYn5Gkw9z0Yc7segS1XKe9eK5sU2wTCXJGVVng=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=LhfsEzW7sMGa3BndhfmW/I8y3DBuYSzq7utupA/37CHuz41GFtVdAoCL1whzVNB7NYmETz89mi3EvZ//ydZRXfAjl/tg1ZhdLU5LETGNEcrRS/gWkZK5+ODQEbUVDplhe1px1oqtVz39J4/sj1YlUF75r/0aYyD07+vvo5skM1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=atiPE3Jy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49N9M1B4029632;
	Wed, 23 Oct 2024 18:13:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TLl6cmRjMNmDV5ahUh8lbCBoDGivZW/FytmpdaCOLY0=; b=atiPE3JyH/vUoNvk
	Pggbt6gblNQaKvrWsUmv6wEMzweHxjVJLtWZ8ovVuH1OnG6IOO8XeQoLMeojNkiv
	u2cfpWD8p/Jg+lVY+GHAgRxwhwsCYL2nswhbizNLEnzb7pDOxX0TMLSILRfNvjVx
	9uNfSOZhYHnWa8Olag80Qxn/lBaRzPyzyG8o4BbvlhORES+ssmyHEKcK+q0Ra+2s
	/jw0E+QSU07eH/xjGxyMMye8LCeh4sRlqcpDCWN2HTDb0ZnnEoQKtnzGpJ56kjbY
	2gGiVyEFWnagRzLFLjOuAqMGLveAio7CTnaOM7HSWGrmPYCxIWdOpfwRmTqnI/8e
	/ZtRjA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em3w36bm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 18:13:16 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49NIDGuh013629
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 18:13:16 GMT
Received: from [10.71.108.63] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 23 Oct
 2024 11:13:15 -0700
Message-ID: <eaa02c1b-a742-4d17-b4fc-de09c9003121@quicinc.com>
Date: Wed, 23 Oct 2024 11:13:15 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] regulator: qcom-rpmh: Update ranges for FTSMPS525
To: David Collins <quic_collinsd@quicinc.com>,
        Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Trilok Soni
	<quic_tsoni@quicinc.com>,
        Satya Durga Srinivasu Prabhala
	<quic_satyap@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241021230348.2632381-1-quic_molvera@quicinc.com>
 <7c6c6343-a0f7-411f-aea4-c793317c164e@quicinc.com>
Content-Language: en-US
From: Melody Olvera <quic_molvera@quicinc.com>
In-Reply-To: <7c6c6343-a0f7-411f-aea4-c793317c164e@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: tkDEUz9biIwRoNHpHKfpjhIUUnSpvvhi
X-Proofpoint-GUID: tkDEUz9biIwRoNHpHKfpjhIUUnSpvvhi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 spamscore=0 malwarescore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410230115



On 10/22/2024 6:27 PM, David Collins wrote:
> On 10/21/24 16:03, Melody Olvera wrote:
>> The FTSMPS525 regulator has several potential ranges,
>> so update the ranges accordingly for SM8750.
>>
>> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
>> ---
>>   drivers/regulator/qcom-rpmh-regulator.c | 9 ++++++---
>>   1 file changed, 6 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
>> index 6c343b4b9d15..272de7bc9c88 100644
>> --- a/drivers/regulator/qcom-rpmh-regulator.c
>> +++ b/drivers/regulator/qcom-rpmh-regulator.c
>> @@ -848,9 +848,10 @@ static const struct rpmh_vreg_hw_data pmic5_ftsmps525_lv = {
>>   	.ops = &rpmh_regulator_vrm_ops,
>>   	.voltage_ranges = (struct linear_range[]) {
>>   		REGULATOR_LINEAR_RANGE(300000, 0, 267, 4000),
>> +		REGULATOR_LINEAR_RANGE(1376000, 268, 438, 8000),
>>   	},
>> -	.n_linear_ranges = 1,
>> -	.n_voltages = 268,
>> +	.n_linear_ranges = 2,
>> +	.n_voltages = 439,
>>   	.pmic_mode_map = pmic_mode_map_pmic5_smps,
>>   	.of_map_mode = rpmh_regulator_pmic4_smps_of_map_mode,
>>   };
> This configuration which specifies both LV and MV ranges should replace
> the pmic5_ftsmps525_lv and pmic5_ftsmps525_mv configurations.  It should
> then be used in the per-PMIC data tables below.
>
> All FTSMPS525 type regulators physically support both LV and MV ranges.
> However, the per-regulator selection of which range is used can only be
> set by boot loader firmware and the configuration is locked in hardware
> after initialization.  Unfortunately, the qcom-rpmh-regulator driver has
> no mechanism to determine at runtime if LV or MV range has been set for
> a particular regulator.  Additionally, that exact same regulator in the
> same PMIC could be configured for the other range when used on a
> different board (where the power grid has different requirements).
>
> Listing support in a unified configuration for both LV and MV ranges
> fixes the situation as it will work on all boards regardless of firmware
> LV vs MV selection.  This also accurately captures the capability of the
> regulator at a hardware level.

Understood; I'll merge the lv and mv configs together as we discussed 
and update
the driver accordingly.

>
>> @@ -1196,6 +1197,8 @@ static const struct rpmh_vreg_init_data pm8550vs_vreg_data[] = {
>>   	RPMH_VREG("smps4",  "smp%s4",  &pmic5_ftsmps525_lv, "vdd-s4"),
>>   	RPMH_VREG("smps5",  "smp%s5",  &pmic5_ftsmps525_lv, "vdd-s5"),
>>   	RPMH_VREG("smps6",  "smp%s6",  &pmic5_ftsmps525_mv, "vdd-s6"),
>> +	RPMH_VREG("smps7",  "smp%s7",  &pmic5_ftsmps525_lv, "vdd-s7"),
>> +	RPMH_VREG("smps8",  "smp%s8",  &pmic5_ftsmps525_lv, "vdd-s8"),
> These lines should not be added.  PMIC PM8550VS only has 6 FTSMPS525
> regulators inside.

Ack.

>
>>   	RPMH_VREG("ldo1",   "ldo%s1",  &pmic5_nldo515,   "vdd-l1"),
>>   	RPMH_VREG("ldo2",   "ldo%s2",  &pmic5_nldo515,   "vdd-l2"),
>>   	RPMH_VREG("ldo3",   "ldo%s3",  &pmic5_nldo515,   "vdd-l3"),
>> @@ -1205,7 +1208,7 @@ static const struct rpmh_vreg_init_data pm8550vs_vreg_data[] = {
>>   static const struct rpmh_vreg_init_data pm8550ve_vreg_data[] = {
>>   	RPMH_VREG("smps1", "smp%s1", &pmic5_ftsmps525_lv, "vdd-s1"),
>>   	RPMH_VREG("smps2", "smp%s2", &pmic5_ftsmps525_lv, "vdd-s2"),
>> -	RPMH_VREG("smps3", "smp%s3", &pmic5_ftsmps525_lv, "vdd-s3"),
>> +	RPMH_VREG("smps3", "smp%s3", &pmic5_ftsmps525_mv, "vdd-s3"),
>>   	RPMH_VREG("smps4", "smp%s4", &pmic5_ftsmps525_mv, "vdd-s4"),
>>   	RPMH_VREG("smps5", "smp%s5", &pmic5_ftsmps525_lv, "vdd-s5"),
>>   	RPMH_VREG("smps6", "smp%s6", &pmic5_ftsmps525_lv, "vdd-s6"),
>>
>> base-commit: 63b3ff03d91ae8f875fe8747c781a521f78cde17
> Take care,
> David Collins
>


