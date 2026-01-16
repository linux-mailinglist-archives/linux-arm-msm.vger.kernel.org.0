Return-Path: <linux-arm-msm+bounces-89382-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C717D305F9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 12:28:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D94B9304010F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 11:27:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7747E376BC1;
	Fri, 16 Jan 2026 11:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NZaRYIbF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6EA126A0D5
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 11:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768562847; cv=none; b=nGeXf7k8V/nfUcUqOWSS6NZOmoIBWPlY3cgRCN4oYG6WqqaWRDo9FeLcUfyB4oUs/R22AIUMCDYTvW/+lp2B1rtRcLcCyxbjaNlEVDjQIiso369gatK3Bq8JWMh2xGxzIKutPRD+y1zEp2gsl69cpRCrTSsOsO+9K3oY0fvFyz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768562847; c=relaxed/simple;
	bh=CbVPsVNf2q1H45vV3dHMREJWHw3M6ijzJmCXsc6k7d8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hLHywgae+rNpcSI5FRTryfFn2tcYrlRo5WbIeQU2caHgDSmUsS8NdQ+duoYiNjghS1wrarvjWBT4XofYirxy2d6i/entDBqG8vZ8h56eehW/Qf2xqDTMIsmjOBRPC3+Bk70gpxA+8+KnIstjJ84AxxeGu9OpMq0A5ZcNoC2Xj/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NZaRYIbF; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-81f4e136481so923828b3a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 03:27:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768562840; x=1769167640; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BZGfsfipZ9p+7mXmx/sNmNBBg224KcQKOBa655l0HJc=;
        b=NZaRYIbFKYGFOL/4dnThE5w4eFEmET+SuHxtQkrIZFJ+4fFdEHVEsSLJqQURDcyxHk
         BcnJOCgLrAyKad7wZGH+3MMO/tRTkvmkE+gF0BSJnLOfwpHVZCp2hqFEqTw+lAJdTEC3
         DBMneG69lDBUAdpVSRIRIJw0osQlbD6x04T+XLZxDfJkirmztUFoqs7hWzP3VuZBjjnG
         /z1Y4vs0fB3ezu9l9EkzbxbixFjprPB6wMCSejPrke8daTqfoGzu2qrputkG7FKe1WqW
         iQmXsUP6AT480V9pGytYwDexrSdOHShBNWw52KotGbSHYGjkofYeG9fHSo16iygO4pDT
         qdIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768562840; x=1769167640;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BZGfsfipZ9p+7mXmx/sNmNBBg224KcQKOBa655l0HJc=;
        b=ljUCEuMcU3OWRJHmjEqsqnyUCTcg4RMazNVuPvaTH0VkGttmmjYMc7tMjJUh+Wh1+Q
         wEQvad12RRmhd0WZbIWj3qikYL2zuGo+6uJRpJ9U2tcA2tI8PjQtPKevO77qljHvYkIm
         XzaB4d0be9zdj4dvGSYybWWjSXOHxeJLnknojN0jldnOngv/yODxp+ZFpx6u3cz8t/is
         EN8ugh8fg56ZX1n+UXgPT1m5tCCpkaQPC7UaZV5Kpm/LbPXJuQsWCe6pWS25yAbl0Fgo
         jAVEVEspz/Qf6l06Ic/pzlb1wCwa0njD1SvBIF+pa7/PzZt28yyjq6yy+Nv4hX7PTBN0
         FunA==
X-Forwarded-Encrypted: i=1; AJvYcCWFKD6kKy+lw7NyLBTMaalxPg1HZiUExBGVmn8JqBxksAXRDem9uo/wiHvlhEkK1hwylRK9jnUSi30Bag2E@vger.kernel.org
X-Gm-Message-State: AOJu0YzknEt/4YvhLpQAncH7t4CgH6zZmv6AAGGzAfMQUZv54g/bFlTb
	RhVf1WkKJy2vbyKvUakrwq6x2ZZFNY53noUbNulzZXfnMe6HTiYIgLPD
X-Gm-Gg: AY/fxX7zE6P4QCUCpIYpMWwtMQTurTpZTjQPg9Wo0IW+4hZh5jL5+X1zW4cdRnb78FA
	2EEkd8KCP+z6Nts1c3wvlgv5ONu7XQVSawcozFPJ6BY7vKo8c7dVYKqIj8loccwgf1qtRGR0Z9c
	qiuYhX5ablI+/AcEhfyc6YPvZrGH2TwhP3bsbAMtOggUOf2pMSWzJx113mQ+g9uXTVf/0Hta91w
	6FUCYviyAn7LJxroewxkkGypnC8HiaQGRLlW54EBLXmn/OGdkoD2ryKkB6iW3K1Y5TNguPVPG4w
	lWdgJyV9HWivFaL03v/Xxyr7H8GUj14cl9/4jRk94PBnkScLA02m8DB5evpF8yCeZBUpKzzzk1L
	AxHC0ta+CucMyl6+YpRh03+ZTpL6JSPviyHzIMJTrXgEV4BD4WQUTLvbaGUmiHZ8M0vcR8Y9WXt
	X24FISnZJiRxn2NCgHjoArz/iSZvLtToaQIQ==
X-Received: by 2002:a05:6a00:2e1e:b0:81f:5238:5560 with SMTP id d2e1a72fcca58-81fa1780c03mr2236351b3a.13.1768562839554;
        Fri, 16 Jan 2026 03:27:19 -0800 (PST)
Received: from [172.16.20.12] ([136.226.253.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81fa129199dsm1861074b3a.51.2026.01.16.03.27.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jan 2026 03:27:19 -0800 (PST)
Message-ID: <3eba04f8-fd1e-46f7-a674-510ed6f48ed2@gmail.com>
Date: Fri, 16 Jan 2026 16:57:42 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 4/4] arm64: dts: qcom: talos-evk: Add support for
 QCS615 talos evk board
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Qian Zhang <qian.zhang@oss.qualcomm.com>, andersson@kernel.org,
 konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260109095221.2847067-1-tessolveupstream@gmail.com>
 <20260109095221.2847067-5-tessolveupstream@gmail.com>
 <3a4e0513-5b2d-4890-a4df-5306a694cf50@oss.qualcomm.com>
 <530e2a7b-52e4-4119-ad54-8ff9e1d4fec0@gmail.com>
 <ei3zvx47jubvgrz25pemfeu6zt5be6dduqpllp5qyhbhqblvnp@c2tqv7hyicii>
Content-Language: en-US
From: tessolveupstream@gmail.com
In-Reply-To: <ei3zvx47jubvgrz25pemfeu6zt5be6dduqpllp5qyhbhqblvnp@c2tqv7hyicii>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 16-01-2026 13:26, Dmitry Baryshkov wrote:
> On Fri, Jan 16, 2026 at 12:28:22PM +0530, tessolveupstream@gmail.com wrote:
>>
>>
>> On 15-01-2026 18:47, Qian Zhang wrote:
>>>
>>>
>>> On 1/9/2026 5:52 PM, Sudarshan Shetty wrote:
>>>> Add the device tree for the QCS615-based Talos EVK platform. The
>>>> platform is composed of a System-on-Module following the SMARC
>>>> standard, and a Carrier Board.
>>>>
>>>> The Carrier Board supports several display configurations, HDMI and
>>>> LVDS. Both configurations use the same base hardware, with the display
>>>> selection controlled by a DIP switch.
>>>>
>>>> Use a DTBO file, talos-evk-lvds-auo,g133han01.dtso, which defines an
>>>> overlay that disables HDMI and adds LVDS. The DTs file talos-evk
>>>> can describe the HDMI display configurations.
>>>>
>>>> The initial device tree includes support for:
>>>> - CPU and memory
>>>> - UART
>>>> - GPIOs
>>>> - Regulators
>>>> - PMIC
>>>> - Early console
>>>> - AT24MAC602 EEPROM
>>>> - MCP2515 SPI to CAN
>>>> - ADV7535 DSI-to-HDMI bridge
>>>> - DisplayPort interface
>>>> - SN65DSI84ZXHR DSI-to-LVDS bridge
>>>> - Wi-Fi/BT
>>>>
>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>> Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
>>>> ---
>>>>   arch/arm64/boot/dts/qcom/Makefile             |   4 +
>>>>   .../qcom/talos-evk-lvds-auo,g133han01.dtso    | 126 ++++
>>>>   arch/arm64/boot/dts/qcom/talos-evk-som.dtsi   | 616 ++++++++++++++++++
>>>>   arch/arm64/boot/dts/qcom/talos-evk.dts        | 139 ++++
>>>>   4 files changed, 885 insertions(+)
>>>>   create mode 100644 arch/arm64/boot/dts/qcom/talos-evk-lvds-auo,g133han01.dtso
>>>>   create mode 100644 arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
>>>>   create mode 100644 arch/arm64/boot/dts/qcom/talos-evk.dts
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
>>>> index 76cf0115a00a..289b651ef0c5 100644
>>>> --- a/arch/arm64/boot/dts/qcom/Makefile
>>>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>>>> @@ -324,6 +324,10 @@ dtb-$(CONFIG_ARCH_QCOM)    += sm8650-mtp.dtb
>>>>   dtb-$(CONFIG_ARCH_QCOM)    += sm8650-qrd.dtb
>>>>   dtb-$(CONFIG_ARCH_QCOM)    += sm8750-mtp.dtb
>>>>   dtb-$(CONFIG_ARCH_QCOM)    += sm8750-qrd.dtb
>>>> +dtb-$(CONFIG_ARCH_QCOM)    += talos-evk.dtb
>>>> +talos-evk-lvds-auo,g133han01-dtbs    := \
>>>> +    talos-evk.dtb talos-evk-lvds-auo,g133han01.dtbo
>>>> +dtb-$(CONFIG_ARCH_QCOM)    += talos-evk-lvds-auo,g133han01.dtb
>>>>   x1e001de-devkit-el2-dtbs    := x1e001de-devkit.dtb x1-el2.dtbo
>>>>   dtb-$(CONFIG_ARCH_QCOM)    += x1e001de-devkit.dtb x1e001de-devkit-el2.dtb
>>>>   x1e78100-lenovo-thinkpad-t14s-el2-dtbs    := x1e78100-lenovo-thinkpad-t14s.dtb x1-el2.dtbo
>>>> diff --git a/arch/arm64/boot/dts/qcom/talos-evk-lvds-auo,g133han01.dtso b/arch/arm64/boot/dts/qcom/talos-evk-lvds-auo,g133han01.dtso
>>>> new file mode 100644
>>>> index 000000000000..ad058cf4cd93
>>>> --- /dev/null
>>>> +++ b/arch/arm64/boot/dts/qcom/talos-evk-lvds-auo,g133han01.dtso
>>>> @@ -0,0 +1,126 @@
>>>> +// SPDX-License-Identifier: BSD-3-Clause
>>>> +/*
>>>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>>>> + */
>>>> +/dts-v1/;
>>>> +/plugin/;
>>>> +
>>>> +#include <dt-bindings/gpio/gpio.h>
>>>> +
>>>> +&{/} {
>>>> +    backlight: backlight {
>>>> +        compatible = "gpio-backlight";
>>>> +        gpios = <&tlmm 59 GPIO_ACTIVE_HIGH>,
>>>> +            <&tlmm 115 GPIO_ACTIVE_HIGH>;
>>>> +        default-on;
>>>> +    };
>>>> +
>>>> +    panel-lvds {
>>>> +        compatible = "auo,g133han01";
>>>> +
>>>> +        ports {
>>>> +            #address-cells = <1>;
>>>> +            #size-cells = <0>;
>>>> +
>>>> +            /* LVDS A (Odd pixels) */
>>>> +            port@0 {
>>>> +                reg = <0>;
>>>> +                dual-lvds-odd-pixels;
>>>> +
>>>> +                lvds_panel_out_a: endpoint {
>>>> +                    remote-endpoint = <&sn65dsi84_out_a>;
>>>> +                };
>>>> +            };
>>>> +
>>>> +            /* LVDS B (Even pixels) */
>>>> +            port@1 {
>>>> +                reg = <1>;
>>>> +                dual-lvds-even-pixels;
>>>> +
>>>> +                lvds_panel_out_b: endpoint {
>>>> +                    remote-endpoint = <&sn65dsi84_out_b>;
>>>> +                };
>>>> +            };
>>>> +        };
>>>> +    };
>>>> +};
>>>> +
>>>> +&hdmi_connector {
>>>> +    status = "disabled";
>>>> +};
>>>> +
>>>> +&i2c1 {
>>>> +    clock-frequency = <400000>;
>>>> +
>>>> +    status = "okay";
>>>> +
>>>> +    hdmi_bridge: bridge@3d {
>>>> +        status = "disabled";
>>>> +    };
>>>> +
>>>> +    lvds_bridge: bridge@2c {
>>>> +        compatible = "ti,sn65dsi84";
>>>> +        reg = <0x2c>;
>>>> +        enable-gpios = <&tlmm 42 GPIO_ACTIVE_HIGH>;
>>>> +        ti,dsi-lanes = <4>;
>>>> +        ti,lvds-format = "jeida-24";
>>>> +        ti,lvds-bpp = <24>;
>>>> +
>>>> +        ports {
>>>> +            #address-cells = <1>;
>>>> +            #size-cells = <0>;
>>>> +
>>>> +            port@0 {
>>>> +                reg = <0>;
>>>> +
>>>> +                sn65dsi84_in: endpoint {
>>>> +                    data-lanes = <1 2 3 4>;
>>>> +                    remote-endpoint = <&mdss_dsi0_out>;
>>>> +                };
>>>> +            };
>>>> +
>>>> +            port@2 {
>>>> +                reg = <2>;
>>>> +
>>>> +                sn65dsi84_out_a: endpoint {
>>>> +                    data-lanes = <1 2 3 4>;
>>>> +                    remote-endpoint = <&lvds_panel_out_a>;
>>>> +                };
>>>> +            };
>>>> +
>>>> +            port@3 {
>>>> +                reg = <3>;
>>>> +
>>>> +                sn65dsi84_out_b: endpoint {
>>>> +                    data-lanes = <1 2 3 4>;
>>>> +                    remote-endpoint = <&lvds_panel_out_b>;
>>>> +                };
>>>> +            };
>>>> +        };
>>>> +    };
>>>> +};
>>>> +
>>>> +&mdss_dsi0 {
>>>> +    vdda-supply = <&vreg_l11a>;
>>>> +
>>>> +    status = "okay";
>>>> +};
>>>> +
>>>> +&mdss_dsi0_out {
>>>> +    remote-endpoint = <&sn65dsi84_in>;
>>>> +    data-lanes = <0 1 2 3>;
>>>> +};
>>>> +
>>>> +&tlmm {
>>>> +    lcd_bklt_en: lcd-bklt-en-state {
>>>> +        pins = "gpio115";
>>>> +        function = "gpio";
>>>> +        bias-disable;
>>>> +    };
>>>> +
>>>> +    lcd_bklt_pwm: lcd-bklt-pwm-state {
>>>> +        pins = "gpio59";
>>>> +        function = "gpio";
>>>> +        bias-disable;
>>>> +    };
>>>> +};
>>>> diff --git a/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi b/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
>>>> new file mode 100644
>>>> index 000000000000..95ed335bcb08
>>>> --- /dev/null
>>>> +++ b/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
>>>> @@ -0,0 +1,616 @@
>>>> +// SPDX-License-Identifier: BSD-3-Clause
>>>> +/*
>>>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>>>> + */
>>>> +/dts-v1/;
>>>> +
>>>> +#include <dt-bindings/gpio/gpio.h>
>>>> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>>>> +#include "talos.dtsi"
>>>> +#include "pm8150.dtsi"
>>>> +/ {
>>>> +    aliases {
>>>> +        mmc0 = &sdhc_1;
>>>> +        serial0 = &uart0;
>>>> +        serial1 = &uart7;
>>>> +    };
>>>> +
>>>> +    chosen {
>>>> +        stdout-path = "serial0:115200n8";
>>>> +    };
>>>> +
>>>> +    clocks {
>>>> +        can_osc: can-oscillator {
>>>> +            compatible = "fixed-clock";
>>>> +            clock-frequency = <20000000>;
>>>> +            #clock-cells = <0>;
>>>> +        };
>>>> +
>>>> +        sleep_clk: sleep-clk {
>>>> +            compatible = "fixed-clock";
>>>> +            clock-frequency = <32764>;
>>>> +            #clock-cells = <0>;
>>>> +        };
>>>> +
>>>> +        xo_board_clk: xo-board-clk {
>>>> +            compatible = "fixed-clock";
>>>> +            clock-frequency = <38400000>;
>>>> +            #clock-cells = <0>;
>>>> +        };
>>>> +    };
>>>> +
>>>> +    regulator-usb2-vbus {
>>>> +        compatible = "regulator-fixed";
>>>> +        regulator-name = "USB2_VBUS";
>>>> +        gpio = <&pm8150_gpios 10 GPIO_ACTIVE_HIGH>;
>>>> +        pinctrl-0 = <&usb2_en>;
>>>> +        pinctrl-names = "default";
>>>> +        enable-active-high;
>>>> +        regulator-always-on;
>>>> +    };
>>>> +
>>>> +    vreg_conn_1p8: regulator-conn-1p8 {
>>>> +        compatible = "regulator-fixed";
>>>> +        regulator-name = "vreg_conn_1p8";
>>>> +        startup-delay-us = <4000>;
>>>> +        enable-active-high;
>>>> +        gpio = <&pm8150_gpios 1 GPIO_ACTIVE_HIGH>;
>>>> +    };
>>>> +
>>>> +    vreg_conn_pa: regulator-conn-pa {
>>>> +        compatible = "regulator-fixed";
>>>> +        regulator-name = "vreg_conn_pa";
>>>> +        startup-delay-us = <4000>;
>>>> +        enable-active-high;
>>>> +        gpio = <&pm8150_gpios 6 GPIO_ACTIVE_HIGH>;
>>>> +    };
>>>> +
>>>> +    vreg_v3p3_can: regulator-v3p3-can {
>>>> +        compatible = "regulator-fixed";
>>>> +        regulator-name = "vreg-v3p3-can";
>>>> +        regulator-min-microvolt = <3300000>;
>>>> +        regulator-max-microvolt = <3300000>;
>>>> +        regulator-boot-on;
>>>> +        regulator-always-on;
>>>> +    };
>>>> +
>>>> +    vreg_v5p0_can: regulator-v5p0-can {
>>>> +        compatible = "regulator-fixed";
>>>> +        regulator-name = "vreg-v5p0-can";
>>>> +        regulator-min-microvolt = <5000000>;
>>>> +        regulator-max-microvolt = <5000000>;
>>>> +        regulator-boot-on;
>>>> +        regulator-always-on;
>>>> +    };
>>>> +
>>>> +    wcn6855-pmu {
>>>> +        compatible = "qcom,wcn6855-pmu";
>>>> +
>>>> +        pinctrl-0 = <&bt_en_state>, <&wlan_en_state>;
>>>> +        pinctrl-names = "default";
>>>> +
>>>> +        bt-enable-gpios = <&tlmm 85 GPIO_ACTIVE_HIGH>;
>>>> +        wlan-enable-gpios = <&tlmm 84 GPIO_ACTIVE_HIGH>;
>>>> +
>>>> +        vddio-supply = <&vreg_conn_pa>;
>>>> +        vddaon-supply = <&vreg_s5a>;
>>>> +        vddpmu-supply = <&vreg_conn_1p8>;
>>>> +        vddpmumx-supply = <&vreg_conn_1p8>;
>>>> +        vddpmucx-supply = <&vreg_conn_pa>;
>>>> +        vddrfa0p95-supply = <&vreg_s5a>;
>>>> +        vddrfa1p3-supply = <&vreg_s6a>;
>>>> +        vddrfa1p9-supply = <&vreg_l15a>;
>>>> +        vddpcie1p3-supply = <&vreg_s6a>;
>>>> +        vddpcie1p9-supply = <&vreg_l15a>;
>>>> +
>>>> +        regulators {
>>>> +            vreg_pmu_rfa_cmn: ldo0 {
>>>> +                regulator-name = "vreg_pmu_rfa_cmn";
>>>> +            };
>>>> +
>>>> +            vreg_pmu_aon_0p59: ldo1 {
>>>> +                regulator-name = "vreg_pmu_aon_0p59";
>>>> +            };
>>>> +
>>>> +            vreg_pmu_wlcx_0p8: ldo2 {
>>>> +                regulator-name = "vreg_pmu_wlcx_0p8";
>>>> +            };
>>>> +
>>>> +            vreg_pmu_wlmx_0p85: ldo3 {
>>>> +                regulator-name = "vreg_pmu_wlmx_0p85";
>>>> +            };
>>>> +
>>>> +            vreg_pmu_btcmx_0p85: ldo4 {
>>>> +                regulator-name = "vreg_pmu_btcmx_0p85";
>>>> +            };
>>>> +
>>>> +            vreg_pmu_rfa_0p8: ldo5 {
>>>> +                regulator-name = "vreg_pmu_rfa_0p8";
>>>> +            };
>>>> +
>>>> +            vreg_pmu_rfa_1p2: ldo6 {
>>>> +                regulator-name = "vreg_pmu_rfa_1p2";
>>>> +            };
>>>> +
>>>> +            vreg_pmu_rfa_1p7: ldo7 {
>>>> +                regulator-name = "vreg_pmu_rfa_1p7";
>>>> +            };
>>>> +
>>>> +            vreg_pmu_pcie_0p9: ldo8 {
>>>> +                regulator-name = "vreg_pmu_pcie_0p9";
>>>> +            };
>>>> +
>>>> +            vreg_pmu_pcie_1p8: ldo9 {
>>>> +                regulator-name = "vreg_pmu_pcie_1p8";
>>>> +            };
>>>> +        };
>>>> +    };
>>>> +
>>>> +    wifi_1p8v: regulator-wifi-1p8v {
>>>> +        compatible = "regulator-fixed";
>>>> +        regulator-name = "wifi_1p8v";
>>>> +        regulator-min-microvolt = <1800000>;
>>>> +        regulator-max-microvolt = <1800000>;
>>>> +        gpio = <&tlmm 91 GPIO_ACTIVE_HIGH>;
>>> Please check this pin number
>>>> +        enable-active-high;
>>>> +        pinctrl-0 = <&wifi_reg_en_pins_state>;
>>>> +        pinctrl-names = "default";
>>>> +        regulator-boot-on;
>>>> +        regulator-always-on;
>>>> +    };
>>>> +
>>>> +    wifi_3p85v: regulator-wifi-3p85v {
>>>> +        compatible = "regulator-fixed";
>>>> +        regulator-name = "wifi_3p85v";
>>>> +        regulator-min-microvolt = <3850000>;
>>>> +        regulator-max-microvolt = <3850000>;
>>>> +        gpio = <&tlmm 91 GPIO_ACTIVE_HIGH>;
>>> Please check this pin number
>>>> +        enable-active-high;
>>>> +        pinctrl-0 = <&wifi_reg_en_pins_state>;
>>>> +        pinctrl-names = "default";
>>>> +        regulator-boot-on;
>>>> +        regulator-always-on;
>>>> +    };
>>>> +};
>>>
>>> Are these two node necessary?
>>>
>>
>> On this board, GPIO91 is wired as a common enable for both WiFi 
>> power rails: WiFi 1.8V and WiFi 3.85V.
>> I currently modeled them as two regulator-fixed nodes because these 
>> are two distinct rails.
>> Would you prefer modelling a single regulator node that controls the 
>> shared GPIO as below:
>>
>> wifi_en: regulator-wifi-en {
>>     compatible = "regulator-fixed";
>>     regulator-name = "wifi_en";
>>     gpio = <&tlmm 91 GPIO_ACTIVE_HIGH>;
>>     enable-active-high;
>>     pinctrl-0 = <&wifi_reg_en_pins_state>;
>>     pinctrl-names = "default";
>>     regulator-boot-on;
>>     regulator-always-on;
>> };
> 
> What is the voltage of this regulator? What does it represent? What
> should be represented in the DT?
> 
> BTW: what is powered on by those regulators? I don't see them being
> wired to the PMU.
> 

There are two separate TPS62130RGTR regulator ICs on the board:
One provides 1.8V and Another provides 3.85V.

Both regulators use the same enable signal (SOC_GPIO_91_S4A_1P8 - 
GPIO91), which connects to their EN pins. 
When GPIO91 goes high, both regulators switch on at the same 
time.

I described them as two separate regulator-fixed nodes since they 
are different chips with different voltages.

As an alternative, I suggested representing them as a single node 
(based on the review comment from Qian Zhang) if you only want to 
show the shared GPIO enable control instead of the individual 
voltage rails.

In AF68E module, 3.85V regulator powers VDD_PA_5G and 1.8V regulator
powers VDD_PA_2G.


