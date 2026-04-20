Return-Path: <linux-arm-msm+bounces-103831-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MNcMHvNu5mmBwAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103831-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 20:22:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 17198432BF6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 20:22:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 729F53008991
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 18:22:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4E333AE1B9;
	Mon, 20 Apr 2026 18:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cxwptElp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A713A2D0C64;
	Mon, 20 Apr 2026 18:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776709358; cv=none; b=NOnoo4IerqN+k72QJSKAWV1ypnByIIbvKuGJ6vD8gPS8I3Uov+pAvfwIdEpidxV91r8Bm/2GaxvNjgnD4gkovh4KjbItqnWjOcyyKgh82kdbAu0e5D2G2Murb1yee0vk3GJTOsvelb5fAb4WksfzLKS5sQrbMWtKUIFNoFOWrhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776709358; c=relaxed/simple;
	bh=TtsWasBb5ImTTzc3W/be5q8qYDc5s5SbmUhAVMr0O9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MthaGboCJwdUQ4ENZPNbFEOrqlnkTt2j/RiWuN79OgMGMJvD3Vn9TcP0gvBNrQuErk2kYpWgbSWwp+UzDmZ3pt48YYiW7Whm60yxR3z7TuTlaGyknZ9SP6YY6owYY27CCtojdrToBURAehsT0tUj3OnBw8molyposGm9JEknC0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cxwptElp; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776709357; x=1808245357;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TtsWasBb5ImTTzc3W/be5q8qYDc5s5SbmUhAVMr0O9Q=;
  b=cxwptElpS8BwqKlRI6Yqj9U9TOlY8bYvAFJCpaa4srKp9+/YFXaVuQuM
   20zTYEVJdUlWw3pGOTmuT9w/8wg4dTJWaph+FlDH6q+hVKsMqEsh+FgP2
   GAelHhP3frDhhAvSHjmiMz49NoyDMCbYGx7MIKqnp6bmsa4kljKFTovuK
   6VOCR4AyGK0yfsa5hzmz9y1tlplZySKjcEEMT8Wsz+AWCliwTmdZS7MPB
   x4+2r0L218/We4S48xhO2AMGvuH9PQlKaUOoxilZ9hBO01pG1mQNTDyWJ
   fK96MZHNQLYmox0wV/4J8X3T+cDiX4KPuabfipBS1H3h7RpHpuODPdILf
   A==;
X-CSE-ConnectionGUID: TG3CvOzhQ2Sl5A1nuSz47w==
X-CSE-MsgGUID: sCD3c/IDQk2oLztqHR6SWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="65169188"
X-IronPort-AV: E=Sophos;i="6.23,190,1770624000"; 
   d="scan'208";a="65169188"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2026 11:22:36 -0700
X-CSE-ConnectionGUID: AjnDA9z7RpKAdDntsYjfOQ==
X-CSE-MsgGUID: 18rUKD+dRQKEavptMctsBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,190,1770624000"; 
   d="scan'208";a="236789366"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.90])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2026 11:22:32 -0700
Date: Mon, 20 Apr 2026 21:22:29 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Antony Kurniawan Soemardi <linux@smankusors.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org, phone-devel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v3 3/3] iio: adc: qcom-pm8xxx-xoadc: add support for
 reading channel labels
Message-ID: <aeZu5eI8ECxzKiUS@ashevche-desk.local>
References: <20260405-pm8xxx-xoadc-label-v3-0-9fe179c283ec@smankusors.com>
 <20260405-pm8xxx-xoadc-label-v3-3-9fe179c283ec@smankusors.com>
 <adQNlfiq4aaOJ2ll@ashevche-desk.local>
 <20260420185807.24817684@jic23-huawei>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420185807.24817684@jic23-huawei>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103831-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,ashevche-desk.local:mid]
X-Rspamd-Queue-Id: 17198432BF6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 20, 2026 at 06:58:07PM +0100, Jonathan Cameron wrote:
> On Mon, 6 Apr 2026 22:46:29 +0300
> Andy Shevchenko <andriy.shevchenko@intel.com> wrote:
> > On Sun, Apr 05, 2026 at 04:52:21PM +0000, Antony Kurniawan Soemardi wrote:

...

> > > +static int pm8xxx_read_label(struct iio_dev *indio_dev,
> > > +			     struct iio_chan_spec const *chan, char *label)
> > > +{
> > > +	struct pm8xxx_xoadc *adc = iio_priv(indio_dev);  
> > 
> > > +	struct pm8xxx_chan_info *ch = pm8xxx_get_channel(adc, chan->address);  
> > 
> > When you have a validation the better style is to split definition and
> > assignment. This makes code robust against (theoretically) possible changes
> > that might reuse the same variable for something else.
> 
> I think you just mean

Yes.

> 	struct pm8xx_chan_info *ch;
> 
> 	ch = pm8xx_get_...
> 	if (!ch)
> 		return -EINVAL?

> I suppose slightly better but it's a very small function and unlikely to have
> much complexity added to it.

I am also on the educational side. If we learn how to do things right from the
beginning...

> > > +	if (!ch)
> > > +		return -EINVAL;
> > > +	return sysfs_emit(label, "%s\n", ch->label);
> > > +}  
> > 
> > Again, no need to resend now, just make it in the next version if that version
> > is asked for.

-- 
With Best Regards,
Andy Shevchenko



