Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B93663A6985
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jun 2021 17:03:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233217AbhFNPFo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Jun 2021 11:05:44 -0400
Received: from mail-pf1-f182.google.com ([209.85.210.182]:35460 "EHLO
        mail-pf1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232869AbhFNPFo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Jun 2021 11:05:44 -0400
Received: by mail-pf1-f182.google.com with SMTP id h12so10757997pfe.2;
        Mon, 14 Jun 2021 08:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RzDEDEpKBts6WNgQTxPyJR77ugNq0XTyo2edIkuGISA=;
        b=c7p5ZyWkblyeOc02Ule8fxjbb5vcHADAStMUSZXgY/Z9P0NcjVnr3Qrty9TUMiXaa6
         Uyp7DlGp34QsrZTSpQu2jHFZBDjYRCx3PkGgP7HYKZ7nchXcFnQPK6ZP49JLN3pID7Nq
         UahXGtROhEgvDnoRAUdWZgBtfqketLiOCiB76pxsnGai0Xx9g8yIIGwYd9UXgDhbxAvj
         /403+lRSoExBjQRLzPgMKqNs2QRDNqVb9y8EXLHhZWkqfn/wWKi42EfHCPt+d/APLxvy
         bRwHPUPehJrXFdN9lxmAxdHWQPsncnIeFkRiIKfxpgO9fM/4Oh7kjwDbzMr/4h6NYv18
         qeDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RzDEDEpKBts6WNgQTxPyJR77ugNq0XTyo2edIkuGISA=;
        b=m7ovv7ODegbLWVkBRdC1yd4bGv9O3gvs472c+N7mXBNusNmxJclJVxIHoczG4HHdFN
         eshSNE2u+xCHEoxs6N514nSe4YhXwp5+nEUHezZoWjUeqqGE/scm7zJFVJ3Bp296LDvL
         IG+Vri59WGkOiHtvm+XXO6N5bAkrnGG53e1jI//Lxuq6g0V19km2ikneoy4k6qmIDOaK
         BaxiZCFFSoS7jg4Euqts0RpHCtJ4KhGjxY6syqvcjxtxZBRb2rnq1/6TyJRXw3wlxnFh
         E5ZLWW7+kfzQ2DL1eQDEQuWCquUVscJTaGBYWhLv3Zv/m7AV0RcFxwsTr+gFUe0TEukj
         DfjA==
X-Gm-Message-State: AOAM530Phd4DNGxRCBqeZV6zl9y5fnJxnE9ZEGHZx22nfUU3vkAD1Uj6
        C9qSCa9AtWurf1y2YuFbeBE=
X-Google-Smtp-Source: ABdhPJzwb3/RHK7wDcLYlRy6N9DIv5cLskk99lnqJQ5GlUoNBwWTK3dABhbu2k9f1vFfvCIUp9LG/Q==
X-Received: by 2002:a63:5f46:: with SMTP id t67mr17835519pgb.37.1623682947164;
        Mon, 14 Jun 2021 08:02:27 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id n23sm13217072pff.93.2021.06.14.08.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jun 2021 08:02:25 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm: Add debugfs to trigger shrinker
Date:   Mon, 14 Jun 2021 08:06:18 -0700
Message-Id: <20210614150618.729610-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Just for the purposes of testing.  Write to it the # of objects to scan,
read back the # freed.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_debugfs.c      | 28 ++++++++++++++++++++++++++
 drivers/gpu/drm/msm/msm_drv.h          |  4 ++++
 drivers/gpu/drm/msm/msm_gem_shrinker.c | 18 +++++++++++++++++
 3 files changed, 50 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
index d611cc8e54a4..7a2b53d35e6b 100644
--- a/drivers/gpu/drm/msm/msm_debugfs.c
+++ b/drivers/gpu/drm/msm/msm_debugfs.c
@@ -108,6 +108,31 @@ static const struct file_operations msm_gpu_fops = {
 	.release = msm_gpu_release,
 };
 
+static unsigned long last_shrink_freed;
+
+static int
+shrink_get(void *data, u64 *val)
+{
+	*val = last_shrink_freed;
+
+	return 0;
+}
+
+static int
+shrink_set(void *data, u64 val)
+{
+	struct drm_device *dev = data;
+
+	last_shrink_freed = msm_gem_shrinker_shrink(dev, val);
+
+	return 0;
+}
+
+DEFINE_SIMPLE_ATTRIBUTE(shrink_fops,
+			shrink_get, shrink_set,
+			"0x%08llx\n");
+
+
 static int msm_gem_show(struct drm_device *dev, struct seq_file *m)
 {
 	struct msm_drm_private *priv = dev->dev_private;
@@ -226,6 +251,9 @@ void msm_debugfs_init(struct drm_minor *minor)
 	debugfs_create_file("gpu", S_IRUSR, minor->debugfs_root,
 		dev, &msm_gpu_fops);
 
+	debugfs_create_file("shrink", S_IRWXU, minor->debugfs_root,
+		dev, &shrink_fops);
+
 	if (priv->kms && priv->kms->funcs->debugfs_init)
 		priv->kms->funcs->debugfs_init(priv->kms, minor);
 }
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 3352125ce428..b58c9d1cc5f1 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -296,6 +296,10 @@ bool msm_use_mmu(struct drm_device *dev);
 int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 		struct drm_file *file);
 
+#ifdef CONFIG_DEBUG_FS
+unsigned long msm_gem_shrinker_shrink(struct drm_device *dev, unsigned long nr_to_scan);
+#endif
+
 void msm_gem_shrinker_init(struct drm_device *dev);
 void msm_gem_shrinker_cleanup(struct drm_device *dev);
 
diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c b/drivers/gpu/drm/msm/msm_gem_shrinker.c
index 1187ecf9d647..0f1b29ee04a9 100644
--- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
+++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
@@ -145,6 +145,24 @@ msm_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
 	return (freed > 0) ? freed : SHRINK_STOP;
 }
 
+#ifdef CONFIG_DEBUG_FS
+unsigned long
+msm_gem_shrinker_shrink(struct drm_device *dev, unsigned long nr_to_scan)
+{
+	struct msm_drm_private *priv = dev->dev_private;
+	struct shrink_control sc = {
+		.nr_to_scan = nr_to_scan,
+	};
+	int ret;
+
+	fs_reclaim_acquire(GFP_KERNEL);
+	ret = msm_gem_shrinker_scan(&priv->shrinker, &sc);
+	fs_reclaim_release(GFP_KERNEL);
+
+	return ret;
+}
+#endif
+
 /* since we don't know any better, lets bail after a few
  * and if necessary the shrinker will be invoked again.
  * Seems better than unmapping *everything*
-- 
2.31.1

