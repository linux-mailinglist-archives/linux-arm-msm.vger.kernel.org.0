Return-Path: <linux-arm-msm+bounces-101364-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GHv5Dpk1zWlwawYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101364-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 17:11:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6674437CC5D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 17:11:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 47B7A307BF19
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 14:39:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC2A92D0C82;
	Wed,  1 Apr 2026 14:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gYikEbSL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8CE4212542;
	Wed,  1 Apr 2026 14:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775054381; cv=none; b=jhkkzEyamyyNLqENoa6F9w9HbB1PfusiQhUuBP3CyXGfZo3dM36Pjk8JzpD7QhLRqDKSYzf4O0gVa27+Jt0B7lfiD6Ca7PwDZUwuLLf5mXzlAwYBXhSoBjvcWTQIWDonUCGRCoBcCurDZG7ykBvPYbHZk//7YGOBobvUyKlBd1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775054381; c=relaxed/simple;
	bh=0OU5ZO5Mkon1L7K95clfrg2Ou6vHfXePsExrM8t9768=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XlcvyzlrJ+gtBLE2Hr8VWokx4sPv2N2CzCLSRMoN5v07MSyHT11UrO/eZKxWSK8TsuMc6rol03O9vI8CF8GUgiSH0kXEaJCywfKYdKfeuBPJCgcEOwfBWSxrOmp0GpNYDIcwBPsWqMNanF0GK8qZ3trLSEPYcwOetT85BBMBI94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gYikEbSL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7F60C2BCB4;
	Wed,  1 Apr 2026 14:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775054381;
	bh=0OU5ZO5Mkon1L7K95clfrg2Ou6vHfXePsExrM8t9768=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gYikEbSLZasTRXX3lrih+5SAQDRzskNNCZMs+7fIYr2Y+2P45J8zCT3fih2JNHaSK
	 M3pKUDU9inyliwRCgoXSBUTPVjVyvWpSOB+Nj9qH6BUR/xaCHw1cUWbxV2r+Ap11Nw
	 u0V4k5T2//nOaIw8WIZVduu6qpQ6vGnLdxR8TuiRKvogfoviq5Pxy7WRiQpS71xuE+
	 UMctokot7Wj257DEXHU+36xzs2Jx+oT+YZJ4Y2DJaafYLaZkGAwsRFHmZs83gQJO+a
	 RzDEFKz9s0olqvi0aGh7PDFekf4mqMtcZQuX5yNTsqR/MX6IskcfofFPlnmGa9rk6y
	 9DbJX0/QG0mJQ==
Date: Wed, 1 Apr 2026 09:39:38 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
	Srinivas Kandagatla <srini@kernel.org>, Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mfd: wcd934x: Unroll regmap and irqchip on removal
Message-ID: <acyRJJZGsjoF0BaJ@baldur>
References: <20260309-wcd934x-unroll-regmap-v1-1-9a5fb305540e@oss.qualcomm.com>
 <20260319151154.GM554736@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260319151154.GM554736@google.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101364-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 6674437CC5D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 19, 2026 at 03:11:54PM +0000, Lee Jones wrote:
> On Mon, 09 Mar 2026, Bjorn Andersson wrote:
> 
> > When the slimbus-up event is handled a new regmap is created, an IRQ
> > chip is registered on this regmap and then the MFD devices are added.
> > 
> > But the regmap is left dangling if either any of those operations are
> > failing or if the slimbus-down event ever comes. Which manifest itself
> > as an error print from debugfs once the next slimbus-up event happens.
> > 
> > Likewise, if for some reason a slimbus-down event would be followed by
> > a slimbus-up event without the MFD being torn down by the slimbus
> > controller inbetween, we're going to have a dangling irq_chip.
> > 
> > Add cleanup of the registered resources on failure and on removal.
> > 
> > Fixes: 6ac7e4d7ad70 ("mfd: wcd934x: Add support to wcd9340/wcd9341 codec")
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> > ---
> >  drivers/mfd/wcd934x.c | 49 ++++++++++++++++++++++++++++++++++++++-----------
> >  1 file changed, 38 insertions(+), 11 deletions(-)
> > 
> > diff --git a/drivers/mfd/wcd934x.c b/drivers/mfd/wcd934x.c
> > index 3c3080e8c8cf7ecaaa62e255c7e01a850e65e9ad..b03cc91cc3a6a114a34efdb278420ae3dfa016eb 100644
> > --- a/drivers/mfd/wcd934x.c
> > +++ b/drivers/mfd/wcd934x.c
> > @@ -170,29 +170,56 @@ static int wcd934x_slim_status_up(struct slim_device *sdev)
> >  	ret = wcd934x_bring_up(ddata);
> >  	if (ret) {
> >  		dev_err(dev, "Failed to bring up WCD934X: err = %d\n", ret);
> > -		return ret;
> > +		goto err_regmap_exit;
> >  	}
> >  
> > -	ret = devm_regmap_add_irq_chip(dev, ddata->regmap, ddata->irq,
> > -				       IRQF_TRIGGER_HIGH, 0,
> > -				       &wcd934x_regmap_irq_chip,
> > -				       &ddata->irq_data);
> > +	ret = regmap_add_irq_chip(ddata->regmap, ddata->irq,
> > +				  IRQF_TRIGGER_HIGH, 0,
> > +				  &wcd934x_regmap_irq_chip,
> > +				  &ddata->irq_data);
> >  	if (ret) {
> >  		dev_err(dev, "Failed to add IRQ chip: err = %d\n", ret);
> > -		return ret;
> > +		goto err_regmap_exit;
> >  	}
> >  
> >  	ret = mfd_add_devices(dev, PLATFORM_DEVID_AUTO, wcd934x_devices,
> >  			      ARRAY_SIZE(wcd934x_devices), NULL, 0, NULL);
> >  	if (ret) {
> > -		dev_err(dev, "Failed to add child devices: err = %d\n",
> > -			ret);
> > -		return ret;
> > +		dev_err(dev, "Failed to add child devices: err = %d\n", ret);
> > +		goto err_del_irq_chip;
> >  	}
> >  
> > +	return 0;
> > +
> > +err_del_irq_chip:
> > +	regmap_del_irq_chip(ddata->irq, ddata->irq_data);
> > +	ddata->irq_data = NULL;
> > +err_regmap_exit:
> > +	regmap_exit(ddata->regmap);
> > +	ddata->regmap = NULL;
> >  	return ret;
> >  }
> >  
> > +static void wcd934x_slim_status_down(struct slim_device *sdev)
> > +{
> > +	struct device *dev = &sdev->dev;
> > +	struct wcd934x_ddata *ddata;
> > +
> > +	ddata = dev_get_drvdata(dev);
> 
> Is this guaranteed to be populated?
> 
> If this fails for any reason, we'll nul-ptr-deref below.
> 

The intent is that slim_device_update_status() will only be called
between a successful probe() and the invocation of remove().

The case where this I'm still trying to convince myself about is if
we have a race between removal of the grandparent controller and the
restart of the audio DSP; but that should be addressed in the slimbus
framework and not here.

Regards,
Bjorn

> > +	mfd_remove_devices(&sdev->dev);
> > +
> > +	if (ddata->irq_data) {
> > +		regmap_del_irq_chip(ddata->irq, ddata->irq_data);
> > +		ddata->irq_data = NULL;
> > +	}
> > +
> > +	if (ddata->regmap) {
> > +		regmap_exit(ddata->regmap);
> > +		ddata->regmap = NULL;
> > +	}
> > +}
> 
> [...]
> 
> -- 
> Lee Jones [李琼斯]

