Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BB7D46DAA3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Dec 2021 19:01:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238485AbhLHSEh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Dec 2021 13:04:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238491AbhLHSEh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Dec 2021 13:04:37 -0500
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19DB2C0617A1
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Dec 2021 10:01:05 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id a37so4012338ljq.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Dec 2021 10:01:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qTH8O8QBjGMYTRks1HZ8E9DwvB9RCtAEN9KHeb96f3s=;
        b=mm7oI1gLDmoeg/oSOLDM3oHuj2OJ27NSPNhpKWHhYRI4BaHn8nDfVf86E3eXwT+fyc
         /oRGgQqbAJpRTBHTlM4aXv3tq1bm8D2g96Qd5SPmhvYEy081dn8daexc7jJ6tJxt2r6F
         15nTpMOeiuN2zLZsVcOrOgMdTP4YRUTl0meLJLlI6ttx5tSvDKbeaP3GfaK9yrNKRjt3
         Ai8Q3SliRz+6eLOmqaxp7LeHMifzCfJ8LgHmLZW9S60FE9+Eg53ZM0LU+dCDqJK+KAxx
         1EpDZzUWR6+pcDJ4Z/gwt7LaMLLU0necjmb5W9IYr6o+KsQwASQ8sPPW+P/bTmY+/Nxt
         xIZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qTH8O8QBjGMYTRks1HZ8E9DwvB9RCtAEN9KHeb96f3s=;
        b=wy8ldDOlD5qDbx5nSqrqCnzi71cNQHFahOkq0Z/+ZKfsOfuOqqveX44aqVrdSyGIF0
         oyxWt2n44LCEQktB+mNZK4qcQfMmoNo7M/Oc7CyylGEJ7IzcgVRvUevasloEooj6Hr4H
         Le5I2vnZL5ldUlEpiI53GiCSKKL2jDkb8TTJgPKdtAn1C13JpRt4z3sBA+nZxhSwS4C/
         TS95V983NN4+PeXBUE1WlFZLNG3m/54x6CN5AP+yBbmvyOWqwPN5D93Izfmyn512yhBQ
         DmKlTYFhx4q+vinscdgxtjsYyjbPMvF3fum0TNWLnSpTwhJNU5Gi480KQ2iqDI/tKVN3
         UjuQ==
X-Gm-Message-State: AOAM530Svq+0SBkpH3ToMs2yVrXfRy4KlYt6NQaLwn2EWkYFHYnLZyjD
        EX1OUGtPd6nV1GhNLsOmVot1Mw==
X-Google-Smtp-Source: ABdhPJwxsC2cFDfX/aU3cjJlqdrrprlVETWd3KVWbw96ZPGp+OGwjrK8hcqCO6OLzA9muo1HSVv2Mg==
X-Received: by 2002:a2e:141e:: with SMTP id u30mr982368ljd.434.1638986463239;
        Wed, 08 Dec 2021 10:01:03 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f17sm315171lfk.145.2021.12.08.10.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 10:01:02 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm: drop dbgname argument from msm_ioremap*()
Date:   Wed,  8 Dec 2021 21:01:01 +0300
Message-Id: <20211208180101.1337300-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

msm_ioremap() functions take additional argument dbgname used to output
single debug line telling IO range. Drop that extra argument, use
resource name instead.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c     |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c   |  8 ++++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c  |  2 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c  |  2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c  |  2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_mdss.c |  4 ++--
 drivers/gpu/drm/msm/dsi/dsi_host.c        |  2 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c     |  8 ++++----
 drivers/gpu/drm/msm/hdmi/hdmi.c           |  5 ++---
 drivers/gpu/drm/msm/hdmi/hdmi_phy.c       |  2 +-
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c  |  7 +++----
 drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c  |  2 +-
 drivers/gpu/drm/msm/msm_drv.c             | 18 ++++++++----------
 drivers/gpu/drm/msm/msm_drv.h             |  8 +++-----
 drivers/gpu/drm/msm/msm_gpu.c             |  2 +-
 15 files changed, 34 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 51b83776951b..5750a3af126d 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1506,7 +1506,7 @@ static void a6xx_llc_slices_init(struct platform_device *pdev,
 	if (a6xx_gpu->have_mmu500)
 		a6xx_gpu->llc_mmio = NULL;
 	else
-		a6xx_gpu->llc_mmio = msm_ioremap(pdev, "cx_mem", "gpu_cx");
+		a6xx_gpu->llc_mmio = msm_ioremap(pdev, "cx_mem");
 
 	a6xx_gpu->llc_slice = llcc_slice_getd(LLCC_GPU);
 	a6xx_gpu->htw_llc_slice = llcc_slice_getd(LLCC_GPUHTW);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 2bd258eaf334..f86419cb2b4b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -959,7 +959,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 
 	atomic_set(&dpu_kms->bandwidth_ref, 0);
 
-	dpu_kms->mmio = msm_ioremap(dpu_kms->pdev, "mdp", "mdp");
+	dpu_kms->mmio = msm_ioremap(dpu_kms->pdev, "mdp");
 	if (IS_ERR(dpu_kms->mmio)) {
 		rc = PTR_ERR(dpu_kms->mmio);
 		DPU_ERROR("mdp register memory map failed: %d\n", rc);
@@ -968,20 +968,20 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 	}
 	DRM_DEBUG("mapped dpu address space @%pK\n", dpu_kms->mmio);
 
-	dpu_kms->vbif[VBIF_RT] = msm_ioremap(dpu_kms->pdev, "vbif", "vbif");
+	dpu_kms->vbif[VBIF_RT] = msm_ioremap(dpu_kms->pdev, "vbif");
 	if (IS_ERR(dpu_kms->vbif[VBIF_RT])) {
 		rc = PTR_ERR(dpu_kms->vbif[VBIF_RT]);
 		DPU_ERROR("vbif register memory map failed: %d\n", rc);
 		dpu_kms->vbif[VBIF_RT] = NULL;
 		goto error;
 	}
-	dpu_kms->vbif[VBIF_NRT] = msm_ioremap_quiet(dpu_kms->pdev, "vbif_nrt", "vbif_nrt");
+	dpu_kms->vbif[VBIF_NRT] = msm_ioremap_quiet(dpu_kms->pdev, "vbif_nrt");
 	if (IS_ERR(dpu_kms->vbif[VBIF_NRT])) {
 		dpu_kms->vbif[VBIF_NRT] = NULL;
 		DPU_DEBUG("VBIF NRT is not defined");
 	}
 
-	dpu_kms->reg_dma = msm_ioremap_quiet(dpu_kms->pdev, "regdma", "regdma");
+	dpu_kms->reg_dma = msm_ioremap_quiet(dpu_kms->pdev, "regdma");
 	if (IS_ERR(dpu_kms->reg_dma)) {
 		dpu_kms->reg_dma = NULL;
 		DPU_DEBUG("REG_DMA is not defined");
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
index 131c1f1a869c..5bdb1504035c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
@@ -222,7 +222,7 @@ int dpu_mdss_init(struct platform_device *pdev)
 	if (!dpu_mdss)
 		return -ENOMEM;
 
-	dpu_mdss->mmio = msm_ioremap(pdev, "mdss", "mdss");
+	dpu_mdss->mmio = msm_ioremap(pdev, "mdss");
 	if (IS_ERR(dpu_mdss->mmio))
 		return PTR_ERR(dpu_mdss->mmio);
 
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index 5a33bb148e9e..3cf476c55158 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -418,7 +418,7 @@ struct msm_kms *mdp4_kms_init(struct drm_device *dev)
 
 	mdp4_kms->dev = dev;
 
-	mdp4_kms->mmio = msm_ioremap(pdev, NULL, "MDP4");
+	mdp4_kms->mmio = msm_ioremap(pdev, NULL);
 	if (IS_ERR(mdp4_kms->mmio)) {
 		ret = PTR_ERR(mdp4_kms->mmio);
 		goto fail;
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 12a5f81e402b..81bd434980cf 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -827,7 +827,7 @@ static int mdp5_init(struct platform_device *pdev, struct drm_device *dev)
 	if (ret)
 		goto fail;
 
-	mdp5_kms->mmio = msm_ioremap(pdev, "mdp_phys", "MDP5");
+	mdp5_kms->mmio = msm_ioremap(pdev, "mdp_phys");
 	if (IS_ERR(mdp5_kms->mmio)) {
 		ret = PTR_ERR(mdp5_kms->mmio);
 		goto fail;
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_mdss.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_mdss.c
index b3f79c2277e9..049c6784a531 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_mdss.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_mdss.c
@@ -210,13 +210,13 @@ int mdp5_mdss_init(struct platform_device *pdev)
 
 	mdp5_mdss->base.dev = &pdev->dev;
 
-	mdp5_mdss->mmio = msm_ioremap(pdev, "mdss_phys", "MDSS");
+	mdp5_mdss->mmio = msm_ioremap(pdev, "mdss_phys");
 	if (IS_ERR(mdp5_mdss->mmio)) {
 		ret = PTR_ERR(mdp5_mdss->mmio);
 		goto fail;
 	}
 
-	mdp5_mdss->vbif = msm_ioremap(pdev, "vbif_phys", "VBIF");
+	mdp5_mdss->vbif = msm_ioremap(pdev, "vbif_phys");
 	if (IS_ERR(mdp5_mdss->vbif)) {
 		ret = PTR_ERR(mdp5_mdss->vbif);
 		goto fail;
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 5b4bb722f750..4e2dfc53ca28 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1813,7 +1813,7 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
 		goto fail;
 	}
 
-	msm_host->ctrl_base = msm_ioremap_size(pdev, "dsi_ctrl", "DSI CTRL", &msm_host->ctrl_size);
+	msm_host->ctrl_base = msm_ioremap_size(pdev, "dsi_ctrl", &msm_host->ctrl_size);
 	if (IS_ERR(msm_host->ctrl_base)) {
 		pr_err("%s: unable to map Dsi ctrl base\n", __func__);
 		ret = PTR_ERR(msm_host->ctrl_base);
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index 0b2ae5c15240..6425b6c34f4c 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -709,14 +709,14 @@ static int dsi_phy_driver_probe(struct platform_device *pdev)
 	if (!of_property_read_u32(dev->of_node, "phy-type", &phy_type))
 		phy->cphy_mode = (phy_type == PHY_TYPE_CPHY);
 
-	phy->base = msm_ioremap_size(pdev, "dsi_phy", "DSI_PHY", &phy->base_size);
+	phy->base = msm_ioremap_size(pdev, "dsi_phy", &phy->base_size);
 	if (IS_ERR(phy->base)) {
 		DRM_DEV_ERROR(dev, "%s: failed to map phy base\n", __func__);
 		ret = -ENOMEM;
 		goto fail;
 	}
 
-	phy->pll_base = msm_ioremap_size(pdev, "dsi_pll", "DSI_PLL", &phy->pll_size);
+	phy->pll_base = msm_ioremap_size(pdev, "dsi_pll", &phy->pll_size);
 	if (IS_ERR(phy->pll_base)) {
 		DRM_DEV_ERROR(&pdev->dev, "%s: failed to map pll base\n", __func__);
 		ret = -ENOMEM;
@@ -724,7 +724,7 @@ static int dsi_phy_driver_probe(struct platform_device *pdev)
 	}
 
 	if (phy->cfg->has_phy_lane) {
-		phy->lane_base = msm_ioremap_size(pdev, "dsi_phy_lane", "DSI_PHY_LANE", &phy->lane_size);
+		phy->lane_base = msm_ioremap_size(pdev, "dsi_phy_lane", &phy->lane_size);
 		if (IS_ERR(phy->lane_base)) {
 			DRM_DEV_ERROR(&pdev->dev, "%s: failed to map phy lane base\n", __func__);
 			ret = -ENOMEM;
@@ -733,7 +733,7 @@ static int dsi_phy_driver_probe(struct platform_device *pdev)
 	}
 
 	if (phy->cfg->has_phy_regulator) {
-		phy->reg_base = msm_ioremap_size(pdev, "dsi_phy_regulator", "DSI_PHY_REG", &phy->reg_size);
+		phy->reg_base = msm_ioremap_size(pdev, "dsi_phy_regulator", &phy->reg_size);
 		if (IS_ERR(phy->reg_base)) {
 			DRM_DEV_ERROR(&pdev->dev, "%s: failed to map phy regulator base\n", __func__);
 			ret = -ENOMEM;
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 3acdeae25caf..3eb45cde0330 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -128,7 +128,7 @@ static struct hdmi *msm_hdmi_init(struct platform_device *pdev)
 	hdmi->config = config;
 	spin_lock_init(&hdmi->reg_lock);
 
-	hdmi->mmio = msm_ioremap(pdev, config->mmio_name, "HDMI");
+	hdmi->mmio = msm_ioremap(pdev, config->mmio_name);
 	if (IS_ERR(hdmi->mmio)) {
 		ret = PTR_ERR(hdmi->mmio);
 		goto fail;
@@ -139,8 +139,7 @@ static struct hdmi *msm_hdmi_init(struct platform_device *pdev)
 		config->mmio_name);
 	hdmi->mmio_phy_addr = res->start;
 
-	hdmi->qfprom_mmio = msm_ioremap(pdev,
-		config->qfprom_mmio_name, "HDMI_QFPROM");
+	hdmi->qfprom_mmio = msm_ioremap(pdev, config->qfprom_mmio_name);
 	if (IS_ERR(hdmi->qfprom_mmio)) {
 		DRM_DEV_INFO(&pdev->dev, "can't find qfprom resource\n");
 		hdmi->qfprom_mmio = NULL;
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
index 16b0e8836d27..9780107e1cc9 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
@@ -144,7 +144,7 @@ static int msm_hdmi_phy_probe(struct platform_device *pdev)
 	if (!phy->cfg)
 		return -ENODEV;
 
-	phy->mmio = msm_ioremap(pdev, "hdmi_phy", "HDMI_PHY");
+	phy->mmio = msm_ioremap(pdev, "hdmi_phy");
 	if (IS_ERR(phy->mmio)) {
 		DRM_DEV_ERROR(dev, "%s: failed to map phy base\n", __func__);
 		return -ENOMEM;
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c
index 99c7853353fd..b06d9d25a189 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c
@@ -716,19 +716,18 @@ int msm_hdmi_pll_8996_init(struct platform_device *pdev)
 
 	pll->pdev = pdev;
 
-	pll->mmio_qserdes_com = msm_ioremap(pdev, "hdmi_pll", "HDMI_PLL");
+	pll->mmio_qserdes_com = msm_ioremap(pdev, "hdmi_pll");
 	if (IS_ERR(pll->mmio_qserdes_com)) {
 		DRM_DEV_ERROR(dev, "failed to map pll base\n");
 		return -ENOMEM;
 	}
 
 	for (i = 0; i < HDMI_NUM_TX_CHANNEL; i++) {
-		char name[32], label[32];
+		char name[32];
 
 		snprintf(name, sizeof(name), "hdmi_tx_l%d", i);
-		snprintf(label, sizeof(label), "HDMI_TX_L%d", i);
 
-		pll->mmio_qserdes_tx[i] = msm_ioremap(pdev, name, label);
+		pll->mmio_qserdes_tx[i] = msm_ioremap(pdev, name);
 		if (IS_ERR(pll->mmio_qserdes_tx[i])) {
 			DRM_DEV_ERROR(dev, "failed to map pll base\n");
 			return -ENOMEM;
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c b/drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c
index 562dfac67792..be4b0b67e797 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c
@@ -434,7 +434,7 @@ int msm_hdmi_pll_8960_init(struct platform_device *pdev)
 	if (!pll)
 		return -ENOMEM;
 
-	pll->mmio = msm_ioremap(pdev, "hdmi_pll", "HDMI_PLL");
+	pll->mmio = msm_ioremap(pdev, "hdmi_pll");
 	if (IS_ERR(pll->mmio)) {
 		DRM_DEV_ERROR(dev, "failed to map pll base\n");
 		return -ENOMEM;
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index ad35a5d94053..d593c5d7dbc7 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -124,7 +124,7 @@ struct clk *msm_clk_get(struct platform_device *pdev, const char *name)
 }
 
 static void __iomem *_msm_ioremap(struct platform_device *pdev, const char *name,
-				  const char *dbgname, bool quiet, phys_addr_t *psize)
+				  bool quiet, phys_addr_t *psize)
 {
 	struct resource *res;
 	unsigned long size;
@@ -151,7 +151,7 @@ static void __iomem *_msm_ioremap(struct platform_device *pdev, const char *name
 	}
 
 	if (reglog)
-		printk(KERN_DEBUG "IO:region %s %p %08lx\n", dbgname, ptr, size);
+		printk(KERN_DEBUG "IO:region %s %p %08lx\n", name, ptr, size);
 
 	if (psize)
 		*psize = size;
@@ -159,22 +159,20 @@ static void __iomem *_msm_ioremap(struct platform_device *pdev, const char *name
 	return ptr;
 }
 
-void __iomem *msm_ioremap(struct platform_device *pdev, const char *name,
-			  const char *dbgname)
+void __iomem *msm_ioremap(struct platform_device *pdev, const char *name)
 {
-	return _msm_ioremap(pdev, name, dbgname, false, NULL);
+	return _msm_ioremap(pdev, name, false, NULL);
 }
 
-void __iomem *msm_ioremap_quiet(struct platform_device *pdev, const char *name,
-				const char *dbgname)
+void __iomem *msm_ioremap_quiet(struct platform_device *pdev, const char *name)
 {
-	return _msm_ioremap(pdev, name, dbgname, true, NULL);
+	return _msm_ioremap(pdev, name, true, NULL);
 }
 
 void __iomem *msm_ioremap_size(struct platform_device *pdev, const char *name,
-			  const char *dbgname, phys_addr_t *psize)
+			  phys_addr_t *psize)
 {
-	return _msm_ioremap(pdev, name, dbgname, false, psize);
+	return _msm_ioremap(pdev, name, false, psize);
 }
 
 void msm_writel(u32 data, void __iomem *addr)
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index d7574e6bd4e4..56d1242efcc1 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -480,12 +480,10 @@ struct clk *msm_clk_get(struct platform_device *pdev, const char *name);
 
 struct clk *msm_clk_bulk_get_clock(struct clk_bulk_data *bulk, int count,
 	const char *name);
-void __iomem *msm_ioremap(struct platform_device *pdev, const char *name,
-		const char *dbgname);
+void __iomem *msm_ioremap(struct platform_device *pdev, const char *name);
 void __iomem *msm_ioremap_size(struct platform_device *pdev, const char *name,
-		const char *dbgname, phys_addr_t *size);
-void __iomem *msm_ioremap_quiet(struct platform_device *pdev, const char *name,
-		const char *dbgname);
+		phys_addr_t *size);
+void __iomem *msm_ioremap_quiet(struct platform_device *pdev, const char *name);
 void msm_writel(u32 data, void __iomem *addr);
 u32 msm_readl(const void __iomem *addr);
 void msm_rmw(void __iomem *addr, u32 mask, u32 or);
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 0f78c2615272..c4debc8ea3ba 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -858,7 +858,7 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 
 
 	/* Map registers: */
-	gpu->mmio = msm_ioremap(pdev, config->ioname, name);
+	gpu->mmio = msm_ioremap(pdev, config->ioname);
 	if (IS_ERR(gpu->mmio)) {
 		ret = PTR_ERR(gpu->mmio);
 		goto fail;
-- 
2.33.0

