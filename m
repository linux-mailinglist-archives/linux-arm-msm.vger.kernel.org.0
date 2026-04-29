Return-Path: <linux-arm-msm+bounces-105111-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GF8OL9ah8WmwjAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105111-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 08:14:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 436E848FAAF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 08:14:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E659A301BA46
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 06:14:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21CA732D0FC;
	Wed, 29 Apr 2026 06:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fx7ihXJ8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40F61A6836;
	Wed, 29 Apr 2026 06:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777443280; cv=none; b=QSXoSiE14tLbsOp+dqRBR+r8FWy2KYsFZl40ftzhTH8GcVSAbAXMQV430H0Fh1o2+j4UeSQHvgSPDJ7cgpK3rhqkMIGsJqr9HBXD5KXb8o5btLbZOfUKPekxCpwH+md5QlPcBb+ULFgKiSPsuWey5wRghGUCoWraYxtOvXAEEho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777443280; c=relaxed/simple;
	bh=u19cZe4uphaObeNRajl6+3fQGSo6ktKhIWkAlKGwXG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iuPLczS1B7UpGigZLYoXcfqFHe3davMSDhQ4wr9mGPuldTH5GSF2BA98KK3uvldR7sqdhmlH7KpK2l9+B13iqor52QEYJB8buQklB2XDtv6Zi7I1J13byXwhZCmj9dWNzZ79i2nMgXB9sKEwEXexPaMsbd19N9d6cGngd14Wre8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fx7ihXJ8; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777443278; x=1808979278;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=u19cZe4uphaObeNRajl6+3fQGSo6ktKhIWkAlKGwXG8=;
  b=Fx7ihXJ8gc41sf3+OqQmCHadNqxzYsikEuz0wiTbUbyX96JthGgd5NRJ
   PEtfZd6I5KzYcJTfpCbgf8fAY2ywB4Lkg5goPYRuHsWvp8YdR8UeoG/Lm
   AGVDlk67Q86W69ZZkkKO4a95O3PltLT50xl8X+l8Dpd2kpH9/a1mfnHra
   7qVmXJfFAWxEc3MzDoIdaWKJFnRzaaFL6AIznp5aRHEqtigUfQEcxALoi
   VSyBeaVHBDD9Go3qOcbJhc9dOIYrPthfMLdVfgYkZAF31QHNqphO6GbTw
   zSjn27nF0XibCJ/x4T9YIeYmHHZWtgjUvV40jApQu7/ft4voU4JQpyE5D
   Q==;
X-CSE-ConnectionGUID: FWQKM/hJT22LOjEAzD6xuA==
X-CSE-MsgGUID: 7cpVvH0XTYCT7GMUbKfK8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="78380543"
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; 
   d="scan'208";a="78380543"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 23:14:38 -0700
X-CSE-ConnectionGUID: 5i34rrQ2QUyVhBI6f89KvA==
X-CSE-MsgGUID: UIVWTR2fSU6J8gFJkt1CLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; 
   d="scan'208";a="234454349"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.141])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 23:14:35 -0700
Date: Wed, 29 Apr 2026 09:14:31 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Kees Cook <kees@kernel.org>,
	Markus Schneider-Pargmann <msp@baylibre.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm: Don't use UTS_RELEASE directly
Message-ID: <afGhx3voJpWrxJDl@ashevche-desk.local>
References: <20260428144553.1103785-2-u.kleine-koenig@baylibre.com>
 <afDYn8Uy6PwvOVbH@ashevche-desk.local>
 <afDiNw30ud7hA4CN@monoceros>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <afDiNw30ud7hA4CN@monoceros>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Queue-Id: 436E848FAAF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,gmail.com,ffwll.ch,baylibre.com,linux.dev,poorly.run,somainline.org,vger.kernel.org,lists.freedesktop.org];
	TAGGED_FROM(0.00)[bounces-105111-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ashevche-desk.local:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim]

On Tue, Apr 28, 2026 at 06:39:53PM +0200, Uwe Kleine-König (The Capable Hub) wrote:
> On Tue, Apr 28, 2026 at 06:56:15PM +0300, Andy Shevchenko wrote:
> > On Tue, Apr 28, 2026 at 04:45:53PM +0200, Uwe Kleine-König (The Capable Hub) wrote:
> > > UTS_RELEASE evaluates to a static string and changes quite easily (e.g.
> > > uncommitted changes in the source tree or new commits). So when checking
> > > if a patch introduces changes to the resulting binary each usage of
> > > UTS_RELEASE is source of annoyance.
> > > 
> > > Instead of using UTS_RELEASE directly use init_utsname()->release which
> > > evaluates to the same string but with that a change of UTS_RELEASE
> > > doesn't affect msm_disp_snapshot_util.o or msm_gpu.o.
> > 
> > Would you like to submit similar changes against driver/auxdisplay?
> 
> These didn't pollute my build results so far, so my pressure is small.
> (Two of the three are not relevant for an allmodconfig build and the
> third depends on PLAT_VERSATILE which isn't in my build matrix.)
> 
> I assume you ask because if I say no you'd address that? In that case
> please go on.

Okay, noted.
Thanks for bringing in the way how to solve it!

-- 
With Best Regards,
Andy Shevchenko



