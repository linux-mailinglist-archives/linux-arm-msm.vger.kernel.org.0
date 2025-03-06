Return-Path: <linux-arm-msm+bounces-50500-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91EF1A54A8F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 13:22:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AED127A0499
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 12:21:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82AB620ADEE;
	Thu,  6 Mar 2025 12:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WF3Z+R9l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E769C1624C7
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Mar 2025 12:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741263763; cv=none; b=N/Fu0HgWsKWL074dmoXh+IL1ltWdjsOOD52q+Ttd0nsgtW50FxuXhyfFvRYXf/BCbpisjJ0F7dTHyK3nHES/MTdAC4A/nMMuOuJL3DJujbssSS/jSj4mPY4XSyZOTFRisOioRFCFkJaeVhvlXQVp2Wdg1Hvoe5vM6b/p9Ll4j0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741263763; c=relaxed/simple;
	bh=IYwcKZ9klDpKqc3WNYt4WS/F7VHj1QpFPAqLoaQc6DY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KDhT/xf36IBHc8vu6hMNBiVm/lq6H6QeZ/S25lvHdv4J/yfM3XV5awViDukXl4r1VX1wvwN0SXPxmo1lMO45w/QlyDRvj1zjyT1176MgTQpCy9KksVCPdHZdWjJX3lopMsVM9c4yG2n5h4qLb9GRwhgD4Uvx1T11BpcjZpORF6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WF3Z+R9l; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5266s7G6030826
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Mar 2025 12:22:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z5Gq4UTjbsFKwuk0lyvFU281mi+Wp78KDLHWxM5Eb88=; b=WF3Z+R9lVIJeH3b5
	PSJ9sfrXXS1Y2MH5IbpWq22g6QQ+gJpqHAKT5b/0wfzcbMVjLtUGGPDkRW+XjYlV
	xq1PEHBl2HfnCyF/g2X8y/j78xS8mD9BeXgCD6wFWi55XcZOwW6k5XZ7B9OWNxI9
	tN8SGOmyqKE2JUV+/YP8Maz8916C+AprTRFTAQq58Lp/3Lnc3XdW3tuFQ4IpqZTd
	TR6Uxvlb7xDucyLttyyWb/R7YLa6LhirkJOGUCqGE9kIUlBOBR7XRe+8KjtQ5vMM
	sS2i7k0W7yVxS0vvn4k+PUBgyxys5yxcBdUneXj7By/pjVDa8n9lPBMa9sgyGav/
	uIBmvw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 456uy0ap2v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Mar 2025 12:22:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c3c58f9c72so6366685a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Mar 2025 04:22:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741263759; x=1741868559;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z5Gq4UTjbsFKwuk0lyvFU281mi+Wp78KDLHWxM5Eb88=;
        b=d1OImhbUb+RdKCe3yAEQT5/mqxgxdlGDNCjW3AQoQi/jqYweUtxHSKaBLyGt4kEmgz
         sosTY/r/rMKp+8YU8nv/JGAbSShBrNbkkbpRsA+LlTJscipsVC51OpGYnRCEJ5uI0gRO
         l0q1z++OJYNZh0lBfv7Bg7ClGnWDy399/GANAUxYEt20O510f5FTF1X0Mp2UArVB5p7q
         ap8A0WdBJ0rHtbVTzWmFeAiL6wxs90dsIY4TW73Ym1qtnpWr51cDIw7WKJUS0BY3QzXA
         LrfQmM9blP/gPo9PnzuO/IYbV/3G4jKgFoIctjLgvDIYhJDer+FlOjN91YPT16M3a1gs
         YF8g==
X-Forwarded-Encrypted: i=1; AJvYcCVcBjMffBV8WLaWL0zJb+RC+co33Wb7OleKyZg/pYZSfa3stBvnM881Oy0kAuP3kaNtlvw5uDLKKAOyZC2J@vger.kernel.org
X-Gm-Message-State: AOJu0YzNwFB/J9BRDOyhOnjXijiQLLIVlp/EOTFApum/xQ/xp+5lKncX
	lpF8MHnH+zg70Bg6U5lO8a6H1Ho7YVovrWR+FcRGvi+i/XK93V1LGkNgkU7o9AcmJicYXHIhXBe
	tjmKq83oFG35yw2+jo7F1w5Xpmq+Iea3nh6aHod9oJV5DYNllEgUDEtZoQJ8DZGCk
X-Gm-Gg: ASbGncvSsK+KDw5kBrqTYVHc7aMz+yhyV4xr3+vOVqd9qbPnfmdDEUQlksLnPu59Obo
	bUgfLUrl6X7iT+kViyyZslpivWXgkXVtr7W0AsZnsa0l+uhR3vOd9AGMFKcxTQSTU9M3aa2w6vg
	nP6SwbakihWgBr4ryLMjpzKfhExFuyHDLtNcFJciH1n+8MUdzOu/hO3Qj42DjljTTRAYhGeGU6I
	iiJBWrlSRJOXw7Y00TzDv39N8BA9/0xeHqhGBqZY11eVqEiwPvfLCJGJzB7fd0IO5vhd+WUoCwY
	yG5D0lyDjxCeE/TvIX74nC65TuemLeFFap00xHMnw1TOAxFg4fM3WKfe7rlatSFc0FcE1w==
X-Received: by 2002:a05:6214:624:b0:6e6:5cad:6080 with SMTP id 6a1803df08f44-6e8e6dab467mr34449746d6.10.1741263759558;
        Thu, 06 Mar 2025 04:22:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG/QTh0Ug1a5mDs5OMzwOybRslK0jLL6FOkoHx+QI3mLk6kOxx2Z10MrUe5swv+Xyw15xDHmA==
X-Received: by 2002:a05:6214:624:b0:6e6:5cad:6080 with SMTP id 6a1803df08f44-6e8e6dab467mr34449586d6.10.1741263759099;
        Thu, 06 Mar 2025 04:22:39 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac239516eb5sm87810466b.84.2025.03.06.04.22.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Mar 2025 04:22:38 -0800 (PST)
Message-ID: <91561f37-5309-45f1-a1d7-20228ba68c2e@oss.qualcomm.com>
Date: Thu, 6 Mar 2025 13:22:35 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] clk: qcom: common: Add support to configure PLL
To: Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250306-videocc-pll-multi-pd-voting-v2-0-0cd00612bc0e@quicinc.com>
 <20250306-videocc-pll-multi-pd-voting-v2-2-0cd00612bc0e@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250306-videocc-pll-multi-pd-voting-v2-2-0cd00612bc0e@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Pq5pbxM3 c=1 sm=1 tr=0 ts=67c99390 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=AIv-xuq51RFgKBoQvIEA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: tHj1b3Gn8pUrvG_gimednXDBu1ALXJSK
X-Proofpoint-GUID: tHj1b3Gn8pUrvG_gimednXDBu1ALXJSK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-06_05,2025-03-06_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 mlxscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0
 mlxlogscore=986 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503060093

On 6.03.2025 9:55 AM, Jagadeesh Kona wrote:
> From: Taniya Das <quic_tdas@quicinc.com>
> 
> Integrate PLL configuration into clk_alpha_pll structure and add support
> for qcom_cc_clk_alpha_pll_configure() function which can be used to
> configure the clock controller PLLs from common core code.
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---

[...]

> +static void qcom_cc_clk_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap)
> +{
> +	if (!pll->config || !pll->regs)
> +		return;

This should probably throw some sort of a warning

> +
> +	switch (GET_PLL_TYPE(pll)) {
> +	case CLK_ALPHA_PLL_TYPE_LUCID_OLE:
> +		clk_lucid_ole_pll_configure(pll, regmap, pll->config);
> +		break;
> +	case CLK_ALPHA_PLL_TYPE_LUCID_EVO:
> +		clk_lucid_evo_pll_configure(pll, regmap, pll->config);
> +		break;
> +	case CLK_ALPHA_PLL_TYPE_TAYCAN_ELU:
> +		clk_taycan_elu_pll_configure(pll, regmap, pll->config);
> +		break;
> +	case CLK_ALPHA_PLL_TYPE_RIVIAN_EVO:
> +		clk_rivian_evo_pll_configure(pll, regmap, pll->config);
> +		break;
> +	case CLK_ALPHA_PLL_TYPE_TRION:
> +		clk_trion_pll_configure(pll, regmap, pll->config);
> +		break;
> +	case CLK_ALPHA_PLL_TYPE_HUAYRA_2290:
> +		clk_huayra_2290_pll_configure(pll, regmap, pll->config);
> +		break;
> +	case CLK_ALPHA_PLL_TYPE_FABIA:
> +		clk_fabia_pll_configure(pll, regmap, pll->config);
> +		break;
> +	case CLK_ALPHA_PLL_TYPE_AGERA:
> +		clk_agera_pll_configure(pll, regmap, pll->config);
> +		break;
> +	case CLK_ALPHA_PLL_TYPE_PONGO_ELU:
> +		clk_pongo_elu_pll_configure(pll, regmap, pll->config);
> +		break;
> +	case CLK_ALPHA_PLL_TYPE_ZONDA:
> +	case CLK_ALPHA_PLL_TYPE_ZONDA_OLE:
> +		clk_zonda_pll_configure(pll, regmap, pll->config);
> +		break;
> +	case CLK_ALPHA_PLL_TYPE_STROMER:
> +	case CLK_ALPHA_PLL_TYPE_STROMER_PLUS:
> +		clk_stromer_pll_configure(pll, regmap, pll->config);
> +		break;
> +	case CLK_ALPHA_PLL_TYPE_DEFAULT:
> +	case CLK_ALPHA_PLL_TYPE_DEFAULT_EVO:
> +	case CLK_ALPHA_PLL_TYPE_HUAYRA:
> +	case CLK_ALPHA_PLL_TYPE_HUAYRA_APSS:
> +	case CLK_ALPHA_PLL_TYPE_BRAMMO:
> +	case CLK_ALPHA_PLL_TYPE_BRAMMO_EVO:
> +		clk_alpha_pll_configure(pll, regmap, pll->config);
> +		break;
> +	default:
> +		break;

And so should the 'default' case

Konrad

