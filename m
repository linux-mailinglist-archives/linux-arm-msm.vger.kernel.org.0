Return-Path: <linux-arm-msm+bounces-104647-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id INyZKO0g72lv7QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104647-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 10:40:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 39FA246F3F2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 10:40:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DA58B30438CF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 08:36:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44F0739B971;
	Mon, 27 Apr 2026 08:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WVtuG7lQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD2A397E9A;
	Mon, 27 Apr 2026 08:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777278988; cv=none; b=W+HIQuja7/XBJ8b3Si/MdJcXLkkfAu9BYc3CDdCThoMmL6T09fusSDHEcB2PZRVXiLa9JxZj1btLjeBCF24dWvhOtaDxA6zWgIpxELptCUtSjv1ZDOU1eleM2x38d1fVtburyUvEwMMYmvumc1kzCHnatt/+UIj06VRi5Qgmhyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777278988; c=relaxed/simple;
	bh=/rFbWm3/9E+LqUC5JKzMV6mlM6dsNa/dATZVYt8mVL4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dnm4yVJ6SX7eqa9DtNz/QSU6V3Q90bwHN/H7BNgursMNG6HKlZTXCXQf40zD6Apk1zoN2dIruCV+71qkyiqRdNB16+5l4eJZlMItmXzuR6a+RKFFI+DywKgUBkztFHOXcM0Nj8JJ8axqk/XgTSrte+jw42yQZByuUjf0/2lJOoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WVtuG7lQ; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777278988; x=1808814988;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/rFbWm3/9E+LqUC5JKzMV6mlM6dsNa/dATZVYt8mVL4=;
  b=WVtuG7lQKfixxQlJ7GvKZ1OMhShdl9srOTAYirV0JlzkZFbKLezQadkD
   JcXMCZn8dlKHi7OXMYuxRskMQOijwAUCCiRegJaVAtaEr+1ufA8NRF25J
   aigJ3CP3p9upBRmBk96j/QgKQoYdI1R/K2shNZ29Yd7BYUbPB9vSOcB+9
   YRvCulS7+eY5/vn9+pQrHvH9rI0W4TuHEj5G8sskXAcqZR5eBWz2fGtz+
   X917+nGYRP+Tcg3XGtbPPkNAZXdwAaVRV+JqTkrCtV/7Hj1SI1RKpcGg+
   5wE2Zd+aoygteFblKKQ9xCnnjtqqOtSm/QiAFuHZ42mDbGjP43gBNOCeI
   w==;
X-CSE-ConnectionGUID: +3O4VQPuT+CcBRNMvLjAkg==
X-CSE-MsgGUID: UvMrdRZTTHaCSF9aILsb+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11768"; a="78077974"
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; 
   d="scan'208";a="78077974"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 01:36:27 -0700
X-CSE-ConnectionGUID: gD2Q3ncuT/ug3yar+9jwqQ==
X-CSE-MsgGUID: LPpOT8sdQrqVsTuPya3kKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; 
   d="scan'208";a="232699082"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.244.2])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 01:36:22 -0700
Date: Mon, 27 Apr 2026 11:36:20 +0300
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
	linux-iio@vger.kernel.org, phone-devel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v5 2/3] iio: adc: qcom-pm8xxx-xoadc: remove redundant
 error logs when reading values
Message-ID: <ae8gBKZIajZ9ts2K@ashevche-desk.local>
References: <20260427-pm8xxx-xoadc-label-v5-0-9e7b5a53ef99@smankusors.com>
 <20260427-pm8xxx-xoadc-label-v5-2-9e7b5a53ef99@smankusors.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427-pm8xxx-xoadc-label-v5-2-9e7b5a53ef99@smankusors.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Queue-Id: 39FA246F3F2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104647-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:dkim,ashevche-desk.local:mid]

On Sun, Apr 26, 2026 at 08:14:46PM +0000, Antony Kurniawan Soemardi wrote:
> Drop dev_err() logging for -EINVAL and -ETIMEDOUT cases and rely on
> return values to report errors, reducing unnecessary log noise.

The comments from v4 are still applicable to this version.

-- 
With Best Regards,
Andy Shevchenko



