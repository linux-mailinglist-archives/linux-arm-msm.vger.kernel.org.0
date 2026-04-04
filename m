Return-Path: <linux-arm-msm+bounces-101789-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mNAHNk9m0WlvIwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101789-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 21:28:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 00FCF39C361
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 21:28:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 72AF5300C810
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Apr 2026 19:28:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 017543368A8;
	Sat,  4 Apr 2026 19:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="elb9Ub8A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C962777EA;
	Sat,  4 Apr 2026 19:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775330889; cv=none; b=PIgNZb3wHX0pxWh8ZaMnuzwB89piO5dCQujUEN1P+kRoOkcvM4YI0JgBo+p1Z3U4RA2Oa7qr3AnPViQZ+flhoF7NsxwMw3mu0+xMyJajwP8hcShnApVhpJxq61AJO2b/34xuZsIZVnS2cKH1d2luyYFwdVNlD+/giArl5p4bupA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775330889; c=relaxed/simple;
	bh=dSJX9GOFRFbixYNAI6Hfa0AxdTI5h2mwNMjm5R1g/V0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F35yIF6opoZ08VomRa3z5YwMbw82WdabTBNjPCE2xw3AnQd1D/eiwEV7P0JJhScL15iTnfQVgMZXO9ozmmUzgmq46Jw4f/bvNBrvtq6wY4O7TpOoUcwXockppM8RWiLWfkRmlI/XEPqGhmBC8RIqN4wi0ok2FBI4PMNekdTlTEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=elb9Ub8A; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775330888; x=1806866888;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dSJX9GOFRFbixYNAI6Hfa0AxdTI5h2mwNMjm5R1g/V0=;
  b=elb9Ub8AEgSbvRF87bLgpaaY5QQdyhCBpWacgynpiabhnQ3Lh5KAwYdm
   jlLhGVhS8uH1xGfGBubagkVJk3agDAwfj7uqcri/9xU/MXaSZs/MVm0p1
   fbtaxHVRl4b11D2CkC9WobDld02hdmT4JvM3X2nRQquwj4kKSL1s5z68j
   q1tnkQg89/aF7jhUSnp5m2otEhqewoAg2KT3XgL9Ry5XHLESbO5SvwBnZ
   PkFSw0gbWqETV3PrK8UGK3WXMR6DjGIVFOIXw6nC1gQKU1SX9iqBlA/Gl
   i/gpoKY8kQLDhvkH6QuxeO02R1AHUD763XVkHvAzHAlZyBqbP0yE6gEg6
   A==;
X-CSE-ConnectionGUID: 9XaBhVTGQbGjRtlQx7DgCg==
X-CSE-MsgGUID: HaE+U3leStuiEkKP2C6KRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11749"; a="86972448"
X-IronPort-AV: E=Sophos;i="6.23,160,1770624000"; 
   d="scan'208";a="86972448"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2026 12:28:07 -0700
X-CSE-ConnectionGUID: QAFtupCCQBWHlDi7j2iLXw==
X-CSE-MsgGUID: DXTNmmgLTYO7Zn40+WsJkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,160,1770624000"; 
   d="scan'208";a="229164035"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.247])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2026 12:28:04 -0700
Date: Sat, 4 Apr 2026 22:28:01 +0300
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
Subject: Re: [PATCH v2 3/3] iio: adc: qcom-pm8xxx-xoadc: add support for
 reading channel labels
Message-ID: <adFmQeMVKB125lgJ@ashevche-desk.local>
References: <20260403-pm8xxx-xoadc-label-v2-0-29b50bf821e6@smankusors.com>
 <20260403-pm8xxx-xoadc-label-v2-3-29b50bf821e6@smankusors.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403-pm8xxx-xoadc-label-v2-3-29b50bf821e6@smankusors.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101789-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.998];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 00FCF39C361
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 03, 2026 at 09:23:21AM +0000, Antony Kurniawan Soemardi wrote:
> Implement the .read_label callback to allow userspace to identify ADC
> channels via the "label" property in the device tree. The name field in
> pm8xxx_chan_info is renamed to label to better reflect its purpose. If
> no label is provided in the device tree, it defaults to the hardware
> datasheet name.
> 
> The change has been tested on Sony Xperia SP (PM8921).

...

> +	ret = fwnode_property_read_string(fwnode, "label", &ch->label);
> +	if (ret)
> +		ch->label = hwchan->datasheet_name;

Branch is not needed.

	ch->label = hwchan->datasheet_name;
	fwnode_property_read_string(fwnode, "label", &ch->label);

will have the same effect. But if you want to handle errors, you may do

	if (fwnode_property_present(...)) {
		ret = fwnode_property_read_string(...);
		if (ret)
			return ret;
	} else {
		...assign default...
	}


-- 
With Best Regards,
Andy Shevchenko



