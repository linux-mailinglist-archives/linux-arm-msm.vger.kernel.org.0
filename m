Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72FD0664FB2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jan 2023 00:14:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229681AbjAJXOv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Jan 2023 18:14:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233103AbjAJXOu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Jan 2023 18:14:50 -0500
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 137D812AC8;
        Tue, 10 Jan 2023 15:14:49 -0800 (PST)
Received: by mail-pf1-x42f.google.com with SMTP id 200so3913679pfx.7;
        Tue, 10 Jan 2023 15:14:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TpjDi8qfShZES+0mxomjnIyhxSKQVT/VoUrYfMrzBdU=;
        b=ivzV2+YnF+vCHlxLkMGYwQtlyVGYGEPNOv/yjLnEHnwzlAejr0CjPeIEoI/bjvYa1o
         B82SolB5LiqLda2M3ErqRc1gMFEUp+iK76PzzJSWNB7uiQPrKoADrTS10gkGJoV2kYr8
         gmgatwZWsEVuVUUIo+kP/UB+AShKxb1h+w4chtK0W+H6lp0s3iNUyIj2ARCZpSr0wFfO
         Tch8PYolqodjuokRCgihoheTUnF34CMT/5WdxVWAFNCC+eQ94vq9kOR/VRKLw5VItBTS
         dylSPvjmAoAMIgjryRjMQ3bwiIEfzUxpaXzhsb/YtvaZ0RB6PR9txJtrCAGS2YKuMqYk
         5lgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TpjDi8qfShZES+0mxomjnIyhxSKQVT/VoUrYfMrzBdU=;
        b=tUJlJvmk8ptYKSLbEOEvG1N8iQDr3L6aeLEK78IexvEcO6dqsm+UMvp/MdgYagnm7A
         SFCEljo8fKorRNDr5IGpSLKPwjOV3Z1m6AdcNX5TGOTTKpbb+6eK0PicbQ0JQgbcPrA4
         Z/FikfnHTnSccSZi8a+CTJZ1P93sZKXT/+BrrdlQJL3RdejUmnEngZ5z6E2Rjxv0XcaK
         SLF4SAP2cIH5mYrffmpXw0SgOIC3QALXTsl7QOccetYNiiHAPjiCMyZ3qIRXTypyhMsB
         J3cmKxPf389Jqixrq5NnBn1rn3E4LrSwPNQRfpolFb0EHeCSh8B+bCIalwNvTNSnDX47
         raTA==
X-Gm-Message-State: AFqh2kogOb4aMsJcM2rwakGpFet1OVE5XQsLSltlwoF552321MZ3pmb5
        I8xHdgbIR35DbVZ8Y20OP0Y=
X-Google-Smtp-Source: AMrXdXtASPfLVOaPZdKSXLvQ0m0mftIiTesdP/YamPLiJ+/XYF3yeQmzF49/Q4IEhW6NtxJYCqroWA==
X-Received: by 2002:a05:6a00:d77:b0:587:102b:edb6 with SMTP id n55-20020a056a000d7700b00587102bedb6mr11389473pfv.17.1673392488440;
        Tue, 10 Jan 2023 15:14:48 -0800 (PST)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
        by smtp.gmail.com with ESMTPSA id z16-20020aa79e50000000b00585cb0efebbsm7919280pfq.175.2023.01.10.15.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 15:14:48 -0800 (PST)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Chia-I Wu <olvaffe@gmail.com>,
        Douglas Anderson <dianders@chromium.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 1/3] drm/msm/gpu: Add devfreq tuning debugfs
Date:   Tue, 10 Jan 2023 15:14:42 -0800
Message-Id: <20230110231447.1939101-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230110231447.1939101-1-robdclark@gmail.com>
References: <20230110231447.1939101-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Make the handful of tuning knobs available visible via debugfs.

v2: select DEVFREQ_GOV_SIMPLE_ONDEMAND because for some reason
    struct devfreq_simple_ondemand_data depends on this

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/Kconfig           |  1 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c |  2 +-
 drivers/gpu/drm/msm/msm_debugfs.c     | 12 ++++++++++++
 drivers/gpu/drm/msm/msm_drv.h         |  9 +++++++++
 drivers/gpu/drm/msm/msm_gpu.h         |  3 ---
 drivers/gpu/drm/msm/msm_gpu_devfreq.c |  6 ++++--
 6 files changed, 27 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index 3c9dfdb0b328..f7abacb4b221 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -23,6 +23,7 @@ config DRM_MSM
 	select SHMEM
 	select TMPFS
 	select QCOM_SCM
+	select DEVFREQ_GOV_SIMPLE_ONDEMAND
 	select WANT_DEV_COREDUMP
 	select SND_SOC_HDMI_CODEC if SND_SOC
 	select SYNC_FILE
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 36c8fb699b56..6f7401f2acda 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2021,7 +2021,7 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 	 * to cause power supply issues:
 	 */
 	if (adreno_is_a618(adreno_gpu) || adreno_is_7c3(adreno_gpu))
-		gpu->clamp_to_idle = true;
+		priv->gpu_clamp_to_idle = true;
 
 	/* Check if there is a GMU phandle and set it up */
 	node = of_parse_phandle(pdev->dev.of_node, "qcom,gmu", 0);
diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
index 95f4374ae21c..d6ecff0ab618 100644
--- a/drivers/gpu/drm/msm/msm_debugfs.c
+++ b/drivers/gpu/drm/msm/msm_debugfs.c
@@ -305,6 +305,7 @@ void msm_debugfs_init(struct drm_minor *minor)
 {
 	struct drm_device *dev = minor->dev;
 	struct msm_drm_private *priv = dev->dev_private;
+	struct dentry *gpu_devfreq;
 
 	drm_debugfs_create_files(msm_debugfs_list,
 				 ARRAY_SIZE(msm_debugfs_list),
@@ -325,6 +326,17 @@ void msm_debugfs_init(struct drm_minor *minor)
 	debugfs_create_file("shrink", S_IRWXU, minor->debugfs_root,
 		dev, &shrink_fops);
 
+	gpu_devfreq = debugfs_create_dir("devfreq", minor->debugfs_root);
+
+	debugfs_create_bool("idle_clamp",0600, gpu_devfreq,
+			    &priv->gpu_clamp_to_idle);
+
+	debugfs_create_u32("upthreshold",0600, gpu_devfreq,
+			   &priv->gpu_devfreq_config.upthreshold);
+
+	debugfs_create_u32("downdifferential",0600, gpu_devfreq,
+			   &priv->gpu_devfreq_config.downdifferential);
+
 	if (priv->kms && priv->kms->funcs->debugfs_init)
 		priv->kms->funcs->debugfs_init(priv->kms, minor);
 
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 876d8d5eec2f..6cb1c6d230e8 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -11,6 +11,7 @@
 #include <linux/kernel.h>
 #include <linux/clk.h>
 #include <linux/cpufreq.h>
+#include <linux/devfreq.h>
 #include <linux/module.h>
 #include <linux/component.h>
 #include <linux/platform_device.h>
@@ -234,6 +235,14 @@ struct msm_drm_private {
 	 */
 	unsigned int hangcheck_period;
 
+	/** gpu_devfreq_config: Devfreq tuning config for the GPU. */
+	struct devfreq_simple_ondemand_data gpu_devfreq_config;
+
+	/**
+	 * gpu_clamp_to_idle: Enable clamping to idle freq when inactive
+	 */
+	bool gpu_clamp_to_idle;
+
 	/**
 	 * disable_err_irq:
 	 *
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 732295e25683..ab110c377916 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -275,9 +275,6 @@ struct msm_gpu {
 
 	struct msm_gpu_state *crashstate;
 
-	/* Enable clamping to idle freq when inactive: */
-	bool clamp_to_idle;
-
 	/* True if the hardware supports expanded apriv (a650 and newer) */
 	bool hw_apriv;
 
diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
index 025940eb08d1..0d7ff7ddc029 100644
--- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
+++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
@@ -183,6 +183,7 @@ static bool has_devfreq(struct msm_gpu *gpu)
 void msm_devfreq_init(struct msm_gpu *gpu)
 {
 	struct msm_gpu_devfreq *df = &gpu->devfreq;
+	struct msm_drm_private *priv = gpu->dev->dev_private;
 
 	/* We need target support to do devfreq */
 	if (!gpu->funcs->gpu_busy)
@@ -209,7 +210,7 @@ void msm_devfreq_init(struct msm_gpu *gpu)
 
 	df->devfreq = devm_devfreq_add_device(&gpu->pdev->dev,
 			&msm_devfreq_profile, DEVFREQ_GOV_SIMPLE_ONDEMAND,
-			NULL);
+			&priv->gpu_devfreq_config);
 
 	if (IS_ERR(df->devfreq)) {
 		DRM_DEV_ERROR(&gpu->pdev->dev, "Couldn't initialize GPU devfreq\n");
@@ -358,10 +359,11 @@ static void msm_devfreq_idle_work(struct kthread_work *work)
 	struct msm_gpu_devfreq *df = container_of(work,
 			struct msm_gpu_devfreq, idle_work.work);
 	struct msm_gpu *gpu = container_of(df, struct msm_gpu, devfreq);
+	struct msm_drm_private *priv = gpu->dev->dev_private;
 
 	df->idle_time = ktime_get();
 
-	if (gpu->clamp_to_idle)
+	if (priv->gpu_clamp_to_idle)
 		dev_pm_qos_update_request(&df->idle_freq, 0);
 }
 
-- 
2.38.1

