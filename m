Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA24F271ECA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Sep 2020 11:20:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726347AbgIUJUq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Sep 2020 05:20:46 -0400
Received: from mga03.intel.com ([134.134.136.65]:3220 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726326AbgIUJUp (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Sep 2020 05:20:45 -0400
IronPort-SDR: mi9X1DpcFSBOBVXIftCpo0qvDLPKZc+A5uWEEix/mHTDSu46aHfix4NU4PE+Ii3OYgl4PvbLqL
 W8GvODca/kvA==
X-IronPort-AV: E=McAfee;i="6000,8403,9750"; a="160393758"
X-IronPort-AV: E=Sophos;i="5.77,286,1596524400"; 
   d="scan'208";a="160393758"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2020 02:20:42 -0700
IronPort-SDR: QnzPM9M9h2F2s0POMjDYZwrSHaFwQcH6LaraSEMoqaxR8Plh60hbrn8SlpFwXi011Bz1JhLDx3
 JD34DrGHcbag==
X-IronPort-AV: E=Sophos;i="5.77,286,1596524400"; 
   d="scan'208";a="453942444"
Received: from pamcglyn-mobl.ger.corp.intel.com (HELO localhost) ([10.251.84.51])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2020 02:20:37 -0700
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>,
        Peter Zijlstra <peterz@infradead.org>,
        linux-arm-msm@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>, timmurray@google.com,
        David Airlie <airlied@linux.ie>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Tejun Heo <tj@kernel.org>
Subject: Re: [PATCH 1/3] drm/crtc: Introduce per-crtc kworker
In-Reply-To: <20200919193727.2093945-2-robdclark@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200919193727.2093945-1-robdclark@gmail.com> <20200919193727.2093945-2-robdclark@gmail.com>
Date:   Mon, 21 Sep 2020 12:20:46 +0300
Message-ID: <871rivscy9.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 19 Sep 2020, Rob Clark <robdclark@gmail.com> wrote:
> From: Rob Clark <robdclark@chromium.org>
>
> This will be used for non-block atomic commits.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/drm_crtc.c | 11 +++++++++++
>  include/drm/drm_crtc.h     |  8 ++++++++
>  2 files changed, 19 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
> index aecdd7ea26dc..4f7c0bfce0a3 100644
> --- a/drivers/gpu/drm/drm_crtc.c
> +++ b/drivers/gpu/drm/drm_crtc.c
> @@ -326,6 +326,14 @@ int drm_crtc_init_with_planes(struct drm_device *dev, struct drm_crtc *crtc,
>  					   config->prop_out_fence_ptr, 0);
>  		drm_object_attach_property(&crtc->base,
>  					   config->prop_vrr_enabled, 0);
> +
> +		crtc->worker = kthread_create_worker(0, "%s-worker", crtc->name);
> +		if (IS_ERR(crtc->worker)) {
> +			drm_mode_object_unregister(dev, &crtc->base);
> +			ret = PTR_ERR(crtc->worker);
> +			crtc->worker = NULL;
> +			return ret;
> +		}
>  	}
>  
>  	return 0;
> @@ -366,6 +374,9 @@ void drm_crtc_cleanup(struct drm_crtc *crtc)
>  
>  	kfree(crtc->name);
>  
> +	if (crtc->worker)
> +		kthread_destroy_worker(crtc->worker);
> +
>  	memset(crtc, 0, sizeof(*crtc));
>  }
>  EXPORT_SYMBOL(drm_crtc_cleanup);
> diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
> index 59b51a09cae6..8964a3732bca 100644
> --- a/include/drm/drm_crtc.h
> +++ b/include/drm/drm_crtc.h
> @@ -30,6 +30,7 @@
>  #include <linux/types.h>
>  #include <linux/fb.h>
>  #include <linux/hdmi.h>
> +#include <linux/kthread.h>

A forward declaration would suffice.

>  #include <linux/media-bus-format.h>
>  #include <uapi/drm/drm_mode.h>
>  #include <uapi/drm/drm_fourcc.h>
> @@ -1172,6 +1173,13 @@ struct drm_crtc {
>  	 * Initialized via drm_self_refresh_helper_init().
>  	 */
>  	struct drm_self_refresh_data *self_refresh_data;
> +
> +	/**
> +	 * worker:

Missing @, should be "@worker:".

> +	 *
> +	 * Per-CRTC worker for nonblock atomic commits.
> +	 */
> +	struct kthread_worker *worker;
>  };
>  
>  /**

-- 
Jani Nikula, Intel Open Source Graphics Center
