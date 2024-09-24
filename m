Return-Path: <linux-arm-msm+bounces-32248-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A849842F3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 12:04:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 20B832877F2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 10:04:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E56AE1714A1;
	Tue, 24 Sep 2024 10:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VzNkAnUr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E441714B7;
	Tue, 24 Sep 2024 10:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727172260; cv=none; b=WIYqdHhBPFe2WJHL+AMbjv7EfgDgeU3BkjjSZsNqfkaW7VacmGT6fyGPTCEKMcS5puTJeZS1YHZG0WBCH/RDDJ5QX6fxqd1XF5KhdJ3UXE4voiSjxhxBkeVEdboHD6D1SjoFu99uREUDuNeMrf49A9JJIeMfcAyx9sgHvqzId3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727172260; c=relaxed/simple;
	bh=JKF8ELoJkONwUYfj3KMmAzHc2KLYeFAMuf9Lsxco2Yo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PbNE7QxPTHEkzxJYTptdz0oDzRwmPFc/nQjw7fv9y8nJQDtY19Xe2U+jT9yfTJ1BJgsnYJocPhzK5mFdi02GzYdWw7ozt9x938StNww8AuoRSFm3goXsSElg8F4AePLzhckPf348GnXgwSx6YqrEdbM/m4+wkwjDcsYMlSiIiF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VzNkAnUr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC3CAC4CEC5;
	Tue, 24 Sep 2024 10:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727172260;
	bh=JKF8ELoJkONwUYfj3KMmAzHc2KLYeFAMuf9Lsxco2Yo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VzNkAnUrukgczEZg6syYlItYsPBIOpLqTANDRPaP1ljjVnmWEFacU2n/lPpxk+sQk
	 V8rhCK489NCzH48eX84sJBUWJY6qZadhaHnEmUX5a8oQNaT7VOqqbOJ8GPo1NKO2Vy
	 l98iMlKodDlntjBTCvv+bvYnKwZ6uMjBvwlmz63JrfyRjD5rqdpigTsgQXjLdKYN1G
	 huWZiwkZoK6Hj7osVlvpUWygEpIzFseBRi3RKwf5z/hYmWAjHifZMVHwkRslpXkHtO
	 CllHZAql1DzxPwx1ZTTgQq0BPvw4K9OkOj3UbDvMRuigaeFvaugk5LkZVC9DEDkDyZ
	 PCjj/S0lzIBbQ==
Date: Tue, 24 Sep 2024 12:04:16 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Merck Hung <merckhung@gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: sc8280xp-wdk2023: dt definition
 for WDK2023
Message-ID: <jgyyaioauxdwypenbtjeg2wjl6fiv5mocavnhyislcwh6sybfb@kwz4tiswy7yk>
References: <20240920-jg-blackrock-for-upstream-v2-0-9bf2f1b2191c@oldschoolsolutions.biz>
 <20240920-jg-blackrock-for-upstream-v2-1-9bf2f1b2191c@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240920-jg-blackrock-for-upstream-v2-1-9bf2f1b2191c@oldschoolsolutions.biz>

On Fri, Sep 20, 2024 at 07:47:24PM +0200, Jens Glathe wrote:
> Device tree for the Windows Dev Kit 2023. This work
> is based on the initial work of Merck Hung <merckhung@gmail.com>.
> 
> Supported features:
> - USB type-c and type-a ports
> - minidp connector
> - built-in r8152 Ethernet adapter
> - PCIe devices
> - nvme
> - ath11k WiFi (WCN6855)
> - WCN6855 Bluetooth
> - A690 GPU
> - Venus codec
> - ADSP and CDSP
> - GPIO keys
> - Audio definition (works via USB)
> 
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> Signed-off-by: Merck Hung <merckhung@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile                  |    1 +
>  .../boot/dts/qcom/sc8280xp-microsoft-blackrock.dts | 1332 ++++++++++++++++++++

Subject perfix does not match device. I guess you wanted
sc8280xp-blackrock: as prefix?


>  2 files changed, 1333 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 0e5c810304fb..648e283498d2 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -184,6 +184,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sc8180x-lenovo-flex-5g.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sc8180x-primus.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sc8280xp-crd.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sc8280xp-lenovo-thinkpad-x13s.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= sc8280xp-microsoft-blackrock.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sda660-inforce-ifc6560.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm450-lenovo-tbx605f.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm450-motorola-ali.dtb
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts
> new file mode 100644
> index 000000000000..a16e0b739647
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts
> @@ -0,0 +1,1332 @@
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
> +	model = "Windows Dev Kit 2023";
> +	compatible = "microsoft,blackrock", "qcom,sc8280xp";
> +
> +	aliases {
> +		i2c4 = &i2c4;
> +		i2c21 = &i2c21;
> +		serial1 = &uart2;
> +	};
> +
> +	wcd938x: audio-codec {
> +		compatible = "qcom,wcd9380-codec";
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&wcd_default>;
> +
> +		reset-gpios = <&tlmm 106 GPIO_ACTIVE_LOW>;
> +
> +		vdd-buck-supply = <&vreg_s10b>;
> +		vdd-rxtx-supply = <&vreg_s10b>;
> +		vdd-io-supply = <&vreg_s10b>;
> +		vdd-mic-bias-supply = <&vreg_bob>;
> +
> +		qcom,micbias1-microvolt = <1800000>;
> +		qcom,micbias2-microvolt = <1800000>;
> +		qcom,micbias3-microvolt = <1800000>;
> +		qcom,micbias4-microvolt = <1800000>;
> +		qcom,mbhc-buttons-vthreshold-microvolt = <75000 150000 237000 500000 500000 500000 500000 500000>;
> +		qcom,mbhc-headset-vthreshold-microvolt = <1700000>;
> +		qcom,mbhc-headphone-vthreshold-microvolt = <50000>;
> +		qcom,rx-device = <&wcd_rx>;
> +		qcom,tx-device = <&wcd_tx>;
> +
> +		#sound-dai-cells = <1>;
> +	};
> +
> +	firmware {
> +		qseecom {
> +			compatible = "qcom,qseecom-sc8280xp", "qcom,qseecom";

This was not accepted. Mention in changelog any external
work-in-progress.


> +			qcom,scm = <&scm>;
> +		};
> +	};
> +
> +	pmic-glink {
> +		compatible = "qcom,sc8280xp-pmic-glink", "qcom,pmic-glink";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		orientation-gpios = <&tlmm 166 GPIO_ACTIVE_HIGH>,
> +				    <&tlmm 49 GPIO_ACTIVE_HIGH>;
> +
> +		connector@0 {
> +			compatible = "usb-c-connector";
> +			reg = <0>;
> +			power-role = "source";
> +			data-role = "dual";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					pmic_glink_con0_hs: endpoint {
> +						remote-endpoint = <&usb_0_dwc3_hs>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					pmic_glink_con0_ss: endpoint {
> +						remote-endpoint = <&usb_0_qmpphy_out>;
> +					};
> +				};
> +
> +				port@2 {
> +					reg = <2>;
> +
> +					pmic_glink_con0_sbu: endpoint {
> +						remote-endpoint = <&usb0_sbu_mux>;
> +					};
> +				};
> +			};
> +		};
> +
> +		connector@1 {
> +			compatible = "usb-c-connector";
> +			reg = <1>;
> +			power-role = "source";
> +			data-role = "dual";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				port@0 {
> +					reg = <0>;
> +
> +					pmic_glink_con1_hs: endpoint {
> +						remote-endpoint = <&usb_1_dwc3_hs>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					pmic_glink_con1_ss: endpoint {
> +						remote-endpoint = <&usb_1_qmpphy_out>;
> +					};
> +				};
> +
> +				port@2 {
> +					reg = <2>;
> +
> +					pmic_glink_con1_sbu: endpoint {
> +						remote-endpoint = <&usb1_sbu_mux>;
> +					};
> +				};
> +			};
> +		};
> +	};
> +
> +	dp1-connector@0 {

That's not a bus. Also, connector, not dp-connector.


> +		compatible = "dp-connector";
> +		label = "DP1";
> +		type = "mini";
> +
> +		dp-pwr-supply = <&vreg_misc_3p3>;
> +
> +		//hpd-gpios = <&tlmm 2 GPIO_ACTIVE_HIGH>;

No dead code. At least not without comments and explanation.

> +
> +		port {
> +			dp1_connector_in: endpoint {
> +				remote-endpoint = <&mdss0_dp2_phy_out>;
> +			};
> +		};
> +	};

...


> +&dispcc0 {
> +	status = "okay";
> +};
> +
> +&gpu {
> +	status = "okay";
> +
> +	zap-shader {
> +		memory-region = <&gpu_mem>;
> +		firmware-name = "qcom/sc8280xp/MICROSOFT/DEVKIT23/qcdxkmsuc8280.mbn";
> +	};
> +};
> +
> +&mdss0 {
> +	status = "okay";
> +};
> +
> +&mdss0_dp0 {
> +	status = "okay";
> +};
> +
> +&mdss0_dp0_out {
> +	data-lanes = <0 1>;
> +	remote-endpoint = <&usb_0_qmpphy_dp_in>;
> +};
> +
> +&mdss0_dp1 {
> +	status = "okay";
> +};
> +
> +&mdss0_dp1_out {
> +	data-lanes = <0 1>;
> +	remote-endpoint = <&usb_1_qmpphy_dp_in>;
> +};
> +
> +&mdss0_dp2 {
> +  compatible = "qcom,sc8280xp-dp";

Messed indentation.

> +
> +  data-lanes = <0 1 2 3>;
> +
> +	status = "okay";
> +
> +	ports {
> +		port@1 {
> +			reg = <1>;
> +			mdss0_dp2_phy_out: endpoint {
> +				remote-endpoint = <&dp1_connector_in>;
> +			};
> +		};
> +	};
> +};
> +
> +&mdss0_dp2_phy {
> +	compatible = "qcom,sc8280xp-dp-phy";
> +
> +	vdda-phy-supply = <&vreg_l3b>;
> +	phy-supply = <&vreg_l3b>;
> +	vdda-pll-supply = <&vreg_l6b>;
> +	pll-supply = <&vreg_l6b>;
> +
> +	status = "okay";
> +};
> +
> +&pcie2a {
> +	aspm-no-l0s;
> +	max-link-speed = <16>;
> +
> +	perst-gpios = <&tlmm 143 GPIO_ACTIVE_LOW>;
> +	wake-gpios = <&tlmm 145 GPIO_ACTIVE_LOW>;
> +
> +	vddpe-3v3-supply = <&vreg_nvme>;
> +	pcie-vdda-supply = <&vreg_l7d>;
> +	vdda-supply = <&vreg_l7d>;
> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pcie2a_default>;
> +
> +	status = "okay";
> +};
> +
> +&pcie2a_phy {
> +	vdda-phy-supply = <&vreg_l4d>;
> +	phy-supply = <&vreg_l4d>;
> +	vdda-pll-supply = <&vreg_l6d>;
> +	pll-supply = <&vreg_l6d>;
> +
> +	status = "okay";
> +};
> +
> +&pcie4 {
> +	max-link-speed = <2>;
> +	aspm-no-l0s;
> +
> +	perst-gpios = <&tlmm 141 GPIO_ACTIVE_LOW>;
> +	wake-gpios = <&tlmm 139 GPIO_ACTIVE_LOW>;
> +
> +	vddpe-3v3-supply = <&vreg_wlan>;
> +	pcie-vdda-supply = <&vreg_l7d>;
> +	vdda-supply = <&vreg_l7d>;
> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pcie4_default>;
> +
> +	status = "okay";
> +};
> +
> +&pcie4_port0 {
> +	wifi@0 {
> +		compatible = "pci17cb,1103";
> +		reg = <0x10000 0x0 0x0 0x0 0x0>;
> +
> +		qcom,ath11k-calibration-variant = "volterra";
> +	};
> +};
> +
> +&pcie4_phy {
> +	vdda-phy-supply = <&vreg_l4d>;
> +	phy-supply = <&vreg_l4d>;
> +	vdda-pll-supply = <&vreg_l6d>;
> +	pll-supply = <&vreg_l6d>;
> +
> +	status = "okay";
> +};
> +
> +&pmc8280c_lpg {
> +	status = "okay";
> +};
> +
> +&pmk8280_adc_tm {
> +	status = "okay";
> +
> +	sys-therm@0 {
> +		reg = <0>;
> +		io-channels = <&pmk8280_vadc PM8350_ADC7_AMUX_THM1_100K_PU(1)>;
> +		qcom,hw-settle-time-us = <200>;
> +		qcom,avg-samples = <2>;
> +		qcom,ratiometric;
> +	};
> +
> +	sys-therm@1 {
> +		reg = <1>;
> +		io-channels = <&pmk8280_vadc PM8350_ADC7_AMUX_THM2_100K_PU(1)>;
> +		qcom,hw-settle-time-us = <200>;
> +		qcom,avg-samples = <2>;
> +		qcom,ratiometric;
> +	};
> +
> +	sys-therm@2 {
> +		reg = <2>;
> +		io-channels = <&pmk8280_vadc PM8350_ADC7_AMUX_THM3_100K_PU(1)>;
> +		qcom,hw-settle-time-us = <200>;
> +		qcom,avg-samples = <2>;
> +		qcom,ratiometric;
> +	};
> +
> +	sys-therm@3 {
> +		reg = <3>;
> +		io-channels = <&pmk8280_vadc PM8350_ADC7_AMUX_THM4_100K_PU(1)>;
> +		qcom,hw-settle-time-us = <200>;
> +		qcom,avg-samples = <2>;
> +		qcom,ratiometric;
> +	};
> +
> +	sys-therm@4 {
> +		reg = <4>;
> +		io-channels = <&pmk8280_vadc PM8350_ADC7_AMUX_THM1_100K_PU(3)>;
> +		qcom,hw-settle-time-us = <200>;
> +		qcom,avg-samples = <2>;
> +		qcom,ratiometric;
> +	};
> +
> +	sys-therm@5 {
> +		reg = <5>;
> +		io-channels = <&pmk8280_vadc PM8350_ADC7_AMUX_THM2_100K_PU(3)>;
> +		qcom,hw-settle-time-us = <200>;
> +		qcom,avg-samples = <2>;
> +		qcom,ratiometric;
> +	};
> +
> +	sys-therm@6 {
> +		reg = <6>;
> +		io-channels = <&pmk8280_vadc PM8350_ADC7_AMUX_THM3_100K_PU(3)>;
> +		qcom,hw-settle-time-us = <200>;
> +		qcom,avg-samples = <2>;
> +		qcom,ratiometric;
> +	};
> +
> +	sys-therm@7 {
> +		reg = <7>;
> +		io-channels = <&pmk8280_vadc PM8350_ADC7_AMUX_THM4_100K_PU(3)>;
> +		qcom,hw-settle-time-us = <200>;
> +		qcom,avg-samples = <2>;
> +		qcom,ratiometric;
> +	};
> +};
> +
> +&pmk8280_pon_pwrkey {
> +	status = "okay";
> +};
> +
> +&pmk8280_pon_resin {
> +	status = "okay";
> +};
> +
> +&pmk8280_rtc {
> +	nvmem-cells = <&rtc_offset>;
> +	nvmem-cell-names = "offset";
> +
> +	status = "okay";
> +};
> +
> +&pmk8280_sdam_6 {
> +	status = "okay";
> +
> +	rtc_offset: rtc-offset@bc {
> +		reg = <0xbc 0x4>;
> +	};
> +};
> +
> +&pmk8280_vadc {
> +	status = "okay";
> +
> +	channel@144 {
> +		reg = <PM8350_ADC7_AMUX_THM1_100K_PU(1)>;
> +		qcom,hw-settle-time = <200>;
> +		qcom,ratiometric;
> +		label = "sys_therm1";
> +	};
> +
> +	channel@145 {
> +		reg = <PM8350_ADC7_AMUX_THM2_100K_PU(1)>;
> +		qcom,hw-settle-time = <200>;
> +		qcom,ratiometric;
> +		label = "sys_therm2";
> +	};
> +
> +	channel@146 {
> +		reg = <PM8350_ADC7_AMUX_THM3_100K_PU(1)>;
> +		qcom,hw-settle-time = <200>;
> +		qcom,ratiometric;
> +		label = "sys_therm3";
> +	};
> +
> +	channel@147 {
> +		reg = <PM8350_ADC7_AMUX_THM4_100K_PU(1)>;
> +		qcom,hw-settle-time = <200>;
> +		qcom,ratiometric;
> +		label = "sys_therm4";
> +	};
> +
> +	channel@344 {
> +		reg = <PM8350_ADC7_AMUX_THM1_100K_PU(3)>;
> +		qcom,hw-settle-time = <200>;
> +		qcom,ratiometric;
> +		label = "sys_therm5";
> +	};
> +
> +	channel@345 {
> +		reg = <PM8350_ADC7_AMUX_THM2_100K_PU(3)>;
> +		qcom,hw-settle-time = <200>;
> +		qcom,ratiometric;
> +		label = "sys_therm6";
> +	};
> +
> +	channel@346 {
> +		reg = <PM8350_ADC7_AMUX_THM3_100K_PU(3)>;
> +		qcom,hw-settle-time = <200>;
> +		qcom,ratiometric;
> +		label = "sys_therm7";
> +	};
> +
> +	channel@347 {
> +		reg = <PM8350_ADC7_AMUX_THM4_100K_PU(3)>;
> +		qcom,hw-settle-time = <200>;
> +		qcom,ratiometric;
> +		label = "sys_therm8";
> +	};
> +};
> +
> +&qup0 {
> +	status = "okay";
> +};
> +
> +&qup1 {
> +	status = "okay";
> +};
> +
> +&qup2 {
> +	status = "okay";
> +};
> +
> +&remoteproc_adsp {
> +	firmware-name = "qcom/sc8280xp/MICROSOFT/DEVKIT23/qcadsp8280.mbn";
> +
> +	status = "okay";
> +};
> +
> +&remoteproc_nsp0 {
> +	firmware-name = "qcom/sc8280xp/MICROSOFT/DEVKIT23/qccdsp8280.mbn";
> +
> +	status = "okay";
> +};
> +
> +&rxmacro {
> +	status = "okay";
> +};
> +
> +&sound {
> +	compatible = "qcom,sc8280xp-sndcard";
> +	model = "MICROSOFT/DEVKIT23/devkit23";

That's odd model name. Why devkit is repeated? What is even the devkit?

> +	audio-routing =
> +		"SpkrLeft IN", "WSA_SPK1 OUT",

Join lines and fix alignment in continued lines.

> +		"SpkrRight IN", "WSA_SPK2 OUT",
> +		"IN1_HPHL", "HPHL_OUT",
> +		"IN2_HPHR", "HPHR_OUT",
> +		"AMIC2", "MIC BIAS2",
> +		"VA DMIC0", "MIC BIAS1",
> +		"VA DMIC1", "MIC BIAS1",
> +		"VA DMIC2", "MIC BIAS3",
> +		"VA DMIC0", "VA MIC BIAS1",
> +		"VA DMIC1", "VA MIC BIAS1",
> +		"VA DMIC2", "VA MIC BIAS3",
> +		"TX SWR_ADC1", "ADC2_OUTPUT";
> +
> +	wcd-playback-dai-link {
> +		link-name = "WCD Playback";
> +		cpu {
> +			sound-dai = <&q6apmbedai RX_CODEC_DMA_RX_0>;
> +		};
> +
> +		codec {
> +			sound-dai = <&wcd938x 0>, <&swr1 0>, <&rxmacro 0>;
> +		};
> +
> +		platform {
> +			sound-dai = <&q6apm>;
> +		};
> +	};
> +
> +	wcd-capture-dai-link {
> +		link-name = "WCD Capture";
> +		cpu {
> +			sound-dai = <&q6apmbedai TX_CODEC_DMA_TX_3>;
> +		};
> +
> +		codec {
> +			sound-dai = <&wcd938x 1>, <&swr2 0>, <&txmacro 0>;
> +		};
> +
> +		platform {
> +			sound-dai = <&q6apm>;
> +		};
> +	};
> +
> +	wsa-dai-link {
> +		link-name = "WSA Playback";
> +		cpu {
> +			sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
> +		};
> +
> +		codec {
> +			sound-dai = <&swr0 0>, <&wsamacro 0>;
> +		};
> +
> +		platform {
> +			sound-dai = <&q6apm>;
> +		};
> +	};
> +
> +	va-dai-link {
> +		link-name = "VA Capture";
> +		cpu {
> +			sound-dai = <&q6apmbedai VA_CODEC_DMA_TX_0>;
> +		};
> +
> +		platform {
> +			sound-dai = <&q6apm>;
> +		};
> +
> +		codec {
> +			sound-dai = <&vamacro 0>;
> +		};
> +	};
> +};
> +
> +&swr0 {
> +	status = "okay";
> +};
> +
> +&swr1 {
> +	status = "okay";
> +
> +	wcd_rx: wcd9380-rx@0,4 {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

codec@

> +		compatible = "sdw20217010d00";
> +		reg = <0 4>;
> +		qcom,rx-port-mapping = <1 2 3 4 5>;
> +	};
> +};
> +
> +&swr2 {
> +	status = "okay";
> +
> +	wcd_tx: wcd9380-tx@0,3 {

codec@

> +		compatible = "sdw20217010d00";
> +		reg = <0 3>;
> +		qcom,tx-port-mapping = <1 1 2 3>;
> +	};
> +};
> +
> +&txmacro {
> +	status = "okay";
> +};

Best regards,
Krzysztof


