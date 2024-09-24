Return-Path: <linux-arm-msm+bounces-32275-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE4398444B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 13:13:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D8A51C23251
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 11:13:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 725601A4F19;
	Tue, 24 Sep 2024 11:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fnslk46q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A641A4F0C
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Sep 2024 11:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727176402; cv=none; b=VSVT6tUFNVFZgDsUQUJES/A0Xe4jeThxD/9Ksqh0FyItpIAUcGxqb1VKI/y0vgc0iE65qfNwKop5gqbIhC5MWcGJBQyfCpaGoLcjDksU4DuzxGgeJwmMdRMNNeoeFUwUcpI8Lj8ZkMq7N0leVtQZg+AZw3dGb8oS1g4/+jCCG80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727176402; c=relaxed/simple;
	bh=cVhQVmRccJe6O7wL9xrqZzEo4XPZW0dacCWA/6Rpn+0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YdWlCOLrcr14vYj+3+3Y+AiNiW+p8WtLR4v/AJhkG0yKuNwk0/uKvTKUP+/4aLGGqtIhgli5WX8sbQ8P5urPP2EbYnlnuc1nx8LSaLYlZJFtW9JVoxBvFeu5JtZeT3fiJJ71H5M4ingJmCnvOutZ3/jrQix7aUmeiSPSbpHjinc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fnslk46q; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-42cacabd2e0so46239025e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Sep 2024 04:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727176399; x=1727781199; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5aNUCgdp3r8PP8DE9EjdL2GPJSXhUo4hx3ihgKWFtMc=;
        b=fnslk46qkmZqGqenlBsO/v9i2tyzGri99L5U+r6CMFEtFNaJrcJHC5MNxJ5w0Lf+2U
         JWTUal+Sb7SZEm60cke+no6caPXACP3b50qMz2F0A96n//0nTKqCupVrn0kcYWGJYmRz
         Dw6Y8Sdj/CRr+Lbch10KzAjEbcxKegwTj/2D5IUldX3lRTOKmCwJpfnAwVfDHuoSgEBP
         9iodEVgZGGK/0g+OT8WFZCegAi/Q4ZIMQDtKFYYCqsMBGHh5k7V+SmPqq4v3DmYshTGB
         102SmTXqpIjbBBIPAHs0DnHMPRQmxsNvtlqc9ef4eShuZ0Iie3Na7jDi+jsFYhuG9Oe8
         YdYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727176399; x=1727781199;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5aNUCgdp3r8PP8DE9EjdL2GPJSXhUo4hx3ihgKWFtMc=;
        b=g1O8SdhVn2tw+GfVqhB7+mRBXH+ng59uJfhmCKQMO11ET1/N6+cOqFLWtJ9AeNxbJj
         2Z1hJVQwaqoMJcYt+7+kIhNFXng72lGo7z8ug+NRb10Mr6gKm3fL4knh6DTiBeWD/Df4
         I7CayS/HKRSbAkpiwSRAPGBuyXECiEqZnCpQqukDRX7D/Uh1BDqX2J7JOR/pup8CAc7k
         lC9kqHGEyUFX74bnfEeZK70rtQpnD7e56GtrGEGBUpMuaYo+4z2h4xJsLOtr9CYYbH8t
         ogG+EUCGSYhgpk2tsjscBDlDzFZ4WrwfVMIb2CHkSxAFev9ddcTghJxDqtxACDBJBUVJ
         CSAw==
X-Forwarded-Encrypted: i=1; AJvYcCVbtjX2LUSLi1UHeeM7IPGZJvYOZdv1rdr+KuoohguL1Rel9857dhVV/6BPgJ4QPUDQSZhtYGdSvaW7NdIn@vger.kernel.org
X-Gm-Message-State: AOJu0YwarEVlZyLXvd7epsb/TMyFf83t2VomZJpL87fDT7sTV7iZeQK5
	lUwjL4T+762bIqV5WxkVbKJGWzENmOMuNajT0pN0hlAuyVMUNAQED+rnqtizo3M=
X-Google-Smtp-Source: AGHT+IEyeeK7xp/bGDac+aMfhm7wBkJGkp/5PuXMAnHRO95T727dpF7P1IkPGsO4istikc+TmPDDEA==
X-Received: by 2002:a05:600c:15d4:b0:42c:b22e:fc23 with SMTP id 5b1f17b1804b1-42e7e7aa2ccmr83746515e9.15.1727176398751;
        Tue, 24 Sep 2024 04:13:18 -0700 (PDT)
Received: from linaro.org ([82.77.84.93])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e7543f3f4sm153825015e9.16.2024.09.24.04.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 04:13:18 -0700 (PDT)
Date: Tue, 24 Sep 2024 14:13:17 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Trilok Soni <quic_tsoni@quicinc.com>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: x1e80100-t14s: Add external DP
 support
Message-ID: <ZvKezemYYG3pm10B@linaro.org>
References: <20240902-x1e80100-crd-dts-add-external-dp-support-v1-0-899c264c0eb7@linaro.org>
 <20240902-x1e80100-crd-dts-add-external-dp-support-v1-2-899c264c0eb7@linaro.org>
 <Zta1PN-bvOyPYJCs@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zta1PN-bvOyPYJCs@hovoldconsulting.com>

On 24-09-03 09:05:32, Johan Hovold wrote:
> On Mon, Sep 02, 2024 at 06:01:36PM +0300, Abel Vesa wrote:
> > The Lenovo Thinkpad T14s has only 2 USB Type-C ports, both of them
> > supporting external DP altmode. Between each QMP combo PHY and the
> > corresponding Type-C port, sits one Parade PS8830 retimer which handles
> > both orientation and SBU muxing. Add nodes for each retimer, fix the
> > graphs between connectors and the PHYs accordingly add the voltage
> > regulators needed by each retimer and then enable DP 0 and 1.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> >  .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts     | 278 ++++++++++++++++++++-
> >  1 file changed, 274 insertions(+), 4 deletions(-)
>  			};
> > @@ -127,6 +143,90 @@ vreg_edp_3p3: regulator-edp-3p3 {
> >  		regulator-boot-on;
> >  	};
> >  
> > +	vreg_rtmr0_1p15: regulator-rtmr0-1p15 {
> 
> Please consider spelling out "retimer". It seems it's mostly you that
> use "rtmr" in the kernel currently, and not sure saving those three
> chars is worth the cost in readability.
> 
> But if this is what these rails are called in the (CRD) schematics (I
> didn't check), then just ignore this comment.

According to schematics, they are called VREG_RTMRx_*. So will keep
that.

> 
> > +		compatible = "regulator-fixed";
> > +
> > +		regulator-name = "VREG_RTMR0_1P15";
> > +		regulator-min-microvolt = <1150000>;
> > +		regulator-max-microvolt = <1150000>;
> > +
> > +		gpio = <&pm8550ve_8_gpios 8 GPIO_ACTIVE_HIGH>;
> > +		enable-active-high;
> > +
> > +		pinctrl-0 = <&rtmr0_1p15_reg_en>;
> > +		pinctrl-names = "default";
> > +	};
> 
> Please keep the nodes sorted by name (by moving the retimer nodes below
> the nvme regulator.

Will do.

> 
> >  	vreg_nvme: regulator-nvme {
> >  		compatible = "regulator-fixed";
> >  
> > @@ -484,6 +584,111 @@ keyboard@3a {
> >  	};
> >  };
> >  
> > +&i2c3 {
> > +	clock-frequency = <400000>;
> > +
> > +	status = "okay";
> > +
> > +	typec-mux@8 {
> > +		compatible = "parade,ps8830";
> > +		reg = <0x08>;
> > +
> > +		clocks = <&rpmhcc RPMH_RF_CLK3>;
> > +		clock-names = "xo";
> > +
> > +		vdd15-supply = <&vreg_rtmr0_1p15>;
> 
> As Konrad already pointed on the retimer patch, this one should be name
> vdd115 or similar.

Yes. Will fix.

> 
> > +		vdd18-supply = <&vreg_rtmr0_1p8>;
> > +		vdd33-supply = <&vreg_rtmr0_3p3>;
> 
> > +&i2c7 {
> > +	clock-frequency = <400000>;
> > +
> > +	status = "okay";
> > +
> > +	typec-mux@8 {
> > +		compatible = "parade,ps8830";
> > +		reg = <0x8>;
> > +
> > +		clocks = <&rpmhcc RPMH_RF_CLK4>;
> > +		clock-names = "xo";
> > +
> > +		vdd15-supply = <&vreg_rtmr1_1p15>;
> > +		vdd18-supply = <&vreg_rtmr1_1p8>;
> > +		vdd33-supply = <&vreg_rtmr1_3p3>;
> > +
> > +		reset-gpios = <&tlmm 176 GPIO_ACTIVE_HIGH>;
> > +
> > +		retimer-switch;
> > +		orientation-switch;
> > +
> > +		ports {
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +
> > +			port@0 {
> > +				reg = <0>;
> > +
> > +				retimer_ss1_ss_out: endpoint {
> > +					remote-endpoint = <&pmic_glink_ss1_ss_in>;
> > +				};
> > +			};
> > +
> > +			port@1 {
> > +				reg = <1>;
> > +
> > +				retimer_ss1_ss_in: endpoint {
> > +					remote-endpoint = <&usb_1_ss1_qmpphy_out>;
> > +				};
> > +			};
> > +
> > +			port@2 {
> > +				reg = <2>;
> > +
> > +				retimer_ss1_con_sbu_out: endpoint {
> > +					remote-endpoint = <&pmic_glink_ss1_con_sbu_in>;
> > +				};
> > +			};
> > +
> 
> Stray newline.

Will drop.

> 
> > +		};
> > +	};
> > +};
> 
> > +	rtmr1_3p3_reg_en: rtmr1-3p3-reg-en-state {
> > +		pins = "gpio186";
> > +		function = "gpio";
> > +		drive-strength = <2>;
> > +		bias-disable;
> > +	};
> > +
> > +
> 
> Stray newline.

Will drop.

> 
> >  	wcd_default: wcd-reset-n-active-state {
> >  		pins = "gpio191";
> >  		function = "gpio";
> 
> Johan

Thanks for reviewing.

Abel

