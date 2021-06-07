Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DF1239DA9B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jun 2021 13:05:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230253AbhFGLHg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Jun 2021 07:07:36 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:60570 "EHLO
        fanzine.igalia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230215AbhFGLHg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Jun 2021 07:07:36 -0400
X-Greylist: delayed 1235 seconds by postgrey-1.27 at vger.kernel.org; Mon, 07 Jun 2021 07:07:35 EDT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; s=20170329;
        h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From; bh=2lMi81G2fDmQw6ckho/NNRsj7fiqWF9oqLRYD59RpkI=;
        b=es/Kvqwi+9pCzIl/xVmVEVRwavirXQT8yhMlyRFLzWtj8Z076OlCuxTUlBMbXIdUx3ZXk5sLG2BzLlVE57p2pgJk3wHW2foEtKytcKtwJUdMW94Pr1LUVIvE3TtK1JbnSgEM7JWPe2hCcx9FuIoBlegxbCUpL8ktJ8tgBdXEvIN3DR1vfBgEGNrSL1gD0NuXR5o/SLm966j+kajpkUOUZ81ZZHmjDAaVPzGGCGfCPOMhlcOAcACMVZjTp6k/2SEiE/XW8fSG/fUdvWswCoo0bw9qr5XJ9kAWJZhz3V7l1yEu1+WJwseQw359rQ6r1DyL7Ucz8PG+ZkGChhX40JvpVA==;
Received: from 1.pool85-50-22.dynamic.orange.es ([85.50.22.1] helo=localhost.localdomain)
        by fanzine.igalia.com with esmtpsa 
        (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
        id 1lqCkf-0004BB-JJ; Mon, 07 Jun 2021 12:45:01 +0200
From:   Samuel Iglesias Gonsalvez <siglesias@igalia.com>
To:     freedreno@lists.freedesktop.org
Cc:     Samuel Iglesias Gonsalvez <siglesias@igalia.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm: export hangcheck_period in debugfs
Date:   Mon,  7 Jun 2021 12:44:41 +0200
Message-Id: <20210607104441.184700-1-siglesias@igalia.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

While keeping the previous default value for hangcheck period,
we allow now the possibility of configuring its value via
debugfs.

Signed-off-by: Samuel Iglesias Gonsalvez <siglesias@igalia.com>
---
 drivers/gpu/drm/msm/msm_debugfs.c | 3 +++
 drivers/gpu/drm/msm/msm_drv.c     | 1 +
 drivers/gpu/drm/msm/msm_drv.h     | 3 +++
 drivers/gpu/drm/msm/msm_gpu.c     | 3 ++-
 drivers/gpu/drm/msm/msm_gpu.h     | 3 +--
 5 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
index d611cc8e54a4..6be5fdbea2f1 100644
--- a/drivers/gpu/drm/msm/msm_debugfs.c
+++ b/drivers/gpu/drm/msm/msm_debugfs.c
@@ -226,6 +226,9 @@ void msm_debugfs_init(struct drm_minor *minor)
 	debugfs_create_file("gpu", S_IRUSR, minor->debugfs_root,
 		dev, &msm_gpu_fops);
 
+	debugfs_create_u32("hangcheck_period_ms", 0600, minor->debugfs_root,
+		&priv->hangcheck_period);
+
 	if (priv->kms && priv->kms->funcs->debugfs_init)
 		priv->kms->funcs->debugfs_init(priv->kms, minor);
 }
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 3476ece0c08f..15a9e7a9b158 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -459,6 +459,7 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 	mdss = priv->mdss;
 
 	priv->wq = alloc_ordered_workqueue("msm", 0);
+	priv->hangcheck_period = DRM_MSM_HANGCHECK_DEFAULT_PERIOD;
 
 	INIT_LIST_HEAD(&priv->objects);
 	mutex_init(&priv->obj_lock);
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 3352125ce428..ce9983001b55 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -244,6 +244,9 @@ struct msm_drm_private {
 	struct shrinker shrinker;
 
 	struct drm_atomic_state *pm_state;
+
+	/* For hang detection, in ms */
+	unsigned int hangcheck_period;
 };
 
 struct msm_format {
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 9dd1c58430ab..4ee8ba09b762 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -561,8 +561,9 @@ static void recover_worker(struct kthread_work *work)
 
 static void hangcheck_timer_reset(struct msm_gpu *gpu)
 {
+	struct msm_drm_private *priv = gpu->dev->dev_private;
 	mod_timer(&gpu->hangcheck_timer,
-			round_jiffies_up(jiffies + DRM_MSM_HANGCHECK_JIFFIES));
+			round_jiffies_up(jiffies + msecs_to_jiffies(priv->hangcheck_period)));
 }
 
 static void hangcheck_handler(struct timer_list *t)
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 18baf935e143..f631c2777ad5 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -131,8 +131,7 @@ struct msm_gpu {
 	 */
 #define DRM_MSM_INACTIVE_PERIOD   66 /* in ms (roughly four frames) */
 
-#define DRM_MSM_HANGCHECK_PERIOD 500 /* in ms */
-#define DRM_MSM_HANGCHECK_JIFFIES msecs_to_jiffies(DRM_MSM_HANGCHECK_PERIOD)
+#define DRM_MSM_HANGCHECK_DEFAULT_PERIOD 500 /* in ms */
 	struct timer_list hangcheck_timer;
 
 	/* work for handling GPU recovery: */
-- 
2.30.2

