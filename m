Return-Path: <linux-arm-msm+bounces-113049-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Ax7DKcb7Lmra6wQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113049-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jun 2026 21:06:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 41861681EEB
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jun 2026 21:06:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=JvGXkcTy;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113049-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113049-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A0FE9300102A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jun 2026 19:06:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BFEA280CE5;
	Sun, 14 Jun 2026 19:06:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5832C23AE62;
	Sun, 14 Jun 2026 19:06:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781464003; cv=none; b=ei+MJEEu/YYPENPAqTreLnUe6HIeUt8Whu22DNKfQN9DtPwtkjQvvb+Q3T4+YpHwmyqnLy2e7DLfLCuDjN5Ql/R+tsg2ljLRlqBHTftKgCzhf4enuBA/Men6SMGY+OjDNCMPHHvqIVPmQJU/qXsKK38Pyb7w7iksv42IKpEinr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781464003; c=relaxed/simple;
	bh=hhKZmyCl1nlGbiSgRi6ImyY7Yqw8WFjGuQaj8NpEvnE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=csvn11MjKHZRsXETTuWvIDFmDrTxMp2OvCGtbTBTJsxZiAStPnpFZa9lWvPBxzcvlH8y2+njSeqiSgh9TIQIw4B0NWNCwmnIQCCS/MbiUn0TDvSjzAk1Tt3X+15CByyiSd3sDzFz4BQx9spZEtp6y80NIGo0P6YnDG1hwvXeuTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JvGXkcTy; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B1241F000E9;
	Sun, 14 Jun 2026 19:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781464002;
	bh=/VXI67DOMw8cHtqaIo95wnFIHVXV1YBH75iWiT6gYus=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=JvGXkcTyauddm+aN+4xKc5839Gd9wa/VspObJOABk7DcvqpnvBBuk3Hv+SoI8OMFW
	 r8N/bO9tT8PuZyYqdNh+py/lfqHFqMc98n79O5xqpybLrEHAIw2WDmqRdMZyqrnZwA
	 5ohztof/Sg2BKNQv9qVF2jTzRvOf1f1GPxZ7yHfslrMEkCDiopxnRxSOgiX9gD7E1F
	 xle7//iqSPS7BKLakB5h6K1IxPafP5IYGx0dATU1yObrKiCuXBeexud/CJNllzH7eE
	 BbPel9Y/WBOhzh64JYFx0VbvzE4qGQti5HQiEG6juDEhZF25h5EBwvQdm1FTg5ZgLi
	 ifNwcTh3pNtEQ==
Date: Sun, 14 Jun 2026 20:06:30 +0100
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
Subject: Re: [PATCH v2 2/2] thermal: qcom: add support for PMIC5 Gen3 ADC
 thermal monitoring
Message-ID: <20260614200630.2ea04817@jic23-huawei>
In-Reply-To: <27631a0f-b5ba-4181-94f9-aa7726a4054b@oss.qualcomm.com>
References: <20260526-gen3_adc_tm-v2-0-702fbac919ac@oss.qualcomm.com>
	<20260526-gen3_adc_tm-v2-2-702fbac919ac@oss.qualcomm.com>
	<20260527124220.39ac0b64@jic23-huawei>
	<27631a0f-b5ba-4181-94f9-aa7726a4054b@oss.qualcomm.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113049-lists,linux-arm-msm=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[jic23@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:jishnu.prakash@oss.qualcomm.com,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:amitk@kernel.org,m:thara.gopinath@gmail.com,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:rui.zhang@intel.com,m:lukasz.luba@arm.com,m:linux-arm-msm@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:kamal.wadhwa@oss.qualcomm.com,m:david.collins@oss.qualcomm.com,m:anjelique.melendez@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:stephan.gerhold@linaro.org,m:tharagopinath@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jic23@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[baylibre.com,analog.com,kernel.org,gmail.com,intel.com,arm.com,vger.kernel.org,oss.qualcomm.com,linaro.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,jic23-huawei:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 41861681EEB


> >> +static irqreturn_t adctm5_gen3_isr_thread(int irq, void *dev_id)
> >> +{
> >> +	struct adc_tm5_gen3_chip *adc_tm5 = dev_id;
> >> +	int sdam_index = -1;
> >> +	u8 tm_status[2] = { };
> >> +	u8 buf[16] = { };
> >> +
> >> +	for (int i = 0; i < adc_tm5->nchannels; i++) {
> >> +		struct adc_tm5_gen3_channel_props *chan_prop = &adc_tm5->chan_props[i];
> >> +		int offset = chan_prop->tm_chan_index;
> >> +		bool upper_set, lower_set;
> >> +		int ret;
> >> +
> >> +		scoped_guard(adc5_gen3, adc_tm5) {
> >> +			if (chan_prop->sdam_index != sdam_index) {
> >> +				sdam_index = chan_prop->sdam_index;
> >> +				ret = adc5_gen3_tm_status_check(adc_tm5, sdam_index,
> >> +								tm_status, buf);  
> > 
> > I think the clear of other sdam interrupt status that sashiko was pointing out
> > is here as somewhat unexpectedly a function called status_check clears as well.
> >   
> 
> This is the full comment from Sashiko at this point:
> 
> > "Does the threaded handler clear statuses across all SDAMs indiscriminately?  
> 
> > Since this thread loops over all channels and clears the high status on any
> > SDAM with an active event, could it clear a pending event on a different SDAM
> > than the one that triggered the IRQ?  
> 
> > Because each SDAM has its own independent IRQ line, if the thread clears a
> > pending event on SDAM 1 while servicing SDAM 0, couldn't SDAM 1's subsequent
> > hardirq read a status of 0 and return IRQ_NONE? Could repeated IRQ_NONE
> > returns cause the IRQ subsystem to shut down SDAM 1's interrupt line as a
> > spurious interrupt storm?"  
> 
> This sequence of events can happen, but it should not be an issue.
> 
> It is possible that the threaded handler is called for servicing an
> interrupt on SDAM0, and in the loop there is a violation detected on
> a TM channel on SDAM1, and the SDAM1 TM status is cleared. But in this
> case, this violation would also be handled after we notify the thermal
> framework at the end of the loop, by some threshold update or disablement.
> 
> Even if the subsequent hardirq fires for SDAM1 and it returns IRQ_NONE
> as the TM status was cleared, the violation would have been handled
> by some threshold update, so the interrupt would not keep getting
> triggered afterwards for the same threshold's violation.
> 
> 
> I also checked the conditions from note_interrupt() in kernel/irq/spurious.c,
> for enough repeated IRQ_NONE returns to happen to cause a spurious interrupt
> disablement. 
> It looks like there needs to be more than one interrupts returning IRQ_NONE
> within 0.1 second to increment the irqs_unhandled counter once, but there can be
> at most one TM interrupt in one second since we set the time period of
> recurring TM measurement as one second here in the probe:
> 
> 		adc_tm5->chan_props[i].timer = MEAS_INT_1S;
> 
> So a spurious interrupt storm is not possible here.

Whilst sounds valid, it's a convoluted argument given it relies
on us getting spurious interrupts reported, but not enough to trigger
the stuff to stop interrupt storms. The rules around that may change
in future given it's a heuristic to stop us seeing problems on dodgy
hardware.

Can we just avoid handling interrupts for SDAMs that weren't the one that
triggered this particular interrupt?

Thanks,

Jonathan



