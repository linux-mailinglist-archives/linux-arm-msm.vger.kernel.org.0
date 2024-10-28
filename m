Return-Path: <linux-arm-msm+bounces-36098-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D1F9B23CE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 05:22:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B16361F21D4B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 04:22:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57D006BFCA;
	Mon, 28 Oct 2024 04:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="o70QrjYu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64BB2A59;
	Mon, 28 Oct 2024 04:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730089322; cv=none; b=gR2HgkvcwqzVsX2S/lKApcgkren9cXgOWEEnANM49tWXzVrz9aRIvLsIKVaKtztDknQsgdZ8Kv3wxrxAHYiGaWxNw8MZ6pp+5TNUek6joBTUBclvUGrC75E6EnroTvCzWz+B3+aYDS7VDQatqJGjvUwYR48BzLc/fYUAvmDlMFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730089322; c=relaxed/simple;
	bh=Gb9VxBwE2IQzYmezxiBoZEB5EkgE2GtJJeAYtvdrkO8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=H1SCKw6kyu1vK5OvjwSUp0cEZf37CQ3wD+kKjsIADw/oWT/nL2vpeqOuB6N32XR9Tql9X/L3OTqw8gRTPgYBHfUNVRi9mMPipaqi8R7Qpq+MjU2dt3sy32WLdKIx4MADwKSpSepeFiQXJT2eOnap/vW+wlXiQ9AxYIp0QJwtCME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=o70QrjYu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49RNqfC1005093;
	Mon, 28 Oct 2024 04:21:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TwY9iJqYfL+Mr37Hf6tM9bnOvWU/aejxGVM4SDJh3Pg=; b=o70QrjYuwayksnvq
	yiFAhxdG1mGxYZ7ZdxtvDIgoODdzMSEeHx5xiMxwwkT2yTnSqY9ga78VU8BeTBQ5
	3wZC2BHeqCo58+ShEBRNdjvLTye6RIWYXHwzsOsvZ05I0BHl4cKlDEKgDZW4YUh3
	UZ0HpmUDQf9XuQwEYNqa/H0IxxTuMJ9CFIQl/gZcLNS5yuUpK0W4rvam8htI3cuL
	PwpNj/nLY+EojUDW4ZPV2ToS7cbv+qiHEtdZW6sq/rkEGNmXlNaK4Bb216l0KZ3w
	p/pQ91Hdn2yujBn/kTXqnv8gxngeSuQceXCdo18WKPoLXNKvKUBQdqgZqx4o3mWE
	d4JH3g==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42gsq8bj77-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Oct 2024 04:21:51 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49S4LoUO007326
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Oct 2024 04:21:50 GMT
Received: from [10.217.217.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 27 Oct
 2024 21:21:46 -0700
Message-ID: <3a2bc8c8-86d0-41e5-99f9-d111666661fc@quicinc.com>
Date: Mon, 28 Oct 2024 09:51:43 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/11] clk: qcom: rpmh: add support for SAR2130P
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
References: <20241027-sar2130p-clocks-v5-0-ecad2a1432ba@linaro.org>
 <20241027-sar2130p-clocks-v5-7-ecad2a1432ba@linaro.org>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <20241027-sar2130p-clocks-v5-7-ecad2a1432ba@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: X7ZcugReZNSVC0IH5smYe3cSrzMIuKoO
X-Proofpoint-ORIG-GUID: X7ZcugReZNSVC0IH5smYe3cSrzMIuKoO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 adultscore=0 mlxscore=0 priorityscore=1501 mlxlogscore=999 impostorscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410280035



On 10/27/2024 6:54 AM, Dmitry Baryshkov wrote:
>   drivers/clk/qcom/clk-rpmh.c | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
> index 4acde937114af3d7fdc15f3d125a72d42d0fde21..eefc322ce367989f625f1285dcccddbdd8341a12 100644
> --- a/drivers/clk/qcom/clk-rpmh.c
> +++ b/drivers/clk/qcom/clk-rpmh.c
> @@ -389,6 +389,18 @@ DEFINE_CLK_RPMH_BCM(ipa, "IP0");
>   DEFINE_CLK_RPMH_BCM(pka, "PKA0");
>   DEFINE_CLK_RPMH_BCM(qpic_clk, "QP0");
>   
> +static struct clk_hw *sar2130p_rpmh_clocks[] = {
> +	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div1.hw,
> +	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div1_ao.hw,
> +	[RPMH_RF_CLK1]		= &clk_rpmh_rf_clk1_a.hw,
> +	[RPMH_RF_CLK1_A]	= &clk_rpmh_rf_clk1_a_ao.hw,
> +};

Reviewed-by: Taniya Das <quic_tdas@quicinc.com>

-- 
Thanks & Regards,
Taniya Das.

