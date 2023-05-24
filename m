Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B38E470F25A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 May 2023 11:22:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240503AbjEXJWU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 May 2023 05:22:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240418AbjEXJWR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 May 2023 05:22:17 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F269E59;
        Wed, 24 May 2023 02:21:57 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 4466A1FDE9;
        Wed, 24 May 2023 09:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1684920116; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=uGZg7kFdz+XejD4cmJGt7V0mOKuKM/4e6s3JnO99UY4=;
        b=2Xkk2vwMa+PwUISyBhyBseoF4xYG2XQ7yQTzLyNUOlURhREHQVAayAwns5PqelCJCdjzex
        9xrnwNSwnvRFZVowQPGTBrF8JIlzVmQEV1wjDupytur+pF/nd0BKozwKllzOtmLg9E5GJi
        BtN46hClaqtE8z/GFYc/vfm86FzIe58=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1684920116;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=uGZg7kFdz+XejD4cmJGt7V0mOKuKM/4e6s3JnO99UY4=;
        b=WM3MHnIgwQ3Q6bQdgd1XqssT6t1l99URaFdruYYRF4IW2BYhkRqAqY33kDOS9SNUn3yMo0
        DYMMVjJSHoORX2DQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E1E2013425;
        Wed, 24 May 2023 09:21:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id qLNPNjPXbWTHewAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Wed, 24 May 2023 09:21:55 +0000
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
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>
Subject: [PATCH v4 08/13] drm/msm: Use regular fbdev I/O helpers
Date:   Wed, 24 May 2023 11:21:45 +0200
Message-Id: <20230524092150.11776-9-tzimmermann@suse.de>
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
helpers. Msm does not use damage handling, so DRM's fbdev helpers
are mere wrappers around the fbdev code.

By using fbdev helpers directly within each DRM fbdev emulation,
we can eventually remove DRM's wrapper functions entirely.

Msm's fbdev emulation has been incomplete as it didn't implement
damage handling. Partilly fix this by implementing damage handling
for write and draw operation. It is still missing for mmaped pages.

v4:
	* use initializer macros for struct fb_ops
	* partially support damage handling
v2:
	* use FB_SYS_HELPERS option

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Sean Paul <sean@poorly.run>
---
 drivers/gpu/drm/msm/Kconfig     |  1 +
 drivers/gpu/drm/msm/msm_fbdev.c | 17 ++++++++---------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index 85f5ab1d552c..a78662bd6273 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -21,6 +21,7 @@ config DRM_MSM
 	select DRM_BRIDGE
 	select DRM_PANEL_BRIDGE
 	select DRM_SCHED
+	select FB_SYS_HELPERS if DRM_FBDEV_EMULATION
 	select SHMEM
 	select TMPFS
 	select QCOM_SCM
diff --git a/drivers/gpu/drm/msm/msm_fbdev.c b/drivers/gpu/drm/msm/msm_fbdev.c
index ce0ba6d1979a..fa9c1cbffae3 100644
--- a/drivers/gpu/drm/msm/msm_fbdev.c
+++ b/drivers/gpu/drm/msm/msm_fbdev.c
@@ -4,6 +4,8 @@
  * Author: Rob Clark <robdclark@gmail.com>
  */
 
+#include <linux/fb.h>
+
 #include <drm/drm_drv.h>
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_fb_helper.h>
@@ -23,6 +25,10 @@ module_param(fbdev, bool, 0600);
  * fbdev funcs, to implement legacy fbdev interface on top of drm driver
  */
 
+FB_GEN_DEFAULT_DEFERRED_SYS_OPS(msm_fbdev,
+				drm_fb_helper_damage_range,
+				drm_fb_helper_damage_area)
+
 static int msm_fbdev_mmap(struct fb_info *info, struct vm_area_struct *vma)
 {
 	struct drm_fb_helper *helper = (struct drm_fb_helper *)info->par;
@@ -52,16 +58,9 @@ static void msm_fbdev_fb_destroy(struct fb_info *info)
 
 static const struct fb_ops msm_fb_ops = {
 	.owner = THIS_MODULE,
+	__FB_DEFAULT_DEFERRED_OPS_RDWR(msm_fbdev),
 	DRM_FB_HELPER_DEFAULT_OPS,
-
-	/* Note: to properly handle manual update displays, we wrap the
-	 * basic fbdev ops which write to the framebuffer
-	 */
-	.fb_read = drm_fb_helper_sys_read,
-	.fb_write = drm_fb_helper_sys_write,
-	.fb_fillrect = drm_fb_helper_sys_fillrect,
-	.fb_copyarea = drm_fb_helper_sys_copyarea,
-	.fb_imageblit = drm_fb_helper_sys_imageblit,
+	__FB_DEFAULT_DEFERRED_OPS_DRAW(msm_fbdev),
 	.fb_mmap = msm_fbdev_mmap,
 	.fb_destroy = msm_fbdev_fb_destroy,
 };
-- 
2.40.1

