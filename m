Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EAFB3002C1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Jan 2021 13:21:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727256AbhAVMT2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Jan 2021 07:19:28 -0500
Received: from mga02.intel.com ([134.134.136.20]:44424 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728007AbhAVMJO (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Jan 2021 07:09:14 -0500
IronPort-SDR: J1cRqzL8Yg5NuWT2ihPY3JWXzdJplrWkxKvBhuijh5kFyqnDpncI3xiaJsiw7PYDYQH4L1Qhb2
 GOOikGKB8L8A==
X-IronPort-AV: E=McAfee;i="6000,8403,9871"; a="166537736"
X-IronPort-AV: E=Sophos;i="5.79,366,1602572400"; 
   d="scan'208";a="166537736"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2021 04:07:28 -0800
IronPort-SDR: LI7d1B/P80MeyJkVkKXKN7OEzVq/WmfB9ZPT+CyMbHq5Dbr0B1vmeqlILwhcjOQ2ieQXgKqBA2
 BA4zdrJP78EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,366,1602572400"; 
   d="scan'208";a="427949436"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
  by orsmga001.jf.intel.com with SMTP; 22 Jan 2021 04:07:22 -0800
Received: by stinkbox (sSMTP sendmail emulation); Fri, 22 Jan 2021 14:07:22 +0200
Date:   Fri, 22 Jan 2021 14:07:22 +0200
From:   Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>,
        freedreno@lists.freedesktop.org, Tomi Valkeinen <tomba@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Jyri Sarha <jyri.sarha@iki.fi>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 06/11] drm: Use state helper instead of plane state
 pointer in atomic_check
Message-ID: <YAq/+udQfTwdamQ0@intel.com>
References: <20210121163537.1466118-1-maxime@cerno.tech>
 <20210121163537.1466118-6-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210121163537.1466118-6-maxime@cerno.tech>
X-Patchwork-Hint: comment
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jan 21, 2021 at 05:35:31PM +0100, Maxime Ripard wrote:
> Many drivers reference the plane->state pointer in order to get the
> current plane state in their atomic_check hook, which would be the old
> plane state in the global atomic state since _swap_state hasn't happened
> when atomic_check is run.
> 
> Use the drm_atomic_get_old_plane_state helper to get that state to make
> it more obvious.
> 
> This was made using the coccinelle script below:
> 
> @ plane_atomic_func @
> identifier helpers;
> identifier func;
> @@
> 
> static struct drm_plane_helper_funcs helpers = {
> 	...,
> 	.atomic_check = func,
> 	...,
> };
> 
> @ replaces_old_state @
> identifier plane_atomic_func.func;
> identifier plane, state, plane_state;
> @@
> 
>  func(struct drm_plane *plane, struct drm_atomic_state *state) {
>  	...
> -	struct drm_plane_state *plane_state = plane->state;
> +	struct drm_plane_state *plane_state = drm_atomic_get_old_plane_state(state, plane);
>  	...
>  }
> 
> @@
> identifier plane_atomic_func.func;
> identifier plane, state, plane_state;
> @@
> 
>  func(struct drm_plane *plane, struct drm_atomic_state *state) {
>  	struct drm_plane_state *plane_state = drm_atomic_get_old_plane_state(state, plane);
>  	...
> -	plane->state
> +	plane_state
>  	...

We don't need the <... ...> style here? It's been a while since
I did any serious cocci so I'm getting a bit rusty on the details...

Otherwise looks great
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

>  }
> 
> @ adds_old_state @
> identifier plane_atomic_func.func;
> identifier plane, state;
> @@
> 
>  func(struct drm_plane *plane, struct drm_atomic_state *state) {
> +	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state, plane);
>  	...
> -	plane->state
> +	old_plane_state
>  	...
>  }
> 
> @ include depends on adds_old_state || replaces_old_state @
> @@
> 
>  #include <drm/drm_atomic.h>
> 
> @ no_include depends on !include && (adds_old_state || replaces_old_state) @
> @@
> 
> + #include <drm/drm_atomic.h>
>   #include <drm/...>
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/gpu/drm/imx/ipuv3-plane.c          | 3 ++-
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c | 4 +++-
>  drivers/gpu/drm/tilcdc/tilcdc_plane.c      | 3 ++-
>  3 files changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/imx/ipuv3-plane.c b/drivers/gpu/drm/imx/ipuv3-plane.c
> index b5f6123850bb..6484592e3f86 100644
> --- a/drivers/gpu/drm/imx/ipuv3-plane.c
> +++ b/drivers/gpu/drm/imx/ipuv3-plane.c
> @@ -341,7 +341,8 @@ static int ipu_plane_atomic_check(struct drm_plane *plane,
>  {
>  	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
>  									   plane);
> -	struct drm_plane_state *old_state = plane->state;
> +	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
> +									   plane);
>  	struct drm_crtc_state *crtc_state;
>  	struct device *dev = plane->dev->dev;
>  	struct drm_framebuffer *fb = new_state->fb;
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
> index 4aac6217a5ad..6ce6ce09fecc 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
> @@ -406,12 +406,14 @@ static int mdp5_plane_atomic_check_with_state(struct drm_crtc_state *crtc_state,
>  static int mdp5_plane_atomic_check(struct drm_plane *plane,
>  				   struct drm_atomic_state *state)
>  {
> +	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state,
> +										 plane);
>  	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
>  										 plane);
>  	struct drm_crtc *crtc;
>  	struct drm_crtc_state *crtc_state;
>  
> -	crtc = new_plane_state->crtc ? new_plane_state->crtc : plane->state->crtc;
> +	crtc = new_plane_state->crtc ? new_plane_state->crtc : old_plane_state->crtc;
>  	if (!crtc)
>  		return 0;
>  
> diff --git a/drivers/gpu/drm/tilcdc/tilcdc_plane.c b/drivers/gpu/drm/tilcdc/tilcdc_plane.c
> index ebdd42dcaf82..c86258132432 100644
> --- a/drivers/gpu/drm/tilcdc/tilcdc_plane.c
> +++ b/drivers/gpu/drm/tilcdc/tilcdc_plane.c
> @@ -26,7 +26,8 @@ static int tilcdc_plane_atomic_check(struct drm_plane *plane,
>  	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
>  									   plane);
>  	struct drm_crtc_state *crtc_state;
> -	struct drm_plane_state *old_state = plane->state;
> +	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
> +									   plane);
>  	unsigned int pitch;
>  
>  	if (!new_state->crtc)
> -- 
> 2.29.2
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Ville Syrjälä
Intel
