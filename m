Return-Path: <linux-arm-msm+bounces-22177-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 31AA4901EBD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jun 2024 12:04:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 47AF71C21B63
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jun 2024 10:04:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2BD6757EB;
	Mon, 10 Jun 2024 10:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="K3RhCF3S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17AE0282EA;
	Mon, 10 Jun 2024 10:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718013839; cv=none; b=FQ+CXqxnsklExf26KDGYL25UmIRpEbn1PY2FewuyZRm5sq8QzCuADW0UYlwfOMrpOk3pJqeJbxsX2NVgeJoEcxDkJDP//quursBlKWwD5zILWRSeEM3Mq3OlAdyiP221WX/j4atNivwukTGGTIjPyjQwTvxtTODwZ9hVV/kgS30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718013839; c=relaxed/simple;
	bh=eMFS5nhr88caU/mqDFzOO+/Dk1BHmWCpMuTs/aAZzkY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=fEvWdBbbpVwtpaJfSyiDMWFs7wl3XtiQffxtZ5IKuw4yaVZgAcL4Z5yjSgKfZx8hCCIC+7NQUVMosBu3p70DLcEZ2u9N1vd3xzPecnM8kvFjAtJ9r2l8+60ZX8CPK1bFPUHWd6WQq8T5yr/GyEj0ehXQrqznI1fBNizEXlz5vJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=K3RhCF3S; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 459Mi6Rw018621;
	Mon, 10 Jun 2024 10:03:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GS840+Q5r8CsqGfhDFYbzgqrTTKqge+7XkgwC45UnYU=; b=K3RhCF3ShT6xftEp
	jNo3YEastBydhoXPqHQtHXc348DCT9TpUzZc1sZzkb5K0x3moVahssTBK5aApOmN
	HS+xjRcDmc4+lTNKhxcYP7zogg5g2uEId9/gw5wz/de+P+gy3xv3meNtLTPT0aOy
	kCSNj8EjzSqYyG4KOQSklniTIl9SN5uP+RKzPkM5LZpms16Ozg+l62dNG2JLtZsG
	5j6eFaW5gwIWEwkXGo6TZTAbG9TzKFgt8xcGocsk/JfBpZNaEUTuGy+9Wyv6u0Hv
	Jxx3m/vZx0mcxwvzkoU0GKgnDDBS+ZJng3UeigKsrR/OIn+fESCubMT+2M25y01T
	lPcGNw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ymemgk6aw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jun 2024 10:03:53 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45AA3pAZ004589
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jun 2024 10:03:51 GMT
Received: from [10.218.0.85] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 10 Jun
 2024 03:03:47 -0700
Message-ID: <7a0c9bbe-d499-428a-bfb4-deea45a345ce@quicinc.com>
Date: Mon, 10 Jun 2024 15:33:44 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] clk: qcom: lpassaudiocc-sc7280: Add support for LPASS
 resets for QCM6490
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "Michael
 Turquette" <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring
	<robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <quic_jkona@quicinc.com>, <quic_imrashai@quicinc.com>,
        <devicetree@vger.kernel.org>
References: <20240531102252.26061-1-quic_tdas@quicinc.com>
 <20240531102252.26061-3-quic_tdas@quicinc.com>
 <9eb80c39-562c-49de-b4fd-61d138247b7f@linaro.org>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <9eb80c39-562c-49de-b4fd-61d138247b7f@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: O09OxcnrDiRZE8rei5nXgjSLrDREf5YS
X-Proofpoint-ORIG-GUID: O09OxcnrDiRZE8rei5nXgjSLrDREf5YS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-10_02,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 suspectscore=0 adultscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 malwarescore=0 mlxscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406100076



On 5/31/2024 9:56 PM, Krzysztof Kozlowski wrote:
> On 31/05/2024 12:22, Taniya Das wrote:
>> On the QCM6490 boards the LPASS firmware controls the complete clock
>> controller functionalities. But the LPASS resets are required to be
>> controlled from the high level OS. The Audio SW driver should be able to
>> assert/deassert the audio resets as required. Thus in clock driver add
>> support for the same.
>>
>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>> ---
>>   drivers/clk/qcom/lpassaudiocc-sc7280.c | 28 ++++++++++++++++++++++++++
>>   1 file changed, 28 insertions(+)
>>
>> diff --git a/drivers/clk/qcom/lpassaudiocc-sc7280.c b/drivers/clk/qcom/lpassaudiocc-sc7280.c
>> index c43d0b1af7f7..7fdfd07c111c 100644
>> --- a/drivers/clk/qcom/lpassaudiocc-sc7280.c
>> +++ b/drivers/clk/qcom/lpassaudiocc-sc7280.c
>> @@ -1,6 +1,7 @@
>>   // SPDX-License-Identifier: GPL-2.0-only
>>   /*
>>    * Copyright (c) 2021, The Linux Foundation. All rights reserved.
>> + * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
>>    */
>>   
>>   #include <linux/clk-provider.h>
>> @@ -869,10 +870,36 @@ static struct platform_driver lpass_aon_cc_sc7280_driver = {
>>   	},
>>   };
>>   
>> +static const struct of_device_id lpass_audio_cc_qcm6490_match_table[] = {
>> +	{ .compatible = "qcom,qcm6490-lpassaudiocc" },
>> +	{ }
>> +};
>> +MODULE_DEVICE_TABLE(of, lpass_audio_cc_qcm6490_match_table);
>> +
>> +static int lpass_audio_cc_qcm6490_probe(struct platform_device *pdev)
>> +{
>> +	lpass_audio_cc_sc7280_regmap_config.name = "lpassaudio_cc_reset";
>> +	lpass_audio_cc_sc7280_regmap_config.max_register = 0xc8;
>> +
>> +	return qcom_cc_probe_by_index(pdev, 1, &lpass_audio_cc_reset_sc7280_desc);
>> +}
>> +
>> +static struct platform_driver lpass_audio_cc_qcm6490_driver = {
>> +	.probe = lpass_audio_cc_qcm6490_probe,
>> +	.driver = {
>> +		.name = "lpass_audio_cc-qcm6490",
>> +		.of_match_table = lpass_audio_cc_qcm6490_match_table,
>> +	},
>> +};
>> +
>>   static int __init lpass_audio_cc_sc7280_init(void)
>>   {
>>   	int ret;
>>   
>> +	ret = platform_driver_register(&lpass_audio_cc_qcm6490_driver);
>> +	if (ret)
>> +		return ret;
>> +
>>   	ret = platform_driver_register(&lpass_aon_cc_sc7280_driver);
> Why this is a new platform driver?  There should be just one driver with
> different match data.
> 

The main problem for me is that the current board(QCM6490) needs to be 
only support a subset of the entire(only resets) functionality the 
SC7280. If I redesign the probe function to pick the match data then I 
might accidentally break the existing functionalities on SC7280 boards.

Hence I thought to have a separate driver registration which looked a 
cleaner approach to go away from the "of_device_is_compatible".

> Best regards,
> Krzysztof
> 

-- 
Thanks & Regards,
Taniya Das.

