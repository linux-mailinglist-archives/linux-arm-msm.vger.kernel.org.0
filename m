Return-Path: <linux-arm-msm+bounces-29837-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4499A9631D5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 22:34:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B80861F2353B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 20:34:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F24CD1AC45C;
	Wed, 28 Aug 2024 20:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UdL90oNI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2654C15A858;
	Wed, 28 Aug 2024 20:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724877260; cv=none; b=czxVUuBQYkgLrYKg7v/H7Nmv9IYrGZxZjyIk5Ry94fcJZnJTxTuhsA8cZMZN8vH9KrBZdy+xV0+NHFVf4JZUuXIrbk+M3VTEUyvTqTNPCC6OglypeHKs4KHaLyfEY6jDo0oTT9fGRGVYrleDq7UNCjXMfzSUMobPV8RtQWbROH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724877260; c=relaxed/simple;
	bh=xWuzS15Et4pIxbQMc3gaaFLmr10xRY0Ggkub1fGc23E=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=gZrwdGPBFm0RA3QeIfb96bIeiGBOFp75oi4NbGKQeWVGSJVTEr4lVJLgHkVX5m9Wgv8dC3S3b1zjIZqbHItv8lfycp78ShkJUngDqxFMRwcR/LuFWX3VHz9isWHJ1vyWtmx6QKXVvNlxqMi8fIxN+GSVk/lD8iUj4CG8Ysd2LHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UdL90oNI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47SJMJPJ023938;
	Wed, 28 Aug 2024 20:34:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rhURoGek6+GJnpL5hk0AQJDITL/Iy/R/SKiX544AF6w=; b=UdL90oNIalcP3LcZ
	mTgK9AqmluqXj8RyPNaQ3kw2VN08e1413c+rkA2lC3bfkDw97CPwy6vZKssW/JE8
	P5qNaPtMOzW9Bf521VWvDSj6mhRzN2YYZA+YPyLw2SzfEiocoQm2q816u/6mJPs8
	IkHGIh6Y8/aaopvsoIyBelcJ1ZvLOB1tB5782jR6ZiNkX7vaj6oHQT/1pc3dzIld
	oeKw4u7iADu3BvOzg3R/OCVg4MJQXyHVKVP+M0mxQlPrzE21K3TR5Nlkg4CLv+Am
	STYO3GCmtIiWFIFYJA9/gMNsIvaTAFKUkSOfYSQ3i4MN4qimmo2F50xlaNzD8rih
	wfyrFg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419puuk1ww-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 20:34:00 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47SKXw2u010815
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 20:33:58 GMT
Received: from [10.71.111.76] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 28 Aug
 2024 13:33:57 -0700
Message-ID: <1c7fb593-9080-43fc-bcb4-3028acb2abbb@quicinc.com>
Date: Wed, 28 Aug 2024 13:33:56 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/11] drm/msm/dsi: correct programming sequence for
 SM8350 / SM8450
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Stephen
 Boyd" <sboyd@kernel.org>, Jonathan Marek <jonathan@marek.ca>,
        Robert Foss
	<rfoss@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "Georgi
 Djakov" <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Mike
 Tipton" <quic_mdtipton@quicinc.com>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-pm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20240804-sm8350-fixes-v1-0-1149dd8399fe@linaro.org>
 <20240804-sm8350-fixes-v1-3-1149dd8399fe@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240804-sm8350-fixes-v1-3-1149dd8399fe@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: _Ks5JYXY_IzZVNOhk_Bbov6sPIYt7Lpu
X-Proofpoint-GUID: _Ks5JYXY_IzZVNOhk_Bbov6sPIYt7Lpu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-28_08,2024-08-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 clxscore=1011 impostorscore=0 phishscore=0 adultscore=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=999
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408280148



On 8/3/2024 10:40 PM, Dmitry Baryshkov wrote:
> According to the display-drivers, 5nm DSI PLL (v4.2, v4.3) have
> different boundaries for pll_clock_inverters programming. Follow the
> vendor code and use correct values.
> 
> Fixes: 2f9ae4e395ed ("drm/msm/dsi: add support for DSI-PHY on SM8350 and SM8450")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 12 +++++++++++-
>   1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> index 3b59137ca674..031446c87dae 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> @@ -135,7 +135,7 @@ static void dsi_pll_calc_dec_frac(struct dsi_pll_7nm *pll, struct dsi_pll_config
>   			config->pll_clock_inverters = 0x00;
>   		else
>   			config->pll_clock_inverters = 0x40;
> -	} else {
> +	} else if (pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_1) {
>   		if (pll_freq <= 1000000000ULL)
>   			config->pll_clock_inverters = 0xa0;
>   		else if (pll_freq <= 2500000000ULL)
> @@ -144,6 +144,16 @@ static void dsi_pll_calc_dec_frac(struct dsi_pll_7nm *pll, struct dsi_pll_config
>   			config->pll_clock_inverters = 0x00;
>   		else
>   			config->pll_clock_inverters = 0x40;
> +	} else {
> +		/* 4.2, 4.3 */
> +		if (pll_freq <= 1000000000ULL)
> +			config->pll_clock_inverters = 0xa0;
> +		else if (pll_freq <= 2500000000ULL)
> +			config->pll_clock_inverters = 0x20;
> +		else if (pll_freq <= 3500000000ULL)
> +			config->pll_clock_inverters = 0x00;
> +		else
> +			config->pll_clock_inverters = 0x40;
>   	}


Sorry for the delay, my request for the docs was first rejected for some 
reason :)

Now I finally got access and this matches the docs

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

