Return-Path: <linux-arm-msm+bounces-11082-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A52BE85534C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Feb 2024 20:39:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5EA39281523
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Feb 2024 19:39:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F12E13B7A9;
	Wed, 14 Feb 2024 19:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iKSdR4mD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661991339B0
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Feb 2024 19:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707939576; cv=none; b=ZgOhyheOHZdO8uWJXzKQrXco5Oul+G/qo6IbrVRtAyXNnIw4edS3S5IppSt8hkStn43DIltJIDGY4Uku9dGCohjWWl9zjPptmm8uffl8LGmynAdUqAJ1f52VrbtEU/qE32G89Y91n6Rx5iJmk3Ojd4sJG8H91jS2O5ke3W7aqTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707939576; c=relaxed/simple;
	bh=2EAkeIHx/DubrSAXO/8xl23uuz2upTGiChI+ff2sm8s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rV1Zan4BXhmtnspZaq1zmffcd0jkKllyaKxdI5TR0KdjP+7pHm4tuw3kA6pJuYWugMdmQbHajmkifeZY0ct/Y98GvhmXPJEglPAcdqMNyHdVlw0tuiX4AWKpePtZlpP5bonx0U1R99cGGvK2cJWcz7kcChH5WfiSww0heoA6m1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iKSdR4mD; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707939575; x=1739475575;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=2EAkeIHx/DubrSAXO/8xl23uuz2upTGiChI+ff2sm8s=;
  b=iKSdR4mD+pTiStIcC9bnwz04CZKcUIS4TLTXKLxQKh16jnaPXk2uv/2N
   SjAEBzwtaEPJwTO8i2HmeA7ykumpjK+PIYPdVyxn4a+pwsjSnG5EzcsEu
   7DoRnMOadjt0arH0Wn3hfDwHBQguxF690z76pgWvxRrEdQskoDRHW3P4A
   YcsoMTucyEOdCxfpmqAOA7oaC3KqTo4ehgoUS0GAhPT7vSYyyQnmCx/jd
   STQfinbdHn7GqPuXBm0C640fuGKUmzpm0SRnfOUwXDZBS4AVe1r9+Dj3B
   GEWduIHOywIhsm2csRG8y+OnhTysG8SQ76AlW2+ngdoaciFWTYilucPX6
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="2149821"
X-IronPort-AV: E=Sophos;i="6.06,160,1705392000"; 
   d="scan'208";a="2149821"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2024 11:39:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="826369732"
X-IronPort-AV: E=Sophos;i="6.06,160,1705392000"; 
   d="scan'208";a="826369732"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
  by orsmga001.jf.intel.com with SMTP; 14 Feb 2024 11:39:29 -0800
Received: by stinkbox (sSMTP sendmail emulation); Wed, 14 Feb 2024 21:39:29 +0200
Date: Wed, 14 Feb 2024 21:39:29 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v3 01/12] drm/atomic-helper: split not-scaling part of
 drm_atomic_helper_check_plane_state
Message-ID: <Zc0W8TjigrryOPil@intel.com>
References: <20230914050706.1058620-1-dmitry.baryshkov@linaro.org>
 <20230914050706.1058620-2-dmitry.baryshkov@linaro.org>
 <Zc0ITrmhQ8CWMXMq@intel.com>
 <Zc0KsfrI57XL7Efk@intel.com>
 <CAA8EJppv9xW1S6=eYr41Z0KG3AnsNs7+rLXWWCZ5TNetuqXuUw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAA8EJppv9xW1S6=eYr41Z0KG3AnsNs7+rLXWWCZ5TNetuqXuUw@mail.gmail.com>
X-Patchwork-Hint: comment

On Wed, Feb 14, 2024 at 09:17:06PM +0200, Dmitry Baryshkov wrote:
> On Wed, 14 Feb 2024 at 20:47, Ville Syrjälä
> <ville.syrjala@linux.intel.com> wrote:
> >
> > On Wed, Feb 14, 2024 at 08:37:02PM +0200, Ville Syrjälä wrote:
> > > On Thu, Sep 14, 2023 at 08:06:55AM +0300, Dmitry Baryshkov wrote:
> > > > The helper drm_atomic_helper_check_plane_state() runs several checks on
> > > > plane src and dst rectangles, including the check whether required
> > > > scaling fits into the required margins. The msm driver would benefit
> > > > from having a function that does all these checks except the scaling
> > > > one. Split them into a new helper called
> > > > drm_atomic_helper_check_plane_noscale().
> > >
> > > What's the point in eliminating a nop scaling check?
> >
> > Actually, what are you even doing in there? Are you saying that
> > the hardware has absolutely no limits on how much it can scale
> > in either direction?
> 
> No, I'm just saying that the scaling ability depends on the rotation
> and other plane properties. So I had to separate the basic plane
> checks and the scaling check.
> Basic (noscale) plane check source and destination rectangles, etc.
> After that the driver identifies possible hardware pipe usage and
> after that it can perform a scaling check.

Hmm. We have sport of similar situation in i915 where we pick a scaler
much later and so don't know the exact scaling limits at the time when
we do this check. But we opted to pass the lower/upper bounds of the
scaling limits instead. That will guarantee that at least completely
illegal values are rejected as early as possible, and so we don't have
to worry about running into them later on.

-- 
Ville Syrjälä
Intel

