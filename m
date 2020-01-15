Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF87913BFF2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2020 13:17:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731587AbgAOMRS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Jan 2020 07:17:18 -0500
Received: from mx2.suse.de ([195.135.220.15]:37408 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731411AbgAOMRS (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Jan 2020 07:17:18 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 3B634AFCD;
        Wed, 15 Jan 2020 12:17:16 +0000 (UTC)
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     airlied@linux.ie, daniel@ffwll.ch, alexander.deucher@amd.com,
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
        rodrigo.vivi@intel.com
Cc:     dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH v2 21/21] drm: Clean-up VBLANK-related callbacks in struct drm_driver
Date:   Wed, 15 Jan 2020 13:16:52 +0100
Message-Id: <20200115121652.7050-22-tzimmermann@suse.de>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200115121652.7050-1-tzimmermann@suse.de>
References: <20200115121652.7050-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

All non-legacy users of VBLANK functions in struct drm_driver have been
converted to use the respective interfaces in struct drm_crtc_funcs. The
remaining users of VBLANK callbacks in struct drm_driver are legacy drivers
with userspace modesetting.

All users of struct drm_driver.get_scanout_position() have been
covnerted to the respective CRTC helper function. Remove the callback
from struct drm_driver.

There are no users left of get_vblank_timestamp(), so the callback is
being removed. The other VBLANK callbacks are being moved to the legacy
section at the end of struct drm_driver.

Also removed is drm_calc_vbltimestamp_from_scanoutpos(). Callers of this
function have been converted to use the CRTC instead.

v2:
	* merge with removal of struct drm_driver.get_scanout_position()
	* remove drm_calc_vbltimestamp_from_scanoutpos()

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Tested-by: Yannick Fertré <yannick.fertre@st.com>
---
 drivers/gpu/drm/drm_vblank.c | 194 +++--------------------------------
 include/drm/drm_drv.h        | 153 +--------------------------
 include/drm/drm_vblank.h     |   4 -
 3 files changed, 17 insertions(+), 334 deletions(-)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 1b7af316e6a5..bd7820489698 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -138,10 +138,9 @@ static u32 __get_vblank_counter(struct drm_device *dev, unsigned int pipe)
 
 		if (crtc->funcs->get_vblank_counter)
 			return crtc->funcs->get_vblank_counter(crtc);
-	}
-
-	if (dev->driver->get_vblank_counter)
+	} else if (dev->driver->get_vblank_counter) {
 		return dev->driver->get_vblank_counter(dev, pipe);
+	}
 
 	return drm_vblank_no_hw_counter(dev, pipe);
 }
@@ -334,8 +333,7 @@ u64 drm_crtc_accurate_vblank_count(struct drm_crtc *crtc)
 	unsigned long flags;
 
 	WARN_ONCE(drm_debug_enabled(DRM_UT_VBL) &&
-		  !crtc->funcs->get_vblank_timestamp &&
-		  !dev->driver->get_vblank_timestamp,
+		  !crtc->funcs->get_vblank_timestamp,
 		  "This function requires support for accurate vblank timestamps.");
 
 	spin_lock_irqsave(&dev->vblank_time_lock, flags);
@@ -357,13 +355,11 @@ static void __disable_vblank(struct drm_device *dev, unsigned int pipe)
 		if (WARN_ON(!crtc))
 			return;
 
-		if (crtc->funcs->disable_vblank) {
+		if (crtc->funcs->disable_vblank)
 			crtc->funcs->disable_vblank(crtc);
-			return;
-		}
+	} else {
+		dev->driver->disable_vblank(dev, pipe);
 	}
-
-	dev->driver->disable_vblank(dev, pipe);
 }
 
 /*
@@ -565,161 +561,6 @@ void drm_calc_timestamping_constants(struct drm_crtc *crtc,
 }
 EXPORT_SYMBOL(drm_calc_timestamping_constants);
 
-/**
- * drm_calc_vbltimestamp_from_scanoutpos - precise vblank timestamp helper
- * @dev: DRM device
- * @pipe: index of CRTC whose vblank timestamp to retrieve
- * @max_error: Desired maximum allowable error in timestamps (nanosecs)
- *             On return contains true maximum error of timestamp
- * @vblank_time: Pointer to time which should receive the timestamp
- * @in_vblank_irq:
- *     True when called from drm_crtc_handle_vblank().  Some drivers
- *     need to apply some workarounds for gpu-specific vblank irq quirks
- *     if flag is set.
- *
- * Implements calculation of exact vblank timestamps from given drm_display_mode
- * timings and current video scanout position of a CRTC. This can be directly
- * used as the &drm_crtc_funcs.get_vblank_timestamp implementation of a kms
- * driver if &drm_crtc_helper_funcs.get_scanout_position or
- * &drm_driver.get_scanout_position is implemented.
- *
- * The current implementation only handles standard video modes. For double scan
- * and interlaced modes the driver is supposed to adjust the hardware mode
- * (taken from &drm_crtc_state.adjusted mode for atomic modeset drivers) to
- * match the scanout position reported.
- *
- * Note that atomic drivers must call drm_calc_timestamping_constants() before
- * enabling a CRTC. The atomic helpers already take care of that in
- * drm_atomic_helper_update_legacy_modeset_state().
- *
- * Returns:
- *
- * Returns true on success, and false on failure, i.e. when no accurate
- * timestamp could be acquired.
- */
-bool drm_calc_vbltimestamp_from_scanoutpos(struct drm_device *dev,
-					   unsigned int pipe,
-					   int *max_error,
-					   ktime_t *vblank_time,
-					   bool in_vblank_irq)
-{
-	struct timespec64 ts_etime, ts_vblank_time;
-	ktime_t stime, etime;
-	bool vbl_status;
-	struct drm_crtc *crtc;
-	const struct drm_display_mode *mode;
-	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
-	int vpos, hpos, i;
-	int delta_ns, duration_ns;
-
-	if (!drm_core_check_feature(dev, DRIVER_MODESET))
-		return false;
-
-	crtc = drm_crtc_from_index(dev, pipe);
-
-	if (pipe >= dev->num_crtcs || !crtc) {
-		DRM_ERROR("Invalid crtc %u\n", pipe);
-		return false;
-	}
-
-	/* Scanout position query not supported? Should not happen. */
-	if (!dev->driver->get_scanout_position &&
-	    !crtc->helper_private->get_scanout_position) {
-		DRM_ERROR("Called from CRTC w/o get_scanout_position()!?\n");
-		return false;
-	}
-
-	if (drm_drv_uses_atomic_modeset(dev))
-		mode = &vblank->hwmode;
-	else
-		mode = &crtc->hwmode;
-
-	/* If mode timing undefined, just return as no-op:
-	 * Happens during initial modesetting of a crtc.
-	 */
-	if (mode->crtc_clock == 0) {
-		DRM_DEBUG("crtc %u: Noop due to uninitialized mode.\n", pipe);
-		WARN_ON_ONCE(drm_drv_uses_atomic_modeset(dev));
-
-		return false;
-	}
-
-	/* Get current scanout position with system timestamp.
-	 * Repeat query up to DRM_TIMESTAMP_MAXRETRIES times
-	 * if single query takes longer than max_error nanoseconds.
-	 *
-	 * This guarantees a tight bound on maximum error if
-	 * code gets preempted or delayed for some reason.
-	 */
-	for (i = 0; i < DRM_TIMESTAMP_MAXRETRIES; i++) {
-		/*
-		 * Get vertical and horizontal scanout position vpos, hpos,
-		 * and bounding timestamps stime, etime, pre/post query.
-		 */
-		if (crtc->helper_private->get_scanout_position) {
-			vbl_status =
-				crtc->helper_private->get_scanout_position(
-					crtc, in_vblank_irq, &vpos, &hpos,
-					&stime, &etime, mode);
-		} else {
-			vbl_status =
-				dev->driver->get_scanout_position(
-					dev, pipe, in_vblank_irq, &vpos,
-					&hpos, &stime, &etime, mode);
-		}
-
-		/* Return as no-op if scanout query unsupported or failed. */
-		if (!vbl_status) {
-			DRM_DEBUG("crtc %u : scanoutpos query failed.\n",
-				  pipe);
-			return false;
-		}
-
-		/* Compute uncertainty in timestamp of scanout position query. */
-		duration_ns = ktime_to_ns(etime) - ktime_to_ns(stime);
-
-		/* Accept result with <  max_error nsecs timing uncertainty. */
-		if (duration_ns <= *max_error)
-			break;
-	}
-
-	/* Noisy system timing? */
-	if (i == DRM_TIMESTAMP_MAXRETRIES) {
-		DRM_DEBUG("crtc %u: Noisy timestamp %d us > %d us [%d reps].\n",
-			  pipe, duration_ns/1000, *max_error/1000, i);
-	}
-
-	/* Return upper bound of timestamp precision error. */
-	*max_error = duration_ns;
-
-	/* Convert scanout position into elapsed time at raw_time query
-	 * since start of scanout at first display scanline. delta_ns
-	 * can be negative if start of scanout hasn't happened yet.
-	 */
-	delta_ns = div_s64(1000000LL * (vpos * mode->crtc_htotal + hpos),
-			   mode->crtc_clock);
-
-	/* Subtract time delta from raw timestamp to get final
-	 * vblank_time timestamp for end of vblank.
-	 */
-	*vblank_time = ktime_sub_ns(etime, delta_ns);
-
-	if (!drm_debug_enabled(DRM_UT_VBL))
-		return true;
-
-	ts_etime = ktime_to_timespec64(etime);
-	ts_vblank_time = ktime_to_timespec64(*vblank_time);
-
-	DRM_DEBUG_VBL("crtc %u : v p(%d,%d)@ %lld.%06ld -> %lld.%06ld [e %d us, %d rep]\n",
-		      pipe, hpos, vpos,
-		      (u64)ts_etime.tv_sec, ts_etime.tv_nsec / 1000,
-		      (u64)ts_vblank_time.tv_sec, ts_vblank_time.tv_nsec / 1000,
-		      duration_ns / 1000, i);
-
-	return true;
-}
-EXPORT_SYMBOL(drm_calc_vbltimestamp_from_scanoutpos);
-
 /**
  * drm_get_last_vbltimestamp - retrieve raw timestamp for the most recent
  *                             vblank interval
@@ -757,9 +598,6 @@ drm_get_last_vbltimestamp(struct drm_device *dev, unsigned int pipe,
 
 		ret = crtc->funcs->get_vblank_timestamp(crtc, &max_error,
 							tvblank, in_vblank_irq);
-	} else if (dev->driver->get_vblank_timestamp && (max_error > 0)) {
-		ret = dev->driver->get_vblank_timestamp(dev, pipe, &max_error,
-							tvblank, in_vblank_irq);
 	}
 
 	/* GPU high precision timestamp query unsupported or failed.
@@ -982,9 +820,11 @@ static int __enable_vblank(struct drm_device *dev, unsigned int pipe)
 
 		if (crtc->funcs->enable_vblank)
 			return crtc->funcs->enable_vblank(crtc);
+	} else if (dev->driver->enable_vblank) {
+		return dev->driver->enable_vblank(dev, pipe);
 	}
 
-	return dev->driver->enable_vblank(dev, pipe);
+	return -EINVAL;
 }
 
 static int drm_vblank_enable(struct drm_device *dev, unsigned int pipe)
@@ -1075,13 +915,10 @@ static bool __vblank_disable_immediate(struct drm_device *dev, unsigned int pipe
 		return false;
 
 	crtc = drm_crtc_from_index(dev, pipe);
-	if (crtc && crtc->funcs->get_vblank_timestamp)
-		return true;
-
-	if (dev->driver->get_vblank_timestamp)
-		return true;
+	if (!crtc || !crtc->funcs->get_vblank_timestamp)
+		return false;
 
-	return false;
+	return true;
 }
 
 static void drm_vblank_put(struct drm_device *dev, unsigned int pipe)
@@ -1764,7 +1601,6 @@ static void drm_handle_vblank_events(struct drm_device *dev, unsigned int pipe)
 	struct drm_pending_vblank_event *e, *t;
 	ktime_t now;
 	u64 seq;
-	bool high_prec;
 
 	assert_spin_locked(&dev->event_lock);
 
@@ -1784,10 +1620,8 @@ static void drm_handle_vblank_events(struct drm_device *dev, unsigned int pipe)
 		send_vblank_event(dev, e, seq, now);
 	}
 
-	high_prec = crtc->funcs->get_vblank_timestamp ||
-		    dev->driver->get_vblank_timestamp;
-
-	trace_drm_vblank_event(pipe, seq, now, high_prec);
+	trace_drm_vblank_event(pipe, seq, now,
+			       crtc->funcs->get_vblank_timestamp != NULL);
 }
 
 /**
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index d0049e5786fc..e290b3aca6eb 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -268,156 +268,6 @@ struct drm_driver {
 	 */
 	void (*release) (struct drm_device *);
 
-	/**
-	 * @get_vblank_counter:
-	 *
-	 * Driver callback for fetching a raw hardware vblank counter for the
-	 * CRTC specified with the pipe argument.  If a device doesn't have a
-	 * hardware counter, the driver can simply leave the hook as NULL.
-	 * The DRM core will account for missed vblank events while interrupts
-	 * where disabled based on system timestamps.
-	 *
-	 * Wraparound handling and loss of events due to modesetting is dealt
-	 * with in the DRM core code, as long as drivers call
-	 * drm_crtc_vblank_off() and drm_crtc_vblank_on() when disabling or
-	 * enabling a CRTC.
-	 *
-	 * This is deprecated and should not be used by new drivers.
-	 * Use &drm_crtc_funcs.get_vblank_counter instead.
-	 *
-	 * Returns:
-	 *
-	 * Raw vblank counter value.
-	 */
-	u32 (*get_vblank_counter) (struct drm_device *dev, unsigned int pipe);
-
-	/**
-	 * @enable_vblank:
-	 *
-	 * Enable vblank interrupts for the CRTC specified with the pipe
-	 * argument.
-	 *
-	 * This is deprecated and should not be used by new drivers.
-	 * Use &drm_crtc_funcs.enable_vblank instead.
-	 *
-	 * Returns:
-	 *
-	 * Zero on success, appropriate errno if the given @crtc's vblank
-	 * interrupt cannot be enabled.
-	 */
-	int (*enable_vblank) (struct drm_device *dev, unsigned int pipe);
-
-	/**
-	 * @disable_vblank:
-	 *
-	 * Disable vblank interrupts for the CRTC specified with the pipe
-	 * argument.
-	 *
-	 * This is deprecated and should not be used by new drivers.
-	 * Use &drm_crtc_funcs.disable_vblank instead.
-	 */
-	void (*disable_vblank) (struct drm_device *dev, unsigned int pipe);
-
-	/**
-	 * @get_scanout_position:
-	 *
-	 * Called by vblank timestamping code.
-	 *
-	 * Returns the current display scanout position from a crtc, and an
-	 * optional accurate ktime_get() timestamp of when position was
-	 * measured. Note that this is a helper callback which is only used if a
-	 * driver uses drm_calc_vbltimestamp_from_scanoutpos() for the
-	 * @get_vblank_timestamp callback.
-	 *
-	 * Parameters:
-	 *
-	 * dev:
-	 *     DRM device.
-	 * pipe:
-	 *     Id of the crtc to query.
-	 * in_vblank_irq:
-	 *     True when called from drm_crtc_handle_vblank().  Some drivers
-	 *     need to apply some workarounds for gpu-specific vblank irq quirks
-	 *     if flag is set.
-	 * vpos:
-	 *     Target location for current vertical scanout position.
-	 * hpos:
-	 *     Target location for current horizontal scanout position.
-	 * stime:
-	 *     Target location for timestamp taken immediately before
-	 *     scanout position query. Can be NULL to skip timestamp.
-	 * etime:
-	 *     Target location for timestamp taken immediately after
-	 *     scanout position query. Can be NULL to skip timestamp.
-	 * mode:
-	 *     Current display timings.
-	 *
-	 * Returns vpos as a positive number while in active scanout area.
-	 * Returns vpos as a negative number inside vblank, counting the number
-	 * of scanlines to go until end of vblank, e.g., -1 means "one scanline
-	 * until start of active scanout / end of vblank."
-	 *
-	 * Returns:
-	 *
-	 * True on success, false if a reliable scanout position counter could
-	 * not be read out.
-	 *
-	 * This is deprecated and should not be used by new drivers.
-	 * Use &drm_crtc_helper_funcs.get_scanout_position instead.
-	 */
-	bool (*get_scanout_position) (struct drm_device *dev, unsigned int pipe,
-				      bool in_vblank_irq, int *vpos, int *hpos,
-				      ktime_t *stime, ktime_t *etime,
-				      const struct drm_display_mode *mode);
-
-	/**
-	 * @get_vblank_timestamp:
-	 *
-	 * Called by drm_get_last_vbltimestamp(). Should return a precise
-	 * timestamp when the most recent VBLANK interval ended or will end.
-	 *
-	 * Specifically, the timestamp in @vblank_time should correspond as
-	 * closely as possible to the time when the first video scanline of
-	 * the video frame after the end of VBLANK will start scanning out,
-	 * the time immediately after end of the VBLANK interval. If the
-	 * @crtc is currently inside VBLANK, this will be a time in the future.
-	 * If the @crtc is currently scanning out a frame, this will be the
-	 * past start time of the current scanout. This is meant to adhere
-	 * to the OpenML OML_sync_control extension specification.
-	 *
-	 * Paramters:
-	 *
-	 * dev:
-	 *     dev DRM device handle.
-	 * pipe:
-	 *     crtc for which timestamp should be returned.
-	 * max_error:
-	 *     Maximum allowable timestamp error in nanoseconds.
-	 *     Implementation should strive to provide timestamp
-	 *     with an error of at most max_error nanoseconds.
-	 *     Returns true upper bound on error for timestamp.
-	 * vblank_time:
-	 *     Target location for returned vblank timestamp.
-	 * in_vblank_irq:
-	 *     True when called from drm_crtc_handle_vblank().  Some drivers
-	 *     need to apply some workarounds for gpu-specific vblank irq quirks
-	 *     if flag is set.
-	 *
-	 * Returns:
-	 *
-	 * True on success, false on failure, which means the core should
-	 * fallback to a simple timestamp taken in drm_crtc_handle_vblank().
-	 *
-	 * FIXME:
-	 *
-	 * We should move this hook to &struct drm_crtc_funcs like all the other
-	 * vblank hooks.
-	 */
-	bool (*get_vblank_timestamp) (struct drm_device *dev, unsigned int pipe,
-				     int *max_error,
-				     ktime_t *vblank_time,
-				     bool in_vblank_irq);
-
 	/**
 	 * @irq_handler:
 	 *
@@ -772,6 +622,9 @@ struct drm_driver {
 	int (*dma_ioctl) (struct drm_device *dev, void *data, struct drm_file *file_priv);
 	int (*dma_quiescent) (struct drm_device *);
 	int (*context_dtor) (struct drm_device *dev, int context);
+	u32 (*get_vblank_counter)(struct drm_device *dev, unsigned int pipe);
+	int (*enable_vblank)(struct drm_device *dev, unsigned int pipe);
+	void (*disable_vblank)(struct drm_device *dev, unsigned int pipe);
 	int dev_priv_size;
 };
 
diff --git a/include/drm/drm_vblank.h b/include/drm/drm_vblank.h
index 248fbd5de177..f1d256a5636a 100644
--- a/include/drm/drm_vblank.h
+++ b/include/drm/drm_vblank.h
@@ -229,10 +229,6 @@ u64 drm_crtc_accurate_vblank_count(struct drm_crtc *crtc);
 void drm_vblank_restore(struct drm_device *dev, unsigned int pipe);
 void drm_crtc_vblank_restore(struct drm_crtc *crtc);
 
-bool drm_calc_vbltimestamp_from_scanoutpos(struct drm_device *dev,
-					   unsigned int pipe, int *max_error,
-					   ktime_t *vblank_time,
-					   bool in_vblank_irq);
 void drm_calc_timestamping_constants(struct drm_crtc *crtc,
 				     const struct drm_display_mode *mode);
 wait_queue_head_t *drm_crtc_vblank_waitqueue(struct drm_crtc *crtc);
-- 
2.24.1

