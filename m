Return-Path: <linux-arm-msm+bounces-84086-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A13C7C9BAF5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Dec 2025 14:59:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 997234E1786
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Dec 2025 13:59:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 042373203AF;
	Tue,  2 Dec 2025 13:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x00jzQT+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1616E31ED72
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Dec 2025 13:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764683956; cv=none; b=c4VW/YBMqWSH78QZIXRJQGHuGDO838QPx34BwHhCHTkdElrdL+ZeBxjkkrS2rgm4TBWRwoGhpm9cIsLfwm99esyGhoUorYWnBv5dihi+sVz58gYYzwEgfz8yj8Trxsbb75ZBG32cWP3vb4ScqYXTB/NtvOG+XIRmXHgkuwlrJfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764683956; c=relaxed/simple;
	bh=HmaqoQIuPwqbMuc4xvu1kJ7krWxxfT7T6CGXIcKTfPE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Herw2GrqhXdZ1qenpjH4fd7+J6itwio4qhLDC/dKiuy71xpw4ijWRq2Y6pF3Lz8hM6Fc3I/QQZ21ukzv5c/GBefF+hcVgAJEyqqAE6yjDz0DXW+QayV5S7bvS049LjFHX7QfCJ25gmOqN+WKHUJ27WK/G8SzTNBr4L0+cAcXj90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x00jzQT+; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-37b9552618aso4084031fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Dec 2025 05:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764683953; x=1765288753; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DNSMC7M9xl88C1slHGyNkETiEDgHYTw4VftIhWKCaB8=;
        b=x00jzQT+JVQdt8pBJv9imkGZdpnyn/sGqUZFS5rwzM6m0m4g6s3SVOl7j9ATO4zDwa
         YhXGzNth4l/foZpj2Vsvwhms+xYATWfCt2tEgpcj1neKYLHohXDGwQuum6MMyon2LPgl
         GGFY3b4atMowb9AbQfuubuhq7VtHj4SvetHS2xKZxa8V0P2zcblbd8E2FP9jVeAP+vaD
         06pHMQzQnuDBmu1C3pOigxYVDYMXXlEK5JGulh/VkIBRPh7pSwOEC4zZ2rXhiUEeXXVi
         HB1trdJxXmL4FVJi+MkWTGigZ4/bE5ahtWP2NiJ/QlW8d/egp11tLWBGGTjg0PM3OIs6
         l70Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764683953; x=1765288753;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DNSMC7M9xl88C1slHGyNkETiEDgHYTw4VftIhWKCaB8=;
        b=ErcTUeJD5YxviUNl+zTTAkrkhtig5xjLUX8L3RvUiPhm/Zw+6SsiceC/fl9RiZXilG
         Z5Y102mRyDVDhfBQDn1oOC1CoxXhkdEoqKn4kLRBascVAVQGTPrr9/ax1tujds29XFuK
         tdfUBng+CzcdKUK1ZRXM45PPYzLCxLHsRvpNh1V7hhUdCxPPofyfoutewHUBqjEhetzc
         vUsk1gXD89jymJ1OZRjAV1SMgB/F51UutmwpVaLvo6M8Qe5N4qJgANxx6Is+7pknt612
         N6a/DFBvvjvHGHawqDN1afjZcY9HtGK+db99l4M7rtpI/rZxvFzZWX9IrJHk4JLWhYBr
         g9Pg==
X-Forwarded-Encrypted: i=1; AJvYcCUG5y5pA4Jgl511uqA4rDxFFRgv8pODzsiqy0NVqFTXroKnoBf0moElfkwGlE0kOXldZsPqlXZF/g29Scqx@vger.kernel.org
X-Gm-Message-State: AOJu0YwgidIzj3Dsh30TvxdjQtDIz8olfAymWIiEEctG7MfoS1TaeLQX
	D0dQVN/f3UJEXbbLFW0TvkKtf4lCvUiWIFXQbA5FgNhUeok2MP9jO7RklFOO+We1Bzc=
X-Gm-Gg: ASbGnct3Z4QlkwfqufGiKby4jPjn/aK75Rqajh0fM5PwjWpLFr4dhPWwMryP6KaoLAa
	so8YyhPDqmdDQRF4riQq5Vwimta/oduOzkSuFvBw6Lt3/Q0U/v9rADQS0x0e6EVscJy8EgarLq6
	WAICuEAAIXy6E/HbfbgoOVhzTvq0EjlJHPfjOQirWltZtxlmWmNfWvP1cqQINrzTlvPmOKfcwjk
	2Q0qfwxMlibQAU5I2k8JWQq1bZ5JTLIg5N7gfMTGRr7I9rqNjGV2eveEc8nUbVwgYr0X2Jsbp0c
	xB6SPkq13+lj123wxaTrDSrYT99dgwyJCoSAez7u+e5cV9EDAE1QdC4dvLBIXHcdMcvGQ6o2Gs+
	DUvZrcuHu4LdBZGXiQPMFTeXuyn9SGhTgFZ0BGnbwYMsa6+BsWHnSpx0fCIAX/tL9BThti/vbG9
	shH2JdrWJIwxOWh4PS9i/UMex9JatsVmcoWfiOkLfwVnpYXcCxMitblE4excWe0qkCAw==
X-Google-Smtp-Source: AGHT+IFD4ygiTUwpVetjY+YcyYspKUcJU2+mn6x1QGz+FyWnrBex+TX+bFnUsxdCU1JKBbVgW8WtTQ==
X-Received: by 2002:a05:651c:221f:b0:378:f0d6:8fb1 with SMTP id 38308e7fff4ca-37cdc416570mr63309411fa.5.1764683953036;
        Tue, 02 Dec 2025 05:59:13 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37d2412a091sm38320371fa.50.2025.12.02.05.59.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Dec 2025 05:59:12 -0800 (PST)
Message-ID: <8ff6ab79-a3d3-48e3-9340-8b91a9ce1b27@linaro.org>
Date: Tue, 2 Dec 2025 15:59:03 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] arm64: dts: qcom: qcs8300: Add CCI definitions
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, bryan.odonoghue@linaro.org, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andersson@kernel.org, konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, nihalkum@qti.qualcomm.com,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ravi Shankar <quic_rshankar@quicinc.com>,
 Vishal Verma <quic_vishverm@quicinc.com>,
 Suresh Vankadara <quic_svankada@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20251126081057.4191122-1-quic_vikramsa@quicinc.com>
 <20251126081057.4191122-3-quic_vikramsa@quicinc.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20251126081057.4191122-3-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/26/25 10:10, Vikram Sharma wrote:
> From: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
> 
> Qualcomm QCS8300 SoC contains three Camera Control Interface (CCI).
> Compared to Lemans, the key difference is in SDA/SCL GPIO assignments
> and number of CCIs.
> 
> Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
> Co-developed-by: Ravi Shankar <quic_rshankar@quicinc.com>
> Signed-off-by: Ravi Shankar <quic_rshankar@quicinc.com>
> Co-developed-by: Vishal Verma <quic_vishverm@quicinc.com>
> Signed-off-by: Vishal Verma <quic_vishverm@quicinc.com>
> Co-developed-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/monaco.dtsi | 345 +++++++++++++++++++++++++++
>   1 file changed, 345 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
> index 774255c3f6fc..7c575e1c5e10 100644
> --- a/arch/arm64/boot/dts/qcom/monaco.dtsi
> +++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
> @@ -4776,6 +4776,117 @@ videocc: clock-controller@abf0000 {
>   			#power-domain-cells = <1>;
>   		};
>   
> +		cci0: cci@ac13000 {
> +			compatible = "qcom,qcs8300-cci", "qcom,msm8996-cci";
> +			reg = <0x0 0x0ac13000 0x0 0x1000>;
> +
> +			interrupts = <GIC_SPI 460 IRQ_TYPE_EDGE_RISING>;
> +
> +			clocks = <&camcc CAM_CC_CPAS_AHB_CLK>,
> +				 <&camcc CAM_CC_CCI_0_CLK>;
> +			clock-names = "cpas_ahb",
> +				      "cci";
> +
> +			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +
> +			pinctrl-0 = <&cci0_0_default &cci0_1_default>;
> +			pinctrl-1 = <&cci0_0_sleep &cci0_1_sleep>;
> +			pinctrl-names = "default", "sleep";
> +
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			status = "disabled";
> +
> +			cci0_i2c0: i2c-bus@0 {
> +				reg = <0>;
> +				clock-frequency = <1000000>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +
> +			cci0_i2c1: i2c-bus@1 {
> +				reg = <1>;
> +				clock-frequency = <1000000>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +		};
> +
> +		cci1: cci@ac14000 {
> +			compatible = "qcom,qcs8300-cci", "qcom,msm8996-cci";
> +			reg = <0x0 0x0ac14000 0x0 0x1000>;
> +
> +			interrupts = <GIC_SPI 271 IRQ_TYPE_EDGE_RISING>;
> +
> +			clocks = <&camcc CAM_CC_CPAS_AHB_CLK>,
> +				 <&camcc CAM_CC_CCI_1_CLK>;
> +			clock-names = "cpas_ahb",
> +				      "cci";
> +
> +			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +
> +			pinctrl-0 = <&cci1_0_default &cci1_1_default>;
> +			pinctrl-1 = <&cci1_0_sleep &cci1_1_sleep>;
> +			pinctrl-names = "default", "sleep";
> +
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			status = "disabled";
> +
> +			cci1_i2c0: i2c-bus@0 {
> +				reg = <0>;
> +				clock-frequency = <1000000>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +
> +			cci1_i2c1: i2c-bus@1 {
> +				reg = <1>;
> +				clock-frequency = <1000000>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +		};
> +
> +		cci2: cci@ac15000 {
> +			compatible = "qcom,qcs8300-cci", "qcom,msm8996-cci";
> +			reg = <0x0 0x0ac15000 0x0 0x1000>;
> +
> +			interrupts = <GIC_SPI 651 IRQ_TYPE_EDGE_RISING>;
> +
> +			clocks = <&camcc CAM_CC_CPAS_AHB_CLK>,
> +				 <&camcc CAM_CC_CCI_2_CLK>;
> +			clock-names = "cpas_ahb",
> +				      "cci";
> +
> +			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +
> +			pinctrl-0 = <&cci2_0_default &cci2_1_default>;
> +			pinctrl-1 = <&cci2_0_sleep &cci2_1_sleep>;
> +			pinctrl-names = "default", "sleep";
> +
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			status = "disabled";
> +
> +			cci2_i2c0: i2c-bus@0 {
> +				reg = <0>;
> +				clock-frequency = <1000000>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +
> +			cci2_i2c1: i2c-bus@1 {
> +				reg = <1>;
> +				clock-frequency = <1000000>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +		};
> +
>   		camss: isp@ac78000 {
>   			compatible = "qcom,qcs8300-camss";
>   
> @@ -5071,6 +5182,240 @@ tlmm: pinctrl@f100000 {
>   			#interrupt-cells = <2>;
>   			wakeup-parent = <&pdc>;
>   
> +			cam0_avdd_2v8_en_default: cam0-avdd-2v8-en-state {
> +				pins = "gpio73";
> +				function = "gpio";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};
> +
> +			cam0_default: cam0-default-state {
> +				pins = "gpio67";
> +				function = "cam_mclk";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};
> +
> +			cam1_avdd_2v8_en_default: cam1-avdd-2v8-en-state {
> +				pins = "gpio74";
> +				function = "gpio";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};
> +
> +			cam1_default: cam1-default-state {
> +				pins = "gpio68";
> +				function = "cam_mclk";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};

MCLK pad function declatarions has nothing in common with the CCI, thus it
should be split into a separate commit.

> +
> +			cam2_avdd_2v8_en_default: cam2-avdd-2v8-en-state {
> +				pins = "gpio75";
> +				function = "gpio";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};

All declarations of GPIOs to enable regulators shall be moved to a board
specific .dts file.

-- 
Best wishes,
Vladimir

