Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B512821A230
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2020 16:35:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726410AbgGIOf2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jul 2020 10:35:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726353AbgGIOf1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jul 2020 10:35:27 -0400
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A56B9C08C5DC
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2020 07:35:27 -0700 (PDT)
Received: by mail-qt1-x843.google.com with SMTP id w27so1787583qtb.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2020 07:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cpCnVG3Ny+sMfK7hbXlrQci+VvCzOJqiP+fTESc3hcY=;
        b=nBovAMxXOtOlB21HIcXob+wOcVhz/HQ6NeA4GArDhNdMytNKoLxSFBJZybMgitiHf2
         agWC1mHylcc/k/qdBAfm/aYT3q0fKOQ98FogTVKA86ka60eiW63deQuJXK4FInJaTE0p
         j7UmZZG3Vr/I3D6aAYOqj+U+irjAY7zB/zn2VgdK19iiD2bduF3/AOEScqHZZ7lAlKA2
         KtQbsMAs1uAPa4kXjTuUZDJKNL7kItc8WLg8sKG7KGC5o5vPuMMDK2uJzZLvmo7E2MOH
         Zs3eLaWwYGfboMiOsMr+gbvxBVWpetXz23iPH5ugqnrub7yIql2rZ9JHWV+UlWypx6Em
         49Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cpCnVG3Ny+sMfK7hbXlrQci+VvCzOJqiP+fTESc3hcY=;
        b=efpDfITrKdSqezaXQTrWHQ9gb70FXXiseVH6CJ3FidDaUVIwp5EwXQpBgxbY1Jwpnh
         GF0DIEFiYwyagO0WQKka1/hVLPlFg/3fQw+Ssgh7p54A2aHX2Z/GyITeHHMs+FCWXOvJ
         j9DAZ6RyLKdoctzet6r3nAOtS3bb+ItKqIVPq8zwQA6Cb4vVTi6+YGXSPzy/nluyE5F1
         AXarDHj8EYVwMiLG4wJ5ON0TWKDVRHQdBnrzuTUBRDUjM836CXvUNMoTaQVwe2vNWzjt
         a8x0oBFPJHw+AW2u12jTd+V88hO5WrITcI0RzBkZlxqxKSAH8ukZD8adZgmhn2uV6hND
         BHZw==
X-Gm-Message-State: AOAM533wJSdaX0EGSskopZW+ah0xoXHotlrrG/8z0BVzFs+YhR17GD23
        r+cLb/M7zSicSDd5bPJuIbD5/Q==
X-Google-Smtp-Source: ABdhPJyKclkU0SHcqsPhYVrCQfK/o21m329RQOU3cmnglRUoG96k7rSJLAr8n5q3GQFPyk+Vcr14nw==
X-Received: by 2002:ac8:36bb:: with SMTP id a56mr65925740qtc.201.1594305326678;
        Thu, 09 Jul 2020 07:35:26 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id p7sm3937315qki.61.2020.07.09.07.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 07:35:25 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     freedreno@lists.freedesktop.org
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Brian Masney <masneyb@onstation.org>,
        Fabio Estevam <festevam@gmail.com>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        dri-devel@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2] drm/msm: handle for EPROBE_DEFER for of_icc_get
Date:   Thu,  9 Jul 2020 10:34:03 -0400
Message-Id: <20200709143404.11876-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Check for errors instead of silently not using icc if the msm driver
probes before the interconnect driver.

Allow ENODATA for ocmem path, as it is optional and this error
is returned when "gfx-mem" path is provided but not "ocmem".

Remove the WARN_ON in msm_gpu_cleanup because INIT_LIST_HEAD won't have
been called on the list yet when going through the defer error path.

Changes in v2:
* Changed to not only check for EPROBE_DEFER

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 17 ++++++++++++++---
 drivers/gpu/drm/msm/msm_gpu.c           |  2 --
 2 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 89673c7ed473..0f5217202eb5 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -940,12 +940,20 @@ static int adreno_get_pwrlevels(struct device *dev,
 		 */
 		gpu->icc_path = of_icc_get(dev, NULL);
 	}
-	if (IS_ERR(gpu->icc_path))
+	if (IS_ERR(gpu->icc_path)) {
+		ret = PTR_ERR(gpu->icc_path);
 		gpu->icc_path = NULL;
+		return ret;
+	}
 
 	gpu->ocmem_icc_path = of_icc_get(dev, "ocmem");
-	if (IS_ERR(gpu->ocmem_icc_path))
+	if (IS_ERR(gpu->ocmem_icc_path)) {
+		ret = PTR_ERR(gpu->ocmem_icc_path);
 		gpu->ocmem_icc_path = NULL;
+		/* allow -ENODATA, ocmem icc is optional */
+		if (ret != -ENODATA)
+			return ret;
+	}
 
 	return 0;
 }
@@ -996,6 +1004,7 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 	struct adreno_platform_config *config = pdev->dev.platform_data;
 	struct msm_gpu_config adreno_gpu_config  = { 0 };
 	struct msm_gpu *gpu = &adreno_gpu->base;
+	int ret;
 
 	adreno_gpu->funcs = funcs;
 	adreno_gpu->info = adreno_info(config->rev);
@@ -1007,7 +1016,9 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 
 	adreno_gpu_config.nr_rings = nr_rings;
 
-	adreno_get_pwrlevels(&pdev->dev, gpu);
+	ret = adreno_get_pwrlevels(&pdev->dev, gpu);
+	if (ret)
+		return ret;
 
 	pm_runtime_set_autosuspend_delay(&pdev->dev,
 		adreno_gpu->info->inactive_period);
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index a22d30622306..ccf9a0dd9706 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -959,8 +959,6 @@ void msm_gpu_cleanup(struct msm_gpu *gpu)
 
 	DBG("%s", gpu->name);
 
-	WARN_ON(!list_empty(&gpu->active_list));
-
 	for (i = 0; i < ARRAY_SIZE(gpu->rb); i++) {
 		msm_ringbuffer_destroy(gpu->rb[i]);
 		gpu->rb[i] = NULL;
-- 
2.26.1

