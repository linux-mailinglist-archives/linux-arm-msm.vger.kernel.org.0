Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 994273FA1B1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Aug 2021 01:05:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232465AbhH0XGL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Aug 2021 19:06:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232252AbhH0XGK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Aug 2021 19:06:10 -0400
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it [IPv6:2001:4b7a:2000:18::162])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC877C0613D9
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Aug 2021 16:05:20 -0700 (PDT)
Received: from [192.168.1.101] (83.6.168.105.neoplus.adsl.tpnet.pl [83.6.168.105])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 246E9200E9;
        Sat, 28 Aug 2021 01:05:16 +0200 (CEST)
Subject: Re: [PATCH v2] arm64: dts: qcom: sdm660: Add initial IFC6560 board
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Alexey Minnekhanov <alexeymin@postmarketos.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
References: <20210825221110.1498718-1-bjorn.andersson@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
Message-ID: <9dffcf34-f1ea-70c8-4e18-8017701bf42b@somainline.org>
Date:   Sat, 28 Aug 2021 01:05:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210825221110.1498718-1-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 26.08.2021 00:11, Bjorn Andersson wrote:
> The IFC6560 is a board from Inforce Computing, built around the SDA660
> SoC. This patch describes core clocks, some regulators from the two
> PMICs, debug uart, storage, bluetooth and audio DSP remoteproc.
>
> The regulator settings are inherited from prior work by Konrad Dybcio
> and AngeloGioacchino Del Regno.
>
> Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>
> Changes since v1:
> - Fixed typo 29p5 -> 2p95 in two regulators.
>
>  arch/arm64/boot/dts/qcom/Makefile           |   1 +
>  arch/arm64/boot/dts/qcom/sdm660-ifc6560.dts | 279 ++++++++++++++++++++
>  2 files changed, 280 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sdm660-ifc6560.dts
>
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 70516508be56..88abcfeb4d38 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -73,6 +73,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdm630-sony-xperia-nile-discovery.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm630-sony-xperia-nile-pioneer.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm630-sony-xperia-nile-voyager.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm636-sony-xperia-ganges-mermaid.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= sdm660-ifc6560.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm660-xiaomi-lavender.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-cheza-r1.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-cheza-r2.dtb
> diff --git a/arch/arm64/boot/dts/qcom/sdm660-ifc6560.dts b/arch/arm64/boot/dts/qcom/sdm660-ifc6560.dts
> new file mode 100644
> index 000000000000..bfb17711ab55
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sdm660-ifc6560.dts
> @@ -0,0 +1,279 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2021, Linaro Ltd.
> + * Copyright (c) 2020, Konrad Dybcio <konrad.dybcio@somainline.org>
> + * Copyright (c) 2020, AngeloGioacchino Del Regno
> + *                     <angelogioacchino.delregno@somainline.org>
> + */
> +
> +/dts-v1/;
> +
> +#include "sdm660.dtsi"
> +#include "pm660.dtsi"
> +#include "pm660l.dtsi"
> +
> +/ {
> +	model = "Inforce 6560 Single Board Computer";
> +	compatible = "inforce,ifc6560", "qcom,sdm660";
> +
> +	aliases {
> +		serial0 = &blsp1_uart2;
> +		serial1 = &blsp2_uart1;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +	};

This is already defined in sdm630.dtsi.


> +
> +	vph_pwr: vph-pwr-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vph_pwr";
> +	};

No voltage range?


> +
> +	v3p3_bck_bst: v3p3-bck-bst-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "v3p3_bck_bst";
> +
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		vin-supply = <&vph_pwr>;
> +	};
> +
> +	v1p2_ldo: v1p2-ldo-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "v1p2_ldo";
> +
> +		regulator-min-microvolt = <1200000>;
> +		regulator-max-microvolt = <1200000>;
> +
> +		vin-supply = <&vph_pwr>;
> +	};
> +
> +	v5p0_boost: v5p0-boost-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "v5p0_boost";
> +
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +
> +		vin-supply = <&vph_pwr>;
> +	};
> +};
> +
> +&adsp_pil {
> +	firmware-name = "qcom/inforce/ifc6560/adsp.mbn";
> +};
> +
> +&blsp1_uart2 {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&uart_active>;
> +};
> +
> +&blsp2_uart1 {
> +	status = "okay";
> +
> +	bluetooth {
> +		compatible = "qcom,wcn3990-bt";
> +
> +		vddio-supply = <&vreg_l13a_1p8>;
> +		vddxo-supply = <&vreg_l9a_1p8>;
> +		vddrf-supply = <&vreg_l6a_1p3>;
> +		vddch0-supply = <&vreg_l19a_3p3>;
> +		max-speed = <3200000>;
> +	};
> +};
> +
> +&rpm_requests {
> +	pm660-regulators {
> +		compatible = "qcom,rpm-pm660-regulators";
> +
> +		vdd_s1-supply = <&vph_pwr>;
> +		vdd_s2-supply = <&vph_pwr>;
> +		vdd_s3-supply = <&vph_pwr>;
> +		vdd_s4-supply = <&vph_pwr>;
> +		vdd_s5-supply = <&vph_pwr>;
> +		vdd_s6-supply = <&vph_pwr>;
> +
> +		vdd_l1_l6_l7-supply = <&vreg_s5a_1p35>;
> +		vdd_l2_l3-supply = <&vreg_s2b_1p05>;
> +		vdd_l5-supply = <&vreg_s2b_1p05>;
> +		vdd_l8_l9_l10_l11_l12_l13_l14-supply = <&vreg_s4a_2p04>;
> +		vdd_l15_l16_l17_l18_l19-supply = <&vreg_bob>;
> +
> +		vreg_s4a_2p04: s4 {
> +			regulator-min-microvolt = <2040000>;
> +			regulator-max-microvolt = <2040000>;
> +			regulator-enable-ramp-delay = <200>;
> +			regulator-ramp-delay = <0>;
> +			regulator-always-on;
> +		};
> +
> +		vreg_s5a_1p35: s5 {
> +			regulator-min-microvolt = <1224000>;
> +			regulator-max-microvolt = <1350000>;
> +			regulator-enable-ramp-delay = <200>;
> +			regulator-ramp-delay = <0>;
> +		};
> +
> +		vreg_l6a_1p3: l6 {
> +			regulator-min-microvolt = <1304000>;
> +			regulator-max-microvolt = <1368000>;
> +			regulator-allow-set-load;
> +			regulator-enable-ramp-delay = <250>;
> +			regulator-ramp-delay = <0>;
> +		};
> +
> +		vreg_l8a_1p8: l8 {
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-enable-ramp-delay = <250>;
> +			regulator-ramp-delay = <0>;
> +			regulator-system-load = <325000>;
> +			regulator-allow-set-load;
> +		};
> +
> +		vreg_l9a_1p8: l9 {
> +			regulator-min-microvolt = <1804000>;
> +			regulator-max-microvolt = <1896000>;
> +			regulator-enable-ramp-delay = <250>;
> +			regulator-ramp-delay = <0>;
> +			regulator-allow-set-load;
> +		};
> +
> +		vreg_l13a_1p8: l13 {
> +			/* This gives power to the LPDDR4: never turn it off! */
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1944000>;
> +			regulator-enable-ramp-delay = <250>;
> +			regulator-ramp-delay = <0>;
> +			regulator-boot-on;
> +			regulator-always-on;
> +		};
> +
> +		vreg_l19a_3p3: l19 {
> +			regulator-min-microvolt = <3312000>;
> +			regulator-max-microvolt = <3400000>;
> +			regulator-enable-ramp-delay = <250>;
> +			regulator-ramp-delay = <0>;
> +			regulator-allow-set-load;
> +		};
> +	};
> +
> +	pm660l-regulators {
> +		compatible = "qcom,rpm-pm660l-regulators";
> +
> +		vdd_s1-supply = <&vph_pwr>;
> +		vdd_s2-supply = <&vph_pwr>;
> +		vdd_s3_s4-supply = <&vph_pwr>;
> +		vdd_s5-supply = <&vph_pwr>;
> +		vdd_s6-supply = <&vph_pwr>;
> +
> +		vdd_l1_l9_l10-supply = <&vreg_s2b_1p05>;
> +		vdd_l2-supply = <&vreg_bob>;
> +		vdd_l3_l5_l7_l8-supply = <&vreg_bob>;
> +		vdd_l4_l6-supply = <&vreg_bob>;
> +		vdd_bob-supply = <&vph_pwr>;
> +
> +		vreg_s2b_1p05: s2 {
> +			regulator-min-microvolt = <1050000>;
> +			regulator-max-microvolt = <1050000>;
> +			regulator-enable-ramp-delay = <200>;
> +			regulator-ramp-delay = <0>;
> +		};
> +
> +		vreg_l2b_2p95: l2 {
> +			/*
> +			 * This regulator supports 1.648 - 3.104V on this board
> +			 * but we set a max voltage of anything less than 2.7V
> +			 * to satisfy a condition in sdhci.c that will disable
> +			 * 3.3V SDHCI signaling, which happens to be not really
> +			 * supported on the Xperia Nile/Ganges platform.
> +			 */

That's not Nile/Ganges ;)


> +			regulator-min-microvolt = <1648000>;
> +			regulator-max-microvolt = <2696000>;
> +			regulator-enable-ramp-delay = <250>;
> +			regulator-ramp-delay = <0>;
> +			regulator-allow-set-load;
> +		};
> +
> +		vreg_l4b_2p95: l4 {
> +			regulator-min-microvolt = <2944000>;
> +			regulator-max-microvolt = <2952000>;
> +			regulator-enable-ramp-delay = <250>;
> +			regulator-ramp-delay = <0>;
> +
> +			regulator-min-microamp = <200>;
> +			regulator-max-microamp = <600000>;
> +			regulator-system-load = <570000>;
> +			regulator-allow-set-load;
> +		};
> +
> +		vreg_l5b_2p95: l5 {
> +			/*
> +			 * Downstream specifies a range of 1721-3600mV,
> +			 * but the only assigned consumers are SDHCI2 VMMC
> +			 * and Coresight QPDI that both request pinned 2.95V.
> +			 * Tighten the range to 1.8-3.328 (closest to 3.3) to
> +			 * make the mmc driver happy.
> +			 */

Please validate whether this voltage mess also concerns your board.


> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <3328000>;
> +			regulator-enable-ramp-delay = <250>;
> +			regulator-ramp-delay = <0>;
> +			regulator-allow-set-load;
> +			regulator-system-load = <800000>;
> +		};
> +
> +		vreg_l8b_3p3: l8 {
> +			regulator-min-microvolt = <2800000>;
> +			regulator-max-microvolt = <3400000>;
> +			regulator-enable-ramp-delay = <250>;
> +			regulator-ramp-delay = <0>;
> +		};
> +
> +		vreg_bob: bob {
> +			regulator-min-microvolt = <3304000>;
> +			regulator-max-microvolt = <3624000>;
> +			regulator-enable-ramp-delay = <500>;
> +			regulator-ramp-delay = <0>;
> +		};
> +	};
> +};
> +
> +&sdhc_1 {
> +	status = "okay";
> +	supports-cqe;
> +
> +	mmc-ddr-1_8v;
> +	mmc-hs400-1_8v;
> +	mmc-hs400-enhanced-strobe;
> +
> +	vmmc-supply = <&vreg_l4b_2p95>;
> +	vqmmc-supply = <&vreg_l8a_1p8>;
> +};
> +
> +&sdhc_2 {
> +	status = "okay";
> +
> +	vmmc-supply = <&vreg_l5b_2p95>;
> +	vqmmc-supply = <&vreg_l2b_2p95>;
> +};
> +
> +&tlmm {
> +	gpio-reserved-ranges = <0 4>, <8 4>;
> +
> +	uart_active: uart-active-state {
> +		pins = "gpio4", "gpio5";
> +		function = "blsp_uart2";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};

That's identical to blsp1_uart2_default from sdm630.dtsi. While I agree

hardcoding pinctrl-names to "default" is a good idea, should a sleep state

be added to the SoC DTSI (so that it doesn't get passed in here unvalidated),

I don't think you need to redefine this one.


> +};
>

Konrad

