Return-Path: <linux-arm-msm+bounces-61928-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5C7AE288C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Jun 2025 12:17:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 81E941BC1025
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Jun 2025 10:17:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90FDB1F63D9;
	Sat, 21 Jun 2025 10:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S1XOAxxl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62B71D8A10
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 10:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750501025; cv=none; b=PVqGX/dgIWXk3BcbIO3VAAsyahwEmI3LTUY6yO8nQUkjuxnCPzzMDa7ZAQsivTo8OXN+wn2UsZ0RphPJOP/fn+XP9FZCzlB7WR9989MlrPpo0IbM7wM97eM1vSv8GJolbS2wDU6B5ON82eQTzf3Y72FXzmEOgLloWHBmQn2T9C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750501025; c=relaxed/simple;
	bh=vPnLzFJwFahHeUricYEurdfVj2ke+giIWHeToRhHl8w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YURrGTlObuRvwP25J0R96JrEzsZYtlgL3eOjFfJyj2s5AcPI07m2JXEznfaU3LMz6F2BFwVAFyp+79YNiF5j1v1pt2AXtMlddqHv4TW+0ZMrVGnQb+l1b4mj3BI+Nz1sh/nN1Du0ac0kdtM5uVOo/X4b8XiGn+B4AIN6v07AX0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S1XOAxxl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55L6Vw5U017496
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 10:17:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mFCLLwicRIT/ld44aT8z3FJPYEU6pXL2JMcxeaCeN90=; b=S1XOAxxlrWQmLOBg
	W2q+JtbyfgaShZZzyxuoiy0TirvqNYUrMCSOTmTFq9Fd6+pghIYwyh641rzedcV4
	3J2J3JvEXiaNBORk0x5KhSFxPt0SK+0vHFf4/Nkk/5er1teynZTiyIPfegPLU9e4
	Ks2QuSRZpuKLoDjKO6mQ5O3zRo+CvIjByiInsh3aeJ1576qGzc0z+Gu34rSTuhao
	fjsOyb37udhbvmVEEt3YA9L9GWV95FmChH4wA6XWZcgTPz7ipI5Ni992g1afeebv
	L/ZxI2bxM9Kdc+4ZI9rNWwOparLexDLFM45AFTM43wCC/AQkeyiEw1RXc1a/kVAJ
	YKEoog==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47dpg20bhd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 10:17:02 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6facde431b2so4558256d6.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 03:17:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750501022; x=1751105822;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mFCLLwicRIT/ld44aT8z3FJPYEU6pXL2JMcxeaCeN90=;
        b=Aa0shKJQbI841/p+ZXNWIuND40futRTlegpvw7IrJc1NC+jbDvjPGiFrAAsdMWtBE5
         dKFwTPdwMYibQFCgbaBfYm2JXGVfNw4F5KCNPaWcr3muvKt012jo3E4XrXuXhdoXIZPo
         h8WYsXi9Q7HSgN8UvJLv3Vzv45BUskh2t1RskWs5MwQy/HESC3JuLm664vNnGfhJn5vv
         tGMr2p/U3gG3lc4IlIQfQsDBJqWtF+ATa0b/qKswzzvydCJHLgbHtTZENSNJcXJjkfcf
         yu3qEjAbCgbqyHixik8+yM3Kw4s4XoD0SlLQE6Z0awSgfWlG2FFi09kDhnFqDvJBjRxG
         6Saw==
X-Forwarded-Encrypted: i=1; AJvYcCWeecEKLmTayMwSetem6ykNRgBpsh6FcNOSBEX4yzA1pJW+jQuMb2lvNJ6d8YaDcLlpBLrXRfM+5Fw8NJg1@vger.kernel.org
X-Gm-Message-State: AOJu0YynxQQivbCIlhHA4lPvalfKiXGuTK2KD7FiT/l8hg+srN7/rwli
	SbYa+kx/F4Hri6+JKQb/DA7IquzjTjp4/e6YeA+UmMQzn2z55ktt4UsAo1tIWDrRt/S940rTvI1
	Kz1md8SENKzXjUVVyAiyGC+Xi1JN1rK4+4OrnUaO4cTgpJ1EiThFmdJTCvuijB7zKduS8
X-Gm-Gg: ASbGncuaVy7o+P/RZY4H1afGM3Oqv5Qg6xLNCnbN7RjCqX4XVu/tBiUWRP9VfZpvsxv
	WJSaGlPXRp7OMkcxtiz16aF8efPI04fwgD9vbfKwD55Xe8pMIOJ/0DmRB4muSoPNV7K+jmg17XD
	h2k4E7uyRV1QvcyS9ssS9YDd3QfHCwUzODMtYnwtVMvgHbRem5l3Cc0xVAfSRcXo2dFbKGugdDh
	Ud+aC5C9MVUL8yVeJj/FMsDnWNDWne31nXS/VkzRIYl1bysJWQN/bj4PIf6w1QbfrkAo6XuABhO
	4xY4Ln4IMHtV06KaxrSXbRb+8v43q9Z1N2mFMqDmICFNIMQnTH0/6sakrBpLlnOCH0Ty66J6wXq
	fDi4=
X-Received: by 2002:a05:6214:2345:b0:6fa:c46c:6fa9 with SMTP id 6a1803df08f44-6fd0a47e0f3mr36467896d6.4.1750501021972;
        Sat, 21 Jun 2025 03:17:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGeGPqQjG6xCSUjFvNLWJwXCnIR+1W/DIRu1mmTytQ+klkZrMyqX8o5SSfXwinRdq+7CTGxPg==
X-Received: by 2002:a05:6214:2345:b0:6fa:c46c:6fa9 with SMTP id 6a1803df08f44-6fd0a47e0f3mr36467716d6.4.1750501021575;
        Sat, 21 Jun 2025 03:17:01 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae053e8082fsm337209266b.8.2025.06.21.03.16.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Jun 2025 03:17:01 -0700 (PDT)
Message-ID: <557166bd-cbe2-4a7b-bd6c-8daec1cecc3d@oss.qualcomm.com>
Date: Sat, 21 Jun 2025 12:16:58 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: msm8953: Add device tree for
 Billion Capture+
To: cristian_ci@protonmail.com, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20250620-rimob-initial-devicetree-v1-0-8e667ea21f82@protonmail.com>
 <20250620-rimob-initial-devicetree-v1-3-8e667ea21f82@protonmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250620-rimob-initial-devicetree-v1-3-8e667ea21f82@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIxMDA2MCBTYWx0ZWRfX6PyYLWpnFl1Y
 up14kjD8OB0hpefsxHi8ciaNOIz5k6Cdvh9O4Y3UWoM7LVkTvqSxR8zU0BBtPYWtbsIUbYOp1Ty
 9Ynb4eNq3PXR14hfHePj8BsT2HqPeJkN6EK77oTDA/ZESDd2P9p2cKJTlxYYny3rYUUbZwiweRg
 li6WZvcFSIOZOrECN5GWkiQToXeAWIjZBo1jyjbn7SY9SjdJb45a4DcmizcotZn6z1powaNotzC
 XQlEc/0VqbEYR+MS9dH9j5fztG+ZahsN/j5VxQVU7UPvjf53Cv0w7u0YqJwCKSwsqwBfp6M4SPg
 HccGpVmBpZpBeAzQf5di6DY9CMmrw7cnnaTlNfouxeCbXCpJCXG///XaxQSzGDU/BKRUoRB8hQx
 I8HwAAxiC4QSCcX2NwB0V/Oh7zYREfOCCMvMeG93ufd3wsUFSLz59TEyYXXqKI6IghSf3Fm0
X-Proofpoint-GUID: tVXEH7JBw_1ws5u3MRXmmKEVk2zgFbbA
X-Authority-Analysis: v=2.4 cv=fb6ty1QF c=1 sm=1 tr=0 ts=6856869e cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=sfOm8-O8AAAA:8 a=oi8dwGYPpvFf8akzgh4A:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-ORIG-GUID: tVXEH7JBw_1ws5u3MRXmmKEVk2zgFbbA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-21_02,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=627 clxscore=1015 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 bulkscore=0 adultscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506210060

On 6/20/25 11:51 PM, Cristian Cozzolino via B4 Relay wrote:
> From: Cristian Cozzolino <cristian_ci@protonmail.com>
> 
> Billion Capture+ (flipkart,rimob) is a smartphone released in 2017, based
> on Snapdragon 625 (MSM8953) SoC.
> 
> Add a device tree with initial support for:
> 
> - GPIO keys
> - SDHCI (internal and external storage)
> - USB Device Mode
> - Regulators
> - Simple framebuffer
> 
> Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
> ---

[...]

> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&gpio_key_default>;

property-n
property-names

please

[...]

> +	reserved-memory {
> +		qseecom@0 {
> +			reg = <0x00 0x84a00000 0x00 0x1900000>;

'0x0'

[...]

> +
> +&sdhc_1 {
> +	vmmc-supply = <&pm8953_l8>;
> +	vqmmc-supply = <&pm8953_l5>;

you should add regulator-allow-set-load to these vregs

[...]

> +&tlmm {
> +	gpio-reserved-ranges = <0 4>,

These GPIOs correspond to I2C/SPI_1

<135 4>;

And these correspond to I2C/SPI_7

Without much more knowledge, I would guesstimate one of them is
for a fingerprint reader and the other for NFC eSE

Konrad

