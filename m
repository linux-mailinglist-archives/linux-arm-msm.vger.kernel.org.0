Return-Path: <linux-arm-msm+bounces-34763-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC9B9A26F5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 17:38:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 233A71C21EAD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 15:38:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 000BF1DFE3E;
	Thu, 17 Oct 2024 15:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="c8fd8o63"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51C71DFE33;
	Thu, 17 Oct 2024 15:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729179372; cv=none; b=FesQfXeywjDAUbysZhSkobnHbmOi6mgC8L9FyC3KK2q8RskTpUVc9XkkMwdIK+56M0oA/poQ14kG8xF9GKslipgAvjJm8Wa2Dwhu6EJt5GOrS5oA3m6kN9aM+NP68EY6p6vfSJEOn7v0fouwqU7qFbeHz72OaoXp4FOTAuKzxlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729179372; c=relaxed/simple;
	bh=MoL2BX61frBg1VdRrANdxnXeaxeMVqlaCWMarCl5syY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=s7Tbi9WZsKVnHp9KaNg7cNYcWaaaBcXsJBbbiaSxZoZp/19vD3EFWHLhMB0b5O6jP4HMnAURsf6I9Qz9lmtzQPeE9H74iXbNKLQrk6oWuDrDQ813RJbRYVvfBqOZG0fCbCKIxR4bb723ER596EnOnSvGY5ZfLftGBc+XVjtwExg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=c8fd8o63; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49H7dxAk020310;
	Thu, 17 Oct 2024 15:35:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bmAWavHtstmW4PLZvXlIc7791cZXGxn3UWjX7aeA8Ak=; b=c8fd8o63An42cNmC
	6XtbTjOW3MK9/utJzCf1oOp9WG/5JpQRLZoZtZwu0j7236qwRM57bHkql5RAHWDH
	R8dX6RLVINt75uvzYkyf92jzwFJNMwffFMGIRcxfdxrkcWcaDlkOmJ/UO9Zhngrm
	/85j362n8yRRrKWmWq80LKweVxvPkV6XEXQxPWjK9/v5yvE/DrKTvTqQKKejhD7/
	71neqxp5pCH2z8jDu/YgTzbYU1zKsoCd/H0wYjZnUGeyrNdJR41W/EOMyf/6gBnK
	yHye2kZFQsbEcEHJMa41LcLekkke6t957UPmhy3aTiw7rUCkYBVTY5DeAtSUDyYg
	03IXtg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 429m0fgrea-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 15:35:55 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49HFZseN025178
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 15:35:54 GMT
Received: from [10.253.38.177] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 17 Oct
 2024 08:35:47 -0700
Message-ID: <daa8998b-a008-42cf-a941-00218683cce2@quicinc.com>
Date: Thu, 17 Oct 2024 23:35:43 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] clk: qcom: Add CMN PLL clock controller driver for
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
References: <20241015-qcom_ipq_cmnpll-v4-0-27817fbe3505@quicinc.com>
 <20241015-qcom_ipq_cmnpll-v4-2-27817fbe3505@quicinc.com>
 <77ad972276c165acc3d0e9d72df1a021.sboyd@kernel.org>
Content-Language: en-US
From: Jie Luo <quic_luoj@quicinc.com>
In-Reply-To: <77ad972276c165acc3d0e9d72df1a021.sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Oxzr5jPHNAtL0v01QfB632DFyBoCo8Fd
X-Proofpoint-ORIG-GUID: Oxzr5jPHNAtL0v01QfB632DFyBoCo8Fd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0
 spamscore=0 impostorscore=0 suspectscore=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410170107



On 10/17/2024 5:37 AM, Stephen Boyd wrote:
> Quoting Luo Jie (2024-10-15 07:16:52)
>> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
>> index 30eb8236c9d8..3def659fc5cb 100644
>> --- a/drivers/clk/qcom/Kconfig
>> +++ b/drivers/clk/qcom/Kconfig
>> @@ -190,6 +190,16 @@ config IPQ_APSS_6018
>>            Say Y if you want to support CPU frequency scaling on
>>            ipq based devices.
>>   
>> +config IPQ_CMN_PLL
>> +       tristate "IPQ CMN PLL Clock Controller"
>> +       depends on IPQ_GCC_9574
> 
> What is the build dependency?

Will remove this dependency. There is no build dependency on 
IPQ_GCC_9574, but only a functional dependency on the SoC's GCC block
since the CMNPLL consumes AHB/SYS clocks from the GCC.

> 
>> +       help
>> +         Support for CMN PLL clock controller on IPQ platform. The
>> +         CMN PLL feeds the reference clocks to the Ethernet devices
>> +         based on IPQ SoC.
>> +         Say Y or M if you want to support CMN PLL clock on the IPQ
>> +         based devices.
>> +
>>   config IPQ_GCC_4019
>>          tristate "IPQ4019 Global Clock Controller"
>>          help
>> diff --git a/drivers/clk/qcom/ipq-cmn-pll.c b/drivers/clk/qcom/ipq-cmn-pll.c
>> new file mode 100644
>> index 000000000000..f5ebc7d93ed8
>> --- /dev/null
>> +++ b/drivers/clk/qcom/ipq-cmn-pll.c
>> @@ -0,0 +1,411 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +/*
>> + * CMN PLL block expects the reference clock from on-board Wi-Fi block,
>> + * and supplies fixed rate clocks as output to the networking hardware
>> + * blocks and to GCC. The networking related blocks include PPE (packet
>> + * process engine), the externally connected PHY or switch devices, and
>> + * the PCS.
>> + *
>> + * On the IPQ9574 SoC, there are three clocks with 50 MHZ and one clock
>> + * with 25 MHZ which are output from the CMN PLL to Ethernet PHY (or switch),
>> + * and one clock with 353 MHZ to PPE. The other fixed rate output clocks
>> + * are supplied to GCC (24 MHZ as XO and 32 KHZ as sleep clock), and to PCS
>> + * with 31.25 MHZ.
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
>> + *          +----+----+----+---+-------------> eth-25mhz
>> + *               |    |    |
>> + *               V    V    V
>> + *              GCC  PCS  NSS/PPE
>> + */
>> +
>> +#include <linux/bitfield.h>
>> +#include <linux/clk-provider.h>
>> +#include <linux/clk.h>
>> +#include <linux/delay.h>
>> +#include <linux/err.h>
>> +#include <linux/io.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/of_address.h>
> 
> What is of_address.h for? Did you mean mod_devicetable.h?

I will replace of_address.h with mod_devicetable.h for 'of_device_id'
structure usage.

> 
>> +#include <linux/platform_device.h>
>> +#include <linux/pm_clock.h>
>> +#include <linux/pm_runtime.h>
>> +#include <linux/regmap.h>
>> +
>> +#include <dt-bindings/clock/qcom,ipq-cmn-pll.h>
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
> [...]
>> +
>> +/*
>> + * This function is used to initialize the CMN PLL to enable the fixed
>> + * rate output clocks. It is expected to be configured once.
>> + */
>> +static int clk_cmn_pll_determine_rate(struct clk_hw *hw,
>> +                                     struct clk_rate_request *req)
>> +{
>> +       struct clk_cmn_pll *cmn_pll = to_clk_cmn_pll(hw);
>> +       u32 val;
>> +       int ret;
>> +
>> +       /*
>> +        * Configure the reference input clock selection as per the given
>> +        * parent clock. The output clock rates are always of fixed value.
>> +        */
>> +       switch (req->best_parent_rate) {
>> +       case 25000000:
>> +               val = 3;
>> +               break;
>> +       case 31250000:
>> +               val = 4;
>> +               break;
>> +       case 40000000:
>> +               val = 6;
>> +               break;
>> +       case 50000000:
>> +               val = 8;
>> +               break;
>> +       case 48000000:
>> +       case 96000000:
>> +               /*
>> +                * Parent clock rate 48 MHZ and 96 MHZ take the same value
>> +                * of reference clock index. 96 MHZ needs the source clock
>> +                * divider to be programmed as 2.
>> +                */
>> +               val = 7;
>> +               break;
>> +       default:
>> +               return -EINVAL;
>> +       }
>> +
>> +       ret = regmap_update_bits(cmn_pll->regmap, CMN_PLL_REFCLK_CONFIG,
>> +                                CMN_PLL_REFCLK_INDEX,
>> +                                FIELD_PREP(CMN_PLL_REFCLK_INDEX, val));
> 
> The determine_rate() function shouldn't modify the hardware. This should
> be done in the set_rate() callback. Likely you'll need to use
> assigned-clock-rates to do that.

OK. I will move the hardware configuration code into clk_ops::set_rate().
We are using the DT property assigned-clock-rates-u64 to configure the
clock rate of CMN PLL to 12 GHZ since 64 bits are required.



