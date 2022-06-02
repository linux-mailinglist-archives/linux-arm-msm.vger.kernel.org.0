Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D91B53B8E5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jun 2022 14:20:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234914AbiFBMTv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Jun 2022 08:19:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234609AbiFBMTu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Jun 2022 08:19:50 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D598EF584
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jun 2022 05:19:48 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id rq11so9637998ejc.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jun 2022 05:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=zKAKmybAkCIsjEvhNC023g+8AShzB8GBf3Ach/mPDMQ=;
        b=wCPcS6wx2xW07/zD5fhJiachGrusq9KGYRLLQG1RWO0uPIE3xX0yXHcgYJ2+9Y+QsW
         UcTG4I2/kwmXxYQ5OqYVoUGWWPZtL3EZpu9kNHygygc0wbxtmgiaSB4vedoWYHb45tSX
         +KvJpMslHPhaPKG3Zk1xjXFlvBc3mMXQOKvqiFjBj95jyPk0L+8CpVAyhtsL2FzH5Huv
         RhZs8qRYNMa3cykZnBIw1+aTrR84c28ZkKlBxYjrVpxKS4s3mSbE333ZkCej8kl0W+nR
         rS3pB/VAkf+SfPawslxBERC6l0n0OC7T4hpgmhYCyc6Xe6XDiCznUj2L/F8t97FcfyLg
         ifbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=zKAKmybAkCIsjEvhNC023g+8AShzB8GBf3Ach/mPDMQ=;
        b=3EW47ds7nztstYnOiJEcpK0sgztNLMWqLOhtVWBXg/Gdy9ePfWOnArmVvD5lwUMOuX
         xtvCb+NmKS/MdKgRp+3NTpBTQDKEAAj3fUrLONqe+rtszxAtRxjmeeuEu4gUcICllQAz
         9rp3qg9V4tD8sHvNd5arwRUqo1qBB/aEhIPMl7XWohSmxyr3KFIKxv13/2ZF4s+0Ewcg
         eqAzwMuc4dI8BGzuDVAFmFcAOiWj83xX/KXiNlW6XOxKNrLQDpr3nZIlA1ySdTOS6IUK
         p44J0dL2xDPpHcXaeWO4+WZZoWc9Fp5LWyEKPf2q9jmAB2Fq1TTEmXZadvhEnsF2tQxK
         CxmA==
X-Gm-Message-State: AOAM5302sjnDk+Ss0ATSMUyapeVlP1Jgs52M0Y666rAL/uS+7Iq4UTRB
        /S6HIbRh2otWm8TW2bBzFFbaIA==
X-Google-Smtp-Source: ABdhPJxlJt+Xm9qyG8dyLEm9448l6TxL5kiB2SlXzsYp85U01dnJoMmqil44lVZ4vh9xh92QQPvhYg==
X-Received: by 2002:a17:907:3f1f:b0:6fe:b40a:21f0 with SMTP id hq31-20020a1709073f1f00b006feb40a21f0mr4043974ejc.744.1654172387171;
        Thu, 02 Jun 2022 05:19:47 -0700 (PDT)
Received: from [192.168.0.181] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id s3-20020a056402014300b0042617ba63a5sm2360889edu.47.2022.06.02.05.19.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jun 2022 05:19:46 -0700 (PDT)
Message-ID: <b99033fd-ca3c-49bb-d46b-c9ca1cb0c386@linaro.org>
Date:   Thu, 2 Jun 2022 14:19:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] arm64: dts: qcom: add device tree for LG G7 and LG V35
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
References: <20220602120727.197491-1-newbie13xd@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220602120727.197491-1-newbie13xd@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 02/06/2022 14:07, Stefan Hansson wrote:
> From: Anton Bambura <jenneron@protonmail.com>
> 
> Adds initial support for the LG G7 (judyln) and
> LG V35 (judyp) phones.

Thank you for your patch. There is something to discuss/improve.

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
> Signed-off-by: Anton Bambura <jenneron@protonmail.com>
> Signed-off-by: Stefan Hansson <newbie13xd@gmail.com>
> Tested-by: Gregari Ivanov <llamashere@posteo.de>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |   2 +
>  .../arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 621 ++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts |  64 ++
>  arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dts  |  40 ++
>  4 files changed, 727 insertions(+)
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
> index 000000000000..2a961454d248
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> @@ -0,0 +1,621 @@
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
> +
> +		framebuffer@9d400000 {
> +			compatible = "simple-framebuffer";
> +			width = <1440>;
> +			stride = <(1440 * 4)>;
> +			format = "a8r8g8b8";
> +		};
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

Is "label" really a property of gpio-keys node?

> +
> +		vol-up {

Generic node names, please, so "key-0" or "key-vol-up".

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

Generic node names, so also please suffix it with regulator, e.g.
pm8998-smps4-regulator

> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg_s4a_1p8";
> +
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +
> +		regulator-always-on;
> +		regulator-boot-on;
> +
> +		vin-supply = <&vph_pwr>;
> +	};
> +};
> +
> +&adsp_pas {
> +	status = "okay";
> +};
> +

(...)

> +
> +&gpu {
> +	status = "disabled";

Why is it being disabled?

> +
> +	zap-shader {
> +		memory-region = <&gpu_mem>;
> +	};
> +};
> +
> +&ipa {
> +	status = "okay";
> +	modem-init;
> +};
> +
> +&mss_pil {
> +	status = "okay";
> +};
> +
> +&pm8998_pon {
> +	resin {
> +		compatible = "qcom,pm8941-resin";
> +		interrupts = <0x0 0x8 1 IRQ_TYPE_EDGE_BOTH>;
> +		debounce = <15625>;
> +		bias-pull-up;
> +		linux,code = <KEY_VOLUMEDOWN>;
> +	};
> +};
> +
> +&sdhc_2 {
> +	status = "okay";
> +
> +	cd-gpios = <&tlmm 126 GPIO_ACTIVE_LOW>;
> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&sdc2_clk &sdc2_cmd &sdc2_data &sd_card_det_n>;
> +
> +	vmmc-supply = <&vreg_l21a_2p95>;
> +	vqmmc-supply = <&vddpx_2>;
> +};
> +
> +/*
> + * UFS works partially and only with clk_ignore_unused.
> + * Sometimes it crashes with I/O errors.
> + */
> +&ufs_mem_hc {
> +	status = "okay";
> +
> +	reset-gpios = <&tlmm 150 GPIO_ACTIVE_LOW>;
> +
> +	vcc-supply = <&vreg_l20a_2p95>;
> +	vcc-max-microamp = <600000>;
> +};
> +
> +&ufs_mem_phy {
> +	status = "okay";
> +
> +	vdda-phy-supply = <&vdda_ufs1_core>;
> +	vdda-pll-supply = <&vdda_ufs1_1p2>;
> +};
> +
> +&usb_1 {
> +	status = "okay";
> +};
> +
> +&usb_1_dwc3 {
> +	/* TODO: these devices have usb id pin */
> +	dr_mode = "peripheral";
> +};
> +
> +&usb_1_hsphy {
> +	status = "okay";
> +
> +	vdd-supply = <&vdda_usb1_ss_core>;
> +	vdda-pll-supply = <&vdda_qusb_hs0_1p8>;
> +	vdda-phy-dpdm-supply = <&vdda_qusb_hs0_3p1>;
> +
> +	qcom,imp-res-offset-value = <8>;
> +	qcom,hstx-trim-value = <QUSB2_V2_HSTX_TRIM_21_6_MA>;
> +	qcom,preemphasis-level = <QUSB2_V2_PREEMPHASIS_5_PERCENT>;
> +	qcom,preemphasis-width = <QUSB2_V2_PREEMPHASIS_WIDTH_HALF_BIT>;
> +};
> +
> +&usb_1_qmpphy {
> +	status = "okay";
> +
> +	vdda-phy-supply = <&vdda_usb1_ss_1p2>;
> +	vdda-pll-supply = <&vdda_usb1_ss_core>;
> +};
> +
> +/* PINCTRL - additions to nodes defined in sdm845.dtsi */
> +
> +&tlmm {
> +	gpio-reserved-ranges = <28 4>, <81 4>;
> +
> +	sdc2_clk: sdc2-clk {
> +		pinconf {
> +			pins = "sdc2_clk";
> +			bias-disable;
> +
> +			/*
> +			 * It seems that mmc_test reports errors if drive
> +			 * strength is not 16 on clk, cmd, and data pins.
> +			 *
> +			 * TODO: copy-pasted from mtp, try other values
> +			 * on these devices.
> +			 */
> +			drive-strength = <16>;
> +		};
> +	};
> +
> +	sdc2_cmd: sdc2-cmd {
> +		pinconf {
> +			pins = "sdc2_cmd";
> +			bias-pull-up;
> +			drive-strength = <16>;
> +		};
> +	};
> +
> +	sdc2_data: sdc2-data {
> +		pinconf {
> +			pins = "sdc2_data";
> +			bias-pull-up;
> +			drive-strength = <16>;
> +		};
> +	};
> +
> +	sd_card_det_n: sd-card-det-n {
> +		pinmux {
> +			pins = "gpio126";
> +			function = "gpio";
> +		};
> +
> +		pinconf {
> +			pins = "gpio126";
> +			bias-pull-up;
> +		};
> +	};
> +};
> +
> +&pm8998_gpio {
> +	vol_up_pin_a: vol-up-active {

You need -pins suffix

https://lore.kernel.org/all/20220507194913.261121-3-krzysztof.kozlowski@linaro.org/

> +		pins = "gpio6";
> +		function = "normal";
> +		input-enable;
> +		bias-pull-up;
> +		qcom,drive-strength = <PMIC_GPIO_STRENGTH_NO>;
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> new file mode 100644
> index 000000000000..a1a0110e7af7
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> @@ -0,0 +1,64 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * SDM845 LG G7 (judyln) device tree.
> + *
> + * Copyright (c) 2022, The Linux Foundation. All rights reserved.
> + */
> +
> +/dts-v1/;
> +
> +#include "sdm845-lg-common.dtsi"
> +
> +/ {
> +	model = "LG G7 ThinQ";
> +	compatible = "lg,judyln", "qcom,sdm845";

You need to document the compatibles in arm/qcom.yaml

> +
> +	chosen {
> +		framebuffer@9d400000 {
> +			reg = <0x0 0x9d400000 0x0 (1440 * 3120 * 4)>;
> +			height = <3120>;
> +			lab-supply = <&lab>;
> +			ibb-supply = <&ibb>;

You already have it in your DTSI, so either override by label or move
everything to each DTS. I think the second seems more readable, because
it is weird to see device node with unit address but without reg (as it
is in DTSI).

> +		};
> +	};
> +
> +	/* Additional ThinQ key */
> +	gpio-keys {
> +		pinctrl-0 = <&vol_up_pin_a &thinq_key_default>;
> +
> +		thinq {

Generic node names, so "key-0" or "key-thinq".

Same comments for second DTS.

> +			label = "ThinQ";
> +			linux,code = <KEY_ASSISTANT>;
> +			interrupt-parent = <&tlmm>;
> +			interrupts = <89 IRQ_TYPE_LEVEL_LOW>;
> +		};
> +	};

Best regards,
Krzysztof
