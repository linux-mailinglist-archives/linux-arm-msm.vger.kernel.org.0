Return-Path: <linux-arm-msm+bounces-56478-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 819C3AA6FE2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 12:38:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2152D188B764
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 10:38:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB5D323C4E4;
	Fri,  2 May 2025 10:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dpNExA7J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D9C218AC4
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 May 2025 10:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746182298; cv=none; b=XQrevoQ8U8WMkiIWewcgcIU4akP7hg+CQxQG6au6J/MSUsNGVwAC1XQazS+M7qGf899S91pltJFcJvUXGsxojhfHg+rVSnaXUyzc1A3h39LIt/3xOCJ5WH9dCsYVPJLOThUbSCSYwqre8Evi7Uegkvc5l6VRrCWXmXYbKT3/3+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746182298; c=relaxed/simple;
	bh=Dsp/Vg3p6mjWb/dCOEj15xgjKuqN4noVHOK2BkCe6n0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pKLZwNgUljgmUNpjkTED+W+H27kLs8SM+fk9HAsqbqZcC1mLIGZmTkqgOC3e9CtvHjSxUH0yYoNXuVn3f/SMt2iMizFWoNgmpJJQ+U6ayotQyWvwBHPMnoW/PawdfvscHkJnJGKOt0RRYw0emPE+uhzh1ehLW+esNhewRrvHzsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dpNExA7J; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5421O2LH022725
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 May 2025 10:38:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	27eve1BdY3tnRAGhbk65ewCzrhADgzBYCgA51jfhing=; b=dpNExA7JoWLT/JyH
	x7iXR1JkA+iVcobGXUWBiJBKDGHwoZFbCt3wgauV3xs1Vpd4wupWuTcI49WMlIly
	KP1kFhOZWabqGmeGQHRc2UXDN9XIY7ScYTQpFSyakfqjAVLBVIScXR9fer0i9M9P
	8DmqtacryeGMu5zRLxh9e3Gymqwba5LgIQCbP/BAGCl8GduE7FtILmh1HaMek5l0
	u9C+EZl91iD+z0EyFTf/b3jJ88WnD0pMwT5AgJsemlQmDfBpAJqVsQhcAy4LOSmA
	52oaYuqEi00BFoSkSBS+AgoA6dmio7m8SxPWxj7On7xx76Y65SxaG3MSNwmAz5So
	5ZkXow==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u8fvr6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 May 2025 10:38:15 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-476786e50d9so5582351cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 May 2025 03:38:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746182294; x=1746787094;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=27eve1BdY3tnRAGhbk65ewCzrhADgzBYCgA51jfhing=;
        b=XH910Uf4ue5uA3LOSKvPYCopW9h1WEQKW6pfHhmiDAsCpjx6vXWhZrPhl7fd5Fxe63
         HAUjV4ldp9PTGeQQHyEAor6/sAOaTEoHS9g+jN3cDBntxFKn7L2VLMxibZ0/IKOnuHnZ
         MDXFtSFELnYHayU1GxTbiT1F2X6MPJpR7jS7ZYQ7CzKYiYWJJqKJMQ9Y0iL/i8LxzhVf
         Rv0o8JfvP3iUtzW90k37Lrh6F4wdinCSWCmm84ISLl/657s2160Kn7mnqOU+PdQ+lqbG
         Yg8p1TRjVdkG56SKpxhQAgB7KMKkqR2dReqScU6WS3YoJqOxqLtEfEjfZRauSyRhZs63
         Lj3w==
X-Gm-Message-State: AOJu0YwMtccQp+Bj8kypXfRZsooN3Z4DC1+faI+5nMPT0iqLnqKzZ4Qi
	xkn9Z1I3CYv8i/5B2UV1UmLmLkc4xtFzLEwDujzFnUzGu10hYSFfYwBJVExWb3qrvHcCQzeTVQz
	eLrIU2hz6+3ZzKII5l8mUD2w5tEyO1sImNLEhm5LbL1n7VxmFNvJh8UMJz8fz4MjGviev35hr
X-Gm-Gg: ASbGncsz5pkrh2YLllsRI4A3GvXwwFs1i8ZN2t7ZvN8ouVk1O32VwMC7uA20gqbYv6b
	c0ldVCih37BpTzzHpInYG4mJ5NZEIj0HuLy5RiqeLS7qjixEdkt+qt0R8btmLu0COxIieeAXJ8N
	RJmZb/z3pf38O10CFPxRD9WJXftzq0l7QOL7vNGeehLi1CA+OIIVZUgPhtK5J43HMA5iSeb5tsm
	JJCVkpr3WoZ0MlthcipB+4X22TupE8G47/95iNHnLMZC86SEdpHlRw6lB45L4tf1rSopWxQwSEn
	XrQee2L5rjBEbZMUquRVD+J90CLMhygtN721JRPq3xttirCMZTR0CcRbiCssAN4qgwA=
X-Received: by 2002:ac8:5746:0:b0:472:1d00:1faa with SMTP id d75a77b69052e-48c32ec0727mr11918911cf.13.1746182293942;
        Fri, 02 May 2025 03:38:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKHvEk56VJXvXDqb2SGsRRKO8oGVRV2j6K8YXDo+30VsX8SRDqdBcc7f+npY1XAg3WGjVVIQ==
X-Received: by 2002:ac8:5746:0:b0:472:1d00:1faa with SMTP id d75a77b69052e-48c32ec0727mr11918771cf.13.1746182293538;
        Fri, 02 May 2025 03:38:13 -0700 (PDT)
Received: from [192.168.65.113] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1891a3bf9sm30951066b.50.2025.05.02.03.38.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 03:38:13 -0700 (PDT)
Message-ID: <bd1ce180-1282-45f1-a893-5cc097eb6613@oss.qualcomm.com>
Date: Fri, 2 May 2025 12:38:10 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] clk: qcom: ipq-cmn-pll: Add IPQ5018 SoC support
To: george.moussalem@outlook.com, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Luo Jie <quic_luoj@quicinc.com>,
        Lee Jones <lee@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250502-ipq5018-cmn-pll-v1-0-27902c1c4071@outlook.com>
 <20250502-ipq5018-cmn-pll-v1-3-27902c1c4071@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250502-ipq5018-cmn-pll-v1-3-27902c1c4071@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=B7i50PtM c=1 sm=1 tr=0 ts=6814a097 cx=c_pps a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=UqCG9HQmAAAA:8 a=Mz09UsMhJyW2FU7oNKkA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: YAT3jL03CvymbaobS2ZVmAg1TuY1zf2G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDA4MyBTYWx0ZWRfXwYZhn/0GCGMm MyL+7fmMpp/pWjaLl0BMsyF+gj39jg570g9KTCztttnamz7on4FiZKabVY+YkVPfHRS0vEK8rVL ftPWRdox9xURh8TKuP/wFfyz8Kp5zdApSipjwH3c6Vd8f/5y1QN8e6vL0J1XEj0uRFWCauLiOYc
 otmQ3BvDq+bz9jRpqnvhPHiLSFmXnexKOpIt6zefR3X0reVASeEiWMRISQsYBMSz3kYMy/6ZQYD Lo6LpoxLLWi3G1ZhE51uRgFEnBGQYp9oRwkKPAaD+Psg1sQ1vjLLPIu66y6eUOG5pKUOGsNpOLT jyTozq6GP0AGDTiJWNDsZeuUEcKz4FbGKeRvgb//jqA0/FR29HhV0vJKmRbKGBLlO7x6QFoULyy
 Ne+XfcsJBMFq51tKvu5Wul0Zil53XMoLSwX663zEc+lqLNxLCe2jsAbG4l0rMuXpIXVvnBy3
X-Proofpoint-ORIG-GUID: YAT3jL03CvymbaobS2ZVmAg1TuY1zf2G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_01,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 spamscore=0 clxscore=1015
 mlxscore=0 impostorscore=0 mlxlogscore=691 lowpriorityscore=0
 malwarescore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020083

On 5/2/25 12:15 PM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> The CMN PLL in IPQ5018 SoC supplies fixed clocks to XO, sleep, and the
> ethernet block. The CMN PLL to the ethernet block must be enabled first
> by setting a specific register in the TCSR area set in the device tree.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

[...]

> +static inline int ipq_cmn_pll_eth_enable(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	unsigned int cmn_pll_offset;
> +	struct regmap *tcsr;
> +	int ret;
> +
> +	tcsr = syscon_regmap_lookup_by_phandle_args(dev->of_node, "qcom,cmn-pll-eth-enable",
> +						    1, &cmn_pll_offset);

So we have syscon_regmap_lookup_by_phandle_args() and
syscon_regmap_lookup_by_phandle_optional(), but we could also
use a syscon_regmap_lookup_by_phandle_args_optional() - could
you add that in drivers/mfd/syscon.c?

> +	if (IS_ERR(tcsr)) {
> +		ret = PTR_ERR(tcsr);
> +		/*
> +		 * continue if -ENODEV is returned as not all IPQ SoCs
> +		 * need to enable CMN PLL. If it's another error, return it.
> +		 */
> +		if (ret == -ENODEV)
> +			tcsr = NULL;
> +		else
> +			return ret;
> +	}
> +
> +	if (tcsr) {
> +		ret = regmap_update_bits(tcsr, cmn_pll_offset + TCSR_CMN_PLL_ETH,

I think it's better to just pass the exact register that we need,
instead of some loosely defined subregion - especially given the
structure likely will change across platforms

> +					 TCSR_CMN_PLL_ETH_ENABLE, TCSR_CMN_PLL_ETH_ENABLE);

regmap_set_bits()

> +		if (ret)
> +			return ret;

You can initialize ret to 0 and return ret below, unconditionally

> +	}
> +
> +	return 0;
> +}
> +
>  static int ipq_cmn_pll_clk_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	int ret;
>  
> +	ret = ipq_cmn_pll_eth_enable(pdev);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "Fail to enable CMN PLL to ethernet");

Fail*ed*

Konrad

