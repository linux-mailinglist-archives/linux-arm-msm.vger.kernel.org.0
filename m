Return-Path: <linux-arm-msm+bounces-26787-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 851A9938D42
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 12:10:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C0C71F25CC1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 10:10:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E94E816C69D;
	Mon, 22 Jul 2024 10:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N14jcNwU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A126215FD1B
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jul 2024 10:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721642888; cv=none; b=u60RCMvWU025J16HHbcOr0yooxIZq6/Ruh7EAKPP3ALc3Ok76eo5zn4oRKzYY4G103X8M9JqoQjTI5GcAlJL0YPfU6Jg5+yK9BZlMF1yabK71S5Igt5whT+0eOMvX96Srtl6BuA6DuM1CSUgsSsuRt0iaXGS62dSeAZW0gHpUjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721642888; c=relaxed/simple;
	bh=r1loaNoaVzUz0Y58T1NxG2CyminGBJ5gUFgU+IPEIRI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WeHFoDS4U9N59BW4aWmndRv0aTfTdcoXm8+VVS55BHodmTYMc3LIeCwZZB48RW8LrV49xo3hj1jkxdtXJ6Y3Bc9gHGWf7ZcmPLxVJatOyuUk37kvXb+xV3Por+G7PmaoEuV0x7qs2W7XCgbXj3JrecIqTy0quP3alo3v8yeuJDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N14jcNwU; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-42795086628so29085415e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jul 2024 03:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721642884; x=1722247684; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=K3Uk/HnGYvHiGjn0UJ5Gko3LyCdJekB5KAmj2kPnYgU=;
        b=N14jcNwU4vERTn0k4gaJvPVk9iUT64Mh1R9y6WAegLMA5NG4d4k+f+4bB/WG35tov2
         19PLx38cUrr7jKesPTE+TZir4FqycP3ad2wLxfhWV39JMnq+GZhG//e3Ah7ntyBK6HVz
         q//jOTWdmFlYuTdtBYVXTKycFZwBf164ANAK+JOGFckPGyJgFtro8Rvd/HP9bHErJ6dU
         Fh99HJr+s1OvUQstFcy+BLD8exgyZtXXlVHqcayNLx6y5qkQ3t3to7cqBkMFINpkdhDU
         u1fnj2BVUMdT+yC2Sl2As3u3jDe4mYV+1UosIu6PWj37SNVZ4Ev2Z5F8Qs0E3xr88QBw
         V6JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721642884; x=1722247684;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K3Uk/HnGYvHiGjn0UJ5Gko3LyCdJekB5KAmj2kPnYgU=;
        b=knbyunM6Sz6MaCNi28v+ZblXJUOjstpH+Mzt5eL2WkWlLKp+Qa3DonOqkmjSLVKTcq
         34Sqyv7Z5BD/02F+izuKu5K9F29IVNhLnnvAHVwLQCwFg9mQslBPQzNT6wqtwd2AUxWh
         4KkpC8iZtOTbeS6o70uKX6qM7aSQimQLqZDXRZFRpNhy5FM9vuObgEYt9R0G/9yjtc+z
         ZTYeq5EV2bJKM27oS4+GaDffZ4KQj6Rj6pf5U9gECOiACG+ZtlHqPTzqtFcjJXwRtTj4
         W5danr3CwYpIygDqClFODoSqBAi+LI44GiEVZydmg9yQELlvITqfN1XeRJvrlAwoJJ0n
         cv3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUxBznOXiPm9GhM9V967dbjPdVrdKfgQHc/yyeJv/Vl4GTSIvwIyp4Go2M7GiAWHtiuH2X3sJfk3pOKzmnFOESzcMyDEQwzQ/6TPBdL+Q==
X-Gm-Message-State: AOJu0YzNY+1nmr8K56Ud9FbLCz0NFtW9BgYdXZcG1HrcT35E1ddMeF8N
	xKbTfHAXAR9bnmpdGtc70oNAfAu+42dSrvRmMLSfVZqqqfnyOfbyal32HNLJqMqglHCtjPVwLGl
	n
X-Google-Smtp-Source: AGHT+IFIXBJGfP5zn3Csiw0GWYfvIZCoJ0/uv1/GU+SfszljWg0XRCD5mUABvDoCw0+lfOvDWEknhw==
X-Received: by 2002:a05:600c:83cc:b0:426:62a0:eb6b with SMTP id 5b1f17b1804b1-427dc529244mr42147605e9.13.1721642883926;
        Mon, 22 Jul 2024 03:08:03 -0700 (PDT)
Received: from linaro.org ([82.79.124.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427d6929976sm121953845e9.29.2024.07.22.03.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 03:08:03 -0700 (PDT)
Date: Mon, 22 Jul 2024 13:08:02 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Add X1E78100 ThinkPad T14s Gen 6
Message-ID: <Zp4vghH5SK/rLEce@linaro.org>
References: <20240719-topic-t14s_upstream-v1-0-d7d97fdebb28@linaro.org>
 <20240719-topic-t14s_upstream-v1-3-d7d97fdebb28@linaro.org>
 <Zp055OR+OzSgiHhX@linaro.org>
 <824edc08-f67f-4b2f-b4aa-da5df69b9df4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <824edc08-f67f-4b2f-b4aa-da5df69b9df4@linaro.org>

On 24-07-22 10:42:57, Konrad Dybcio wrote:
> On 21.07.2024 6:40 PM, Abel Vesa wrote:
> > On 24-07-19 22:16:38, Konrad Dybcio wrote:
> >> Add support for the aforementioned laptop. That includes:
> >>
> >> - input methods, incl. lid switch (keyboard needs the pdc
> >>   wakeup-parent removal hack..)
> >> - NVMe, WiFi
> >> - USB-C ports
> >> - GPU, display
> >> - DSPs
> >>
> >> Notably, the USB-A ports on the side are depenedent on the USB
> >> multiport controller making it upstream.
> >>
> >> At least one of the eDP panels used (non-touchscreen) identifies as
> >> BOE 0x0b66.
> >>
> >> See below for the hardware description from the OEM.
> >>
> >> Link: https://www.lenovo.com/us/en/p/laptops/thinkpad/thinkpadt/lenovo-thinkpad-t14s-gen-6-(14-inch-snapdragon)/len101t0099
> >> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> > 
> > Few comments below. Otherwise, LGTM.
> > 
> > Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
> > 
> >> ---
> >>  arch/arm64/boot/dts/qcom/Makefile                  |   1 +
> >>  .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts     | 792 +++++++++++++++++++++
> >>  2 files changed, 793 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> >> index 0e5c810304fb..734a05e04c4a 100644
> >> --- a/arch/arm64/boot/dts/qcom/Makefile
> >> +++ b/arch/arm64/boot/dts/qcom/Makefile
> >> @@ -261,6 +261,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-hdk-display-card.dtb
> >>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-hdk.dtb
> >>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-mtp.dtb
> >>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-qrd.dtb
> >> +dtb-$(CONFIG_ARCH_QCOM)	+= x1e78100-lenovo-thinkpad-t14s.dtb
> >>  dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-asus-vivobook-s15.dtb
> >>  dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-crd.dtb
> >>  dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-lenovo-yoga-slim7x.dtb
> >> diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
> > 
> > So what happens for SKUs of this model wil have x1e80100 ?
> > 
> > Maybe we should stick to x1e80100 ?
> 
> This one only ships with 78100
> 

Sure, but then in upstream we only have 80100. Plus, it is included in
this file as well.

I don't know what's the right thing to do here. But I think it keeps
things more simple if we keep everything under the x1e80100 umbrella.

> [...]
> 
> >> +	vreg_edp_3p3: regulator-edp-3p3 {
> >> +		compatible = "regulator-fixed";
> >> +
> >> +		regulator-name = "VREG_EDP_3P3";
> >> +		regulator-min-microvolt = <3300000>;
> >> +		regulator-max-microvolt = <3300000>;
> >> +
> >> +		gpio = <&tlmm 70 GPIO_ACTIVE_HIGH>;
> >> +		enable-active-high;
> >> +
> >> +		pinctrl-0 = <&edp_reg_en>;
> >> +		pinctrl-names = "default";
> >> +
> >> +		regulator-always-on;
> > 
> > Drop this.
> 
> Oops!
> 
> [...]
> 
> >> +
> >> +	edp_reg_en: edp-reg-en-state {
> >> +		pins = "gpio70";
> >> +		function = "gpio";
> >> +		drive-strength = <16>;
> >> +		bias-pull-up;
> > 
> > bias-disable, maybe ?
> 
> Yeah, probably
> 
> Konrad
> 

