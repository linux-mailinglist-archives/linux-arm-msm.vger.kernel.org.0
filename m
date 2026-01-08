Return-Path: <linux-arm-msm+bounces-88049-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 11AF8D03251
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 14:49:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 742B330034A4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 13:49:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D88143FD3D;
	Thu,  8 Jan 2026 09:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k4pPRWeT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 141EF43FD02
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jan 2026 09:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767864570; cv=none; b=egXOYTPoqk/0pCsXMNtxYrziqtVyg3OPzDnhQz9kM9rLGvsXOJrSps9mqkLeY4IT5ELthTZjCE1CNlmhGZeDOfFP6jKSOcizmC+TltJEeKlYyIciKH/ZbLq5mkui5DzEUDqtkYl/3PlrHXQSc4twVGSvwNwhYQKUPm6forbgmJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767864570; c=relaxed/simple;
	bh=PrHOjWmMs50p/KUvbh/QrsV0HW0OwhpoyGG2SgFCfQ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H8MiCckwTDyUhA35y1PSa+5YBDv6MPjoTIQ0H/AycyuM+UhdYz2KFPsTbEusMghMm+D6EWzHe5A8M7T8QyTTmdiC9Ya8//z1Jym0yzUYlPeRdBlFrE4XllG2R1tE6qO/gEbnFyK+6jXDBlhmHljyatLxe/R8dxSlBob/xn/lwEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k4pPRWeT; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7e2762ad850so2552849b3a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 01:29:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767864560; x=1768469360; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Swmt8vzk/nXgN18NNmhsk9yNNMFGp5ZKWjha8Lt5/EE=;
        b=k4pPRWeT3pYj4rX9Y/UGIEJW7rJo11id+/yJmSZTv8Ed1WfByifp+tunEvDBmM+90Z
         IlC4CBjNbxL7rsnA54ZuNaBzFAT8UZFtOyy/+S2l6T/Ix0hYw30xP5aoR0MNgq/RwsWM
         mYFJ4krmMJvwegGYeC0hpvPbJyXQ2Ytb5xGZS8U9wIfGjJT4DW+xPxpKnFn0CQPl55zV
         OxqeywJ61Wu1Kj3szL2WZzihW4VME9/Rdfo0SEpd1Xkht8f1dvEdItkpbOM0exOKpX7j
         K8YfNBcHyHPzzVUlEkEfpsNgo5HsQE22A2oUH6tM+Qfm1b6bK0KXKdlvII4jdDJfSTLL
         amYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767864560; x=1768469360;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Swmt8vzk/nXgN18NNmhsk9yNNMFGp5ZKWjha8Lt5/EE=;
        b=pqaXaH9Ik7JsrUVzKZQewITvXMkGHp0CHytnWyY3biraY4BNXv+E+OE4t8ihMq4VFG
         Ua2+uEHa6BdIKxQp4GgdZYtGJ0txf1qdLoSkeOj673IhemgpB5QfOFc+4h48ayJ2wGM0
         Rv/OzhvlGSbUzc78bp6ThYcfeG3ZGo2vORYRC3AzYAsvoZ8Wm/jOCf4kRvm1loJoFAYh
         oJzqoHipa7LwfSYUVrK2xqNq8RpN2xeMR/pzcHKqQCZIeChzQnIuiPHaDdenBGKV+ZOM
         6SOSpbM+MlKXsbjV0oZjlVFFrRFm31xokeC5qbeVKb3MOgaXS+cUTwBhA2y9BfP+q5mw
         mpDg==
X-Forwarded-Encrypted: i=1; AJvYcCW6WcTIypP7tstOcRCFaWVbg0N0aNgJeYzooRZ1u+KNpAScBnc497oZn+wlokzHRFAg3nzVSq2N7HdvFkhT@vger.kernel.org
X-Gm-Message-State: AOJu0YxHcuOCWiMOsrN4M7j+wOv8ZjYaqJs3XGPSSIWLr6Iv3NyQQmB7
	o+YWE0WS/elu7RSForS+q38ydysSHpJVdLLsVQzvgz4DE3nJa0tpf80JLu87Wg==
X-Gm-Gg: AY/fxX7FTEWc7j1EWc6nDYjZJPM+dbo64B0NSN7mUq+Rm0PBVMczcyI9eZ6Sh8qe7HW
	PmLolPuAo6dA8YOBsWoY8mk2Cb1DM9aE685RxEzj7U0dvKX/L1L6kGlcrGknMIyA3WtdOK+e39Y
	l9sD6wc8JmButkFQrQPne/HsJvlh/IfaX60IHPh8Ttyi166Xc+czHGQOKXEIHbgssgQ6ha/AM1f
	ysMEetvyv1QJFmMPm/IGigus14sKIpRwT2Qo0bLLjMTKHQvUgwMarsYMBhJkCDuc09lxgGEpvCx
	ABoVtAe1VcgFVz29phfrxQGPsbW5UC7xpUMeoI52RZ/UWplM1nk9NRQBxTNSo0EnT/iDO7A90yI
	z0+xgsy4La0UjQu/03DIeNZIjpqJhwOJEwLZq81QVsl6HDQX5alfMl/5289kJ768rtRnMciNTS0
	jIA5oUv0I79+U3LZYA7RLMfoLI4rBshffDEPopUCkyFMY=
X-Google-Smtp-Source: AGHT+IG16vU0X6q7MoARHrHf0ck4c+oOFDcf8s1Kq8AaiHwkX7nRfTSmecEIHhUPVLA9Ju2mWKZwYQ==
X-Received: by 2002:a05:6a00:ab03:b0:7e8:4433:8fb7 with SMTP id d2e1a72fcca58-81b801ce304mr5200072b3a.63.1767864559919;
        Thu, 08 Jan 2026 01:29:19 -0800 (PST)
Received: from [172.16.20.12] ([136.226.245.1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819baa195e4sm7150023b3a.3.2026.01.08.01.29.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 01:29:19 -0800 (PST)
Message-ID: <0d48a1b6-6946-4882-9dbd-1a1bb50770e2@gmail.com>
Date: Thu, 8 Jan 2026 14:59:44 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 5/5] arm64: dts: qcom: talos-evk: Add support for
 QCS615 talos evk board
To: yuanjiey <yuanjie.yang@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251230130227.3503590-6-tessolveupstream@gmail.com>
 <aV4bRLY6s3s3uAXa@yuanjiey.ap.qualcomm.com>
Content-Language: en-US
From: tessolveupstream@gmail.com
In-Reply-To: <aV4bRLY6s3s3uAXa@yuanjiey.ap.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 07-01-2026 14:07, yuanjiey wrote:
> On Tue, Dec 30, 2025 at 06:32:27PM +0530, Sudarshan Shetty wrote:
>> Add the device tree for the QCS615-based Talos EVK platform. The
>> platform is composed of a System-on-Module following the SMARC
>> standard, and a Carrier Board.
>>
>> The Carrier Board supports several display configurations, HDMI and
>> LVDS. Both configurations use the same base hardware, with the display
>> selection controlled by a DIP switch.
>>
>> Use a DTBO file, talos-evk-lvds-auo,g133han01.dtso, which defines an
>> overlay that disables HDMI and adds LVDS. The DTs file talos-evk
>> can describe the HDMI display configurations.
>>
>> The initial device tree includes support for:
>> - CPU and memory
>> - UART
>> - GPIOs
>> - Regulators
>> - PMIC
>> - Early console
>> - AT24MAC602 EEPROM
>> - MCP2515 SPI to CAN
>> - ADV7535 DSI-to-HDMI bridge
>> - DisplayPort interface
>> - SN65DSI84ZXHR DSI-to-LVDS bridge
>> - Wi-Fi/BT
>>
>> Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/Makefile             |   4 +
>>  .../qcom/talos-evk-lvds-auo,g133han01.dtso    | 126 ++++
>>  arch/arm64/boot/dts/qcom/talos-evk-som.dtsi   | 598 ++++++++++++++++++
>>  arch/arm64/boot/dts/qcom/talos-evk.dts        | 139 ++++
>>  4 files changed, 867 insertions(+)
>>  create mode 100644 arch/arm64/boot/dts/qcom/talos-evk-lvds-auo,g133han01.dtso
>>  create mode 100644 arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
>>  create mode 100644 arch/arm64/boot/dts/qcom/talos-evk.dts
>>
>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
>> index 76cf0115a00a..289b651ef0c5 100644
>> --- a/arch/arm64/boot/dts/qcom/Makefile
>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>> @@ -324,6 +324,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-mtp.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-qrd.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-mtp.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-qrd.dtb
>> +dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk.dtb
>> +talos-evk-lvds-auo,g133han01-dtbs	:= \
>> +	talos-evk.dtb talos-evk-lvds-auo,g133han01.dtbo
>> +dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-lvds-auo,g133han01.dtb
>>  x1e001de-devkit-el2-dtbs	:= x1e001de-devkit.dtb x1-el2.dtbo
>>  dtb-$(CONFIG_ARCH_QCOM)	+= x1e001de-devkit.dtb x1e001de-devkit-el2.dtb
>>  x1e78100-lenovo-thinkpad-t14s-el2-dtbs	:= x1e78100-lenovo-thinkpad-t14s.dtb x1-el2.dtbo
>> diff --git a/arch/arm64/boot/dts/qcom/talos-evk-lvds-auo,g133han01.dtso b/arch/arm64/boot/dts/qcom/talos-evk-lvds-auo,g133han01.dtso
>> new file mode 100644
>> index 000000000000..5393d1dc7fea
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/talos-evk-lvds-auo,g133han01.dtso
>> @@ -0,0 +1,126 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +/dts-v1/;
>> +/plugin/;
>> +
>> +#include <dt-bindings/gpio/gpio.h>
>> +
>> +&{/} {
>> +	backlight: backlight {
>> +		compatible = "gpio-backlight";
>> +		gpios = <&tlmm 59 GPIO_ACTIVE_HIGH>,
>> +			<&tlmm 115 GPIO_ACTIVE_HIGH>;
>> +		default-on;
>> +	};
>> +
>> +	hdmi_connector: hdmi-out {
>> +		status = "disabled";
>> +	};
>> +
>> +	panel-lvds {
>> +		compatible = "auo,g133han01";
>> +
>> +		ports {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +
>> +			/* LVDS A (Odd pixels) */
>> +			port@0 {
>> +				reg = <0>;
>> +				dual-lvds-odd-pixels;
>> +
>> +				lvds_panel_out_a: endpoint {
>> +					remote-endpoint = <&sn65dsi84_out_a>;
>> +				};
>> +			};
>> +
>> +			/* LVDS B (Even pixels) */
>> +			port@1 {
>> +				reg = <1>;
>> +				dual-lvds-even-pixels;
>> +
>> +				lvds_panel_out_b: endpoint {
>> +					remote-endpoint = <&sn65dsi84_out_b>;
>> +				};
>> +			};
>> +		};
>> +	};
>> +};
>> +
>> +&i2c1 {
>> +	clock-frequency = <400000>;
>> +
>> +	status = "okay";
>> +
>> +	hdmi_bridge: bridge@3d {
>> +		status = "disabled";
>> +	};
>> +
>> +	lvds_bridge: bridge@2c {
>> +		compatible = "ti,sn65dsi84";
>> +		reg = <0x2c>;
>> +		enable-gpios = <&tlmm 42 GPIO_ACTIVE_HIGH>;
>> +		ti,dsi-lanes = <4>;
>> +		ti,lvds-format = "jeida-24";
>> +		ti,lvds-bpp = <24>;
> 
> These properties can work?
> 
> dtbinding check says:
> 
> /local/mnt/workspace/yyj/develop_linux/git-repository/Talos_repository/upstream_linux-next/linux-sheepdog/linux-next/arch/arm64/boot/dts/qcom/talos-evk-lvds-auo,g133han01.dtb: panel-lvds: 'power-supply' is a required property
>         from schema $id: http://devicetree.org/schemas/display/panel/panel-simple-lvds-dual-ports.yaml#
> /local/mnt/workspace/yyj/develop_linux/git-repository/Talos_repository/upstream_linux-next/linux-sheepdog/linux-next/arch/arm64/boot/dts/qcom/talos-evk-lvds-auo,g133han01.dtb: clock-controller@100000: 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/qcom,qcs615-gcc.yaml#
> /local/mnt/workspace/yyj/develop_linux/git-repository/Talos_repository/upstream_linux-next/linux-sheepdog/linux-next/arch/arm64/boot/dts/qcom/talos-evk-lvds-auo,g133han01.dtb: bridge@2c: ports:port@0:endpoint:data-lanes:0: 1 was expected
>         from schema $id: http://devicetree.org/schemas/display/bridge/ti,sn65dsi83.yaml#
> /local/mnt/workspace/yyj/develop_linux/git-repository/Talos_repository/upstream_linux-next/linux-sheepdog/linux-next/arch/arm64/boot/dts/qcom/talos-evk-lvds-auo,g133han01.dtb: bridge@2c: ports:port@0:endpoint:data-lanes:1: 2 was expected
>         from schema $id: http://devicetree.org/schemas/display/bridge/ti,sn65dsi83.yaml#
> /local/mnt/workspace/yyj/develop_linux/git-repository/Talos_repository/upstream_linux-next/linux-sheepdog/linux-next/arch/arm64/boot/dts/qcom/talos-evk-lvds-auo,g133han01.dtb: bridge@2c: ports:port@0:endpoint:data-lanes:2: 3 was expected
>         from schema $id: http://devicetree.org/schemas/display/bridge/ti,sn65dsi83.yaml#
> /local/mnt/workspace/yyj/develop_linux/git-repository/Talos_repository/upstream_linux-next/linux-sheepdog/linux-next/arch/arm64/boot/dts/qcom/talos-evk-lvds-auo,g133han01.dtb: bridge@2c: ports:port@0:endpoint:data-lanes:3: 4 was expected
>         from schema $id: http://devicetree.org/schemas/display/bridge/ti,sn65dsi83.yaml#
> /local/mnt/workspace/yyj/develop_linux/git-repository/Talos_repository/upstream_linux-next/linux-sheepdog/linux-next/arch/arm64/boot/dts/qcom/talos-evk-lvds-auo,g133han01.dtb: bridge@2c: 'ti,dsi-lanes', 'ti,lvds-bpp', 'ti,lvds-format' do not match any of the regexes: 'pinctrl-[0-9]+'
>         from schema $id: http://devicetree.org/schemas/display/bridge/ti,sn65dsi83.yaml#
> 

With regard to the power-supply property for the LVDS panel: the 
panel does not incorporate a dedicated power regulator, and therefore
this property cannot be defined.
Concerning the data-lanes configuration, the LVDS display operates
correctly only with <0,1,2,3> in my environment. Modifying this
to <1,2,3,4> as proposed, prevents the display from initializing.
> Thanks,
> Yuanjie
> 
>> +		ports {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +
>> +			port@0 {
>> +				reg = <0>;
>> +
>> +				sn65dsi84_in: endpoint {
>> +					data-lanes = <0 1 2 3>;
>> +					remote-endpoint = <&mdss_dsi0_out>;
>> +				};
>> +			};
>> +
>> +			port@2 {
>> +				reg = <2>;
>> +
>> +				sn65dsi84_out_a: endpoint {
>> +					data-lanes = <0 1 2 3>;
>> +					remote-endpoint = <&lvds_panel_out_a>;
>> +				};
>> +			};
>> +
>> +			port@3 {
>> +				reg = <3>;
>> +
>> +				sn65dsi84_out_b: endpoint {
>> +					data-lanes = <0 1 2 3>;
>> +					remote-endpoint = <&lvds_panel_out_b>;
>> +				};
>> +			};
>> +		};
>> +	};
>> +};
>> +
>> +&mdss_dsi0 {
>> +	vdda-supply = <&vreg_l11a>;
>> +
>> +	status = "okay";
>> +};
>> +
>> +&mdss_dsi0_out {
>> +	remote-endpoint = <&sn65dsi84_in>;
>> +	data-lanes = <0 1 2 3>;
>> +};
>> +
>> +&tlmm {
>> +	lcd_bklt_en: lcd-bklt-en-state {
>> +		pins = "gpio115";
>> +		function = "gpio";
>> +		bias-disable;
>> +	};
>> +
>> +	lcd_bklt_pwm: lcd-bklt-pwm-state {
>> +		pins = "gpio59";
>> +		function = "gpio";
>> +		bias-disable;
>> +	};
>> +};
>> diff --git a/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi b/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
>> new file mode 100644
>> index 000000000000..23142ae8f776
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
>> @@ -0,0 +1,598 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +/dts-v1/;
>> +
>> +#include <dt-bindings/gpio/gpio.h>
>> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>> +#include "talos.dtsi"
>> +#include "pm8150.dtsi"
>> +/ {
>> +	aliases {
>> +		mmc0 = &sdhc_1;
>> +		serial0 = &uart0;
>> +		serial1 = &uart7;
>> +	};
>> +
>> +	chosen {
>> +		stdout-path = "serial0:115200n8";
>> +	};
>> +
>> +	clocks {
>> +		can_osc: can-oscillator {
>> +			compatible = "fixed-clock";
>> +			clock-frequency = <20000000>;
>> +			#clock-cells = <0>;
>> +		};
>> +
>> +		sleep_clk: sleep-clk {
>> +			compatible = "fixed-clock";
>> +			clock-frequency = <32764>;
>> +			#clock-cells = <0>;
>> +		};
>> +
>> +		xo_board_clk: xo-board-clk {
>> +			compatible = "fixed-clock";
>> +			clock-frequency = <38400000>;
>> +			#clock-cells = <0>;
>> +		};
>> +	};
>> +
>> +	regulator-usb2-vbus {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "USB2_VBUS";
>> +		gpio = <&pm8150_gpios 10 GPIO_ACTIVE_HIGH>;
>> +		pinctrl-0 = <&usb2_en>;
>> +		pinctrl-names = "default";
>> +		enable-active-high;
>> +		regulator-always-on;
>> +	};
>> +
>> +	vreg_conn_1p8: regulator-conn-1p8 {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "vreg_conn_1p8";
>> +		startup-delay-us = <4000>;
>> +		enable-active-high;
>> +		gpio = <&pm8150_gpios 1 GPIO_ACTIVE_HIGH>;
>> +	};
>> +
>> +	vreg_conn_pa: regulator-conn-pa {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "vreg_conn_pa";
>> +		startup-delay-us = <4000>;
>> +		enable-active-high;
>> +		gpio = <&pm8150_gpios 6 GPIO_ACTIVE_HIGH>;
>> +	};
>> +
>> +	vreg_v3p3_can: regulator-v3p3-can {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "vreg-v3p3-can";
>> +		regulator-min-microvolt = <3300000>;
>> +		regulator-max-microvolt = <3300000>;
>> +		regulator-boot-on;
>> +		regulator-always-on;
>> +	};
>> +
>> +	vreg_v5p0_can: regulator-v5p0-can {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "vreg-v5p0-can";
>> +		regulator-min-microvolt = <5000000>;
>> +		regulator-max-microvolt = <5000000>;
>> +		regulator-boot-on;
>> +		regulator-always-on;
>> +	};
>> +
>> +	wcn6855-pmu {
>> +		compatible = "qcom,wcn6855-pmu";
>> +
>> +		pinctrl-0 = <&bt_en_state>, <&wlan_en_state>;
>> +		pinctrl-names = "default";
>> +
>> +		bt-enable-gpios = <&tlmm 85 GPIO_ACTIVE_HIGH>;
>> +		wlan-enable-gpios = <&tlmm 84 GPIO_ACTIVE_HIGH>;
>> +
>> +		vddio-supply = <&vreg_conn_pa>;
>> +		vddaon-supply = <&vreg_s5a>;
>> +		vddpmu-supply = <&vreg_conn_1p8>;
>> +		vddpmumx-supply = <&vreg_conn_1p8>;
>> +		vddpmucx-supply = <&vreg_conn_pa>;
>> +		vddrfa0p95-supply = <&vreg_s5a>;
>> +		vddrfa1p3-supply = <&vreg_s6a>;
>> +		vddrfa1p9-supply = <&vreg_l15a>;
>> +		vddpcie1p3-supply = <&vreg_s6a>;
>> +		vddpcie1p9-supply = <&vreg_l15a>;
>> +
>> +		regulators {
>> +			vreg_pmu_rfa_cmn: ldo0 {
>> +				regulator-name = "vreg_pmu_rfa_cmn";
>> +			};
>> +
>> +			vreg_pmu_aon_0p59: ldo1 {
>> +				regulator-name = "vreg_pmu_aon_0p59";
>> +			};
>> +
>> +			vreg_pmu_wlcx_0p8: ldo2 {
>> +				regulator-name = "vreg_pmu_wlcx_0p8";
>> +			};
>> +
>> +			vreg_pmu_wlmx_0p85: ldo3 {
>> +				regulator-name = "vreg_pmu_wlmx_0p85";
>> +			};
>> +
>> +			vreg_pmu_btcmx_0p85: ldo4 {
>> +				regulator-name = "vreg_pmu_btcmx_0p85";
>> +			};
>> +
>> +			vreg_pmu_rfa_0p8: ldo5 {
>> +				regulator-name = "vreg_pmu_rfa_0p8";
>> +			};
>> +
>> +			vreg_pmu_rfa_1p2: ldo6 {
>> +				regulator-name = "vreg_pmu_rfa_1p2";
>> +			};
>> +
>> +			vreg_pmu_rfa_1p7: ldo7 {
>> +				regulator-name = "vreg_pmu_rfa_1p7";
>> +			};
>> +
>> +			vreg_pmu_pcie_0p9: ldo8 {
>> +				regulator-name = "vreg_pmu_pcie_0p9";
>> +			};
>> +
>> +			vreg_pmu_pcie_1p8: ldo9 {
>> +				regulator-name = "vreg_pmu_pcie_1p8";
>> +			};
>> +		};
>> +	};
>> +
>> +	wifi_1p8v: regulator-wifi-1p8v {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "wifi_1p8v";
>> +		regulator-min-microvolt = <1800000>;
>> +		regulator-max-microvolt = <1800000>;
>> +		gpio = <&tlmm 91 GPIO_ACTIVE_HIGH>;
>> +		enable-active-high;
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&wifi_reg_en_pins_state>;
>> +		regulator-boot-on;
>> +		regulator-always-on;
>> +	};
>> +
>> +	wifi_3p85v: regulator-wifi-3p85v {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "wifi_3p85v";
>> +		regulator-min-microvolt = <3850000>;
>> +		regulator-max-microvolt = <3850000>;
>> +		gpio = <&tlmm 91 GPIO_ACTIVE_HIGH>;
>> +		enable-active-high;
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&wifi_reg_en_pins_state>;
>> +		regulator-boot-on;
>> +		regulator-always-on;
>> +	};
>> +};
>> +
>> +&apps_rsc {
>> +	regulators-0 {
>> +		compatible = "qcom,pm8150-rpmh-regulators";
>> +		qcom,pmic-id = "a";
>> +
>> +		vreg_s3a: smps3 {
>> +			regulator-name = "vreg_s3a";
>> +			regulator-min-microvolt = <600000>;
>> +			regulator-max-microvolt = <650000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_s4a: smps4 {
>> +			regulator-name = "vreg_s4a";
>> +			regulator-min-microvolt = <1800000>;
>> +			regulator-max-microvolt = <1829000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_s5a: smps5 {
>> +			regulator-name = "vreg_s5a";
>> +			regulator-min-microvolt = <1896000>;
>> +			regulator-max-microvolt = <2040000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_s6a: smps6 {
>> +			regulator-name = "vreg_s6a";
>> +			regulator-min-microvolt = <1304000>;
>> +			regulator-max-microvolt = <1404000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l1a: ldo1 {
>> +			regulator-name = "vreg_l1a";
>> +			regulator-min-microvolt = <488000>;
>> +			regulator-max-microvolt = <852000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
>> +			regulator-allow-set-load;
>> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
>> +						   RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l2a: ldo2 {
>> +			regulator-name = "vreg_l2a";
>> +			regulator-min-microvolt = <1650000>;
>> +			regulator-max-microvolt = <3100000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
>> +			regulator-allow-set-load;
>> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
>> +						   RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l3a: ldo3 {
>> +			regulator-name = "vreg_l3a";
>> +			regulator-min-microvolt = <1000000>;
>> +			regulator-max-microvolt = <1248000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
>> +			regulator-allow-set-load;
>> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
>> +						   RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l5a: ldo5 {
>> +			regulator-name = "vreg_l5a";
>> +			regulator-min-microvolt = <875000>;
>> +			regulator-max-microvolt = <975000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +			regulator-allow-set-load;
>> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
>> +						   RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l7a: ldo7 {
>> +			regulator-name = "vreg_l7a";
>> +			regulator-min-microvolt = <1800000>;
>> +			regulator-max-microvolt = <1900000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +			regulator-allow-set-load;
>> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
>> +						   RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l8a: ldo8 {
>> +			regulator-name = "vreg_l8a";
>> +			regulator-min-microvolt = <1150000>;
>> +			regulator-max-microvolt = <1350000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +			regulator-allow-set-load;
>> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
>> +						   RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l10a: ldo10 {
>> +			regulator-name = "vreg_l10a";
>> +			regulator-min-microvolt = <2950000>;
>> +			regulator-max-microvolt = <3312000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +			regulator-allow-set-load;
>> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
>> +						   RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l11a: ldo11 {
>> +			regulator-name = "vreg_l11a";
>> +			regulator-min-microvolt = <1232000>;
>> +			regulator-max-microvolt = <1260000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
>> +			regulator-allow-set-load;
>> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
>> +						   RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l12a: ldo12 {
>> +			regulator-name = "vreg_l12a";
>> +			regulator-min-microvolt = <1800000>;
>> +			regulator-max-microvolt = <1890000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l13a: ldo13 {
>> +			regulator-name = "vreg_l13a";
>> +			regulator-min-microvolt = <3000000>;
>> +			regulator-max-microvolt = <3230000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
>> +			regulator-allow-set-load;
>> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
>> +						   RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l15a: ldo15 {
>> +			regulator-name = "vreg_l15a";
>> +			regulator-min-microvolt = <1800000>;
>> +			regulator-max-microvolt = <1904000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
>> +			regulator-allow-set-load;
>> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
>> +						   RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l16a: ldo16 {
>> +			regulator-name = "vreg_l16a";
>> +			regulator-min-microvolt = <3000000>;
>> +			regulator-max-microvolt = <3312000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
>> +			regulator-allow-set-load;
>> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
>> +						   RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l17a: ldo17 {
>> +			regulator-name = "vreg_l17a";
>> +			regulator-min-microvolt = <2950000>;
>> +			regulator-max-microvolt = <3312000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +	};
>> +};
>> +
>> +&gpi_dma0 {
>> +	status = "okay";
>> +};
>> +
>> +&gpi_dma1 {
>> +	status = "okay";
>> +};
>> +
>> +&i2c5 {
>> +	clock-frequency = <400000>;
>> +	status = "okay";
>> +
>> +	eeprom@57 {
>> +		compatible = "atmel,24c02";
>> +		reg = <0x57>;
>> +		pagesize = <16>;
>> +	};
>> +
>> +	eeprom@5f {
>> +		compatible = "atmel,24mac602";
>> +		reg = <0x5f>;
>> +		pagesize = <16>;
>> +	};
>> +};
>> +
>> +&mdss {
>> +	status = "okay";
>> +};
>> +
>> +&mdss_dp0 {
>> +	status = "okay";
>> +};
>> +
>> +&mdss_dp0_out {
>> +	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000>;
>> +	remote-endpoint = <&dp0_connector_in>;
>> +};
>> +
>> +&mdss_dsi0 {
>> +	vdda-supply = <&vreg_l11a>;
>> +	status = "okay";
>> +};
>> +
>> +&mdss_dsi0_phy {
>> +	vcca-supply = <&vreg_l5a>;
>> +	status = "okay";
>> +};
>> +
>> +&pcie {
>> +	perst-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
>> +	wake-gpios = <&tlmm 100 GPIO_ACTIVE_HIGH>;
>> +
>> +	pinctrl-0 = <&pcie_default_state>;
>> +	pinctrl-names = "default";
>> +
>> +	status = "okay";
>> +};
>> +
>> +&pcie_phy {
>> +	vdda-phy-supply = <&vreg_l5a>;
>> +	vdda-pll-supply = <&vreg_l12a>;
>> +
>> +	status = "okay";
>> +};
>> +
>> +&pm8150_gpios {
>> +	usb2_en: usb2-en-state {
>> +		pins = "gpio10";
>> +		function = "normal";
>> +		output-enable;
>> +		power-source = <0>;
>> +	};
>> +};
>> +
>> +&qupv3_id_0 {
>> +	status = "okay";
>> +};
>> +
>> +&qupv3_id_1 {
>> +	status = "okay";
>> +};
>> +
>> +&remoteproc_adsp {
>> +	firmware-name = "qcom/qcs615/adsp.mbn";
>> +
>> +	status = "okay";
>> +};
>> +
>> +&remoteproc_cdsp {
>> +	firmware-name = "qcom/qcs615/cdsp.mbn";
>> +
>> +	status = "okay";
>> +};
>> +
>> +&sdhc_1 {
>> +	pinctrl-0 = <&sdc1_state_on>;
>> +	pinctrl-1 = <&sdc1_state_off>;
>> +	pinctrl-names = "default", "sleep";
>> +
>> +	bus-width = <8>;
>> +	mmc-ddr-1_8v;
>> +	mmc-hs200-1_8v;
>> +	mmc-hs400-1_8v;
>> +	mmc-hs400-enhanced-strobe;
>> +	vmmc-supply = <&vreg_l17a>;
>> +	vqmmc-supply = <&vreg_s4a>;
>> +
>> +	non-removable;
>> +	no-sd;
>> +	no-sdio;
>> +
>> +	status = "okay";
>> +};
>> +
>> +&spi6 {
>> +	status = "okay";
>> +
>> +	can@0 {
>> +		compatible = "microchip,mcp2515";
>> +		reg = <0>;
>> +		clocks = <&can_osc>;
>> +		interrupts-extended = <&tlmm 87 IRQ_TYPE_LEVEL_LOW>;
>> +		spi-max-frequency = <10000000>;
>> +		vdd-supply = <&vreg_v3p3_can>;
>> +		xceiver-supply = <&vreg_v5p0_can>;
>> +	};
>> +};
>> +
>> +&tlmm {
>> +	bt_en_state: bt-en-state {
>> +		pins = "gpio85";
>> +		function = "gpio";
>> +		bias-pull-down;
>> +		output-low;
>> +	};
>> +
>> +	pcie_default_state: pcie-default-state {
>> +		clkreq-pins {
>> +			pins = "gpio90";
>> +			function = "pcie_clk_req";
>> +			drive-strength = <2>;
>> +			bias-pull-up;
>> +		};
>> +
>> +		perst-pins {
>> +			pins = "gpio89";
>> +			function = "gpio";
>> +			drive-strength = <2>;
>> +			bias-disable;
>> +		};
>> +
>> +		wake-pins {
>> +			pins = "gpio100";
>> +			function = "gpio";
>> +			drive-strength = <2>;
>> +			bias-pull-up;
>> +		};
>> +	};
>> +
>> +	wifi_reg_en_pins_state: wifi-reg-en-pins-state {
>> +		pins = "gpio91";
>> +		function = "gpio";
>> +		drive-strength = <8>;
>> +		output-high;
>> +		bias-pull-up;
>> +	};
>> +
>> +	wlan_en_state: wlan-en-state {
>> +		pins = "gpio84";
>> +		function = "gpio";
>> +		drive-strength = <16>;
>> +		bias-pull-down;
>> +		output-low;
>> +	};
>> +};
>> +
>> +&uart0 {
>> +	status = "okay";
>> +};
>> +
>> +&uart7 {
>> +	status = "okay";
>> +
>> +	bluetooth {
>> +		compatible = "qcom,wcn6855-bt";
>> +		firmware-name = "QCA6698/hpnv21", "QCA6698/hpbtfw21.tlv";
>> +
>> +		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
>> +		vddaon-supply = <&vreg_pmu_aon_0p59>;
>> +		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
>> +		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
>> +		vddbtcmx-supply = <&vreg_pmu_btcmx_0p85>;
>> +		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
>> +		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
>> +		vddrfa1p8-supply = <&vreg_pmu_rfa_1p7>;
>> +	};
>> +};
>> +
>> +&usb_1 {
>> +	status = "okay";
>> +};
>> +
>> +&usb_1_dwc3 {
>> +	dr_mode = "host";
>> +};
>> +
>> +&usb_hsphy_1 {
>> +	vdd-supply = <&vreg_l5a>;
>> +	vdda-pll-supply = <&vreg_l12a>;
>> +	vdda-phy-dpdm-supply = <&vreg_l13a>;
>> +
>> +	status = "okay";
>> +};
>> +
>> +&usb_2 {
>> +	status = "okay";
>> +};
>> +
>> +&usb_2_dwc3 {
>> +	dr_mode = "host";
>> +};
>> +
>> +&usb_hsphy_2 {
>> +	vdd-supply = <&vreg_l5a>;
>> +	vdda-pll-supply = <&vreg_l12a>;
>> +	vdda-phy-dpdm-supply = <&vreg_l13a>;
>> +
>> +	status = "okay";
>> +};
>> +
>> +&usb_qmpphy {
>> +	vdda-phy-supply = <&vreg_l5a>;
>> +	vdda-pll-supply = <&vreg_l12a>;
>> +
>> +	status = "okay";
>> +};
>> +
>> +&usb_qmpphy_2 {
>> +	vdda-phy-supply = <&vreg_l11a>;
>> +	vdda-pll-supply = <&vreg_l5a>;
>> +
>> +	status = "okay";
>> +};
>> +
>> +&ufs_mem_hc {
>> +	reset-gpios = <&tlmm 123 GPIO_ACTIVE_LOW>;
>> +	vcc-supply = <&vreg_l17a>;
>> +	vcc-max-microamp = <600000>;
>> +	vccq2-supply = <&vreg_s4a>;
>> +	vccq2-max-microamp = <600000>;
>> +
>> +	status = "okay";
>> +};
>> +
>> +&ufs_mem_phy {
>> +	vdda-phy-supply = <&vreg_l5a>;
>> +	vdda-pll-supply = <&vreg_l12a>;
>> +
>> +	status = "okay";
>> +};
>> +
>> +&venus {
>> +	status = "okay";
>> +};
>> diff --git a/arch/arm64/boot/dts/qcom/talos-evk.dts b/arch/arm64/boot/dts/qcom/talos-evk.dts
>> new file mode 100644
>> index 000000000000..af100e22beee
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/talos-evk.dts
>> @@ -0,0 +1,139 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +/dts-v1/;
>> +
>> +#include "talos-evk-som.dtsi"
>> +
>> +/ {
>> +	model = "Qualcomm QCS615 IQ 615 EVK";
>> +	compatible = "qcom,talos-evk", "qcom,qcs615", "qcom,sm6150";
>> +	chassis-type = "embedded";
>> +
>> +	aliases {
>> +		mmc1 = &sdhc_2;
>> +	};
>> +
>> +	dp0-connector {
>> +		compatible = "dp-connector";
>> +		label = "DP0";
>> +		type = "full-size";
>> +
>> +		hpd-gpios = <&tlmm 104 GPIO_ACTIVE_HIGH>;
>> +
>> +		port {
>> +			dp0_connector_in: endpoint {
>> +				remote-endpoint = <&mdss_dp0_out>;
>> +			};
>> +		};
>> +	};
>> +
>> +	hdmi_connector: hdmi-out {
>> +		compatible = "hdmi-connector";
>> +		type = "d";
>> +
>> +		port {
>> +			hdmi_con_out: endpoint {
>> +			remote-endpoint = <&adv7535_out>;
>> +			};
>> +		};
>> +	};
>> +
>> +	vreg_v1p8_out: regulator-v1p8-out {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "vreg-v1p8-out";
>> +		regulator-min-microvolt = <1800000>;
>> +		regulator-max-microvolt = <1800000>;
>> +		vin-supply = <&vreg_v5p0_out>;
>> +		regulator-boot-on;
>> +		regulator-always-on;
>> +	};
>> +
>> +	vreg_v3p3_out: regulator-v3p3-out {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "vreg-v3p3-out";
>> +		regulator-min-microvolt = <3300000>;
>> +		regulator-max-microvolt = <3300000>;
>> +		vin-supply = <&vreg_v5p0_out>;
>> +		regulator-boot-on;
>> +		regulator-always-on;
>> +	};
>> +
>> +	vreg_v5p0_out: regulator-v5p0-out {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "vreg-v5p0-out";
>> +		regulator-min-microvolt = <5000000>;
>> +		regulator-max-microvolt = <5000000>;
>> +		regulator-boot-on;
>> +		regulator-always-on;
>> +		/* Powered by system 20V rail (USBC_VBUS_IN) */
>> +	};
>> +};
>> +
>> +&i2c1 {
>> +	clock-frequency = <400000>;
>> +	status = "okay";
>> +
>> +	hdmi_bridge: bridge@3d {
>> +		compatible = "adi,adv7535";
>> +		reg = <0x3d>;
>> +		avdd-supply = <&vreg_v1p8_out>;
>> +		dvdd-supply = <&vreg_v1p8_out>;
>> +		pvdd-supply = <&vreg_v1p8_out>;
>> +		a2vdd-supply = <&vreg_v1p8_out>;
>> +		v3p3-supply = <&vreg_v3p3_out>;
>> +		interrupts-extended = <&tlmm 26 IRQ_TYPE_LEVEL_LOW>;
>> +		adi,dsi-lanes = <4>;
>> +
>> +		ports {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +
>> +			port@0 {
>> +				reg = <0>;
>> +
>> +				adv7535_in: endpoint {
>> +					remote-endpoint = <&mdss_dsi0_out>;
>> +				};
>> +			};
>> +
>> +			port@1 {
>> +				reg = <1>;
>> +
>> +				adv7535_out: endpoint {
>> +					remote-endpoint = <&hdmi_con_out>;
>> +				};
>> +			};
>> +		};
>> +	};
>> +};
>> +
>> +&mdss_dsi0_out {
>> +	remote-endpoint = <&adv7535_in>;
>> +	data-lanes = <0 1 2 3>;
>> +};
>> +
>> +&pon_pwrkey {
>> +	status = "okay";
>> +};
>> +
>> +&pon_resin {
>> +	linux,code = <KEY_VOLUMEDOWN>;
>> +
>> +	status = "okay";
>> +};
>> +
>> +&sdhc_2 {
>> +	pinctrl-0 = <&sdc2_state_on>;
>> +	pinctrl-1 = <&sdc2_state_off>;
>> +	pinctrl-names = "default", "sleep";
>> +
>> +	bus-width = <4>;
>> +	cd-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
>> +
>> +	vmmc-supply = <&vreg_l10a>;
>> +	vqmmc-supply = <&vreg_s4a>;
>> +
>> +	status = "okay";
>> +};
>> -- 
>> 2.34.1


