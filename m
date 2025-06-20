Return-Path: <linux-arm-msm+bounces-61918-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D8EAE2581
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Jun 2025 00:27:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C09971BC69A2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jun 2025 22:27:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2201A23C8C9;
	Fri, 20 Jun 2025 22:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="iVE6Hq+p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD23623C505;
	Fri, 20 Jun 2025 22:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750458022; cv=none; b=WzbIXK1QkR80X4zw+j36Xej/zXUyd6iB2Mp+YCz/IcsT0NIxrjbQSppG251reqhGw5I26PhNouxqI0PqwUSds8qwDqRdYsWNgoRAdG4Kg+XUoWbS78np44IeArq5hgo4Ya7XA7t0vhZ0CK0sXSflxwlCj0BePoKG1PXD6avm9ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750458022; c=relaxed/simple;
	bh=qHB0fqkbMgKmWT614pkeoUg7b5X7upr9aAVqBFaaggw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fzcZd/7XtDmYLGXBf7g7zmbpLmzBd2H50MQxn2wKF2MQNoHiS7VXS2/ya90/yU8XhBrWr/suVvvTnbKGCC/iTemsoVsIlyJuynljv1+HsMVGBZV8e3npMID6obAJoUkh3Ae1G3C6d4lJ84Wnkh6Wfv5YCFMZ65edYE3UBLKJ6ME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=iVE6Hq+p; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1750458012; bh=qHB0fqkbMgKmWT614pkeoUg7b5X7upr9aAVqBFaaggw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=iVE6Hq+pcNg2FfnGNByMbjpvehjarmWT7OQs2GajQbkSynVd2VgMuh/yKdzn7cZAF
	 Wu6tWc9RFvx8Co/hPqQf4zQB/nhDADEcZjMcDyHRkjsejcGFBQji8bEsdD/LaDlxZO
	 Xu2HzcMYCSx75i0o71wK6CmaK1LkMprg+RxjCPXc=
Message-ID: <d4564d4b-9510-47f8-9930-65d3c4e90e6c@lucaweiss.eu>
Date: Sat, 21 Jun 2025 00:20:11 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 3/3] arm64: dts: qcom: msm8953: Add device tree for
 Billion Capture+
Content-Language: en-US
To: cristian_ci@protonmail.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org
References: <20250620-rimob-initial-devicetree-v1-0-8e667ea21f82@protonmail.com>
 <20250620-rimob-initial-devicetree-v1-3-8e667ea21f82@protonmail.com>
From: Luca Weiss <luca@lucaweiss.eu>
In-Reply-To: <20250620-rimob-initial-devicetree-v1-3-8e667ea21f82@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Cristian,

On 20-06-2025 11:51 p.m., Cristian Cozzolino via B4 Relay wrote:
> From: Cristian Cozzolino <cristian_ci@protonmail.com>
> 
> Billion Capture+ (flipkart,rimob) is a smartphone released in 2017, based
> on Snapdragon 625 (MSM8953) SoC.
> 
> Add a device tree with initial support for:
> 
> - GPIO keys
> - SDHCI (internal and external storage)
> - USB Device Mode
> - Regulators
> - Simple framebuffer

Thanks for sending this upstream!

> 
> Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
> ---
>   arch/arm64/boot/dts/qcom/Makefile                  |   1 +
>   .../arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts | 251 +++++++++++++++++++++
>   2 files changed, 252 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 140b0b2abfb555b8ef61bd9ed0217d8997800809..af3757ca017b6e3d8c579e43f647a71fc64c62b3 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -70,6 +70,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8939-samsung-a7.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= msm8939-sony-xperia-kanuti-tulip.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= msm8939-wingtech-wt82918.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= msm8939-wingtech-wt82918hd.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= msm8953-flipkart-rimob.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= msm8953-motorola-potter.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= msm8953-xiaomi-daisy.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= msm8953-xiaomi-mido.dtb
> diff --git a/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts b/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts
> new file mode 100644
> index 0000000000000000000000000000000000000000..9fc58bb4dae7b463691659f8e84a634529642b69
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts
> @@ -0,0 +1,251 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2025, Cristian Cozzolino
> + */
> +/dts-v1/;
> +
> +#include "msm8953.dtsi"
> +#include "pm8953.dtsi"
> +#include "pmi8950.dtsi"
> +
> +/delete-node/ &cont_splash_mem;
> +/delete-node/ &qseecom_mem;
> +
> +/ {
> +	model = "Billion Capture+";
> +	compatible = "flipkart,rimob", "qcom,msm8953";
> +	chassis-type = "handset";
> +	qcom,msm-id = <293 0>;
> +	qcom,board-id = <0x340008 0>;
> +
> +	chosen {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		framebuffer@90001000 {
> +			compatible = "simple-framebuffer";
> +			reg = <0 0x90001000 0 (1920 * 1080 * 3)>;
> +
> +			width = <1080>;
> +			height = <1920>;
> +			stride = <(1080 * 3)>;
> +			format = "r8g8b8";
> +
> +			power-domains = <&gcc MDSS_GDSC>;
> +
> +			clocks = <&gcc GCC_MDSS_AHB_CLK>,
> +				 <&gcc GCC_MDSS_AXI_CLK>,
> +				 <&gcc GCC_MDSS_VSYNC_CLK>,
> +				 <&gcc GCC_MDSS_MDP_CLK>,
> +				 <&gcc GCC_MDSS_BYTE0_CLK>,
> +				 <&gcc GCC_MDSS_PCLK0_CLK>,
> +				 <&gcc GCC_MDSS_ESC0_CLK>;
> +		};
> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&gpio_key_default>;
> +
> +		key-volume-up {
> +			label = "Volume Up";
> +			gpios = <&tlmm 85 GPIO_ACTIVE_LOW>;
> +			linux,code = <KEY_VOLUMEUP>;
> +			debounce-interval = <15>;
> +		};
> +	};
> +
> +	reserved-memory {
> +		qseecom@0 {

qseecom@84a00000 ?

> +			reg = <0x00 0x84a00000 0x00 0x1900000>;
> +			no-map;
> +		};
> +
> +		cont_splash_mem: cont-splash@90001000 {
> +			reg = <0x0 0x90001000 0x0 (1080 * 1920 * 3)>;
> +			no-map;
> +		};
> +	};
> +
> +	vph_pwr: vph-pwr-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vph_pwr";
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};
> +};
> +
> +
> +&hsusb_phy {
> +	vdd-supply = <&pm8953_l3>;
> +	vdda-pll-supply = <&pm8953_l7>;
> +	vdda-phy-dpdm-supply = <&pm8953_l13>;
> +
> +	status = "okay";
> +};
> +
> +&pm8953_resin {
> +	linux,code = <KEY_VOLUMEDOWN>;
> +	status = "okay";
> +};
> +
> +&rpm_requests {
> +	regulators {
> +		compatible = "qcom,rpm-pm8953-regulators";
> +		vdd_s1-supply = <&vph_pwr>;
> +		vdd_s2-supply = <&vph_pwr>;
> +		vdd_s3-supply = <&vph_pwr>;
> +		vdd_s4-supply = <&vph_pwr>;
> +		vdd_s5-supply = <&vph_pwr>;
> +		vdd_s6-supply = <&vph_pwr>;
> +		vdd_s7-supply = <&vph_pwr>;
> +		vdd_l1-supply = <&pm8953_s3>;
> +		vdd_l2_l3-supply = <&pm8953_s3>;
> +		vdd_l4_l5_l6_l7_l16_l19-supply = <&pm8953_s4>;
> +		vdd_l8_l11_l12_l13_l14_l15-supply = <&vph_pwr>;
> +		vdd_l9_l10_l17_l18_l22-supply = <&vph_pwr>;
> +		vdd_l23-supply = <&pm8953_s3>;
> +
> +		pm8953_s1: s1 {
> +			regulator-min-microvolt = <870000>;
> +			regulator-max-microvolt = <1156000>;
> +		};
> +
> +		pm8953_s3: s3 {
> +			regulator-min-microvolt = <1224000>;
> +			regulator-max-microvolt = <1224000>;
> +		};
> +
> +		pm8953_s4: s4 {
> +			regulator-min-microvolt = <1900000>;
> +			regulator-max-microvolt = <2050000>;
> +		};
> +
> +		pm8953_l1: l1 {
> +			regulator-min-microvolt = <1000000>;
> +			regulator-max-microvolt = <1000000>;
> +		};
> +
> +		pm8953_l2: l2 {
> +			regulator-min-microvolt = <975000>;
> +			regulator-max-microvolt = <1225000>;
> +		};
> +
> +		pm8953_l3: l3 {
> +			regulator-min-microvolt = <925000>;
> +			regulator-max-microvolt = <925000>;
> +		};
> +
> +		pm8953_l5: l5 {
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +		};
> +
> +		pm8953_l6: l6 {
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +		};
> +
> +		pm8953_l7: l7 {
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1900000>;
> +		};
> +
> +		pm8953_l8: l8 {
> +			regulator-min-microvolt = <2900000>;
> +			regulator-max-microvolt = <2900000>;
> +		};
> +
> +		pm8953_l9: l9 {
> +			regulator-min-microvolt = <3000000>;
> +			regulator-max-microvolt = <3300000>;
> +		};
> +
> +		pm8953_l10: l10 {
> +			regulator-min-microvolt = <2850000>;
> +			regulator-max-microvolt = <2850000>;
> +		};
> +
> +		pm8953_l11: l11 {
> +			regulator-min-microvolt = <2950000>;
> +			regulator-max-microvolt = <2950000>;
> +		};
> +
> +		pm8953_l12: l12 {
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <2950000>;
> +		};
> +
> +		pm8953_l13: l13 {
> +			regulator-min-microvolt = <3125000>;
> +			regulator-max-microvolt = <3125000>;
> +		};
> +
> +		pm8953_l16: l16 {
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +		};
> +
> +		pm8953_l17: l17 {
> +			regulator-min-microvolt = <2850000>;
> +			regulator-max-microvolt = <2850000>;
> +		};
> +
> +		pm8953_l19: l19 {
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1350000>;
> +		};
> +
> +		pm8953_l22: l22 {
> +			regulator-min-microvolt = <2800000>;
> +			regulator-max-microvolt = <2800000>;
> +		};
> +
> +		pm8953_l23: l23 {
> +			regulator-min-microvolt = <975000>;
> +			regulator-max-microvolt = <1225000>;
> +		};
> +	};
> +};
> +
> +&sdhc_1 {
> +	vmmc-supply = <&pm8953_l8>;
> +	vqmmc-supply = <&pm8953_l5>;
> +
> +	status = "okay";
> +};
> +
> +&sdhc_2 {
> +	vmmc-supply = <&pm8953_l11>;
> +	vqmmc-supply = <&pm8953_l12>;
> +
> +	cd-gpios = <&tlmm 133 GPIO_ACTIVE_HIGH>;
> +
> +	pinctrl-0 = <&sdc2_clk_on &sdc2_cmd_on &sdc2_data_on &sdc2_cd_on>;
> +	pinctrl-1 = <&sdc2_clk_off &sdc2_cmd_off &sdc2_data_off>;
> +	pinctrl-names = "default", "sleep";
> +
> +	status = "okay";
> +};
> +
> +&tlmm {
> +	gpio-reserved-ranges = <0 4>, <135 4>;

Any ideas what's connected to these pins? If you do, good to document 
this like in other devices.

Regards
Luca

> +
> +	gpio_key_default: gpio-key-default-state {
> +		pins = "gpio85";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-pull-up;
> +	};
> +};
> +
> +&usb3 {
> +	status = "okay";
> +};
> +
> +&usb3_dwc3 {
> +	dr_mode = "peripheral";
> +};
> 


