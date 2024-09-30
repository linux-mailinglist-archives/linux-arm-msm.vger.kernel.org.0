Return-Path: <linux-arm-msm+bounces-32799-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C7598AC0D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Sep 2024 20:26:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 24C341F239E6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Sep 2024 18:26:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C79CE198825;
	Mon, 30 Sep 2024 18:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="adJw6aET"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E032B9A5;
	Mon, 30 Sep 2024 18:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727720789; cv=none; b=pPBlyac6Yg0fXEWIxt68zR+BlB8SbdL+BAsZMaoLDp7FQ1Q/3oZ6p8J2FqoACY6k2OiKIYksVZyjKJcoozHJCQXp8ySvwfxpMecn30zpjSkq+zOC97vKhz1yC4Ay3G5Mdak8IEc+w4mVPxmeKXgiqNmoqXbwdNaxgVuZz1c4Aek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727720789; c=relaxed/simple;
	bh=qGys6dObxFT/8W+hCh6slTruM2bQdJnRQNIaq0/iFj8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W9R6DoWOYbohkzl1SL5EztGfZ+BiGSvDTQyyXLHG1mvy7TAgjYuqR2uNu3VtmCtfAoz6ffJPrO5cT0vOjuWolyfuPD6/k1nGf89+68ru5mj7nEyAYUEE1spkbvEYUTsB3WgwzGIs0Eeb/ytJPBQms4kzCZFHz4hajHQCmUaktVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=adJw6aET; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-37cd831ab06so1640445f8f.0;
        Mon, 30 Sep 2024 11:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727720784; x=1728325584; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kBo4hcQzRAwzgWQ8voBCkbS9gRqAlgGAC9V64/4Ge9o=;
        b=adJw6aET7G6dW7Q51tyVYwZJi1wSNFF9VIQnYkJe5w4j86FUaLri6MspE2FvXmhXd3
         BCgVvX7f5rVVAFowsw4NcVsl8dg13+rCeq0TGb6tVsK+5jz0x8c95zw0QWhZl1uhf6+P
         rPnXwpU7qRLLDhWQ29aA45XVCW4p0mrS0x7GmxOCQ1SJSXzGwhCLmu1WuLCONlL4aImI
         Ixcw19TnxEkKEQ/coLAYznG4topYslDVHEBfTnI6JPbnM5ehpLMHDz5OUecWH+OPSZxk
         wD/1z7OBSHaR/2osE5tU1Z8aOopvYnn9fkvf3PStdWvsRiDmmWNly5x5ZyglDLLiW3XQ
         xeJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727720784; x=1728325584;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kBo4hcQzRAwzgWQ8voBCkbS9gRqAlgGAC9V64/4Ge9o=;
        b=iZxgI5RPGsLGoBlI2e9NQQihCldoy6E2ccWOmsOljFmrJPuRUr8+cm6IobReuKdsyG
         5x7SuZ+znx3/ykakWfWLMfT+uSikMNRFAe2orii7/EC/W4Z31JhA8Vh+ICW3DQqUVtGS
         lGi7YvMGsN0+uFb2LKt+hcIhjXx43yCS1/KMI7YgoH+7iAye9cunBYxWpVfrVsAr+4hL
         tzVAzaH1rcMCJrcnh6VmYlp2LcqsmhFwdPf4Snn9USLP5aXnL70k40y+gDH1N5mhZ0C/
         qNJ0/+v6OYIfsLAYysGBb3ZwVmECnM/OzPWpKNbrNdblY43N3a3ntBJb33BK3e9SLbLK
         U2BQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEY46lRYqDpwgwhAPZS5tSV6JeQTlJDI2YA45l+qLi2QlexsvRhZhMbcIqwl7mw3yjlVKPCqE5uiYH@vger.kernel.org, AJvYcCWKwzm8Vea+BUtCePYu/RnB7lpJpDuMxwQjJtCEZUXrAkMMNKT96sOR7dpb9eEOYXovne9sYNW7EquE3uk0@vger.kernel.org, AJvYcCXOqLbajnedXE0R9toPmo4VpfU19QqYA0fn6Gbmqr9qXUVW6LvjiRAfVC2ORs7keh/WzrIHmk4tbj7951AK2w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPLAOlCSCYyIRF+xYvXkuNHcnvC67R8NTabwmIoFuQbkhJMJOP
	B8tMtBn78IbOrYdOp2DPj5IkiWzxjU9W2eWDhB2zbqaxEv8RI+m5
X-Google-Smtp-Source: AGHT+IF4n29unXTHxMa7NxWRxVYZTV/ontGlgHt10CcKHJMWzfRkdB50BQImI5xJ0pCazA0cNDJq/w==
X-Received: by 2002:adf:f782:0:b0:367:8a00:fac3 with SMTP id ffacd0b85a97d-37cd5ab7f67mr8530000f8f.30.1727720784206;
        Mon, 30 Sep 2024 11:26:24 -0700 (PDT)
Received: from ?IPV6:2a02:2f04:9003:a900:5ed5:e623:153c:27a5? ([2a02:2f04:9003:a900:5ed5:e623:153c:27a5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd564d5b7sm9846136f8f.5.2024.09.30.11.26.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Sep 2024 11:26:23 -0700 (PDT)
Message-ID: <f9997a19-5aae-41c9-9ca2-c847d8071230@gmail.com>
Date: Mon, 30 Sep 2024 21:26:21 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: Add support for X1-based Dell
 XPS 13 9345
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Laurentiu.Tudor1@dell.com
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Peter de Kraker <peterdekraker@umito.nl>, bryan_kemp@dell.com
References: <20240921163455.12577-1-alex.vinarskis@gmail.com>
 <20240921163455.12577-4-alex.vinarskis@gmail.com>
Content-Language: en-US
From: Laurentiu Tudor <tudor.laurentiu.oss@gmail.com>
In-Reply-To: <20240921163455.12577-4-alex.vinarskis@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Alex,

Thanks for this! Comment inline.

On 9/21/24 19:33, Aleksandrs Vinarskis wrote:
> Initial support for Dell XPS 9345 13" 2024 (Tributo) based on X1E80100.
> 
> Working:
> * Touchpad
> * Keyboard (only post suspend&resume, i2c-hid patch WIP)
> * eDP, with brightness control
> * NVME
> * USB Type-C ports in USB2/USB3 (one orientation)
> * WiFi
> * GPU/aDSP/cDSP firmware loading (requires binaries from Windows)
> * Lid switch
> * Sleep/suspend, nothing visibly broken on resume
> 
> Not working:
> * Speakers (WIP, pin guessing, x4 WSA8845)
> * Microphones (WIP, pin guessing)
> * Fingerprint Reader (WIP, USB MP with ptn3222)
> * USB as DP/USB3 (WIP, PS8830 based)
> * Camera
> * Battery Info
> 
> Should be working, but cannot be tested due to lack of hw:
> * Higher res OLED, higher res IPS panels
> * Touchscreen
> 
> Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> ---
>   arch/arm64/boot/dts/qcom/Makefile             |   1 +
>   .../dts/qcom/x1e80100-dell-tributo-13.dts     | 860 ++++++++++++++++++


Could you please use the marketing name for the device tree file name & 
machine compatible, e.g. "x1e80100-dell-xps13-9345.dts" for the dts file 
and "dell,xps13-9345" for the compat? I'm thinking that this will help 
people to identify it more easily.

---
Thanks & Best Regards, Laurentiu

>   2 files changed, 861 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-dell-tributo-13.dts



> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index ae002c7cf126..111c589d6bae 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -271,6 +271,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-qrd.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= x1e78100-lenovo-thinkpad-t14s.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-asus-vivobook-s15.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-crd.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-dell-tributo-13.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-lenovo-yoga-slim7x.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-microsoft-romulus13.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-microsoft-romulus15.dtb
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-dell-tributo-13.dts b/arch/arm64/boot/dts/qcom/x1e80100-dell-tributo-13.dts
> new file mode 100644
> index 000000000000..ec04b64f9558
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-dell-tributo-13.dts
> @@ -0,0 +1,860 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2024 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/gpio-keys.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +
> +#include "x1e80100.dtsi"
> +#include "x1e80100-pmics.dtsi"
> +
> +/ {
> +	model = "Dell XPS 13 9345";
> +	compatible = "dell,tributo-13", "qcom,x1e80100";
> +	chassis-type = "laptop";
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +
> +		pinctrl-0 = <&hall_int_n_default>;
> +		pinctrl-names = "default";
> +
> +		switch-lid {
> +			gpios = <&tlmm 92 GPIO_ACTIVE_LOW>;
> +			linux,input-type = <EV_SW>;
> +			linux,code = <SW_LID>;
> +			wakeup-source;
> +			wakeup-event-action = <EV_ACT_DEASSERTED>;
> +		};
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&cam_indicator_en>;
> +
> +		led-camera-indicator {
> +			label = "white:camera-indicator";
> +			function = LED_FUNCTION_INDICATOR;
> +			color = <LED_COLOR_ID_WHITE>;
> +			gpios = <&tlmm 110 GPIO_ACTIVE_HIGH>;
> +			linux,default-trigger = "none";
> +			default-state = "off";
> +			/* Reuse as a panic indicator until we get a "camera on" trigger */
> +			panic-indicator;
> +		};
> +	};
> +
> +	pmic-glink {
> +		compatible = "qcom,x1e80100-pmic-glink",
> +			     "qcom,sm8550-pmic-glink",
> +			     "qcom,pmic-glink";
> +		orientation-gpios = <&tlmm 121 GPIO_ACTIVE_HIGH>,
> +				    <&tlmm 123 GPIO_ACTIVE_HIGH>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		/* Right-side USB Type-C port */
> +		connector@0 {
> +			compatible = "usb-c-connector";
> +			reg = <0>;
> +			power-role = "dual";
> +			data-role = "dual";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					pmic_glink_ss0_hs_in: endpoint {
> +						remote-endpoint = <&usb_1_ss0_dwc3_hs>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					pmic_glink_ss0_ss_in: endpoint {
> +						remote-endpoint = <&usb_1_ss0_qmpphy_out>;
> +					};
> +				};
> +			};
> +		};
> +
> +		/* Left-side USB Type-C port */
> +		connector@1 {
> +			compatible = "usb-c-connector";
> +			reg = <1>;
> +			power-role = "dual";
> +			data-role = "dual";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					pmic_glink_ss1_hs_in: endpoint {
> +						remote-endpoint = <&usb_1_ss1_dwc3_hs>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					pmic_glink_ss1_ss_in: endpoint {
> +						remote-endpoint = <&usb_1_ss1_qmpphy_out>;
> +					};
> +				};
> +			};
> +		};
> +	};
> +
> +	reserved-memory {
> +		linux,cma {
> +			compatible = "shared-dma-pool";
> +			size = <0x0 0x8000000>;
> +			reusable;
> +			linux,cma-default;
> +		};
> +	};
> +
> +	vreg_edp_3p3: regulator-edp-3p3 {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "VREG_EDP_3P3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpio = <&tlmm 70 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&edp_reg_en>;
> +		pinctrl-names = "default";
> +
> +		regulator-boot-on;
> +	};
> +
> +	vreg_nvme: regulator-nvme {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "VREG_NVME_3P3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpio = <&tlmm 18 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&nvme_reg_en>;
> +		pinctrl-names = "default";
> +	};
> +
> +	vreg_vph_pwr: regulator-vph-pwr {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "vph_pwr";
> +		regulator-min-microvolt = <3700000>;
> +		regulator-max-microvolt = <3700000>;
> +
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};
> +};
> +
> +&apps_rsc {
> +	regulators-0 {
> +		compatible = "qcom,pm8550-rpmh-regulators";
> +		qcom,pmic-id = "b";
> +		vdd-bob1-supply = <&vreg_vph_pwr>;
> +		vdd-bob2-supply = <&vreg_vph_pwr>;
> +		vdd-l1-l4-l10-supply = <&vreg_s4c_1p8>;
> +		vdd-l2-l13-l14-supply = <&vreg_bob1>;
> +		vdd-l5-l16-supply = <&vreg_bob1>;
> +		vdd-l6-l7-supply = <&vreg_bob2>;
> +		vdd-l8-l9-supply = <&vreg_bob1>;
> +		vdd-l12-supply = <&vreg_s5j_1p2>;
> +		vdd-l15-supply = <&vreg_s4c_1p8>;
> +		vdd-l17-supply = <&vreg_bob2>;
> +
> +		vreg_bob1: bob1 {
> +			regulator-name = "vreg_bob1";
> +			regulator-min-microvolt = <3008000>;
> +			regulator-max-microvolt = <3960000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_bob2: bob2 {
> +			regulator-name = "vreg_bob2";
> +			regulator-min-microvolt = <2504000>;
> +			regulator-max-microvolt = <3008000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l2b_3p0: ldo2 {
> +			regulator-name = "vreg_l2b_3p0";
> +			regulator-min-microvolt = <3072000>;
> +			regulator-max-microvolt = <3072000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l4b_1p8: ldo4 {
> +			regulator-name = "vreg_l4b_1p8";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l6b_1p8: ldo6 {
> +			regulator-name = "vreg_l6b_1p8";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <2960000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l8b_3p0: ldo8 {
> +			regulator-name = "vreg_l8b_3p0";
> +			regulator-min-microvolt = <3072000>;
> +			regulator-max-microvolt = <3072000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l9b_2p9: ldo9 {
> +			regulator-name = "vreg_l9b_2p9";
> +			regulator-min-microvolt = <2960000>;
> +			regulator-max-microvolt = <2960000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l12b_1p2: ldo12 {
> +			regulator-name = "vreg_l12b_1p2";
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l13b_3p0: ldo13 {
> +			regulator-name = "vreg_l13b_3p0";
> +			regulator-min-microvolt = <3072000>;
> +			regulator-max-microvolt = <3072000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l14b_3p0: ldo14 {
> +			regulator-name = "vreg_l14b_3p0";
> +			regulator-min-microvolt = <3072000>;
> +			regulator-max-microvolt = <3072000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l15b_1p8: ldo15 {
> +			regulator-name = "vreg_l15b_1p8";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l17b_2p5: ldo17 {
> +			regulator-name = "vreg_l17b_2p5";
> +			regulator-min-microvolt = <2504000>;
> +			regulator-max-microvolt = <2504000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +	};
> +
> +	regulators-1 {
> +		compatible = "qcom,pm8550ve-rpmh-regulators";
> +		qcom,pmic-id = "c";
> +		vdd-l1-supply = <&vreg_s5j_1p2>;
> +		vdd-l2-supply = <&vreg_s1f_0p7>;
> +		vdd-l3-supply = <&vreg_s1f_0p7>;
> +
> +		vreg_s4c_1p8: smps4 {
> +			regulator-name = "vreg_s4c_1p8";
> +			regulator-min-microvolt = <1856000>;
> +			regulator-max-microvolt = <2000000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l1c_1p2: ldo1 {
> +			regulator-name = "vreg_l1c_1p2";
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l2c_0p8: ldo2 {
> +			regulator-name = "vreg_l2c_0p8";
> +			regulator-min-microvolt = <880000>;
> +			regulator-max-microvolt = <880000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l3c_0p9: ldo3 {
> +			regulator-name = "vreg_l3c_0p9";
> +			regulator-min-microvolt = <920000>;
> +			regulator-max-microvolt = <920000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +	};
> +
> +	regulators-2 {
> +		compatible = "qcom,pmc8380-rpmh-regulators";
> +		qcom,pmic-id = "d";
> +		vdd-l1-supply = <&vreg_s1f_0p7>;
> +		vdd-l2-supply = <&vreg_s1f_0p7>;
> +		vdd-l3-supply = <&vreg_s4c_1p8>;
> +		vdd-s1-supply = <&vreg_vph_pwr>;
> +
> +		vreg_l1d_0p8: ldo1 {
> +			regulator-name = "vreg_l1d_0p8";
> +			regulator-min-microvolt = <880000>;
> +			regulator-max-microvolt = <880000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l2d_0p9: ldo2 {
> +			regulator-name = "vreg_l2d_0p9";
> +			regulator-min-microvolt = <912000>;
> +			regulator-max-microvolt = <912000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l3d_1p8: ldo3 {
> +			regulator-name = "vreg_l3d_1p8";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +	};
> +
> +	regulators-3 {
> +		compatible = "qcom,pmc8380-rpmh-regulators";
> +		qcom,pmic-id = "e";
> +		vdd-l2-supply = <&vreg_s1f_0p7>;
> +		vdd-l3-supply = <&vreg_s5j_1p2>;
> +
> +		vreg_l2e_0p8: ldo2 {
> +			regulator-name = "vreg_l2e_0p8";
> +			regulator-min-microvolt = <880000>;
> +			regulator-max-microvolt = <880000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l3e_1p2: ldo3 {
> +			regulator-name = "vreg_l3e_1p2";
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +	};
> +
> +	regulators-4 {
> +		compatible = "qcom,pmc8380-rpmh-regulators";
> +		qcom,pmic-id = "f";
> +		vdd-l1-supply = <&vreg_s5j_1p2>;
> +		vdd-l2-supply = <&vreg_s5j_1p2>;
> +		vdd-l3-supply = <&vreg_s5j_1p2>;
> +		vdd-s1-supply = <&vreg_vph_pwr>;
> +
> +		vreg_s1f_0p7: smps1 {
> +			regulator-name = "vreg_s1f_0p7";
> +			regulator-min-microvolt = <700000>;
> +			regulator-max-microvolt = <1100000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +	};
> +
> +	regulators-6 {
> +		compatible = "qcom,pm8550ve-rpmh-regulators";
> +		qcom,pmic-id = "i";
> +		vdd-l1-supply = <&vreg_s4c_1p8>;
> +		vdd-l2-supply = <&vreg_s5j_1p2>;
> +		vdd-l3-supply = <&vreg_s1f_0p7>;
> +		vdd-s1-supply = <&vreg_vph_pwr>;
> +		vdd-s2-supply = <&vreg_vph_pwr>;
> +
> +		vreg_s1i_0p9: smps1 {
> +			regulator-name = "vreg_s1i_0p9";
> +			regulator-min-microvolt = <900000>;
> +			regulator-max-microvolt = <920000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_s2i_1p0: smps2 {
> +			regulator-name = "vreg_s2i_1p0";
> +			regulator-min-microvolt = <1000000>;
> +			regulator-max-microvolt = <1100000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l1i_1p8: ldo1 {
> +			regulator-name = "vreg_l1i_1p8";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l2i_1p2: ldo2 {
> +			regulator-name = "vreg_l2i_1p2";
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l3i_0p8: ldo3 {
> +			regulator-name = "vreg_l3i_0p8";
> +			regulator-min-microvolt = <880000>;
> +			regulator-max-microvolt = <880000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +	};
> +
> +	regulators-7 {
> +		compatible = "qcom,pm8550ve-rpmh-regulators";
> +		qcom,pmic-id = "j";
> +		vdd-l1-supply = <&vreg_s1f_0p7>;
> +		vdd-l2-supply = <&vreg_s5j_1p2>;
> +		vdd-l3-supply = <&vreg_s1f_0p7>;
> +		vdd-s5-supply = <&vreg_vph_pwr>;
> +
> +		vreg_s5j_1p2: smps5 {
> +			regulator-name = "vreg_s5j_1p2";
> +			regulator-min-microvolt = <1256000>;
> +			regulator-max-microvolt = <1304000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l1j_0p9: ldo1 {
> +			regulator-name = "vreg_l1j_0p9";
> +			regulator-min-microvolt = <912000>;
> +			regulator-max-microvolt = <912000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l2j_1p2: ldo2 {
> +			regulator-name = "vreg_l2j_1p2";
> +			regulator-min-microvolt = <1256000>;
> +			regulator-max-microvolt = <1256000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l3j_0p8: ldo3 {
> +			regulator-name = "vreg_l3j_0p8";
> +			regulator-min-microvolt = <880000>;
> +			regulator-max-microvolt = <880000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +	};
> +};
> +
> +&gpu {
> +	status = "okay";
> +
> +	zap-shader {
> +		firmware-name = "qcom/x1e80100/dell/tributo/qcdxkmsuc8380.mbn";
> +	};
> +};
> +
> +&i2c0 {
> +	clock-frequency = <400000>;
> +	status = "okay";
> +
> +	keyboard@5 {
> +		compatible = "hid-over-i2c";
> +		reg = <0x5>;
> +
> +		hid-descr-addr = <0x20>;
> +		interrupts-extended = <&tlmm 67 IRQ_TYPE_LEVEL_LOW>;
> +
> +		pinctrl-0 = <&kybd_default>;
> +		pinctrl-names = "default";
> +
> +		wakeup-source;
> +	};
> +};
> +
> +&i2c3 {
> +	clock-frequency = <400000>;
> +	status = "disabled";
> +	/* PS8830 Retimer @0x8 */
> +	/* Unknown device @0x9 */
> +};
> +
> +&i2c5 {
> +	clock-frequency = <100000>;
> +	status = "disabled";
> +	/* Unknown device @0x3b */
> +};
> +
> +&i2c7 {
> +	clock-frequency = <400000>;
> +	status = "disabled";
> +	/* PS8830 Retimer @0x8 */
> +	/* Unknown device @0x9 */
> +};
> +
> +&i2c8 {
> +	clock-frequency = <400000>;
> +
> +	status = "okay";
> +
> +	touchscreen@0 {
> +		compatible = "hid-over-i2c";
> +		reg = <0x0>;
> +
> +		hid-descr-addr = <0x1>;
> +		interrupts-extended = <&tlmm 51 IRQ_TYPE_LEVEL_LOW>;
> +
> +		pinctrl-0 = <&ts0_default>;
> +		pinctrl-names = "default";
> +	};
> +};
> +
> +&i2c9 {
> +	clock-frequency = <400000>;
> +	status = "disabled";
> +	/* USB3 retimer device @0x4f */
> +};
> +
> +&i2c17 {
> +	clock-frequency = <400000>;
> +	status = "okay";
> +
> +	touchpad@2c {
> +		compatible = "hid-over-i2c";
> +		reg = <0x2c>;
> +
> +		hid-descr-addr = <0x20>;
> +		interrupts-extended = <&tlmm 3 IRQ_TYPE_LEVEL_LOW>;
> +
> +		pinctrl-0 = <&tpad_default>;
> +		pinctrl-names = "default";
> +
> +		wakeup-source;
> +	};
> +};
> +
> +&mdss {
> +	status = "okay";
> +};
> +
> +&mdss_dp3 {
> +	compatible = "qcom,x1e80100-dp";
> +	/delete-property/ #sound-dai-cells;
> +
> +	status = "okay";
> +
> +	aux-bus {
> +		panel {
> +			/* 1920x1200 IPS panel is SHP1593, PNP09FF compatible */
> +			compatible = "edp-panel";
> +			power-supply = <&vreg_edp_3p3>;
> +
> +			port {
> +				edp_panel_in: endpoint {
> +					remote-endpoint = <&mdss_dp3_out>;
> +				};
> +			};
> +		};
> +	};
> +
> +	ports {
> +		port@1 {
> +			reg = <1>;
> +
> +			mdss_dp3_out: endpoint {
> +				data-lanes = <0 1 2 3>;
> +				link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
> +
> +				remote-endpoint = <&edp_panel_in>;
> +			};
> +		};
> +	};
> +};
> +
> +&mdss_dp3_phy {
> +	vdda-phy-supply = <&vreg_l3j_0p8>;
> +	vdda-pll-supply = <&vreg_l2j_1p2>;
> +
> +	status = "okay";
> +};
> +
> +&pcie4 {
> +	perst-gpios = <&tlmm 146 GPIO_ACTIVE_LOW>;
> +	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
> +
> +	pinctrl-0 = <&pcie4_default>;
> +	pinctrl-names = "default";
> +
> +	status = "okay";
> +};
> +
> +&pcie4_phy {
> +	vdda-phy-supply = <&vreg_l3i_0p8>;
> +	vdda-pll-supply = <&vreg_l3e_1p2>;
> +
> +	status = "okay";
> +};
> +
> +&pcie6a {
> +	perst-gpios = <&tlmm 152 GPIO_ACTIVE_LOW>;
> +	wake-gpios = <&tlmm 154 GPIO_ACTIVE_LOW>;
> +
> +	vddpe-3v3-supply = <&vreg_nvme>;
> +
> +	pinctrl-0 = <&pcie6a_default>;
> +	pinctrl-names = "default";
> +
> +	status = "okay";
> +};
> +
> +&pcie6a_phy {
> +	vdda-phy-supply = <&vreg_l1d_0p8>;
> +	vdda-pll-supply = <&vreg_l2j_1p2>;
> +
> +	status = "okay";
> +};
> +
> +&qupv3_0 {
> +	status = "okay";
> +};
> +
> +&qupv3_1 {
> +	status = "okay";
> +};
> +
> +&qupv3_2 {
> +	status = "okay";
> +};
> +
> +&remoteproc_adsp {
> +	firmware-name = "qcom/x1e80100/dell/tributo/qcadsp8380.mbn",
> +			"qcom/x1e80100/dell/tributo/adsp_dtbs.elf";
> +
> +	status = "okay";
> +};
> +
> +&remoteproc_cdsp {
> +	firmware-name = "qcom/x1e80100/dell/tributo/qccdsp8380.mbn",
> +			"qcom/x1e80100/dell/tributo/cdsp_dtbs.elf";
> +
> +	status = "okay";
> +};
> +
> +&smb2360_0_eusb2_repeater {
> +	vdd18-supply = <&vreg_l3d_1p8>;
> +	vdd3-supply = <&vreg_l2b_3p0>;
> +};
> +
> +&smb2360_1_eusb2_repeater {
> +	vdd18-supply = <&vreg_l3d_1p8>;
> +	vdd3-supply = <&vreg_l14b_3p0>;
> +};
> +
> +&tlmm {
> +	gpio-reserved-ranges = <44 4>,  /* SPI11 (TPM) */
> +			       <76 4>,  /* SPI19 (TZ Protected) */
> +			       <238 1>; /* UFS Reset */
> +
> +	cam_indicator_en: cam-indicator-en-state {
> +		pins = "gpio110";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	edp_reg_en: edp-reg-en-state {
> +		pins = "gpio70";
> +		function = "gpio";
> +		drive-strength = <16>;
> +		bias-disable;
> +	};
> +
> +	hall_int_n_default: hall-int-n-state {
> +		pins = "gpio92";
> +		function = "gpio";
> +
> +		bias-disable;
> +	};
> +
> +	kybd_default: kybd-default-state {
> +		pins = "gpio67";
> +		function = "gpio";
> +		bias-pull-up;
> +	};
> +
> +	nvme_reg_en: nvme-reg-en-state {
> +		pins = "gpio18";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	pcie4_default: pcie4-default-state {
> +		clkreq-n-pins {
> +			pins = "gpio147";
> +			function = "pcie4_clk";
> +			drive-strength = <2>;
> +			bias-pull-up;
> +		};
> +
> +		perst-n-pins {
> +			pins = "gpio146";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-disable;
> +		};
> +
> +		wake-n-pins {
> +			pins = "gpio148";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-pull-up;
> +		};
> +	};
> +
> +	pcie6a_default: pcie6a-default-state {
> +		clkreq-n-pins {
> +			pins = "gpio153";
> +			function = "pcie6a_clk";
> +			drive-strength = <2>;
> +			bias-pull-up;
> +		};
> +
> +		perst-n-pins {
> +			pins = "gpio152";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-disable;
> +		};
> +
> +		wake-n-pins {
> +			pins = "gpio154";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-pull-up;
> +		};
> +	};
> +
> +	tpad_default: tpad-default-state {
> +		disable-pins {
> +			pins = "gpio38";
> +			function = "gpio";
> +			output-high;
> +		};
> +
> +		int-n-pins {
> +			pins = "gpio3";
> +			function = "gpio";
> +			bias-pull-up;
> +		};
> +
> +		reset-n-pins {
> +			pins = "gpio52";
> +			function = "gpio";
> +			bias-disable;
> +		};
> +	};
> +
> +	ts0_default: ts0-default-state {
> +		disable-pins {
> +			pins = "gpio75";
> +			function = "gpio";
> +			output-high;
> +		};
> +
> +		int-n-pins {
> +			pins = "gpio51";
> +			function = "gpio";
> +			bias-pull-up;
> +		};
> +
> +		reset-n-pins {
> +			/* Technically should be High-Z input */
> +			pins = "gpio48";
> +			function = "gpio";
> +			output-low;
> +			drive-strength = <2>;
> +		};
> +	};
> +};
> +
> +&uart21 {
> +	compatible = "qcom,geni-debug-uart";
> +	status = "okay";
> +};
> +
> +&usb_1_ss0_hsphy {
> +	vdd-supply = <&vreg_l3j_0p8>;
> +	vdda12-supply = <&vreg_l2j_1p2>;
> +
> +	phys = <&smb2360_0_eusb2_repeater>;
> +
> +	status = "okay";
> +};
> +
> +&usb_1_ss0_qmpphy {
> +	vdda-phy-supply = <&vreg_l3e_1p2>;
> +	vdda-pll-supply = <&vreg_l1j_0p9>;
> +
> +	status = "okay";
> +};
> +
> +&usb_1_ss0 {
> +	status = "okay";
> +};
> +
> +&usb_1_ss0_dwc3 {
> +	dr_mode = "host";
> +};
> +
> +&usb_1_ss0_dwc3_hs {
> +	remote-endpoint = <&pmic_glink_ss0_hs_in>;
> +};
> +
> +&usb_1_ss0_qmpphy_out {
> +	remote-endpoint = <&pmic_glink_ss0_ss_in>;
> +};
> +
> +&usb_1_ss1_hsphy {
> +	vdd-supply = <&vreg_l3j_0p8>;
> +	vdda12-supply = <&vreg_l2j_1p2>;
> +
> +	phys = <&smb2360_1_eusb2_repeater>;
> +
> +	status = "okay";
> +};
> +
> +&usb_1_ss1_qmpphy {
> +	vdda-phy-supply = <&vreg_l3e_1p2>;
> +	vdda-pll-supply = <&vreg_l2d_0p9>;
> +
> +	status = "okay";
> +};
> +
> +&usb_1_ss1 {
> +	status = "okay";
> +};
> +
> +&usb_1_ss1_dwc3 {
> +	dr_mode = "host";
> +};
> +
> +&usb_1_ss1_dwc3_hs {
> +	remote-endpoint = <&pmic_glink_ss1_hs_in>;
> +};
> +
> +&usb_1_ss1_qmpphy_out {
> +	remote-endpoint = <&pmic_glink_ss1_ss_in>;
> +};


