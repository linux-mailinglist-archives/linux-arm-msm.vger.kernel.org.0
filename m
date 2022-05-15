Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1059D527850
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 May 2022 16:57:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229608AbiEOO4v (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 15 May 2022 10:56:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237528AbiEOO4j (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 15 May 2022 10:56:39 -0400
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [IPv6:2001:4b7a:2000:18::171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F304193C1;
        Sun, 15 May 2022 07:56:37 -0700 (PDT)
Received: from SoMainline.org (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id AD33C3F261;
        Sun, 15 May 2022 16:56:35 +0200 (CEST)
Date:   Sun, 15 May 2022 16:56:34 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 11/12] arm64: dts: qcom: sdm660: Add initial Inforce
 IFC6560 board support
Message-ID: <20220515145634.6bfbg5ow243ikmai@SoMainline.org>
References: <20220514190138.3179964-1-dmitry.baryshkov@linaro.org>
 <20220514190138.3179964-12-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220514190138.3179964-12-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2022-05-14 22:01:37, Dmitry Baryshkov wrote:
> The IFC6560 is a board from Inforce Computing, built around the SDA660
> SoC. This patch describes core clocks, some regulators from the two
> PMICs, debug uart, storage, bluetooth and audio DSP remoteproc.
> 
> The regulator settings are inherited from prior work by Konrad Dybcio
> and AngeloGioacchino Del Regno.
> 
> Co-developed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

I don't own this board nor a reference manual, but have scrutinized this
patch enough (and compared it against the status-quo in other sd*6**
dts files) to dare and give it my:

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>  .../boot/dts/qcom/sda660-inforce-ifc6560.dts  | 461 ++++++++++++++++++
>  2 files changed, 462 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index f9e6343acd03..5f717fe0e8d0 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -88,6 +88,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sc7280-herobrine-herobrine-r1.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sc7280-idp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sc7280-idp2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sc7280-crd.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= sda660-inforce-ifc6560.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm630-sony-xperia-ganges-kirin.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm630-sony-xperia-nile-discovery.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm630-sony-xperia-nile-pioneer.dtb
> diff --git a/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts b/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts
> new file mode 100644
> index 000000000000..5360b56df045
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts
> @@ -0,0 +1,461 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2021, Linaro Ltd.
> + * Copyright (c) 2020, Konrad Dybcio <konrad.dybcio@somainline.org>
> + * Copyright (c) 2020, AngeloGioacchino Del Regno
> + *                     <angelogioacchino.delregno@somainline.org>

These are only for the regulator configuration, which typically depend
on the board and should not be copied or inherited from a different
board?

- Marijn

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
> +	compatible = "inforce,ifc6560", "qcom,sda660";
> +	chassis-type = "embedded"; /* SBC */
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
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +
> +		volup {
> +			label = "Volume Up";
> +			gpios = <&pm660l_gpios 7 GPIO_ACTIVE_LOW>;
> +			linux,code = <KEY_VOLUMEUP>;
> +			debounce-interval = <15>;
> +		};
> +	};
> +
> +	/*
> +	 * Until we hook up type-c detection, we
> +	 * have to stick with this. But it works.
> +	 */
> +	extcon_usb: extcon-usb {
> +		compatible = "linux,extcon-usb-gpio";
> +		id-gpio = <&tlmm 58 GPIO_ACTIVE_HIGH>;
> +	};
> +
> +	hdmi-out {
> +		compatible = "hdmi-connector";
> +		type = "a";
> +
> +		port {
> +			hdmi_con: endpoint {
> +				remote-endpoint = <&adv7533_out>;
> +			};
> +		};
> +	};
> +
> +	vph_pwr: vph-pwr-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vph_pwr";
> +		regulator-min-microvolt = <3800000>;
> +		regulator-max-microvolt = <3800000>;
> +
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};
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
> +	firmware-name = "qcom/ifc6560/adsp.mbn";
> +};
> +
> +&blsp1_dma {
> +	/*
> +	 * The board will lock up if we toggle the BLSP clock, unless the
> +	 * BAM DMA interconnects support is in place.
> +	 */
> +	/delete-property/ clocks;
> +};
> +
> +&blsp_i2c6 {
> +	status = "okay";
> +
> +	adv7533: hdmi@39 {
> +		compatible = "adi,adv7535";
> +		reg = <0x39>, <0x66>;
> +		reg-names = "main", "edid";
> +
> +		interrupt-parent = <&pm660l_gpios>;
> +		interrupts = <11 IRQ_TYPE_EDGE_FALLING>;
> +
> +		clocks = <&rpmcc RPM_SMD_BB_CLK2>;
> +		clock-names = "cec";
> +		/*
> +		 * Limit to 3 lanes to prevent the bridge from changing amount
> +		 * of lanes in the fly. MSM DSI host doesn't like that.
> +		 */
> +		adi,dsi-lanes = <3>;
> +		avdd-supply = <&vreg_l13a_1p8>;
> +		dvdd-supply = <&vreg_l13a_1p8>;
> +		pvdd-supply = <&vreg_l13a_1p8>;
> +		a2vdd-supply = <&vreg_l13a_1p8>;
> +		v3p3-supply = <&v3p3_bck_bst>;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +
> +				adv7533_in: endpoint {
> +					remote-endpoint = <&dsi0_out>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +
> +				adv7533_out: endpoint {
> +					remote-endpoint = <&hdmi_con>;
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&blsp1_uart2 {
> +	status = "okay";
> +};
> +
> +&blsp2_dma {
> +	/*
> +	 * The board will lock up if we toggle the BLSP clock, unless the
> +	 * BAM DMA interconnects support is in place.
> +	 */
> +	/delete-property/ clocks;
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
> +&dsi0 {
> +	status = "okay";
> +	vdda-supply = <&vreg_l1a_1p225>;
> +};
> +
> +&dsi0_out {
> +	remote-endpoint = <&adv7533_in>;
> +	data-lanes = <0 1 2 3>;
> +};
> +
> +&dsi0_phy {
> +	status = "okay";
> +	vcca-supply = <&vreg_l1b_0p925>;
> +};
> +
> +&mdss {
> +	status = "okay";
> +};
> +
> +&mmss_smmu {
> +	status = "okay";
> +};
> +
> +&pon_pwrkey {
> +	status = "okay";
> +};
> +
> +&pon_resin {
> +	status = "okay";
> +
> +	linux,code = <KEY_VOLUMEUP>;
> +};
> +
> +&qusb2phy0 {
> +	status = "okay";
> +
> +	vdd-supply = <&vreg_l1b_0p925>;
> +	vdda-phy-dpdm-supply = <&vreg_l7b_3p125>;
> +};
> +
> +&qusb2phy1 {
> +	status = "okay";
> +
> +	vdd-supply = <&vreg_l1b_0p925>;
> +	vdda-phy-dpdm-supply = <&vreg_l7b_3p125>;
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
> +			regulator-min-microvolt = <1805000>;
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
> +		vreg_l1a_1p225: l1 {
> +			regulator-min-microvolt = <1150000>;
> +			regulator-max-microvolt = <1250000>;
> +			regulator-enable-ramp-delay = <250>;
> +			regulator-allow-set-load;
> +		};
> +
> +		vreg_l6a_1p3: l6 {
> +			regulator-min-microvolt = <1304000>;
> +			regulator-max-microvolt = <1368000>;
> +			regulator-enable-ramp-delay = <250>;
> +			regulator-ramp-delay = <0>;
> +			regulator-allow-set-load;
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
> +			regulator-always-on;
> +			regulator-boot-on;
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
> +		vreg_l1b_0p925: l1 {
> +			regulator-min-microvolt = <800000>;
> +			regulator-max-microvolt = <925000>;
> +			regulator-enable-ramp-delay = <250>;
> +			regulator-allow-set-load;
> +		};
> +
> +		vreg_l2b_2p95: l2 {
> +			regulator-min-microvolt = <1648000>;
> +			regulator-max-microvolt = <3100000>;
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
> +		/*
> +		 * Downstream specifies a range of 1721-3600mV,
> +		 * but the only assigned consumers are SDHCI2 VMMC
> +		 * and Coresight QPDI that both request pinned 2.95V.
> +		 * Tighten the range to 1.8-3.328 (closest to 3.3) to
> +		 * make the mmc driver happy.
> +		 */
> +		vreg_l5b_2p95: l5 {
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <3328000>;
> +			regulator-enable-ramp-delay = <250>;
> +			regulator-system-load = <800000>;
> +			regulator-ramp-delay = <0>;
> +			regulator-allow-set-load;
> +		};
> +
> +		vreg_l7b_3p125: l7 {
> +			regulator-min-microvolt = <2700000>;
> +			regulator-max-microvolt = <3125000>;
> +			regulator-enable-ramp-delay = <250>;
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
> +			regulator-min-microvolt = <3300000>;
> +			regulator-max-microvolt = <3624000>;
> +			regulator-enable-ramp-delay = <500>;
> +			regulator-ramp-delay = <0>;
> +		};
> +	};
> +};
> +
> +&sdc2_state_on {
> +	sd-cd {
> +		pins = "gpio54";
> +		bias-pull-up;
> +		drive-strength = <2>;
> +	};
> +};
> +
> +&sdc2_state_off {
> +	sd-cd {
> +		pins = "gpio54";
> +		bias-disable;
> +		drive-strength = <2>;
> +	};
> +};
> +
> +&sdhc_1 {
> +	status = "okay";
> +	supports-cqe;
> +
> +	vmmc-supply = <&vreg_l4b_2p95>;
> +	vqmmc-supply = <&vreg_l8a_1p8>;
> +
> +	mmc-ddr-1_8v;
> +	mmc-hs400-1_8v;
> +	mmc-hs400-enhanced-strobe;
> +};
> +
> +&sdhc_2 {
> +	status = "okay";
> +
> +	vmmc-supply = <&vreg_l5b_2p95>;
> +	vqmmc-supply = <&vreg_l2b_2p95>;
> +
> +	cd-gpios = <&tlmm 54 GPIO_ACTIVE_LOW>;
> +	no-sdio;
> +	no-emmc;
> +};
> +
> +&tlmm {
> +	gpio-reserved-ranges = <0 4>, <8 4>;
> +};
> +
> +&usb2 {
> +	status = "okay";
> +};
> +
> +&usb2_dwc3 {
> +	dr_mode = "host";
> +};
> +
> +&usb3 {
> +	status = "okay";
> +};
> +
> +&usb3_dwc3 {
> +	dr_mode = "peripheral";
> +	extcon = <&extcon_usb>;
> +};
> -- 
> 2.35.1
> 
