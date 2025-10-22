Return-Path: <linux-arm-msm+bounces-78365-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C4351BFCE39
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 17:31:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1F3FB561E13
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 15:29:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABB7934F25E;
	Wed, 22 Oct 2025 15:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bkEZnLBu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF58E34D919
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 15:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761146848; cv=none; b=HYBm+OAbas3mW3XrCaZ32gzUte83HqMXaS2BvBayoc+b1+7pu8Ea1efQox3dvLXpEfRea6hMMc4osuVLjTDpTXasbmqoxFcroerVDF3HVkc3NvbQQieIAjGhWlATZP0SSDMIBgkksWkOOgEQN4INOxxu9eU0iRG4Xouut6US4Uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761146848; c=relaxed/simple;
	bh=1QBplYuRdegJvfJ0QvMbSZOyGdzUajRV4zloL4AZLb0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XQ1zE5Mm7rdRIjiG36rnkRSS03Qg2gPmoMnKY9N1RriVq8cZkWDXCZy3JT6gYe7E3tcS6dLI9HQ42XPd97ddSMkTBOaNRZ/j9INGHL8PFwl5Zt2qEdW/8lTTaSiad6Lt8HoRtiX2N1AY3MMc3ISTx8vpg8BVMgpbNy0+5My2db8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bkEZnLBu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MB2ATS024982
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 15:27:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8k/FmEKkL858bw0NvFllXkz9skuIxCCBY/vWAZsgTMY=; b=bkEZnLBucAJH7pXS
	V2M0/a2S9dpvkoIdlZ/FDdD7fjQzTwoGURX1SaU9aggJIieHyBgV9+dZeeMsbxd2
	PTTlxlkAKVkyRlb0uP9czwXuhBqDdwK8gEs/5OCNtKGrMIakilydsLHxHGNaH20Z
	mCQcqAa7QgkEk5ydwnyLrYz93Hnd56JXjCUh8WMrHWtqmqk5TwESltvcUafv1vhp
	AK9X3pnGwNksDAbLQ8AtOEYrqbhgULbB+kmtSxUmLykYaEYE1NzID3E4ee/MleFF
	2lxZwWPqBxWRGDEall2/N2agY4Eti/189H5rifc9C39DU88mQ5cX1XermOgq5nUT
	7zOo8Q==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v1w856ra-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 15:27:25 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-87c1c70f1faso26715296d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 08:27:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761146844; x=1761751644;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8k/FmEKkL858bw0NvFllXkz9skuIxCCBY/vWAZsgTMY=;
        b=kcY29Qf2I2IeN+r+XGmNoVzvmR/d0uGFkaGPMvuJ/yQovYP4I+fbiJdw3W7zmbNwVv
         LiwqwkmqRRpm9el2+D1ZvaZwAWPJHyo9QLXLQTEGBW1qV1Tup8gvuGfXgQqg5WLoACs/
         t55EaSAxUl8K8YNNSw9fo0iqQ8mwW/Ng+Kn+boxDErtdr7oR7ZFSYfLrfSyAzkvZ8Wrv
         nZgesGd30dTwW49XUc4P3EgUq/JhfsE/8agSH53XyfivQJF0lkoYCfjsyCPvsOXIkjMS
         sNqBwwGVrKtGzRfwuCBHaly5xSWGRebxsKDo5sGKmWureFByKwUT90nAsxdlsU2xJ/DJ
         1g9w==
X-Gm-Message-State: AOJu0YxLRYABcjZgAitaH1dEnsRck3ZBNmEAJPG1i0rbWUyzjZVKEDKo
	KENUPEagK3BNxtrAAZUcXIcU883UqomIiZ79rA0uCCEzBKXZvi7F5SZJgjgU3ermsU2oZ/UNXj3
	7Y8cALrSU7ilpv06/3Jdf0w33puz54tL9jW9oihjkHM4lW4WjtaqfbdB8aPnlvVbeMawp
X-Gm-Gg: ASbGncuhvZ9QnM75NEzZOip2+0hNjtKG+kj12oLCUlWn612b+mYlXw18VOwhfFMaK8+
	ZuHZwuKJkWKWsxOH5S9ackk0zgpGvhlYzBZ+0QVKHKxsB5htN72uA/cMMe7nPlhDoXHXA0+5SfW
	Vf8jW4+7fGlh06qO8ZsladHipWuRNxRkzrBhM+gG+gX50AQH/f8FzEFCJ1TwzMuYbqNIbdyuAG0
	I3PaOkayXAgHbFPU3bFVes6SQhrr2yAmX9OOxlyOC49aAkXj/1hv2rAvGvZgJ+KUpVco5tyQtiR
	4GfaknX0TAb5KsOHGGEzEnnEajUHdsolJ95lTRfHT3r090FOZFkbm53sdcRDtJ3Scl+wC/Yejic
	xiKvfczVYjpOak22r0Jxjg4kgiI3FxOCjJNVIdbaBPY0UNWrPOpqBJeOu
X-Received: by 2002:a05:6214:248d:b0:70d:e7e1:840f with SMTP id 6a1803df08f44-87de714c1c7mr65707136d6.3.1761146844561;
        Wed, 22 Oct 2025 08:27:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8/xeYz1XYBcdg4T4l6woigaSUVTSHt5t3v8BurU4yppUfVX2LR3sMLl0zpGaHU1+8ugjz3g==
X-Received: by 2002:a05:6214:248d:b0:70d:e7e1:840f with SMTP id 6a1803df08f44-87de714c1c7mr65706846d6.3.1761146843645;
        Wed, 22 Oct 2025 08:27:23 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63c4949beedsm11980254a12.40.2025.10.22.08.27.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 08:27:23 -0700 (PDT)
Message-ID: <fdec4bf0-6d88-4a9b-a81a-061476dd9e1b@oss.qualcomm.com>
Date: Wed, 22 Oct 2025 17:27:20 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] arm64: dts: qcom: qcs615: Add gpu and rgmu nodes
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Zhang <quic_jiezh@quicinc.com>
References: <20251017-qcs615-spin-2-v1-0-0baa44f80905@oss.qualcomm.com>
 <20251017-qcs615-spin-2-v1-5-0baa44f80905@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251017-qcs615-spin-2-v1-5-0baa44f80905@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxNSBTYWx0ZWRfXxYv0eXBktlF4
 mr1eaIUmdxli62mPMLa1TfTKlNxd+n6Ogm5zX5oXjadk0wWddba0qs26x3Vpou5YtAy//THLwmQ
 GRXT7teHD12xrVELukUVebQX3eyJ8N2oaXx8rFcqZO5yrIKClJvifFyxHtMoZIkgja/+YvSkAKM
 JCujDvMLs0x4EALSvv2NP4Rqs9vFWRQ/PvR5cxQm9OYm31pexNnk0WBsTwpSxJVWrayfquH82a/
 avrFF0c6oHC6nC66T+HcI0lxXJOwg3zXdjTxFkR1cGPTFwFC2+wmkAd/GR9/HbEOxGB8TKXKSkw
 HcEHW8M8aFYf4gWH6FRQObPqOalVZ11u0WHETwRQGnH2jIZwM3ko+pLB1M+UXWbose3fsZxwO48
 sVsdjsEWoWMA/hqic2X1WJBXUo2aZQ==
X-Authority-Analysis: v=2.4 cv=bNUb4f+Z c=1 sm=1 tr=0 ts=68f8f7dd cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=e4uKRaRUJts94r9YfvAA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: cMcK-qR4b-XbPORMzNvSrIrvUEiJJPvD
X-Proofpoint-ORIG-GUID: cMcK-qR4b-XbPORMzNvSrIrvUEiJJPvD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_06,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180015

On 10/17/25 7:08 PM, Akhil P Oommen wrote:
> From: Jie Zhang <quic_jiezh@quicinc.com>
> 
> Add gpu and rgmu nodes for qcs615 chipset.
> 
> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

[...]

> +			gpu_zap_shader: zap-shader {
> +				memory-region = <&pil_gpu_mem>;
> +			};
> +
> +			gpu_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-845000000 {
> +					opp-hz = /bits/ 64 <845000000>;
> +					required-opps = <&rpmhpd_opp_turbo>;
> +					opp-peak-kBps = <7050000>;

Are there speed bins?

[...]

> +		rgmu: rgmu@506a000 {
> +			compatible = "qcom,adreno-rgmu-612.0", "qcom,adreno-rgmu";
> +			reg = <0x0 0x0506a000 0x0 0x34000>;
> +			reg-names = "gmu";
> +
> +			clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
> +				 <&gpucc GPU_CC_CXO_CLK>,
> +				 <&gcc GCC_DDRSS_GPU_AXI_CLK>,
> +				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
> +				 <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>;
> +			clock-names = "gmu",
> +				      "cxo",
> +				      "axi",
> +				      "memnoc",
> +				      "smmu_vote";
> +
> +			power-domains = <&gpucc CX_GDSC>,
> +					<&gpucc GX_GDSC>,
> +					<&rpmhpd RPMHPD_CX>;
> +			power-domain-names = "cx", "gx", "vdd_cx";

I think the gpucc node should reference _CX directly instead,
then genpd/opp should trickle the requirements up the chain

> +
> +			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "oob", "gmu";

1 a line, please

lgtm otherwise

Konrad

