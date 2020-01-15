Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AEF5A13BFDE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2020 13:17:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731304AbgAOMRF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Jan 2020 07:17:05 -0500
Received: from mx2.suse.de ([195.135.220.15]:37144 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730939AbgAOMRF (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Jan 2020 07:17:05 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 051C9AE62;
        Wed, 15 Jan 2020 12:17:00 +0000 (UTC)
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
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 01/21] drm: Add get_scanout_position() to struct drm_crtc_helper_funcs
Date:   Wed, 15 Jan 2020 13:16:32 +0100
Message-Id: <20200115121652.7050-2-tzimmermann@suse.de>
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

The new callback get_scanout_position() reads the current location of
the scanout process. The operation is currentyl located in struct
drm_driver, but really belongs to the CRTC. Drivers will be converted
in separate patches.

v2:
	* fix logical op in drm_calc_vbltimestamp_from_scanoutpos()

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Tested-by: Yannick Fertré <yannick.fertre@st.com>
---
 drivers/gpu/drm/drm_vblank.c             | 24 ++++++++----
 include/drm/drm_drv.h                    |  7 +---
 include/drm/drm_modeset_helper_vtables.h | 47 ++++++++++++++++++++++++
 3 files changed, 65 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 1659b13b178c..3f1dd54cc8bb 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -30,6 +30,7 @@
 #include <drm/drm_crtc.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_framebuffer.h>
+#include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_print.h>
 #include <drm/drm_vblank.h>
 
@@ -590,7 +591,7 @@ EXPORT_SYMBOL(drm_calc_timestamping_constants);
  * Implements calculation of exact vblank timestamps from given drm_display_mode
  * timings and current video scanout position of a CRTC. This can be directly
  * used as the &drm_driver.get_vblank_timestamp implementation of a kms driver
- * if &drm_driver.get_scanout_position is implemented.
+ * if &drm_crtc_helper_funcs.get_scanout_position is implemented.
  *
  * The current implementation only handles standard video modes. For double scan
  * and interlaced modes the driver is supposed to adjust the hardware mode
@@ -632,8 +633,9 @@ bool drm_calc_vbltimestamp_from_scanoutpos(struct drm_device *dev,
 	}
 
 	/* Scanout position query not supported? Should not happen. */
-	if (!dev->driver->get_scanout_position) {
-		DRM_ERROR("Called from driver w/o get_scanout_position()!?\n");
+	if (!dev->driver->get_scanout_position &&
+	    !crtc->helper_private->get_scanout_position) {
+		DRM_ERROR("Called from CRTC w/o get_scanout_position()!?\n");
 		return false;
 	}
 
@@ -664,11 +666,17 @@ bool drm_calc_vbltimestamp_from_scanoutpos(struct drm_device *dev,
 		 * Get vertical and horizontal scanout position vpos, hpos,
 		 * and bounding timestamps stime, etime, pre/post query.
 		 */
-		vbl_status = dev->driver->get_scanout_position(dev, pipe,
-							       in_vblank_irq,
-							       &vpos, &hpos,
-							       &stime, &etime,
-							       mode);
+		if (crtc->helper_private->get_scanout_position) {
+			vbl_status =
+				crtc->helper_private->get_scanout_position(
+					crtc, in_vblank_irq, &vpos, &hpos,
+					&stime, &etime, mode);
+		} else {
+			vbl_status =
+				dev->driver->get_scanout_position(
+					dev, pipe, in_vblank_irq, &vpos,
+					&hpos, &stime, &etime, mode);
+		}
 
 		/* Return as no-op if scanout query unsupported or failed. */
 		if (!vbl_status) {
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
-- 
2.24.1

