Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26BD944B25C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Nov 2021 19:06:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241585AbhKISJG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Nov 2021 13:09:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241671AbhKISJE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Nov 2021 13:09:04 -0500
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EE53C061764;
        Tue,  9 Nov 2021 10:06:18 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id y7so87854plp.0;
        Tue, 09 Nov 2021 10:06:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Rw7greifZhABHFWn91CmTF/gCrftsakQTlW3OGkKU7w=;
        b=enPy7SkbEuOM34F2ldNjQ6Qo9jy30AoeEMZpGhGUZ14g1aSmmrrK3qwTekOdP511+e
         OZliap5To5bm1bASWlIjABS+jpnkJS4XGePgdoI6mdaIL5LLSkwYzFgnyQFdDDbkNyVV
         klv11EuJrRm7JFV8+BBjIh4jeMzS2GDVyktKGtx2g++o+bxStdyLKN2K/tVVIJw8e0Gw
         JEd/djYc84/moHfRP9z3NINPAOMov8pxyjx93siIUhbQGwkc1x/PXjiopbONHYNXGajY
         h8D/8KGekgvgV4lX7tGy2Fj2GzmyHPbNRLB6GK5bbGvEuwsvDdlGAk1W0d8u7ecE5nU7
         dIHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Rw7greifZhABHFWn91CmTF/gCrftsakQTlW3OGkKU7w=;
        b=t93udrPXH0mUWeDn5oByegPqGIKR4HCFOxMAef4Ky9ig3Mx23Z2LlnHMJTuI2YEwVu
         9zXKbsQ8icysazr5kAxZeDK9rHxOqjFieOko+Yj5tRcoa9XVWBMIgFoCsh+pSGrxnQS8
         XS6x+hzBRFQO0zg3d7OddkWuyFVKEwbTDS2AtkRJ7Z0KTo95vkIUMVJ6LMtB1Cq2mo8e
         /1AY+HIm+O0GiYCmj4HmRHWySoRa6/rf9yCXYGidLxBnnVcmDEOSm3HYk9v0rW/YamN/
         jBasmeZDMiL4z1CiJrL25TegvB15GmKif5/svFu94epoqTVYARG794AN6/YGDAdhdNxl
         LXPw==
X-Gm-Message-State: AOAM53147E1P36S7jygBnpWRi8j1un4eahuHR0Wp9dpxPoBTt0NOsUYo
        ZqwjR9ETV6RU1PF5vYW3mEg=
X-Google-Smtp-Source: ABdhPJy5aPYKosWeIJsueKC34CrIMDut9eS6BASfVfXTdZefBNR7/9Pqe/Uk05vW50M5F0F4FsqADQ==
X-Received: by 2002:a17:90a:df97:: with SMTP id p23mr9401227pjv.3.1636481177667;
        Tue, 09 Nov 2021 10:06:17 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id i185sm11221292pfg.80.2021.11.09.10.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Nov 2021 10:06:15 -0800 (PST)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/5] drm/msm: Remove unnecessary struct_mutex
Date:   Tue,  9 Nov 2021 10:11:01 -0800
Message-Id: <20211109181117.591148-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211109181117.591148-1-robdclark@gmail.com>
References: <20211109181117.591148-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

The struct_mutex locking is a remnant from the days before per-obj locks,
and no longer needed.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_debugfs.c | 37 ++++++++++---------------------
 drivers/gpu/drm/msm/msm_fbdev.c   | 13 ++++-------
 2 files changed, 16 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
index dee13fedee3b..698e86f5b960 100644
--- a/drivers/gpu/drm/msm/msm_debugfs.c
+++ b/drivers/gpu/drm/msm/msm_debugfs.c
@@ -134,8 +134,10 @@ DEFINE_SIMPLE_ATTRIBUTE(shrink_fops,
 			"0x%08llx\n");
 
 
-static int msm_gem_show(struct drm_device *dev, struct seq_file *m)
+static int msm_gem_show(struct seq_file *m, void *arg)
 {
+	struct drm_info_node *node = (struct drm_info_node *) m->private;
+	struct drm_device *dev = node->minor->dev;
 	struct msm_drm_private *priv = dev->dev_private;
 	int ret;
 
@@ -150,8 +152,10 @@ static int msm_gem_show(struct drm_device *dev, struct seq_file *m)
 	return 0;
 }
 
-static int msm_mm_show(struct drm_device *dev, struct seq_file *m)
+static int msm_mm_show(struct seq_file *m, void *arg)
 {
+	struct drm_info_node *node = (struct drm_info_node *) m->private;
+	struct drm_device *dev = node->minor->dev;
 	struct drm_printer p = drm_seq_file_printer(m);
 
 	drm_mm_print(&dev->vma_offset_manager->vm_addr_space_mm, &p);
@@ -159,8 +163,10 @@ static int msm_mm_show(struct drm_device *dev, struct seq_file *m)
 	return 0;
 }
 
-static int msm_fb_show(struct drm_device *dev, struct seq_file *m)
+static int msm_fb_show(struct seq_file *m, void *arg)
 {
+	struct drm_info_node *node = (struct drm_info_node *) m->private;
+	struct drm_device *dev = node->minor->dev;
 	struct msm_drm_private *priv = dev->dev_private;
 	struct drm_framebuffer *fb, *fbdev_fb = NULL;
 
@@ -183,29 +189,10 @@ static int msm_fb_show(struct drm_device *dev, struct seq_file *m)
 	return 0;
 }
 
-static int show_locked(struct seq_file *m, void *arg)
-{
-	struct drm_info_node *node = (struct drm_info_node *) m->private;
-	struct drm_device *dev = node->minor->dev;
-	int (*show)(struct drm_device *dev, struct seq_file *m) =
-			node->info_ent->data;
-	int ret;
-
-	ret = mutex_lock_interruptible(&dev->struct_mutex);
-	if (ret)
-		return ret;
-
-	ret = show(dev, m);
-
-	mutex_unlock(&dev->struct_mutex);
-
-	return ret;
-}
-
 static struct drm_info_list msm_debugfs_list[] = {
-		{"gem", show_locked, 0, msm_gem_show},
-		{ "mm", show_locked, 0, msm_mm_show },
-		{ "fb", show_locked, 0, msm_fb_show },
+		{"gem", msm_gem_show},
+		{ "mm", msm_mm_show },
+		{ "fb", msm_fb_show },
 };
 
 static int late_init_minor(struct drm_minor *minor)
diff --git a/drivers/gpu/drm/msm/msm_fbdev.c b/drivers/gpu/drm/msm/msm_fbdev.c
index 0daaeb54ff6f..4c39ef9dd75d 100644
--- a/drivers/gpu/drm/msm/msm_fbdev.c
+++ b/drivers/gpu/drm/msm/msm_fbdev.c
@@ -81,8 +81,6 @@ static int msm_fbdev_create(struct drm_fb_helper *helper,
 
 	bo = msm_framebuffer_bo(fb, 0);
 
-	mutex_lock(&dev->struct_mutex);
-
 	/*
 	 * NOTE: if we can be guaranteed to be able to map buffer
 	 * in panic (ie. lock-safe, etc) we could avoid pinning the
@@ -91,14 +89,14 @@ static int msm_fbdev_create(struct drm_fb_helper *helper,
 	ret = msm_gem_get_and_pin_iova(bo, priv->kms->aspace, &paddr);
 	if (ret) {
 		DRM_DEV_ERROR(dev->dev, "failed to get buffer obj iova: %d\n", ret);
-		goto fail_unlock;
+		goto fail;
 	}
 
 	fbi = drm_fb_helper_alloc_fbi(helper);
 	if (IS_ERR(fbi)) {
 		DRM_DEV_ERROR(dev->dev, "failed to allocate fb info\n");
 		ret = PTR_ERR(fbi);
-		goto fail_unlock;
+		goto fail;
 	}
 
 	DBG("fbi=%p, dev=%p", fbi, dev);
@@ -115,7 +113,7 @@ static int msm_fbdev_create(struct drm_fb_helper *helper,
 	fbi->screen_base = msm_gem_get_vaddr(bo);
 	if (IS_ERR(fbi->screen_base)) {
 		ret = PTR_ERR(fbi->screen_base);
-		goto fail_unlock;
+		goto fail;
 	}
 	fbi->screen_size = bo->size;
 	fbi->fix.smem_start = paddr;
@@ -124,12 +122,9 @@ static int msm_fbdev_create(struct drm_fb_helper *helper,
 	DBG("par=%p, %dx%d", fbi->par, fbi->var.xres, fbi->var.yres);
 	DBG("allocated %dx%d fb", fbdev->fb->width, fbdev->fb->height);
 
-	mutex_unlock(&dev->struct_mutex);
-
 	return 0;
 
-fail_unlock:
-	mutex_unlock(&dev->struct_mutex);
+fail:
 	drm_framebuffer_remove(fb);
 	return ret;
 }
-- 
2.31.1

