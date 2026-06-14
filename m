Return-Path: <linux-arm-msm+bounces-113048-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +Ks9J+j6LmqT6wQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113048-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jun 2026 21:03:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A1F681ED2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jun 2026 21:03:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=kG4fdTFi;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113048-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113048-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A6BBA3006957
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jun 2026 19:03:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0FD5256C6C;
	Sun, 14 Jun 2026 19:03:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E649122D4D3;
	Sun, 14 Jun 2026 19:02:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781463780; cv=none; b=GbFL+AC70JV2PuFv08LOx3CxLBxp8QJW8+PYOFHvDOvhOUX5XbuWQQV6DTnlTNAR0QHk4eKjYO2iKHmHIu13cAmwBXgi16btFeLfH1sP5N4oJbfd6PcMihO3U8thWDFEov6S7ORsVJ0KflPpfQlgL0ymXFzbOjdeaRp19RhV4ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781463780; c=relaxed/simple;
	bh=cR0bQ/fQAn1YmlBeX2cniHr+ILp1JeeuSM2XY7vZYKo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=urMpzcjJKqACOVnq9iiWQkp+59Yj+Fkrd2Oj/LWimTVEtfSqcLmg7lY9QrA/5gxvWLnrBtM6F8P0vvJ8RCaOvhUfMW6DYy4jn+1O9QHE0O7xxqQW/netuHuAy7SGZFPVOOcxHHKTxMh7/Out8Ue+Cdn9km60Ed/kBa/4xVdxrhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kG4fdTFi; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84BC01F000E9;
	Sun, 14 Jun 2026 19:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781463779;
	bh=gq2R1f9PKvG4GeQx4qtnQ+1U1ShL/Y2qGYC1zfTULbk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=kG4fdTFi9mSBILAaHp/pxZI8mfYYmRk5YosafQlNkf2qrtpb1bDqwUjABftaMAZ8/
	 WwqXRAiI3Rok9jrHNQqF+UKQvnkgJDuyab6d96wymtswRZWi3XxbT2qj9vDpwvQsrD
	 GkLl7bxeC93CXgjj2Uh8OhpRrsz78s0BAxZJZ6ycjXsyhu8gsXNZ3Km2wtvERXOchJ
	 ujZuXBu8GBmhcbO9qXC+F4KUsgpTOMyC6Uj1VxNFBMO25cF5RouBcgTy6ib1XI2epe
	 uOEN4maBciWZksNPX3tWrFJ22cTxtitiZLwtZNr9EKGu6QHNLR2rMF8VBm1EGnNqap
	 7jDtzXpsdnqrA==
Date: Sun, 14 Jun 2026 20:02:47 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
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
Message-ID: <20260614200247.6a90021f@jic23-huawei>
In-Reply-To: <aisELR6v1EWGcmqb@ashevche-desk.local>
References: <20260526-gen3_adc_tm-v2-0-702fbac919ac@oss.qualcomm.com>
	<20260526-gen3_adc_tm-v2-1-702fbac919ac@oss.qualcomm.com>
	<ah9ouLQFI7VtHCWL@ashevche-desk.local>
	<20260604114630.23ca427a@jic23-huawei>
	<aiGPMqHcz_AkUezI@ashevche-desk.local>
	<d095233e-ac2a-4b50-8a62-29fe1e36c2d1@oss.qualcomm.com>
	<aisELR6v1EWGcmqb@ashevche-desk.local>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113048-lists,linux-arm-msm=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[jic23@kernel.org,linux-arm-msm@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@intel.com,m:jishnu.prakash@oss.qualcomm.com,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:amitk@kernel.org,m:thara.gopinath@gmail.com,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:rui.zhang@intel.com,m:lukasz.luba@arm.com,m:linux-arm-msm@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:kamal.wadhwa@oss.qualcomm.com,m:david.collins@oss.qualcomm.com,m:anjelique.melendez@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:stephan.gerhold@linaro.org,m:tharagopinath@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jic23@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,baylibre.com,analog.com,kernel.org,gmail.com,intel.com,arm.com,vger.kernel.org,linaro.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,jic23-huawei:mid,intel.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E5A1F681ED2

On Thu, 11 Jun 2026 21:53:33 +0300
Andy Shevchenko <andriy.shevchenko@intel.com> wrote:

> On Thu, Jun 11, 2026 at 04:13:07PM +0530, Jishnu Prakash wrote:
> > On 6/4/2026 8:14 PM, Andy Shevchenko wrote:  
> > > On Thu, Jun 04, 2026 at 11:46:30AM +0100, Jonathan Cameron wrote:  
> > >> On Wed, 3 Jun 2026 02:35:20 +0300
> > >> Andy Shevchenko <andriy.shevchenko@intel.com> wrote:  
> > >>> On Tue, May 26, 2026 at 04:26:09PM +0530, Jishnu Prakash wrote:  
> 
> ...
> 
> > >>>> +	ret = devm_request_threaded_irq(dev, adc->dev_data.base[ADC5_GEN3_VADC_SDAM].irq,
> > >>>> +					NULL, adc5_gen3_isr, IRQF_ONESHOT | IRQF_SHARED,
> > >>>> +					adc->dev_data.base[ADC5_GEN3_VADC_SDAM].irq_name,
> > >>>> +					adc);
> > >>>>  	if (ret)
> > >>>>  		return dev_err_probe(dev, ret,
> > >>>>  				     "Failed to request SDAM%d irq\n",    
> > >>>
> > >>> Also add a patch to drop this duplicate message.  
> > >>
> > >> There is another thread going on this.  It might not be duplicate
> > >> if -EPROBE_DEFER is returned.  The message won't be printed but it
> > >> will be logged for helping debug deferred probe reasons.  
> > > 
> > > Yes, and I explained that it is duplicated as long as I understand current
> > > code base.  
> > 
> > After I checked for Andy's first comment, my understanding was that
> > devm_request_threaded_irq would internally call dev_err_probe in case
> > of an error, so this dev_err_probe print above would not be needed.  
> 
> Correct.

Ah. I'd missed that wrapper devm_request_result()

Thanks!

> 
> > Please let me know if it's better to keep or remove this print.  
> 
> You already know my position here :-)
> 
> > And if I make the change, shall I add it in a separate patch
> > before or after this patch in the next series?  
> 
> The rule of thumb is to make sure your series won't do ping-pong type of
> changes: when one patch introduces (or moves) some code that is removed or
> modified in different way by another patch in the same series.
> 
> > >> So maybe we have been a little too energetic in removing these.  
> > > 
> > > Or maybe sashiko consumed a bit of LSD :-)  
> 


