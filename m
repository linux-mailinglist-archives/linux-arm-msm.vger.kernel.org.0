Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0FCAC69DB60
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Feb 2023 08:42:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232613AbjBUHm1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Feb 2023 02:42:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229697AbjBUHm0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Feb 2023 02:42:26 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E706D2725
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Feb 2023 23:42:23 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id k14so3536184lfj.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Feb 2023 23:42:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dKtslRZspt8o3Sccdk1DfcCyRNMlDNOBZp6futbzDZU=;
        b=OzU53k4iuJB7XmlE5/JWME6X99P804nLzi+IjCtwjWwLQD9ilB+07YGcTbwnhpTMRG
         HnrSQY86ESKjU0ZrH68wKx38Ez0G72gj4eLc21EeOG9evi4MzLOu6EoJSBFH+1LWUBpJ
         E/uRcE2zn50nS94S8nGj7Nh5UUPLH4zrFRH04rn5M56AKrI1ZKyFkFkXs91iXSAozdzM
         adwGq/M+m5rsHnloEnrIPWTu/rVMJBUBoFfQwXbbWmqlqQ7Vz+C3PBEMuVTcHikkuS9T
         ZGYjU5ofOsJi+o8PQ3QYpwYv1R4TjTRN6YTr3RYomW+DPmbzl527PYnp7tNwANUR0b0X
         SO8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dKtslRZspt8o3Sccdk1DfcCyRNMlDNOBZp6futbzDZU=;
        b=3jnw9pgLbqOJkQpP3rqVQBBLf641v7ceS670BL0aQqn7tyhDn+CChEm1ELQy5PLYeZ
         ISFo94xk5MenDFZhXQ+HsJbMsFTeKI9Z5/ATOJt7yAOeSVRFLtsAP8+CtjHBD93KdzJe
         GshQwxFnTCoeggxLlF92imfdakoAzKk9y5E12OcFTe7x/o9ylJCO8nzjSlfUGMe9R6kb
         71VaJhVvnaAeprxWBypbBBLY7ayLfUH15/vtwcK6WX4NOn437uYDw0zWoNLXbAA/mP/x
         guZRzh1Ijz9V20WmUiHbPvAhte+gxFapaNdZIc8u8vx1RKeuXsTun5nZe6j1qtLEtRZL
         tjjg==
X-Gm-Message-State: AO0yUKWrEIsoTsP4Ni9hFQI1Fkn/d6QVnTpr5/UJWbJ0c9DPOzDs5ILt
        cf/VZ6UGzITgSKHr4r9zjHFm9A==
X-Google-Smtp-Source: AK7set/Du/SmnkG9npmGl15OvCIHvsDH40L2g0ZWC0y8n5am9lawYOEAyJD33dLc5DUYqF78qBuVQw==
X-Received: by 2002:a05:6512:66:b0:4a4:7be4:9baf with SMTP id i6-20020a056512006600b004a47be49bafmr1157741lfo.59.1676965342173;
        Mon, 20 Feb 2023 23:42:22 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id b17-20020ac25e91000000b00492c663bba2sm1766909lfq.124.2023.02.20.23.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 23:42:21 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Chia-I Wu <olvaffe@gmail.com>
Subject: [RFC PATCH] drm/msm: tune the devfreq to take into account the load history
Date:   Tue, 21 Feb 2023 10:42:21 +0300
Message-Id: <20230221074221.3650442-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Partially restore the handling of the GPU load history. Accumulate the
busy_time and and total_time measured in active state during the polling
period. This results in slightly smoother picture of the GPU frequencies
(measured on the a530/msm8996, using kmscube in different resolutions).

A call to msm_devfreq_get_dev_status() from msm_devfreq_active() was
removed in 69f06a5d854f ("drm/msm: remove explicit devfreq status
reset"), because dev_pm_qos_update_request() triggered that internally.
As the commit fadcc3ab1302 ("drm/msm/gpu: Bypass PM QoS constraint for
idle clamp") removed the calls to dev_pm_qos_update_request(), this
removal was also reverted.

The code doesn't take the frequency into account while accumulating the
data to keep the code simple for the RFC.

Cc: Chia-I Wu <olvaffe@gmail.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_gpu.h         |  3 +++
 drivers/gpu/drm/msm/msm_gpu_devfreq.c | 30 ++++++++++++++++++++++++++-
 2 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index fc1c0d8611a8..9d1783375dcc 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -156,6 +156,9 @@ struct msm_gpu_devfreq {
 
 	/** suspended: tracks if we're suspended */
 	bool suspended;
+
+	/* stats for the current period */
+	struct devfreq_dev_status status;
 };
 
 struct msm_gpu {
diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
index e27dbf12b5e8..92cb022c8628 100644
--- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
+++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
@@ -74,7 +74,7 @@ static unsigned long get_freq(struct msm_gpu *gpu)
 	return clk_get_rate(gpu->core_clk);
 }
 
-static int msm_devfreq_get_dev_status(struct device *dev,
+static int msm_devfreq_get_dev_status_int(struct device *dev,
 		struct devfreq_dev_status *status)
 {
 	struct msm_gpu *gpu = dev_to_gpu(dev);
@@ -112,6 +112,22 @@ static int msm_devfreq_get_dev_status(struct device *dev,
 	return 0;
 }
 
+static int msm_devfreq_get_dev_status(struct device *dev,
+		struct devfreq_dev_status *status)
+{
+	struct msm_gpu *gpu = dev_to_gpu(dev);
+	struct msm_gpu_devfreq *df = &gpu->devfreq;
+
+	msm_devfreq_get_dev_status_int(&gpu->pdev->dev, status);
+	status->busy_time += df->status.busy_time;
+	status->total_time += df->status.total_time;
+
+	df->status.busy_time = 0;
+	df->status.total_time = 0;
+
+	return 0;
+}
+
 static int msm_devfreq_get_cur_freq(struct device *dev, unsigned long *freq)
 {
 	*freq = get_freq(dev_to_gpu(dev));
@@ -290,6 +306,7 @@ void msm_devfreq_active(struct msm_gpu *gpu)
 	struct msm_gpu_devfreq *df = &gpu->devfreq;
 	unsigned int idle_time;
 	unsigned long target_freq;
+	struct devfreq_dev_status status;
 
 	if (!has_devfreq(gpu))
 		return;
@@ -319,6 +336,12 @@ void msm_devfreq_active(struct msm_gpu *gpu)
 	if (target_freq)
 		msm_devfreq_target(&gpu->pdev->dev, &target_freq, 0);
 
+	/*
+	 * Reset the polling interval so we aren't inconsistent
+	 * about freq vs busy/total cycles
+	 */
+	msm_devfreq_get_dev_status_int(&gpu->pdev->dev, &status);
+
 	mutex_unlock(&df->devfreq->lock);
 
 	/*
@@ -339,6 +362,7 @@ static void msm_devfreq_idle_work(struct kthread_work *work)
 	struct msm_gpu *gpu = container_of(df, struct msm_gpu, devfreq);
 	struct msm_drm_private *priv = gpu->dev->dev_private;
 	unsigned long idle_freq, target_freq = 0;
+	struct devfreq_dev_status status;
 
 	/*
 	 * Hold devfreq lock to synchronize with get_dev_status()/
@@ -346,6 +370,10 @@ static void msm_devfreq_idle_work(struct kthread_work *work)
 	 */
 	mutex_lock(&df->devfreq->lock);
 
+	msm_devfreq_get_dev_status_int(&gpu->pdev->dev, &status);
+	df->status.busy_time += status.busy_time;
+	df->status.total_time += status.total_time;
+
 	idle_freq = get_freq(gpu);
 
 	if (priv->gpu_clamp_to_idle)
-- 
2.30.2

