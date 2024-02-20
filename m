Return-Path: <linux-arm-msm+bounces-11894-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31BC085C20A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Feb 2024 18:07:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC648285119
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Feb 2024 17:07:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A8F57640E;
	Tue, 20 Feb 2024 17:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I6+n8kWE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B670277640
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Feb 2024 17:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708448864; cv=none; b=GgERzaKdtotclUxPrh7EfwFD/PY7jlKG4INfHWyfGEL9HM2IU6OJZtwPak/9EX+RvUcsqb9SxNKpOTMkDpFNJHt4GviFNBFBDBshB2Y7EXlG5WLm0zxjPZDEqVtgaK3drl8nU24C0JAOVqKsayzl8J8GYYzqsErEUhZSzHDwvb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708448864; c=relaxed/simple;
	bh=5/bi1QgRjF6knCi0qXssJ/goXm/3I+MJaDD3TiEGDHI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FmNaLMUYZvoSl7AZF9XO/o/M0eHRrtpo1pQtUOo6JwbxFZAFJBekAzZb9tXYun1MewHbXVuMoYVWG1sSaNxL3Mn1JYGynsI41om8CJ1plon0m0miYiitvRE6IZI0/cX5oIQmOj/AKfjwlII42hauu7LqgHSpCIrJznA8BOebbD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I6+n8kWE; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-512b84bdaf1so2812673e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Feb 2024 09:07:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708448861; x=1709053661; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mShveTDs8o2HzJ7EXJAElPOAOERFmO61toHHqLsbnwI=;
        b=I6+n8kWEWB3rLVaVyyiUFGyFJWQEAc6wf/NLMbg8JyW7gFjFkl5HR1yTWDFlzKCTdR
         K7qsF/+uxTkqWRbmkEFlYtU25tGY3cT7mNe/4iSW4Sc+TxrPAcv6KP4sOpNDvyi0YEr+
         apyOGy0MP58u93fImfmfDR/xwC8mocuBUdIwfe5bVHLFTgDXNX9uihooy29dH4kEHm8P
         L0x3axKKbQ10rb9v8D6K95Th38GAyGrST7dLlCmIP/DZ+eYnbmED5Ovcnykf9vfJwt07
         1MHly4Kw6zB9NvjvQv802LNgyTv6TQhJ2Js1xF1Tfxf7mMhanU9GSvFzowxz9UbcV+wx
         M1fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708448861; x=1709053661;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mShveTDs8o2HzJ7EXJAElPOAOERFmO61toHHqLsbnwI=;
        b=jYgEmsFei7pz/s+USOWQVcz9grD/TsNu+T4C1flvfvvvFOhWvJtuwLroZOlVR1dx2L
         swS2yRx7/Pzda7v8LVihXhAxPgm+umZyTiRA3jy32pQ8LhL3zszb9wzhGFA1OlDaY+HT
         Mn2I98iB39ecDHH5wNsd5Hosj2inMugcQQSRHK4gInsjtt5wY1Y45FXQHUrtKgnAS3GN
         /zUuxiU+pk4A/2hY0c/zeDkhBQOKjuEyxowBI+soV0Ay/D8X+Etvu0/WYeEWav5X3sk2
         8JihMMreqyKc190QaGu9/YlEkGkVZTJOfqFb6cM3sxsNpYDGdyWiOSJhQaQFsAW4zIlD
         ZR2g==
X-Forwarded-Encrypted: i=1; AJvYcCWFemxSD1ElNhYuR+A1r60nh6mEvMyhKxetlp5+3hShsUFD6jt8GlTmqIXcS/YN9W57ReGPBTdo8B3xBhKDOz9ilw0JnzFcysTF417m6w==
X-Gm-Message-State: AOJu0YwPfFC1fbIiSebPBheBaKU8eXegR9ifPy2CwYwo6NGFKMGDS1Ql
	9G39FH26QYS2XgPWlJg799agsaHQh0Kqo5dTWS0kwSiW5wQmtLZHnyvsjWoQPrM=
X-Google-Smtp-Source: AGHT+IGSj4UFEzJ2QdkqJnyaxs4ii6FgzfPObw02jZbt679agm5/qstPtdmgxKLIT0ezZ9Hr8LkbUQ==
X-Received: by 2002:a05:6512:102f:b0:512:96f3:413b with SMTP id r15-20020a056512102f00b0051296f3413bmr7991228lfr.26.1708448860804;
        Tue, 20 Feb 2024 09:07:40 -0800 (PST)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id z20-20020a05600c221400b0040fddaf9ff4sm15131450wml.40.2024.02.20.09.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 09:07:40 -0800 (PST)
Date: Tue, 20 Feb 2024 17:07:38 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Luca Weiss <luca@z3ntu.xyz>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
	Helge Deller <deller@gmx.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	"G.Shark Jeong" <gshark.jeong@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maximilian Weigand <mweigand@mweigand.net>,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 4/4] ARM: dts: qcom: msm8974-hammerhead: Hook up backlight
Message-ID: <20240220170738.GI6716@aspen.lan>
References: <20240220-lm3630a-fixups-v1-0-9ca62f7e4a33@z3ntu.xyz>
 <20240220-lm3630a-fixups-v1-4-9ca62f7e4a33@z3ntu.xyz>
 <20240220141210.GG6716@aspen.lan>
 <2444202.ElGaqSPkdT@g550jk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2444202.ElGaqSPkdT@g550jk>

On Tue, Feb 20, 2024 at 05:45:32PM +0100, Luca Weiss wrote:
> On Dienstag, 20. Februar 2024 15:12:10 CET Daniel Thompson wrote:
> > On Tue, Feb 20, 2024 at 12:11:22AM +0100, Luca Weiss wrote:
> > > Connect the panel with the backlight nodes so that the backlight can be
> > > turned off when the display is blanked.
> > >
> > > Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> >
> > Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> >
> >
> > > ---
> > >  arch/arm/boot/dts/qcom/qcom-msm8974-lge-nexus5-hammerhead.dts | 4 +++-
> > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974-lge-nexus5-hammerhead.dts b/arch/arm/boot/dts/qcom/qcom-msm8974-lge-nexus5-hammerhead.dts
> > > index 4aaae8537a3f..8eaa5b162815 100644
> > > --- a/arch/arm/boot/dts/qcom/qcom-msm8974-lge-nexus5-hammerhead.dts
> > > +++ b/arch/arm/boot/dts/qcom/qcom-msm8974-lge-nexus5-hammerhead.dts
> > > @@ -182,7 +182,7 @@ &blsp2_i2c5 {
> > >  	status = "okay";
> > >  	clock-frequency = <355000>;
> > >
> > > -	led-controller@38 {
> > > +	backlight: led-controller@38 {
> >
> > Again... a minor nit regarding existing problems but this node doesn't
> > follow the generic naming recommendations:
> > https://devicetree-specification.readthedocs.io/en/stable/devicetree-basics.html#generic-names-recommendation
>
> "led-controller" is listed on that page, or do you mean something else?

That's the point ;-). It is supposed to be called backlight@38!


Daniel.

