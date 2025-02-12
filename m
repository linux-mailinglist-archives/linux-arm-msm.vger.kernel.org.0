Return-Path: <linux-arm-msm+bounces-47801-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 291A8A32D35
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 18:17:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 025ED160F16
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 17:15:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DFA22580FC;
	Wed, 12 Feb 2025 17:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Xd9MBPY+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A3D42046BD;
	Wed, 12 Feb 2025 17:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739380520; cv=none; b=YAnRlCkNXmI9bY82Ot6SBCm42YQeABIA//8vRJLBTSTyBOFF66c0XS5ENq3UPg87o07o0tARMbccKVNZAjIMFTDG+7LRYo/9EAGd2gK6K0rhKoTe6YmUarRU1RzNLISc0O1fnYY0iuUrYKyTFlZgPVQB6Rjzy6ilSt7JFyWbxP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739380520; c=relaxed/simple;
	bh=GVymmSVS1ebyVXbVBweLRHWKTDtLJbwNbno7SHJrNQg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=E+3LcjgZ7BSH8wRb6ObE4okm7IfLqGCNS+pkQIRa6we5RMosg+znAMpl0b7P51XfZ9JZFEWWO69gE8MqfH3gBwsRUNg4R7g1t1v2MFdF3ga3sWcdK1ReARf6TGv9nyHv4pczKmyf4+0qoJ2xhW3PTBVuUZXTkJRoJtbMKhelQNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Xd9MBPY+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51C7ZO0t008337;
	Wed, 12 Feb 2025 17:15:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fn/Uz0QQ5xJlUtUINV8OA+ppVRksOiwjgOFLQIeYh9c=; b=Xd9MBPY+gJ+/a5wl
	pt1UGCoaLOEXvvjQB1BeZxAaXtR63bNm8bc+ymc/1bDSo0auww2W1yY08X4axja7
	FTTF03kVLt+j114oNdJG2sglmhLw5w+CUNwiQ/QoBIrIeilfwoydIJZPUvJzeFcm
	JHkkS4hP/Eh4dCmUZKz6gY9rVVvEv2ACqR7zYVIdSNaqiMdCLKOkoiRSdJV/rY5a
	ZTl13SVFwWsANUmZMyXtc+0OrTLiMSrjCBVFZS6KoQEel/KDQ33Dm1ta9OH4aw9g
	JV7BjTA442WmIWs0i7y8V5gXs5vb/dOhLC1f89w/Vjpb3u8STnTSxp1PU/7vbG+t
	nr5Bhw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qewh88xr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Feb 2025 17:15:13 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51CHF65x010552
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Feb 2025 17:15:06 GMT
Received: from [10.216.2.211] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 12 Feb
 2025 09:15:01 -0800
Message-ID: <ccc87c55-d157-4ffc-8081-1a5900752931@quicinc.com>
Date: Wed, 12 Feb 2025 22:44:58 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] clk: qcom: lpassaudiocc-sc7280: Add support for
 LPASS resets for QCM6490
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey
	<quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        "Jagadeesh Kona" <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250212-lpass_qcm6490_resets-v3-0-0b1cfb35b38e@quicinc.com>
 <20250212-lpass_qcm6490_resets-v3-2-0b1cfb35b38e@quicinc.com>
 <exyxni7td5vow2n6jarav5euje6dnbue5f5yxzu6az554dthfe@zn5yd2byvkoj>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <exyxni7td5vow2n6jarav5euje6dnbue5f5yxzu6az554dthfe@zn5yd2byvkoj>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ccX__PlDW1lE0AA6xIKmP-_va8_5B_LK
X-Proofpoint-GUID: ccX__PlDW1lE0AA6xIKmP-_va8_5B_LK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-12_05,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 impostorscore=0 mlxlogscore=985 phishscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502120126



On 2/12/2025 4:39 PM, Dmitry Baryshkov wrote:
> On Wed, Feb 12, 2025 at 01:52:20PM +0530, Taniya Das wrote:
>> On the QCM6490 boards the LPASS firmware controls the complete clock
>> controller functionalities. But the LPASS resets are required to be
>> controlled from the high level OS. The Audio SW driver should be able to
>> assert/deassert the audio resets as required. Thus in clock driver add
>> support for the resets.
>>
>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>> ---
>>  drivers/clk/qcom/lpassaudiocc-sc7280.c | 23 +++++++++++++++++++----
>>  1 file changed, 19 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/clk/qcom/lpassaudiocc-sc7280.c b/drivers/clk/qcom/lpassaudiocc-sc7280.c
>> index 45e7264770866f929a3f4663c477330f0bf7aa84..b6439308926371891cc5f9a5e0d4e8393641560d 100644
>> --- a/drivers/clk/qcom/lpassaudiocc-sc7280.c
>> +++ b/drivers/clk/qcom/lpassaudiocc-sc7280.c
>> @@ -1,6 +1,7 @@
>>  // SPDX-License-Identifier: GPL-2.0-only
>>  /*
>>   * Copyright (c) 2021, The Linux Foundation. All rights reserved.
>> + * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
>>   */
>>  
>>  #include <linux/clk-provider.h>
>> @@ -713,14 +714,24 @@ static const struct qcom_reset_map lpass_audio_cc_sc7280_resets[] = {
>>  	[LPASS_AUDIO_SWR_WSA_CGCR] = { 0xb0, 1 },
>>  };
>>  
>> +static const struct regmap_config lpass_audio_cc_sc7280_reset_regmap_config = {
>> +	.name = "lpassaudio_cc_reset",
>> +	.reg_bits = 32,
>> +	.reg_stride = 4,
>> +	.val_bits = 32,
>> +	.fast_io = true,
>> +	.max_register = 0xc8,
>> +};
>> +
>>  static const struct qcom_cc_desc lpass_audio_cc_reset_sc7280_desc = {
>> -	.config = &lpass_audio_cc_sc7280_regmap_config,
>> +	.config = &lpass_audio_cc_sc7280_reset_regmap_config,
>>  	.resets = lpass_audio_cc_sc7280_resets,
>>  	.num_resets = ARRAY_SIZE(lpass_audio_cc_sc7280_resets),
>>  };
>>  
>>  static const struct of_device_id lpass_audio_cc_sc7280_match_table[] = {
>> -	{ .compatible = "qcom,sc7280-lpassaudiocc" },
>> +	{ .compatible = "qcom,qcm6490-lpassaudiocc", .data = &lpass_audio_cc_reset_sc7280_desc },
>> +	{ .compatible = "qcom,sc7280-lpassaudiocc", .data = &lpass_audio_cc_sc7280_desc },
>>  	{ }
>>  };
>>  MODULE_DEVICE_TABLE(of, lpass_audio_cc_sc7280_match_table);
>> @@ -752,13 +763,17 @@ static int lpass_audio_cc_sc7280_probe(struct platform_device *pdev)
>>  	struct regmap *regmap;
>>  	int ret;
>>  
>> +	desc = device_get_match_data(&pdev->dev);
>> +
>> +	if (desc->num_resets)
>> +		return qcom_cc_probe_by_index(pdev, 1, desc);
> 
> Won't this break SC7280 support by causing an early return?
> 

The resets are not defined for SC7280.
static const struct qcom_cc_desc lpass_audio_cc_sc7280_desc = {
        .config = &lpass_audio_cc_sc7280_regmap_config,
        .clks = lpass_audio_cc_sc7280_clocks,
        .num_clks = ARRAY_SIZE(lpass_audio_cc_sc7280_clocks),
};

The reset get registered for SC7280 after the clocks are registered.
qcom_cc_probe_by_index(pdev, 1,  &lpass_audio_cc_reset_sc7280_desc);

>> +
>>  	ret = lpass_audio_setup_runtime_pm(pdev);
>>  	if (ret)
>>  		return ret;
>>  
>>  	lpass_audio_cc_sc7280_regmap_config.name = "lpassaudio_cc";
>>  	lpass_audio_cc_sc7280_regmap_config.max_register = 0x2f000;
>> -	desc = &lpass_audio_cc_sc7280_desc;
>>  
>>  	regmap = qcom_cc_map(pdev, desc);
>>  	if (IS_ERR(regmap)) {
>> @@ -772,7 +787,7 @@ static int lpass_audio_cc_sc7280_probe(struct platform_device *pdev)
>>  	regmap_write(regmap, 0x4, 0x3b);
>>  	regmap_write(regmap, 0x8, 0xff05);
>>  
>> -	ret = qcom_cc_really_probe(&pdev->dev, &lpass_audio_cc_sc7280_desc, regmap);
>> +	ret = qcom_cc_really_probe(&pdev->dev, desc, regmap);
>>  	if (ret) {
>>  		dev_err(&pdev->dev, "Failed to register LPASS AUDIO CC clocks\n");
>>  		goto exit;
>>
>> -- 
>> 2.45.2
>>
> 


