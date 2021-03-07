Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEF0F32FFF3
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Mar 2021 10:47:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230252AbhCGJpt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 7 Mar 2021 04:45:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230303AbhCGJpi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 7 Mar 2021 04:45:38 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F4D0C06174A
        for <linux-arm-msm@vger.kernel.org>; Sun,  7 Mar 2021 01:45:37 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id h98so8075393wrh.11
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Mar 2021 01:45:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=RsjSwA8oB0o8PW0ry99uhxTdXQdH9BOaf5mimdTgeO0=;
        b=cEZv1N9MT1tvcp5XXBU/gC/3IF30iDxLCSKZoGWnZBDvfMPIl/dDWocdAT518rBLib
         z9GfFnD7Vw4DdcLo6XWQ69SwwDSUG75kHjUnPLaR9OU6WdnNycO7Y8roscN1sMew0W9T
         n8yaXirXJTt640L5dqM2zyhVlDKbypVDKJQaCWeDlzBGnB0Kgf9RSTU5UjKuiLHebEyY
         ks0eFoAg7C0H4/gHHMtVmELgLhiqLCw6imgeP39zDlV+mzjWx5brsNRbSimT+hhXNZbn
         eXtGNYNgtSSGjIQJgD4xKtTyeRERc0I4pQTAdASh53z2pnWyPnR0IeaLzGxLmbuU9/CF
         jyqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=RsjSwA8oB0o8PW0ry99uhxTdXQdH9BOaf5mimdTgeO0=;
        b=eZjZ4szKyVWnKgRnsxIAxRzPhhMNK/wa85l8tbIQWMBVcaA0a+M/DeIwhsMj10uWkY
         BoyXgBi+z67Sq35P97qwIm4lK6DG5aXYBvH5ErE+RXiLi5wB2NV92obwrI9jrOVu9K7F
         otBINvZe1Sjza6WryuucjHYa7fBprWgPRe0IQD0K6uPouPUfidiNb+66b4fl+TNuV1Xm
         V8GPiS14t50tQAq9MnXqXAfO1LtJrI3hz9nesJ2SLvVZYBQVfmL9IVdN/WAL2CpqgciH
         PjweXSmLK897qibwYZJZsnZOkGflDIRvayPLKn9IhU+ooUvB3k2j5/JL+AhnXhSHNTdK
         z8AQ==
X-Gm-Message-State: AOAM532+Qan5loSLaxVuTwPb4BZsqTgoepruP49hw/BuraIqKYxMsVuk
        f9JxACdM3y3sxZvQMLItE0BW9g==
X-Google-Smtp-Source: ABdhPJwXs/r34f0ulXMj7OuQIK3/3Xk18RKjsq+HUnzr5igiGn4bAPSoScW19dqf/oqDuniL3Vtm2Q==
X-Received: by 2002:adf:a59a:: with SMTP id g26mr17670383wrc.271.1615110336310;
        Sun, 07 Mar 2021 01:45:36 -0800 (PST)
Received: from localhost.localdomain (lns-bzn-59-82-252-141-80.adsl.proxad.net. [82.252.141.80])
        by smtp.gmail.com with ESMTPSA id z7sm12790737wrt.70.2021.03.07.01.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Mar 2021 01:45:35 -0800 (PST)
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
To:     cwchoi00@gmail.com
Cc:     lukasz.luba@arm.com, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, steven.price@arm.com,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        dri-devel@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU)
Subject: [PATCH v3 2/4] devfreq/drivers/msm: Use devfreq cooling device registration
Date:   Sun,  7 Mar 2021 10:45:16 +0100
Message-Id: <20210307094519.9032-2-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210307094519.9032-1-daniel.lezcano@linaro.org>
References: <20210307094519.9032-1-daniel.lezcano@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The devfreq core code is able to register the devfreq device as a
cooling device if the 'is_cooling_device' flag is set in the profile.

Use this flag and remove the cooling device registering code.

Tested on dragonboard 845c

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/gpu/drm/msm/msm_gpu.c | 12 +-----------
 drivers/gpu/drm/msm/msm_gpu.h |  2 --
 2 files changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index ab7c167b0623..eade94271a60 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -14,7 +14,6 @@
 #include <generated/utsrelease.h>
 #include <linux/string_helpers.h>
 #include <linux/devfreq.h>
-#include <linux/devfreq_cooling.h>
 #include <linux/devcoredump.h>
 #include <linux/sched/task.h>
 
@@ -82,6 +81,7 @@ static struct devfreq_dev_profile msm_devfreq_profile = {
 	.target = msm_devfreq_target,
 	.get_dev_status = msm_devfreq_get_dev_status,
 	.get_cur_freq = msm_devfreq_get_cur_freq,
+	.is_cooling_device = true,
 };
 
 static void msm_devfreq_init(struct msm_gpu *gpu)
@@ -112,14 +112,6 @@ static void msm_devfreq_init(struct msm_gpu *gpu)
 	}
 
 	devfreq_suspend_device(gpu->devfreq.devfreq);
-
-	gpu->cooling = of_devfreq_cooling_register(gpu->pdev->dev.of_node,
-			gpu->devfreq.devfreq);
-	if (IS_ERR(gpu->cooling)) {
-		DRM_DEV_ERROR(&gpu->pdev->dev,
-				"Couldn't register GPU cooling device\n");
-		gpu->cooling = NULL;
-	}
 }
 
 static int enable_pwrrail(struct msm_gpu *gpu)
@@ -1056,6 +1048,4 @@ void msm_gpu_cleanup(struct msm_gpu *gpu)
 	if (gpu->worker) {
 		kthread_destroy_worker(gpu->worker);
 	}
-
-	devfreq_cooling_unregister(gpu->cooling);
 }
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index d7cd02cd2109..93419368bac8 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -155,8 +155,6 @@ struct msm_gpu {
 	struct msm_gpu_state *crashstate;
 	/* True if the hardware supports expanded apriv (a650 and newer) */
 	bool hw_apriv;
-
-	struct thermal_cooling_device *cooling;
 };
 
 static inline struct msm_gpu *dev_to_gpu(struct device *dev)
-- 
2.17.1

