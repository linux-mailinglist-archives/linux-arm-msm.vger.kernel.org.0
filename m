Return-Path: <linux-arm-msm+bounces-46058-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 55031A1B37F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 11:32:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9660A16A970
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 10:32:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9168A1CB534;
	Fri, 24 Jan 2025 10:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HOTyesmN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C206CE573;
	Fri, 24 Jan 2025 10:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737714774; cv=none; b=YsFtUx0sblgI20aW3c13ovwU+ryXeFvoTzOmmUAKI5HO9D/8bIjk5+BJr8yrwyjMtL+AHgWn/bROlxrsz+hz+RzQVnNoPjhFtu7BDF9r2sDNeadoy/mX9SnAln1WUU/8KODRLRt0J6U+1P2F1wzN7MUOowU5Sw18Ok2yPx6+vVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737714774; c=relaxed/simple;
	bh=MoL5QGOraCQ2FlT3n6zMCDTMXJNG5dk/20zqRLEZ0Nc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=qK6ADD/mS0ZQbUxGw5McneMWsHdvJggaqpA3BVHd0jjw/d1EybiBtyngT0z1w2Q42N8N4WOyOUjA7wNpxI0hzIDpp5sGhgWs/cvlTtkC26SLJdcAARiWVz9TT7Q5UkYQti+/t1KKGqOet5Ne0kCoOqtL9XBXNM+KwhPikafV9w8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HOTyesmN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50O8Cdsm014020;
	Fri, 24 Jan 2025 10:32:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B7Cn0xg84WhD8JMOCAxHDq/VVxk6QrGQDGZXcWdCK1k=; b=HOTyesmNIVVJD+/j
	7KkunzVdLz5g/1LkkdN6AvxZRTFE9cNpGyBdC5JA7Omy5FxaHxdLTx27p149QIKq
	+9jJnvaHqv35g/p7AFIMZ6B9RXHz+3xmOFZv4zify4chZ++qhlSIJdZr5FeljVch
	BjoDQ3jyArlL3Jw9A521wtQhl/5x7r2s/VU+5gykYGV70sVyXVL7nvsKN5hc4bPd
	0QDqQdAwSG0Gyljkp1y/utK1ExL6g236jex6e8eXEHu0tnuehIVCzrhqJloEG34H
	NCEuKb5OZIxzGmZlVc1w8SEGnQOQVrI/5jm6Rvady7hPfGfSHSEGUwiJS7Gmb2mL
	BXwktg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44c75bget2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 10:32:48 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50OAWlsa029918
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 10:32:47 GMT
Received: from [10.217.217.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 24 Jan
 2025 02:32:39 -0800
Message-ID: <7aca503d-4a8f-4c3e-ae1e-b95d49c65a85@quicinc.com>
Date: Fri, 24 Jan 2025 16:02:36 +0530
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
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, <quic_imrashai@quicinc.com>,
        <quic_jkona@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20240816-qcm6490-lpass-reset-v1-0-a11f33cad3c5@quicinc.com>
 <20240816-qcm6490-lpass-reset-v1-2-a11f33cad3c5@quicinc.com>
 <67819a53-8e99-469b-a458-8c00034fec4a@kernel.org>
 <936f151e-6951-4dea-95ed-35374ab249cf@quicinc.com>
 <9b3350ba-eafe-4bb0-a6cc-f1b0a06d623e@kernel.org>
 <ya6aqhq27mizdozfhaa6evwt6kqjdryafozdxvwdm3l75cfd24@wloodcwrgkyu>
 <80ca3719-1c7f-4899-b533-faf3c9093444@kernel.org>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <80ca3719-1c7f-4899-b533-faf3c9093444@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 6Hdv-SzDf9oXrtu0F7zkqcEYraxVGl5M
X-Proofpoint-ORIG-GUID: 6Hdv-SzDf9oXrtu0F7zkqcEYraxVGl5M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-24_04,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 malwarescore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 spamscore=0 impostorscore=0 mlxlogscore=999 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501240076



On 9/16/2024 2:33 PM, Krzysztof Kozlowski wrote:
> On 16/09/2024 10:55, Dmitry Baryshkov wrote:
>> On Mon, Sep 16, 2024 at 10:33:21AM GMT, Krzysztof Kozlowski wrote:
>>> On 13/09/2024 07:31, Taniya Das wrote:
>>>>
>>>>
>>>> On 8/17/2024 2:55 PM, Krzysztof Kozlowski wrote:
>>>>> On 16/08/2024 10:32, Taniya Das wrote:
>>>>>> On the QCM6490 boards the LPASS firmware controls the complete clock
>>>>>> controller functionalities. But the LPASS resets are required to be
>>>>>> controlled from the high level OS. The Audio SW driver should be able to
>>>>>> assert/deassert the audio resets as required. Thus in clock driver add
>>>>>> support for the resets.
>>>>>>
>>>>>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>>>>>> ---
>>>>>>    drivers/clk/qcom/lpassaudiocc-sc7280.c | 23 +++++++++++++++++++----
>>>>>>    1 file changed, 19 insertions(+), 4 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/clk/qcom/lpassaudiocc-sc7280.c b/drivers/clk/qcom/lpassaudiocc-sc7280.c
>>>>>> index 45e726477086..b64393089263 100644
>>>>>> --- a/drivers/clk/qcom/lpassaudiocc-sc7280.c
>>>>>> +++ b/drivers/clk/qcom/lpassaudiocc-sc7280.c
>>>>>> @@ -1,6 +1,7 @@
>>>>>>    // SPDX-License-Identifier: GPL-2.0-only
>>>>>>    /*
>>>>>>     * Copyright (c) 2021, The Linux Foundation. All rights reserved.
>>>>>> + * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
>>>>>>     */
>>>>>>    
>>>>>>    #include <linux/clk-provider.h>
>>>>>> @@ -713,14 +714,24 @@ static const struct qcom_reset_map lpass_audio_cc_sc7280_resets[] = {
>>>>>>    	[LPASS_AUDIO_SWR_WSA_CGCR] = { 0xb0, 1 },
>>>>>>    };
>>>>>>    
>>>>>> +static const struct regmap_config lpass_audio_cc_sc7280_reset_regmap_config = {
>>>>>> +	.name = "lpassaudio_cc_reset",
>>>>>> +	.reg_bits = 32,
>>>>>> +	.reg_stride = 4,
>>>>>> +	.val_bits = 32,
>>>>>> +	.fast_io = true,
>>>>>> +	.max_register = 0xc8,
>>>>>> +};
>>>>>> +
>>>>>>    static const struct qcom_cc_desc lpass_audio_cc_reset_sc7280_desc = {
>>>>>> -	.config = &lpass_audio_cc_sc7280_regmap_config,
>>>>>> +	.config = &lpass_audio_cc_sc7280_reset_regmap_config,
>>>>>>    	.resets = lpass_audio_cc_sc7280_resets,
>>>>>>    	.num_resets = ARRAY_SIZE(lpass_audio_cc_sc7280_resets),
>>>>>>    };
>>>>>>    
>>>>>>    static const struct of_device_id lpass_audio_cc_sc7280_match_table[] = {
>>>>>> -	{ .compatible = "qcom,sc7280-lpassaudiocc" },
>>>>>> +	{ .compatible = "qcom,qcm6490-lpassaudiocc", .data = &lpass_audio_cc_reset_sc7280_desc },
>>>>>
>>>>> That's odd to see sc7280 reset added for qcm6490, but not used fot
>>>>> sc7280 at all. Didn't you mean here lpass_audio_cc_qcm6409_desc?
>>>>>
>>>>>
>>>> The resets descriptor(lpass_audio_cc_reset_sc7280_desc) is not part of
>>>> the global clock descriptor(lpass_cc_sc7280_desc) as these are part of
>>>> different regmaps.
>>>>
>>>> On a non-QCM6490(SC7280) boards the resets are registered after the
>>>> global descriptor is registered.
>>>>
>>>> But on QCM6490 board we need to register only the reset descriptor and
>>>> no clocks are to be handled/registered and thus passed the match data
>>>> for QCM6490 boards only.
>>>
>>> Yeah, but why this is sc7280?
>>
>> Because it's more or less the same HW, different TZ and hyp firmware?
>>
> 
> Hm, ok, probably I missed something from the context.
>

Apologies for responding on this thread later than expected.
Yes as Dmitry mentioned, it is the same HW, TZ and HYP firmware are 
different.

> Best regards,
> Krzysztof



-- 
Thanks & Regards,
Taniya Das.


