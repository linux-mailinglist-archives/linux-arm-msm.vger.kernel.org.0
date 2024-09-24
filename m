Return-Path: <linux-arm-msm+bounces-32271-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3EA98440E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 12:58:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EDB2A1C22D17
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 10:58:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4338D1A3AAB;
	Tue, 24 Sep 2024 10:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c7+Cd1Ey"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E761F5FF
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Sep 2024 10:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727175513; cv=none; b=uqKjazeSNHZVgaZbwFTJK2pXlmJVSeLWQSM5SOdjByT8D4Lq+F3MLjlXoC8CApAFmb80jx6L3dJyv18RLlt20qxbc49qkKiI0723QQ0QvjnLXzrbNva0CkUJ9dcAYOl3u2FkUubxmLq2IAPvZ+ENBUo5RaDKi6BBJablrBDPl3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727175513; c=relaxed/simple;
	bh=zRWbzv/HNUuew4/oKYm2yE0AwOYhSJnvFb26F2BIHiA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YVBMcQa8eKWWn9ojq6eY1pooAG5RwG8z/k4BkVJ1RoLLf3UaUlD2Q8jwg3mkbZjNImwFWaVBghNbKHCcKHQAjHBmN6eyj5EKWCg0is/GvgyPvtWtyO8MBXBvtuIHyNTIM3+l+Yg0Ry+1M5iwP5T9eSnBnFbds2spaYcHdD4ej38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c7+Cd1Ey; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3787ddbd5a2so3077482f8f.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Sep 2024 03:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727175508; x=1727780308; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7Yf5sBQQiLzo6FyM+cKoz/GaI/yLKqyAOWzkNvkuwOI=;
        b=c7+Cd1EyHxRFMEeZITE0fq7s1fLABRjyt7ecGY7n0qSUDnzh7YZnmaVnT8Fwig1KLa
         OfjOAnlsmxGqUxiWCjg5CnZTDtPJspjAjp8GoDgldJP02zSjsGwAluFGyl6t23vTCO+Y
         yvhEP7GaxR8P72H9lZekcoFrKbOxvW95ERTD9S1hZH0AS/DDy/lvtHq7+jLlEoXmTc6N
         HuePPjQi9AneeElwnLZp5PS031HhShcjRl1ljs5DGFIJci89qKSgvgU8z6bfjharA29/
         kbyvkk9Mcw4idgXGg7umchA8zrqB7AOUYPSkQSeadUDzuaZGInPCpT/tiUVfknAqzlhn
         tNQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727175508; x=1727780308;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Yf5sBQQiLzo6FyM+cKoz/GaI/yLKqyAOWzkNvkuwOI=;
        b=FHYzYW9ZmSI8kz1EFYRakM+1u6gBcbktCT9cMtKY963etfIBWzxoLdFkhCM9X9BI2c
         Xobkm4Vcy6zXsIWhZ0GUPyPwDnhXxO53UOraHaSBPa/nUumHi2QuABvtytq0Nb5v4M+t
         Dh5GsQ/aQMMWrwUzNw1CDa/0kKiU5i5q3roDBoNOkCt+Hm3VhO1LFNQ0wH+oPgpNBvkD
         s6faXRH0bNpu7xoZx43vhO6VuLlOx8EERvVsBNRjAh306nxjB+akZaPWfXYVrWzmUGvB
         rXff+hO5Xv5KwvSE98Ek8OtAJ8DBeKB4Y1oPCFhlU5SXXUTJLISomBf3wRaMm2IYuZc2
         U1Rg==
X-Forwarded-Encrypted: i=1; AJvYcCX90jDpZmFgzwisA2/N98y5b1Bi29NzwZXyw5sfrM276fFT9WG+DWxW3edNRtXnmMphlZEE94WawJ2MW6Ev@vger.kernel.org
X-Gm-Message-State: AOJu0YwYH/SlaIdtcSFiC0r3PtgxcZ/Mpy04+stBxx6AMXu2YCMr3ZeA
	fjBtwg9ZHj5CnzkOcg9uZzsPGd8yxhaXZCgxUtLoF+o1U5j9oR8gN3+CRqgY7lM=
X-Google-Smtp-Source: AGHT+IGJdVQiQGePfNnBEGo3AyJuCcLEqG7amQfxgyFE+6YcDH58sfrrifWG705xBswhBd9I2HKtJQ==
X-Received: by 2002:adf:f10c:0:b0:371:8e0d:c1d9 with SMTP id ffacd0b85a97d-37a42271a38mr8104333f8f.19.1727175508255;
        Tue, 24 Sep 2024 03:58:28 -0700 (PDT)
Received: from linaro.org ([82.77.84.93])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cbc2a8ac3sm1276479f8f.8.2024.09.24.03.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 03:58:27 -0700 (PDT)
Date: Tue, 24 Sep 2024 13:58:26 +0300
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
Subject: Re: [PATCH 1/2] arm64: dts: qcom: x1e80100-crd: Enable external DP
 support
Message-ID: <ZvKbUhTxEb50nWEZ@linaro.org>
References: <20240902-x1e80100-crd-dts-add-external-dp-support-v1-0-899c264c0eb7@linaro.org>
 <20240902-x1e80100-crd-dts-add-external-dp-support-v1-1-899c264c0eb7@linaro.org>
 <Zta2QJr6jIJcNdUg@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zta2QJr6jIJcNdUg@hovoldconsulting.com>

On 24-09-03 09:09:52, Johan Hovold wrote:
> On Mon, Sep 02, 2024 at 06:01:35PM +0300, Abel Vesa wrote:
> > The Qualcomm Snapdragon X Elite CRD board has 3 USB Type-C ports,
> > all of them supporting external DP altmode. Between each QMP
> > combo PHY and the corresponding Type-C port, sits one Parade PS8830
> > retimer which handles both orientation and SBU muxing. Add nodes for
> > each retimer, fix the graphs between connectors and the PHYs accordingly,
> > add the voltage regulators needed by each retimer and then enable all
> > 3 remaining DPUs.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 414 +++++++++++++++++++++++++++++-
> >  1 file changed, 408 insertions(+), 6 deletions(-)
> 
> > @@ -288,6 +312,134 @@ vreg_edp_3p3: regulator-edp-3p3 {
> >  		regulator-boot-on;
> >  	};
> >  
> > +	vreg_rtmr0_1p15: regulator-rtmr0-1p15 {
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
> > +	vreg_rtmr2_3p3: regulator-rtmr2-3p3 {
> > +		compatible = "regulator-fixed";
> > +
> > +		regulator-name = "VREG_RTMR2_3P3";
> > +		regulator-min-microvolt = <3300000>;
> > +		regulator-max-microvolt = <3300000>;
> > +
> > +		gpio = <&tlmm 187 GPIO_ACTIVE_HIGH>;
> > +		enable-active-high;
> > +
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&rtmr2_3p3_reg_en>;
> > +	};
> > +
> > +
> > +
> 
> Double stray newline.
> 
> Also move these nodes below the nvme one to maintain sort order.
> 

Will do.

> >  	vreg_nvme: regulator-nvme {
> >  		compatible = "regulator-fixed";
> >  
> > @@ -709,6 +861,163 @@ keyboard@3a {
> >  	};
> >  };
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
> 

Will drop.

> > +		};
> > +	};
> > +};
>  
> > +&pm8550_gpios {
> > +	rtmr0_3p3_reg_en: rtmr0-3p3-reg-en-state {
> > +		pins = "gpio11";
> > +		function = "func1";
> > +		input-disable;
> > +		output-enable;
> > +	};
> > +};
> > +
> > +&pm8550ve_8_gpios {
> > +	rtmr0_1p15_reg_en: rtmr0-1p15-reg-en-state {
> > +		pins = "gpio8";
> > +		function = "func1";
> > +		input-disable;
> > +		output-enable;
> > +	};
> > +};
> > +
> > +&pm8550ve_9_gpios {
> > +	rtmr0_1p8_reg_en: rtmr0-1p8-reg-en-state {
> > +		pins = "gpio8";
> > +		function = "func1";
> > +		input-disable;
> > +		output-enable;
> > +	};
> > +};
> 
> Shouldn't you specify the drive strength here as well? (Same on T14s).
> 

Will do.

> Johan

Thanks for reviewing.

Abel


