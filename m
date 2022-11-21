Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52C57632034
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Nov 2022 12:18:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231165AbiKULSS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Nov 2022 06:18:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231161AbiKULRq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Nov 2022 06:17:46 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14B63B4804
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Nov 2022 03:13:13 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id be13so18322476lfb.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Nov 2022 03:13:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XAfn6VShHLw1niLB1iDBItnPfiuzMI8Js3b+C5VR/Ws=;
        b=IjGkZPLbxiGF/Gvt3boX89FQh6Egn3rxeDfLxlfcTy1h+ELW7fy3ZdIEqLODk68EJ6
         n8WTJWFzIwBcHwrRTGLiAEYHekjMHH30TS/gLYRStmAr0lDdIhb9/hyFE9BouAaxnrLL
         rUpyzW5OdUCGzNDSwnGEArrLfVja8zP0Ho4phTe9404yrYBX2bJFzkr0SLcb55FBVjtt
         4yHIzp3x5aEmSeGK6a+XhmVo08AIQlZBa2avsjwcJmKOTgjbzcm84W+MYnHiKNgGLTJr
         A572KgAMtU03dgJKfBN1jNrqCVYI9ZsNtsxDrve/SpT9eZkyvwO3wW8V6wNY8zL18Zt/
         8NCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XAfn6VShHLw1niLB1iDBItnPfiuzMI8Js3b+C5VR/Ws=;
        b=QHR5uLstdz27JqEEfYIFR+F1Ed2qBvm2nnj6LkcSw+O/8B7oMe/cfHF/+KN7LKTZmb
         c+6PBOfRog0u0O80NIKrKoHpzRa8+bqmt0FiKMrdBzyhjL+bluIzHA0by6fcR8Hc+Bw+
         dBh1x++ewYfaJBa9z1l8+uXNzgpQ8M6PNVaGNcWzp2Z5D8TxZyj0GAW6J30oHyBWNB95
         CdyuxtW6OrCdhaKlGUnjso7ylYT/VM3oJExZyvdmwRSNlKlqU6BrhfFuC7HTEuJcS9Sa
         /2Kcx2bOdh0s0bTBgSPmcpZDBloVZpjcLAjbloB6yHtakt+HzDQ9yhoOfkm1kVL/u06F
         5M6g==
X-Gm-Message-State: ANoB5pm0F4dTFkBWvWheYN0lErv71PeZxEnmFBYLas3pR4VvHqB3sqPM
        CYHChQZoaB2LyIt/VWb+nKuMPA==
X-Google-Smtp-Source: AA0mqf48op0IGkg50f5DhKaV/n3SqT3+li6ER6xhdKr3OWhONiE5C59tzgxFakfG29MVRW9J4MBtXw==
X-Received: by 2002:a19:c506:0:b0:4b1:c15c:126c with SMTP id w6-20020a19c506000000b004b1c15c126cmr6176099lfe.8.1669029189555;
        Mon, 21 Nov 2022 03:13:09 -0800 (PST)
Received: from [192.168.1.101] (95.49.32.48.neoplus.adsl.tpnet.pl. [95.49.32.48])
        by smtp.gmail.com with ESMTPSA id o1-20020ac24e81000000b004b40f5e7336sm1960468lfr.199.2022.11.21.03.13.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 03:13:08 -0800 (PST)
Message-ID: <b8dc3ef6-8940-0c8b-a5d2-673118bf3db0@linaro.org>
Date:   Mon, 21 Nov 2022 12:13:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: msm8916-acer-a1-724: Add initial
 device tree
Content-Language: en-US
To:     "Lin, Meng-Bo" <linmengbo0689@protonmail.com>,
        linux-kernel@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Nikita Travkin <nikita@trvn.ru>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20221121004116.3458-1-linmengbo0689@protonmail.com>
 <20221121004549.3724-1-linmengbo0689@protonmail.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221121004549.3724-1-linmengbo0689@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 21.11.2022 01:47, Lin, Meng-Bo wrote:
> Acer Iconia Talk S A1-724 is a tablet using the MSM8916 SoC released
> in 2014.
> 
> Note: The original firmware from Acer can only boot 32-bit kernels.
> To boot arm64 kernels it is necessary to flash 64-bit TZ/HYP firmware
> with EDL, e.g. taken from the DragonBoard 410c. This works because Acer
> didn't set up (firmware) secure boot.
> 
> Add a device tree for with initial support for:
> 
> - GPIO keys
> - pm8916-vibrator
> - SDHCI (internal and external storage)
> - USB Device Mode
> - UART
> - WCNSS (WiFi/BT)
> - Regulators
> 
> Signed-off-by: Lin, Meng-Bo <linmengbo0689@protonmail.com>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>  .../boot/dts/qcom/msm8916-acer-a1-724.dts     | 217 ++++++++++++++++++
>  2 files changed, 218 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/msm8916-acer-a1-724.dts
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index afe496a93f94..f38a20074013 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -7,6 +7,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= ipq6018-cp01-c1.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= ipq8074-hk01.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= ipq8074-hk10-c1.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= ipq8074-hk10-c2.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-acer-a1-724.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-alcatel-idol347.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-asus-z00l.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-huawei-g7.dtb
> diff --git a/arch/arm64/boot/dts/qcom/msm8916-acer-a1-724.dts b/arch/arm64/boot/dts/qcom/msm8916-acer-a1-724.dts
> new file mode 100644
> index 000000000000..67187673364c
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/msm8916-acer-a1-724.dts
> @@ -0,0 +1,217 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +/dts-v1/;
> +
> +#include "msm8916-pm8916.dtsi"
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +
> +/*
> + * NOTE: The original firmware from Acer can only boot 32-bit kernels.
> + * To boot this device tree using arm64 it is necessary to flash 64-bit
> + * TZ/HYP firmware (e.g. taken from the DragonBoard 410c).
> + * See https://wiki.postmarketos.org/wiki/Acer_Iconia_Talk_S_(acer-a1-724)
> + * for suggested installation instructions.
> + */
> +
> +/ {
> +	model = "Acer Iconia Talk S A1-724";
> +	compatible = "acer,a1-724", "qcom,msm8916";
> +	chassis-type = "tablet";
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
> +		button-volume-up {
> +			label = "Volume Up";
> +			gpios = <&msmgpio 107 GPIO_ACTIVE_LOW>;
> +			linux,code = <KEY_VOLUMEUP>;
> +		};
> +	};
> +
> +	usb_id: usb-id {
> +		compatible = "linux,extcon-usb-gpio";
> +		id-gpio = <&msmgpio 110 GPIO_ACTIVE_HIGH>;
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
> +	linux,code = <KEY_VOLUMEDOWN>;
> +	status = "okay";
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
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&sdc1_clk_on &sdc1_cmd_on &sdc1_data_on>;
> +	pinctrl-1 = <&sdc1_clk_off &sdc1_cmd_off &sdc1_data_off>;
> +
> +	status = "okay";
> +};
> +
> +&sdhc_2 {
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&sdc2_clk_on &sdc2_cmd_on &sdc2_data_on>;
> +	pinctrl-1 = <&sdc2_clk_off &sdc2_cmd_off &sdc2_data_off>;
> +
> +	cd-gpios = <&msmgpio 38 GPIO_ACTIVE_HIGH>;
> +
> +	status = "okay";
> +};
> +
> +&usb {
> +	extcon = <&usb_id>, <&usb_id>;
> +	status = "okay";
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
> +		regulator-min-microvolt = <2850000>;
> +		regulator-max-microvolt = <2900000>;
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
> +		regulator-min-microvolt = <2900000>;
> +		regulator-max-microvolt = <2900000>;
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
> +	gpio_keys_default: gpio-keys-default-state {
> +		pins = "gpio107";
> +		function = "gpio";
> +
> +		drive-strength = <2>;
> +		bias-pull-up;
> +	};
> +
> +	usb_id_default: usb-id-default-state {
> +		pins = "gpio110";
> +		function = "gpio";
> +
> +		drive-strength = <8>;
> +		bias-pull-up;
> +	};
> +};
