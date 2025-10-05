Return-Path: <linux-arm-msm+bounces-75980-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8EBBB97A3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Oct 2025 15:35:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2C6D6344DF6
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Oct 2025 13:35:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8DB62882CC;
	Sun,  5 Oct 2025 13:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b="QsRyu3g5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ixit.cz (ip-94-112-25-9.bb.vodafone.cz [94.112.25.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF221EA7CE;
	Sun,  5 Oct 2025 13:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.112.25.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759671323; cv=none; b=VCCvNLwINeEfQghQ9Zjt/m2gRf1fkwE0pxO/12cd9AYOkBL79VHfvQCtVgCe/2+JKkqIPCNXlO6jfwB4ClV3NY7V/14G6cb5gF8rsHs68wR8ynH1zFQb4e4hi7MhZNg8HK0u+rN85ot4jq6juZS42Mkk6zU/BIpbwvLMmJpvfzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759671323; c=relaxed/simple;
	bh=NNsOvbYBINqne9WuHGlsOReTJdEHGjqFziwjtSv3qlk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cfD+VzQtNAZz7p5bMTilDgBd//BP+fmuha1oW0L1K9HasiCtb8DF6uiEHs1E73JKRtpnfxmOA9lk3vGzs4stQ1uREp+T3G0oK10e6DEXCpM/UMgOKjG8Zse2wrRnMziu13u/r34+4raEG5uDABXq6ZFsYKLE7kyjYNIGj7ml6gI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz; spf=pass smtp.mailfrom=ixit.cz; dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b=QsRyu3g5; arc=none smtp.client-ip=94.112.25.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ixit.cz
Received: from [192.168.3.68] (p57b4cc6f.dip0.t-ipconnect.de [87.180.204.111])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ixit.cz (Postfix) with ESMTPSA id 425EA53417F5;
	Sun, 05 Oct 2025 15:25:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
	t=1759670705;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=LTki10POCvcFgGRstRH6D2JVWeXbtawViKqFT4EjhcU=;
	b=QsRyu3g5I5pwhZUu8TOo0X0nf1mWe0qBGSPFH3+SLkqBE1uUkaCD2svcEalLTE/AaS8lIm
	bKhg1g7FkdEKHyLklu1a7ordgWCFtOKHjiM4qA5t93+WaWL09nf78m94ITz6Qn6FNc4Eh3
	g2rtIUA0wjtqOl+Ae2juwRIEwub1/Oo=
Message-ID: <ca48eace-eb7f-44b6-8bd6-f2249b38ef6a@ixit.cz>
Date: Sun, 5 Oct 2025 15:25:04 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Add support for Pixel 3 and Pixel 3
 XL
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Amit Pundir <amit.pundir@linaro.org>,
 Casey Connolly <casey@connolly.tech>, Joel Selvaraj <foss@joelselvaraj.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Vinod Koul <vkoul@kernel.org>
References: <20251005-pixel-3-v1-0-ab8b85f6133f@ixit.cz>
 <20251005-pixel-3-v1-2-ab8b85f6133f@ixit.cz>
Content-Language: en-US
From: David Heidelberg <david@ixit.cz>
Autocrypt: addr=david@ixit.cz; keydata=
 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
In-Reply-To: <20251005-pixel-3-v1-2-ab8b85f6133f@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 05/10/2025 15:16, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> This adds initial device tree support for the following phones:
> 
>   - Google Pixel 3 (blueline)
>   - Google Pixel 3 XL (crosshatch)
> 
> Both phone boards use the same identifiers and differ only slightly
> in their connected peripherals.
> 
> Supported functionality includes:
>   - Debug UART
>   - UFS
>   - Charger
>   - USB-C (peripheral mode)
>   - Display (Pixel 3 only)
> 
> GPIOs 0–3 and 81–84 are not accessible from the application CPUs,
> so they are marked as reserved to allow the Pixel 3 to boot.
> 
> The rmtfs region is allocated using UIO, making it technically "dynamic."
> 
> Its address and size can be read from sysfs:
> 
> $ cat /sys/class/uio/uio0/name
> /sys/class/uio/uio0/maps/map0/addr
> 0x00000000f2701000
> 
> $ cat /sys/class/uio/uio0/maps/map0/size
> 0x0000000000200000
> 
> Like the OnePlus 6, the Pixel 3 requires 1 kB of reserved memory on either
> side of the rmtfs region to work around an XPU bug that would otherwise
> cause erroneous violations when accessing the rmtfs_mem region.
> 
> Co-developed-by: Amit Pundir <amit.pundir@linaro.org>
> Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
> Co-developed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Co-developed-by: Casey Connolly <casey@connolly.tech>
> Signed-off-by: Casey Connolly <casey@connolly.tech>
> Co-developed-by: Joel Selvaraj <foss@joelselvaraj.com>
> Signed-off-by: Joel Selvaraj <foss@joelselvaraj.com>
> Co-developed-by: Sumit Semwal <sumit.semwal@linaro.org>
> Signed-off-by: Sumit Semwal <sumit.semwal@linaro.org>
> Co-developed-by: Vinod Koul <vkoul@kernel.org>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>   arch/arm64/boot/dts/qcom/Makefile                  |   2 +
>   .../arm64/boot/dts/qcom/sdm845-google-blueline.dts | 128 ++++++
>   arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi | 467 +++++++++++++++++++++
>   .../boot/dts/qcom/sdm845-google-crosshatch.dts     | 137 ++++++
>   4 files changed, 734 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 4bfa926b6a085..ba05dc935dc7c 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -239,6 +239,8 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-db845c.dtb
>   sdm845-db845c-navigation-mezzanine-dtbs	:= sdm845-db845c.dtb sdm845-db845c-navigation-mezzanine.dtbo
>   
>   dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-db845c-navigation-mezzanine.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-google-crosshatch.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-google-blueline.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-lg-judyln.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-lg-judyp.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-mtp.dtb
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts b/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts
> new file mode 100644
> index 0000000000000..df88982018b9e
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts
> @@ -0,0 +1,128 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +/dts-v1/;
> +
> +#include "sdm845-google-common.dtsi"
> +
> +/ {
> +	model = "Google Pixel 3";
> +	compatible = "google,blueline", "qcom,sdm845";
> +
> +	battery: battery {
> +		compatible = "simple-battery";
> +
> +		charge-full-design-microamp-hours = <2970000>;
> +		voltage-min-design-microvolt = <3600000>;
> +		voltage-max-design-microvolt = <4400000>;
> +	};
> +
> +	chosen {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		/* for u-boot */
> +		framebuffer: framebuffer@9d400000 {
> +			compatible = "simple-framebuffer";
> +			reg = <0 0x9d400000 0 (2160 * 1080 * 4)>;
> +			width = <1080>;
> +			height = <2160>;
> +			stride = <(1080 * 4)>;
> +			format = "a8r8g8b8";
> +		};
> +	};
> +
> +	reserved-memory {
> +		framebuffer_region@9d400000 {
> +			no-map;
> +			reg = <0 0x9d400000 0 0x02400000>; // FIXME
> +		};
> +	};
> +};
> +
> +&gmu {
> +	status = "okay";
> +};
> +
> +&mdss {
> +	status = "okay";
> +};
> +
> +&mdss_dsi0 {
> +	status = "okay";
> +	vdda-supply = <&vdda_mipi_dsi0_1p2>;
> +
> +	ports {
> +		port@1 {
> +			endpoint {
> +				remote-endpoint = <&panel_in>;
> +				data-lanes = <0 1 2 3>;
> +				qcom,te-source = "mdp_vsync_e";
> +			};
> +		};
> +	};
> +
> +	panel@0 {
> +		compatible = "lg,sw43408";
> +		reg = <0>;
> +
> +		vddi-supply = <&vreg_l14a_1p88>;
> +		vpnl-supply = <&vreg_l28a_3p0>;
> +
> +		reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&panel_reset_pins &panel_te_pin &panel_pmgpio_pins>;
> +
> +		port {
> +			panel_in: endpoint {
> +				remote-endpoint = <&mdss_dsi0_out>;
> +			};
> +		};
> +	};
> +};
> +
> +&mdss_dsi0_out {
> +	remote-endpoint = <&panel_in>;
> +	data-lanes = <0 1 2 3>;
> +};
> +
> +&mdss_dsi0_phy {
> +	vdds-supply = <&vdda_mipi_dsi0_pll>;
> +
> +	status = "okay";
> +};
> +
> +&pm8998_gpios {
> +	panel_pmgpio_pins: panel-pmgpio-active-state {
> +		pins = "gpio2", "gpio5";
> +		function = "normal";
> +		input-enable;
> +		bias-disable;
> +		power-source = <0>;
> +	};
> +};
> +
> +&tlmm {
> +	panel_te_pin: panel-te-state {
> +		pins = "gpio12";
> +		function = "mdp_vsync";
> +		drive-strength = <2>;
> +		bias-pull-down;
> +	};
> +
> +	panel_reset_pins: panel-active-state {
> +		pins = "gpio6";
> +		function = "gpio";
> +		drive-strength = <8>;
> +		bias-disable;
> +	};
> +
> +	panel_suspend: panel-suspend-state {
> +		pins = "gpio6";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-pull-down;
> +	};
> +
> +};
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
> new file mode 100644
> index 0000000000000..5015e54aed20c
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
> @@ -0,0 +1,467 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/arm/qcom,ids.h>
> +#include <dt-bindings/dma/qcom-gpi.h>
> +#include <dt-bindings/input/linux-event-codes.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +
> +#include "sdm845.dtsi"
> +#include "pm8998.dtsi"
> +#include "pmi8998.dtsi"
> +
> +/delete-node/ &mpss_region;
> +/delete-node/ &venus_mem;
> +/delete-node/ &cdsp_mem;
> +/delete-node/ &mba_region;
> +/delete-node/ &slpi_mem;
> +/delete-node/ &spss_mem;
> +/delete-node/ &rmtfs_mem;
> +
> +/ {
> +	chassis-type = "handset";
> +	qcom,board-id = <0x00021505 0>;
> +	qcom,msm-id = <QCOM_ID_SDM845 0x20001>;
> +
> +	aliases {
> +		serial0 = &uart9;
> +		serial1 = &uart6;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	reserved-memory {
> +		mpss_region: memory@8e000000 {
> +			reg = <0 0x8e000000 0 0x9800000>;
> +			no-map;
> +		};
> +
> +		venus_mem: venus@97800000 {
> +			reg = <0 0x97800000 0 0x500000>;
> +			no-map;
> +		};
> +
> +		cdsp_mem: cdsp-mem@97D00000 {
> +			reg = <0 0x97D00000 0 0x800000>;
> +			no-map;
> +		};
> +
> +		mba_region: mba@98500000 {
> +			reg = <0 0x98500000 0 0x200000>;
> +			no-map;
> +		};
> +
> +		slpi_mem: slpi@98700000 {
> +			reg = <0 0x98700000 0 0x1400000>;
> +			no-map;
> +		};
> +
> +		spss_mem: spss@99B00000 {
> +			reg = <0 0x99B00000 0 0x100000>;
> +			no-map;
> +		};
> +
> +		/* rmtfs lower guard */
> +		memory@f2700000 {
> +			reg = <0 0xf2700000 0 0x1000>;
> +			no-map;
> +		};
> +
> +		rmtfs_mem: memory@f2701000 {
> +			compatible = "qcom,rmtfs-mem";
> +			reg = <0 0xf2701000 0 0x200000>;
> +			no-map;
> +
> +			qcom,client-id = <1>;
> +			qcom,vmid = <15>;
> +		};
> +
> +		/* rmtfs upper guard */
> +		memory@f2901000 {
> +			reg = <0 0xf2901000 0 0x1000>;
> +			no-map;
> +		};
> +	};
> +
> +	volume-keys {
> +		compatible = "gpio-keys";
> +		label = "Volume keys";
> +		autorepeat;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&volume_up_gpio>;
> +
> +		key-vol-up {
> +			label = "Volume Up";
> +			linux,code = <KEY_VOLUMEUP>;
> +			gpios = <&pm8998_gpios 6 GPIO_ACTIVE_LOW>;
> +			debounce-interval = <15>;
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
> +	vreg_s4a_1p8: vreg-s4a-1p8-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg_s4a_1p8";
> +
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		regulator-always-on;
> +		regulator-boot-on;
> +
> +		vin-supply = <&vph_pwr>;
> +	};
> +};
> +
> +&apps_rsc {
> +	regulators-0 {
> +		compatible = "qcom,pm8998-rpmh-regulators";
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
> +		vdd-s11-supply = <&vph_pwr>;
> +		vdd-s12-supply = <&vph_pwr>;
> +		vdd-s13-supply = <&vph_pwr>;
> +		vdd-l1-l27-supply = <&vreg_s7a_1p025>;
> +		vdd-l2-l8-l17-supply = <&vreg_s3a_1p35>;
> +		vdd-l3-l11-supply = <&vreg_s7a_1p025>;
> +		vdd-l4-l5-supply = <&vreg_s7a_1p025>;
> +		vdd-l6-supply = <&vph_pwr>;
> +		vdd-l7-l12-l14-l15-supply = <&vreg_s5a_2p04>;
> +		vdd-l9-supply = <&vreg_bob>;
> +		vdd-l10-l23-l25-supply = <&vreg_bob>;
> +		vdd-l13-l19-l21-supply = <&vreg_bob>;
> +		vdd-l16-l28-supply = <&vreg_bob>;
> +		vdd-l18-l22-supply = <&vreg_bob>;
> +		vdd-l20-l24-supply = <&vreg_bob>;
> +		vdd-l26-supply = <&vreg_s3a_1p35>;
> +		vin-lvs-1-2-supply = <&vreg_s4a_1p8>;
> +
> +		vreg_s3a_1p35: smps3 {
> +			regulator-min-microvolt = <1352000>;
> +			regulator-max-microvolt = <1352000>;
> +		};
> +
> +		vreg_s5a_2p04: smps5 {
> +			regulator-min-microvolt = <1904000>;
> +			regulator-max-microvolt = <2040000>;
> +		};
> +
> +		vreg_s7a_1p025: smps7 {
> +			regulator-min-microvolt = <900000>;
> +			regulator-max-microvolt = <1028000>;
> +		};
> +
> +		vdda_mipi_dsi0_pll:
> +		vreg_l1a_0p875: ldo1 {
> +			regulator-min-microvolt = <880000>;
> +			regulator-max-microvolt = <880000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-boot-on;
> +		};
> +
> +		vreg_l5a_0p8: ldo5 {
> +			regulator-min-microvolt = <800000>;
> +			regulator-max-microvolt = <800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l12a_1p8: ldo12 {
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l7a_1p8: ldo7 {
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l13a_2p95: ldo13 {
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <2960000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l14a_1p88: ldo14 {
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-boot-on;
> +			/*
> +			 * We can't properly bring the panel back if it gets turned off
> +			 * so keep it's regulators always on for now.
> +			 */
> +			regulator-always-on;
> +		};
> +
> +		vreg_l17a_1p3: ldo17 {
> +			regulator-min-microvolt = <1304000>;
> +			regulator-max-microvolt = <1304000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l19a_3p3: ldo19 {
> +			regulator-min-microvolt = <3300000>;
> +			regulator-max-microvolt = <3312000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			/*
> +			 * The touchscreen needs this to be 3.3v, which is apparently
> +			 * quite close to the hardware limit for this LDO (3.312v)
> +			 * It must be kept in high power mode to prevent TS brownouts
> +			 */
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l20a_2p95: ldo20 {
> +			regulator-min-microvolt = <2960000>;
> +			regulator-max-microvolt = <2968000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l21a_2p95: ldo21 {
> +			regulator-min-microvolt = <2960000>;
> +			regulator-max-microvolt = <2968000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l24a_3p075: ldo24 {
> +			regulator-min-microvolt = <3088000>;
> +			regulator-max-microvolt = <3088000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l25a_3p3: ldo25 {
> +			regulator-min-microvolt = <3300000>;
> +			regulator-max-microvolt = <3312000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vdda_mipi_dsi0_1p2:
> +		vreg_l26a_1p2: ldo26 {
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-boot-on;
> +		};
> +
> +		vreg_l28a_3p0: ldo28 {
> +			regulator-min-microvolt = <2856000>;
> +			regulator-max-microvolt = <3008000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
> +			regulator-boot-on;
> +			/*
> +			 * We can't properly bring the panel back if it gets turned off
> +			 * so keep it's regulators always on for now.
> +			 */
> +			regulator-always-on;
> +		};
> +	};
> +
> +	regulators-1 {
> +		compatible = "qcom,pmi8998-rpmh-regulators";
> +		qcom,pmic-id = "b";
> +
> +		vdd-bob-supply = <&vph_pwr>;
> +
> +		vreg_bob: bob {
> +			regulator-min-microvolt = <3312000>;
> +			regulator-max-microvolt = <3600000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
> +			regulator-allow-bypass;
> +		};
> +	};
> +
> +	regulators-2 {
> +		compatible = "qcom,pm8005-rpmh-regulators";
> +		qcom,pmic-id = "c";
> +
> +		vdd-s1-supply = <&vph_pwr>;
> +		vdd-s2-supply = <&vph_pwr>;
> +		vdd-s3-supply = <&vph_pwr>;
> +		vdd-s4-supply = <&vph_pwr>;
> +
> +		vreg_s3c_0p6: smps3 {
> +			regulator-min-microvolt = <600000>;
> +			regulator-max-microvolt = <600000>;
> +		};
> +	};
> +};
> +
> +&gcc {
> +	protected-clocks = <GCC_QSPI_CORE_CLK>,
> +			   <GCC_QSPI_CORE_CLK_SRC>,
> +			   <GCC_QSPI_CNOC_PERIPH_AHB_CLK>;
> +};
> +
> +&gpi_dma0 {
> +	status = "okay";
> +};
> +
> +&pm8998_gpios {
> +	volume_up_gpio: vol-up-active-state {
> +		pins = "gpio6";
> +		function = "normal";
> +		input-enable;
> +		bias-pull-up;
> +		qcom,drive-strength = <0>;
> +	};
> +};
> +
> +&pm8998_resin {
> +	linux,code = <KEY_VOLUMEDOWN>;
> +
> +	status = "okay";
> +};
> +
> +&pmi8998_charger {
> +	monitored-battery = <&battery>;
> +
> +	status = "okay";
> +};
> +
> +&qupv3_id_0 {
> +	status = "okay";
> +};
> +
> +&qupv3_id_1 {
> +	status = "okay";
> +};
> +
> +&qup_uart9_rx {
> +	drive-strength = <2>;
> +	bias-pull-up;
> +};
> +
> +&qup_uart9_tx {
> +	drive-strength = <2>;
> +	bias-disable;
> +};
> +
> +&tlmm {
> +	gpio-reserved-ranges = <0 4>, <81 4>;
> +
> +	touchscreen_reset: ts-reset-state {
> +		pins = "gpio99";
> +		function = "gpio";
> +		drive-strength = <8>;
> +		bias-pull-up;
> +	};
> +
> +	touchscreen_pins: ts-pins-gpio-state {
> +		pins = "gpio125";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	touchscreen_i2c_pins: qup-i2c2-gpio-state {
> +		pins = "gpio27", "gpio28";
> +		function = "gpio";
> +
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +};
> +
> +&uart6 {
> +	pinctrl-0 = <&qup_uart6_4pin>;
> +
> +	status = "okay";
> +};
> +
> +&uart9 {
> +	label = "LS-UART1";
> +
> +	status = "okay";
> +};
> +
> +&usb_1 {
> +	status = "okay";
> +};
> +
> +&usb_1_dwc3 {
> +	dr_mode = "peripheral";
> +};
> +
> +&usb_1_hsphy {
> +	vdd-supply = <&vreg_l1a_0p875>;
> +	vdda-pll-supply = <&vreg_l12a_1p8>;
> +	vdda-phy-dpdm-supply = <&vreg_l24a_3p075>;
> +
> +	qcom,imp-res-offset-value = <8>;
> +	qcom,hstx-trim-value = <QUSB2_V2_HSTX_TRIM_21_6_MA>;
> +	qcom,preemphasis-level = <QUSB2_V2_PREEMPHASIS_5_PERCENT>;
> +	qcom,preemphasis-width = <QUSB2_V2_PREEMPHASIS_WIDTH_HALF_BIT>;
> +
> +	status = "okay";
> +};
> +
> +&usb_1_qmpphy {
> +	vdda-phy-supply = <&vreg_l26a_1p2>;
> +	vdda-pll-supply = <&vreg_l1a_0p875>;
> +
> +	status = "okay";
> +};
> +
> +&usb_2 {
> +	status = "okay";
> +};
> +
> +&usb_2_dwc3 {
> +	dr_mode = "host";
> +};
> +
> +&usb_2_hsphy {
> +	vdd-supply = <&vreg_l1a_0p875>;
> +	vdda-pll-supply = <&vreg_l12a_1p8>;
> +	vdda-phy-dpdm-supply = <&vreg_l24a_3p075>;
> +
> +	qcom,imp-res-offset-value = <8>;
> +	qcom,hstx-trim-value = <QUSB2_V2_HSTX_TRIM_22_8_MA>;
> +
> +	status = "okay";
> +};
> +
> +&usb_2_qmpphy {
> +	vdda-phy-supply = <&vreg_l26a_1p2>;
> +	vdda-pll-supply = <&vreg_l1a_0p875>;
> +
> +	status = "okay";
> +};
> +
> +&ufs_mem_hc {
> +	reset-gpios = <&tlmm 150 GPIO_ACTIVE_LOW>;
> +
> +	vcc-supply = <&vreg_l20a_2p95>;
> +	vcc-max-microamp = <800000>;
> +
> +	status = "okay";
> +};
> +
> +&ufs_mem_phy {
> +	vdda-phy-supply = <&vreg_l1a_0p875>;
> +	vdda-pll-supply = <&vreg_l26a_1p2>;
> +
> +	status = "okay";
> +};
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-google-crosshatch.dts b/arch/arm64/boot/dts/qcom/sdm845-google-crosshatch.dts
> new file mode 100644
> index 0000000000000..dc9938ffc0ab8
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sdm845-google-crosshatch.dts
> @@ -0,0 +1,137 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +/dts-v1/;
> +
> +#include "sdm845-google-common.dtsi"
> +
> +/ {
> +	model = "Google Pixel 3 XL";
> +	compatible = "google,crosshatch", "qcom,sdm845";
> +
> +	battery: battery {
> +		compatible = "simple-battery";
> +
> +		charge-full-design-microamp-hours = <3480000>;
> +		voltage-min-design-microvolt = <3600000>;
> +		voltage-max-design-microvolt = <4400000>;
> +	};
> +
> +	chosen {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		/* for u-boot */
> +		framebuffer: framebuffer@9d400000 {
> +			compatible = "simple-framebuffer";
> +			reg = <0 0x9d400000 0 (2960 * 1440 * 4)>;
> +			width = <1440>;
> +			height = <2960>;
> +			stride = <(1440 * 4)>;
> +			format = "a8r8g8b8";
> +		};
> +	};
> +
> +	reserved-memory {
> +		framebuffer_region@9d400000 {
> +			no-map;
> +			reg = <0 0x9d400000 0 0x02400000>;
> +		};
> +	};
> +};
> +
> +&gmu {
> +	status = "okay";
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
> +
> +	ports {
> +		port@1 {
> +			endpoint {
> +				remote-endpoint = <&panel_in>;
> +				data-lanes = <0 1 2 3>;
> +				qcom,te-source = "mdp_vsync_e";
> +			};
> +		};
> +	};
> +
> +	panel@0 {
> +		compatible = "samsung,s6e3ha8";
> +		reg = <0>;
> +
> +		vci-supply = <&vreg_l28a_3p0>; // downstream
> +		vdd3-supply = <&vreg_l28a_3p0>;
> +		vddr-supply = <&vreg_l14a_1p88>;
> +
> +		reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&panel_reset_pins &panel_te_pin &se8_spiflash &panel_pmgpio_pins>;
> +
> +		port {
> +			panel_in: endpoint {
> +				remote-endpoint = <&mdss_dsi0_out>;
> +			};
> +		};
> +	};

Please, ignore the panel and display related nodes. I accidentally 
sneaked the WIP parts somehow into the upstream commit. Only framebuffer 
works on the Pixel 3 XL. In next version these nodes will be gone for 
the initial inclusion.

David

> +};
> +
> +&mdss_dsi0_out {
> +	data-lanes = <0 1 2 3>;
> +	remote-endpoint = <&panel_in>;
> +};
> +
> +&mdss_dsi0_phy {
> +	vdds-supply = <&vdda_mipi_dsi0_pll>;
> +
> +	status = "okay";
> +};
> +
> +&pm8998_gpios {
> +	panel_pmgpio_pins: panel-pmgpio-active-state {
> +		pins = "gpio2", "gpio5";
> +		function = "normal";
> +		input-enable;
> +		bias-disable;
> +		power-source = <0>;
> +	};
> +};
> +
> +&tlmm {
> +	se8_spiflash: se8-spiflash-state {
> +		pins = "gpio65", "gpio66", "gpio67", "gpio68";
> +		function = "gpio";
> +		input-enable;
> +		bias-disable;
> +	};
> +
> +	panel_te_pin: panel-te-state {
> +		pins = "gpio12";
> +		function = "mdp_vsync";
> +		drive-strength = <2>;
> +		bias-pull-down;
> +	};
> +
> +	panel_reset_pins: panel-active-state {
> +		pins = "gpio6";
> +		function = "gpio";
> +		drive-strength = <8>;
> +		bias-disable;
> +	};
> +
> +	panel_suspend: panel-suspend-state {
> +		pins = "gpio6";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-pull-down;
> +	};
> +
> +};
> 


