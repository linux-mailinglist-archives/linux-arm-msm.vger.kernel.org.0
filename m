Return-Path: <linux-arm-msm+bounces-111220-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wVFIEbeSIWq6JAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111220-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 16:59:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 935B26412AC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 16:59:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=h+2LmGsX;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111220-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111220-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 41D2830F33E3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 14:44:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 847FB480948;
	Thu,  4 Jun 2026 14:44:12 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC54E421A0A;
	Thu,  4 Jun 2026 14:44:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780584252; cv=none; b=XmAIN+q1IrnrvwIdqFmCb8OV7Kmn0T0YlBZRRGww+vDDZqPTlIPqp5BU1vdTeyPqdN8SEkZu3aDo8NbmtIKXZmNVyvNtM1oANyhERbY8+0uJxMHYDSpaSkLC2/FAgjY42f68z2uUTnq61gkxMzrhQmPP904CHTa+eSW2lZXLiKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780584252; c=relaxed/simple;
	bh=xioSgrx/0cKagkWYlTbbGauf4MvUTEbfEnnI6ugY9Ww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O5YIRN13Ke3BugP3zn9cpEmkMpRZTkDg5acTwED3SB4I5nOOKaolk8OQeCP4qIaoyMut9MquumOgDWryP4RaQNrM23UVgT8BwDlkzJJdLglfr1Xxm3xAcnNk6Xn2LRfl65V759WhlkLkhz6crGeMDayQ4Y+xwu1s4/vKwNC5i/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h+2LmGsX; arc=none smtp.client-ip=198.175.65.14
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780584251; x=1812120251;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xioSgrx/0cKagkWYlTbbGauf4MvUTEbfEnnI6ugY9Ww=;
  b=h+2LmGsXppVV+X9/K8yK8BCakiMO2WUlQZXX/CJ3KalCBTLQT14AmdjE
   Z3yzB4/LgeSf3IZ3ovpbnVmPiQ6wJqkhnI82tjTTZ8Uz4iPhl4mjdheRR
   1h9Xpcv1GUjmkh6uEzFBlVBhwoCgu++C1KbkVRbX2p3eGca8ZDhoLBEzW
   u+uQvMQZImEiynlM3RkaSkdi8fIS9b2AAk8bb34nQvIjwQJFx599GP/gy
   hMkYV4WQt2ZuPqCCIzObI14cU0KhMp9pY577aQf7xXyO86zbDvGRjqUdD
   0/dnCeDYVD8U28boEcAl8uRItE9MCwJsBIs6fdgSBSghCDD0zRzM77bqo
   A==;
X-CSE-ConnectionGUID: cdOrCBJiTz22sGTfDB4E4A==
X-CSE-MsgGUID: 7P/By35VQQ6RfRbsWBYurw==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="85300355"
X-IronPort-AV: E=Sophos;i="6.24,187,1774335600"; 
   d="scan'208";a="85300355"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2026 07:44:11 -0700
X-CSE-ConnectionGUID: 04A6IfFOSwGhxExF+I7dyg==
X-CSE-MsgGUID: CZajhtE/Sju25LYfF9GqxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,187,1774335600"; 
   d="scan'208";a="248498955"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.47])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2026 07:44:06 -0700
Date: Thu, 4 Jun 2026 17:44:02 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
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
Message-ID: <aiGPMqHcz_AkUezI@ashevche-desk.local>
References: <20260526-gen3_adc_tm-v2-0-702fbac919ac@oss.qualcomm.com>
 <20260526-gen3_adc_tm-v2-1-702fbac919ac@oss.qualcomm.com>
 <ah9ouLQFI7VtHCWL@ashevche-desk.local>
 <20260604114630.23ca427a@jic23-huawei>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604114630.23ca427a@jic23-huawei>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111220-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jic23@kernel.org,m:jishnu.prakash@oss.qualcomm.com,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:amitk@kernel.org,m:thara.gopinath@gmail.com,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:rui.zhang@intel.com,m:lukasz.luba@arm.com,m:linux-arm-msm@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:kamal.wadhwa@oss.qualcomm.com,m:david.collins@oss.qualcomm.com,m:anjelique.melendez@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:stephan.gerhold@linaro.org,m:tharagopinath@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,baylibre.com,analog.com,kernel.org,gmail.com,intel.com,arm.com,vger.kernel.org,linaro.org];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,intel.com:dkim,intel.com:from_mime,intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 935B26412AC

On Thu, Jun 04, 2026 at 11:46:30AM +0100, Jonathan Cameron wrote:
> On Wed, 3 Jun 2026 02:35:20 +0300
> Andy Shevchenko <andriy.shevchenko@intel.com> wrote:
> > On Tue, May 26, 2026 at 04:26:09PM +0530, Jishnu Prakash wrote:

...

> > > +	ret = devm_request_threaded_irq(dev, adc->dev_data.base[ADC5_GEN3_VADC_SDAM].irq,
> > > +					NULL, adc5_gen3_isr, IRQF_ONESHOT | IRQF_SHARED,
> > > +					adc->dev_data.base[ADC5_GEN3_VADC_SDAM].irq_name,
> > > +					adc);
> > >  	if (ret)
> > >  		return dev_err_probe(dev, ret,
> > >  				     "Failed to request SDAM%d irq\n",  
> > 
> > Also add a patch to drop this duplicate message.
> 
> There is another thread going on this.  It might not be duplicate
> if -EPROBE_DEFER is returned.  The message won't be printed but it
> will be logged for helping debug deferred probe reasons.

Yes, and I explained that it is duplicated as long as I understand current
code base.

> So maybe we have been a little too energetic in removing these.

Or maybe sashiko consumed a bit of LSD :-)

-- 
With Best Regards,
Andy Shevchenko



