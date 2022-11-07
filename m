Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D58861FEC1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Nov 2022 20:37:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232098AbiKGThP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Nov 2022 14:37:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230186AbiKGThO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Nov 2022 14:37:14 -0500
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C050E71
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Nov 2022 11:37:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667849834; x=1699385834;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=r0vAOoO2Li7vvBK9JKjeTn5g1cV1l7oWFilSA5GEbYY=;
  b=jLt+wqG/lg6mJhW2GNMcOO3hhh7HfK9Ry/qkN6VIVOIK5WstDPyJZeME
   WuGYO3rjS5M/phDz4atPgS1AAC8FXtGXKSYeF3L3yDOwsGntML1tqeWx+
   dX/WSbA7MZQn9Lcukne4ng3pQCHwYCiOZVOllIJsdqIad+QB3qvT0z/iV
   pxzt/d64K583xGT662CmHw77DRciUo5hTkBHo9dvINcq9zu7SxrmjayFv
   jOqac0Tn0x0CI7UAwdABpky0yNIRA+LnIEThNJjz7l9sEavggkyTstpJ/
   rIVaPAyHZlx/PCM4CjtFnf/avtgfCmsI31iyZKeB502jtNzVtgRuKOa+u
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="374776440"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; 
   d="scan'208";a="374776440"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2022 11:37:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="965294238"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; 
   d="scan'208";a="965294238"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
  by fmsmga005.fm.intel.com with SMTP; 07 Nov 2022 11:37:09 -0800
Received: by stinkbox (sSMTP sendmail emulation); Mon, 07 Nov 2022 21:37:08 +0200
Date:   Mon, 7 Nov 2022 21:37:08 +0200
From:   Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To:     Jessica Zhang <quic_jesszhan@quicinc.com>
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
        swboyd@chromium.org, daniel.vetter@ffwll.ch, seanpaul@chromium.org,
        laurent.pinchart@ideasonboard.com, dmitry.baryshkov@linaro.org
Subject: Re: [RFC PATCH 0/3] Support for Solid Fill Planes
Message-ID: <Y2leZDfLj/5963wl@intel.com>
References: <20221028225952.160-1-quic_jesszhan@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221028225952.160-1-quic_jesszhan@quicinc.com>
X-Patchwork-Hint: comment
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Oct 28, 2022 at 03:59:49PM -0700, Jessica Zhang wrote:
> Introduce and add support for COLOR_FILL and COLOR_FILL_FORMAT
> properties. When the color fill value is set, and the framebuffer is set
> to NULL, memory fetch will be disabled.

Thinking a bit more universally I wonder if there should be
some kind of enum property:

enum plane_pixel_source {
	FB,
	COLOR,
	LIVE_FOO,
	LIVE_BAR,
	...
}

> In addition, loosen the NULL FB checks within the atomic commit callstack
> to allow a NULL FB when color_fill is nonzero and add FB checks in
> methods where the FB was previously assumed to be non-NULL.
> 
> Finally, have the DPU driver use drm_plane_state.color_fill and
> drm_plane_state.color_fill_format instead of dpu_plane_state.color_fill,
> and add extra checks in the DPU atomic commit callstack to account for a
> NULL FB in cases where color_fill is set.
> 
> Some drivers support hardware that have optimizations for solid fill
> planes. This series aims to expose these capabilities to userspace as
> some compositors have a solid fill flag (ex. SOLID_COLOR in the Android
> hardware composer HAL) that can be set by apps like the Android Gears
> app.
> 
> Userspace can set the color_fill value by setting COLOR_FILL_FORMAT to a
> DRM format, setting COLOR_FILL to a color fill value, and setting the
> framebuffer to NULL.

Is there some real reason for the format property? Ie. why not 
just do what was the plan for the crttc background color and
specify the color in full 16bpc format and just pick as many
msbs from that as the hw can use?

> 
> Jessica Zhang (3):
>   drm: Introduce color fill properties for drm plane
>   drm: Adjust atomic checks for solid fill color
>   drm/msm/dpu: Use color_fill property for DPU planes
> 
>  drivers/gpu/drm/drm_atomic.c              | 68 ++++++++++++-----------
>  drivers/gpu/drm/drm_atomic_helper.c       | 34 +++++++-----
>  drivers/gpu/drm/drm_atomic_uapi.c         |  8 +++
>  drivers/gpu/drm/drm_blend.c               | 38 +++++++++++++
>  drivers/gpu/drm/drm_plane.c               |  8 +--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  7 ++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 66 ++++++++++++++--------
>  include/drm/drm_atomic_helper.h           |  5 +-
>  include/drm/drm_blend.h                   |  2 +
>  include/drm/drm_plane.h                   | 28 ++++++++++
>  10 files changed, 188 insertions(+), 76 deletions(-)
> 
> -- 
> 2.38.0

-- 
Ville Syrjälä
Intel
