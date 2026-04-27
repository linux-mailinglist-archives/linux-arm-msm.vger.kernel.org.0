Return-Path: <linux-arm-msm+bounces-104643-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CHrDDyEX72kQ6AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104643-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 09:58:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C0346EAAA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 09:58:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3B2C1300D300
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 07:58:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A26D397E80;
	Mon, 27 Apr 2026 07:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BAR78kOY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4F21E5B63;
	Mon, 27 Apr 2026 07:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777276701; cv=none; b=GHxyeXxkPhYx37pQFcM1I7COG3NcS+lGxBNuwgpRQiBN6bmxqST6AnaA2NGxXXzdsTdu1ino3LXKPcGmAlHJkT7iayDH7O8jH2+0ddUaw5r9SQxhQvwnzB3EXjqroYf3AFFujdaCKqAJkI9sPqKjjuwMdh/bfA9cuB/6fMdvaNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777276701; c=relaxed/simple;
	bh=NRFIPCjnwmWkGaHLJXSTXVOAj0P8uYVvyBr76C9hT0A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IbjcJ05nHaO+Demf4Yu9zKlX1AGq5mJMsoj5y0rdQfvpXCxd2ydPh4pIFYnpNZ1gnSKEe3oYt1luLvR/Y5O7dr3tO0qKMtUAldzSgfo6T69nwMyOZtoolou8VH25K243owbrZrOBvk3V9MrRUQNMLq/bwDdoxpQhXZ28WPxtIOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BAR78kOY; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777276701; x=1808812701;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NRFIPCjnwmWkGaHLJXSTXVOAj0P8uYVvyBr76C9hT0A=;
  b=BAR78kOYpZuh10YK4kJ1D9nHvJi6sJ0X3IWMirAa6vUPWokQoiNfuzVx
   tVvjVanqNBXpOwoIvp0OoacC3l4y/930By0F0ggRk2kLNyaYYjivLFOaO
   vZ0nMYWahL8zQHB8vYu3KQ573YEj4LWh92AoKeDH5IO4EwTcC1oAXgOb3
   QEVzY6LGYucpeKZniWSIPchtxhpXjEQ17AYEqmlVNQTR1MnPqjbmSriBr
   mjvMULthjUtu2AG2ZtwwrIhRt1wB6WB8P+13oKKh3wC0Nw18zy7xtyFVE
   3gHifIe47mx1C4aQ5HtB12/CqBTR+a1dctam4SpYsW6/fFmYBpNi16XUE
   Q==;
X-CSE-ConnectionGUID: yNImV4rkTvGhcPeip6xC7A==
X-CSE-MsgGUID: DhSQ40EXR5uN+/dgAVFgbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11768"; a="89621911"
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; 
   d="scan'208";a="89621911"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 00:58:20 -0700
X-CSE-ConnectionGUID: 5RvKVfqpTDas2Vfh8NLAvg==
X-CSE-MsgGUID: zxgV9PHiTIiM2zdlnrHw/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; 
   d="scan'208";a="237889786"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.244.2])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 00:58:16 -0700
Date: Mon, 27 Apr 2026 10:58:13 +0300
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
Subject: Re: [PATCH v4 3/4] iio: adc: qcom-pm8xxx-xoadc: constify pointers in
 read operations
Message-ID: <ae8XFUvF1NPNePhQ@ashevche-desk.local>
References: <20260426-pm8xxx-xoadc-label-v4-0-0ec782362615@smankusors.com>
 <20260426-pm8xxx-xoadc-label-v4-3-0ec782362615@smankusors.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260426-pm8xxx-xoadc-label-v4-3-0ec782362615@smankusors.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Queue-Id: 43C0346EAAA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104643-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ashevche-desk.local:mid]

On Sat, Apr 25, 2026 at 08:39:20PM +0000, Antony Kurniawan Soemardi wrote:
> These functions do not modify the indio_dev & adc structure, so they
> should be marked const to allow the compiler to catch any accidental
> modifications and to document the read only nature of these functions.

...

> -	struct pm8xxx_xoadc *adc = iio_priv(indio_dev);
> +	const struct iio_dev *indio_dev = d;
> +	const struct pm8xxx_xoadc *adc = iio_priv(indio_dev);
>  
>  	complete(&adc->complete);

Pointer to a constant object assumes no modification to that, isn't it? Please,
compile your code first.


-- 
With Best Regards,
Andy Shevchenko



