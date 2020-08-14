Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46B38244349
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Aug 2020 04:41:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726627AbgHNClY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Aug 2020 22:41:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726587AbgHNClX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Aug 2020 22:41:23 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9427C061757;
        Thu, 13 Aug 2020 19:41:22 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id t6so3705831pjr.0;
        Thu, 13 Aug 2020 19:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wvz5YKiT932AWU4GOoumP4PC6lpfTwxubtkW9TJEg2g=;
        b=BY1djzUz+d/FaHPXRf8zOyhi08GOGS0hirvcPAsRghIkOsjdUuKuMMyqlO4f6hT0cI
         i7u0JfTwggmLPZbHSaceG2c3CH86UErv7laONOr+eg+QNJ3Fpj5vNL5T6V8SPU2Yj5Uv
         bBnolp/TOSK65L9B15Upktswzx0alm2zg1nj/mk76yuZ+oe19SsItpmo6RODs5Agt9ae
         aLwOCvULFDESiwZJrXmMQShRjaL5T72AgMOTueBZfqnH/tSv3Rx5lGrZt2t6TYU5JDap
         Z4nOzcW0iVPyhNu5uzxJ92fkdqAHV+kybDOx2aGKcvOZInD1wXK86qMLLuBP0dulv5rY
         RCxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wvz5YKiT932AWU4GOoumP4PC6lpfTwxubtkW9TJEg2g=;
        b=NzDeQqqKX0dA2/0tEHdIh+3+OvXDO1lkuYus/ICeJQXXtfBX6YYdC95uWO3bz3r8hf
         +UY+AzsjwG2vgT6LeFAdkygQ/PzWvEoRtmhmqTJxIHXuYDlpRBiknSlC7QmUqUwYGX68
         2vRrvCRnRfd1gtFp2Q6kWAETV6u9ASnEKZBIh/+QccHfd0bVToC99Lo/M3G7WeMXXuno
         4OyHfjXqrhrc3gZiTLwCdcccFuGfEJtwnVAKCr5BcX0FJGiL9aYGQifiiZMy07YjlvXf
         IkVYvkKjkwOq5q6n02XeS15W29c5kDM5TqbUu+3kVgG63gyyUpfiUsyDhQHrNlDJB5QS
         lKXg==
X-Gm-Message-State: AOAM531uY+/rIzbLs/+ezmCj7UxjxXHHiWpkEG2NuGU2oxUSLyy7lifx
        2HcX+JQ1KGRVb6z/5mJcpjg=
X-Google-Smtp-Source: ABdhPJy4dHAT604MoCIe4Uk9f4LkQMWMG3gqnhqu2rwnAqeOg+nz/DkG02oCFmjTMkKZbIOZsZxW/Q==
X-Received: by 2002:a17:902:8bcc:: with SMTP id r12mr539052plo.314.1597372882332;
        Thu, 13 Aug 2020 19:41:22 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
        by smtp.gmail.com with ESMTPSA id y10sm7200316pff.177.2020.08.13.19.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2020 19:41:21 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
        linux-arm-msm@vger.kernel.org
Cc:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Will Deacon <will@kernel.org>, freedreno@lists.freedesktop.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        linux-arm-kernel@lists.infradead.org,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Shawn Guo <shawn.guo@linaro.org>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 06/19] drm/msm/gpu: add dev_to_gpu() helper
Date:   Thu, 13 Aug 2020 19:41:01 -0700
Message-Id: <20200814024114.1177553-7-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200810222657.1841322-1-jcrouse@codeaurora.org>
References: <20200810222657.1841322-1-jcrouse@codeaurora.org>
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

