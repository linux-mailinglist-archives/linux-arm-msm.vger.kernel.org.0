Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E51D6700299
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 May 2023 10:42:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240204AbjELIl7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 May 2023 04:41:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240000AbjELIl5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 May 2023 04:41:57 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A1364682;
        Fri, 12 May 2023 01:41:56 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id C77F020025;
        Fri, 12 May 2023 08:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1683880914; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DAAeGKzYoJOQjYPBCC6xf/WnpfnF9kmSpmaxPVYgctA=;
        b=Zt0kSXtIJ6OJ0OmOGA6lnj12q/awpUHVOFNr1I4WrzX2UmKuInqYnRB0i13Z+SyNsWncPp
        XqpIETO32eD2cnZXVpYLojw9uw7/rQ8v3NZv4c4rvhvVpvuCXajMDUZ9TaRsZ3KccTL5Vi
        bP6x6lV85fvPTDtodgx4bW1UrO8hkQo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1683880914;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DAAeGKzYoJOQjYPBCC6xf/WnpfnF9kmSpmaxPVYgctA=;
        b=LNEQ8JOApwOG2wXdEjeFP6JPByVBnAPQYuK+2LCZ86BgmyKrdiPCvn4FA6geiS0Fy6FLY5
        0z+oRD3DMNQz/xBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8050D13A0A;
        Fri, 12 May 2023 08:41:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id 6K9THtL7XWQZKQAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Fri, 12 May 2023 08:41:54 +0000
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
        Russell King <linux@armlinux.org.uk>
Subject: [PATCH 01/11] drm/armada: Use regular fbdev I/O helpers
Date:   Fri, 12 May 2023 10:41:42 +0200
Message-Id: <20230512084152.31233-2-tzimmermann@suse.de>
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
helpers. Armada does not use damage handling, so DRM's fbdev helpers
are mere wrappers around the fbdev code.

Add CONFIG_DRM_ARMADA_FBDEV_EMULATION to select the necessary
Kconfig options automatically. Make fbdev emulation depend on
the new config option.

By using fbdev helpers directly within each DRM fbdev emulation,
we can eventually remove DRM's wrapper functions entirely.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Russell King <linux@armlinux.org.uk>
---
 drivers/gpu/drm/armada/Kconfig        | 8 ++++++++
 drivers/gpu/drm/armada/Makefile       | 2 +-
 drivers/gpu/drm/armada/armada_drm.h   | 2 +-
 drivers/gpu/drm/armada/armada_fbdev.c | 9 ++++-----
 4 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/armada/Kconfig b/drivers/gpu/drm/armada/Kconfig
index f5c66d89ba99..054265d6fd26 100644
--- a/drivers/gpu/drm/armada/Kconfig
+++ b/drivers/gpu/drm/armada/Kconfig
@@ -2,6 +2,7 @@
 config DRM_ARMADA
 	tristate "DRM support for Marvell Armada SoCs"
 	depends on DRM && HAVE_CLK && ARM && MMU
+	select DRM_ARMADA_FBDEV_EMULATION if DRM_FBDEV_EMULATION
 	select DRM_KMS_HELPER
 	help
 	  Support the "LCD" controllers found on the Marvell Armada 510
@@ -11,3 +12,10 @@ config DRM_ARMADA
 	  This driver provides no built-in acceleration; acceleration is
 	  performed by other IP found on the SoC.  This driver provides
 	  kernel mode setting and buffer management to userspace.
+
+config DRM_ARMADA_FBDEV_EMULATION
+	bool
+	depends on DRM_ARMADA
+	select FB_CFB_COPYAREA
+	select FB_CFB_FILLRECT
+	select FB_CFB_IMAGEBLIT
diff --git a/drivers/gpu/drm/armada/Makefile b/drivers/gpu/drm/armada/Makefile
index dc75a7db9ed3..1c5671c94506 100644
--- a/drivers/gpu/drm/armada/Makefile
+++ b/drivers/gpu/drm/armada/Makefile
@@ -3,6 +3,6 @@ armada-y	:= armada_crtc.o armada_drv.o armada_fb.o \
 		   armada_gem.o armada_overlay.o armada_plane.o armada_trace.o
 armada-y	+= armada_510.o
 armada-$(CONFIG_DEBUG_FS) += armada_debugfs.o
-armada-$(CONFIG_DRM_FBDEV_EMULATION) += armada_fbdev.o
+armada-$(CONFIG_DRM_ARMADA_FBDEV_EMULATION) += armada_fbdev.o
 
 obj-$(CONFIG_DRM_ARMADA) := armada.o
diff --git a/drivers/gpu/drm/armada/armada_drm.h b/drivers/gpu/drm/armada/armada_drm.h
index c303e8c7ff6c..23a21c0fbd16 100644
--- a/drivers/gpu/drm/armada/armada_drm.h
+++ b/drivers/gpu/drm/armada/armada_drm.h
@@ -73,7 +73,7 @@ struct armada_private {
 
 #define drm_to_armada_dev(dev) container_of(dev, struct armada_private, drm)
 
-#if defined(CONFIG_DRM_FBDEV_EMULATION)
+#if defined(CONFIG_DRM_ARMADA_FBDEV_EMULATION)
 void armada_fbdev_setup(struct drm_device *dev);
 #else
 static inline void armada_fbdev_setup(struct drm_device *dev)
diff --git a/drivers/gpu/drm/armada/armada_fbdev.c b/drivers/gpu/drm/armada/armada_fbdev.c
index 0a5fd1aa86eb..6c3bbaf53569 100644
--- a/drivers/gpu/drm/armada/armada_fbdev.c
+++ b/drivers/gpu/drm/armada/armada_fbdev.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/errno.h>
+#include <linux/fb.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 
@@ -34,11 +35,9 @@ static void armada_fbdev_fb_destroy(struct fb_info *info)
 static const struct fb_ops armada_fb_ops = {
 	.owner		= THIS_MODULE,
 	DRM_FB_HELPER_DEFAULT_OPS,
-	.fb_read	= drm_fb_helper_cfb_read,
-	.fb_write	= drm_fb_helper_cfb_write,
-	.fb_fillrect	= drm_fb_helper_cfb_fillrect,
-	.fb_copyarea	= drm_fb_helper_cfb_copyarea,
-	.fb_imageblit	= drm_fb_helper_cfb_imageblit,
+	.fb_fillrect	= cfb_fillrect,
+	.fb_copyarea	= cfb_copyarea,
+	.fb_imageblit	= cfb_imageblit,
 	.fb_destroy	= armada_fbdev_fb_destroy,
 };
 
-- 
2.40.1

