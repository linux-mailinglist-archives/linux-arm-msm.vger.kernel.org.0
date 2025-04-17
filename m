Return-Path: <linux-arm-msm+bounces-54690-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 706E3A92C88
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Apr 2025 23:10:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 815261752AF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Apr 2025 21:10:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECE33F9EC;
	Thu, 17 Apr 2025 21:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jXgG5wCa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A96F20C48D
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Apr 2025 21:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744924242; cv=none; b=e0gw576FPmQa3+/SxAluAfMTJPGvqaRV3zncwDR6ntXKY821CKHjS2WQuv5SGqWmICcrsnpBt02hkVs5wlfn9x6nJAEytH1RFt1tftoGopyin+gl8odE7Rcr4Vv8lBI32JYO76kOHTiPAP5yBCt7kavz/arFhq6NPWFbrp+5CUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744924242; c=relaxed/simple;
	bh=zayiWsGQgbypU+9CEl1xh662ru7a7m6M637EKU98BmA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tBTMaHXTi+0bUJjje0X/yFoHNDzsuvchj39yWUOj1czj085EnT2XNOEzyxmMjRS8aME5oVeRMH0EKMsu6hHnXYOS4cMX28T2NKAbI0uASXsAJlhtOg8sBIQBQB+tqTiztOfOXGH7hNRR4E8Deyv/CS3vbAa2xB7BZJcKSFMZv9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jXgG5wCa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53HCldOg008818
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Apr 2025 21:10:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W7BgY9XqHUX3hFGnIp/2PCnU9QUDjev+cgR8XFlagS0=; b=jXgG5wCabCGSAiOy
	y5Ofsvz26d37XCFhUVZm4qHe6aDKHsYrFWya6puT0zDqjq/NIg+QnBZ+bAWhVzum
	oKpuqFP114+RO3uU/snSjBF++Pnli03emu9X/G3Qt23AATbP7Jkb0pQEkw6dAJA9
	QakHLlboP/o08WcF75SHPIUKxvdYcw10ErPIKP3p2VYYp3l4Kmjhb2diW6DYLcsr
	+Hsh5dtLYsfEgGlN3NPAe8ED36VbBXBhCUcKLURqmE4DXk85tzv9PxUIyx18tGQ5
	eB0ihiLw4smVlmfQffTJb3zXeaNGdENTbaSYDVakMDqgev1du3GqyPSihspHandq
	AUexxg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygxk8429-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Apr 2025 21:10:40 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-47aeab7b918so614861cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Apr 2025 14:10:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744924233; x=1745529033;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W7BgY9XqHUX3hFGnIp/2PCnU9QUDjev+cgR8XFlagS0=;
        b=FqgtHcXchU5YM4Gv9df/xYBd3GLWStVyLkh4jdTdQAK0Tb3p0nrb1ZJtPETY2fEimW
         40vhQtjprauYWFwu5Z7TJCqabLsb9xtGckHRwHXJYhbu1Xlg1hk10e1DkovVL60M6pXB
         uGrC0zw68Ny+lrOADCX3PfVdxT757ZjZrwHP7KUQU5yPRGrHueq30R+8edepI4OjyfAv
         Tg1ScHHI0weWmYCmHFckgcQ74FPjmqkymvty1mX6Q3HEnK7XBpYEdmggwvqokaqIYrt3
         a09LwFBxJqixOpiAHy2ePDFHAW2H1NhDp5jthbQwwJTg36S/vcHXmA22ZWB9Dk1pmuZ9
         vAAA==
X-Forwarded-Encrypted: i=1; AJvYcCU6Jnmur1rVp/AxFaIye2pXP1ToJJL/b4avbd1Rz7+2S0h+02H+qKCCF/1Xse9kjoNU2qbaw2Y2RrtOGFvR@vger.kernel.org
X-Gm-Message-State: AOJu0YwAZrEP6Vhe3IgrD+92RUBAYVw0Tr7rxz8GC9PMBZSekSQzCTX3
	7sL9YiRx6Eb8owhRGzPpjepDfFLPbuYz4gLvo3IvZQTY77KZfpCAl7fimHP/3aujaTpKOh1uAGi
	cTuhR2w5IdnDD7dHTw4PeNWrhjWuMZ8m+Yrh8W3ZHXvDwrE0ATL4DO2MH65lGh3Cv
X-Gm-Gg: ASbGncs+xQW0Lc925uGT/3+iiIZENLx34E4M24OqEaie1Rvp3DleYbn+QBem0wNZ1H9
	mcJFqGhpAbxd4HHSPkoMpEw0hGbtNf52eExJSO+Peqm4RUHUgautoTtiE1Cd3fTPX7Mo4CuSsO+
	QvI7/BXRb9uM0nWSUjdbCRSPqAbh8i7kgycwrDtMv6z3uV01LSEcJsO7TxRoKf+6TYVlNPJQDGP
	ALVgR0Ourc+onOuEve82T8AN/4yUQA6m6yfy5jlFGIagFqaCHyRpcmynC6gRqOx1goGGeCIOn7R
	hiHJyLuxtuefCy+CrbZV2wpgegezdrj9q0AkHr3ZlBnLSTFUG0SflXyA8So2asCAhg==
X-Received: by 2002:a05:6214:4002:b0:6e8:f645:2639 with SMTP id 6a1803df08f44-6f2c455d583mr3156506d6.5.1744924232784;
        Thu, 17 Apr 2025 14:10:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKtWdxfBKZ2i3dNXJvyLNKutWRDck70NGeLsfxcSiel5Fprx2Taw91T8qGaP9AVoaybDiI2g==
X-Received: by 2002:a05:6214:4002:b0:6e8:f645:2639 with SMTP id 6a1803df08f44-6f2c455d583mr3156306d6.5.1744924232396;
        Thu, 17 Apr 2025 14:10:32 -0700 (PDT)
Received: from [192.168.65.58] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ec10ed0sm39494266b.36.2025.04.17.14.10.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Apr 2025 14:10:31 -0700 (PDT)
Message-ID: <5fa5cade-fefd-486d-b1a7-622f3677c74f@oss.qualcomm.com>
Date: Thu, 17 Apr 2025 23:10:30 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] pmdomain: qcom: rpmhpd: Add SM4450 power domains
To: Ajit Pandey <quic_ajipan@quicinc.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
References: <20250417-sm4450_rpmhpd-v1-0-361846750d3a@quicinc.com>
 <20250417-sm4450_rpmhpd-v1-2-361846750d3a@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250417-sm4450_rpmhpd-v1-2-361846750d3a@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=WecMa1hX c=1 sm=1 tr=0 ts=68016e50 cx=c_pps a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=h62wbvEV51DO9j2QOb4A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: AmRxxxOYxKV_dQcS2jeh9ym3p2JUoneh
X-Proofpoint-ORIG-GUID: AmRxxxOYxKV_dQcS2jeh9ym3p2JUoneh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_07,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 mlxscore=0
 impostorscore=0 mlxlogscore=999 spamscore=0 malwarescore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504170156

On 4/17/25 7:07 PM, Ajit Pandey wrote:
> Add power domains exposed by RPMh in the Qualcomm SM4450 platform.
> 
> Signed-off-by: Ajit Pandey <quic_ajipan@quicinc.com>
> ---
>  drivers/pmdomain/qcom/rpmhpd.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/pmdomain/qcom/rpmhpd.c b/drivers/pmdomain/qcom/rpmhpd.c
> index dfd0f80154e49d882a59dd23a8e2d755610c896b..078323b85b5648e33dd89e08cf31bdc5ab76d553 100644
> --- a/drivers/pmdomain/qcom/rpmhpd.c
> +++ b/drivers/pmdomain/qcom/rpmhpd.c
> @@ -360,6 +360,21 @@ static const struct rpmhpd_desc sdx75_desc = {
>  	.num_pds = ARRAY_SIZE(sdx75_rpmhpds),
>  };
>  
> +/* SM4450 RPMH powerdomains */
> +static struct rpmhpd *sm4450_rpmhpds[] = {
> +	[RPMHPD_CX] = &cx,
> +	[RPMHPD_CX_AO] = &cx_ao,
> +	[RPMHPD_EBI] = &ebi,
> +	[RPMHPD_LMX] = &lmx,
> +	[RPMHPD_MSS] = &mss,
> +	[RPMHPD_MX] = &mx,
> +};

/me wipes glasses

Is there no VDD_GFX?

Konrad

