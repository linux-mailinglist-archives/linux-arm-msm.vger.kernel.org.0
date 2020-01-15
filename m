Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A12D513BFE0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2020 13:17:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731449AbgAOMRI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Jan 2020 07:17:08 -0500
Received: from mx2.suse.de ([195.135.220.15]:37416 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731597AbgAOMRH (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Jan 2020 07:17:07 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 37911AC84;
        Wed, 15 Jan 2020 12:17:04 +0000 (UTC)
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
Subject: [PATCH v2 07/21] drm/i915: Convert to CRTC VBLANK callbacks
Date:   Wed, 15 Jan 2020 13:16:38 +0100
Message-Id: <20200115121652.7050-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200115121652.7050-1-tzimmermann@suse.de>
References: <20200115121652.7050-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

VBLANK callbacks in struct drm_driver are deprecated in favor of their
equivalents in struct drm_crtc_funcs. Convert i915 over.

The callback struct drm_driver.get_scanout_position() is deprecated
in favor of struct drm_crtc_helper_funcs.get_scanout_position().
i915 doesn't use CRTC helpers. Instead pass i915's implementation of
get_scanout_position() to DRM core's
drm_crtc_vblank_helper_get_vblank_timestamp_internal().

v2:
	* use DRM's implementation of get_vblank_timestamp()
	* simplify function names

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/i915/display/intel_display.c |  7 +++++++
 drivers/gpu/drm/i915/i915_drv.c              |  3 ---
 drivers/gpu/drm/i915/i915_irq.c              | 20 +++++++++++++++-----
 drivers/gpu/drm/i915/i915_irq.h              |  6 ++----
 4 files changed, 24 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 59c375879186..c8f1da845e7d 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -16336,6 +16336,7 @@ static const struct drm_crtc_funcs bdw_crtc_funcs = {
 	.get_vblank_counter = g4x_get_vblank_counter,
 	.enable_vblank = bdw_enable_vblank,
 	.disable_vblank = bdw_disable_vblank,
+	.get_vblank_timestamp = i915_crtc_get_vblank_timestamp,
 };
 
 static const struct drm_crtc_funcs ilk_crtc_funcs = {
@@ -16344,6 +16345,7 @@ static const struct drm_crtc_funcs ilk_crtc_funcs = {
 	.get_vblank_counter = g4x_get_vblank_counter,
 	.enable_vblank = ilk_enable_vblank,
 	.disable_vblank = ilk_disable_vblank,
+	.get_vblank_timestamp = i915_crtc_get_vblank_timestamp,
 };
 
 static const struct drm_crtc_funcs g4x_crtc_funcs = {
@@ -16352,6 +16354,7 @@ static const struct drm_crtc_funcs g4x_crtc_funcs = {
 	.get_vblank_counter = g4x_get_vblank_counter,
 	.enable_vblank = i965_enable_vblank,
 	.disable_vblank = i965_disable_vblank,
+	.get_vblank_timestamp = i915_crtc_get_vblank_timestamp,
 };
 
 static const struct drm_crtc_funcs i965_crtc_funcs = {
@@ -16360,6 +16363,7 @@ static const struct drm_crtc_funcs i965_crtc_funcs = {
 	.get_vblank_counter = i915_get_vblank_counter,
 	.enable_vblank = i965_enable_vblank,
 	.disable_vblank = i965_disable_vblank,
+	.get_vblank_timestamp = i915_crtc_get_vblank_timestamp,
 };
 
 static const struct drm_crtc_funcs i915gm_crtc_funcs = {
@@ -16368,6 +16372,7 @@ static const struct drm_crtc_funcs i915gm_crtc_funcs = {
 	.get_vblank_counter = i915_get_vblank_counter,
 	.enable_vblank = i915gm_enable_vblank,
 	.disable_vblank = i915gm_disable_vblank,
+	.get_vblank_timestamp = i915_crtc_get_vblank_timestamp,
 };
 
 static const struct drm_crtc_funcs i915_crtc_funcs = {
@@ -16376,6 +16381,7 @@ static const struct drm_crtc_funcs i915_crtc_funcs = {
 	.get_vblank_counter = i915_get_vblank_counter,
 	.enable_vblank = i8xx_enable_vblank,
 	.disable_vblank = i8xx_disable_vblank,
+	.get_vblank_timestamp = i915_crtc_get_vblank_timestamp,
 };
 
 static const struct drm_crtc_funcs i8xx_crtc_funcs = {
@@ -16384,6 +16390,7 @@ static const struct drm_crtc_funcs i8xx_crtc_funcs = {
 	/* no hw vblank counter */
 	.enable_vblank = i8xx_enable_vblank,
 	.disable_vblank = i8xx_disable_vblank,
+	.get_vblank_timestamp = i915_crtc_get_vblank_timestamp,
 };
 
 static struct intel_crtc *intel_crtc_alloc(void)
diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
index f7385abdd74b..30b9ba136a81 100644
--- a/drivers/gpu/drm/i915/i915_drv.c
+++ b/drivers/gpu/drm/i915/i915_drv.c
@@ -2769,9 +2769,6 @@ static struct drm_driver driver = {
 	.gem_prime_export = i915_gem_prime_export,
 	.gem_prime_import = i915_gem_prime_import,
 
-	.get_vblank_timestamp = drm_calc_vbltimestamp_from_scanoutpos,
-	.get_scanout_position = i915_get_crtc_scanoutpos,
-
 	.dumb_create = i915_gem_dumb_create,
 	.dumb_map_offset = i915_gem_dumb_mmap_offset,
 
diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
index afc6aad9bf8c..c39e3ef6e4a2 100644
--- a/drivers/gpu/drm/i915/i915_irq.c
+++ b/drivers/gpu/drm/i915/i915_irq.c
@@ -762,13 +762,15 @@ static int __intel_get_crtc_scanline(struct intel_crtc *crtc)
 	return (position + crtc->scanline_offset) % vtotal;
 }
 
-bool i915_get_crtc_scanoutpos(struct drm_device *dev, unsigned int index,
-			      bool in_vblank_irq, int *vpos, int *hpos,
-			      ktime_t *stime, ktime_t *etime,
-			      const struct drm_display_mode *mode)
+static bool i915_get_crtc_scanoutpos(struct drm_crtc *dcrtc,
+				     bool in_vblank_irq,
+				     int *vpos, int *hpos,
+				     ktime_t *stime, ktime_t *etime,
+				     const struct drm_display_mode *mode)
 {
+	struct drm_device *dev = dcrtc->dev;
 	struct drm_i915_private *dev_priv = to_i915(dev);
-	struct intel_crtc *crtc = to_intel_crtc(drm_crtc_from_index(dev, index));
+	struct intel_crtc *crtc = to_intel_crtc(dcrtc);
 	enum pipe pipe = crtc->pipe;
 	int position;
 	int vbl_start, vbl_end, hsync_start, htotal, vtotal;
@@ -879,6 +881,14 @@ bool i915_get_crtc_scanoutpos(struct drm_device *dev, unsigned int index,
 	return true;
 }
 
+bool i915_crtc_get_vblank_timestamp(struct drm_crtc *crtc, int *max_error,
+				    ktime_t *vblank_time, bool in_vblank_irq)
+{
+	return drm_crtc_vblank_helper_get_vblank_timestamp_internal(
+		crtc, max_error, vblank_time, in_vblank_irq,
+		i915_get_crtc_scanoutpos);
+}
+
 int intel_get_crtc_scanline(struct intel_crtc *crtc)
 {
 	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
diff --git a/drivers/gpu/drm/i915/i915_irq.h b/drivers/gpu/drm/i915/i915_irq.h
index 812c47a9c2d6..53ec921c1c67 100644
--- a/drivers/gpu/drm/i915/i915_irq.h
+++ b/drivers/gpu/drm/i915/i915_irq.h
@@ -101,10 +101,8 @@ void gen8_irq_power_well_post_enable(struct drm_i915_private *dev_priv,
 void gen8_irq_power_well_pre_disable(struct drm_i915_private *dev_priv,
 				     u8 pipe_mask);
 
-bool i915_get_crtc_scanoutpos(struct drm_device *dev, unsigned int pipe,
-			      bool in_vblank_irq, int *vpos, int *hpos,
-			      ktime_t *stime, ktime_t *etime,
-			      const struct drm_display_mode *mode);
+bool i915_crtc_get_vblank_timestamp(struct drm_crtc *crtc, int *max_error,
+				    ktime_t *vblank_time, bool in_vblank_irq);
 
 u32 i915_get_vblank_counter(struct drm_crtc *crtc);
 u32 g4x_get_vblank_counter(struct drm_crtc *crtc);
-- 
2.24.1

