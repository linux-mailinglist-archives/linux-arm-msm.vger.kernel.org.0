Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E05DC7002A6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 May 2023 10:42:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240026AbjELImC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 May 2023 04:42:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240158AbjELIl6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 May 2023 04:41:58 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 716657A83;
        Fri, 12 May 2023 01:41:57 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 1973C20439;
        Fri, 12 May 2023 08:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1683880916; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=txJMPZPrX+cezG81MFeFiAbDpsCYTcij5lftNUBYvCQ=;
        b=1N9EdwfkKq135vmw7b1hlgw5mO7fWmQi8f3XDy9/DR2L4e7zsS3tsUU1xQqJsiNlVwknBz
        DZ6FxeqM17ykBSmrwO7mqdwST0Fs+znj2OXbtCTBHecnd/KSW+NJ6gM2T8htDCQEkJZllG
        nztaCrh4ubXdF5ysJm+68UtpBaMfniM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1683880916;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=txJMPZPrX+cezG81MFeFiAbDpsCYTcij5lftNUBYvCQ=;
        b=0wTTlT3fZqFbTdyXVBjZFB9hKMlSTMC5yhkrCP6Qgk2OV6I1mPymkMW8ec/6zuh7Uu4KgZ
        3p4gyyXNaUEbOQAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C92B713A0A;
        Fri, 12 May 2023 08:41:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id uHdFMNP7XWQZKQAAMHmgww
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
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 05/11] drm/fbdev-dma: Use regular fbdev I/O helpers
Date:   Fri, 12 May 2023 10:41:46 +0200
Message-Id: <20230512084152.31233-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230512084152.31233-1-tzimmermann@suse.de>
References: <20230512084152.31233-1-tzimmermann@suse.de>
MIME-Version: 1.0
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
helpers. Fbdev-dma does not use damage handling, so DRM's fbdev helpers
are mere wrappers around the fbdev code.

Add CONFIG_DRM_FBDEV_DMA_EMULATION to select the necessary
Kconfig options automatically. Make fbdev emulation depend on
the new config option.

By using fbdev helpers directly within each DRM fbdev emulation,
we can eventually remove DRM's wrapper functions entirely.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/Kconfig         |  9 +++++++++
 drivers/gpu/drm/Makefile        |  2 +-
 drivers/gpu/drm/drm_fbdev_dma.c | 12 +++++++-----
 include/drm/drm_fbdev_dma.h     |  2 +-
 4 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index ba3fb04bb691..c007cb75715e 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -223,9 +223,18 @@ config DRM_TTM_HELPER
 config DRM_GEM_DMA_HELPER
 	tristate
 	depends on DRM
+	select DRM_FBDEV_DMA_EMULATION if DRM_FBDEV_EMULATION
 	help
 	  Choose this if you need the GEM DMA helper functions
 
+config DRM_FBDEV_DMA_EMULATION
+	bool
+	depends on DRM_GEM_DMA_HELPER
+	select FB_SYS_COPYAREA
+	select FB_SYS_FILLRECT
+	select FB_SYS_FOPS
+	select FB_SYS_IMAGEBLIT
+
 config DRM_GEM_SHMEM_HELPER
 	tristate
 	depends on DRM && MMU
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index a33257d2bc7f..d94821d37c2d 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -82,7 +82,7 @@ obj-$(CONFIG_DRM_PANEL_ORIENTATION_QUIRKS) += drm_panel_orientation_quirks.o
 obj-$(CONFIG_DRM_BUDDY) += drm_buddy.o
 
 drm_dma_helper-y := drm_gem_dma_helper.o
-drm_dma_helper-$(CONFIG_DRM_FBDEV_EMULATION) += drm_fbdev_dma.o
+drm_dma_helper-$(CONFIG_DRM_FBDEV_DMA_EMULATION) += drm_fbdev_dma.o
 drm_dma_helper-$(CONFIG_DRM_KMS_HELPER) += drm_fb_dma_helper.o
 obj-$(CONFIG_DRM_GEM_DMA_HELPER) += drm_dma_helper.o
 
diff --git a/drivers/gpu/drm/drm_fbdev_dma.c b/drivers/gpu/drm/drm_fbdev_dma.c
index 728deffcc0d9..09a36dc38c43 100644
--- a/drivers/gpu/drm/drm_fbdev_dma.c
+++ b/drivers/gpu/drm/drm_fbdev_dma.c
@@ -1,5 +1,7 @@
 // SPDX-License-Identifier: MIT
 
+#include <linux/fb.h>
+
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fb_helper.h>
@@ -64,12 +66,12 @@ static const struct fb_ops drm_fbdev_dma_fb_ops = {
 	.owner = THIS_MODULE,
 	.fb_open = drm_fbdev_dma_fb_open,
 	.fb_release = drm_fbdev_dma_fb_release,
-	.fb_read = drm_fb_helper_sys_read,
-	.fb_write = drm_fb_helper_sys_write,
+	.fb_read = fb_sys_read,
+	.fb_write = fb_sys_write,
 	DRM_FB_HELPER_DEFAULT_OPS,
-	.fb_fillrect = drm_fb_helper_sys_fillrect,
-	.fb_copyarea = drm_fb_helper_sys_copyarea,
-	.fb_imageblit = drm_fb_helper_sys_imageblit,
+	.fb_fillrect = sys_fillrect,
+	.fb_copyarea = sys_copyarea,
+	.fb_imageblit = sys_imageblit,
 	.fb_destroy = drm_fbdev_dma_fb_destroy,
 	.fb_mmap = drm_fbdev_dma_fb_mmap,
 };
diff --git a/include/drm/drm_fbdev_dma.h b/include/drm/drm_fbdev_dma.h
index 2da7ee784133..3e96ad069136 100644
--- a/include/drm/drm_fbdev_dma.h
+++ b/include/drm/drm_fbdev_dma.h
@@ -5,7 +5,7 @@
 
 struct drm_device;
 
-#ifdef CONFIG_DRM_FBDEV_EMULATION
+#if defined(CONFIG_DRM_FBDEV_DMA_EMULATION)
 void drm_fbdev_dma_setup(struct drm_device *dev, unsigned int preferred_bpp);
 #else
 static inline void drm_fbdev_dma_setup(struct drm_device *dev, unsigned int preferred_bpp)
-- 
2.40.1

