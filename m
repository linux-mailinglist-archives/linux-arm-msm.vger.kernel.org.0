Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B30D87002B8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 May 2023 10:42:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240095AbjELImI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 May 2023 04:42:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240109AbjELImC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 May 2023 04:42:02 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99EC07A83;
        Fri, 12 May 2023 01:41:59 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 3EA412043C;
        Fri, 12 May 2023 08:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1683880918; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=O8vQFFBDFf/ryQujqIN2i9e254YEiv94fJp4fTxrbIA=;
        b=xRQc0CLLEZUPaIo7raYxmPPFMYSwXjT+YS5qhYcqFuMti/vmVx8fL40H71VrX0FPO+My0k
        ltVUo1PnvmUUT8sL3eEY6nb9GSDtEE7cUhICFmaojA9uaJdpkQsyiX0hKuXrRRBllXX4i0
        PtFo3ej7Dw0yz4rQV3BDnyX/8xa1vSs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1683880918;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=O8vQFFBDFf/ryQujqIN2i9e254YEiv94fJp4fTxrbIA=;
        b=TpiQkBf2h3jyJQg9pjqnAz4MzolLBf2XkX2BdYv9vF8KgEUxQ62HDWdxN4JodpMwfEv9uC
        cP35rR3oaY914eCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A297F13A0A;
        Fri, 12 May 2023 08:41:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id gEI/JtX7XWQZKQAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Fri, 12 May 2023 08:41:57 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     daniel@ffwll.ch, airlied@gmail.com,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        javierm@redhat.com
Cc:     dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        amd-gfx@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= 
        <ville.syrjala@linux.intel.com>
Subject: [PATCH 11/11] drm/i915: Implement dedicated fbdev I/O helpers
Date:   Fri, 12 May 2023 10:41:52 +0200
Message-Id: <20230512084152.31233-12-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230512084152.31233-1-tzimmermann@suse.de>
References: <20230512084152.31233-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Implement dedicated fbdev helpers for framebuffer I/O instead
of using DRM's helpers. i915 was the only caller of the DRM
helpers, so remove them from the helper module.

Add CONFIG_DRM_I915_FBDEV_EMULATION to select the necessary
Kconfig options automatically. Make fbdev emulation depend on
the new config option.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: "Ville Syrjälä" <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/Kconfig                       |   3 -
 drivers/gpu/drm/drm_fb_helper.c               | 107 ------------------
 drivers/gpu/drm/i915/Kconfig                  |   8 ++
 drivers/gpu/drm/i915/Makefile                 |   2 +-
 .../drm/i915/display/intel_display_debugfs.c  |   2 +-
 drivers/gpu/drm/i915/display/intel_fbdev.c    |  51 ++++++++-
 drivers/gpu/drm/i915/display/intel_fbdev.h    |   2 +-
 include/drm/drm_fb_helper.h                   |  39 -------
 8 files changed, 56 insertions(+), 158 deletions(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index c67c97471b3c..cf8d5ec5a654 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -142,9 +142,6 @@ config DRM_FBDEV_EMULATION
 	bool "Enable legacy fbdev support for your modesetting driver"
 	depends on DRM_KMS_HELPER
 	depends on FB=y || FB=DRM_KMS_HELPER
-	select FB_CFB_FILLRECT
-	select FB_CFB_COPYAREA
-	select FB_CFB_IMAGEBLIT
 	select FRAMEBUFFER_CONSOLE if !EXPERT
 	select FRAMEBUFFER_CONSOLE_DETECT_PRIMARY if FRAMEBUFFER_CONSOLE
 	default y
diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index ba0a808f14ee..5927896ad8f6 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -729,113 +729,6 @@ void drm_fb_helper_deferred_io(struct fb_info *info, struct list_head *pagerefli
 }
 EXPORT_SYMBOL(drm_fb_helper_deferred_io);
 
-/**
- * drm_fb_helper_cfb_read - Implements struct &fb_ops.fb_read for I/O memory
- * @info: fb_info struct pointer
- * @buf: userspace buffer to read from framebuffer memory
- * @count: number of bytes to read from framebuffer memory
- * @ppos: read offset within framebuffer memory
- *
- * Returns:
- * The number of bytes read on success, or an error code otherwise.
- */
-ssize_t drm_fb_helper_cfb_read(struct fb_info *info, char __user *buf,
-			       size_t count, loff_t *ppos)
-{
-	return fb_io_read(info, buf, count, ppos);
-}
-EXPORT_SYMBOL(drm_fb_helper_cfb_read);
-
-/**
- * drm_fb_helper_cfb_write - Implements struct &fb_ops.fb_write for I/O memory
- * @info: fb_info struct pointer
- * @buf: userspace buffer to write to framebuffer memory
- * @count: number of bytes to write to framebuffer memory
- * @ppos: write offset within framebuffer memory
- *
- * Returns:
- * The number of bytes written on success, or an error code otherwise.
- */
-ssize_t drm_fb_helper_cfb_write(struct fb_info *info, const char __user *buf,
-				size_t count, loff_t *ppos)
-{
-	struct drm_fb_helper *helper = info->par;
-	loff_t pos = *ppos;
-	ssize_t ret;
-	struct drm_rect damage_area;
-
-	ret = fb_io_write(info, buf, count, ppos);
-	if (ret <= 0)
-		return ret;
-
-	if (helper->funcs->fb_dirty) {
-		drm_fb_helper_memory_range_to_clip(info, pos, ret, &damage_area);
-		drm_fb_helper_damage(helper, damage_area.x1, damage_area.y1,
-				     drm_rect_width(&damage_area),
-				     drm_rect_height(&damage_area));
-	}
-
-	return ret;
-}
-EXPORT_SYMBOL(drm_fb_helper_cfb_write);
-
-/**
- * drm_fb_helper_cfb_fillrect - wrapper around cfb_fillrect
- * @info: fbdev registered by the helper
- * @rect: info about rectangle to fill
- *
- * A wrapper around cfb_fillrect implemented by fbdev core
- */
-void drm_fb_helper_cfb_fillrect(struct fb_info *info,
-				const struct fb_fillrect *rect)
-{
-	struct drm_fb_helper *helper = info->par;
-
-	cfb_fillrect(info, rect);
-
-	if (helper->funcs->fb_dirty)
-		drm_fb_helper_damage(helper, rect->dx, rect->dy, rect->width, rect->height);
-}
-EXPORT_SYMBOL(drm_fb_helper_cfb_fillrect);
-
-/**
- * drm_fb_helper_cfb_copyarea - wrapper around cfb_copyarea
- * @info: fbdev registered by the helper
- * @area: info about area to copy
- *
- * A wrapper around cfb_copyarea implemented by fbdev core
- */
-void drm_fb_helper_cfb_copyarea(struct fb_info *info,
-				const struct fb_copyarea *area)
-{
-	struct drm_fb_helper *helper = info->par;
-
-	cfb_copyarea(info, area);
-
-	if (helper->funcs->fb_dirty)
-		drm_fb_helper_damage(helper, area->dx, area->dy, area->width, area->height);
-}
-EXPORT_SYMBOL(drm_fb_helper_cfb_copyarea);
-
-/**
- * drm_fb_helper_cfb_imageblit - wrapper around cfb_imageblit
- * @info: fbdev registered by the helper
- * @image: info about image to blit
- *
- * A wrapper around cfb_imageblit implemented by fbdev core
- */
-void drm_fb_helper_cfb_imageblit(struct fb_info *info,
-				 const struct fb_image *image)
-{
-	struct drm_fb_helper *helper = info->par;
-
-	cfb_imageblit(info, image);
-
-	if (helper->funcs->fb_dirty)
-		drm_fb_helper_damage(helper, image->dx, image->dy, image->width, image->height);
-}
-EXPORT_SYMBOL(drm_fb_helper_cfb_imageblit);
-
 /**
  * drm_fb_helper_set_suspend - wrapper around fb_set_suspend
  * @fb_helper: driver-allocated fbdev helper, can be NULL
diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
index e4f4d2e3fdfe..c2af3b780a7c 100644
--- a/drivers/gpu/drm/i915/Kconfig
+++ b/drivers/gpu/drm/i915/Kconfig
@@ -14,6 +14,7 @@ config DRM_I915
 	select DRM_DISPLAY_HDCP_HELPER
 	select DRM_DISPLAY_HDMI_HELPER
 	select DRM_DISPLAY_HELPER
+	select DRM_I915_FBDEV_EMULATION if DRM_FBDEV_EMULATION
 	select DRM_KMS_HELPER
 	select DRM_PANEL
 	select DRM_MIPI_DSI
@@ -154,6 +155,13 @@ config DRM_I915_PXP
 	  protected session and manage the status of the alive software session,
 	  as well as its life cycle.
 
+config DRM_I915_FBDEV_EMULATION
+	bool
+	depends on DRM_I915
+	select FB_CFB_COPYAREA
+	select FB_CFB_FILLRECT
+	select FB_CFB_IMAGEBLIT
+
 menu "drm/i915 Debugging"
 depends on DRM_I915
 depends on EXPERT
diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index d97d45ae1a0d..3593a6b8f7ab 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -286,7 +286,7 @@ i915-y += \
 i915-$(CONFIG_ACPI) += \
 	display/intel_acpi.o \
 	display/intel_opregion.o
-i915-$(CONFIG_DRM_FBDEV_EMULATION) += \
+i915-$(CONFIG_DRM_I915_FBDEV_EMULATION) += \
 	display/intel_fbdev.o
 
 # modesetting output/encoder code
diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
index e72288662f02..967962421c14 100644
--- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
+++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
@@ -108,7 +108,7 @@ static int i915_gem_framebuffer_info(struct seq_file *m, void *data)
 	struct intel_framebuffer *fbdev_fb = NULL;
 	struct drm_framebuffer *drm_fb;
 
-#ifdef CONFIG_DRM_FBDEV_EMULATION
+#ifdef CONFIG_DRM_I915_FBDEV_EMULATION
 	fbdev_fb = intel_fbdev_framebuffer(dev_priv->display.fbdev.fbdev);
 	if (fbdev_fb) {
 		seq_printf(m, "fbcon size: %d x %d, depth %d, %d bpp, modifier 0x%llx, refcount %d, obj ",
diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index aab1ae74a8f7..64aeacef703d 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
@@ -28,6 +28,7 @@
 #include <linux/console.h>
 #include <linux/delay.h>
 #include <linux/errno.h>
+#include <linux/fb.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/mm.h>
@@ -84,6 +85,20 @@ static void intel_fbdev_invalidate(struct intel_fbdev *ifbdev)
 	intel_frontbuffer_invalidate(to_frontbuffer(ifbdev), ORIGIN_CPU);
 }
 
+static ssize_t intel_fbdev_fb_write(struct fb_info *info, const char __user *buf,
+				    size_t count, loff_t *ppos)
+{
+	struct drm_fb_helper *helper = info->par;
+	loff_t pos = *ppos;
+	ssize_t ret;
+
+	ret = fb_io_write(info, buf, count, ppos);
+	if (ret > 0)
+		drm_fb_helper_damage_range(helper, pos, ret);
+
+	return ret;
+}
+
 static int intel_fbdev_set_par(struct fb_info *info)
 {
 	struct intel_fbdev *ifbdev = to_intel_fbdev(info->par);
@@ -121,6 +136,30 @@ static int intel_fbdev_pan_display(struct fb_var_screeninfo *var,
 	return ret;
 }
 
+static void intel_fbdev_fb_fillrect(struct fb_info *info, const struct fb_fillrect *rect)
+{
+	struct drm_fb_helper *helper = info->par;
+
+	cfb_fillrect(info, rect);
+	drm_fb_helper_damage(helper, rect->dx, rect->dy, rect->width, rect->height);
+}
+
+static void intel_fbdev_fb_copyarea(struct fb_info *info, const struct fb_copyarea *area)
+{
+	struct drm_fb_helper *helper = info->par;
+
+	cfb_copyarea(info, area);
+	drm_fb_helper_damage(helper, area->dx, area->dy, area->width, area->height);
+}
+
+static void intel_fbdev_fb_imageblit(struct fb_info *info, const struct fb_image *image)
+{
+	struct drm_fb_helper *helper = info->par;
+
+	cfb_imageblit(info, image);
+	drm_fb_helper_damage(helper, image->dx, image->dy, image->width, image->height);
+}
+
 static int intel_fbdev_mmap(struct fb_info *info, struct vm_area_struct *vma)
 {
 	struct intel_fbdev *fbdev = to_intel_fbdev(info->par);
@@ -134,13 +173,13 @@ static const struct fb_ops intelfb_ops = {
 	.owner = THIS_MODULE,
 	DRM_FB_HELPER_DEFAULT_OPS,
 	.fb_set_par = intel_fbdev_set_par,
-	.fb_read = drm_fb_helper_cfb_read,
-	.fb_write = drm_fb_helper_cfb_write,
-	.fb_fillrect = drm_fb_helper_cfb_fillrect,
-	.fb_copyarea = drm_fb_helper_cfb_copyarea,
-	.fb_imageblit = drm_fb_helper_cfb_imageblit,
-	.fb_pan_display = intel_fbdev_pan_display,
+	.fb_read = fb_io_read,
+	.fb_write = intel_fbdev_fb_write,
 	.fb_blank = intel_fbdev_blank,
+	.fb_pan_display = intel_fbdev_pan_display,
+	.fb_fillrect = intel_fbdev_fb_fillrect,
+	.fb_copyarea = intel_fbdev_fb_copyarea,
+	.fb_imageblit = intel_fbdev_fb_imageblit,
 	.fb_mmap = intel_fbdev_mmap,
 };
 
diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.h b/drivers/gpu/drm/i915/display/intel_fbdev.h
index 04fd523a5023..3900030808bf 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.h
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.h
@@ -13,7 +13,7 @@ struct drm_i915_private;
 struct intel_fbdev;
 struct intel_framebuffer;
 
-#ifdef CONFIG_DRM_FBDEV_EMULATION
+#if defined(CONFIG_DRM_I915_FBDEV_EMULATION)
 int intel_fbdev_init(struct drm_device *dev);
 void intel_fbdev_initial_config_async(struct drm_i915_private *dev_priv);
 void intel_fbdev_unregister(struct drm_i915_private *dev_priv);
diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
index e3240d749a43..15f03d8fb5cd 100644
--- a/include/drm/drm_fb_helper.h
+++ b/include/drm/drm_fb_helper.h
@@ -259,18 +259,6 @@ void drm_fb_helper_damage_range(struct drm_fb_helper *helper, off_t off, size_t
 
 void drm_fb_helper_deferred_io(struct fb_info *info, struct list_head *pagereflist);
 
-ssize_t drm_fb_helper_cfb_read(struct fb_info *info, char __user *buf,
-			       size_t count, loff_t *ppos);
-ssize_t drm_fb_helper_cfb_write(struct fb_info *info, const char __user *buf,
-				size_t count, loff_t *ppos);
-
-void drm_fb_helper_cfb_fillrect(struct fb_info *info,
-				const struct fb_fillrect *rect);
-void drm_fb_helper_cfb_copyarea(struct fb_info *info,
-				const struct fb_copyarea *area);
-void drm_fb_helper_cfb_imageblit(struct fb_info *info,
-				 const struct fb_image *image);
-
 void drm_fb_helper_set_suspend(struct drm_fb_helper *fb_helper, bool suspend);
 void drm_fb_helper_set_suspend_unlocked(struct drm_fb_helper *fb_helper,
 					bool suspend);
@@ -386,33 +374,6 @@ static inline int drm_fb_helper_defio_init(struct drm_fb_helper *fb_helper)
 	return -ENODEV;
 }
 
-static inline ssize_t drm_fb_helper_cfb_read(struct fb_info *info, char __user *buf,
-					     size_t count, loff_t *ppos)
-{
-	return -ENODEV;
-}
-
-static inline ssize_t drm_fb_helper_cfb_write(struct fb_info *info, const char __user *buf,
-					      size_t count, loff_t *ppos)
-{
-	return -ENODEV;
-}
-
-static inline void drm_fb_helper_cfb_fillrect(struct fb_info *info,
-					      const struct fb_fillrect *rect)
-{
-}
-
-static inline void drm_fb_helper_cfb_copyarea(struct fb_info *info,
-					      const struct fb_copyarea *area)
-{
-}
-
-static inline void drm_fb_helper_cfb_imageblit(struct fb_info *info,
-					       const struct fb_image *image)
-{
-}
-
 static inline void drm_fb_helper_set_suspend(struct drm_fb_helper *fb_helper,
 					     bool suspend)
 {
-- 
2.40.1

