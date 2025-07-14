Return-Path: <linux-arm-msm+bounces-64817-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B02DFB03FDF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 15:29:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 172307AD4A9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 13:27:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD8E9253938;
	Mon, 14 Jul 2025 13:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KraOIjuM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCFD6253958
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 13:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752499711; cv=none; b=g4ttqZDw8UlciwLWR+MlgGq6Xe9QoF35vlT2NxVRenisWcmF8DhEfS/bMyngSvs6QjsVmNQ86hEuT9FNoZOnMP6DFnR/Sr14jj0+3qQ3FN2pWzDa8LQmmPJnM218K+Yo80fy99UtdXi9/8eRc+qskK+pOvwkSpSygzsTSp2zCHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752499711; c=relaxed/simple;
	bh=oHEQKwBatWKUIOpL/sm9kI7CU4MvbWDSdi+bybgSb3Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CqE9nadmmGRkurJpjPtDytmpNgggGb0eC4ceGjBY7NA0+rA99277XWqnhC8FsXZCQ7odo0f3zniK9B551HLDKn4cw3z7YcMbNBfLm14WaSKJpOD5tCQk4wS5109V8d+7FSvwXgX8TkGaToatFiYwJEMhiqEIoIvxt330nblOZ3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KraOIjuM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56E9lL8J003735
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 13:28:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ob9U6sQ6B7CRRePb9koAuef4V+KwLq5wrBJm+EnY7mw=; b=KraOIjuMYxXVQhaX
	kIZthTVA1UDkARf529A33L3Ay1OXUTbakbPknENdM/vzBHHWr5cqBo/IfPw1Sjha
	acRjGHbUtpZ7Y8ks9h8O0OtODmuuAtzk3beBDqBQBMTJbo//x2ylTASYwks2rvmr
	dYsQlszRZsS2qdfZ88J0cMxzxvGQ96fEiDVWGaf8Q8O1qFY/SdtYaVkCMXWkCSqx
	VRP1ZUSShkQxeKLuKjnzA+K+3oeGZch/Y0WVSHbZqqOBnoztqLmFfh1DPt4VzZ4t
	SW6Eh8+f1yQdfjkfzXvQTnWeSeoUPu6WcZ/EJ+SSayPySP17m9jo9dBMkl+l53MY
	oTI3Ng==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ug37vv2s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 13:28:23 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6fabbaa1937so15481136d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 06:28:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752499702; x=1753104502;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ob9U6sQ6B7CRRePb9koAuef4V+KwLq5wrBJm+EnY7mw=;
        b=YisC4NBDsSnAxUoBKJ0EldgRvFOuoAvxdHGC45nn7ZvhmOFhYWxFHy8u5mrNlEzQiT
         bnogfLauk5wBMv8Cc/nF1Q2iS8NpSKzBKMOBgEnx1Q8vm1LijyZJkb1f7Lx+Lrp7TiAA
         XRz4Cz+QrpXxyBAhGPQyz5pLgns7/jAXfNZgpkIUkn1TGIqbsUI7FN504JxsaS3jccmn
         2TXKH1f0vLwmbR3XAPn9E6Or+Nfda0Y2qPSO/DMKEFNEzvgHGnWDfChIFw1NKyRwnLgS
         GbGq8pFYnkQk1tIH8lFP4sXc3ZjwRWEd0upujnm4EqDYbcxNqXsGaqME0bdE9hld1ibK
         irrw==
X-Forwarded-Encrypted: i=1; AJvYcCVMiMuICa2IC94OLJhTuHRl7pVsCct1qkQCJpu57FJI3nLveklgE2UxOjLxCWp/bsDc4G8H/GOXmc9o7Pry@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7GlM+BbQJCyVilAEdd2/+2FRWaqWkjxdlyLFstNFbNBeAVTc9
	n0uFBurhsOEwxvUcuVT7VNxlFqCcg5TCbbY3iyAwACuHxzhW98ZJwmuN/+d6zwNCusMa58QYZaH
	AmXd3/htVGbpLImvUzFHvU8GdZ/JgYPQeCIgxjcZVjcNCAvcrrBYsAz6UxAexb2lxEhHP
X-Gm-Gg: ASbGncv0hKNPUXsL+Q8BbVav93WfBKwruGk9kmygaafXVDuzsUEVVgG+aj7rxP/sqPs
	3a7LUhe8xK8TlYl1DiXng3/gKm6lCvt1fFlR7wfQIgAFjAZHOqOWGW+V10cFL0qddkY8Crgk38s
	JZwFQ1V9mQfCFF8dtyLe6+YA3UUzil1ZVd9/0/0mj8X2EIbv7GWMjjIB4unMKdMqNIaBqh05rZ8
	UDcwxJWt74dRNn72JIfAKGNnm2NhvV9eQmVM43gihuEYs9n420w3QAzYvZXlJitJoTx52RwANJA
	eLtNNM/tkOZUMiGmVP3+ljaOwoKTpYrcZWEMQ6c98veonp8pb48K1T5zW2A4Jeg5RyL5v6dZfEF
	PaRWxlStld8vT27TtU+qC
X-Received: by 2002:a05:620a:394b:b0:7c0:b3cd:9be0 with SMTP id af79cd13be357-7ddeb8a4a8cmr654569885a.10.1752499702313;
        Mon, 14 Jul 2025 06:28:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8Im8XF0a7klJdUS69ADOk3tOusKi5hYyzJtkL4/kjokc0qUJhiJ6sJr4jnvb6Fh5hB1siVQ==
X-Received: by 2002:a05:620a:394b:b0:7c0:b3cd:9be0 with SMTP id af79cd13be357-7ddeb8a4a8cmr654567185a.10.1752499701899;
        Mon, 14 Jul 2025 06:28:21 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7e91a0bsm819346166b.7.2025.07.14.06.28.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 06:28:21 -0700 (PDT)
Message-ID: <fc21ee61-188e-42a3-b9f6-4b81a72d388f@oss.qualcomm.com>
Date: Mon, 14 Jul 2025 15:28:18 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 11/15] arm64: dts: qcom: x1e80100-crd: Add ov08x40 RGB
 sensor on CSIPHY4
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
References: <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-0-0bc5da82f526@linaro.org>
 <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-11-0bc5da82f526@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-11-0bc5da82f526@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDA3OCBTYWx0ZWRfX/R+wp2icyEhV
 mISdGfH+mpYzi+GiFpJHp8uR6V+r4i1pHNqu6SHBBRjCc2tGm8lznyr59tM2ECuyaSbI0qXGjVY
 a3VDFx6y+8PZU2Gfj4CxnhefLd/31O5jYd9HBPukMegGAEP7igjJADTIdpvurX+ep2NwB1lZozU
 Z4UetapmbodA62OmXzeOMiSwyUmB8Qfcr3TwI70nh9d5RqxQZVSdNl6xQuws421NMfjAoHZsGSh
 qb/y6t69xQ9MPe9UxSKy2RktgIpEjI5PmcB6eV+Be3GTUjp9T3EoU3igZxP9RyOK6wOZDHSEJl+
 44GlxqEao6mTj9YnXv8ixHA9munTxHqJAEvUOkC1pwmzPwCyOa22Gg+t+X6NZgzNhtqDtpCC3jT
 4RKZfO7DFnMvRog5Mu7Ak6sgX076wWm+vL2hh/T/QikBybiYLfKgAPZthwh7/YtB/jzmHrXW
X-Proofpoint-GUID: lBZzOnZpxHANZEXARZSTEoZ6lGuRd5cA
X-Authority-Analysis: v=2.4 cv=SZT3duRu c=1 sm=1 tr=0 ts=687505f7 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=qEq-IjhxTDjyFSs2OvYA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: lBZzOnZpxHANZEXARZSTEoZ6lGuRd5cA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507140078

On 7/11/25 2:58 PM, Bryan O'Donoghue wrote:
> Define ov08x40 on cci1_i2c1. The RGB sensor appears on the AON CCI pins
> connected to CSIPHY4 in four lane mode.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/x1-crd.dtsi | 78 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 78 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
> index 08268f60c305cd69baf937fced6d37f2ea788b62..ace4ab2b9fc0faac8233a40220aafba200ff05d9 100644
> --- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
> @@ -6,6 +6,7 @@
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/input/gpio-keys.h>
>  #include <dt-bindings/input/input.h>
> +#include <dt-bindings/phy/phy.h>
>  #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>  
> @@ -996,6 +997,67 @@ &gpu {
>  	status = "okay";
>  };
>  
> +&camss {
> +	status = "okay";
> +
> +	ports {
> +		/*
> +		 * port0 => csiphy0
> +		 * port1 => csiphy1
> +		 * port2 => csiphy2
> +		 * port3 => csiphy4

As I've mentioned in the past, this seems SoC-specific (and perhaps
the csiphyN naming is confusing, as it refers to a lane within the
phy, rather than the index of the instance of a phy..)

Konrad

