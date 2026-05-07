Return-Path: <linux-arm-msm+bounces-106442-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mE0uHs+i/Gn2SAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106442-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 16:33:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E11E54EA42D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 16:33:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B31DC3065EB1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 14:31:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9604402B95;
	Thu,  7 May 2026 14:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z6Ktnttl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E4D40243F;
	Thu,  7 May 2026 14:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778164285; cv=none; b=C3ovt/wFKYNl7PqZ8YuTDXtkzZZ5smranyWYwRTZGVNBSPUtb+qHmU08kvd/YGhsXonI/QjRk41YIrNzoBkfKaZYL0K2cBqfMGZfovfjTlbQnXPmW+AFByjAZp0wyPm3QpeV56sFVo1oyMgaYjjRcxDMlQygvE+gagcO6Iflc90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778164285; c=relaxed/simple;
	bh=gBIhM5oOYcUeocdqahEe6skm2mBRHoX9SMZ9xMhh6HI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NKpvvT8PBIk5TPQdLM0Oz4eBVPs6xDpZv0Lnn3ue8WDsCaW5LS356GartDv8HZtRnl2vBqwXfoT8WTbALJ31PNb9lZIbTfg09tBEap9LKNhFxToO12GDGLeDc9zPiOiypCrUNuRObycjh/zu0WXpc3W25CT+AlIdqjskC47PKkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z6Ktnttl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DE27C2BCB2;
	Thu,  7 May 2026 14:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778164285;
	bh=gBIhM5oOYcUeocdqahEe6skm2mBRHoX9SMZ9xMhh6HI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z6KtnttlI5ZENemYZK7Fujv7Y7qjtz65fM/MKOtHCAUubrKWR4vGg2twQsdt/A3Pk
	 Ae/Wd9xZMc2/Lj2x5+xZjoGinvSoWySLltQ07IokngxRH6GBOVwOSqFuti5XgLaLM0
	 bBCo84WaJI6Oc9ZM9Wu7ex/0TeqD/GDFO95MEXPXDKllbHUgtNE9kXnYumfr88oIIO
	 i1aOVWxv7aNeHpKSTIA3+whwjGwwC85cmbd9+hn/N9vHi7gW5MohpIOFtNLP7DjHuP
	 BgG8DRpbDKmc3AYnRl5V+YNmQZXn7wFWdXvfwL30EkhldWT7x0d3+iL9/A7eYbjjSe
	 sIKq2xVAOX8ZA==
Date: Thu, 7 May 2026 09:31:21 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Xilin Wu <sophon@radxa.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp: Flatten usb controller nodes
Message-ID: <afyh9nOoTT4wlzaY@baldur>
References: <20260507-sc8280xp-flatten-dwc3-v1-1-b18be56bebba@radxa.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260507-sc8280xp-flatten-dwc3-v1-1-b18be56bebba@radxa.com>
X-Rspamd-Queue-Id: E11E54EA42D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106442-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,a400000:email,a8f8800:email,a600000:email,0.140.97.128:email,0.0.0.1:email]
X-Rspamd-Action: no action

On Thu, May 07, 2026 at 10:29:24PM +0800, Xilin Wu wrote:
> Flatten usb controller nodes and update to using latest bindings
> and flattened driver approach.
> 

Can you please confirm that we survive a system suspend cycle with this?

Also, start your commit message with describing the problem you're
solving, not by describing an action.

Regards,
Bjorn

> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8295p-adp.dts           |  12 +-
>  arch/arm64/boot/dts/qcom/sa8540p-ride.dts          |   6 +-
>  arch/arm64/boot/dts/qcom/sc8280xp-crd.dts          |  12 +-
>  .../boot/dts/qcom/sc8280xp-huawei-gaokun3.dts      |  12 +-
>  .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     |  12 +-
>  .../boot/dts/qcom/sc8280xp-microsoft-arcata.dts    |  12 +-
>  .../boot/dts/qcom/sc8280xp-microsoft-blackrock.dts |  18 +--
>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi             | 156 +++++++++------------
>  8 files changed, 97 insertions(+), 143 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8295p-adp.dts b/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
> index d28d69162427..abd0f6a64b11 100644
> --- a/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
> +++ b/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
> @@ -587,12 +587,10 @@ &ufs_card_phy {
>  };
>  
>  &usb_0 {
> -	status = "okay";
> -};
> -
> -&usb_0_dwc3 {
>  	/* TODO: Define USB-C connector properly */
>  	dr_mode = "peripheral";
> +
> +	status = "okay";
>  };
>  
>  &usb_0_hsphy {
> @@ -611,12 +609,10 @@ &usb_0_qmpphy {
>  };
>  
>  &usb_1 {
> -	status = "okay";
> -};
> -
> -&usb_1_dwc3 {
>  	/* TODO: Define USB-C connector properly */
>  	dr_mode = "host";
> +
> +	status = "okay";
>  };
>  
>  &usb_1_hsphy {
> diff --git a/arch/arm64/boot/dts/qcom/sa8540p-ride.dts b/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
> index 44177e9b64b5..e794689f0777 100644
> --- a/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
> @@ -462,11 +462,9 @@ &ufs_mem_phy {
>  };
>  
>  &usb_0 {
> -	status = "okay";
> -};
> -
> -&usb_0_dwc3 {
>  	dr_mode = "peripheral";
> +
> +	status = "okay";
>  };
>  
>  &usb_0_hsphy {
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
> index c53e00cae465..3b624544b676 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
> @@ -816,11 +816,9 @@ &ufs_mem_phy {
>  };
>  
>  &usb_0 {
> -	status = "okay";
> -};
> -
> -&usb_0_dwc3 {
>  	dr_mode = "host";
> +
> +	status = "okay";
>  };
>  
>  &usb_0_dwc3_hs {
> @@ -853,11 +851,9 @@ &usb_0_qmpphy_out {
>  };
>  
>  &usb_1 {
> -	status = "okay";
> -};
> -
> -&usb_1_dwc3 {
>  	dr_mode = "host";
> +
> +	status = "okay";
>  };
>  
>  &usb_1_dwc3_hs {
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts b/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
> index 9819454abe13..dfc1341ccc5d 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
> @@ -1129,11 +1129,9 @@ bluetooth {
>  };
>  
>  &usb_0 {
> -	status = "okay";
> -};
> -
> -&usb_0_dwc3 {
>  	dr_mode = "host";
> +
> +	status = "okay";
>  };
>  
>  &usb_0_dwc3_hs {
> @@ -1166,11 +1164,9 @@ &usb_0_qmpphy_out {
>  };
>  
>  &usb_1 {
> -	status = "okay";
> -};
> -
> -&usb_1_dwc3 {
>  	dr_mode = "host";
> +
> +	status = "okay";
>  };
>  
>  &usb_1_dwc3_hs {
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> index d84ca010ab9d..a1e8e75fc553 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> @@ -1338,11 +1338,9 @@ bluetooth {
>  };
>  
>  &usb_0 {
> -	status = "okay";
> -};
> -
> -&usb_0_dwc3 {
>  	dr_mode = "host";
> +
> +	status = "okay";
>  };
>  
>  &usb_0_dwc3_hs {
> @@ -1376,11 +1374,9 @@ &usb_0_qmpphy_out {
>  };
>  
>  &usb_1 {
> -	status = "okay";
> -};
> -
> -&usb_1_dwc3 {
>  	dr_mode = "host";
> +
> +	status = "okay";
>  };
>  
>  &usb_1_dwc3_hs {
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
> index f2b4470d4407..207c13adcb9d 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
> @@ -755,11 +755,9 @@ embedded-controller {
>  };
>  
>  &usb_0 {
> -	status = "okay";
> -};
> -
> -&usb_0_dwc3 {
>  	dr_mode = "host";
> +
> +	status = "okay";
>  };
>  
>  &usb_0_dwc3_hs {
> @@ -792,11 +790,9 @@ &usb_0_qmpphy_out {
>  };
>  
>  &usb_1 {
> -	status = "okay";
> -};
> -
> -&usb_1_dwc3 {
>  	dr_mode = "host";
> +
> +	status = "okay";
>  };
>  
>  &usb_1_dwc3_hs {
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts
> index 00bbeeef6f14..0cfd69201cae 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts
> @@ -983,11 +983,9 @@ bluetooth {
>  };
>  
>  &usb_0 {
> -	status = "okay";
> -};
> -
> -&usb_0_dwc3 {
>  	dr_mode = "host";
> +
> +	status = "okay";
>  };
>  
>  &usb_0_dwc3_hs {
> @@ -1020,11 +1018,9 @@ &usb_0_qmpphy_out {
>  };
>  
>  &usb_1 {
> -	status = "okay";
> -};
> -
> -&usb_1_dwc3 {
>  	dr_mode = "host";
> +
> +	status = "okay";
>  };
>  
>  &usb_1_dwc3_hs {
> @@ -1060,12 +1056,10 @@ &usb_2 {
>  	pinctrl-0 = <&usb2_en_state>;
>  	pinctrl-names = "default";
>  
> -	status = "okay";
> -};
> -
> -&usb_2_dwc3 {
>  	phys = <&usb_2_hsphy0>, <&usb_2_qmpphy0>;
>  	phy-names = "usb2-0", "usb3-0";
> +
> +	status = "okay";
>  };
>  
>  &usb_2_hsphy0 {
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> index 761f229e8f47..ecfc64d864fc 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> @@ -3940,12 +3940,9 @@ system-cache-controller@9200000 {
>  			interrupts = <GIC_SPI 582 IRQ_TYPE_LEVEL_HIGH>;
>  		};
>  
> -		usb_2: usb@a4f8800 {
> -			compatible = "qcom,sc8280xp-dwc3-mp", "qcom,dwc3";
> -			reg = <0 0x0a4f8800 0 0x400>;
> -			#address-cells = <2>;
> -			#size-cells = <2>;
> -			ranges;
> +		usb_2: usb@a400000 {
> +			compatible = "qcom,sc8280xp-dwc3-mp", "qcom,snps-dwc3";
> +			reg = <0 0x0a400000 0 0xfc100>;
>  
>  			clocks = <&gcc GCC_CFG_NOC_USB3_MP_AXI_CLK>,
>  				 <&gcc GCC_USB30_MP_MASTER_CLK>,
> @@ -3963,7 +3960,8 @@ usb_2: usb@a4f8800 {
>  					  <&gcc GCC_USB30_MP_MASTER_CLK>;
>  			assigned-clock-rates = <19200000>, <200000000>;
>  
> -			interrupts-extended = <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
> +			interrupts-extended = <&intc GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
>  					      <&intc GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>,
>  					      <&intc GIC_SPI 857 IRQ_TYPE_LEVEL_HIGH>,
>  					      <&intc GIC_SPI 856 IRQ_TYPE_LEVEL_HIGH>,
> @@ -3982,7 +3980,8 @@ usb_2: usb@a4f8800 {
>  					      <&pdc 16 IRQ_TYPE_LEVEL_HIGH>,
>  					      <&pdc 17 IRQ_TYPE_LEVEL_HIGH>;
>  
> -			interrupt-names = "pwr_event_1", "pwr_event_2",
> +			interrupt-names = "dwc_usb3",
> +					  "pwr_event_1", "pwr_event_2",
>  					  "pwr_event_3", "pwr_event_4",
>  					  "hs_phy_1",	 "hs_phy_2",
>  					  "hs_phy_3",	 "hs_phy_4",
> @@ -4003,33 +4002,25 @@ usb_2: usb@a4f8800 {
>  
>  			wakeup-source;
>  
> +			iommus = <&apps_smmu 0x800 0x0>;
> +			phys = <&usb_2_hsphy0>, <&usb_2_qmpphy0>,
> +			       <&usb_2_hsphy1>, <&usb_2_qmpphy1>,
> +			       <&usb_2_hsphy2>,
> +			       <&usb_2_hsphy3>;
> +			phy-names = "usb2-0", "usb3-0",
> +				    "usb2-1", "usb3-1",
> +				    "usb2-2",
> +				    "usb2-3";
> +			dr_mode = "host";
> +			snps,dis-u1-entry-quirk;
> +			snps,dis-u2-entry-quirk;
> +
>  			status = "disabled";
> +		};
>  
> -			usb_2_dwc3: usb@a400000 {
> -				compatible = "snps,dwc3";
> -				reg = <0 0x0a400000 0 0xcd00>;
> -				interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
> -				iommus = <&apps_smmu 0x800 0x0>;
> -				phys = <&usb_2_hsphy0>, <&usb_2_qmpphy0>,
> -				       <&usb_2_hsphy1>, <&usb_2_qmpphy1>,
> -				       <&usb_2_hsphy2>,
> -				       <&usb_2_hsphy3>;
> -				phy-names = "usb2-0", "usb3-0",
> -					    "usb2-1", "usb3-1",
> -					    "usb2-2",
> -					    "usb2-3";
> -				dr_mode = "host";
> -				snps,dis-u1-entry-quirk;
> -				snps,dis-u2-entry-quirk;
> -			};
> -		};
> -
> -		usb_0: usb@a6f8800 {
> -			compatible = "qcom,sc8280xp-dwc3", "qcom,dwc3";
> -			reg = <0 0x0a6f8800 0 0x400>;
> -			#address-cells = <2>;
> -			#size-cells = <2>;
> -			ranges;
> +		usb_0: usb@a600000 {
> +			compatible = "qcom,sc8280xp-dwc3", "qcom,snps-dwc3";
> +			reg = <0 0x0a600000 0 0xfc100>;
>  
>  			clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
>  				 <&gcc GCC_USB30_PRIM_MASTER_CLK>,
> @@ -4047,12 +4038,14 @@ usb_0: usb@a6f8800 {
>  					  <&gcc GCC_USB30_PRIM_MASTER_CLK>;
>  			assigned-clock-rates = <19200000>, <200000000>;
>  
> -			interrupts-extended = <&intc GIC_SPI 804 IRQ_TYPE_LEVEL_HIGH>,
> +			interrupts-extended = <&intc GIC_SPI 803 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&intc GIC_SPI 804 IRQ_TYPE_LEVEL_HIGH>,
>  					      <&intc GIC_SPI 805 IRQ_TYPE_LEVEL_HIGH>,
>  					      <&pdc 14 IRQ_TYPE_EDGE_BOTH>,
>  					      <&pdc 15 IRQ_TYPE_EDGE_BOTH>,
>  					      <&pdc 138 IRQ_TYPE_LEVEL_HIGH>;
> -			interrupt-names = "pwr_event",
> +			interrupt-names = "dwc_usb3",
> +					  "pwr_event",
>  					  "hs_phy_irq",
>  					  "dp_hs_phy_irq",
>  					  "dm_hs_phy_irq",
> @@ -4069,46 +4062,38 @@ usb_0: usb@a6f8800 {
>  
>  			wakeup-source;
>  
> -			status = "disabled";
> +			iommus = <&apps_smmu 0x820 0x0>;
> +			phys = <&usb_0_hsphy>, <&usb_0_qmpphy QMP_USB43DP_USB3_PHY>;
> +			phy-names = "usb2-phy", "usb3-phy";
> +			snps,dis-u1-entry-quirk;
> +			snps,dis-u2-entry-quirk;
>  
> -			usb_0_dwc3: usb@a600000 {
> -				compatible = "snps,dwc3";
> -				reg = <0 0x0a600000 0 0xcd00>;
> -				interrupts = <GIC_SPI 803 IRQ_TYPE_LEVEL_HIGH>;
> -				iommus = <&apps_smmu 0x820 0x0>;
> -				phys = <&usb_0_hsphy>, <&usb_0_qmpphy QMP_USB43DP_USB3_PHY>;
> -				phy-names = "usb2-phy", "usb3-phy";
> -				snps,dis-u1-entry-quirk;
> -				snps,dis-u2-entry-quirk;
> +			status = "disabled";
>  
> -				ports {
> -					#address-cells = <1>;
> -					#size-cells = <0>;
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
>  
> -					port@0 {
> -						reg = <0>;
> +				port@0 {
> +					reg = <0>;
>  
> -						usb_0_dwc3_hs: endpoint {
> -						};
> +					usb_0_dwc3_hs: endpoint {
>  					};
> +				};
>  
> -					port@1 {
> -						reg = <1>;
> +				port@1 {
> +					reg = <1>;
>  
> -						usb_0_dwc3_ss: endpoint {
> -							remote-endpoint = <&usb_0_qmpphy_usb_ss_in>;
> -						};
> +					usb_0_dwc3_ss: endpoint {
> +						remote-endpoint = <&usb_0_qmpphy_usb_ss_in>;
>  					};
>  				};
>  			};
>  		};
>  
> -		usb_1: usb@a8f8800 {
> -			compatible = "qcom,sc8280xp-dwc3", "qcom,dwc3";
> -			reg = <0 0x0a8f8800 0 0x400>;
> -			#address-cells = <2>;
> -			#size-cells = <2>;
> -			ranges;
> +		usb_1: usb@a800000 {
> +			compatible = "qcom,sc8280xp-dwc3", "qcom,snps-dwc3";
> +			reg = <0 0x0a800000 0 0xfc100>;
>  
>  			clocks = <&gcc GCC_CFG_NOC_USB3_SEC_AXI_CLK>,
>  				 <&gcc GCC_USB30_SEC_MASTER_CLK>,
> @@ -4126,12 +4111,14 @@ usb_1: usb@a8f8800 {
>  					  <&gcc GCC_USB30_SEC_MASTER_CLK>;
>  			assigned-clock-rates = <19200000>, <200000000>;
>  
> -			interrupts-extended = <&intc GIC_SPI 811 IRQ_TYPE_LEVEL_HIGH>,
> +			interrupts-extended = <&intc GIC_SPI 810 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&intc GIC_SPI 811 IRQ_TYPE_LEVEL_HIGH>,
>  					      <&intc GIC_SPI 790 IRQ_TYPE_LEVEL_HIGH>,
>  					      <&pdc 12 IRQ_TYPE_EDGE_BOTH>,
>  					      <&pdc 13 IRQ_TYPE_EDGE_BOTH>,
>  					      <&pdc 136 IRQ_TYPE_LEVEL_HIGH>;
> -			interrupt-names = "pwr_event",
> +			interrupt-names = "dwc_usb3",
> +					  "pwr_event",
>  					  "hs_phy_irq",
>  					  "dp_hs_phy_irq",
>  					  "dm_hs_phy_irq",
> @@ -4148,35 +4135,30 @@ usb_1: usb@a8f8800 {
>  
>  			wakeup-source;
>  
> -			status = "disabled";
> +			iommus = <&apps_smmu 0x860 0x0>;
> +			phys = <&usb_1_hsphy>, <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
> +			phy-names = "usb2-phy", "usb3-phy";
> +			snps,dis-u1-entry-quirk;
> +			snps,dis-u2-entry-quirk;
>  
> -			usb_1_dwc3: usb@a800000 {
> -				compatible = "snps,dwc3";
> -				reg = <0 0x0a800000 0 0xcd00>;
> -				interrupts = <GIC_SPI 810 IRQ_TYPE_LEVEL_HIGH>;
> -				iommus = <&apps_smmu 0x860 0x0>;
> -				phys = <&usb_1_hsphy>, <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
> -				phy-names = "usb2-phy", "usb3-phy";
> -				snps,dis-u1-entry-quirk;
> -				snps,dis-u2-entry-quirk;
> +			status = "disabled";
>  
> -				ports {
> -					#address-cells = <1>;
> -					#size-cells = <0>;
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
>  
> -					port@0 {
> -						reg = <0>;
> +				port@0 {
> +					reg = <0>;
>  
> -						usb_1_dwc3_hs: endpoint {
> -						};
> +					usb_1_dwc3_hs: endpoint {
>  					};
> +				};
>  
> -					port@1 {
> -						reg = <1>;
> +				port@1 {
> +					reg = <1>;
>  
> -						usb_1_dwc3_ss: endpoint {
> -							remote-endpoint = <&usb_1_qmpphy_usb_ss_in>;
> -						};
> +					usb_1_dwc3_ss: endpoint {
> +						remote-endpoint = <&usb_1_qmpphy_usb_ss_in>;
>  					};
>  				};
>  			};
> 
> ---
> base-commit: 735d2f48cadaa9a87e7c7601667878de70c771c5
> change-id: 20260507-sc8280xp-flatten-dwc3-2151039b64ba
> 
> Best regards,
> --  
> Xilin Wu <sophon@radxa.com>
> 

