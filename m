Return-Path: <linux-arm-msm+bounces-35487-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5CE9ABA7F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 02:24:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D50291F23908
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 00:24:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 558C712B73;
	Wed, 23 Oct 2024 00:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fPU4Lup5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CDD8322B;
	Wed, 23 Oct 2024 00:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729643063; cv=none; b=A6/2Ms3lA+hkPedaJCXcEgL0Cd4qYRZ/DWAHR7wFOx/YA1oUawBG4l5N7DLUdDNPZNZ+pVs3ytZjSOxwEfna4U1REbdbds2paodRc+W28dlrcVD8Izk/V7Qhza9px9XOWc8/N3sG1SkXpzbi+ctgd0qgUip68rpG6+A7YBQS65M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729643063; c=relaxed/simple;
	bh=z0Y2IIcC6PBwZWvhscUgWkulEILdVYJHyYVffqC3ygA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iEDyfxYXEakIbHcGTSLrg3ES88zQqEmEwQPmF1PrM595GJK5DufILfbbifoDgIXQI8jvHGJPxpLc+JJlbj8j8+XogZS8d9vaVJrwtQozqNKL7TX2mCNknHjpunoTGPucT9v+davxLSGWtHZdZZ99ZIlbP/nRRa8R8Zx1VWcmafE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fPU4Lup5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65E25C4CEC3;
	Wed, 23 Oct 2024 00:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729643062;
	bh=z0Y2IIcC6PBwZWvhscUgWkulEILdVYJHyYVffqC3ygA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fPU4Lup5r2rKX5U9dAGbnHZMsYcobqBlH3hyglkJ40qaZKT30PX0IM44gjq98lu4b
	 EDgJtWFXLZvZPTArUbLydP8Ouug9rPTlWMybZay2oX/5YC99yurgq6L8Up/OImFpN1
	 406Lxc8o2/s98/x5HY/HzFlyGJlTGkFzEypOV/xbdNf9+1MeflJhAf4lRpYnDgi63g
	 EMIgoU69F9qcInlFXI2SaBZA32SaJuJhx4QEc3c7N+W+Xoi17x+YVoqQlwu4W+KC2p
	 nejUSm2l1l3+fubJCW50pMTxKnAyXXC/e2TOAQQXJjI7fl7qk681w4g0Sdud1AIkht
	 UpMiZwgRm4IJQ==
Date: Tue, 22 Oct 2024 19:24:19 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>, 
	Rajendra Nayak <quic_rjendra@quicinc.com>, Sibi Sankar <quic_sibis@quicinc.com>, 
	Johan Hovold <johan@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Trilok Soni <quic_tsoni@quicinc.com>, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: x1e80100-crd: Add Parade PS8830
 related nodes
Message-ID: <3i36qmnyzyonbzbsxgcdjwbshcl45vq75ocpth4redwrnqjkm5@wjev5ul7rs75>
References: <20241022-x1e80100-ps8830-v3-0-68a95f351e99@linaro.org>
 <20241022-x1e80100-ps8830-v3-3-68a95f351e99@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241022-x1e80100-ps8830-v3-3-68a95f351e99@linaro.org>

On Tue, Oct 22, 2024 at 01:26:56PM GMT, Abel Vesa wrote:
> Add nodes for all 3 Parade PS8830 Type-C retimers found on Qualcomm
> X Elite CRD board, along with all of their voltage regulators. These
> retimers sit between the Type-C connectors and the PHYs, so describe the
> pmic glink graph accordingly. On this board, these retimers might be left
                               ^ Here would be a good point to split this hunk into two paragraphs.

> enabled and configured by the bootloader, so make sure the retimers don't
> reset their configuration on driver probe.

It would be nice if there was a hint here about how this statement
manifest itself in the patch.


Hint:
https://docs.kernel.org/process/submitting-patches.html#describe-your-changes
is a good read for how to structure ones commit message - with a problem
description, then a technical description of the change (i.e. probably
not something starting with the word "Add"...)

Regards,
Bjorn

> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 448 +++++++++++++++++++++++++++++-
>  1 file changed, 442 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
> index f5f2659690915f9ba50d15a27c54e3c0f504a14b..7cc45a5cd7eb7e70915d04ea7e181b56f693f768 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
> @@ -99,7 +99,15 @@ port@1 {
>  					reg = <1>;
>  
>  					pmic_glink_ss0_ss_in: endpoint {
> -						remote-endpoint = <&usb_1_ss0_qmpphy_out>;
> +						remote-endpoint = <&retimer_ss0_ss_out>;
> +					};
> +				};
> +
> +				port@2 {
> +					reg = <2>;
> +
> +					pmic_glink_ss0_con_sbu_in: endpoint {
> +						remote-endpoint = <&retimer_ss0_con_sbu_out>;
>  					};
>  				};
>  			};
> @@ -128,7 +136,15 @@ port@1 {
>  					reg = <1>;
>  
>  					pmic_glink_ss1_ss_in: endpoint {
> -						remote-endpoint = <&usb_1_ss1_qmpphy_out>;
> +						remote-endpoint = <&retimer_ss1_ss_out>;
> +					};
> +				};
> +
> +				port@2 {
> +					reg = <2>;
> +
> +					pmic_glink_ss1_con_sbu_in: endpoint {
> +						remote-endpoint = <&retimer_ss1_con_sbu_out>;
>  					};
>  				};
>  			};
> @@ -157,7 +173,15 @@ port@1 {
>  					reg = <1>;
>  
>  					pmic_glink_ss2_ss_in: endpoint {
> -						remote-endpoint = <&usb_1_ss2_qmpphy_out>;
> +						remote-endpoint = <&retimer_ss2_ss_out>;
> +					};
> +				};
> +
> +				port@2 {
> +					reg = <2>;
> +
> +					pmic_glink_ss2_con_sbu_in: endpoint {
> +						remote-endpoint = <&retimer_ss2_con_sbu_out>;
>  					};
>  				};
>  			};
> @@ -291,6 +315,150 @@ vreg_nvme: regulator-nvme {
>  		pinctrl-0 = <&nvme_reg_en>;
>  	};
>  
> +	vreg_rtmr0_1p15: regulator-rtmr0-1p15 {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "VREG_RTMR0_1P15";
> +		regulator-min-microvolt = <1150000>;
> +		regulator-max-microvolt = <1150000>;
> +
> +		gpio = <&pmc8380_5_gpios 8 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&rtmr0_1p15_reg_en>;
> +		pinctrl-names = "default";
> +
> +		regulator-boot-on;
> +	};
> +
> +	vreg_rtmr0_1p8: regulator-rtmr0-1p8 {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "VREG_RTMR0_1P8";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +
> +		gpio = <&pm8550ve_9_gpios 8 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&rtmr0_1p8_reg_en>;
> +		pinctrl-names = "default";
> +
> +		regulator-boot-on;
> +	};
> +
> +	vreg_rtmr0_3p3: regulator-rtmr0-3p3 {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "VREG_RTMR0_3P3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpio = <&pm8550_gpios 11 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&rtmr0_3p3_reg_en>;
> +		pinctrl-names = "default";
> +
> +		regulator-boot-on;
> +	};
> +
> +	vreg_rtmr1_1p15: regulator-rtmr1-1p15 {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "VREG_RTMR1_1P15";
> +		regulator-min-microvolt = <1150000>;
> +		regulator-max-microvolt = <1150000>;
> +
> +		gpio = <&tlmm 188 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&rtmr1_1p15_reg_en>;
> +		pinctrl-names = "default";
> +
> +		regulator-boot-on;
> +	};
> +
> +	vreg_rtmr1_1p8: regulator-rtmr1-1p8 {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "VREG_RTMR1_1P8";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +
> +		gpio = <&tlmm 175 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&rtmr1_1p8_reg_en>;
> +		pinctrl-names = "default";
> +
> +		regulator-boot-on;
> +	};
> +
> +	vreg_rtmr1_3p3: regulator-rtmr1-3p3 {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "VREG_RTMR1_3P3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpio = <&tlmm 186 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&rtmr1_3p3_reg_en>;
> +		pinctrl-names = "default";
> +
> +		regulator-boot-on;
> +	};
> +
> +	vreg_rtmr2_1p15: regulator-rtmr2-1p15 {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "VREG_RTMR2_1P15";
> +		regulator-min-microvolt = <1150000>;
> +		regulator-max-microvolt = <1150000>;
> +
> +		gpio = <&tlmm 189 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&rtmr2_1p15_reg_en>;
> +		pinctrl-names = "default";
> +
> +		regulator-boot-on;
> +	};
> +
> +	vreg_rtmr2_1p8: regulator-rtmr2-1p8 {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "VREG_RTMR2_1P8";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +
> +		gpio = <&tlmm 126 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&rtmr2_1p8_reg_en>;
> +		pinctrl-names = "default";
> +
> +		regulator-boot-on;
> +	};
> +
> +	vreg_rtmr2_3p3: regulator-rtmr2-3p3 {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "VREG_RTMR2_3P3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpio = <&tlmm 187 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&rtmr2_3p3_reg_en>;
> +		pinctrl-names = "default";
> +
> +		regulator-boot-on;
> +	};
> +
>  	vph_pwr: regulator-vph-pwr {
>  		compatible = "regulator-fixed";
>  
> @@ -709,6 +877,187 @@ keyboard@3a {
>  	};
>  };
>  
> +&i2c1 {
> +	clock-frequency = <400000>;
> +
> +	status = "okay";
> +
> +	typec-mux@8 {
> +		compatible = "parade,ps8830";
> +		reg = <0x08>;
> +
> +		clocks = <&rpmhcc RPMH_RF_CLK5>;
> +		clock-names = "xo";
> +
> +		vdd-supply = <&vreg_rtmr2_1p15>;
> +		vdd33-supply = <&vreg_rtmr2_3p3>;
> +		vdd33-cap-supply = <&vreg_rtmr2_3p3>;
> +		vddar-supply = <&vreg_rtmr2_1p15>;
> +		vddat-supply = <&vreg_rtmr2_1p15>;
> +		vddio-supply = <&vreg_rtmr2_1p8>;
> +
> +		reset-gpios = <&tlmm 185 GPIO_ACTIVE_LOW>;
> +
> +		pinctrl-0 = <&rtmr2_default>;
> +		pinctrl-names = "default";
> +
> +		orientation-switch;
> +		retimer-switch;
> +
> +		ps8830,boot-on;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +
> +				retimer_ss2_ss_out: endpoint {
> +					remote-endpoint = <&pmic_glink_ss2_ss_in>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +
> +				retimer_ss2_ss_in: endpoint {
> +					remote-endpoint = <&usb_1_ss2_qmpphy_out>;
> +				};
> +			};
> +
> +			port@2 {
> +				reg = <2>;
> +
> +				retimer_ss2_con_sbu_out: endpoint {
> +					remote-endpoint = <&pmic_glink_ss2_con_sbu_in>;
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&i2c3 {
> +	clock-frequency = <400000>;
> +
> +	status = "okay";
> +
> +	typec-mux@8 {
> +		compatible = "parade,ps8830";
> +		reg = <0x08>;
> +
> +		clocks = <&rpmhcc RPMH_RF_CLK3>;
> +		clock-names = "xo";
> +
> +		vdd-supply = <&vreg_rtmr0_1p15>;
> +		vdd33-supply = <&vreg_rtmr0_3p3>;
> +		vdd33-cap-supply = <&vreg_rtmr0_3p3>;
> +		vddar-supply = <&vreg_rtmr0_1p15>;
> +		vddat-supply = <&vreg_rtmr0_1p15>;
> +		vddio-supply = <&vreg_rtmr0_1p8>;
> +
> +		reset-gpios = <&pm8550_gpios 10 GPIO_ACTIVE_LOW>;
> +
> +		pinctrl-0 = <&rtmr0_default>;
> +		pinctrl-names = "default";
> +
> +		retimer-switch;
> +		orientation-switch;
> +
> +		ps8830,boot-on;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +
> +				retimer_ss0_ss_out: endpoint {
> +					remote-endpoint = <&pmic_glink_ss0_ss_in>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +
> +				retimer_ss0_ss_in: endpoint {
> +					remote-endpoint = <&usb_1_ss0_qmpphy_out>;
> +				};
> +			};
> +
> +			port@2 {
> +				reg = <2>;
> +
> +				retimer_ss0_con_sbu_out: endpoint {
> +					remote-endpoint = <&pmic_glink_ss0_con_sbu_in>;
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&i2c7 {
> +	clock-frequency = <400000>;
> +
> +	status = "okay";
> +
> +	typec-mux@8 {
> +		compatible = "parade,ps8830";
> +		reg = <0x8>;
> +
> +		clocks = <&rpmhcc RPMH_RF_CLK4>;
> +		clock-names = "xo";
> +
> +		vdd-supply = <&vreg_rtmr1_1p15>;
> +		vdd33-supply = <&vreg_rtmr1_3p3>;
> +		vdd33-cap-supply = <&vreg_rtmr1_3p3>;
> +		vddar-supply = <&vreg_rtmr1_1p15>;
> +		vddat-supply = <&vreg_rtmr1_1p15>;
> +		vddio-supply = <&vreg_rtmr1_1p8>;
> +
> +		reset-gpios = <&tlmm 176 GPIO_ACTIVE_LOW>;
> +
> +		pinctrl-0 = <&rtmr1_default>;
> +		pinctrl-names = "default";
> +
> +		retimer-switch;
> +		orientation-switch;
> +
> +		ps8830,boot-on;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +
> +				retimer_ss1_ss_out: endpoint {
> +					remote-endpoint = <&pmic_glink_ss1_ss_in>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +
> +				retimer_ss1_ss_in: endpoint {
> +					remote-endpoint = <&usb_1_ss1_qmpphy_out>;
> +				};
> +			};
> +
> +			port@2 {
> +				reg = <2>;
> +
> +				retimer_ss1_con_sbu_out: endpoint {
> +					remote-endpoint = <&pmic_glink_ss1_con_sbu_in>;
> +				};
> +			};
> +
> +		};
> +	};
> +};
> +
>  &i2c8 {
>  	clock-frequency = <400000>;
>  
> @@ -854,6 +1203,37 @@ &pcie6a_phy {
>  	status = "okay";
>  };
>  
> +&pm8550_gpios {
> +	rtmr0_default: rtmr0-reset-n-active-state {
> +		pins = "gpio10";
> +		function = "normal";
> +		power-source = <1>; /* 1.8V */
> +	};
> +
> +	rtmr0_3p3_reg_en: rtmr0-3p3-reg-en-state {
> +		pins = "gpio11";
> +		function = "normal";
> +		power-source = <1>; /* 1.8V */
> +	};
> +};
> +
> +&pmc8380_5_gpios {
> +	rtmr0_1p15_reg_en: rtmr0-1p15-reg-en-state {
> +		pins = "gpio8";
> +		function = "normal";
> +		power-source = <1>; /* 1.8V */
> +		bias-disable;
> +	};
> +};
> +
> +&pm8550ve_9_gpios {
> +	rtmr0_1p8_reg_en: rtmr0-1p8-reg-en-state {
> +		pins = "gpio8";
> +		function = "normal";
> +		power-source = <1>; /* 1.8V */
> +	};
> +};
> +
>  &pmc8380_3_gpios {
>  	edp_bl_en: edp-bl-en-state {
>  		pins = "gpio4";
> @@ -1093,6 +1473,62 @@ wake-n-pins {
>  		};
>  	};
>  
> +	rtmr1_1p15_reg_en: rtmr1-1p15-reg-en-state {
> +		pins = "gpio188";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	rtmr1_1p8_reg_en: rtmr1-1p8-reg-en-state {
> +		pins = "gpio175";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	rtmr1_3p3_reg_en: rtmr1-3p3-reg-en-state {
> +		pins = "gpio186";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	rtmr1_default: rtmr1-reset-n-active-state {
> +		pins = "gpio176";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	rtmr2_1p15_reg_en: rtmr2-1p15-reg-en-state {
> +		pins = "gpio189";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	rtmr2_1p8_reg_en: rtmr2-1p8-reg-en-state {
> +		pins = "gpio126";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	rtmr2_3p3_reg_en: rtmr2-3p3-reg-en-state {
> +		pins = "gpio187";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	rtmr2_default: rtmr2-reset-n-active-state {
> +		pins = "gpio185";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
>  	tpad_default: tpad-default-state {
>  		pins = "gpio3";
>  		function = "gpio";
> @@ -1160,7 +1596,7 @@ &usb_1_ss0_dwc3_hs {
>  };
>  
>  &usb_1_ss0_qmpphy_out {
> -	remote-endpoint = <&pmic_glink_ss0_ss_in>;
> +	remote-endpoint = <&retimer_ss0_ss_in>;
>  };
>  
>  &usb_1_ss1_hsphy {
> @@ -1188,7 +1624,7 @@ &usb_1_ss1_dwc3_hs {
>  };
>  
>  &usb_1_ss1_qmpphy_out {
> -	remote-endpoint = <&pmic_glink_ss1_ss_in>;
> +	remote-endpoint = <&retimer_ss1_ss_in>;
>  };
>  
>  &usb_1_ss2_hsphy {
> @@ -1216,5 +1652,5 @@ &usb_1_ss2_dwc3_hs {
>  };
>  
>  &usb_1_ss2_qmpphy_out {
> -	remote-endpoint = <&pmic_glink_ss2_ss_in>;
> +	remote-endpoint = <&retimer_ss2_ss_in>;
>  };
> 
> -- 
> 2.34.1
> 

