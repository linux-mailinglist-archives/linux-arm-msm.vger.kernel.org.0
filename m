Return-Path: <linux-arm-msm+bounces-105041-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sIEwKvjZ8GkLaQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105041-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 18:02:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D0385488683
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 18:01:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CA87430682E7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 15:56:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49E1135A384;
	Tue, 28 Apr 2026 15:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dgUbo7W7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F6C83B95FD;
	Tue, 28 Apr 2026 15:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777391784; cv=none; b=tzQC5fcQYA1c6FknmXufFYRQs0FiomYXX/kZeWacVQwu31JHXTRJqax/MYI9FpaYnkHL4EMZuQsSRLTWHtpgi8am0bLG1tMaEOFgKtfMFd+XsCZrq0bLJfWLeuaBC2Gq9mYqYBAx8k9dNYe9aNzGdykWFbv5Zw5PWQkP6P3g7wU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777391784; c=relaxed/simple;
	bh=yBCWaGEAZeKO/Fd4KAgTA5laTmjGSUePRDsNW05n9lA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PjnFns0+Ef3ZNaRoiIQHt04qT3MA+U700ONw5T5mnL/KNRWeL6WKbMNhc2JJN4O2VjL4fVKhj8E2tJRgexMy3o4exCLRemjgRNTZDVNi/jVq77crVkjGqAxGPktZ6h6oCxxgOjSkwsTCwjRr+hRYaqLvLS0i9H776ModUg9hALA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dgUbo7W7; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777391783; x=1808927783;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=yBCWaGEAZeKO/Fd4KAgTA5laTmjGSUePRDsNW05n9lA=;
  b=dgUbo7W7z+yUxzF9Fx6G9AskFbEN3NyFR07+MFARCBfK9bLc6qFE6LYt
   iwzTUm8/JXZes5hlz6+7TTQAqBf5N558nTO8IpEePNwV0xtAct+1uJ3gr
   y30lKWssHKgRtlivYIt5FwYgzTYfX//60r/ENnTOzcGNE5J+fTlL7HvtD
   y3BDcJWESvbjmQHY/pqy3/EN5xf2Ur9Bb839VjXB3LLz7tmjUGWWL8itZ
   ThFgqdruejys9e2IX/XFFTr+g7j2T52rP0jzA0vrj8tXoK6Nq+asXv6bA
   e6ND9RYNas5+mihALmpyXEPg6iy+1a8/usMNQrcRYE7e+13FKVMokd4jP
   A==;
X-CSE-ConnectionGUID: Oxe18aLpSYOz7CjPLVoAFA==
X-CSE-MsgGUID: njJEDfJtQ2ysRQyDyOOu5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="82171076"
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; 
   d="scan'208";a="82171076"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 08:56:23 -0700
X-CSE-ConnectionGUID: ansQcULMTDGbd+eWCN9Bbg==
X-CSE-MsgGUID: fkcEUSxFTSmaWipH/JaYQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; 
   d="scan'208";a="257554633"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.213])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 08:56:18 -0700
Date: Tue, 28 Apr 2026 18:56:15 +0300
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
Message-ID: <afDYn8Uy6PwvOVbH@ashevche-desk.local>
References: <20260428144553.1103785-2-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260428144553.1103785-2-u.kleine-koenig@baylibre.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Queue-Id: D0385488683
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,gmail.com,ffwll.ch,baylibre.com,linux.dev,poorly.run,somainline.org,vger.kernel.org,lists.freedesktop.org];
	TAGGED_FROM(0.00)[bounces-105041-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:dkim,ashevche-desk.local:mid]

On Tue, Apr 28, 2026 at 04:45:53PM +0200, Uwe Kleine-König (The Capable Hub) wrote:
> UTS_RELEASE evaluates to a static string and changes quite easily (e.g.
> uncommitted changes in the source tree or new commits). So when checking
> if a patch introduces changes to the resulting binary each usage of
> UTS_RELEASE is source of annoyance.
> 
> Instead of using UTS_RELEASE directly use init_utsname()->release which
> evaluates to the same string but with that a change of UTS_RELEASE
> doesn't affect msm_disp_snapshot_util.o or msm_gpu.o.

Would you like to submit similar changes against driver/auxdisplay?

-- 
With Best Regards,
Andy Shevchenko



