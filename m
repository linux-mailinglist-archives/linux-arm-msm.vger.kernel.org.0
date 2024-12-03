Return-Path: <linux-arm-msm+bounces-40063-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 853E69E1913
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 11:20:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 591AA163108
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 10:20:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C39511E1A23;
	Tue,  3 Dec 2024 10:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TcJfdsmS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 901E41E1A08;
	Tue,  3 Dec 2024 10:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733221253; cv=none; b=n+e4fpTYZE+AoXZs+v+IgAe/VOESIoDlZJxwjij6XIaVuEsJBVSPbDRRo44Zc46iNDdjIScpUB5Er/5hipJ1GodfXN3ei2KYIwcgac2/b7FGgWQKOkLPRFeM680TI1jRKV/OIQodMoAdLIP5sQs6sTY3rw1nYkLOWjfj8HZ16i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733221253; c=relaxed/simple;
	bh=9pdmzxINkxEkN9dX9ei/EdSwvHoE6Vl+IzYelHP85Sw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MbnBY283Vdvm1auxcEpo/yY8Fw7jnl1GE3nhFRSGMPuVX4B23ZCbQpsnZnOgX4quZvgUKnOx1eKxauYi8lFzoHmmdc0dIS7rwplLthNg5ZiJyXlwKIEVqx4rAfMrXRj5r8TfpJtoP4+vI/mhr5qeMQhw/8UZsNJqWQFIPqn11p4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TcJfdsmS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EAC1C4CECF;
	Tue,  3 Dec 2024 10:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733221253;
	bh=9pdmzxINkxEkN9dX9ei/EdSwvHoE6Vl+IzYelHP85Sw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TcJfdsmS0C3Sl6/bO8Ngmz5qwVTQLGllAt9pf4QJXipMFcCDhh1hqjm887k9I3l6I
	 Bz6MXnOVd1kuwVmdZCmshKvDdBqJVmPz2cCoBu0MhjvwficzEmtGGSpqPcDCo/CIeL
	 OgQ70G1k9VSgk0GxK3Vk4S+J7dp31xJfYksCCoVr8pwooloPjSpEhS4Az4+lxmdFp5
	 /PCA7Vy3J/p7g50jeYAqxutNhxNpRwSM+DNFIrfv2/iP4tr/scSuYQmlAI0MJjmbl3
	 7TQUk4uBseG0REiS2ddjhxYqLEJjSv5xo2KB1ZnUs6FM/IzIECxaWaEhjxpfFRYJwE
	 6vjfe4hSQHhng==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tIQ1Q-0000000023I-3yyK;
	Tue, 03 Dec 2024 11:20:49 +0100
Date: Tue, 3 Dec 2024 11:20:48 +0100
From: Johan Hovold <johan@kernel.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Abel Vesa <abel.vesa@linaro.org>,
	Krishna Kurapati <quic_kriskura@quicinc.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: x1e80100-crd: Add USB multiport
 fingerprint reader
Message-ID: <Z07bgH5vVk44zuEH@hovoldconsulting.com>
References: <20241118-x1e80100-crd-fp-v1-0-ec6b553a2e53@linaro.org>
 <20241118-x1e80100-crd-fp-v1-1-ec6b553a2e53@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241118-x1e80100-crd-fp-v1-1-ec6b553a2e53@linaro.org>

[ +CC: Krishna, Thinh and the USB list ]

On Mon, Nov 18, 2024 at 11:34:29AM +0100, Stephan Gerhold wrote:
> The X1E80100 CRD has a Goodix fingerprint reader connected to the USB
> multiport controller on eUSB6. All other ports (including USB super-speed
> pins) are unused.
> 
> Set it up in the device tree together with the NXP PTN3222 repeater.
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 48 +++++++++++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
> index 39f9d9cdc10d..44942931c18f 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
> @@ -735,6 +735,26 @@ keyboard@3a {
>  	};
>  };
>  
> +&i2c5 {
> +	clock-frequency = <400000>;
> +
> +	status = "okay";
> +
> +	eusb6_repeater: redriver@4f {
> +		compatible = "nxp,ptn3222";
> +		reg = <0x4f>;

The driver does not currently check that there's actually anything at
this address. Did you verify that this is the correct address? 

(Abel is adding a check to the driver as we speak to catch any such
mistakes going forward).

> +		#phy-cells = <0>;

nit: I'd put provider properties like this one last.

> +		vdd3v3-supply = <&vreg_l13b_3p0>;
> +		vdd1v8-supply = <&vreg_l4b_1p8>;

Sort by supply name?

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
> @@ -1047,6 +1067,14 @@ edp_reg_en: edp-reg-en-state {
>  		bias-disable;
>  	};
>  
> +	eusb6_reset_n: eusb6-reset-n-state {
> +		pins = "gpio184";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +		output-low;

I don't think the pin config should assert reset, that should be up to
the driver to control.

> +	};
> +
>  	hall_int_n_default: hall-int-n-state {
>  		pins = "gpio92";
>  		function = "gpio";
> @@ -1260,3 +1288,23 @@ &usb_1_ss2_dwc3_hs {
>  &usb_1_ss2_qmpphy_out {
>  	remote-endpoint = <&pmic_glink_ss2_ss_in>;
>  };
> +
> +&usb_mp {
> +	status = "okay";
> +};
> +
> +&usb_mp_dwc3 {
> +	/* Limit to USB 2.0 and single port */
> +	maximum-speed = "high-speed";
> +	phys = <&usb_mp_hsphy1>;
> +	phy-names = "usb2-1";
> +};

The dwc3 driver determines (and acts on) the number of ports based on
the port interrupts in DT and controller capabilities. 

I'm not sure we can (should) just drop the other HS PHY and the SS PHYs
that would still be there in the SoC (possibly initialised by the boot
firmware).

I had a local patch to enable the multiport controller (for the suspend
work) and I realise that you'd currently need to specify a repeater also
for the HS PHY which does not have one, but that should be possible to
fix somehow.

> +
> +&usb_mp_hsphy1 {
> +	vdd-supply = <&vreg_l2e_0p8>;
> +	vdda12-supply = <&vreg_l3e_1p2>;
> +
> +	phys = <&eusb6_repeater>;
> +
> +	status = "okay";
> +};

Johan

