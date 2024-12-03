Return-Path: <linux-arm-msm+bounces-40069-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 159599E1C38
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 13:33:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A8377B300A0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 11:30:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 612041E048B;
	Tue,  3 Dec 2024 11:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Thtairp1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8671E0E12
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Dec 2024 11:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733225447; cv=none; b=WIvhuXjl6QYyRCTo2oUqJZ00sNfMuXyY9VV3/Q+EcSLT4QVqJk2X6snDDUS0DekSgvLWtdcrE5CrTEOhb61k1YOduhgr49QqeWpeFIHJ13AYupRPWta0iewV+9qBm7ylCSfNxeaHpWKxAhQAZnhprePN6SsMdpp/a9N8G3ahW8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733225447; c=relaxed/simple;
	bh=XQKBWrT8ks1Ct4PewBxKAAw4CBuc3RSkP2JdRArH02Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SNJ0rrb4MJph8bi7WRcRuBB2q+VR7PEeTUr6hLwlfFIRyLzelLYJdKJmtLI7kn/eg8MwlGUeW86iEdOwyij5zgWSPLVfLSrIUmR6zrD6ZrU6GiMYdrZh2g7xU8pqvGvJSEKnvh9jL6U1u76CeV1r0y3Ti9aTM54ttU19yunKRjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Thtairp1; arc=none smtp.client-ip=209.85.221.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f68.google.com with SMTP id ffacd0b85a97d-385dfb168cbso2589345f8f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Dec 2024 03:30:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733225443; x=1733830243; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k5QpSnqZsvHI5RdTuW6YI5wmM0DD916U9oPMDkb1hRw=;
        b=Thtairp1YZWUiMOdW8kaisxxUXoFG+spED+10OM3QUnavi7ELWW2SKz6iNWX079xq2
         2VJZOgc2P2AerWF8DiTKi15iqVdb9fKMfTY3zuXzRik5dUGPhhIUrpY02IcrftazAVPh
         hALYSAVZHfhZTvBfudXSjMHXBKJ2SkfEPIhBf0N8ryOBy8ehDJF4PZgLTIu8CD/T3AuQ
         BB/la3OQt9dGLFMcWu8sm63HNJhKHZ93Rb8kQSshe7Qf1mYt7WdXqzxYIlSoIOKckse9
         Ncy2jMFArX6BP0JHWY4wHCXrwk5HlaBEvRyvkZGS/rWMszQYZc21QO+FdVtWP0oLYXAv
         fDjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733225443; x=1733830243;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k5QpSnqZsvHI5RdTuW6YI5wmM0DD916U9oPMDkb1hRw=;
        b=CLGhrecK7BxIcqHuXsFtRgbeGb4LKePL0O4gQ22GwB7EUNGQjDOvokaj4pv1yFyP87
         XtIKdjM0VRRZhwlDYwVa+12xIj1itCx4EG+pqRJF1TkaXV4+3E2izGJqxwDDlS8pGNAH
         Vl4HhE2ggsPibH/9EOivQeM1mHtnPrinrMasAXF3gDGqY8Sqr5d4FVEsO5CCRRzkaLrg
         c51SIIQJW38s6oyKLQgVwUsOcV7t2+l2a1DKYXoKT2DBvxKEEdN9KTo91/dWr3fd2ddo
         3t6CHWGXagwXsUgswCgTO46ALwg7zkV2wpFTEY9PIPyzrq+71Lkj26Vj58m06gKCw2+k
         YPcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlp1l5J5tZQwtsvpjG00fY4DZVRyy/etChd5kDNLvLHo0xVbD4DJD4SYDDnLCuli0YDaD1LLdrhxiRR+iN@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj2q6g1J6UIS4kipgK2CVxPWgQkARoeEJFB4FSMs2gF+wOe7Gs
	L6WxlHqAYaBd7/Nrqrm1jtxQeeGv431ZCZ34mxkNzq0AuVzbIhK1mctg82ZG2ls=
X-Gm-Gg: ASbGnct4BM/Y94oDXL2K+CfZc16PSxRick5Mu8EPfvRuceqoQUP+MINbfXJgJXRAhgg
	+xqK0ON0QrzyH45ZG6afjIrGSGHMfmCjW5ytOFUqJXB2etCqX4gvkiqnN3a0+pA9TCjfIypEBug
	ID+KxmuOCGYFdU7djtSHRhr1IfRC1mpsoIp9NXoMPsOWFnCKfQ5aFoKli5juqBoVRDCQENqEyc1
	RoeDGEynFNg4cmYojmFgXL52jDmOhRyHvhK24DGNdx6lwgNpkOF62F+PATM
X-Google-Smtp-Source: AGHT+IH34y7jHvFYEfoZxdYAaLv1kB29M7msviDEnioq7JmNTaNVxGRtN4bXS3pbvxOss6/WmLYc6A==
X-Received: by 2002:a05:6000:18a3:b0:385:e055:a28d with SMTP id ffacd0b85a97d-385fd42a6cfmr1723185f8f.57.1733225441788;
        Tue, 03 Dec 2024 03:30:41 -0800 (PST)
Received: from linaro.org ([2a02:2454:ff21:ef80:5c38:843:f8a3:a2ba])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385dd99504csm13253045f8f.85.2024.12.03.03.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 03:30:41 -0800 (PST)
Date: Tue, 3 Dec 2024 12:30:37 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Johan Hovold <johan@kernel.org>
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
 fingerprint readery
Message-ID: <Z07r3Upr50vLluyn@linaro.org>
References: <20241118-x1e80100-crd-fp-v1-0-ec6b553a2e53@linaro.org>
 <20241118-x1e80100-crd-fp-v1-1-ec6b553a2e53@linaro.org>
 <Z07bgH5vVk44zuEH@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z07bgH5vVk44zuEH@hovoldconsulting.com>

On Tue, Dec 03, 2024 at 11:20:48AM +0100, Johan Hovold wrote:
> [ +CC: Krishna, Thinh and the USB list ]
> 
> On Mon, Nov 18, 2024 at 11:34:29AM +0100, Stephan Gerhold wrote:
> > The X1E80100 CRD has a Goodix fingerprint reader connected to the USB
> > multiport controller on eUSB6. All other ports (including USB super-speed
> > pins) are unused.
> > 
> > Set it up in the device tree together with the NXP PTN3222 repeater.
> > 
> > Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 48 +++++++++++++++++++++++++++++++
> >  1 file changed, 48 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
> > index 39f9d9cdc10d..44942931c18f 100644
> > --- a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
> > +++ b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
> > @@ -735,6 +735,26 @@ keyboard@3a {
> >  	};
> >  };
> >  
> > +&i2c5 {
> > +	clock-frequency = <400000>;
> > +
> > +	status = "okay";
> > +
> > +	eusb6_repeater: redriver@4f {
> > +		compatible = "nxp,ptn3222";
> > +		reg = <0x4f>;
> 
> The driver does not currently check that there's actually anything at
> this address. Did you verify that this is the correct address? 
> 
> (Abel is adding a check to the driver as we speak to catch any such
> mistakes going forward).
> 

Yes, I verified this using
https://git.codelinaro.org/stephan.gerhold/linux/-/commit/45d5add498612387f88270ca944ee16e2236fddd

(I sent this to Abel back then, so I'm surprised he didn't run that :-))

> > +		#phy-cells = <0>;
> 
> nit: I'd put provider properties like this one last.
> 
> > +		vdd3v3-supply = <&vreg_l13b_3p0>;
> > +		vdd1v8-supply = <&vreg_l4b_1p8>;
> 
> Sort by supply name?
> 

Ack.

> > +		reset-gpios = <&tlmm 184 GPIO_ACTIVE_LOW>;
> > +
> > +		pinctrl-0 = <&eusb6_reset_n>;
> > +		pinctrl-names = "default";
> > +	};
> > +};
> > +
> >  &i2c8 {
> >  	clock-frequency = <400000>;
> >  
> > @@ -1047,6 +1067,14 @@ edp_reg_en: edp-reg-en-state {
> >  		bias-disable;
> >  	};
> >  
> > +	eusb6_reset_n: eusb6-reset-n-state {
> > +		pins = "gpio184";
> > +		function = "gpio";
> > +		drive-strength = <2>;
> > +		bias-disable;
> > +		output-low;
> 
> I don't think the pin config should assert reset, that should be up to
> the driver to control.
> 

I can drop it I guess, but pinctrl is applied before the driver takes
control of the GPIO. This means if the GPIO happens to be in input mode
before the driver loads (with pull up or pull down), then we would
briefly leave it floating when applying the bias-disable.

Or I guess we could drop the bias-disable, since it shouldn't be
relevant for a pin we keep in output mode all the time?

> > +	};
> > +
> >  	hall_int_n_default: hall-int-n-state {
> >  		pins = "gpio92";
> >  		function = "gpio";
> > @@ -1260,3 +1288,23 @@ &usb_1_ss2_dwc3_hs {
> >  &usb_1_ss2_qmpphy_out {
> >  	remote-endpoint = <&pmic_glink_ss2_ss_in>;
> >  };
> > +
> > +&usb_mp {
> > +	status = "okay";
> > +};
> > +
> > +&usb_mp_dwc3 {
> > +	/* Limit to USB 2.0 and single port */
> > +	maximum-speed = "high-speed";
> > +	phys = <&usb_mp_hsphy1>;
> > +	phy-names = "usb2-1";
> > +};
> 
> The dwc3 driver determines (and acts on) the number of ports based on
> the port interrupts in DT and controller capabilities. 
> 
> I'm not sure we can (should) just drop the other HS PHY and the SS PHYs
> that would still be there in the SoC (possibly initialised by the boot
> firmware).
> 
> I had a local patch to enable the multiport controller (for the suspend
> work) and I realise that you'd currently need to specify a repeater also
> for the HS PHY which does not have one, but that should be possible to
> fix somehow.
> 

I think there are two separate questions here:

 1. Should we (or do we even need to) enable unused PHYs?
 2. Do we need to power off unused PHYs left enabled by the firmware?

For (1), I'm not not sure if there is a technical reason that requires
us to. And given that PHYs typically consume quite a bit of power, I'm
not sure if we should. Perhaps it's not worth spending effort on this
minor optimization now, but then the device tree would ideally still
tell us which PHYs are actually used (for future optimizations).

For (2), yes, we probably need to. But my impression so far is that this
might be a larger problem that we need to handle on the SoC level. I
have seen some firmware versions that blindly power up all USB
controllers, even completely unused ones. Ideally we would power down
unused components during startup and then leave them off.

Thanks,
Stephan

