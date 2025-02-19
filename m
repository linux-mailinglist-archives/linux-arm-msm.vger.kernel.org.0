Return-Path: <linux-arm-msm+bounces-48497-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E94B0A3BD26
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 12:41:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B80EB16D519
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 11:41:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22AFC1DEFF7;
	Wed, 19 Feb 2025 11:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JNF2BfQ8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353391DED70;
	Wed, 19 Feb 2025 11:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739965282; cv=none; b=sK0YgK1oHL5T5PwgpEUL/a40T6wnAuoqMnE9XvwqrD/XeFIAdkOmHzAd3y81eCLe+leBMFfDvzdvf4gpGP1/rKk/S/3Fbua0AjEGroyd7wpwdy/IkGVD1JhGxpBNoRSlocD6CeO7NUL+W3BdiT1cmcnfnYqn/BrN+6tGuyxHjSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739965282; c=relaxed/simple;
	bh=hgaySO+YDG7OQbouQbwREMoJLgp1zGO+p8t3jrsVZnc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Z8/qDrPUe1GTT22S5MnntLj212l+AZei2DuM0b/k6eoAT0ULq/zU9I7GaJ6lz4HeLE2Qraft8UzelnPLiBwhj6fR7Ka564Mm8Ld7miV28b9MK0USdNfT4CuQmwS8kvfWiTc+srEc9tFUtKc9DdNEJcoTrPGgjUMoycC6WU0Xb2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JNF2BfQ8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51J8SlrV015969;
	Wed, 19 Feb 2025 11:41:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kbmxzqiOz0dsDTGtp82zG6x5j5k3ux44b2jzvIP2rlw=; b=JNF2BfQ8sjD1DJY6
	rN2LlBTZchEl18pBesvRFpQsm/Ck6DLNjs7PaFutzHtRcS81e3ScF12s/nWbJNED
	RQorBAwrPIeHrQtchzXvH9mU+hYQAY1DvfiJWnv5i0W62YwKzcnhNznSyZcslWbg
	yBexyshHLKyum9HwS4Cb0oXSrG9qLGWw5eol6J1i7iBpe7uo6dv+iRN/la11vymC
	mnM+1ichGxv3SG0yuAO95Kd+97cYC7F8UYiIihSLPKX73CAd0j7lzMQzCxxps0S9
	VcexyqucQdqGBcx/UBsrtKezca5ltOe82VMKJ8z7cZG2ht9B/RrB8j8fCS2AHimh
	se7f1g==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy4adbg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Feb 2025 11:41:12 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51JBfB2O018902
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Feb 2025 11:41:11 GMT
Received: from [10.217.216.47] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 19 Feb
 2025 03:41:06 -0800
Message-ID: <d444f1fb-42a0-48ef-83bc-d5aab9282b22@quicinc.com>
Date: Wed, 19 Feb 2025 17:11:03 +0530
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
Content-Language: en-US
From: Jagadeesh Kona <quic_jkona@quicinc.com>
In-Reply-To: <d4c4ecf0-9094-4341-8711-78a48e5d1344@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 8h-WfSBi5eM_r8L6u_Pc7X_bXle_VVZS
X-Proofpoint-ORIG-GUID: 8h-WfSBi5eM_r8L6u_Pc7X_bXle_VVZS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-19_05,2025-02-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=999 spamscore=0 adultscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502190094



On 2/19/2025 6:51 AM, Bryan O'Donoghue wrote:
> On 18/02/2025 17:19, Dmitry Baryshkov wrote:
>> On Tue, Feb 18, 2025 at 03:46:15PM +0000, Bryan O'Donoghue wrote:
>>> On 18/02/2025 14:26, Jagadeesh Kona wrote:
>>>> During boot-up, the PLL configuration might be missed even after
>>>> calling pll_configure() from the clock controller probe. This can
>>>> happen because the PLL is connected to one or more rails that are
>>>> turned off, and the current clock controller code cannot enable
>>>> multiple rails during probe. Consequently, the PLL may be activated
>>>> with suboptimal settings, causing functional issues.
>>>>
>>>> To properly configure the video PLLs in the probe on SM8450, SM8475,
>>>> SM8550, and SM8650 platforms, the MXC rail must be ON along with MMCX.
>>>> Therefore, add support to attach multiple power domains to videocc on
>>>> these platforms.
>>>>
>>>> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
>>>> ---
>>>>    drivers/clk/qcom/videocc-sm8450.c | 4 ++++
>>>>    drivers/clk/qcom/videocc-sm8550.c | 4 ++++
>>>>    2 files changed, 8 insertions(+)
>>>>
>>>> diff --git a/drivers/clk/qcom/videocc-sm8450.c b/drivers/clk/qcom/videocc-sm8450.c
>>>> index f26c7eccb62e7eb8dbd022e2f01fa496eb570b3f..b50a14547336580de88a741f1d33b126e9daa848 100644
>>>> --- a/drivers/clk/qcom/videocc-sm8450.c
>>>> +++ b/drivers/clk/qcom/videocc-sm8450.c
>>>> @@ -437,6 +437,10 @@ static int video_cc_sm8450_probe(struct platform_device *pdev)
>>>>        struct regmap *regmap;
>>>>        int ret;
>>>> +    ret = qcom_cc_attach_pds(&pdev->dev, &video_cc_sm8450_desc);
>>>> +    if (ret)
>>>> +        return ret;
>>>> +
>>>>        ret = devm_pm_runtime_enable(&pdev->dev);
>>>>        if (ret)
>>>>            return ret;
>>>> diff --git a/drivers/clk/qcom/videocc-sm8550.c b/drivers/clk/qcom/videocc-sm8550.c
>>>> index 7c25a50cfa970dff55d701cb24bc3aa5924ca12d..d4b223d1392f0721afd1b582ed35d5061294079e 100644
>>>> --- a/drivers/clk/qcom/videocc-sm8550.c
>>>> +++ b/drivers/clk/qcom/videocc-sm8550.c
>>>> @@ -542,6 +542,10 @@ static int video_cc_sm8550_probe(struct platform_device *pdev)
>>>>        int ret;
>>>>        u32 sleep_clk_offset = 0x8140;
>>>> +    ret = qcom_cc_attach_pds(&pdev->dev, &video_cc_sm8550_desc);
>>>> +    if (ret)
>>>> +        return ret;
>>>> +
>>>>        ret = devm_pm_runtime_enable(&pdev->dev);
>>>>        if (ret)
>>>>            return ret;
>>>>
>>>
>>> What's the difference between doing the attach here or doing it in
>>> really_probe() ?
>>
>> I'd second this. If the domains are to be attached before calling any
>> other functions, move the call to the qcom_cc_map(), so that all drivers
>> get all domains attached before configuring PLLs instead of manually
>> calling the function.
>>
>>> There doesn't seem to be any difference except that we will have an
>>> additional delay introduced.
>>>
>>> Are you describing a race condition ?
>>>
>>> I don't see _logic_ here to moving the call into the controller's higher
>>> level probe.
>>>
>>> Can you describe some more ?
>>>
>>> ---
>>> bod
>>
> 
> Here's one way this could work
> 
> Author: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Date:   Tue Feb 18 19:46:55 2025 +0000
> 
>     clk: qcom: common: Add configure_plls callback prototype
> 
>     Add a configure_plls() callback so that we can stage qcom_cc_attach_pds()
>     before configuring PLLs and ensure that the power-domain rail list is
>     switched on prior to configuring PLLs.
> 
>     Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
> index 9e3380fd71819..1924130814600 100644
> --- a/drivers/clk/qcom/common.c
> +++ b/drivers/clk/qcom/common.c
> @@ -304,6 +304,9 @@ int qcom_cc_really_probe(struct device *dev,
>         if (ret < 0 && ret != -EEXIST)
>                 return ret;
> 
> +       if (desc->configure_plls)
> +               desc->configure_plls(regmap);
> +
>         reset = &cc->reset;
>         reset->rcdev.of_node = dev->of_node;
>         reset->rcdev.ops = &qcom_reset_ops;
> diff --git a/drivers/clk/qcom/common.h b/drivers/clk/qcom/common.h
> index 7ace5d7f5836a..4955085ff8669 100644
> --- a/drivers/clk/qcom/common.h
> +++ b/drivers/clk/qcom/common.h
> @@ -38,6 +38,7 @@ struct qcom_cc_desc {
>         const struct qcom_icc_hws_data *icc_hws;
>         size_t num_icc_hws;
>         unsigned int icc_first_node_id;
> +       void (*configure_plls)(struct regmap *regmap);
>  };
> 
> and
> 
> % git diff drivers/clk/qcom/camcc-x1e80100.c
> diff --git a/drivers/clk/qcom/camcc-x1e80100.c b/drivers/clk/qcom/camcc-x1e80100.c
> index b73524ae64b1b..c9748d1f8a15b 100644
> --- a/drivers/clk/qcom/camcc-x1e80100.c
> +++ b/drivers/clk/qcom/camcc-x1e80100.c
> @@ -2426,6 +2426,21 @@ static const struct regmap_config cam_cc_x1e80100_regmap_config = {
>         .fast_io = true,
>  };
> 
> +static void cam_cc_x1e80100_configure_plls(struct regmap *regmap)
> +{
> +       clk_lucid_ole_pll_configure(&cam_cc_pll0, regmap, &cam_cc_pll0_config);
> +       clk_lucid_ole_pll_configure(&cam_cc_pll1, regmap, &cam_cc_pll1_config);
> +       clk_rivian_evo_pll_configure(&cam_cc_pll2, regmap, &cam_cc_pll2_config);
> +       clk_lucid_ole_pll_configure(&cam_cc_pll3, regmap, &cam_cc_pll3_config);
> +       clk_lucid_ole_pll_configure(&cam_cc_pll4, regmap, &cam_cc_pll4_config);
> +       clk_lucid_ole_pll_configure(&cam_cc_pll6, regmap, &cam_cc_pll6_config);
> +       clk_lucid_ole_pll_configure(&cam_cc_pll8, regmap, &cam_cc_pll8_config);
> +
> +       /* Keep clocks always enabled */
> +       qcom_branch_set_clk_en(regmap, 0x13a9c); /* CAM_CC_GDSC_CLK */
> +       qcom_branch_set_clk_en(regmap, 0x13ab8); /* CAM_CC_SLEEP_CLK */
> +}
> +
>  static const struct qcom_cc_desc cam_cc_x1e80100_desc = {
>         .config = &cam_cc_x1e80100_regmap_config,
>         .clks = cam_cc_x1e80100_clocks,
> @@ -2434,6 +2449,7 @@ static const struct qcom_cc_desc cam_cc_x1e80100_desc = {
>         .num_resets = ARRAY_SIZE(cam_cc_x1e80100_resets),
>         .gdscs = cam_cc_x1e80100_gdscs,
>         .num_gdscs = ARRAY_SIZE(cam_cc_x1e80100_gdscs),
> +       .configure_plls = cam_cc_x1e80100_configure_plls,
>  };
> 
>  static const struct of_device_id cam_cc_x1e80100_match_table[] = {
> @@ -2461,18 +2477,6 @@ static int cam_cc_x1e80100_probe(struct platform_device *pdev)
>                 return PTR_ERR(regmap);
>         }
> 
> -       clk_lucid_ole_pll_configure(&cam_cc_pll0, regmap, &cam_cc_pll0_config);
> -       clk_lucid_ole_pll_configure(&cam_cc_pll1, regmap, &cam_cc_pll1_config);
> -       clk_rivian_evo_pll_configure(&cam_cc_pll2, regmap, &cam_cc_pll2_config);
> -       clk_lucid_ole_pll_configure(&cam_cc_pll3, regmap, &cam_cc_pll3_config);
> -       clk_lucid_ole_pll_configure(&cam_cc_pll4, regmap, &cam_cc_pll4_config);
> -       clk_lucid_ole_pll_configure(&cam_cc_pll6, regmap, &cam_cc_pll6_config);
> -       clk_lucid_ole_pll_configure(&cam_cc_pll8, regmap, &cam_cc_pll8_config);
> -
> -       /* Keep clocks always enabled */
> -       qcom_branch_set_clk_en(regmap, 0x13a9c); /* CAM_CC_GDSC_CLK */
> -       qcom_branch_set_clk_en(regmap, 0x13ab8); /* CAM_CC_SLEEP_CLK */
> -
>         ret = qcom_cc_really_probe(&pdev->dev, &cam_cc_x1e80100_desc, regmap);
> 
>         pm_runtime_put(&pdev->dev);
> 
> Or a least it works for me.
> 

This patch will not work in all cases, maybe in your case required power domains might be ON
from bootloaders so it might be working.

> New clock controllers would then use this callback mechanism and potentially all of the controllers to have uniformity.
> 

No, above approach also requires changes in each individual clock driver to define the callback. So I don't see any advantage
with this than the current approach. 

Thanks,
Jagadeesh

