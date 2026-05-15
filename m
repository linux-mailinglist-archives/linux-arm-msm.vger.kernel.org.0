Return-Path: <linux-arm-msm+bounces-107931-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QAvLOekoB2ppsQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107931-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 16:08:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 67147551052
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 16:08:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A7442305B9B2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 13:55:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4F2F481AA3;
	Fri, 15 May 2026 13:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l/fRDR4U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F41449EB6;
	Fri, 15 May 2026 13:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778853302; cv=none; b=lP+Umx6Y/7cf066N5eErkujGInrDxG8CAKwaf4dQaVmADbqO5vKy4O9mvDksK+MnUKoGQ8kX9HnTEFFubakE4/qgtRLmhTPPk5JI7ravRSMWPNTiYNA0QMaa7Mi/R3/GSpygPAP2icVdhN2S37HHsRRyFvKu/vgG1nf3LmnrCLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778853302; c=relaxed/simple;
	bh=YEw8QsNbTR0Bjj5KFEn2xnY8kv81Y3WRy0+A343Zzdw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e1tbh2sZO5BTslv3PvYxR7OceuziVAQZDPAXxFzfc0Zi+toAQO8A/xVcgf2p9ULLVwmTv2qw4boSXOznYYdauu6Ee7Gbn1LuVQgi4xPqi5ZZL2zcJD7px4JB/yb2vFpxmybBj7jbppkvflnbNT9n034RpT4xk/nlSVcoWk4kfEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l/fRDR4U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54994C2BCB0;
	Fri, 15 May 2026 13:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778853302;
	bh=YEw8QsNbTR0Bjj5KFEn2xnY8kv81Y3WRy0+A343Zzdw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=l/fRDR4UWYXrQmT8brio4XNBW6Hu3zhuxgNUUKbDQ8EM5WB6hbmxI3bKQcPClBpu+
	 dQ7GXzFaNFSo2IQ5eaN/yavI7W5WnDBU5ssi84pMsG/ixUOtSgPy3k+vrFeD3FL9Zt
	 zTu3XlmdN28F2n5hRLIf+Rxa8Ls2KBL7K+/46yTp3PfKJAsbuvE0hT2HzQKQAdhH7m
	 MSnd6fW4lK7/NbjQYyefHh6YtgnVJ1U12JUo4IThuD1goIYW4NMU2XsmPCtOtm6iTX
	 GLMYXGZ0GCHWkFcbEsBtdfzYMuaEbHsj21SMG60dJJtVXnozdj+UKQDWO2y87tpGfC
	 gFPHyZg69X/3A==
Date: Fri, 15 May 2026 14:54:50 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Cc: David Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Amit Kucheria
 <amitk@kernel.org>, Thara Gopinath <thara.gopinath@gmail.com>, "Rafael J.
 Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
 linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, Kamal Wadhwa
 <kamal.wadhwa@oss.qualcomm.com>, David Collins
 <david.collins@oss.qualcomm.com>, Anjelique Melendez
 <anjelique.melendez@oss.qualcomm.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Stephan Gerhold <stephan.gerhold@linaro.org>
Subject: Re: [PATCH 1/2] iio: adc: qcom-spmi-adc5-gen3: Share SDAM0 IRQ with
 ADC_TM auxiliary driver
Message-ID: <20260515145450.3b1e9c3d@jic23-huawei>
In-Reply-To: <20260515-gen3_adc_tm-v1-1-39ba29f9b4ab@oss.qualcomm.com>
References: <20260515-gen3_adc_tm-v1-0-39ba29f9b4ab@oss.qualcomm.com>
	<20260515-gen3_adc_tm-v1-1-39ba29f9b4ab@oss.qualcomm.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 67147551052
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107931-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jic23@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[baylibre.com,analog.com,kernel.org,gmail.com,intel.com,arm.com,vger.kernel.org,oss.qualcomm.com,linaro.org];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,sashiko.dev:url]
X-Rspamd-Action: no action

On Fri, 15 May 2026 14:23:44 +0530
Jishnu Prakash <jishnu.prakash@oss.qualcomm.com> wrote:

> The SDAM0 IRQ can be triggered for both EOC (end of conversion) events for
> immediate ADC reads done in this driver and for threshold violation events,
> based on ADC_TM thresholds configured from the auxiliary ADC_TM driver on
> TM channels on the first SDAM.
> 
> At present, this interrupt is handled only in the ISR in the main ADC driver.
> When the ISR is triggered for an ADC_TM event, this driver notifies the ADC_TM
> driver by calling a notifier callback exposed from it for this purpose.
> 
> To simplify the interrupt handling in both drivers, share the interrupt between
> the drivers. With this, ADC_TM interrupts on SDAM0 will be handled directly in
> the ADC_TM driver, so remove the notifier callback and all TM interrupt
> handling in the main ADC ISR.
> 
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> ---

Some stuff from Sashiko on this one:
https://sashiko.dev/#/patchset/20260515-gen3_adc_tm-v1-0-39ba29f9b4ab%40oss.qualcomm.com

Given I assume you didn't see the warning (I'm fairly sure the bots analysis is correct
as we've been busy fixing similar cases all cycle), can I just check, have you tested
this on latest upstream?

Thanks,

Jonathan


>  drivers/iio/adc/qcom-spmi-adc5-gen3.c         | 52 +++++----------------------
>  include/linux/iio/adc/qcom-adc5-gen3-common.h |  2 --
>  2 files changed, 8 insertions(+), 46 deletions(-)
> 
> diff --git a/drivers/iio/adc/qcom-spmi-adc5-gen3.c b/drivers/iio/adc/qcom-spmi-adc5-gen3.c
> index f8168a14b907..a819c3e627a0 100644
> --- a/drivers/iio/adc/qcom-spmi-adc5-gen3.c
> +++ b/drivers/iio/adc/qcom-spmi-adc5-gen3.c

>  static int adc5_gen3_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -818,7 +782,7 @@ static int adc5_gen3_probe(struct platform_device *pdev)
>  	}
>  
>  	ret = devm_request_irq(dev, adc->dev_data.base[ADC5_GEN3_VADC_SDAM].irq,
> -			       adc5_gen3_isr, 0,
> +			       adc5_gen3_isr, IRQF_ONESHOT | IRQF_SHARED,

Sashikio points out that IRQF_ONESHOT is never correct for a non threaded
interrupt.  The point of that flag is to ensure we don't handle another interrupt
until the thread is done. If there isn't a thread then it doesn't do anything
(other than omit a warning!)

>  			       adc->dev_data.base[ADC5_GEN3_VADC_SDAM].irq_name,
>  			       adc);
>  	if (ret)
> diff --git a/include/linux/iio/adc/qcom-adc5-gen3-common.h b/include/linux/iio/adc/qcom-adc5-gen3-common.h
> index 6303eaa6640b..39cbfcbdb101 100644
> --- a/include/linux/iio/adc/qcom-adc5-gen3-common.h
> +++ b/include/linux/iio/adc/qcom-adc5-gen3-common.h
> @@ -205,7 +205,5 @@ int adc5_gen3_get_scaled_reading(struct device *dev,
>  int adc5_gen3_therm_code_to_temp(struct device *dev,
>  				 struct adc5_channel_common_prop *common_props,
>  				 u16 code, int *val);
> -void adc5_gen3_register_tm_event_notifier(struct device *dev,
> -					  void (*handler)(struct auxiliary_device *));
>  
>  #endif /* QCOM_ADC5_GEN3_COMMON_H */
> 


