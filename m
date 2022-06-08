Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C10E542E92
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jun 2022 13:01:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237084AbiFHLAr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Jun 2022 07:00:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236969AbiFHLAq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Jun 2022 07:00:46 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBCAD132A04
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jun 2022 04:00:43 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id u12so40708230eja.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jun 2022 04:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=qBGiZ5xtfOQju8YtSe8GUXhXXJ+QE4kay4eYxeKQUGY=;
        b=xh6F31iDFmrvREOQBjfvpJCXVsezjXlXbD+GyptiUEH5/aCAYJkI1Sc63E9SEdPr6X
         G6RiLW3XWAJzSIZin8Mq4a8bjuQx1+M41uisXSEDHfK3tH3nj6VMCUz/22ztMZk+1J4l
         yQabMnLyaOPNsjR4UOf+n5+qK4K/cZ2nDS/ONHT7S/Tm3vS94CYSKXVS6asJpzMg7ZKI
         fPygOAZqQsn9yCQR55yTso90GNPWKWLoLQ9IHPvO0CeRgKS+e5Drpqd1MRwCZjYFfavV
         Hqju+c5uzVPTaf6xc0Ngf8XrzHUY0ymgdJiNEC/LaWMo1SIRGChsR1ybKKjywOaNuGFz
         jX8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=qBGiZ5xtfOQju8YtSe8GUXhXXJ+QE4kay4eYxeKQUGY=;
        b=GwKXo5StOs1azhZiJRr5AyJyRoJ/HZkckZNw0qRngOa6SGeMwCmkDAu/MMu74NrTCi
         1fWcXfekFZWyjMZBba0id62JNGNyUaNPGNrLdrT9N9srqWYlrCUYR/6RWcucYighkV4h
         v43vff6PdsYabeCnoPlm9x6pkcWcpYErJZCvbuj4mhW1smBQ2T9SZ7vsvh1m/7DCvgc8
         M+XBF8qfxScxf4WYbc7/3mQDBm/dYkOCdvgwb028g+4E9k7h+KMYhqYg10o3J//Nzl+T
         ig3i5BkdRlOAAoCkoSY9d7T8cbd7t7VEXayhDO36THP3SQhTjuVaqkS/Xq+eCEQojw/l
         6X6A==
X-Gm-Message-State: AOAM532WqI7jaz4aQUCkcwFLEpyMrMXSx0qCtlafbcyBQnvG+7h7a/w1
        9PYBxdjOUz7HtM5EGWdn3XX6LA==
X-Google-Smtp-Source: ABdhPJwwLtZCjzdOLeTWQ1nt6ascUg+WNVUVia6UUiVTIU+gK46JP03fDLfttjnLOmiDN6kfPgkF0Q==
X-Received: by 2002:a17:907:724e:b0:70f:29c0:3a03 with SMTP id ds14-20020a170907724e00b0070f29c03a03mr23950162ejc.673.1654686042395;
        Wed, 08 Jun 2022 04:00:42 -0700 (PDT)
Received: from [192.168.0.191] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id x9-20020a1709064a8900b006f3ef214e2csm9197538eju.146.2022.06.08.04.00.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jun 2022 04:00:41 -0700 (PDT)
Message-ID: <6aa0ed26-e787-f8ca-10c9-d7fe74731e30@linaro.org>
Date:   Wed, 8 Jun 2022 13:00:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: add device tree for LG G7 and LG
 V35
Content-Language: en-US
To:     Stefan Hansson <newbie13xd@gmail.com>,
        ~postmarketos/upstreaming@lists.sr.ht,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org
Cc:     Anton Bambura <jenneron@protonmail.com>,
        Gregari Ivanov <llamashere@posteo.de>
References: <20220603201341.94137-1-newbie13xd@gmail.com>
 <20220603201341.94137-2-newbie13xd@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220603201341.94137-2-newbie13xd@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 03/06/2022 22:13, Stefan Hansson wrote:
> From: Anton Bambura <jenneron@protonmail.com>
> 
> Adds initial support for the LG G7 (judyln) and
> LG V35 (judyp) phones.
> 
> Currently supported features:
> 
>  - Display via simplefb (panel driver is WIP)
>  - Keys
>  - Micro SD card
>  - Modem (not tested much, but initialises)
>  - UFS (crashes during intensive workloads, may need quirks)
>  - USB in peripheral mode
> 
> Changes since v1:
> 
>  - Enabled GPU
>  - Changed some node names
>  - Moved framebuffer node from common dtsi
> 
> I did not change the regulator node names as adding -regulator
> everywhere broke USB networking, and as such I reverted it to what
> OnePlus 6's common dtsi is doing given that it's well-tested. I do not
> have time to debug this further at the moment since I won't have access
> to the phone for about 3 months, so I hope this is okay. If not, I'll
> have to look into it at a later point.
> 
> Signed-off-by: Anton Bambura <jenneron@protonmail.com>
> Signed-off-by: Stefan Hansson <newbie13xd@gmail.com>
> Tested-by: Gregari Ivanov <llamashere@posteo.de>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |   2 +
>  .../arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 614 ++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts |  68 ++
>  arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dts  |  44 ++
>  4 files changed, 728 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
>  create mode 100644 arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dts
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index f9e6343acd03..2f31e62f550c 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -99,6 +99,8 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-cheza-r1.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-cheza-r2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-cheza-r3.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-db845c.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-lg-judyln.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-lg-judyp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-mtp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-oneplus-enchilada.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-oneplus-fajita.dtb
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> new file mode 100644
> index 000000000000..e882554b3da8
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> @@ -0,0 +1,614 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * SDM845 LG G7 / V35 (judyln / judyp) common device tree
> + *
> + * Copyright (c) 2022, The Linux Foundation. All rights reserved.
> + */
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +
> +#include "sdm845.dtsi"
> +#include "pm8998.dtsi"
> +#include "pmi8998.dtsi"
> +
> +/delete-node/ &adsp_mem;
> +/delete-node/ &cdsp_mem;
> +/delete-node/ &gpu_mem;
> +/delete-node/ &ipa_fw_mem;
> +/delete-node/ &mba_region;
> +/delete-node/ &mpss_region;
> +/delete-node/ &qseecom_mem;
> +/delete-node/ &rmtfs_mem;
> +/delete-node/ &slpi_mem;
> +/delete-node/ &spss_mem;
> +/delete-node/ &venus_mem;
> +/delete-node/ &wlan_msa_mem;
> +
> +/ {
> +	chosen {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		qseecom_mem: memory@b2000000 {
> +			reg = <0 0xb2000000 0 0x1800000>;
> +			no-map;
> +		};
> +
> +		gpu_mem: memory@8c415000 {
> +			reg = <0 0x8c415000 0 0x2000>;
> +			no-map;
> +		};
> +
> +		ipa_fw_mem: memory@8c400000 {
> +			reg = <0 0x8c400000 0 0x10000>;
> +			no-map;
> +		};
> +
> +		adsp_mem: memory@8c500000 {
> +			reg = <0 0x8c500000 0 0x1e00000>;
> +			no-map;
> +		};
> +
> +		wlan_msa_mem: memory@8e300000 {
> +			reg = <0 0x8e300000 0 0x100000>;
> +			no-map;
> +		};
> +
> +		mpss_region: memory@8e400000 {
> +			reg = <0 0x8e400000 0 0x8900000>;
> +			no-map;
> +		};
> +
> +		venus_mem: memory@96d00000 {
> +			reg = <0 0x96d00000 0 0x500000>;
> +			no-map;
> +		};
> +
> +		cdsp_mem: memory@97200000 {
> +			reg = <0 0x97200000 0 0x800000>;
> +			no-map;
> +		};
> +
> +		mba_region: memory@97a00000 {
> +			reg = <0 0x97a00000 0 0x200000>;
> +			no-map;
> +		};
> +
> +		slpi_mem: memory@97c00000 {
> +			reg = <0 0x97c00000 0 0x1400000>;
> +			no-map;
> +		};
> +
> +		spss_mem: memory@99000000 {
> +			reg = <0 0x99000000 0 0x100000>;
> +			no-map;
> +		};
> +
> +		/* Framebuffer region */
> +		memory@9d400000 {
> +			reg = <0x0 0x9d400000 0x0 0x2400000>;
> +			no-map;
> +		};
> +
> +		/* rmtfs lower guard */
> +		memory@f0800000 {
> +			reg = <0 0xf0800000 0 0x1000>;
> +			no-map;
> +		};
> +
> +		rmtfs_mem: memory@f0801000 {
> +			compatible = "qcom,rmtfs-mem";
> +			reg = <0 0xf0801000 0 0x200000>;
> +			no-map;
> +
> +			qcom,client-id = <1>;
> +			qcom,vmid = <15>;
> +		};
> +
> +		/* rmtfs upper guard */
> +		memory@f0a01000 {
> +			reg = <0 0xf0a01000 0 0x1000>;
> +			no-map;
> +		};
> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&vol_up_pin_a>;
> +
> +		label = "GPIO Buttons";
> +
> +		key-vol-up {
> +			label = "Volume up";
> +			linux,code = <KEY_VOLUMEUP>;
> +			gpios = <&pm8998_gpio 6 GPIO_ACTIVE_LOW>;
> +		};
> +	};
> +
> +	vph_pwr: vph-pwr-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vph_pwr";
> +		regulator-min-microvolt = <3700000>;
> +		regulator-max-microvolt = <3700000>;
> +	};
> +
> +	/*
> +	 * Apparently RPMh does not provide support for PM8998 S4 because it
> +	 * is always-on; model it as a fixed regulator.
> +	 */
> +	vreg_s4a_1p8: pm8998-smps4 {

My previous comment was ignored here. Is there something not clear?


Best regards,
Krzysztof
