Return-Path: <linux-arm-msm+bounces-66301-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 846E5B0F370
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 15:14:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6CCC51AA3936
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 13:11:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 435AC2E888F;
	Wed, 23 Jul 2025 13:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K+CuX0ki"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9962E7F3A
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 13:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753276177; cv=none; b=aIhQpGWjio/7/kmdtrjKRcrYl8Hb5uH8x6sKBasEsYjv24HLn2f75rq4k2wzARe9T/4jHQ1qS8e3OewvU6bKk5MNK+JqvuY0M8K+JYrKfHisMsTX4475s9O4CfSa2eL7nJXgp5j/bTrucWF0QcF7nmADot7S92VP3UZjS/AfWUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753276177; c=relaxed/simple;
	bh=9bMIpxSp6P/2t9mAoqFS3nb+kCc2rNSG9SuI6TcUh4Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Dr8i/9VT82tPDg8e1AEEYKWTwttVOEoVxRF8Kwq2OQOjgsx99VOPyG/IG3rj5L2Hkw9neJ4ywvBVwoapH5rBAVUblzYBFCEgvRzqxIRSt49vGolCR4N6z+ZYCDxnmbBIWOuPjL2IDDx9ys7fyGsRvM4azZfRbd4bCRDFkfFLefY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K+CuX0ki; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N9RcVc014861
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 13:09:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c1fE2F5w2oy/8xTtLiO5hyxrW9pDzDdrUHLDqce5e0Y=; b=K+CuX0ki4cf5X9BY
	AOGV4DBS00dKH/9foYodblzNrJQjknVLhVv/a0fhKRw1CxZ20xX3QwBDh765KtNV
	djkB+KBxXQEy1KGzRK27tozgbEdz7RF1uLYydzPw2OlRA0erip1kJQa2UT+Pye9t
	BBPwBbX68RzmzCc1Pu3OgvUER+CDYB8hM4RvAPyRrO3Me2Mv8yqwJ8veI97vSr6/
	dDHu8Oqz7HG/7rCsKr6ht1juqoAmNZTLX2ihU/lkGxvq6IdHyHviPJzSK1CO0D7/
	2NERgKuKOR+dwHKUtlz5EQ/hkZogh0Q8yTA3QUmTc30TK4nQWN6iJxQhsdbbzDL0
	0Fc92g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048vbjbj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 13:09:34 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7e2ced79f97so88952385a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 06:09:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753276173; x=1753880973;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c1fE2F5w2oy/8xTtLiO5hyxrW9pDzDdrUHLDqce5e0Y=;
        b=RWnmEFad5mtNO5NUKGJyjYs0rNvkv0daLchbYQqhxVdccVadwcKFmB/HZZQ+hnd5Wi
         jZ2nqGNVdhC8yEsQN16G0iF5rzr+rXsjhQWChOSElaeOXTrfrVqzKsw/azPDd86pwzOn
         Sa/JFQMWwM8wK+cgr9GnDSzVzSzP5oDwuha5CgjzTLn1LPSfHuQlc3SolM2P/EOfVnNn
         Ads+Fd98T7OjCSta44tmiCHN7LE81jVRGer+UAClbuGBRNyR8X2bnH4lvb89gAQgR2Pv
         GfQOTlaQ53vxI2q6FBht+8VZWjJj1fytPHYf2Slai4si6vXut/OpccbxJswe/AZZjPsn
         A7KQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQh+UaoYgvkc6JLqSyLY4rLdFVYasKF6q7QmNJDjp9xKvRzXfrjVwqyFEFQOlZW/lg0umpEouKYAYKVjdm@vger.kernel.org
X-Gm-Message-State: AOJu0YyhJOThjHu5H626hGl86CZ/GUpVs2RsCNS49gnZW5ilO1ia/64e
	WU2EkNoRtJAe4T6H07gKX64h59ZPQXSMrA2ZWaZ8uBzVJf6ue7itOloL6QlnEL6Wn9yFFvAY2H/
	0/BI9Ju9v9XAIrKZ6MhZvlfPRZBAW6BxoEELGePofS0bCDZRtuasHAPsCmx6iuiqBhuxN
X-Gm-Gg: ASbGncuzdlHKjMaytYcRYVrUSI92MFHD6yCbvlIhGCxwOjlDkMO71eyMkse+sitfLPu
	V9kGuZwvRuawMwdsROfREOmvMv/0VS0PAZGXNvyNFSJfbtyKLuyqbIz83M8r5FM+aHSYJKrWx9a
	VxSYQzYkhwQwpaIu4SWLH1XIDmeV4QSU3gr+qUKV8521HMACxl6q7FZRF26zuoxYcYi14XOxt9p
	KEsvQ/B3SKPGmhBPTr7H90nq91q1LAn8eGMio/Nr3a0LwdWZSeZavq3CCuRtQK+mgMVZ1gl5J4J
	vzUNnzr7xwPfM4cWOyFdqaoVoPvlbckTvi1xGcoVFh7Bn0IV6amyKzQO+JGlWSj9ntts1QHjpbq
	+wzzPuzJTThipadzDww==
X-Received: by 2002:a05:620a:2727:b0:7e3:4535:4f7b with SMTP id af79cd13be357-7e62a174a0bmr158139285a.12.1753276173171;
        Wed, 23 Jul 2025 06:09:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEg+9k+t833aHUHXP8ePI1nQxSBGAeS4mxQTKC61GZLuKY579K2Vn6dySszIzHD/n1n2LN2ag==
X-Received: by 2002:a05:620a:2727:b0:7e3:4535:4f7b with SMTP id af79cd13be357-7e62a174a0bmr158137185a.12.1753276172434;
        Wed, 23 Jul 2025 06:09:32 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6c7c77c0sm1045393666b.35.2025.07.23.06.09.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jul 2025 06:09:31 -0700 (PDT)
Message-ID: <75a1935a-b6c1-4339-8b4d-12af9ead51e6@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 15:09:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] clk: qcom: apss-ipq5424: Add ipq5424 apss clock
 controller
To: Varadarajan Narayanan <quic_varada@quicinc.com>, andersson@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        rafael@kernel.org, viresh.kumar@linaro.org, ilia.lin@kernel.org,
        djakov@kernel.org, quic_srichara@quicinc.com, quic_mdalam@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20250723110815.2865403-1-quic_varada@quicinc.com>
 <20250723110815.2865403-3-quic_varada@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250723110815.2865403-3-quic_varada@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: gEXe0DQtF7iiJoj0MacpiXg_vrhBGAC8
X-Authority-Analysis: v=2.4 cv=SYL3duRu c=1 sm=1 tr=0 ts=6880df0e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=osBE9IlwIbL1kcFus-gA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDExMiBTYWx0ZWRfXwX7jVBL5grp6
 o3WAVp/mb9vasV6EHGavR/G0Cd0lopCpTUbas28qXJSEPq2eNa0U4cqp+Uj6MUMqI3tMt0Ynpef
 zPPfWLdokS44pDC1uErQwPj3zWsTMnYm+uRNcYIS1hl/ORN/YacjYIaAyig6pGesH2UMNOeEGVZ
 QyQebXHdz9FzVLwTJJlDoI4G+A/GrpsXrGGdAR/4hiwvVb2JuV5SLKKkWj7EFa/DrUBPFhJOGsT
 MXPYm0ZddDO7wEJKcbsQqEh8HoecTWOLZNSs9GbNBXt2Bqae4OG2bainnK4xjPMQW00iubncbsn
 KQcPq0SS78MlA1thhQQYx/ubCJNtJDOG9XXSLlIvDaNgBClu46Laxd9hOUHdeSbtL0fd+GsiD6O
 tyIT1QAqdwQGdT2D4rqURoHdA59BOtc6P/IGJpkXpfAeG6sh1Cd3gKRAbtxSEwlQu6sFUnEs
X-Proofpoint-ORIG-GUID: gEXe0DQtF7iiJoj0MacpiXg_vrhBGAC8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_02,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507230112

On 7/23/25 1:08 PM, Varadarajan Narayanan wrote:
> From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> 
> CPU on Qualcomm ipq5424 is clocked by huayra PLL with RCG support.
> Add support for the APSS PLL, RCG and clock enable for ipq5424.
> The PLL, RCG register space are clubbed. Hence adding new APSS driver
> for both PLL and RCG/CBC control. Also the L3 cache has a separate pll
> and needs to be scaled along with the CPU and is modeled as an ICC clock.
> 
> Co-developed-by: Md Sadre Alam <quic_mdalam@quicinc.com>
> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> [ Removed clock notifier, moved L3 pll to icc-clk, used existing
> alpha pll structure ]
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
> v2: Model L3 pll as ICC clock and add relevant structures
>     Use CLK_ALPHA_PLL_TYPE_HUAYRA_2290 register offsets instead
>     of duplicate ipq5424_pll_offsets definition.
>     Inline clock rates.
>     Fix MODULE_LICENSE
> ---

[...]

Since the last time this was posted, we got some additional infra code..

> +static int apss_ipq5424_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct regmap *regmap;
> +	void __iomem *base;
> +	int ret;
> +
> +	base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
> +	regmap = devm_regmap_init_mmio(dev, base, &apss_ipq5424_regmap_config);
> +	if (!regmap)
> +		return PTR_ERR(regmap);
> +
> +	clk_alpha_pll_configure(&ipq5424_l3_pll, regmap, &l3_pll_config);
> +
> +	clk_alpha_pll_configure(&ipq5424_apss_pll, regmap, &apss_pll_config);
> +
> +	ret = qcom_cc_really_probe(dev, &apss_ipq5424_desc, regmap);
> +	if (!ret)
> +		dev_dbg(&pdev->dev, "Registered APSS & L3 clock provider\n");
> +
> +	return ret;

You can now replace the entirety of this function with qcom_cc_driver_data

Konrad

