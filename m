Return-Path: <linux-arm-msm+bounces-20790-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A008D21AC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 18:33:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 86AC0282D75
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 16:33:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0307225779;
	Tue, 28 May 2024 16:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RYQ9aFg/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1111C16F0E0
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 May 2024 16:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716914020; cv=none; b=e4ak/AfF8Lop/6EfOhEMMvgRx5HNfmGXoXvseNj4ivYsTJYjT7QYk62WZYG70AHaMIAb4BfMLZzisirqvxRZuOIexb9J1rjtw4eZsCSS10YxJYJsu6BbjIi+xob0x3Fc7/qbJ0rN9qVw9Af4PhQdtVvErX0X0lqr4QWAtBygyXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716914020; c=relaxed/simple;
	bh=Xf7BU101+vQcWaBkaOCw1QXITwXxOxJmGpIIXrMPebY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GFwfx/CFgd/kC65PDZpg0GqIxkiOKawlzOPm6v6nIcAjN/ZA53QRxf8Mpc1kt2y0mO0iFX1o+Q6UzNYpMVkw4gh13wjeoSEMZ1PPBgM7kTwY4Yk+A3EfEOjZubPbAJu8e8fA7XuSuUIvZM3eDgGtoBAW8VaAMeURr7HjoInIZXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RYQ9aFg/; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2e73359b979so10844061fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 May 2024 09:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716914017; x=1717518817; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ie9rmuEePwENP8TVKYR43Z2dUmRCc5LEf6MyVwtx1xM=;
        b=RYQ9aFg/Y8djxrcDox0vLsAFpR0+CFR62wwpD86oKWaO9Hfv1BCnS9NsPxChHbKrBa
         Sj1Sj/AbY8A8wfjRmsybz0tZoa46V3vz3V2r5LV1JDe2iRG2M5cjt/cY2DKp4tOceShv
         oZ7/CYgSPNvB/HChtRhoiv7RT2B2OAujx+NUJ8V2SzppzlloVkXsvb+xlWu+hGe6Pn1R
         9o5py4mxiUj3iz/Ty4e9z8BOtCMJqK47tgdXI2fWfwJFmAWbShFZaBlmp1UZTEwQSVO1
         /tmIOa2qXV22txLVfyJi/q5zIkxQWiXvT1wkyRCcW5rUtjfQgE1k8bT4Ihqej4F9Xa3V
         2W3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716914017; x=1717518817;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ie9rmuEePwENP8TVKYR43Z2dUmRCc5LEf6MyVwtx1xM=;
        b=GQTq8jY9pgzwzN5uiNUMW4xWLOwMRxJtkRkjUPalIPlw/o7ogSHRne9vXzPSJS0Z0u
         7rHQK/+93USFxcS3f2f374Hm2nD8OIfpGWsJSBzRRWModgioySS+DKoKMeVBwvM9TKJ5
         R+AHMXuAt8QgX4ZogfV78aSz1vjurC8xnXUIda+oR2Op76Gsl1CsOG/3XY/E6/rhmJEB
         RoI9T0L4UgFc1eLUXIO+HFxZNdbIqOJ50uymxPj+Vs5OaWv5pQsirtfpvEzUhC2XbjZ1
         kwLtLosDE2cvSYMght5C7WMMqL40rrx5kMXduSoLTVk1ETA9Bk6DZMUsSI1fKgO4A+4Q
         GkyA==
X-Forwarded-Encrypted: i=1; AJvYcCUGWrh5ZerG/lyxZtaxyP9FOsh7mWx+iGN9zUD44vWubRSpuvzbM7JoXhytuUgkX0vilvp+C0j7i/qMT6Krz+tXKPxZSRavjjs5WijqqA==
X-Gm-Message-State: AOJu0Ywr19ODKSZ6e3kAUVvaA8F0sZLlwqLBaxFKg+xvBnwIxyeiFRvk
	10v9u8Q3ZbHTbVhbjKdMUuQ53gnkVJ93vRpnfK6AdZ/eY2QWnMCbDPd671QVavs=
X-Google-Smtp-Source: AGHT+IFB5LWZTFg2VkjLPo4NIFi9cmR6eiqVuJVc97Sj3CdxqZmrN8y9F1ulGwmOCDmU9sOY/McS2Q==
X-Received: by 2002:a2e:99d4:0:b0:2d4:3d86:54e2 with SMTP id 38308e7fff4ca-2e95b0bd7dbmr66394971fa.27.1716914017119;
        Tue, 28 May 2024 09:33:37 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e975432726sm12149811fa.118.2024.05.28.09.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 09:33:36 -0700 (PDT)
Date: Tue, 28 May 2024 19:33:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Prahlad Valluru <quic_vvalluru@quicinc.com>
Cc: andersson@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	konrad.dybcio@linaro.org, krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, quic_abhinavk@quicinc.com, quic_nankam@quicinc.com, 
	robh@kernel.org
Subject: Re: [PATCH v4] arm64: dts: qcom: qcs6490-rb3gen2: enable hdmi bridge
Message-ID: <qkfiemo6kcelzgcfgzjpeor6flqhupk3dci5puyf63gmdnogqb@5egugb3rmi3v>
References: <CAA8EJpo=Q4_=JU83-9ooSqiSr=xUeHh2awDhzq9q3Xd56h83zw@mail.gmail.com>
 <20240528141954.7567-1-quic_vvalluru@quicinc.com>
 <rs7m73yzuvm5rf52tyax57r33iigalplr2z7rrxm7mktdqa3bf@ecapopn7ufho>
 <20240528162434.GA4578@hu-vvalluru-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240528162434.GA4578@hu-vvalluru-hyd.qualcomm.com>

On Tue, May 28, 2024 at 09:54:34PM +0530, Prahlad Valluru wrote:
> On Tue, May 28, 2024 at 06:00:26PM +0300, Dmitry Baryshkov wrote:
> > On Tue, May 28, 2024 at 07:49:54PM +0530, Venkata Prahlad Valluru wrote:
> > > Rb3Gen2 has a lt9611uxc DSI-to-HDMI bridge on i2c0, with
> > > reset gpio from pm7250b gpio2 and irq gpio from tlmm gpio24.
> > > Bridge supplies are Vdd connected to input supply directly
> > > and vcc to L11c. Enable HDMI output, bridge and corresponding
> > > DSI output.
> > > 
> > > Signed-off-by: Venkata Prahlad Valluru <quic_vvalluru@quicinc.com>
> > > ---
> > > v4: added fixed regulator for vdd
> > 
> > Please don't send new iterations as replies to the previous iteration.
> > It might be ignored or mishandled by the tools.
> Was trying to have the context of discussion captured. Will add links
> to the patchsets in the history, going forward.

I'd suggest using b4 tool, which handles such issues in an automated
way. It adds links to previous iterations, changelog, etc.

> > 
> > > 
> > > v3: - Updated commit text
> > >     - Arranged nodes in alphabetical order
> > >     - Fixed signoff
> > >     - Fixed drive strength for lt9611_irq_pin
> > >     - Removed 'label' from hdmi-connector, which is optional
> > > 
> > > v2: Addressed dtschema errors
> > > 	- Fixed lt9611-irq
> > > 	- vdd-supply error to be ignored, as it is connected to
> > > 	  input supply directly, on rb3gen2
> > > ---
> > >  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 94 ++++++++++++++++++++
> > >  1 file changed, 94 insertions(+)
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> > > index a085ff5b5fb2..7f00fca131a2 100644
> > > --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> > > +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> > > @@ -52,6 +52,25 @@
> > >  		};
> > >  	};
> > >  
> > > +	hdmi-connector {
> > > +		compatible = "hdmi-connector";
> > > +		type = "a";
> > > +
> > > +		port {
> > > +			hdmi_con: endpoint {
> > > +				remote-endpoint = <&lt9611_out>;
> > > +			};
> > > +		};
> > > +	};
> > > +
> > > +	lt9611_1v2: lt9611-vdd12-regulator {
> > > +		compatible = "regulator-fixed";
> > > +		regulator-name = "LT9611_1V2";
> > 
> > Is it the regulator / net name in schematics? Or is it also used by any
> > other consumers?
> >
> VREG_HDMI_OUT_1P2 is the naming in schematic, but i see this naming convention for rb5 based boards.
> No other consumers for this.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> > > +
> > > +		regulator-min-microvolt = <1200000>;
> > > +		regulator-max-microvolt = <1200000>;
> > > +	};
> > > +
> > >  	reserved-memory {
> > >  		xbl_mem: xbl@80700000 {
> > >  			reg = <0x0 0x80700000 0x0 0x100000>;
> > > @@ -530,6 +549,46 @@
> > >  			   <GCC_WPSS_RSCP_CLK>;
> > >  };
> > >  
> > > +&i2c0 {
> > > +	clock-frequency = <400000>;
> > > +	status = "okay";
> > > +
> > > +	lt9611_codec: hdmi-bridge@2b {
> > > +		compatible = "lontium,lt9611uxc";
> > > +		reg = <0x2b>;
> > > +
> > > +		interrupts-extended = <&tlmm 24 IRQ_TYPE_EDGE_FALLING>;
> > > +		reset-gpios = <&pm7250b_gpios 2 GPIO_ACTIVE_HIGH>;
> > > +
> > > +		vdd-supply = <&lt9611_1v2>;
> > > +		vcc-supply = <&vreg_l11c_2p8>;
> > > +
> > > +		pinctrl-names = "default";
> > > +		pinctrl-0 = <&lt9611_irq_pin &lt9611_rst_pin>;
> > > +
> > > +		ports {
> > > +			#address-cells = <1>;
> > > +			#size-cells = <0>;
> > > +
> > > +			port@0 {
> > > +				reg = <0>;
> > > +
> > > +				lt9611_a: endpoint {
> > > +					remote-endpoint = <&mdss_dsi0_out>;
> > > +				};
> > > +			};
> > > +
> > > +			port@2 {
> > > +				reg = <2>;
> > > +
> > > +				lt9611_out: endpoint {
> > > +					remote-endpoint = <&hdmi_con>;
> > > +				};
> > > +			};
> > > +		};
> > > +	};
> > > +};
> > > +
> > >  &i2c1 {
> > >  	status = "okay";
> > >  
> > > @@ -587,6 +646,21 @@
> > >  	remote-endpoint = <&usb_dp_qmpphy_dp_in>;
> > >  };
> > >  
> > > +&mdss_dsi {
> > > +	vdda-supply = <&vreg_l6b_1p2>;
> > > +	status = "okay";
> > > +};
> > > +
> > > +&mdss_dsi0_out {
> > > +	remote-endpoint = <&lt9611_a>;
> > > +	data-lanes = <0 1 2 3>;
> > > +};
> > > +
> > > +&mdss_dsi_phy {
> > > +	vdds-supply = <&vreg_l10c_0p88>;
> > > +	status = "okay";
> > > +};
> > > +
> > >  &mdss_edp {
> > >  	status = "okay";
> > >  };
> > > @@ -711,3 +785,23 @@
> > >  	function = "gpio";
> > >  	bias-disable;
> > >  };
> > > +
> > > +&pm7250b_gpios {
> > > +	lt9611_rst_pin: lt9611-rst-state {
> > > +		pins = "gpio2";
> > > +		function = "normal";
> > > +
> > > +		output-high;
> > > +		input-disable;
> > > +		power-source = <0>;
> > > +	};
> > > +};
> > > +
> > > +&tlmm {
> > > +	lt9611_irq_pin: lt9611-irq-state {
> > > +		pins = "gpio24";
> > > +		function = "gpio";
> > > +		drive-strength = <2>;
> > > +		bias-disable;
> > > +	};
> > > +};
> > > -- 
> > > 2.17.1
> > > 
> > 
> > -- 
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry

