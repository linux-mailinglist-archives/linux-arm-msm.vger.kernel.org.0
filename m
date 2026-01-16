Return-Path: <linux-arm-msm+bounces-89305-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C225D2C358
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 06:55:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 27E7C302DC9B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 05:55:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF9323446C7;
	Fri, 16 Jan 2026 05:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vfzck4nd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9CAA33A03A
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 05:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768542929; cv=none; b=HEUWUXZ/IWrAsXDyvy+eg5hrUCxfvXqIamljl+r6ns+R2wNwo6L5KTtwGPjhOR3plRa8yIF/aW9rLT50x/JrS8IDIYHDvpSZYr0EiRcqlDolzaQUKDPKW6WB0a9NZcoBPYfzYKqfsbKPUSrxLZEqfBTLgaMlZ89AkM/qFxeELIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768542929; c=relaxed/simple;
	bh=jHo02rn0rPiv+92FrPcW46TxeasL/oSbRgum0sOukSg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gXJuCdMYyeb0FD1hgPnRSwccD1OySqV1pGKEroffmkdmc3ky+5NDJV9O0rs9O/SwuJFBzf5CVUZIDIoNQgwHBP0YBSj6mrr+g0iGjKFVRXR0PrVyA9ZL1Ze/HmmM+Bpk3xWiAh+xaj4coMJywAGvmm0v2nyPOCBRV/Nex8PPtmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vfzck4nd; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2a0d6f647e2so17030035ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 21:55:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768542927; x=1769147727; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UwxbboL3a+6mLPyu4g4mGW9LBE4j/iCmSSiNFLy9KRs=;
        b=Vfzck4ndCade19KbllBb0J5zvfM2j4I+hc7GObhq3Oa52XyEs9EfUqdRDxS0Ll4pSy
         0dwQC/PL9vi3568cUTquTfwMGzzSxIdsfnUNDWbrtdC8Ny/Hpb6S7wEYVoO5c0+kEMFi
         wWRXGuSkaqvvglA6q8Vc6QZKmdOJfrEoQuIGWmchgURecC4ubptQhtJU7xznUrRLC8TM
         VqVtlLm/SJZJSMIFnKq6c8sOT6Xl1yvRCrpO1IqOtsn+sOpsbKb6OZvFZs0e2WbQYd7N
         Qr3qW7LsKHmNn9Ra8BQzsBiYBrjJLnDUK0o4dQM5HKNARklzOlrQr+h0EP624z+JKdvp
         DVhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768542927; x=1769147727;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UwxbboL3a+6mLPyu4g4mGW9LBE4j/iCmSSiNFLy9KRs=;
        b=ISLM92hEEb0iYuguXfI+Vj/ha2tCwwv6iqklpPg5Lb71ey7+L5W7OBU/2diz3xZHCn
         nO/obLBic+FPyFpL4Z0F6RhG0DF8YLJuNoveOa3+9BEMVy7azf0tNE3xopX/t8lA/h8s
         OlIdPGK4mDlqSfO84wg9EJlT2bNuZPaPJO1T9HLn2Azx+AvQu3nji6kp2JFPQUpwIOpr
         EuWo99gnDr7CVKEDjlnsuZA6tfGE6g8zejPJo64vVWUVqePuukoRjY5ItYaem4HWZyhY
         wnXHoM22MAVNipOIDqN4BwROJW3k2rnRoKVpiUdGkKsfQpjq/m0xZ/giIQQJTBgS0ofZ
         WIsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBdgJeEWzPz67TRynhBtm6bUPWHa8Lb7mPAdSq8hEosmVmAVWkeo+baQOilkipthsTT/omQL1XZZWZeUGX@vger.kernel.org
X-Gm-Message-State: AOJu0Yy11f+BFBdSfNhve3/Wo0XfXRK16XGLCZNzbnNiYmsT5+R8h7zY
	p7zwI/qn7VguVkSpnL3NsPWWtgfg3WmSxTeenAQH67jx58pPayG0TGnl
X-Gm-Gg: AY/fxX61hTS8gNwmySy7HDJg1+xHQfgRNWoknabOtIFExxt/cCgiJwSCw9TT1eVSIpL
	YpejhOSTCdaaOzofQ12PRyNkNKLm55sFvLW7PbpHGkIz0RQWHAgQ6BOjrl/NK86po0SUOatNv02
	ZRPHUcn1DicMU594iP3/Ds171fMqQlcpHjr9Tki7sgf/aMe/D+rnSkESznfzRwqNcC3eeryW7Bv
	iUfYb7qiXMTiE8LwdZVLqzt/q17eZGfSB1ZyGzU1DWlI5XDkslVFuvrW+JVoTbErcCD5YHC6DJ5
	uREV3Jgz6D5aYFfYMHolwsmeFiRtXNeoxJXgsIK1b4Q9cBnaZ8n9C3oi2OprEwO+SaY4aeze7SM
	ZTbUcCkVikTqVMEW6v3sYUUlOrnwS1oCBHlYKL7WqTJpC40fSM+Z9MJALULO2C+bc3ZTm/rQqcM
	G/SupTvtuvjFWGP99dk7kFxUSn29LEWE9GSQ==
X-Received: by 2002:a17:903:41c7:b0:295:9e4e:4092 with SMTP id d9443c01a7336-2a7177e69demr18871925ad.56.1768542927178;
        Thu, 15 Jan 2026 21:55:27 -0800 (PST)
Received: from [172.16.20.12] ([136.226.253.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190eeefasm9855255ad.43.2026.01.15.21.55.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 21:55:26 -0800 (PST)
Message-ID: <128a5f86-dd3f-4e5e-a55f-3c8b5993779b@gmail.com>
Date: Fri, 16 Jan 2026 11:25:50 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 3/3] arm64: dts: qcom: talos-evk: Add support for
 QCS615 talos evk board
To: Jie Gan <jie.gan@oss.qualcomm.com>, andersson@kernel.org,
 konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260114100043.1310164-1-tessolveupstream@gmail.com>
 <20260114100043.1310164-4-tessolveupstream@gmail.com>
 <5102252a-0f50-4ee9-97b4-a90859a33b2b@oss.qualcomm.com>
Content-Language: en-US
From: tessolveupstream@gmail.com
In-Reply-To: <5102252a-0f50-4ee9-97b4-a90859a33b2b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 15-01-2026 07:54, Jie Gan wrote:
> 
> 
> On 1/14/2026 6:00 PM, Sudarshan Shetty wrote:
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
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
>> ---
>>   arch/arm64/boot/dts/qcom/Makefile             |   4 +
>>   .../qcom/talos-evk-lvds-auo,g133han01.dtso    | 131 ++++
>>   arch/arm64/boot/dts/qcom/talos-evk-som.dtsi   | 616 ++++++++++++++++++
>>   arch/arm64/boot/dts/qcom/talos-evk.dts        | 139 ++++
>>   4 files changed, 890 insertions(+)
>>   create mode 100644 arch/arm64/boot/dts/qcom/talos-evk-lvds-auo,g133han01.dtso
>>   create mode 100644 arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
>>   create mode 100644 arch/arm64/boot/dts/qcom/talos-evk.dts
>>
>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
>> index 76cf0115a00a..289b651ef0c5 100644
>> --- a/arch/arm64/boot/dts/qcom/Makefile
>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>> @@ -324,6 +324,10 @@ dtb-$(CONFIG_ARCH_QCOM)    += sm8650-mtp.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)    += sm8650-qrd.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)    += sm8750-mtp.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)    += sm8750-qrd.dtb
>> +dtb-$(CONFIG_ARCH_QCOM)    += talos-evk.dtb
>> +talos-evk-lvds-auo,g133han01-dtbs    := \
>> +    talos-evk.dtb talos-evk-lvds-auo,g133han01.dtbo
>> +dtb-$(CONFIG_ARCH_QCOM)    += talos-evk-lvds-auo,g133han01.dtb
>>   x1e001de-devkit-el2-dtbs    := x1e001de-devkit.dtb x1-el2.dtbo
>>   dtb-$(CONFIG_ARCH_QCOM)    += x1e001de-devkit.dtb x1e001de-devkit-el2.dtb
>>   x1e78100-lenovo-thinkpad-t14s-el2-dtbs    := x1e78100-lenovo-thinkpad-t14s.dtb x1-el2.dtbo
>> diff --git a/arch/arm64/boot/dts/qcom/talos-evk-lvds-auo,g133han01.dtso b/arch/arm64/boot/dts/qcom/talos-evk-lvds-auo,g133han01.dtso
>> new file mode 100644
>> index 000000000000..884df2d4f4e1
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/talos-evk-lvds-auo,g133han01.dtso
>> @@ -0,0 +1,131 @@
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
>> +    backlight: backlight {
>> +        compatible = "gpio-backlight";
>> +        gpios = <&tlmm 59 GPIO_ACTIVE_HIGH>,
>> +            <&tlmm 115 GPIO_ACTIVE_HIGH>;
>> +        default-on;
>> +    };
>> +
>> +    panel-lvds {
>> +        compatible = "auo,g133han01";
>> +        power-supply = <&vreg_v3p3>;
>> +
>> +        ports {
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +
>> +            /* LVDS A (Odd pixels) */
>> +            port@0 {
>> +                reg = <0>;
>> +                dual-lvds-odd-pixels;
>> +
>> +                lvds_panel_out_a: endpoint {
>> +                    remote-endpoint = <&sn65dsi84_out_a>;
>> +                };
>> +            };
>> +
>> +            /* LVDS B (Even pixels) */
>> +            port@1 {
>> +                reg = <1>;
>> +                dual-lvds-even-pixels;
>> +
>> +                lvds_panel_out_b: endpoint {
>> +                    remote-endpoint = <&sn65dsi84_out_b>;
>> +                };
>> +            };
>> +        };
>> +    };
>> +
>> +    vreg_v3p3: regulator-v3p3 {
>> +        compatible = "regulator-fixed";
>> +        regulator-name = "vdd-3v3";
>> +        regulator-min-microvolt = <3300000>;
>> +        regulator-max-microvolt = <3300000>;
>> +    };
>> +};
>> +
>> +&hdmi_connector {
>> +    status = "disabled";
>> +};
>> +
>> +&i2c1 {
>> +    clock-frequency = <400000>;
>> +
>> +    status = "okay";
>> +
>> +    hdmi_bridge: bridge@3d {
>> +        status = "disabled";
>> +    };
>> +
>> +    lvds_bridge: bridge@2c {
>> +        compatible = "ti,sn65dsi84";
>> +        reg = <0x2c>;
>> +        enable-gpios = <&tlmm 42 GPIO_ACTIVE_HIGH>;
>> +
>> +        ports {
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +
>> +            port@0 {
>> +                reg = <0>;
>> +
>> +                sn65dsi84_in: endpoint {
>> +                    data-lanes = <1 2 3 4>;
>> +                    remote-endpoint = <&mdss_dsi0_out>;
>> +                };
>> +            };
>> +
>> +            port@2 {
>> +                reg = <2>;
>> +
>> +                sn65dsi84_out_a: endpoint {
>> +                    data-lanes = <1 2 3 4>;
>> +                    remote-endpoint = <&lvds_panel_out_a>;
>> +                };
>> +            };
>> +
>> +            port@3 {
>> +                reg = <3>;
>> +
>> +                sn65dsi84_out_b: endpoint {
>> +                    data-lanes = <1 2 3 4>;
>> +                    remote-endpoint = <&lvds_panel_out_b>;
>> +                };
>> +            };
>> +        };
>> +    };
>> +};
>> +
>> +&mdss_dsi0 {
>> +    vdda-supply = <&vreg_l11a>;
>> +
>> +    status = "okay";
>> +};
>> +
>> +&mdss_dsi0_out {
>> +    remote-endpoint = <&sn65dsi84_in>;
>> +    data-lanes = <0 1 2 3>;
>> +};
>> +
>> +&tlmm {
>> +    lcd_bklt_en: lcd-bklt-en-state {
>> +        pins = "gpio115";
>> +        function = "gpio";
>> +        bias-disable;
>> +    };
>> +
>> +    lcd_bklt_pwm: lcd-bklt-pwm-state {
>> +        pins = "gpio59";
>> +        function = "gpio";
>> +        bias-disable;
>> +    };
>> +};
>> diff --git a/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi b/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
>> new file mode 100644
>> index 000000000000..95ed335bcb08
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
>> @@ -0,0 +1,616 @@
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
> 
> <...>
> 
>> +
>> +&usb_1 {
>> +    status = "okay";
>> +};
>> +
>> +&usb_1_dwc3 {
>> +    dr_mode = "host";
>> +};
>> +
>> +&usb_hsphy_1 {
>> +    vdd-supply = <&vreg_l5a>;
>> +    vdda-pll-supply = <&vreg_l12a>;
>> +    vdda-phy-dpdm-supply = <&vreg_l13a>;
>> +
>> +    status = "okay";
>> +};
>> +
>> +&usb_2 {
>> +    status = "okay";
>> +};
>> +
>> +&usb_2_dwc3 {
>> +    dr_mode = "host";
>> +};
> 
> Both usb devices have been configured to host mode, do we need adb?
> The adb only work with usb peripheral mode.
> 

This topic was discussed previously, and the fix was implemented 
based on that discussion.
For reference, I’m sharing the earlier communication in the 
links below.

https://lore.kernel.org/all/qq4aak33bn3mqxd2edu6zgkkshby63mmitg7zqkly2rj4c2lh7@4s7sndb7e2jr/T/#meaa464a4e6992b36b5d8d41ddc691ee4ea36b1ce

https://lore.kernel.org/all/20251014120223.1914790-1-tessolveupstream@gmail.com/T/#t

> Thanks,
> Jie
> 
>> +
>> +&usb_hsphy_2 {
>> +    vdd-supply = <&vreg_l5a>;
>> +    vdda-pll-supply = <&vreg_l12a>;
>> +    vdda-phy-dpdm-supply = <&vreg_l13a>;
>> +
>> +    status = "okay";
>> +};
>> +
>> +&usb_qmpphy {
>> +    vdda-phy-supply = <&vreg_l5a>;
>> +    vdda-pll-supply = <&vreg_l12a>;
>> +
>> +    status = "okay";
>> +};
>> +
>> +&usb_qmpphy_2 {
>> +    vdda-phy-supply = <&vreg_l11a>;
>> +    vdda-pll-supply = <&vreg_l5a>;
>> +
>> +    status = "okay";
>> +};
>> +
>> +&ufs_mem_hc {
>> +    reset-gpios = <&tlmm 123 GPIO_ACTIVE_LOW>;
>> +    vcc-supply = <&vreg_l17a>;
>> +    vcc-max-microamp = <600000>;
>> +    vccq2-supply = <&vreg_s4a>;
>> +    vccq2-max-microamp = <600000>;
>> +
>> +    status = "okay";
>> +};
>> +
>> +&ufs_mem_phy {
>> +    vdda-phy-supply = <&vreg_l5a>;
>> +    vdda-pll-supply = <&vreg_l12a>;
>> +
>> +    status = "okay";
>> +};
>> +
>> +&venus {
>> +    status = "okay";
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
>> +    model = "Qualcomm QCS615 IQ 615 EVK";
>> +    compatible = "qcom,talos-evk", "qcom,qcs615", "qcom,sm6150";
>> +    chassis-type = "embedded";
>> +
>> +    aliases {
>> +        mmc1 = &sdhc_2;
>> +    };
>> +
>> +    dp0-connector {
>> +        compatible = "dp-connector";
>> +        label = "DP0";
>> +        type = "full-size";
>> +
>> +        hpd-gpios = <&tlmm 104 GPIO_ACTIVE_HIGH>;
>> +
>> +        port {
>> +            dp0_connector_in: endpoint {
>> +                remote-endpoint = <&mdss_dp0_out>;
>> +            };
>> +        };
>> +    };
>> +
>> +    hdmi_connector: hdmi-out {
>> +        compatible = "hdmi-connector";
>> +        type = "d";
>> +
>> +        port {
>> +            hdmi_con_out: endpoint {
>> +            remote-endpoint = <&adv7535_out>;
>> +            };
>> +        };
>> +    };
>> +
>> +    vreg_v1p8_out: regulator-v1p8-out {
>> +        compatible = "regulator-fixed";
>> +        regulator-name = "vreg-v1p8-out";
>> +        regulator-min-microvolt = <1800000>;
>> +        regulator-max-microvolt = <1800000>;
>> +        vin-supply = <&vreg_v5p0_out>;
>> +        regulator-boot-on;
>> +        regulator-always-on;
>> +    };
>> +
>> +    vreg_v3p3_out: regulator-v3p3-out {
>> +        compatible = "regulator-fixed";
>> +        regulator-name = "vreg-v3p3-out";
>> +        regulator-min-microvolt = <3300000>;
>> +        regulator-max-microvolt = <3300000>;
>> +        vin-supply = <&vreg_v5p0_out>;
>> +        regulator-boot-on;
>> +        regulator-always-on;
>> +    };
>> +
>> +    vreg_v5p0_out: regulator-v5p0-out {
>> +        compatible = "regulator-fixed";
>> +        regulator-name = "vreg-v5p0-out";
>> +        regulator-min-microvolt = <5000000>;
>> +        regulator-max-microvolt = <5000000>;
>> +        regulator-boot-on;
>> +        regulator-always-on;
>> +        /* Powered by system 20V rail (USBC_VBUS_IN) */
>> +    };
>> +};
>> +
>> +&i2c1 {
>> +    clock-frequency = <400000>;
>> +    status = "okay";
>> +
>> +    hdmi_bridge: bridge@3d {
>> +        compatible = "adi,adv7535";
>> +        reg = <0x3d>;
>> +        avdd-supply = <&vreg_v1p8_out>;
>> +        dvdd-supply = <&vreg_v1p8_out>;
>> +        pvdd-supply = <&vreg_v1p8_out>;
>> +        a2vdd-supply = <&vreg_v1p8_out>;
>> +        v3p3-supply = <&vreg_v3p3_out>;
>> +        interrupts-extended = <&tlmm 26 IRQ_TYPE_LEVEL_LOW>;
>> +        adi,dsi-lanes = <4>;
>> +
>> +        ports {
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +
>> +            port@0 {
>> +                reg = <0>;
>> +
>> +                adv7535_in: endpoint {
>> +                    remote-endpoint = <&mdss_dsi0_out>;
>> +                };
>> +            };
>> +
>> +            port@1 {
>> +                reg = <1>;
>> +
>> +                adv7535_out: endpoint {
>> +                    remote-endpoint = <&hdmi_con_out>;
>> +                };
>> +            };
>> +        };
>> +    };
>> +};
>> +
>> +&mdss_dsi0_out {
>> +    remote-endpoint = <&adv7535_in>;
>> +    data-lanes = <0 1 2 3>;
>> +};
>> +
>> +&pon_pwrkey {
>> +    status = "okay";
>> +};
>> +
>> +&pon_resin {
>> +    linux,code = <KEY_VOLUMEDOWN>;
>> +
>> +    status = "okay";
>> +};
>> +
>> +&sdhc_2 {
>> +    pinctrl-0 = <&sdc2_state_on>;
>> +    pinctrl-1 = <&sdc2_state_off>;
>> +    pinctrl-names = "default", "sleep";
>> +
>> +    bus-width = <4>;
>> +    cd-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
>> +
>> +    vmmc-supply = <&vreg_l10a>;
>> +    vqmmc-supply = <&vreg_s4a>;
>> +
>> +    status = "okay";
>> +};
> 


