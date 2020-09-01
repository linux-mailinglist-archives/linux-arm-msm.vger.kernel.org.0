Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26CC5259A52
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Sep 2020 18:49:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730242AbgIAQqk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Sep 2020 12:46:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732205AbgIAQqa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Sep 2020 12:46:30 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFD06C061245;
        Tue,  1 Sep 2020 09:46:28 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id m8so1121736pfh.3;
        Tue, 01 Sep 2020 09:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AtDGpD/XnWP8Ti9WD0z8IqON07o+ejDvu0mVNeo0eqY=;
        b=pDRujDmQMB6gDhuLxBPcOF0bqXeWWMFz0szkN9aXWpFEKezKSCui310pvCT93vgHXq
         8/ZHCFpO5WPyaWyPm2bFSt7Q95ASl5BAOFL42UE3rXCnSGV8FdqUQZY5rZ/jcCaijm1M
         zekB7xMC3/ifpbenHuD3L5i+akVq5Ig8Jrtz1oPI+p+MNKaSG8ORuRRF7zjKCTxYPVj0
         QuPasa2P+mpXqMjj99DeDNEYXQ9ZydzSTrkZGwZXo4b8b8g0cEN1xWiYVQGYYPMBpxOz
         7bbhfCo9jzFQhEedMVZG+EvuJdPYItqShLt7oaxbcXpM33nbI4kR3N14rDDoYRlkwrux
         o9Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AtDGpD/XnWP8Ti9WD0z8IqON07o+ejDvu0mVNeo0eqY=;
        b=O4Y53wJ9ttUDqd9i3TxdQWUfxjpxOsTlnR3cIngvNSubQc4Wj1lI9x3jGLL8+IktYn
         ZbPmYfHFjWyNSq/h4Agg877gk7CQmEOhHt6YXKwkVMuGXnytqSP64623BLs41IUBKjyy
         ZBOgfOGMKGKQ6Sv6lHdB+yb6dR2XfFpFACmEYPxb+0XO5ApoVcil2b2QLTX0d/Vf86U/
         FnO9bFlpjASguxPIiXsp9SUFX0Bab6zQqpCAndemgjKgqfZH+yreBYOY/l3s73kKT8BI
         PM5pmgRkJbKiz6e5HEzS5EnG9+oeh6tNTF78WlSH7Ec8ZLn3eW+p1eVe1XYO0FCsHbbk
         eNPQ==
X-Gm-Message-State: AOAM532wQLgh13UrayEotD5gDUgSxwuc8ApVDPYWXLHf25/czV8D0bQc
        zPhG75iUVfxl4TllQ9z5aXI=
X-Google-Smtp-Source: ABdhPJzxYOVAQ+0hKgBUQ8jNvr+9VynWopfDOavq/M6+UsPjxLuEJ2hJDsXynVX9iEvYL2xejHYb+g==
X-Received: by 2002:a63:1d5c:: with SMTP id d28mr2143045pgm.82.1598978788300;
        Tue, 01 Sep 2020 09:46:28 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
        by smtp.gmail.com with ESMTPSA id md10sm2023391pjb.45.2020.09.01.09.46.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2020 09:46:27 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
        linux-arm-msm@vger.kernel.org, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Shawn Guo <shawn.guo@linaro.org>,
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v16 03/20] drm/msm/gpu: Add dev_to_gpu() helper
Date:   Tue,  1 Sep 2020 09:46:20 -0700
Message-Id: <20200901164707.2645413-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200901164707.2645413-1-robdclark@gmail.com>
References: <20200901164707.2645413-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

In a later patch, the drvdata will not directly be 'struct msm_gpu *',
so add a helper to reduce the churn.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 10 ++++------
 drivers/gpu/drm/msm/msm_gpu.c              |  6 +++---
 drivers/gpu/drm/msm/msm_gpu.h              |  5 +++++
 3 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 9eeb46bf2a5d..26664e1b30c0 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -282,7 +282,7 @@ struct msm_gpu *adreno_load_gpu(struct drm_device *dev)
 	int ret;
 
 	if (pdev)
-		gpu = platform_get_drvdata(pdev);
+		gpu = dev_to_gpu(&pdev->dev);
 
 	if (!gpu) {
 		dev_err_once(dev->dev, "no GPU device was found\n");
@@ -425,7 +425,7 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
 static void adreno_unbind(struct device *dev, struct device *master,
 		void *data)
 {
-	struct msm_gpu *gpu = dev_get_drvdata(dev);
+	struct msm_gpu *gpu = dev_to_gpu(dev);
 
 	pm_runtime_force_suspend(dev);
 	gpu->funcs->destroy(gpu);
@@ -490,16 +490,14 @@ static const struct of_device_id dt_match[] = {
 #ifdef CONFIG_PM
 static int adreno_resume(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct msm_gpu *gpu = platform_get_drvdata(pdev);
+	struct msm_gpu *gpu = dev_to_gpu(dev);
 
 	return gpu->funcs->pm_resume(gpu);
 }
 
 static int adreno_suspend(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct msm_gpu *gpu = platform_get_drvdata(pdev);
+	struct msm_gpu *gpu = dev_to_gpu(dev);
 
 	return gpu->funcs->pm_suspend(gpu);
 }
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index d5645472b25d..6aa9e04e52e7 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -24,7 +24,7 @@
 static int msm_devfreq_target(struct device *dev, unsigned long *freq,
 		u32 flags)
 {
-	struct msm_gpu *gpu = platform_get_drvdata(to_platform_device(dev));
+	struct msm_gpu *gpu = dev_to_gpu(dev);
 	struct dev_pm_opp *opp;
 
 	opp = devfreq_recommended_opp(dev, freq, flags);
@@ -45,7 +45,7 @@ static int msm_devfreq_target(struct device *dev, unsigned long *freq,
 static int msm_devfreq_get_dev_status(struct device *dev,
 		struct devfreq_dev_status *status)
 {
-	struct msm_gpu *gpu = platform_get_drvdata(to_platform_device(dev));
+	struct msm_gpu *gpu = dev_to_gpu(dev);
 	ktime_t time;
 
 	if (gpu->funcs->gpu_get_freq)
@@ -64,7 +64,7 @@ static int msm_devfreq_get_dev_status(struct device *dev,
 
 static int msm_devfreq_get_cur_freq(struct device *dev, unsigned long *freq)
 {
-	struct msm_gpu *gpu = platform_get_drvdata(to_platform_device(dev));
+	struct msm_gpu *gpu = dev_to_gpu(dev);
 
 	if (gpu->funcs->gpu_get_freq)
 		*freq = gpu->funcs->gpu_get_freq(gpu);
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 0db117a7339b..8bda7beaed4b 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -141,6 +141,11 @@ struct msm_gpu {
 	struct msm_gpu_state *crashstate;
 };
 
+static inline struct msm_gpu *dev_to_gpu(struct device *dev)
+{
+	return dev_get_drvdata(dev);
+}
+
 /* It turns out that all targets use the same ringbuffer size */
 #define MSM_GPU_RINGBUFFER_SZ SZ_32K
 #define MSM_GPU_RINGBUFFER_BLKSIZE 32
-- 
2.26.2

