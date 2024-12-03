Return-Path: <linux-arm-msm+bounces-40072-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6F29E1B9B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 13:03:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3ECD4161490
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 12:03:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E7F01E490B;
	Tue,  3 Dec 2024 12:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VKt0pbeO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0FBF1E4908
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Dec 2024 12:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733227391; cv=none; b=Gqd5ODf+LWvpbnR7syfEqz0DUm2QgAiMIKRh6cEr8UI+H6EoiOlN5NdZf+WnEqJvyX+qEuVhGe6lgqezXqe5xSunYv7MZ0u5KnXkbHNPVpkXXY9vfKxdQrR+zkg8AoXvJHoIYCwMXWSSXqztoxqwPWrH69h+VkPgfn3J1Q2jnBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733227391; c=relaxed/simple;
	bh=/SHUjEZj0+DIt9galfwmQtnRJJrNtbTjKsnxqJpKtVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dEmO7nTcekgAWRJh5KRiZOco3rRSzoqrM27Tjq7mYFcTQmJ42BJ3up+mO2fW2xSvh6T9zSbbP3HlNGrP7b+pGJxCg6fsCNG0cqcybGolqWNY8KRRn2bqwKxNQ5QAql81UTCuZQaITEC7hA1ePXLcQBpcoZ5QG6nOuARGa9pPqTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VKt0pbeO; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-434a852bb6eso50002975e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Dec 2024 04:03:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733227387; x=1733832187; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y0I7eoP4tW1sy5Wnizr4Z0EwfocpUFRNEULcv2IVlsM=;
        b=VKt0pbeOjDTzcWY7bYHbQBR5pBgJmIXYSicNJj48qkYVUd2pDmITsE1z7ggPkgEYgq
         5L/W9i/w/02VIk8DHhVNA1q+Yhl/5Q1vyWfT+5or/TsbR5SUGuBsIEYqVtgSt2f1aJrn
         I0gmFgYglz9y9Qz9prdJP/KSXWg/iRzOu0Jd3mcWxf24udoy1uw87+13hopFaAmuquM6
         FHdvxly8z8olS9DxWwDV6pibq/4lxpWLYbguQxeJc7GdceLGo89HgN9poYzPHMABdLKw
         1aeHIsaqYmkd9eUfb2og9E0C83S5dp26nLM8MnMfly0I3pckDswRLlCSdG54M7me3W4h
         G8zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733227387; x=1733832187;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y0I7eoP4tW1sy5Wnizr4Z0EwfocpUFRNEULcv2IVlsM=;
        b=xKBF7sGw63biJAE35NLWBhFLzsCANrFm9Jwo1QqjoAmjHDUtPqfY/yohMGybdZxmFX
         BWt6okx3Iv3cbR/kCkVTb/BC0Vb76XI1+QywADEHqzJelYJ47ahz91D3eU3HnQLcfcqG
         QQc4hJcYRTahVSP8EUTgFIuqHKsfkJ/Ud31AAMVdsxLoEEk87rdFXCwTIiEVpFR3CB93
         hTPW+14qJXSF11JwTDVKqXeUxar6yocwyu2RrBptNLKaXhbnwgUIbEQKgxzm1D8/idDF
         Vy9szyplAUCgdlQq5/1PpabQFcfvchay9FNsfBQtXJernwftBat/Gv5O4KLk1hAO+BII
         7KtQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8Q9uv9DJh9C8CIOFJSr0W/7cuWd+ypl4TjOHRNaXvi69+J6vXUsFfeGyC9ZX8C+0/jIQBY8FFF5jfs9C5@vger.kernel.org
X-Gm-Message-State: AOJu0Yx380IRojnfGJMrK1/1KvYKQWws83PCAHOtBxZgQ2UFhb8NjGeZ
	yMcGawkKzAa0tT6hxeC0JWmhEB6gXt2eGr+geuFOyFNDN8sbR5ciSh7MlJwqJus=
X-Gm-Gg: ASbGnctHR2GtfFGCM+OiFSjrPERLVrIL8Ndr2C0zejWn+2uKMR51GV74KWTvXpc+yQp
	gOshXFqz5fuDErFYvrHwsp+GjbG5JcyKjKKkiprO96nGuzmGj08V6UZkrGVvMUhBpVqFZoH4llc
	li6Kr91AIABzJ0coMwTZJPuyiizNkSNw7IrpFpUAnGyC1rIoup+Ue59ThdO8vJtZj0JBtcYHqY+
	tKU1SqBlggkJ+BBOQKaTy6WZUbVRMeAXNHOlnjXk3SnmEzP
X-Google-Smtp-Source: AGHT+IGJuNygbZCGb6hKSPq7svZI0UjE9YSI8WZDBfz+rnhnNF8S82REfql2U1Ng0i3TWUIKQNJLRw==
X-Received: by 2002:a05:600c:138a:b0:431:52da:9d67 with SMTP id 5b1f17b1804b1-434d09b1831mr21654615e9.3.1733227387134;
        Tue, 03 Dec 2024 04:03:07 -0800 (PST)
Received: from linaro.org ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434b0f326a9sm189099435e9.35.2024.12.03.04.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 04:03:06 -0800 (PST)
Date: Tue, 3 Dec 2024 14:03:05 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Johan Hovold <johan@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Krishna Kurapati <quic_kriskura@quicinc.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: x1e80100-crd: Add USB multiport
 fingerprint readery
Message-ID: <Z07zeVJU3Y1GiSLL@linaro.org>
References: <20241118-x1e80100-crd-fp-v1-0-ec6b553a2e53@linaro.org>
 <20241118-x1e80100-crd-fp-v1-1-ec6b553a2e53@linaro.org>
 <Z07bgH5vVk44zuEH@hovoldconsulting.com>
 <Z07r3Upr50vLluyn@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z07r3Upr50vLluyn@linaro.org>

On 24-12-03 12:30:37, Stephan Gerhold wrote:
> On Tue, Dec 03, 2024 at 11:20:48AM +0100, Johan Hovold wrote:
> > [ +CC: Krishna, Thinh and the USB list ]
> > 
> > On Mon, Nov 18, 2024 at 11:34:29AM +0100, Stephan Gerhold wrote:
> > > The X1E80100 CRD has a Goodix fingerprint reader connected to the USB
> > > multiport controller on eUSB6. All other ports (including USB super-speed
> > > pins) are unused.
> > > 
> > > Set it up in the device tree together with the NXP PTN3222 repeater.
> > > 
> > > Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> > > ---
> > >  arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 48 +++++++++++++++++++++++++++++++
> > >  1 file changed, 48 insertions(+)
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
> > > index 39f9d9cdc10d..44942931c18f 100644
> > > --- a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
> > > +++ b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
> > > @@ -735,6 +735,26 @@ keyboard@3a {
> > >  	};
> > >  };
> > >  
> > > +&i2c5 {
> > > +	clock-frequency = <400000>;
> > > +
> > > +	status = "okay";
> > > +
> > > +	eusb6_repeater: redriver@4f {
> > > +		compatible = "nxp,ptn3222";
> > > +		reg = <0x4f>;
> > 
> > The driver does not currently check that there's actually anything at
> > this address. Did you verify that this is the correct address? 
> > 
> > (Abel is adding a check to the driver as we speak to catch any such
> > mistakes going forward).
> > 
> 
> Yes, I verified this using
> https://git.codelinaro.org/stephan.gerhold/linux/-/commit/45d5add498612387f88270ca944ee16e2236fddd
> 
> (I sent this to Abel back then, so I'm surprised he didn't run that :-))

I don't remember seeing this commit back then. Maybe I didn't look
careful enough. Sorry.

Since you already did the work, can you send that on the list?

So if you remember, back then I hunted down all of these with i2cget on
my t14s (it has 3 such repeaters, unlike CRD).

> 
> > > +		#phy-cells = <0>;
> > 
> > nit: I'd put provider properties like this one last.
> > 
> > > +		vdd3v3-supply = <&vreg_l13b_3p0>;
> > > +		vdd1v8-supply = <&vreg_l4b_1p8>;
> > 
> > Sort by supply name?
> > 
> 
> Ack.
> 
> > > +		reset-gpios = <&tlmm 184 GPIO_ACTIVE_LOW>;
> > > +
> > > +		pinctrl-0 = <&eusb6_reset_n>;
> > > +		pinctrl-names = "default";
> > > +	};
> > > +};
> > > +
> > >  &i2c8 {
> > >  	clock-frequency = <400000>;
> > >  
> > > @@ -1047,6 +1067,14 @@ edp_reg_en: edp-reg-en-state {
> > >  		bias-disable;
> > >  	};
> > >  
> > > +	eusb6_reset_n: eusb6-reset-n-state {
> > > +		pins = "gpio184";
> > > +		function = "gpio";
> > > +		drive-strength = <2>;
> > > +		bias-disable;
> > > +		output-low;
> > 
> > I don't think the pin config should assert reset, that should be up to
> > the driver to control.
> > 
> 
> I can drop it I guess, but pinctrl is applied before the driver takes
> control of the GPIO. This means if the GPIO happens to be in input mode
> before the driver loads (with pull up or pull down), then we would
> briefly leave it floating when applying the bias-disable.
> 
> Or I guess we could drop the bias-disable, since it shouldn't be
> relevant for a pin we keep in output mode all the time?
> 
> > > +	};
> > > +
> > >  	hall_int_n_default: hall-int-n-state {
> > >  		pins = "gpio92";
> > >  		function = "gpio";
> > > @@ -1260,3 +1288,23 @@ &usb_1_ss2_dwc3_hs {
> > >  &usb_1_ss2_qmpphy_out {
> > >  	remote-endpoint = <&pmic_glink_ss2_ss_in>;
> > >  };
> > > +
> > > +&usb_mp {
> > > +	status = "okay";
> > > +};
> > > +
> > > +&usb_mp_dwc3 {
> > > +	/* Limit to USB 2.0 and single port */
> > > +	maximum-speed = "high-speed";
> > > +	phys = <&usb_mp_hsphy1>;
> > > +	phy-names = "usb2-1";
> > > +};
> > 
> > The dwc3 driver determines (and acts on) the number of ports based on
> > the port interrupts in DT and controller capabilities. 
> > 
> > I'm not sure we can (should) just drop the other HS PHY and the SS PHYs
> > that would still be there in the SoC (possibly initialised by the boot
> > firmware).
> > 
> > I had a local patch to enable the multiport controller (for the suspend
> > work) and I realise that you'd currently need to specify a repeater also
> > for the HS PHY which does not have one, but that should be possible to
> > fix somehow.
> > 
> 
> I think there are two separate questions here:
> 
>  1. Should we (or do we even need to) enable unused PHYs?
>  2. Do we need to power off unused PHYs left enabled by the firmware?
> 
> For (1), I'm not not sure if there is a technical reason that requires
> us to. And given that PHYs typically consume quite a bit of power, I'm
> not sure if we should. Perhaps it's not worth spending effort on this
> minor optimization now, but then the device tree would ideally still
> tell us which PHYs are actually used (for future optimizations).
> 
> For (2), yes, we probably need to. But my impression so far is that this
> might be a larger problem that we need to handle on the SoC level. I
> have seen some firmware versions that blindly power up all USB
> controllers, even completely unused ones. Ideally we would power down
> unused components during startup and then leave them off.
> 
> Thanks,
> Stephan

