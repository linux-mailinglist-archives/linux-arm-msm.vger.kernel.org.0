Return-Path: <linux-arm-msm+bounces-109881-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2DizLPS6FWrKYQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109881-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 17:23:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 920F65D89DC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 17:23:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 454A83056B28
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 15:10:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8A6F35970F;
	Tue, 26 May 2026 15:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SlJmxXxI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D6CB3CC7CA;
	Tue, 26 May 2026 15:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779808036; cv=none; b=PcqUl05hRZOR/ynvNXHeLtPNrs53FWKWpY6I/7tnA1Y0BSRJX6/98H335scgYaZagHaBHoZa1gT9j3CAjbRgA6m71nXtNZfYwzZeN00/e5o/0uDhNf04HCat4YzyKDwGP0Pl1dVZWyS/shSzPRxz9plqE1Kl1LGcKtABxLeNNoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779808036; c=relaxed/simple;
	bh=9Ab3o8ryM7jLe1qoz84ND/OWVAPfF0qDcSn7odqS5IA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mYcmoiBA3JIVcnVu9HwZhBdoxmijwP37EjDcDAeUeSAyPC1LzJtrAsep2hLyTzA7m5drrfmkZ5dt1qGrNCnm/HSL17Sv27Mcf4BjsUq0YXbNS2MaBdc6ef9uVXkxopfTlUHoh6lQWfmCj0gms0YVDfhBt0ed0o1bV3UMFJOpw5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SlJmxXxI; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 391321F00A3A;
	Tue, 26 May 2026 15:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779808033;
	bh=GNEUaTgUduKCWC7EDZ6eJfj3odMHL3iITp4l11LIqaU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=SlJmxXxI88RzVJlPAabUozGkS4tz/EHiQ4IADrsgizjyIXHn4wsfrRX1H/OhNm71x
	 snJ5bcmKyeuJsrWnMZFyONYSc2ufHpZOLeQrsF+XQR6TRsqv9DeeoUqzOfuGE7oG8c
	 xmhzBlVQHLU97JTfW/BWN+IGMSGCD7/MkEh7oSnSsWI8gF6eriWB4jqBS1sRR50pNb
	 +RdJL4dB4LELcHSQ0tIBwkWTi1zum3I6q/bWyENvZEjDHw0ZGChjufC2S/VFYbJz9l
	 YxWpEI367VvWJM8yefiaKPrPQq/GCAMDRvkwWuDb4uO95037rUIeiIoT8D9cCWt1gf
	 pKBiwlV3mclGg==
Date: Tue, 26 May 2026 16:07:05 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Stepan Ionichev <sozdayvek@gmail.com>
Cc: dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org,
 hcazarim@yahoo.com, linux-iio@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: adc: qcom-spmi-iadc: balance enable_irq_wake() on
 driver unbind
Message-ID: <20260526160705.0840c871@jic23-huawei>
In-Reply-To: <20260522155849.12db4923@jic23-huawei>
References: <20260520190924.12774-1-sozdayvek@gmail.com>
	<20260522155849.12db4923@jic23-huawei>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109881-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[baylibre.com,analog.com,kernel.org,yahoo.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jic23@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 920F65D89DC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 22 May 2026 15:58:49 +0100
Jonathan Cameron <jic23@kernel.org> wrote:

> On Thu, 21 May 2026 00:09:24 +0500
> Stepan Ionichev <sozdayvek@gmail.com> wrote:
> 
> > iadc_probe() calls enable_irq_wake() after a successful
> > devm_request_irq(), but the driver has no remove callback or
> > matching disable_irq_wake(), so the wake reference count on the
> > IRQ is leaked on module unload or driver unbind.
> > 
> > Check the IRQ request error first, then register a devm action
> > that calls disable_irq_wake() so the wake reference is released
> > in the same scope as the enable. While here, drop the inverted
> > "if (!ret) ... else return ret" in favour of the standard
> > "if (ret) return ret;" pattern.
> > 
> > Signed-off-by: Stepan Ionichev <sozdayvek@gmail.com>  
> 
> Looks mostly good - one trivial question inline.
> 
> > ---
> >  drivers/iio/adc/qcom-spmi-iadc.c | 18 +++++++++++++++---
> >  1 file changed, 15 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/iio/adc/qcom-spmi-iadc.c b/drivers/iio/adc/qcom-spmi-iadc.c
> > index b64a8a407..0ec3a0c4b 100644
> > --- a/drivers/iio/adc/qcom-spmi-iadc.c
> > +++ b/drivers/iio/adc/qcom-spmi-iadc.c
> > @@ -481,6 +481,11 @@ static const struct iio_chan_spec iadc_channels[] = {
> >  	},
> >  };
> >  
> > +static void iadc_disable_irq_wake(void *data)
> > +{
> > +	disable_irq_wake((unsigned long)data);  
> Why not cast it to an int given that's what disable_irq_wake() takes
> 
> > +}
> > +
> >  static int iadc_probe(struct platform_device *pdev)
> >  {
> >  	struct device_node *node = pdev->dev.of_node;
> > @@ -538,9 +543,16 @@ static int iadc_probe(struct platform_device *pdev)
> >  	if (!iadc->poll_eoc) {
> >  		ret = devm_request_irq(dev, irq_eoc, iadc_isr, 0,
> >  					"spmi-iadc", iadc);
> > -		if (!ret)
> > -			enable_irq_wake(irq_eoc);
> > -		else
> > +		if (ret)
> > +			return ret;
> > +
> > +		ret = enable_irq_wake(irq_eoc);
> > +		if (ret)
> > +			return ret;
> > +
> > +		ret = devm_add_action_or_reset(dev, iadc_disable_irq_wake,
> > +					       (void *)(unsigned long)irq_eoc);  
> 
> What is the unsigned long bit of this cast giving us? Just casting to
> void * should be enough I think.
The answer to this was size mismatch - so I was completely wrong ;(

So as I just replied to v2 this was correct, but could do with
a Fixes tag.

Thanks

Jonathan

> 
> 
> > +		if (ret)
> >  			return ret;
> >  	} else {
> >  		ret = devm_device_init_wakeup(iadc->dev);  
> 
> 


