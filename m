Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BB9170029A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 May 2023 10:42:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240219AbjELImA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 May 2023 04:42:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240025AbjELIl5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 May 2023 04:41:57 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7342249F4;
        Fri, 12 May 2023 01:41:56 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 2836C20437;
        Fri, 12 May 2023 08:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1683880915; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=PJqEG/CeqhUYorQ9LHu5G5OfhEtg1W9GXaMXtW0UJIE=;
        b=H3suTdauheUg1rxZJzibqHwNSavfFJaxC6qeuZORkZoAC7n192hkknlrHTyMwAMv8hOTlG
        IsB3dDVmABydUDWJWPbBx8Ucb5dysP6t3SZFhJKJ+igFK1gOg7zEcILXbEiQwjh0+7M2T+
        GUVr/HEx6T4wTG/kka3ild9F9EdLsMA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1683880915;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=PJqEG/CeqhUYorQ9LHu5G5OfhEtg1W9GXaMXtW0UJIE=;
        b=s3GiwHlmChHPrfB10tKjWu/CN0UtpQBH7O0vfJ2jCOBdk65nxtQgTNSjWFlQnUee9jvzQc
        AxtRi6m3Rv4Le0AA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CBF1913466;
        Fri, 12 May 2023 08:41:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id QBEAMdL7XWQZKQAAMHmgww
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
        Inki Dae <inki.dae@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH 02/11] drm/exynos: Use regular fbdev I/O helpers
Date:   Fri, 12 May 2023 10:41:43 +0200
Message-Id: <20230512084152.31233-3-tzimmermann@suse.de>
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
helpers. Exynos does not use damage handling, so DRM's fbdev helpers
are mere wrappers around the fbdev code.

Add CONFIG_DRM_EXYNOS_FBDEV_EMULATION to select the necessary
Kconfig options automatically. Make fbdev emulation depend on
the new config option.

By using fbdev helpers directly within each DRM fbdev emulation,
we can eventually remove DRM's wrapper functions entirely.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Inki Dae <inki.dae@samsung.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>
---
 drivers/gpu/drm/exynos/Kconfig            |  8 ++++++++
 drivers/gpu/drm/exynos/Makefile           |  2 +-
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c | 10 +++++-----
 drivers/gpu/drm/exynos/exynos_drm_fbdev.h |  2 +-
 4 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/exynos/Kconfig b/drivers/gpu/drm/exynos/Kconfig
index 0cb92d651ff1..c7ac07220e26 100644
--- a/drivers/gpu/drm/exynos/Kconfig
+++ b/drivers/gpu/drm/exynos/Kconfig
@@ -5,6 +5,7 @@ config DRM_EXYNOS
 	depends on ARCH_S3C64XX || ARCH_S5PV210 || ARCH_EXYNOS || COMPILE_TEST
 	depends on MMU
 	select DRM_DISPLAY_HELPER if DRM_EXYNOS_DP
+	select DRM_EXYNOS_FBDEV_EMULATION if DRM_FBDEV_EMULATION
 	select DRM_KMS_HELPER
 	select VIDEOMODE_HELPERS
 	select SND_SOC_HDMI_CODEC if SND_SOC
@@ -12,6 +13,13 @@ config DRM_EXYNOS
 	  Choose this option if you have a Samsung SoC Exynos chipset.
 	  If M is selected the module will be called exynosdrm.
 
+config DRM_EXYNOS_FBDEV_EMULATION
+	bool
+	depends on DRM_EXYNOS
+	select FB_CFB_COPYAREA
+	select FB_CFB_FILLRECT
+	select FB_CFB_IMAGEBLIT
+
 if DRM_EXYNOS
 
 comment "CRTCs"
diff --git a/drivers/gpu/drm/exynos/Makefile b/drivers/gpu/drm/exynos/Makefile
index 2fd2f3ee4fcf..a9278be4daf3 100644
--- a/drivers/gpu/drm/exynos/Makefile
+++ b/drivers/gpu/drm/exynos/Makefile
@@ -6,7 +6,7 @@
 exynosdrm-y := exynos_drm_drv.o exynos_drm_crtc.o exynos_drm_fb.o \
 		exynos_drm_gem.o exynos_drm_plane.o exynos_drm_dma.o
 
-exynosdrm-$(CONFIG_DRM_FBDEV_EMULATION) += exynos_drm_fbdev.o
+exynosdrm-$(CONFIG_DRM_EXYNOS_FBDEV_EMULATION)	+= exynos_drm_fbdev.o
 exynosdrm-$(CONFIG_DRM_EXYNOS_FIMD)	+= exynos_drm_fimd.o
 exynosdrm-$(CONFIG_DRM_EXYNOS5433_DECON)	+= exynos5433_drm_decon.o
 exynosdrm-$(CONFIG_DRM_EXYNOS7_DECON)	+= exynos7_drm_decon.o
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
index ea4b3d248aac..b3333dd1d087 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
@@ -8,6 +8,8 @@
  *	Seung-Woo Kim <sw0312.kim@samsung.com>
  */
 
+#include <linux/fb.h>
+
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fb_helper.h>
@@ -49,11 +51,9 @@ static const struct fb_ops exynos_drm_fb_ops = {
 	.owner		= THIS_MODULE,
 	DRM_FB_HELPER_DEFAULT_OPS,
 	.fb_mmap        = exynos_drm_fb_mmap,
-	.fb_read	= drm_fb_helper_cfb_read,
-	.fb_write	= drm_fb_helper_cfb_write,
-	.fb_fillrect	= drm_fb_helper_cfb_fillrect,
-	.fb_copyarea	= drm_fb_helper_cfb_copyarea,
-	.fb_imageblit	= drm_fb_helper_cfb_imageblit,
+	.fb_fillrect	= cfb_fillrect,
+	.fb_copyarea	= cfb_copyarea,
+	.fb_imageblit	= cfb_imageblit,
 	.fb_destroy	= exynos_drm_fb_destroy,
 };
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fbdev.h b/drivers/gpu/drm/exynos/exynos_drm_fbdev.h
index 1e1dea627cd9..9a8425881ff1 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fbdev.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_fbdev.h
@@ -11,7 +11,7 @@
 #ifndef _EXYNOS_DRM_FBDEV_H_
 #define _EXYNOS_DRM_FBDEV_H_
 
-#ifdef CONFIG_DRM_FBDEV_EMULATION
+#if defined(CONFIG_DRM_EXYNOS_FBDEV_EMULATION)
 void exynos_drm_fbdev_setup(struct drm_device *dev);
 #else
 static inline void exynos_drm_fbdev_setup(struct drm_device *dev)
-- 
2.40.1

