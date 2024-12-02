Return-Path: <linux-arm-msm+bounces-39908-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AD77E9E07CD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 17:00:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5465616DA8D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 15:23:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 373AE209F54;
	Mon,  2 Dec 2024 15:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qV0Yu/US"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C9D209F4D;
	Mon,  2 Dec 2024 15:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733152723; cv=none; b=kAyi36hEsmAGLyG6EsTuYjN5WbkRrgn0kK4iU9vLtq3/7XmSjmvVLZ6nDSeGhxdXuEHYbqoFplFAx95aN8XXu0p1VuAjCM5+0xb5UPjknFWO26VbRhDpGdaq7NcTVByY7hHjoO9D9ALGbDr3PyJQREbHWxkq1jBNrxY32xQCobg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733152723; c=relaxed/simple;
	bh=UqawBlPgHPe0/V8FZ2gBXixgUUbPN61Mx7U2Ivpn0AU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pozYx+8ssAlkkIZqfzfn0qwZ7xMJrnq1QcDtshzkhkx4ijiKBSlYSsnHYHOMcL64I/dvnhLenFtmpB9Iw2HwOOYyypX7yG4mtIvfV7niZPCosTmiyPyEq1Nk26QigXBBuOKmO1FtWepbQL4cSelR24EAAa7P/bFob1uRbQexRw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qV0Yu/US; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A208C4CED2;
	Mon,  2 Dec 2024 15:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733152721;
	bh=UqawBlPgHPe0/V8FZ2gBXixgUUbPN61Mx7U2Ivpn0AU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qV0Yu/UScn0KhRx6DvafyEOnXyWNw9b4RnY0C4E2rcQLre445vQh5IEzOXCs5Za/D
	 ZCkWjBRn9BScKK9v5R58e7J1GZ/eABKRHVJMk//DjqwGmwgUDTPf+HNe8YtFo2bDyN
	 JD5hvVN0Rv1Zn2PO8KD9F2/kQyv0FrPOYwDjsb24tc7ogAQYQij3WznRZai/npbG+l
	 IhFhNY+i/fPrU+hF4zyZZl28wfFhZqVsn46r9yL6ZSUXiD3SjFlMi58YhUmWdBThOn
	 TTvWT/SBywsxQPcErqkbRw1y2IycW5V58qLqcmN1o6gyspGK/wo9TXa6LMAZ5LEi8o
	 lE4XOvYO+jTJA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tI8C5-000000007Ja-1j1w;
	Mon, 02 Dec 2024 16:18:37 +0100
Date: Mon, 2 Dec 2024 16:18:37 +0100
From: Johan Hovold <johan@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: x1e78100-t14s: Enable support
 for both Type-A USB ports
Message-ID: <Z03PzTsTi3EwaXcE@hovoldconsulting.com>
References: <20241202-x1e80100-qcp-t14-enable-usb-type-a-ports-v2-0-7360ed65c769@linaro.org>
 <20241202-x1e80100-qcp-t14-enable-usb-type-a-ports-v2-1-7360ed65c769@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202-x1e80100-qcp-t14-enable-usb-type-a-ports-v2-1-7360ed65c769@linaro.org>

On Mon, Dec 02, 2024 at 11:23:17AM +0200, Abel Vesa wrote:
> The Thinkpad T14s has 2 USB-A ports, both connected to the USB
> multiport controller, each one via a separate NXP PTN3222 eUSB2-to-USB2
> redriver to the eUSB2 PHY for High-Speed support, with a dedicated QMP
> PHY for SuperSpeed support.
> 
> Describe each redriver and then enable each pair of PHYs and the
> USB controller itself, in order to enable support for the 2 USB-A ports.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts     | 86 ++++++++++++++++++++++
>  1 file changed, 86 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
> index 975550139e1024420ed335a2a46e4d54df7ee423..f936e3246ec87972746a60080c3a48d646a356f2 100644
> --- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
> @@ -495,6 +495,40 @@ keyboard@3a {
>  	};
>  };
>  
> +&i2c5 {
> +	clock-frequency = <400000>;
> +
> +	status = "okay";
> +
> +	eusb3_repeater: redriver@47 {
> +		compatible = "nxp,ptn3222";
> +		reg = <0x47>;

The driver doesn't seem to actually communicate with these devices
currently and the addresses you specify here do not match what the
schematics says.

Have you verified that these addresses are correct?

> +		#phy-cells = <0>;
> +
> +		vdd3v3-supply = <&vreg_l13b_3p0>;
> +		vdd1v8-supply = <&vreg_l4b_1p8>;
> +
> +		reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
> +
> +		pinctrl-0 = <&eusb3_reset_n>;
> +		pinctrl-names = "default";
> +	};
> +
> +	eusb6_repeater: redriver@4f {
> +		compatible = "nxp,ptn3222";
> +		reg = <0x4f>;

Same here.

> +		#phy-cells = <0>;
> +
> +		vdd3v3-supply = <&vreg_l13b_3p0>;
> +		vdd1v8-supply = <&vreg_l4b_1p8>;
> +
> +		reset-gpios = <&tlmm 184 GPIO_ACTIVE_LOW>;
> +
> +		pinctrl-0 = <&eusb6_reset_n>;
> +		pinctrl-names = "default";
> +	};
> +};
> +
>  &i2c8 {
>  	clock-frequency = <400000>;
>  
> @@ -651,6 +685,22 @@ &tlmm {
>  			       <72 2>, /* Secure EC I2C connection (?) */
>  			       <238 1>; /* UFS Reset */
>  
> +	eusb3_reset_n: eusb3-reset-n-state {
> +		pins = "gpio6";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +		output-low;

I don't think the pin configuration should assert reset, that should be
left up to the driver to decide, that is,  when (and if) it's an
appropriate thing to do.

> +	};
> +
> +	eusb6_reset_n: eusb6-reset-n-state {
> +		pins = "gpio184";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +		output-low;

Same here.

> +	};
> +
>  	tpad_default: tpad-default-state {
>  		pins = "gpio3";
>  		function = "gpio";
> @@ -808,3 +858,39 @@ &usb_1_ss1_dwc3_hs {
>  &usb_1_ss1_qmpphy_out {
>  	remote-endpoint = <&pmic_glink_ss1_ss_in>;
>  };

And last, but not least, the T14s may hard reset if you disconnect a
thumb drive connected to one of these ports while suspended (6.13-rc1).

Once it survived with a lockdep splat indicating a circular locking
dependency. I see that on the CRD as well, so possibly not related to
the hard reset.

No such issues with a FullSpeed keyboard.

Johan

