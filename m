Return-Path: <linux-arm-msm+bounces-35338-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E909A99E6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 08:34:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AF13E1C211E1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 06:34:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F86F13E03E;
	Tue, 22 Oct 2024 06:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="G4a3uFyk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C05126C02;
	Tue, 22 Oct 2024 06:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729578856; cv=none; b=JN44h0/yNEuXwLguiF5++5ocvFRgBw6Rl7wASTdzNDjqX6pxksCDZzCTy2CS7Vhkvxv57dvx6y9cwH/5Pv3KKATAR1sQXjfLF8+U0EMJoSQeZYGSn+pB0AVUJkCnBAzTcQat6CMSH1oMTjX1QWu7OrJF6I+MwEvwwqw4Jmdo97o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729578856; c=relaxed/simple;
	bh=X12O0VsD6wdBi+ISK5uttPjglQWVRYXH3QoyJQLENYg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=GfFSdphpQqik7OIBQs0i9LXhpYd45EZbeAjlVHgeINznSLKsu7pyNqT02WTjIw7ZXQTfkeb9L6GzeIoOtYH+1bSmL//q+U5qThV1i68c+OFrWMyNiSylyGjiwlTe0G5rssW3qqkr3L1vNf4onNrdx3StG0TBMPFQPsAmH/WBn3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=G4a3uFyk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49LFXCo3014299;
	Tue, 22 Oct 2024 06:34:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WY+FjqtZ1Q4id5zyi0t1qJcsu23Q4wWl/wKvbMwcsds=; b=G4a3uFykPBkM52fm
	A4oqsoxgRnQMrXr6WOP7FNq4vEZOSGI5IZQvE8ZGsP9DKWSCslxR+2ODYqXlKMaf
	RJHPwKc5wys5ufX/+FO+CCciWAEA69B96F3rVSqbUJcqRPp7vrE6QI4Omci5zebG
	xwT7dMDiKnkY3S92vUACsAMJYKe/tPv2VZ1Yr5iNvrpwtMZaYrlbMdRmXWSMPpxk
	sC0hJ1P7ggXnmdxDLjSPK46Cq22XjnqQ3iwY4IXWLGpWXCJLM2lLfAGhqHhCXLl0
	LKt1HyZNGq0IHJJ+jgrD9DXDJwCN5Vx5H5dDDm4VVdNolaqzZDqBJ00beti32pBb
	E6uNGA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42dkhd3bu0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Oct 2024 06:34:06 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49M6Y4Gb016111
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Oct 2024 06:34:04 GMT
Received: from [10.217.216.152] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 21 Oct
 2024 23:34:00 -0700
Message-ID: <73abe2b9-ad72-449f-b3e3-a96128cf75a4@quicinc.com>
Date: Tue, 22 Oct 2024 12:03:57 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/11] clk: qcom: rpmh: add support for SAR2130P
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen
 Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong
	<neil.armstrong@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad
 Dybcio <konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241021-sar2130p-clocks-v2-0-383e5eb123a2@linaro.org>
 <20241021-sar2130p-clocks-v2-7-383e5eb123a2@linaro.org>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <20241021-sar2130p-clocks-v2-7-383e5eb123a2@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: VO-xy0SQ6-ZNRM_uGFxNSFPLcrNlx5EK
X-Proofpoint-GUID: VO-xy0SQ6-ZNRM_uGFxNSFPLcrNlx5EK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 mlxscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410220041



On 10/21/2024 4:00 PM, Dmitry Baryshkov wrote:
> Define clocks as supported by the RPMh on the SAR2130P platform. It
> seems that on this platform RPMh models only CXO clock.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/clk/qcom/clk-rpmh.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
> index 4acde937114af3d7fdc15f3d125a72d42d0fde21..8cb15430d0171a8ed6b05e51d1901af63a4564c4 100644
> --- a/drivers/clk/qcom/clk-rpmh.c
> +++ b/drivers/clk/qcom/clk-rpmh.c
> @@ -389,6 +389,16 @@ DEFINE_CLK_RPMH_BCM(ipa, "IP0");
>   DEFINE_CLK_RPMH_BCM(pka, "PKA0");
>   DEFINE_CLK_RPMH_BCM(qpic_clk, "QP0");
>   
> +static struct clk_hw *sar2130p_rpmh_clocks[] = {
> +	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div1.hw,
> +	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div1_ao.hw,
> +};
> +

Dimtry, could you please add these clocks as well?

DEFINE_CLK_RPMH_VRM-- > rf_clk1, rf_clk1_ao, "clka1", 1
DEFINE_CLK_RPMH_VRM --> ln_bb_clk7, ln_bb_clk7_ao, "clka7", 2
DEFINE_CLK_RPMH_VRM --> ln_bb_clk8, ln_bb_clk8_ao, "clka8", 4
DEFINE_CLK_RPMH_VRM --> ln_bb_clk9, ln_bb_clk9_ao, "clka9", 2

> +static const struct clk_rpmh_desc clk_rpmh_sar2130p = {
> +	.clks = sar2130p_rpmh_clocks,
> +	.num_clks = ARRAY_SIZE(sar2130p_rpmh_clocks),
> +};
> +


-- 
Thanks & Regards,
Taniya Das.

