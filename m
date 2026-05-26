Return-Path: <linux-arm-msm+bounces-109880-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qIJKEnu8FWrKYQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109880-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 17:30:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 483CA5D8BE2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 17:30:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B697C3017CF9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 15:09:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AABE1403EA5;
	Tue, 26 May 2026 15:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FN8vGXLp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3DA3FE665;
	Tue, 26 May 2026 15:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779807984; cv=none; b=qqygjvdD4n9WbBZvrmH79DVOBxo5fAOKCHSKWFErr3naLTkb6oM/h2QOLny+4RTKi81phG30y9ySyo//du9aF+JesR7Cjf+qq+aRj9su1b7sm1WaJv7X8c6P4Ct30nzaYKCnWR7ZOIY+XGThalK+HCIHVDyD7VlQ8T8O3fdyyFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779807984; c=relaxed/simple;
	bh=EoQXQBZNIJ8lODxQ3PZ1MdvJMBMfJYZKhsYOlNqhbOA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oPglqQ+KJD4MgFyH1hDePxIanYHd6A5iVQSEucsqPMVa5mEQ3r7JvFBTOwVA6GJcCLOpz5WZqcVOtr6o0f5YoqHTEwCdd1ohvaSLsVlvjkU8HR8yvo268lIUJN3h4TEF3S+3b62mk4eoZvc5Y4GLVlPOQYELv6KZGBi67zs83js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FN8vGXLp; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B728E1F000E9;
	Tue, 26 May 2026 15:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779807982;
	bh=eR2QA/hx/p9cXsygu0QQGv6Y1c4HMmBc5hC9ggjuKKI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=FN8vGXLp6c/aIsg78PfyxqcaQZU+OqU5fNKBxoeiVF2NAVqYuwcjKapcglqCOrzaz
	 fx9QJqFwHHBz0x5QkfTEAvGs7FkUYNICMzNB1vVcjehQBtNNJIqypvuI/S0V//xswt
	 lEhYFpblHzQH3Iu5oOrIAjWDwioCfaLRugAD3bc1RihA7JEweQ/QVwm/RhxqoXdWEK
	 pLoXDgt9PZikStk7hVcx7UoQfEXLb1d4qe9ZxCFpcB40pRldv7S5EFdlQJZAV+i9i6
	 rTWzJ0VIvAhKcz1O1DcPB5e478v3bVgBlI7JVXlX9Pp2ebj/5P4wJw+0h9Yc5JL9hB
	 sLocPTFdTLTbg==
Date: Tue, 26 May 2026 16:06:13 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Stepan Ionichev <sozdayvek@gmail.com>
Cc: dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org,
 hcazarim@yahoo.com, linux-iio@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] iio: adc: qcom-spmi-iadc: balance enable_irq_wake()
 on driver unbind
Message-ID: <20260526160613.4a3ed41e@jic23-huawei>
In-Reply-To: <20260523134613.4930-1-sozdayvek@gmail.com>
References: <20260523134613.4930-1-sozdayvek@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109880-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 483CA5D8BE2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, 23 May 2026 18:46:13 +0500
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
> ---
> v2:
> - Use (long) instead of (unsigned long) for the int<->void* casts (Jonathan)

Ah. I think this was me being wrong on necessity of original casts..

patch v1 was fine in this respect.. Sorry for waste of time!

One other thing though - seems like a fix so why no Fixes tag?

Jonathan



> 
> v1: https://lore.kernel.org/all/20260520190924.12774-1-sozdayvek@gmail.com/
> 
>  drivers/iio/adc/qcom-spmi-iadc.c | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/iio/adc/qcom-spmi-iadc.c b/drivers/iio/adc/qcom-spmi-iadc.c
> index b64a8a407..88f6be210 100644
> --- a/drivers/iio/adc/qcom-spmi-iadc.c
> +++ b/drivers/iio/adc/qcom-spmi-iadc.c
> @@ -481,6 +481,11 @@ static const struct iio_chan_spec iadc_channels[] = {
>  	},
>  };
>  
> +static void iadc_disable_irq_wake(void *data)
> +{
> +	disable_irq_wake((long)data);
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
> +					       (void *)(long)irq_eoc);
> +		if (ret)
>  			return ret;
>  	} else {
>  		ret = devm_device_init_wakeup(iadc->dev);


