Return-Path: <linux-arm-msm+bounces-109990-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8L92GgDVFmq+swcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109990-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 13:26:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D73B5E358F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 13:26:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 35A48300E91B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 11:26:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 751963F39EA;
	Wed, 27 May 2026 11:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HAnJhGEI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F153E0098;
	Wed, 27 May 2026 11:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779881203; cv=none; b=lR0WTNmH4qBzWfu43I2b0y6YsFdT4JdIF7qm6BM0r8osthJJLE/kFtGuQRkix36bHVjnujHgbMVorCGVVMNSdJUg4LzupWggnAimdl7yn/5qFX1aM6RjRuQa1wz+W/cRLbDq37KedHVR+2K8N05OjQl/2+i2tOSGbCumblnMIa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779881203; c=relaxed/simple;
	bh=PqKZLuWdWewftCbi4vPijojHytUQ2bIPSzU7BuhdfTY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Nbr+qvmxGjRNcFtdLYca5dJhNzTPrU+GVzBWeqpG+zhHI1E6EMlG2MDo1zRbhwVEiHfXg/kFXyzg4aK3G5DG0jj/GXikSv7/a0bquz2l0bGgELKKgYp+84wtZn6w7SC6gT01xAw1cOryIhIUM7RLd9SrZmVckd5t599Cqf4m35I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HAnJhGEI; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D875E1F000E9;
	Wed, 27 May 2026 11:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779881202;
	bh=jDHD9HhlASWyS8XroexzHUYcSd3EZYj2pT7cqeXO1n4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=HAnJhGEI86ar6UJcQZrt/6Z8kaTcEBe+wA9ZDgg+s/jTXn7PyYkxCyqcgrxBx8NVA
	 EopuUAzPrJI3PoP17gVhrhZuJLmRdKCXkZkiYaZa3fR943Mz1WruIQS9HKkzEQskaD
	 Yt26fpEoD3hURJFngIZfl0d4/hdIQKSMcfqMJOOadORZStiZpQGV5L2fKRWxMIJ9cN
	 kS/Y96GJ4wwCbF8P5UI4DZi9DwJRQ14/VuSiTvJIc0Qd4EySuAQE4GGEYQInxKdGfc
	 +ulyrM5tEZu+mFTBMQfviTvpjxXYOaBoxE992uRAJXoXoJuKvwedRdKImdfqSTaUiR
	 RBvdbCtBbqJ7w==
Date: Wed, 27 May 2026 12:26:28 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>, David Lechner
 <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy
 Shevchenko <andy@kernel.org>, Amit Kucheria <amitk@kernel.org>, Thara
 Gopinath <thara.gopinath@gmail.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui
 <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
 linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, Kamal Wadhwa
 <kamal.wadhwa@oss.qualcomm.com>, David Collins
 <david.collins@oss.qualcomm.com>, Anjelique Melendez
 <anjelique.melendez@oss.qualcomm.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Stephan Gerhold <stephan.gerhold@linaro.org>
Subject: Re: [PATCH v2 1/2] iio: adc: qcom-spmi-adc5-gen3: Share SDAM0 IRQ
 with ADC_TM auxiliary driver
Message-ID: <20260527122628.3c8cc8a2@jic23-huawei>
In-Reply-To: <3584c4eb-1d9e-468f-bd30-9b5d91c865af@oss.qualcomm.com>
References: <20260526-gen3_adc_tm-v2-0-702fbac919ac@oss.qualcomm.com>
	<20260526-gen3_adc_tm-v2-1-702fbac919ac@oss.qualcomm.com>
	<3584c4eb-1d9e-468f-bd30-9b5d91c865af@oss.qualcomm.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109990-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jic23@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,baylibre.com,analog.com,kernel.org,gmail.com,intel.com,arm.com,vger.kernel.org,linaro.org];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 6D73B5E358F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 26 May 2026 15:12:30 +0200
Daniel Lezcano <daniel.lezcano@oss.qualcomm.com> wrote:

> Hi Andy, Johnathan,
> 
> On 5/26/26 12:56, Jishnu Prakash wrote:
> > The SDAM0 IRQ can be triggered for both EOC (end of conversion) events for
> > immediate ADC reads done in this driver and for threshold violation events,
> > based on ADC_TM thresholds configured from the auxiliary ADC_TM driver on
> > TM channels on the first SDAM.
> > 
> > At present, this interrupt is handled only in the ISR in the main ADC driver.
> > When the ISR is triggered for an ADC_TM event, this driver notifies the ADC_TM
> > driver by calling a notifier callback exposed from it for this purpose.
> > 
> > To simplify the interrupt handling in both drivers, share the interrupt between
> > the drivers. With this, ADC_TM interrupts on SDAM0 will be handled directly in
> > the ADC_TM driver, so remove the notifier callback and all TM interrupt
> > handling in the main ADC ISR.  
> 
> Given the nature of these changes reworking how is handled the interrupt 
> to share it properly with the TM sensor and the dependency of patch 2 on 
> this one, I think it makes sense to merge these two patches through the 
> thermal tree. Are you fine with that ?

Yes, but perhaps not just yet: 
https://sashiko.dev/#/patchset/20260526-gen3_adc_tm-v2-0-702fbac919ac%40oss.qualcomm.com
Has some stuff beyond the usual other things I found whilst here that look plausible
from a first glance.

The one about clearing irqs from other SDAMS potentially leading to repeated IRQ_NONE
and disabling of an sdam interrupt seems correct to me - but maybe I'm missing something!

Jonathan



