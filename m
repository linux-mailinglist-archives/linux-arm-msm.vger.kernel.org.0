Return-Path: <linux-arm-msm+bounces-61304-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34672AD9F6A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Jun 2025 21:19:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 73F5A3B8C5F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Jun 2025 19:18:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB0F12E7639;
	Sat, 14 Jun 2025 19:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K2LbgRw6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8FE20D500
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Jun 2025 19:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749928750; cv=none; b=GmmILulw1/RpK0cItE0K2zOvIjGs98XhzG60q4pA+7fAFyXLRM3XJn/hLFC+4J5n857FR1JGsQ26mnwP1hJA3PvSM3KATLwI7jO5z/hartOwZjZafVsxvbIrPNSgsLXqnxIuIaRwTBIbPkxXCpqUOnIINtWl291YL+3HN+XzreY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749928750; c=relaxed/simple;
	bh=HCmu8zBCwT1sCU+JWJo7GxThaeF443wRPngh2djh5qM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fG6+B8/AHpgyf775HBH1wI8XjhMu5xEmUvzh0jCPG58k3wNOwIlGhKAWFuW/PH/9CbyGCCSXidAnPbKAltq67AgPXpNrPAMGuY4wFOwXet4VOk3DnYyq9JX3Rkz9m/8g2j50m01e95b/yTjzWvk3wiyGdvxWIsGdOZvUfK9nzow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K2LbgRw6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55EIR0e2002075
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Jun 2025 19:19:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CO7GBylWWl+fwo+IkF7T+4QyCFqae8eZKA5W8pecqIU=; b=K2LbgRw6FWdqBxoS
	EU8VuP6MiSmFQocI6knnZ74nWWFa/gCoLzB0tIJmGSqXlP5Sod6IM59gMXg0TN9R
	3TQG95I5QNlb6lljfLQXw8ha+7//Az2nRsZCoiR0YhXqVf4PLE9Dn0WGZ9bJ7jUV
	ktgCGSQYfAZWBOtpPaTF1oROrX9E7uifXbFo9GkEevObfXvxR3/1RCwvM3DX1qFY
	ul5IhLGdh26cC+PaoD+bUCc5kPjYWTK0SDmclhUlxYwkmIeTbHgFnt5rM2OhqWT7
	eAMpyU9j28JLnNp+HhZ6FeoZ1ZutYMHwNAoTMeNuByaJRnWXiqWvyqhukobqqZ4z
	KXsrHg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791ug8w7q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Jun 2025 19:19:07 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4a5911ed20cso2129231cf.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Jun 2025 12:19:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749928746; x=1750533546;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CO7GBylWWl+fwo+IkF7T+4QyCFqae8eZKA5W8pecqIU=;
        b=fQg6Df4gnpFDjlBXSgiUNT/hvwSOKz7tch864Mzl3PP59a2cxja9nJcD9mqWszgD58
         BHeS2B50YvDDiLCLZWt/oRv/+nrq4qvo+U5Olnz/SwwGjI/H3wedJrGzTvPoTjABv918
         gNc/9jZsVtLHCTnShgrqwyELhHsQae1r/dKLDQpcBSrx0ycxLzTAwC2wnx1AsS0iklf1
         D9xyFkHUwt+shFMwOlP4X06qzF91v3cVFRGCONvSU0N6MY7m25F7RFAIZg1l2LUJyq2C
         Jkzh412XwKqI4pNQE8k1vQ6MVTl7izUTR3ho5jBi+ckAXZlvDmQ+YTaymvHnfraIe7LI
         N4gw==
X-Forwarded-Encrypted: i=1; AJvYcCWUqwocnC0f7Svz0v9krD/pxHh+Uo8WukFw1pzcONigkRaQS7HwBoBFQ/z43Lkws8POi9exYKKWA9ua8rpr@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1G+aXIynLlFbWpEevfrfWTu+Cj149Y3OUoUd6GJs19kI/q5OU
	/g/p8QTiuTZa2gUGYACRhTrENy/lR95DwL8apFXE+FHq+obV2S6UR5MxpbkeJTluA0jKaHTVuB/
	8ApYc+Hd9Lyh9y8Ar6lT3zidKxEpOarARshCtyVVqzIAuqKhkitqgkDp1n6ve4CDaYlzI
X-Gm-Gg: ASbGncspU2jerAczOCuc4UwE4rmHXbJH9X7BpAJdXszaH65f3wBozDh/BW1dzRREf0z
	1wGvZ/m8++VSRVHckDnLrARBRGpOQ2txAe72LChivwHjbQmloDWVRSRV0MYtHfbvPREMSpNQqBo
	Z+1VU8FAXRKHL2/OlMMGO4LU4CvhzRJmr6CTKZvjJSRH4dlKCqZxCIcC9ZvUKPPjX+zBbt35v8E
	3kJfrtv+Z79zCkE6alC1tHs7YhXmgG6jnMYsuncN92YvGLRKZ8ShrcEICnQBp8k3heDoQ/wjmcx
	R9cV1AycSt9a0BxpSZXTBuTgwK6fongazRZTsAdz1vvSSfylZt91++NfydU58JDvkvMiwyam4yl
	pwYY=
X-Received: by 2002:ac8:5a07:0:b0:494:b722:141a with SMTP id d75a77b69052e-4a73c610d1fmr21771351cf.13.1749928745786;
        Sat, 14 Jun 2025 12:19:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtvCIElzY5rB8ZQ1ay4v583nOREgAN3HqTp4Uk9iaSzJMhURaskdck+1YjGvG2ZGck1/8UTg==
X-Received: by 2002:ac8:5a07:0:b0:494:b722:141a with SMTP id d75a77b69052e-4a73c610d1fmr21771181cf.13.1749928745313;
        Sat, 14 Jun 2025 12:19:05 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec897acfasm345456766b.161.2025.06.14.12.19.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Jun 2025 12:19:04 -0700 (PDT)
Message-ID: <75fea0f5-88ca-4099-ba48-997e46bf4de5@oss.qualcomm.com>
Date: Sat, 14 Jun 2025 21:19:02 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 07/10] clk: qcom: gpucc-qcs615: Add QCS615 graphics
 clock controller driver
To: Taniya Das <quic_tdas@quicinc.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Dmitry Baryshkov <lumag@kernel.org>
References: <20250612-qcs615-mm-v9-clock-controllers-v9-0-b34dc78d6e1b@quicinc.com>
 <20250612-qcs615-mm-v9-clock-controllers-v9-7-b34dc78d6e1b@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250612-qcs615-mm-v9-clock-controllers-v9-7-b34dc78d6e1b@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE0MDE2MSBTYWx0ZWRfX2fYufS0BIJ8I
 WMhe7fRLoirMhRDhOUOVV74BoFc8va2bvEza4W6AQjJu3DxEUjKxFM+i2mnNd+rC/EmGrDQH9qN
 pVNMbCORRISfYxdA64z4rl4h1hrCYsxkraI+Z/RNAbhylx3xSNjfw2MhuRfWZLI4QX0RgcAP050
 YPWLf4K3cL5gP3moXiG6JnvuBMpX9MNhzplKphW0f1xUb/rTySY8YevTAw2ye6UGjINEB+3RYZl
 Zy4vhyweIX/qhfu2vhEgq1Lr2DcKxUXl4Q8WBe5NnzJZc8PAeYJQxJpKcsR2bT80F4nWobTijVw
 9dunWSr/ICHl/k+H7ksDZhzTe1JUY2FRzkZBFOGibatJLYhNU9ptzy/VWuAhWKhqumAjGBQh4qW
 X9OgWlE+liFdCPyUrdgFflP3QoAFuZvz7IC9dKnT2Q++U2HfKmQKBIfBZINz5iOEZQx6Jj0n
X-Proofpoint-GUID: GB1w_qH2y0hMr4QXIXGtff6UYdsoMlq0
X-Authority-Analysis: v=2.4 cv=NtnRc9dJ c=1 sm=1 tr=0 ts=684dcb2b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=3ze65spd1aMdTggYaI4A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: GB1w_qH2y0hMr4QXIXGtff6UYdsoMlq0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-14_07,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=999 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506140161

On 6/12/25 11:55 AM, Taniya Das wrote:
> Add support for the graphics clock controller for graphics clients to
> be able to request for the clocks on QCS615 platform.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---

[...]

> +struct clk_hw *gpu_cc_sm6150_hws[] = {

"wink"

[...]

> +static void configure_crc(struct regmap *regmap)
> +{
> +	/* Recommended WAKEUP/SLEEP settings for the gpu_cc_cx_gmu_clk */
> +	regmap_update_bits(regmap, gpu_cc_cx_gmu_clk.clkr.enable_reg, 0xff0, 0xff0);
> +
> +	/*
> +	 * After POR, Clock Ramp Controller(CRC) will be in bypass mode.
> +	 * Software needs to do the following operation to enable the CRC
> +	 * for GFX3D clock and divide the input clock by div by 2.
> +	 */
> +	regmap_update_bits(regmap, 0x1028, 0x00015011, 0x00015011);
> +	regmap_update_bits(regmap, 0x1024, 0x00800000, 0x00800000);

I'm going to assume this is not the same ramp controller as:

drivers/soc/qcom/ramp_controller.c

..or maybe it is one, but we need to set things up on the CC
side

> +}
> +
> +static int gpu_cc_qcs615_probe(struct platform_device *pdev)
> +{
> +	struct regmap *regmap;
> +
> +	regmap = qcom_cc_map(pdev, &gpu_cc_qcs615_desc);
> +	if (IS_ERR(regmap))
> +		return PTR_ERR(regmap);
> +
> +	clk_alpha_pll_configure(&gpu_cc_pll0, regmap, &gpu_cc_pll0_config);
> +	clk_alpha_pll_configure(&gpu_cc_pll1, regmap, &gpu_cc_pll1_config);
> +
> +	/* Keep some clocks always enabled */
> +	qcom_branch_set_clk_en(regmap, 0x1078); /* GPU_CC_AHB_CLK */
> +
> +	configure_crc(regmap);

Likewise, please rebase on Jagadeesh's series, which is now in
linux-next. With that:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

