Return-Path: <linux-arm-msm+bounces-24306-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 10BCC91849C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 16:42:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 90B2C1F2B7B0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 14:42:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C8E718733B;
	Wed, 26 Jun 2024 14:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="U7c+bWoy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23DC91822C2;
	Wed, 26 Jun 2024 14:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719412806; cv=none; b=ezK2PxzzIsbBtsy7Be09YGPxtuk3DbAdhLN8glsXzX2qcI7RWcqS+fqnvozuenlwjrB6Zh8IBrlholkVdwmJw6yBZe6xrjDo+yNBsBJrrVojvpFU0Lt4yYzWF7paOKbm4HOftUU5brAROtV7cG6LPSxP8HqZEM7wvuuth4O0a7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719412806; c=relaxed/simple;
	bh=92WMn47/SMqWMi8oEovsuTgdSAt2Ee1dk4LqjGvPG1A=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=oi3CwLAJLudVfXdd1mx1b2UaaMw58sOH12E+ppBE2ilhamhxgyOfDoDV6nzmchbCDR4mcgnortc6wq/HDsioN5xizYkSnsA6RQvwRbAvRuxUXr8G62v7J/L8V2L/TB74aARWesLQDTcGv6XECU6Tw5XiKUy7c0ujxP9sT9nTSbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=U7c+bWoy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45QAfLv6010627;
	Wed, 26 Jun 2024 14:39:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7bd1WMpoeQPiMw7peuvDwQj9JkKYPUJrcCnSbue6gLw=; b=U7c+bWoyP53ycYa/
	GUOTl9ZWRvgnBe19TMHi4GGLZeN31ij9LLVDU+GyRW4EiztMmFkebg+K51tG4+Ya
	vhdYl9893gf6Pul81lXUcuuYjObOEDfOR88K6K7XIV9xjqhtZ26Ht/LU/lfwG+6o
	/G4ALYjYzxsS5UUTJxgaFfCk3hUjtntsPFIMUahafOx1BtPqLKraZfdJhBGLv0cF
	lbrMpHukzJdz+K5xgCqYpHRAJJ8Icq0NRSL8FQau1qr2oIhREKjjRAHuLslyikCM
	owUjRB28zV/6N8hYgbbHVnWMsi42Ky17oksQvt5Xu+fR0PR8RedHLJKYhB3xy0fC
	QCuTsQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 400bdq9juh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 14:39:35 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45QEdX4O020731
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 14:39:33 GMT
Received: from [10.50.52.175] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 26 Jun
 2024 07:39:24 -0700
Message-ID: <302298ef-7827-49e1-8b0f-04467cb38ad7@quicinc.com>
Date: Wed, 26 Jun 2024 20:09:15 +0530
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
Content-Language: en-US
From: Devi Priya <quic_devipriy@quicinc.com>
In-Reply-To: <f9d3f263-8559-4357-a1c6-8d4b5fa20b8c@lunn.ch>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: A22KNXbNeEJN8TyLa0AY4ccsaLyiPzaX
X-Proofpoint-GUID: A22KNXbNeEJN8TyLa0AY4ccsaLyiPzaX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-26_07,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxlogscore=841
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 mlxscore=0 suspectscore=0 priorityscore=1501 clxscore=1011 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2406260107



On 6/25/2024 8:09 PM, Andrew Lunn wrote:
>> +static struct clk_alpha_pll ubi32_pll_main = {
>> +	.offset = 0x28000,
>> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_NSS_HUAYRA],
>> +	.flags = SUPPORTS_DYNAMIC_UPDATE,
>> +	.clkr = {
>> +		.hw.init = &(const struct clk_init_data) {
>> +			.name = "ubi32_pll_main",
>> +			.parent_data = &(const struct clk_parent_data) {
>> +				.index = DT_XO,
>> +			},
>> +			.num_parents = 1,
>> +			.ops = &clk_alpha_pll_huayra_ops,
>> +		},
>> +	},
>> +};
>> +
>> +static struct clk_alpha_pll_postdiv ubi32_pll = {
>> +	.offset = 0x28000,
>> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_NSS_HUAYRA],
>> +	.width = 2,
>> +	.clkr.hw.init = &(const struct clk_init_data) {
>> +		.name = "ubi32_pll",
>> +		.parent_hws = (const struct clk_hw *[]) {
>> +			&ubi32_pll_main.clkr.hw
>> +		},
>> +		.num_parents = 1,
>> +		.ops = &clk_alpha_pll_postdiv_ro_ops,
>> +		.flags = CLK_SET_RATE_PARENT,
>> +	},
>> +};
> 
> Can these structures be made const? You have quite a few different
> structures in this driver, some of which are const, and some which are
> not.
> 
Sure, will check and update this in V6

Thanks,
Devi Priya
> 	Andrew
> 

