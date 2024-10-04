Return-Path: <linux-arm-msm+bounces-33076-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C2898FE37
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 09:57:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B248828214E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 07:57:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F50E13A884;
	Fri,  4 Oct 2024 07:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="n2eppVIG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F9B2209F;
	Fri,  4 Oct 2024 07:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728028603; cv=none; b=WgYu1DAQZndzOJKwi6vMjHmNXHrwdPefkIQf2oNay1V7ovZLPWD4bD3Zo9evmHugQwPAsuG6nk+CJ2Tlhi/f3m2g3ZWsfDT+iYpDrC0VgZSNlfcFVRU4g+K5Gh+37Rt1EmdJEvHZ/kQEMYIXgP/KcpdBtPvh6R/u5c+dJe/ZmB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728028603; c=relaxed/simple;
	bh=PcPze1/DJEdMFElqqHRyHunjej/ZOfjziPx+ZnegZao=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=pYTxuA2MgespPNZldcrYKKD1oJyHFBUWmFNL/YZO6l43eIVxZebeci2JOCP77yOpCCT7DtPltdqtc10CcRA4tMTsz14eqjssNwuj047VTAQOqRAffpB4olzQhiPq3inm2XqguTImga8CzyfKtOioD0ETPKPfU5f0aOLmFZ5t6kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=n2eppVIG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 493HxcGC032546;
	Fri, 4 Oct 2024 07:56:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KsvgYx+KH7zUUV1MmVWgTxZABnioJlH3TTYH+TOCfiY=; b=n2eppVIGVR2qxATJ
	rH/W0zfMh9Sr1o+ChyFm6o+NtLOImoWNh9/o8QKfAT7QL6PRM75BjLiLY/WoJ4mv
	Pbu8T5MQ99Ll7KumLmhrzAQZf2irjuO4BDYLPjAqo4A0vXaTPzZexFS5g7H+Fr7U
	plVRw5sjG7ieHtj3W1IPvcz02GOT2ln8Svuh9XCfWwqYS3AXfSMToEUiJE1AxBVR
	ejdi92FsG4ZkhutIYNSEA+VoQ8ODBsOS1vUu/QuZHEr7r4PHbC/zv5Z9EHCt7k5j
	J0V/miQdj6gUEG7BxjaB8CMyjscDeEy02fXxQuKAr4QvyK637Ib8QjC9n/j1BHvE
	7eAxzQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42205f1dj2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Oct 2024 07:56:05 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4947u4Vg026453
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 4 Oct 2024 07:56:04 GMT
Received: from [10.50.18.17] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 4 Oct 2024
 00:55:56 -0700
Message-ID: <29b84acf-2c57-4b0e-81f0-82eb6c1e5b18@quicinc.com>
Date: Fri, 4 Oct 2024 13:25:52 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 5/7] clk: qcom: Add NSS clock Controller driver for
 IPQ9574
To: Devi Priya <quic_devipriy@quicinc.com>, Andrew Lunn <andrew@lunn.ch>
CC: <andersson@kernel.org>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <konrad.dybcio@linaro.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>, <p.zabel@pengutronix.de>,
        <richardcochran@gmail.com>, <geert+renesas@glider.be>,
        <dmitry.baryshkov@linaro.org>, <neil.armstrong@linaro.org>,
        <arnd@arndb.de>, <m.szyprowski@samsung.com>, <nfraprado@collabora.com>,
        <u-kumar1@ti.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <netdev@vger.kernel.org>
References: <20240625070536.3043630-1-quic_devipriy@quicinc.com>
 <20240625070536.3043630-6-quic_devipriy@quicinc.com>
 <f9d3f263-8559-4357-a1c6-8d4b5fa20b8c@lunn.ch>
 <302298ef-7827-49e1-8b0f-04467cb38ad7@quicinc.com>
Content-Language: en-US
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
In-Reply-To: <302298ef-7827-49e1-8b0f-04467cb38ad7@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Z9D4SyW2vd3ZpZXfwb_X7_BFgizJUutd
X-Proofpoint-ORIG-GUID: Z9D4SyW2vd3ZpZXfwb_X7_BFgizJUutd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 mlxlogscore=838 priorityscore=1501 phishscore=0 bulkscore=0
 impostorscore=0 clxscore=1011 lowpriorityscore=0 spamscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410040056



On 6/26/2024 8:09 PM, Devi Priya wrote:
> 
> 
> On 6/25/2024 8:09 PM, Andrew Lunn wrote:
>>> +static struct clk_alpha_pll ubi32_pll_main = {
>>> +    .offset = 0x28000,
>>> +    .regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_NSS_HUAYRA],
>>> +    .flags = SUPPORTS_DYNAMIC_UPDATE,
>>> +    .clkr = {
>>> +        .hw.init = &(const struct clk_init_data) {
>>> +            .name = "ubi32_pll_main",
>>> +            .parent_data = &(const struct clk_parent_data) {
>>> +                .index = DT_XO,
>>> +            },
>>> +            .num_parents = 1,
>>> +            .ops = &clk_alpha_pll_huayra_ops,
>>> +        },
>>> +    },
>>> +};
>>> +
>>> +static struct clk_alpha_pll_postdiv ubi32_pll = {
>>> +    .offset = 0x28000,
>>> +    .regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_NSS_HUAYRA],
>>> +    .width = 2,
>>> +    .clkr.hw.init = &(const struct clk_init_data) {
>>> +        .name = "ubi32_pll",
>>> +        .parent_hws = (const struct clk_hw *[]) {
>>> +            &ubi32_pll_main.clkr.hw
>>> +        },
>>> +        .num_parents = 1,
>>> +        .ops = &clk_alpha_pll_postdiv_ro_ops,
>>> +        .flags = CLK_SET_RATE_PARENT,
>>> +    },
>>> +};
>>
>> Can these structures be made const? You have quite a few different
>> structures in this driver, some of which are const, and some which are
>> not.
>>
> Sure, will check and update this in V6
> 
> Thanks,
> Devi Priya
>>     Andrew
>>

Hi Andrew,

Sorry for the delayed response.

The ubi32_pll_main structure should be passed to clk_alpha_pll_configure() API to configure UBI32 PLL. clk_alpha_pll_configure() API expects a non-const structure. Declaring it as const will result in the following compilation warning

drivers/clk/qcom/nsscc-ipq9574.c:3067:26: warning: passing argument 1 of ‘clk_alpha_pll_configure’ discards ‘const’ qualifier from pointer target type [-Wdiscarded-qualifiers]
  clk_alpha_pll_configure(&ubi32_pll_main, regmap, &ubi32_pll_config);
                          ^
In file included from drivers/clk/qcom/nsscc-ipq9574.c:22:0:
drivers/clk/qcom/clk-alpha-pll.h:200:6: note: expected ‘struct clk_alpha_pll *’ but argument is of type ‘const struct clk_alpha_pll *’
 void clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
      ^~~~~~~~~~~~~~~~~~~~~~~

The ubi32_pll is the source for nss_cc_ubi0_clk_src, nss_cc_ubi1_clk_src, nss_cc_ubi2_clk_src, nss_cc_ubi3_clk_src. Therefore, to register ubi32_pll with clock framework, it should be assigned to UBI32_PLL index of nss_cc_ipq9574_clocks array. This assignment will result in the following compilation warning if the ubi32_pll structure is declared as const.

drivers/clk/qcom/nsscc-ipq9574.c:2893:16: warning: initialization discards ‘const’ qualifier from pointer target type [-Wdiscarded-qualifiers]
  [UBI32_PLL] = &ubi32_pll.clkr,

Thanks & Regards,
Manikanta.

