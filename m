Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E86D7503338
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Apr 2022 07:48:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229445AbiDPAjL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Apr 2022 20:39:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229630AbiDPAjL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Apr 2022 20:39:11 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 125E9EE4FA
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Apr 2022 17:36:36 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id u5-20020a17090a6a8500b001d0b95031ebso2498175pjj.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Apr 2022 17:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6AjOHVLmy++hjINXRHfH8cU0LeusCvQBspyIU/e7Ce0=;
        b=V6AbaaBfcxy6hGk0b1qQITAALp/O74mu0yqKHh9E0usgncipduK6ZimZFu/NKaizWR
         PmC1Qc2RAQDfBFy1Wo2nI5k2T5I8UkvjuwaHca8MgHf8RoqeZgq5aGRolU7vIJ+zPbG2
         VSe840ftq8IFxDyWMMYHnfZekGmHolMArsU2Lg2lFz3YEHMH9mTHS7mMLFfuDLTLDnVP
         81VQWMdzXKQnQmAJQ/xyDiycuqriaFKt50p2yjMANK6RiE4dLL5+1D/HbPYgYrW4cXyC
         H2skzngtvsM9Y3P5k9/FdV2PWM6VnR3tY0ppjiy9o8WA9dpGpfhX8B5JYwrAGwz53Mcu
         buYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6AjOHVLmy++hjINXRHfH8cU0LeusCvQBspyIU/e7Ce0=;
        b=pQPQ0nx7oNfVlTi1uEG0vc+9gPOfAuANkj6cwO2jT3AYBNOc0cvXtELFSaVX6JGlGk
         txjokVcCzm6Pt4cHIce+nhMIO+vFkAIqaoxha2dpkRfZxJnpDc9Gka6F12poZId8HVdP
         0YIDn768x6jrvRo11Y7/87TafqFm9za/RempoEdy0fMMGdR6fMKrVMVpoWgZ8QKhqYHc
         bhBBEu2u57L+qE/6iIqrcRqT+3rbQ99LJZ+8L6H3BwphbGpIRuPJHtoj7E3Kk4zihaLt
         cY0Ao+FqwPfmgO9bgedm06Ftt3+FXGYAedsQPGkh33Z4PPAM6nxJFV9ziC7lznLYuuf3
         chVA==
X-Gm-Message-State: AOAM533eXcwRCJ/TVyYhURoHjZlZI8tOTVMew+EqXL58fgmXBU8/+1Nx
        4ttWL6ADJGUfuLEsMvdIeOc=
X-Google-Smtp-Source: ABdhPJyBrqZl5LOp0s0qaGDNrkbxcqh3vZYA7lMg4NOvJNi65Ee61pXXMUbe3iypkScV4FihsWN+PQ==
X-Received: by 2002:a17:903:22d0:b0:158:9d42:6af6 with SMTP id y16-20020a17090322d000b001589d426af6mr1186928plg.159.1650069207513;
        Fri, 15 Apr 2022 17:33:27 -0700 (PDT)
Received: from olv-glaptop3.lan ([2601:647:4400:452:4301:d32e:a8ad:adbf])
        by smtp.gmail.com with ESMTPSA id oo17-20020a17090b1c9100b001bf0ccc59c2sm9900249pjb.16.2022.04.15.17.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Apr 2022 17:33:27 -0700 (PDT)
From:   Chia-I Wu <olvaffe@gmail.com>
To:     freedreno@lists.freedesktop.org
Cc:     dri-devel@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@chromium.org>
Subject: [PATCH 2/3] drm/msm: simplify gpu_busy callback
Date:   Fri, 15 Apr 2022 17:33:13 -0700
Message-Id: <20220416003314.59211-2-olvaffe@gmail.com>
X-Mailer: git-send-email 2.36.0.rc0.470.gd361397f0d-goog
In-Reply-To: <20220416003314.59211-1-olvaffe@gmail.com>
References: <20220416003314.59211-1-olvaffe@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Move tracking and busy time calculation to msm_devfreq_get_dev_status.

Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
Cc: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 19 ++++++----------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 15 +++++--------
 drivers/gpu/drm/msm/msm_gpu.h         |  9 +++-----
 drivers/gpu/drm/msm/msm_gpu_devfreq.c | 32 ++++++++++++++++++++++-----
 4 files changed, 41 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 407f50a15faa..217615e0e850 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -1662,28 +1662,23 @@ static struct msm_ringbuffer *a5xx_active_ring(struct msm_gpu *gpu)
 	return a5xx_gpu->cur_ring;
 }
 
-static unsigned long a5xx_gpu_busy(struct msm_gpu *gpu)
+static u64 a5xx_gpu_busy(struct msm_gpu *gpu, unsigned long *out_sample_rate)
 {
-	u64 busy_cycles, busy_time;
+	u64 busy_cycles;
 
 	/* Only read the gpu busy if the hardware is already active */
-	if (pm_runtime_get_if_in_use(&gpu->pdev->dev) == 0)
+	if (pm_runtime_get_if_in_use(&gpu->pdev->dev) == 0) {
+		*out_sample_rate = 1;
 		return 0;
+	}
 
 	busy_cycles = gpu_read64(gpu, REG_A5XX_RBBM_PERFCTR_RBBM_0_LO,
 			REG_A5XX_RBBM_PERFCTR_RBBM_0_HI);
-
-	busy_time = busy_cycles - gpu->devfreq.busy_cycles;
-	do_div(busy_time, clk_get_rate(gpu->core_clk) / 1000000);
-
-	gpu->devfreq.busy_cycles = busy_cycles;
+	*out_sample_rate = clk_get_rate(gpu->core_clk);
 
 	pm_runtime_put(&gpu->pdev->dev);
 
-	if (WARN_ON(busy_time > ~0LU))
-		return ~0LU;
-
-	return (unsigned long)busy_time;
+	return busy_cycles;
 }
 
 static uint32_t a5xx_get_rptr(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index ccc4fcf7a630..fba6259395dd 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1649,12 +1649,14 @@ static void a6xx_destroy(struct msm_gpu *gpu)
 	kfree(a6xx_gpu);
 }
 
-static unsigned long a6xx_gpu_busy(struct msm_gpu *gpu)
+static u64 a6xx_gpu_busy(struct msm_gpu *gpu, unsigned long *out_sample_rate)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
-	u64 busy_cycles, busy_time;
+	u64 busy_cycles;
 
+	/* 19.2MHz */
+	*out_sample_rate = 19200000;
 
 	/* Only read the gpu busy if the hardware is already active */
 	if (pm_runtime_get_if_in_use(a6xx_gpu->gmu.dev) == 0)
@@ -1664,17 +1666,10 @@ static unsigned long a6xx_gpu_busy(struct msm_gpu *gpu)
 			REG_A6XX_GMU_CX_GMU_POWER_COUNTER_XOCLK_0_L,
 			REG_A6XX_GMU_CX_GMU_POWER_COUNTER_XOCLK_0_H);
 
-	busy_time = (busy_cycles - gpu->devfreq.busy_cycles) * 10;
-	do_div(busy_time, 192);
-
-	gpu->devfreq.busy_cycles = busy_cycles;
 
 	pm_runtime_put(a6xx_gpu->gmu.dev);
 
-	if (WARN_ON(busy_time > ~0LU))
-		return ~0LU;
-
-	return (unsigned long)busy_time;
+	return busy_cycles;
 }
 
 static void a6xx_gpu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp)
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 02419f2ca2bc..389c6dab751b 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -62,7 +62,7 @@ struct msm_gpu_funcs {
 	/* for generation specific debugfs: */
 	void (*debugfs_init)(struct msm_gpu *gpu, struct drm_minor *minor);
 #endif
-	unsigned long (*gpu_busy)(struct msm_gpu *gpu);
+	u64 (*gpu_busy)(struct msm_gpu *gpu, unsigned long *out_sample_rate);
 	struct msm_gpu_state *(*gpu_state_get)(struct msm_gpu *gpu);
 	int (*gpu_state_put)(struct msm_gpu_state *state);
 	unsigned long (*gpu_get_freq)(struct msm_gpu *gpu);
@@ -106,11 +106,8 @@ struct msm_gpu_devfreq {
 	struct dev_pm_qos_request boost_freq;
 
 	/**
-	 * busy_cycles:
-	 *
-	 * Used by implementation of gpu->gpu_busy() to track the last
-	 * busy counter value, for calculating elapsed busy cycles since
-	 * last sampling period.
+	 * busy_cycles: Last busy counter value, for calculating elapsed busy
+	 * cycles since last sampling period.
 	 */
 	u64 busy_cycles;
 
diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
index 317a95d42922..f531015107c3 100644
--- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
+++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
@@ -49,18 +49,38 @@ static unsigned long get_freq(struct msm_gpu *gpu)
 	return clk_get_rate(gpu->core_clk);
 }
 
-static int msm_devfreq_get_dev_status(struct device *dev,
+static void get_raw_dev_status(struct msm_gpu *gpu,
 		struct devfreq_dev_status *status)
 {
-	struct msm_gpu *gpu = dev_to_gpu(dev);
+	struct msm_gpu_devfreq *df = &gpu->devfreq;
+	u64 busy_cycles, busy_time;
+	unsigned long sample_rate;
 	ktime_t time;
 
 	status->current_frequency = get_freq(gpu);
-	status->busy_time = gpu->funcs->gpu_busy(gpu);
-
+	busy_cycles = gpu->funcs->gpu_busy(gpu, &sample_rate);
 	time = ktime_get();
-	status->total_time = ktime_us_delta(time, gpu->devfreq.time);
-	gpu->devfreq.time = time;
+
+	busy_time = busy_cycles - df->busy_cycles;
+	status->total_time = ktime_us_delta(time, df->time);
+
+	df->busy_cycles = busy_cycles;
+	df->time = time;
+
+	busy_time *= USEC_PER_SEC;
+	do_div(busy_time, sample_rate);
+	if (WARN_ON(busy_time > ~0LU))
+		busy_time = ~0LU;
+
+	status->busy_time = busy_time;
+}
+
+static int msm_devfreq_get_dev_status(struct device *dev,
+		struct devfreq_dev_status *status)
+{
+	struct msm_gpu *gpu = dev_to_gpu(dev);
+
+	get_raw_dev_status(gpu, status);
 
 	return 0;
 }
-- 
2.36.0.rc0.470.gd361397f0d-goog

