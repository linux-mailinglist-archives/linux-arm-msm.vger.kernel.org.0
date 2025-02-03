Return-Path: <linux-arm-msm+bounces-46791-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E6518A25E62
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 16:20:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4CAF61881DEA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 15:17:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B502620967A;
	Mon,  3 Feb 2025 15:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bqxzwYD7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F980209677
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Feb 2025 15:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738595817; cv=none; b=Lvz56YKLSmyNegbhwrwuLmoFS8N441c/UczmgCkF2fSqo1fjRgvJE6ff4ZdAQYow6UezzrftR6NcDASc1sIvhCuw/TAS8Pv+kRTQydatXoe8v9RMgTxdTSuLd8RQAYJLwVCok+SeV2Imi09IkvRZdvqws12uDaeM1jyouS8TawE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738595817; c=relaxed/simple;
	bh=cTbrNYJLCNdhhwnl8aRo/ZlBGCgcrth/NNaKS4Dl3I4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UgqxwwJ9pzKS9pbyvHVLCQmR+pPX0U5DzBM+tF+6XJ4kyNCqH4ewxF8sGs2mBUlD+DqvOif8UBgoUAJL+jsS+zsxhogp6DrOEjgt+GATRDJizvXZjAGKz33iLJjo1WBADJQkgYjl5EtjfVlZ3PN8rMQ6TI40HzIKlnHrW3b5E9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bqxzwYD7; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5401c68b89eso4148008e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Feb 2025 07:16:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738595813; x=1739200613; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Vyj67VRTVYAUNFxIG4OB3HpFs4YteBVpT2TtAqLX6IY=;
        b=bqxzwYD74+gmpc19QIPgSZvpZEIONYQ5r9FegQRbqzokR6ZsIg9D6kTWxv+lJJwvSf
         hdDbFGXSjdZOQzcUonkZjPyiNNg1JRmc5TsO7Vs1EHR2jhMJfakTWPvfJY7bAfvdXIuy
         ZT8mdWe8lj79VqiQv4MCCp4VXtLnv0Jcb2vhS7IWkeFlEbtbV/2pc1BsIfvrJO/GfomE
         xEOyW7pezMiGggv9Zf/34d7yEIaJat2wG3WSSFR/rWOgaaFy5FsCbFdvA6hcF+c5jE2h
         tMSoG8VhnJR1NavOzLSaxhtmqtFdbO3pukFvXsMSJeQTpdH53ZNEw0EbJRWPQIw075Ce
         S8Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738595813; x=1739200613;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vyj67VRTVYAUNFxIG4OB3HpFs4YteBVpT2TtAqLX6IY=;
        b=ZKlk6OpxfaqzIXxo/tf25XMrbqfz99qQ/9ZIjaWTYvnT7a/J4cJVTm9l6OKNqA3AV9
         L0UH3W/wehhMq/A/x135mXr167uwj+TAo//chDfMbqQZBDwUTqYjzOW/8K7r+0Gt9Jt/
         zOZyVnOYRBtM84R6L2jYwcK6qnMZCgzGopva1qED+z5qjhpNh3Xi8CfpPlxqPaejCnkb
         e2n1zLwG/UokOgnpwGh+FMhWcN86PF9Zf7GcVk/Gqw53CnU7jASiXSp7lPOGXBnkXe6f
         mNTKLhM3fgDGDHzQEjUyRGKcLyn/x0+jhXaG5IYr+Zt4kqzXarluB9Kymf9mUmlKlZnd
         ZI9w==
X-Forwarded-Encrypted: i=1; AJvYcCUobc2750me64itM+akNq6Buy2/UXAzs7Ed9EnnsUvccRfuPLL+PpRDOP1KuWjO8qPZl4t/0r21OVzIxThF@vger.kernel.org
X-Gm-Message-State: AOJu0YxiUEnCNEnicRkspXGeFbH6ixfRbE+XlGvxrTN/sIBqNDBg2j4d
	U8nSO7wPHjnKBTj3y1JfIt/1R2qawRvb2MKB5EGNsz+/UXiBCtrBBM6DHpX09/U=
X-Gm-Gg: ASbGncsE/PUbW756EQZPNOCUPlivwx5jj4uK/eB37eiRajucgrHs9cr3OUqR0W8QknF
	GngksCH4wjeYRwxHuvvdhxPkPqFSXnjOruPdtes3v8aQzJre417CDCidxMFpvuptTO39jRaTi/Y
	JnyTSDgdAzHlqJ60QeRckqO6wrJmE+U3wsK1fineNpTDA38FaRT0LeIUuqC25m7p+oq/pcv4quY
	XhAxxUPvyCYlyvOI2LIqsDlwJqst61bH0ixFvMKsLs9pHQUheinz23NtkLLd9JTa6b6Nk2pfpiR
	EbyAbKAhrzZzh2BQiqr2kC1EF4SUYLfjO01G/Fw4UTUTzu4Cw2OHBXySlbO1PFToKTeyjDY=
X-Google-Smtp-Source: AGHT+IFvcunhehAneV8WOuwnEKnlJW9yoQuXlRAFhfSrhoXK3pww1JqdTTeDy8iee3YPZkps+263Uw==
X-Received: by 2002:a05:6512:2343:b0:543:e4de:3e12 with SMTP id 2adb3069b0e04-543f0f25405mr4806134e87.18.1738595813396;
        Mon, 03 Feb 2025 07:16:53 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebebec5esm1322732e87.236.2025.02.03.07.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 07:16:51 -0800 (PST)
Date: Mon, 3 Feb 2025 17:16:50 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Dikshita Agarwal <quic_dikshita@quicinc.com>, 
	quic_vgarodia@quicinc.com, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	p.zabel@pengutronix.de, hverkuil@xs4all.nl, sebastian.fricke@collabora.com, 
	bryan.odonoghue@linaro.org, neil.armstrong@linaro.org, nicolas@ndufresne.ca, 
	u.kleine-koenig@baylibre.com, stefan.schmidt@linaro.org, lujianhua000@gmail.com, 
	linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, krzysztof.kozlowski@linaro.org
Subject: Re: [RFC PATCH v10 1/2] media: iris: introduce helper module to
 select video driver
Message-ID: <tqbm672pi223ipcw7btiemlb745weeeiy4gnazzeghozhq2emj@wppbkms6hir5>
References: <20250128080429.3911091-1-quic_dikshita@quicinc.com>
 <20250128080429.3911091-2-quic_dikshita@quicinc.com>
 <5070e1f1-914b-4654-88ef-3566e3eee9ca@kernel.org>
 <f1344e49-61b6-4115-ae88-55b4a3cfed28@quicinc.com>
 <Z6B822-6UTxQfX46@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6B822-6UTxQfX46@hovoldconsulting.com>

On Mon, Feb 03, 2025 at 09:22:51AM +0100, Johan Hovold wrote:
> On Fri, Jan 31, 2025 at 10:44:28AM -0800, Abhinav Kumar wrote:
> > On 1/29/2025 2:44 AM, Krzysztof Kozlowski wrote:
> > > On 28/01/2025 09:04, Dikshita Agarwal wrote:
> 
> > >> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
> > >> index 954cc7c0cc97..276461ade811 100644
> > >> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> > >> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> > >> @@ -196,6 +196,9 @@ static int iris_probe(struct platform_device *pdev)
> > >>   	u64 dma_mask;
> > >>   	int ret;
> > >>   
> > >> +	if (!video_drv_should_bind(&pdev->dev, true))
> > >> +		return -ENODEV;
> > > 
> > > Wouldn't it mark the probe as failed and cause dmesg regressions?
> 
> No, this is perfectly fine. Probe can return -ENODEV and driver core
> will continue with any further matches.
> 
> > >> +#if !IS_REACHABLE(CONFIG_VIDEO_QCOM_VENUS) || !IS_REACHABLE(CONFIG_VIDEO_QCOM_IRIS)
> > >> +bool video_drv_should_bind(struct device *dev, bool is_iris_driver)
> > >> +{
> > >> +	/* If just a single driver is enabled, use it no matter what */
> > >> +	return true;
> > >> +}
> > >> +
> > >> +#else
> > >> +static bool prefer_venus = true;
> > >> +MODULE_PARM_DESC(prefer_venus, "Select whether venus or iris driver should be preferred");
> > >> +module_param(prefer_venus, bool, 0444);
> > > 
> > > 
> > > The choice of driver is by module blacklisting, not by failing probes.
> > > 
> > > I don't understand why this patchset is needed and neither commit msg
> > > nor above longer code comment explain me that. Just blacklist the module.
> 
> > Summarizing the discussion with myself, Krzysztof and Dmitry:
> > 
> > 1) module blacklisting solution will not be ideal if users want to have 
> > both venus and iris or either of them built-in
> 
> Module blacklisting is not the way to go, you shouldn't have two drivers
> racing to bind to the same device ever.
> 
> > 2) with current approach, one of the probes (either venus or iris) will 
> > certainly fail as video_drv_should_bind() will fail for one of them. 
> > This can be considered as a regression and should not happen.
> 
> How can that be a regression? One driver must fail to probe (see above).

I also don't think that it's a regression. I think Krzysztof was
concerned about the 'failed to bind' messages in dmesg.

> > Solution: If the user prefers iris driver and iris driver has not probed 
> > yet, and if venus tries to probe ahead of iris we keep -EDEFERing till 
> > iris probes and succeeds. Vice-versa when the preference is venus as well.
> 
> This sounds wrong too.
> 
> Look, first you guys need to explain *why* you want to have two drivers
> for the same hardware (not just to me, in the commit message and cover
> letter).
>
> That's something that really should never be the case and would need to
> be motivated properly.

I think it has been written several time (not sure about this commit):
to provide a way for a migration path _while_ people are working on Iris
features. Being able to A/B test Venus and Iris drivers and to report
possible regressions or lack of those on the common platforms supported
by those (sm8250 at this moment).

> Second, if the reasons for keeping both drivers are deemed justifiable,
> you need to come up with mechanism for only binding one of them.
> 
> I already told you that module parameters is not the way to go here (and
> the msm drm driver's abuse of module parameters is not a good precedent
> here).
> 
> If this is a transitional thing (which it must be), then just add a
> Kconfig symbol to determine which driver should probe. That's good
> enough for evaluating whatever needs to be evaluated, and doesn't
> depend on adding anti-patterns like module parameters (and helper
> modules for them).

No, Kconfig complicates A/B testing. What you usually want to do is to
boot a kernel, then go over a bunch of files testing that they work with
both drivers. Kconfig implies booting abother kernel, etc.

> 
> Keep it simple.
> 
> Johan

-- 
With best wishes
Dmitry

