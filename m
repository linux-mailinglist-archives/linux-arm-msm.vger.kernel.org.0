Return-Path: <linux-arm-msm+bounces-29705-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC425961E56
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 07:44:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9493D2855B4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 05:44:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0A5E14C592;
	Wed, 28 Aug 2024 05:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DS98qfa0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0717374F1;
	Wed, 28 Aug 2024 05:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724823887; cv=none; b=ZIKlYQ+HDKaINuHKRvcn5S546WsMKq91skS8jsXFQnNKIS6wC0+Y1sjwgXcGb59QXvQpN/F8AahIGoHK6H/81RSMmjIx5f3UROmIX9vDT6zOJVZCIjWDCB6fKOSGATyFcqEOpOo/c7Wc7rAglPb2e2v8JQv45h374CjUz0ofVxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724823887; c=relaxed/simple;
	bh=EEWciR30cM4kvT87+kJQKG+l5SBgjdWF5gjx55BFXsM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=hiFIv23eMhVcDdd64Z1Xdh3XBwW/X/WFtsgCOfpp33w9+HG5OZyAYr+BoInkLGt0m9ItQ6ovKbDBFJKYI2sidmxGsSG//INFW6hRlnEBa6SXqdAgkfAXuWVyLtvwnP7ijT/gn+X3S+HR7odsEoeezs/l2UEa4Ox6PnPheMXwpHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DS98qfa0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47RLb5ZE006244;
	Wed, 28 Aug 2024 05:44:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dDTEUjZpSewglzxLKsTlGIpIjtikCO+cdiYifOtRYEk=; b=DS98qfa01loWgD/z
	qquXH9p7LfJHyvhvqCb+rEKbUQHf88G6+evTSnb8IIkVoOAnXafCOFhyOUItmMZo
	z07P/JEygcV6BMwW10RyH/V8ahUXazzmI7SJIzFUsY/8nVqoEVTjolnyAhcaH3bm
	//AkQR48wi1x9w7gwYwXG16sQEaWKQnMdIjB49+w3MvUGr4R/7nFu7N6B5N4YHt4
	xfJ8gKhKZf3iPVG82HDls4sVThwfxyalpwf2q87IaEhw67HyAWi918SBVDA/H5CF
	H8KjekjTm675PUbsGOU13wZ0noIOTQVGZFvnDf3CCdBpB44yUu7CMeQBrjIyuqxj
	7sUFYw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419pv2gs6j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 05:44:21 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47S5iJ5J002882
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 05:44:19 GMT
Received: from [10.253.78.205] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 27 Aug
 2024 22:44:15 -0700
Message-ID: <7f4d41a0-b1b9-4b63-8590-63f4fcf1a359@quicinc.com>
Date: Wed, 28 Aug 2024 13:44:12 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] clk: qcom: Add CMN PLL clock controller driver for
 IPQ SoC
To: Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh@kernel.org>, Will Deacon <will@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <quic_kkumarcs@quicinc.com>,
        <quic_suruchia@quicinc.com>, <quic_pavir@quicinc.com>,
        <quic_linchen@quicinc.com>, <quic_leiwei@quicinc.com>,
        <bartosz.golaszewski@linaro.org>, <srinivas.kandagatla@linaro.org>
References: <20240827-qcom_ipq_cmnpll-v3-0-8e009cece8b2@quicinc.com>
 <20240827-qcom_ipq_cmnpll-v3-2-8e009cece8b2@quicinc.com>
 <d7b374670eb2f6d442f351106ab1221a.sboyd@kernel.org>
Content-Language: en-US
From: Jie Luo <quic_luoj@quicinc.com>
In-Reply-To: <d7b374670eb2f6d442f351106ab1221a.sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: qJhNRyNqj3H3U_ZSztNVyeUIdABzBVO6
X-Proofpoint-ORIG-GUID: qJhNRyNqj3H3U_ZSztNVyeUIdABzBVO6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-28_03,2024-08-27_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0
 impostorscore=0 bulkscore=0 spamscore=0 suspectscore=0 mlxscore=0
 mlxlogscore=999 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2408280038



On 8/28/2024 7:50 AM, Stephen Boyd wrote:
> Quoting Luo Jie (2024-08-27 05:46:00)
>> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
>> index 8a6f0dabd02f..35f656146de7 100644
>> --- a/drivers/clk/qcom/Makefile
>> +++ b/drivers/clk/qcom/Makefile
>> @@ -29,6 +29,7 @@ obj-$(CONFIG_CLK_X1E80100_TCSRCC) += tcsrcc-x1e80100.o
>>   obj-$(CONFIG_CLK_QCM2290_GPUCC) += gpucc-qcm2290.o
>>   obj-$(CONFIG_IPQ_APSS_PLL) += apss-ipq-pll.o
>>   obj-$(CONFIG_IPQ_APSS_6018) += apss-ipq6018.o
>> +obj-$(CONFIG_IPQ_CMN_PLL) += clk-ipq-cmn-pll.o
> 
> I don't see many other filenames with clk- prefix in this directory, so
> probably drop it.

OK.

> 
>>   obj-$(CONFIG_IPQ_GCC_4019) += gcc-ipq4019.o
>>   obj-$(CONFIG_IPQ_GCC_5018) += gcc-ipq5018.o
>>   obj-$(CONFIG_IPQ_GCC_5332) += gcc-ipq5332.o
>> diff --git a/drivers/clk/qcom/clk-ipq-cmn-pll.c b/drivers/clk/qcom/clk-ipq-cmn-pll.c
>> new file mode 100644
>> index 000000000000..a9775c39b2f3
>> --- /dev/null
>> +++ b/drivers/clk/qcom/clk-ipq-cmn-pll.c
>> @@ -0,0 +1,241 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +/*
>> + * CMN PLL block expects the reference clock from on-board Wi-Fi block, and
>> + * supplies fixed rate clocks as output to the Ethernet hardware blocks.
>> + * The Ethernet related blocks include PPE (packet process engine) and the
>> + * external connected PHY (or switch) chip receiving clocks from the CMN PLL.
>> + *
>> + * On the IPQ9574 SoC, There are three clocks with 50 MHZ, one clock with
>> + * 25 MHZ which are output from the CMN PLL to Ethernet PHY (or switch),
>> + * and one clock with 353 MHZ to PPE.
>> + *
>> + *               +---------+
>> + *               |   GCC   |
>> + *               +--+---+--+
>> + *           AHB CLK|   |SYS CLK
>> + *                  V   V
>> + *          +-------+---+------+
>> + *          |                  +-------------> eth0-50mhz
>> + * REF CLK  |     IPQ9574      |
>> + * -------->+                  +-------------> eth1-50mhz
>> + *          |  CMN PLL block   |
>> + *          |                  +-------------> eth2-50mhz
>> + *          |                  |
>> + *          +---------+--------+-------------> eth-25mhz
>> + *                    |
>> + *                    V
>> + *                    ppe-353mhz
>> + */
>> +
>> +#include <dt-bindings/clock/qcom,ipq-cmn-pll.h>
> 
> Include dt-bindings after linux please.

OK, will update.

> 
>> +#include <linux/bitfield.h>
>> +#include <linux/clk.h>
>> +#include <linux/clk-provider.h>
>> +#include <linux/delay.h>
>> +#include <linux/io.h>
>> +#include <linux/iopoll.h>
>> +#include <linux/of.h>
>> +#include <linux/of_address.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/slab.h>
>> +
>> +#define CMN_PLL_REFCLK_SRC_SELECTION           0x28
>> +#define CMN_PLL_REFCLK_SRC_DIV                 GENMASK(9, 8)
>> +
>> +#define CMN_PLL_LOCKED                         0x64
>> +#define CMN_PLL_CLKS_LOCKED                    BIT(8)
>> +
>> +#define CMN_PLL_POWER_ON_AND_RESET             0x780
>> +#define CMN_ANA_EN_SW_RSTN                     BIT(6)
>> +
>> +#define CMN_PLL_REFCLK_CONFIG                  0x784
>> +#define CMN_PLL_REFCLK_EXTERNAL                        BIT(9)
>> +#define CMN_PLL_REFCLK_DIV                     GENMASK(8, 4)
>> +#define CMN_PLL_REFCLK_INDEX                   GENMASK(3, 0)
>> +
>> +#define CMN_PLL_CTRL                           0x78c
>> +#define CMN_PLL_CTRL_LOCK_DETECT_EN            BIT(15)
>> +
>> +/**
>> + * struct cmn_pll_fixed_output_clk - CMN PLL output clocks information
>> + * @id:        Clock specifier to be supplied
>> + * @name: Clock name to be registered
>> + * @rate: Clock rate
>> + */
>> +struct cmn_pll_fixed_output_clk {
>> +       unsigned int id;
>> +       const char *name;
>> +       const unsigned long rate;
>> +};
>> +
>> +#define CLK_PLL_OUTPUT(_id, _name, _rate) {            \
>> +       .id = _id,                                      \
>> +       .name = _name,                                  \
>> +       .rate = _rate,                                  \
>> +}
>> +
>> +static const struct cmn_pll_fixed_output_clk ipq9574_output_clks[] = {
>> +       CLK_PLL_OUTPUT(PPE_353MHZ_CLK, "ppe-353mhz", 353000000UL),
>> +       CLK_PLL_OUTPUT(ETH0_50MHZ_CLK, "eth0-50mhz", 50000000UL),
>> +       CLK_PLL_OUTPUT(ETH1_50MHZ_CLK, "eth1-50mhz", 50000000UL),
>> +       CLK_PLL_OUTPUT(ETH2_50MHZ_CLK, "eth2-50mhz", 50000000UL),
>> +       CLK_PLL_OUTPUT(ETH_25MHZ_CLK, "eth-25mhz", 25000000UL),
>> +};
>> +
>> +static int ipq_cmn_pll_config(struct device *dev, unsigned long parent_rate)
>> +{
>> +       void __iomem *base;
>> +       u32 val;
>> +
>> +       base = devm_of_iomap(dev, dev->of_node, 0, NULL);
> 
> Use platform_device APIs please. This is a platform driver.

OK. Will update to use API devm_platform_ioremap_resource().

> 
>> +       if (IS_ERR(base))
>> +               return PTR_ERR(base);
>> +
>> +       val = readl(base + CMN_PLL_REFCLK_CONFIG);
>> +       val &= ~(CMN_PLL_REFCLK_EXTERNAL | CMN_PLL_REFCLK_INDEX);
>> +
>> +       /*
>> +        * Configure the reference input clock selection as per the given rate.
>> +        * The output clock rates are always of fixed value.
>> +        */
>> +       switch (parent_rate) {
>> +       case 25000000:
>> +               val |= FIELD_PREP(CMN_PLL_REFCLK_INDEX, 3);
>> +               break;
>> +       case 31250000:
>> +               val |= FIELD_PREP(CMN_PLL_REFCLK_INDEX, 4);
>> +               break;
>> +       case 40000000:
>> +               val |= FIELD_PREP(CMN_PLL_REFCLK_INDEX, 6);
>> +               break;
>> +       case 48000000:
>> +               val |= FIELD_PREP(CMN_PLL_REFCLK_INDEX, 7);
>> +               break;
>> +       case 50000000:
>> +               val |= FIELD_PREP(CMN_PLL_REFCLK_INDEX, 8);
>> +               break;
>> +       case 96000000:
>> +               val |= FIELD_PREP(CMN_PLL_REFCLK_INDEX, 7);
>> +               val &= ~CMN_PLL_REFCLK_DIV;
>> +               val |= FIELD_PREP(CMN_PLL_REFCLK_DIV, 2);
>> +               break;
>> +       default:
>> +               return -EINVAL;
>> +       }
> 
> Why isn't this done with struct clk_ops::set_rate() or clk_ops::init()?

OK, I will move this code into the clk_ops::init().

> 
>> +
>> +       writel(val, base + CMN_PLL_REFCLK_CONFIG);
>> +
>> +       /* Update the source clock rate selection. Only 96 MHZ uses 0. */
>> +       val = readl(base + CMN_PLL_REFCLK_SRC_SELECTION);
>> +       val &= ~CMN_PLL_REFCLK_SRC_DIV;
>> +       if (parent_rate != 96000000)
>> +               val |= FIELD_PREP(CMN_PLL_REFCLK_SRC_DIV, 1);
>> +
>> +       writel(val, base + CMN_PLL_REFCLK_SRC_SELECTION);
>> +
>> +       /* Enable PLL locked detect. */
>> +       val = readl(base + CMN_PLL_CTRL);
>> +       val |= CMN_PLL_CTRL_LOCK_DETECT_EN;
>> +       writel(val, base + CMN_PLL_CTRL);
>> +
>> +       /*
>> +        * Reset the CMN PLL block to ensure the updated configurations
>> +        * take effect.
>> +        */
>> +       val = readl(base + CMN_PLL_POWER_ON_AND_RESET);
>> +       val &= ~CMN_ANA_EN_SW_RSTN;
>> +       writel(val, base + CMN_PLL_POWER_ON_AND_RESET);
>> +       usleep_range(1000, 1200);
>> +
>> +       val |= CMN_ANA_EN_SW_RSTN;
>> +       writel(val, base + CMN_PLL_POWER_ON_AND_RESET);
>> +
>> +       /* Stability check of CMN PLL output clocks. */
>> +       return readl_poll_timeout(base + CMN_PLL_LOCKED, val,
>> +                                 (val & CMN_PLL_CLKS_LOCKED),
>> +                                 100, 100000);
>> +}
>> +
>> +static int ipq_cmn_pll_clk_register(struct device *dev, const char *parent)
> 
> Please don't use string names to describe topology.


OK, I will update to use an instance of 'struct clk_parent_data' to
describe the parent clock. This will be part of clk_hw instance that we
will define now, to represent the PLL clock and its ops (such as .init)
along with the parent.

> 
>> +{
>> +       const struct cmn_pll_fixed_output_clk *fixed_clk;
>> +       struct clk_hw_onecell_data *data;
>> +       unsigned int num_clks;
>> +       struct clk_hw *hw;
>> +     
>> +
>> +       num_clks = ARRAY_SIZE(ipq9574_output_clks);
>> +       fixed_clk = ipq9574_output_clks;
>> +
>> +       data = devm_kzalloc(dev, struct_size(data, hws, num_clks), GFP_KERNEL);
>> +       if (!data)
>> +               return -ENOMEM;
>> +
>> +       for (i = 0; i < num_clks; i++) {
>> +               hw = devm_clk_hw_register_fixed_rate(dev, fixed_clk[i].name,
>> +                                                    parent, 0,
>> +                                                    fixed_clk[i].rate);
>> +               if (IS_ERR(hw))
>> +                       return PTR_ERR(hw);
>> +
>> +               data->hws[fixed_clk[i].id] = hw;
>> +       }
>> +       data->num = num_clks;
>> +
>> +       return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, data);
>> +}
>> +
>> +static int ipq_cmn_pll_clk_probe(struct platform_device *pdev)
>> +{
>> +       struct device *dev = &pdev->dev;
>> +       struct clk *clk;
>> +       int ret;
>> +
>> +       /*
>> +        * To access the CMN PLL registers, the GCC AHB & SYSY clocks
>> +        * for CMN PLL block need to be enabled.
>> +        */
>> +       clk = devm_clk_get_enabled(dev, "ahb");
>> +       if (IS_ERR(clk))
>> +               return dev_err_probe(dev, PTR_ERR(clk),
>> +                                    "Enable AHB clock failed\n");
>> +
>> +       clk = devm_clk_get_enabled(dev, "sys");
>> +       if (IS_ERR(clk))
>> +               return dev_err_probe(dev, PTR_ERR(clk),
>> +                                    "Enable SYS clock failed\n");
> 
> Usually qcom clk drivers do this with pm_clk_add() and runtime PM. Why
> can't that be done here?

Yes, the pm_clk_add() can be used to manage clocks, I will udpate to use
the PM framework. Thanks for the suggestion.

> 
>> +
>> +       clk = devm_clk_get(dev, "ref");
>> +       if (IS_ERR(clk))
>> +               return dev_err_probe(dev, PTR_ERR(clk),
>> +                                    "Get reference clock failed\n");
> 
> We don't want clk providers to be clk consumers. Presumably this is the
> PLL's parent clk, and so the frequency should be passed to the clk_ops
> via the parent rate.

Yes, this is the PLL's parent clock. OK, I will remove this code and 
update to use clk_parent_data to describe this parent clock.

> 
>> +
>> +       /* Configure CMN PLL to apply the reference clock. */
>> +       ret = ipq_cmn_pll_config(dev, clk_get_rate(clk));
>> +       if (ret)
>> +               return dev_err_probe(dev, ret, "Configure CMN PLL failed\n");
>> +
>> +       return ipq_cmn_pll_clk_register(dev, __clk_get_name(clk));
>> +}
>> +
>> +static const struct of_device_id ipq_cmn_pll_clk_ids[] = {
>> +       { .compatible = "qcom,ipq9574-cmn-pll", },
>> +       { }
>> +};
> 
> module device table?
> 
I will add the MODULE_DEVICE_TABLE.


