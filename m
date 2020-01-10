Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 623A2136ED0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2020 14:56:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727951AbgAJN4U (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jan 2020 08:56:20 -0500
Received: from mga06.intel.com ([134.134.136.31]:29009 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727784AbgAJN4U (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jan 2020 08:56:20 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 10 Jan 2020 05:56:19 -0800
X-IronPort-AV: E=Sophos;i="5.69,417,1571727600"; 
   d="scan'208";a="371616160"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 10 Jan 2020 05:56:08 -0800
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>, airlied@linux.ie,
        daniel@ffwll.ch, alexander.deucher@amd.com,
        christian.koenig@amd.com, David1.Zhou@amd.com,
        maarten.lankhorst@linux.intel.com, patrik.r.jakobsson@gmail.com,
        robdclark@gmail.com, sean@poorly.run, benjamin.gaignard@linaro.org,
        vincent.abriou@st.com, yannick.fertre@st.com,
        philippe.cornu@st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, eric@anholt.net,
        rodrigosiqueiramelo@gmail.com, hamohammed.sa@gmail.com,
        linux-graphics-maintainer@vmware.com, thellstrom@vmware.com,
        bskeggs@redhat.com, harry.wentland@amd.com, sunpeng.li@amd.com,
        joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com
Cc:     linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        nouveau@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 03/23] drm/i915: Don't use struct drm_driver.get_scanout_position()
In-Reply-To: <761ae94c-aaf1-9167-9c44-06824304fdfd@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200110092127.27847-1-tzimmermann@suse.de> <20200110092127.27847-4-tzimmermann@suse.de> <87eew7o73u.fsf@intel.com> <761ae94c-aaf1-9167-9c44-06824304fdfd@suse.de>
Date:   Fri, 10 Jan 2020 15:56:06 +0200
Message-ID: <875zhjo1op.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 10 Jan 2020, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Hi
>
> Am 10.01.20 um 12:59 schrieb Jani Nikula:
>> On Fri, 10 Jan 2020, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>>> The callback struct drm_driver.get_scanout_position() is deprecated in
>>> favor of struct drm_crtc_helper_funcs.get_scanout_position().
>>>
>>> i915 doesn't use CRTC helpers. The patch duplicates the caller
>>> drm_calc_vbltimestamp_from_scanoutpos() for i915, such that the callback
>>> function is not needed.
>>>
>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> ---
>>>  drivers/gpu/drm/i915/i915_drv.c |   3 +-
>>>  drivers/gpu/drm/i915/i915_irq.c | 117 ++++++++++++++++++++++++++++++--
>>>  drivers/gpu/drm/i915/i915_irq.h |   9 +--
>>>  3 files changed, 119 insertions(+), 10 deletions(-)
>> 
>> Not really enthusiastic about the diffstat in a "cleanup" series.
>
> Well, the cleanup is about the content of drm_driver :)
>
>> 
>> I wonder if you could add a generic helper version of
>> drm_calc_vbltimestamp_from_scanoutpos where you pass the
>> get_scanout_position function as a parameter. Both
>> drm_calc_vbltimestamp_from_scanoutpos and the new
>> i915_calc_vbltimestamp_from_scanoutpos would then be fairly thin
>> wrappers passing in the relevant get_scanout_position function.
>
> Of course. Will be in v2 of the series.

Please give Ville (Cc'd) a moment before sending v2 in case he wants to
chime in on this.

Thanks,
Jani.


>
> Best regards
> Thomas
>
>> 
>> This would reduce the almost identical duplication of the function in
>> i915.
>> 
>> BR,
>> Jani.
>> 
>>>
>>> diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
>>> index f7385abdd74b..4a0a7fb85c53 100644
>>> --- a/drivers/gpu/drm/i915/i915_drv.c
>>> +++ b/drivers/gpu/drm/i915/i915_drv.c
>>> @@ -2769,8 +2769,7 @@ static struct drm_driver driver = {
>>>  	.gem_prime_export = i915_gem_prime_export,
>>>  	.gem_prime_import = i915_gem_prime_import,
>>>  
>>> -	.get_vblank_timestamp = drm_calc_vbltimestamp_from_scanoutpos,
>>> -	.get_scanout_position = i915_get_crtc_scanoutpos,
>>> +	.get_vblank_timestamp = i915_calc_vbltimestamp_from_scanoutpos,
>>>  
>>>  	.dumb_create = i915_gem_dumb_create,
>>>  	.dumb_map_offset = i915_gem_dumb_mmap_offset,
>>> diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
>>> index afc6aad9bf8c..99d0c3b0feae 100644
>>> --- a/drivers/gpu/drm/i915/i915_irq.c
>>> +++ b/drivers/gpu/drm/i915/i915_irq.c
>>> @@ -52,6 +52,11 @@
>>>  #include "i915_trace.h"
>>>  #include "intel_pm.h"
>>>  
>>> +/* Retry timestamp calculation up to 3 times to satisfy
>>> + * drm_timestamp_precision before giving up.
>>> + */
>>> +#define I915_TIMESTAMP_MAXRETRIES 3
>>> +
>>>  /**
>>>   * DOC: interrupt handling
>>>   *
>>> @@ -762,10 +767,11 @@ static int __intel_get_crtc_scanline(struct intel_crtc *crtc)
>>>  	return (position + crtc->scanline_offset) % vtotal;
>>>  }
>>>  
>>> -bool i915_get_crtc_scanoutpos(struct drm_device *dev, unsigned int index,
>>> -			      bool in_vblank_irq, int *vpos, int *hpos,
>>> -			      ktime_t *stime, ktime_t *etime,
>>> -			      const struct drm_display_mode *mode)
>>> +static bool i915_get_crtc_scanoutpos(struct drm_device *dev,
>>> +				     unsigned int index, bool in_vblank_irq,
>>> +				     int *vpos, int *hpos,
>>> +				     ktime_t *stime, ktime_t *etime,
>>> +				     const struct drm_display_mode *mode)
>>>  {
>>>  	struct drm_i915_private *dev_priv = to_i915(dev);
>>>  	struct intel_crtc *crtc = to_intel_crtc(drm_crtc_from_index(dev, index));
>>> @@ -879,6 +885,109 @@ bool i915_get_crtc_scanoutpos(struct drm_device *dev, unsigned int index,
>>>  	return true;
>>>  }
>>>  
>>> +bool i915_calc_vbltimestamp_from_scanoutpos(struct drm_device *dev,
>>> +					    unsigned int pipe,
>>> +					    int *max_error,
>>> +					    ktime_t *vblank_time,
>>> +					    bool in_vblank_irq)
>>> +{
>>> +	struct timespec64 ts_etime, ts_vblank_time;
>>> +	ktime_t stime, etime;
>>> +	bool vbl_status;
>>> +	struct drm_crtc *crtc;
>>> +	const struct drm_display_mode *mode;
>>> +	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
>>> +	int vpos, hpos, i;
>>> +	int delta_ns, duration_ns;
>>> +
>>> +	crtc = drm_crtc_from_index(dev, pipe);
>>> +
>>> +	if (pipe >= dev->num_crtcs || !crtc) {
>>> +		DRM_ERROR("Invalid crtc %u\n", pipe);
>>> +		return false;
>>> +	}
>>> +
>>> +	if (drm_drv_uses_atomic_modeset(dev))
>>> +		mode = &vblank->hwmode;
>>> +	else
>>> +		mode = &crtc->hwmode;
>>> +
>>> +	/* If mode timing undefined, just return as no-op:
>>> +	 * Happens during initial modesetting of a crtc.
>>> +	 */
>>> +	if (mode->crtc_clock == 0) {
>>> +		DRM_DEBUG("crtc %u: Noop due to uninitialized mode.\n", pipe);
>>> +		WARN_ON_ONCE(drm_drv_uses_atomic_modeset(dev));
>>> +
>>> +		return false;
>>> +	}
>>> +
>>> +	/* Get current scanout position with system timestamp.
>>> +	 * Repeat query up to DRM_TIMESTAMP_MAXRETRIES times
>>> +	 * if single query takes longer than max_error nanoseconds.
>>> +	 *
>>> +	 * This guarantees a tight bound on maximum error if
>>> +	 * code gets preempted or delayed for some reason.
>>> +	 */
>>> +	for (i = 0; i < I915_TIMESTAMP_MAXRETRIES; i++) {
>>> +		/*
>>> +		 * Get vertical and horizontal scanout position vpos, hpos,
>>> +		 * and bounding timestamps stime, etime, pre/post query.
>>> +		 */
>>> +		vbl_status = i915_get_crtc_scanoutpos(dev, pipe, in_vblank_irq,
>>> +						      &vpos, &hpos, &stime,
>>> +						      &etime, mode);
>>> +		/* Return as no-op if scanout query unsupported or failed. */
>>> +		if (!vbl_status) {
>>> +			DRM_DEBUG("crtc %u : scanoutpos query failed.\n",
>>> +				  pipe);
>>> +			return false;
>>> +		}
>>> +
>>> +		/* Compute uncertainty in timestamp of scanout position query. */
>>> +		duration_ns = ktime_to_ns(etime) - ktime_to_ns(stime);
>>> +
>>> +		/* Accept result with <  max_error nsecs timing uncertainty. */
>>> +		if (duration_ns <= *max_error)
>>> +			break;
>>> +	}
>>> +
>>> +	/* Noisy system timing? */
>>> +	if (i == I915_TIMESTAMP_MAXRETRIES) {
>>> +		DRM_DEBUG("crtc %u: Noisy timestamp %d us > %d us [%d reps].\n",
>>> +			  pipe, duration_ns/1000, *max_error/1000, i);
>>> +	}
>>> +
>>> +	/* Return upper bound of timestamp precision error. */
>>> +	*max_error = duration_ns;
>>> +
>>> +	/* Convert scanout position into elapsed time at raw_time query
>>> +	 * since start of scanout at first display scanline. delta_ns
>>> +	 * can be negative if start of scanout hasn't happened yet.
>>> +	 */
>>> +	delta_ns = div_s64(1000000LL * (vpos * mode->crtc_htotal + hpos),
>>> +			   mode->crtc_clock);
>>> +
>>> +	/* Subtract time delta from raw timestamp to get final
>>> +	 * vblank_time timestamp for end of vblank.
>>> +	 */
>>> +	*vblank_time = ktime_sub_ns(etime, delta_ns);
>>> +
>>> +	if (!drm_debug_enabled(DRM_UT_VBL))
>>> +		return true;
>>> +
>>> +	ts_etime = ktime_to_timespec64(etime);
>>> +	ts_vblank_time = ktime_to_timespec64(*vblank_time);
>>> +
>>> +	DRM_DEBUG_VBL("crtc %u : v p(%d,%d)@ %lld.%06ld -> %lld.%06ld [e %d us, %d rep]\n",
>>> +		      pipe, hpos, vpos,
>>> +		      (u64)ts_etime.tv_sec, ts_etime.tv_nsec / 1000,
>>> +		      (u64)ts_vblank_time.tv_sec, ts_vblank_time.tv_nsec / 1000,
>>> +		      duration_ns / 1000, i);
>>> +
>>> +	return true;
>>> +}
>>> +
>>>  int intel_get_crtc_scanline(struct intel_crtc *crtc)
>>>  {
>>>  	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
>>> diff --git a/drivers/gpu/drm/i915/i915_irq.h b/drivers/gpu/drm/i915/i915_irq.h
>>> index 812c47a9c2d6..5f7b133ce721 100644
>>> --- a/drivers/gpu/drm/i915/i915_irq.h
>>> +++ b/drivers/gpu/drm/i915/i915_irq.h
>>> @@ -101,10 +101,11 @@ void gen8_irq_power_well_post_enable(struct drm_i915_private *dev_priv,
>>>  void gen8_irq_power_well_pre_disable(struct drm_i915_private *dev_priv,
>>>  				     u8 pipe_mask);
>>>  
>>> -bool i915_get_crtc_scanoutpos(struct drm_device *dev, unsigned int pipe,
>>> -			      bool in_vblank_irq, int *vpos, int *hpos,
>>> -			      ktime_t *stime, ktime_t *etime,
>>> -			      const struct drm_display_mode *mode);
>>> +bool i915_calc_vbltimestamp_from_scanoutpos(struct drm_device *dev,
>>> +					    unsigned int pipe,
>>> +					    int *max_error,
>>> +					    ktime_t *vblank_time,
>>> +					    bool in_vblank_irq);
>>>  
>>>  u32 i915_get_vblank_counter(struct drm_crtc *crtc);
>>>  u32 g4x_get_vblank_counter(struct drm_crtc *crtc);
>> 

-- 
Jani Nikula, Intel Open Source Graphics Center
