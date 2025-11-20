Return-Path: <linux-arm-msm+bounces-82639-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E843AC7308B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 10:11:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id CA48B2B9A5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 09:11:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B9E430DD02;
	Thu, 20 Nov 2025 09:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DxcW7vT4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LNJV6Zk2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0693310630
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 09:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763629854; cv=none; b=D+Lnji8y4Xvd9GWDdkmHh0jJ9h7nuGo24KOKkZ2PczF6JiDusgl441/dXwux2rOgMA+Io22rEHDA3Z1Fd6QOnBG/FleYWA+qbo2g58UkOdJKNuiwc+GTPnMqsmXNX6QAyVoN1DB0edlzafyg/2Mp+2f+N5OBXq9oPMTbTsm34Zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763629854; c=relaxed/simple;
	bh=3k/hpt0zWDZEdbH5f9htoUyNMHnXEPG4eUskvlsflfs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mVrpG8zhFHYyUmZWA0S5uP9xMpYWQtwDneWDLzmiKX0X+cOJbS9ILoumn5t9j8lGpudYLrz8vUjI9Z75stlyrHmfc0oVtw3Ud8PPu+q9lBtkSBPCm7RLjQR+hQtg6ae36E1gYCiTRetNF7lPXJK0uh2WwBcV7jPNjMOjDoD7bQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DxcW7vT4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LNJV6Zk2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AK56khT4026682
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 09:10:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wyimCKeiXS1yx9KrEd+oZ745tjyNxb635bpLRIP4Mxo=; b=DxcW7vT4MB9IwqbH
	7VDvC1qKTzQxjJCnCd9apJAHoi80JLc5ZVQhYa/+YzmS28gpYiEaS4hwGL+bf03T
	p+RRjB/d9YLa5PkwVsAs77w+NTuyGUDiG9777CTO2tEDKSyjzDkPWUVOKTNiUOdn
	UbsbL31/taj+FpE+dITLoITiJStEkf0Wp1t9Y35GfdfkMDlh6UYBP75vpP4glRJJ
	ZeoS5T9fWVYVy1imzLxeXEJZVhA9KCsZGt0ijb5KnEXphuIKa7LTE705Iiq0nuub
	HP1BtuLQr2LNsBCjqLT9APuUKC7jm9j0qYPYC9WrZzbzlMJvaTxVcUX+qRlC7NF6
	Pwch0A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ahvj3gp7p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 09:10:51 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee24e1559aso1941141cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 01:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763629851; x=1764234651; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wyimCKeiXS1yx9KrEd+oZ745tjyNxb635bpLRIP4Mxo=;
        b=LNJV6Zk2qsSGcMcOpFACHWkb60EwGj+Ulo8AysX6FrObyr2UpNvugQv7EHaxSnP6Jw
         rHA/4Id9VgENaTnIW4TJl4E8Q2N9/MaLRmhjgjuwChEYQZq5GTq9odpzklbVk9RD2QpF
         BBcuZN7p85L6dnKDgfFOQZY0od6g6u+Tpf7SrEeyQYDMzClorKyUVL2jFDU3xgZYXLFb
         /DvBiHXUjktfeWSXbjHjSvK/HtX73RRtCIn+na7jsmo/saeq7qRM541PhLqMI/R02UHs
         sUyt99iPPo6J6jDTTFI46NZDYyQbN2gzr8eU1OsYkdwbHaqd0sTIl7F3UU+oLADXiQsb
         uS6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763629851; x=1764234651;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wyimCKeiXS1yx9KrEd+oZ745tjyNxb635bpLRIP4Mxo=;
        b=lSCFp+Ux36ubpVvNvsoeB/ZjqIVV2mspWiIIRZ0LoHx8nH3SO7x9zVgrdMpJysJff4
         mqJPp9c7kdiyWpXCIs8qcxKExqPPKBSM2a1g9UPjaqx1AZ7u9Wa0R3eMG75a26lRGZ5Z
         KT4iM/jVX0m513QXxDmzrQ8JRjiFBBomEd5RttXTNBh4D4RE7c9O3KK7c0j9JXVK+XXO
         qU6yRkVL0iLpTDwsAmNiILN/YADQWt3/SovipTX79afyAeXN7iGDfBPzCFv1nLUXNHtx
         ZSRZPiG2aDYpZuMgRhlVPzjpr3gE0xq+JVlRWy6hfRtVzCabhMIkin6leljHSOEA2Pcg
         ib5g==
X-Gm-Message-State: AOJu0Yw+H6fEJaeLkSqIecMB5IC8I8CtNJVV6oUTftUsFSpEGIXMMEjB
	f4FR3bHos+nVFjEa74czbtwbN+Wmd479W4Fim6uIPODH5o6oyT5ohuGahXa6WJidxig6M6mF5WI
	ltn0lfCoIFw+P+13uS3837bsWxtOkqnOm6zUaskMb0YMv2bbHp99uH0pYX44YG5ffRVxjenRYKB
	K7
X-Gm-Gg: ASbGncu5ZRPXwHpT9EGWwhZ3ctLI10MTW9YLTA1GQ7dJKXVijqBIDZ9nyIkKs5sZ9my
	a2l4NblMLW13t1Mu88iWfO6estwhTG2w9X4FhTvbLbVxPyoOhWXRNRmggesWBRU/b4XpZ4BQ51B
	dziKIig0RBQbQMd6x5mG1q78gjPjUAFj9mN4c9mTh5+oenubEdBDb4bWWL6N8RH607Up3gXdhW8
	A6HwHJKLU5qal1tDyWvuQHwlTjwdj/SAHSUoKW/YARqWL89CDfBnbzyJaw7Y9B3PJUOXKT8oi2r
	d3gm31LWnrzBbVVHQ2m0tFsbDmErbmq9NYQlRrs86ER8W8eK5zWd/iS6b2cGvfbbKoKLYkYh1yb
	OCK8HabV5GJJEZehiuR5lbMNCxTGHk9UP0oI6uGplM0BfwaL/u9Lu+AUszI9uQMh/UoI=
X-Received: by 2002:a05:622a:1a87:b0:4ee:1db1:a61d with SMTP id d75a77b69052e-4ee49487384mr22122851cf.3.1763629851009;
        Thu, 20 Nov 2025 01:10:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF+7CSO2eXsAvWMwQgXnloa7iXDcXJQcAajq6GgdbGNlLZIx0Ii0mFO+wY3pusV7uDKUpW9kQ==
X-Received: by 2002:a05:622a:1a87:b0:4ee:1db1:a61d with SMTP id d75a77b69052e-4ee49487384mr22122661cf.3.1763629850516;
        Thu, 20 Nov 2025 01:10:50 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-645363b62cesm1608228a12.13.2025.11.20.01.10.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Nov 2025 01:10:50 -0800 (PST)
Message-ID: <742601dc-32d8-41ff-8e2b-a960f6fe77ab@oss.qualcomm.com>
Date: Thu, 20 Nov 2025 10:10:48 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] ARM: dts: qcom: msm8960: expressatt: Add
 Light/Proximity Sensor
To: guptarud@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251119-expressatt_nfc_accel_magn_light-v1-0-636f16f05cf4@gmail.com>
 <20251119-expressatt_nfc_accel_magn_light-v1-1-636f16f05cf4@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251119-expressatt_nfc_accel_magn_light-v1-1-636f16f05cf4@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=J8WnLQnS c=1 sm=1 tr=0 ts=691edb1b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=jMnZrQita27iYXhThZwA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: isZnJ_jmb1VX8h1f3oZy4cyG8Dg6q_DC
X-Proofpoint-ORIG-GUID: isZnJ_jmb1VX8h1f3oZy4cyG8Dg6q_DC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDA1NCBTYWx0ZWRfX02gD9Kq/ZTEu
 zCbApiBBSYT6RldY9l+amTDMaeoqHiu7/U+cPT2q6vpbwilixk0AL3Sn6UKuaRdEmBrqgkoZMD1
 Lskdd96uE8BIyhBhmsGQp8YXoN7WgN+sqWpoEHC88V8QbTyUB3XcK4rfdqGumBzUMHrqgxeR0A3
 MmM9HsoupC8t7GxmkR4QcBv9h08vqWpIlJdbpoPDqBEn5y32rVOxOIqtjzPQcJi1PF92UqP+usz
 YlNBcRF0RTkOZQGOkiPek0rbZeIRM1qBjvDccLGm5fn4oYkaNTXknXqFgu5GQOs+3+FehyngwIU
 kGDuYu3sj8G2dllU8ion2B06pZv2silWt3pV9X9O0n5UJGHk3OcLggx/9/DX9qSRLdfWCU+NtZ6
 ExY4VK/nFzaWCmtAMBbbSa0O7AqFJw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-20_03,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511200054

On 11/20/25 8:14 AM, Rudraksha Gupta via B4 Relay wrote:
> From: Rudraksha Gupta <guptarud@gmail.com>
> 
> Currently the Proximity Sensor doesn't work, but light sensor does.
> Left the proximity sensor as a TODO for later.
> 
> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
> ---
>  .../dts/qcom/qcom-msm8960-samsung-expressatt.dts   | 36 ++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts b/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
> index 5ee919dce75b..1e331a046e7b 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
> @@ -52,6 +52,31 @@ key-volume-down {
>  			linux,code = <KEY_VOLUMEDOWN>;
>  		};
>  	};
> +
> +	i2c-gpio-sensors {
> +		compatible = "i2c-gpio";


Are you using gpio-i2c for any specific reason? Would GSBI2 not be
connected to this pair? (I am not sure FWIW)

> +		sda-gpios = <&tlmm 12 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +		scl-gpios = <&tlmm 13 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +		i2c-gpio,delay-us = <5>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		light-sensor@39 {
> +			compatible = "amstaos,tmd2772";
> +			reg = <0x39>;
> +			interrupt-parent = <&pm8921_gpio>;
> +			interrupts = <6 IRQ_TYPE_EDGE_FALLING>;
> +			vdd-supply = <&pm8921_l9>;
> +			vddio-supply = <&pm8921_lvs4>;
> +
> +			// TODO: Proximity doesn't work

C-style comments ( /* foo */ ) are preferred

> +			amstaos,proximity-diodes = <0>;

Try comparing the values the upstream and downstream drivers write
to the device, maybe you're missing something

> +			led-max-microamp = <100000>;
> +
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&prox_sensor_int>;

property-n
property-names

is the preferred order

> +		};
> +	};
>  };
>  
>  &gsbi5 {
> @@ -163,6 +188,15 @@ &pm8921 {
>  	interrupts-extended = <&tlmm 104 IRQ_TYPE_LEVEL_LOW>;
>  };
>  
> +&pm8921_gpio {
> +	prox_sensor_int: prox-sensor-int-state {
> +		pins = "gpio6";
> +		function = "normal";
> +		input-enable;
> +		bias-disable;
> +	};
> +};
> +
>  &rpm {
>  	regulators {
>  		compatible = "qcom,rpm-pm8921-regulators";
> @@ -280,6 +314,7 @@ pm8921_l9: l9 {
>  			regulator-min-microvolt = <2850000>;
>  			regulator-max-microvolt = <2850000>;
>  			bias-pull-down;
> +			regulator-always-on;
>  		};
>  
>  		pm8921_l10: l10 {
> @@ -377,6 +412,7 @@ pm8921_lvs3: lvs3 {
>  
>  		pm8921_lvs4: lvs4 {
>  			bias-pull-down;
> +			regulator-always-on;

Does it stop working if you remove these regulator-always-on additions?

Konrad

