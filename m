Return-Path: <linux-arm-msm+bounces-100083-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MO/YJeIMxWkI6AQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100083-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 11:39:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F3DBF333977
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 11:39:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DDBBE302529C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 10:18:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CD5239A072;
	Thu, 26 Mar 2026 10:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UHZJXJyQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A88E35BDD5;
	Thu, 26 Mar 2026 10:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774520329; cv=none; b=KHmXzcSVYnwsA5i/Mpl+IvshlygGVlcX2kWpag+Xwp8mPQgwq184iNQpqpgtysWmxyiFcEG7AyPXePJf8IY7Ky+9Po4UG44Fa9kM/HS5xCA/rjrtgPenpzPPOlBuem4/d1KP9vzLbaUyzCKlGEDEqGPQeZ+RLpz1Ql3Bj4wxQjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774520329; c=relaxed/simple;
	bh=hhLeCC4ZxIHzEaVms0pQfRfpSthRqXTTREIjc2vSvtA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i2dpaIg8NPUkDOhWPIjey/XNqP22nyRLa2aLM6c/PbHJi/a21so3E9IOfoTO171SYqdYfDY+rNRE36o1Lb8n7U5bEOa3j8u1epL09qtBzBebHARPl+Npxa08mP4nbk57GeLBrd6TPh51wVtKXkGQISKrLJ0hT473Cmkj9xwFT8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UHZJXJyQ; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774520328; x=1806056328;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hhLeCC4ZxIHzEaVms0pQfRfpSthRqXTTREIjc2vSvtA=;
  b=UHZJXJyQ/QZG3fjLjoS8aHGZ1KUX8++qwgoZilZfksIjjbnLJPJ9AjNQ
   3NcDaM61Zr4gwQSAofldRXEcD+OGl+5NJwUBlxOYsE7jJ+MPW6+AKgeba
   HzuZQcGTVfRxlkjAhVKQOnoo0Em6/gTHI1Kj6LRnDJlrdwO+BiBNkGp3j
   z/fxoxUJ1GbxLyNzB32lyFPZevjjx2T/PWda8D/WeGoNcPR1PkS8rVjeH
   978W0RT125jyizZJot5h7lNwi7PRK9XukcZUE3+CuLCnKXkC7ceFKl3kk
   5n6rzsRRtnywLv2vHsVtCJKg/ItK01cED9fRsUPhC0cjSDrUPN6tKgEsZ
   Q==;
X-CSE-ConnectionGUID: e6NUwQH1QYGGoeTWo/Jeuw==
X-CSE-MsgGUID: 32vav8XqS4Oah5OlHN1lrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="79172598"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="79172598"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 03:18:47 -0700
X-CSE-ConnectionGUID: MGrvg+ROSHSrxnjt/bVwqg==
X-CSE-MsgGUID: H94Wbn2GRt2Qx+pj62NHDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="229034432"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.216])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 03:18:44 -0700
Date: Thu, 26 Mar 2026 12:18:42 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Antony Kurniawan Soemardi <linux@smankusors.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH 2/2] iio: adc: qcom-pm8xxx-xoadc: add support for reading
 channel labels
Message-ID: <acUIAh_r7mSfIiEB@ashevche-desk.local>
References: <20260326-pm8xxx-xoadc-label-v1-0-027805dad4db@smankusors.com>
 <20260326-pm8xxx-xoadc-label-v1-2-027805dad4db@smankusors.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260326-pm8xxx-xoadc-label-v1-2-027805dad4db@smankusors.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100083-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ashevche-desk.local:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,smankusors.com:email]
X-Rspamd-Queue-Id: F3DBF333977
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 25, 2026 at 09:02:41PM +0000, Antony Kurniawan Soemardi wrote:
> Implement the .read_label callback to allow userspace to identify ADC
> channels via the "label" property in the device tree. The name field in
> pm8xxx_chan_info is renamed to label to better reflect its purpose. If
> no label is provided in the device tree, it defaults to the hardware
> datasheet name.

> Tested-on: Sony Xperia SP (PM8921)

Interesting, never saw this tag before.

> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>

...

> +static int pm8xxx_read_label(struct iio_dev *indio_dev,
> +			     struct iio_chan_spec const *chan, char *label)
> +{
> +	struct pm8xxx_xoadc *adc = iio_priv(indio_dev);
> +	struct pm8xxx_chan_info *ch = pm8xxx_get_channel(adc, chan->address);

> +	if (!ch) {
> +		dev_err(adc->dev, "no such channel %lu\n", chan->address);
> +		return -EINVAL;
> +	}

Isn't it a dead code? Also poisoning dmesg with this recurrent message is not
good idea to begin with (the user space will have a door to flood it, which
might be considered as an assistance to hackers to clear immediate logs after
a successful attack).

> +	return sysfs_emit(label, "%s\n", ch->label);
> +}

-- 
With Best Regards,
Andy Shevchenko



