Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9758921E346
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2020 00:55:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726698AbgGMWzV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Jul 2020 18:55:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726491AbgGMWzT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Jul 2020 18:55:19 -0400
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9DE1C08C5DE
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2020 15:55:18 -0700 (PDT)
Received: by mail-qt1-x843.google.com with SMTP id u12so11371825qth.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2020 15:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EA0KSfJQZURE1Ys7r5juFF1n2voOYvfmlWuF3uQoZcA=;
        b=WN/6PrrOkWgHD/XkJ5d3RKiuXPkFohDHVNhXaqywQCjxFgAxXzqAz3YHBa4WVenQxz
         7CEsgit0imPuLaZz/emY//2xNpq9Ww/x7OsjtgB9QtbNWADhkK4PnRjR+nRs2bO4V7S5
         CeRfShIwxdOdjQI67lIInRRdshpVVggaji6wq/9YmctPDpxILvPXmD0dorUu/Z/1l5cC
         uk1ggkMYjrk+2KAaRREg1h83WpQS8w34M0TUMN3grVBrOfWP93s8/TxQjM2/CRNEeDW4
         LEYvsWSaYVKIJxGplhvGYZVSGwp19IMAqY16wplr87kTwzzpZkdWIQeWYysqtvaQi0IW
         dgHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EA0KSfJQZURE1Ys7r5juFF1n2voOYvfmlWuF3uQoZcA=;
        b=qeLYhAKCu2jNo6HGJrTmfS1/84/lDVa3DLB/vCYkwOKw8jiCIR+tdFK/TcTykqZTC5
         anQ5Hf/VT0se968o9FZB/WCqQibPlLNIsOgQSGOAegN4aD2mq7XA1BoqLjEuwMvDgui8
         m5LNP0UEuFgEKc0wsubG4xMLJjCRi0Ru6+2wVen0dgUJa0vIpnNCkKrCwBq3EI+USU/1
         ghLPRqFfnwdgTiijbHhHINNEaE5Q/CC7Ek1UCcgD64Zd7yf3+eR70MMYgt+Oj6eaxSeH
         LMzVtJRDL9rpk4EZgFOOXArBx25wa/sDKLnURAYEFYbUfV57pDZvFmbg9olp5RzNfVqS
         hjTQ==
X-Gm-Message-State: AOAM5337sazdmwRsu/37aFF6R+1ZGJ0USJds22FL+X7Q2C6SiNXqDmvE
        7AO/RmJsUcigoXk9JF778/QLlA==
X-Google-Smtp-Source: ABdhPJw9KFSKbMVJuPkDYHaYXsj7EXYMpGbgA1qHNqzp47A1TUguSaTAwGSsZIFfX4bPWqtG6t71NQ==
X-Received: by 2002:ac8:4e8d:: with SMTP id 13mr1711583qtp.339.1594680917905;
        Mon, 13 Jul 2020 15:55:17 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id f54sm22405752qte.76.2020.07.13.15.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 15:55:17 -0700 (PDT)
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
Subject: [PATCH v4 3/3] drm/msm: handle for EPROBE_DEFER for of_icc_get
Date:   Mon, 13 Jul 2020 18:53:42 -0400
Message-Id: <20200713225345.20556-4-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200713225345.20556-1-jonathan@marek.ca>
References: <20200713225345.20556-1-jonathan@marek.ca>
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

Because msm_gpu_cleanup assumes msm_gpu_init has been called, the icc path
init needs to be after msm_gpu_init for the error path to work.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 65 +++++++++++++++----------
 1 file changed, 38 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index ad64d4b7e8d7..3f1ecc1de965 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -895,7 +895,7 @@ static int adreno_get_legacy_pwrlevels(struct device *dev)
 	return 0;
 }
 
-static int adreno_get_pwrlevels(struct device *dev,
+static void adreno_get_pwrlevels(struct device *dev,
 		struct msm_gpu *gpu)
 {
 	unsigned long freq = ULONG_MAX;
@@ -930,24 +930,6 @@ static int adreno_get_pwrlevels(struct device *dev,
 	}
 
 	DBG("fast_rate=%u, slow_rate=27000000", gpu->fast_rate);
-
-	/* Check for an interconnect path for the bus */
-	gpu->icc_path = of_icc_get(dev, "gfx-mem");
-	if (!gpu->icc_path) {
-		/*
-		 * Keep compatbility with device trees that don't have an
-		 * interconnect-names property.
-		 */
-		gpu->icc_path = of_icc_get(dev, NULL);
-	}
-	if (IS_ERR(gpu->icc_path))
-		gpu->icc_path = NULL;
-
-	gpu->ocmem_icc_path = of_icc_get(dev, "ocmem");
-	if (IS_ERR(gpu->ocmem_icc_path))
-		gpu->ocmem_icc_path = NULL;
-
-	return 0;
 }
 
 int adreno_gpu_ocmem_init(struct device *dev, struct adreno_gpu *adreno_gpu,
@@ -993,9 +975,11 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 		struct adreno_gpu *adreno_gpu,
 		const struct adreno_gpu_funcs *funcs, int nr_rings)
 {
-	struct adreno_platform_config *config = pdev->dev.platform_data;
+	struct device *dev = &pdev->dev;
+	struct adreno_platform_config *config = dev->platform_data;
 	struct msm_gpu_config adreno_gpu_config  = { 0 };
 	struct msm_gpu *gpu = &adreno_gpu->base;
+	int ret;
 
 	adreno_gpu->funcs = funcs;
 	adreno_gpu->info = adreno_info(config->rev);
@@ -1007,15 +991,42 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 
 	adreno_gpu_config.nr_rings = nr_rings;
 
-	adreno_get_pwrlevels(&pdev->dev, gpu);
+	adreno_get_pwrlevels(dev, gpu);
 
-	pm_runtime_set_autosuspend_delay(&pdev->dev,
+	pm_runtime_set_autosuspend_delay(dev,
 		adreno_gpu->info->inactive_period);
-	pm_runtime_use_autosuspend(&pdev->dev);
-	pm_runtime_enable(&pdev->dev);
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_enable(dev);
 
-	return msm_gpu_init(drm, pdev, &adreno_gpu->base, &funcs->base,
+	ret = msm_gpu_init(drm, pdev, &adreno_gpu->base, &funcs->base,
 			adreno_gpu->info->name, &adreno_gpu_config);
+	if (ret)
+		return ret;
+
+	/* Check for an interconnect path for the bus */
+	gpu->icc_path = of_icc_get(dev, "gfx-mem");
+	if (!gpu->icc_path) {
+		/*
+		 * Keep compatbility with device trees that don't have an
+		 * interconnect-names property.
+		 */
+		gpu->icc_path = of_icc_get(dev, NULL);
+	}
+	if (IS_ERR(gpu->icc_path)) {
+		ret = PTR_ERR(gpu->icc_path);
+		gpu->icc_path = NULL;
+		return ret;
+	}
+
+	gpu->ocmem_icc_path = of_icc_get(dev, "ocmem");
+	if (IS_ERR(gpu->ocmem_icc_path)) {
+		ret = PTR_ERR(gpu->ocmem_icc_path);
+		gpu->ocmem_icc_path = NULL;
+		/* allow -ENODATA, ocmem icc is optional */
+		if (ret != -ENODATA)
+			return ret;
+	}
+	return 0;
 }
 
 void adreno_gpu_cleanup(struct adreno_gpu *adreno_gpu)
@@ -1029,8 +1040,8 @@ void adreno_gpu_cleanup(struct adreno_gpu *adreno_gpu)
 
 	pm_runtime_disable(&priv->gpu_pdev->dev);
 
+	msm_gpu_cleanup(&adreno_gpu->base);
+
 	icc_put(gpu->icc_path);
 	icc_put(gpu->ocmem_icc_path);
-
-	msm_gpu_cleanup(&adreno_gpu->base);
 }
-- 
2.26.1

