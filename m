Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13DD670F26A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 May 2023 11:22:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239380AbjEXJW3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 May 2023 05:22:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240593AbjEXJW1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 May 2023 05:22:27 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72A89E43;
        Wed, 24 May 2023 02:22:01 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 9107C22498;
        Wed, 24 May 2023 09:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1684920116; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Oj2iRP6pMo4vDxNswIvtR3QKGnI5kEeFw2PfgIFRgBs=;
        b=NFGtqcWf+kR1+9XuBtmK5g4jw/b/cKBsucrTQYr4JtOznGE5idxK8p3e7lA/p0EsGyYaYz
        lO1Enum4+7EVeqi3r57ppA2wUY/T9e8ZWCMZuk7o59A6SgzuvxVC1fMxF+EYlP2jrzTdyK
        gzzGxFS4biFixrDBDqed+spj8wt095A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1684920116;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Oj2iRP6pMo4vDxNswIvtR3QKGnI5kEeFw2PfgIFRgBs=;
        b=vTx9MiQcb0Oc//KTM/MISv+8HVX4/muXP8Onapsy8Wf0GzktWfGfRt0gLCGfbyCCj1iPBl
        y8b4jw7tygg7l6CA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4914513A10;
        Wed, 24 May 2023 09:21:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id mM8TETTXbWTHewAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Wed, 24 May 2023 09:21:56 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     daniel@ffwll.ch, airlied@gmail.com,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        javierm@redhat.com, sam@ravnborg.org
Cc:     dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        amd-gfx@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Tomi Valkeinen <tomba@kernel.org>
Subject: [PATCH v4 09/13] drm/omapdrm: Use regular fbdev I/O helpers
Date:   Wed, 24 May 2023 11:21:46 +0200
Message-Id: <20230524092150.11776-10-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230524092150.11776-1-tzimmermann@suse.de>
References: <20230524092150.11776-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use the regular fbdev helpers for framebuffer I/O instead of DRM's
helpers. Omapdrm does not use damage handling, so DRM's fbdev helpers
are mere wrappers around the fbdev code.

By using fbdev helpers directly within each DRM fbdev emulation,
we can eventually remove DRM's wrapper functions entirely.

v4:
	* use initializer macros for struct fb_ops
v2:
	* use FB_SYS_HELPERS option

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Tomi Valkeinen <tomba@kernel.org>
---
 drivers/gpu/drm/omapdrm/Kconfig      |  1 +
 drivers/gpu/drm/omapdrm/omap_fbdev.c | 11 +++--------
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/Kconfig b/drivers/gpu/drm/omapdrm/Kconfig
index 76ded1568bd0..b4ac76c9f31b 100644
--- a/drivers/gpu/drm/omapdrm/Kconfig
+++ b/drivers/gpu/drm/omapdrm/Kconfig
@@ -4,6 +4,7 @@ config DRM_OMAP
 	depends on DRM && OF
 	depends on ARCH_OMAP2PLUS
 	select DRM_KMS_HELPER
+	select FB_SYS_HELPERS if DRM_FBDEV_EMULATION
 	select VIDEOMODE_HELPERS
 	select HDMI
 	default n
diff --git a/drivers/gpu/drm/omapdrm/omap_fbdev.c b/drivers/gpu/drm/omapdrm/omap_fbdev.c
index b950e93b3846..b7ccce0704a3 100644
--- a/drivers/gpu/drm/omapdrm/omap_fbdev.c
+++ b/drivers/gpu/drm/omapdrm/omap_fbdev.c
@@ -4,6 +4,8 @@
  * Author: Rob Clark <rob@ti.com>
  */
 
+#include <linux/fb.h>
+
 #include <drm/drm_drv.h>
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_fb_helper.h>
@@ -95,20 +97,13 @@ static void omap_fbdev_fb_destroy(struct fb_info *info)
 
 static const struct fb_ops omap_fb_ops = {
 	.owner = THIS_MODULE,
-
+	FB_DEFAULT_SYS_OPS,
 	.fb_check_var	= drm_fb_helper_check_var,
 	.fb_set_par	= drm_fb_helper_set_par,
 	.fb_setcmap	= drm_fb_helper_setcmap,
 	.fb_blank	= drm_fb_helper_blank,
 	.fb_pan_display = omap_fbdev_pan_display,
 	.fb_ioctl	= drm_fb_helper_ioctl,
-
-	.fb_read = drm_fb_helper_sys_read,
-	.fb_write = drm_fb_helper_sys_write,
-	.fb_fillrect = drm_fb_helper_sys_fillrect,
-	.fb_copyarea = drm_fb_helper_sys_copyarea,
-	.fb_imageblit = drm_fb_helper_sys_imageblit,
-
 	.fb_destroy = omap_fbdev_fb_destroy,
 };
 
-- 
2.40.1

