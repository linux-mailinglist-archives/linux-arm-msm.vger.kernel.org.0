Return-Path: <linux-arm-msm+bounces-80028-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6766C29344
	for <lists+linux-arm-msm@lfdr.de>; Sun, 02 Nov 2025 18:14:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7D0FD3A869D
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Nov 2025 17:14:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE858270551;
	Sun,  2 Nov 2025 17:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gTD3espe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D609381C4;
	Sun,  2 Nov 2025 17:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762103683; cv=none; b=S0vRkUaCdyu2j/LmTcn6nuuTV+DtK9zuC7wwwhZwaP4u5glXMNS4c5m3Cm3g1FD9geUPaWdTpbns2bVU4tcAkc4q34mNU1hAl5vVGla7n41ggGuyQwnHA+qrSIR7kwRv0bvnbjCi/AJypf9xYHksiTrPWWqDb39lWFSK2yIHaPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762103683; c=relaxed/simple;
	bh=5tX4+Z1yR5D2LYRPowSb74lTMeMAZWfqZKcZiPrnMtE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UGgreWBTCiYcftU0bnlL9X4HiST+EE1SlMCjtsDyVkQkot6AP5EnPLZJdobKABLDGOIhQ7ZKYyK6AnBm/PLUJThAvEk3cSZtOLqYUoJ1tPIaFBXojKTMWQMgrG9vYj3UQuthtgjNKxixzzDMzMgeNRSFcyIqBWX76UnX+NHkjLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gTD3espe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A42AC4CEF7;
	Sun,  2 Nov 2025 17:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762103683;
	bh=5tX4+Z1yR5D2LYRPowSb74lTMeMAZWfqZKcZiPrnMtE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gTD3espeP3KSgAEbP7TUfsRSZcgBz15FzoIZOw+KepVB1xcwMxACbalS1iq3NwPMJ
	 AwKyM/MaLPvwlSE4O8P6ZfupyVsRrVqzT7i4sH70zQ2wH+0GL+Yk9GJy8xe3qZ8/xV
	 xtDAl+dGjSzx0Upy7xZUcWPC5oBcHbpqPDm/yGeDxC3zJIb1pvc56vv3l+RwuWVvF+
	 lN8jpV43lYtf748Pl5f58Nr8bXzRtxFXsz5srfCX1dcapS+7eKbVoLWwkwuvkGeoiE
	 EwW+MVv/fbxdbvptwXobyhkcyLVHPHPljdTV6aYWim+0eFbf7fbN0z91HPCDvCfHI7
	 /B3hgZMzBvpjA==
Date: Sun, 2 Nov 2025 11:18:08 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] arm64: dts: qcom: lemans-evk: Add OTG support for
 primary USB controller
Message-ID: <3mmdcmpzfwamtwe6i7v4vcyis4zjhlz6j7ej2w7se2ehd4wja6@ss3ykc35skhp>
References: <20251102165126.2799143-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251102165126.2799143-1-krishna.kurapati@oss.qualcomm.com>

On Sun, Nov 02, 2025 at 10:21:26PM +0530, Krishna Kurapati wrote:
> Enable OTG support for primary USB controller on EVK Platform. Add
> HD3SS3220 Type-C port controller present between Type-C port and SoC
> that provides role switch notifications to controller.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
> Changes in v4:
> - Moved remote endpoints to SoC file.
> - Renamed vbus regulator name.
> - Moved usb-role-swich property to SoC file.
> 
> Changes in v3:
> - Moved "usb-role-switch" to lemans dtsi file
> - Moved vbus supply to connector node
> 
> Link to v3 DT:
> https://lore.kernel.org/all/20251024182138.2744861-1-krishna.kurapati@oss.qualcomm.com/
> 
> Link to v2:
> https://lore.kernel.org/all/20251008180036.1770735-1-krishna.kurapati@oss.qualcomm.com/

"Link to v3 DT", "Link to v2", no link to v1? No changelog for v2?

There is a clean and easy to follow format for how to write the
changelog, which b4 implements entirely for free (free as in both cost
and effort on your behalf).

Please stop doing your own thing...and adopt b4.

> 
> Link to v6 bindings and driver changes:
> https://lore.kernel.org/all/20251102164819.2798754-1-krishna.kurapati@oss.qualcomm.com/
> 

Another way to say this would be: "this patch can not be merged", but
you didn't say that, you gave me the opportunity to apply the patch, run
dtbs_check, and then go look at this link to determine why there is a
check failure in your patch.

This also means that you have now sent me 4 versions of this patch, none
of which I could have merged, each time suggesting that I should figure
that out myself.

Please stop sending me patches that can't be merged!


To be clear, I'm rejecting this patch and expect you to send v5 once the
dependencies are in linux-next.

Regards,
Bjorn

>  arch/arm64/boot/dts/qcom/lemans-evk.dts | 108 +++++++++++++++++++++++-
>  arch/arm64/boot/dts/qcom/lemans.dtsi    |  20 +++++
>  2 files changed, 126 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
> index b40fa203e4a2..b96d667f1b40 100644
> --- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
> @@ -38,6 +38,35 @@ chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
>  
> +	connector-0 {
> +		compatible = "usb-c-connector";
> +		label = "USB0-Type-C";
> +		data-role = "dual";
> +		power-role = "dual";
> +
> +		vbus-supply = <&vbus_supply_regulator_0>;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +
> +				usb0_con_hs_ep: endpoint {
> +					remote-endpoint = <&usb3_0_hs_ep>;
> +				};
> +			};
> +			port@1 {
> +				reg = <1>;
> +
> +				usb0_con_ss_ep: endpoint {
> +					remote-endpoint = <&hd3ss3220_in_ep>;
> +				};
> +			};
> +		};
> +	};
> +
>  	edp0-connector {
>  		compatible = "dp-connector";
>  		label = "EDP0";
> @@ -102,6 +131,15 @@ platform {
>  		};
>  	};
>  
> +	vbus_supply_regulator_0: regulator-vbus-supply-0 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vbus_supply_0";
> +		gpio = <&expander1 2 GPIO_ACTIVE_HIGH>;
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		enable-active-high;
> +	};
> +
>  	vmmc_sdc: regulator-vmmc-sdc {
>  		compatible = "regulator-fixed";
>  
> @@ -454,6 +492,53 @@ &gpi_dma2 {
>  	status = "okay";
>  };
>  
> +&pmm8654au_2_gpios {
> +	usb0_intr_state: usb0-intr-state {
> +		pins = "gpio5";
> +		function = "normal";
> +		input-enable;
> +		bias-pull-up;
> +		power-source = <0>;
> +	};
> +};
> +
> +&i2c11 {
> +	status = "okay";
> +
> +	hd3ss3220@67 {
> +		compatible = "ti,hd3ss3220";
> +		reg = <0x67>;
> +
> +		interrupts-extended = <&pmm8654au_2_gpios 5 IRQ_TYPE_EDGE_FALLING>;
> +
> +		id-gpios = <&tlmm 50 GPIO_ACTIVE_HIGH>;
> +
> +		pinctrl-0 = <&usb_id>, <&usb0_intr_state>;
> +		pinctrl-names = "default";
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +
> +				hd3ss3220_in_ep: endpoint {
> +					remote-endpoint = <&usb0_con_ss_ep>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +
> +				hd3ss3220_out_ep: endpoint {
> +					remote-endpoint = <&usb3_0_ss_ep>;
> +				};
> +			};
> +		};
> +	};
> +};
> +
>  &i2c18 {
>  	status = "okay";
>  
> @@ -746,11 +831,24 @@ wake-pins {
>  		};
>  	};
>  
> +	qup_i2c11_default: qup-i2c11-state {
> +		pins = "gpio48", "gpio49";
> +		function = "qup1_se4";
> +		drive-strength = <2>;
> +		bias-pull-up;
> +	};
> +
>  	sd_cd: sd-cd-state {
>  		pins = "gpio36";
>  		function = "gpio";
>  		bias-pull-up;
>  	};
> +
> +	usb_id: usb-id-state {
> +		pins = "gpio50";
> +		function = "gpio";
> +		bias-pull-up;
> +	};
>  };
>  
>  &uart10 {
> @@ -779,11 +877,17 @@ &ufs_mem_phy {
>  };
>  
>  &usb_0 {
> -	dr_mode = "peripheral";
> -
>  	status = "okay";
>  };
>  
> +&usb3_0_hs_ep {
> +	remote-endpoint = <&usb0_con_hs_ep>;
> +};
> +
> +&usb3_0_ss_ep {
> +	remote-endpoint = <&hd3ss3220_out_ep>;
> +};
> +
>  &usb_0_hsphy {
>  	vdda-pll-supply = <&vreg_l7a>;
>  	vdda18-supply = <&vreg_l6c>;
> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
> index 0b154d57ba24..5fa4a43a7350 100644
> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
> @@ -4026,7 +4026,27 @@ usb_0: usb@a600000 {
>  			snps,dis-u1-entry-quirk;
>  			snps,dis-u2-entry-quirk;
>  
> +			usb-role-switch;
>  			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					usb3_0_hs_ep: endpoint {
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					usb3_0_ss_ep: endpoint {
> +					};
> +				};
> +			};
>  		};
>  
>  		usb_1: usb@a800000 {
> -- 
> 2.34.1
> 

