Return-Path: <linux-arm-msm+bounces-30008-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C4D964442
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 14:20:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A1361F2582D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 12:20:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C54F01922FA;
	Thu, 29 Aug 2024 12:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b="1D5KKkuu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from box.trvn.ru (box.trvn.ru [194.87.146.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512F544C77
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 12:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.87.146.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724933996; cv=none; b=QiYDQ6Gq+MqAqr7K/HY+gv4K1kNXWTi18B+Cxa78i/D19v52eegWbWGxHcwgzmvg3XcxySiowNSZz03JoiFsZbaxuEuROOJgV0Po9M17q4aw4uV9FLbzsEc2ayCgDoTjoLRnyeENLra2WTAXTtvc3GRC1Wh9Jivwd+t9k299KOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724933996; c=relaxed/simple;
	bh=nLeZpf51VIISaGVQzcZ5J/NRn/Q1+585tiwqkyJYJJE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aiCfeK8B53HoVz5jsSjH9fN9LIAgz10MEve4D85kMQVT5SRKEXwpZ2yJxvniaTsLZK9XBaTqLFiZvgj6p4fhX4foXtLxkm5nTvtyoEBhFmoKE1yK9qbaBGsirVJY5/uVdVrARh4z0vPSjNo0Mg/iBlkfmmGoggj3R3Ixf2liY3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru; spf=pass smtp.mailfrom=trvn.ru; dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b=1D5KKkuu; arc=none smtp.client-ip=194.87.146.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trvn.ru
Received: from authenticated-user (box.trvn.ru [194.87.146.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by box.trvn.ru (Postfix) with ESMTPSA id 55A13409E7;
	Thu, 29 Aug 2024 17:11:51 +0500 (+05)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=trvn.ru; s=mail;
	t=1724933512; bh=nLeZpf51VIISaGVQzcZ5J/NRn/Q1+585tiwqkyJYJJE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=1D5KKkuuhjo2fqYMIDUAlEMOh+YqcjIfgbVVot9rb30GnsZUZdIgeGpooeR7/zZB7
	 VrfuW6eqABEhur9jILSVXOQcV0rilTZyp1Fb6gAz5dFajt0FqO+6v/5Oc4p3obqSiw
	 Cn8dtLcsn2Sg4iS5Bp3NNzhDbXiDD89tB5ucEtUiaRA8Q1w0Al0SaYcZVemoO+1579
	 pp+nGfyPyu2ctosoEXrRfuyXADgpJM38Y7EFQnFypcBY5af/OyEU3zJCZEL/SnrYv4
	 KQcPSeVVSdV0/w5X4lb7dKeCKMUasbId/yd7K6NokgvwBDOiLMEkg7hNoYXZLLpA8z
	 xtFpS+TqmLX3A==
Date: Thu, 29 Aug 2024 17:11:37 +0500
From: Nikita Travkin <nikita@trvn.ru>
To: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Merck Hung <merckhung@gmail.com>
Subject: Re: [PATCH v1] arm64: dts: qcom: sc8280xp-wdk2023: dt definition for
 WDK2023
Message-ID: <m63odsi6rz5n6q3pgn4ra7ykrzuslzo57j2i3zh7pxp7xlsbsq@xbxxuganc5f2>
References: <5f5487e1-e458-4a3a-af02-c52e50ca1964@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5f5487e1-e458-4a3a-af02-c52e50ca1964@oldschoolsolutions.biz>

Hi! Amazing to see this device submitted! See few comments below

On Thu, Aug 29, 2024 at 01:47:13PM GMT, Jens Glathe wrote:
> "Microsoft Windows Dev Kit 2023" aka "Blackrock" aka "Project Volterra"
> 
> Device tree for the Windows Dev Kit 2023. This work
> is based on the initial work of Merck Hung <merckhung@gmail.com>.
> 

I believe you wanted to add

Co-developed-by: Merck Hung <merckhung@gmail.com>

and perhaps move these historical notes under --- at the end of the
commit message?

> Original work: https://github.com/merckhung/linux_ms_dev_kit/blob/ms-dev-kit-2023-v6.3.0/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-dev-kit-2023.dts
> 
> This dt is more or less deducted from the Thinkpad X13s.
> It contains a lot of guesswork, and also a lot of research on
> what works with the Windows Dev Kit.
> 
> It is in use and under development since May 2023, pretty stable now.
> 
> Signed-off-by: Merck Hung <merckhung@gmail.com>
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---
> �arch/arm64/boot/dts/qcom/Makefile������������ |��� 1 +
> �.../dts/qcom/sc8280xp-microsoft-blackrock.dts | 1334 +++++++++++++++++
> �2 files changed, 1335 insertions(+)
> �create mode 100644
> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile
> b/arch/arm64/boot/dts/qcom/Makefile
> index 197ab325c0b9e..d71d87abdb3fb 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -191,6 +191,7 @@ dtb-$(CONFIG_ARCH_QCOM)��� += sc8180x-lenovo-flex-5g.dtb
> �dtb-$(CONFIG_ARCH_QCOM)��� += sc8180x-primus.dtb
> �dtb-$(CONFIG_ARCH_QCOM)��� += sc8280xp-crd.dtb
> �dtb-$(CONFIG_ARCH_QCOM)��� += sc8280xp-lenovo-thinkpad-x13s.dtb
> +dtb-$(CONFIG_ARCH_QCOM)��� += sc8280xp-microsoft-blackrock.dtb
> �dtb-$(CONFIG_ARCH_QCOM)��� += sda660-inforce-ifc6560.dtb
> �dtb-$(CONFIG_ARCH_QCOM)��� += sdm450-lenovo-tbx605f.dtb
> �dtb-$(CONFIG_ARCH_QCOM)��� += sdm450-motorola-ali.dtb
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts
> b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts
> new file mode 100644
> index 0000000000000..af28897f0de3d
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts
> @@ -0,0 +1,1334 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2021, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2022, Linaro Limited
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/iio/qcom,spmi-adc7-pm8350.h>
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/gpio-keys.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +
> +#include "sc8280xp.dtsi"
> +#include "sc8280xp-pmics.dtsi"
> +
> +/ {
> +��� model = "Windows Dev Kit 2023";

Maybe "Microsoft Windows..."?

> +��� compatible = "microsoft,win-dev-kit-2023", "qcom,sc8280xp";

I think you want to document this compatible... Have you run
checkpatch.pl and make dtbs_check on this patch?

> +
> +��� aliases {
> +��� ��� i2c4 = &i2c4;
> +��� ��� i2c21 = &i2c21;
> +��� ��� serial1 = &uart2;
> +��� };
> +
> +��� wcd938x: audio-codec {
> +��� ��� compatible = "qcom,wcd9380-codec";
> +
> +��� ��� pinctrl-names = "default";
> +��� ��� pinctrl-0 = <&wcd_default>;

In all instances, -names usually comes after -N.

> +
> +��� ��� reset-gpios = <&tlmm 106 GPIO_ACTIVE_LOW>;
> +
> +��� ��� vdd-buck-supply = <&vreg_s10b>;
> +��� ��� vdd-rxtx-supply = <&vreg_s10b>;
> +��� ��� vdd-io-supply = <&vreg_s10b>;
> +��� ��� vdd-mic-bias-supply = <&vreg_bob>;
> +
> +��� ��� qcom,micbias1-microvolt = <1800000>;
> +��� ��� qcom,micbias2-microvolt = <1800000>;
> +��� ��� qcom,micbias3-microvolt = <1800000>;
> +��� ��� qcom,micbias4-microvolt = <1800000>;
> +��� ��� qcom,mbhc-buttons-vthreshold-microvolt = <75000 150000 237000
> 500000 500000 500000 500000 500000>;

This seems like this patch is indented with spaces and folded, any chance
your MTA corrupted it?

> +��� ��� qcom,mbhc-headset-vthreshold-microvolt = <1700000>;
> +��� ��� qcom,mbhc-headphone-vthreshold-microvolt = <50000>;
> +��� ��� qcom,rx-device = <&wcd_rx>;
> +��� ��� qcom,tx-device = <&wcd_tx>;
> +
> +��� ��� #sound-dai-cells = <1>;
> +��� };
> +
> +��� firmware {
> +��� ��� qseecom {
> +��� ��� ��� compatible = "qcom,qseecom-sc8280xp", "qcom,qseecom";
> +��� ��� ��� qcom,scm = <&scm>;
> +��� ��� };
> +��� };
> +
> +��� pmic-glink {
> +��� ��� compatible = "qcom,sc8280xp-pmic-glink", "qcom,pmic-glink";
> +
> +��� ��� #address-cells = <1>;
> +��� ��� #size-cells = <0>;
> +��� ��� orientation-gpios = <&tlmm 166 GPIO_ACTIVE_HIGH>,
> +��� ��� ��� ��� ��� <&tlmm 49 GPIO_ACTIVE_HIGH>;
> +
> +��� ��� connector@0 {
> +��� ��� ��� compatible = "usb-c-connector";
> +��� ��� ��� reg = <0>;
> +��� ��� ��� power-role = "source";
> +��� ��� ��� data-role = "dual";
> +
> +��� ��� ��� ports {
> +��� ��� ��� ��� #address-cells = <1>;
> +��� ��� ��� ��� #size-cells = <0>;
> +
> +��� ��� ��� ��� port@0 {
> +��� ��� ��� ��� ��� reg = <0>;
> +
> +��� ��� ��� ��� ��� pmic_glink_con0_hs: endpoint {
> +��� ��� ��� ��� ��� ��� remote-endpoint = <&usb_0_dwc3_hs>;
> +��� ��� ��� ��� ��� };
> +��� ��� ��� ��� };
> +
> +��� ��� ��� ��� port@1 {
> +��� ��� ��� ��� ��� reg = <1>;
> +
> +��� ��� ��� ��� ��� pmic_glink_con0_ss: endpoint {
> +��� ��� ��� ��� ��� ��� remote-endpoint = <&usb_0_qmpphy_out>;
> +��� ��� ��� ��� ��� };
> +��� ��� ��� ��� };
> +
> +��� ��� ��� ��� port@2 {
> +��� ��� ��� ��� ��� reg = <2>;
> +
> +��� ��� ��� ��� ��� pmic_glink_con0_sbu: endpoint {
> +��� ��� ��� ��� ��� ��� remote-endpoint = <&usb0_sbu_mux>;
> +��� ��� ��� ��� ��� };
> +��� ��� ��� ��� };
> +��� ��� ��� };
> +��� ��� };
> +
> +��� ��� connector@1 {
> +��� ��� ��� compatible = "usb-c-connector";
> +��� ��� ��� reg = <1>;
> +��� ��� ��� power-role = "source";
> +��� ��� ��� data-role = "dual";
> +
> +��� ��� ��� ports {
> +��� ��� ��� ��� #address-cells = <1>;
> +��� ��� ��� ��� #size-cells = <0>;
> +��� ��� ��� ��� port@0 {
> +��� ��� ��� ��� ��� reg = <0>;
> +
> +��� ��� ��� ��� ��� pmic_glink_con1_hs: endpoint {
> +��� ��� ��� ��� ��� ��� remote-endpoint = <&usb_1_dwc3_hs>;
> +��� ��� ��� ��� ��� };
> +��� ��� ��� ��� };
> +
> +��� ��� ��� ��� port@1 {
> +��� ��� ��� ��� ��� reg = <1>;
> +
> +��� ��� ��� ��� ��� pmic_glink_con1_ss: endpoint {
> +��� ��� ��� ��� ��� ��� remote-endpoint = <&usb_1_qmpphy_out>;
> +��� ��� ��� ��� ��� };
> +��� ��� ��� ��� };
> +
> +��� ��� ��� ��� port@2 {
> +��� ��� ��� ��� ��� reg = <2>;
> +
> +��� ��� ��� ��� ��� pmic_glink_con1_sbu: endpoint {
> +��� ��� ��� ��� ��� ��� remote-endpoint = <&usb1_sbu_mux>;
> +��� ��� ��� ��� ��� };
> +��� ��� ��� ��� };
> +��� ��� ��� };
> +��� ��� };
> +��� };
> +
> +��� dp1-connector@0 {
> +��� ��� compatible = "dp-connector";
> +��� ��� label = "DP1";
> +��� ��� type = "mini";
> +
> +��� ��� dp-pwr-supply = <&vreg_misc_3p3>;
> +
> +��� ��� //hpd-gpios = <&tlmm 2 GPIO_ACTIVE_HIGH>;

Is there a reason this is commented out?

> +
> +��� ��� port {
> +��� ��� ��� dp1_connector_in: endpoint {
> +��� ��� ��� ��� remote-endpoint = <&mdss0_dp2_phy_out>;
> +��� ��� ��� };
> +��� ��� };
> +��� };
> +
> +��� vreg_misc_3p3: regulator-misc-3p3 {
> +��� ��� compatible = "regulator-fixed";
> +
> +��� ��� regulator-name = "VCC3B";
> +��� ��� regulator-min-microvolt = <3300000>;
> +��� ��� regulator-max-microvolt = <3300000>;
> +
> +��� ��� gpio = <&pmc8280_1_gpios 1 GPIO_ACTIVE_HIGH>;
> +��� ��� enable-active-high;
> +
> +��� ��� pinctrl-names = "default";
> +��� ��� pinctrl-0 = <&misc_3p3_reg_en>;
> +
> +��� ��� regulator-boot-on;
> +��� ��� regulator-always-on;
> +��� };
> +
> +��� vreg_nvme: regulator-nvme {
> +��� ��� compatible = "regulator-fixed";
> +
> +��� ��� regulator-name = "VCC3_SSD";
> +��� ��� regulator-min-microvolt = <3300000>;
> +��� ��� regulator-max-microvolt = <3300000>;
> +
> +��� ��� gpio = <&tlmm 135 GPIO_ACTIVE_HIGH>;
> +��� ��� enable-active-high;
> +
> +��� ��� pinctrl-names = "default";
> +��� ��� pinctrl-0 = <&nvme_reg_en>;
> +
> +��� ��� regulator-boot-on;
> +��� };
> +
> +��� vreg_vph_pwr: regulator-vph-pwr {
> +��� ��� compatible = "regulator-fixed";
> +
> +��� ��� regulator-name = "VPH_VCC3R9";
> +��� ��� regulator-min-microvolt = <3900000>;
> +��� ��� regulator-max-microvolt = <3900000>;
> +
> +��� ��� regulator-always-on;
> +��� };
> +
> +��� vreg_wlan: regulator-wlan {
> +��� ��� compatible = "regulator-fixed";
> +
> +��� ��� regulator-name = "VCC_WLAN_3R9";
> +��� ��� regulator-min-microvolt = <3900000>;
> +��� ��� regulator-max-microvolt = <3900000>;
> +
> +��� ��� gpio = <&pmr735a_gpios 1 GPIO_ACTIVE_HIGH>;
> +��� ��� enable-active-high;
> +
> +��� ��� pinctrl-names = "default";
> +��� ��� pinctrl-0 = <&hastings_reg_en>;
> +
> +��� ��� regulator-boot-on;
> +��� };
> +
> +��� vreg_wwan: regulator-wwan {
> +��� ��� compatible = "regulator-fixed";
> +
> +��� ��� regulator-name = "VCC3B_WAN";
> +��� ��� regulator-min-microvolt = <3300000>;
> +��� ��� regulator-max-microvolt = <3300000>;
> +
> +��� ��� gpio = <&pmc8280_2_gpios 1 GPIO_ACTIVE_HIGH>;
> +��� ��� enable-active-high;
> +
> +��� ��� pinctrl-names = "default";
> +��� ��� pinctrl-0 = <&wwan_sw_en>;
> +
> +��� ��� regulator-boot-on;
> +��� };
> +
> +��� reserved-memory {
> +��� ��� gpu_mem: gpu-mem@8bf00000 {
> +��� ��� ��� reg = <0 0x8bf00000 0 0x2000>;
> +��� ��� ��� no-map;
> +��� ��� };
> +
> +��� ��� linux,cma {
> +��� ��� ��� compatible = "shared-dma-pool";
> +��� ��� ��� size = <0x0 0x8000000>;
> +��� ��� ��� reusable;
> +��� ��� ��� linux,cma-default;
> +��� ��� };
> +��� };
> +
> +��� usb0-sbu-mux {
> +��� ��� compatible = "pericom,pi3usb102", "gpio-sbu-mux";
> +
> +��� ��� enable-gpios = <&tlmm 101 GPIO_ACTIVE_LOW>;
> +��� ��� select-gpios = <&tlmm 164 GPIO_ACTIVE_HIGH>;
> +
> +��� ��� pinctrl-names = "default";
> +��� ��� pinctrl-0 = <&usb0_sbu_default>;
> +
> +��� ��� mode-switch;
> +��� ��� orientation-switch;
> +
> +��� ��� port {
> +��� ��� ��� usb0_sbu_mux: endpoint {
> +��� ��� ��� ��� remote-endpoint = <&pmic_glink_con0_sbu>;
> +��� ��� ��� };
> +��� ��� };
> +��� };
> +
> +��� usb1-sbu-mux {
> +��� ��� compatible = "pericom,pi3usb102", "gpio-sbu-mux";
> +
> +��� ��� enable-gpios = <&tlmm 48 GPIO_ACTIVE_LOW>;
> +��� ��� select-gpios = <&tlmm 47 GPIO_ACTIVE_HIGH>;
> +
> +��� ��� pinctrl-names = "default";
> +��� ��� pinctrl-0 = <&usb1_sbu_default>;
> +
> +��� ��� mode-switch;
> +��� ��� orientation-switch;
> +
> +��� ��� port {
> +��� ��� ��� usb1_sbu_mux: endpoint {
> +��� ��� ��� ��� remote-endpoint = <&pmic_glink_con1_sbu>;
> +��� ��� ��� };
> +��� ��� };
> +��� };
> +};
> +
> +&apps_rsc {
> +��� regulators-0 {
> +��� ��� compatible = "qcom,pm8350-rpmh-regulators";
> +��� ��� qcom,pmic-id = "b";
> +
> +��� ��� vdd-s10-supply = <&vreg_vph_pwr>;
> +��� ��� vdd-s11-supply = <&vreg_vph_pwr>;
> +��� ��� vdd-s12-supply = <&vreg_vph_pwr>;
> +��� ��� vdd-l1-l4-supply = <&vreg_s12b>;
> +��� ��� vdd-l2-l7-supply = <&vreg_bob>;
> +��� ��� vdd-l3-l5-supply = <&vreg_s11b>;
> +��� ��� vdd-l6-l9-l10-supply = <&vreg_s12b>;
> +��� ��� vdd-l8-supply = <&vreg_s12b>;
> +
> +��� ��� vreg_s10b: smps10 {
> +��� ��� ��� regulator-name = "vreg_s10b";
> +��� ��� ��� regulator-min-microvolt = <1800000>;
> +��� ��� ��� regulator-max-microvolt = <1800000>;
> +��� ��� ��� regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +��� ��� ��� regulator-always-on;
> +��� ��� };
> +
> +��� ��� vreg_s11b: smps11 {
> +��� ��� ��� regulator-name = "vreg_s11b";
> +��� ��� ��� regulator-min-microvolt = <1272000>;
> +��� ��� ��� regulator-max-microvolt = <1272000>;
> +��� ��� ��� regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +��� ��� ��� regulator-always-on;
> +��� ��� };
> +
> +��� ��� vreg_s12b: smps12 {
> +��� ��� ��� regulator-name = "vreg_s12b";
> +��� ��� ��� regulator-min-microvolt = <984000>;
> +��� ��� ��� regulator-max-microvolt = <984000>;
> +��� ��� ��� regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +��� ��� ��� regulator-always-on;
> +��� ��� };
> +
> +��� ��� vreg_l1b: ldo1 {
> +��� ��� ��� regulator-name = "vreg_l1b";
> +��� ��� ��� regulator-min-microvolt = <912000>;
> +��� ��� ��� regulator-max-microvolt = <912000>;
> +��� ��� ��� regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +��� ��� };
> +
> +��� ��� vreg_l3b: ldo3 {
> +��� ��� ��� regulator-name = "vreg_l3b";
> +��� ��� ��� regulator-min-microvolt = <1200000>;
> +��� ��� ��� regulator-max-microvolt = <1200000>;
> +��� ��� ��� regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +��� ��� ��� regulator-boot-on;
> +��� ��� };
> +
> +��� ��� vreg_l4b: ldo4 {
> +��� ��� ��� regulator-name = "vreg_l4b";
> +��� ��� ��� regulator-min-microvolt = <912000>;
> +��� ��� ��� regulator-max-microvolt = <912000>;
> +��� ��� ��� regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +��� ��� };
> +
> +��� ��� vreg_l6b: ldo6 {
> +��� ��� ��� regulator-name = "vreg_l6b";
> +��� ��� ��� regulator-min-microvolt = <880000>;
> +��� ��� ��� regulator-max-microvolt = <880000>;
> +��� ��� ��� regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +��� ��� ��� regulator-boot-on;
> +��� ��� };
> +��� };
> +
> +��� regulators-1 {
> +��� ��� compatible = "qcom,pm8350c-rpmh-regulators";
> +��� ��� qcom,pmic-id = "c";
> +
> +��� ��� vdd-bob-supply = <&vreg_vph_pwr>;
> +��� ��� vdd-l1-l12-supply = <&vreg_s1c>;
> +��� ��� vdd-l2-l8-supply = <&vreg_s1c>;
> +��� ��� vdd-l3-l4-l5-l7-l13-supply = <&vreg_bob>;
> +��� ��� vdd-l6-l9-l11-supply = <&vreg_bob>;
> +��� ��� vdd-l10-supply = <&vreg_s11b>;
> +
> +��� ��� vreg_s1c: smps1 {
> +��� ��� ��� regulator-name = "vreg_s1c";
> +��� ��� ��� regulator-min-microvolt = <1880000>;
> +��� ��� ��� regulator-max-microvolt = <1900000>;
> +��� ��� ��� regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +��� ��� ��� regulator-always-on;
> +��� ��� };
> +
> +��� ��� vreg_l1c: ldo1 {
> +��� ��� ��� regulator-name = "vreg_l1c";
> +��� ��� ��� regulator-min-microvolt = <1800000>;
> +��� ��� ��� regulator-max-microvolt = <1800000>;
> +��� ��� ��� regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +��� ��� };
> +
> +��� ��� vreg_l6c: ldo6 {
> +��� ��� ��� regulator-name = "vreg_l6c";
> +��� ��� ��� regulator-min-microvolt = <1800000>;
> +��� ��� ��� regulator-max-microvolt = <2960000>;
> +��� ��� ��� regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +��� ��� };
> +
> +��� ��� vreg_l7c: ldo7 {
> +��� ��� ��� regulator-name = "vreg_l7c";
> +��� ��� ��� regulator-min-microvolt = <2504000>;
> +��� ��� ��� regulator-max-microvolt = <2504000>;
> +��� ��� ��� regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +��� ��� ��� regulator-allow-set-load;
> +��� ��� ��� regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +��� ��� ��� ��� ��� ��� �� RPMH_REGULATOR_MODE_HPM>;
> +��� ��� };
> +
> +��� ��� vreg_l8c: ldo8 {
> +��� ��� ��� regulator-name = "vreg_l8c";
> +��� ��� ��� regulator-min-microvolt = <1800000>;
> +��� ��� ��� regulator-max-microvolt = <1800000>;
> +��� ��� ��� regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +��� ��� };
> +
> +��� ��� vreg_l9c: ldo9 {
> +��� ��� ��� regulator-name = "vreg_l9c";
> +��� ��� ��� regulator-min-microvolt = <2960000>;
> +��� ��� ��� regulator-max-microvolt = <2960000>;
> +��� ��� ��� regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +��� ��� };
> +
> +��� ��� vreg_l12c: ldo12 {
> +��� ��� ��� regulator-name = "vreg_l12c";
> +��� ��� ��� regulator-min-microvolt = <1800000>;
> +��� ��� ��� regulator-max-microvolt = <1800000>;
> +��� ��� ��� regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +��� ��� };
> +
> +��� ��� vreg_l13c: ldo13 {
> +��� ��� ��� regulator-name = "vreg_l13c";
> +��� ��� ��� regulator-min-microvolt = <3072000>;
> +��� ��� ��� regulator-max-microvolt = <3072000>;
> +��� ��� ��� regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +��� ��� };
> +
> +��� ��� vreg_bob: bob {
> +��� ��� ��� regulator-name = "vreg_bob";
> +��� ��� ��� regulator-min-microvolt = <3008000>;
> +��� ��� ��� regulator-max-microvolt = <3960000>;
> +��� ��� ��� regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
> +��� ��� ��� regulator-always-on;
> +��� ��� };
> +��� };
> +
> +��� regulators-2 {
> +��� ��� compatible = "qcom,pm8350-rpmh-regulators";
> +��� ��� qcom,pmic-id = "d";
> +
> +��� ��� vdd-l1-l4-supply = <&vreg_s11b>;
> +��� ��� vdd-l2-l7-supply = <&vreg_bob>;
> +��� ��� vdd-l3-l5-supply = <&vreg_s11b>;
> +��� ��� vdd-l6-l9-l10-supply = <&vreg_s12b>;
> +��� ��� vdd-l8-supply = <&vreg_s12b>;
> +
> +��� ��� vreg_l2d: ldo2 {
> +��� ��� ��� regulator-name = "vreg_l2d";
> +��� ��� ��� regulator-min-microvolt = <3072000>;
> +��� ��� ��� regulator-max-microvolt = <3072000>;
> +��� ��� ��� regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +��� ��� };
> +
> +��� ��� vreg_l3d: ldo3 {
> +��� ��� ��� regulator-name = "vreg_l3d";
> +��� ��� ��� regulator-min-microvolt = <1200000>;
> +��� ��� ��� regulator-max-microvolt = <1200000>;
> +��� ��� ��� regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +��� ��� ��� regulator-allow-set-load;
> +��� ��� ��� regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +��� ��� ��� ��� ��� ��� �� RPMH_REGULATOR_MODE_HPM>;
> +��� ��� };
> +
> +��� ��� vreg_l4d: ldo4 {
> +��� ��� ��� regulator-name = "vreg_l4d";
> +��� ��� ��� regulator-min-microvolt = <1200000>;
> +��� ��� ��� regulator-max-microvolt = <1200000>;
> +��� ��� ��� regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +��� ��� };
> +
> +��� ��� vreg_l6d: ldo6 {
> +��� ��� ��� regulator-name = "vreg_l6d";
> +��� ��� ��� regulator-min-microvolt = <880000>;
> +��� ��� ��� regulator-max-microvolt = <880000>;
> +��� ��� ��� regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +��� ��� };
> +
> +��� ��� vreg_l7d: ldo7 {
> +��� ��� ��� regulator-name = "vreg_l7d";
> +��� ��� ��� regulator-min-microvolt = <3072000>;
> +��� ��� ��� regulator-max-microvolt = <3072000>;
> +��� ��� ��� regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +��� ��� };
> +
> +��� ��� vreg_l8d: ldo8 {
> +��� ��� ��� regulator-name = "vreg_l8d";
> +��� ��� ��� regulator-min-microvolt = <912000>;
> +��� ��� ��� regulator-max-microvolt = <912000>;
> +��� ��� ��� regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +��� ��� };
> +
> +��� ��� vreg_l9d: ldo9 {
> +��� ��� ��� regulator-name = "vreg_l9d";
> +��� ��� ��� regulator-min-microvolt = <912000>;
> +��� ��� ��� regulator-max-microvolt = <912000>;
> +��� ��� ��� regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +��� ��� };
> +
> +��� ��� vreg_l10d: ldo10 {
> +��� ��� ��� regulator-name = "vreg_l10d";
> +��� ��� ��� regulator-min-microvolt = <912000>;
> +��� ��� ��� regulator-max-microvolt = <912000>;
> +��� ��� ��� regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +��� ��� };
> +��� };
> +};
> +
> +&dispcc0 {
> +��� status = "okay";
> +};
> +
> +&gpu {
> +��� status = "okay";
> +
> +��� zap-shader {
> +��� ��� memory-region = <&gpu_mem>;
> +��� ��� firmware-name =
> "qcom/sc8280xp/MICROSOFT/DEVKIT23/qcdxkmsuc8280.mbn";
> +��� };
> +};
> +
> +&mdss0 {
> +��� status = "okay";
> +};
> +
> +&mdss0_dp0 {
> +��� status = "okay";
> +};
> +
> +&mdss0_dp0_out {
> +��� data-lanes = <0 1>;
> +��� remote-endpoint = <&usb_0_qmpphy_dp_in>;
> +};
> +
> +&mdss0_dp1 {
> +��� status = "okay";
> +};
> +
> +&mdss0_dp1_out {
> +��� data-lanes = <0 1>;
> +��� remote-endpoint = <&usb_1_qmpphy_dp_in>;
> +};
> +
> +&mdss0_dp2 {
> +� compatible = "qcom,sc8280xp-dp";
> +
> +� data-lanes = <0 1 2 3>;
> +
> +��� status = "okay";
> +
> +��� ports {
> +��� ��� port@1 {
> +��� ��� ��� reg = <1>;
> +��� ��� ��� mdss0_dp2_phy_out: endpoint {
> +��� ��� ��� ��� remote-endpoint = <&dp1_connector_in>;
> +��� ��� ��� };
> +��� ��� };
> +��� };
> +};
> +
> +&mdss0_dp2_phy {
> +��� compatible = "qcom,sc8280xp-dp-phy";
> +
> +��� vdda-phy-supply = <&vreg_l3b>;
> +��� phy-supply = <&vreg_l3b>;
> +��� vdda-pll-supply = <&vreg_l6b>;
> +��� pll-supply = <&vreg_l6b>;
> +
> +��� status = "okay";
> +};
> +
> +&pcie2a {
> +��� aspm-no-l0s;
> +��� max-link-speed = <16>;
> +
> +��� perst-gpios = <&tlmm 143 GPIO_ACTIVE_LOW>;
> +��� wake-gpios = <&tlmm 145 GPIO_ACTIVE_LOW>;
> +
> +��� vddpe-3v3-supply = <&vreg_nvme>;
> +��� pcie-vdda-supply = <&vreg_l7d>;
> +��� vdda-supply = <&vreg_l7d>;
> +
> +��� pinctrl-names = "default";
> +��� pinctrl-0 = <&pcie2a_default>;
> +
> +��� status = "okay";
> +};
> +
> +&pcie2a_phy {
> +��� vdda-phy-supply = <&vreg_l4d>;
> +��� phy-supply = <&vreg_l4d>;
> +��� vdda-pll-supply = <&vreg_l6d>;
> +��� pll-supply = <&vreg_l6d>;
> +
> +��� status = "okay";
> +};
> +
> +&pcie4 {
> +��� max-link-speed = <2>;
> +��� aspm-no-l0s;
> +
> +��� perst-gpios = <&tlmm 141 GPIO_ACTIVE_LOW>;
> +��� wake-gpios = <&tlmm 139 GPIO_ACTIVE_LOW>;
> +
> +��� vddpe-3v3-supply = <&vreg_wlan>;
> +��� pcie-vdda-supply = <&vreg_l7d>;
> +��� vdda-supply = <&vreg_l7d>;
> +
> +��� pinctrl-names = "default";
> +��� pinctrl-0 = <&pcie4_default>;
> +
> +��� status = "okay";
> +};
> +
> +&pcie4_port0 {
> +��� wifi@0 {
> +��� ��� compatible = "pci17cb,1103";
> +��� ��� reg = <0x10000 0x0 0x0 0x0 0x0>;
> +
> +��� ��� qcom,ath11k-calibration-variant = "volterra";
> +��� };
> +};
> +
> +&pcie4_phy {
> +��� vdda-phy-supply = <&vreg_l4d>;
> +��� phy-supply = <&vreg_l4d>;
> +��� vdda-pll-supply = <&vreg_l6d>;
> +��� pll-supply = <&vreg_l6d>;
> +
> +��� status = "okay";
> +};
> +
> +&pmc8280c_lpg {
> +��� status = "okay";
> +};
> +
> +&pmk8280_adc_tm {
> +��� status = "okay";
> +
> +��� sys-therm@0 {
> +��� ��� reg = <0>;
> +��� ��� io-channels = <&pmk8280_vadc PM8350_ADC7_AMUX_THM1_100K_PU(1)>;
> +��� ��� qcom,hw-settle-time-us = <200>;
> +��� ��� qcom,avg-samples = <2>;
> +��� ��� qcom,ratiometric;
> +��� };
> +
> +��� sys-therm@1 {
> +��� ��� reg = <1>;
> +��� ��� io-channels = <&pmk8280_vadc PM8350_ADC7_AMUX_THM2_100K_PU(1)>;
> +��� ��� qcom,hw-settle-time-us = <200>;
> +��� ��� qcom,avg-samples = <2>;
> +��� ��� qcom,ratiometric;
> +��� };
> +
> +��� sys-therm@2 {
> +��� ��� reg = <2>;
> +��� ��� io-channels = <&pmk8280_vadc PM8350_ADC7_AMUX_THM3_100K_PU(1)>;
> +��� ��� qcom,hw-settle-time-us = <200>;
> +��� ��� qcom,avg-samples = <2>;
> +��� ��� qcom,ratiometric;
> +��� };
> +
> +��� sys-therm@3 {
> +��� ��� reg = <3>;
> +��� ��� io-channels = <&pmk8280_vadc PM8350_ADC7_AMUX_THM4_100K_PU(1)>;
> +��� ��� qcom,hw-settle-time-us = <200>;
> +��� ��� qcom,avg-samples = <2>;
> +��� ��� qcom,ratiometric;
> +��� };
> +
> +��� sys-therm@4 {
> +��� ��� reg = <4>;
> +��� ��� io-channels = <&pmk8280_vadc PM8350_ADC7_AMUX_THM1_100K_PU(3)>;
> +��� ��� qcom,hw-settle-time-us = <200>;
> +��� ��� qcom,avg-samples = <2>;
> +��� ��� qcom,ratiometric;
> +��� };
> +
> +��� sys-therm@5 {
> +��� ��� reg = <5>;
> +��� ��� io-channels = <&pmk8280_vadc PM8350_ADC7_AMUX_THM2_100K_PU(3)>;
> +��� ��� qcom,hw-settle-time-us = <200>;
> +��� ��� qcom,avg-samples = <2>;
> +��� ��� qcom,ratiometric;
> +��� };
> +
> +��� sys-therm@6 {
> +��� ��� reg = <6>;
> +��� ��� io-channels = <&pmk8280_vadc PM8350_ADC7_AMUX_THM3_100K_PU(3)>;
> +��� ��� qcom,hw-settle-time-us = <200>;
> +��� ��� qcom,avg-samples = <2>;
> +��� ��� qcom,ratiometric;
> +��� };
> +
> +��� sys-therm@7 {
> +��� ��� reg = <7>;
> +��� ��� io-channels = <&pmk8280_vadc PM8350_ADC7_AMUX_THM4_100K_PU(3)>;
> +��� ��� qcom,hw-settle-time-us = <200>;
> +��� ��� qcom,avg-samples = <2>;
> +��� ��� qcom,ratiometric;
> +��� };
> +};
> +
> +&pmk8280_pon_pwrkey {
> +��� status = "okay";
> +};
> +
> +&pmk8280_pon_resin {
> +��� status = "okay";
> +};
> +
> +&pmk8280_rtc {
> +��� nvmem-cells = <&rtc_offset>;
> +��� nvmem-cell-names = "offset";
> +
> +��� status = "okay";
> +};
> +
> +&pmk8280_sdam_6 {
> +��� status = "okay";
> +
> +��� rtc_offset: rtc-offset@bc {
> +��� ��� reg = <0xbc 0x4>;
> +��� };
> +};
> +
> +&pmk8280_vadc {
> +��� status = "okay";
> +
> +��� channel@144 {
> +��� ��� reg = <PM8350_ADC7_AMUX_THM1_100K_PU(1)>;
> +��� ��� qcom,hw-settle-time = <200>;
> +��� ��� qcom,ratiometric;
> +��� ��� label = "sys_therm1";
> +��� };
> +
> +��� channel@145 {
> +��� ��� reg = <PM8350_ADC7_AMUX_THM2_100K_PU(1)>;
> +��� ��� qcom,hw-settle-time = <200>;
> +��� ��� qcom,ratiometric;
> +��� ��� label = "sys_therm2";
> +��� };
> +
> +��� channel@146 {
> +��� ��� reg = <PM8350_ADC7_AMUX_THM3_100K_PU(1)>;
> +��� ��� qcom,hw-settle-time = <200>;
> +��� ��� qcom,ratiometric;
> +��� ��� label = "sys_therm3";
> +��� };
> +
> +��� channel@147 {
> +��� ��� reg = <PM8350_ADC7_AMUX_THM4_100K_PU(1)>;
> +��� ��� qcom,hw-settle-time = <200>;
> +��� ��� qcom,ratiometric;
> +��� ��� label = "sys_therm4";
> +��� };
> +
> +��� channel@344 {
> +��� ��� reg = <PM8350_ADC7_AMUX_THM1_100K_PU(3)>;
> +��� ��� qcom,hw-settle-time = <200>;
> +��� ��� qcom,ratiometric;
> +��� ��� label = "sys_therm5";
> +��� };
> +
> +��� channel@345 {
> +��� ��� reg = <PM8350_ADC7_AMUX_THM2_100K_PU(3)>;
> +��� ��� qcom,hw-settle-time = <200>;
> +��� ��� qcom,ratiometric;
> +��� ��� label = "sys_therm6";
> +��� };
> +
> +��� channel@346 {
> +��� ��� reg = <PM8350_ADC7_AMUX_THM3_100K_PU(3)>;
> +��� ��� qcom,hw-settle-time = <200>;
> +��� ��� qcom,ratiometric;
> +��� ��� label = "sys_therm7";
> +��� };
> +
> +��� channel@347 {
> +��� ��� reg = <PM8350_ADC7_AMUX_THM4_100K_PU(3)>;
> +��� ��� qcom,hw-settle-time = <200>;
> +��� ��� qcom,ratiometric;
> +��� ��� label = "sys_therm8";
> +��� };
> +};
> +
> +&qup0 {
> +��� status = "okay";
> +};
> +
> +&qup1 {
> +��� status = "okay";
> +};
> +
> +&qup2 {
> +��� status = "okay";
> +};
> +
> +&remoteproc_adsp {
> +��� firmware-name = "qcom/sc8280xp/MICROSOFT/DEVKIT23/qcadsp8280.mbn";
> +
> +��� status = "okay";
> +};
> +
> +&remoteproc_nsp0 {
> +��� firmware-name = "qcom/sc8280xp/MICROSOFT/DEVKIT23/qccdsp8280.mbn";
> +
> +��� status = "okay";
> +};
> +
> +&rxmacro {
> +��� status = "okay";
> +};
> +
> +&sound {
> +��� compatible = "qcom,sc8280xp-sndcard";
> +��� model = "MICROSOFT/DEVKIT23/devkit23";
> +��� audio-routing =
> +��� ��� "SpkrLeft IN", "WSA_SPK1 OUT",
> +��� ��� "SpkrRight IN", "WSA_SPK2 OUT",
> +��� ��� "IN1_HPHL", "HPHL_OUT",
> +��� ��� "IN2_HPHR", "HPHR_OUT",
> +��� ��� "AMIC2", "MIC BIAS2",
> +��� ��� "VA DMIC0", "MIC BIAS1",
> +��� ��� "VA DMIC1", "MIC BIAS1",
> +��� ��� "VA DMIC2", "MIC BIAS3",
> +��� ��� "VA DMIC0", "VA MIC BIAS1",
> +��� ��� "VA DMIC1", "VA MIC BIAS1",
> +��� ��� "VA DMIC2", "VA MIC BIAS3",
> +��� ��� "TX SWR_ADC1", "ADC2_OUTPUT";
> +
> +��� wcd-playback-dai-link {
> +��� ��� link-name = "WCD Playback";
> +��� ��� cpu {
> +��� ��� ��� sound-dai = <&q6apmbedai RX_CODEC_DMA_RX_0>;
> +��� ��� };
> +
> +��� ��� codec {
> +��� ��� ��� sound-dai = <&wcd938x 0>, <&swr1 0>, <&rxmacro 0>;
> +��� ��� };
> +
> +��� ��� platform {
> +��� ��� ��� sound-dai = <&q6apm>;
> +��� ��� };
> +��� };
> +
> +��� wcd-capture-dai-link {
> +��� ��� link-name = "WCD Capture";
> +��� ��� cpu {
> +��� ��� ��� sound-dai = <&q6apmbedai TX_CODEC_DMA_TX_3>;
> +��� ��� };
> +
> +��� ��� codec {
> +��� ��� ��� sound-dai = <&wcd938x 1>, <&swr2 0>, <&txmacro 0>;
> +��� ��� };
> +
> +��� ��� platform {
> +��� ��� ��� sound-dai = <&q6apm>;
> +��� ��� };
> +��� };
> +
> +��� wsa-dai-link {
> +��� ��� link-name = "WSA Playback";
> +��� ��� cpu {
> +��� ��� ��� sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
> +��� ��� };
> +
> +��� ��� codec {
> +��� ��� ��� sound-dai = <&swr0 0>, <&wsamacro 0>;
> +��� ��� };
> +
> +��� ��� platform {
> +��� ��� ��� sound-dai = <&q6apm>;
> +��� ��� };
> +��� };
> +
> +��� va-dai-link {
> +��� ��� link-name = "VA Capture";
> +��� ��� cpu {
> +��� ��� ��� sound-dai = <&q6apmbedai VA_CODEC_DMA_TX_0>;
> +��� ��� };
> +
> +��� ��� platform {
> +��� ��� ��� sound-dai = <&q6apm>;
> +��� ��� };
> +
> +��� ��� codec {
> +��� ��� ��� sound-dai = <&vamacro 0>;
> +��� ��� };
> +��� };
> +};
> +
> +&swr0 {
> +��� status = "okay";
> +};
> +
> +&swr1 {
> +��� status = "okay";
> +
> +��� wcd_rx: wcd9380-rx@0,4 {
> +��� ��� compatible = "sdw20217010d00";
> +��� ��� reg = <0 4>;
> +��� ��� qcom,rx-port-mapping = <1 2 3 4 5>;
> +��� };
> +};
> +
> +&swr2 {
> +��� status = "okay";
> +
> +��� wcd_tx: wcd9380-tx@0,3 {
> +��� ��� compatible = "sdw20217010d00";
> +��� ��� reg = <0 3>;
> +��� ��� qcom,tx-port-mapping = <1 1 2 3>;
> +��� };
> +};
> +
> +&txmacro {
> +��� status = "okay";
> +};
> +
> +&uart2 {
> +��� pinctrl-0 = <&uart2_default>;
> +��� pinctrl-names = "default";
> +
> +��� status = "okay";
> +
> +��� bluetooth {
> +��� ��� compatible = "qcom,wcn6855-bt";
> +
> +��� ��� vddio-supply = <&vreg_s10b>;
> +��� ��� vddbtcxmx-supply = <&vreg_s12b>;
> +��� ��� vddrfacmn-supply = <&vreg_s12b>;
> +��� ��� vddrfa0p8-supply = <&vreg_s12b>;
> +��� ��� vddrfa1p2-supply = <&vreg_s11b>;
> +��� ��� vddrfa1p7-supply = <&vreg_s1c>;
> +
> +��� ��� max-speed = <3200000>;
> +
> +��� ��� enable-gpios = <&tlmm 133 GPIO_ACTIVE_HIGH>;
> +��� ��� swctrl-gpios = <&tlmm 132 GPIO_ACTIVE_HIGH>;
> +
> +��� ��� pinctrl-0 = <&bt_default>;
> +��� ��� pinctrl-names = "default";
> +��� };
> +};
> +
> +&usb_0 {
> +��� status = "okay";
> +};
> +
> +&usb_0_dwc3 {
> +��� dr_mode = "host";
> +};
> +
> +&usb_0_dwc3_hs {
> +��� remote-endpoint = <&pmic_glink_con0_hs>;
> +};
> +
> +&usb_0_hsphy {
> +��� vdda-pll-supply = <&vreg_l9d>;
> +��� vdda-phy-supply = <&vreg_l4d>;
> +��� phy-supply = <&vreg_l4d>;
> +��� vdda18-supply = <&vreg_l1c>;
> +��� vdda33-supply = <&vreg_l7d>;
> +
> +��� status = "okay";
> +};
> +
> +&usb_0_qmpphy {
> +��� vdda-phy-supply = <&vreg_l4d>;
> +��� phy-supply = <&vreg_l4d>;
> +��� vdda-pll-supply = <&vreg_l9d>;
> +��� pll-supply = <&vreg_l9d>;
> +
> +��� orientation-switch;
> +
> +��� status = "okay";
> +};
> +
> +&usb_0_qmpphy_dp_in {
> +��� remote-endpoint = <&mdss0_dp0_out>;
> +};
> +
> +&usb_0_qmpphy_out {
> +��� remote-endpoint = <&pmic_glink_con0_ss>;
> +};
> +
> +&usb_1 {
> +��� status = "okay";
> +};
> +
> +&usb_1_dwc3 {
> +��� dr_mode = "host";
> +};
> +
> +&usb_1_dwc3_hs {
> +��� remote-endpoint = <&pmic_glink_con1_hs>;
> +};
> +
> +&usb_1_hsphy {
> +��� vdda-pll-supply = <&vreg_l4b>;
> +��� vdda-phy-supply = <&vreg_l3b>;
> +��� phy-supply = <&vreg_l3b>;
> +��� vdda18-supply = <&vreg_l1c>;
> +��� vdda33-supply = <&vreg_l13c>;
> +
> +��� status = "okay";
> +};
> +
> +&usb_1_qmpphy {
> +��� vdda-phy-supply = <&vreg_l3b>;
> +��� phy-supply = <&vreg_l3b>;
> +��� vdda-pll-supply = <&vreg_l4b>;
> +��� pll-supply = <&vreg_l4b>;
> +
> +��� orientation-switch;
> +
> +��� status = "okay";
> +};
> +
> +&usb_1_qmpphy_dp_in {
> +��� remote-endpoint = <&mdss0_dp1_out>;
> +};
> +
> +&usb_1_qmpphy_out {
> +��� remote-endpoint = <&pmic_glink_con1_ss>;
> +};
> +
> +&usb_2 {
> +��� pinctrl-names = "default";
> +��� pinctrl-0 = <&usb2_en_state>;
> +
> +��� status = "okay";
> +};
> +
> +&usb_2_dwc3 {
> +��� dr_mode = "host";
> +��� phy-names = "usb2-port0", "usb3-port0";
> +��� phys = <&usb_2_hsphy0>, <&usb_2_qmpphy0>;
> +
> +��� status = "okay";
> +};
> +
> +&usb_2_hsphy0 {
> +��� vdda-pll-supply = <&vreg_l1b>;
> +��� vdda-phy-supply = <&vreg_l3d>;
> +��� phy-supply = <&vreg_l3d>;
> +��� vdda18-supply = <&vreg_l1c>;
> +��� vdda33-supply = <&vreg_l7d>;
> +
> +��� status = "okay";
> +};
> +
> +&usb_2_hsphy1 {
> +��� vdda-pll-supply = <&vreg_l8d>;
> +��� vdda-phy-supply = <&vreg_l3d>;
> +��� phy-supply = <&vreg_l3d>;
> +��� vdda18-supply = <&vreg_l1c>;
> +��� vdda33-supply = <&vreg_l7d>;
> +
> +��� status = "okay";
> +};
> +
> +&usb_2_hsphy2 {
> +��� vdda-pll-supply = <&vreg_l10d>;
> +��� vdda-phy-supply = <&vreg_l3d>;
> +��� phy-supply = <&vreg_l3d>;
> +��� vdda18-supply = <&vreg_l8c>;
> +��� vdda33-supply = <&vreg_l2d>;
> +
> +��� status = "okay";
> +};
> +
> +&usb_2_hsphy3 {
> +��� vdda-pll-supply = <&vreg_l10d>;
> +��� vdda-phy-supply = <&vreg_l3d>;
> +��� phy-supply = <&vreg_l3d>;
> +��� vdda18-supply = <&vreg_l8c>;
> +��� vdda33-supply = <&vreg_l2d>;
> +
> +��� status = "okay";
> +};
> +
> +&usb_2_qmpphy0 {
> +��� vdda-phy-supply = <&vreg_l1b>;
> +��� phy-supply = <&vreg_l1b>;
> +��� vdda-pll-supply = <&vreg_l4d>;
> +��� pll-supply = <&vreg_l4d>;
> +��� status = "okay";
> +};
> +
> +&usb_2_qmpphy1 {
> +��� vdda-phy-supply = <&vreg_l8d>;
> +��� phy-supply = <&vreg_l8d>;
> +��� vdda-pll-supply = <&vreg_l4d>;
> +��� pll-supply = <&vreg_l4d>;
> +��� status = "okay";
> +};
> +
> +&vamacro {
> +��� pinctrl-0 = <&dmic01_default>, <&dmic23_default>;
> +��� pinctrl-names = "default";
> +
> +��� vdd-micb-supply = <&vreg_s10b>;
> +
> +��� qcom,dmic-sample-rate = <4800000>;
> +
> +��� status = "okay";
> +};
> +
> +&wsamacro {
> +��� status = "okay";
> +};
> +
> +&xo_board_clk {
> +��� clock-frequency = <38400000>;
> +};
> +
> +/* PINCTRL */
> +
> +&lpass_tlmm {
> +��� status = "okay";
> +};
> +
> +&pmc8280_1_gpios {
> +��� edp_bl_en: edp-bl-en-state {
> +��� ��� pins = "gpio8";
> +��� ��� function = "normal";
> +��� };
> +
> +��� edp_bl_reg_en: edp-bl-reg-en-state {
> +��� ��� pins = "gpio9";
> +��� ��� function = "normal";
> +��� };
> +
> +��� misc_3p3_reg_en: misc-3p3-reg-en-state {
> +��� ��� pins = "gpio1";
> +��� ��� function = "normal";
> +��� };
> +};
> +
> +&pmc8280_2_gpios {
> +��� wwan_sw_en: wwan-sw-en-state {
> +��� ��� pins = "gpio1";
> +��� ��� function = "normal";
> +��� };
> +};
> +
> +&pmc8280c_gpios {
> +��� edp_bl_pwm: edp-bl-pwm-state {
> +��� ��� pins = "gpio8";
> +��� ��� function = "func1";
> +��� };
> +};
> +
> +&pmr735a_gpios {
> +��� hastings_reg_en: hastings-reg-en-state {
> +��� ��� pins = "gpio1";
> +��� ��� function = "normal";
> +��� };
> +};
> +
> +&tlmm {
> +��� gpio-reserved-ranges = <70 2>, <74 6>, <125 2>, <128 2>, <154 4>;
> +
> +��� bt_default: bt-default-state {
> +��� ��� hstp-bt-en-pins {
> +��� ��� ��� pins = "gpio133";
> +��� ��� ��� function = "gpio";
> +��� ��� ��� drive-strength = <16>;
> +��� ��� ��� bias-disable;
> +��� ��� };
> +
> +��� ��� hstp-sw-ctrl-pins {
> +��� ��� ��� pins = "gpio132";
> +��� ��� ��� function = "gpio";
> +��� ��� ��� bias-pull-down;
> +��� ��� };
> +��� };
> +
> +��� nvme_reg_en: nvme-reg-en-state {
> +��� ��� pins = "gpio135";
> +��� ��� function = "gpio";
> +��� ��� drive-strength = <2>;
> +��� ��� bias-disable;
> +��� };
> +
> +��� pcie2a_default: pcie2a-default-state {
> +��� ��� clkreq-n-pins {
> +��� ��� ��� pins = "gpio142";
> +��� ��� ��� function = "pcie2a_clkreq";
> +��� ��� ��� drive-strength = <2>;
> +��� ��� ��� bias-pull-up;
> +��� ��� };
> +
> +��� ��� perst-n-pins {
> +��� ��� ��� pins = "gpio143";
> +��� ��� ��� function = "gpio";
> +��� ��� ��� drive-strength = <2>;
> +��� ��� ��� bias-disable;
> +��� ��� };
> +
> +��� ��� wake-n-pins {
> +��� ��� ��� pins = "gpio145";
> +��� ��� ��� function = "gpio";
> +��� ��� ��� drive-strength = <2>;
> +��� ��� ��� bias-pull-up;
> +��� ��� };
> +��� };
> +
> +��� pcie3a_default: pcie3a-default-state {
> +��� ��� clkreq-n-pins {
> +��� ��� ��� pins = "gpio150";
> +��� ��� ��� function = "pcie3a_clkreq";
> +��� ��� ��� drive-strength = <2>;
> +��� ��� ��� bias-pull-up;
> +��� ��� };
> +
> +��� ��� perst-n-pins {
> +��� ��� ��� pins = "gpio151";
> +��� ��� ��� function = "gpio";
> +��� ��� ��� drive-strength = <2>;
> +��� ��� ��� bias-disable;
> +��� ��� };
> +
> +��� ��� wake-n-pins {
> +��� ��� ��� pins = "gpio148";
> +��� ��� ��� function = "gpio";
> +��� ��� ��� drive-strength = <2>;
> +��� ��� ��� bias-pull-up;
> +��� ��� };
> +��� };
> +
> +��� pcie4_default: pcie4-default-state {
> +��� ��� clkreq-n-pins {
> +��� ��� ��� pins = "gpio140";
> +��� ��� ��� function = "pcie4_clkreq";
> +��� ��� ��� drive-strength = <2>;
> +��� ��� ��� bias-pull-up;
> +��� ��� };
> +
> +��� ��� perst-n-pins {
> +��� ��� ��� pins = "gpio141";
> +��� ��� ��� function = "gpio";
> +��� ��� ��� drive-strength = <2>;
> +��� ��� ��� bias-disable;
> +��� ��� };
> +
> +��� ��� wake-n-pins {
> +��� ��� ��� pins = "gpio139";
> +��� ��� ��� function = "gpio";
> +��� ��� ��� drive-strength = <2>;
> +��� ��� ��� bias-pull-up;
> +��� ��� };
> +��� };
> +
> +��� uart2_default: uart2-default-state {
> +��� ��� cts-pins {
> +��� ��� ��� pins = "gpio121";
> +��� ��� ��� function = "qup2";
> +��� ��� ��� bias-bus-hold;
> +��� ��� };
> +
> +��� ��� rts-pins {
> +��� ��� ��� pins = "gpio122";
> +��� ��� ��� function = "qup2";
> +��� ��� ��� drive-strength = <2>;
> +��� ��� ��� bias-disable;
> +��� ��� };
> +
> +��� ��� rx-pins {
> +��� ��� ��� pins = "gpio124";
> +��� ��� ��� function = "qup2";
> +��� ��� ��� bias-pull-up;
> +��� ��� };
> +
> +��� ��� tx-pins {
> +��� ��� ��� pins = "gpio123";
> +��� ��� ��� function = "qup2";
> +��� ��� ��� drive-strength = <2>;
> +��� ��� ��� bias-disable;
> +��� ��� };
> +��� };
> +
> +��� usb0_sbu_default: usb0-sbu-state {
> +��� ��� oe-n-pins {
> +��� ��� ��� pins = "gpio101";
> +��� ��� ��� function = "gpio";
> +��� ��� ��� bias-disable;
> +��� ��� ��� drive-strength = <16>;
> +��� ��� ��� output-high;
> +��� ��� };
> +
> +��� ��� sel-pins {
> +��� ��� ��� pins = "gpio164";
> +��� ��� ��� function = "gpio";
> +��� ��� ��� bias-disable;
> +��� ��� ��� drive-strength = <16>;
> +��� ��� };
> +��� };
> +
> +��� usb1_sbu_default: usb1-sbu-state {
> +��� ��� oe-n-pins {
> +��� ��� ��� pins = "gpio48";
> +��� ��� ��� function = "gpio";
> +��� ��� ��� bias-disable;
> +��� ��� ��� drive-strength = <16>;
> +��� ��� ��� output-high;
> +��� ��� };
> +
> +��� ��� sel-pins {
> +��� ��� ��� pins = "gpio47";
> +��� ��� ��� function = "gpio";
> +��� ��� ��� bias-disable;
> +��� ��� ��� drive-strength = <16>;
> +��� ��� };
> +��� };
> +
> +��� usb2_en_state: usb2-en-state {
> +��� ��� /* TS3USB221A USB2.0 mux select */
> +��� ��� pins = "gpio24";
> +��� ��� function = "gpio";
> +��� ��� drive-strength = <2>;
> +��� ��� bias-disable;
> +��� ��� output-low;
> +��� };
> +
> +��� wcd_default: wcd-default-state {
> +��� ��� reset-pins {
> +��� ��� ��� pins = "gpio106";
> +��� ��� ��� function = "gpio";
> +��� ��� ��� bias-disable;
> +��� ��� };
> +��� };
> +};
> -- 
> 2.43.0
> 

