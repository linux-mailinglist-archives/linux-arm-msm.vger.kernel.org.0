Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0D79575C0A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Jul 2022 09:07:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230154AbiGOHGB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Jul 2022 03:06:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230036AbiGOHFv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Jul 2022 03:05:51 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 000A0735B8
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Jul 2022 00:05:49 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id bp17so6433004lfb.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Jul 2022 00:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=edM+VSgZuPwkNgVUT8py67tbaaITMsjlVWVkcCDQAsA=;
        b=PGglcyklYCODqhqZomhrvcCPMC/MKauEc1hIuD04gsXdjA8fEVonnXExSjLSLi5B7K
         HiQr4SMDje4DNpD2c/sEnFCJRxiVK5yrYLSzAi2uimE3Qhc+vXDcQ3UnxChwGU/jm+6r
         yaqIlV8ehPMvSvPYqO3o8peRoRZEqAzaYLObFflVPa7w88wV+jxUawvuHiHbqd3YPrpH
         EYFEmwIeNN5mX8pxwKgPNQHH3+RMvJoGPQX2qzbJ+RwJYIriacRLffF72knAhR6Y++oG
         mDHZk9IOZbFJWFiGlB6RGePG5uBK/BDFxMpqSG9zlzrlbgI8bZ+pLHajRAZLtQOzKIUG
         COYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=edM+VSgZuPwkNgVUT8py67tbaaITMsjlVWVkcCDQAsA=;
        b=fr1JV2VdkaaWyDntIA9vSAB2hFJ6bGWb3AJQ1L5UstIhoWMkvLk0i1vvYFPcLnvHRd
         imGBtHdnM7yVh9V5isQ+zaAjQf3KSIdgENqnDQmHUvEK8zjZy6cuN6CGz+5FhuHscf2H
         qgtgiewGLlv0t6gkeYpc4X4TP4na+Kv/rl5Bpe+zGcmAtxSwQn4fwV364ElJqfyBSRi/
         hKwuxM8lG8P5SSoLa6Mzd3+D62gCpjXUfDXMWTp5PcWpaHeN9WkqmN9N/rtbtrbCq81A
         iq6q65PdLOdAVxWcxXnFNWgqZNHS55jXqhSxa6xPOa+GQRxSxMzJDsnWqJvMOcSm/ivM
         Vaeg==
X-Gm-Message-State: AJIora92pT7AhmnG8SDTB/HBZLLtbAyF4pLyTDVpzf/58NYFW59W2d+e
        0I/G1izLLOdHSbCY/MrsE7DYAA==
X-Google-Smtp-Source: AGRyM1t2QQxl/yaaeAHwsPu1s24eahAxTzedj3rFOTcpWst+PXEshlEEMsPrVqxOrATaYvQNybQo/g==
X-Received: by 2002:a05:6512:1054:b0:489:d273:be3a with SMTP id c20-20020a056512105400b00489d273be3amr7553671lfb.615.1657868748174;
        Fri, 15 Jul 2022 00:05:48 -0700 (PDT)
Received: from [10.0.0.8] (fwa5da9-171.bb.online.no. [88.93.169.171])
        by smtp.gmail.com with ESMTPSA id v1-20020a05651203a100b00489d18e39bfsm753939lfp.288.2022.07.15.00.05.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Jul 2022 00:05:47 -0700 (PDT)
Message-ID: <573830b4-096c-a227-6c14-9fe59771e56c@linaro.org>
Date:   Fri, 15 Jul 2022 09:05:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/3] arm64: dts: qcom: msm8916-samsung-e2015: Add initial
 common dtsi
Content-Language: en-US
To:     "Lin, Meng-Bo" <linmengbo0689@protonmail.com>,
        devicetree@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Stephan Gerhold <stephan@gerhold.net>,
        Nikita Travkin <nikita@trvn.ru>,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20220714200308.22138-1-linmengbo0689@protonmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220714200308.22138-1-linmengbo0689@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14/07/2022 22:05, Lin, Meng-Bo wrote:
> Samsung Galaxy E5, E7 and Grand Max are smartphones using the MSM8916 SoC
> released in 2015.
> 
> e2015 and a2015 are similar, with some differences in accelerometer,
> MUIC and Vibrator. The common parts are shared in
> msm8916-samsung-a2015-common.dtsi to reduce duplication.
> 
> Add a common device tree for with initial support for:
> 
> - GPIO keys and vibrator
> - Hall sensor (except Grand Max)
> - SDHCI (internal and external storage)
> - USB Device Mode
> - UART (on USB connector via the SM5504 MUIC)
> - WCNSS (WiFi/BT)
> - Regulators
> - S3FWRN5 NFC (except Grand Max)
> 
> The three devices (and all other variants of E5/E7/Grand Max released in
> 2015) are very similar, with some differences in display, touchscreen,
> sensors and NFC. The common parts are shared in
> msm8916-samsung-e2015-common.dtsi to reduce duplication.
> 
> Unfortunately, some E5/E7/Grand Max were released with outdated 32-bit
> only firmware and never received any update from Samsung. Since the 32-bit
> TrustZone firmware is signed there seems to be no way currently to
> actually boot this device tree on arm64 Linux on those variants at the
> moment.
> 
> However, it is possible to use this device tree by compiling an ARM32
> kernel instead. The device tree can be easily built on ARM32 with
> an #include and it works really well there. To avoid confusion for others
> it is still better to add this device tree on arm64. Otherwise it's easy
> to forget to update this one when making some changes that affect all
> MSM8916 devices.
> 
> Maybe someone finds a way to boot ARM64 Linux on those device at some
> point. In this case I expect that this device tree can be simply used
> as-is.
> 
> Co-developed-by: Stephan Gerhold <stephan@gerhold.net>
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> Signed-off-by: Lin, Meng-Bo <linmengbo0689@protonmail.com>

Please thread your patches (which is by default with git-send-email, so
just don't disable it). Without it you are making life of reviewer much
more difficult.

> ---
>  arch/arm64/boot/dts/qcom/Makefile             |  3 ++
>  .../qcom/msm8916-samsung-e2015-common.dtsi    | 39 +++++++++++++++++++
>  .../boot/dts/qcom/msm8916-samsung-e5.dts      | 24 ++++++++++++
>  .../boot/dts/qcom/msm8916-samsung-e7.dts      | 29 ++++++++++++++
>  .../dts/qcom/msm8916-samsung-grandmax.dts     | 36 +++++++++++++++++
>  5 files changed, 131 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/msm8916-samsung-e2015-common.dtsi
>  create mode 100644 arch/arm64/boot/dts/qcom/msm8916-samsung-e5.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/msm8916-samsung-e7.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/msm8916-samsung-grandmax.dts
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 2f8aec2cc6db..941494553b9e 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -15,6 +15,9 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-longcheer-l8910.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-mtp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-samsung-a3u-eur.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-samsung-a5u-eur.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-samsung-e5.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-samsung-e7.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-samsung-grandmax.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-samsung-j5.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-samsung-serranove.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-wingtech-wt88047.dtb
> diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-e2015-common.dtsi b/arch/arm64/boot/dts/qcom/msm8916-samsung-e2015-common.dtsi
> new file mode 100644
> index 000000000000..373154ee2643
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-e2015-common.dtsi
> @@ -0,0 +1,39 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +#include "msm8916-samsung-a2015-common.dtsi"
> +
> +/ {
> +	i2c-muic {
> +		/* SM5504 MUIC instead of SM5502 */
> +		/delete-node/ extcon@25;
> +
> +		muic: extcon@14 {
> +			compatible = "siliconmitus,sm5504-muic";
> +			reg = <0x14>;
> +
> +			interrupt-parent = <&msmgpio>;
> +			interrupts = <12 IRQ_TYPE_EDGE_FALLING>;
> +
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&muic_int_default>;
> +		};
> +	};
> +
> +	vibrator: vibrator {
> +		compatible = "gpio-vibrator";
> +		enable-gpios = <&msmgpio 76 GPIO_ACTIVE_HIGH>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&motor_en_default>;
> +	};
> +};
> +
> +&msmgpio {
> +	motor_en_default: motor-en-default {
> +		pins = "gpio76";
> +		function = "gpio";
> +
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-e5.dts b/arch/arm64/boot/dts/qcom/msm8916-samsung-e5.dts
> new file mode 100644
> index 000000000000..777eb934eb4b
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-e5.dts
> @@ -0,0 +1,24 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +/dts-v1/;
> +
> +#include "msm8916-samsung-e2015-common.dtsi"
> +
> +/*
> + * NOTE: The original firmware from Samsung can only boot ARM32 kernels on some
> + * variants.
> + * Unfortunately, the firmware is signed and cannot be replaced easily.
> + * There seems to be no way to boot ARM64 kernels on 32-bit devices at the
> + * moment, even though the hardware would support it.
> + *
> + * However, it is possible to use this device tree by compiling an ARM32 kernel
> + * instead. For clarity and build testing this device tree is maintained next
> + * to the other MSM8916 device trees. However, it is actually used through
> + * arch/arm/boot/dts/qcom-msm8916-samsung-e5.dts
> + */
> +
> +/ {
> +	model = "Samsung Galaxy E5";
> +	compatible = "samsung,e5", "qcom,msm8916";

You miss bindings document.

Best regards,
Krzysztof
