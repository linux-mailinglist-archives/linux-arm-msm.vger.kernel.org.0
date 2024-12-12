Return-Path: <linux-arm-msm+bounces-41820-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E439EFAEC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 19:30:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 281252891FD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 18:30:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BB22223328;
	Thu, 12 Dec 2024 18:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YUBY+IGe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F74E2210C2
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 18:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734028257; cv=none; b=ZULt0g7er0uLEstHLUA+eI3Z1tFnYJ1kY6uR54n33/WFkxTVGynnhg9LI0ibYUEFEHP3VQ0A2dZILc4gQhX6B4w5NI/MX+IhRZKGxzzd276pn9Keroq2BCcZgJsxohfBV7zprvu67lbcHuirpbZWia09w0HYhRHFZEI9CTY+c6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734028257; c=relaxed/simple;
	bh=LAImW8keKIcsYczLYvrP823eM09hnL8gURaaiPO6pkA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T52UfB3GyBgEGgVYr9t1eLyna1zUh+b2GSNd0zjq7V2XAiEbJ3KtncqMkxCjtrXpv0vMtj6i91tvv3O5b1AceE4tQi0b4IdJXi5rN7Cp1cCKm0I+GDpIv4mzsGJGCf2LDyUvwK59aoL6/gUWMO12kRRA5XQ6SdXjzlQwSOqLoZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YUBY+IGe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BCHYxib029034
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 18:30:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vZJ2HdatxlZ4xVf47i0ZPAbi74LzeVefsJXaq3wgFRc=; b=YUBY+IGec3ZLOvQ1
	G/SZkp/2D3R6MR/lDdlYxFypRBUZS52XJ6f+9fUTkYMPUiNTDGTXZVmPXXSj3YAc
	26M531FE2jJhkt5rizqmdPjW4MxL4ps/pseCVBfC9PZ/DpuN7kiAsn/FfgvLBStQ
	VGg9o8jnZEv0u2iEU/th9mBMH1sWniV5TFOLraIRtLn5aMYadzIB9V2jnYHUq/T7
	vo3mZHbRo8FNX5okey5ZtO54agIocUSy1ZskorpFdIyXBMpexeKnXHXakqUpgYt4
	1o4t6E3Src3plWSxGfJFdsDE1QcE/5m8BiPfh/UcjkpKQTnifeiVf4vuFQp2a9J/
	FqNuXA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43fd4xuwc9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 18:30:54 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-467922cf961so2592681cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 10:30:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734028253; x=1734633053;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vZJ2HdatxlZ4xVf47i0ZPAbi74LzeVefsJXaq3wgFRc=;
        b=KLKJo3oWZO/aG5Y/ntS848Ho+Cq289nvFziTurLd01Ood5rUda1FGYlPkpYdopIMqv
         YBidGbVlk26KnV0VO8rMLXyO7aXLZb6ltJuEkMYnzeNtgMXgDXK7pFqyGHM75I01lMKU
         FJRXCZNB7EVt+6Gb9FSL3iUM+Gm1LqerDdmk4++kd7xWl2aemNTHO74dPU6G5OyC3jIR
         3AY5u1ngWMNT9TxtU2v820VysF9fRCa9mSt5dKevVJ4JoHozjwKR/8Qndbp40wQLYAR2
         Z5V31eZi7vL7HVLm7I4cp4E09WIpZo05bJ2kRMWa4ZdvZ2iz2/Dxw2YOVzi0zqCTlOiU
         hIWg==
X-Gm-Message-State: AOJu0YxvZ5oIWe3sjpJHismP1pVNwoiR8kEl+NjQcoxxE3FKdT5FoV+9
	JiMA0J2RT37XPJwOJHNofuiKlV5sF+5ByxE/BQvi5n10IngK9IlGxTyV2xYAzKk9KWzbDn6y4Um
	JvWSs7EZgbb7fTGFoDVTmgG1mANiJhFwgzCvKxX5ikkPwnvZI4XRnHU2YVaiemkXF
X-Gm-Gg: ASbGnctm5+lDEMLfjJ/xYC+wxHuV3TWcCJRomuci2oeWV+tSapQ+uBXQjIMM16mGll9
	aBye2tmoKnLxYn2yh3Xy1xWkk9vDi3V7jcZZUhf6SMY+ZEO50cLhdpGO+8T3IqWRTC7OmwLHY0h
	Yb5rYvgqQBynQU/3v505e4BIQoAkTwxgRJdGiAISPwfHvUx16NHe322F7O4OYp696KzUvT5Yc2+
	tmBXtOSQI5YttMqPgfOsln0YNURs4F/lmk7jhqglitYyzbMxZqNMZouy8Jn242f9aiwNJRzUC7D
	6lBcGyn60L0OBLcarbxOJ7MWt3w0wXQohMWzww==
X-Received: by 2002:a05:622a:a:b0:464:9faf:664b with SMTP id d75a77b69052e-467a14cfd41mr6749971cf.2.1734028253376;
        Thu, 12 Dec 2024 10:30:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFBmWYzkqDM9wVygpP6+khZ5CMjiaMqbQrDeOxY/wvNHDdoJFd31XJ/C25DP1Iw/uEBcEYMXA==
X-Received: by 2002:a05:622a:a:b0:464:9faf:664b with SMTP id d75a77b69052e-467a14cfd41mr6749831cf.2.1734028253012;
        Thu, 12 Dec 2024 10:30:53 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa69c3512f4sm480672266b.2.2024.12.12.10.30.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 10:30:52 -0800 (PST)
Message-ID: <7f0f2ad6-7895-46f8-8f80-0375dde2e763@oss.qualcomm.com>
Date: Thu, 12 Dec 2024 19:30:49 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/5] clk: qcom: Add CMN PLL clock controller driver for
 IPQ SoC
To: Luo Jie <quic_luoj@quicinc.com>, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, quic_kkumarcs@quicinc.com,
        quic_suruchia@quicinc.com, quic_pavir@quicinc.com,
        quic_linchen@quicinc.com, quic_leiwei@quicinc.com,
        bartosz.golaszewski@linaro.org, srinivas.kandagatla@linaro.org
References: <20241107-qcom_ipq_cmnpll-v6-0-a5cfe09de485@quicinc.com>
 <20241107-qcom_ipq_cmnpll-v6-2-a5cfe09de485@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241107-qcom_ipq_cmnpll-v6-2-a5cfe09de485@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: dfmBGt5_eliIhpjYWGNzM6wIBRVanMqS
X-Proofpoint-GUID: dfmBGt5_eliIhpjYWGNzM6wIBRVanMqS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 mlxlogscore=999 phishscore=0 adultscore=0
 suspectscore=0 spamscore=0 mlxscore=0 impostorscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120133

On 7.11.2024 10:50 AM, Luo Jie wrote:
> The CMN PLL clock controller supplies clocks to the hardware
> blocks that together make up the Ethernet function on Qualcomm
> IPQ SoCs and to GCC. The driver is initially supported for
> IPQ9574 SoC.
> 
> The CMN PLL clock controller expects a reference input clock
> from the on-board Wi-Fi block acting as clock source. The input
> reference clock needs to be configured to one of the supported
> clock rates.
> 
> The controller supplies a number of fixed-rate output clocks.
> For the IPQ9574, there is one output clock of 353 MHZ to PPE
> (Packet Process Engine) hardware block, three 50 MHZ output
> clocks and an additional 25 MHZ output clock supplied to the
> connected Ethernet devices. The PLL also supplies a 24 MHZ
> clock as XO and a 32 KHZ sleep clock to GCC, and one 31.25
> MHZ clock to PCS.
> 
> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> ---

[...]

> +	/* Enable PLL locked detect. */
> +	ret = regmap_update_bits(cmn_pll->regmap, CMN_PLL_CTRL,
> +				 CMN_PLL_CTRL_LOCK_DETECT_EN,
> +				 CMN_PLL_CTRL_LOCK_DETECT_EN);
> +	if (ret)

you can streamline these with regmap_set/clear_bits

> +		return ret;
> +
> +	/*
> +	 * Reset the CMN PLL block to ensure the updated configurations
> +	 * take effect.
> +	 */
> +	ret = regmap_update_bits(cmn_pll->regmap, CMN_PLL_POWER_ON_AND_RESET,
> +				 CMN_ANA_EN_SW_RSTN, 0);
> +	if (ret)
> +		return ret;
> +
> +	usleep_range(1000, 1200);
> +	ret = regmap_update_bits(cmn_pll->regmap, CMN_PLL_POWER_ON_AND_RESET,
> +				 CMN_ANA_EN_SW_RSTN, CMN_ANA_EN_SW_RSTN);
> +	if (ret)
> +		return ret;
> +
> +	/* Stability check of CMN PLL output clocks. */
> +	return regmap_read_poll_timeout(cmn_pll->regmap, CMN_PLL_LOCKED, val,
> +					(val & CMN_PLL_CLKS_LOCKED),
> +					100, 100 * USEC_PER_MSEC);
> +}

[...]

> +static int ipq_cmn_pll_clk_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	int ret;
> +
> +	ret = devm_pm_runtime_enable(dev);
> +	if (ret)
> +		return ret;
> +
> +	ret = devm_pm_clk_create(dev);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * To access the CMN PLL registers, the GCC AHB & SYSY clocks

SYS?

Konrad

