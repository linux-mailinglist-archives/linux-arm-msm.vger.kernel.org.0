Return-Path: <linux-arm-msm+bounces-47247-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5B6A2D907
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Feb 2025 22:54:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 34C5E165B9B
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Feb 2025 21:54:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F3891F3BA1;
	Sat,  8 Feb 2025 21:54:10 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay03.th.seeweb.it (relay03.th.seeweb.it [5.144.164.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6002244E83
	for <linux-arm-msm@vger.kernel.org>; Sat,  8 Feb 2025 21:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.144.164.164
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739051650; cv=none; b=N9Hf3ed/krgM+6VtsUaC9n6DJqK3yns+WRDZv28OKMnVoM4CFiCJmdofht3jF1TlPh/boywjNimx7BYl4GMHalcDMGTYNqzz6K6PeHSdi00/K3veGduOBfK0bKAqMWH+sYz2GjvD/3KhgUw7Orx7O3Sabta3xZGSuqEhg40F2Do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739051650; c=relaxed/simple;
	bh=Is+Qs8gxBkUnO9SHFdZ152vDugn7Py1h5ACe9lKwTz8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e3DuxJRpaUb/7S1SE1FY+EtG1AAoft9rWR14BjgVXOd4LIoEiinHWam5kukHntvZjz5IXuDq3Ifsc/KxS9xaZofOn8S8ai4UqwpwOHS6W5oQ7TFJPDXpBsNxP/wh77C+4FAhytfoDAFfwjkc6NrhKCsE7Jz/V5fVdmWO625CfKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org; spf=pass smtp.mailfrom=somainline.org; arc=none smtp.client-ip=5.144.164.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=somainline.org
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 0E7742027E;
	Sat,  8 Feb 2025 22:48:26 +0100 (CET)
Date: Sat, 8 Feb 2025 22:48:24 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: qcm6490-fairphone-fp5: Enable
 display
Message-ID: <vm4wglq5xedieqwo4vy5eeszbx3a625jromi3ts3jkrhw3zccv@7eaol7dckbh7>
Mail-Followup-To: Marijn Suijten <marijn.suijten@somainline.org>, 
	Luca Weiss <luca.weiss@fairphone.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250202-fp5-display-v1-0-f52bf546e38f@fairphone.com>
 <20250202-fp5-display-v1-1-f52bf546e38f@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250202-fp5-display-v1-1-f52bf546e38f@fairphone.com>

On 2025-02-02 23:45:51, Luca Weiss wrote:
> Configure the MDSS nodes for the phone and add the panel node.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Glad to hear (and see in real life) that you're able to use the 1:1:1 topology
patches.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

Thanks!

> ---
>  arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 94 ++++++++++++++++++++--
>  1 file changed, 89 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> index 389eca9b9e68187980e92ac921a77a3c3b54f6a5..965e32473a58ae4748e4cb748980fad1d2b06ab6 100644
> --- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> +++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> @@ -138,6 +138,34 @@ vreg_ois_dvdd_1p1: regulator-ois-dvdd-1p1 {
>  		vin-supply = <&vreg_s8b>;
>  	};
>  
> +	vreg_oled_dvdd: regulator-oled-dvdd {
> +		compatible = "regulator-fixed";
> +		regulator-name = "oled_dvdd";
> +		regulator-min-microvolt = <1200000>;
> +		regulator-max-microvolt = <1200000>;
> +
> +		gpio = <&tlmm 51 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		vin-supply = <&vreg_s1b>;
> +
> +		regulator-boot-on;
> +	};
> +
> +	vreg_oled_vci: regulator-oled-vci {
> +		compatible = "regulator-fixed";
> +		regulator-name = "oled_vci";
> +		regulator-min-microvolt = <3000000>;
> +		regulator-max-microvolt = <3000000>;
> +
> +		gpio = <&pm8350c_gpios 7 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		vin-supply = <&vreg_l13c>;
> +
> +		regulator-boot-on;
> +	};
> +
>  	reserved-memory {
>  		cont_splash_mem: cont-splash@e1000000 {
>  			reg = <0x0 0xe1000000 0x0 0x2300000>;
> @@ -597,11 +625,6 @@ eeprom@51 {
>  	};
>  };
>  
> -&dispcc {
> -	/* Disable for now so simple-framebuffer continues working */
> -	status = "disabled";
> -};
> -
>  &gcc {
>  	protected-clocks = <GCC_CFG_NOC_LPASS_CLK>,
>  			   <GCC_EDP_CLKREF_EN>,
> @@ -733,6 +756,46 @@ &ipa {
>  	status = "okay";
>  };
>  
> +&mdss {
> +	status = "okay";
> +};
> +
> +&mdss_dsi {
> +	vdda-supply = <&vreg_l6b>;
> +	status = "okay";
> +
> +	panel@0 {
> +		compatible = "fairphone,fp5-rm692e5-boe", "raydium,rm692e5";
> +		reg = <0>;
> +
> +		reset-gpios = <&tlmm 44 GPIO_ACTIVE_LOW>;
> +
> +		vci-supply = <&vreg_oled_vci>;
> +		vddio-supply = <&vreg_l12c>;
> +		dvdd-supply = <&vreg_oled_dvdd>;
> +
> +		pinctrl-0 = <&disp_reset_n_active>, <&mdp_vsync>;
> +		pinctrl-1 = <&disp_reset_n_suspend>, <&mdp_vsync>;
> +		pinctrl-names = "default", "sleep";
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
> +	data-lanes = <0 1 2 3>;
> +	remote-endpoint = <&panel_in>;
> +};
> +
> +&mdss_dsi_phy {
> +	vdds-supply = <&vreg_l10c>;
> +	status = "okay";
> +};
> +
>  &pm7250b_adc {
>  	pinctrl-0 = <&pm7250b_adc_default>;
>  	pinctrl-names = "default";
> @@ -1026,6 +1089,20 @@ bluetooth_enable_default: bluetooth-enable-default-state {
>  		bias-disable;
>  	};
>  
> +	disp_reset_n_active: disp-reset-n-active-state {
> +		pins = "gpio44";
> +		function = "gpio";
> +		drive-strength = <8>;
> +		bias-disable;
> +	};
> +
> +	disp_reset_n_suspend: disp-reset-n-suspend-state {
> +		pins = "gpio44";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-pull-down;
> +	};
> +
>  	hall_sensor_default: hall-sensor-default-state {
>  		pins = "gpio155";
>  		function = "gpio";
> @@ -1033,6 +1110,13 @@ hall_sensor_default: hall-sensor-default-state {
>  		bias-pull-up;
>  	};
>  
> +	mdp_vsync: mdp-vsync-state {
> +		pins = "gpio80";
> +		function = "mdp_vsync";
> +		drive-strength = <2>;
> +		bias-pull-down;
> +	};
> +
>  	pm8008_int_default: pm8008-int-default-state {
>  		pins = "gpio25";
>  		function = "gpio";
> 
> -- 
> 2.48.1
> 

