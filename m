Return-Path: <linux-arm-msm+bounces-88171-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CBDAD0717D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 05:15:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 671B7305BCE9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 04:11:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC2A32D6409;
	Fri,  9 Jan 2026 04:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C+KH/p47";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fevexLsz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE3D29C35A
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jan 2026 04:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767931868; cv=none; b=TVcgRsIUgheQSCjeWafIejqTL1R8GaIA0EhXccKbq1NdX6JEpeb2wkzC8ZmXG8tezSwf9qxPSFUHw7K8h4QU2+NJAXciAE/FpN9nI8zE2nmfHTy7cRyZPvPycgVbqZMhQMzC7LnzClSdA5g9lkXC1zMuxY5fMgS+yMZSMwY9i+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767931868; c=relaxed/simple;
	bh=hICcjxGR+Wljz+6LE0ufles6gMhEISPHaCxvzSwsoWw=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=W2ZbhqUEuwuN2Z6ZWT33xQlNg5PwQL8ZHne9bft9a8935cPJLH/5gkEKp0O+OedJHkzdd3llnm7aESaDLGhXSocQvhzqFxcgKPzoqk2e3jYCfWChoS0dom75IVgu2tc6QwrahmR+9fTEabFjoCN4O2rl/hQ4Q7uszjultoP0fLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C+KH/p47; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fevexLsz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 608HkCkl2707180
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Jan 2026 04:11:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ae8UX2cu9IJeZKZROGT+I9ypykXH8VWW5tgU8zONoZ4=; b=C+KH/p47mI4hp0KN
	nlvqbrtdCnaopUVyqMT9Xx0B77iS399s2y+FStoe1YzQwOWt28Ji8A76JEchQd9l
	uX7k+qNlWTwIXjJLgzRwYTgIOYlAZaWT8GvoKbNsoCOjsg3appgQZL160eC5couz
	IhtO6Zqlsti+Z1SoDqnPu3GKG3xsvUDXAZPJPJU5bNJp6eQkfuI3zLJyKz4uTlCl
	V3vaVNCja9YD+IpMPQfZl9zNIKauW90BS9mJOpNZ6Ea3+DMJ6I+WaeSOaChg7FBY
	JsB2gX+xJpGKIf4//l1gHZ88DoSZbrf18ix85cBX9yaZSUkoJLO62FdiVENDsh1n
	RCQc5w==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bj9hqu61y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 04:11:06 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7f89d880668so3430441b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 20:11:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767931866; x=1768536666; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ae8UX2cu9IJeZKZROGT+I9ypykXH8VWW5tgU8zONoZ4=;
        b=fevexLszm+Y25+mEQe9u/vIGFhAFCTOdiscbmTPYWcb0Cn/ht8SkWbMTT0Cz7jhSSN
         0k5Cw2WFxvAeofQBhbeFc2tN+ZLOxw9M12NY3cw5teDS7nhlZxaF2s5Y8ve6uZ5wMCab
         dvR/62GU1rydHARBxC0yew7Gb0ae6zJNDy7j2TStnNRehcXUxGa5c7Bftg5b8KSiqXV6
         4Yd5zdNJoHkhOhBurKo53fZ6yf2ANbck89i+cnjrmcr6+N7T44fIymcQdCp+DPtkuuTI
         UftsqaEbe+3f6xYbGyz5LzBgVz0072nOkUYl1WvsULHPIKkZfujvH2JiGBGkItikseNH
         63yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767931866; x=1768536666;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ae8UX2cu9IJeZKZROGT+I9ypykXH8VWW5tgU8zONoZ4=;
        b=BzYk65g1FEqqXc23hmCkcqjjDG6jVt09JEAnB81rM7WwHbwPBbIRwLKV7mDhoE8vH2
         Oh/WMALb+G0HRmRgJRu9T6ZoYlWmmpcEqYAXE2OGh3iioG+FSFo/bLrTAPqUMCo1+Lno
         V39F3mRHHUeJ/bj+QsmXRLKodfw1y2LdhgZZIqIybqCcOsKNj39hvuM0dqaconkLKdl8
         QM2OjBNowThTJe3gKRNHXdfzO09awVAiEq8sBMBnqmKt6eXG1XAtME/1MyzBZKgbn91n
         rRJynnijUMzCfifb7jeW7hMmhzcy61w+hC7nLpxGM1SUz9+uQFD0od2nvW7P5fgKZ4vp
         blwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMjAwiZQ7AyM/ZMnIJU3KHDD0GRbxI1dAU9r7C6gtIZVJNPx48Wng28TX/XSglvHp3Is2hOR1Rm+Uqj7Em@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5HhUYf5wvCvxJlEYIrOd6tUHEcq0GAIzGoR5r7zVetZ7nZo9p
	ehad6vtc1HRKfyT77mYphfID0Puje5/mueV+/+UeoRvbFcznvwapTiyHI/nA6nc4tQiVi+juSHo
	Sb4O3L4mPQFtl6kLP3tIWkVR0BjinSQ0IW0U40IqqHjjRo0yG52rb3ldjIieK8bI/sxY7
X-Gm-Gg: AY/fxX7djpKj983ChPvx0Mv3IloL56n5zX6QXA95/rjE/ecLBV855lX6Cw16nKXRgK4
	3VZpFNcJxiAAHI53ljijhmBaU19tLQUU/UXNVZz3ETYTXMpJQ3KrPE1Vave3TTdkk1uw685Fa76
	2H9VP/P1edKtzvF9v16SI/ypLdb+GDynQUCbN2IP4o9hW3n2CFr2cEpvDBK7t0PqL5LszQ3VwgP
	DfOUJtKDL4AON2PARnUPI5XR/OcA+AQCOF0XEX/EI0Ur0StSo94B7QSZX1/cEiXRQVotsrXy5YR
	MLAcPs1QAiKUcOsajyP7k/jDP+6H54IruYWU/ZI88ctOmejDzNEsXnRFKx9pXGHFoDCdWQhI8+T
	USYhpmtYAo9LnsXPk6NrwqSvlPzYEIehXhFeVScsKaQMDCCYFhOd4Yw==
X-Received: by 2002:a05:6a00:1a10:b0:81c:c98c:aea8 with SMTP id d2e1a72fcca58-81cc98cb5a1mr4152440b3a.61.1767931865711;
        Thu, 08 Jan 2026 20:11:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFNflnxwa+mIRljWGYQSB7vt2PdnS2C3KlfmwRh7bmAkSxaKyzvwwixjykjONp+pqzf/8NvcQ==
X-Received: by 2002:a05:6a00:1a10:b0:81c:c98c:aea8 with SMTP id d2e1a72fcca58-81cc98cb5a1mr4152418b3a.61.1767931865235;
        Thu, 08 Jan 2026 20:11:05 -0800 (PST)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819baa19242sm9011293b3a.7.2026.01.08.20.11.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 20:11:04 -0800 (PST)
Message-ID: <6c299100-122a-436d-8b90-28c9a7d48677@oss.qualcomm.com>
Date: Fri, 9 Jan 2026 09:41:00 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFT PATCH 2/2] arm64: dts: qcom: ipq9574: Complete USB DWC3
 wrapper interrupts
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260106185123.19929-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20260106185123.19929-4-krzysztof.kozlowski@oss.qualcomm.com>
 <32f4a425-e181-41ab-913f-55e3dd3b4fd5@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <32f4a425-e181-41ab-913f-55e3dd3b4fd5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GN8F0+NK c=1 sm=1 tr=0 ts=69607fda cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=yZjr3wkweJ7bfLCuHRAA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: _PrCYWXi43IIuUCGGx3YAeIBD0sQBDGH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDAyNSBTYWx0ZWRfX6haSvJilwRpQ
 LyfQUp25WkTSEAm6zcWmh+NevM054tzAzeZe32ULhpTTO0ciAivhN7XgHLq4yTUebr7ITFFiiZC
 mIUBlzHIi+Pk3dbJ4SGeYrfPT7C0LDVPUQL5iUxp1T3eyQgptqIqgnE4/4ucoMU0/STfFKLzxRO
 e/n77H40/aeKvwsGRQS+QeDFBfxHKfMKkRAe1sPgDrza7wARWiQr3ALG7LssVruZVdi4vhsPeNG
 U9G5ykwXHmYroHwORUUxSbz/Tg+Q/gVuFpfn29ecInkwldqfH70maYuWnPBPGy59/csWwK1nLFe
 bVbPiDt4qf2G0ReRaPXjtLXdAhQYSs4VUkXkSR+aslpgB/GNV8Q29vVsKDRqcpUhxk3OXtlyjYc
 cVpX2Nd8UrrU82NPYK0embOQ1bPsmCaAlzoDeWTNYfnEimvRmnWMjA6Qs8Na0u9lawBp5eL97HF
 9VzwNhkYYQSFTStQyzw==
X-Proofpoint-ORIG-GUID: _PrCYWXi43IIuUCGGx3YAeIBD0sQBDGH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_01,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 phishscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090025


On 1/8/2026 11:13 AM, Kathiravan Thirumoorthy wrote:
>
> On 1/7/2026 12:21 AM, Krzysztof Kozlowski wrote:
>> Complete interrupts for DWC3 node to match what is required by
>> Devicetree bindings, as reported by dtbs_check:
>>
>>    ipq9574-rdp433.dtb: usb@8af8800 (qcom,ipq9574-dwc3): 
>> interrupt-names: ['pwr_event'] is too short
>>
>> The actual interrupt numbers are taken from reference manual of similar
>> chip, but not IPQ9574, due to lack of access to it.
>>
>> Signed-off-by: Krzysztof Kozlowski 
>> <krzysztof.kozlowski@oss.qualcomm.com>
>>
>> ---
>>
>> Not tested on hardware.
>>
>> "lack of access" = no IPQ9574 at all.
>
> Initially the SoC was named as IPQ9048 and after sometime it is 
> renamed as IPQ9574. But unfortunately, the reference manual is not 
> updated with the new naming.
>
> I can confirm the below interrupts are correct. So,
>
> Reviewed-by: Kathiravan Thirumoorthy 
> <kathiravan.thirumoorthy@oss.qualcomm.com>
>
> Thanks, Kathiravan T.

Also, confirmed that USB is working well, without any issues.

Tested-by: Kathiravan Thirumoorthy 
<kathiravan.thirumoorthy@oss.qualcomm.com>

>
>> ---
>>   arch/arm64/boot/dts/qcom/ipq9574.dtsi | 10 ++++++++--
>>   1 file changed, 8 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi 
>> b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
>> index 86c9cb9fffc9..d7278f2137ac 100644
>> --- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
>> @@ -765,8 +765,14 @@ usb3: usb@8af8800 {
>>               assigned-clock-rates = <200000000>,
>>                              <24000000>;
>>   -            interrupts-extended = <&intc GIC_SPI 134 
>> IRQ_TYPE_LEVEL_HIGH>;
>> -            interrupt-names = "pwr_event";
>> +            interrupts-extended = <&intc GIC_SPI 134 
>> IRQ_TYPE_LEVEL_HIGH>,
>> +                          <&intc GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
>> +                          <&intc GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>,
>> +                          <&intc GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
>> +            interrupt-names = "pwr_event",
>> +                      "qusb2_phy",
>> +                      "dm_hs_phy_irq",
>> +                      "dp_hs_phy_irq";
>>                 resets = <&gcc GCC_USB_BCR>;
>>               status = "disabled";

