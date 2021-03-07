Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE334330406
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Mar 2021 19:54:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231631AbhCGSwJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 7 Mar 2021 13:52:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231562AbhCGSvo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 7 Mar 2021 13:51:44 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B719C06175F
        for <linux-arm-msm@vger.kernel.org>; Sun,  7 Mar 2021 10:51:44 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id n22so4747126wmc.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Mar 2021 10:51:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=RsjSwA8oB0o8PW0ry99uhxTdXQdH9BOaf5mimdTgeO0=;
        b=oWBnZ4aSczd7y5RxPFRzRlQVEwdtlC9a7PJ+FC4zThsk6IkpQmng+VE49/LomHtJMo
         KTXaLq3/6N4DkZfdmxylKLJBC9GmFaqke08d4pIGBWKxDWIz/16PL5zXFXcrBhi85x92
         KrSgTVisjIQZRkKc6FnfU2NqKTyPV1RI4VtdCr9bhiIEBCv4u+OkZ4UEG7SyIhN22L7D
         2InRHmS/NTCjCJ+uNOEcNKLnTrUYdn4vei5v2JFTFA6c0mJYcFPj/TUQgaJ6bc2cMxf7
         bnrIhRfc8/EG7XJOp+tmPoVNBtn7WvepMRAfMS/xyy34bbLze1EvaURKwm++PtpDcIcS
         O6Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=RsjSwA8oB0o8PW0ry99uhxTdXQdH9BOaf5mimdTgeO0=;
        b=fPvkO4gNHJI1m7YqDibXU+h09DWfFpQcLqrFGHdRC55f/8iGhV0SQ9/gYFhdVH12w2
         rarv6oXYppgcIhNztcnozoiDcsWjx+vTKGyqg7mjPwz9ciF8M+L6eECUMEAXikJ2Q4fX
         ZmlQ4yh9hOUiGxPN71D+8ManOY/42qRSTqHbpyuGcgGaXfTgRx4IVJ7tTenmYUaPlIqP
         rBn66mRml9RwnGX+Ca8uX8EC0kX/jGvWhGvjGJOcGWAB2uuWWN8kbixa+eeOa1tTwHet
         BF++0RC+hrh7MYBEkUEBZ9dZzC4Dm8ugHCRcfSduQmFyBQonLVy0YxLOelBCATKLQOly
         kcGA==
X-Gm-Message-State: AOAM531U/hBzS5EXHyQT7hfgTP8w7y1+/FuLH7ZdKmmLwlO+HdSQ0sFR
        iUM+1OInvb8yfBbWQKLdk18kKw==
X-Google-Smtp-Source: ABdhPJyiWxW4LLC9cR5FfZEHHAga+VfDDG2o+o5y28Fnu6rWugw1VUFr3FMW44bTF7Odac0y9zFPjw==
X-Received: by 2002:a1c:66c4:: with SMTP id a187mr18790206wmc.164.1615143102905;
        Sun, 07 Mar 2021 10:51:42 -0800 (PST)
Received: from localhost.localdomain (lns-bzn-59-82-252-141-80.adsl.proxad.net. [82.252.141.80])
        by smtp.gmail.com with ESMTPSA id v5sm14842965wmh.2.2021.03.07.10.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Mar 2021 10:51:42 -0800 (PST)
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
Subject: [PATCH v4 2/4] devfreq/drivers/msm: Use devfreq cooling device registration
Date:   Sun,  7 Mar 2021 19:51:35 +0100
Message-Id: <20210307185137.24925-2-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210307185137.24925-1-daniel.lezcano@linaro.org>
References: <20210307185137.24925-1-daniel.lezcano@linaro.org>
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

