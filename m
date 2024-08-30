Return-Path: <linux-arm-msm+bounces-30186-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 340A8965A45
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 10:26:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 67A101C20DAD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 08:26:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1321016C856;
	Fri, 30 Aug 2024 08:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VSVMf61I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5A614D294
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Aug 2024 08:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725006383; cv=none; b=OQh/IPj5uLUS7W5L8ICwn7qj3Yi8sVOfL983lfGOVFqPGWWFJW50X6EsUpPVQ/evWKGStHP70Jae2JeIh/fFFyH+5AfVYK2QqJEiPoDI7vX7K95dQ0FQPRGo7cTf+9zKse6FDCGEB6xsjp5ZM7iqn7+88FpwmYCx1+4IQsHrgTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725006383; c=relaxed/simple;
	bh=e6UmKK1uv4GE4oEQ3Qw87ejtvJIm9dvgZYCtxPS7nHw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WtvWpPh2CPwgxTtDZw/ne3Q71GCNS0YqxSaNYBXcGiEv6DNdvCgscYcKbHmzr8FCD0QMB6/u4AVN6l18bwYgLtBgGXROUHxTHJtuXbeA+9hu3zRy1tKd2spgtIlKkMZnwzj3EY/Kj55rc6o7F2prI7CJSEk0B5mjTowbJjoXrJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VSVMf61I; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a868831216cso190701866b.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Aug 2024 01:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725006379; x=1725611179; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uDSO4akp2KhRfSSRiJYvlvkWluMAutHA5r9aDvMGObY=;
        b=VSVMf61IFmJzTyq/NKbr+n/WIrJ72qCjuQWvF1HHZd6Ij3qdhr1J0q/NMafM6aaG7u
         uKHR0eWhlW6Q4+oFmgkKjBiq5/PKcoabp+14AkEqtelber5GHIov1p4kJWgqDPZzhj0R
         dEWkOSOfAH3k+ALE//zFU9ltqVfe9uX1wv11SxIUf8UyTqX8l0qnQbFp5X6JPXURgjic
         m1jSoTdQm8IT9XiJv2K2Vcqs2JT0rxK8ttez2E7xHCHe9L/PgCI9U/enjwsBefo/xUe6
         gS8rr/CEET8rTBsR1Wa9IuoJlxqVfbN013/mbcu3Rf+JMsfysM0meBzSBmA3lpqxQWRj
         PQ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725006379; x=1725611179;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uDSO4akp2KhRfSSRiJYvlvkWluMAutHA5r9aDvMGObY=;
        b=ZvqzrTV9i3Cq2MshfbD/ZcJCOAtIzXqdeMRAr7SLdiG6dtJX0gQKHlU471Ttw5HBjG
         lnyGQqOR+Ko64bO/MNCcyJh0mdsDrFbtMK6+iVnsu45VcFf+SCGf6Jha1wf18zj03qfO
         YtZuuif8/PicZQ4/7EcKIUT8YcIiKnrA71QLI7F+TnSg9SzAKlgSF3lbevz4kDsnWJmh
         AvStMujGsca5hoQcjv9xG9FDm0EdOBdajdsmFuazpW2gMbWKWXWQ4MiqWm3daCx69MJb
         R2Gby0dC8ThNg792uNLtjjfCcZC5j97/zK9ZHMaClfmH24G8DIxi6jNO676QzHLWCn45
         +5sw==
X-Forwarded-Encrypted: i=1; AJvYcCU42YCqxiLYZQ9x6GdOy4dV6mfwHDtxi6JZ3o5Vh5ZyvdfQGYnxtJOmZ3sx0DODIq1I7N+bJ/zgh616p1Gr@vger.kernel.org
X-Gm-Message-State: AOJu0YwyNDHK+NgK9G9bpmXXrZM0Okb4APXNprcycsmk/7IjrZeSka5i
	d4Mhr+1FMq4XnbK8q83Ubn4ulI73J4i8pCPxvLLWDGtCNtve36M84TaKh3DPWwo=
X-Google-Smtp-Source: AGHT+IHMd2a7oX2CNchv5nPzpcimaPtAh2+17ZJkKEC5K6QZXNRoCN7DgkRBQORt2wViPlTE8ZcuJg==
X-Received: by 2002:a17:906:794b:b0:a80:f79a:eb6f with SMTP id a640c23a62f3a-a897f77fdbbmr448369466b.8.1725006379328;
        Fri, 30 Aug 2024 01:26:19 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff1f:b280:290:d5b:6ddc:fbdb])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a89892164f5sm185254466b.192.2024.08.30.01.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 01:26:19 -0700 (PDT)
Date: Fri, 30 Aug 2024 10:26:14 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Danila Tikhonov <danila@jiaxyga.com>, andersson@kernel.org,
	konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, cros-qcom-dts-watchers@chromium.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux@mainlining.org
Subject: Re: [PATCH] arm64: dts: qcom: sc7280.dtsi: Fix PMU nodes for Cortex
 A55 and A78
Message-ID: <ZtGCJincjO7z-WFm@linaro.org>
References: <20240818192905.120477-1-danila@jiaxyga.com>
 <5gmsbbnuc7sbkpptomvpl6aarw5poutvjfav5rilgogb7727vi@nhtr5m24tkmt>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5gmsbbnuc7sbkpptomvpl6aarw5poutvjfav5rilgogb7727vi@nhtr5m24tkmt>

On Fri, Aug 30, 2024 at 11:13:28AM +0300, Dmitry Baryshkov wrote:
> On Sun, Aug 18, 2024 at 10:29:05PM GMT, Danila Tikhonov wrote:
> > The SC7280, SM7325, and QCM6490 platforms feature an 8-core setup
> > consisting of:
> > - 1x Kryo 670 Prime (Cortex-A78) / Kryo 670 Gold Plus (Cortex-A78)
> > - 3x Kryo 670 Gold (Cortex-A78)
> > - 4x Kryo 670 Silver (Cortex-A55)
> > (The CPU cores in the SC7280 are simply called Kryo, but are
> > nevertheless based on the same Cortex A78 and A55).
> > 
> > Use the correct compatibility.
> > 
> > Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
> > ---
> >  arch/arm64/boot/dts/qcom/sc7280.dtsi | 9 +++++++--
> >  1 file changed, 7 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> > index 91cc5e74d8f5..ab024a3c3653 100644
> > --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> > @@ -845,8 +845,13 @@ wlan_smp2p_in: wlan-wpss-to-ap {
> >  		};
> >  	};
> >  
> > -	pmu {
> > -		compatible = "arm,armv8-pmuv3";
> > +	pmu-a55 {
> > +		compatible = "arm,cortex-a55-pmu";
> > +		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
> > +	};
> > +
> > +	pmu-a78 {
> > +		compatible = "arm,cortex-a78-pmu";
> >  		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
> 
> Shouldn't these two entries have GIC_CPU_MASK_RAW(), limiting interrupts
> to the corresponding cores? I see that in [1] Rob used masks for older
> SoCs, but skipped them for newer ones.
> 
> [1] https://lore.kernel.org/all/20240417204247.3216703-1-robh@kernel.org/
> 

According to the bindings, the cpu mask bits apply only to gic-v2, but
not gic-v3. It looks correct in Rob's changes. And here too, since
SC7280 uses gic-v3.

Thanks,
Stephan

