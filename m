Return-Path: <linux-arm-msm+bounces-102176-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IBuqLvgL1WlQzwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102176-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 15:51:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E613AF7CE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 15:51:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DC3433004065
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 13:51:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 651FB3B6C1E;
	Tue,  7 Apr 2026 13:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Md3w9y46"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6CE3B4E8F;
	Tue,  7 Apr 2026 13:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775569907; cv=none; b=UgRVrVxf5Qz5zIVx1q2JdUjKgFtKq7gxZhQeijqygjV1xP9Su5EdRAwy66mdlWfBDJ4W+5jSWEzZ1CgDBuhDSd5IfL+7mqzTzrpEAKTSJd9aPuqwO2mJlaZkT649qvQTDTu2KqaZIDOJCqaEHrwC9HMKSm3G6oO7C9eGC+hGrg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775569907; c=relaxed/simple;
	bh=vic2RYSowzD7Zq40WduuxjSXZIvG8NAtO4fkv8CDTps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MVqJv0mmOtxnVryEh8voCClQi0JbfdILMHiQaa2zYCJhUmQ1GacPCDpzhQX+ZVREDo9JFtXk4eMHdV7EFPXq32SqJ54KapHb13+K1Wsh2KTk04GMeUiN6+YBR6ZaLJ5sZSCrNkM/VB9R54yKiNhg0fFSb25BhRfKvADQcPBkeGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Md3w9y46; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B02FC116C6;
	Tue,  7 Apr 2026 13:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775569906;
	bh=vic2RYSowzD7Zq40WduuxjSXZIvG8NAtO4fkv8CDTps=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Md3w9y46qIW5dC6uAD49pjFje8RO3EJCakvX/MOl2j9YvVyAhfhinjtPV76a8mhHI
	 Y3iU3eksJj+grXtLoGqt844sQiJCYlMfVYmkQJqekdrEHVmak9pMwu+T/1HJwtRTOf
	 fIoSwdy2Y8Gj3hOn3nmDHPnJiD2fYZ4KVvPvRXrwa3sexmEM07VHKZDESGRYD0mAua
	 y6AKNmcy6jxbfJMfGLa7ZLIdRMkNLOuTtTMAp4pkwfg8cfRo88mP9sB8uYRTg4+JRA
	 9DqLoOrSMssGxT+gvLzd/D3SVlxb6kKw15OlAUHtkINeWaIDLkI0mQpkFP74EBab7b
	 rxIGj24IrJ/kQ==
Date: Tue, 7 Apr 2026 14:51:42 +0100
From: Lee Jones <lee@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mfd: wcd934x: Unroll regmap and irqchip on removal
Message-ID: <20260407135142.GP3795166@google.com>
References: <20260309-wcd934x-unroll-regmap-v1-1-9a5fb305540e@oss.qualcomm.com>
 <20260319151154.GM554736@google.com>
 <acyRJJZGsjoF0BaJ@baldur>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <acyRJJZGsjoF0BaJ@baldur>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102176-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: C2E613AF7CE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 01 Apr 2026, Bjorn Andersson wrote:

> On Thu, Mar 19, 2026 at 03:11:54PM +0000, Lee Jones wrote:
> > On Mon, 09 Mar 2026, Bjorn Andersson wrote:
> > 
> > > When the slimbus-up event is handled a new regmap is created, an IRQ
> > > chip is registered on this regmap and then the MFD devices are added.
> > > 
> > > But the regmap is left dangling if either any of those operations are
> > > failing or if the slimbus-down event ever comes. Which manifest itself
> > > as an error print from debugfs once the next slimbus-up event happens.
> > > 
> > > Likewise, if for some reason a slimbus-down event would be followed by
> > > a slimbus-up event without the MFD being torn down by the slimbus
> > > controller inbetween, we're going to have a dangling irq_chip.
> > > 
> > > Add cleanup of the registered resources on failure and on removal.
> > > 
> > > Fixes: 6ac7e4d7ad70 ("mfd: wcd934x: Add support to wcd9340/wcd9341 codec")
> > > Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> > > ---
> > >  drivers/mfd/wcd934x.c | 49 ++++++++++++++++++++++++++++++++++++++-----------
> > >  1 file changed, 38 insertions(+), 11 deletions(-)
> > > 
> > > diff --git a/drivers/mfd/wcd934x.c b/drivers/mfd/wcd934x.c
> > > index 3c3080e8c8cf7ecaaa62e255c7e01a850e65e9ad..b03cc91cc3a6a114a34efdb278420ae3dfa016eb 100644
> > > --- a/drivers/mfd/wcd934x.c
> > > +++ b/drivers/mfd/wcd934x.c
> > > @@ -170,29 +170,56 @@ static int wcd934x_slim_status_up(struct slim_device *sdev)
> > >  	ret = wcd934x_bring_up(ddata);
> > >  	if (ret) {
> > >  		dev_err(dev, "Failed to bring up WCD934X: err = %d\n", ret);
> > > -		return ret;
> > > +		goto err_regmap_exit;
> > >  	}
> > >  
> > > -	ret = devm_regmap_add_irq_chip(dev, ddata->regmap, ddata->irq,
> > > -				       IRQF_TRIGGER_HIGH, 0,
> > > -				       &wcd934x_regmap_irq_chip,
> > > -				       &ddata->irq_data);
> > > +	ret = regmap_add_irq_chip(ddata->regmap, ddata->irq,
> > > +				  IRQF_TRIGGER_HIGH, 0,
> > > +				  &wcd934x_regmap_irq_chip,
> > > +				  &ddata->irq_data);
> > >  	if (ret) {
> > >  		dev_err(dev, "Failed to add IRQ chip: err = %d\n", ret);
> > > -		return ret;
> > > +		goto err_regmap_exit;
> > >  	}
> > >  
> > >  	ret = mfd_add_devices(dev, PLATFORM_DEVID_AUTO, wcd934x_devices,
> > >  			      ARRAY_SIZE(wcd934x_devices), NULL, 0, NULL);
> > >  	if (ret) {
> > > -		dev_err(dev, "Failed to add child devices: err = %d\n",
> > > -			ret);
> > > -		return ret;
> > > +		dev_err(dev, "Failed to add child devices: err = %d\n", ret);
> > > +		goto err_del_irq_chip;
> > >  	}
> > >  
> > > +	return 0;
> > > +
> > > +err_del_irq_chip:
> > > +	regmap_del_irq_chip(ddata->irq, ddata->irq_data);
> > > +	ddata->irq_data = NULL;
> > > +err_regmap_exit:
> > > +	regmap_exit(ddata->regmap);
> > > +	ddata->regmap = NULL;
> > >  	return ret;
> > >  }
> > >  
> > > +static void wcd934x_slim_status_down(struct slim_device *sdev)
> > > +{
> > > +	struct device *dev = &sdev->dev;
> > > +	struct wcd934x_ddata *ddata;
> > > +
> > > +	ddata = dev_get_drvdata(dev);
> > 
> > Is this guaranteed to be populated?
> > 
> > If this fails for any reason, we'll nul-ptr-deref below.
> > 
> 
> The intent is that slim_device_update_status() will only be called
> between a successful probe() and the invocation of remove().
> 
> The case where this I'm still trying to convince myself about is if
> we have a race between removal of the grandparent controller and the
> restart of the audio DSP; but that should be addressed in the slimbus
> framework and not here.

if (!data) checks are cheap and could save a lot of trouble.

-- 
Lee Jones [李琼斯]

