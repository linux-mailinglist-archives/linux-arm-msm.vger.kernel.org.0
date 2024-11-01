Return-Path: <linux-arm-msm+bounces-36678-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA859B8B28
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 07:18:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 757E51F211B9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 06:18:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D75A14D70B;
	Fri,  1 Nov 2024 06:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Mi9I2jGb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50985146D45;
	Fri,  1 Nov 2024 06:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730441885; cv=none; b=TRjRFHwqpmCW96h7zzVv6CPvZ9QtodsPbrNE5e1Cu52d3pjUHtZq2swrDo0H8bEQpCmPUuEqQcRiCg8h7Zna9U06fAIdCVhLLMzIYzLbPhkdUL5rq1OKehuoHLcREw+epiD6yZaUycTHrrvk9LoOBzju5tZdVqwcHz2BZ/PoCHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730441885; c=relaxed/simple;
	bh=l6g5e9IciazcIpxwuVf5LaKrwnc5lEyyT3ddDc3ZLy0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=Elv6bqwxMvjkmknk3FIw9t5NU8iMVfaL1RWqqV/FEDsh3ZjS/hc5nUzWDRSsFu1swKnKykvL0A9fsS8IfEfawiM80znfD33yOYkKV6MgzoyB0T+uUBiykwoqDfJQLmd5N8Qht4f2my2mTue+QoGTfkXKz9Rx4OtmTF0STl5QgJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Mi9I2jGb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49VHYDLr004630;
	Fri, 1 Nov 2024 06:17:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gll94+6mMEzTk7uGPOBY7+YU+gYDr4sxQm3Zl/uAFCc=; b=Mi9I2jGbYEUcZq79
	3O0H6SvhVeppMA9C+GMVUlDu2Vswk3LcwjtDcSkp1IPkmI0LRh9B/F79Q6Pqmn1/
	qNoT1A3gaSlfv+2QvXIsmp+6nWsK18tOC9N84XjUo3yUXefTe9meAtY4WnStixy5
	Og9s4/fD/oGqyjjxQRDJ0228C8hOQNBxjB8+Hy1ugoSO8swKwPNd81lWindCO2DG
	9wuIi1Q2KMKYYZz9Lr9I1ahbCSInzh8nsuqHmETK+17vb1aMygen/ThwIt3guQ9S
	vJm9Y+Jpjq80xnKLg+BXbRyW52aRNE3funPk6vhTQ7UqXh9EX7RY8NusHz29uNuv
	xwhjuQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42m65pb7kd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Nov 2024 06:17:12 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A16HBqU024896
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 1 Nov 2024 06:17:11 GMT
Received: from [10.216.44.28] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 31 Oct
 2024 23:17:05 -0700
Message-ID: <59fa420c-411c-4b17-9a5f-36d5726254ea@quicinc.com>
Date: Fri, 1 Nov 2024 11:47:02 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/12] clk: qcom: camcc-qcs615: Add QCS615 camera clock
 controller driver
From: Taniya Das <quic_tdas@quicinc.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Stephen
 Boyd" <sboyd@kernel.org>,
        Abhishek Sahu <absahu@codeaurora.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon
	<will@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        "Stephen Boyd" <sboyd@codeaurora.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20241019-qcs615-mm-clockcontroller-v1-0-9f1ca2048287@quicinc.com>
 <20241019-qcs615-mm-clockcontroller-v1-4-9f1ca2048287@quicinc.com>
 <752f6195-335f-453d-b449-898b0a924126@linaro.org>
 <2237dc0b-23cf-4909-9948-96e7bbbf9cd1@quicinc.com>
Content-Language: en-US
In-Reply-To: <2237dc0b-23cf-4909-9948-96e7bbbf9cd1@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: PHCvSKqJUWhwDZencxiZjDPOL58H52km
X-Proofpoint-GUID: PHCvSKqJUWhwDZencxiZjDPOL58H52km
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 phishscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 mlxlogscore=999 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411010043



On 10/21/2024 1:48 PM, Taniya Das wrote:
> 
> 
> On 10/19/2024 6:23 AM, Bryan O'Donoghue wrote:
>> On 18/10/2024 20:12, Taniya Das wrote:
>>> Add support for the camera clock controller for camera clients to
>>> be able to request for camcc clocks on QCS615 platform.
>>>
>>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>>> ---
>>>   drivers/clk/qcom/Kconfig        |   10 +
>>>   drivers/clk/qcom/Makefile       |    1 +
>>>   drivers/clk/qcom/camcc-qcs615.c | 1588 
>>> +++++++++++++++++++++++++++++++++++++++
>>>   3 files changed, 1599 insertions(+)
>>>
>>> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
>>> index 
>>> 30eb8236c9d80071a87e0332cfac7b667a08824a..bdb1c672dd90d96814b214afd234341e37e3c470 100644
>>> --- a/drivers/clk/qcom/Kconfig
>>> +++ b/drivers/clk/qcom/Kconfig
>>> @@ -460,6 +460,16 @@ config QCM_DISPCC_2290
>>>         Say Y if you want to support display devices and 
>>> functionality such as
>>>         splash screen.
>>> +config QCS_CAMCC_615
>>> +    tristate "QCS615 Camera Clock Controller"
>>> +    depends on ARM64 || COMPILE_TEST
>>> +    select QCS_GCC_615
>>> +    help
>>> +      Support for the camera clock controller on Qualcomm 
>>> Technologies, Inc
>>> +      QCS615 devices.
>>> +      Say Y if you want to support camera devices and functionality 
>>> such as
>>> +      capturing pictures.
>>> +
>>>   config QCS_GCC_404
>>>       tristate "QCS404 Global Clock Controller"
>>>       help
>>> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
>>> index 
>>> 2b378667a63ff6eca843d7bef638a5422d35c3d3..f69c1bc13d3eca1859d9e849399e55175df869c3 100644
>>> --- a/drivers/clk/qcom/Makefile
>>> +++ b/drivers/clk/qcom/Makefile
>>> @@ -69,6 +69,7 @@ obj-$(CONFIG_QCOM_CLK_RPMH) += clk-rpmh.o
>>>   obj-$(CONFIG_QCOM_CLK_SMD_RPM) += clk-smd-rpm.o
>>>   obj-$(CONFIG_QCM_GCC_2290) += gcc-qcm2290.o
>>>   obj-$(CONFIG_QCM_DISPCC_2290) += dispcc-qcm2290.o
>>> +obj-$(CONFIG_QCS_CAMCC_615) += camcc-qcs615.o
>>>   obj-$(CONFIG_QCS_GCC_404) += gcc-qcs404.o
>>>   obj-$(CONFIG_QCS_Q6SSTOP_404) += q6sstop-qcs404.o
>>>   obj-$(CONFIG_QCS_TURING_404) += turingcc-qcs404.o
>>> diff --git a/drivers/clk/qcom/camcc-qcs615.c 
>>> b/drivers/clk/qcom/camcc-qcs615.c
>>> new file mode 100644
>>> index 
>>> 0000000000000000000000000000000000000000..2341ddb57598eaaa7fa35300ae6635ff40da99ae
>>> --- /dev/null
>>> +++ b/drivers/clk/qcom/camcc-qcs615.c
>>> @@ -0,0 +1,1588 @@
>>> +// SPDX-License-Identifier: GPL-2.0-only
>>> +/*
>>> + * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights 
>>> reserved.
>>> + */
>>> +
>>> +#include <linux/clk-provider.h>
>>> +#include <linux/module.h>
>>> +#include <linux/mod_devicetable.h>
>>> +#include <linux/of.h>
>>> +#include <linux/platform_device.h>
>>> +#include <linux/regmap.h>
>>> +
>>> +#include <dt-bindings/clock/qcom,qcs615-camcc.h>
>>> +
>>> +#include "clk-alpha-pll.h"
>>> +#include "clk-branch.h"
>>> +#include "clk-pll.h"
>>> +#include "clk-rcg.h"
>>> +#include "clk-regmap.h"
>>> +#include "clk-regmap-divider.h"
>>> +#include "clk-regmap-mux.h"
>>> +#include "common.h"
>>> +#include "gdsc.h"
>>> +#include "reset.h"
>>> +
>>> +enum {
>>> +    DT_BI_TCXO,
>>> +    DT_BI_TCXO_AO,
>>> +};
>>> +
>>> +enum {
>>> +    P_BI_TCXO,
>>> +    P_CAM_CC_PLL0_OUT_AUX,
>>> +    P_CAM_CC_PLL1_OUT_AUX,
>>> +    P_CAM_CC_PLL2_OUT_AUX2,
>>> +    P_CAM_CC_PLL2_OUT_EARLY,
>>> +    P_CAM_CC_PLL3_OUT_MAIN,
>>> +};
>>> +
>>> +static const struct pll_vco brammo_vco[] = {
>>> +    { 500000000, 1250000000, 0 },
>>> +};
>>> +
>>> +static const struct pll_vco spark_vco[] = {
>>> +    { 1000000000, 2100000000, 0 },
>>> +    { 750000000, 1500000000, 1 },
>>> +    { 500000000, 1000000000, 2 },
>>> +    { 300000000, 500000000, 3 },
>>> +    { 550000000, 1100000000, 4 },
>>> +};
>>> +
>>> +/* 600MHz configuration */
>>> +static const struct alpha_pll_config cam_cc_pll0_config = {
>>> +    .l = 0x1f,
>>> +    .alpha_hi = 0x40,
>>> +    .alpha_en_mask = BIT(24),
>>> +    .vco_val = 0x2 << 20,
>>> +    .vco_mask = 0x3 << 20,
>>> +    .aux_output_mask = BIT(1),
>>> +    .config_ctl_val = 0x4001055b,
>>> +    .test_ctl_hi_val = 0x1,
>>> +    .test_ctl_hi_mask = 0x1,
>>> +};
>>> +
>>> +static struct clk_alpha_pll cam_cc_pll0 = {
>>> +    .offset = 0x0,
>>> +    .vco_table = spark_vco,
>>> +    .num_vco = ARRAY_SIZE(spark_vco),
>>> +    .regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
>>> +    .clkr = {
>>> +        .hw.init = &(const struct clk_init_data) {
>>> +            .name = "cam_cc_pll0",
>>> +            .parent_data = &(const struct clk_parent_data) {
>>> +                .index = DT_BI_TCXO,
>>> +            },
>>> +            .num_parents = 1,
>>> +            .ops = &clk_alpha_pll_ops,
>>> +        },
>>> +    },
>>> +};
>>> +
>>> +/* 808MHz configuration */
>>> +static struct alpha_pll_config cam_cc_pll1_config = {
>>> +    .l = 0x2A,
>>> +    .alpha_hi = 0x15,
>>> +    .alpha = 0x55555555,
>>> +    .alpha_en_mask = BIT(24),
>>> +    .vco_val = 0x2 << 20,
>>> +    .vco_mask = 0x3 << 20,
>>> +    .aux_output_mask = BIT(1),
>>> +    .config_ctl_val = 0x4001055b,
>>> +    .test_ctl_hi_val = 0x1,
>>> +    .test_ctl_hi_mask = 0x1,
>>> +};
>>> +
>>> +static struct clk_alpha_pll cam_cc_pll1 = {
>>> +    .offset = 0x1000,
>>> +    .vco_table = spark_vco,
>>> +    .num_vco = ARRAY_SIZE(spark_vco),
>>> +    .regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
>>> +    .clkr = {
>>> +        .hw.init = &(const struct clk_init_data) {
>>> +            .name = "cam_cc_pll1",
>>> +            .parent_data = &(const struct clk_parent_data) {
>>> +                .index = DT_BI_TCXO,
>>> +            },
>>> +            .num_parents = 1,
>>> +            .ops = &clk_alpha_pll_ops,
>>> +        },
>>> +    },
>>> +};
>>> +
>>> +/* 960MHz configuration */
>>> +static struct alpha_pll_config cam_cc_pll2_config = {
>>> +    .l = 0x32,
>>> +    .vco_val = 0x0 << 20,
>>
>> zero shifted any direction is still zero
>>
>> zed.c
>>
>> #include <stdio.h>
>> #include <stdint.h>
>>
>> int main(int argc, char *argv[])
>> {
>>      uint32_t a = 0, b = 0 << 20;
>>
>>      printf("a = %d b = %d\n", a, b);
>>
>>      return 0;
>> }
>>
>> gcc -o zed zed.c
>>
>> a = 0 b = 0
>>

Correct, but this is generated. Will fix in the next patch.

>>> +static struct gdsc bps_gdsc = {
>>> +    .gdscr = 0x6004,
>>> +    .en_rest_wait_val = 0x2,
>>> +    .en_few_wait_val = 0x2,
>>> +    .clk_dis_wait_val = 0xf,
>>> +    .pd = {
>>> +        .name = "bps_gdsc",
>>> +    },
>>> +    .pwrsts = PWRSTS_OFF_ON,
>>> +    .flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR,
>>> +};
>>> +
>>> +static struct gdsc ife_0_gdsc = {
>>> +    .gdscr = 0x9004,
>>> +    .en_rest_wait_val = 0x2,
>>> +    .en_few_wait_val = 0x2,
>>> +    .clk_dis_wait_val = 0xf,
>>> +    .pd = {
>>> +        .name = "ife_0_gdsc",
>>> +    },
>>> +    .pwrsts = PWRSTS_OFF_ON,
>>> +    .flags = POLL_CFG_GDSCR,
>>> +};
>>> +
>>> +static struct gdsc ife_1_gdsc = {
>>> +    .gdscr = 0xa004,
>>> +    .en_rest_wait_val = 0x2,
>>> +    .en_few_wait_val = 0x2,
>>> +    .clk_dis_wait_val = 0xf,
>>> +    .pd = {
>>> +        .name = "ife_1_gdsc",
>>> +    },
>>> +    .pwrsts = PWRSTS_OFF_ON,
>>> +    .flags = POLL_CFG_GDSCR,
>>> +};
>>
>> Shouldn't these have RETAIN flags ?
>>

No supported on this target.


>>> +
>>> +static struct gdsc ipe_0_gdsc = {
>>> +    .gdscr = 0x7004,
>>> +    .en_rest_wait_val = 0x2,
>>> +    .en_few_wait_val = 0x2,
>>> +    .clk_dis_wait_val = 0xf,
>>> +    .pd = {
>>> +        .name = "ipe_0_gdsc",
>>> +    },
>>> +    .pwrsts = PWRSTS_OFF_ON,
>>> +    .flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
>>> +};
>>
>> I'd say those flags are very aspirational suggest POLL_CFG_GDSCR | 
>> RETAIN_FF_ENABLE.
>>
>>

It does not hurt if we keep HW_CTRL_TRIGGER, but will remove.

>>> +
>>> +static struct gdsc titan_top_gdsc = {
>>> +    .gdscr = 0xb134,
>>> +    .en_rest_wait_val = 0x2,
>>> +    .en_few_wait_val = 0x2,
>>> +    .clk_dis_wait_val = 0xf,
>>> +    .pd = {
>>> +        .name = "titan_top_gdsc",
>>> +    },
>>> +    .pwrsts = PWRSTS_OFF_ON,
>>> +    .flags = POLL_CFG_GDSCR,
>>> +};
>>>
>>
>> As Dmitry queried, TOP_GDSC should almost certainly be the parent of 
>> the IFE/IPE/BPS and others.
>>
Sure, will fix.

>>> +static int cam_cc_qcs615_probe(struct platform_device *pdev)
>>> +{
>>> +    struct regmap *regmap;
>>> +
>>> +    regmap = qcom_cc_map(pdev, &cam_cc_qcs615_desc);
>>> +    if (IS_ERR(regmap))
>>> +        return PTR_ERR(regmap);
>>> +
>>> +    clk_alpha_pll_configure(&cam_cc_pll0, regmap, &cam_cc_pll0_config);
>>> +    clk_alpha_pll_configure(&cam_cc_pll1, regmap, &cam_cc_pll1_config);
>>> +    clk_alpha_pll_configure(&cam_cc_pll2, regmap, &cam_cc_pll2_config);
>>> +    clk_alpha_pll_configure(&cam_cc_pll3, regmap, &cam_cc_pll3_config);
>>
>> Got to be missing something like
>>
>>          /* Keep some clocks always-on */
>>          qcom_branch_set_clk_en(regmap, 0xc1e4); /* CAMCC_GDSC_CLK */
>>
There is no GSDSC clock on QCS615.

>> If the GDSC gets declocked everything beneath it - including the stuff 
>> in RETAIN goes away...
>>
>> Smells wrong.
>>
>> ---
>> bod
> 
> Please help review: 
> https://patchwork.kernel.org/project/linux-clk/cover/20241019-qcs615-mm-clockcontroller-v1-0-4cfb96d779ae@quicinc.com/
> 

-- 
Thanks & Regards,
Taniya Das.

