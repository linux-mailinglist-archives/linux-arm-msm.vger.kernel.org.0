Return-Path: <linux-arm-msm+bounces-28776-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 159CB954488
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 10:35:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2AABA1C21283
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 08:35:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5836C13DDAA;
	Fri, 16 Aug 2024 08:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HT8gpwJT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5A528399;
	Fri, 16 Aug 2024 08:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723797271; cv=none; b=gSHEhpTO45rkQvpfryZyMcU/f7WlHpFw9DJgn3KcQ81c61ZDVDALp8aDcc/6osi4xktXxA2JopWXpJNcThJaGbggcf09lSBGg7Q4bY5bZzvq58guT6Ch5HStdWN6m0IM4VhNQgzYPrVWQGf1o1dcDLxADMMLIvvB7ruxQ/AdwGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723797271; c=relaxed/simple;
	bh=eozYGS2HmFB6toyN2Wn2bKJdthZwK6XmkPr26dgQF4k=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=npFrwIHmyqPzxtjDv+6AHPznFYKuaJFEV8L20I6tJlFrvkgb08yjmp5vU+bLGjQMCNouJS3avzCzKjXjN9Xyd5QjWEp15a4uS/D/P8qZkdYCuhVT8C+6+rnJqTHK9sZF4W1NfaH3zRPMnsUP/6on/v70auHS5UN/+gLpeBjs2WU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HT8gpwJT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47FKcLD2018380;
	Fri, 16 Aug 2024 08:34:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LDOSa05F7KTsFfFkxg57FC4od+pKvGH8onyORrth3uY=; b=HT8gpwJTpk0ZKNjv
	xODK0KTP1b3SaMe3WB2dw6iZHablBIvifCa1viyv1Ibg5RMszm88z6RTF8psDIWA
	nLZkAz/dSdWAXf4tyq02AFbDNZvNk4H7dd2E7GGUkgwFYMZIVaGxt4IY1effO6Vb
	Ugc5KshauQmNKEkfkGmjBydpicrLR2dNs3/cpbnQXmJTq5qL86vnU6H4nvDwMfD0
	6PjnSPsmVlMMVcZBcdf/xRB2xtvL4UTQc2chHRwrwaRHWrdAvAqDxRWFoUWaj387
	PAf38APP4QhkZtGz2v1gZowt3HAX2f6DfJgdN1QaqSE8081hWIHYGLpAU58uA+uy
	38pPSQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 411rvr98m4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Aug 2024 08:34:25 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47G8YOfd025426
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Aug 2024 08:34:24 GMT
Received: from [10.217.216.152] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 16 Aug
 2024 01:34:20 -0700
Message-ID: <be2d07b2-ea75-4e98-a657-298c249acf89@quicinc.com>
Date: Fri, 16 Aug 2024 14:04:17 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] clk: qcom: lpassaudiocc-sc7280: Add support for LPASS
 resets for QCM6490
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Stephen
 Boyd" <sboyd@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <quic_jkona@quicinc.com>, <quic_imrashai@quicinc.com>,
        <devicetree@vger.kernel.org>
References: <20240531102252.26061-1-quic_tdas@quicinc.com>
 <20240531102252.26061-3-quic_tdas@quicinc.com>
 <6aad6a71-dd2f-4682-91ea-835357342ba1@linaro.org>
 <2800ce74-44ea-444b-b00f-e07bbfdd4415@quicinc.com>
 <b72b1965-b93f-4b71-9783-f201a17c7e36@linaro.org>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <b72b1965-b93f-4b71-9783-f201a17c7e36@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 4HQbZmvXJLlG0qlNB7mwO_8l1_1F5KlG
X-Proofpoint-ORIG-GUID: 4HQbZmvXJLlG0qlNB7mwO_8l1_1F5KlG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-15_18,2024-08-15_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 suspectscore=0 adultscore=0 malwarescore=0 spamscore=0 phishscore=0
 mlxlogscore=728 priorityscore=1501 clxscore=1015 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408160061



On 6/18/2024 6:52 PM, Konrad Dybcio wrote:
> 
> 
> On 6/10/24 12:19, Taniya Das wrote:
>>
>>
>> On 6/7/2024 3:00 PM, Konrad Dybcio wrote:
>>> On 31.05.2024 12:22 PM, Taniya Das wrote:
>>>> On the QCM6490 boards the LPASS firmware controls the complete clock
>>>> controller functionalities. But the LPASS resets are required to be
>>>> controlled from the high level OS. The Audio SW driver should be 
>>>> able to
>>>> assert/deassert the audio resets as required. Thus in clock driver add
>>>> support for the same.
>>>>
>>>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>>>> ---
>>>
>>> Please stop ignoring my comments without responding.
>>>
>>> https://lore.kernel.org/all/c1d07eff-4832-47d9-8598-aa6709b465ff@linaro.org/
>>>
>>
>> Sorry about that, it was not intentional. I had posted the v2 and 
>> decided to split as it was delaying the other changes in the older 
>> series which had more functional fixes.
>>
>>
>> Picking your comments from the old series.
>>
>> ---------------------------------
>>  > -    clk_zonda_pll_configure(&lpass_audio_cc_pll, regmap, 
>> &lpass_audio_cc_pll_config);
>>  > +    if (!of_property_read_bool(pdev->dev.of_node, 
>> "qcom,adsp-skip-pll")) {
>>
>> Big no-no.
>> --------------------------------
>>
>> Yes, I have already moved away from it and introduced a new probe to 
>> support the subset of functionality on QCM6490.
>>
>>
>> ------------------------
>>  > +        /* PLL settings */
>>  > +        regmap_write(regmap, 0x4, 0x3b);
>>  > +        regmap_write(regmap, 0x8, 0xff05);
>>
>> Model these properly and use the abstracted clock (re)configuration 
>> functions.
>> Add the unreachable clocks to `protected-clocks = <>` and make sure 
>> that the
>> aforementioned configure calls check if the PLL was really registered.
>> ---------------------------
>>
>> These were made for alignment of code, but existing approach was not 
>> touched.
> 
> That's not purely cosmetic, this now falls into the compatible-specific
> if-condition, which was my issue.
> 
>>
>> ---------------------
>>
>>  > +    lpass_audio_cc_sc7280_regmap_config.name = "lpassaudio_cc_reset";
>>
>> Ugh.. are these really not contiguous, or were the register ranges 
>> misrepresented from
>> the start?
>>
>>  > +    lpass_audio_cc_sc7280_regmap_config.max_register = 0xc8;
>>
>> Provide the real size of the block in .max_register instead, 
>> unconditionally
>> -----------------
>>
>> This had a little history behind this approach. During the driver 
>> development the ask was to avoid duplicating same descriptors and 
>> update runtime what is possible. That is the reason to update it 
>> runtime. The max register size is 0xC8 for resets functionality usage 
>> for High level OS.
> 
> What I mean is that, the register region size is constant for a given 
> piece of
> hardware. Whether Linux can safely access it or not, doesn't matter. The
> regmap_size value can just reflect the width of the region (and so 
> should the
> device tree).
> 

I understand the concern you have. I have introduced a separate regmap 
config for the LPASS resets which will have the required region size.

-- 
Thanks & Regards,
Taniya Das.

