Return-Path: <linux-arm-msm+bounces-111176-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GDUpJLNXIWprEQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111176-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 12:47:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EA56A63F2C7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 12:47:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=mMFNHt72;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111176-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111176-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A8AB83028EC2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 10:46:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ED69405C42;
	Thu,  4 Jun 2026 10:46:45 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6A52ED848;
	Thu,  4 Jun 2026 10:46:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780570005; cv=none; b=UJdCrwoccockq0P1B99yzgG7p0zbSOvgGmtyOjW0UoJSdgbpx44YYwHdgCpksz/MOgjRs9grW/ff/0rqZmsgx5R9PZ3XX6HkV4NHQa1bLVPIbEGVjYKH2J+E8rg/Jv68RPLF6Tih2+pnd7Wz2c9e2dAC7P5UsAIfj0p8zygdjd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780570005; c=relaxed/simple;
	bh=biiRY84vnYMb5PbMnT2Tgh+oJNQYMtRjO3yfY9cGl2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W7YVBotgT4byVakg6R1WZk/Tu1KfSA2JOo1RK2XQebTsJA0KpfFd/xTHAt5dUPcp+Q9PEyDIehPSbb6ZRHkekGXnnLggTdngwQvsLPqBj1a+bExcxxmAR7gySwFvy7mc8tXCnZY15hhKTH83zouIl0OVzfBjSBsL0gJDwgs5Qik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mMFNHt72; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52C4B1F00893;
	Thu,  4 Jun 2026 10:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780570003;
	bh=FOme6FGys2fI4Tk2hmHNWSvY6xaDpJ6qGZkN/RcDCTI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=mMFNHt72qrquxGmmCXZZA1e8HzZncvYR4s1rKQ9JJ7E51LqzroMv6dUPl/+EvHRRX
	 +i060RL4+TDq293fspO/Hw5ew2qhYVvA/+j7Mv1Igbqe7Nd71abJ3mgjgbTg/xLgVR
	 dpzX2hTBerXvJMQC+ODxYhAleonMuvSg28Uj/Yrf8uwd7myg0Jk/IUrvmP7tTfrr1N
	 MjLary/2OxvlHx81VZN6zzGmHZg+XVBZf7jEZHdANpKaHDGUXkvwklru3BuSYDYQym
	 9LzBH9SwgAPmilj/Br2v0WpO04kHdj0o54METH9DenfuuzrVGQXhyzsrHTLeKfO9Se
	 GQrLsDToVaesA==
Date: Thu, 4 Jun 2026 11:46:30 +0100
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
Message-ID: <20260604114630.23ca427a@jic23-huawei>
In-Reply-To: <ah9ouLQFI7VtHCWL@ashevche-desk.local>
References: <20260526-gen3_adc_tm-v2-0-702fbac919ac@oss.qualcomm.com>
	<20260526-gen3_adc_tm-v2-1-702fbac919ac@oss.qualcomm.com>
	<ah9ouLQFI7VtHCWL@ashevche-desk.local>
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
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111176-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[jic23@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@intel.com,m:jishnu.prakash@oss.qualcomm.com,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:amitk@kernel.org,m:thara.gopinath@gmail.com,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:rui.zhang@intel.com,m:lukasz.luba@arm.com,m:linux-arm-msm@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:kamal.wadhwa@oss.qualcomm.com,m:david.collins@oss.qualcomm.com,m:anjelique.melendez@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:stephan.gerhold@linaro.org,m:tharagopinath@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jic23@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,baylibre.com,analog.com,kernel.org,gmail.com,intel.com,arm.com,vger.kernel.org,linaro.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EA56A63F2C7

On Wed, 3 Jun 2026 02:35:20 +0300
Andy Shevchenko <andriy.shevchenko@intel.com> wrote:

> On Tue, May 26, 2026 at 04:26:09PM +0530, Jishnu Prakash wrote:
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
> ...
> 
> > +	/*
> > +	 * This interrupt is shared with the ADC_TM auxiliary driver, which
> > +	 * is threaded and uses IRQF_ONESHOT. Since shared interrupts need
> > +	 * to agree on IRQF_ONESHOT configuration and there is a kernel
> > +	 * warning for using IRQF_ONESHOT with non-threaded interrupts,
> > +	 * make this also a threaded IRQ.
> > +	 */
> > +
> > +	ret = devm_request_threaded_irq(dev, adc->dev_data.base[ADC5_GEN3_VADC_SDAM].irq,
> > +					NULL, adc5_gen3_isr, IRQF_ONESHOT | IRQF_SHARED,
> > +					adc->dev_data.base[ADC5_GEN3_VADC_SDAM].irq_name,
> > +					adc);
> >  	if (ret)
> >  		return dev_err_probe(dev, ret,
> >  				     "Failed to request SDAM%d irq\n",  
> 
> Also add a patch to drop this duplicate message.
> 

There is another thread going on this.  It might not be duplicate
if -EPROBE_DEFER is returned.  The message won't be printed but it
will be logged for helping debug deferred probe reasons.

So maybe we have been a little too energetic in removing these.

static void __dev_probe_failed(const struct device *dev, int err, bool fatal,
			       const char *fmt, va_list vargsp)
{
	struct va_format vaf;
	va_list vargs;

	/*
	 * On x86_64 and possibly on other architectures, va_list is actually a
	 * size-1 array containing a structure.  As a result, function parameter
	 * vargsp decays from T[1] to T*, and &vargsp has type T** rather than
	 * T(*)[1], which is expected by its assignment to vaf.va below.
	 *
	 * One standard way to solve this mess is by creating a copy in a local
	 * variable of type va_list and then using a pointer to that local copy
	 * instead, which is the approach employed here.
	 */
	va_copy(vargs, vargsp);

	vaf.fmt = fmt;
	vaf.va = &vargs;

	switch (err) {
	case -EPROBE_DEFER:
		device_set_deferred_probe_reason(dev, &vaf);
//this call.
		dev_dbg(dev, "error %pe: %pV", ERR_PTR(err), &vaf);
		break;

	case -ENOMEM:
		/* Don't print anything on -ENOMEM, there's already enough output */
		break;

	default:
		/* Log fatal final failures as errors, otherwise produce warnings */
		if (fatal)
			dev_err(dev, "error %pe: %pV", ERR_PTR(err), &vaf);
		else
			dev_warn(dev, "error %pe: %pV", ERR_PTR(err), &vaf);
		break;
	}

	va_end(vargs);
}

Jonathan

