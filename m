Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF0877BE89A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Oct 2023 19:48:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377065AbjJIRsr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Oct 2023 13:48:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377059AbjJIRsq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Oct 2023 13:48:46 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7162F9D
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Oct 2023 10:48:44 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-503065c4b25so6366002e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Oct 2023 10:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696873723; x=1697478523; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i/chvZNkOAPCM4yUDgRtU7R4U+Xkrk2E5nKrKDhgris=;
        b=q4HrSb57C0RbAiF7dWSRudwplAFZXEdFoGMLHgyyObq20/XmoviHyAz8v5r475Ax3B
         w2WKpdMW50wGL55SHrF0tnoKR4bnEAYE3GI0ezGDFmwPEdaiAmF7aiv4IZdubeMw5Aag
         Q6K1JYCLcFoU2UiYLiq1UOMb+THNmlUU2UTR5YwKDjnDNrktNMU4zrxQ7oOtwseq46B4
         azhmxjTFyPU47Vs+cJtYY49F4QRg2l266WirTOs/fmzJn4IKMlhOFIAN3b9mh+ErJZO0
         Q1frsyJbYUgSOvV5E6LXYMTwDXSjr4wYYsAOQU3DFHVykTN3LG12UyBqijXFFpAZVff5
         KsCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696873723; x=1697478523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i/chvZNkOAPCM4yUDgRtU7R4U+Xkrk2E5nKrKDhgris=;
        b=tK4vE2fdaBcySrgFUAfRjDI4Q9ALCAqcG51+ZanF5cTM3W7Sy1o+Vlidh1bgrZ+lMF
         5ZgMIAmQy7/Gq6nU0uP9BpCSh5c0+MKlww/w1VoxOe2DP6NLSDYrO7FV/NsYFEqjCNsC
         J0B2GHl3g+OpFPQSYZmecmykM5uMv6IPvjAgocWat/q9JzbhD5++Nt3xNvTRilWq4KDb
         dDVcePUKbvNRIS2UL4KQh9rwrLKdYtbVBRkBdU88Haqn3jymGIxnKfXwO5ZMD0fH6r+D
         3qEGoqtBHIkPLUmWrWh4GL+VdCbA/pRlcsvslYbllBWDODEDHggvcvsJ96ZNkrINaX+9
         KY5A==
X-Gm-Message-State: AOJu0YxpHX5B0gAenew2gAu6VrnCMMaBkq3fwo1TBgtiGQ13se4K6pfK
        yo1Hea4+J7EX485fJNOUFCevhQ==
X-Google-Smtp-Source: AGHT+IGbrnH3yesbV/VzvO4GbUuJ8UBZAlHmq0Fkq+JpJvbFTplTvZ9bTDTRA43WqOxhbloSrgcO4g==
X-Received: by 2002:a05:6512:39d0:b0:504:51e9:89a2 with SMTP id k16-20020a05651239d000b0050451e989a2mr20666577lfu.32.1696873722805;
        Mon, 09 Oct 2023 10:48:42 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id m23-20020ac24257000000b0050420eff124sm1495927lfl.152.2023.10.09.10.48.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 10:48:42 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v5 2/4] drm/msm/dpu: move resource allocation to the _probe function
Date:   Mon,  9 Oct 2023 20:48:38 +0300
Message-Id: <20231009174840.2726861-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009174840.2726861-1-dmitry.baryshkov@linaro.org>
References: <20231009174840.2726861-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

To let the probe function bail early if any of the resources is
unavailable, move resource allocattion from kms_init directly to the
probe callback. While we are at it, replace irq_of_parse_and_map() with
platform_get_irq().

This also drops devm_iounmap() calls. It is too early to have them
_dpu_kms_hw_destroy() (or it will break if for some reason DPU device is
rebound into the composite device) and it doesn't make sense to have
them in dpu_dev_remove (as everything will be torn down by the devres
anyway after the device is unbound from the driver).

Reviewed-by: Rob Clark <robdclark@gmail.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 133 +++++++++++-------------
 1 file changed, 61 insertions(+), 72 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 41bd57597381..12d604b6b7e0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -389,8 +389,7 @@ static int dpu_kms_parse_data_bus_icc_path(struct dpu_kms *dpu_kms)
 {
 	struct icc_path *path0;
 	struct icc_path *path1;
-	struct drm_device *dev = dpu_kms->dev;
-	struct device *dpu_dev = dev->dev;
+	struct device *dpu_dev = &dpu_kms->pdev->dev;
 
 	path0 = msm_icc_get(dpu_dev, "mdp0-mem");
 	path1 = msm_icc_get(dpu_dev, "mdp1-mem");
@@ -829,21 +828,9 @@ static void _dpu_kms_hw_destroy(struct dpu_kms *dpu_kms)
 
 	dpu_kms->catalog = NULL;
 
-	if (dpu_kms->vbif[VBIF_NRT])
-		devm_iounmap(&dpu_kms->pdev->dev, dpu_kms->vbif[VBIF_NRT]);
-	dpu_kms->vbif[VBIF_NRT] = NULL;
-
-	if (dpu_kms->vbif[VBIF_RT])
-		devm_iounmap(&dpu_kms->pdev->dev, dpu_kms->vbif[VBIF_RT]);
-	dpu_kms->vbif[VBIF_RT] = NULL;
-
 	if (dpu_kms->hw_mdp)
 		dpu_hw_mdp_destroy(dpu_kms->hw_mdp);
 	dpu_kms->hw_mdp = NULL;
-
-	if (dpu_kms->mmio)
-		devm_iounmap(&dpu_kms->pdev->dev, dpu_kms->mmio);
-	dpu_kms->mmio = NULL;
 }
 
 static void dpu_kms_destroy(struct msm_kms *kms)
@@ -1079,30 +1066,6 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 
 	atomic_set(&dpu_kms->bandwidth_ref, 0);
 
-	dpu_kms->mmio = msm_ioremap(dpu_kms->pdev, "mdp");
-	if (IS_ERR(dpu_kms->mmio)) {
-		rc = PTR_ERR(dpu_kms->mmio);
-		DPU_ERROR("mdp register memory map failed: %d\n", rc);
-		dpu_kms->mmio = NULL;
-		goto error;
-	}
-	DRM_DEBUG("mapped dpu address space @%pK\n", dpu_kms->mmio);
-
-	dpu_kms->vbif[VBIF_RT] = msm_ioremap(dpu_kms->pdev, "vbif");
-	if (IS_ERR(dpu_kms->vbif[VBIF_RT])) {
-		rc = PTR_ERR(dpu_kms->vbif[VBIF_RT]);
-		DPU_ERROR("vbif register memory map failed: %d\n", rc);
-		dpu_kms->vbif[VBIF_RT] = NULL;
-		goto error;
-	}
-	dpu_kms->vbif[VBIF_NRT] = msm_ioremap_quiet(dpu_kms->pdev, "vbif_nrt");
-	if (IS_ERR(dpu_kms->vbif[VBIF_NRT])) {
-		dpu_kms->vbif[VBIF_NRT] = NULL;
-		DPU_DEBUG("VBIF NRT is not defined");
-	}
-
-	dpu_kms_parse_data_bus_icc_path(dpu_kms);
-
 	rc = pm_runtime_resume_and_get(&dpu_kms->pdev->dev);
 	if (rc < 0)
 		goto error;
@@ -1241,33 +1204,11 @@ static int dpu_kms_init(struct drm_device *ddev)
 	struct msm_drm_private *priv = ddev->dev_private;
 	struct device *dev = ddev->dev;
 	struct platform_device *pdev = to_platform_device(dev);
-	struct dpu_kms *dpu_kms;
-	int irq;
+	struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
 	struct dev_pm_opp *opp;
 	int ret = 0;
 	unsigned long max_freq = ULONG_MAX;
 
-	dpu_kms = devm_kzalloc(&pdev->dev, sizeof(*dpu_kms), GFP_KERNEL);
-	if (!dpu_kms)
-		return -ENOMEM;
-
-	ret = devm_pm_opp_set_clkname(dev, "core");
-	if (ret)
-		return ret;
-	/* OPP table is optional */
-	ret = devm_pm_opp_of_add_table(dev);
-	if (ret && ret != -ENODEV) {
-		dev_err(dev, "invalid OPP table in device tree\n");
-		return ret;
-	}
-
-	ret = devm_clk_bulk_get_all(&pdev->dev, &dpu_kms->clocks);
-	if (ret < 0) {
-		DPU_ERROR("failed to parse clocks, ret=%d\n", ret);
-		return ret;
-	}
-	dpu_kms->num_clocks = ret;
-
 	opp = dev_pm_opp_find_freq_floor(dev, &max_freq);
 	if (!IS_ERR(opp))
 		dev_pm_opp_put(opp);
@@ -1280,26 +1221,74 @@ static int dpu_kms_init(struct drm_device *ddev)
 		return ret;
 	}
 	dpu_kms->dev = ddev;
-	dpu_kms->pdev = pdev;
 
 	pm_runtime_enable(&pdev->dev);
 	dpu_kms->rpm_enabled = true;
 
-	priv->kms = &dpu_kms->base;
-
-	irq = irq_of_parse_and_map(dpu_kms->pdev->dev.of_node, 0);
-	if (!irq) {
-		DPU_ERROR("failed to get irq\n");
-		return -EINVAL;
-	}
-	dpu_kms->base.irq = irq;
-
 	return 0;
 }
 
 static int dpu_dev_probe(struct platform_device *pdev)
 {
-	return msm_drv_probe(&pdev->dev, dpu_kms_init, NULL);
+	struct device *dev = &pdev->dev;
+	struct dpu_kms *dpu_kms;
+	int irq;
+	int ret = 0;
+
+	dpu_kms = devm_kzalloc(dev, sizeof(*dpu_kms), GFP_KERNEL);
+	if (!dpu_kms)
+		return -ENOMEM;
+
+	dpu_kms->pdev = pdev;
+
+	ret = devm_pm_opp_set_clkname(dev, "core");
+	if (ret)
+		return ret;
+	/* OPP table is optional */
+	ret = devm_pm_opp_of_add_table(dev);
+	if (ret && ret != -ENODEV)
+		return dev_err_probe(dev, ret, "invalid OPP table in device tree\n");
+
+	ret = devm_clk_bulk_get_all(&pdev->dev, &dpu_kms->clocks);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to parse clocks\n");
+
+	dpu_kms->num_clocks = ret;
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return dev_err_probe(dev, irq, "failed to get irq\n");
+
+	dpu_kms->base.irq = irq;
+
+	dpu_kms->mmio = msm_ioremap(pdev, "mdp");
+	if (IS_ERR(dpu_kms->mmio)) {
+		ret = PTR_ERR(dpu_kms->mmio);
+		DPU_ERROR("mdp register memory map failed: %d\n", ret);
+		dpu_kms->mmio = NULL;
+		return ret;
+	}
+	DRM_DEBUG("mapped dpu address space @%pK\n", dpu_kms->mmio);
+
+	dpu_kms->vbif[VBIF_RT] = msm_ioremap(pdev, "vbif");
+	if (IS_ERR(dpu_kms->vbif[VBIF_RT])) {
+		ret = PTR_ERR(dpu_kms->vbif[VBIF_RT]);
+		DPU_ERROR("vbif register memory map failed: %d\n", ret);
+		dpu_kms->vbif[VBIF_RT] = NULL;
+		return ret;
+	}
+
+	dpu_kms->vbif[VBIF_NRT] = msm_ioremap_quiet(pdev, "vbif_nrt");
+	if (IS_ERR(dpu_kms->vbif[VBIF_NRT])) {
+		dpu_kms->vbif[VBIF_NRT] = NULL;
+		DPU_DEBUG("VBIF NRT is not defined");
+	}
+
+	ret = dpu_kms_parse_data_bus_icc_path(dpu_kms);
+	if (ret)
+		return ret;
+
+	return msm_drv_probe(&pdev->dev, dpu_kms_init, &dpu_kms->base);
 }
 
 static void dpu_dev_remove(struct platform_device *pdev)
-- 
2.39.2

