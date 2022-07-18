Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6CF5A57844F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Jul 2022 15:52:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235519AbiGRNwD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Jul 2022 09:52:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235524AbiGRNv7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Jul 2022 09:51:59 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CB7327FC0
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Jul 2022 06:51:57 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id r9so19416927lfp.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Jul 2022 06:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=NXepRwCmHXNEdV0q8fO4cx6qihndjDIfVD2iW8c3B2I=;
        b=lQz2MxiTEf9TZD7FzZAXQLlRkoy35pVVvzoGsVi9W719l1ocMKcztIuY4ZvhVEG5NK
         +EspkvHKwE8im2Xr3MFYhET6v9f1ujeGYQaHzr4dMycjUOxRwXhVZL8VRmYXNDzLTuAy
         g1DopHi+HyKmslpcLeMJs9y/9He6+w7c2Ei8vOouPo7hQYI0x0GJExRNVIvkN64Bu8D/
         JhjUGkQYV/INlrDDKuSeG0gPI8bfrrsdC7UOza62gwAUApgBXJDjfg+nZan0c1oUNWEq
         OqSpihd7rCAXgDKMkYKJs/ZZUVD65D4etll/DexCJL3KW1IlKD2vDwB4fIhQTfYjf0SS
         slew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=NXepRwCmHXNEdV0q8fO4cx6qihndjDIfVD2iW8c3B2I=;
        b=HFVA546R6MteKFx1RwmX0ZmhcMSqfRO+1mdWyAYfngIkBuoYURxtNIyFDZIUr2Mmyq
         FQeNLw8PziDlrlbGtWZgeuHaUXA9IEpzK17oiQAm85QpfxTy2ix0b2e/GliBnkvCWS3+
         R9HF0phAx3qG7PlAIDM92I7CQoAefPxvxTv9VV8CxEiX3s5Mf8J0bX1RkxmJ4fBX7E+7
         kzae4UENrPLY6yMU+z/q34ORfSswYbhdu5tioT3DGS475HJDhQq8G6iSTr0hH+kc90Bl
         zr0ruVKKB2oAz0acye7q8En2nzdKLc59UPHrAd84YEbmgdcejkvQ8e5Ko2A9XDXtPL8l
         ETLA==
X-Gm-Message-State: AJIora89Db4v7NXeCHyYIIf+aqLr0BTB2582unvFuHKNZxf208+L5QWt
        Bdc7BMLmVEwQ5EhdWGeuJjUe5w==
X-Google-Smtp-Source: AGRyM1u8biS5A5stNNex26D8tk1YTjCm5oCNp2FTG+A4GdkeFJhuRmurktf4iXWZeIzn8veGEh/Dbg==
X-Received: by 2002:a05:6512:4029:b0:489:c7a7:42c8 with SMTP id br41-20020a056512402900b00489c7a742c8mr14325013lfb.461.1658152315795;
        Mon, 18 Jul 2022 06:51:55 -0700 (PDT)
Received: from [192.168.115.193] (89-162-31-138.fiber.signal.no. [89.162.31.138])
        by smtp.gmail.com with ESMTPSA id k6-20020a0565123d8600b0047255d211c7sm2609276lfv.246.2022.07.18.06.51.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Jul 2022 06:51:55 -0700 (PDT)
Message-ID: <dc19c084-633d-9777-6dfd-b9633ac9c4ae@linaro.org>
Date:   Mon, 18 Jul 2022 15:51:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 3/3] ARM: dts: qcom: Add support for Samsung Galaxy Tab 4
 10.1 (SM-T530)
Content-Language: en-US
To:     =?UTF-8?Q?Matti_Lehtim=c3=a4ki?= <matti.lehtimaki@gmail.com>,
        linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        soc@kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220717213432.134486-1-matti.lehtimaki@gmail.com>
 <20220717213432.134486-4-matti.lehtimaki@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220717213432.134486-4-matti.lehtimaki@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 17/07/2022 23:34, Matti Lehtimäki wrote:
> Add a device tree for the Samsung Galaxy Tab 4 10.1 (SM-T530) wifi tablet
> based on the apq8026 platform.
> 
> Currently supported are accelerometer sensor, hall sensor, internal storage, physical
> buttons (power & volume), screen (based on simple-framebuffer set up by
> the bootloader) sdcard, touchscreen and USB.
> 
> Signed-off-by: Matti LehtimÃ¤ki <matti.lehtimaki@gmail.com>

Thank you for your patch. There is something to discuss/improve.

> ---
>  arch/arm/boot/dts/Makefile                    |   1 +
>  .../dts/qcom-apq8026-samsung-matissewifi.dts  | 475 ++++++++++++++++++
>  2 files changed, 476 insertions(+)
>  create mode 100644 arch/arm/boot/dts/qcom-apq8026-samsung-matissewifi.dts
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 5112f493f494..4d02a1740079 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1010,6 +1010,7 @@ dtb-$(CONFIG_ARCH_QCOM) += \
>  	qcom-apq8016-sbc.dtb \
>  	qcom-apq8026-asus-sparrow.dtb \
>  	qcom-apq8026-lg-lenok.dtb \
> +	qcom-apq8026-samsung-matissewifi.dtb \
>  	qcom-apq8060-dragonboard.dtb \
>  	qcom-apq8064-cm-qs600.dtb \
>  	qcom-apq8064-ifc6410.dtb \
> diff --git a/arch/arm/boot/dts/qcom-apq8026-samsung-matissewifi.dts b/arch/arm/boot/dts/qcom-apq8026-samsung-matissewifi.dts
> new file mode 100644
> index 000000000000..f4c5eb9db11c
> --- /dev/null
> +++ b/arch/arm/boot/dts/qcom-apq8026-samsung-matissewifi.dts
> @@ -0,0 +1,475 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2022, Matti LehtimÃ¤ki <matti.lehtimaki@gmail.com>
> + */
> +
> +/dts-v1/;
> +
> +#include "qcom-msm8226.dtsi"
> +#include "qcom-pm8226.dtsi"
> +#include <dt-bindings/input/input.h>
> +
> +/delete-node/ &smem_region;
> +
> +/ {
> +	model = "Samsung Galaxy Tab 4 10.1";
> +	compatible = "samsung,matissewifi", "qcom,apq8026";
> +	chassis-type = "tablet";
> +
> +	qcom,msm-id = <0xC708FF01 0 0x20000>,
> +		      <0xC708FF01 1 0x20000>,
> +		      <0xC708FF01 2 0x20000>,
> +		      <0xC708FF01 3 0x20000>;

Lower case hex and does not match bindings.
https://lore.kernel.org/all/20220705130300.100882-2-krzysztof.kozlowski@linaro.org/

This would need detailed explanation because it really does not look
correct.

> +
> +	aliases {
> +		mmc0 = &sdhc_1; /* SDC1 eMMC slot */
> +		mmc1 = &sdhc_2; /* SDC2 SD card slot */
> +		display0 = &framebuffer0;
> +	};
> +
> +	chosen {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		stdout-path = "display0";
> +
> +		framebuffer0: framebuffer@3200000 {
> +			compatible = "simple-framebuffer";
> +			reg = <0x3200000 0x800000>;
> +			width = <1280>;
> +			height = <800>;
> +			stride = <(1280 * 3)>;
> +			format = "r8g8b8";
> +			status = "okay";
> +		};
> +	};
> +
> +	gpio-hall-sensor {
> +		compatible = "gpio-keys";
> +
> +		event-hall-sensor {
> +			label = "Hall Effect Sensor";
> +			gpios = <&tlmm 110 GPIO_ACTIVE_HIGH>;
> +			interrupts = <&tlmm 110 IRQ_TYPE_EDGE_FALLING>;
> +			linux,input-type = <EV_SW>;
> +			linux,code = <SW_LID>;
> +			debounce-interval = <15>;
> +			wakeup-source;
> +		};
> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +		autorepeat;
> +
> +		key-home {
> +			label = "Home";
> +			gpios = <&tlmm 108 GPIO_ACTIVE_LOW>;
> +			linux,code = <KEY_HOMEPAGE>;
> +			debounce-interval = <15>;
> +		};
> +
> +		key-volume-down {
> +			label = "Volume Down";
> +			gpios = <&tlmm 107 GPIO_ACTIVE_LOW>;
> +			linux,code = <KEY_VOLUMEDOWN>;
> +			debounce-interval = <15>;
> +		};
> +
> +		key-volume-up {
> +			label = "Volume Up";
> +			gpios = <&tlmm 106 GPIO_ACTIVE_LOW>;
> +			linux,code = <KEY_VOLUMEUP>;
> +			debounce-interval = <15>;
> +		};
> +	};
> +
> +	i2c-muic {
> +		compatible = "i2c-gpio";
> +		sda-gpios = <&tlmm 14 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
> +		scl-gpios = <&tlmm 15 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&muic_i2c_default_state>;
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		muic: extcon@25 {

extcon is Linux specific, need some generic name instead.

> +			compatible = "siliconmitus,sm5502-muic";
> +			reg = <0x25>;
> +
> +			interrupt-parent = <&tlmm>;
> +			interrupts = <67 IRQ_TYPE_EDGE_FALLING>;
> +
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&muic_int_default_state>;
> +		};
> +	};
> +
> +	reg_tsp_1p8v: regulator-tsp-1p8v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "tsp_1p8v";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +
> +		gpio = <&tlmm 31 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&tsp_en_default_state>;
> +	};
> +
> +	reg_tsp_3p3v: regulator-tsp-3p3v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "tsp_3p3v";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpio = <&tlmm 73 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&tsp_en1_default_state>;
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		framebuffer@3200000 {

Generic node names, so memory@

> +			reg = <0x3200000 0x800000>;
> +			no-map;
> +		};
> +
> +		mpss_region: mpss@8400000 {

The same and so on...

> +			reg = <0x08400000 0x1f00000>;
> +			no-map;
> +		};
> +
> +		mba_region: mba@a300000 {

Best regards,
Krzysztof
