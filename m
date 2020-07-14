Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACD5D21F407
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2020 16:26:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725890AbgGNO06 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Jul 2020 10:26:58 -0400
Received: from mail-m17613.qiye.163.com ([59.111.176.13]:57560 "EHLO
        mail-m17613.qiye.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725803AbgGNO06 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Jul 2020 10:26:58 -0400
X-Greylist: delayed 367 seconds by postgrey-1.27 at vger.kernel.org; Tue, 14 Jul 2020 10:26:56 EDT
Received: from njvxl5505.vivo.xyz (unknown [157.0.31.124])
        by mail-m17613.qiye.163.com (Hmail) with ESMTPA id E8D0948166E;
        Tue, 14 Jul 2020 22:20:43 +0800 (CST)
From:   Bernard Zhao <bernard@vivo.com>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Drew Davenport <ddavenport@chromium.org>,
        Bernard Zhao <bernard@vivo.com>,
        Hongbo Yao <yaohongbo@huawei.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc:     opensource.kernel@vivo.com
Subject: [PATCH] drm/msm: use kthread_create_worker instead of kthread_run
Date:   Tue, 14 Jul 2020 22:20:29 +0800
Message-Id: <20200714142034.23843-1-bernard@vivo.com>
X-Mailer: git-send-email 2.17.1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
        oVCBIfWUFZTENKQk0aTh9MThgaVkpOQk9MSE1PT09JSUJVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
        FZT0tIVUpKS0hKTFVKS0tZBg++
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Kxw6DQw*HjgsNjYuPjE3OCgr
        HQoaCx5VSlVKTkJPTEhNT09PTU5IVTMWGhIXVRkeCRUaCR87DRINFFUYFBZFWVdZEgtZQVlKTkxV
        S1VISlVKSU9ZV1kIAVlBT0xNQzcG
X-HM-Tid: 0a734db3030f93bakuwse8d0948166e
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use kthread_create_worker to simplify the code and optimise
the manager struct: msm_drm_thread. With this change, we
could remove struct element (struct task_struct *thread &
struct kthread_worker worker), instead, use one point (struct
kthread_worker *worker).

Signed-off-by: Bernard Zhao <bernard@vivo.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c |  2 +-
 drivers/gpu/drm/msm/msm_drv.c            | 18 ++++++------------
 drivers/gpu/drm/msm/msm_drv.h            |  3 +--
 3 files changed, 8 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index e15b42a780e0..c959c959021d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -396,7 +396,7 @@ static void dpu_crtc_frame_event_cb(void *data, u32 event)
 	fevent->event = event;
 	fevent->crtc = crtc;
 	fevent->ts = ktime_get();
-	kthread_queue_work(&priv->event_thread[crtc_id].worker, &fevent->work);
+	kthread_queue_work(priv->event_thread[crtc_id].worker, &fevent->work);
 }
 
 void dpu_crtc_complete_commit(struct drm_crtc *crtc)
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index f6ce40bf3699..82e79b82a594 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -238,10 +238,8 @@ static int msm_drm_uninit(struct device *dev)
 
 	/* clean up event worker threads */
 	for (i = 0; i < priv->num_crtcs; i++) {
-		if (priv->event_thread[i].thread) {
-			kthread_destroy_worker(&priv->event_thread[i].worker);
-			priv->event_thread[i].thread = NULL;
-		}
+		if (priv->event_thread[i].worker)
+			kthread_destroy_worker(priv->event_thread[i].worker);
 	}
 
 	msm_gem_shrinker_cleanup(ddev);
@@ -504,19 +502,15 @@ static int msm_drm_init(struct device *dev, struct drm_driver *drv)
 	for (i = 0; i < priv->num_crtcs; i++) {
 		/* initialize event thread */
 		priv->event_thread[i].crtc_id = priv->crtcs[i]->base.id;
-		kthread_init_worker(&priv->event_thread[i].worker);
 		priv->event_thread[i].dev = ddev;
-		priv->event_thread[i].thread =
-			kthread_run(kthread_worker_fn,
-				&priv->event_thread[i].worker,
-				"crtc_event:%d", priv->event_thread[i].crtc_id);
-		if (IS_ERR(priv->event_thread[i].thread)) {
+		priv->event_thread[i].worker = kthread_create_worker(0,
+			"crtc_event:%d", priv->event_thread[i].crtc_id);
+		if (IS_ERR(priv->event_thread[i].worker)) {
 			DRM_DEV_ERROR(dev, "failed to create crtc_event kthread\n");
-			priv->event_thread[i].thread = NULL;
 			goto err_msm_uninit;
 		}
 
-		ret = sched_setscheduler(priv->event_thread[i].thread,
+		ret = sched_setscheduler(priv->event_thread[i].worker->task,
 					 SCHED_FIFO, &param);
 		if (ret)
 			dev_warn(dev, "event_thread set priority failed:%d\n",
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index e2d6a6056418..daf2f4e5548c 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -129,9 +129,8 @@ struct msm_display_info {
 /* Commit/Event thread specific structure */
 struct msm_drm_thread {
 	struct drm_device *dev;
-	struct task_struct *thread;
 	unsigned int crtc_id;
-	struct kthread_worker worker;
+	struct kthread_worker *worker;
 };
 
 struct msm_drm_private {
-- 
2.17.1

