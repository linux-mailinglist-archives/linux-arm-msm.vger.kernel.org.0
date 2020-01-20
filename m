Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66724142EED
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2020 16:40:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726942AbgATPkl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jan 2020 10:40:41 -0500
Received: from mga09.intel.com ([134.134.136.24]:16738 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726819AbgATPkk (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jan 2020 10:40:40 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 20 Jan 2020 07:40:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,342,1574150400"; 
   d="scan'208";a="220698779"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
  by fmsmga007.fm.intel.com with SMTP; 20 Jan 2020 07:40:31 -0800
Received: by stinkbox (sSMTP sendmail emulation); Mon, 20 Jan 2020 17:40:31 +0200
Date:   Mon, 20 Jan 2020 17:40:31 +0200
From:   Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     airlied@linux.ie, daniel@ffwll.ch, alexander.deucher@amd.com,
        christian.koenig@amd.com, David1.Zhou@amd.com,
        maarten.lankhorst@linux.intel.com, patrik.r.jakobsson@gmail.com,
        robdclark@gmail.com, sean@poorly.run, benjamin.gaignard@linaro.org,
        vincent.abriou@st.com, yannick.fertre@st.com,
        philippe.cornu@st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, eric@anholt.net,
        rodrigosiqueiramelo@gmail.com, hamohammed.sa@gmail.com,
        linux-graphics-maintainer@vmware.com, thellstrom@vmware.com,
        bskeggs@redhat.com, harry.wentland@amd.com, sunpeng.li@amd.com,
        jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
        rodrigo.vivi@intel.com, linux-arm-msm@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH v3 22/22] drm: Remove legacy version of
 get_scanout_position()
Message-ID: <20200120154031.GY13686@intel.com>
References: <20200120082314.14756-1-tzimmermann@suse.de>
 <20200120082314.14756-23-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200120082314.14756-23-tzimmermann@suse.de>
X-Patchwork-Hint: comment
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jan 20, 2020 at 09:23:14AM +0100, Thomas Zimmermann wrote:
> The legacy version of get_scanout_position() was only useful while
> drivers still used drm_driver.get_scanout_position(). With no such
> drivers left, the related typedef and code can be removed
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/drm_vblank.c    | 27 +++++++--------------------
>  drivers/gpu/drm/i915/i915_irq.c |  2 +-
>  include/drm/drm_vblank.h        | 10 +---------
>  3 files changed, 9 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> index 34428ce3c676..0bda7d7a0af2 100644
> --- a/drivers/gpu/drm/drm_vblank.c
> +++ b/drivers/gpu/drm/drm_vblank.c
> @@ -576,9 +576,6 @@ EXPORT_SYMBOL(drm_calc_timestamping_constants);
>   * @get_scanout_position:
>   *     Callback function to retrieve the scanout position. See
>   *     @struct drm_crtc_helper_funcs.get_scanout_position.
> - * @get_scanout_position_legacy:
> - *     Callback function to retrieve the scanout position. See
> - *     @struct drm_driver.get_scanout_position.
>   *
>   * Implements calculation of exact vblank timestamps from given drm_display_mode
>   * timings and current video scanout position of a CRTC.
> @@ -601,8 +598,7 @@ bool
>  drm_crtc_vblank_helper_get_vblank_timestamp_internal(
>  	struct drm_crtc *crtc, int *max_error, ktime_t *vblank_time,
>  	bool in_vblank_irq,
> -	drm_vblank_get_scanout_position_func get_scanout_position,
> -	drm_vblank_get_scanout_position_legacy_func get_scanout_position_legacy)
> +	drm_vblank_get_scanout_position_func get_scanout_position)
>  {
>  	struct drm_device *dev = crtc->dev;
>  	unsigned int pipe = crtc->index;
> @@ -620,7 +616,7 @@ drm_crtc_vblank_helper_get_vblank_timestamp_internal(
>  	}
>  
>  	/* Scanout position query not supported? Should not happen. */
> -	if (!get_scanout_position && !get_scanout_position_legacy) {
> +	if (!get_scanout_position) {
>  		DRM_ERROR("Called from CRTC w/o get_scanout_position()!?\n");
>  		return false;
>  	}
> @@ -651,19 +647,10 @@ drm_crtc_vblank_helper_get_vblank_timestamp_internal(
>  		 * Get vertical and horizontal scanout position vpos, hpos,
>  		 * and bounding timestamps stime, etime, pre/post query.
>  		 */
> -		if (get_scanout_position) {
> -			vbl_status = get_scanout_position(crtc,
> -							  in_vblank_irq,
> -							  &vpos, &hpos,
> -							  &stime, &etime,
> -							  mode);
> -		} else {
> -			vbl_status = get_scanout_position_legacy(dev, pipe,
> -								 in_vblank_irq,
> -								 &vpos, &hpos,
> -								 &stime, &etime,
> -								 mode);
> -		}
> +		vbl_status = get_scanout_position(crtc, in_vblank_irq,
> +						  &vpos, &hpos,
> +						  &stime, &etime,
> +						  mode);
>  
>  		/* Return as no-op if scanout query unsupported or failed. */
>  		if (!vbl_status) {
> @@ -755,7 +742,7 @@ bool drm_crtc_vblank_helper_get_vblank_timestamp(struct drm_crtc *crtc,
>  {
>  	return drm_crtc_vblank_helper_get_vblank_timestamp_internal(
>  		crtc, max_error, vblank_time, in_vblank_irq,
> -		crtc->helper_private->get_scanout_position, NULL);
> +		crtc->helper_private->get_scanout_position);
>  }
>  EXPORT_SYMBOL(drm_crtc_vblank_helper_get_vblank_timestamp);
>  
> diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
> index 29bf847999f5..3245f7c5c84f 100644
> --- a/drivers/gpu/drm/i915/i915_irq.c
> +++ b/drivers/gpu/drm/i915/i915_irq.c
> @@ -886,7 +886,7 @@ bool intel_crtc_get_vblank_timestamp(struct drm_crtc *crtc, int *max_error,
>  {
>  	return drm_crtc_vblank_helper_get_vblank_timestamp_internal(
>  		crtc, max_error, vblank_time, in_vblank_irq,
> -		i915_get_crtc_scanoutpos, NULL);
> +		i915_get_crtc_scanoutpos);
>  }
>  
>  int intel_get_crtc_scanline(struct intel_crtc *crtc)
> diff --git a/include/drm/drm_vblank.h b/include/drm/drm_vblank.h
> index a6ca8be93dd8..0f474e855e7f 100644
> --- a/include/drm/drm_vblank.h
> +++ b/include/drm/drm_vblank.h
> @@ -245,20 +245,12 @@ typedef bool (*drm_vblank_get_scanout_position_func)(struct drm_crtc *crtc,
>  						     ktime_t *stime, ktime_t *etime,
>  						     const struct drm_display_mode *mode);
>  
> -typedef bool (*drm_vblank_get_scanout_position_legacy_func)(struct drm_device *dev,
> -							    unsigned int pipe,
> -							    bool in_vblank_irq,
> -							    int *vpos, int *hpos,
> -							    ktime_t *stime, ktime_t *etime,
> -							    const struct drm_display_mode *mode);
> -
>  bool
>  drm_crtc_vblank_helper_get_vblank_timestamp_internal(struct drm_crtc *crtc,
>  						     int *max_error,
>  						     ktime_t *vblank_time,
>  						     bool in_vblank_irq,
> -						     drm_vblank_get_scanout_position_func get_scanout_position,
> -						     drm_vblank_get_scanout_position_legacy_func get_scanout_position_legacy);
> +						     drm_vblank_get_scanout_position_func get_scanout_position);
>  bool drm_crtc_vblank_helper_get_vblank_timestamp(struct drm_crtc *crtc,
>  						 int *max_error,
>  						 ktime_t *vblank_time,
> -- 
> 2.24.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Ville Syrjälä
Intel
