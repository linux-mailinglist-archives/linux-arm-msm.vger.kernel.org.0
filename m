Return-Path: <linux-arm-msm+bounces-48601-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8584DA3D1F3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 08:17:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E648E17CE36
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 07:13:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66D7E1E9907;
	Thu, 20 Feb 2025 07:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HVUiokXz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6481E98E0;
	Thu, 20 Feb 2025 07:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740035596; cv=none; b=TYEmlHBzT0y5K1Yd8HnxcfECfMP6My2thg6TJG2LhV7fTu3Ds7IKqsc2BHrDQQDhbVDoWavmtl5dDOkH4BirLbZUyRHVcbFk4OCaxFv1tKngjVcRc2P5gf5+JWZm2yscA46QDDGSE2MRUReUEMPvbKybFgIdBsgoyqEp7sVdj+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740035596; c=relaxed/simple;
	bh=yaxjXWijVyI77ueaPwlvEeTDIMMGsvjTUWEjD+hCuEo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=MwX1UcQ3iTywM+v2F7f7cY+viOZnW93b2F1pXNt39MTOoEf78DAeUsT8Hun6z7aTgPmFU/GErc9H1NOWDFt4CP/wYBt5DeJBjfJN2vPAL8QrALaICAQ01yRVYJjX/8UZMoLnHG4OlmFyt27C8eSEWGqewprnPEc7Q0v0zhKFJmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HVUiokXz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51JH81QG009732;
	Thu, 20 Feb 2025 07:13:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m8Wmdm/C5lzqJIXVHm2jjl5gjWgQah+xD67gZLNzdcA=; b=HVUiokXzv8ydlXfK
	D2xbPgXKeq7gpGH9wjnHyLhEJz6KTuZMoIb28uA4YM1OtBmoWLWHw3vHrNImjiLl
	+f6Ytuz+OXw5yz70zd6SQScs4akD9CfM8AcfIXEM2XML+DSHe/d59x0RVbvCz1Xe
	a2zO+7TTyiq8IqmbtmanGJT4os4edofek4ZQ56weKL/YrVz7UN2ePaHUuj9O0hwj
	+s7k7goE2bmjtpV6G/qbsgH+b3nJ7KqQWsAEJ+WNM0+5SvD9aNPh4Ry0mjn2FbPa
	fGhxOTdXUE0l3aZxpfJ047Ska3NAtuq3kcVf9d/G1lWERyrY/B9hfscwO+JVcWgL
	8vEx1w==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy1wa4x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Feb 2025 07:13:09 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51K7D8wd010044
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Feb 2025 07:13:08 GMT
Received: from [10.217.216.47] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 19 Feb
 2025 23:13:03 -0800
Message-ID: <a3903d37-03ab-4f1c-acf0-4683d1297906@quicinc.com>
Date: Thu, 20 Feb 2025 12:43:00 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] clk: qcom: videocc: Add support to attach multiple
 power domains
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Stephen
 Boyd" <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        "Satya Priya
 Kakitapalli" <quic_skakitap@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250218-videocc-pll-multi-pd-voting-v1-0-cfe6289ea29b@quicinc.com>
 <20250218-videocc-pll-multi-pd-voting-v1-4-cfe6289ea29b@quicinc.com>
 <eec2869a-fa8f-4aaf-9fc5-e7a8baf0f864@linaro.org>
 <huluiiaqmunvmffoqadrhssd3kl2toutqtcw7rzamv3sqdglsf@7lz66x4sj3gv>
 <a8350d0f-2a63-46de-86f3-c156809cca0e@quicinc.com>
 <v744bey7hvqkhzx4f6tb7sqds4yh5ggpv2ftuhbjbose3wossd@hjf6sqaitjfx>
Content-Language: en-US
From: Jagadeesh Kona <quic_jkona@quicinc.com>
In-Reply-To: <v744bey7hvqkhzx4f6tb7sqds4yh5ggpv2ftuhbjbose3wossd@hjf6sqaitjfx>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: uOQZILnm9Uv1qEDJFUDGoXdTXM3g0GUq
X-Proofpoint-ORIG-GUID: uOQZILnm9Uv1qEDJFUDGoXdTXM3g0GUq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-20_02,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502200050



On 2/19/2025 5:32 PM, Dmitry Baryshkov wrote:
> On Wed, Feb 19, 2025 at 05:08:52PM +0530, Jagadeesh Kona wrote:
>>
>>
>> On 2/18/2025 10:49 PM, Dmitry Baryshkov wrote:
>>> On Tue, Feb 18, 2025 at 03:46:15PM +0000, Bryan O'Donoghue wrote:
>>>> On 18/02/2025 14:26, Jagadeesh Kona wrote:
>>>>> During boot-up, the PLL configuration might be missed even after
>>>>> calling pll_configure() from the clock controller probe. This can
>>>>> happen because the PLL is connected to one or more rails that are
>>>>> turned off, and the current clock controller code cannot enable
>>>>> multiple rails during probe. Consequently, the PLL may be activated
>>>>> with suboptimal settings, causing functional issues.
>>>>>
>>>>> To properly configure the video PLLs in the probe on SM8450, SM8475,
>>>>> SM8550, and SM8650 platforms, the MXC rail must be ON along with MMCX.
>>>>> Therefore, add support to attach multiple power domains to videocc on
>>>>> these platforms.
>>>>>
>>>>> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
>>>>> ---
>>>>>   drivers/clk/qcom/videocc-sm8450.c | 4 ++++
>>>>>   drivers/clk/qcom/videocc-sm8550.c | 4 ++++
>>>>>   2 files changed, 8 insertions(+)
>>>>>
>>>>> diff --git a/drivers/clk/qcom/videocc-sm8450.c b/drivers/clk/qcom/videocc-sm8450.c
>>>>> index f26c7eccb62e7eb8dbd022e2f01fa496eb570b3f..b50a14547336580de88a741f1d33b126e9daa848 100644
>>>>> --- a/drivers/clk/qcom/videocc-sm8450.c
>>>>> +++ b/drivers/clk/qcom/videocc-sm8450.c
>>>>> @@ -437,6 +437,10 @@ static int video_cc_sm8450_probe(struct platform_device *pdev)
>>>>>   	struct regmap *regmap;
>>>>>   	int ret;
>>>>> +	ret = qcom_cc_attach_pds(&pdev->dev, &video_cc_sm8450_desc);
>>>>> +	if (ret)
>>>>> +		return ret;
>>>>> +
>>>>>   	ret = devm_pm_runtime_enable(&pdev->dev);
>>>>>   	if (ret)
>>>>>   		return ret;
>>>>> diff --git a/drivers/clk/qcom/videocc-sm8550.c b/drivers/clk/qcom/videocc-sm8550.c
>>>>> index 7c25a50cfa970dff55d701cb24bc3aa5924ca12d..d4b223d1392f0721afd1b582ed35d5061294079e 100644
>>>>> --- a/drivers/clk/qcom/videocc-sm8550.c
>>>>> +++ b/drivers/clk/qcom/videocc-sm8550.c
>>>>> @@ -542,6 +542,10 @@ static int video_cc_sm8550_probe(struct platform_device *pdev)
>>>>>   	int ret;
>>>>>   	u32 sleep_clk_offset = 0x8140;
>>>>> +	ret = qcom_cc_attach_pds(&pdev->dev, &video_cc_sm8550_desc);
>>>>> +	if (ret)
>>>>> +		return ret;
>>>>> +
>>>>>   	ret = devm_pm_runtime_enable(&pdev->dev);
>>>>>   	if (ret)
>>>>>   		return ret;
>>>>>
>>>>
>>>> What's the difference between doing the attach here or doing it in
>>>> really_probe() ?
>>>
>>> I'd second this. If the domains are to be attached before calling any
>>> other functions, move the call to the qcom_cc_map(), so that all drivers
>>> get all domains attached before configuring PLLs instead of manually
>>> calling the function.
>>>
>>
>> I earlier tried moving the attach PDs call to qcom_cc_map(), but I faced the below issues
>> 1. desc passed to qcom_cc_map() has const qualifier, so updating desc->pd_list
>>    inside qcom_cc_map() is leading to a warning.
> 
> And? Can you fix the warning?
> 

I can remove the const qualifier in qcom_cc_map() prototype to fix this, but that requires changes
in many other clock drivers also since they are currently passing const descriptor to qcom_cc_map().
So would like to keep the qcom_cc_map() unchanged.

>> 2. If we attach the PDs after calling get_sync() on device, I observed
>>    that PDS are not getting enabled during probe. Currently qcom_cc_map()
>>    is called after get_sync() is already called on device.
> 
> Move PM handling into qcom_cc_map(). Then together with the Bryan's
> proposal most of the probe() functions can just call qcom_cc_probe()
> 

I agree with this approach to move entire PM handling to qcom_cc_map() but one concern is const
qualifier mentioned above and it also enables runtime PM for clock controllers that doesn't need
any runtime PM(e.g:- GCC/GPUCC). That may not cause any issue but we also need to see from where
we need to call pm_runtime_put().

We may have to add pm_runtime_put() at the end of both qcom_cc_probe() and qcom_cc_really_probe()
to move the device back to suspend after probe. But ideally runtime PM is not required for most
clock controllers except MMCC's that have MMCX dependency. Please let me know your thoughts on this.

Thanks,
Jagadeesh

>>
>> Probably, we can add a new function qcom_cc_attach_pds_map() where we can
>> attach PDs and call qcom_cc_map() inside it. We can then invoke this new
>> function at the start of probe before get_sync(). I will post this change
>> in next version if this aligns with your thoughts.
>>
>> Thanks,
>> Jagadeesh
> 

