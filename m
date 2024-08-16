Return-Path: <linux-arm-msm+bounces-28775-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 500E9954483
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 10:35:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 753D51C210BB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 08:35:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C58713DBB1;
	Fri, 16 Aug 2024 08:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="By4uBISa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC0D13A25F;
	Fri, 16 Aug 2024 08:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723797258; cv=none; b=tP/QB65HdLtdUGKKPhGnvb5KITV6kmBFJ/0Q7tzRIMorg24VFwM48GXxWEEGBQS1Wyju4GyxEJE31o+n/MfdPvNZgb9CyMwLZiMjw0OuaOC9SFM2NnSKUIv5YQF7kVw/i4TecOteLznW2j1xyRS1rq4WwNTU7pboMxyrl0LB+CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723797258; c=relaxed/simple;
	bh=CLbEA16VYzfh9ZjjdPgv8sMocPIsWCq+QfqeoIZEg3o=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=FpIiejvYiERKfDprr9N2v+ZvsFsRk8NV7eVWydrNx9OQIkXEw0Pti4FPqU8c/+tfYHb3dQDbYVw8N3AAJ7IDKIURRFpn6VLDAtdExbrOJgf5lfMTDcTd2uzJS7DqIqjlReqs3EGwm5HlBxBTjBrWcSKhch8KF5fB3tgE5pnVVD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=By4uBISa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47FKvOA3025792;
	Fri, 16 Aug 2024 08:34:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kmJ8e65Flcrx2DXBzeuQTMxAZoEgXtbd0/dKxoONJMU=; b=By4uBISarTULJKfJ
	ffFUX2OQtI82LjBWOzuIwtwTcAfUqm68MGY1G7zbE5/LxuwKjc2aVrwUEVv9txv4
	n2yGvb+i7vxslhu4/r6MdQKt298G6yB6sOGIm3GKHjBIkS03V6IlMdWowu/blujr
	MeJOX5+d6X4w7w6qIdgyDNU18vcW9rOTV/rIIRA8RJucDFuJK9Rcw5CBZyfNbRvt
	LOejCESM06VYFMwx/BAnhZaEuT6mVw+oEbzTB0DHCu9voAHfmnSiop4vDhinHUmO
	ZYxI3cXQUsVcp2SM7rYnxxVXz7Y7CYpXW1BQn4J5OzJ4gY5jUMQw7YNoFAlOVN7j
	FSWXrg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 411s5ph6tv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Aug 2024 08:34:12 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47G8YBE1026838
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Aug 2024 08:34:11 GMT
Received: from [10.217.216.152] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 16 Aug
 2024 01:34:07 -0700
Message-ID: <9ebda78f-efad-40d2-9685-0dc48445ff6a@quicinc.com>
Date: Fri, 16 Aug 2024 14:04:03 +0530
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
 <7a0c9bbe-d499-428a-bfb4-deea45a345ce@quicinc.com>
 <7ed1a911-ee75-4fb4-9223-c79fa5d3a293@linaro.org>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <7ed1a911-ee75-4fb4-9223-c79fa5d3a293@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: s9-uty1CF6QzgtOXelBp2VGoWWHi-pOO
X-Proofpoint-ORIG-GUID: s9-uty1CF6QzgtOXelBp2VGoWWHi-pOO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-15_18,2024-08-15_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 mlxlogscore=999 suspectscore=0 lowpriorityscore=0 clxscore=1011
 bulkscore=0 phishscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408160060



On 6/16/2024 1:19 PM, Krzysztof Kozlowski wrote:
> On 10/06/2024 12:03, Taniya Das wrote:
>>
>>
>> On 5/31/2024 9:56 PM, Krzysztof Kozlowski wrote:
>>> On 31/05/2024 12:22, Taniya Das wrote:
>>>> On the QCM6490 boards the LPASS firmware controls the complete clock
>>>> controller functionalities. But the LPASS resets are required to be
>>>> controlled from the high level OS. The Audio SW driver should be able to
>>>> assert/deassert the audio resets as required. Thus in clock driver add
>>>> support for the same.
>>>>
>>>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>>>> ---
>>>>    drivers/clk/qcom/lpassaudiocc-sc7280.c | 28 ++++++++++++++++++++++++++
>>>>    1 file changed, 28 insertions(+)
>>>>
>>>> diff --git a/drivers/clk/qcom/lpassaudiocc-sc7280.c b/drivers/clk/qcom/lpassaudiocc-sc7280.c
>>>> index c43d0b1af7f7..7fdfd07c111c 100644
>>>> --- a/drivers/clk/qcom/lpassaudiocc-sc7280.c
>>>> +++ b/drivers/clk/qcom/lpassaudiocc-sc7280.c
>>>> @@ -1,6 +1,7 @@
>>>>    // SPDX-License-Identifier: GPL-2.0-only
>>>>    /*
>>>>     * Copyright (c) 2021, The Linux Foundation. All rights reserved.
>>>> + * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
>>>>     */
>>>>    
>>>>    #include <linux/clk-provider.h>
>>>> @@ -869,10 +870,36 @@ static struct platform_driver lpass_aon_cc_sc7280_driver = {
>>>>    	},
>>>>    };
>>>>    
>>>> +static const struct of_device_id lpass_audio_cc_qcm6490_match_table[] = {
>>>> +	{ .compatible = "qcom,qcm6490-lpassaudiocc" },
>>>> +	{ }
>>>> +};
>>>> +MODULE_DEVICE_TABLE(of, lpass_audio_cc_qcm6490_match_table);
>>>> +
>>>> +static int lpass_audio_cc_qcm6490_probe(struct platform_device *pdev)
>>>> +{
>>>> +	lpass_audio_cc_sc7280_regmap_config.name = "lpassaudio_cc_reset";
>>>> +	lpass_audio_cc_sc7280_regmap_config.max_register = 0xc8;
>>>> +
>>>> +	return qcom_cc_probe_by_index(pdev, 1, &lpass_audio_cc_reset_sc7280_desc);
>>>> +}
>>>> +
>>>> +static struct platform_driver lpass_audio_cc_qcm6490_driver = {
>>>> +	.probe = lpass_audio_cc_qcm6490_probe,
>>>> +	.driver = {
>>>> +		.name = "lpass_audio_cc-qcm6490",
>>>> +		.of_match_table = lpass_audio_cc_qcm6490_match_table,
>>>> +	},
>>>> +};
>>>> +
>>>>    static int __init lpass_audio_cc_sc7280_init(void)
>>>>    {
>>>>    	int ret;
>>>>    
>>>> +	ret = platform_driver_register(&lpass_audio_cc_qcm6490_driver);
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>>    	ret = platform_driver_register(&lpass_aon_cc_sc7280_driver);
>>> Why this is a new platform driver?  There should be just one driver with
>>> different match data.
>>>
>>
>> The main problem for me is that the current board(QCM6490) needs to be
>> only support a subset of the entire(only resets) functionality the
>> SC7280. If I redesign the probe function to pick the match data then I
>> might accidentally break the existing functionalities on SC7280 boards.
> 
> That's not a reason to not implement changes. Test your changes first.
> 
>>
>> Hence I thought to have a separate driver registration which looked a
>> cleaner approach to go away from the "of_device_is_compatible".
> 
> No. You over complicate simple case introducing unusual pattern.
> 

Krzysztof, now I am introducing a match data approach to differentiate 
between SC7280 and QCM6490 for adding the reset functionality only to 
the later board.

v2 series: 
https://lore.kernel.org/lkml/20240816-qcm6490-lpass-reset-v1-0-a11f33cad3c5@quicinc.com/T/#t 


> Best regards,
> Krzysztof
> 

-- 
Thanks & Regards,
Taniya Das.

