Return-Path: <linux-arm-msm+bounces-88702-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BEC4D17656
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 09:53:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A8ADF301098F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 08:53:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A1803803CD;
	Tue, 13 Jan 2026 08:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DLWgXxEm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hxh2qrEe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9187F365A1E
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 08:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768294426; cv=none; b=fsg/7X5ccnWDUI/k5FeUmifBY0Kh160QpYhQMAM7im7SJIzrLJozo4iAaxmSUxa2Fbjj/M6lalJ+sbBMI2PX/8VhL5q/Vccukur8eRTrEo/Kfppz6mnIsKqSVjLZsd+3zSEfLHV8dZKwHr+FT1iAr0SE1gofd7CtDj5I7cIxGlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768294426; c=relaxed/simple;
	bh=cv7hnS+ut8vOX95nWjWi3gXGn42xQsRCogx9/q2/IGE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XHBOkCiJLW04sH6NJqSwRYZjAWksk3JEItI690QnpbRmZSec7v6LXzrogEWe4NfBKFRf0klJxPlNjaiiGwRmYQ8TD0gFAUCo+ETvhykeRqFaU+oCxuR+umYbS6ltrTBHmaoh9SmBDEEO7dKYzw+yFqLTuzXM1+lbTn3y93OM5YM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DLWgXxEm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hxh2qrEe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D1thWi2752095
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 08:53:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Psi7qEvREtLaJczZVKXOsv3Qvf7qSf/aYTMPnrtk5zo=; b=DLWgXxEmEPUKCfNB
	yg9bLLX50/mZivp9InHL5nStiKptoxJcutUo7HNHga9C/gOdBHBNfPVbek3aIOgH
	CAiBpo0dzb3kNvGHkhOpVakLHNLwrv8KaeTi5d1K5mCqKll7ImLScJ1Jdxhg0DZl
	w3daP3l7TmXcDnGY9uwWsFWD6RvXTqy7zZVeqy3rl1Jb2DClEjk2L5zITsmmt4U0
	ArdqJTMsXEb+86+JOeKNi53YzpNXSLEqKN+AZDYqSOdQ46Ul3SFb7r2kYawktSN3
	h0Z+noFJvi+4wk7BzjWGaztKEsP7tZ9SlIeWrGP+ZJAzmHtfK7lMQ+mIpYtyIahw
	Ij1HIA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnctjs30c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 08:53:43 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ede0bd2154so22873231cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 00:53:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768294423; x=1768899223; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Psi7qEvREtLaJczZVKXOsv3Qvf7qSf/aYTMPnrtk5zo=;
        b=Hxh2qrEeEMs7GY16HH4UJFjR3YWOms4VjOh/ri8ODrNAGUqzBi+O2g0b100Vb96Jx3
         qrBSCWoKnTpS6XntwzbXvXTlkMzarXaJ84a9MZCVYj3Q+CSvEvz/hjQIWu25P2EKtNb0
         6vEJlcAcCGHSZE6jMDRCO2N9eE73i6rKsexRPzoMdTtVE4fuBU/7R/JoBkfHcSfqjKna
         lVqvJtKNHvPZP5LfEndF/6rtIltu8p73M/THUcVDCoBT5LUWcXeVsaDefQMgbuY7daI0
         kMdv9qibYf9ZOzVNS3URW9jrswpFhtmZm4Ohqo3EFjtqdbQHL+hte5jRu8/Sq6P9F3Gz
         oVKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768294423; x=1768899223;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Psi7qEvREtLaJczZVKXOsv3Qvf7qSf/aYTMPnrtk5zo=;
        b=slE/uVtusUHkQmmSEyxwjZVWYZPgTH0OgYuOKjAIiU5RlZoiVzfIiImfISBD6Ll1Po
         sA8ywTK6EEb6OQc35wKzAChihB0wTtEdLC4TxlvcKS6tb8Lie5IjsCM2QqM7r9Ub4WNV
         fTxP8PHaXt5uwJJggMYs6B82giVjhDXmhxOc2dHZAZK+0OQYN2r15USiyeWDXdm44GgG
         vFNwb8Fp/c2jbienakyaSNBKs2ysUhrZ12Xpi8YWiVwat7U2ISfwmzF8+RlUZDVOcXnz
         SJfWvqsT5VFsPqCYcKykUmKZ3tF1tE/17wmIYrxtGz3wZVteP/wRT4T8ZT9jg12sv3gV
         cUtw==
X-Gm-Message-State: AOJu0YzD6iXTQQz42+7ofWuKL+o4kSon9gUo1NUazHOogfJwj7bp+dBX
	8CQ7TsEdvtXUL8TXAoxBRy3Qc+sMXi5ewO8RTxavdZhVXjyUOv/DN6uLUcjbBa6k1puIT1Vb5Ow
	E0mhHravMXhI/hWjN1ykZJLto6pYtWRoj79UmUSqNSGbec1Mc2xxbCAzWDZCiEUcFB2w5
X-Gm-Gg: AY/fxX5xp7ESZYrO/FuKbQjRLWlqN82yvO6FxUrYlqQU3MwLwL2WKUxMuvxTnnfzTn1
	3jCslsUbaSmoNa+7NWlmDN9cY4RFJUyR4YGRs3SzZfQgZpDA3z8hzOXS2mhwhmyZPJUibaJeXdR
	fsVE9Vdff5suiQx1TKsKzSaoM6KIZEwNQGlwul8gaGqT8UD6NIxpoLphH31Z0POXqpfDNaJtHmU
	DW6SVzGKB0LCPH3dRo2kUCV45jlo2hZdQzm0QG82fk6eUo10R59yJTioEPIwSURqY7U9z1vT37h
	fWMpjdLmpuPXqHo2iFZ2AXVDVZpEV/KZ8H10psxoS2TT+HjlLltMsH5YWajSddzUXqNzM7OOSc1
	ByjDytboW+kZJkx5nPRImfI72Nqei6fGOqMg5iOikFC2CO5+glBmg3wDm4sEJIMFU69c=
X-Received: by 2002:a05:622a:211:b0:4ee:2580:9bc5 with SMTP id d75a77b69052e-4ffb47cfe1amr231915501cf.2.1768294422962;
        Tue, 13 Jan 2026 00:53:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHSQe90rpoUq/AXRxsY/4nRMXlotKUzchkhtZgMqGYLkUq6f0eDYLcR2EofKxgr7vGuSq+P4g==
X-Received: by 2002:a05:622a:211:b0:4ee:2580:9bc5 with SMTP id d75a77b69052e-4ffb47cfe1amr231915251cf.2.1768294422543;
        Tue, 13 Jan 2026 00:53:42 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507b9d51basm19593087a12.12.2026.01.13.00.53.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 00:53:42 -0800 (PST)
Message-ID: <233f73de-b247-4b22-a079-5bd3f5ece5cd@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 09:53:39 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Correct
 reserved memory ranges
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Gabriel Gonzales <semfault@disroot.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        Biswapriyo Nath <nathbappai@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux@mainlining.org
References: <20260112-xiaomi-willow-v1-0-8e4476897638@mainlining.org>
 <20260112-xiaomi-willow-v1-2-8e4476897638@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260112-xiaomi-willow-v1-2-8e4476897638@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA3NCBTYWx0ZWRfXxqIBrrYhLk2B
 JUNiKyEAudwaXDOF9SGaxA6laoAtcCKSMLqcHMIuoJuEqFH4yVxPASGiI8pu/de8q1Xjlx4fTJj
 +m9KIdi1cB/SoQs50x6dhYizWLWFxOpfF4DKg+2/ZY50sHshZirdHJUugH0cUe4Djrofxtq+E/j
 z4GTSnH7/rztgeNLyGQ6xSHtVHJDX1NI+fK0VlQK2DSPurjfyErX80dhUOz4nquAi6jdFmXS4cs
 T7Q3N7nVx6VfTCWv0kExVcrAsNV5XqnT+FcggYOVH/ZmeMXQeb4P+Og6UP9K6hl8CfUHvirycyC
 ssk3tg1bZyP4l6Ar141hsvbWSkPugUH8Ud3/pIs4+yQr2RTjrjEEsi5K1SDKk3pJWURE2oarOER
 42an92LDvneCX/h9TVIheYg2alRPJqQ54t9b4e0AmWHYMXRBf0jfchinmo5ySZ1CfIsOHVuvLqw
 pOl3XA5nfUl4LU7vDWQ==
X-Authority-Analysis: v=2.4 cv=Ls2fC3dc c=1 sm=1 tr=0 ts=69660817 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=OuZLqq7tAAAA:8 a=D8lG2y3kz9upFi25nxsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-ORIG-GUID: qJ3stuwSWCmAaYSwbg_FEpX3v4QWTVu9
X-Proofpoint-GUID: qJ3stuwSWCmAaYSwbg_FEpX3v4QWTVu9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130074

On 1/12/26 9:13 PM, Barnabás Czémán wrote:
> The device was crashing on high memory load because the reserved memory
> ranges was wrongly defined. Correct the ranges for avoid the crashes.
> Change the ramoops memory range to match with the values from the recovery
> to be able to get the results from the device.
> 
> Fixes: 9b1a6c925c88 ("arm64: dts: qcom: sm6125: Initial support for xiaomi-ginkgo")
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts | 44 ++++++++++++++++-------
>  1 file changed, 32 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
> index bf03226a6f85..4c548cb5f253 100644
> --- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
> +++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
> @@ -13,6 +13,12 @@
>  #include "sm6125.dtsi"
>  #include "pm6125.dtsi"
>  
> +/delete-node/ &adsp_pil_mem;
> +/delete-node/ &cont_splash_mem;
> +/delete-node/ &gpu_mem;
> +/delete-node/ &ipa_fw_mem;
> +/delete-node/ &ipa_gsi_mem;
> +
>  / {
>  	model = "Xiaomi Redmi Note 8";
>  	compatible = "xiaomi,ginkgo", "qcom,sm6125";
> @@ -36,28 +42,42 @@ framebuffer0: framebuffer@5c000000 {
>  	};
>  
>  	reserved-memory {
> -		debug_mem: debug@ffb00000 {
> -			reg = <0x0 0xffb00000 0x0 0xc0000>;
> +		adsp_pil_mem: adsp_pil_mem@55300000 {
> +			reg = <0x0 0x55300000 0x0 0x2200000>;
>  			no-map;
>  		};
>  
> -		last_log_mem: lastlog@ffbc0000 {
> -			reg = <0x0 0xffbc0000 0x0 0x80000>;
> +		ipa_fw_mem: ipa_fw_mem@57500000 {
> +			reg = <0x0 0x57500000 0x0 0x10000>;
>  			no-map;
>  		};
>  
> -		pstore_mem: ramoops@ffc00000 {
> -			compatible = "ramoops";
> -			reg = <0x0 0xffc40000 0x0 0xc0000>;
> -			record-size = <0x1000>;
> -			console-size = <0x40000>;
> -			pmsg-size = <0x20000>;
> +		ipa_gsi_mem: ipa_gsi_mem@57510000 {
> +			reg = <0x0 0x57510000 0x0 0x5000>;
> +			no-map;
>  		};
>  
> -		cmdline_mem: memory@ffd00000 {
> -			reg = <0x0 0xffd40000 0x0 0x1000>;
> +		gpu_mem: gpu_mem@57515000 {
> +			reg = <0x0 0x57515000 0x0 0x2000>;
>  			no-map;
>  		};
> +
> +		framebuffer@5c000000 {
> +			reg = <0x0 0x5c000000 0x0 (2340 * 1080 * 4)>;
> +			no-map;
> +		};
> +
> +		/*
> +		 * Matching with recovery values
> +		 * to be able to get the results.
> +		 */

/* This is an unnecessarily
 * squashed comment that could
 * easily go into a single line
 */


> +		ramoops@61600000 {
> +			compatible = "ramoops";
> +			reg = <0x0 0x61600000 0x0 0x400000>;
> +			record-size = <0x80000>;
> +			pmsg-size = <0x200000>;
> +			console-size = <0x100000>;

Does your recovery image not specify ecc-size?

In my past experience, that led to much better results wrt the data
being actually readable.. you might want to rebuild your recovery (or
at least the dt and repack the boot.img) for that

Konrad

