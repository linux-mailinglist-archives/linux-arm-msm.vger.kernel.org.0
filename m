Return-Path: <linux-arm-msm+bounces-27070-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA91393CF57
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jul 2024 10:11:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A3FA1C20BC3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jul 2024 08:11:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 609F0176AC3;
	Fri, 26 Jul 2024 08:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JcgUTQWz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6861445009;
	Fri, 26 Jul 2024 08:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721981481; cv=none; b=KuTRJ71rQHFjd5v1EMLk8faftho6Lj3xwfKZrCZVBFP0ZGTQAJ8KGY5yACoDkOmsnRdduyhP3dNkJyE8R0paa5XHoY8+eg3TweINYz0FJsmToqlr0TGALUHi6UcQetR7Z0XsIhFDralwrmimHCkem7VDuAloSPCyBSW8DeJv9dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721981481; c=relaxed/simple;
	bh=hlCDb6b2WUs98U9IenDfNqF06mSLL56KLYPtRUMNMPA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=rP1lBLCz0wy5z5E0GGg8yRhp65DRYAScwo6FeCiBQ9qUs/HCv9THA1Cu6PhgdrJOjTqypGTxclgWw/afG9Sv28T7Ur21XTNBag/8C0SQnHztYUrdnua7yVT6iLPFyrxG8iT5x/lX6a1Ff6fKqlLgw5cE1N+Edjb0SxuFhZsr0vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JcgUTQWz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46Q159J2028539;
	Fri, 26 Jul 2024 08:10:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F4rJq6yaOgiRKHemDXNb1OrhwKsbOWAE8LMCIM3HQvA=; b=JcgUTQWz92TcY/vE
	/QWVrZ4yTVZB1FIzE2/cQXnzaJOCak3zeA+NXbl29ynrkimnOuYPXGXSWz1HZSUE
	tpPP8PL7bSp6bWi8Kkn6MCsdJwiL3+lJpRSGrOWHah5naXswUJeA2l+asZzU+ChA
	9jNQBR4cztNdRpFo45z0IwPKKEl47bmk5MsVeSRNrF12LrDSbhVH2HNrGqWWnUjy
	xzjQtl5McmfekooNa7xTI9tZ81ewBEUkh+zKyObWufqyjrUu3uaMm3iUKvRFTfkE
	KzuNvcpwgzdLXWVJbyV4FUvBjHg5BucblrsUpzrjpVmjO0SqhrPOgcQLoEs+NurP
	5wKMDw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40m1ttgsc1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jul 2024 08:10:43 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46Q8Agmf005084
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jul 2024 08:10:42 GMT
Received: from [10.218.19.46] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 26 Jul
 2024 01:10:37 -0700
Message-ID: <2a509ef6-1b83-d422-f3f8-29f51d6056be@quicinc.com>
Date: Fri, 26 Jul 2024 13:40:33 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 3/6] clk: qcom: clk-alpha-pll: Add support for Regera
 PLL ops
Content-Language: en-US
From: "Satya Priya Kakitapalli (Temp)" <quic_skakitap@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Abhishek Sahu <absahu@codeaurora.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stephen Boyd <sboyd@codeaurora.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>,
        "Imran
 Shaik" <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
References: <20240702-camcc-support-sm8150-v2-0-4baf54ec7333@quicinc.com>
 <20240702-camcc-support-sm8150-v2-3-4baf54ec7333@quicinc.com>
 <kxoxr5cxxedckh7q45zhhyssqx4ahdfbqw7sdsrxx2ddplummh@2s6jv62ipnhb>
 <6adaca81-2751-ae48-850c-453a34c0e341@quicinc.com>
In-Reply-To: <6adaca81-2751-ae48-850c-453a34c0e341@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: MrbXSSvEBAljJApVTJOpUg5Bb8lsrUo3
X-Proofpoint-ORIG-GUID: MrbXSSvEBAljJApVTJOpUg5Bb8lsrUo3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-26_05,2024-07-25_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=999 clxscore=1015 bulkscore=0
 spamscore=0 phishscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407260053


On 7/9/2024 4:21 PM, Satya Priya Kakitapalli (Temp) wrote:
>
> On 7/3/2024 3:35 PM, Dmitry Baryshkov wrote:
>> On Tue, Jul 02, 2024 at 09:20:41PM GMT, Satya Priya Kakitapalli wrote:
>>> From: Taniya Das <quic_tdas@quicinc.com>
>>>
>>> Regera PLL ops are required to control the Regera PLL from clock
>>> controller drivers, thus add support for the same.
>> the same what?
>
>
> I'll rephrase the commit text.
>
>
>>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>>> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
>>> ---
>>>   drivers/clk/qcom/clk-alpha-pll.c | 32 
>>> +++++++++++++++++++++++++++++++-
>>>   drivers/clk/qcom/clk-alpha-pll.h |  5 +++++
>>>   2 files changed, 36 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/clk/qcom/clk-alpha-pll.c 
>>> b/drivers/clk/qcom/clk-alpha-pll.c
>>> index d2bef078588f..afb7ab72c90d 100644
>>> --- a/drivers/clk/qcom/clk-alpha-pll.c
>>> +++ b/drivers/clk/qcom/clk-alpha-pll.c
>>> @@ -1,7 +1,7 @@
>>>   // SPDX-License-Identifier: GPL-2.0
>>>   /*
>>>    * Copyright (c) 2015, 2018, The Linux Foundation. All rights 
>>> reserved.
>>> - * Copyright (c) 2021, 2023, Qualcomm Innovation Center, Inc. All 
>>> rights reserved.
>>> + * Copyright (c) 2021, 2023-2024, Qualcomm Innovation Center, Inc. 
>>> All rights reserved.
>>>    */
>>>     #include <linux/kernel.h>
>>> @@ -2605,3 +2605,33 @@ const struct clk_ops 
>>> clk_alpha_pll_stromer_plus_ops = {
>>>       .set_rate = clk_alpha_pll_stromer_plus_set_rate,
>>>   };
>>>   EXPORT_SYMBOL_GPL(clk_alpha_pll_stromer_plus_ops);
>>> +
>>> +void clk_regera_pll_configure(struct clk_alpha_pll *pll, struct 
>>> regmap *regmap,
>>> +                 const struct alpha_pll_config *config)
>>> +{
>>> +    clk_alpha_pll_write_config(regmap, PLL_L_VAL(pll), config->l);
>>> +    clk_alpha_pll_write_config(regmap, PLL_ALPHA_VAL(pll), 
>>> config->alpha);
>>> +    clk_alpha_pll_write_config(regmap, PLL_CONFIG_CTL(pll), 
>>> config->config_ctl_val);
>>> +    clk_alpha_pll_write_config(regmap, PLL_CONFIG_CTL_U(pll), 
>>> config->config_ctl_hi_val);
>>> +    clk_alpha_pll_write_config(regmap, PLL_CONFIG_CTL_U1(pll), 
>>> config->config_ctl_hi1_val);
>>> +    clk_alpha_pll_write_config(regmap, PLL_USER_CTL(pll), 
>>> config->user_ctl_val);
>>> +    clk_alpha_pll_write_config(regmap, PLL_USER_CTL_U(pll), 
>>> config->user_ctl_hi_val);
>>> +    clk_alpha_pll_write_config(regmap, PLL_USER_CTL_U1(pll), 
>>> config->user_ctl_hi1_val);
>>> +    clk_alpha_pll_write_config(regmap, PLL_TEST_CTL(pll), 
>>> config->test_ctl_val);
>>> +    clk_alpha_pll_write_config(regmap, PLL_TEST_CTL_U(pll), 
>>> config->test_ctl_hi_val);
>>> +    clk_alpha_pll_write_config(regmap, PLL_TEST_CTL_U1(pll), 
>>> config->test_ctl_hi1_val);
>>> +
>>> +    /* Set operation mode to STANDBY */
>>> +    regmap_write(regmap, PLL_OPMODE(pll), PLL_STANDBY);
>>> +}
>>> +EXPORT_SYMBOL_GPL(clk_regera_pll_configure);
>> Does it make sense to call this function from clk_zonda_pll_configure()?
>
>
> Okay, I'll evaluate this internally and see if that can be done.
>

I have checked this, although there is common part between Zonda and 
Regera PLL configure APIs, a different sequence needs to be followed for 
Zonda, and calling this function from zonda_pll_configure would affect 
the sequence. Hence, I think it is better to leave it as is.


>
>>
>>> +
>>> +const struct clk_ops clk_alpha_pll_regera_ops = {
>>> +    .enable = clk_zonda_pll_enable,
>>> +    .disable = clk_zonda_pll_disable,
>>> +    .is_enabled = clk_alpha_pll_is_enabled,
>>> +    .recalc_rate = clk_trion_pll_recalc_rate,
>>> +    .round_rate = clk_alpha_pll_round_rate,
>>> +    .set_rate = clk_zonda_pll_set_rate,
>>> +};
>>> +EXPORT_SYMBOL_GPL(clk_alpha_pll_regera_ops);
>>> diff --git a/drivers/clk/qcom/clk-alpha-pll.h 
>>> b/drivers/clk/qcom/clk-alpha-pll.h
>>> index fb6d50263bb9..5bb0a07da53d 100644
>>> --- a/drivers/clk/qcom/clk-alpha-pll.h
>>> +++ b/drivers/clk/qcom/clk-alpha-pll.h
>>> @@ -21,6 +21,7 @@ enum {
>>>       CLK_ALPHA_PLL_TYPE_LUCID = CLK_ALPHA_PLL_TYPE_TRION,
>>>       CLK_ALPHA_PLL_TYPE_AGERA,
>>>       CLK_ALPHA_PLL_TYPE_ZONDA,
>>> +    CLK_ALPHA_PLL_TYPE_REGERA = CLK_ALPHA_PLL_TYPE_ZONDA,
>>>       CLK_ALPHA_PLL_TYPE_ZONDA_OLE,
>>>       CLK_ALPHA_PLL_TYPE_LUCID_EVO,
>>>       CLK_ALPHA_PLL_TYPE_LUCID_OLE,
>>> @@ -189,6 +190,8 @@ extern const struct clk_ops 
>>> clk_alpha_pll_postdiv_lucid_evo_ops;
>>>   extern const struct clk_ops clk_alpha_pll_rivian_evo_ops;
>>>   #define clk_alpha_pll_postdiv_rivian_evo_ops 
>>> clk_alpha_pll_postdiv_fabia_ops
>>>   +extern const struct clk_ops clk_alpha_pll_regera_ops;
>>> +
>>>   void clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct 
>>> regmap *regmap,
>>>                    const struct alpha_pll_config *config);
>>>   void clk_fabia_pll_configure(struct clk_alpha_pll *pll, struct 
>>> regmap *regmap,
>>> @@ -210,5 +213,7 @@ void clk_rivian_evo_pll_configure(struct 
>>> clk_alpha_pll *pll, struct regmap *regm
>>>                     const struct alpha_pll_config *config);
>>>   void clk_stromer_pll_configure(struct clk_alpha_pll *pll, struct 
>>> regmap *regmap,
>>>                      const struct alpha_pll_config *config);
>>> +void clk_regera_pll_configure(struct clk_alpha_pll *pll, struct 
>>> regmap *regmap,
>>> +                 const struct alpha_pll_config *config);
>>>     #endif
>>>
>>> -- 
>>> 2.25.1
>>>

