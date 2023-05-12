Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3C777002A0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 May 2023 10:42:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240025AbjELImA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 May 2023 04:42:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240109AbjELIl6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 May 2023 04:41:58 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B4A95B98;
        Fri, 12 May 2023 01:41:57 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id C5AEC2277F;
        Fri, 12 May 2023 08:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1683880915; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=CPj8PSVa733w7x7xFCz+v5D3fSwmoptM8FaSvfFesA4=;
        b=E4qQaRYrBMXM9qzhTmOCzGzXKqXrw+Kac1y/5XRkbdPnpNKr5won871BZ7dbfQT6B0DvXl
        JsMNcGDEGaKhqPcw7rFBmkeGrKA/rrPHyqN4tFOoPe9wHreCqrti0i3UQXxcNNtGj88hCu
        qa1q198G8HZkCWQkXwYQMUzrTnXqiP0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1683880915;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=CPj8PSVa733w7x7xFCz+v5D3fSwmoptM8FaSvfFesA4=;
        b=1rOz6zhbuJKgqdK+TAWnurZZCKL9goFz9qADinfTLap1nyF1XNvAyoUH+vsplTgH5i0WQj
        ZGKX+BhSYFJsGRCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 79BA413466;
        Fri, 12 May 2023 08:41:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id qE7nHNP7XWQZKQAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Fri, 12 May 2023 08:41:55 +0000
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
        Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        "Pan, Xinhui" <Xinhui.Pan@amd.com>
Subject: [PATCH 04/11] drm/radeon: Use regular fbdev I/O helpers
Date:   Fri, 12 May 2023 10:41:45 +0200
Message-Id: <20230512084152.31233-5-tzimmermann@suse.de>
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

Use the regular fbdev helpers for framebuffer I/O instead of DRM's
helpers. Radeon does not use damage handling, so DRM's fbdev helpers
are mere wrappers around the fbdev code.

Add CONFIG_DRM_RADEON_FBDEV_EMULATION to select the necessary
Kconfig options automatically. Make fbdev emulation depend on
the new config option.

By using fbdev helpers directly within each DRM fbdev emulation,
we can eventually remove DRM's wrapper functions entirely.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
---
 drivers/gpu/drm/radeon/Kconfig        | 8 ++++++++
 drivers/gpu/drm/radeon/Makefile       | 2 +-
 drivers/gpu/drm/radeon/radeon_fbdev.c | 9 ++++-----
 drivers/gpu/drm/radeon/radeon_mode.h  | 2 +-
 4 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/radeon/Kconfig b/drivers/gpu/drm/radeon/Kconfig
index e19d77d58810..66b741d96cc4 100644
--- a/drivers/gpu/drm/radeon/Kconfig
+++ b/drivers/gpu/drm/radeon/Kconfig
@@ -8,6 +8,7 @@ config DRM_RADEON
 	select DRM_DISPLAY_DP_HELPER
 	select DRM_DISPLAY_HELPER
         select DRM_KMS_HELPER
+	select DRM_RADEON_FBDEV_EMULATION if DRM_FBDEV_EMULATION
 	select DRM_SUBALLOC_HELPER
         select DRM_TTM
 	select DRM_TTM_HELPER
@@ -39,3 +40,10 @@ config DRM_RADEON_USERPTR
 	help
 	  This option selects CONFIG_MMU_NOTIFIER if it isn't already
 	  selected to enabled full userptr support.
+
+config DRM_RADEON_FBDEV_EMULATION
+	bool
+	depends on DRM_RADEON
+	select FB_CFB_COPYAREA
+	select FB_CFB_FILLRECT
+	select FB_CFB_IMAGEBLIT
diff --git a/drivers/gpu/drm/radeon/Makefile b/drivers/gpu/drm/radeon/Makefile
index a8734b7d0485..46c1446196a9 100644
--- a/drivers/gpu/drm/radeon/Makefile
+++ b/drivers/gpu/drm/radeon/Makefile
@@ -76,7 +76,7 @@ radeon-y += \
 	vce_v1_0.o \
 	vce_v2_0.o
 
-radeon-$(CONFIG_DRM_FBDEV_EMULATION) += radeon_fbdev.o
+radeon-$(CONFIG_DRM_RADEON_FBDEV_EMULATION) += radeon_fbdev.o
 radeon-$(CONFIG_VGA_SWITCHEROO) += radeon_atpx_handler.o
 radeon-$(CONFIG_ACPI) += radeon_acpi.o
 
diff --git a/drivers/gpu/drm/radeon/radeon_fbdev.c b/drivers/gpu/drm/radeon/radeon_fbdev.c
index fe76e29910ef..dcabe527f9c0 100644
--- a/drivers/gpu/drm/radeon/radeon_fbdev.c
+++ b/drivers/gpu/drm/radeon/radeon_fbdev.c
@@ -24,6 +24,7 @@
  *     David Airlie
  */
 
+#include <linux/fb.h>
 #include <linux/pci.h>
 #include <linux/pm_runtime.h>
 #include <linux/vga_switcheroo.h>
@@ -193,11 +194,9 @@ static const struct fb_ops radeon_fbdev_fb_ops = {
 	DRM_FB_HELPER_DEFAULT_OPS,
 	.fb_open = radeon_fbdev_fb_open,
 	.fb_release = radeon_fbdev_fb_release,
-	.fb_read = drm_fb_helper_cfb_read,
-	.fb_write = drm_fb_helper_cfb_write,
-	.fb_fillrect = drm_fb_helper_cfb_fillrect,
-	.fb_copyarea = drm_fb_helper_cfb_copyarea,
-	.fb_imageblit = drm_fb_helper_cfb_imageblit,
+	.fb_fillrect = cfb_fillrect,
+	.fb_copyarea = cfb_copyarea,
+	.fb_imageblit = cfb_imageblit,
 	.fb_destroy = radeon_fbdev_fb_destroy,
 };
 
diff --git a/drivers/gpu/drm/radeon/radeon_mode.h b/drivers/gpu/drm/radeon/radeon_mode.h
index 1decdcec0264..c5a8e25a4c97 100644
--- a/drivers/gpu/drm/radeon/radeon_mode.h
+++ b/drivers/gpu/drm/radeon/radeon_mode.h
@@ -939,7 +939,7 @@ void dce4_program_fmt(struct drm_encoder *encoder);
 void dce8_program_fmt(struct drm_encoder *encoder);
 
 /* fbdev layer */
-#if defined(CONFIG_DRM_FBDEV_EMULATION)
+#if defined(CONFIG_DRM_RADEON_FBDEV_EMULATION)
 void radeon_fbdev_setup(struct radeon_device *rdev);
 void radeon_fbdev_set_suspend(struct radeon_device *rdev, int state);
 bool radeon_fbdev_robj_is_fb(struct radeon_device *rdev, struct radeon_bo *robj);
-- 
2.40.1

