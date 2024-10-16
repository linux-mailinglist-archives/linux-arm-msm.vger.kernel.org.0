Return-Path: <linux-arm-msm+bounces-34538-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A8599FFF9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 06:10:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1EB811F22FCE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 04:10:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC743172BB9;
	Wed, 16 Oct 2024 04:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="D9gUJs9b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1085C487A5;
	Wed, 16 Oct 2024 04:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729051826; cv=none; b=TIAvS5Xkj6dpKzBK8f4IU/wtDVikQ+a9LGi6PB4IkYSfHf7elVZykWySddf/Znt3DdlqoAsXQvicShql3Ie+4weyyiuYNCWPZqOJdasGmUxB4/CIhtBPnOmBxjNqd5hgtkEd/6r3QpMvnbUUCSNz31OHnNaw2OPftSjATK8xfyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729051826; c=relaxed/simple;
	bh=AAmTTW2KFhphTXEvXdM4ht0v7ZnJeBvaLGd41YnyNLA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=eq0L0hPSTvhYSuD2adHSbFn07CN8jIGrDrOx8C5WaHv+IH9io165/AF5xtLsQ9tkLPXaej3VwUgAyfd/t0eMLe7neSpzON2KlFRiCi4QcBCwp2OmXRtpY34KupvCSJc5K8sfqto0zYPTjoxPj8xjzJL1rFdSBJYPkUztjNqZFoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=D9gUJs9b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49FHN1AZ007376;
	Wed, 16 Oct 2024 04:10:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I+iR22f4eKvASWOFcuEXTW0bzwvKcQNLHxjbnpDNTms=; b=D9gUJs9bP7q/Zi/d
	TZAl9NpUOGfa8s38L93q7nwGg/XNtnLd23jI4fqcFw2jx7O5uaWrcdb8/cl13Gff
	HbSf5TuryJJ3vzfO6XjPaXxSNmdxtm/qzJBfFKXHwP2gPKZEyZChYQ6XrvJOHWOI
	P0PPLBitD9w87dP5boQwjWRmtpP6PJ4fzOFlOeq7azwEoK5BV8GExNVLlfqOiox/
	o1W37WLc9yLBGaqpl46kkSL1nUG3hJkqz5u7QqvkI3dL0OfB3XTPQPOepNgueQVv
	10MwD10Z8CITzqneZIHu7CDbCoaGhhor3Xd1l25hA9oM4ek96sMTAn4NJ9Vo1+eh
	DsU5xw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 429mh53655-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Oct 2024 04:10:16 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49G4AFHq000600
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Oct 2024 04:10:15 GMT
Received: from [10.217.216.152] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 15 Oct
 2024 21:10:10 -0700
Message-ID: <f1080f46-ed96-4360-ae91-0d5b7aa138ce@quicinc.com>
Date: Wed, 16 Oct 2024 09:40:07 +0530
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
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <gokgyvnunjswjdjmbhfvjzvdc6ag7r3dztj2hqk3cglwyz5f5a@aarbe4rrifme>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ownioEgGkcDUi3Oc7LwDUReduAQidLOm
X-Proofpoint-ORIG-GUID: ownioEgGkcDUi3Oc7LwDUReduAQidLOm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 adultscore=0 mlxlogscore=999
 lowpriorityscore=0 mlxscore=0 phishscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410160025



On 9/20/2024 4:33 PM, Dmitry Baryshkov wrote:
> On Fri, Sep 20, 2024 at 04:08:18PM GMT, Taniya Das wrote:
>> Add the global clock controller support for QCS615 SoC.
>>
>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>> ---
>>   drivers/clk/qcom/Kconfig      |    9 +
>>   drivers/clk/qcom/Makefile     |    1 +
>>   drivers/clk/qcom/gcc-qcs615.c | 3035 +++++++++++++++++++++++++++++++++++++++++
>>   3 files changed, 3045 insertions(+)
>>
>> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
>> index a3e2a09e2105..52a7ba6d4cbf 100644
>> --- a/drivers/clk/qcom/Kconfig
>> +++ b/drivers/clk/qcom/Kconfig
>> @@ -467,6 +467,15 @@ config QCS_GCC_404
>>   	  Say Y if you want to use multimedia devices or peripheral
>>   	  devices such as UART, SPI, I2C, USB, SD/eMMC, PCIe etc.
>>   
>> +config QCS_GCC_615
>> +	tristate "QCS615 Global Clock Controller"
>> +	depends on ARM64 || COMPILE_TEST
>> +	select QCOM_GDSC
>> +	help
>> +	  Support for the global clock controller on QCS615 devices.
>> +	  Say Y if you want to use multimedia devices or peripheral
>> +	  devices such as UART, SPI, I2C, USB, SD/eMMC, PCIe etc.
>> +
>>   config SC_CAMCC_7180
>>   	tristate "SC7180 Camera Clock Controller"
>>   	depends on ARM64 || COMPILE_TEST
>> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
>> index 2b378667a63f..a46ce0723602 100644
>> --- a/drivers/clk/qcom/Makefile
>> +++ b/drivers/clk/qcom/Makefile
>> @@ -70,6 +70,7 @@ obj-$(CONFIG_QCOM_CLK_SMD_RPM) += clk-smd-rpm.o
>>   obj-$(CONFIG_QCM_GCC_2290) += gcc-qcm2290.o
>>   obj-$(CONFIG_QCM_DISPCC_2290) += dispcc-qcm2290.o
>>   obj-$(CONFIG_QCS_GCC_404) += gcc-qcs404.o
>> +obj-$(CONFIG_QCS_GCC_615) += gcc-qcs615.o
>>   obj-$(CONFIG_QCS_Q6SSTOP_404) += q6sstop-qcs404.o
>>   obj-$(CONFIG_QCS_TURING_404) += turingcc-qcs404.o
>>   obj-$(CONFIG_QDU_ECPRICC_1000) += ecpricc-qdu1000.o
>> diff --git a/drivers/clk/qcom/gcc-qcs615.c b/drivers/clk/qcom/gcc-qcs615.c
>> new file mode 100644
>> index 000000000000..7db55a5d8e80
>> --- /dev/null
>> +++ b/drivers/clk/qcom/gcc-qcs615.c
>> @@ -0,0 +1,3035 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +#include <linux/clk-provider.h>
>> +#include <linux/module.h>
>> +#include <linux/mod_devicetable.h>
>> +#include <linux/of.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/regmap.h>
>> +
>> +#include <dt-bindings/clock/qcom,qcs615-gcc.h>
>> +
>> +#include "clk-alpha-pll.h"
>> +#include "clk-branch.h"
>> +#include "clk-rcg.h"
>> +#include "clk-regmap.h"
>> +#include "clk-regmap-divider.h"
>> +#include "clk-regmap-mux.h"
>> +#include "common.h"
>> +#include "gdsc.h"
>> +#include "reset.h"
>> +
>> +enum {
>> +	DT_BI_TCXO,
>> +	DT_BI_TCXO_AO,
>> +	DT_SLEEP_CLK,
>> +};
>> +
>> +enum {
>> +	P_BI_TCXO,
>> +	P_GPLL0_OUT_AUX2_DIV,
>> +	P_GPLL0_OUT_MAIN,
>> +	P_GPLL3_OUT_MAIN,
>> +	P_GPLL3_OUT_MAIN_DIV,
>> +	P_GPLL4_OUT_MAIN,
>> +	P_GPLL6_OUT_MAIN,
>> +	P_GPLL7_OUT_MAIN,
>> +	P_GPLL8_OUT_MAIN,
>> +	P_SLEEP_CLK,
>> +};
>> +
>> +static struct clk_alpha_pll gpll0 = {
>> +	.offset = 0x0,
>> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
>> +	.clkr = {
>> +		.enable_reg = 0x52000,
>> +		.enable_mask = BIT(0),
>> +		.hw.init = &(const struct clk_init_data) {
>> +			.name = "gpll0",
>> +			.parent_data = &(const struct clk_parent_data) {
>> +				.index = DT_BI_TCXO,
>> +			},
>> +			.num_parents = 1,
>> +			.ops = &clk_alpha_pll_ops,
>> +		},
>> +	},
>> +};
>> +
>> +static struct clk_fixed_factor gpll0_out_aux2_div = {
>> +	.mult = 1,
>> +	.div = 2,
>> +	.hw.init = &(struct clk_init_data) {
>> +		.name = "gpll0_out_aux2_div",
>> +		.parent_data = &(const struct clk_parent_data) {
>> +			.hw = &gpll0.clkr.hw,
>> +		},
>> +		.num_parents = 1,
>> +		.ops = &clk_fixed_factor_ops,
>> +	},
>> +};
> 
> Should it be clk_alpha_pll_postdiv_foo_ops ?
> 

This is not the PLL output, but it is a fixed divider which is placed as 
input to the RCG.
That is the reason to use the fixed factor.

>> +
>> +static struct clk_alpha_pll gpll3 = {
>> +	.offset = 0x3000,
>> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
>> +	.clkr = {
>> +		.enable_reg = 0x52000,
>> +		.enable_mask = BIT(3),
>> +		.hw.init = &(const struct clk_init_data) {
>> +			.name = "gpll3",
>> +			.parent_data = &(const struct clk_parent_data) {
>> +				.index = DT_BI_TCXO,
>> +			},
>> +			.num_parents = 1,
>> +			.ops = &clk_alpha_pll_ops,
>> +		},
>> +	},
>> +};
>> +
>> +static struct clk_fixed_factor gpll3_out_aux2_div = {
>> +	.mult = 1,
>> +	.div = 2,
>> +	.hw.init = &(struct clk_init_data) {
>> +		.name = "gpll3_out_aux2_div",
>> +		.parent_data = &(const struct clk_parent_data) {
>> +			.hw = &gpll3.clkr.hw,
>> +		},
>> +		.num_parents = 1,
>> +		.ops = &clk_fixed_factor_ops,
>> +	},
>> +};
> 
> Should it be clk_alpha_pll_postdiv_foo_ops ?
> 

Same is the case here as well. This is not the PLL output, but it is a 
fixed divider which is placed as input to the RCG.
That is the reason to use the fixed factor.

>> +
>> +static struct clk_alpha_pll gpll4 = {
>> +	.offset = 0x76000,
>> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
>> +	.clkr = {
>> +		.enable_reg = 0x52000,
>> +		.enable_mask = BIT(4),
>> +		.hw.init = &(const struct clk_init_data) {
>> +			.name = "gpll4",
>> +			.parent_data = &(const struct clk_parent_data) {
>> +				.index = DT_BI_TCXO,
>> +			},
>> +			.num_parents = 1,
>> +			.ops = &clk_alpha_pll_ops,
>> +		},
>> +	},
>> +};
>> +
>> +static struct clk_alpha_pll gpll6 = {
>> +	.offset = 0x13000,
>> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
>> +	.clkr = {
>> +		.enable_reg = 0x52000,
>> +		.enable_mask = BIT(6),
>> +		.hw.init = &(const struct clk_init_data) {
>> +			.name = "gpll6",
>> +			.parent_data = &(const struct clk_parent_data) {
>> +				.index = DT_BI_TCXO,
>> +			},
>> +			.num_parents = 1,
>> +			.ops = &clk_alpha_pll_ops,
>> +		},
>> +	},
>> +};
>> +
>> +static const struct clk_div_table post_div_table_gpll6_out_main[] = {
>> +	{ 0x1, 2 },
>> +	{ }
>> +};
>> +
>> +static struct clk_alpha_pll_postdiv gpll6_out_main = {
>> +	.offset = 0x13000,
>> +	.post_div_shift = 8,
>> +	.post_div_table = post_div_table_gpll6_out_main,
>> +	.num_post_div = ARRAY_SIZE(post_div_table_gpll6_out_main),
>> +	.width = 4,
>> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
>> +	.clkr.hw.init = &(const struct clk_init_data) {
>> +		.name = "gpll6_out_main",
>> +		.parent_hws = (const struct clk_hw*[]) {
>> +			&gpll6.clkr.hw,
>> +		},
>> +		.num_parents = 1,
>> +		.ops = &clk_alpha_pll_postdiv_ops,
>> +	},
>> +};
>> +
>> +static struct clk_alpha_pll gpll7 = {
>> +	.offset = 0x1a000,
>> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
>> +	.clkr = {
>> +		.enable_reg = 0x52000,
>> +		.enable_mask = BIT(7),
>> +		.hw.init = &(const struct clk_init_data) {
>> +			.name = "gpll7",
>> +			.parent_data = &(const struct clk_parent_data) {
>> +				.index = DT_BI_TCXO,
>> +			},
>> +			.num_parents = 1,
>> +			.ops = &clk_alpha_pll_ops,
>> +		},
>> +	},
>> +};
>> +
>> +static struct clk_alpha_pll gpll8 = {
>> +	.offset = 0x1b000,
>> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
>> +	.clkr = {
>> +		.enable_reg = 0x52000,
>> +		.enable_mask = BIT(8),
>> +		.hw.init = &(const struct clk_init_data) {
>> +			.name = "gpll8",
>> +			.parent_data = &(const struct clk_parent_data) {
>> +				.index = DT_BI_TCXO,
>> +			},
>> +			.num_parents = 1,
>> +			.ops = &clk_alpha_pll_ops,
>> +		},
>> +	},
>> +};
>> +
>> +static const struct clk_div_table post_div_table_gpll8_out_main[] = {
>> +	{ 0x1, 2 },
>> +	{ }
>> +};
>> +
>> +static struct clk_alpha_pll_postdiv gpll8_out_main = {
>> +	.offset = 0x1b000,
>> +	.post_div_shift = 8,
>> +	.post_div_table = post_div_table_gpll8_out_main,
>> +	.num_post_div = ARRAY_SIZE(post_div_table_gpll8_out_main),
>> +	.width = 4,
>> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
>> +	.clkr.hw.init = &(const struct clk_init_data) {
>> +		.name = "gpll8_out_main",
>> +		.parent_hws = (const struct clk_hw*[]) {
>> +			&gpll8.clkr.hw,
>> +		},
>> +		.num_parents = 1,
>> +		.ops = &clk_alpha_pll_postdiv_ops,
>> +	},
>> +};
>> +
>> +static const struct parent_map gcc_parent_map_0[] = {
>> +	{ P_BI_TCXO, 0 },
>> +	{ P_GPLL0_OUT_MAIN, 1 },
>> +	{ P_GPLL0_OUT_AUX2_DIV, 6 },
>> +};
>> +
>> +static const struct clk_parent_data gcc_parent_data_0[] = {
>> +	{ .index = DT_BI_TCXO },
>> +	{ .hw = &gpll0.clkr.hw },
>> +	{ .hw = &gpll0_out_aux2_div.hw },
>> +};
>> +
>> +static const struct clk_parent_data gcc_parent_data_0_ao[] = {
>> +	{ .index = DT_BI_TCXO_AO },
>> +	{ .hw = &gpll0.clkr.hw },
>> +	{ .hw = &gpll0.clkr.hw },
>> +};
>> +
>> +static const struct parent_map gcc_parent_map_1[] = {
>> +	{ P_BI_TCXO, 0 },
>> +	{ P_GPLL0_OUT_MAIN, 1 },
>> +	{ P_GPLL6_OUT_MAIN, 2 },
>> +	{ P_GPLL0_OUT_AUX2_DIV, 6 },
>> +};
>> +
>> +static const struct clk_parent_data gcc_parent_data_1[] = {
>> +	{ .index = DT_BI_TCXO },
>> +	{ .hw = &gpll0.clkr.hw },
>> +	{ .hw = &gpll6_out_main.clkr.hw },
>> +	{ .hw = &gpll0_out_aux2_div.hw },
>> +};
>> +
>> +static const struct parent_map gcc_parent_map_2[] = {
>> +	{ P_BI_TCXO, 0 },
>> +	{ P_GPLL0_OUT_MAIN, 1 },
>> +	{ P_SLEEP_CLK, 5 },
>> +	{ P_GPLL0_OUT_AUX2_DIV, 6 },
>> +};
>> +
>> +static const struct clk_parent_data gcc_parent_data_2[] = {
>> +	{ .index = DT_BI_TCXO },
>> +	{ .hw = &gpll0.clkr.hw },
>> +	{ .index = DT_SLEEP_CLK },
>> +	{ .hw = &gpll0_out_aux2_div.hw },
>> +};
>> +
>> +static const struct parent_map gcc_parent_map_3[] = {
>> +	{ P_BI_TCXO, 0 },
>> +	{ P_SLEEP_CLK, 5 },
>> +};
>> +
>> +static const struct clk_parent_data gcc_parent_data_3[] = {
>> +	{ .index = DT_BI_TCXO },
>> +	{ .index = DT_SLEEP_CLK },
>> +};
>> +
>> +static const struct parent_map gcc_parent_map_4[] = {
>> +	{ P_BI_TCXO, 0 },
>> +};
>> +
>> +static const struct clk_parent_data gcc_parent_data_4[] = {
>> +	{ .index = DT_BI_TCXO },
>> +};
>> +
>> +static const struct parent_map gcc_parent_map_5[] = {
>> +	{ P_BI_TCXO, 0 },
>> +	{ P_GPLL0_OUT_MAIN, 1 },
>> +	{ P_GPLL7_OUT_MAIN, 3 },
>> +	{ P_GPLL4_OUT_MAIN, 5 },
>> +	{ P_GPLL0_OUT_AUX2_DIV, 6 },
>> +};
>> +
>> +static const struct clk_parent_data gcc_parent_data_5[] = {
>> +	{ .index = DT_BI_TCXO },
>> +	{ .hw = &gpll0.clkr.hw },
>> +	{ .hw = &gpll7.clkr.hw },
>> +	{ .hw = &gpll4.clkr.hw },
>> +	{ .hw = &gpll0_out_aux2_div.hw },
>> +};
>> +
>> +static const struct parent_map gcc_parent_map_6[] = {
>> +	{ P_BI_TCXO, 0 },
>> +	{ P_GPLL0_OUT_MAIN, 1 },
>> +	{ P_GPLL7_OUT_MAIN, 3 },
>> +	{ P_GPLL0_OUT_AUX2_DIV, 6 },
>> +};
>> +
>> +static const struct clk_parent_data gcc_parent_data_6[] = {
>> +	{ .index = DT_BI_TCXO },
>> +	{ .hw = &gpll0.clkr.hw },
>> +	{ .hw = &gpll7.clkr.hw },
>> +	{ .hw = &gpll0_out_aux2_div.hw },
>> +};
>> +
>> +static const struct parent_map gcc_parent_map_7[] = {
>> +	{ P_BI_TCXO, 0 },
>> +	{ P_GPLL0_OUT_MAIN, 1 },
>> +	{ P_GPLL3_OUT_MAIN_DIV, 4 },
>> +	{ P_GPLL0_OUT_AUX2_DIV, 6 },
>> +};
>> +
>> +static const struct clk_parent_data gcc_parent_data_7[] = {
>> +	{ .index = DT_BI_TCXO },
>> +	{ .hw = &gpll0.clkr.hw },
>> +	{ .hw = &gpll3_out_aux2_div.hw },
>> +	{ .hw = &gpll0_out_aux2_div.hw },
>> +};
>> +
>> +static const struct parent_map gcc_parent_map_8[] = {
>> +	{ P_BI_TCXO, 0 },
>> +	{ P_GPLL0_OUT_MAIN, 1 },
>> +	{ P_GPLL8_OUT_MAIN, 2 },
>> +	{ P_GPLL4_OUT_MAIN, 5 },
>> +	{ P_GPLL0_OUT_AUX2_DIV, 6 },
>> +};
>> +
>> +static const struct clk_parent_data gcc_parent_data_8[] = {
>> +	{ .index = DT_BI_TCXO },
>> +	{ .hw = &gpll0.clkr.hw },
>> +	{ .hw = &gpll8_out_main.clkr.hw },
>> +	{ .hw = &gpll4.clkr.hw },
>> +	{ .hw = &gpll0_out_aux2_div.hw },
>> +};
>> +
>> +static const struct parent_map gcc_parent_map_9[] = {
>> +	{ P_BI_TCXO, 0 },
>> +	{ P_GPLL0_OUT_MAIN, 1 },
>> +	{ P_GPLL3_OUT_MAIN, 4 },
>> +};
>> +
>> +static const struct clk_parent_data gcc_parent_data_9[] = {
>> +	{ .index = DT_BI_TCXO },
>> +	{ .hw = &gpll0.clkr.hw },
>> +	{ .hw = &gpll3.clkr.hw },
>> +};
>> +
>> +static const struct freq_tbl ftbl_gcc_cpuss_ahb_clk_src[] = {
>> +	F(19200000, P_BI_TCXO, 1, 0, 0),
>> +	{ }
>> +};
>> +
>> +static struct clk_rcg2 gcc_cpuss_ahb_clk_src = {
>> +	.cmd_rcgr = 0x48014,
>> +	.mnd_width = 0,
>> +	.hid_width = 5,
>> +	.parent_map = gcc_parent_map_0,
>> +	.freq_tbl = ftbl_gcc_cpuss_ahb_clk_src,
>> +	.clkr.hw.init = &(const struct clk_init_data) {
>> +		.name = "gcc_cpuss_ahb_clk_src",
>> +		.parent_data = gcc_parent_data_0_ao,
>> +		.num_parents = ARRAY_SIZE(gcc_parent_data_0_ao),
>> +		.ops = &clk_rcg2_ops,
>> +	},
>> +};
>> +
>> +static const struct freq_tbl ftbl_gcc_emac_ptp_clk_src[] = {
>> +	F(19200000, P_BI_TCXO, 1, 0, 0),
>> +	F(50000000, P_GPLL0_OUT_AUX2_DIV, 6, 0, 0),
>> +	F(75000000, P_GPLL0_OUT_AUX2_DIV, 4, 0, 0),
>> +	F(125000000, P_GPLL7_OUT_MAIN, 4, 0, 0),
>> +	F(250000000, P_GPLL7_OUT_MAIN, 2, 0, 0),
>> +	{ }
>> +};
>> +
>> +static struct clk_rcg2 gcc_emac_ptp_clk_src = {
>> +	.cmd_rcgr = 0x6038,
>> +	.mnd_width = 0,
>> +	.hid_width = 5,
>> +	.parent_map = gcc_parent_map_5,
>> +	.freq_tbl = ftbl_gcc_emac_ptp_clk_src,
>> +	.clkr.hw.init = &(const struct clk_init_data) {
>> +		.name = "gcc_emac_ptp_clk_src",
>> +		.parent_data = gcc_parent_data_5,
>> +		.num_parents = ARRAY_SIZE(gcc_parent_data_5),
>> +		.ops = &clk_rcg2_ops,
>> +	},
>> +};
>> +
>> +static const struct freq_tbl ftbl_gcc_emac_rgmii_clk_src[] = {
>> +	F(2500000, P_BI_TCXO, 1, 25, 192),
>> +	F(5000000, P_BI_TCXO, 1, 25, 96),
>> +	F(19200000, P_BI_TCXO, 1, 0, 0),
>> +	F(25000000, P_GPLL0_OUT_AUX2_DIV, 12, 0, 0),
>> +	F(50000000, P_GPLL0_OUT_AUX2_DIV, 6, 0, 0),
>> +	F(75000000, P_GPLL0_OUT_AUX2_DIV, 4, 0, 0),
>> +	F(125000000, P_GPLL7_OUT_MAIN, 4, 0, 0),
>> +	F(250000000, P_GPLL7_OUT_MAIN, 2, 0, 0),
>> +	{ }
>> +};
>> +
>> +static struct clk_rcg2 gcc_emac_rgmii_clk_src = {
>> +	.cmd_rcgr = 0x601c,
>> +	.mnd_width = 8,
>> +	.hid_width = 5,
>> +	.parent_map = gcc_parent_map_6,
>> +	.freq_tbl = ftbl_gcc_emac_rgmii_clk_src,
>> +	.clkr.hw.init = &(const struct clk_init_data) {
>> +		.name = "gcc_emac_rgmii_clk_src",
>> +		.parent_data = gcc_parent_data_6,
>> +		.num_parents = ARRAY_SIZE(gcc_parent_data_6),
>> +		.ops = &clk_rcg2_ops,
>> +	},
>> +};
>> +
>> +static const struct freq_tbl ftbl_gcc_gp1_clk_src[] = {
>> +	F(25000000, P_GPLL0_OUT_AUX2_DIV, 12, 0, 0),
>> +	F(50000000, P_GPLL0_OUT_AUX2_DIV, 6, 0, 0),
>> +	F(100000000, P_GPLL0_OUT_MAIN, 6, 0, 0),
>> +	F(200000000, P_GPLL0_OUT_MAIN, 3, 0, 0),
>> +	{ }
>> +};
>> +
>> +static struct clk_rcg2 gcc_gp1_clk_src = {
>> +	.cmd_rcgr = 0x64004,
>> +	.mnd_width = 8,
>> +	.hid_width = 5,
>> +	.parent_map = gcc_parent_map_2,
>> +	.freq_tbl = ftbl_gcc_gp1_clk_src,
>> +	.clkr.hw.init = &(const struct clk_init_data) {
>> +		.name = "gcc_gp1_clk_src",
>> +		.parent_data = gcc_parent_data_2,
>> +		.num_parents = ARRAY_SIZE(gcc_parent_data_2),
>> +		.ops = &clk_rcg2_ops,
>> +	},
>> +};
>> +
>> +static struct clk_rcg2 gcc_gp2_clk_src = {
>> +	.cmd_rcgr = 0x65004,
>> +	.mnd_width = 8,
>> +	.hid_width = 5,
>> +	.parent_map = gcc_parent_map_2,
>> +	.freq_tbl = ftbl_gcc_gp1_clk_src,
>> +	.clkr.hw.init = &(const struct clk_init_data) {
>> +		.name = "gcc_gp2_clk_src",
>> +		.parent_data = gcc_parent_data_2,
>> +		.num_parents = ARRAY_SIZE(gcc_parent_data_2),
>> +		.ops = &clk_rcg2_ops,
>> +	},
>> +};
>> +
>> +static struct clk_rcg2 gcc_gp3_clk_src = {
>> +	.cmd_rcgr = 0x66004,
>> +	.mnd_width = 8,
>> +	.hid_width = 5,
>> +	.parent_map = gcc_parent_map_2,
>> +	.freq_tbl = ftbl_gcc_gp1_clk_src,
>> +	.clkr.hw.init = &(const struct clk_init_data) {
>> +		.name = "gcc_gp3_clk_src",
>> +		.parent_data = gcc_parent_data_2,
>> +		.num_parents = ARRAY_SIZE(gcc_parent_data_2),
>> +		.ops = &clk_rcg2_ops,
>> +	},
>> +};
>> +
>> +static const struct freq_tbl ftbl_gcc_pcie_0_aux_clk_src[] = {
>> +	F(9600000, P_BI_TCXO, 2, 0, 0),
>> +	F(19200000, P_BI_TCXO, 1, 0, 0),
>> +	{ }
>> +};
>> +
>> +static struct clk_rcg2 gcc_pcie_0_aux_clk_src = {
>> +	.cmd_rcgr = 0x6b02c,
>> +	.mnd_width = 16,
>> +	.hid_width = 5,
>> +	.parent_map = gcc_parent_map_3,
>> +	.freq_tbl = ftbl_gcc_pcie_0_aux_clk_src,
>> +	.clkr.hw.init = &(const struct clk_init_data) {
>> +		.name = "gcc_pcie_0_aux_clk_src",
>> +		.parent_data = gcc_parent_data_3,
>> +		.num_parents = ARRAY_SIZE(gcc_parent_data_3),
>> +		.ops = &clk_rcg2_ops,
> 
> Should it be using shared ops?
> I think there are other clocks here which are usually
> clk_rcg2_shared_ops.
> 

As the source frequency is derived from 19.2MHz, so I left it as the 
normal RCG ops. I can update it in the next patch.

>> +	},
>> +};
>> +
> 
> [...]
> 
>> +static struct clk_rcg2 gcc_vsensor_clk_src = {
>> +	.cmd_rcgr = 0x7a018,
>> +	.mnd_width = 0,
>> +	.hid_width = 5,
>> +	.parent_map = gcc_parent_map_9,
>> +	.freq_tbl = ftbl_gcc_vsensor_clk_src,
>> +	.clkr.hw.init = &(const struct clk_init_data) {
>> +		.name = "gcc_vsensor_clk_src",
>> +		.parent_data = gcc_parent_data_9,
>> +		.num_parents = ARRAY_SIZE(gcc_parent_data_9),
>> +		.ops = &clk_rcg2_ops,
>> +	},
>> +};
>> +
>> +
> 
> Extra empty line
>
Sure, will take care in the next patch.


>> +static struct clk_branch gcc_aggre_ufs_phy_axi_clk = {
>> +	.halt_reg = 0x770c0,
>> +	.halt_check = BRANCH_HALT_VOTED,
> 
> [...]
> 
>> +
>> +static struct clk_branch gcc_pcie_0_pipe_clk = {
>> +	.halt_reg = 0x6b024,
>> +	.halt_check = BRANCH_HALT_SKIP,
>> +	.clkr = {
>> +		.enable_reg = 0x5200c,
>> +		.enable_mask = BIT(4),
>> +		.hw.init = &(const struct clk_init_data) {
>> +			.name = "gcc_pcie_0_pipe_clk",
>> +			.ops = &clk_branch2_ops,
>> +		},
>> +	},
>> +};
> 
> No corresponding gcc_pcie_0_pipe_clk_src?
> 

On QCS615 the pipe clock source is not required to be modelled as the 
mux is default Power on reset is set to external pipe clock.

>> +
>> +static struct clk_branch gcc_pcie_0_slv_axi_clk = {
>> +	.halt_reg = 0x6b014,
>> +	.halt_check = BRANCH_HALT_VOTED,
>> +	.hwcg_reg = 0x6b014,
>> +	.hwcg_bit = 1,
>> +	.clkr = {
>> +		.enable_reg = 0x5200c,
>> +		.enable_mask = BIT(0),
>> +		.hw.init = &(const struct clk_init_data) {
>> +			.name = "gcc_pcie_0_slv_axi_clk",
>> +			.ops = &clk_branch2_ops,
>> +		},
>> +	},
>> +};
>> +
> 
> [...]
> 

-- 
Thanks & Regards,
Taniya Das.

