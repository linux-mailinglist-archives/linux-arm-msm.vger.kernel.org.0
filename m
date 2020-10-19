Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5095829280C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Oct 2020 15:19:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728090AbgJSNTf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Oct 2020 09:19:35 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:37398 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726931AbgJSNTf (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Oct 2020 09:19:35 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1603113573; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=MYMyYtu3V2y4AMRiM+2FTNZJzA9IPSnr22pa2xfbQRE=; b=tPO16o51EN5rGQKFXKuxzyv7vu9vr6rRmxCPHZFJAfG4WEuYN+Pa/3Ulkn1nT4t8vfTuvjFn
 fAzbjG/lg29PEN/GwugAouPxlEIK9+EyLtWR4FhYrH8LcgEP8TmtFsBBKJhWP/VQS4J2/Xzr
 Dj6ehk1Nx1LwiEoWGOFrF2INJPM=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 5f8d92654f8cc67c31b6d153 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 19 Oct 2020 13:19:33
 GMT
Sender: akhilpo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8A5C4C433F1; Mon, 19 Oct 2020 13:19:32 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from akhilpo-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akhilpo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9B808C43385;
        Mon, 19 Oct 2020 13:19:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9B808C43385
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=akhilpo@codeaurora.org
From:   Akhil P Oommen <akhilpo@codeaurora.org>
To:     freedreno@lists.freedesktop.org
Cc:     dri-devel@freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, jcrouse@codeaurora.org,
        mka@chromium.org, robdclark@gmail.com, dianders@chromium.org
Subject: [PATCH 2/2] drm/msm: Fix duplicate gpu node in icc summary
Date:   Mon, 19 Oct 2020 18:49:18 +0530
Message-Id: <1603113558-23330-2-git-send-email-akhilpo@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1603113558-23330-1-git-send-email-akhilpo@codeaurora.org>
References: <1603113558-23330-1-git-send-email-akhilpo@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On targets with a6xx gpu, there is a duplicate gpu icc node listed in
the interconnect summary. On these targets, calling
dev_pm_opp_of_add_table() api initializes the icc nodes for gpu indirectly.
So we should avoid using of_icc_get() api in the common probe path. To fix
this, we can move of_icc_get() to target specific code where it is
required.

Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
---
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c   | 21 +++++++++++++++++++--
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c   | 20 ++++++++++++++++++--
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 29 +----------------------------
 3 files changed, 38 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
index f29c77d..93da668 100644
--- a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
@@ -519,6 +519,8 @@ struct msm_gpu *a3xx_gpu_init(struct drm_device *dev)
 	struct msm_gpu *gpu;
 	struct msm_drm_private *priv = dev->dev_private;
 	struct platform_device *pdev = priv->gpu_pdev;
+	struct icc_path *ocmem_icc_path;
+	struct icc_path *icc_path;
 	int ret;
 
 	if (!pdev) {
@@ -566,13 +568,28 @@ struct msm_gpu *a3xx_gpu_init(struct drm_device *dev)
 		goto fail;
 	}
 
+	icc_path = devm_of_icc_get(&pdev->dev, "gfx-mem");
+	ret = IS_ERR(icc_path);
+	if (ret)
+		goto fail;
+
+	ocmem_icc_path = devm_of_icc_get(&pdev->dev, "ocmem");
+	ret = IS_ERR(ocmem_icc_path);
+	if (ret) {
+		/* allow -ENODATA, ocmem icc is optional */
+		if (ret != -ENODATA)
+			goto fail;
+		ocmem_icc_path = NULL;
+	}
+
+
 	/*
 	 * Set the ICC path to maximum speed for now by multiplying the fastest
 	 * frequency by the bus width (8). We'll want to scale this later on to
 	 * improve battery life.
 	 */
-	icc_set_bw(gpu->icc_path, 0, Bps_to_icc(gpu->fast_rate) * 8);
-	icc_set_bw(gpu->ocmem_icc_path, 0, Bps_to_icc(gpu->fast_rate) * 8);
+	icc_set_bw(icc_path, 0, Bps_to_icc(gpu->fast_rate) * 8);
+	icc_set_bw(ocmem_icc_path, 0, Bps_to_icc(gpu->fast_rate) * 8);
 
 	return gpu;
 
diff --git a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
index 2b93b33..c0be3a0 100644
--- a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
@@ -648,6 +648,8 @@ struct msm_gpu *a4xx_gpu_init(struct drm_device *dev)
 	struct msm_gpu *gpu;
 	struct msm_drm_private *priv = dev->dev_private;
 	struct platform_device *pdev = priv->gpu_pdev;
+	struct icc_path *ocmem_icc_path;
+	struct icc_path *icc_path;
 	int ret;
 
 	if (!pdev) {
@@ -694,13 +696,27 @@ struct msm_gpu *a4xx_gpu_init(struct drm_device *dev)
 		goto fail;
 	}
 
+	icc_path = devm_of_icc_get(&pdev->dev, "gfx-mem");
+	ret = IS_ERR(icc_path);
+	if (ret)
+		goto fail;
+
+	ocmem_icc_path = devm_of_icc_get(&pdev->dev, "ocmem");
+	ret = IS_ERR(ocmem_icc_path);
+	if (ret) {
+		/* allow -ENODATA, ocmem icc is optional */
+		if (ret != -ENODATA)
+			goto fail;
+		ocmem_icc_path = NULL;
+	}
+
 	/*
 	 * Set the ICC path to maximum speed for now by multiplying the fastest
 	 * frequency by the bus width (8). We'll want to scale this later on to
 	 * improve battery life.
 	 */
-	icc_set_bw(gpu->icc_path, 0, Bps_to_icc(gpu->fast_rate) * 8);
-	icc_set_bw(gpu->ocmem_icc_path, 0, Bps_to_icc(gpu->fast_rate) * 8);
+	icc_set_bw(icc_path, 0, Bps_to_icc(gpu->fast_rate) * 8);
+	icc_set_bw(ocmem_icc_path, 0, Bps_to_icc(gpu->fast_rate) * 8);
 
 	return gpu;
 
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index fd8f491..6e3b820 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -920,35 +920,8 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 
 	ret = msm_gpu_init(drm, pdev, &adreno_gpu->base, &funcs->base,
 			adreno_gpu->info->name, &adreno_gpu_config);
-	if (ret)
-		return ret;
-
-	/*
-	 * The legacy case, before "interconnect-names", only has a
-	 * single interconnect path which is equivalent to "gfx-mem"
-	 */
-	if (!of_find_property(dev->of_node, "interconnect-names", NULL)) {
-		gpu->icc_path = of_icc_get(dev, NULL);
-	} else {
-		gpu->icc_path = of_icc_get(dev, "gfx-mem");
-		gpu->ocmem_icc_path = of_icc_get(dev, "ocmem");
-	}
 
-	if (IS_ERR(gpu->icc_path)) {
-		ret = PTR_ERR(gpu->icc_path);
-		gpu->icc_path = NULL;
-		return ret;
-	}
-
-	if (IS_ERR(gpu->ocmem_icc_path)) {
-		ret = PTR_ERR(gpu->ocmem_icc_path);
-		gpu->ocmem_icc_path = NULL;
-		/* allow -ENODATA, ocmem icc is optional */
-		if (ret != -ENODATA)
-			return ret;
-	}
-
-	return 0;
+	return ret;
 }
 
 void adreno_gpu_cleanup(struct adreno_gpu *adreno_gpu)
-- 
2.7.4

