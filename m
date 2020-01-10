Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4188D136984
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2020 10:21:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727196AbgAJJVl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jan 2020 04:21:41 -0500
Received: from mx2.suse.de ([195.135.220.15]:47110 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726797AbgAJJVl (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jan 2020 04:21:41 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 4485AB2AB;
        Fri, 10 Jan 2020 09:21:39 +0000 (UTC)
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
Subject: [PATCH 10/23] drm: Evaluate struct drm_device.vblank_disable_immediate on each use
Date:   Fri, 10 Jan 2020 10:21:14 +0100
Message-Id: <20200110092127.27847-11-tzimmermann@suse.de>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200110092127.27847-1-tzimmermann@suse.de>
References: <20200110092127.27847-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

VBLANK interrupts can be disabled immediately or with a delay, where the
latter is the default. The former option can be selected by setting
get_vblank_timestamp, and enabling vblank_disable_immediate in struct
drm_device.

The setup is only evaluated once when DRM initializes VBLANKs. Evaluating
the settings on each use of vblank_disable_immediate will allow for easy
integration of CRTC VBLANK functions.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_vblank.c | 31 ++++++++++++++-----------------
 1 file changed, 14 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index b84065911d69..cbe8f3009df5 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -481,19 +481,6 @@ int drm_vblank_init(struct drm_device *dev, unsigned int num_crtcs)
 
 	DRM_INFO("Supports vblank timestamp caching Rev 2 (21.10.2013).\n");
 
-	/* Driver specific high-precision vblank timestamping supported? */
-	if (dev->driver->get_vblank_timestamp)
-		DRM_INFO("Driver supports precise vblank timestamp query.\n");
-	else
-		DRM_INFO("No driver support for vblank timestamp query.\n");
-
-	/* Must have precise timestamping for reliable vblank instant disable */
-	if (dev->vblank_disable_immediate && !dev->driver->get_vblank_timestamp) {
-		dev->vblank_disable_immediate = false;
-		DRM_INFO("Setting vblank_disable_immediate to false because "
-			 "get_vblank_timestamp == NULL\n");
-	}
-
 	return 0;
 
 err:
@@ -1061,6 +1048,15 @@ int drm_crtc_vblank_get(struct drm_crtc *crtc)
 }
 EXPORT_SYMBOL(drm_crtc_vblank_get);
 
+static bool __vblank_disable_immediate(struct drm_device *dev, unsigned int pipe)
+{
+	if (!dev->vblank_disable_immediate)
+		return false;
+	if (!dev->driver->get_vblank_timestamp)
+		return false;
+	return true;
+}
+
 static void drm_vblank_put(struct drm_device *dev, unsigned int pipe)
 {
 	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
@@ -1077,7 +1073,7 @@ static void drm_vblank_put(struct drm_device *dev, unsigned int pipe)
 			return;
 		else if (drm_vblank_offdelay < 0)
 			vblank_disable_fn(&vblank->disable_timer);
-		else if (!dev->vblank_disable_immediate)
+		else if (__vblank_disable_immediate(dev, pipe))
 			mod_timer(&vblank->disable_timer,
 				  jiffies + ((drm_vblank_offdelay * HZ)/1000));
 	}
@@ -1654,7 +1650,7 @@ int drm_wait_vblank_ioctl(struct drm_device *dev, void *data,
 	/* If the counter is currently enabled and accurate, short-circuit
 	 * queries to return the cached timestamp of the last vblank.
 	 */
-	if (dev->vblank_disable_immediate &&
+	if (__vblank_disable_immediate(dev, pipe) &&
 	    drm_wait_vblank_is_query(vblwait) &&
 	    READ_ONCE(vblank->enabled)) {
 		drm_wait_vblank_reply(dev, pipe, &vblwait->reply);
@@ -1811,7 +1807,7 @@ bool drm_handle_vblank(struct drm_device *dev, unsigned int pipe)
 	 * been signaled. The disable has to be last (after
 	 * drm_handle_vblank_events) so that the timestamp is always accurate.
 	 */
-	disable_irq = (dev->vblank_disable_immediate &&
+	disable_irq = (__vblank_disable_immediate(dev, pipe) &&
 		       drm_vblank_offdelay > 0 &&
 		       !atomic_read(&vblank->refcount));
 
@@ -1884,7 +1880,8 @@ int drm_crtc_get_sequence_ioctl(struct drm_device *dev, void *data,
 	pipe = drm_crtc_index(crtc);
 
 	vblank = &dev->vblank[pipe];
-	vblank_enabled = dev->vblank_disable_immediate && READ_ONCE(vblank->enabled);
+	vblank_enabled = __vblank_disable_immediate(dev, pipe) &&
+			 READ_ONCE(vblank->enabled);
 
 	if (!vblank_enabled) {
 		ret = drm_crtc_vblank_get(crtc);
-- 
2.24.1

