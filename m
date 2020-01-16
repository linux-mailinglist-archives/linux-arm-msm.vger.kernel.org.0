Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5F3B13D8DA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2020 12:21:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726045AbgAPLVa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Jan 2020 06:21:30 -0500
Received: from mga01.intel.com ([192.55.52.88]:3856 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726018AbgAPLVa (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Jan 2020 06:21:30 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 16 Jan 2020 03:21:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,326,1574150400"; 
   d="scan'208";a="243243120"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
  by orsmga002.jf.intel.com with SMTP; 16 Jan 2020 03:21:22 -0800
Received: by stinkbox (sSMTP sendmail emulation); Thu, 16 Jan 2020 13:21:21 +0200
Date:   Thu, 16 Jan 2020 13:21:21 +0200
From:   Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     hamohammed.sa@gmail.com, airlied@linux.ie,
        nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        amd-gfx@lists.freedesktop.org, alexandre.torgue@st.com,
        thellstrom@vmware.com, sean@poorly.run,
        linux-graphics-maintainer@vmware.com, bskeggs@redhat.com,
        mcoquelin.stm32@gmail.com, sunpeng.li@amd.com,
        linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        rodrigo.vivi@intel.com, vincent.abriou@st.com,
        rodrigosiqueiramelo@gmail.com, philippe.cornu@st.com,
        yannick.fertre@st.com, alexander.deucher@amd.com,
        freedreno@lists.freedesktop.org, christian.koenig@amd.com
Subject: Re: [Intel-gfx] [PATCH v2 03/21] drm: Add get_vblank_timestamp() to
 struct drm_crtc_funcs
Message-ID: <20200116112121.GE13686@intel.com>
References: <20200115121652.7050-1-tzimmermann@suse.de>
 <20200115121652.7050-4-tzimmermann@suse.de>
 <20200115144938.GA13686@intel.com>
 <5ce4974a-8a56-3827-f4a0-b5f74979ef4e@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5ce4974a-8a56-3827-f4a0-b5f74979ef4e@suse.de>
X-Patchwork-Hint: comment
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jan 16, 2020 at 09:44:55AM +0100, Thomas Zimmermann wrote:
> Hi
> 
> Am 15.01.20 um 15:49 schrieb Ville Syrj�l�:
> > On Wed, Jan 15, 2020 at 01:16:34PM +0100, Thomas Zimmermann wrote:
<snip>
> >> @@ -2020,3 +2042,193 @@ int drm_crtc_queue_sequence_ioctl(struct drm_device *dev, void *data,
> >>  	kfree(e);
> >>  	return ret;
> >>  }
> >> +
> >> +/*
> >> + * Helpers for struct drm_crtc_funcs
> >> + */
> >> +
> >> +/**
> >> + * drm_crtc_vblank_helper_get_vblank_timestamp_internal - precise vblank
> >> + *                                                        timestamp helper
> >> + * @dev: DRM device
> >> + * @pipe: index of CRTC whose vblank timestamp to retrieve
> >> + * @max_error: Desired maximum allowable error in timestamps (nanosecs)
> >> + *             On return contains true maximum error of timestamp
> >> + * @vblank_time: Pointer to time which should receive the timestamp
> >> + * @in_vblank_irq:
> >> + *     True when called from drm_crtc_handle_vblank().  Some drivers
> >> + *     need to apply some workarounds for gpu-specific vblank irq quirks
> >> + *     if flag is set.
> >> + * @get_scanout_position:
> >> + *     Callback function to retrieve the scanout position. See
> >> + *     @struct drm_crtc_helper_funcs.get_scanout_position.
> >> + *
> >> + * Implements calculation of exact vblank timestamps from given drm_display_mode
> >> + * timings and current video scanout position of a CRTC.
> >> + *
> >> + * The current implementation only handles standard video modes. For double scan
> >> + * and interlaced modes the driver is supposed to adjust the hardware mode
> >> + * (taken from &drm_crtc_state.adjusted mode for atomic modeset drivers) to
> >> + * match the scanout position reported.
> >> + *
> >> + * Note that atomic drivers must call drm_calc_timestamping_constants() before
> >> + * enabling a CRTC. The atomic helpers already take care of that in
> >> + * drm_atomic_helper_update_legacy_modeset_state().
> >> + *
> >> + * Returns:
> >> + *
> >> + * Returns true on success, and false on failure, i.e. when no accurate
> >> + * timestamp could be acquired.
> >> + */
> >> +bool
> >> +drm_crtc_vblank_helper_get_vblank_timestamp_internal(
> >> +	struct drm_crtc *crtc, int *max_error, ktime_t *vblank_time,
> >> +	bool in_vblank_irq,
> >> +	bool (*get_scanout_position)(struct drm_crtc *crtc,
> >> +                                     bool in_vblank_irq, int *vpos, int *hpos,
> >> +                                     ktime_t *stime, ktime_t *etime,
> >> +                                     const struct drm_display_mode *mode))
> >> +{
> >> +	struct drm_device *dev = crtc->dev;
> >> +	unsigned int pipe = crtc->index;
> >> +	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
> >> +	struct timespec64 ts_etime, ts_vblank_time;
> >> +	ktime_t stime, etime;
> >> +	bool vbl_status;
> >> +	const struct drm_display_mode *mode;
> >> +	int vpos, hpos, i;
> >> +	int delta_ns, duration_ns;
> >> +
> >> +	if (pipe >= dev->num_crtcs) {
> >> +		DRM_ERROR("Invalid crtc %u\n", pipe);
> >> +		return false;
> >> +	}
> >> +
> >> +	/* Scanout position query not supported? Should not happen. */
> >> +	if (!get_scanout_position) {
> >> +		DRM_ERROR("Called from CRTC w/o get_scanout_position()!?\n");
> >> +		return false;
> >> +	}
> >> +
> >> +	if (drm_drv_uses_atomic_modeset(dev))
> >> +		mode = &vblank->hwmode;
> >> +	else
> >> +		mode = &crtc->hwmode;
> >> +
> >> +	/* If mode timing undefined, just return as no-op:
> >> +	 * Happens during initial modesetting of a crtc.
> >> +	 */
> >> +	if (mode->crtc_clock == 0) {
> >> +		DRM_DEBUG("crtc %u: Noop due to uninitialized mode.\n", pipe);
> >> +		WARN_ON_ONCE(drm_drv_uses_atomic_modeset(dev));
> >> +		return false;
> >> +	}
> >> +
> >> +	/* Get current scanout position with system timestamp.
> >> +	 * Repeat query up to DRM_TIMESTAMP_MAXRETRIES times
> >> +	 * if single query takes longer than max_error nanoseconds.
> >> +	 *
> >> +	 * This guarantees a tight bound on maximum error if
> >> +	 * code gets preempted or delayed for some reason.
> >> +	 */
> >> +	for (i = 0; i < DRM_TIMESTAMP_MAXRETRIES; i++) {
> >> +		/*
> >> +		 * Get vertical and horizontal scanout position vpos, hpos,
> >> +		 * and bounding timestamps stime, etime, pre/post query.
> >> +		 */
> >> +		vbl_status = get_scanout_position(crtc, in_vblank_irq, &vpos,
> >> +						  &hpos, &stime, &etime, mode);
> >> +
> >> +		/* Return as no-op if scanout query unsupported or failed. */
> >> +		if (!vbl_status) {
> >> +			DRM_DEBUG("crtc %u : scanoutpos query failed.\n",
> >> +				  pipe);
> >> +			return false;
> >> +		}
> >> +
> >> +		/* Compute uncertainty in timestamp of scanout position query. */
> >> +		duration_ns = ktime_to_ns(etime) - ktime_to_ns(stime);
> >> +
> >> +		/* Accept result with <  max_error nsecs timing uncertainty. */
> >> +		if (duration_ns <= *max_error)
> >> +			break;
> >> +	}
> >> +
> >> +	/* Noisy system timing? */
> >> +	if (i == DRM_TIMESTAMP_MAXRETRIES) {
> >> +		DRM_DEBUG("crtc %u: Noisy timestamp %d us > %d us [%d reps].\n",
> >> +			  pipe, duration_ns/1000, *max_error/1000, i);
> >> +	}
> >> +
> >> +	/* Return upper bound of timestamp precision error. */
> >> +	*max_error = duration_ns;
> >> +
> >> +	/* Convert scanout position into elapsed time at raw_time query
> >> +	 * since start of scanout at first display scanline. delta_ns
> >> +	 * can be negative if start of scanout hasn't happened yet.
> >> +	 */
> >> +	delta_ns = div_s64(1000000LL * (vpos * mode->crtc_htotal + hpos),
> >> +			   mode->crtc_clock);
> >> +
> >> +	/* Subtract time delta from raw timestamp to get final
> >> +	 * vblank_time timestamp for end of vblank.
> >> +	 */
> >> +	*vblank_time = ktime_sub_ns(etime, delta_ns);
> >> +
> >> +	if (!drm_debug_enabled(DRM_UT_VBL))
> >> +		return true;
> >> +
> >> +	ts_etime = ktime_to_timespec64(etime);
> >> +	ts_vblank_time = ktime_to_timespec64(*vblank_time);
> >> +
> >> +	DRM_DEBUG_VBL("crtc %u : v p(%d,%d)@ %lld.%06ld -> %lld.%06ld [e %d us, %d rep]\n",
> >> +		      pipe, hpos, vpos,
> >> +		      (u64)ts_etime.tv_sec, ts_etime.tv_nsec / 1000,
> >> +		      (u64)ts_vblank_time.tv_sec, ts_vblank_time.tv_nsec / 1000,
> >> +		      duration_ns / 1000, i);
> >> +
> >> +	return true;
> >> +}
> >> +EXPORT_SYMBOL(drm_crtc_vblank_helper_get_vblank_timestamp_internal);
> > 
> > This looks like copy paste from the current thing. Why are you 
> > duplicating the entire function instead of refactoring what
> > we already have?
> 
> It is copied with a small difference.
> 
> The original function is drm_calc_vbltimestamp_from_scanoutpos(). It
> uses either drm_driver.get_scanout_position() or
> drm_crtc_helper_funcs.get_scanout_position(). The former receives device
> pointer and pipe index, the latter receives a pointer to a crtc. (see
> patch 1)
> 
> This function, drm_crtc_vblank_helper_get_vblank_timestamp_internal(),
> receives a get_scanout_position() as its argument with the same
> signature as drm_crtc_helper_funcs.get_scanout_position().
> 
> The function is exported, so that i915 can use the algorithm and provide
> it's own implementation of get_scanout_position(). i915 does not use
> CRTC helpers, and therefore cannot set get_scanout_position() there.
> 
> Patch 21, when all drivers have been converted to use the CRTC
> interface, removes drm_calc_vbltimestamp_from_scanoutpos() entirely.
> It's only kept around for transitionng the driver over to the new interface.

All that means reviewing is going to be a bit of a pain. Also the
history will become more annoying to dig through. Eg. git blame
can't help us anymore, and when looking through git log one can't
see the old name of the function from the patch context so need to
either guess or trawl the logs blindly looking for a similar looking
function.

So would definitely appreciate if you can find a way to refactor this
properly.

<snip>
> >>  	struct drm_display_mode hwmode;
> >> @@ -238,4 +238,22 @@ void drm_calc_timestamping_constants(struct drm_crtc *crtc,
> >>  wait_queue_head_t *drm_crtc_vblank_waitqueue(struct drm_crtc *crtc);
> >>  void drm_crtc_set_max_vblank_count(struct drm_crtc *crtc,
> >>  				   u32 max_vblank_count);
> >> +
> >> +/*
> >> + * Helpers for struct drm_crtc_funcs
> >> + */
> >> +
> >> +bool
> >> +drm_crtc_vblank_helper_get_vblank_timestamp_internal(
> >> +	struct drm_crtc *crtc, int *max_error, ktime_t *vblank_time,
> >> +	bool in_vblank_irq,
> >> +	bool (*get_scanout_position)(struct drm_crtc *crtc,
> >> +                                     bool in_vblank_irq, int *vpos, int *hpos,
> >> +                                     ktime_t *stime, ktime_t *etime,
> >> +                                     const struct drm_display_mode *mode));
> > 
> > Ugly alignment. Could maybe add a typedef for the function pointer if it
> > otherwise gets super horrible with proper alignment.
> 
> Email formatting might add to the ugliness here.
> 
> How would this be aligned properly?

Function arguments should be aligned after the '('.

> 
> I'm slightly reluctent to add a typedef for only this single function
> and it's caller in i915. Typedefs are a form of code obfuscation IMHO.
> But if that's the way to go, I won't mind of course.

Yeah, I generally avoid them too. But I tend to have a few exceptions:
a) when the funciton pointer has to be stuffed into multiple places
b) exactly this case where the function signature is a horrible
   mess and it has to be passed to a function

> 
> Best regards
> Thomas
> 
> > 
> >> +bool drm_crtc_vblank_helper_get_vblank_timestamp(struct drm_crtc *crtc,
> >> +						 int *max_error,
> >> +						 ktime_t *vblank_time,
> >> +						 bool in_vblank_irq);
> >> +
> >>  #endif
> >> -- 
> >> 2.24.1
> >>
> >> _______________________________________________
> >> Intel-gfx mailing list
> >> Intel-gfx@lists.freedesktop.org
> >> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
> > 
> 
> -- 
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N�rnberg, Germany
> (HRB 36809, AG N�rnberg)
> Gesch�ftsf�hrer: Felix Imend�rffer
> 




-- 
Ville Syrj�l�
Intel
