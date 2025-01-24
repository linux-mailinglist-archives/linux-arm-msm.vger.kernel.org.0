Return-Path: <linux-arm-msm+bounces-46087-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92789A1B55A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 13:11:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CB5CF16BD81
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 12:11:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 269D11D5CF5;
	Fri, 24 Jan 2025 12:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MoIne5Pk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F951B3948;
	Fri, 24 Jan 2025 12:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737720664; cv=none; b=Geh1oGzvnzHNgTJJD19sISYF32T6ANK825Xe7b6J7Zk3NSLIPH+2zEWqEC62Uv7xPaTsdRfbKxx5CggWy1Tf7LmH1VUflp2ASg4rnu3VKAFpr8QzhaEbphj9AJFAY2MywkpSjj620SRit+j+c7A5Xk4hrjqNvLA/4nTqGVxwtF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737720664; c=relaxed/simple;
	bh=qptnCHNMB73+vqIXSqvEAVXSysWH2Gf5geZ/NcRp2VA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EzNaBE4VuEHp7kvUxlBJNiDbYW81EtBfUCBQj6TP6gK2OxgkGLZxL70Nd+YPeS6Tx9368EnqsUz3lkpuPXjxs8XOtZmno1y0HlTTAIIqnKAcrL7Xx09YcIj7u9oMYp7HqPIHNGMT2WSx0XSXztrTMjYnAIqi+rV9dd8cwISvBRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MoIne5Pk; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737720663; x=1769256663;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=qptnCHNMB73+vqIXSqvEAVXSysWH2Gf5geZ/NcRp2VA=;
  b=MoIne5PkkFMs8PSaTInIVke9i6OBXlwVwgIKKl8PDsXrMuw3YWz5kp3Q
   bVt9bK4TaTtn+1c1gHlqcrCXQMkMbyHBwSyDw9cHu+Qfa4SmcdcTMxWxS
   +wHmM+dRxYE3qTuaxHorRbJWw1/MP6Z30xZ3AyrCWXfRexdVi0JvBsMgw
   5wWMdBhWHDZbEP4u0NlZaCb+lUpmRNS91/FfTN5qOcCIvKq5yAPpSnDSe
   r9ODnU18XkZMzlk2TOJgDxxCDMkiKQ+buLznQ5KPwVboZRDEbJ8u9GQLr
   96TsZsfxSlJ3JWO60/tYUGYN6boBzjrIzCYcJHDdDnZ4H2EJQpGxB98m2
   Q==;
X-CSE-ConnectionGUID: 4ynDvOruQDyIWW4ed8bfDg==
X-CSE-MsgGUID: V1XHPLkpRr2dua3DPvAiUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11325"; a="38417205"
X-IronPort-AV: E=Sophos;i="6.13,231,1732608000"; 
   d="scan'208";a="38417205"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2025 04:11:02 -0800
X-CSE-ConnectionGUID: zgn7aJ5lTUeOnvcWQlEo0A==
X-CSE-MsgGUID: FI4smmPdShGeyJd1O7Vhtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,231,1732608000"; 
   d="scan'208";a="107877689"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
  by fmviesa008.fm.intel.com with SMTP; 24 Jan 2025 04:10:55 -0800
Received: by stinkbox (sSMTP sendmail emulation); Fri, 24 Jan 2025 14:10:54 +0200
Date: Fri, 24 Jan 2025 14:10:54 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Dave Airlie <airlied@redhat.com>,
	Jocelyn Falempe <jfalempe@redhat.com>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Kalyan Thota <quic_kalyant@quicinc.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
	Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH 0/6] drm: introduce atomic_needs_modeset() callbacks
Message-ID: <Z5ODTg9iTjNKggzN@intel.com>
References: <20250124-atomic-needs-modeset-v1-0-b0c05c9eda0f@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250124-atomic-needs-modeset-v1-0-b0c05c9eda0f@linaro.org>
X-Patchwork-Hint: comment

On Fri, Jan 24, 2025 at 01:14:18PM +0200, Dmitry Baryshkov wrote:
> There are several drivers which attempt to upgrading the commit to the
> full mode set from their per-object atomic_check() callbacks without
> calling the drm_atomic_helper_check_modeset() or
> drm_atomic_helper_check() again (as requested by those functions).

I don't really understand why any of that is supposedly necessary.
drm_atomic_helper_check_modeset() is really all about the
connector routing stuff, so if none of that is changing then there
is no point in calling it again. Eg. in i915 we call it just at
the start, and later on we flag internal modesets all over the
place, but none of those need drm_atomic_helper_check_modeset()
because nothing routing related will have changed.

> 
> As discussed on IRC, add separate atomic_needs_modeset() callbacks,
> whose only purpose is to allow the plane, connector, encoder or CRTC to
> specify that for whatever reasons corresponding CRTC should undergo a
> full modeset. The helpers will call these callbacks in a proper place,
> adding affected objects and calling required functions as required.
> 
> The MSM patches depend on the msm-next tree and the series at [1]. The
> plan is to land core changes through drm-misc, then merge drm-misc-next
> into msm-next and merge remaining msm-specific patches through the
> msm-next tree.
> 
> [1] https://lore.kernel.org/dri-devel/20250123-drm-dirty-modeset-v2-0-bbfd3a6cd1a4@linaro.org/
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> Dmitry Baryshkov (6):
>       drm/atomic-helper: add atomic_needs_modeset callbacks
>       drm/mgag200: move format check to drm_plane_helper.atomic_needs_modeset
>       drm/msm/dpu: stop upgrading commits by enabling allow_modeset
>       drm/msm/dpu: move CTM check to drm_crtc_helper.atomic_needs_modeset
>       drm/msm/dpu: use atomic_needs_modeset for CDM check
>       drm/msm: drop msm_atomic_check wrapper
> 
>  drivers/gpu/drm/drm_atomic_helper.c         | 59 ++++++++++++++++++
>  drivers/gpu/drm/mgag200/mgag200_drv.h       |  2 +
>  drivers/gpu/drm/mgag200/mgag200_mode.c      | 27 ++++++---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 15 +++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 44 +++++++++-----
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  4 --
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 26 --------
>  drivers/gpu/drm/msm/msm_atomic.c            | 29 ---------
>  drivers/gpu/drm/msm/msm_drv.h               |  1 -
>  drivers/gpu/drm/msm/msm_kms.c               |  2 +-
>  drivers/gpu/drm/msm/msm_kms.h               |  7 ---
>  include/drm/drm_modeset_helper_vtables.h    | 92 +++++++++++++++++++++++++++++
>  12 files changed, 219 insertions(+), 89 deletions(-)
> ---
> base-commit: 0936f0e54426177b0f0263ddf806ed5e13487db6
> change-id: 20250123-atomic-needs-modeset-8f6a8243a3f7
> prerequisite-change-id: 20241222-drm-dirty-modeset-88079bd27ae6:v2
> prerequisite-patch-id: 0c61aabfcd13651203f476985380cbf4d3c299e6
> prerequisite-patch-id: c6026f08011c288fd301676e9fa6f46d0cc1dab7
> prerequisite-patch-id: b0cb06d5c88791d6e4755d879ced0d5050aa3cbf
> prerequisite-patch-id: fd72ddde9dba0df053113bc505c213961a9760da
> 
> Best regards,
> -- 
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
Ville Syrjälä
Intel

