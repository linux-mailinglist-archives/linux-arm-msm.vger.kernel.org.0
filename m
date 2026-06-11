Return-Path: <linux-arm-msm+bounces-112798-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Px9bBz4EK2pC1QMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112798-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 20:53:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 15BCD674965
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 20:53:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=nfHEFl7D;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112798-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112798-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 00B883007AFC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 18:53:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 020DD47A0A5;
	Thu, 11 Jun 2026 18:53:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E98404BCF;
	Thu, 11 Jun 2026 18:53:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781204023; cv=none; b=j+tr/fNynsn/fvtlHnxsd3VustRZ4f/iYsXDpnw7q67ZC56+axvoYrv2f4SZU28ZToFRGvr+TORv7IfyLfXHsBNirwS0ai77VZFtP0v6Yq5H8YQrQ9cClAv4OYba0QWVvG7Z3UpBNnxKCoHVhclGUj55av8TLV7Uwj6hozyq4ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781204023; c=relaxed/simple;
	bh=23V39ldrqwWRAB/niUph+06vp/6uCDNAdAo0YdkcaPE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N6T4XbO4+QM6ZYayuA4VYMrH1yo0xevQ9SqruJkxKGw8MXohxdHM15bN4GcH3ViF6Q6DD9IHhrcFR8waaCmk2uyenLMzVv8fqBLpHBhOBDPkfQNQIXv8yfMQTiWUbty4XD2VZdCfqt+EicQ95KuciJMleA9Z6VM3dk2yYpdNYcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nfHEFl7D; arc=none smtp.client-ip=198.175.65.15
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781204021; x=1812740021;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=23V39ldrqwWRAB/niUph+06vp/6uCDNAdAo0YdkcaPE=;
  b=nfHEFl7DX1NLvK1lKJM1V37bbDDHeW6Pa67vK780lqcbi96UNVM1ZZyF
   ZI/x2KCC7Llms2eJ3flBhj0SlW48ffa+vZyc+DdmaJjthMi3+RuaEX9hJ
   RGJyiYBbnbzt1I0Wkxqw77onw4/uYz8dzwHpg57paiSx6vRH17q31kIEn
   vi88fouk+iaV5GI1Hf+NdgPJbCSxu7Yv8RCLbWh4t83t7Lck9TCXHoULD
   ZXQOJozGnjvjEYa5HDm8ksPY9Q5qLwO5PbSqhXKx3882BRmQ73zqg+HdC
   9RmOUNeinP3tLvdtZ58M5K+m5WBGJaD8Lg3kblpwgQjBl752kKkdnaV9g
   g==;
X-CSE-ConnectionGUID: 5A+9LAtOSFWxWNjW6G3Z7A==
X-CSE-MsgGUID: 4/k0kTyTTKmBVKv/bmK5XA==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="85658020"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="85658020"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 11:53:40 -0700
X-CSE-ConnectionGUID: 4DcHKMqVSvCRPyH3Ekivlw==
X-CSE-MsgGUID: I93WhNpvQnGs3+X+1wm2ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="242446551"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.123])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 11:53:35 -0700
Date: Thu, 11 Jun 2026 21:53:33 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Amit Kucheria <amitk@kernel.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
	David Collins <david.collins@oss.qualcomm.com>,
	Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Stephan Gerhold <stephan.gerhold@linaro.org>
Subject: Re: [PATCH v2 1/2] iio: adc: qcom-spmi-adc5-gen3: Share SDAM0 IRQ
 with ADC_TM auxiliary driver
Message-ID: <aisELR6v1EWGcmqb@ashevche-desk.local>
References: <20260526-gen3_adc_tm-v2-0-702fbac919ac@oss.qualcomm.com>
 <20260526-gen3_adc_tm-v2-1-702fbac919ac@oss.qualcomm.com>
 <ah9ouLQFI7VtHCWL@ashevche-desk.local>
 <20260604114630.23ca427a@jic23-huawei>
 <aiGPMqHcz_AkUezI@ashevche-desk.local>
 <d095233e-ac2a-4b50-8a62-29fe1e36c2d1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d095233e-ac2a-4b50-8a62-29fe1e36c2d1@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112798-lists,linux-arm-msm=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:jishnu.prakash@oss.qualcomm.com,m:jic23@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:amitk@kernel.org,m:thara.gopinath@gmail.com,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:rui.zhang@intel.com,m:lukasz.luba@arm.com,m:linux-arm-msm@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:kamal.wadhwa@oss.qualcomm.com,m:david.collins@oss.qualcomm.com,m:anjelique.melendez@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:stephan.gerhold@linaro.org,m:tharagopinath@gmail.com,s:lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,analog.com,gmail.com,intel.com,arm.com,vger.kernel.org,oss.qualcomm.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,intel.com:dkim,intel.com:email,intel.com:from_mime,ashevche-desk.local:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 15BCD674965

On Thu, Jun 11, 2026 at 04:13:07PM +0530, Jishnu Prakash wrote:
> On 6/4/2026 8:14 PM, Andy Shevchenko wrote:
> > On Thu, Jun 04, 2026 at 11:46:30AM +0100, Jonathan Cameron wrote:
> >> On Wed, 3 Jun 2026 02:35:20 +0300
> >> Andy Shevchenko <andriy.shevchenko@intel.com> wrote:
> >>> On Tue, May 26, 2026 at 04:26:09PM +0530, Jishnu Prakash wrote:

...

> >>>> +	ret = devm_request_threaded_irq(dev, adc->dev_data.base[ADC5_GEN3_VADC_SDAM].irq,
> >>>> +					NULL, adc5_gen3_isr, IRQF_ONESHOT | IRQF_SHARED,
> >>>> +					adc->dev_data.base[ADC5_GEN3_VADC_SDAM].irq_name,
> >>>> +					adc);
> >>>>  	if (ret)
> >>>>  		return dev_err_probe(dev, ret,
> >>>>  				     "Failed to request SDAM%d irq\n",  
> >>>
> >>> Also add a patch to drop this duplicate message.
> >>
> >> There is another thread going on this.  It might not be duplicate
> >> if -EPROBE_DEFER is returned.  The message won't be printed but it
> >> will be logged for helping debug deferred probe reasons.
> > 
> > Yes, and I explained that it is duplicated as long as I understand current
> > code base.
> 
> After I checked for Andy's first comment, my understanding was that
> devm_request_threaded_irq would internally call dev_err_probe in case
> of an error, so this dev_err_probe print above would not be needed.

Correct.

> Please let me know if it's better to keep or remove this print.

You already know my position here :-)

> And if I make the change, shall I add it in a separate patch
> before or after this patch in the next series?

The rule of thumb is to make sure your series won't do ping-pong type of
changes: when one patch introduces (or moves) some code that is removed or
modified in different way by another patch in the same series.

> >> So maybe we have been a little too energetic in removing these.
> > 
> > Or maybe sashiko consumed a bit of LSD :-)

-- 
With Best Regards,
Andy Shevchenko



