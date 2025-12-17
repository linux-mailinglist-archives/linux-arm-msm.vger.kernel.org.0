Return-Path: <linux-arm-msm+bounces-85462-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A519CC6F85
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 11:07:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 761193017C90
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 10:07:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36B413451BB;
	Wed, 17 Dec 2025 10:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eVMChT/m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DpyiKBsC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25DC33986B
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 10:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765966043; cv=none; b=gPQ2QidwqR/8HwAjcF69qT0vLVZDFk+87BMQUwD/OEn/4M6rxPuGIZEf8EIyBHyzeFd0/VYnng4OENHt0efXUR9yVsZBTLKh+zhoYi3cv1MRixa2dIOd9Rn84ydTC68EfIfXHmKgk3JdlFjQMeNmYEOGCU2kE35EEpgVQzaEg8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765966043; c=relaxed/simple;
	bh=rmtr77WcckuQKREEQe88ls3iYCjbrVxLLmMKXZG9jPQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oNjANIp6t10u23a1LKH74hliPKBTggt6n9jo6RHwW2KT8qEU7nCWCk2Va/p6u4/4Q41hwsMxuCOXdWwC9ixoBUHOUbRudi/dzPu2Y75xodDWP9pJJKV3bFJtN7A96I0QPJhi79PMT+Zlymd1b/HowUWa1ZNGp/waavmXewZJjCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eVMChT/m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DpyiKBsC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BH3F0HH1500905
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 10:07:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/0B3hKY44Fs4r+EteTOtXNPrYsmSbEP57G/tUcQvvRo=; b=eVMChT/mEhsUKKvP
	5uX0UtKPijzb/GYfM4vpqQfGPQ1Jw3785Pjfoz5eFj54++X9/U/FFr1AUJA5gDl3
	CJYEBBTp+rjMIpYHQfwbE+NlFlYfQ5n9ogf4Qe1BmB1nkUI1V7Zd+o0ILrhk7Gbs
	nEROVCTFoanudghMFqKzq7A48gDB+O7WkilSJmNF0Uu2mzazOqcnqQalSwxcLfxW
	5PvcDqgzlm/XekzA4pBXz8Zs/DYSf+Jw6o/uE6gSgLqyv1ltd9xdd3iGu01zghHM
	9FRpcu/BMCX9Wpi3pERIm5xCYv62ciWcu/jbG6QX6mbGr+hEgpRS7pDgLs9NAqGQ
	vGXTxQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3kkescuf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 10:07:20 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b25c5dc2c3so102540785a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 02:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765966040; x=1766570840; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/0B3hKY44Fs4r+EteTOtXNPrYsmSbEP57G/tUcQvvRo=;
        b=DpyiKBsCZyXI5t8eGzdW2QGY4295ClfkScpmraDNeIC+1HcqPROmNJTM5PmewO8ObP
         ceqH+aVF91pWaFpsZ8AIPnCVsWmKQiek48bSKa3IFQRw70/SYHSnjKaDV/nN5/ojYzd3
         HErfLOeR8iopd3yVOgHwiyZX/FvI2w0P0KW+hiwW+0e0u4zcoB/f25lflNsrTl6zIxoC
         jGdhnTnrXWB0M7oUsDk8E5zPAnER1gU0U1qLEbqo2XLK+7KNFX5LYQulLQD1FbJ4aWBz
         2cC7VEYWnKH6WVweWOmE6lECehBR13XlS9iNoSa2wShn9pZNB+wLuqteh3iGxCMGizGD
         WP6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765966040; x=1766570840;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/0B3hKY44Fs4r+EteTOtXNPrYsmSbEP57G/tUcQvvRo=;
        b=fwyad5wkcomxYuenNXKcGPXDrjbuDFDB1sy+loNvYI1oQ/zhL2D3DlKSRMcx7H2ydY
         fkBPRjvzxp7DBQbUdp2YMBU9SeFX+4kG3b+ifV637vPyq8+yWgKG3cKFa0HmUtSo2zmw
         1FfDVRS95huOKvtOTIqvkpWEdN0I/IHUgLC8zLabAnnDYnpFNqy5izHJnjGOtt17hqGn
         Rf/mXSQIeRL4CjUCZVQ5x7UMaczCHYfHE+jQnOnFlHLeK1mjyTlHLX4zblafBWmHnDjp
         oFNAbGPk55Ad6Nie0YWnerwkwUxRYnkBhjuQRvj4bFxyZvD8A4XzAieZWPkKtDg3PGmi
         nh6w==
X-Gm-Message-State: AOJu0YwFzWbxCPqafw2lXagzVjhz9SBE0RsKhuY7aasJOrBAdF2te9QN
	A950gIIkP+ZKoxrWtdAxsEaXOCI9XDNH7j9l0CYwrr5KLsQFgkzKRgdY7hz8nK00M8JZ7I5/Nyr
	doq+6tcGVbDJmOHKJlCreuduruMHAmBUommUm9i5U1HOXodPxn4+04HEv5eaBTHrbEMXs
X-Gm-Gg: AY/fxX5BcMeFt8RdHQ8KrBB5ta7pIha2JqNCY/ERyWJEtJgP2ooenlgN1eVvG7JYzDa
	9wUatW/ruvhu5/naP86AzHaUA7YwQBwJWMD+g3GDYXb7eK2hv0yStjd7jq7MVpg5bDSuXm5i5MQ
	sdh7x4xFD1AQOu979GJBKPWWQ1VsEXAWYCpuarYpawfTDw2Zuz5+7OQ36ppIj5Fbg0ep5xLYC4H
	cICY18YMeKLi9ffjrCKaX8yqBIgRrVcmIFRsh1O96Z6GtWPHjCfF3pJ26N9rp+iWC066quxiiR+
	D39Ke7aRc54reflKyaz4WcdxYy40oBwPT1iZkbuDiZVgUPB3CM94J9HSlaf60jUjOMM1o4Z7dKO
	pDXMiICj3eQAefZebFkHsLw8rjjgP2dNSM1MdidmNg3aKEworJPfIogYAMYmJLHJPPw==
X-Received: by 2002:a05:620a:2953:b0:8b2:df32:b900 with SMTP id af79cd13be357-8bb39adc400mr1832327685a.4.1765966039897;
        Wed, 17 Dec 2025 02:07:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGE/kHTqYXgRxAQENiVbeo9GwvhEcQYln0Pbhkg6IQ5Ns2YNeSwcUB/pYHYfr175TBbVpIKyg==
X-Received: by 2002:a05:620a:2953:b0:8b2:df32:b900 with SMTP id af79cd13be357-8bb39adc400mr1832325285a.4.1765966039375;
        Wed, 17 Dec 2025 02:07:19 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b3f5633b1sm1961449a12.19.2025.12.17.02.07.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Dec 2025 02:07:18 -0800 (PST)
Message-ID: <5d258204-097b-49e1-a53a-d35f846ecfa8@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 11:07:17 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: talos: Add PMU support
To: yuanjie yang <yuanjie.yang@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com
References: <20251217092057.462-1-yuanjie.yang@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251217092057.462-1-yuanjie.yang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA4MCBTYWx0ZWRfXypn08QSlEQ3z
 Gbrer7byTfEPmk5xSWo6t+LWKSVjkvGfFqFl7rSi4SVxm4/AVQ2ry3CZkgc+wMazh04i6BUiPJd
 XVDUeWktkRUaO2jIuTr1KHkGIIjp0hE3CYm8em1VanHllD9g0jAg67oIm2fI/SbmXusQtIX4Cpb
 RqXE3ywsblu4hjsikVj0Gv+8FKZLR3dCA573LySsTXULTt4Bt9rP68/9RPB7bgpn8SXVy2v1psR
 iNzIqbhFjmnGI8BguvO8svnYcTNa52zhwryCNqK0+oNeBNR38SbPPKMPrUGx+caMt9waq7GOzA0
 s5vZao0zPoYGhmI1tPM5nfTkAt17MiuGy1eoV9WfTU5+O44vW74srGkFPZPO3x8zWmgPsM3XgDu
 +HqqFgdP5NU7eUU2m7XUTnbOS06COA==
X-Proofpoint-GUID: 6i5tNSdrhI4LtYUC34mY5-fftgUacZkT
X-Authority-Analysis: v=2.4 cv=Fcw6BZ+6 c=1 sm=1 tr=0 ts=694280d8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=BD0yUqfNhgjro36wMb4A:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 6i5tNSdrhI4LtYUC34mY5-fftgUacZkT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170080

On 12/17/25 10:20 AM, yuanjie yang wrote:
> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> Add the PMU node for talos platforms.
> 
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> ---

Check out:

9ce52e908bd5 ("arm64: dts: qcom: sm8650: switch to interrupt-cells 4 to add PPI partitions")
2c06e0797c32 ("arm64: dts: qcom: sm8650: add PPI interrupt partitions for the ARM PMUs")

You'll have to do the same since the interrupt is shared

Konrad

>  arch/arm64/boot/dts/qcom/talos.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
> index 95d26e313622..3ba1e3c1d1d7 100644
> --- a/arch/arm64/boot/dts/qcom/talos.dtsi
> +++ b/arch/arm64/boot/dts/qcom/talos.dtsi
> @@ -555,6 +555,16 @@ opp-128000000 {
>  		};
>  	};
>  
> +	pmu-a55 {
> +		compatible = "arm,cortex-a55-pmu";
> +		interrupts = <GIC_PPI 5 IRQ_TYPE_LEVEL_HIGH>;
> +	};
> +
> +	pmu-a76 {
> +		compatible = "arm,cortex-a76-pmu";
> +		interrupts = <GIC_PPI 5 IRQ_TYPE_LEVEL_HIGH>;
> +	};
> +
>  	psci {
>  		compatible = "arm,psci-1.0";
>  		method = "smc";

