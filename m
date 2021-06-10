Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31E813A2F63
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jun 2021 17:34:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231642AbhFJPgC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Jun 2021 11:36:02 -0400
Received: from mail-oi1-f176.google.com ([209.85.167.176]:42589 "EHLO
        mail-oi1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231566AbhFJPgB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Jun 2021 11:36:01 -0400
Received: by mail-oi1-f176.google.com with SMTP id s23so2524320oiw.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jun 2021 08:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=diaBhTtgbmN7/HJRPdO1rlscL68MMkhSsLd5piYd/5o=;
        b=lnrQYftBwkAB2EUkyA3n13lhxTvznpF+VLaSyGxBMYar3FbxXrQ7NV4O7lq97Ipb7i
         mOiJgSWjoMnF79lFQCqA5dyUjnQgre3RTpEq+nHe4uKtokDz3Ce3YP2SV1pegAGTOUjc
         VxLs7C50df9KVFQ1+ovwOAkFruJTuFdTZlEfVQC9C6Gj+16gKa4lZP1Slrr5D/fsgIEV
         6+GlkbrxIxUZXy23+gHp/C2WtGskOBxhAx8JV5rJfw/yD7OTUTRANuNfcTZ1rFkZOlmA
         C3SYLVqtbv1CdujLVY0BC/WFfV6ooUy2ii1OjoG4izW2rcEhYu0wyyJUtmcAIaPn1AH5
         2WKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=diaBhTtgbmN7/HJRPdO1rlscL68MMkhSsLd5piYd/5o=;
        b=TBcj7HBReGoItTLAj7WiR4Bg1ZF0I56dEZ4qsQRtMlHpST0y+UZ+ZJfBy/18QC48Ur
         bXOGOr1yaZfmzbBqIxbW5Yi18+hez15/HAgBeIrmohxsUDNAqvRZA7PXgYJCrKf8hb3q
         jPQn/C3lkY6GvAieLdg9iESChxubk3FCXJqMyZNIAdXR5t2uos54z7JZl7C27dVbaUeQ
         avqfdftUtRZApvCy/597YzjzNlinFuIfzMjW+VxlnMjZRvVgcRLggBXgEzFALJPx3IDB
         AnRQYkmTGP5YMZLzvPaUaQm37H/xKSvVm6blmZ3JfE1JbuDMBrpTeHABrh1On429VLSD
         UhnA==
X-Gm-Message-State: AOAM530+E/SjzJEGCBvsZ8n4eubM6xLxPJ5zxMPm3Ap5yacnnNOMUEHg
        8zai5stgWVBjS0LmvzyS94g5oGZSALxq0w==
X-Google-Smtp-Source: ABdhPJymoWFRtTGCIDitAjto4Dg7KRwR2+n+E3yFgP/0FPnd3MlQhjyS1wJxRJ4S2F5MAdsvU+fQjA==
X-Received: by 2002:aca:af42:: with SMTP id y63mr10643474oie.119.1623339172814;
        Thu, 10 Jun 2021 08:32:52 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 15sm587472oij.26.2021.06.10.08.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 08:32:52 -0700 (PDT)
Date:   Thu, 10 Jun 2021 10:32:50 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 1/5] arm64: dts: qcom: msm8916: Add device tree for
 Huawei Ascend G7
Message-ID: <YMIwovyb9ROfGaET@builder.lan>
References: <20210514104328.18756-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210514104328.18756-1-stephan@gerhold.net>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 14 May 05:43 CDT 2021, Stephan Gerhold wrote:

> The Huawei Ascend G7 is a smartphone from Huawei based on MSM8916.
> It's fairly similar to the other MSM8916 devices, the only notable
> exception are the "cd-gpios" for detecting if a SD card was inserted:
> It looks like Huawei forgot to re-route this to gpio38, so the correct
> GPIO seems to be gpio56 on this device.
> 
> Note: The original firmware from Huawei can only boot 32-bit kernels.
> To boot arm64 kernels it is necessary to flash 64-bit TZ/HYP firmware
> with EDL, e.g. taken from the DragonBoard 410c. This works because Huawei
> forgot to set up (firmware) secure boot for some reason.
> 
> Also note that Huawei no longer provides bootloader unlock codes.
> This can be bypassed by patching the bootloader from a custom HYP firmware,
> making it think the bootloader is unlocked. I use a modified version of
> qhypstub [1], that patches a single instruction in the Huawei bootloader.
> 
> The device tree contains initial support for the Huawei Ascend G7 with:
>   - UART (untested, probably available via some test points)
>   - eMMC/SD card
>   - Buttons
>   - Notification LED (combination of 3 GPIO LEDs)
>   - Vibrator
>   - WiFi/Bluetooth (WCNSS)
>   - USB
> 
> [1]: https://github.com/msm8916-mainline/qhypstub
> 
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>  .../arm64/boot/dts/qcom/msm8916-huawei-g7.dts | 279 ++++++++++++++++++
>  2 files changed, 280 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dts
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 456502aeee49..c894de19654e 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -7,6 +7,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= ipq6018-cp01-c1.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= ipq8074-hk01.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-alcatel-idol347.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-asus-z00l.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-huawei-g7.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-longcheer-l8150.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-longcheer-l8910.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-mtp.dtb
> diff --git a/arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dts b/arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dts
> new file mode 100644
> index 000000000000..d67aa7dd4a21
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dts
> @@ -0,0 +1,279 @@
> +// SPDX-License-Identifier: GPL-2.0-only

Would it be possible to change this to BSD license instead?

Apart from that, the patches looks really good.

Thanks,
Bjorn

> +// Copyright (C) 2021 Stephan Gerhold
> +
> +/dts-v1/;
> +
> +#include "msm8916-pm8916.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/leds/common.h>
> +
> +/*
> + * Note: The original firmware from Huawei can only boot 32-bit kernels.
> + * To boot arm64 kernels it is necessary to flash 64-bit TZ/HYP firmware
> + * with EDL, e.g. taken from the DragonBoard 410c. This works because Huawei
> + * forgot to set up (firmware) secure boot for some reason.
> + *
> + * Also note that Huawei no longer provides bootloader unlock codes.
> + * This can be bypassed by patching the bootloader from a custom HYP firmware,
> + * making it think the bootloader is unlocked.
> + *
> + * See: https://wiki.postmarketos.org/wiki/Huawei_Ascend_G7_(huawei-g7)
> + */
> +
> +/ {
> +	model = "Huawei Ascend G7";
> +	compatible = "huawei,g7", "qcom,msm8916";
> +
> +	aliases {
> +		serial0 = &blsp1_uart2;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0";
> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&gpio_keys_default>;
> +
> +		label = "GPIO Buttons";
> +
> +		volume-up {
> +			label = "Volume Up";
> +			gpios = <&msmgpio 107 GPIO_ACTIVE_LOW>;
> +			linux,code = <KEY_VOLUMEUP>;
> +		};
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&gpio_leds_default>;
> +
> +		led-0 {
> +			gpios = <&msmgpio 8 GPIO_ACTIVE_HIGH>;
> +			color = <LED_COLOR_ID_RED>;
> +			default-state = "off";
> +			function = LED_FUNCTION_INDICATOR;
> +		};
> +
> +		led-1 {
> +			gpios = <&msmgpio 9 GPIO_ACTIVE_HIGH>;
> +			color = <LED_COLOR_ID_GREEN>;
> +			default-state = "off";
> +			function = LED_FUNCTION_INDICATOR;
> +		};
> +
> +		led-2 {
> +			gpios = <&msmgpio 10 GPIO_ACTIVE_HIGH>;
> +			color = <LED_COLOR_ID_BLUE>;
> +			default-state = "off";
> +			function = LED_FUNCTION_INDICATOR;
> +		};
> +	};
> +
> +	usb_id: usb-id {
> +		compatible = "linux,extcon-usb-gpio";
> +		id-gpio = <&msmgpio 117 GPIO_ACTIVE_HIGH>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&usb_id_default>;
> +	};
> +};
> +
> +&blsp1_uart2 {
> +	status = "okay";
> +};
> +
> +&pm8916_resin {
> +	status = "okay";
> +	linux,code = <KEY_VOLUMEDOWN>;
> +};
> +
> +&pm8916_vib {
> +	status = "okay";
> +};
> +
> +&pronto {
> +	status = "okay";
> +};
> +
> +&sdhc_1 {
> +	status = "okay";
> +
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&sdc1_clk_on &sdc1_cmd_on &sdc1_data_on>;
> +	pinctrl-1 = <&sdc1_clk_off &sdc1_cmd_off &sdc1_data_off>;
> +};
> +
> +&sdhc_2 {
> +	status = "okay";
> +
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&sdc2_clk_on &sdc2_cmd_on &sdc2_data_on &sdhc2_cd_default>;
> +	pinctrl-1 = <&sdc2_clk_off &sdc2_cmd_off &sdc2_data_off &sdhc2_cd_default>;
> +
> +	/*
> +	 * The Huawei device tree sets cd-gpios = <&msmgpio 38 GPIO_ACTIVE_HIGH>.
> +	 * However, gpio38 does not change its state when inserting/removing the
> +	 * SD card, it's just low all the time. The Huawei kernel seems to use
> +	 * polling for SD card detection instead.
> +	 *
> +	 * However, looking closer at the GPIO debug output it turns out that
> +	 * gpio56 switches its state when inserting/removing the SD card.
> +	 * It behaves just like gpio38 normally does. Usually GPIO56 is used as
> +	 * "UIM2_PRESENT", i.e. to check if a second SIM card is inserted.
> +	 * Maybe Huawei decided to replace the second SIM card slot with the
> +	 * SD card slot and forgot to re-route to gpio38.
> +	 */
> +	cd-gpios = <&msmgpio 56 GPIO_ACTIVE_LOW>;
> +};
> +
> +&usb {
> +	status = "okay";
> +	extcon = <&usb_id>, <&usb_id>;
> +};
> +
> +&usb_hs_phy {
> +	extcon = <&usb_id>;
> +};
> +
> +&smd_rpm_regulators {
> +	vdd_l1_l2_l3-supply = <&pm8916_s3>;
> +	vdd_l4_l5_l6-supply = <&pm8916_s4>;
> +	vdd_l7-supply = <&pm8916_s4>;
> +
> +	s3 {
> +		regulator-min-microvolt = <1200000>;
> +		regulator-max-microvolt = <1300000>;
> +	};
> +
> +	s4 {
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <2100000>;
> +	};
> +
> +	l1 {
> +		regulator-min-microvolt = <1225000>;
> +		regulator-max-microvolt = <1225000>;
> +	};
> +
> +	l2 {
> +		regulator-min-microvolt = <1200000>;
> +		regulator-max-microvolt = <1200000>;
> +	};
> +
> +	l4 {
> +		regulator-min-microvolt = <2050000>;
> +		regulator-max-microvolt = <2050000>;
> +	};
> +
> +	l5 {
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +	};
> +
> +	l6 {
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +	};
> +
> +	l7 {
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +	};
> +
> +	l8 {
> +		regulator-min-microvolt = <2950000>;
> +		regulator-max-microvolt = <2950000>;
> +	};
> +
> +	l9 {
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +	};
> +
> +	l10 {
> +		regulator-min-microvolt = <2700000>;
> +		regulator-max-microvolt = <2800000>;
> +	};
> +
> +	l11 {
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <2950000>;
> +		regulator-allow-set-load;
> +		regulator-system-load = <200000>;
> +	};
> +
> +	l12 {
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <2950000>;
> +	};
> +
> +	l13 {
> +		regulator-min-microvolt = <3075000>;
> +		regulator-max-microvolt = <3075000>;
> +	};
> +
> +	l14 {
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <3300000>;
> +	};
> +
> +	l15 {
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <3300000>;
> +	};
> +
> +	l16 {
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <3300000>;
> +	};
> +
> +	l17 {
> +		regulator-min-microvolt = <2850000>;
> +		regulator-max-microvolt = <2850000>;
> +	};
> +
> +	l18 {
> +		regulator-min-microvolt = <2700000>;
> +		regulator-max-microvolt = <2700000>;
> +	};
> +};
> +
> +&msmgpio {
> +	gpio_keys_default: gpio-keys-default {
> +		pins = "gpio107";
> +		function = "gpio";
> +
> +		drive-strength = <2>;
> +		bias-pull-up;
> +	};
> +
> +	gpio_leds_default: gpio-leds-default {
> +		pins = "gpio8", "gpio9", "gpio10";
> +		function = "gpio";
> +
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	sdhc2_cd_default: sdhc2-cd-default {
> +		pins = "gpio56";
> +		function = "gpio";
> +
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	usb_id_default: usb-id-default {
> +		pins = "gpio117";
> +		function = "gpio";
> +
> +		drive-strength = <8>;
> +		bias-pull-up;
> +	};
> +};
> -- 
> 2.31.1
> 
