Return-Path: <linux-arm-msm+bounces-78833-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BA6C0B74A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 00:37:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E9B04188AC15
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Oct 2025 23:37:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EAC03009F8;
	Sun, 26 Oct 2025 23:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b="XanT6QPY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ixit.cz (ip-94-112-25-9.bb.vodafone.cz [94.112.25.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE072FFDEB;
	Sun, 26 Oct 2025 23:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.112.25.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761521802; cv=none; b=mflDSdJGfIThdPX9bgYy6nA1Btq3tyPr2J8SEpAM0hJXyJQIN4cdM39ICVZ35ZyBYZsFsegiR6BT2XbLT8njQCNFkh8s1kdFLTPBL/HuTH7H0n7nyGFSWUQcFFmQTmlqd9LWkCDlvpDCFohgBfPuUAoA62M1dxDgXRAhFK8Zk74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761521802; c=relaxed/simple;
	bh=FnKLxK1KVzU7+wNVeUji2xStNz79zXnGckXLY+iTTKs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zo2tdIS8Q+Zl+7SM2QSXKmHaOwIQzLT7QSqZxHOTAemNnP3/PyV1ibTlJ6PjSOLSeVdbNMr/sisq3THWOBcnltGcLreVXDkA9GXRwDAUhjvZaDu6zibiGrAqyOKCnDvhUKuf5bSd+bEJ2+0O7dADezQ2Z/TCmYTOA1jRHHwdJjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz; spf=pass smtp.mailfrom=ixit.cz; dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b=XanT6QPY; arc=none smtp.client-ip=94.112.25.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ixit.cz
Received: from [10.0.0.240] (unknown [10.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ixit.cz (Postfix) with ESMTPSA id 567255340F8E;
	Mon, 27 Oct 2025 00:36:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
	t=1761521793;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=C4lIOF4K1BcAMSt+BS6okAwCF7PhAgKaKRkT9oLy3V8=;
	b=XanT6QPYguyJYnsnQmrFXjkgY1uSquzCDCaiBHuOOFaTQBZ2KQN0VMiLlDJgyHW+U1W5yK
	D1ei7q690NrLIXsOX3H/oLLk+dCFzGsBlBU9M3wIHOE2doVopMWCNR5Opjz5X+mJIEEXad
	l6+Sp8C9rKK7qsbWf67BdIQG8ukjtc0=
Message-ID: <f672a830-06dd-4184-9761-d5a38944b9ba@ixit.cz>
Date: Mon, 27 Oct 2025 00:36:32 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8150: Add support for Xiaomi
 Redmi K20 Pro
To: Piyush Raj Chouhan <pc1598@mainlining.org>, linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, tony.luck@intel.com, gpiccoli@igalia.com
References: <20251022054026.22816-1-pc1598@mainlining.org>
 <20251022054026.22816-2-pc1598@mainlining.org>
Content-Language: en-US
From: David Heidelberg <david@ixit.cz>
Autocrypt: addr=david@ixit.cz; keydata=
 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
In-Reply-To: <20251022054026.22816-2-pc1598@mainlining.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello Piyush,

few things to improve:

On 22/10/2025 07:40, Piyush Raj Chouhan wrote:
> Add initial device tree support for the Xiaomi Redmi K20 Pro/ Xiaomi Mi 9T Pro
> (codename raphael), based on the Qualcomm SM8150 (Snapdragon 855)
> platform.
> 
> The supported features include:
> - Display (Samsung AMS639RQ08 AMOLED panel)
> - UFS storage
> - USB Type-C (with role switching, High-Speed only)
> - PMIC regulators (PM8150, PM8150L, PM8150B)
> - GPIO keys (volume up, volume down, power)
> - Remoteprocs (ADSP, CDSP, MPSS)
> - Adreno 640 GPU with GMU
> - WCN3990 WiFi
> - Camera flash LEDs
> 
> Signed-off-by: Piyush Raj Chouhan <pc1598@mainlining.org>
> ---
>   arch/arm64/boot/dts/qcom/Makefile             |   1 +
>   .../boot/dts/qcom/sm8150-xiaomi-raphael.dts   | 995 ++++++++++++++++++
>   2 files changed, 996 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/qcom/sm8150-xiaomi-raphael.dts
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 296688f7cb26..d2b673d2625c 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -279,6 +279,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8150-microsoft-surface-duo.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sm8150-mtp.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sm8150-sony-xperia-kumano-bahamut.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sm8150-sony-xperia-kumano-griffin.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= sm8150-xiaomi-raphael.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-hdk.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-mtp.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-samsung-r8q.dtb
> diff --git a/arch/arm64/boot/dts/qcom/sm8150-xiaomi-raphael.dts b/arch/arm64/boot/dts/qcom/sm8150-xiaomi-raphael.dts
> new file mode 100644
> index 000000000000..9ff938b61a31
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm8150-xiaomi-raphael.dts
> @@ -0,0 +1,995 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +
> +/*
> + * Copyright (c) 2025, Piyush Raj Chouhan <pc1598@mainlining.org>.
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/arm/qcom,ids.h>
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +#include <dt-bindings/usb/pd.h>
> +#include "sm8150.dtsi"
> +#include "pm8150.dtsi"
> +#include "pm8150b.dtsi"
> +#include "pm8150l.dtsi"
> +
> +/*
> + * Rewrite reserved memory maps inherited from sm8150.dtsi to match the ones
> + * used on xiaomi-raphael.
> + * Note: this list is ordered by its memory address in sm8150.dtsi.
> + */
> +/delete-node/ &tz_mem;      /* same address but larger, no place for rmtfs_mem! */
> +/delete-node/ &rmtfs_mem;   /* moved to completely different address */
> +/delete-node/ &adsp_mem;    /* same start address, but larger size */
> +/delete-node/ &mpss_mem;    /* same size, shifted higher, due to larger adsp_mem */
> +/delete-node/ &venus_mem;   /* same size, shifted higher */
> +/delete-node/ &slpi_mem;    /* same size, shifted higher */
> +/delete-node/ &ipa_fw_mem;  /* same size, shifted higher */
> +/delete-node/ &ipa_gsi_mem; /* same size, shifted higher */
> +/delete-node/ &gpu_mem;     /* same size, shifted higher */
> +/delete-node/ &spss_mem;    /* same size, shifted higher */
> +/delete-node/ &cdsp_mem;    /* same size, shifted higher */
> +
> +/ {
> +	model = "Xiaomi Redmi K20 Pro";
> +	compatible = "xiaomi,raphael", "qcom,sm8150";
> +	qcom,msm-id = <QCOM_ID_SM8150 0x20000>; /* SM8150 v2 */
> +	qcom,board-id = <0x28008 0>;
> +	chassis-type = "handset";
> +
> +	aliases {
> +		serial0 = &uart2;
> +		wifi0 = &wifi;
> +	};
> +
> +	chosen {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		stdout-path = "serial0:115200n8";
> +
> +		framebuffer: framebuffer@9c000000 {
> +			compatible = "simple-framebuffer";
> +			reg = <0 0x9c000000 0 (1080 * 2340 * 4)>;
> +			width = <1080>;
> +			height = <2340>;
> +			stride = <(1080 * 4)>;
> +			format = "a8r8g8b8";
> +			display = <&panel>;
> +			clocks = <&gcc GCC_DISP_HF_AXI_CLK>;
> +		};
> +	};
> +
> +	disp_vci_vreg: disp-vci-vreg {
> +		compatible = "regulator-fixed";
> +		regulator-name = "disp_vci_vreg";
> +		regulator-boot-on;
> +		enable-active-high;
> +		gpio = <&tlmm 99 GPIO_ACTIVE_HIGH>;
> +	};
> +
> +	vreg_ibb: regulator-ibb {
> +		compatible = "regulator-fixed";
> +		regulator-name = "ibb";
> +		regulator-min-microvolt = <6000000>;
> +		regulator-max-microvolt = <6000000>;
> +	};
> +
> +	vreg_lab: regulator-lab {
> +		compatible = "regulator-fixed";
> +		regulator-name = "lab";
> +		regulator-min-microvolt = <6000000>;
> +		regulator-max-microvolt = <6000000>;
> +	};
> +
> +	reserved-memory {
> +		tz_mem: memory@86200000 {
> +			reg = <0x0 0x86200000 0x0 0x5500000>;
> +			no-map;
> +		};
> +
> +		adsp_mem: memory@8be00000 {
> +			reg = <0x0 0x8be00000 0x0 0x2200000>;
> +			no-map;
> +		};
> +
> +		mpss_mem: memory@8e000000 {
> +			reg = <0x0 0x8e000000 0x0 0x9600000>;
> +			no-map;
> +		};
> +
> +		venus_mem: memory@97600000 {
> +			reg = <0x0 0x97600000 0x0 0x500000>;
> +			no-map;
> +		};
> +
> +		slpi_mem: memory@97b00000 {
> +			reg = <0x0 0x97b00000 0x0 0x1400000>;
> +			no-map;
> +		};
> +
> +		ipa_fw_mem: memory@98f00000 {
> +			reg = <0x0 0x98f00000 0x0 0x10000>;
> +			no-map;
> +		};
> +
> +		ipa_gsi_mem: memory@98f10000 {
> +			reg = <0x0 0x98f10000 0x0 0x5000>;
> +			no-map;
> +		};
> +
> +		gpu_mem: memory@98f15000 {
> +			reg = <0x0 0x98f15000 0x0 0x2000>;
> +			no-map;
> +		};
> +
> +		spss_mem: memory@99000000 {
> +			reg = <0x0 0x99000000 0x0 0x100000>;
> +			no-map;
> +		};
> +
> +		cdsp_mem: memory@99100000 {
> +			reg = <0x0 0x99100000 0x0 0x1400000>;
> +			no-map;
> +		};
> +
> +		cont_splash_mem: memory@9c000000 {
> +			reg = <0x0 0x9c000000 0x0 0x2400000>;
> +			no-map;
> +		};
> +
> +		cdsp_sec_mem: memory@a4c00000 {
> +			reg = <0x0 0xa4c00000 0x0 0x3c00000>;
> +			no-map;
> +		};
> +
> +		ramoops@a1600000 {
> +			compatible = "ramoops";
> +			reg = <0x0 0xa1600000 0x0 0x800000>;
> +			console-size = <0x400000>;
> +			pmsg-size = <0x200000>;
> +			record-size = <0>;
> +			ftrace-size = <0>;
> +			ecc-size = <0>;
> +			no-map;
> +		};
> +
> +		rmtfs_mem: memory@fe101000 {
> +			compatible = "qcom,rmtfs-mem";
> +			reg = <0 0xfe101000 0 0x300000>;
> +			qcom,client-id = <1>;
> +			qcom,vmid = <15>;

s/15/QCOM_SCM_VMID_MSS_MSA/

> +			no-map;
> +		};
> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&vol_up_n>;
> +
> +		key-vol-up {
> +			label = "Volume Up";
> +			linux,code = <KEY_VOLUMEUP>;
> +			gpios = <&pm8150_gpios 6 GPIO_ACTIVE_LOW>;
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
> +	 * Apparently RPMh does not provide support for PM8150 S4 because it
> +	 * is always-on; model it as a fixed regulator.
> +	 */
> +	vreg_s4a_1p8: pm8150-s4 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg_s4a_1p8";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		regulator-always-on;
> +		regulator-boot-on;
> +		vin-supply = <&vph_pwr>;
> +	};
> +};
> +
> +&apps_rsc {
> +	regulators-0 {
> +		compatible = "qcom,pm8150-rpmh-regulators";
> +		qcom,pmic-id = "a";
> +
> +		vdd-s1-supply = <&vph_pwr>;
> +		vdd-s2-supply = <&vph_pwr>;
> +		vdd-s3-supply = <&vph_pwr>;
> +		vdd-s4-supply = <&vph_pwr>;
> +		vdd-s5-supply = <&vph_pwr>;
> +		vdd-s6-supply = <&vph_pwr>;
> +		vdd-s7-supply = <&vph_pwr>;
> +		vdd-s8-supply = <&vph_pwr>;
> +		vdd-s9-supply = <&vph_pwr>;
> +		vdd-s10-supply = <&vph_pwr>;
> +
> +		vdd-l1-l8-l11-supply = <&vreg_s6a_0p9>;
> +		vdd-l2-l10-supply = <&vreg_bob>;
> +		vdd-l3-l4-l5-l18-supply = <&vreg_s6a_0p9>;
> +		vdd-l6-l9-supply = <&vreg_s8c_1p3>;
> +		vdd-l7-l12-l14-l15-supply = <&vreg_s5a_2p0>;
> +		vdd-l13-l16-l17-supply = <&vreg_bob>;
> +
> +		vreg_s5a_2p0: smps5 {
> +			regulator-min-microvolt = <1904000>;
> +			regulator-max-microvolt = <2000000>;
> +		};
> +
> +		vreg_s6a_0p9: smps6 {
> +			regulator-min-microvolt = <920000>;
> +			regulator-max-microvolt = <1128000>;
> +		};
> +
> +		vdda_wcss_pll:
> +		vreg_l1a_0p75: ldo1 {
> +			regulator-min-microvolt = <752000>;
> +			regulator-max-microvolt = <752000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vdd_pdphy:
> +		vdda_usb_hs_3p1:
> +		vreg_l2a_3p1: ldo2 {
> +			regulator-min-microvolt = <3072000>;
> +			regulator-max-microvolt = <3072000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l3a_0p8: ldo3 {
> +			regulator-min-microvolt = <480000>;
> +			regulator-max-microvolt = <932000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		/*
> +		 * L4A supplies VDD_LPI_MX_* (VDD_LPI_MX_A_1). Board label: vreg_l4a_0p75.
> +		 * PM8150 device spec: L4A nominal = 0.816 V, active min = 0.752 V, active max = 0.904 V,
> +		 * IRATED = 300 mA. If the board programs L4A to ~0.752 V, keep min=752000 and max=816000.
> +		 */
> +		vreg_l4a_0p75: ldo4 {
> +			regulator-min-microvolt = <752000>;
> +			regulator-max-microvolt = <816000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vdd_usb_hs_core:
> +		vdda_mipi_csi_0_0p9:
> +		vdda_mipi_csi_1_0p9:
> +		vdda_mipi_csi_2_0p9:
> +		vdda_mipi_csi_3_0p9:
> +		vdda_mipi_dsi_0_0p9:
> +		vdda_mipi_dsi_1_0p9:
> +		vdda_mipi_dsi_0_pll_0p9:
> +		vdda_mipi_dsi_1_pll_0p9:
> +		vdda_pcie_1ln_core:
> +		vdda_pcie_2ln_core:
> +		vdda_pll_hv_cc_ebi01:
> +		vdda_pll_hv_cc_ebi23:
> +		vdda_qrefs_0p875_5:
> +		vdda_sp_sensor:
> +		vdda_ufs_2ln_core_1:
> +		vdda_ufs_2ln_core_2:
> +		vdda_qlink_lv:
> +		vdda_qlink_lv_ck:
> +		vreg_l5a_0p875: ldo5 {
> +			regulator-min-microvolt = <880000>;
> +			regulator-max-microvolt = <880000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l6a_1p2: ldo6 {
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l7a_1p8: ldo7 {
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		/*
> +		 * PM8150 LDO8 (L8A) — supplies vreg_l8a_0p75
> +		 * Device spec: nominal 0.752 V, active min 0.752 V, active max 0.904 V, IRATED = 300 mA
> +		 */
> +		vreg_l8a_0p75: ldo8 {
> +			regulator-min-microvolt = <752000>;
> +			regulator-max-microvolt = <816000>;
> +		};
> +
> +		vddpx_10:
> +		vreg_l9a_1p2: ldo9 {
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l10a_2p95: ldo10 {
> +			regulator-min-microvolt = <2950000>;
> +			regulator-max-microvolt = <2960000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l11a_0p8: ldo11 {
> +			regulator-min-microvolt = <800000>;
> +			regulator-max-microvolt = <800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vdd_qfprom:
> +		vdd_qfprom_sp:
> +		vdda_apc_cs_1p8:
> +		vdda_gfx_cs_1p8:
> +		vdda_usb_hs_1p8:
> +		vdda_qrefs_vref_1p8:
> +		vddpx_10_a:
> +		vreg_l12a_1p8: ldo12 {
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l13a_2p7: ldo13 {
> +			regulator-min-microvolt = <2704000>;
> +			regulator-max-microvolt = <2704000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l14a_1p8: ldo14 {
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1880000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l15a_1p7: ldo15 {
> +			regulator-min-microvolt = <1704000>;
> +			regulator-max-microvolt = <1704000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l16a_2p7: ldo16 {
> +			regulator-min-microvolt = <2704000>;
> +			regulator-max-microvolt = <2960000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l17a_3p0: ldo17 {
> +			regulator-min-microvolt = <2856000>;
> +			regulator-max-microvolt = <3008000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l18a_1p05: ldo18 {
> +			regulator-min-microvolt = <800000>;
> +			regulator-max-microvolt = <800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +	};
> +
> +	regulators-1 {
> +		compatible = "qcom,pm8150l-rpmh-regulators";
> +		qcom,pmic-id = "c";
> +
> +		vdd-s1-supply = <&vph_pwr>;
> +		vdd-s2-supply = <&vph_pwr>;
> +		vdd-s3-supply = <&vph_pwr>;
> +		vdd-s4-supply = <&vph_pwr>;
> +		vdd-s5-supply = <&vph_pwr>;
> +		vdd-s6-supply = <&vph_pwr>;
> +		vdd-s7-supply = <&vph_pwr>;
> +		vdd-s8-supply = <&vph_pwr>;
> +
> +		vdd-l1-l8-supply = <&vreg_s4a_1p8>;
> +		vdd-l2-l3-supply = <&vreg_s8c_1p3>;
> +		vdd-l4-l5-l6-supply = <&vreg_bob>;
> +		vdd-l7-l11-supply = <&vreg_bob>;
> +		vdd-l9-l10-supply = <&vreg_bob>;
> +
> +		vdd-bob-supply = <&vph_pwr>;
> +		vdd-flash-supply = <&vreg_bob>;
> +		vdd-rgb-supply = <&vreg_bob>;
> +
> +		vreg_bob: bob {
> +			regulator-min-microvolt = <3008000>;
> +			regulator-max-microvolt = <4000000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
> +			regulator-allow-bypass;
> +		};
> +
> +		vreg_s8c_1p3: smps8 {
> +			regulator-min-microvolt = <1352000>;
> +			regulator-max-microvolt = <1352000>;
> +		};
> +
> +		vreg_l1c_1p8: ldo1 {
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vdda_wcss_adcdac_1:
> +		vdda_wcss_adcdac_22:
> +		vreg_l2c_1p3: ldo2 {
> +			regulator-min-microvolt = <1304000>;
> +			regulator-max-microvolt = <1304000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vdda_hv_ebi0:
> +		vdda_hv_ebi1:
> +		vdda_hv_ebi2:
> +		vdda_hv_ebi3:
> +		vdda_hv_refgen0:
> +		vdda_mipi_dsi0_1p2:
> +		vdda_qlink_hv_ck:
> +		vreg_l3c_1p2: ldo3 {
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vddpx_5:
> +		vreg_l4c_1p8: ldo4 {
> +			regulator-min-microvolt = <1704000>;
> +			regulator-max-microvolt = <2928000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vddpx_6:
> +		vreg_l5c_1p8: ldo5 {
> +			regulator-min-microvolt = <1704000>;
> +			regulator-max-microvolt = <2928000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vddpx_2:
> +		vreg_l6c_2p9: ldo6 {
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <2960000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l7c_3p0: ldo7 {
> +			regulator-min-microvolt = <2856000>;
> +			regulator-max-microvolt = <3104000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l8c_1p8: ldo8 {
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l9c_2p9: ldo9 {
> +			regulator-min-microvolt = <2704000>;
> +			regulator-max-microvolt = <2960000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l10c_3p3: ldo10 {
> +			regulator-min-microvolt = <3000000>;
> +			regulator-max-microvolt = <3312000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l11c_3p3: ldo11 {
> +			regulator-min-microvolt = <3000000>;
> +			regulator-max-microvolt = <3312000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +	};
> +};
> +
> +&gmu {
> +	status = "okay";
> +};
> +
> +&gpi_dma2 {
> +	status = "okay";
> +};
> +
> +&gpu {
> +	zap-shader {
> +		memory-region = <&gpu_mem>;
> +		firmware-name = "qcom/sm8150/xiaomi/raphael/a640_zap.mbn";

The vendor should start with upper case, so Xiaomi here (and everywhere 
else)

> +	};
> +
> +	status = "okay";
> +};
> +
> +&i2c19 {
> +	/* goodix,gt9886 @5d  */
> +};
> +
> +&mdss {
> +	status = "okay";
> +};
> +
> +&mdss_dsi0 {
> +	vdda-supply = <&vdda_mipi_dsi0_1p2>;
> +
> +	status = "okay";
> +	panel: panel@0 {
> +		compatible = "samsung,ams639rq08";
> +		reg = <0>;
> +
> +		vddio-supply = <&vreg_l14a_1p8>;
> +		vdd3p3-supply = <&disp_vci_vreg>;
> +		vsn-supply = <&vreg_ibb>;
> +		vsp-supply = <&vreg_lab>;
> +
> +		reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
> +
> +		pinctrl-names = "default", "sleep";

pinctrl-names should come after pinctrl-N

> +		pinctrl-0 = <&panel_reset_pin &panel_te_pin>;

you're missing the pinctrl-1 for the "sleep"

> +
> +		status = "okay";

missing newline

> +		port {
> +			panel_in: endpoint {
> +				remote-endpoint = <&mdss_dsi0_out>;
> +			};
> +		};
> +	};
> +};
> +
> +&mdss_dsi0_out {
> +	data-lanes = <0 1 2 3>;
> +	remote-endpoint = <&panel_in>;
> +};
> +
> +&mdss_dsi0_phy {
> +	vdds-supply = <&vreg_l5a_0p875>;
> +
> +	status = "okay";
> +};
> +
> +&pm8150_gpios {
> +	vol_up_n: vol-up-n-state {
> +		pins = "gpio6";
> +		function = PMIC_GPIO_FUNC_NORMAL;
> +		input-enable;
> +		bias-pull-up;
> +	};
> +};
> +
> +&pm8150b_typec {
> +	vdd-vbus-supply = <&pm8150b_vbus>;
> +	vdd-pdphy-supply = <&vdda_usb_hs_3p1>;
> +
> +	status = "okay";

newline

> +	connector {
> +		compatible = "usb-c-connector";
> +		power-role = "source";
> +		data-role = "dual";
> +		self-powered;
> +
> +		source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_DUAL_ROLE |
> +					 PDO_FIXED_USB_COMM | PDO_FIXED_DATA_SWAP)>;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +
> +				pm8150b_hs_in: endpoint {
> +					remote-endpoint = <&usb_1_dwc3_hs>;
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&pm8150b_vbus {
> +	regulator-min-microamp = <500000>;
> +	regulator-max-microamp = <3000000>;
> +
> +	status = "okay";
> +};
> +
> +&pm8150l_flash {
> +
> +	status = "okay";

newline

> +	led-1 {
> +		function = LED_FUNCTION_FLASH;
> +		color = <LED_COLOR_ID_WHITE>;
> +		led-sources = <1>;
> +		led-max-microamp = <150000>;
> +		flash-max-microamp = <1000000>;
> +		flash-max-timeout-us = <1280000>;
> +	};
> +
> +	led-2 {
> +		function = LED_FUNCTION_FLASH;
> +		color = <LED_COLOR_ID_YELLOW>;
> +		led-sources = <2>;
> +		led-max-microamp = <150000>;
> +		flash-max-microamp = <1000000>;
> +		flash-max-timeout-us = <1280000>;
> +	};
> +};
> +
> +&pm8150l_lpg {
> +
> +	status = "okay";

newline

> +	led@1 {
> +		reg = <1>;
> +		color = <LED_COLOR_ID_WHITE>;
> +		function = LED_FUNCTION_STATUS;
> +
> +		status = "disabled";
> +	};
> +
> +	led@2 {
> +		reg = <2>;
> +		color = <LED_COLOR_ID_RED>;
> +		function = LED_FUNCTION_STATUS;
> +		function-enumerator = <0>;
> +	};
> +
> +	led@3 {
> +		reg = <3>;
> +		color = <LED_COLOR_ID_RED>;
> +		function = LED_FUNCTION_STATUS;
> +		function-enumerator = <1>;
> +	};
> +};
> +
> +&pm8150l_wled {
> +	qcom,num-strings = <3>;
> +	qcom,cabc;
> +	qcom,cabc-sel = <1>;
> +};
> +
> +&pon {
> +	mode-bootloader = <0x2>;
> +	mode-recovery = <0x1>;
> +};
> +
> +&pon_pwrkey {
> +	status = "okay";
> +};
> +
> +&pon_resin {
> +	linux,code = <KEY_VOLUMEDOWN>;
> +
> +	status = "okay";
> +};
> +
> +&qupv3_id_1 {
> +	status = "okay";
> +};
> +
> +&qupv3_id_2 {
> +	status = "okay";
> +};
> +
> +&remoteproc_adsp {
> +	firmware-name = "qcom/sm8150/xiaomi/raphael/adsp.mbn";
> +
> +	status = "okay";
> +};
> +
> +&remoteproc_cdsp {
> +	firmware-name = "qcom/sm8150/xiaomi/raphael/cdsp.mbn";
> +
> +	status = "okay";
> +};
> +
> +&remoteproc_mpss {
> +	firmware-name = "qcom/sm8150/xiaomi/raphael/modem.mbn";
> +
> +	status = "okay";
> +};
> +
> +&remoteproc_slpi {
> +	firmware-name = "qcom/sm8150/xiaomi/raphael/slpi.mbn";
> +
> +	status = "disabled";
> +};

