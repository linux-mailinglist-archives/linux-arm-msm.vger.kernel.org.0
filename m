Return-Path: <linux-arm-msm+bounces-30791-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B853E96C76B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 21:23:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7028A2875A3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 19:23:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8EFF1E631D;
	Wed,  4 Sep 2024 19:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lpBi5lQO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC4971E5034;
	Wed,  4 Sep 2024 19:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725477795; cv=none; b=BSD7zs3Rm8RGu1jMOsUaw9L8j0JfhsieS/9BjrMnaQXYMWiaPcAy4gcaHmSHrAFOfOeWKzzzMumN9376yJe4ykprLYwqVSwcwdlS4C0ksQQtBjjL3fLiLkzTpuZbjsX8oDFrJY9z+n5WDYtoWHgMzs/EUg0z6yAijuZMonokrA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725477795; c=relaxed/simple;
	bh=4wcsBOr2fzCHJ5b6O4hsPqGBLBwATw2oUkdqrqEwPgQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P8q701I1xlmGhnYt3CNBCqv/V84AcdfvANGKKoY7K3MFtQSvdoKRb+a6LE9ZzW10/glWQuipwIwK/Hxa64N4QQk2fdZZP1uKUe7+Oo4t/Ri5/T1NH1S59s7SeY383oNA5x8BwNlsiCNpc27HHzeNNbkgfCSdZpgHjQ7kTcu0+Gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lpBi5lQO; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725477794; x=1757013794;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=4wcsBOr2fzCHJ5b6O4hsPqGBLBwATw2oUkdqrqEwPgQ=;
  b=lpBi5lQOO/r70YMqIRzgrnXAV2p8IkMDplRxky5Lb+iHUz4/WV5u5xqE
   zLCI6iOwZz+JdVQbG43CrWGhFf5AuoOrAMEZMInfZvvMu/cBI8F7XqI+P
   LXGQWZtxQwhHi/RuFmDsWNHKO43RAGD62Bef7X2QI2LLPfagwH428kk+A
   shuJ1MPua7cixptPdKkQ0QxzOHAd4um0AUBRy8aevAFmeoLX7c1okVeqO
   JbgtY6hCuo0UEFEotRvOvXPAiFmyVaKJA4sCVM8DnNWeU0aHeXRVGN2Vm
   X7lv4x/o2Aykt8TlwHjFg+gHLHJPthxB/+CeDCPC1p0NJw8zqTbVrNpN4
   Q==;
X-CSE-ConnectionGUID: 6ZUo4xnNTb+X5ZUI7WtdgQ==
X-CSE-MsgGUID: nLDCXJiXRz+Sa5jJ7bjH7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="46690814"
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; 
   d="scan'208";a="46690814"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 12:23:09 -0700
X-CSE-ConnectionGUID: To3hBdIpSra6xpZsucP93Q==
X-CSE-MsgGUID: VjApYc4/Tzez6wViLnxSFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; 
   d="scan'208";a="65417052"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
  by fmviesa008.fm.intel.com with SMTP; 04 Sep 2024 12:23:02 -0700
Received: by stinkbox (sSMTP sendmail emulation); Wed, 04 Sep 2024 22:23:01 +0300
Date: Wed, 4 Sep 2024 22:23:01 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>,
	Rob Clark <robdclark@gmail.com>, quic_abhinavk@quicinc.com,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, quic_ebharadw@quicinc.com,
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH 07/21] drm/msm/dpu: Check CRTC encoders are valid clones
Message-ID: <ZtizlTxH-7EBhiSd@intel.com>
References: <20240829-concurrent-wb-v1-0-502b16ae2ebb@quicinc.com>
 <20240829-concurrent-wb-v1-7-502b16ae2ebb@quicinc.com>
 <uqtlpynjdszqyyikj64uxwuqnk3lmzma7kd2vwxipnj4fg2eje@7toj5kww7vk7>
 <9f95704d-0699-4b11-b8cb-40f1a57eeebd@quicinc.com>
 <CAA8EJpqM0QBxLFCx22UuVmYAE258im_Up2-3fu6qez1GrOhOQg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAA8EJpqM0QBxLFCx22UuVmYAE258im_Up2-3fu6qez1GrOhOQg@mail.gmail.com>
X-Patchwork-Hint: comment

On Wed, Sep 04, 2024 at 09:41:23PM +0300, Dmitry Baryshkov wrote:
> On Wed, 4 Sept 2024 at 01:18, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
> >
> >
> >
> > On 8/30/2024 10:00 AM, Dmitry Baryshkov wrote:
> > > On Thu, Aug 29, 2024 at 01:48:28PM GMT, Jessica Zhang wrote:
> > >> Check that each encoder in the CRTC state's encoder_mask is marked as a
> > >> possible clone for all other encoders in the encoder_mask and that only
> > >> one CRTC is in clone mode at a time
> > >>
> > >> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> > >> ---
> > >>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 36 +++++++++++++++++++++++++++++++-
> > >>   1 file changed, 35 insertions(+), 1 deletion(-)
> > >>
> > >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > >> index 5ec1b5a38922..bebae365c036 100644
> > >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > >> @@ -1,6 +1,6 @@
> > >>   // SPDX-License-Identifier: GPL-2.0-only
> > >>   /*
> > >> - * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
> > >> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
> > >>    * Copyright (c) 2014-2021 The Linux Foundation. All rights reserved.
> > >>    * Copyright (C) 2013 Red Hat
> > >>    * Author: Rob Clark <robdclark@gmail.com>
> > >> @@ -1204,6 +1204,36 @@ static struct msm_display_topology dpu_crtc_get_topology(
> > >>      return topology;
> > >>   }
> > >>
> > >> +static bool dpu_crtc_has_valid_clones(struct drm_crtc *crtc,
> > >> +            struct drm_crtc_state *crtc_state)
> > >> +{
> > >> +    struct drm_encoder *drm_enc;
> > >> +    struct drm_crtc *temp_crtc;
> > >> +    int num_cwb_sessions = 0;
> > >> +
> > >> +    drm_for_each_crtc(temp_crtc, crtc->dev)
> > >> +            if (drm_crtc_in_clone_mode(temp_crtc->state))
> > >
> > > No, get the state from drm_atomic_state. temp_crtc->state might be
> > > irrelevant.
> >
> > Hi Dmitry,
> >
> > Ack.
> >
> > >
> > >> +                    num_cwb_sessions++;
> > >
> > > Even simpler:
> > > if (temp_crtc != crtc && drm_crtc_in_clone_mode(...))
> > >       return false;
> >
> > Ack.
> >
> > >
> > >> +
> > >> +    /*
> > >> +     * Only support a single concurrent writeback session running
> > >> +     * at a time
> > >
> > > If it is not a hardware limitation, please add:
> > > FIXME: support more than one session
> >
> > This is a hardware limitation.
> >
> > >
> > >> +     */
> > >> +    if (num_cwb_sessions > 1)
> > >> +            return false;
> > >> +
> > >> +    drm_for_each_encoder_mask(drm_enc, crtc->dev, crtc_state->encoder_mask) {
> > >> +            if ((crtc_state->encoder_mask & drm_enc->possible_clones) !=
> > >> +                            crtc_state->encoder_mask) {
> > >
> > > Align to opening bracket, please. Granted that other drivers don't
> > > perform this check, is it really necessary? Doesn't
> > > validate_encoder_possible_clones() ensure the same, but during the
> > > encoder registration?
> >
> > The difference here is that validate_encoder_possible_clones() is only
> > called when the drm device is initially registered.
> >
> > The check here is to make sure that the encoders userspace is proposing
> > to be cloned are actually possible clones of each other. This might not
> > be necessary for drivers where all encoders are all possible clones of
> > each other. But for MSM (and CWB), real-time display encoders can only
> > be clones of writeback (and vice versa).
> 
> I had the feeling that encoder_mask should already take care of that,
> but it seems I was wrong.
> Please extract this piece as a generic helper. I think it should be
> called from the generic atomic_check() codepath.

Yeah, if we are semi-assured that drivers aren't screwing up those
bitmasks anymore we could shove the cloning checks into
drm_atomic_helper_check_modeset(). It already checks possible_crtcs.
We could then throw out the equavalent code from i915 as well...

Are there decent IGTs to make sure the kernel properly rejects
illegal cloning configurations?

-- 
Ville Syrjälä
Intel

