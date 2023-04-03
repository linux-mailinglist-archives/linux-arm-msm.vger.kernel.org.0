Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9463F6D44B2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Apr 2023 14:45:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231893AbjDCMpt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Apr 2023 08:45:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232241AbjDCMpr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Apr 2023 08:45:47 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94D977D98
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Apr 2023 05:45:44 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 366E221CC7;
        Mon,  3 Apr 2023 12:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1680525943; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=420wvBnvp1Pv+KONXZ7sMFyAxDEnoJgFxUL7b1bGX8k=;
        b=PfwrNZfGfuroxay/yEqYOJ+zk78TTLL/TrBRr8wRhmniseO1f/V1jG+8CzRqKGjhGK9AlI
        JQfA8FvQq8cuLz5yllDh8xnXamge1J+aBnYT04PQrVcIoET6TEMTa1y0azTwQlzMk3Q5tk
        1NfJFLdZxHi1BmWn/DQxZh0+lo3Xq68=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1680525943;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=420wvBnvp1Pv+KONXZ7sMFyAxDEnoJgFxUL7b1bGX8k=;
        b=pqk7ELz4fL6Xc2Us4AN4o3gGQUodiboGm9zyY6DmNHj0vSjn5VPwJNCzFLoFbvUhxbRGR+
        RBwfhhPkTHtd4NCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DF6031331A;
        Mon,  3 Apr 2023 12:45:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id qIlcNXbKKmTRVgAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Mon, 03 Apr 2023 12:45:42 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run, javierm@redhat.com,
        airlied@gmail.com, daniel@ffwll.ch
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 8/8] drm/msm: Implement fbdev emulation as in-kernel client
Date:   Mon,  3 Apr 2023 14:45:38 +0200
Message-Id: <20230403124538.8497-9-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230403124538.8497-1-tzimmermann@suse.de>
References: <20230403124538.8497-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Move code from ad-hoc fbdev callbacks into DRM client functions
and remove the old callbacks. The functions instruct the client
to poll for changed output or restore the display. The DRM core
calls both, the old callbacks and the new client helpers, from
the same places. The new functions perform the same operation as
before, so there's no change in functionality.

Replace all code that initializes or releases fbdev emulation
throughout the driver. Instead initialize the fbdev client by a
single call to msm_fbdev_setup() after msm has registered its
DRM device. As in most drivers, msm's fbdev emulation now acts
like a regular DRM client.

The fbdev client setup consists of the initial preparation and the
hot-plugging of the display. The latter creates the fbdev device
and sets up the fbdev framebuffer. The setup performs display
hot-plugging once. If no display can be detected, DRM probe helpers
re-run the detection on each hotplug event.

A call to drm_dev_unregister() releases the client automatically.
No further action is required within msm. If the fbdev framebuffer
has been fully set up, struct fb_ops.fb_destroy implements the
release. For partially initialized emulation, the fbdev client
reverts the initial setup.

v2:
	* handle fbdev module parameter correctly (kernel test robot)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/msm/msm_debugfs.c |   1 +
 drivers/gpu/drm/msm/msm_drv.c     |  15 +---
 drivers/gpu/drm/msm/msm_drv.h     |  10 ++-
 drivers/gpu/drm/msm/msm_fbdev.c   | 115 ++++++++++++++++++------------
 4 files changed, 81 insertions(+), 60 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
index 7de9e39f051e..9c0e633a3a61 100644
--- a/drivers/gpu/drm/msm/msm_debugfs.c
+++ b/drivers/gpu/drm/msm/msm_debugfs.c
@@ -10,6 +10,7 @@
 #include <linux/fault-inject.h>
 
 #include <drm/drm_debugfs.h>
+#include <drm/drm_fb_helper.h>
 #include <drm/drm_file.h>
 #include <drm/drm_framebuffer.h>
 
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 4bf486f0ebb9..b4d7968e4251 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -54,7 +54,6 @@
 
 static const struct drm_mode_config_funcs mode_config_funcs = {
 	.fb_create = msm_framebuffer_create,
-	.output_poll_changed = drm_fb_helper_output_poll_changed,
 	.atomic_check = drm_atomic_helper_check,
 	.atomic_commit = drm_atomic_helper_commit,
 };
@@ -235,11 +234,6 @@ static int msm_drm_uninit(struct device *dev)
 	msm_perf_debugfs_cleanup(priv);
 	msm_rd_debugfs_cleanup(priv);
 
-#ifdef CONFIG_DRM_FBDEV_EMULATION
-	if (ddev->fb_helper)
-		msm_fbdev_free(ddev);
-#endif
-
 	msm_disp_snapshot_destroy(ddev);
 
 	drm_mode_config_cleanup(ddev);
@@ -529,17 +523,15 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 	}
 	drm_mode_config_reset(ddev);
 
-#ifdef CONFIG_DRM_FBDEV_EMULATION
-	if (kms)
-		msm_fbdev_init(ddev);
-#endif
-
 	ret = msm_debugfs_late_init(ddev);
 	if (ret)
 		goto err_msm_uninit;
 
 	drm_kms_helper_poll_init(ddev);
 
+	if (kms)
+		msm_fbdev_setup(ddev);
+
 	return 0;
 
 err_msm_uninit:
@@ -1068,7 +1060,6 @@ static const struct drm_driver msm_driver = {
 				DRIVER_SYNCOBJ,
 	.open               = msm_open,
 	.postclose           = msm_postclose,
-	.lastclose          = drm_fb_helper_lastclose,
 	.dumb_create        = msm_gem_dumb_create,
 	.dumb_map_offset    = msm_gem_dumb_map_offset,
 	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 852f88c36621..11a9d2ce07a1 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -29,7 +29,6 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_fb_helper.h>
 #include <drm/display/drm_dsc.h>
 #include <drm/msm_drm.h>
 #include <drm/drm_gem.h>
@@ -304,8 +303,13 @@ struct drm_framebuffer *msm_framebuffer_create(struct drm_device *dev,
 struct drm_framebuffer * msm_alloc_stolen_fb(struct drm_device *dev,
 		int w, int h, int p, uint32_t format);
 
-struct drm_fb_helper *msm_fbdev_init(struct drm_device *dev);
-void msm_fbdev_free(struct drm_device *dev);
+#ifdef CONFIG_DRM_FBDEV_EMULATION
+void msm_fbdev_setup(struct drm_device *dev);
+#else
+static inline void msm_fbdev_setup(struct drm_device *dev)
+{
+}
+#endif
 
 struct hdmi;
 #ifdef CONFIG_DRM_MSM_HDMI
diff --git a/drivers/gpu/drm/msm/msm_fbdev.c b/drivers/gpu/drm/msm/msm_fbdev.c
index 77788c6c802d..2ebc86381e1c 100644
--- a/drivers/gpu/drm/msm/msm_fbdev.c
+++ b/drivers/gpu/drm/msm/msm_fbdev.c
@@ -4,7 +4,8 @@
  * Author: Rob Clark <robdclark@gmail.com>
  */
 
-#include <drm/drm_crtc.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_crtc_helper.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
@@ -30,6 +31,25 @@ static int msm_fbdev_mmap(struct fb_info *info, struct vm_area_struct *vma)
 	return drm_gem_prime_mmap(bo, vma);
 }
 
+static void msm_fbdev_fb_destroy(struct fb_info *info)
+{
+	struct drm_fb_helper *helper = (struct drm_fb_helper *)info->par;
+	struct drm_framebuffer *fb = helper->fb;
+	struct drm_gem_object *bo = msm_framebuffer_bo(fb, 0);
+
+	DBG();
+
+	drm_fb_helper_fini(helper);
+
+	/* this will free the backing object */
+	msm_gem_put_vaddr(bo);
+	drm_framebuffer_remove(fb);
+
+	drm_client_release(&helper->client);
+	drm_fb_helper_unprepare(helper);
+	kfree(helper);
+}
+
 static const struct fb_ops msm_fb_ops = {
 	.owner = THIS_MODULE,
 	DRM_FB_HELPER_DEFAULT_OPS,
@@ -43,6 +63,7 @@ static const struct fb_ops msm_fb_ops = {
 	.fb_copyarea = drm_fb_helper_sys_copyarea,
 	.fb_imageblit = drm_fb_helper_sys_imageblit,
 	.fb_mmap = msm_fbdev_mmap,
+	.fb_destroy = msm_fbdev_fb_destroy,
 };
 
 static int msm_fbdev_create(struct drm_fb_helper *helper,
@@ -128,16 +149,52 @@ static const struct drm_fb_helper_funcs msm_fb_helper_funcs = {
  */
 
 static void msm_fbdev_client_unregister(struct drm_client_dev *client)
-{ }
+{
+	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
+
+	if (fb_helper->info) {
+		drm_fb_helper_unregister_info(fb_helper);
+	} else {
+		drm_client_release(&fb_helper->client);
+		drm_fb_helper_unprepare(fb_helper);
+		kfree(fb_helper);
+	}
+}
 
 static int msm_fbdev_client_restore(struct drm_client_dev *client)
 {
+	drm_fb_helper_lastclose(client->dev);
+
 	return 0;
 }
 
 static int msm_fbdev_client_hotplug(struct drm_client_dev *client)
 {
+	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
+	struct drm_device *dev = client->dev;
+	int ret;
+
+	if (dev->fb_helper)
+		return drm_fb_helper_hotplug_event(dev->fb_helper);
+
+	ret = drm_fb_helper_init(dev, fb_helper);
+	if (ret)
+		goto err_drm_err;
+
+	if (!drm_drv_uses_atomic_modeset(dev))
+		drm_helper_disable_unused_functions(dev);
+
+	ret = drm_fb_helper_initial_config(fb_helper);
+	if (ret)
+		goto err_drm_fb_helper_fini;
+
 	return 0;
+
+err_drm_fb_helper_fini:
+	drm_fb_helper_fini(fb_helper);
+err_drm_err:
+	drm_err(dev, "Failed to setup fbdev emulation (ret=%d)\n", ret);
+	return ret;
 }
 
 static const struct drm_client_funcs msm_fbdev_client_funcs = {
@@ -148,18 +205,20 @@ static const struct drm_client_funcs msm_fbdev_client_funcs = {
 };
 
 /* initialize fbdev helper */
-struct drm_fb_helper *msm_fbdev_init(struct drm_device *dev)
+void msm_fbdev_setup(struct drm_device *dev)
 {
 	struct drm_fb_helper *helper;
 	int ret;
 
 	if (!fbdev)
-		return NULL;
+		return;
+
+	drm_WARN(dev, !dev->registered, "Device has not been registered.\n");
+	drm_WARN(dev, dev->fb_helper, "fb_helper is already set!\n");
 
 	helper = kzalloc(sizeof(*helper), GFP_KERNEL);
 	if (!helper)
-		return NULL;
-
+		return;
 	drm_fb_helper_prepare(dev, helper, 32, &msm_fb_helper_funcs);
 
 	ret = drm_client_init(dev, &helper->client, "fbdev", &msm_fbdev_client_funcs);
@@ -168,49 +227,15 @@ struct drm_fb_helper *msm_fbdev_init(struct drm_device *dev)
 		goto err_drm_fb_helper_unprepare;
 	}
 
-	ret = drm_fb_helper_init(dev, helper);
-	if (ret) {
-		DRM_DEV_ERROR(dev->dev, "could not init fbdev: ret=%d\n", ret);
-		goto err_drm_client_release;
-	}
-
-	ret = drm_fb_helper_initial_config(helper);
+	ret = msm_fbdev_client_hotplug(&helper->client);
 	if (ret)
-		goto fini;
+		drm_dbg_kms(dev, "client hotplug ret=%d\n", ret);
 
-	return helper;
+	drm_client_register(&helper->client);
 
-fini:
-	drm_fb_helper_fini(helper);
-err_drm_client_release:
-	drm_client_release(&helper->client);
-err_drm_fb_helper_unprepare:
-	drm_fb_helper_unprepare(helper);
-	kfree(helper);
-	return NULL;
-}
+	return;
 
-void msm_fbdev_free(struct drm_device *dev)
-{
-	struct drm_fb_helper *helper = dev->fb_helper;
-	struct drm_framebuffer *fb = helper->fb;
-
-	DBG();
-
-	drm_fb_helper_unregister_info(helper);
-
-	drm_fb_helper_fini(helper);
-
-	/* this will free the backing object */
-	if (fb) {
-		struct drm_gem_object *bo = msm_framebuffer_bo(fb, 0);
-		msm_gem_put_vaddr(bo);
-		drm_framebuffer_remove(fb);
-	}
-
-	drm_client_release(&helper->client);
+err_drm_fb_helper_unprepare:
 	drm_fb_helper_unprepare(helper);
 	kfree(helper);
-
-	dev->fb_helper = NULL;
 }
-- 
2.40.0

