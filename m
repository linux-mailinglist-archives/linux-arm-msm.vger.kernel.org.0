Return-Path: <linux-arm-msm+bounces-47851-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F33A3383A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 07:52:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2E4B53A67CF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 06:52:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEC3C207A2D;
	Thu, 13 Feb 2025 06:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bzWGu+WG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955FA2063E3;
	Thu, 13 Feb 2025 06:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739429533; cv=none; b=VwpeuUGMRedAf+LywghvbPJ5zdtD01j3DPn1BW7wrTmsE7ZyGsCvA1hNfTKCehey7nZUaxq852btK/PDQaHvT0Tq/KyAluulbtYTgmCJmK29NF9eZd1VnLuBbdDUw72CgWVCgEJRG5+AzTUWxNHIhaOiFddXWaZ8IbOqVvkRiSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739429533; c=relaxed/simple;
	bh=HIsQirg/QfSVOdumsSMLsN22L13lwLj+hm+E8Aa5z/M=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=fI0z2Ty17QJGYUBL9uYsXVaXivC/LW4Zb+OPpkiud9QCtdf1I70w85JZCuNXZHWcptgwR6FUl2LIr769SRgFYbXGdeH8eeahxwXMe940HisxsV1r/p86Paei17hLUIoHM8LgwPxfr1hBhcXyJd6WSHwSnPoiYNO3U4Vrs0NNZho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bzWGu+WG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51CJCiMM025783;
	Thu, 13 Feb 2025 06:52:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pSoWe0tkC6qoe3u34Vl9ApP4YwUG2Z+ydK+WaKmQ7kw=; b=bzWGu+WG3XlpNyH1
	tXoqtpiap4vX841JbsQ2QViLmCuE54wxSuLbhlmsdvhtS5c5E/UzK5xPAWnuLRyJ
	XqPnByxz6C3aR8ZpLO87YRmkucppLpyfwRXgVDRiBCITHXkUAnxwYa/zOYwD8F74
	qXsKdc/QbukB1AFXu4FzUH2TIFwTveRpPuCx4/QJuAB5cRzTySbxtYd2MSMglYKu
	KPv485bpJFHU03fCjilGedZjiRA6AE0jdAJqzMkNzZVf62QnXcop/IxUgF1aYmo/
	paLGdbgGfDl7ZM9ycKs5V/1l7W1R7rn426yJ2hmg1+53XRAcXlxdjRE80vivk46V
	yIAG2w==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44r5j5e4sg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Feb 2025 06:52:00 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51D6pxRm001266
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Feb 2025 06:51:59 GMT
Received: from [10.217.217.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 12 Feb
 2025 22:51:54 -0800
Message-ID: <c820c697-c3ec-4ae3-9720-fb80cb3a0450@quicinc.com>
Date: Thu, 13 Feb 2025 12:21:51 +0530
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
 <ccc87c55-d157-4ffc-8081-1a5900752931@quicinc.com>
 <CAA8EJpp7e5q36jGmB-TZX5A=XVGKsDtmBF8kJmxoga8NqGZP1A@mail.gmail.com>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <CAA8EJpp7e5q36jGmB-TZX5A=XVGKsDtmBF8kJmxoga8NqGZP1A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: UfpzANZj0WxZR_L58fQ8IpHUO76VBsY-
X-Proofpoint-GUID: UfpzANZj0WxZR_L58fQ8IpHUO76VBsY-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-13_02,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 mlxscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 phishscore=0 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502130051



On 2/13/2025 1:30 AM, Dmitry Baryshkov wrote:
> On Wed, 12 Feb 2025 at 19:15, Taniya Das <quic_tdas@quicinc.com> wrote:
>>
>>
>>
>> On 2/12/2025 4:39 PM, Dmitry Baryshkov wrote:
>>> On Wed, Feb 12, 2025 at 01:52:20PM +0530, Taniya Das wrote:
>>>> On the QCM6490 boards the LPASS firmware controls the complete clock
>>>> controller functionalities. But the LPASS resets are required to be
>>>> controlled from the high level OS. The Audio SW driver should be able to
>>>> assert/deassert the audio resets as required. Thus in clock driver add
>>>> support for the resets.
>>>>
>>>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>>>> ---
>>>>  drivers/clk/qcom/lpassaudiocc-sc7280.c | 23 +++++++++++++++++++----
>>>>  1 file changed, 19 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/clk/qcom/lpassaudiocc-sc7280.c b/drivers/clk/qcom/lpassaudiocc-sc7280.c
>>>> index 45e7264770866f929a3f4663c477330f0bf7aa84..b6439308926371891cc5f9a5e0d4e8393641560d 100644
>>>> --- a/drivers/clk/qcom/lpassaudiocc-sc7280.c
>>>> +++ b/drivers/clk/qcom/lpassaudiocc-sc7280.c
>>>> @@ -1,6 +1,7 @@
>>>>  // SPDX-License-Identifier: GPL-2.0-only
>>>>  /*
>>>>   * Copyright (c) 2021, The Linux Foundation. All rights reserved.
>>>> + * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
>>>>   */
>>>>
>>>>  #include <linux/clk-provider.h>
>>>> @@ -713,14 +714,24 @@ static const struct qcom_reset_map lpass_audio_cc_sc7280_resets[] = {
>>>>      [LPASS_AUDIO_SWR_WSA_CGCR] = { 0xb0, 1 },
>>>>  };
>>>>
>>>> +static const struct regmap_config lpass_audio_cc_sc7280_reset_regmap_config = {
>>>> +    .name = "lpassaudio_cc_reset",
>>>> +    .reg_bits = 32,
>>>> +    .reg_stride = 4,
>>>> +    .val_bits = 32,
>>>> +    .fast_io = true,
>>>> +    .max_register = 0xc8,
>>>> +};
>>>> +
>>>>  static const struct qcom_cc_desc lpass_audio_cc_reset_sc7280_desc = {
>>>> -    .config = &lpass_audio_cc_sc7280_regmap_config,
>>>> +    .config = &lpass_audio_cc_sc7280_reset_regmap_config,
>>>>      .resets = lpass_audio_cc_sc7280_resets,
>>>>      .num_resets = ARRAY_SIZE(lpass_audio_cc_sc7280_resets),
>>>>  };
>>>>
>>>>  static const struct of_device_id lpass_audio_cc_sc7280_match_table[] = {
>>>> -    { .compatible = "qcom,sc7280-lpassaudiocc" },
>>>> +    { .compatible = "qcom,qcm6490-lpassaudiocc", .data = &lpass_audio_cc_reset_sc7280_desc },
>>>> +    { .compatible = "qcom,sc7280-lpassaudiocc", .data = &lpass_audio_cc_sc7280_desc },
>>>>      { }
>>>>  };
>>>>  MODULE_DEVICE_TABLE(of, lpass_audio_cc_sc7280_match_table);
>>>> @@ -752,13 +763,17 @@ static int lpass_audio_cc_sc7280_probe(struct platform_device *pdev)
>>>>      struct regmap *regmap;
>>>>      int ret;
>>>>
>>>> +    desc = device_get_match_data(&pdev->dev);
>>>> +
>>>> +    if (desc->num_resets)
>>>> +            return qcom_cc_probe_by_index(pdev, 1, desc);
>>>
>>> Won't this break SC7280 support by causing an early return?
>>>
>>
>> The resets are not defined for SC7280.
>> static const struct qcom_cc_desc lpass_audio_cc_sc7280_desc = {
>>         .config = &lpass_audio_cc_sc7280_regmap_config,
>>         .clks = lpass_audio_cc_sc7280_clocks,
>>         .num_clks = ARRAY_SIZE(lpass_audio_cc_sc7280_clocks),
>> };
>>
>> The reset get registered for SC7280 after the clocks are registered.
>> qcom_cc_probe_by_index(pdev, 1,  &lpass_audio_cc_reset_sc7280_desc);
> 
> Could you please make this condition more obvious and error-prone
> rather than checking one particular non-obvious property?
> 

Dmitry, we had earlier tried [1], but seems like we could not align on
this patchset.

If you are aligned, please let me know I can fall back on the approach.

[1]:
https://lore.kernel.org/all/20240318053555.20405-3-quic_tdas@quicinc.com/

Do you have any suggestions that we could consider?

>>
>>>> +
>>>>      ret = lpass_audio_setup_runtime_pm(pdev);
>>>>      if (ret)
>>>>              return ret;
>>>>
>>>>      lpass_audio_cc_sc7280_regmap_config.name = "lpassaudio_cc";
>>>>      lpass_audio_cc_sc7280_regmap_config.max_register = 0x2f000;
>>>> -    desc = &lpass_audio_cc_sc7280_desc;
>>>>
>>>>      regmap = qcom_cc_map(pdev, desc);
>>>>      if (IS_ERR(regmap)) {
>>>> @@ -772,7 +787,7 @@ static int lpass_audio_cc_sc7280_probe(struct platform_device *pdev)
>>>>      regmap_write(regmap, 0x4, 0x3b);
>>>>      regmap_write(regmap, 0x8, 0xff05);
>>>>
>>>> -    ret = qcom_cc_really_probe(&pdev->dev, &lpass_audio_cc_sc7280_desc, regmap);
>>>> +    ret = qcom_cc_really_probe(&pdev->dev, desc, regmap);
>>>>      if (ret) {
>>>>              dev_err(&pdev->dev, "Failed to register LPASS AUDIO CC clocks\n");
>>>>              goto exit;
>>>>
>>>> --
>>>> 2.45.2
>>>>
>>>
>>
> 
> 


