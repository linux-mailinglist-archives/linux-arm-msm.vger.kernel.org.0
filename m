Return-Path: <linux-arm-msm+bounces-34986-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D51D9A453B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 19:45:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6E9AB1C23595
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 17:45:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81EC9204F77;
	Fri, 18 Oct 2024 17:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EOio/9my"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3191204F6A;
	Fri, 18 Oct 2024 17:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729273457; cv=none; b=PAf46gbvQAS/KDJDz1D8xrQvK3uUGceWuow1galyXa24GpA3jvHAyR0s9u5Ouuqi90qRjN3GX9mWtaMq8mBV/q5MGUTniOXwjLqJJ5XV3IbwCtYg5wjL32ohz96SA3pGc5snqrnCu50v4IzGefD8gBKLchqRCOGawFxHKWVCZuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729273457; c=relaxed/simple;
	bh=4Ix5wRbgAnfrqy/UwYJ8MwC6bX9fS0MTH0kAkqruGMM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=prkm+PUruEokFUahx4KZfl2YpMx3q6WBWJjDhQF14BAVBcux1XQLGfEI5Vvo9gyFX42g+CAoncIt/TPydx+ZGJ/fKUqD4yzFWKcSMibFOBBAKl1RBuKPHN1PsVgxLkqpNrR68pxg8yveEHmCGsSMyM3k1gjdGa+Nig63Er4Dkxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=EOio/9my; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49I7gUN3001726;
	Fri, 18 Oct 2024 17:44:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BbhyFyFBoyl0kn7QsQIa98SfDQmTjfGYNzs2+GHtIOY=; b=EOio/9my1V4hKRES
	6tmTNDiDjXSiPNiVvq77TjabmaDx56DijCalbNlFdRZczaP0CPQKR95nzY0v9Y2+
	N/AqmonAx6k8XFxEJZrjQi1z8uqhT3Iel0rBW3QQonCuvDQoOBXWT3PO0U5mYFzQ
	ELo7Zmoe8FevH2kznOQ619s1evHaRxa/xxqJR1knIXHDiFph1wmatlYIYOcX/zc2
	d6kqTRU6l2BuKo+jZg6NDRgI4uhUZP6xSje8VkPVBxoLMT9DvC+pJZdb5nnHGDJk
	vwZVMBIKt5DnwY9iSH54r+wktrfiUXH2G03BIo+itxOy8OM1i5fTSscVrDc6ZWkN
	PkcQ3Q==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42ajm5f1fw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 17:44:08 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49IHi8cK011105
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 17:44:08 GMT
Received: from [10.216.16.9] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 18 Oct
 2024 10:44:03 -0700
Message-ID: <bdd2a873-3d5b-4986-a79c-d2bb54997b43@quicinc.com>
Date: Fri, 18 Oct 2024 23:14:00 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] clk: qcom: gcc: Add support for QCS615 GCC clocks
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20240920-qcs615-clock-driver-v2-0-2f6de44eb2aa@quicinc.com>
 <20240920-qcs615-clock-driver-v2-4-2f6de44eb2aa@quicinc.com>
 <gokgyvnunjswjdjmbhfvjzvdc6ag7r3dztj2hqk3cglwyz5f5a@aarbe4rrifme>
 <f1080f46-ed96-4360-ae91-0d5b7aa138ce@quicinc.com>
 <kgtg7seem6jhidn4svxttobwvs44uwezsj2f6hydjm7er4qt5d@kehfmwi437wg>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <kgtg7seem6jhidn4svxttobwvs44uwezsj2f6hydjm7er4qt5d@kehfmwi437wg>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ck5JqT-JilcYHt8UBD2LgYifnE-fMS6g
X-Proofpoint-ORIG-GUID: ck5JqT-JilcYHt8UBD2LgYifnE-fMS6g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 mlxscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 suspectscore=0 clxscore=1015 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410180113



On 10/16/2024 3:46 PM, Dmitry Baryshkov wrote:
> On Wed, Oct 16, 2024 at 09:40:07AM +0530, Taniya Das wrote:
>>
>>
>> On 9/20/2024 4:33 PM, Dmitry Baryshkov wrote:
>>> On Fri, Sep 20, 2024 at 04:08:18PM GMT, Taniya Das wrote:
>>>> Add the global clock controller support for QCS615 SoC.
>>>>
>>>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>>>> ---
>>>>    drivers/clk/qcom/Kconfig      |    9 +
>>>>    drivers/clk/qcom/Makefile     |    1 +
>>>>    drivers/clk/qcom/gcc-qcs615.c | 3035 +++++++++++++++++++++++++++++++++++++++++
>>>>    3 files changed, 3045 insertions(+)

>>>> +};
>>>> +
>>>> +static struct clk_alpha_pll gpll0 = {
>>>> +	.offset = 0x0,
>>>> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
>>>> +	.clkr = {
>>>> +		.enable_reg = 0x52000,
>>>> +		.enable_mask = BIT(0),
>>>> +		.hw.init = &(const struct clk_init_data) {
>>>> +			.name = "gpll0",
>>>> +			.parent_data = &(const struct clk_parent_data) {
>>>> +				.index = DT_BI_TCXO,
>>>> +			},
>>>> +			.num_parents = 1,
>>>> +			.ops = &clk_alpha_pll_ops,
>>>> +		},
>>>> +	},
>>>> +};
>>>> +
>>>> +static struct clk_fixed_factor gpll0_out_aux2_div = {
>>>> +	.mult = 1,
>>>> +	.div = 2,
>>>> +	.hw.init = &(struct clk_init_data) {
>>>> +		.name = "gpll0_out_aux2_div",
>>>> +		.parent_data = &(const struct clk_parent_data) {
>>>> +			.hw = &gpll0.clkr.hw,
>>>> +		},
>>>> +		.num_parents = 1,
>>>> +		.ops = &clk_fixed_factor_ops,
>>>> +	},
>>>> +};
>>>
>>> Should it be clk_alpha_pll_postdiv_foo_ops ?
>>>
>>
>> This is not the PLL output, but it is a fixed divider which is placed as
>> input to the RCG.
>> That is the reason to use the fixed factor.
> 
> Usually OUT_AUX2 is the PLL output, isn't it? Even by its name. See
> gcc-qcm2290 / gcc-sm6115 and most of other clock controller drivers,
> except gcc-sm6125. Maybe I don't understand the difference between the
> two usecases. Is there a difference in the GCC / PLL design?
> 

Yes, your understanding is correct out_aux2/out_main are the PLL leaf 
outputs. But on QCS615 the PLL dividers are not used and thus the aux2 
and the other leaf outputs are at the same frequency as the main output 
of the VCO and instead there was a fixed divider placed after the PLL to 
divide the VCO output. There was a GCC design change required to meet 
timing closures.


>>>> +
>>>> +static struct clk_alpha_pll gpll3 = {
>>>> +	.offset = 0x3000,
>>>> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
>>>> +	.clkr = {
>>>> +		.enable_reg = 0x52000,
>>>> +		.enable_mask = BIT(3),
>>>> +		.hw.init = &(const struct clk_init_data) {
>>>> +			.name = "gpll3",
>>>> +			.parent_data = &(const struct clk_parent_data) {
>>>> +				.index = DT_BI_TCXO,
>>>> +			},
>>>> +			.num_parents = 1,
>>>> +			.ops = &clk_alpha_pll_ops,
>>>> +		},
>>>> +	},
>>>> +};
>>>> +
>>>> +static struct clk_fixed_factor gpll3_out_aux2_div = {
>>>> +	.mult = 1,
>>>> +	.div = 2,
>>>> +	.hw.init = &(struct clk_init_data) {
>>>> +		.name = "gpll3_out_aux2_div",
>>>> +		.parent_data = &(const struct clk_parent_data) {
>>>> +			.hw = &gpll3.clkr.hw,
>>>> +		},
>>>> +		.num_parents = 1,
>>>> +		.ops = &clk_fixed_factor_ops,
>>>> +	},
>>>> +};
>>>
>>> Should it be clk_alpha_pll_postdiv_foo_ops ?
>>>
>>
>> Same is the case here as well. This is not the PLL output, but it is a fixed
>> divider which is placed as input to the RCG.
>> That is the reason to use the fixed factor.
>>
>>>> +
>>>> +static struct clk_alpha_pll gpll4 = {
>>>> +	.offset = 0x76000,
>>>> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
>>>> +	.clkr = {
>>>> +		.enable_reg = 0x52000,
>>>> +		.enable_mask = BIT(4),
>>>> +		.hw.init = &(const struct clk_init_data) {
>>>> +			.name = "gpll4",
>>>> +			.parent_data = &(const struct clk_parent_data) {
>>>> +				.index = DT_BI_TCXO,
>>>> +			},
>>>> +			.num_parents = 1,
>>>> +			.ops = &clk_alpha_pll_ops,
>>>> +		},
>>>> +	},
>>>> +};
>>>> +
>>>> +static struct clk_alpha_pll gpll6 = {
>>>> +	.offset = 0x13000,
>>>> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
>>>> +	.clkr = {
>>>> +		.enable_reg = 0x52000,
>>>> +		.enable_mask = BIT(6),
>>>> +		.hw.init = &(const struct clk_init_data) {
>>>> +			.name = "gpll6",
>>>> +			.parent_data = &(const struct clk_parent_data) {
>>>> +				.index = DT_BI_TCXO,
>>>> +			},
>>>> +			.num_parents = 1,
>>>> +			.ops = &clk_alpha_pll_ops,
>>>> +		},
>>>> +	},
>>>> +};
>>>> +
>>>> +static const struct clk_div_table post_div_table_gpll6_out_main[] = {
>>>> +	{ 0x1, 2 },
>>>> +	{ }
>>>> +};
>>>> +
>>>> +static struct clk_alpha_pll_postdiv gpll6_out_main = {
>>>> +	.offset = 0x13000,
>>>> +	.post_div_shift = 8,
>>>> +	.post_div_table = post_div_table_gpll6_out_main,
>>>> +	.num_post_div = ARRAY_SIZE(post_div_table_gpll6_out_main),
>>>> +	.width = 4,
>>>> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
>>>> +	.clkr.hw.init = &(const struct clk_init_data) {
>>>> +		.name = "gpll6_out_main",
>>>> +		.parent_hws = (const struct clk_hw*[]) {
>>>> +			&gpll6.clkr.hw,
>>>> +		},
>>>> +		.num_parents = 1,
>>>> +		.ops = &clk_alpha_pll_postdiv_ops,
>>>> +	},
>>>> +};
>>>> +
>>>> +static struct clk_alpha_pll gpll7 = {
>>>> +	.offset = 0x1a000,
>>>> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
>>>> +	.clkr = {
>>>> +		.enable_reg = 0x52000,
>>>> +		.enable_mask = BIT(7),
>>>> +		.hw.init = &(const struct clk_init_data) {
>>>> +			.name = "gpll7",
>>>> +			.parent_data = &(const struct clk_parent_data) {
>>>> +				.index = DT_BI_TCXO,
>>>> +			},
>>>> +			.num_parents = 1,
>>>> +			.ops = &clk_alpha_pll_ops,
>>>> +		},
>>>> +	},
>>>> +};
>>>> +
>>>> +static struct clk_alpha_pll gpll8 = {
>>>> +	.offset = 0x1b000,
>>>> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
>>>> +	.clkr = {
>>>> +		.enable_reg = 0x52000,
>>>> +		.enable_mask = BIT(8),
>>>> +		.hw.init = &(const struct clk_init_data) {
>>>> +			.name = "gpll8",
>>>> +			.parent_data = &(const struct clk_parent_data) {
>>>> +				.index = DT_BI_TCXO,
>>>> +			},
>>>> +			.num_parents = 1,
>>>> +			.ops = &clk_alpha_pll_ops,
>>>> +		},
>>>> +	},
>>>> +};
>>>> +
>>>> +static const struct clk_div_table post_div_table_gpll8_out_main[] = {
>>>> +	{ 0x1, 2 },
>>>> +	{ }
>>>> +};
>>>> +
>>>> +static struct clk_alpha_pll_postdiv gpll8_out_main = {
>>>> +	.offset = 0x1b000,
>>>> +	.post_div_shift = 8,
>>>> +	.post_div_table = post_div_table_gpll8_out_main,
>>>> +	.num_post_div = ARRAY_SIZE(post_div_table_gpll8_out_main),
>>>> +	.width = 4,
>>>> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
>>>> +	.clkr.hw.init = &(const struct clk_init_data) {
>>>> +		.name = "gpll8_out_main",
>>>> +		.parent_hws = (const struct clk_hw*[]) {
>>>> +			&gpll8.clkr.hw,
>>>> +		},
>>>> +		.num_parents = 1,
>>>> +		.ops = &clk_alpha_pll_postdiv_ops,
>>>> +	},
>>>> +};
>>>> +
>>>> +static const struct parent_map gcc_parent_map_0[] = {
>>>> +	{ P_BI_TCXO, 0 },
>>>> +	{ P_GPLL0_OUT_MAIN, 1 },
>>>> +	{ P_GPLL0_OUT_AUX2_DIV, 6 },
>>>> +};
>>>> +
>>>> +static const struct clk_parent_data gcc_parent_data_0[] = {
>>>> +	{ .index = DT_BI_TCXO },
>>>> +	{ .hw = &gpll0.clkr.hw },
>>>> +	{ .hw = &gpll0_out_aux2_div.hw },
>>>> +};
>>>> +
>>>> +static const struct clk_parent_data gcc_parent_data_0_ao[] = {
>>>> +	{ .index = DT_BI_TCXO_AO },
>>>> +	{ .hw = &gpll0.clkr.hw },
>>>> +	{ .hw = &gpll0.clkr.hw },
>>>> +};
>>>> +
>>>> +static const struct parent_map gcc_parent_map_1[] = {
>>>> +	{ P_BI_TCXO, 0 },
>>>> +	{ P_GPLL0_OUT_MAIN, 1 },
>>>> +	{ P_GPLL6_OUT_MAIN, 2 },
>>>> +	{ P_GPLL0_OUT_AUX2_DIV, 6 },
>>>> +};
>>>> +
>>>> +static const struct clk_parent_data gcc_parent_data_1[] = {
>>>> +	{ .index = DT_BI_TCXO },
>>>> +	{ .hw = &gpll0.clkr.hw },
>>>> +	{ .hw = &gpll6_out_main.clkr.hw },
>>>> +	{ .hw = &gpll0_out_aux2_div.hw },
>>>> +};
>>>> +
>>>> +static const struct parent_map gcc_parent_map_2[] = {
>>>> +	{ P_BI_TCXO, 0 },
>>>> +	{ P_GPLL0_OUT_MAIN, 1 },
>>>> +	{ P_SLEEP_CLK, 5 },
>>>> +	{ P_GPLL0_OUT_AUX2_DIV, 6 },
>>>> +};
>>>> +
>>>> +static const struct clk_parent_data gcc_parent_data_2[] = {
>>>> +	{ .index = DT_BI_TCXO },
>>>> +	{ .hw = &gpll0.clkr.hw },
>>>> +	{ .index = DT_SLEEP_CLK },
>>>> +	{ .hw = &gpll0_out_aux2_div.hw },
>>>> +};
>>>> +
>>>> +static const struct parent_map gcc_parent_map_3[] = {
>>>> +	{ P_BI_TCXO, 0 },
>>>> +	{ P_SLEEP_CLK, 5 },
>>>> +};
>>>> +
>>>> +static const struct clk_parent_data gcc_parent_data_3[] = {
>>>> +	{ .index = DT_BI_TCXO },
>>>> +	{ .index = DT_SLEEP_CLK },
>>>> +};
>>>> +
>>>> +static const struct parent_map gcc_parent_map_4[] = {
>>>> +	{ P_BI_TCXO, 0 },
>>>> +};
>>>> +
>>>> +static const struct clk_parent_data gcc_parent_data_4[] = {
>>>> +	{ .index = DT_BI_TCXO },
>>>> +};
>>>> +
>>>> +static const struct parent_map gcc_parent_map_5[] = {
>>>> +	{ P_BI_TCXO, 0 },
>>>> +	{ P_GPLL0_OUT_MAIN, 1 },
>>>> +	{ P_GPLL7_OUT_MAIN, 3 },
>>>> +	{ P_GPLL4_OUT_MAIN, 5 },
>>>> +	{ P_GPLL0_OUT_AUX2_DIV, 6 },
>>>> +};
>>>> +
>>>> +static const struct clk_parent_data gcc_parent_data_5[] = {
>>>> +	{ .index = DT_BI_TCXO },
>>>> +	{ .hw = &gpll0.clkr.hw },
>>>> +	{ .hw = &gpll7.clkr.hw },
>>>> +	{ .hw = &gpll4.clkr.hw },
>>>> +	{ .hw = &gpll0_out_aux2_div.hw },
>>>> +};
>>>> +
>>>> +static const struct parent_map gcc_parent_map_6[] = {
>>>> +	{ P_BI_TCXO, 0 },
>>>> +	{ P_GPLL0_OUT_MAIN, 1 },
>>>> +	{ P_GPLL7_OUT_MAIN, 3 },
>>>> +	{ P_GPLL0_OUT_AUX2_DIV, 6 },
>>>> +};
>>>> +
>>>> +static const struct clk_parent_data gcc_parent_data_6[] = {
>>>> +	{ .index = DT_BI_TCXO },
>>>> +	{ .hw = &gpll0.clkr.hw },
>>>> +	{ .hw = &gpll7.clkr.hw },
>>>> +	{ .hw = &gpll0_out_aux2_div.hw },
>>>> +};
>>>> +
>>>> +static const struct parent_map gcc_parent_map_7[] = {
>>>> +	{ P_BI_TCXO, 0 },
>>>> +	{ P_GPLL0_OUT_MAIN, 1 },
>>>> +	{ P_GPLL3_OUT_MAIN_DIV, 4 },
>>>> +	{ P_GPLL0_OUT_AUX2_DIV, 6 },
>>>> +};
>>>> +
>>>> +static const struct clk_parent_data gcc_parent_data_7[] = {
>>>> +	{ .index = DT_BI_TCXO },
>>>> +	{ .hw = &gpll0.clkr.hw },
>>>> +	{ .hw = &gpll3_out_aux2_div.hw },
>>>> +	{ .hw = &gpll0_out_aux2_div.hw },
>>>> +};
>>>> +
>>>> +static const struct parent_map gcc_parent_map_8[] = {
>>>> +	{ P_BI_TCXO, 0 },
>>>> +	{ P_GPLL0_OUT_MAIN, 1 },
>>>> +	{ P_GPLL8_OUT_MAIN, 2 },
>>>> +	{ P_GPLL4_OUT_MAIN, 5 },
>>>> +	{ P_GPLL0_OUT_AUX2_DIV, 6 },
>>>> +};
>>>> +
>>>> +static const struct clk_parent_data gcc_parent_data_8[] = {
>>>> +	{ .index = DT_BI_TCXO },
>>>> +	{ .hw = &gpll0.clkr.hw },
>>>> +	{ .hw = &gpll8_out_main.clkr.hw },
>>>> +	{ .hw = &gpll4.clkr.hw },
>>>> +	{ .hw = &gpll0_out_aux2_div.hw },
>>>> +};
>>>> +
>>>> +static const struct parent_map gcc_parent_map_9[] = {
>>>> +	{ P_BI_TCXO, 0 },
>>>> +	{ P_GPLL0_OUT_MAIN, 1 },
>>>> +	{ P_GPLL3_OUT_MAIN, 4 },
>>>> +};
>>>> +
>>>> +static const struct clk_parent_data gcc_parent_data_9[] = {
>>>> +	{ .index = DT_BI_TCXO },
>>>> +	{ .hw = &gpll0.clkr.hw },
>>>> +	{ .hw = &gpll3.clkr.hw },
>>>> +};
>>>> +
>>>> +static const struct freq_tbl ftbl_gcc_cpuss_ahb_clk_src[] = {
>>>> +	F(19200000, P_BI_TCXO, 1, 0, 0),
>>>> +	{ }
>>>> +};
>>>> +
>>>> +static struct clk_rcg2 gcc_cpuss_ahb_clk_src = {
>>>> +	.cmd_rcgr = 0x48014,
>>>> +	.mnd_width = 0,
>>>> +	.hid_width = 5,
>>>> +	.parent_map = gcc_parent_map_0,
>>>> +	.freq_tbl = ftbl_gcc_cpuss_ahb_clk_src,
>>>> +	.clkr.hw.init = &(const struct clk_init_data) {
>>>> +		.name = "gcc_cpuss_ahb_clk_src",
>>>> +		.parent_data = gcc_parent_data_0_ao,
>>>> +		.num_parents = ARRAY_SIZE(gcc_parent_data_0_ao),
>>>> +		.ops = &clk_rcg2_ops,
>>>> +	},
>>>> +};
>>>> +
>>>> +static const struct freq_tbl ftbl_gcc_emac_ptp_clk_src[] = {
>>>> +	F(19200000, P_BI_TCXO, 1, 0, 0),
>>>> +	F(50000000, P_GPLL0_OUT_AUX2_DIV, 6, 0, 0),
>>>> +	F(75000000, P_GPLL0_OUT_AUX2_DIV, 4, 0, 0),
>>>> +	F(125000000, P_GPLL7_OUT_MAIN, 4, 0, 0),
>>>> +	F(250000000, P_GPLL7_OUT_MAIN, 2, 0, 0),
>>>> +	{ }
>>>> +};
>>>> +
>>>> +static struct clk_rcg2 gcc_emac_ptp_clk_src = {
>>>> +	.cmd_rcgr = 0x6038,
>>>> +	.mnd_width = 0,
>>>> +	.hid_width = 5,
>>>> +	.parent_map = gcc_parent_map_5,
>>>> +	.freq_tbl = ftbl_gcc_emac_ptp_clk_src,
>>>> +	.clkr.hw.init = &(const struct clk_init_data) {
>>>> +		.name = "gcc_emac_ptp_clk_src",
>>>> +		.parent_data = gcc_parent_data_5,
>>>> +		.num_parents = ARRAY_SIZE(gcc_parent_data_5),
>>>> +		.ops = &clk_rcg2_ops,
>>>> +	},
>>>> +};
>>>> +
>>>> +static const struct freq_tbl ftbl_gcc_emac_rgmii_clk_src[] = {
>>>> +	F(2500000, P_BI_TCXO, 1, 25, 192),
>>>> +	F(5000000, P_BI_TCXO, 1, 25, 96),
>>>> +	F(19200000, P_BI_TCXO, 1, 0, 0),
>>>> +	F(25000000, P_GPLL0_OUT_AUX2_DIV, 12, 0, 0),
>>>> +	F(50000000, P_GPLL0_OUT_AUX2_DIV, 6, 0, 0),
>>>> +	F(75000000, P_GPLL0_OUT_AUX2_DIV, 4, 0, 0),
>>>> +	F(125000000, P_GPLL7_OUT_MAIN, 4, 0, 0),
>>>> +	F(250000000, P_GPLL7_OUT_MAIN, 2, 0, 0),
>>>> +	{ }
>>>> +};
>>>> +
>>>> +static struct clk_rcg2 gcc_emac_rgmii_clk_src = {
>>>> +	.cmd_rcgr = 0x601c,
>>>> +	.mnd_width = 8,
>>>> +	.hid_width = 5,
>>>> +	.parent_map = gcc_parent_map_6,
>>>> +	.freq_tbl = ftbl_gcc_emac_rgmii_clk_src,
>>>> +	.clkr.hw.init = &(const struct clk_init_data) {
>>>> +		.name = "gcc_emac_rgmii_clk_src",
>>>> +		.parent_data = gcc_parent_data_6,
>>>> +		.num_parents = ARRAY_SIZE(gcc_parent_data_6),
>>>> +		.ops = &clk_rcg2_ops,
>>>> +	},
>>>> +};
>>>> +
>>>> +static const struct freq_tbl ftbl_gcc_gp1_clk_src[] = {
>>>> +	F(25000000, P_GPLL0_OUT_AUX2_DIV, 12, 0, 0),
>>>> +	F(50000000, P_GPLL0_OUT_AUX2_DIV, 6, 0, 0),
>>>> +	F(100000000, P_GPLL0_OUT_MAIN, 6, 0, 0),
>>>> +	F(200000000, P_GPLL0_OUT_MAIN, 3, 0, 0),
>>>> +	{ }
>>>> +};
>>>> +
>>>> +static struct clk_rcg2 gcc_gp1_clk_src = {
>>>> +	.cmd_rcgr = 0x64004,
>>>> +	.mnd_width = 8,
>>>> +	.hid_width = 5,
>>>> +	.parent_map = gcc_parent_map_2,
>>>> +	.freq_tbl = ftbl_gcc_gp1_clk_src,
>>>> +	.clkr.hw.init = &(const struct clk_init_data) {
>>>> +		.name = "gcc_gp1_clk_src",
>>>> +		.parent_data = gcc_parent_data_2,
>>>> +		.num_parents = ARRAY_SIZE(gcc_parent_data_2),
>>>> +		.ops = &clk_rcg2_ops,
>>>> +	},
>>>> +};
>>>> +
>>>> +static struct clk_rcg2 gcc_gp2_clk_src = {
>>>> +	.cmd_rcgr = 0x65004,
>>>> +	.mnd_width = 8,
>>>> +	.hid_width = 5,
>>>> +	.parent_map = gcc_parent_map_2,
>>>> +	.freq_tbl = ftbl_gcc_gp1_clk_src,
>>>> +	.clkr.hw.init = &(const struct clk_init_data) {
>>>> +		.name = "gcc_gp2_clk_src",
>>>> +		.parent_data = gcc_parent_data_2,
>>>> +		.num_parents = ARRAY_SIZE(gcc_parent_data_2),
>>>> +		.ops = &clk_rcg2_ops,
>>>> +	},
>>>> +};
>>>> +
>>>> +static struct clk_rcg2 gcc_gp3_clk_src = {
>>>> +	.cmd_rcgr = 0x66004,
>>>> +	.mnd_width = 8,
>>>> +	.hid_width = 5,
>>>> +	.parent_map = gcc_parent_map_2,
>>>> +	.freq_tbl = ftbl_gcc_gp1_clk_src,
>>>> +	.clkr.hw.init = &(const struct clk_init_data) {
>>>> +		.name = "gcc_gp3_clk_src",
>>>> +		.parent_data = gcc_parent_data_2,
>>>> +		.num_parents = ARRAY_SIZE(gcc_parent_data_2),
>>>> +		.ops = &clk_rcg2_ops,
>>>> +	},
>>>> +};
>>>> +
>>>> +static const struct freq_tbl ftbl_gcc_pcie_0_aux_clk_src[] = {
>>>> +	F(9600000, P_BI_TCXO, 2, 0, 0),
>>>> +	F(19200000, P_BI_TCXO, 1, 0, 0),
>>>> +	{ }
>>>> +};
>>>> +
>>>> +static struct clk_rcg2 gcc_pcie_0_aux_clk_src = {
>>>> +	.cmd_rcgr = 0x6b02c,
>>>> +	.mnd_width = 16,
>>>> +	.hid_width = 5,
>>>> +	.parent_map = gcc_parent_map_3,
>>>> +	.freq_tbl = ftbl_gcc_pcie_0_aux_clk_src,
>>>> +	.clkr.hw.init = &(const struct clk_init_data) {
>>>> +		.name = "gcc_pcie_0_aux_clk_src",
>>>> +		.parent_data = gcc_parent_data_3,
>>>> +		.num_parents = ARRAY_SIZE(gcc_parent_data_3),
>>>> +		.ops = &clk_rcg2_ops,
>>>
>>> Should it be using shared ops?
>>> I think there are other clocks here which are usually
>>> clk_rcg2_shared_ops.
>>>
>>
>> As the source frequency is derived from 19.2MHz, so I left it as the normal
>> RCG ops. I can update it in the next patch.
>>
>>>> +	},
>>>> +};
>>>> +
>>>
>>> [...]
>>>
>>>> +static struct clk_rcg2 gcc_vsensor_clk_src = {
>>>> +	.cmd_rcgr = 0x7a018,
>>>> +	.mnd_width = 0,
>>>> +	.hid_width = 5,
>>>> +	.parent_map = gcc_parent_map_9,
>>>> +	.freq_tbl = ftbl_gcc_vsensor_clk_src,
>>>> +	.clkr.hw.init = &(const struct clk_init_data) {
>>>> +		.name = "gcc_vsensor_clk_src",
>>>> +		.parent_data = gcc_parent_data_9,
>>>> +		.num_parents = ARRAY_SIZE(gcc_parent_data_9),
>>>> +		.ops = &clk_rcg2_ops,
>>>> +	},
>>>> +};
>>>> +
>>>> +
>>>
>>> Extra empty line
>>>
>> Sure, will take care in the next patch.
>>
>>
>>>> +static struct clk_branch gcc_aggre_ufs_phy_axi_clk = {
>>>> +	.halt_reg = 0x770c0,
>>>> +	.halt_check = BRANCH_HALT_VOTED,
>>>
>>> [...]
>>>
>>>> +
>>>> +static struct clk_branch gcc_pcie_0_pipe_clk = {
>>>> +	.halt_reg = 0x6b024,
>>>> +	.halt_check = BRANCH_HALT_SKIP,
>>>> +	.clkr = {
>>>> +		.enable_reg = 0x5200c,
>>>> +		.enable_mask = BIT(4),
>>>> +		.hw.init = &(const struct clk_init_data) {
>>>> +			.name = "gcc_pcie_0_pipe_clk",
>>>> +			.ops = &clk_branch2_ops,
>>>> +		},
>>>> +	},
>>>> +};
>>>
>>> No corresponding gcc_pcie_0_pipe_clk_src?
>>>
>>
>> On QCS615 the pipe clock source is not required to be modelled as the mux is
>> default Power on reset is set to external pipe clock.
> 
> And do we need to toggle the source of the clk_src together with the
> GDSC toggling?
> 

AFAIR, QCS615 didn't require toggling for GDSC, as even on downstream 
kernel we do not have the pipe_clk_src modelled in our driver.

>>
>>>> +
>>>> +static struct clk_branch gcc_pcie_0_slv_axi_clk = {
>>>> +	.halt_reg = 0x6b014,
>>>> +	.halt_check = BRANCH_HALT_VOTED,
>>>> +	.hwcg_reg = 0x6b014,
>>>> +	.hwcg_bit = 1,
>>>> +	.clkr = {
>>>> +		.enable_reg = 0x5200c,
>>>> +		.enable_mask = BIT(0),
>>>> +		.hw.init = &(const struct clk_init_data) {
>>>> +			.name = "gcc_pcie_0_slv_axi_clk",
>>>> +			.ops = &clk_branch2_ops,
>>>> +		},
>>>> +	},
>>>> +};
>>>> +
>>>
>>> [...]
>>>
>>
>> -- 
>> Thanks & Regards,
>> Taniya Das.
> 

-- 
Thanks & Regards,
Taniya Das.

