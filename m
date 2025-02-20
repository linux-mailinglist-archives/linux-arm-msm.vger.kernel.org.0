Return-Path: <linux-arm-msm+bounces-48603-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F743A3D1FB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 08:18:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E1F4F18878DF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 07:15:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ADD61E3DD8;
	Thu, 20 Feb 2025 07:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Msicv1y0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983BB1E102D;
	Thu, 20 Feb 2025 07:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740035738; cv=none; b=ayHLxlJLPqkTo3PXuTPIt4lw20blDZkHopgiKc2EVwXhpf53DaSv5aZMKpDWs+d6gouhBCuzzPnElSF0aDdPVIDOhEEGFcojRwQQgzMTKmAKbTvnZ/WgSTIP70wZ4yu27hfJ/t6KA6Ws2FAT8VidWBodnJqTMk9fBQkt0q6Z7So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740035738; c=relaxed/simple;
	bh=40HJ0dRq6K52XcX8jnJMfT31V2dwexY1upb79hP9Yj8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=rTTz2acg8vXCZV79Py/hNCu4dL/J60Yr6zEdEBUBleGyQyQy17yaH5AFuh04Y3LwUp4mGXD50TfAZ7N2mnPPYPgY+9GWqvlLg+deBpF3UuP4Qn4s2aXKkLSz1y7D0+8UyRFTUuUG6C6VnYRNMAHMJoWMhJPpb1XrCG0xveZttHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Msicv1y0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51K6f5Hm011609;
	Thu, 20 Feb 2025 07:15:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5h0YFeqSDl2CEQfdgxgSQIeIMUoXRGIEr4UfNtOuXNY=; b=Msicv1y0mjbcqOPf
	5ukefg+0h8KqIKyBhfdXN9kXztNyO6oGPOlf12r1D4ISjZaO4gsx9jyMdfVcFLq4
	Lo+ZtUMBlPKj1CNesDEgqsXvmyjhfOhSq9bUbzUxcRbv3O5Q5mvglJVmnq7tuWjS
	AV9PZTSc38PYmfRZVldipn8uzTsEodNKPpa5zNnqkcb4zTHBoWSXbujcnzMCL9TF
	hA0GKe9VE57Td8H4M2L7JpjBMHg/F+pFYk5eaDxZW2j3Q6qdSKPWE4Abh1/NNzsL
	nzxVmrLOOD179ebAIteya9c1HiympD5jBWrwwdzl91ApQ6IiiybsUQ8NCFTEvtv4
	/8+EnA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy3n7cr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Feb 2025 07:15:31 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51K7FURk020416
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Feb 2025 07:15:30 GMT
Received: from [10.217.216.47] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 19 Feb
 2025 23:15:25 -0800
Message-ID: <3da96df2-1127-49bf-8114-282cc488c194@quicinc.com>
Date: Thu, 20 Feb 2025 12:45:22 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] clk: qcom: videocc: Add support to attach multiple
 power domains
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
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
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey
	<quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        "Taniya
 Das" <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli
	<quic_skakitap@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250218-videocc-pll-multi-pd-voting-v1-0-cfe6289ea29b@quicinc.com>
 <20250218-videocc-pll-multi-pd-voting-v1-4-cfe6289ea29b@quicinc.com>
 <eec2869a-fa8f-4aaf-9fc5-e7a8baf0f864@linaro.org>
 <huluiiaqmunvmffoqadrhssd3kl2toutqtcw7rzamv3sqdglsf@7lz66x4sj3gv>
 <d4c4ecf0-9094-4341-8711-78a48e5d1344@linaro.org>
 <d444f1fb-42a0-48ef-83bc-d5aab9282b22@quicinc.com>
 <gzjyyl2kzv52zsewn5zf6ei65fymyi4pspvsmsjaqj5sklfxvc@bkg46saulni5>
 <fcc31cc7-67bd-4102-a53f-ebe66b4fd1a7@linaro.org>
Content-Language: en-US
From: Jagadeesh Kona <quic_jkona@quicinc.com>
In-Reply-To: <fcc31cc7-67bd-4102-a53f-ebe66b4fd1a7@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: hTeTU0mJOW4hzI_lWazKPOt-NhQQTkj6
X-Proofpoint-GUID: hTeTU0mJOW4hzI_lWazKPOt-NhQQTkj6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-20_02,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502100000 definitions=main-2502200050



On 2/19/2025 5:37 PM, Bryan O'Donoghue wrote:
> On 19/02/2025 11:59, Dmitry Baryshkov wrote:
>> On Wed, Feb 19, 2025 at 05:11:03PM +0530, Jagadeesh Kona wrote:
>>>
>>>
>>> On 2/19/2025 6:51 AM, Bryan O'Donoghue wrote:
>>>> On 18/02/2025 17:19, Dmitry Baryshkov wrote:
>>>>> On Tue, Feb 18, 2025 at 03:46:15PM +0000, Bryan O'Donoghue wrote:
>>>>>> On 18/02/2025 14:26, Jagadeesh Kona wrote:
>>>>>>> During boot-up, the PLL configuration might be missed even after
>>>>>>> calling pll_configure() from the clock controller probe. This can
>>>>>>> happen because the PLL is connected to one or more rails that are
>>>>>>> turned off, and the current clock controller code cannot enable
>>>>>>> multiple rails during probe. Consequently, the PLL may be activated
>>>>>>> with suboptimal settings, causing functional issues.
>>>>>>>
>>>>>>> To properly configure the video PLLs in the probe on SM8450, SM8475,
>>>>>>> SM8550, and SM8650 platforms, the MXC rail must be ON along with MMCX.
>>>>>>> Therefore, add support to attach multiple power domains to videocc on
>>>>>>> these platforms.
>>>>>>>
>>>>>>> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
>>>>>>> ---
>>>>>>>     drivers/clk/qcom/videocc-sm8450.c | 4 ++++
>>>>>>>     drivers/clk/qcom/videocc-sm8550.c | 4 ++++
>>>>>>>     2 files changed, 8 insertions(+)
>>>>>>>
>>>>>>> diff --git a/drivers/clk/qcom/videocc-sm8450.c b/drivers/clk/qcom/videocc-sm8450.c
>>>>>>> index f26c7eccb62e7eb8dbd022e2f01fa496eb570b3f..b50a14547336580de88a741f1d33b126e9daa848 100644
>>>>>>> --- a/drivers/clk/qcom/videocc-sm8450.c
>>>>>>> +++ b/drivers/clk/qcom/videocc-sm8450.c
>>>>>>> @@ -437,6 +437,10 @@ static int video_cc_sm8450_probe(struct platform_device *pdev)
>>>>>>>         struct regmap *regmap;
>>>>>>>         int ret;
>>>>>>> +    ret = qcom_cc_attach_pds(&pdev->dev, &video_cc_sm8450_desc);
>>>>>>> +    if (ret)
>>>>>>> +        return ret;
>>>>>>> +
>>>>>>>         ret = devm_pm_runtime_enable(&pdev->dev);
>>>>>>>         if (ret)
>>>>>>>             return ret;
>>>>>>> diff --git a/drivers/clk/qcom/videocc-sm8550.c b/drivers/clk/qcom/videocc-sm8550.c
>>>>>>> index 7c25a50cfa970dff55d701cb24bc3aa5924ca12d..d4b223d1392f0721afd1b582ed35d5061294079e 100644
>>>>>>> --- a/drivers/clk/qcom/videocc-sm8550.c
>>>>>>> +++ b/drivers/clk/qcom/videocc-sm8550.c
>>>>>>> @@ -542,6 +542,10 @@ static int video_cc_sm8550_probe(struct platform_device *pdev)
>>>>>>>         int ret;
>>>>>>>         u32 sleep_clk_offset = 0x8140;
>>>>>>> +    ret = qcom_cc_attach_pds(&pdev->dev, &video_cc_sm8550_desc);
>>>>>>> +    if (ret)
>>>>>>> +        return ret;
>>>>>>> +
>>>>>>>         ret = devm_pm_runtime_enable(&pdev->dev);
>>>>>>>         if (ret)
>>>>>>>             return ret;
>>>>>>>
>>>>>>
>>>>>> What's the difference between doing the attach here or doing it in
>>>>>> really_probe() ?
>>>>>
>>>>> I'd second this. If the domains are to be attached before calling any
>>>>> other functions, move the call to the qcom_cc_map(), so that all drivers
>>>>> get all domains attached before configuring PLLs instead of manually
>>>>> calling the function.
>>>>>
>>>>>> There doesn't seem to be any difference except that we will have an
>>>>>> additional delay introduced.
>>>>>>
>>>>>> Are you describing a race condition ?
>>>>>>
>>>>>> I don't see _logic_ here to moving the call into the controller's higher
>>>>>> level probe.
>>>>>>
>>>>>> Can you describe some more ?
>>>>>>
>>>>>> ---
>>>>>> bod
>>>>>
>>>>
>>>> Here's one way this could work
>>>>
>>>> Author: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>>> Date:   Tue Feb 18 19:46:55 2025 +0000
>>>>
>>>>      clk: qcom: common: Add configure_plls callback prototype
>>>>
>>>>      Add a configure_plls() callback so that we can stage qcom_cc_attach_pds()
>>>>      before configuring PLLs and ensure that the power-domain rail list is
>>>>      switched on prior to configuring PLLs.
>>>>
>>>>      Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>>>
>>>> diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
>>>> index 9e3380fd71819..1924130814600 100644
>>>> --- a/drivers/clk/qcom/common.c
>>>> +++ b/drivers/clk/qcom/common.c
>>>> @@ -304,6 +304,9 @@ int qcom_cc_really_probe(struct device *dev,
>>>>          if (ret < 0 && ret != -EEXIST)
>>>>                  return ret;
>>>>
>>>> +       if (desc->configure_plls)
>>>> +               desc->configure_plls(regmap);
>>>> +
>>>>          reset = &cc->reset;
>>>>          reset->rcdev.of_node = dev->of_node;
>>>>          reset->rcdev.ops = &qcom_reset_ops;
>>>> diff --git a/drivers/clk/qcom/common.h b/drivers/clk/qcom/common.h
>>>> index 7ace5d7f5836a..4955085ff8669 100644
>>>> --- a/drivers/clk/qcom/common.h
>>>> +++ b/drivers/clk/qcom/common.h
>>>> @@ -38,6 +38,7 @@ struct qcom_cc_desc {
>>>>          const struct qcom_icc_hws_data *icc_hws;
>>>>          size_t num_icc_hws;
>>>>          unsigned int icc_first_node_id;
>>>> +       void (*configure_plls)(struct regmap *regmap);
>>>>   };
>>>>
>>>> and
>>>>
>>>> % git diff drivers/clk/qcom/camcc-x1e80100.c
>>>> diff --git a/drivers/clk/qcom/camcc-x1e80100.c b/drivers/clk/qcom/camcc-x1e80100.c
>>>> index b73524ae64b1b..c9748d1f8a15b 100644
>>>> --- a/drivers/clk/qcom/camcc-x1e80100.c
>>>> +++ b/drivers/clk/qcom/camcc-x1e80100.c
>>>> @@ -2426,6 +2426,21 @@ static const struct regmap_config cam_cc_x1e80100_regmap_config = {
>>>>          .fast_io = true,
>>>>   };
>>>>
>>>> +static void cam_cc_x1e80100_configure_plls(struct regmap *regmap)
>>>> +{
>>>> +       clk_lucid_ole_pll_configure(&cam_cc_pll0, regmap, &cam_cc_pll0_config);
>>>> +       clk_lucid_ole_pll_configure(&cam_cc_pll1, regmap, &cam_cc_pll1_config);
>>>> +       clk_rivian_evo_pll_configure(&cam_cc_pll2, regmap, &cam_cc_pll2_config);
>>>> +       clk_lucid_ole_pll_configure(&cam_cc_pll3, regmap, &cam_cc_pll3_config);
>>>> +       clk_lucid_ole_pll_configure(&cam_cc_pll4, regmap, &cam_cc_pll4_config);
>>>> +       clk_lucid_ole_pll_configure(&cam_cc_pll6, regmap, &cam_cc_pll6_config);
>>>> +       clk_lucid_ole_pll_configure(&cam_cc_pll8, regmap, &cam_cc_pll8_config);
>>>> +
>>>> +       /* Keep clocks always enabled */
>>>> +       qcom_branch_set_clk_en(regmap, 0x13a9c); /* CAM_CC_GDSC_CLK */
>>>> +       qcom_branch_set_clk_en(regmap, 0x13ab8); /* CAM_CC_SLEEP_CLK */
>>>> +}
>>>> +
>>>>   static const struct qcom_cc_desc cam_cc_x1e80100_desc = {
>>>>          .config = &cam_cc_x1e80100_regmap_config,
>>>>          .clks = cam_cc_x1e80100_clocks,
>>>> @@ -2434,6 +2449,7 @@ static const struct qcom_cc_desc cam_cc_x1e80100_desc = {
>>>>          .num_resets = ARRAY_SIZE(cam_cc_x1e80100_resets),
>>>>          .gdscs = cam_cc_x1e80100_gdscs,
>>>>          .num_gdscs = ARRAY_SIZE(cam_cc_x1e80100_gdscs),
>>>> +       .configure_plls = cam_cc_x1e80100_configure_plls,
>>>>   };
>>>>
>>>>   static const struct of_device_id cam_cc_x1e80100_match_table[] = {
>>>> @@ -2461,18 +2477,6 @@ static int cam_cc_x1e80100_probe(struct platform_device *pdev)
>>>>                  return PTR_ERR(regmap);
>>>>          }
>>>>
>>>> -       clk_lucid_ole_pll_configure(&cam_cc_pll0, regmap, &cam_cc_pll0_config);
>>>> -       clk_lucid_ole_pll_configure(&cam_cc_pll1, regmap, &cam_cc_pll1_config);
>>>> -       clk_rivian_evo_pll_configure(&cam_cc_pll2, regmap, &cam_cc_pll2_config);
>>>> -       clk_lucid_ole_pll_configure(&cam_cc_pll3, regmap, &cam_cc_pll3_config);
>>>> -       clk_lucid_ole_pll_configure(&cam_cc_pll4, regmap, &cam_cc_pll4_config);
>>>> -       clk_lucid_ole_pll_configure(&cam_cc_pll6, regmap, &cam_cc_pll6_config);
>>>> -       clk_lucid_ole_pll_configure(&cam_cc_pll8, regmap, &cam_cc_pll8_config);
>>>> -
>>>> -       /* Keep clocks always enabled */
>>>> -       qcom_branch_set_clk_en(regmap, 0x13a9c); /* CAM_CC_GDSC_CLK */
>>>> -       qcom_branch_set_clk_en(regmap, 0x13ab8); /* CAM_CC_SLEEP_CLK */
>>>> -
>>>>          ret = qcom_cc_really_probe(&pdev->dev, &cam_cc_x1e80100_desc, regmap);
>>>>
>>>>          pm_runtime_put(&pdev->dev);
>>>>
>>>> Or a least it works for me.
>>>>
>>>
>>> This patch will not work in all cases, maybe in your case required power domains might be ON
>>> from bootloaders so it might be working.
>>
>> But with his patch domains are attached before configuring the PLLs, are
>> they not?
> 
> Yes, its logically the same just done in core code.
> 

Yes, this code attaches domains before configuring the PLLs, but it attaches PDs after get_sync()
is called on device. As I mentioned in other patch earlier, if we attach PDS after get_sync() is
already called on device, then power domains are not getting enabled during the probe, leading to
the same improper PLL configuration issue. But the current patch series posted will fix this issue

>>>
>>>> New clock controllers would then use this callback mechanism and potentially all of the controllers to have uniformity.
>>>>
>>>
>>> No, above approach also requires changes in each individual clock driver to define the callback. So I don't see any advantage
>>> with this than the current approach.
>>
>> Bryan's proposal moves us towards having a common code, so it's better.
>>
> 
> I can take the time to do the whole sweep and publish a RFC.
> 

Yes, but moving the PLL configuration to callback will not solve the actual PLL configuration
issue being discussed here. 

Thanks,
Jagadeesh

> ---
> bod

