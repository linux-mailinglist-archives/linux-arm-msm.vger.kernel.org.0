Return-Path: <linux-arm-msm+bounces-100612-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id lKu/GwwTyWkguQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100612-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 13:54:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D2C351DA7
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 13:54:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 999393003BD1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 11:54:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93E8E35C1AC;
	Sun, 29 Mar 2026 11:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mwKv0wWE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D98AF9C0;
	Sun, 29 Mar 2026 11:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774785285; cv=none; b=bhn6rTRDZhtM3FtrB3fkcR9GjApnHgAs4Yi81KzmWsKqVKJ5UP+YSIePQb5t5E1qBJ337DFz2mismVt9x31O3Gc28EsY3L7u9yKPhdUHfsts9emDApxIkcmMO9YajUdtEbDs6vdHy477A0qFxrUrzSxWsTAhloCaG+tJRELaI5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774785285; c=relaxed/simple;
	bh=nA0NrtS7FcNLjbQ+4CdvUn+41Kn0ZDIadYiGVNnftlg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UCuw9XLzMGR1RwnonVKJPZmWw7VbXmQdFYy+Vp6zz8lf9vbwHF3+oaSpYN79VzwIFZaocXmoiUwPL/yU9yyWhFC/gIHUV4+GqZP02wcPryMXWKvAIh3F9ZB6PPxHgzyjU0Chr2l7iaKERSwSxY0gCL8A/QApnl0sMeAfLGmGtjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mwKv0wWE; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774785284; x=1806321284;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nA0NrtS7FcNLjbQ+4CdvUn+41Kn0ZDIadYiGVNnftlg=;
  b=mwKv0wWE9XhaAklHBN+/V3+5xVTk6GRG0h7Fq4OyERQZQ14GHDizJ8ag
   rGnovhuscDqiWihPGyzMU4pTPYnihfpAMrUqxwguto1b3crD525SFjisF
   07FEMa8ikZ/LLmbDI1pjBsUEahKEPOL0v5xB1ZFF8c2oBJynN4Jfojjax
   v89HXGdFZe5Aqw3Fy40LtOJ1ZartKaIdOHjgJCZnh/ACu4vkem68Dkhtg
   7GsECjNF/WXK8vvbUGE34cAW/vQStXUdxmFYmYx3VsmznwhJ55flBZEhl
   MIdBlYS0BDULM9uEeBhRhjRn+8M5T/T/zVr51wslWA9VrgSh9g2uu3357
   w==;
X-CSE-ConnectionGUID: avfOjLb/Tq2Er8Td6oH61Q==
X-CSE-MsgGUID: mLxkRVL0SwyGyrPREOuTxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="75859576"
X-IronPort-AV: E=Sophos;i="6.23,148,1770624000"; 
   d="scan'208";a="75859576"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2026 04:54:44 -0700
X-CSE-ConnectionGUID: AXiOh67CT9yl2JL8ClvKFw==
X-CSE-MsgGUID: 5W2BZfjfRAGtVBXQyCGAXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,148,1770624000"; 
   d="scan'208";a="248833540"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.29])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2026 04:54:40 -0700
Date: Sun, 29 Mar 2026 14:54:38 +0300
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
Message-ID: <ackS_tM2P6lp5eoF@ashevche-desk.local>
References: <20260326-pm8xxx-xoadc-label-v1-0-027805dad4db@smankusors.com>
 <20260326-pm8xxx-xoadc-label-v1-2-027805dad4db@smankusors.com>
 <acUIAh_r7mSfIiEB@ashevche-desk.local>
 <0b85a229-219f-4457-8fe4-bd4b3545684f@smankusors.com>
 <acWDMg58qxyeM5Eq@ashevche-desk.local>
 <c8e6166f-e9fc-430e-b290-a97c2aae2b31@smankusors.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c8e6166f-e9fc-430e-b290-a97c2aae2b31@smankusors.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100612-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,ashevche-desk.local:mid]
X-Rspamd-Queue-Id: 67D2C351DA7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 27, 2026 at 07:05:04PM +0000, Antony Kurniawan Soemardi wrote:
> On 3/27/2026 2:04 AM, Andy Shevchenko wrote:
> > On Thu, Mar 26, 2026 at 12:00:52PM +0000, Antony Kurniawan Soemardi wrote:
> > > On 3/26/2026 5:18 PM, Andy Shevchenko wrote:

...

> > > > > +	if (!ch) {
> > > > > +		dev_err(adc->dev, "no such channel %lu\n", chan->address);
> > > > > +		return -EINVAL;
> > > > > +	}
> > > > 
> > > > Isn't it a dead code? Also poisoning dmesg with this recurrent message is
> > > > not good idea to begin with (the user space will have a door to flood it,
> > > > which might be considered as an assistance to hackers to clear immediate
> > > > logs after a successful attack).
> > > 
> > > Good point about the successful attack hint! I was copying the existing
> > > code from pm8xxx_read_raw. Do you think those checks are unnecessary for
> > > pm8xxx_read_raw as well?
> > 
> > Yes, I think they are not as the returned code should be enough to identify
> > the problem. (For no such channel I would rather see -ENOENT, but we can't
> > simply replace that in the existing code as it's part of ABI.)
> 
> Just to re-clarify, do you mean for both pm8xxx_read_label &
> pm8xxx_read_raw:
> 1. if the check fails, it should only return -EINVAL without any
>    logging; or
> 2. remove the checks because there's no way it's not found?

The first one. And yeah, -EINVAL in the both cases for the sake of consistency.

-- 
With Best Regards,
Andy Shevchenko



