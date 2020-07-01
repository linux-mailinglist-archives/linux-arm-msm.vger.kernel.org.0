Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BBA721025A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2020 05:10:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725872AbgGADK2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Jun 2020 23:10:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725862AbgGADK2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Jun 2020 23:10:28 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACFA2C061755
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2020 20:10:27 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id u17so17408752qtq.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2020 20:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lsG0/vZrFsbUfKMaszn0w2LlEErj8aBW/8Ir/pz3OGU=;
        b=k2b3NgAcITe6TyGQHN9BCCJhiQXvuAoeVzfKtvyoSmJgWi8jJF0AMFjlTCh3kwIv+X
         haarJdYqFvdWs3JzwZBovese0hmZb5eKO8olFoXh8krhzwPKD+22sHoW+zu2hHq6A9NA
         MqqElaJZeyXyqlV+mPCmIJrZIUwkj3WYL9YngExLzxBkl7s2k5aUT5/U2ONFWf+6Fgxz
         H6BSC0sjIx6bDb5Pj6Ud57QK3GH9iksxg0GSk9JyMOHZDAT69Yr6Y3XCYmpFM51CVwfA
         d3QmrhfH/PnJqSnM8PXxc+Q74T1PbSs8u2BiJlTg8wMRO+sUc6NcSkkymgP20aZ7b1JB
         v4mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lsG0/vZrFsbUfKMaszn0w2LlEErj8aBW/8Ir/pz3OGU=;
        b=BQ2+Dere5Cq65lhLLaQgH2rJ8LzlvBUZ+XSn/rk09qmnG/Pttv42Jj/mFeGlXq1s+i
         WSDllMxZt3yx2ui7GvWvmDPA966fZiHJAJxEqHQHVWfXxSmX/Cmbz2/Cbb73gy/SIOUf
         1k1Ab07kYY20VfsO646HEUZPdj3tLMKi8EKcV6HXMqaqeQkaTr/YuEL2vbb96pSbV3FV
         M8I5L94hU8EhsR5U9YJAp4ug/965RngfsbcrGCPxjAy9d7+Gf4VV4V0n+ZXteTCKunaM
         wVPJfY0Xsd96De8uMZhJy3KSoHua2RkRAqUwhrR1kjc43FLc92kFyUOR5LuTIR3RU6LR
         69DQ==
X-Gm-Message-State: AOAM533C3t+SIVq7D8PYQXDGtXPP6pxPkZV61yCu3Fmtc6tGpPtpMCTn
        3k5hkILza9O+ju7Vrq7n3bGVnQ==
X-Google-Smtp-Source: ABdhPJxC8b4XsFFiHjxlqHTC3hjSOcLyAEEBDq59JntLmlgh6Yq4M83KNcLLHHfgnTn8UXfVaA2mvw==
X-Received: by 2002:ac8:5048:: with SMTP id h8mr23325058qtm.81.1593573026817;
        Tue, 30 Jun 2020 20:10:26 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id r188sm4436866qkf.128.2020.06.30.20.10.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 20:10:26 -0700 (PDT)
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
Subject: [PATCH] drm/msm: handle for EPROBE_DEFER for of_icc_get
Date:   Tue, 30 Jun 2020 23:08:41 -0400
Message-Id: <20200701030842.24395-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Check for EPROBE_DEFER instead of silently not using icc if the msm driver
probes before the interconnect driver.

Only check for EPROBE_DEFER because of_icc_get can return other errors that
we want to ignore (ENODATA).

Remove the WARN_ON in msm_gpu_cleanup because INIT_LIST_HEAD won't have
been called on the list yet when going through the defer error path.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 17 ++++++++++++++---
 drivers/gpu/drm/msm/msm_gpu.c           |  2 --
 2 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 89673c7ed473..393c00425d68 100644
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
+		if (ret == -EPROBE_DEFER)
+			return ret;
+	}
 
 	gpu->ocmem_icc_path = of_icc_get(dev, "ocmem");
-	if (IS_ERR(gpu->ocmem_icc_path))
+	if (IS_ERR(gpu->ocmem_icc_path)) {
+		ret = PTR_ERR(gpu->ocmem_icc_path);
 		gpu->ocmem_icc_path = NULL;
+		if (ret == -EPROBE_DEFER)
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

