Return-Path: <linux-arm-msm+bounces-49122-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 231DDA41586
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 07:37:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0BF65172A60
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 06:37:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5EFE202C44;
	Mon, 24 Feb 2025 06:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Wy4s+5of"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5F41FDA95;
	Mon, 24 Feb 2025 06:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740379070; cv=none; b=NUyuRbcIqQRDl57F2jB6JFUHKdJmz7uzbO2m2iNICyKJyGy9KS0/UjJJ4Zvdx/hXGUV2ZjiwXVVFUQnhpLh36LY5cCXtMcmfpv1Vh8ZYnVZt7nH3x/Ldu6Me4VizQq7Br65wZmpJbhmIWc18ndYo1pke/czybtcng2gXJZy4UH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740379070; c=relaxed/simple;
	bh=KgeiBSxJUwOMMNd7ioB6PP7IR/ZAWqrIKSq396HS4OI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=eG03GsyTBiBIMvZUYQE2iMyzOlkrrQrjpw+/bGwVN/CVFbKkJ4G8Oei0bTX7lBJ4dGVWTIhpaqcygXFQsIz1cBHfxnuKHU6tDt5nAl5s0i9DgfUjE51kd1WkOV5+l/9ypkyT0hN+tkpXM0PCWirQbFcMxJLmOHinU2ipV8ffvNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Wy4s+5of; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51NNKs5k032348;
	Mon, 24 Feb 2025 06:37:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vcsq9ACvaeyPq9f95EMH2qUtLlQ/ZTwt2MIrSmvOvEw=; b=Wy4s+5ofmu9ZRhEg
	NV5nW4+KiVzhyR4qOybts8VrJh+kX9rCXpZzF3SnhypHrKXu1t2pr5+pvV04AZQ6
	g3ajX4FfSgqRmOeMKCH/BGO40/9ulCU4BWeRU7ibwqZ9CL6hoEyybot0g4MhpPkE
	xezN/rE09JoJIsudI7dkwMLNbkuJmTc3ZcbOGzon7fvzIm/BbMIbZOrcCgcuTxai
	8MDfW9lvZ3jfCThHOwpjo130n+HOlkv0ezie78NebFmf9puLhybVK+9IiH6CMhkt
	pc4AwQue3YHoPGlPHc9UR9VMG3cwd7yuM11BJPsrj0PgBJfRjCOClRJf8VCKJwCH
	N5aPnQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44y5k63x3h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Feb 2025 06:37:44 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51O6bU8e018152
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Feb 2025 06:37:30 GMT
Received: from [10.217.216.47] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 23 Feb
 2025 22:37:24 -0800
Message-ID: <a06f1e5b-78fb-4f95-96bb-985a585d4706@quicinc.com>
Date: Mon, 24 Feb 2025 12:07:21 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] clk: qcom: videocc: Add support to attach multiple
 power domains
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "Michael Turquette" <mturquette@baylibre.com>,
        Stephen Boyd
	<sboyd@kernel.org>, "Rob Herring" <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        "Conor Dooley" <conor+dt@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
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
 <1d9b661e-0607-4567-b420-5444b643df99@oss.qualcomm.com>
Content-Language: en-US
From: Jagadeesh Kona <quic_jkona@quicinc.com>
In-Reply-To: <1d9b661e-0607-4567-b420-5444b643df99@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ZezeoRbAm_q98-sJTHR6RnYGE54XLHXz
X-Proofpoint-GUID: ZezeoRbAm_q98-sJTHR6RnYGE54XLHXz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-24_02,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 bulkscore=0 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0
 mlxlogscore=999 suspectscore=0 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502240047



On 2/22/2025 12:49 AM, Konrad Dybcio wrote:
> On 18.02.2025 4:46 PM, Bryan O'Donoghue wrote:
>> On 18/02/2025 14:26, Jagadeesh Kona wrote:
>>> During boot-up, the PLL configuration might be missed even after
>>> calling pll_configure() from the clock controller probe. This can
>>> happen because the PLL is connected to one or more rails that are
>>> turned off, and the current clock controller code cannot enable
>>> multiple rails during probe. Consequently, the PLL may be activated
>>> with suboptimal settings, causing functional issues.
>>>
>>> To properly configure the video PLLs in the probe on SM8450, SM8475,
>>> SM8550, and SM8650 platforms, the MXC rail must be ON along with MMCX.
>>> Therefore, add support to attach multiple power domains to videocc on
>>> these platforms.
>>>
>>> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
>>> ---
>>>   drivers/clk/qcom/videocc-sm8450.c | 4 ++++
>>>   drivers/clk/qcom/videocc-sm8550.c | 4 ++++
>>>   2 files changed, 8 insertions(+)
>>>
>>> diff --git a/drivers/clk/qcom/videocc-sm8450.c b/drivers/clk/qcom/videocc-sm8450.c
>>> index f26c7eccb62e7eb8dbd022e2f01fa496eb570b3f..b50a14547336580de88a741f1d33b126e9daa848 100644
>>> --- a/drivers/clk/qcom/videocc-sm8450.c
>>> +++ b/drivers/clk/qcom/videocc-sm8450.c
>>> @@ -437,6 +437,10 @@ static int video_cc_sm8450_probe(struct platform_device *pdev)
>>>       struct regmap *regmap;
>>>       int ret;
>>>   +    ret = qcom_cc_attach_pds(&pdev->dev, &video_cc_sm8450_desc);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>>       ret = devm_pm_runtime_enable(&pdev->dev);
>>>       if (ret)
>>>           return ret;
>>> diff --git a/drivers/clk/qcom/videocc-sm8550.c b/drivers/clk/qcom/videocc-sm8550.c
>>> index 7c25a50cfa970dff55d701cb24bc3aa5924ca12d..d4b223d1392f0721afd1b582ed35d5061294079e 100644
>>> --- a/drivers/clk/qcom/videocc-sm8550.c
>>> +++ b/drivers/clk/qcom/videocc-sm8550.c
>>> @@ -542,6 +542,10 @@ static int video_cc_sm8550_probe(struct platform_device *pdev)
>>>       int ret;
>>>       u32 sleep_clk_offset = 0x8140;
>>>   +    ret = qcom_cc_attach_pds(&pdev->dev, &video_cc_sm8550_desc);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>>       ret = devm_pm_runtime_enable(&pdev->dev);
>>>       if (ret)
>>>           return ret;
>>>
>>
>> What's the difference between doing the attach here or doing it in really_probe() ?
>>
>> There doesn't seem to be any difference except that we will have an additional delay introduced.
>>
>> Are you describing a race condition ?
>>
>> I don't see _logic_ here to moving the call into the controller's higher level probe.
>>
>> Can you describe some more ?
> 
> I think this is a sane course of action:
> 
> 1. associate pll config with the pll (treewide change)
> 2. add a generic pll_configure call that parses the type
> 3. store PLLs to be configured in an array of dt-bindings indices
> 4. move PLL configuration to really_probe
> 5. move RPM enablement to really_probe, make it conditional to limit resource
>    waste on e.g. gcc
> 6. move attaching GDSCs to really_probe
> 
> Konrad

Thanks Konrad for your feedback and suggestion.

I will check and work on this approach of moving PLL configure and RPM enablement
to a common code.

Thanks,
Jagadeesh




