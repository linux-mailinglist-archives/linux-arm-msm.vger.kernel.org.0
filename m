Return-Path: <linux-arm-msm+bounces-33627-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8EC99610D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 09:39:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A0E431F21BE9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 07:39:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 390D51836D9;
	Wed,  9 Oct 2024 07:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UvGCK6JN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86BD317C9AC;
	Wed,  9 Oct 2024 07:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728459584; cv=none; b=bU3c2kmOhA1Q2X6gdpNeW0pqRJdSBQAX6lU193frKcqExwSAtB7Y7po/f2z/1onRImKCyrA1UTwjqLI+S0j1zemZhykndHPL/F1JBrueXfMMr9NH+eJYY8t9IfwhSk55Pu+aJ4dDOPjhiJH8IUfmqadKefqsoij9WouqcCabhUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728459584; c=relaxed/simple;
	bh=6PaDfXoWc/HTm136YP4q0hs7G381DWsPmXce/fI5q+E=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Bkr7JUTtEq5Ca4HlhsGyAvfmx/kjxt+/+sg7BzeMkHWkMKcjzqhu/b+h7qddB6//XHUEMbaaPSmfGzOxkiLjwzoXrAhkCh4aCh6sFl0F3FOY4rnmHiD6m/RwYTKWbzvK8aqqkYufB8oa12v2u2dVTvRDKxBvkO9tVd/nIVJfffQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UvGCK6JN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 498M5t16001966;
	Wed, 9 Oct 2024 07:39:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fv3iZ5Uu+D39jsZVd6LvHYdz6uQiG9tR+WyBRpStrMQ=; b=UvGCK6JNZxe5msZQ
	efr6HFX0QWwoiHZKlkm+10Oh1mLC3rWa3RpzSABd+qMSwmbw6+6yNDi9aN+sIdkE
	58YimPU+p26Yr/yvKFXi21jGbCMZKp/QFPcg1EJShoqCN0K3EKUvZ5yl4PmXv9tM
	cQavj2WIeH+ZAFEFACW32byIcnHd0rbgaLvi+p4AliimrO2/7FACo+hAzm+/cbjU
	yy3nzIIyW/Avgrab/tXWylG2iFsOTjTYCEM/uTOgPywHq5ZO82JlQpiDqe5J/s4E
	OZgP23LcoEVfF1A6nJYODQjnq6BxuF9K7uhLLCFvmjBC/6l+0NGCwmNqP7ZSkwsz
	hNjvSg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4252wstyy1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Oct 2024 07:39:14 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4997dDGg004395
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 9 Oct 2024 07:39:13 GMT
Received: from [10.152.195.140] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 9 Oct 2024
 00:39:05 -0700
Message-ID: <9d563da2-ab59-4625-8e14-ab81b3e0b05f@quicinc.com>
Date: Wed, 9 Oct 2024 13:09:02 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 5/7] clk: qcom: Add NSS clock Controller driver for
 IPQ9574
To: Andrew Lunn <andrew@lunn.ch>
CC: Devi Priya <quic_devipriy@quicinc.com>, <andersson@kernel.org>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <konrad.dybcio@linaro.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>, <p.zabel@pengutronix.de>,
        <richardcochran@gmail.com>, <geert+renesas@glider.be>,
        <dmitry.baryshkov@linaro.org>, <neil.armstrong@linaro.org>,
        <arnd@arndb.de>, <m.szyprowski@samsung.com>, <nfraprado@collabora.com>,
        <u-kumar1@ti.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <netdev@vger.kernel.org>, <konraddybico@kernel.org>
References: <20240625070536.3043630-1-quic_devipriy@quicinc.com>
 <20240625070536.3043630-6-quic_devipriy@quicinc.com>
 <f9d3f263-8559-4357-a1c6-8d4b5fa20b8c@lunn.ch>
 <302298ef-7827-49e1-8b0f-04467cb38ad7@quicinc.com>
 <29b84acf-2c57-4b0e-81f0-82eb6c1e5b18@quicinc.com>
 <6a431336-621d-4284-a0ca-b68921de22eb@lunn.ch>
Content-Language: en-US
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
In-Reply-To: <6a431336-621d-4284-a0ca-b68921de22eb@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: cqT_g6PNxlp25E3JB__5L73T2J4SCaHl
X-Proofpoint-GUID: cqT_g6PNxlp25E3JB__5L73T2J4SCaHl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 spamscore=0 mlxscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410090049



On 10/4/2024 7:32 PM, Andrew Lunn wrote:
> On Fri, Oct 04, 2024 at 01:25:52PM +0530, Manikanta Mylavarapu wrote:
>>
>>
>> On 6/26/2024 8:09 PM, Devi Priya wrote:
>>>
>>>
>>> On 6/25/2024 8:09 PM, Andrew Lunn wrote:
>>>>> +static struct clk_alpha_pll ubi32_pll_main = {
>>>>> +    .offset = 0x28000,
>>>>> +    .regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_NSS_HUAYRA],
>>>>> +    .flags = SUPPORTS_DYNAMIC_UPDATE,
>>>>> +    .clkr = {
>>>>> +        .hw.init = &(const struct clk_init_data) {
>>>>> +            .name = "ubi32_pll_main",
>>>>> +            .parent_data = &(const struct clk_parent_data) {
>>>>> +                .index = DT_XO,
>>>>> +            },
>>>>> +            .num_parents = 1,
>>>>> +            .ops = &clk_alpha_pll_huayra_ops,
>>>>> +        },
>>>>> +    },
>>>>> +};
>>>>> +
>>>>> +static struct clk_alpha_pll_postdiv ubi32_pll = {
>>>>> +    .offset = 0x28000,
>>>>> +    .regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_NSS_HUAYRA],
>>>>> +    .width = 2,
>>>>> +    .clkr.hw.init = &(const struct clk_init_data) {
>>>>> +        .name = "ubi32_pll",
>>>>> +        .parent_hws = (const struct clk_hw *[]) {
>>>>> +            &ubi32_pll_main.clkr.hw
>>>>> +        },
>>>>> +        .num_parents = 1,
>>>>> +        .ops = &clk_alpha_pll_postdiv_ro_ops,
>>>>> +        .flags = CLK_SET_RATE_PARENT,
>>>>> +    },
>>>>> +};
>>>>
>>>> Can these structures be made const? You have quite a few different
>>>> structures in this driver, some of which are const, and some which are
>>>> not.
>>>>
>>> Sure, will check and update this in V6
>>>
>>> Thanks,
>>> Devi Priya
>>>>     Andrew
>>>>
>>
>> Hi Andrew,
>>
>> Sorry for the delayed response.
>>
>> The ubi32_pll_main structure should be passed to clk_alpha_pll_configure() API to configure UBI32 PLL. clk_alpha_pll_configure() API expects a non-const structure. Declaring it as const will result in the following compilation warning
>>
>> drivers/clk/qcom/nsscc-ipq9574.c:3067:26: warning: passing argument 1 of ‘clk_alpha_pll_configure’ discards ‘const’ qualifier from pointer target type [-Wdiscarded-qualifiers]
>>   clk_alpha_pll_configure(&ubi32_pll_main, regmap, &ubi32_pll_config);
>>                           ^
>> In file included from drivers/clk/qcom/nsscc-ipq9574.c:22:0:
>> drivers/clk/qcom/clk-alpha-pll.h:200:6: note: expected ‘struct clk_alpha_pll *’ but argument is of type ‘const struct clk_alpha_pll *’
>>  void clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
>>       ^~~~~~~~~~~~~~~~~~~~~~~
> 
> As far as i can see, clk_alpha_pll_configure() does not modify pll.
> 
> https://elixir.bootlin.com/linux/v6.12-rc1/source/drivers/clk/qcom/clk-alpha-pll.c#L391
> 
> So you can add a const there as well.
> 

It appears that multiple targets are invoking clk_alpha_pll_configure().
I will make changes in a separate series after this.

>> The ubi32_pll is the source for nss_cc_ubi0_clk_src, nss_cc_ubi1_clk_src, nss_cc_ubi2_clk_src, nss_cc_ubi3_clk_src. Therefore, to register ubi32_pll with clock framework, it should be assigned to UBI32_PLL index of nss_cc_ipq9574_clocks array. This assignment will result in the following compilation warning if the ubi32_pll structure is declared as const.
>>
>> drivers/clk/qcom/nsscc-ipq9574.c:2893:16: warning: initialization discards ‘const’ qualifier from pointer target type [-Wdiscarded-qualifiers]
>>   [UBI32_PLL] = &ubi32_pll.clkr,
> 
> Which suggests you are missing a const somewhere else.
> 
> Getting these structures const correct has a few benefits. It makes
> you code smaller, since at the moment at load time it needs to copy
> these structures in to the BSS so they are writable, rather than
> keeping them in the .rodata segment. Also, by making them const, you
> avoid a few security issues, they cannot be overwritten, the MMU will
> protect them. The compiler can also make some optimisations, since it
> knows the values cannot change.
> 
> Now, it could be getting this all const correct needs lots of patches,
> because it has knock-on effects in other places. If so, then don't
> bother. But if it is simple to do, please spend a little time to get
> this right.
> 
> 	Andrew

We can make these structures const. However, it will require exhaustive changes. Below is the rationale.

To declare the ubi32_pll and ubi32_pll_main (since it is also passed to nss_cc_ipq9574_clocks[] array) structures as const,
the 'clks' member of 'struct qcom_cc_desc' needs to be const.

The following compilation errors are observed after making the 'clks' member of 'struct qcom_cc_desc' as const:
drivers/clk/qcom/common.c: In function ‘qcom_cc_icc_register’:
drivers/clk/qcom/common.c:274:7: warning: assignment discards ‘const’ qualifier from pointer target type [-Wdiscarded-qualifiers]
hws = &desc->clks[desc->icc_hws[i].clk_id]->hw;
       ^

drivers/clk/qcom/common.c: In function ‘qcom_cc_really_probe’:
drivers/clk/qcom/common.c:294:30: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
struct clk_regmap **rclks = desc->clks;
                              ^~~~

The common.c code is designed in such a way that the 'clks' member needs to be assigned to non-const variables/pointers.

We need to update common.c and the drivers that utilize 'struct qcom_cc_desc'.
I will make changes in a separate series after this.

Thanks & Regards,
Manikanta.


