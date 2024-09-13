Return-Path: <linux-arm-msm+bounces-31675-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9678A97785F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Sep 2024 07:31:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4CA7F1F25B79
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Sep 2024 05:31:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A21AF17E919;
	Fri, 13 Sep 2024 05:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PNuU1yff"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F153C13A87C;
	Fri, 13 Sep 2024 05:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726205475; cv=none; b=IykZ3D1dz5cRT6qAV3mfr0ok1IbM7kcarukNwHdV+ZT1vQquXR8/Wraz0/M13RJAL297lKCKO90LYFGStC9yagTtme4PQgGKHszieN/I5qtslbo49A3jIDA5UDn9SiOfyQWMKHIWBWxZMd52OkPWUkRDVyFd83Hho/1KFzl0ArU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726205475; c=relaxed/simple;
	bh=hLvwALJYS0Ms5X5w32Gr/vWBFtFxSedf0uASpJp8Pmo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=GB4n0/Ipf6NIaVfDzdrirLGfHmlxmm7aE7OPf6sDM/8Y3FCfVRCzJR+Ify6Y5qF0blcxyDi1TXpILTxf+x7Hw0dgjrzrt2Hc6fkC/qgdx4QZijRKXSKBEKhnlJ5ap01acHnU5rskVPmqIh3FEYnMuAXhOQ5nuG8Ir/jWWX0OKzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PNuU1yff; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48CMD3AK014383;
	Fri, 13 Sep 2024 05:31:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ebwHcJiJ19PCSvJeefM2jzsbHo9gyE7rK7UJ+ppe14M=; b=PNuU1yffx7pL7s5b
	XTa2xtOGozhaA8gzQ89C/R+6yIC/qNCUCANI1P3oo4AliLwvoo9jt2wDutk/7EHq
	vqeOGueKO6kGsi4IPZdAuDVniAlW3DmtAvl5hYQpSgw43z2c2i9ndhClF/gHGLOm
	FYFCinkM+7njopET9DrQC0K3XCe6qzQATwPij+kqhb87www36nX07GjUJNdmjl1m
	BDl5l0Py5cCH/oVCGxqKAcQ9ImYNNDnpmCNgjbb5KbyRUyUg9NDhBcwWjHg8NpW8
	U7udRJnqudE6H0IllvZ5XztqV3zT964Amt0XmsiGpPWh78z+c0P6gYVoULkxthvi
	3xxQEQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41gy51fgej-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Sep 2024 05:31:10 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48D5V8mH010986
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Sep 2024 05:31:08 GMT
Received: from [10.217.216.152] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 12 Sep
 2024 22:31:04 -0700
Message-ID: <936f151e-6951-4dea-95ed-35374ab249cf@quicinc.com>
Date: Fri, 13 Sep 2024 11:01:01 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] clk: qcom: lpassaudiocc-sc7280: Add support for
 LPASS resets for QCM6490
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Stephen
 Boyd" <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, <quic_imrashai@quicinc.com>,
        <quic_jkona@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20240816-qcm6490-lpass-reset-v1-0-a11f33cad3c5@quicinc.com>
 <20240816-qcm6490-lpass-reset-v1-2-a11f33cad3c5@quicinc.com>
 <67819a53-8e99-469b-a458-8c00034fec4a@kernel.org>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <67819a53-8e99-469b-a458-8c00034fec4a@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: eZ-fiT7bS5-zNR_6vyY_ds7-VSuMStCe
X-Proofpoint-GUID: eZ-fiT7bS5-zNR_6vyY_ds7-VSuMStCe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 mlxscore=0 bulkscore=0 mlxlogscore=999 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 clxscore=1015 phishscore=0
 suspectscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2408220000 definitions=main-2409130038



On 8/17/2024 2:55 PM, Krzysztof Kozlowski wrote:
> On 16/08/2024 10:32, Taniya Das wrote:
>> On the QCM6490 boards the LPASS firmware controls the complete clock
>> controller functionalities. But the LPASS resets are required to be
>> controlled from the high level OS. The Audio SW driver should be able to
>> assert/deassert the audio resets as required. Thus in clock driver add
>> support for the resets.
>>
>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>> ---
>>   drivers/clk/qcom/lpassaudiocc-sc7280.c | 23 +++++++++++++++++++----
>>   1 file changed, 19 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/clk/qcom/lpassaudiocc-sc7280.c b/drivers/clk/qcom/lpassaudiocc-sc7280.c
>> index 45e726477086..b64393089263 100644
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
>> @@ -713,14 +714,24 @@ static const struct qcom_reset_map lpass_audio_cc_sc7280_resets[] = {
>>   	[LPASS_AUDIO_SWR_WSA_CGCR] = { 0xb0, 1 },
>>   };
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
>>   static const struct qcom_cc_desc lpass_audio_cc_reset_sc7280_desc = {
>> -	.config = &lpass_audio_cc_sc7280_regmap_config,
>> +	.config = &lpass_audio_cc_sc7280_reset_regmap_config,
>>   	.resets = lpass_audio_cc_sc7280_resets,
>>   	.num_resets = ARRAY_SIZE(lpass_audio_cc_sc7280_resets),
>>   };
>>   
>>   static const struct of_device_id lpass_audio_cc_sc7280_match_table[] = {
>> -	{ .compatible = "qcom,sc7280-lpassaudiocc" },
>> +	{ .compatible = "qcom,qcm6490-lpassaudiocc", .data = &lpass_audio_cc_reset_sc7280_desc },
> 
> That's odd to see sc7280 reset added for qcm6490, but not used fot
> sc7280 at all. Didn't you mean here lpass_audio_cc_qcm6409_desc?
> 
> 
The resets descriptor(lpass_audio_cc_reset_sc7280_desc) is not part of 
the global clock descriptor(lpass_cc_sc7280_desc) as these are part of 
different regmaps.

On a non-QCM6490(SC7280) boards the resets are registered after the 
global descriptor is registered.

But on QCM6490 board we need to register only the reset descriptor and 
no clocks are to be handled/registered and thus passed the match data 
for QCM6490 boards only.

> Best regards,
> Krzysztof
> 

-- 
Thanks & Regards,
Taniya Das.

