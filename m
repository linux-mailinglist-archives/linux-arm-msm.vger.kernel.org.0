Return-Path: <linux-arm-msm+bounces-31963-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B5CB697BCD3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Sep 2024 15:10:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 17D04B212D5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Sep 2024 13:10:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56FFA1741C8;
	Wed, 18 Sep 2024 13:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bXMUM1eh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781AA1CD3F
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Sep 2024 13:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726665011; cv=none; b=lESZeYKeOa9Axcvhl9qgYSIO0Yf9t1bU+74f3nZFjChDaOyeTI02RPzDD4TfDXAiQmtx/cH6dBhNAfj6syLAzyoyNufIeYFD4VwLQb+QLdvBUZvhyMGs4I4am5AobPPaQLf+JRtgfBt52rG+eAR8ymuatsyFPzAzBTvZvuNTThM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726665011; c=relaxed/simple;
	bh=qSS9j04dMz97s1/G7sXN4oo94BzskpOxNZlCp1HcBGs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QOeSI40kfBOzf12udOs8EUF7gp2WVbH0OknWOtnawh9v6nkb7fnERKd4y0xDb/kC4jlp4rHOZ7QHaCIgkiFEm9Ac+XQ+4IvJAbDA1vX2AmveKGHvyHCecQ3MQLTa9dBShN7uxraZGrnSAlN/MdOTWxHerj8MOao4GPhswXj15OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bXMUM1eh; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5c241feb80dso1594624a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Sep 2024 06:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726665008; x=1727269808; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VVRgT66/mOuXoJrqQ8wh1eZWHMJn1TVCedz1ceMT+pM=;
        b=bXMUM1ehfNXoefr+2aBc3G/dLfGptZpgUDvbcIEq1jnu4aLwvo8HeYO/DcAJje3MHV
         3cATBVkLuErbn3GPp4oR47+s373xqpNee+GkfeoGq2F9glXutMQwLWwspFXhSlHaAaGT
         wIow2jvihLG4EexhxvQfKTsBACPh7OLa4M5NiaT1WKgHWmD0SsrA/Dko0FIFnuRfVqIQ
         7kh1A62kShBJBqAqOlKno1UEQJCTlSQDAPBiCNTGChsKQJ6tZdNW2c8Ip25Dp05Yibvy
         RuPGOnWItTXjn32KistG+ktBb8sZrnI6WnRnN/Uj7BnyUIys7PVjhajKoP27slpp1rdp
         VPNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726665008; x=1727269808;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VVRgT66/mOuXoJrqQ8wh1eZWHMJn1TVCedz1ceMT+pM=;
        b=eXx76mfSEybn3rRurYihakuP0KkX8xSnj29Acspg3zonKdYrkArN5cPZGPQ+xOjs/w
         EhA00Uqf85EMT8yjCKjeir0LquEIkBQD+DhdAGBVtxPLftzTQlnQYCREQKri9H1FDlle
         14ut6f+oO8k13EdqpqS1oAVW7Iaqqlcztd2krxjOJXsojuL3luOjMApP00c9RND5jbqW
         8WtlLaXaI6mIJXRSJcDF/FBiXcPUGG2a/0tqpzeQRjDG5ZoH5YO3uXE5uUDBNXhDb4P/
         aKNOFVY992JIobus1+mroiIKY3dXjuq7YR2CnmBRh8l5WAOLKPxYx3lX8MEA9Tvzty2Y
         3Zmg==
X-Forwarded-Encrypted: i=1; AJvYcCXFWeoU9lkSyjLXHTZetNBw9lMOQPYJo/fV6SFKflXJ/tvDxhqFp5VkWfnP0NKxRS2vaxVZe3jMnBh03SFT@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5roCot+bf7kHOB7G/jH2E9bwXwfR7sJY1uxtzkJkNui6XUGGf
	4JhQV6EmXeqcWu6EUhn6Rt3Qhs5AC3JXRpq/5IvaOY+KgzFRzsmQ3PRz0NZNJTkUx5j3JTbl6XK
	K
X-Google-Smtp-Source: AGHT+IGHtxlIXrPw47xVhdH8uLboKPn/Kp7bXo6oA0xYfYIupxuqexOncbN9AZZ0BmhjMlNITwnFjw==
X-Received: by 2002:a17:907:1b05:b0:a7a:afe8:1013 with SMTP id a640c23a62f3a-a902a3d188dmr2413879466b.1.1726665007741;
        Wed, 18 Sep 2024 06:10:07 -0700 (PDT)
Received: from linaro.org ([62.231.96.65])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9060f39a8fsm588762066b.0.2024.09.18.06.10.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 06:10:07 -0700 (PDT)
Date: Wed, 18 Sep 2024 16:10:05 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: qcom: edp: Add runtime PM support
Message-ID: <ZurRLf8S1j6s8GPz@linaro.org>
References: <20240907-phy-qcom-edp-enable-runtime-pm-v1-1-8b9ee4210e1e@linaro.org>
 <ZuqmB3Cn7mGfA2PU@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZuqmB3Cn7mGfA2PU@hovoldconsulting.com>

On 24-09-18 12:05:59, Johan Hovold wrote:
> On Sat, Sep 07, 2024 at 06:25:21PM +0300, Abel Vesa wrote:
> > Enable runtime PM support by adding proper ops which will handle the
> 
> Avoid words like 'proper' here (what are non-proper runtime PM ops?).

Sure.

> 
> > clocks and regulators. These resources will now be handled on power_on and
> > power_off instead of init and exit PHY ops.
> 
> No, this is simply a false claim and indicates that you haven't reviewed
> how PHY runtime PM works. Core will increment the usage count on init()
> and decrement it on exit().

Yeah, I guess the better argument here would be that the PHY needs
regulators and clocks enabled. Anyway, ignore this version as it
was already NACKed by Dmitry.

> 
> > Also enable these resources on
> > probe in order to balance out the disabling that is happening right after.
> > Prevent runtime PM from being ON by default as well.
> 
> And here you just regressed all current systems that do not have udev
> rules to enable runtime PM, and which will now be stuck with these
> resources always-on (e.g. during DPMS off and system suspend).
> 
> In fact, you are even regressing systems that would enable runtime PM,
> as the runtime suspend callback would not currently be called when you
> enter system suspend so the regulators and clocks will be left on.
> 
> This clearly hasn't been tested and analysed properly.
> 
> > +static int __maybe_unused qcom_edp_runtime_suspend(struct device *dev)
> > +{
> > +	struct qcom_edp *edp = dev_get_drvdata(dev);
> > +
> > +	dev_err(dev, "Suspending DP phy\n");
> 
> You forgot to drop your development printks (same below).
> 
> Johan

