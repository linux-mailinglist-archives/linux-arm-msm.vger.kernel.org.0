Return-Path: <linux-arm-msm+bounces-98065-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AEUNMHHhuGlukwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98065-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 06:06:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC282A3E2F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 06:06:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6FF4430238E3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 05:06:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE3B4334C2B;
	Tue, 17 Mar 2026 05:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="uMwZR+rq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5EF1E511;
	Tue, 17 Mar 2026 05:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773724014; cv=none; b=unK19fI6Q1cY6i/UrbCkpMD62/xJBf5r7Fej/RUSCCcdAn+uA2Mx5P2VnP8qHjMqSGuEF8ZIP2AvZddAsguWwtW6gcrTmJ94ntXRRqraAxoasUeW1f5HVpgmzxDSSdsdIMSGuF+5ma9/vV6pJVJ1twC+z8vBRZZeQ2apELhpSZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773724014; c=relaxed/simple;
	bh=gTwbyqxGTOeBeLjpvyqRL18jbkvEOEJuBB4lrBs3T58=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ms+AkQFtIb09Sn2S19gRKxYkmo2PDP9kCDT20Ijs4T0W+PwuF+SE4pdhnln0Vi6cjIhIwwpZ3kzuHsjJGX6qGtZvYoky2Vh5TstSyoDHW4uHNQ5lVMqzsElS8czRiTEtv1paN+pU9EV0/I1S+NE2AS5tgGiyuxID5NPaaFsNKiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=uMwZR+rq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69ACEC4CEF7;
	Tue, 17 Mar 2026 05:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773724014;
	bh=gTwbyqxGTOeBeLjpvyqRL18jbkvEOEJuBB4lrBs3T58=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uMwZR+rqLP2myqpO2PyBe27RYWHLeM6zIixdL6xFA3oO7GA/lc3JeDB0vkFzQ2ZbJ
	 n5yXlG9FdTZ2MyP3h39+NyYVzPcI6Y9O94d0T46P22HkX3GdH0BNbc0T+UdJSx6NR6
	 wn4CqrhM+LEcZxJjRPJEbWdKOkwfz6s6K6qXoJBI=
Date: Tue, 17 Mar 2026 06:06:34 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: rafael@kernel.org, hanguidong02@gmail.com, ysato@users.sourceforge.jp,
	dalias@libc.org, glaubitz@physik.fu-berlin.de, abelvesa@kernel.org,
	srini@kernel.org, s.nawrocki@samsung.com, nuno.sa@analog.com,
	brgl@kernel.org, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-sh@vger.kernel.org
Subject: Re: [PATCH v2 4/4] driver core: platform: use generic
 driver_override infrastructure
Message-ID: <2026031722-pronounce-outgrow-5fe5@gregkh>
References: <20260303115720.48783-1-dakr@kernel.org>
 <20260303115720.48783-5-dakr@kernel.org>
 <DH4M3DJ4P58T.1BGVAVXN71Z09@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DH4M3DJ4P58T.1BGVAVXN71Z09@kernel.org>
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98065-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,users.sourceforge.jp,libc.org,physik.fu-berlin.de,samsung.com,analog.com,lists.linux.dev,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linuxfoundation.org:dkim,linuxfoundation.org:email]
X-Rspamd-Queue-Id: 2DC282A3E2F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 17, 2026 at 12:56:52AM +0100, Danilo Krummrich wrote:
> (Cc: Bartosz)
> 
> On Tue Mar 3, 2026 at 12:53 PM CET, Danilo Krummrich wrote:
> > diff --git a/arch/sh/drivers/platform_early.c b/arch/sh/drivers/platform_early.c
> > index 143747c45206..3cd17bb0be67 100644
> > --- a/arch/sh/drivers/platform_early.c
> > +++ b/arch/sh/drivers/platform_early.c
> > @@ -25,10 +25,12 @@ static int platform_match(struct device *dev, struct device_driver *drv)
> >  {
> >  	struct platform_device *pdev = to_platform_device(dev);
> >  	struct platform_driver *pdrv = to_platform_driver(drv);
> > +	int ret;
> >  
> >  	/* When driver_override is set, only bind to the matching driver */
> > -	if (pdev->driver_override)
> > -		return !strcmp(pdev->driver_override, drv->name);
> > +	ret = device_match_driver_override(dev, drv);
> > +	if (ret >= 0)
> > +		return ret;
> >  
> >  	/* Then try to match against the id table */
> >  	if (pdrv->id_table)
> 
> I was just about to pick up this series, but then noticed that checking for
> driver_override in the platform_early case doesn't make sense in the first place
> and was accidentally added when the platform_match() callback was copied over in
> commit 507fd01d5333 ("drivers: move the early platform device support to
> arch/sh").
> 
> Thus, I'm going to drop this hunk and add in the following patch; please let me
> know if there are any concerns.
> 
> commit 39cae4095efda4b00b436c0fc46f21de84128969
> Author: Danilo Krummrich <dakr@kernel.org>
> Date:   Tue Mar 17 00:37:15 2026 +0100
> 
>     sh: platform_early: remove pdev->driver_override check
> 
>     In commit 507fd01d5333 ("drivers: move the early platform device support to
>     arch/sh") platform_match() was copied over to the sh platform_early
>     code, accidentally including the driver_override check.
> 
>     This check does not make sense for platform_early, as sysfs is not even
>     available in first place at this point in the boot process, hence remove
>     the check.
> 
>     Fixes: 507fd01d5333 ("drivers: move the early platform device support to arch/sh")
>     Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> 
> diff --git a/arch/sh/drivers/platform_early.c b/arch/sh/drivers/platform_early.c
> index 143747c45206..48ddbc547bd9 100644
> --- a/arch/sh/drivers/platform_early.c
> +++ b/arch/sh/drivers/platform_early.c
> @@ -26,10 +26,6 @@ static int platform_match(struct device *dev, struct device_driver *drv)
>         struct platform_device *pdev = to_platform_device(dev);
>         struct platform_driver *pdrv = to_platform_driver(drv);
> 
> -       /* When driver_override is set, only bind to the matching driver */
> -       if (pdev->driver_override)
> -               return !strcmp(pdev->driver_override, drv->name);
> -
>         /* Then try to match against the id table */
>         if (pdrv->id_table)
>                 return platform_match_id(pdrv->id_table, pdev) != NULL;
> 
> 

Makes sense to me, good catch!

Reviewed--by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

