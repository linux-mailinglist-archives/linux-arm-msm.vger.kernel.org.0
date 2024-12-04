Return-Path: <linux-arm-msm+bounces-40346-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EED99E43D4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 19:55:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 74113BE42AA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 18:04:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EC6D207DF6;
	Wed,  4 Dec 2024 17:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="V+CixEyr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE67206F3C;
	Wed,  4 Dec 2024 17:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733334605; cv=none; b=SAvRUu+wxpBESDog3A/2dXHlHl88qzuKls2Q6GVRL4Fxjv+IdPvX0wU2VclZlGJ1WiRkUWf6lZdJRUsSnTVbSvjbtzHlP/LnpuojCNPyC/xAmEwdXYNAO95eBSFjJX2u45lUWN5IS6NU1dcwABeToWKVpC8KQBAh0zuqdCtaUfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733334605; c=relaxed/simple;
	bh=opmGdehnxln2nQW1oGD8VtWYJxzY95xTjOSYrBeQQVI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=tIjV2Ho8KCKEA99pdUmblbfORclzZFmzr0bzMRe+d8pdr87PWFF9TPNfafT7xw+lhXyac72UUY01SeBi9/2j69BAW5hzkTiIAOCjPF10MUBzJi5Hbb/29QmqzzJiz60YZkUGcmnLaN3R1XMdCewVSegHRZRFYbPwiIvW5u/pqzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=V+CixEyr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B4EYRvw020496;
	Wed, 4 Dec 2024 17:49:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uVyJPQ3V2aziLhjmvXLA9/9uqX/uOZt5e+r48GBUVns=; b=V+CixEyrIxrWE8E8
	rafj9nXfIh3qRNQOONvc+E1+qLWusbyAhhaovl7QGK1r3+v5VWeuWa1sWNwdZ7rp
	MLZG18/XVYFq4sonGtggVYAld+4RBr/hU9gPFn3Rtp8INWmIS7DjIjNpnDWHJeZW
	HAbZwkIBOWruMl/lSyKX9yBzcTA/CTbD7pEgNvXIvaiGC8qzEodoFtH6jCmHYKJi
	xt0LbjH9mLcfOVhn6VW0aMDAqHRh6opC2HzvHKjv81RaJtqOYXrWM97oWRqZCLPQ
	XRqzMtihRA3Wlhvkdh1ZDLIFDzMCA6W2irLu4+GHrie9MspW/1AhrlgiOpbouqhc
	MIGA8Q==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43a3exbygn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Dec 2024 17:49:58 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B4HnvKb008376
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Dec 2024 17:49:57 GMT
Received: from [10.216.58.11] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 4 Dec 2024
 09:49:53 -0800
Message-ID: <a260a2a7-5cb3-468c-b73e-ef83f021278c@quicinc.com>
Date: Wed, 4 Dec 2024 23:19:50 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] clk: qcom: dispcc-sm8750: Add SM8750 Display clock
 controller
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Stephen Boyd
	<sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Michael
 Turquette <mturquette@baylibre.com>,
        Neil Armstrong
	<neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241128-sm8750-dispcc-v1-0-120705a4015c@linaro.org>
 <20241128-sm8750-dispcc-v1-3-120705a4015c@linaro.org>
 <5f05f2305f37bd40bf92299c04480fbf.sboyd@kernel.org>
 <ef6f9bd0-c24b-4964-9228-bdab1221fff5@linaro.org>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <ef6f9bd0-c24b-4964-9228-bdab1221fff5@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: c8rQ7TiPKTtS53QXweTMtx1ZEJ-mxxIY
X-Proofpoint-GUID: c8rQ7TiPKTtS53QXweTMtx1ZEJ-mxxIY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412040135



On 12/4/2024 3:35 PM, Krzysztof Kozlowski wrote:
> On 03/12/2024 23:09, Stephen Boyd wrote:
>> Quoting Krzysztof Kozlowski (2024-11-28 07:08:01)
>>> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
>>> index 2ec9be21ff678e3343cccafa85801aa68805f440..d9ab42c625ddd61f9bf1857522d44d4547e42bf5 100644
>>> --- a/drivers/clk/qcom/Kconfig
>>> +++ b/drivers/clk/qcom/Kconfig
>>> @@ -1022,6 +1022,16 @@ config SM_DISPCC_8550
>>>            Say Y if you want to support display devices and functionality such as
>>>            splash screen.
>>>   
>>> +config SM_DISPCC_8750
>>> +       tristate "SM8750 Display Clock Controller"
>>> +       depends on ARM64 || COMPILE_TEST
>>
>> Please select QCOM_GDSC
> 
> Ack
> 
>>
>>> +       depends on SM_GCC_8750
>>
>> select? Or imply? It's a functional dependency, not a build time one.
> 
> ARM64 is as well functional dependency, ARCH_QCOM present in all other
> drivers as well. It is all the same. The point is to limit the config
> options available to users/distros when they do not need them. In this
> particular case: if user does not select main clock controller (GCC)
> then allowing to choose Display clock controller is pointless.
> 
>>
>>> +       help
>>> diff --git a/drivers/clk/qcom/dispcc-sm8750.c b/drivers/clk/qcom/dispcc-sm8750.c
>>> new file mode 100644
>>> index 0000000000000000000000000000000000000000..ff64ff93c4dbdd2aae22b55dd0e404544cc9373e
>>> --- /dev/null
>>> +++ b/drivers/clk/qcom/dispcc-sm8750.c
>>> @@ -0,0 +1,1960 @@
>>> +// SPDX-License-Identifier: GPL-2.0-only
>>> +/*
>>> + * Copyright (c) 2021, The Linux Foundation. All rights reserved.
>>> + * Copyright (c) 2023-2024, Linaro Ltd.
>>> + */
>>> +
>>> +#include <linux/clk.h>
>>
>> Is this include used?
> 
> Not used, copy pasta from older driver. I'll clean it up.
> 
>>
>>> +#include <linux/clk-provider.h>
>>> +#include <linux/err.h>
>>> +#include <linux/kernel.h>
>>> +#include <linux/module.h>
>>> +#include <linux/of.h>
>>> +#include <linux/platform_device.h>
>>> +#include <linux/regmap.h>
>>> +#include <linux/pm_runtime.h>
>>> +
>>> +#include <dt-bindings/clock/qcom,sm8750-dispcc.h>
>>> +
>>> +#include "common.h"
>>> +#include "clk-alpha-pll.h"
>>> +#include "clk-branch.h"
>>> +#include "clk-pll.h"
>>> +#include "clk-rcg.h"
>>> +#include "clk-regmap.h"
>>> +#include "clk-regmap-divider.h"
>>> +#include "clk-regmap-mux.h"
>>> +#include "reset.h"
>>> +#include "gdsc.h"
>> [...]
>>> +};
>>> +
>>> +static struct clk_rcg2 disp_cc_mdss_mdp_clk_src = {
>>> +       .cmd_rcgr = 0x8150,
>>> +       .mnd_width = 0,
>>> +       .hid_width = 5,
>>> +       .parent_map = disp_cc_parent_map_9,
>>> +       .freq_tbl = ftbl_disp_cc_mdss_mdp_clk_src,
>>> +       .clkr.hw.init = &(const struct clk_init_data) {
>>> +               .name = "disp_cc_mdss_mdp_clk_src",
>>> +               .parent_data = disp_cc_parent_data_9,
>>> +               .num_parents = ARRAY_SIZE(disp_cc_parent_data_9),
>>> +               .flags = CLK_SET_RATE_PARENT,
>>> +               .ops = &clk_rcg2_shared_ops, /* TODO: switch to cesta managed clocks */
>>
>> What is cesta?
> 
> Cesta is a new hardware block which receives votes from consumers and
> then manages groups of clocks. We do not have drivers for it, so I am
> not sure how this here will work out.
> 
> I will grow the explanation in comment.
> 

Clocks can work without cesta block as well.

>>
>>> +       },
>>> +};
>>> +
>>> +static struct clk_rcg2 disp_cc_mdss_pclk0_clk_src = {
>>> +       .cmd_rcgr = 0x8108,
>>> +       .mnd_width = 8,
>>> +       .hid_width = 5,
>>> +       .parent_map = disp_cc_parent_map_1,
>>> +       .freq_tbl = ftbl_disp_cc_esync0_clk_src,
>>> +       .clkr.hw.init = &(const struct clk_init_data) {
>>> +               .name = "disp_cc_mdss_pclk0_clk_src",
>>> +               .parent_data = disp_cc_parent_data_1,
>>> +               .num_parents = ARRAY_SIZE(disp_cc_parent_data_1),
>>> +               .flags = CLK_SET_RATE_PARENT,
>>> +               .ops = &clk_pixel_ops,
>>> +       },
>> [...]
>>> +               .enable_reg = 0x80b4,
>>> +               .enable_mask = BIT(0),
>>> +               .hw.init = &(const struct clk_init_data) {
>>> +                       .name = "disp_cc_osc_clk",
>>> +                       .parent_hws = (const struct clk_hw*[]) {
>>> +                               &disp_cc_osc_clk_src.clkr.hw,
>>> +                       },
>>> +                       .num_parents = 1,
>>> +                       .flags = CLK_SET_RATE_PARENT,
>>> +                       .ops = &clk_branch2_ops,
>>> +               },
>>> +       },
>>> +};
>>> +
>>> +static struct gdsc mdss_gdsc = {
>>> +       .gdscr = 0x9000,
>>> +       .en_rest_wait_val = 0x2,
>>> +       .en_few_wait_val = 0x2,
>>> +       .clk_dis_wait_val = 0xf,
>>> +       .pd = {
>>> +               .name = "mdss_gdsc",
>>> +       },
>>> +       .pwrsts = PWRSTS_OFF_ON,
>>> +       .flags = POLL_CFG_GDSCR | HW_CTRL | RETAIN_FF_ENABLE,
>>> +       // TODO: no supply?
>>
>> What is this?
> 
> Development note. I will clean it up.
> 
> 
> 
> Best regards,
> Krzysztof
> 

-- 
Thanks & Regards,
Taniya Das.

