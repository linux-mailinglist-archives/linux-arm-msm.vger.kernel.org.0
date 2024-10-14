Return-Path: <linux-arm-msm+bounces-34304-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3D299C720
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 12:27:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 342C91C219B9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 10:27:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 388D315B143;
	Mon, 14 Oct 2024 10:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a54Rn2ld"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A6C1581F4
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Oct 2024 10:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728901653; cv=none; b=FoRZgr081nQZY+zl0f4mZnv2qCF1oiF5RTccDiauIexrj5nv2Ae8CBCAtbxdk4Z/btw+bYhmZnroIuVuHciFPnMb7bj4mLhRxfRP0rSDSwD7U7lORFcYG9t2UfPcHZ9ZS1EDVfUoxnCTBRm0k9EoxHO7EOUhCaZ1canuKEif8t8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728901653; c=relaxed/simple;
	bh=Z5lqauW8Azxd9VdBcKnlNbn0UZ2Rqj0b/i/9QLGxrA0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hGIV4bzjaj0eqHtBlOBKJISeqODZ2YxPtjnMfn6M+kGzRI797Uxc7GvX6j3Z+zJ8eu0wu0FG8ynhoix9agomK9HIhQmYr7zsEOSv8sxexNiWj06pb/I4jT72s6lvHZfMSpPv79E7BFfylDD75BU5J4u3v1cEP17SK7bgmC39Dgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a54Rn2ld; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-539e5c15fd3so1534259e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Oct 2024 03:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728901649; x=1729506449; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WPbdG1u3y3lVAwCUYtPIX/rHtiwH0essAVoSWi/zu3U=;
        b=a54Rn2ldLlE6ug14FepRelULiJKFyY6j4Ll+CdVuf0By+HSirAWosvF6w6j9G8xhD2
         uXCajPEVI/r1cHy52Jn8kD8bOgI0sKkRyH3KA/BlY6eP4WbmQqGwrye/dbzJr6DUbiC7
         Ea0aPUdXPy1K+xSmmnxIdSpBCwuA1l+K/Pd+iir6OuBfDawGIpzPrhNDxoHE4EDm7dbv
         cz30/uGWp2rTj51d/D1BR0gG+GOhmITjdVVjrwhtxcdiSg5npHIY+D3AgJHsHGbOunnf
         u/z4ZyniKIwfhCnG4fr6GpqRZVv7YR2XlMFlVGnMOis3HQKZxy3PXVC0Y0HmU9u6rmu4
         PIYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728901649; x=1729506449;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WPbdG1u3y3lVAwCUYtPIX/rHtiwH0essAVoSWi/zu3U=;
        b=tXcY0SBaOQQoVKHaVdUjT82quVrzgfF3mRz3iAsDG1DIFquYuFUbdG335JRG+EEw4y
         /5+uBUff+95bmbeN4dgnGP3ZPg6V9FgVWmm2+ZbFLKJZFFZGKO11nUSVamBftXkwB7yT
         WU9PdBtnZMsa+C3D1yQKZOVsmocZWAifx4/6WGEkhDf6EG1kB6qtzaDJYWxfzQvu8DmS
         0oqa7FnHziBwaCnetaBBWYVFx5Kl1l9P7EIn9l1UdbfIwD5+4hoi79dNBXG7ssYAYxnt
         mruQqLsI+GRxnZ8y0sivkBQp5AyA/ktESFH7fS14GqtX0Q1qqK/lsjNZoKFK3piQvaii
         62bQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+4hITjAULgYznzVXlJmu7dEgP4eKCiFw/h0jPJrAqaA3a0wA0DxxJgZ5vnTG6hcbMSaXpeurBjXrWvz5E@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9nR1vmHhflMb5ESBjS2UhQab0a9jbKd++ePSXWU4HS5wIZmJG
	0UN43O0Do/ZM8rQO1WQXp7SXT2/wymBTHreDeYT02KqNQtp1YLZKG/nB9VcbAmo=
X-Google-Smtp-Source: AGHT+IEcMFeulWx59m3stxXcl/e710aJ0ad+0Lv4V3uG5omB2EUCILtVdxtWeIjZLl6zDMqstaaunQ==
X-Received: by 2002:a05:6512:39cb:b0:539:f26f:d280 with SMTP id 2adb3069b0e04-539f26fd512mr1698422e87.5.1728901648923;
        Mon, 14 Oct 2024 03:27:28 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539e38e9140sm1045849e87.173.2024.10.14.03.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 03:27:28 -0700 (PDT)
Date: Mon, 14 Oct 2024 13:27:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: quic_fangez@quicinc.com
Cc: kernel@quicinc.com, quic_lliu6@quicinc.com, quic_xiangxuy@quicinc.com, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/6] arm64: dts: qcom: qcs615: Add display mdss and dsi
 configuration
Message-ID: <ypdgy77jreyqqdylwcmj2inl3ddxfg6iqoefv6g6hzofn6t73l@n6upddhckqeu>
References: <20241014-add_display_support_for_qcs615-v1-0-4efa191dbdd4@quicinc.com>
 <20241014-add_display_support_for_qcs615-v1-2-4efa191dbdd4@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241014-add_display_support_for_qcs615-v1-2-4efa191dbdd4@quicinc.com>

On Mon, Oct 14, 2024 at 05:47:28PM +0800, fangez via B4 Relay wrote:
> From: lliu6 <quic_lliu6@quicinc.com>

This is not a name.

> 
> Add display mdss and dsi configuration for QCS615 SoC.

MDSS, DSI

separate Ride configuration to a separate commit

Patch order is wrong.
- dt-bindings
- driver changes
- dtsi
- dts

> 
> Signed-off-by: lliu6 <quic_lliu6@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615-ride.dts | 101 ++++++++++++++++
>  arch/arm64/boot/dts/qcom/qcs615.dtsi     | 195 +++++++++++++++++++++++++++++++
>  2 files changed, 296 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> index d05a881d7ffeca9de175af2a9062f5bccadcbdfd..f275145c395aedb71bdcd8a88b82917db53e7167 100644
> --- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> @@ -207,6 +207,107 @@ &gcc {
>  		 <&sleep_clk>;
>  };
>  
> +&i2c2 {
> +	clock-frequency = <400000>;
> +	pinctrl-0 = <&qup_i2c2_data_clk &ioexp_intr_active &ioexp_reset_active>;
> +	pinctrl-names = "default";
> +	status = "okay";

empty line

> +	ioexp: gpio@3e {
> +		#gpio-cells = <2>;
> +		#interrupt-cells = <2>;
> +		compatible = "semtech,sx1509q";
> +		reg = <0x3e>;
> +		interrupt-parent = <&tlmm>;
> +		interrupts = <58 0>;
> +		gpio-controller;
> +		interrupt-controller;
> +		semtech,probe-reset;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&dsi0_hpd_cfg_pins &dsi0_cdet_cfg_pins &dp_hpd_cfg_pins>;

No, these pins are not used by the IO expander. Please moved them to the
corresponding devices.


empty line

> +		dsi0_hpd_cfg_pins: gpio0-cfg {

What exactly is DSI HPD?

> +			pins = "gpio0";
> +			bias-pull-up;
> +		};

and here (and you'll guess all other relevant places, I hope it's
obvious).

> +		dsi0_cdet_cfg_pins: gpio1-cfg {
> +			pins = "gpio1";
> +			bias-pull-down;
> +		};
> +		dp_hpd_cfg_pins: gpio8-cfg {
> +			pins = "gpio8";
> +			bias-pull-down;
> +		};
> +	};
> +
> +	i2c-mux@77 {
> +		compatible = "nxp,pca9542";
> +		reg = <0x77>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		i2c@0 {
> +			reg = <0>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			anx_7625_1: anx7625@2c {

Are there more than one?

> +				compatible = "analogix,anx7625";
> +				reg = <0x58>;
> +				interrupt-parent = <&ioexp>;
> +				interrupts = <0 0>;
> +				enable-gpios = <&tlmm 4 0>;

Use defines for the GPIO flags instead of 0

> +				reset-gpios = <&tlmm 5 0>;
> +				wakeup-source;
> +			};
> +		};
> +	};
> +};
> +
> +&anx_7625_1 {

No need to, keep it in the same node.

> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		port@0 {
> +			reg = <0>;
> +			anx_7625_1_in: endpoint {
> +				remote-endpoint = <&mdss_dsi0_out>;
> +			};
> +		};

Missing port@1 and the connector node.

> +	};
> +};
> +
> +&mdss {
> +	status = "okay";
> +};
> +
> +&mdss_dsi0 {
> +	status = "okay";

Status is the last property.

> +	vdda-supply = <&vreg_l11a>;
> +};
> +
> +&mdss_dsi0_out {
> +	remote-endpoint = <&anx_7625_1_in>;
> +	data-lanes = <0 1 2 3>;
> +};
> +
> +&mdss_dsi0_phy {
> +	status = "okay";
> +	vdds-supply = <&vreg_l5a>;
> +};
> +
> +&tlmm {
> +	ioexp_intr_active: ioexp_intr_active {

This doesn't seem to be validated. Please check your patches before
sending.

> +		pins = "gpio58";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-pull-up;
> +	};
> +	ioexp_reset_active: ioexp_reset_active {
> +		pins = "gpio3";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +		output-high;
> +	};
> +};
> +
>  &qupv3_id_0 {
>  	status = "okay";
>  };
> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> index 8e2199bb180d85a86a882c4253778c7e8f34798b..2a6c08220e6c4ded49861754d81d0924389dd93e 100644
> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> @@ -1266,6 +1266,201 @@ camcc: clock-controller@ad00000 {
>  			#power-domain-cells = <1>;
>  		};
>  
> +		mdss: display-subsystem@ae00000 {
> +			compatible = "qcom,qcs615-mdss";
> +			reg = <0 0x0ae00000 0 0x1000>;
> +			reg-names = "mdss";
> +
> +			interconnects = <&mmss_noc MASTER_MDP0 0 &mc_virt SLAVE_EBI1 0>,

QCOM_ICC_TAG_ALWAYS

> +					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +					&config_noc SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
> +			interconnect-names = "mdp0-mem",
> +					     "cpu-cfg";
> +
> +			power-domains = <&dispcc MDSS_CORE_GDSC>;
> +
> +			clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +					 <&gcc GCC_DISP_HF_AXI_CLK>,
> +					 <&dispcc DISP_CC_MDSS_MDP_CLK>;
> +
> +			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-controller;
> +			#interrupt-cells = <1>;
> +
> +			iommus = <&apps_smmu 0x800 0x0>;
> +
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges;
> +
> +			status = "disabled";
> +
> +			mdss_mdp: display-controller@ae01000 {
> +				compatible = "qcom,qcs615-dpu";
> +				reg = <0 0x0ae01000 0 0x8f000>,
> +				      <0 0x0aeb0000 0 0x2008>;
> +				reg-names = "mdp", "vbif";
> +
> +				clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
> +						 <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +						 <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
> +						 <&dispcc DISP_CC_MDSS_MDP_CLK>,
> +						 <&dispcc DISP_CC_MDSS_VSYNC_CLK>;

Please indent lists so that the values are one under another, starting
at the same column.

> +				clock-names = "bus",
> +							  "iface",
> +							  "lut",
> +							  "core",
> +							  "vsync";
> +
> +				assigned-clocks = <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> +				assigned-clock-rates = <19200000>;
> +
> +				operating-points-v2 = <&mdp_opp_table>;
> +
> +				interrupt-parent = <&mdss>;
> +				interrupts = <0>;
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +						dpu_intf0_out: endpoint {
> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +						dpu_intf1_out: endpoint {
> +							remote-endpoint = <&mdss_dsi0_in>;
> +						};
> +					};
> +				};
> +
> +				mdp_opp_table: opp-table {
> +					compatible = "operating-points-v2";
> +
> +					opp-375000000 {
> +						opp-hz = /bits/ 64 <375000000>;
> +						required-opps = <&rpmhpd_opp_svs_l1>;
> +					};
> +
> +					opp-500000000 {
> +						opp-hz = /bits/ 64 <500000000>;
> +						required-opps = <&rpmhpd_opp_nom>;
> +					};
> +
> +					opp-575000000 {
> +						opp-hz = /bits/ 64 <575000000>;
> +						required-opps = <&rpmhpd_opp_turbo>;
> +					};
> +
> +					opp-650000000 {
> +						opp-hz = /bits/ 64 <650000000>;
> +						required-opps = <&rpmhpd_opp_turbo_l1>;
> +					};
> +				};
> +			};
> +
> +			mdss_dsi0: dsi@ae94000 {
> +				compatible = "qcom,qcs615-dsi-ctrl", "qcom,mdss-dsi-ctrl";
> +				reg = <0 0x0ae94000 0 0x400>;
> +				reg-names = "dsi_ctrl";
> +
> +				interrupt-parent = <&mdss>;
> +				interrupts = <4>;
> +
> +				clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
> +						 <&dispcc DISP_CC_MDSS_BYTE0_INTF_CLK>,
> +						 <&dispcc DISP_CC_MDSS_PCLK0_CLK>,
> +						 <&dispcc DISP_CC_MDSS_ESC0_CLK>,
> +						 <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +						 <&gcc GCC_DISP_HF_AXI_CLK>;
> +				clock-names = "byte",
> +							  "byte_intf",
> +							  "pixel",
> +							  "core",
> +							  "iface",
> +							  "bus";
> +
> +				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>,
> +							 <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
> +				assigned-clock-parents = <&mdss_dsi0_phy 0>,
> +							 <&mdss_dsi0_phy 1>;
> +
> +				operating-points-v2 = <&dsi0_opp_table>;
> +
> +				phys = <&mdss_dsi0_phy>;
> +
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				status = "disabled";
> +
> +				dsi0_opp_table: opp-table {
> +					compatible = "operating-points-v2";
> +
> +					opp-164000000 {
> +						opp-hz = /bits/ 64 <164000000>;
> +						required-opps = <&rpmhpd_opp_low_svs>;
> +					};
> +
> +					opp-187500000 {
> +						opp-hz = /bits/ 64 <187500000>;
> +						required-opps = <&rpmhpd_opp_svs>;
> +					};
> +
> +					opp-225000000 {
> +						opp-hz = /bits/ 64 <225000000>;
> +						required-opps = <&rpmhpd_opp_svs_l1>;
> +					};
> +
> +					opp-262500000 {
> +						opp-hz = /bits/ 64 <262500000>;
> +						required-opps = <&rpmhpd_opp_nom>;
> +					};
> +				};
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +						mdss_dsi0_in: endpoint {
> +							remote-endpoint = <&dpu_intf1_out>;
> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +						mdss_dsi0_out: endpoint {
> +						};
> +					};
> +				};
> +			};
> +
> +			mdss_dsi0_phy: phy@ae94400 {
> +				compatible = "qcom,qcs615-dsi-phy-14nm";
> +				reg = <0 0x0ae94400 0 0x100>,
> +				      <0 0x0ae94500 0 0x300>,
> +				      <0 0x0ae94800 0 0x188>;
> +				reg-names = "dsi_phy",
> +					    "dsi_phy_lane",
> +					    "dsi_pll";
> +
> +				#clock-cells = <1>;
> +				#phy-cells = <0>;
> +
> +				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +					 <&rpmhcc RPMH_CXO_CLK>;
> +				clock-names = "iface", "ref";
> +
> +				status = "disabled";
> +			};

Does QCS615 have a DP controller? Please mention it in the commit
message.

> +		};
> +
>  		dispcc: clock-controller@af00000 {
>  			compatible = "qcom,qcs615-dispcc";
>  			reg = <0 0xaf00000 0 0x20000>;
> 
> -- 
> 2.25.1
> 
> 

-- 
With best wishes
Dmitry

