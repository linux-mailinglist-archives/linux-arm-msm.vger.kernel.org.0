Return-Path: <linux-arm-msm+bounces-53235-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 400DDA7BC62
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Apr 2025 14:10:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 460761749A0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Apr 2025 12:10:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5DE41DE8A3;
	Fri,  4 Apr 2025 12:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tuRaU1gz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C951DDA2D
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Apr 2025 12:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743768610; cv=none; b=KvzjYqrDP9t85/e1Ow6t4jOwWsshNT5whUBQPJMeV3WniQqgMPmJpqi3L80/OVeoIHVMQQFt1p+cK6qzezxuFGVhjNxOgKHbBZl2rOF/rloanPexdzRF4K3in/Tm8HaEaS2KjmZ2ufDMmX1wkjYxoQpnNaPTxb2NfZfuGH1r61w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743768610; c=relaxed/simple;
	bh=MgHuAR2KaGlMfN8tReCPFlabjidLcFBKbOmQATKd/sc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eG/ig4QVpRhrZX8lEcJazl9jIEDQLur1m7XSPySYsHbzy1ZeJ7p+xOD+Mv3i5GCpuDw6j1fqfX/6uGKplfA6slD2tNXPXf7BXJd6ORePcOYOZF9Gw4Q9GcUpKaw1PhyaPXqQ9tqo+hI4mGHkuGOaQqe5dGTWuZT+xbTx/+M6Ixw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tuRaU1gz; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so19745785e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Apr 2025 05:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743768607; x=1744373407; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Uw21iOfeEdk3463J9ORbvRKcjzeh75OKbdf6KpxN7ys=;
        b=tuRaU1gz7yY/UPylGPtFCbmv1QtUpGR/239TkdiecfVRIUMMoZPaYXDPUWI0KoApnC
         C7GP0GVkM4hPJUTgcmNzuzSdf9aI0gahvBckksILQORuPzoo+Yjlv91VOHX63YAL7k4o
         cCSVvRmmlFy87drUwPiLW5qIgVDh+j/eGouXi5tT2Wnyjm51fpZOPmNkvzlfIND7fuNU
         5HXlu+pgwPra/zrP6Pu1fnyo0YUKhnnofQzqMO23/7NvZlfJCen1Lzd6+33LuS4bDJxO
         umgfGGDjBmb7KT6bwlfODoR9X89WbpJCXZ9gJylNLer9UC2UjrkqgCT3FJ7qyIwei1NT
         +PKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743768607; x=1744373407;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Uw21iOfeEdk3463J9ORbvRKcjzeh75OKbdf6KpxN7ys=;
        b=sAyoRGdlxz35CxOidMxhJvu54dfGVqX+L2jjvhhwy5cImkffMitmoi/aJaXajqASmH
         G3LSqU+qmWTgMEQDdg1KgXulQOsw4V4bqwb4ZtaeASNOIN6g5/TXecDYu9bblHnHpDtb
         cLx4oo8afa5fd3TVzrO2aV8Lk9Sx267d+4cwNl29IhVxf2D+QCfHEzO1MUoo5A6679Qi
         kESxBA9NQFiJ5rNhRydOFEy6ze3lkEvhpbL33P+fjGYgWta+XdiLEw21JLfF9N1Y+t6O
         1gpb2eTUlODWOjtxWvFEDg/PwYy8Siq8ArE00JsD/vM5f8Ak+kOz8/IK6bOgm95r1ycy
         dWMQ==
X-Gm-Message-State: AOJu0YzJgSpawV6hr7yO9FdCAWQ5aSpSnTPAPGsiejYOHSvwvWOjEJVg
	0WZbJ15U2dVHgF0flhjMZJrj5thGCfaozYyDAF2KePYpyzWeEvz7ZxcfAQiFos4=
X-Gm-Gg: ASbGncvBf0u+wLUQq3ct2j67Z3+BremMxyEHCapkyV1on3Nz8joV5PT49uU3+g9G0fY
	dM0oeRYHQ1zMPT7AxIWSSt3ScSHSH54I7+MqbG8vLbzbuBplW4x2YYT+Jmj8a0VplJtDoJPGf58
	VFxnEdBZ5SQxseyQTMzF7AIhuqjRJXO9RmytCAtQ+lacV4M1+/zxbdsrZvNib+dCpO70iAEK0Ji
	aUpStKGSeRIImTGP3O7T7iSiMUyE6wup0bvKypsUE+xMb3d3u9PpxTktHQvioCz3f2WxUOWyiTf
	ZBQwFH7mFglzeZNbZSbbA5pHOQlNnj2b2Wwx4zJALazl8dsZzatOy8WfM+NmVdRvFIfMPctcELS
	WZiL/PU07lQ==
X-Google-Smtp-Source: AGHT+IGmy1dhSXCxdlE9WpZ8lmIMDAlaM4Cd7sK9OrwG+JdRJ0Iokwp3vZ4pNShGrMEF3QlAaP/nig==
X-Received: by 2002:a05:600c:3103:b0:43d:300f:fa4a with SMTP id 5b1f17b1804b1-43ecf89dd3emr27944265e9.12.1743768607082;
        Fri, 04 Apr 2025 05:10:07 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec3669002sm44795565e9.33.2025.04.04.05.10.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Apr 2025 05:10:06 -0700 (PDT)
Message-ID: <1b649ead-f6d6-4fb0-b5ac-02cf2dba92ca@linaro.org>
Date: Fri, 4 Apr 2025 13:10:04 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: qcm2290: Add CCI node
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, andersson@kernel.org,
 konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 krzk+dt@kernel.org, robh@kernel.org
References: <20250403102256.101217-1-loic.poulain@oss.qualcomm.com>
 <0YH8BNtmMcywwRXI3xHiLyB_zFED-XbjzCyyI1Vc4184BPadVJ-GWj23lpEwaXEHqDPiMiraMsWlOd1qA_hiog==@protonmail.internalid>
 <20250403102256.101217-2-loic.poulain@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250403102256.101217-2-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/04/2025 11:22, Loic Poulain wrote:
> Add Camera Control Interface (CCI), supporting two I2C masters.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>   v2: Reorder commits; Update dts properties order and style
>   v3: No change for this patch
> 
>   arch/arm64/boot/dts/qcom/qcm2290.dtsi | 50 +++++++++++++++++++++++++++
>   1 file changed, 50 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
> index 7fb5de92bc4c..43fcb4f40a8c 100644
> --- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
> @@ -557,6 +557,20 @@ qup_uart4_default: qup-uart4-default-state {
>   				bias-disable;
>   			};
> 
> +			cci0_default: cci0-default-state {
> +				pins = "gpio22", "gpio23";
> +				function = "cci_i2c";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};
> +
> +			cci1_default: cci1-default-state {
> +				pins = "gpio29", "gpio30";
> +				function = "cci_i2c";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};
> +
>   			sdc1_state_on: sdc1-on-state {
>   				clk-pins {
>   					pins = "sdc1_clk";
> @@ -1603,6 +1617,42 @@ adreno_smmu: iommu@59a0000 {
>   			#iommu-cells = <2>;
>   		};
> 
> +		cci: cci@5c1b000 {
> +			compatible = "qcom,qcm2290-cci", "qcom,msm8996-cci";
> +			reg = <0x0 0x5c1b000 0x0 0x1000>;
> +
> +			interrupts = <GIC_SPI 206 IRQ_TYPE_EDGE_RISING>;
> +
> +			clocks = <&gcc GCC_CAMSS_TOP_AHB_CLK>, <&gcc GCC_CAMSS_CCI_0_CLK>;
> +			clock-names = "camss_top_ahb", "cci";

do you not need an axi clock GCC_CAMSS_AXI_CLK ?

> +			assigned-clocks = <&gcc GCC_CAMSS_CCI_0_CLK>;
> +			assigned-clock-rates = <37500000>;
> +
> +			power-domains = <&gcc GCC_CAMSS_TOP_GDSC>;
> +
> +			pinctrl-0 = <&cci0_default &cci1_default>;
> +			pinctrl-names = "default";
> +
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			status = "disabled";
> +
> +			cci_i2c0: i2c-bus@0 {
> +				reg = <0>;
> +				clock-frequency = <400000>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +
> +			cci_i2c1: i2c-bus@1 {
> +				reg = <1>;
> +				clock-frequency = <400000>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +		};
> +
>   		mdss: display-subsystem@5e00000 {
>   			compatible = "qcom,qcm2290-mdss";
>   			reg = <0x0 0x05e00000 0x0 0x1000>;
> --
> 2.34.1
> 
> 

other than that

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

