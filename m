Return-Path: <linux-arm-msm+bounces-101791-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yH7lMp5m0WlvIwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101791-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 21:29:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3016639C3A9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 21:29:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6B269300C5B8
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Apr 2026 19:29:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8360233F589;
	Sat,  4 Apr 2026 19:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LI7uZhpu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 077EE33374F;
	Sat,  4 Apr 2026 19:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775330967; cv=none; b=lEiF3D5nsz/g8M4d80I+uDDzVVJh5A91PrKfWO++sMd2uLhqlH0AeGZDoJLzg6SmOX2T/rriP9eTIfkBbkpXQzIY1TQtD1pspnFvh+gSdOnC1TUft7mYkMHfwEyeMKFglUuem12AcGHBXNThF1+zKnJg8Dum+6KFddAdxgrmxgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775330967; c=relaxed/simple;
	bh=2E1gTTWRwsIHkMmrL5iB62nZPdYsU2MVVF0OYAc73aw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k+tWzMCTxcU+sYMdYh0eAkwQb9PdNPx67wF5Aun3nxKkhUo1g2vc/CJ06ig64rYOXR0BNGOuc7klz0cIK1iZCmrDCaQc9lhiwPXHmJ0TrVhdGFONLw25tUABP1QVtGjpVUCgJ0NI4F8YuBS2/Yq/sLrfQFQkQPbdkhljns18ggA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LI7uZhpu; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775330966; x=1806866966;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=2E1gTTWRwsIHkMmrL5iB62nZPdYsU2MVVF0OYAc73aw=;
  b=LI7uZhpukbDdxBoSLEkUVFse5ALYaShkEXcFPXhcej1OX+EL19XIvv5O
   8gCPnmDK8TGIYa/XfoLE2C7I9DUmsXlBSNGNpDUNFxnWnxt9G7iAn7iIJ
   8Bd/8DGxQsEtyttIJkh/Y3sdluvzqArjlMtq3zJ2zso9BKc279wtRVrbe
   vCsztPDGXKG9j6pmw3EZuMQNg32A74h7xkkbN93FLVq+fK9GdyBjPsdfv
   WUUwsXOu4cc+cgxzaIs83U9/X/rwWLFcE2ajdtMCrDfaBWomFDpUh/t4I
   0LYAjMO1Y9Hrw/m95Jo3V9I4+SU8KWTOItbJH3Nluy97lFLsxRMgWQxBC
   Q==;
X-CSE-ConnectionGUID: 5SnKuludTA25fafBCa+jHw==
X-CSE-MsgGUID: d/LHyuWzT4i1EewQKYaQfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11749"; a="93932728"
X-IronPort-AV: E=Sophos;i="6.23,160,1770624000"; 
   d="scan'208";a="93932728"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2026 12:29:25 -0700
X-CSE-ConnectionGUID: K8myanjUTEy374+50JRCaA==
X-CSE-MsgGUID: +xiCcFggSIG8y9nPciWRWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,160,1770624000"; 
   d="scan'208";a="250615393"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.247])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2026 12:29:22 -0700
Date: Sat, 4 Apr 2026 22:29:20 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Antony Kurniawan Soemardi <linux@smankusors.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
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
Subject: Re: [PATCH v2 2/3] iio: adc: qcom-pm8xxx-xoadc: remove redundant
 error logging in pm8xxx_read_raw
Message-ID: <adFmkFZevhJ1oznq@ashevche-desk.local>
References: <20260403-pm8xxx-xoadc-label-v2-0-29b50bf821e6@smankusors.com>
 <20260403-pm8xxx-xoadc-label-v2-2-29b50bf821e6@smankusors.com>
 <35urrjc3koye5zhlxatdsr7t2djuml5ueyhhazcucow3q3g5f2@pomnrrcwu7qr>
 <1b47a581-3a2b-490c-8a39-7a2cd0ddf8f2@smankusors.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1b47a581-3a2b-490c-8a39-7a2cd0ddf8f2@smankusors.com>
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
	TAGGED_FROM(0.00)[bounces-101791-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
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
	NEURAL_HAM(-0.00)[-0.998];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ashevche-desk.local:mid,intel.com:dkim]
X-Rspamd-Queue-Id: 3016639C3A9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Apr 04, 2026 at 03:26:32AM +0000, Antony Kurniawan Soemardi wrote:
> On 4/4/2026 4:54 AM, Dmitry Baryshkov wrote:
> > Does it also prevent users from spamming the dmesg?
> 
> It should be for no such channel case. The only remaining error logs
> from pm8xxx_read_raw are timeout errors, which I don’t think would
> result in immediate spamming. Or should we remove the dev_err (at
> pm8xxx_read_channel_rsv) on timeout errors too?

Does the user get -ETIMEDOUT? If so, yes, message may be removed.

-- 
With Best Regards,
Andy Shevchenko



