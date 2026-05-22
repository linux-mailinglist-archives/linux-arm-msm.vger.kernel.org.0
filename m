Return-Path: <linux-arm-msm+bounces-109354-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oP7hAY5wEGqgXQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109354-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 17:04:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 725035B6A18
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 17:04:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0D17530221CB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 14:59:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C4FC3E5A0B;
	Fri, 22 May 2026 14:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Em0Lk6oZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA19426D29;
	Fri, 22 May 2026 14:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779461942; cv=none; b=q3ePBpfdnr17Z0IIq1/ufPkcOTc73a5otVRdRDHYcJAHulpGDmvj7jcXUgDhHAdNG3jRvv2K5dzDJ8jhMNwgVAuqoeE0fvlVHhdtT9eh8qdKXC+4vxsUC7MpXne3/UXOZzWdLWcbNDsfqk9836ZLY1Dv8kZPT2rzm7MU5H2QogU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779461942; c=relaxed/simple;
	bh=dTBggaPQQIYe/9q5m/k/yCP3uTGYN7OVNu7pADBgu7I=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=snehoypoPsYBeGWEnxaBvLGw29LwkA04OC1jn/BHubgeXfznFsUHysXcI93bsYkW0kKBIYvCyiOAmWbzIeQnYd2GVHlBkKyppbCiKakb741GVQdaageVW00W4SHf4+tbM3u0JCO3uzrTRyvAtC5Wf7Tm0zSREBfTrRKQBhhNJ84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Em0Lk6oZ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B9B51F000E9;
	Fri, 22 May 2026 14:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779461938;
	bh=VUrB2bgGfgkXm7DSa2ffSFRUmaYA4SDAGFzKHfjGyyY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Em0Lk6oZacUZcTZB+Sr97QulN6Cj236bzDCJtA/NDgZc/xDLpWBlzGvSEsxvhrA15
	 flRV/tki4cQRl70KtkYLNBQx7wQ9DFuLKZwdMpI5WTsfITFnD/w08wE9WGrL6kuFK7
	 zsI2CynxGmFZK6G/0U48q0lYTUA8+AvMcwtidAyikW6mi1UYBqGUEPDFRmUsfyUlRI
	 1sBVQOsJjRGQ9Uy9b6EeiHcmDWkkPOfeTQ3swVsNDNlnwPsncGYeGGu3aiRM0Jr3I7
	 De2RKxilzolvaqHttLO+3Ok7CpdWytwIsSDO0jE95cvmj2rc+ZTL6u9xjNzn/ioIja
	 HSf0ie6c912dQ==
Date: Fri, 22 May 2026 15:58:49 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Stepan Ionichev <sozdayvek@gmail.com>
Cc: dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org,
 hcazarim@yahoo.com, linux-iio@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: adc: qcom-spmi-iadc: balance enable_irq_wake() on
 driver unbind
Message-ID: <20260522155849.12db4923@jic23-huawei>
In-Reply-To: <20260520190924.12774-1-sozdayvek@gmail.com>
References: <20260520190924.12774-1-sozdayvek@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109354-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 725035B6A18
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 21 May 2026 00:09:24 +0500
Stepan Ionichev <sozdayvek@gmail.com> wrote:

> iadc_probe() calls enable_irq_wake() after a successful
> devm_request_irq(), but the driver has no remove callback or
> matching disable_irq_wake(), so the wake reference count on the
> IRQ is leaked on module unload or driver unbind.
> 
> Check the IRQ request error first, then register a devm action
> that calls disable_irq_wake() so the wake reference is released
> in the same scope as the enable. While here, drop the inverted
> "if (!ret) ... else return ret" in favour of the standard
> "if (ret) return ret;" pattern.
> 
> Signed-off-by: Stepan Ionichev <sozdayvek@gmail.com>

Looks mostly good - one trivial question inline.

> ---
>  drivers/iio/adc/qcom-spmi-iadc.c | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/iio/adc/qcom-spmi-iadc.c b/drivers/iio/adc/qcom-spmi-iadc.c
> index b64a8a407..0ec3a0c4b 100644
> --- a/drivers/iio/adc/qcom-spmi-iadc.c
> +++ b/drivers/iio/adc/qcom-spmi-iadc.c
> @@ -481,6 +481,11 @@ static const struct iio_chan_spec iadc_channels[] = {
>  	},
>  };
>  
> +static void iadc_disable_irq_wake(void *data)
> +{
> +	disable_irq_wake((unsigned long)data);
Why not cast it to an int given that's what disable_irq_wake() takes

> +}
> +
>  static int iadc_probe(struct platform_device *pdev)
>  {
>  	struct device_node *node = pdev->dev.of_node;
> @@ -538,9 +543,16 @@ static int iadc_probe(struct platform_device *pdev)
>  	if (!iadc->poll_eoc) {
>  		ret = devm_request_irq(dev, irq_eoc, iadc_isr, 0,
>  					"spmi-iadc", iadc);
> -		if (!ret)
> -			enable_irq_wake(irq_eoc);
> -		else
> +		if (ret)
> +			return ret;
> +
> +		ret = enable_irq_wake(irq_eoc);
> +		if (ret)
> +			return ret;
> +
> +		ret = devm_add_action_or_reset(dev, iadc_disable_irq_wake,
> +					       (void *)(unsigned long)irq_eoc);

What is the unsigned long bit of this cast giving us? Just casting to
void * should be enough I think.


> +		if (ret)
>  			return ret;
>  	} else {
>  		ret = devm_device_init_wakeup(iadc->dev);


