Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4D1B146A1C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2020 15:00:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728855AbgAWOAA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Jan 2020 09:00:00 -0500
Received: from mx2.suse.de ([195.135.220.15]:44408 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728665AbgAWOAA (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Jan 2020 09:00:00 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 1275EB353;
        Thu, 23 Jan 2020 13:59:52 +0000 (UTC)
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
        =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= 
        <ville.syrjala@linux.intel.com>
Subject: [PATCH v4 02/22] drm: Add get_scanout_position() to struct drm_crtc_helper_funcs
Date:   Thu, 23 Jan 2020 14:59:23 +0100
Message-Id: <20200123135943.24140-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200123135943.24140-1-tzimmermann@suse.de>
References: <20200123135943.24140-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The new callback get_scanout_position() reads the current location
of the scanout process. The operation is currently located in struct
drm_driver, but really belongs to the CRTC. Drivers will be converted
in separate patches.

To help with the conversion, the timestamp calculation has been
moved from drm_calc_vbltimestamp_from_scanoutpos() to
drm_crtc_vblank_helper_get_vblank_timestamp_internal(). The helper
function supports the new and old interface of get_scanout_position().
drm_calc_vbltimestamp_from_scanoutpos() remains as a wrapper around
the new function.

Callback functions return the scanout position from the CRTC. The
legacy version of the interface receives the device and pipe index,
the modern version receives a pointer to the CRTC. We keep the
legacy version until all drivers have been converted.

v4:
	* 80-character line fixes
v3:
	* refactor drm_calc_vbltimestamp_from_scanoutpos() to minimize
	  code duplication
	* define types for get_scanout_position() callbacks
v2:
	* fix logical op in drm_calc_vbltimestamp_from_scanoutpos()

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Tested-by: Yannick Fertré <yannick.fertre@st.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_vblank.c             | 101 +++++++++++++++++++----
 include/drm/drm_drv.h                    |   7 +-
 include/drm/drm_modeset_helper_vtables.h |  47 +++++++++++
 include/drm/drm_vblank.h                 |  25 ++++++
 4 files changed, 157 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 326db52f2ad8..7e962c29780c 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -30,6 +30,7 @@
 #include <drm/drm_crtc.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_framebuffer.h>
+#include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_print.h>
 #include <drm/drm_vblank.h>
 
@@ -577,7 +578,7 @@ EXPORT_SYMBOL(drm_calc_timestamping_constants);
  * Implements calculation of exact vblank timestamps from given drm_display_mode
  * timings and current video scanout position of a CRTC. This can be directly
  * used as the &drm_driver.get_vblank_timestamp implementation of a kms driver
- * if &drm_driver.get_scanout_position is implemented.
+ * if &drm_crtc_helper_funcs.get_scanout_position is implemented.
  *
  * The current implementation only handles standard video modes. For double scan
  * and interlaced modes the driver is supposed to adjust the hardware mode
@@ -599,28 +600,85 @@ bool drm_calc_vbltimestamp_from_scanoutpos(struct drm_device *dev,
 					   ktime_t *vblank_time,
 					   bool in_vblank_irq)
 {
-	struct timespec64 ts_etime, ts_vblank_time;
-	ktime_t stime, etime;
-	bool vbl_status;
 	struct drm_crtc *crtc;
-	const struct drm_display_mode *mode;
-	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
-	int vpos, hpos, i;
-	int delta_ns, duration_ns;
 
 	if (!drm_core_check_feature(dev, DRIVER_MODESET))
 		return false;
 
 	crtc = drm_crtc_from_index(dev, pipe);
+	if (!crtc)
+		return false;
 
-	if (pipe >= dev->num_crtcs || !crtc) {
+	return drm_crtc_vblank_helper_get_vblank_timestamp_internal(crtc,
+								    max_error,
+								    vblank_time,
+								    in_vblank_irq,
+								    crtc->helper_private->get_scanout_position,
+								    dev->driver->get_scanout_position);
+}
+EXPORT_SYMBOL(drm_calc_vbltimestamp_from_scanoutpos);
+
+/**
+ * drm_crtc_vblank_helper_get_vblank_timestamp_internal - precise vblank
+ *                                                        timestamp helper
+ * @dev: DRM device
+ * @pipe: index of CRTC whose vblank timestamp to retrieve
+ * @max_error: Desired maximum allowable error in timestamps (nanosecs)
+ *             On return contains true maximum error of timestamp
+ * @vblank_time: Pointer to time which should receive the timestamp
+ * @in_vblank_irq:
+ *     True when called from drm_crtc_handle_vblank().  Some drivers
+ *     need to apply some workarounds for gpu-specific vblank irq quirks
+ *     if flag is set.
+ * @get_scanout_position:
+ *     Callback function to retrieve the scanout position. See
+ *     @struct drm_crtc_helper_funcs.get_scanout_position.
+ * @get_scanout_position_legacy:
+ *     Callback function to retrieve the scanout position. See
+ *     @struct drm_driver.get_scanout_position.
+ *
+ * Implements calculation of exact vblank timestamps from given drm_display_mode
+ * timings and current video scanout position of a CRTC.
+ *
+ * The current implementation only handles standard video modes. For double scan
+ * and interlaced modes the driver is supposed to adjust the hardware mode
+ * (taken from &drm_crtc_state.adjusted mode for atomic modeset drivers) to
+ * match the scanout position reported.
+ *
+ * Note that atomic drivers must call drm_calc_timestamping_constants() before
+ * enabling a CRTC. The atomic helpers already take care of that in
+ * drm_atomic_helper_update_legacy_modeset_state().
+ *
+ * Returns:
+ *
+ * Returns true on success, and false on failure, i.e. when no accurate
+ * timestamp could be acquired.
+ */
+bool
+drm_crtc_vblank_helper_get_vblank_timestamp_internal(
+	struct drm_crtc *crtc, int *max_error, ktime_t *vblank_time,
+	bool in_vblank_irq,
+	drm_vblank_get_scanout_position_func get_scanout_position,
+	drm_vblank_get_scanout_position_legacy_func get_scanout_position_legacy)
+{
+	struct drm_device *dev = crtc->dev;
+	unsigned int pipe = crtc->index;
+	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
+	struct timespec64 ts_etime, ts_vblank_time;
+	ktime_t stime, etime;
+	bool vbl_status;
+	const struct drm_display_mode *mode;
+	int vpos, hpos, i;
+	int delta_ns, duration_ns;
+
+	if (pipe >= dev->num_crtcs) {
 		DRM_ERROR("Invalid crtc %u\n", pipe);
 		return false;
 	}
 
 	/* Scanout position query not supported? Should not happen. */
-	if (!dev->driver->get_scanout_position) {
-		DRM_ERROR("Called from driver w/o get_scanout_position()!?\n");
+	if (!get_scanout_position && !get_scanout_position_legacy) {
+		DRM_ERROR("Called from CRTC w/o get_scanout_position()!?\n");
 		return false;
 	}
 
@@ -635,7 +693,6 @@ bool drm_calc_vbltimestamp_from_scanoutpos(struct drm_device *dev,
 	if (mode->crtc_clock == 0) {
 		DRM_DEBUG("crtc %u: Noop due to uninitialized mode.\n", pipe);
 		WARN_ON_ONCE(drm_drv_uses_atomic_modeset(dev));
-
 		return false;
 	}
 
@@ -651,11 +708,19 @@ bool drm_calc_vbltimestamp_from_scanoutpos(struct drm_device *dev,
 		 * Get vertical and horizontal scanout position vpos, hpos,
 		 * and bounding timestamps stime, etime, pre/post query.
 		 */
-		vbl_status = dev->driver->get_scanout_position(dev, pipe,
-							       in_vblank_irq,
-							       &vpos, &hpos,
-							       &stime, &etime,
-							       mode);
+		if (get_scanout_position) {
+			vbl_status = get_scanout_position(crtc,
+							  in_vblank_irq,
+							  &vpos, &hpos,
+							  &stime, &etime,
+							  mode);
+		} else {
+			vbl_status = get_scanout_position_legacy(dev, pipe,
+								 in_vblank_irq,
+								 &vpos, &hpos,
+								 &stime, &etime,
+								 mode);
+		}
 
 		/* Return as no-op if scanout query unsupported or failed. */
 		if (!vbl_status) {
@@ -707,7 +772,7 @@ bool drm_calc_vbltimestamp_from_scanoutpos(struct drm_device *dev,
 
 	return true;
 }
-EXPORT_SYMBOL(drm_calc_vbltimestamp_from_scanoutpos);
+EXPORT_SYMBOL(drm_crtc_vblank_helper_get_vblank_timestamp_internal);
 
 /**
  * drm_get_last_vbltimestamp - retrieve raw timestamp for the most recent
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index cf13470810a5..d0049e5786fc 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -362,11 +362,8 @@ struct drm_driver {
 	 * True on success, false if a reliable scanout position counter could
 	 * not be read out.
 	 *
-	 * FIXME:
-	 *
-	 * Since this is a helper to implement @get_vblank_timestamp, we should
-	 * move it to &struct drm_crtc_helper_funcs, like all the other
-	 * helper-internal hooks.
+	 * This is deprecated and should not be used by new drivers.
+	 * Use &drm_crtc_helper_funcs.get_scanout_position instead.
 	 */
 	bool (*get_scanout_position) (struct drm_device *dev, unsigned int pipe,
 				      bool in_vblank_irq, int *vpos, int *hpos,
diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_modeset_helper_vtables.h
index 5a87f1bd7a3f..e398512bfd5f 100644
--- a/include/drm/drm_modeset_helper_vtables.h
+++ b/include/drm/drm_modeset_helper_vtables.h
@@ -450,6 +450,53 @@ struct drm_crtc_helper_funcs {
 	 */
 	void (*atomic_disable)(struct drm_crtc *crtc,
 			       struct drm_crtc_state *old_crtc_state);
+
+	/**
+	 * @get_scanout_position:
+	 *
+	 * Called by vblank timestamping code.
+	 *
+	 * Returns the current display scanout position from a CRTC and an
+	 * optional accurate ktime_get() timestamp of when the position was
+	 * measured. Note that this is a helper callback which is only used
+	 * if a driver uses drm_calc_vbltimestamp_from_scanoutpos() for the
+	 * @drm_driver.get_vblank_timestamp callback.
+	 *
+	 * Parameters:
+	 *
+	 * crtc:
+	 *     The CRTC.
+	 * in_vblank_irq:
+	 *     True when called from drm_crtc_handle_vblank(). Some drivers
+	 *     need to apply some workarounds for gpu-specific vblank irq
+	 *     quirks if the flag is set.
+	 * vpos:
+	 *     Target location for current vertical scanout position.
+	 * hpos:
+	 *     Target location for current horizontal scanout position.
+	 * stime:
+	 *     Target location for timestamp taken immediately before
+	 *     scanout position query. Can be NULL to skip timestamp.
+	 * etime:
+	 *     Target location for timestamp taken immediately after
+	 *     scanout position query. Can be NULL to skip timestamp.
+	 * mode:
+	 *     Current display timings.
+	 *
+	 * Returns vpos as a positive number while in active scanout area.
+	 * Returns vpos as a negative number inside vblank, counting the number
+	 * of scanlines to go until end of vblank, e.g., -1 means "one scanline
+	 * until start of active scanout / end of vblank."
+	 *
+	 * Returns:
+	 *
+	 * True on success, false if a reliable scanout position counter could
+	 * not be read out.
+	 */
+	bool (*get_scanout_position)(struct drm_crtc *crtc,
+				     bool in_vblank_irq, int *vpos, int *hpos,
+				     ktime_t *stime, ktime_t *etime,
+				     const struct drm_display_mode *mode);
 };
 
 /**
diff --git a/include/drm/drm_vblank.h b/include/drm/drm_vblank.h
index c16c44052b3d..66d1fb376600 100644
--- a/include/drm/drm_vblank.h
+++ b/include/drm/drm_vblank.h
@@ -238,4 +238,29 @@ void drm_calc_timestamping_constants(struct drm_crtc *crtc,
 wait_queue_head_t *drm_crtc_vblank_waitqueue(struct drm_crtc *crtc);
 void drm_crtc_set_max_vblank_count(struct drm_crtc *crtc,
 				   u32 max_vblank_count);
+
+typedef bool (*drm_vblank_get_scanout_position_func)(struct drm_crtc *crtc,
+						     bool in_vblank_irq,
+						     int *vpos, int *hpos,
+						     ktime_t *stime,
+						     ktime_t *etime,
+						     const struct drm_display_mode *mode);
+
+typedef bool (*drm_vblank_get_scanout_position_legacy_func)(struct drm_device *dev,
+							    unsigned int pipe,
+							    bool in_vblank_irq,
+							    int *vpos,
+							    int *hpos,
+							    ktime_t *stime,
+							    ktime_t *etime,
+							    const struct drm_display_mode *mode);
+
+bool
+drm_crtc_vblank_helper_get_vblank_timestamp_internal(struct drm_crtc *crtc,
+						     int *max_error,
+						     ktime_t *vblank_time,
+						     bool in_vblank_irq,
+						     drm_vblank_get_scanout_position_func get_scanout_position,
+						     drm_vblank_get_scanout_position_legacy_func get_scanout_position_legacy);
+
 #endif
-- 
2.24.1

