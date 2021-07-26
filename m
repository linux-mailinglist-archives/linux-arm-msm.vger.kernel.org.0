Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A20B23D5BFE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jul 2021 16:42:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234706AbhGZOCW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Jul 2021 10:02:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234682AbhGZOCW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Jul 2021 10:02:22 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADFEBC061757;
        Mon, 26 Jul 2021 07:42:50 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id e2-20020a17090a4a02b029016f3020d867so297953pjh.3;
        Mon, 26 Jul 2021 07:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Rlta0NEovcclpaPJpD2xtS9yg3zCeqF6l6C6xl/bEnk=;
        b=MXQvlm5f7NTlQFcq3MkDZlFoTbSB2ULWsD6K+q14oA0GkYqM4+ZHwtjr/XT0wPmsN9
         58obxREMteJ8Y05M6NgoXSKtfShL+iWJcy+YYGMXgokoSLKT9161DNf/+ylDyM0dJixe
         maG6+qAjJa0pMkhlMfISxJRYx8cBtwLnmnCHP7B2jT0rqXXlGVZUaqi9UreTy543Zgz+
         A78ucVm7QM46p4KW9Hgpa+QcEt7vYEL8FsqCNRTt1WXbWQh8i75qXPWYqQxMQqVT7hhk
         L7Gf/4CmAXhe7UGG5hRsRfRrJPNgPBtEJEqlPZXL048WzRIF67SL67Fm82fU3vfiSrnO
         JWwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Rlta0NEovcclpaPJpD2xtS9yg3zCeqF6l6C6xl/bEnk=;
        b=lGVkri8hD2qrP5XyhKQwsXV1dP25EMneL1sl81/6o7c1FHuazo62NUptNrr6Zee32j
         pFZgCCyCvSpeWqvF1KSPbnIyQbc32M9eCEAPZb7OdKjRmMn/djSAnJBlyegWDgAjMhqi
         LGlRFve5lEiiipmhyjtuTq+ksKd7RZZ85k/2Yl1RgYxgngfb54HBgToM95IwMdlWb0Wl
         f/Sn+g2CoWkoY285nuzdYJ7PPOLE79UqpI7wmb3E+2vwDAxSUDHRa5A+/Ju+YECR/r9B
         utUqO0vMgiXSfbp3G1uAY16GlAHvvItI8eadZxeqrZsjo8fcxMCojHh6r738ISJjAgex
         XmSw==
X-Gm-Message-State: AOAM531KzivkrDJdHkfBaJIjmVylVtdjlcKIi3MuwF/jQPxCsCPnFITy
        eLu+MECVFmTpqUm3LYdQZ0E=
X-Google-Smtp-Source: ABdhPJwvV+Ta7Aed4EqK/5ZlO07y7a/xBo8shDf26JWpJt+WXH9hmPeAdzDtih6ushddXac2m2SrdQ==
X-Received: by 2002:a63:354:: with SMTP id 81mr18503749pgd.369.1627310570186;
        Mon, 26 Jul 2021 07:42:50 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
        by smtp.gmail.com with ESMTPSA id i13sm230613pfr.79.2021.07.26.07.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jul 2021 07:42:49 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 3/3] drm/msm: Devfreq tuning
Date:   Mon, 26 Jul 2021 07:46:50 -0700
Message-Id: <20210726144653.2180096-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210726144653.2180096-1-robdclark@gmail.com>
References: <20210726144653.2180096-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

This adds a few things to try and make frequency scaling better match
the workload:

1) Longer polling interval to avoid whip-lashing between too-high and
   too-low frequencies in certain workloads, like mobile games which
   throttle themselves to 30fps.

   Previously our polling interval was short enough to let things
   ramp down to minimum freq in the "off" frame, but long enough to
   not react quickly enough when rendering started on the next frame,
   leading to uneven frame times.  (Ie. rather than a consistent 33ms
   it would alternate between 16/33/48ms.)

2) Awareness of when the GPU is active vs idle.  Since we know when
   the GPU is active vs idle, we can clamp the frequency down to the
   minimum while it is idle.  (If it is idle for long enough, then
   the autosuspend delay will eventually kick in and power down the
   GPU.)

   Since devfreq has no knowledge of powered-but-idle, this takes a
   small bit of trickery to maintain a "fake" frequency while idle.
   This, combined with the longer polling period allows devfreq to
   arrive at a reasonable "active" frequency, while still clamping
   to minimum freq when idle to reduce power draw.

3) Boost.  Because simple_ondemand needs to see a certain threshold
   of busyness to ramp up, we could end up needing multiple polling
   cycles before it reacts appropriately on interactive workloads
   (ex. scrolling a web page after reading for some time), on top
   of the already lengthened polling interval, when we see a idle
   to active transition after a period of idle time we boost the
   frequency that we return to.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gpu.c         | 16 ++++++
 drivers/gpu/drm/msm/msm_gpu.h         | 29 +++++++++++
 drivers/gpu/drm/msm/msm_gpu_devfreq.c | 73 ++++++++++++++++++++++++++-
 3 files changed, 117 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index fedbd785e42f..c4ed8694f721 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -680,6 +680,14 @@ static void retire_submit(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
 	list_del(&submit->node);
 	spin_unlock_irqrestore(&ring->submit_lock, flags);
 
+	/* Update devfreq on transition from active->idle: */
+	mutex_lock(&gpu->active_lock);
+	gpu->active_submits--;
+	WARN_ON(gpu->active_submits < 0);
+	if (!gpu->active_submits)
+		msm_devfreq_idle(gpu);
+	mutex_unlock(&gpu->active_lock);
+
 	msm_gem_submit_put(submit);
 }
 
@@ -781,6 +789,13 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	list_add_tail(&submit->node, &ring->submits);
 	spin_unlock_irqrestore(&ring->submit_lock, flags);
 
+	/* Update devfreq on transition from idle->active: */
+	mutex_lock(&gpu->active_lock);
+	if (!gpu->active_submits)
+		msm_devfreq_active(gpu);
+	gpu->active_submits++;
+	mutex_unlock(&gpu->active_lock);
+
 	gpu->funcs->submit(gpu, submit);
 	priv->lastctx = submit->queue->ctx;
 
@@ -866,6 +881,7 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 	sched_set_fifo_low(gpu->worker->task);
 
 	INIT_LIST_HEAD(&gpu->active_list);
+	mutex_init(&gpu->active_lock);
 	kthread_init_work(&gpu->retire_work, retire_worker);
 	kthread_init_work(&gpu->recover_work, recover_worker);
 	kthread_init_work(&gpu->fault_work, fault_worker);
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 2e61d05293e6..710c3fedfbf3 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -98,6 +98,20 @@ struct msm_gpu_devfreq {
 
 	/** time: Time of last sampling period. */
 	ktime_t time;
+
+	/** idle_time: Time of last transition to idle: */
+	ktime_t idle_time;
+
+	/**
+	 * idle_freq:
+	 *
+	 * Shadow frequency used while the GPU is idle.  From the PoV of
+	 * the devfreq governor, we are continuing to sample busyness and
+	 * adjust frequency while the GPU is idle, but we use this shadow
+	 * value as the GPU is actually clamped to minimum frequency while
+	 * it is inactive.
+	 */
+	unsigned long idle_freq;
 };
 
 struct msm_gpu {
@@ -129,6 +143,19 @@ struct msm_gpu {
 	 */
 	struct list_head active_list;
 
+	/**
+	 * active_submits:
+	 *
+	 * The number of submitted but not yet retired submits, used to
+	 * determine transitions between active and idle.
+	 *
+	 * Protected by lock
+	 */
+	int active_submits;
+
+	/** lock: protects active_submits and idle/active transitions */
+	struct mutex active_lock;
+
 	/* does gpu need hw_init? */
 	bool needs_hw_init;
 
@@ -322,6 +349,8 @@ void msm_devfreq_init(struct msm_gpu *gpu);
 void msm_devfreq_cleanup(struct msm_gpu *gpu);
 void msm_devfreq_resume(struct msm_gpu *gpu);
 void msm_devfreq_suspend(struct msm_gpu *gpu);
+void msm_devfreq_active(struct msm_gpu *gpu);
+void msm_devfreq_idle(struct msm_gpu *gpu);
 
 int msm_gpu_hw_init(struct msm_gpu *gpu);
 
diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
index 2e24a97be624..0a1ee20296a2 100644
--- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
+++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
@@ -22,6 +22,15 @@ static int msm_devfreq_target(struct device *dev, unsigned long *freq,
 
 	opp = devfreq_recommended_opp(dev, freq, flags);
 
+	/*
+	 * If the GPU is idle, devfreq is not aware, so just ignore
+	 * it's requests
+	 */
+	if (gpu->devfreq.idle_freq) {
+		gpu->devfreq.idle_freq = *freq;
+		return 0;
+	}
+
 	if (IS_ERR(opp))
 		return PTR_ERR(opp);
 
@@ -39,6 +48,9 @@ static int msm_devfreq_target(struct device *dev, unsigned long *freq,
 
 static unsigned long get_freq(struct msm_gpu *gpu)
 {
+	if (gpu->devfreq.idle_freq)
+		return gpu->devfreq.idle_freq;
+
 	if (gpu->funcs->gpu_get_freq)
 		return gpu->funcs->gpu_get_freq(gpu);
 
@@ -69,7 +81,8 @@ static int msm_devfreq_get_cur_freq(struct device *dev, unsigned long *freq)
 }
 
 static struct devfreq_dev_profile msm_devfreq_profile = {
-	.polling_ms = 10,
+	.timer = DEVFREQ_TIMER_DELAYED,
+	.polling_ms = 50,
 	.target = msm_devfreq_target,
 	.get_dev_status = msm_devfreq_get_dev_status,
 	.get_cur_freq = msm_devfreq_get_cur_freq,
@@ -130,3 +143,61 @@ void msm_devfreq_suspend(struct msm_gpu *gpu)
 {
 	devfreq_suspend_device(gpu->devfreq.devfreq);
 }
+
+void msm_devfreq_active(struct msm_gpu *gpu)
+{
+	struct msm_gpu_devfreq *df = &gpu->devfreq;
+	struct devfreq_dev_status status;
+	unsigned int idle_time;
+	unsigned long target_freq = df->idle_freq;
+
+	/*
+	 * Hold devfreq lock to synchronize with get_dev_status()/
+	 * target() callbacks
+	 */
+	mutex_lock(&df->devfreq->lock);
+
+	idle_time = ktime_to_ms(ktime_sub(ktime_get(), df->idle_time));
+
+	/*
+	 * If we've been idle for a significant fraction of a polling
+	 * interval, then we won't meet the threshold of busyness for
+	 * the governor to ramp up the freq.. so give some boost
+	 */
+	if (idle_time > msm_devfreq_profile.polling_ms/2) {
+		target_freq *= 2;
+	}
+
+	df->idle_freq = 0;
+
+	msm_devfreq_target(&gpu->pdev->dev, &target_freq, 0);
+
+	/*
+	 * Reset the polling interval so we aren't inconsistent
+	 * about freq vs busy/total cycles
+	 */
+	msm_devfreq_get_dev_status(&gpu->pdev->dev, &status);
+
+	mutex_unlock(&df->devfreq->lock);
+}
+
+void msm_devfreq_idle(struct msm_gpu *gpu)
+{
+	struct msm_gpu_devfreq *df = &gpu->devfreq;
+	unsigned long idle_freq, target_freq = 0;
+
+	/*
+	 * Hold devfreq lock to synchronize with get_dev_status()/
+	 * target() callbacks
+	 */
+	mutex_lock(&df->devfreq->lock);
+
+	idle_freq = get_freq(gpu);
+
+	msm_devfreq_target(&gpu->pdev->dev, &target_freq, 0);
+
+	df->idle_time = ktime_get();
+	df->idle_freq = idle_freq;
+
+	mutex_unlock(&df->devfreq->lock);
+}
-- 
2.31.1

