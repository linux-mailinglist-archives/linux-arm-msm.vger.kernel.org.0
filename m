Return-Path: <linux-arm-msm+bounces-47837-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 670E0A333B2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 00:56:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D2B591888EA5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 23:56:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3760B206F2C;
	Wed, 12 Feb 2025 23:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BWO+l8P/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F62A126C05;
	Wed, 12 Feb 2025 23:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739404584; cv=none; b=RVhFS/qmLjUkgCD9dpq5qlpOTSx+zvZKkLvzZx0LZ4mWjG1oooLTCDqWZ2r/7neQUNJvY6P2gMdv7Yu9aK9YkEckFxvrbAX/fOfmR7M/i3gvXdmizlxjOfzJ7hOReFC7EZtTUSLeHb808VkEthgE/14gaVEEhmFzFH6tACvI1KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739404584; c=relaxed/simple;
	bh=gF8WUDA/YTJ+dykENAH//Nob6ceU5xpiAlV5FGXbhA0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XKFQK7PKjV+VEibDLOClyD5cOygfOwtOktGE6SiDNwvitgxajP5EOd0kkjnsX+zT5+xYLxoiqXCTn3cBtlRrz5vS47B4cqCchBF89QjnBcZIhCFaehU2fsXBetFOriD2kMSMLzG7fRRcTZfyth1JM5Y411fAoJ8AFK+wVl3nW+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BWO+l8P/; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739404583; x=1770940583;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=gF8WUDA/YTJ+dykENAH//Nob6ceU5xpiAlV5FGXbhA0=;
  b=BWO+l8P/dTRCR8bIrN+9hL0ajtJxOTV4HqJbKf9d+G0Ba0YSAoqISq7G
   M18eMaSxK5uU2a6ceqjh8mfvmfT7WjeJwYq2Mmgqwl6hBB14pP3GkaY/2
   9w2u9bPfCu7FuILiwqt5WdRXGN7iDEcE5uobvZL+/jVQ5xBEOHSa2CH+Y
   2tjyfhlonhbWNPL5JoD0NTG/gV1U2IYMVEPhCjO37CEZpgTe3Xx44OFXL
   YIUsnFX5Qp39JO2Hy6uzq9+wo+JrADLqeW/PmV8iaX3VrwtkktUmDyqdn
   JfTig87/Xz8G1lCciMoagQh/cq3Iiy0mujRYoetvqdrwRgrz9wNaKrCQp
   w==;
X-CSE-ConnectionGUID: M5pW1xHtRwS6Iy5IVOWKBw==
X-CSE-MsgGUID: XQG1v6fATZuOTZyjG14lFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="39951904"
X-IronPort-AV: E=Sophos;i="6.13,281,1732608000"; 
   d="scan'208";a="39951904"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 15:56:18 -0800
X-CSE-ConnectionGUID: WR4Y8srsTAiq00aeunFnKQ==
X-CSE-MsgGUID: DJiOdrRmT3K6jnGzy0pS/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,281,1732608000"; 
   d="scan'208";a="113172598"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
  by fmviesa008.fm.intel.com with SMTP; 12 Feb 2025 15:56:12 -0800
Received: by stinkbox (sSMTP sendmail emulation); Thu, 13 Feb 2025 01:56:12 +0200
Date: Thu, 13 Feb 2025 01:56:12 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH RFC 4/7] drm/display: dp-aux-dev: use new DCPD access
 helpers
Message-ID: <Z601HHdh2Zn62skU@intel.com>
References: <20250117-drm-rework-dpcd-access-v1-0-7fc020e04dbc@linaro.org>
 <20250117-drm-rework-dpcd-access-v1-4-7fc020e04dbc@linaro.org>
 <87tt9pn8uu.fsf@intel.com>
 <7unkxysvdn57fp6t7sjmgqsiacg5grbrk4lp3fbfdvaht3hq4o@gqshn45sa5ww>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7unkxysvdn57fp6t7sjmgqsiacg5grbrk4lp3fbfdvaht3hq4o@gqshn45sa5ww>
X-Patchwork-Hint: comment

On Thu, Jan 23, 2025 at 01:05:47PM +0200, Dmitry Baryshkov wrote:
> On Thu, Jan 23, 2025 at 12:05:29PM +0200, Jani Nikula wrote:
> > On Fri, 17 Jan 2025, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> > > Switch drm_dp_aux_dev.c to use new set of DPCD read / write helpers.
> > 
> > This might be one of the few places where the old functions and the old
> > return value was used in a sensible manner.
> 
> Well... Yes and no. What does it mean if we return less bytes? Is that
> still a protocol error?

AFAIK short AUX replies are perfectly legal accoding to the DP
spec, but we've not really seen them happening in any real
use cases I suppose (although I'm not sure we have sufficient
logging to tell whether something failed completely or only
partially), hence why we've never really handled them
correctly.

For aux_dev it might matter more because the common use
case is to just dump the entire DPCD, and some displays
violate the spec by having black holes inside the DPCD.
What I don't rembmer is whether those black holes actually
result in short replies, or whether the entire AUX transfer
gets rejected when it hits one even partially.

The other concern with not handling short replies correctly
is that writes (and even some reads) can have side effects.
So when a short reply arrives we may have already triggered 
some side effects while still claiming that the access
completely failed.

I suppose if someone was sufficiently motivated they could
try to handle short replies more correctly and keep retrying
the remaining bytes (assuming that is the correct way to
handle them). Although with those black holes I guess
you'd eventually have to give up anyway before having
transferred all the bytes.

-- 
Ville Syrjälä
Intel

