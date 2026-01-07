Return-Path: <linux-arm-msm+bounces-87878-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD8ECFD983
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 13:18:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 75E2E3035313
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 12:16:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28D2C2E6CDF;
	Wed,  7 Jan 2026 12:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h3J7M3bp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XcUnomYV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A222FB08C
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jan 2026 12:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767788213; cv=none; b=JVotqxw0oUvu4JNWxKC8AFQhZEWWgtsm5N5mwxtVaN2PGynkIjDrRqP2wgDxNVvxc/Rac1EScpYBKRQ0mKq7JiK6kC+Lwl77VBZ/wY9NuHFqfQbIhnB9PRyNsSwRMF31LAFRMeN/1bwzRYo7dYMlQngDVM81HRFfBTScCSwFywE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767788213; c=relaxed/simple;
	bh=NjGfYThFux0yY5RSyrwt2i1Ek9JVno/OrKe540SAtak=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ic1Tm5kwQ6ymPGfJS6Z75WwK+1y8LA2KelopNGXCTYkYnn6F12qTCvUQE14KVte6w3eHP57X+k6H0tQ7xaixemG3mla0+84g248WGSjx0fPTQIt1L3LbWs1ryekYV2iA66vEQXJj5niFWQhxY6k2zz62v4zeyTzWE9yoyxT/a7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h3J7M3bp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XcUnomYV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 607BrrRi1643104
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Jan 2026 12:16:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d55j32hYpW4S+x8R8th4vTayuLxbVkuWG4hN8s1Dfnc=; b=h3J7M3bpOCEvKjJ5
	hwjNb274pY01CAOLPg8h63hhH76T28kFq22c/sYwHaX7Ub2MdTpFWgrSeo7EEy+h
	pneR5DQjWm0a+k50A0w/84IvFi4qvbMTz7wYGvaI7L7Y8MxLV+oO/Cn4xtgtazRc
	F96V3/U+nJqO4gsHMudnhvbG/Yla3MT0xU4yPEEai7zE4NfMsWSd5aFGqPrCQbN1
	3G6UTCaSOWbuAHv+aTki5V9cqwsOMj4Oec8WabXmPIQ4vCpf6HhRZhnBUvAfJtuV
	JYa2pZ1f9AhRZYZLs4gF62U7qXzbZdmsJgs5tqhdApb/O4s10PVsa8GoRovXQiBC
	FJrQBw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhgsfhbp1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 12:16:50 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee05927208so6143671cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 04:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767788210; x=1768393010; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d55j32hYpW4S+x8R8th4vTayuLxbVkuWG4hN8s1Dfnc=;
        b=XcUnomYVJP2/neV3PwGde3mUPOP17d3a/RbblG1hf32HOLoqrvBq2X8ww28g8BHLsY
         VyYJ/VyNc+yxdUB+jxpwd1qn5yYBZDmug0HXXdvb6OaQlq8OEWiJfwtoC/Wj2dvsUZDN
         JynnD/Kab7TUBLd3zC39QuyQvteHyiG5HzPQ9eJUWs+9lltT9Nj6lqgavbwEqxpYeV3F
         iw9pCFo26hR83WKKpo/iLUITcOH4pnbd3t0czyvuGQ13zLSbcqIiU7i0htLR0BiOmzC6
         7m5LxIOONnYItvAXs7BUelI01ppVety19uyieLwXGzKCOjh60h6m8we25puaDrPaHhSs
         +gWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767788210; x=1768393010;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d55j32hYpW4S+x8R8th4vTayuLxbVkuWG4hN8s1Dfnc=;
        b=NsIAosZaRLU9bfeLJvd/aG8b4U//rUTEhtAx0yaKvhQGKc4jYLtWliYIyTOF6ohbqZ
         dOHaFUd0RPLOz9HEYBHJ4yTA3yPbOwCrRXjkBg39tMt9VqX+ZnltD5dcK4q/IIkgbM32
         vnZD2A42/ecO2z7yLxVs5AJ/TqEL1sVQsibHE8yYB8XOQG3MYmvQs8QXztNYNxjF0xYa
         yzGjS6MQWqCNY6moHNt5qwuu56iQvgbHVgV7wBvPq3talGSBUsBFcG7vfWUhDaq4tNf9
         ooX0P8ZvcYtr0v2X2xefSC4grJU+5nPp7MGJQBkLM+jNnF6W8CJKiQpMY4XWtzp/VZmv
         H6xQ==
X-Gm-Message-State: AOJu0YwtEqwwZflNmFAJN/BB8A2Eaic/ZdVh8cf7hMHGjBEEXo2SgbFu
	z0G/868p49hVZ8zJuotaGN4vG0scsYFrCJx5nqFToTMY4eFdn7iFyhjyaIJOfp9DTirQiIcrcYF
	Q9w9eK6+8DGlastfnSXkd5lbnkYJhRBrkAfa7wXXC7CBwjuThUKUq2H+RmVJYxsZTT7Rd
X-Gm-Gg: AY/fxX7oQYsI8uQwaAxKgXdaaGMSI8rE/VQa/2dzTT4ekvQZ/gJ+nU0LfzSeEKEf4HN
	5Qgy5j76Kr0pDkstNDcCEOB6whXbh3o8K3YGvOpD3Lmo+NWFet6blxFkg+3BkYwSZ+h2V2yLnE6
	dNu+lrrKqJAZDr5X2NgyClQ95sbtcA/c0ZBZJU9CW7wND8r6DuKS2AaOxjTeZpscv83WflXnoZC
	KDYNKRhcy91K+GfF7tLJyzmMaGscHHltUdE4gV+l6oWbwBSLC5B+CcFdsZe9F/Q4cDdoeBEZH3n
	St/zLjvN8JnfliKqOGhu2yYhCk+noBSVpnYSsukHjr6tAzTt33cMHBWihLTf8Y8muWwa966zEPY
	IMaPFlug2t/htlHaP+aWapNpg6cILVtTe4q4+op6gNgF37JcxyXCtbejvq0Jratn0TO0=
X-Received: by 2002:a05:622a:1347:b0:4f1:dffa:7834 with SMTP id d75a77b69052e-4ffb49a02a0mr21372231cf.7.1767788209641;
        Wed, 07 Jan 2026 04:16:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGUS4ix100WivikbOS3qGiN8osG7zEalwH/GRaCRfETPDly8syMlLkh+ICwAI7jDOvlay399w==
X-Received: by 2002:a05:622a:1347:b0:4f1:dffa:7834 with SMTP id d75a77b69052e-4ffb49a02a0mr21371921cf.7.1767788209114;
        Wed, 07 Jan 2026 04:16:49 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a511551sm486275966b.53.2026.01.07.04.16.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 04:16:48 -0800 (PST)
Message-ID: <0ff8041a-c876-419e-8f18-7656e29549a3@oss.qualcomm.com>
Date: Wed, 7 Jan 2026 13:16:46 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] clk: qcom: cmnpll: Account for reference clock
 divider
To: Luo Jie <jie.luo@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Luo Jie <quic_luoj@quicinc.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_pavir@quicinc.com,
        quic_suruchia@quicinc.com
References: <20260106-qcom_ipq5332_cmnpll-v2-0-f9f7e4efbd79@oss.qualcomm.com>
 <20260106-qcom_ipq5332_cmnpll-v2-1-f9f7e4efbd79@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260106-qcom_ipq5332_cmnpll-v2-1-f9f7e4efbd79@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA5NSBTYWx0ZWRfXz7NAMqMB0BWa
 O8KkbGpkhHrQ6rK/YrX8TRnKNoEJKdVQw9eKdvG/0GC8pKegOrlzK0CJPx/7U5NAuGJ83+KlgeY
 gCIu7sJOQJlXRlFnMmPHTF6N6ZavinElrXq6vYce/tNFezZpcQ6GIjuF+imBWu5oC5hCY8DjS7A
 RSg8s3u/sWC0YX0i2RoVPRgoO6ZAs3cdYyndWmhT6rfYJl+V6drUed0ZaDpY3oqrXORBd7vHzBz
 pxr7S5o60z+NZTBUWj7YmGGyYiBkFcqEOEoZyyCLmq/QP464VqdxUStj+jJumaNWqiCMuR2K8P3
 fGPf0qb5vvFJdDNeMzoHofEfO/uzaRYELoHWIzJ/KHjVG/vgTmMxVV6ztl/J0ymCSzVzHMTA7CO
 MYwHoMBxVCs3zrV8q9eOqJiehZWiBQvDf8SDJmICafvsUPUlW12T0+vQ9GIEcqa3L95JV4S0mOv
 TTCyJC1XN1BncbcunTg==
X-Proofpoint-GUID: yRA8En138xVM1gsce7lZ27MO5_nTy34j
X-Proofpoint-ORIG-GUID: yRA8En138xVM1gsce7lZ27MO5_nTy34j
X-Authority-Analysis: v=2.4 cv=Abi83nXG c=1 sm=1 tr=0 ts=695e4eb2 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=QfgEeMFAfvcTqVishicA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601070095

On 1/7/26 6:35 AM, Luo Jie wrote:
> The clk_cmn_pll_recalc_rate() function must account for the reference clock
> divider programmed in CMN_PLL_REFCLK_CONFIG. Without this fix, platforms
> with a reference divider other than 1 calculate incorrect CMN PLL rates.
> For example, on IPQ5332 where the reference divider is 2, the computed rate
> becomes twice the actual output.
> 
> Read CMN_PLL_REFCLK_DIV and divide the parent rate by this value before
> applying the 2 * FACTOR scaling. This yields the correct rate calculation:
> rate = (parent_rate / ref_div) * 2 * factor.
> 
> Maintain backward compatibility with earlier platforms (e.g. IPQ9574,
> IPQ5424, IPQ5018) that use ref_div = 1.
> 
> Fixes: f81715a4c87c ("clk: qcom: Add CMN PLL clock controller driver for IPQ SoC")
> Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/ipq-cmn-pll.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/qcom/ipq-cmn-pll.c b/drivers/clk/qcom/ipq-cmn-pll.c
> index dafbf5732048..369798d1ce42 100644
> --- a/drivers/clk/qcom/ipq-cmn-pll.c
> +++ b/drivers/clk/qcom/ipq-cmn-pll.c
> @@ -185,7 +185,7 @@ static unsigned long clk_cmn_pll_recalc_rate(struct clk_hw *hw,
>  					     unsigned long parent_rate)
>  {
>  	struct clk_cmn_pll *cmn_pll = to_clk_cmn_pll(hw);
> -	u32 val, factor;
> +	u32 val, factor, ref_div;
>  
>  	/*
>  	 * The value of CMN_PLL_DIVIDER_CTRL_FACTOR is automatically adjusted
> @@ -193,8 +193,15 @@ static unsigned long clk_cmn_pll_recalc_rate(struct clk_hw *hw,
>  	 */
>  	regmap_read(cmn_pll->regmap, CMN_PLL_DIVIDER_CTRL, &val);
>  	factor = FIELD_GET(CMN_PLL_DIVIDER_CTRL_FACTOR, val);
> +	if (WARN_ON(factor == 0))
> +		factor = 1;

FWIW the docs tell me the value of this field is '192' on IPQ5332..

Konrad

