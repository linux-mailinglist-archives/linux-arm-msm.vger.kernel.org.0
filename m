Return-Path: <linux-arm-msm+bounces-98783-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0DNcJ0USvGnbrwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98783-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 16:12:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A65B2CD79D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 16:12:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B07FB30054EC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 15:12:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F4903DE437;
	Thu, 19 Mar 2026 15:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jIJM84bW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA61F3DFC75;
	Thu, 19 Mar 2026 15:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773933121; cv=none; b=tSFEGscnb45+KXN4uFpqPOxJEs9b/Y8yjJjRZUY84D02OkqHaupjkZC7WloM0TpS2XnwnmKXzyY2A/gi2zYSXKURtPYIDpR+A0iaEtsp5yEv7+T4VZE5IR+rmYBd6l5ESXXFS9Le6YZMqrdfvz125TTHPRNZIL7Vwn+woFie3gY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773933121; c=relaxed/simple;
	bh=UX9bnwd/iOEELMYCow66V4EiBuo/TPrF6n7M8pxHr58=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YdOPSbzrVc9HUVraqalEIN6LJ68nJpNsIuOils1tZ6RFCTYRDm380Up2vhelOMZNkrO0UCmlPS2I/rCrkQ52vSdbRwrdJ/bM+XAUvHaWXjvuK7RUNrP0S1s/P4uVF7cC9uPeI1J4zhfDqGpK030YD3cG1eE0RDU73NWNL2AK6uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jIJM84bW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C9CBC19424;
	Thu, 19 Mar 2026 15:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773933120;
	bh=UX9bnwd/iOEELMYCow66V4EiBuo/TPrF6n7M8pxHr58=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jIJM84bW79Px6PgBLe3udUr0KpystcPIgPvi3YneDh6SYID/OimOMS9WGfsz4k/f6
	 rzqU56knhxoL8U+7INgxmgMQbUezs+2nPzVcUsoW0l3pK3gPqNeNJlx4OxA0lrrjGI
	 NEBT6Y7vhetQYaZjFrtp+GgknzZI+SFw7kQHfSz1K9QZW3A0Mac9vKGQ8SMkCmQZkL
	 rFi6jlvgJ9yGXL/YSN5gkIY9lDIw4uVl931vN8xWWpgeokREUvUBJEmPVJZIP/Q8S3
	 VnBHEzA4eLhaKkhsTGkT6Ekerjyq8aPK1AlV7g1fAaYkQBeoQP9szSzG4z7aeI75lg
	 SHfVLblJI91+Q==
Date: Thu, 19 Mar 2026 15:11:54 +0000
From: Lee Jones <lee@kernel.org>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mfd: wcd934x: Unroll regmap and irqchip on removal
Message-ID: <20260319151154.GM554736@google.com>
References: <20260309-wcd934x-unroll-regmap-v1-1-9a5fb305540e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260309-wcd934x-unroll-regmap-v1-1-9a5fb305540e@oss.qualcomm.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98783-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 4A65B2CD79D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 09 Mar 2026, Bjorn Andersson wrote:

> When the slimbus-up event is handled a new regmap is created, an IRQ
> chip is registered on this regmap and then the MFD devices are added.
> 
> But the regmap is left dangling if either any of those operations are
> failing or if the slimbus-down event ever comes. Which manifest itself
> as an error print from debugfs once the next slimbus-up event happens.
> 
> Likewise, if for some reason a slimbus-down event would be followed by
> a slimbus-up event without the MFD being torn down by the slimbus
> controller inbetween, we're going to have a dangling irq_chip.
> 
> Add cleanup of the registered resources on failure and on removal.
> 
> Fixes: 6ac7e4d7ad70 ("mfd: wcd934x: Add support to wcd9340/wcd9341 codec")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---
>  drivers/mfd/wcd934x.c | 49 ++++++++++++++++++++++++++++++++++++++-----------
>  1 file changed, 38 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/mfd/wcd934x.c b/drivers/mfd/wcd934x.c
> index 3c3080e8c8cf7ecaaa62e255c7e01a850e65e9ad..b03cc91cc3a6a114a34efdb278420ae3dfa016eb 100644
> --- a/drivers/mfd/wcd934x.c
> +++ b/drivers/mfd/wcd934x.c
> @@ -170,29 +170,56 @@ static int wcd934x_slim_status_up(struct slim_device *sdev)
>  	ret = wcd934x_bring_up(ddata);
>  	if (ret) {
>  		dev_err(dev, "Failed to bring up WCD934X: err = %d\n", ret);
> -		return ret;
> +		goto err_regmap_exit;
>  	}
>  
> -	ret = devm_regmap_add_irq_chip(dev, ddata->regmap, ddata->irq,
> -				       IRQF_TRIGGER_HIGH, 0,
> -				       &wcd934x_regmap_irq_chip,
> -				       &ddata->irq_data);
> +	ret = regmap_add_irq_chip(ddata->regmap, ddata->irq,
> +				  IRQF_TRIGGER_HIGH, 0,
> +				  &wcd934x_regmap_irq_chip,
> +				  &ddata->irq_data);
>  	if (ret) {
>  		dev_err(dev, "Failed to add IRQ chip: err = %d\n", ret);
> -		return ret;
> +		goto err_regmap_exit;
>  	}
>  
>  	ret = mfd_add_devices(dev, PLATFORM_DEVID_AUTO, wcd934x_devices,
>  			      ARRAY_SIZE(wcd934x_devices), NULL, 0, NULL);
>  	if (ret) {
> -		dev_err(dev, "Failed to add child devices: err = %d\n",
> -			ret);
> -		return ret;
> +		dev_err(dev, "Failed to add child devices: err = %d\n", ret);
> +		goto err_del_irq_chip;
>  	}
>  
> +	return 0;
> +
> +err_del_irq_chip:
> +	regmap_del_irq_chip(ddata->irq, ddata->irq_data);
> +	ddata->irq_data = NULL;
> +err_regmap_exit:
> +	regmap_exit(ddata->regmap);
> +	ddata->regmap = NULL;
>  	return ret;
>  }
>  
> +static void wcd934x_slim_status_down(struct slim_device *sdev)
> +{
> +	struct device *dev = &sdev->dev;
> +	struct wcd934x_ddata *ddata;
> +
> +	ddata = dev_get_drvdata(dev);

Is this guaranteed to be populated?

If this fails for any reason, we'll nul-ptr-deref below.

> +	mfd_remove_devices(&sdev->dev);
> +
> +	if (ddata->irq_data) {
> +		regmap_del_irq_chip(ddata->irq, ddata->irq_data);
> +		ddata->irq_data = NULL;
> +	}
> +
> +	if (ddata->regmap) {
> +		regmap_exit(ddata->regmap);
> +		ddata->regmap = NULL;
> +	}
> +}

[...]

-- 
Lee Jones [李琼斯]

