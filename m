Return-Path: <linux-arm-msm+bounces-83557-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A65C8DAFF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 11:06:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 17E7234E364
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 10:06:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A80130C605;
	Thu, 27 Nov 2025 10:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gItgcRSY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC8028150F
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 10:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764237980; cv=none; b=lY4CUh7QFA3SJcGLb51jTsz8ssMMiM4XcLFRMbOdf94tkBASbFy3EntkFoosdENYcLmU+3gPdY61WBwhEMALQAfzuzQGteXS3Xjsl0Xie4NRSz8thqTBEdE2+4l0vH7tVN8Ld8GS/7WwLZnu+EUHthZ+gjZMNx/UOqkYZPWr3wE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764237980; c=relaxed/simple;
	bh=siJNmEratHcmpL00Iwl7fOAm/MrgHbE8safj2eECkIs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H1A+Qa2xMrm/uI8NAxjGkFdjcD0oMX8gwThE2JvzdktbTt4CidDqT+Q/mC6DcSDjfHXn/7cZvzRBexCP4EEMGe1FwuHRvp4ZsdFd3ecElQT9Xpy4O8U0nfCPVTs1wGjDj18mJDUHi7h0FhWh18PrRdgnX3IH9eX39UVCB+oEXaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gItgcRSY; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-477a219db05so3062985e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 02:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764237976; x=1764842776; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LO/fmv+Ya3V+iO1+TY+CVEMNzwv8YfE7F9+4YqRbhjo=;
        b=gItgcRSYnM957mZ558prlpAXUyHvEd7wsdRLLUNDoNosV+ZKH2Qdd2cccLFd1Zh2Bd
         GTQtUXSmAs8Hkpc9lhPOx1mjGAQTnDqzG2Sq/acxk9xZAiX8295FKzCLtF+LQ1fdua59
         9/eiYjBWcp7/BDq4J5h5KrxUlJQmucAnI6zts08Dw+ZbG0QNjcLC4G3cR3X7fPVBEqQT
         sg12KPBWp/5OeQeKaByo+7n0pK+N28NpFOuaL580vsyoxs2ESgy9rTthL5bOLRzhqZdR
         apc+fJB1pQzp7yGMIQRecoft77OdtkZDMJZORtUmsz0J/dwlPsPXuwd0Jpehsxl/U9zd
         aDJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764237976; x=1764842776;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LO/fmv+Ya3V+iO1+TY+CVEMNzwv8YfE7F9+4YqRbhjo=;
        b=tc3x9XDdMZ2R5XapC4b1llzL8aIkkGGPql1Nwd2lmDVouu+Z3DesyTBo1aVh5jQQVe
         joL7n+uZw4zJ94wCVlKHq79CYiOvDGyhHmuJtpEAUEiqbsj/vpQ3ygvdR8GTx+H4vdRM
         uk2G1nKJLBNPEXUX7pA7pf60Obnxu0UfQPm1+9Lp4FvNCeZ2fszwXgUQA3j5gM8v/Xxr
         ZSob/Bp2f8nT4BF11MXlvV+cV8nF6Mt0CMqGXC5mRNqCBPU4oPPANonsBmVzmMZT7GlP
         2kcoklk4OeC65qT35xVlPxSyhxLlucobbQFVX79bCr5GikXT1YJ9F2XWeAL6AQKswo/z
         QBHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZIQ5AISiqM3hopUvrnKQaAEZk1qG5T3sFmRP1GhcnVwfygRIaZMIPTldjbD01mSbufn31ufatktq7RH4S@vger.kernel.org
X-Gm-Message-State: AOJu0YwRW1jfxzyeqPKq/viLYlEYUdqMW58pl5PhUMnAoQpKIoZf7yVb
	rAisi0Ykc/rmpCZUh4gOIQ88a6o7Zm5pFgLYnthC+61EZII98of5cuIfZ7UlgW0QQX0=
X-Gm-Gg: ASbGncvSJwxXKB41H8EUpQU9atOWmdLKLu/90dSNhu2SP2V9x0MidKk7RhETGc4q4Gd
	t918b7u87GO4RiJQQxxBNLvrtdgFx8Szx++0UYKQbaqCk8rkThGBTywz1kfg2xbMrl5U1ypS11f
	vB1kw6P3Mc/XvtPxLh/auGmmYNqClhihNQQaWxS5pAT1ZkgJxiKbnh9NNUqPVy3SEZG6caXvDwl
	vZu4J48NQFoyT9uAcHmzZO5UupRvSHoqGhohLrKd/tpnA6V2w5Lx9KO87/Rz/vfGtEj54Yql+Wo
	n2o6zs7P8gsJ24/IMZDsIF97zQPp5XyoPQn1QsrPYIwdlqLdYPEYa2UA/grE4wcU8EpK6L9++q0
	pwS23f00lwywxL7l7RW/osYKWx0AGfGpvfM4F0HjwP8+gm/SlzOj9Slx6xxyuoxmlN0MJvQQHCb
	BRG3AxhlHyJ0UPX/EJ9rTUtURJuIAwSsHzp9djjhGShb8SjB9a+dc4NHlLUVefAp8=
X-Google-Smtp-Source: AGHT+IGSIY568nvlY/0zkgvRWhYoC5pfxeaQHS3lJvDi403xMi7SW2N0T4zF1GQKafIPb1dM0IRXXg==
X-Received: by 2002:a05:600c:1f94:b0:471:1765:839c with SMTP id 5b1f17b1804b1-477c1117949mr177659155e9.20.1764237975919;
        Thu, 27 Nov 2025 02:06:15 -0800 (PST)
Received: from [192.168.0.27] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479052c9621sm65235905e9.5.2025.11.27.02.06.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 02:06:14 -0800 (PST)
Message-ID: <0471c6a3-0fbc-45c7-afc3-e8639d7e9f5e@linaro.org>
Date: Thu, 27 Nov 2025 10:06:12 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] arm64: dts: qcom: sm8750: Add support for camss
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, jeyaprakash.soundrapandian@oss.qualcomm.com,
 Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
References: <20251126-add-support-for-camss-on-sm8750-v1-0-646fee2eb720@oss.qualcomm.com>
 <20251126-add-support-for-camss-on-sm8750-v1-7-646fee2eb720@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251126-add-support-for-camss-on-sm8750-v1-7-646fee2eb720@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/11/2025 09:38, Hangxiang Ma wrote:
> Add support for the camera subsystem on the SM8750 Qualcomm SoC. This
> includes bringing up the CSIPHY, CSID, VFE/RDI interfaces. This change
> also introduces the necessary modules for enabling future extended
> functionalities.
> 
> The SM8750 platform provides:
> - 3 x VFE, 5 RDI per VFE
> - 2 x VFE Lite, 4 RDI per VFE
> - 3 x CSID
> - 2 x CSID Lite
> - 6 x CSI PHY
> - 2 x ICP
> - 1 x IPE
> - 2 x JPEG DMA & Downscaler
> - 2 x JPEG Encoder
> - 1 x OFE
> - 5 x RT CDM
> - 3 x TPG
> 
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/sm8750.dtsi | 599 +++++++++++++++++++++++++++++++++++
>   1 file changed, 599 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> index 1937b48fac5a..b83389c3456b 100644
> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> @@ -3332,6 +3332,605 @@ data-pins {
>   					bias-pull-up;
>   				};
>   			};
> +
> +			cci0_0_default: cci0-0-default-state {
> +				sda-pins {
> +					pins = "gpio113";
> +					function = "cci_i2c_sda";
> +					drive-strength = <2>;
> +					bias-pull-up;
> +				};
> +
> +				scl-pins {
> +					pins = "gpio114";
> +					function = "cci_i2c_scl";
> +					drive-strength = <2>;
> +					bias-pull-up;
> +				};
> +			};
> +
> +			cci0_0_sleep: cci0-0-sleep-state {
> +				sda-pins {
> +					pins = "gpio113";
> +					function = "cci_i2c_sda";
> +					drive-strength = <2>;
> +					bias-pull-down;
> +				};
> +
> +				scl-pins {
> +					pins = "gpio114";
> +					function = "cci_i2c_scl";
> +					drive-strength = <2>;
> +					bias-pull-down;
> +				};
> +			};
> +
> +			cci0_1_default: cci0-1-default-state {
> +				sda-pins {
> +					pins = "gpio115";
> +					function = "cci_i2c_sda";
> +					drive-strength = <2>;
> +					bias-pull-up;
> +				};
> +
> +				scl-pins {
> +					pins = "gpio116";
> +					function = "cci_i2c_scl";
> +					drive-strength = <2>;
> +					bias-pull-up;
> +				};
> +			};
> +
> +			cci0_1_sleep: cci0-1-sleep-state {
> +				sda-pins {
> +					pins = "gpio115";
> +					function = "cci_i2c_sda";
> +					drive-strength = <2>;
> +					bias-pull-down;
> +				};
> +
> +				scl-pins {
> +					pins = "gpio116";
> +					function = "cci_i2c_scl";
> +					drive-strength = <2>;
> +					bias-pull-down;
> +				};
> +			};
> +
> +			cci1_0_default: cci1-0-default-state {
> +				sda-pins {
> +					pins = "gpio117";
> +					function = "cci_i2c_sda";
> +					drive-strength = <2>;
> +					bias-pull-up;
> +				};
> +
> +				scl-pins {
> +					pins = "gpio118";
> +					function = "cci_i2c_scl";
> +					drive-strength = <2>;
> +					bias-pull-up;
> +				};
> +			};
> +
> +			cci1_0_sleep: cci1-0-sleep-state {
> +				sda-pins {
> +					pins = "gpio117";
> +					function = "cci_i2c_sda";
> +					drive-strength = <2>;
> +					bias-pull-down;
> +				};
> +
> +				scl-pins {
> +					pins = "gpio118";
> +					function = "cci_i2c_scl";
> +					drive-strength = <2>;
> +					bias-pull-down;
> +				};
> +			};
> +
> +			cci1_1_default: cci1-1-default-state {
> +				sda-pins {
> +					pins = "gpio111";
> +					function = "cci_i2c_sda";
> +					drive-strength = <2>;
> +					bias-pull-up;
> +				};
> +
> +				scl-pins {
> +					pins = "gpio164";
> +					function = "cci_i2c_scl";
> +					drive-strength = <2>;
> +					bias-pull-up;
> +				};
> +			};
> +
> +			cci1_1_sleep: cci1-1-sleep-state {
> +				sda-pins {
> +					pins = "gpio111";
> +					function = "cci_i2c_sda";
> +					drive-strength = <2>;
> +					bias-pull-down;
> +				};
> +
> +				scl-pins {
> +					pins = "gpio164";
> +					function = "cci_i2c_scl";
> +					drive-strength = <2>;
> +					bias-pull-down;
> +				};
> +			};
> +
> +			cci2_0_default: cci2-0-default-state {
> +				sda-pins {
> +					pins = "gpio112";
> +					function = "cci_i2c_sda";
> +					drive-strength = <2>;
> +					bias-pull-up;
> +				};
> +
> +				scl-pins {
> +					pins = "gpio153";
> +					function = "cci_i2c_scl";
> +					drive-strength = <2>;
> +					bias-pull-up;
> +				};
> +			};
> +
> +			cci2_0_sleep: cci2-0-sleep-state {
> +				sda-pins {
> +					pins = "gpio112";
> +					function = "cci_i2c_sda";
> +					drive-strength = <2>;
> +					bias-pull-down;
> +				};
> +
> +				scl-pins {
> +					pins = "gpio153";
> +					function = "cci_i2c_scl";
> +					drive-strength = <2>;
> +					bias-pull-down;
> +				};
> +			};
> +
> +			cci2_1_default: cci2-1-default-state {
> +				sda-pins {
> +					pins = "gpio119";
> +					function = "cci_i2c_sda";
> +					drive-strength = <2>;
> +					bias-pull-up;
> +				};
> +
> +				scl-pins {
> +					pins = "gpio120";
> +					function = "cci_i2c_scl";
> +					drive-strength = <2>;
> +					bias-pull-up;
> +				};
> +			};
> +
> +			cci2_1_sleep: cci2-1-sleep-state {
> +				sda-pins {
> +					pins = "gpio119";
> +					function = "cci_i2c_sda";
> +					drive-strength = <2>;
> +					bias-pull-down;
> +				};
> +
> +				scl-pins {
> +					pins = "gpio120";
> +					function = "cci_i2c_scl";
> +					drive-strength = <2>;
> +					bias-pull-down;
> +				};
> +			};
> +		};
> +
> +		cci0: cci@ac7b000 {
> +			compatible = "qcom,sm8750-cci", "qcom,msm8996-cci";
> +			reg = <0x0 0x0ac7b000 0x0 0x1000>;
> +			interrupts = <GIC_SPI 426 IRQ_TYPE_EDGE_RISING>;
> +			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +			clocks = <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
> +				 <&camcc CAM_CC_CCI_0_CLK>;
> +			clock-names = "ahb", "cci";
> +			pinctrl-0 = <&cci0_0_default &cci0_1_default>;
> +			pinctrl-1 = <&cci0_0_sleep &cci0_1_sleep>;
> +			pinctrl-names = "default", "sleep";
> +			status = "disabled";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			cci0_i2c0: i2c-bus@0 {
> +				reg = <0>;
> +				clock-frequency = <400000>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +
> +			cci0_i2c1: i2c-bus@1 {
> +				reg = <1>;
> +				clock-frequency = <400000>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +		};
> +
> +		cci1: cci@ac7c000 {
> +			compatible = "qcom,sm8750-cci", "qcom,msm8996-cci";
> +			reg = <0x0 0x0ac7c000 0x0 0x1000>;
> +			interrupts = <GIC_SPI 427 IRQ_TYPE_EDGE_RISING>;
> +			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +			clocks = <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
> +				 <&camcc CAM_CC_CCI_1_CLK>;
> +			clock-names = "ahb", "cci";
> +			pinctrl-0 = <&cci1_0_default &cci1_1_default>;
> +			pinctrl-1 = <&cci1_0_sleep &cci1_1_sleep>;
> +			pinctrl-names = "default", "sleep";
> +			status = "disabled";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			cci1_i2c0: i2c-bus@0 {
> +				reg = <0>;
> +				clock-frequency = <400000>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +
> +			cci1_i2c1: i2c-bus@1 {
> +				reg = <1>;
> +				clock-frequency = <400000>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +		};
> +
> +		cci2: cci@ac7d000 {
> +			compatible = "qcom,sm8750-cci", "qcom,msm8996-cci";
> +			reg = <0x0 0x0ac7d000 0x0 0x1000>;
> +			interrupts = <GIC_SPI 428 IRQ_TYPE_EDGE_RISING>;
> +			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +			clocks = <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
> +				 <&camcc CAM_CC_CCI_2_CLK>;
> +			clock-names = "ahb", "cci";
> +			pinctrl-0 = <&cci2_0_default &cci2_1_default>;
> +			pinctrl-1 = <&cci2_0_sleep &cci2_1_sleep>;
> +			pinctrl-names = "default", "sleep";
> +			status = "disabled";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			cci2_i2c0: i2c-bus@0 {
> +				reg = <0>;
> +				clock-frequency = <400000>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +
> +			cci2_i2c1: i2c-bus@1 {
> +				reg = <1>;
> +				clock-frequency = <400000>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +		};
> +
> +		camss: isp@ad27000 {
> +			compatible = "qcom,sm8750-camss";
> +
> +			reg = <0x0 0x0ad27000 0x0 0x2b00>,
> +			      <0x0 0x0ad2a000 0x0 0x2b00>,
> +			      <0x0 0x0ad2d000 0x0 0x2b00>,
> +			      <0x0 0x0ad6d000 0x0 0xa00>,
> +			      <0x0 0x0ad72000 0x0 0xa00>,
> +			      <0x0 0x0ada9000 0x0 0x2000>,
> +			      <0x0 0x0adab000 0x0 0x2000>,
> +			      <0x0 0x0adad000 0x0 0x2000>,
> +			      <0x0 0x0adaf000 0x0 0x2000>,
> +			      <0x0 0x0adb1000 0x0 0x2000>,
> +			      <0x0 0x0adb3000 0x0 0x2000>,
> +			      <0x0 0x0ac86000 0x0 0x10000>,
> +			      <0x0 0x0ac96000 0x0 0x10000>,
> +			      <0x0 0x0aca6000 0x0 0x10000>,
> +			      <0x0 0x0ad6e000 0x0 0x1800>,
> +			      <0x0 0x0ad73000 0x0 0x1800>,
> +			      <0x0 0x0ac06000 0x0 0x1000>,
> +			      <0x0 0x0ac05000 0x0 0x1000>,
> +			      <0x0 0x0ac16000 0x0 0x1000>,
> +			      <0x0 0x0ac15000 0x0 0x1000>,
> +			      <0x0 0x0ac42000 0x0 0x18000>,
> +			      <0x0 0x0ac26000 0x0 0x1000>,
> +			      <0x0 0x0ac25000 0x0 0x1000>,
> +			      <0x0 0x0ac28000 0x0 0x1000>,
> +			      <0x0 0x0ac27000 0x0 0x1000>,
> +			      <0x0 0x0ac2a000 0x0 0x18000>,
> +			      <0x0 0x0ac7f000 0x0 0x580>,
> +			      <0x0 0x0ac80000 0x0 0x580>,
> +			      <0x0 0x0ac81000 0x0 0x580>,
> +			      <0x0 0x0ac82000 0x0 0x580>,
> +			      <0x0 0x0ac83000 0x0 0x580>,
> +			      <0x0 0x0ad8b000 0x0 0x400>,
> +			      <0x0 0x0ad8c000 0x0 0x400>,
> +			      <0x0 0x0ad8d000 0x0 0x400>;
> +			reg-names = "csid0",
> +				    "csid1",
> +				    "csid2",
> +				    "csid_lite0",
> +				    "csid_lite1",
> +				    "csiphy0",
> +				    "csiphy1",
> +				    "csiphy2",
> +				    "csiphy3",
> +				    "csiphy4",
> +				    "csiphy5",
> +				    "vfe0",
> +				    "vfe1",
> +				    "vfe2",
> +				    "vfe_lite0",
> +				    "vfe_lite1",
> +				    "icp0",
> +				    "icp0_sys",
> +				    "icp1",
> +				    "icp1_sys",
> +				    "ipe",
> +				    "jpeg_dma0",
> +				    "jpeg_enc0",
> +				    "jpeg_dma1",
> +				    "jpeg_enc1",
> +				    "ofe",
> +				    "rt_cdm0",
> +				    "rt_cdm1",
> +				    "rt_cdm2",
> +				    "rt_cdm3",
> +				    "rt_cdm4",
> +				    "tpg0",
> +				    "tpg1",
> +				    "tpg2";
> +
> +			clocks = <&camcc CAM_CC_CAMNOC_NRT_AXI_CLK>,
> +				 <&camcc CAM_CC_CAMNOC_RT_AXI_CLK>,
> +				 <&camcc CAM_CC_CAMNOC_RT_TFE_0_MAIN_CLK>,
> +				 <&camcc CAM_CC_CAMNOC_RT_TFE_1_MAIN_CLK>,
> +				 <&camcc CAM_CC_CAMNOC_RT_TFE_2_MAIN_CLK>,
> +				 <&camcc CAM_CC_CAMNOC_RT_IFE_LITE_CLK>,
> +				 <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
> +				 <&camcc CAM_CC_CAM_TOP_FAST_AHB_CLK>,
> +				 <&camcc CAM_CC_CSID_CLK>,
> +				 <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
> +				 <&camcc CAM_CC_CSIPHY0_CLK>,
> +				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CSIPHY1_CLK>,
> +				 <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CSIPHY2_CLK>,
> +				 <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CSIPHY3_CLK>,
> +				 <&camcc CAM_CC_CSI3PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CSIPHY4_CLK>,
> +				 <&camcc CAM_CC_CSI4PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CSIPHY5_CLK>,
> +				 <&camcc CAM_CC_CSI5PHYTIMER_CLK>,
> +				 <&gcc GCC_CAMERA_HF_AXI_CLK>,
> +				 <&camcc CAM_CC_TFE_0_MAIN_CLK>,
> +				 <&camcc CAM_CC_TFE_0_MAIN_FAST_AHB_CLK>,
> +				 <&camcc CAM_CC_TFE_1_MAIN_CLK>,
> +				 <&camcc CAM_CC_TFE_1_MAIN_FAST_AHB_CLK>,
> +				 <&camcc CAM_CC_TFE_2_MAIN_CLK>,
> +				 <&camcc CAM_CC_TFE_2_MAIN_FAST_AHB_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_CSID_CLK>,
> +				 <&camcc CAM_CC_QDSS_DEBUG_XO_CLK>,
> +				 <&camcc CAM_CC_CAMNOC_NRT_IPE_NPS_CLK>,
> +				 <&camcc CAM_CC_CAMNOC_NRT_OFE_MAIN_CLK>,
> +				 <&gcc GCC_CAMERA_SF_AXI_CLK>,
> +				 <&camcc CAM_CC_ICP_0_CLK>,
> +				 <&camcc CAM_CC_ICP_0_AHB_CLK>,
> +				 <&camcc CAM_CC_ICP_1_CLK>,
> +				 <&camcc CAM_CC_ICP_1_AHB_CLK>,
> +				 <&camcc CAM_CC_IPE_NPS_CLK>,
> +				 <&camcc CAM_CC_IPE_NPS_AHB_CLK>,
> +				 <&camcc CAM_CC_IPE_NPS_FAST_AHB_CLK>,
> +				 <&camcc CAM_CC_IPE_PPS_CLK>,
> +				 <&camcc CAM_CC_IPE_PPS_FAST_AHB_CLK>,
> +				 <&camcc CAM_CC_JPEG_0_CLK>,
> +				 <&camcc CAM_CC_JPEG_1_CLK>,
> +				 <&camcc CAM_CC_OFE_AHB_CLK>,
> +				 <&camcc CAM_CC_OFE_ANCHOR_CLK>,
> +				 <&camcc CAM_CC_OFE_ANCHOR_FAST_AHB_CLK>,
> +				 <&camcc CAM_CC_OFE_HDR_CLK>,
> +				 <&camcc CAM_CC_OFE_HDR_FAST_AHB_CLK>,
> +				 <&camcc CAM_CC_OFE_MAIN_CLK>,
> +				 <&camcc CAM_CC_OFE_MAIN_FAST_AHB_CLK>,
> +				 <&camcc CAM_CC_TFE_0_BAYER_CLK>,
> +				 <&camcc CAM_CC_TFE_0_BAYER_FAST_AHB_CLK>,
> +				 <&camcc CAM_CC_TFE_1_BAYER_CLK>,
> +				 <&camcc CAM_CC_TFE_1_BAYER_FAST_AHB_CLK>,
> +				 <&camcc CAM_CC_TFE_2_BAYER_CLK>,
> +				 <&camcc CAM_CC_TFE_2_BAYER_FAST_AHB_CLK>;
> +			clock-names = "camnoc_nrt_axi",
> +				      "camnoc_rt_axi",
> +				      "camnoc_rt_vfe0",
> +				      "camnoc_rt_vfe1",
> +				      "camnoc_rt_vfe2",
> +				      "camnoc_rt_vfe_lite",
> +				      "cam_top_ahb",
> +				      "cam_top_fast_ahb",
> +				      "csid",
> +				      "csid_csiphy_rx",
> +				      "csiphy0",
> +				      "csiphy0_timer",
> +				      "csiphy1",
> +				      "csiphy1_timer",
> +				      "csiphy2",
> +				      "csiphy2_timer",
> +				      "csiphy3",
> +				      "csiphy3_timer",
> +				      "csiphy4",
> +				      "csiphy4_timer",
> +				      "csiphy5",
> +				      "csiphy5_timer",
> +				      "gcc_hf_axi",
> +				      "vfe0",
> +				      "vfe0_fast_ahb",
> +				      "vfe1",
> +				      "vfe1_fast_ahb",
> +				      "vfe2",
> +				      "vfe2_fast_ahb",
> +				      "vfe_lite",
> +				      "vfe_lite_ahb",
> +				      "vfe_lite_cphy_rx",
> +				      "vfe_lite_csid",
> +				      "qdss_debug_xo",
> +				      "camnoc_ipe_nps",
> +				      "camnoc_ofe",
> +				      "gcc_sf_axi",
> +				      "icp0",
> +				      "icp0_ahb",
> +				      "icp1",
> +				      "icp1_ahb",
> +				      "ipe_nps",
> +				      "ipe_nps_ahb",
> +				      "ipe_nps_fast_ahb",
> +				      "ipe_pps",
> +				      "ipe_pps_fast_ahb",
> +				      "jpeg0",
> +				      "jpeg1",
> +				      "ofe_ahb",
> +				      "ofe_anchor",
> +				      "ofe_anchor_fast_ahb",
> +				      "ofe_hdr",
> +				      "ofe_hdr_fast_ahb",
> +				      "ofe_main",
> +				      "ofe_main_fast_ahb",
> +				      "vfe0_bayer",
> +				      "vfe0_bayer_fast_ahb",
> +				      "vfe1_bayer",
> +				      "vfe1_bayer_fast_ahb",
> +				      "vfe2_bayer",
> +				      "vfe2_bayer_fast_ahb";
> +
> +			interrupts = <GIC_SPI 601 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 603 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 605 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 376 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 448 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 89 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 433 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 436 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 457 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 606 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 377 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 271 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 277 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 463 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 657 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 372 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 475 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 276 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 287 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 456 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 664 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 702 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 348 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 349 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 413 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 416 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 417 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "csid0",
> +					  "csid1",
> +					  "csid2",
> +					  "csid_lite0",
> +					  "csid_lite1",
> +					  "csiphy0",
> +					  "csiphy1",
> +					  "csiphy2",
> +					  "csiphy3",
> +					  "csiphy4",
> +					  "csiphy5",
> +					  "vfe0",
> +					  "vfe1",
> +					  "vfe2",
> +					  "vfe_lite0",
> +					  "vfe_lite1",
> +					  "camnoc_nrt",
> +					  "camnoc_rt",
> +					  "icp0",
> +					  "icp1",
> +					  "jpeg_dma0",
> +					  "jpeg_enc0",
> +					  "jpeg_dma1",
> +					  "jpeg_enc1",
> +					  "rt_cdm0",
> +					  "rt_cdm1",
> +					  "rt_cdm2",
> +					  "rt_cdm3",
> +					  "rt_cdm4",
> +					  "tpg0",
> +					  "tpg1",
> +					  "tpg2";
> +
> +			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
> +					<&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +					<&mmss_noc MASTER_CAMNOC_NRT_ICP_SF QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +					<&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +			interconnect-names = "ahb",
> +					     "hf_mnoc",
> +					     "sf_icp_mnoc",
> +					     "sf_mnoc";
> +
> +			iommus = <&apps_smmu 0x1c00 0x00>,
> +				 <&apps_smmu 0x18c0 0x00>,
> +				 <&apps_smmu 0x1980 0x00>,
> +				 <&apps_smmu 0x1840 0x00>,
> +				 <&apps_smmu 0x1800 0x00>,
> +				 <&apps_smmu 0x18a0 0x00>,
> +				 <&apps_smmu 0x1880 0x00>,
> +				 <&apps_smmu 0x1820 0x00>,
> +				 <&apps_smmu 0x1860 0x00>;
> +
> +			power-domains = <&camcc CAM_CC_TFE_0_GDSC>,
> +					<&camcc CAM_CC_TFE_1_GDSC>,
> +					<&camcc CAM_CC_TFE_2_GDSC>,
> +					<&camcc CAM_CC_TITAN_TOP_GDSC>,
> +					<&camcc CAM_CC_IPE_0_GDSC>,
> +					<&camcc CAM_CC_OFE_GDSC>;
> +			power-domain-names = "vfe0",
> +					     "vfe1",
> +					     "vfe2",
> +					     "top",
> +					     "ipe",
> +					     "ofe";
> +
> +			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +				};
> +
> +				port@2 {
> +					reg = <2>;
> +				};
> +			};
> +
>   		};
>   
>   		tcsrcc: clock-controller@f204008 {
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

