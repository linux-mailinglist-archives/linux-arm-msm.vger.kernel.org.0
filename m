Return-Path: <linux-arm-msm+bounces-92736-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJ6RCC6CjmkLCwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92736-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 02:45:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F445132507
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 02:45:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 86E653013C69
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 01:45:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B984723BF83;
	Fri, 13 Feb 2026 01:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fmd6pj2F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945C2239E6F;
	Fri, 13 Feb 2026 01:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770947112; cv=none; b=CWukOLt5apU0lCW2glFxRd9h9wGof/C9b18pk0T7KnUwjEwmtFGn6TYBt3c/Rnib6k1yOLqcTxr5rKkPBNmSsRXs4JxxNXSoi14naE3WYyxXiCRqonj3v4rPAA6tyUnjlbwAxa7MLiA33mslaXmiUke0RoTb1/uKEXQjiN0tCZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770947112; c=relaxed/simple;
	bh=tACVwMa/u6HmA7WDdokbna5otA5XdG8Pg0XvKGcraxo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UsNzajcbc46UCG+dpO25YfcXIguJr+PYgZknZ9uIy6OGJVHUNw/WAPSP/gdFTmEdHbnCLN8Rr/Y7Qm3o/tVT8YdJwKYn3wo4mkrtSG+kHmgJz8kjArROWoWOnyizL2MVRjlXz596F3s3RBgwcDZWmVM542m6XK/b4EZYatCou6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fmd6pj2F; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B176FC4CEF7;
	Fri, 13 Feb 2026 01:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770947112;
	bh=tACVwMa/u6HmA7WDdokbna5otA5XdG8Pg0XvKGcraxo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fmd6pj2FsA1O+sJXBGUwTpxS5NM+mMk9fEFERHJ5el8zsCj8vFRzS8j5+lZrwG3AU
	 cv7pka+FQU014bOXATviz+I5AEuP2ZiVxn5oyH5KVmZkK4qMD85qx1nw7wRdxv5nAW
	 UoHjrvG/fSLlC8CczqGSgIrODMDAPEQUtOOjthM8LZQ0r7z/qj2c65Iqa4PZk42Zud
	 zPciSL+QczLHhrpaVF5WCHjHhmWI7fv4ysLixKjFzeglCRHn55XClzqPO4jm/kynoB
	 kSKIkEGTA9Lv3ecn9ds1Mquszq6M6GWcVWmTL7AQGiluKhbYy0r+bvRrGwhPQbdZOe
	 TsQuCl+cv29rA==
Date: Fri, 13 Feb 2026 07:15:05 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Neil Armstrong <neil.armstrong@linaro.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH RFC] arm64: dts: qcom: qcs6490-rb3gen2: Enable uPD720201
 and GL3590
Message-ID: <4qhibtfmmdidmi3rdwlr6lxan3uvlikpx75gp76fnrbh7axpp6@ya7um42raxvp>
References: <20260212-rb3gen2-upd-gl3590-v1-1-18fb04bb32b0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260212-rb3gen2-upd-gl3590-v1-1-18fb04bb32b0@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92736-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.3:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,0.0.0.0:email,0.0.0.1:email,0.0.0.2:email]
X-Rspamd-Queue-Id: 2F445132507
X-Rspamd-Action: no action

On Thu, Feb 12, 2026 at 02:43:46PM -0600, Bjorn Andersson wrote:
> The QCS6490 Rb3Gen2 has a Renesas μPD720201 XHCI controller hanging off
> the TC9563 PCIe switch, on this a Genesys Logic GL3590 USB hub provides
> two USB Type-A ports and an ASIX AX88179 USB 3.0 Gigabit Ethernet
> interface.
> 
> The Renesas chip is powered by two regulators controlled through PM7250B
> GPIOs 1 and 4, and the power/reset pin is pulled down by PM8350C GPIO 4.
> The Genesys chip power is always-on, but the reset pin is controlled
> through TLMM GPIO 162.
> 
> Describe the Renesas chip on the PCIe bus, with supplies and reset, to
> allow it to be brought out of reset and discovered. Then describe the
> two peers of the USB hub, with its reset GPIO, to allow this to be
> brought out of reset.
> 
> The USB Type-A connectors are not described, as they are in no regard
> controlled by the operating system.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---
> Posting this as a RFC, because it doesn't work without some hacks in the
> PCI pwrctrl code. It depends on Neil's work for μPD720201 pwrctrl [1],
> on the GL3590 work by Swati and Krisha [2], and my regulator fix [3].
> With these three dependencies, the hacks in drivers/pci/pwrctrl/core.c,
> and firmware for the μPD720201, the primary ethernet lights up.
> 
> Then in pci_pwrctrl_create_device() we assume that anything in a PCI
> device node, with either a -supply or port/ports property, should be a
> platform_device. When the USB bus(es) of the μPD720201 shows up, it
> again registers this platform_device. It seems that
> of_platform_device_create() saves us and does an early exit, but by
> "accident".
> 

I agree that this is an issue, probably an overlook on my part assuming that
every child node of the Root Port is a PCIe node. I should add a check for
the 'device_type' property before we even check for the existence of the
supply/graph properties.

I was notified of an internal regression as well with graph port check. So I'll
send both fixes in a single series.

- Mani

> __pci_pwrctrl_power_on_device() and __pci_pwrctrl_power_off_device() on
> the other hand, they happily pick up the non-NULL drvdata, which is of
> type struct onboard_dev, to call the power_on() and power_off() methods.
> 
> It's not clear to me why the whole board resets at this point, but I
> don't think we can assume that any random platform_device we find at any
> level below the PCIe bus has a drvdata of type struct pci_pwrctrl...
> 
> [1] https://lore.kernel.org/all/20260206-topic-sm8650-ayaneo-pocket-s2-base-v3-0-5b79c5d61a03@linaro.org/
> [2] https://lore.kernel.org/all/20260122092852.887624-1-swati.agarwal@oss.qualcomm.com/
> [3] https://lore.kernel.org/linux-arm-msm/177091226767.237262.6699917364293122804.b4-ty@kernel.org/T/#t
> ---
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 94 ++++++++++++++++++++++++++++
>  1 file changed, 94 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> index e3d2f01881ae05f17796f9c97f10b53cea50daff..e8d3588e67d0386150258d0bc28b4c6200920067 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> @@ -262,6 +262,28 @@ active-config0 {
>  		};
>  	};
>  
> +	vreg_pcie0_1p05: regulator-pcie0-1p05v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "PCIE0_1.05V";
> +		gpio = <&pm7250b_gpios 4 GPIO_ACTIVE_HIGH>;
> +		regulator-min-microvolt = <1050000>;
> +		regulator-max-microvolt = <1050000>;
> +		enable-active-high;
> +		pinctrl-0 = <&upd_pwr_en2_state>;
> +		pinctrl-names = "default";
> +	};
> +
> +	vreg_pcie0_3p3: regulator-pcie0-3p3v-dual {
> +		compatible = "regulator-fixed";
> +		regulator-name = "PCIE0_3.3V_Dual";
> +		gpio = <&pm7250b_gpios 1 GPIO_ACTIVE_HIGH>;
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		enable-active-high;
> +		pinctrl-0 = <&upd_pwr_en1_state>;
> +		pinctrl-names = "default";
> +	};
> +
>  	vdd_ntn_0p9: regulator-vdd-ntn-0p9 {
>  		compatible = "regulator-fixed";
>  		regulator-name = "VDD_NTN_0P9";
> @@ -870,6 +892,41 @@ pcie@2,0 {
>  			device_type = "pci";
>  			ranges;
>  			bus-range = <0x4 0xff>;
> +
> +			/* Renesas μPD720201 PCIe USB3.0 Host Controller */
> +			usb-controller@0,0 {
> +				compatible = "pci1912,0014";
> +				reg = <0x40000 0x0 0x0 0x0 0x0>;
> +
> +				avdd33-supply = <&vreg_pcie0_3p3>;
> +				vdd10-supply = <&vreg_pcie0_1p05>;
> +				vdd33-supply = <&vreg_pcie0_3p3>;
> +
> +				pinctrl-0 = <&upd_hub_rst_state>;
> +				pinctrl-names = "default";
> +
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				/* Genesys Logic GL3590 USB Hub Controller */
> +				gl3590_2_0: hub@1 {
> +					compatible = "usb5e3,610";
> +					reg = <1>;
> +					reset-gpios = <&tlmm 162 GPIO_ACTIVE_HIGH>;
> +
> +					pinctrl-0 = <&usb_hub_reset_state>;
> +					pinctrl-names = "default";
> +
> +					peer-hub = <&gl3590_3_0>;
> +				};
> +
> +				gl3590_3_0: hub@2 {
> +					compatible = "usb5e3,625";
> +					reg = <2>;
> +
> +					peer-hub = <&gl3590_2_0>;
> +				};
> +			};
>  		};
>  
>  		pcie@3,0 {
> @@ -1198,6 +1255,17 @@ ntn_1p8_en: ntn-1p8-en-state {
>  		power-source = <0>;
>  	};
>  
> +	upd_hub_rst_state: upd-hub-rst-state {
> +		pins = "gpio4";
> +		function = "normal";
> +
> +		bias-disable;
> +		input-disable;
> +		output-enable;
> +		output-high;
> +		power-source = <0>;
> +	};
> +
>  	tc9563_resx_n: tc9563-resx-state {
>  		pins = "gpio1";
>  		function = "normal";
> @@ -1378,6 +1446,15 @@ &edp_hot_plug_det {
>  };
>  
>  &pm7250b_gpios {
> +	upd_pwr_en1_state: upd-pwr-en1-state {
> +		pins = "gpio1";
> +		function = "normal";
> +
> +		output-enable;
> +		input-disable;
> +		power-source = <0>;
> +	};
> +
>  	lt9611_rst_pin: lt9611-rst-state {
>  		pins = "gpio2";
>  		function = "normal";
> @@ -1386,6 +1463,15 @@ lt9611_rst_pin: lt9611-rst-state {
>  		input-disable;
>  		power-source = <0>;
>  	};
> +
> +	upd_pwr_en2_state: upd-pwr-en2-state {
> +		pins = "gpio4";
> +		function = "normal";
> +
> +		output-enable;
> +		input-disable;
> +		power-source = <0>;
> +	};
>  };
>  
>  &sdc2_clk {
> @@ -1431,6 +1517,14 @@ sd_cd: sd-cd-state {
>  		function = "gpio";
>  		bias-pull-up;
>  	};
> +
> +	usb_hub_reset_state: usb-hub-reset-state {
> +		pins = "gpio162";
> +		function = "gpio";
> +
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
>  };
>  
>  &lpass_audiocc {
> 
> ---
> base-commit: fd9678829d6dd0c10fde080b536abf4b1121c346
> change-id: 20260212-rb3gen2-upd-gl3590-d110dd722e1b
> 
> Best regards,
> -- 
> Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> 

-- 
மணிவண்ணன் சதாசிவம்

