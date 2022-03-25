Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F323D4E72E1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Mar 2022 13:17:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358943AbiCYMTY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Mar 2022 08:19:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358940AbiCYMTY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Mar 2022 08:19:24 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50D3FD554F
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Mar 2022 05:17:49 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id e16so13009380lfc.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Mar 2022 05:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Q+gWgdXDu4C/dWaSrT9QDWl7idQbYhxioxF1ywmPs4A=;
        b=CmIk2qKJRXc7Q3rkHQW4UggguSWoO2lxuHPOTNMRIJkk7FtXrpnLKi8RiM++6Jc9ss
         s90hNfLO1aHiXaN++4dCSjCDhjfXIYSR9kytAVhKiUyfTZdX14taEC34DzhAt8VH9Jro
         RauCF6+GmApNUOD8TFYZ7ppysOoVSMN3h+kXY3qyJxN1H5qOnJD7RHR3b4/gjJ2vUs1t
         /aXir21nYLdtPuZDQVbkz/c2xkzpQUFL5ZTpqyuSoJDmV1Aog8fI35h78YtiMQSBvvds
         DWNAOtBY9i+rSqGrKM1zyfQ7PwCBXqB81khOj9EyPEKQDoTupIifhImKELWxGj3fVmIT
         ASHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Q+gWgdXDu4C/dWaSrT9QDWl7idQbYhxioxF1ywmPs4A=;
        b=KnRPG5InGqYDDbcCXrXdGFDmfe/upD9EKlnnX5rkCIB2wBdy6ZCq2rA+JZTcTg053Q
         raKLQ9HzFgUOxLUSKugSlUZeo1cvNVxbdQC3CT/nPp+cD/pGpMEoDv7z+vDaNdurbLpj
         aX17TSMb8YeD+ZpsQf9k9iFx2j12kgoKZxN7KfrEDkkiCXr9p9ul7BNMbA9PC6Ly/ZQW
         wGlwptjvdta26JuOIjbRzLEX8NJ/hxFDPxFpuuM45zILFpy85yE+O0YjqE0W5RZ5gQ+u
         9EgXR3ajW3QUUH6/9iH9jGLKPBVGeYF9VM+z5Gmxy9m5VsMb5YcbjQ+MjK8ohlZp51wY
         k4og==
X-Gm-Message-State: AOAM5301nJ+BuIpjb51+PB9HcEdsOXDOVz+xmeHHpxKQHnRlZkHvIcl8
        +jF1ntfr5YJwnZw0WMrYkEsOAg==
X-Google-Smtp-Source: ABdhPJybqnMvtagRNZ/1F+pSfq084tkUgc/CYTVT8NG/auy9c36szS+cZuEJjxeMcEv71fziiqhY4w==
X-Received: by 2002:a05:6512:3a95:b0:44a:6189:dad1 with SMTP id q21-20020a0565123a9500b0044a6189dad1mr6041314lfu.334.1648210667586;
        Fri, 25 Mar 2022 05:17:47 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([188.162.64.164])
        by smtp.gmail.com with ESMTPSA id k9-20020a05651210c900b00448956cb40csm688489lfg.109.2022.03.25.05.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Mar 2022 05:17:47 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v4 6/6] drm/msm: make mdp5/dpu devices master components
Date:   Fri, 25 Mar 2022 15:17:36 +0300
Message-Id: <20220325121736.2162912-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220325121736.2162912-1-dmitry.baryshkov@linaro.org>
References: <20220325121736.2162912-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The msm_mdss serves several roles at this moment. It provides IRQ domain
used by MDP5 and DPU drivers but it also serves as a component master
for both those usecases. MDP4 (which does not have separate MDSS device)
is the component master on it's own.
Remove this assymmetry and make both MDP5 and DPU component masters too.
This removes a need to care about drm/components from msm_mdss driver,
removes an mdss pointer from struct msm_drm_private and simplifies the
interface between mdp5/dpu and msm_drv.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 88 ++++++++++--------------
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 16 +----
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 50 +++++---------
 drivers/gpu/drm/msm/msm_drv.c            | 32 ++++-----
 drivers/gpu/drm/msm/msm_drv.h            |  6 +-
 drivers/gpu/drm/msm/msm_kms.h            |  3 -
 drivers/gpu/drm/msm/msm_mdss.c           | 67 +++---------------
 7 files changed, 79 insertions(+), 183 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 38627ccf3068..7672e1d28665 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -380,9 +380,13 @@ static int dpu_kms_parse_data_bus_icc_path(struct dpu_kms *dpu_kms)
 	struct icc_path *path0;
 	struct icc_path *path1;
 	struct drm_device *dev = dpu_kms->dev;
+	struct device *dpu_dev = dev->dev;
+	struct device *mdss_dev = dpu_dev->parent;
 
-	path0 = of_icc_get(dev->dev, "mdp0-mem");
-	path1 = of_icc_get(dev->dev, "mdp1-mem");
+	/* Interconnects are a part of MDSS device tree binding, not the
+	 * MDP/DPU device. */
+	path0 = of_icc_get(mdss_dev, "mdp0-mem");
+	path1 = of_icc_get(mdss_dev, "mdp1-mem");
 
 	if (IS_ERR_OR_NULL(path0))
 		return PTR_ERR_OR_ZERO(path0);
@@ -837,6 +841,9 @@ static void dpu_kms_destroy(struct msm_kms *kms)
 	_dpu_kms_hw_destroy(dpu_kms);
 
 	msm_kms_destroy(&dpu_kms->base);
+
+	if (dpu_kms->rpm_enabled)
+		pm_runtime_disable(&dpu_kms->pdev->dev);
 }
 
 static irqreturn_t dpu_irq(struct msm_kms *kms)
@@ -973,12 +980,16 @@ static int _dpu_kms_mmu_init(struct dpu_kms *dpu_kms)
 	struct iommu_domain *domain;
 	struct msm_gem_address_space *aspace;
 	struct msm_mmu *mmu;
+	struct device *dpu_dev = dpu_kms->dev->dev;
+	struct device *mdss_dev = dpu_dev->parent;
 
 	domain = iommu_domain_alloc(&platform_bus_type);
 	if (!domain)
 		return 0;
 
-	mmu = msm_iommu_new(dpu_kms->dev->dev, domain);
+	/* IOMMUs are a part of MDSS device tree binding, not the
+	 * MDP/DPU device. */
+	mmu = msm_iommu_new(mdss_dev, domain);
 	if (IS_ERR(mmu)) {
 		iommu_domain_free(domain);
 		return PTR_ERR(mmu);
@@ -1172,40 +1183,15 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 	return rc;
 }
 
-static int dpu_kms_init(struct drm_device *dev)
-{
-	struct msm_drm_private *priv;
-	struct dpu_kms *dpu_kms;
-	int irq;
-
-	if (!dev) {
-		DPU_ERROR("drm device node invalid\n");
-		return -EINVAL;
-	}
-
-	priv = dev->dev_private;
-	dpu_kms = to_dpu_kms(priv->kms);
-
-	irq = irq_of_parse_and_map(dpu_kms->pdev->dev.of_node, 0);
-	if (irq < 0) {
-		DPU_ERROR("failed to get irq: %d\n", irq);
-		return irq;
-	}
-	dpu_kms->base.irq = irq;
-
-	return 0;
-}
-
-static int dpu_bind(struct device *dev, struct device *master, void *data)
+static int dpu_kms_init(struct drm_device *ddev)
 {
-	struct msm_drm_private *priv = dev_get_drvdata(master);
+	struct msm_drm_private *priv = ddev->dev_private;
+	struct device *dev = ddev->dev;
 	struct platform_device *pdev = to_platform_device(dev);
-	struct drm_device *ddev = priv->dev;
 	struct dpu_kms *dpu_kms;
+	int irq;
 	int ret = 0;
 
-	priv->kms_init = dpu_kms_init;
-
 	dpu_kms = devm_kzalloc(&pdev->dev, sizeof(*dpu_kms), GFP_KERNEL);
 	if (!dpu_kms)
 		return -ENOMEM;
@@ -1227,8 +1213,6 @@ static int dpu_bind(struct device *dev, struct device *master, void *data)
 	}
 	dpu_kms->num_clocks = ret;
 
-	platform_set_drvdata(pdev, dpu_kms);
-
 	ret = msm_kms_init(&dpu_kms->base, &kms_funcs);
 	if (ret) {
 		DPU_ERROR("failed to init kms, ret=%d\n", ret);
@@ -1242,31 +1226,25 @@ static int dpu_bind(struct device *dev, struct device *master, void *data)
 
 	priv->kms = &dpu_kms->base;
 
-	return ret;
-}
-
-static void dpu_unbind(struct device *dev, struct device *master, void *data)
-{
-	struct platform_device *pdev = to_platform_device(dev);
-	struct dpu_kms *dpu_kms = platform_get_drvdata(pdev);
+	irq = irq_of_parse_and_map(dpu_kms->pdev->dev.of_node, 0);
+	if (irq < 0) {
+		DPU_ERROR("failed to get irq: %d\n", irq);
+		return irq;
+	}
+	dpu_kms->base.irq = irq;
 
-	if (dpu_kms->rpm_enabled)
-		pm_runtime_disable(&pdev->dev);
+	return 0;
 }
 
-static const struct component_ops dpu_ops = {
-	.bind   = dpu_bind,
-	.unbind = dpu_unbind,
-};
-
 static int dpu_dev_probe(struct platform_device *pdev)
 {
-	return component_add(&pdev->dev, &dpu_ops);
+	return msm_drv_probe(&pdev->dev, dpu_kms_init);
 }
 
 static int dpu_dev_remove(struct platform_device *pdev)
 {
-	component_del(&pdev->dev, &dpu_ops);
+	component_master_del(&pdev->dev, &msm_drm_ops);
+
 	return 0;
 }
 
@@ -1274,7 +1252,8 @@ static int __maybe_unused dpu_runtime_suspend(struct device *dev)
 {
 	int i;
 	struct platform_device *pdev = to_platform_device(dev);
-	struct dpu_kms *dpu_kms = platform_get_drvdata(pdev);
+	struct msm_drm_private *priv = platform_get_drvdata(pdev);
+	struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
 
 	/* Drop the performance state vote */
 	dev_pm_opp_set_rate(dev, 0);
@@ -1290,7 +1269,8 @@ static int __maybe_unused dpu_runtime_resume(struct device *dev)
 {
 	int rc = -1;
 	struct platform_device *pdev = to_platform_device(dev);
-	struct dpu_kms *dpu_kms = platform_get_drvdata(pdev);
+	struct msm_drm_private *priv = platform_get_drvdata(pdev);
+	struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
 	struct drm_encoder *encoder;
 	struct drm_device *ddev;
 	int i;
@@ -1320,9 +1300,11 @@ static const struct dev_pm_ops dpu_pm_ops = {
 	SET_RUNTIME_PM_OPS(dpu_runtime_suspend, dpu_runtime_resume, NULL)
 	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
 				pm_runtime_force_resume)
+	.prepare = msm_pm_prepare,
+	.complete = msm_pm_complete,
 };
 
-const struct of_device_id dpu_dt_match[] = {
+static const struct of_device_id dpu_dt_match[] = {
 	{ .compatible = "qcom,msm8998-dpu", },
 	{ .compatible = "qcom,qcm2290-dpu", },
 	{ .compatible = "qcom,sdm845-dpu", },
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index 1a14f1d3cdf7..834d16bced9d 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -577,21 +577,7 @@ static const struct dev_pm_ops mdp4_pm_ops = {
 
 static int mdp4_probe(struct platform_device *pdev)
 {
-	struct msm_drm_private *priv;
-
-	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
-	if (!priv)
-		return -ENOMEM;
-
-	priv->kms_init = mdp4_kms_init;
-
-	platform_set_drvdata(pdev, priv);
-
-	/*
-	 * on MDP4 based platforms, the MDP platform device is the component
-	 * that adds other display interface components to itself.
-	 */
-	return msm_drv_probe(&pdev->dev, &pdev->dev);
+	return msm_drv_probe(&pdev->dev, mdp4_kms_init);
 }
 
 static int mdp4_remove(struct platform_device *pdev)
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 0c78608832c3..7676b4d3620e 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -203,6 +203,8 @@ static int mdp5_set_split_display(struct msm_kms *kms,
 							  slave_encoder);
 }
 
+static void mdp5_destroy(struct platform_device *pdev);
+
 static void mdp5_kms_destroy(struct msm_kms *kms)
 {
 	struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(kms));
@@ -221,6 +223,7 @@ static void mdp5_kms_destroy(struct msm_kms *kms)
 	}
 
 	mdp_kms_destroy(&mdp5_kms->base);
+	mdp5_destroy(mdp5_kms->pdev);
 }
 
 #ifdef CONFIG_DEBUG_FS
@@ -544,6 +547,8 @@ static int get_clk(struct platform_device *pdev, struct clk **clkp,
 	return 0;
 }
 
+static int mdp5_init(struct platform_device *pdev, struct drm_device *dev);
+
 static int mdp5_kms_init(struct drm_device *dev)
 {
 	struct msm_drm_private *priv = dev->dev_private;
@@ -555,6 +560,8 @@ static int mdp5_kms_init(struct drm_device *dev)
 	int irq, i, ret;
 	struct device *iommu_dev;
 
+	ret = mdp5_init(to_platform_device(dev->dev), dev);
+
 	/* priv->kms would have been populated by the MDP5 driver */
 	kms = priv->kms;
 	if (!kms)
@@ -804,8 +811,6 @@ static int mdp5_init(struct platform_device *pdev, struct drm_device *dev)
 	u32 major, minor;
 	int ret;
 
-	priv->kms_init = mdp5_kms_init;
-
 	mdp5_kms = devm_kzalloc(&pdev->dev, sizeof(*mdp5_kms), GFP_KERNEL);
 	if (!mdp5_kms) {
 		ret = -ENOMEM;
@@ -915,35 +920,14 @@ static int mdp5_init(struct platform_device *pdev, struct drm_device *dev)
 	return ret;
 }
 
-static int mdp5_bind(struct device *dev, struct device *master, void *data)
-{
-	struct msm_drm_private *priv = dev_get_drvdata(master);
-	struct drm_device *ddev = priv->dev;
-	struct platform_device *pdev = to_platform_device(dev);
-
-	DBG("");
-
-	return mdp5_init(pdev, ddev);
-}
-
-static void mdp5_unbind(struct device *dev, struct device *master,
-			void *data)
-{
-	struct platform_device *pdev = to_platform_device(dev);
-
-	mdp5_destroy(pdev);
-}
-
-static const struct component_ops mdp5_ops = {
-	.bind   = mdp5_bind,
-	.unbind = mdp5_unbind,
-};
-
 static int mdp5_setup_interconnect(struct platform_device *pdev)
 {
-	struct icc_path *path0 = of_icc_get(&pdev->dev, "mdp0-mem");
-	struct icc_path *path1 = of_icc_get(&pdev->dev, "mdp1-mem");
-	struct icc_path *path_rot = of_icc_get(&pdev->dev, "rotator-mem");
+	/* Interconnects are a part of MDSS device tree binding, not the
+	 * MDP5 device. */
+	struct device *mdss_dev = pdev->dev.parent;
+	struct icc_path *path0 = of_icc_get(mdss_dev, "mdp0-mem");
+	struct icc_path *path1 = of_icc_get(mdss_dev, "mdp1-mem");
+	struct icc_path *path_rot = of_icc_get(mdss_dev, "rotator-mem");
 
 	if (IS_ERR(path0))
 		return PTR_ERR(path0);
@@ -979,13 +963,13 @@ static int mdp5_dev_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	return component_add(&pdev->dev, &mdp5_ops);
+	return msm_drv_probe(&pdev->dev, mdp5_kms_init);
 }
 
 static int mdp5_dev_remove(struct platform_device *pdev)
 {
 	DBG("");
-	component_del(&pdev->dev, &mdp5_ops);
+	component_master_del(&pdev->dev, &msm_drm_ops);
 	return 0;
 }
 
@@ -1011,9 +995,11 @@ static __maybe_unused int mdp5_runtime_resume(struct device *dev)
 
 static const struct dev_pm_ops mdp5_pm_ops = {
 	SET_RUNTIME_PM_OPS(mdp5_runtime_suspend, mdp5_runtime_resume, NULL)
+	.prepare = msm_pm_prepare,
+	.complete = msm_pm_complete,
 };
 
-const struct of_device_id mdp5_dt_match[] = {
+static const struct of_device_id mdp5_dt_match[] = {
 	{ .compatible = "qcom,mdp5", },
 	/* to support downstream DT files */
 	{ .compatible = "qcom,mdss_mdp", },
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index b37a2601d4c3..c5eaf3ee1ccf 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -992,10 +992,10 @@ static int compare_of(struct device *dev, void *data)
  * is no external component that we need to add since LVDS is within MDP4
  * itself.
  */
-static int add_components_mdp(struct device *master_dev, struct device *mdp_dev,
+static int add_components_mdp(struct device *master_dev,
 			      struct component_match **matchptr)
 {
-	struct device_node *np = mdp_dev->of_node;
+	struct device_node *np = master_dev->of_node;
 	struct device_node *ep_node;
 
 	for_each_endpoint_of_node(np, ep_node) {
@@ -1005,7 +1005,7 @@ static int add_components_mdp(struct device *master_dev, struct device *mdp_dev,
 
 		ret = of_graph_parse_endpoint(ep_node, &ep);
 		if (ret) {
-			DRM_DEV_ERROR(mdp_dev, "unable to parse port endpoint\n");
+			DRM_DEV_ERROR(master_dev, "unable to parse port endpoint\n");
 			of_node_put(ep_node);
 			return ret;
 		}
@@ -1082,17 +1082,23 @@ const struct component_master_ops msm_drm_ops = {
 	.unbind = msm_drm_unbind,
 };
 
-int msm_drv_probe(struct device *master_dev, struct device *mdp_dev)
+int msm_drv_probe(struct device *master_dev,
+	int (*kms_init)(struct drm_device *dev))
 {
+	struct msm_drm_private *priv;
 	struct component_match *match = NULL;
 	int ret;
 
-	if (mdp_dev) {
-		/* add the MDP component itself */
-		drm_of_component_match_add(master_dev, &match, compare_of,
-				mdp_dev->of_node);
+	priv = devm_kzalloc(master_dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
 
-		ret = add_components_mdp(master_dev, mdp_dev, &match);
+	priv->kms_init = kms_init;
+	dev_set_drvdata(master_dev, priv);
+
+	/* Add mdp components if we have KMS. */
+	if (kms_init) {
+		ret = add_components_mdp(master_dev, &match);
 		if (ret)
 			return ret;
 	}
@@ -1122,14 +1128,6 @@ int msm_drv_probe(struct device *master_dev, struct device *mdp_dev)
 
 static int msm_pdev_probe(struct platform_device *pdev)
 {
-	struct msm_drm_private *priv;
-
-	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
-	if (!priv)
-		return -ENOMEM;
-
-	platform_set_drvdata(pdev, priv);
-
 	return msm_drv_probe(&pdev->dev, NULL);
 }
 
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 6bad7e7b479d..35bd3ed60f84 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -126,9 +126,6 @@ struct msm_drm_private {
 	/* subordinate devices, if present: */
 	struct platform_device *gpu_pdev;
 
-	/* top level MDSS wrapper device (for MDP5/DPU only) */
-	struct msm_mdss *mdss;
-
 	/* possibly this should be in the kms component, but it is
 	 * shared by both mdp4 and mdp5..
 	 */
@@ -579,7 +576,8 @@ extern const struct component_master_ops msm_drm_ops;
 int msm_pm_prepare(struct device *dev);
 void msm_pm_complete(struct device *dev);
 
-int msm_drv_probe(struct device *master_dev, struct device *mdp_dev);
+int msm_drv_probe(struct device *dev,
+	int (*kms_init)(struct drm_device *dev));
 void msm_drv_shutdown(struct platform_device *pdev);
 
 
diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index 1f571372e928..ab25fff271f9 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -194,9 +194,6 @@ static inline void msm_kms_destroy(struct msm_kms *kms)
 		msm_atomic_destroy_pending_timer(&kms->pending_timers[i]);
 }
 
-extern const struct of_device_id dpu_dt_match[];
-extern const struct of_device_id mdp5_dt_match[];
-
 #define for_each_crtc_mask(dev, crtc, crtc_mask) \
 	drm_for_each_crtc(crtc, dev) \
 		for_each_if (drm_crtc_mask(crtc) & (crtc_mask))
diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index de93b917875b..361f3727d13f 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -261,20 +261,20 @@ static struct msm_mdss *msm_mdss_init(struct platform_device *pdev, bool is_mdp5
 
 static int __maybe_unused mdss_runtime_suspend(struct device *dev)
 {
-	struct msm_drm_private *priv = dev_get_drvdata(dev);
+	struct msm_mdss *mdss = dev_get_drvdata(dev);
 
 	DBG("");
 
-	return msm_mdss_disable(priv->mdss);
+	return msm_mdss_disable(mdss);
 }
 
 static int __maybe_unused mdss_runtime_resume(struct device *dev)
 {
-	struct msm_drm_private *priv = dev_get_drvdata(dev);
+	struct msm_mdss *mdss = dev_get_drvdata(dev);
 
 	DBG("");
 
-	return msm_mdss_enable(priv->mdss);
+	return msm_mdss_enable(mdss);
 }
 
 static int __maybe_unused mdss_pm_suspend(struct device *dev)
@@ -297,31 +297,12 @@ static int __maybe_unused mdss_pm_resume(struct device *dev)
 static const struct dev_pm_ops mdss_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(mdss_pm_suspend, mdss_pm_resume)
 	SET_RUNTIME_PM_OPS(mdss_runtime_suspend, mdss_runtime_resume, NULL)
-	.prepare = msm_pm_prepare,
-	.complete = msm_pm_complete,
 };
 
-static int find_mdp_node(struct device *dev, void *data)
-{
-#ifdef CONFIG_DRM_MSM_DPU
-	if (of_match_node(dpu_dt_match, dev->of_node))
-		return true;
-#endif
-
-#ifdef CONFIG_DRM_MSM_MDP5
-	if (of_match_node(mdp5_dt_match, dev->of_node))
-		return true;
-#endif
-
-	return false;
-}
-
 static int mdss_probe(struct platform_device *pdev)
 {
 	struct msm_mdss *mdss;
-	struct msm_drm_private *priv;
 	bool is_mdp5 = of_device_is_compatible(pdev->dev.of_node, "qcom,mdss");
-	struct device *mdp_dev;
 	struct device *dev = &pdev->dev;
 	int ret;
 
@@ -329,14 +310,7 @@ static int mdss_probe(struct platform_device *pdev)
 	if (IS_ERR(mdss))
 		return PTR_ERR(mdss);
 
-	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
-	if (!priv) {
-		ret = -ENOMEM;
-		goto fail;
-	}
-
-	priv->mdss = mdss;
-	platform_set_drvdata(pdev, priv);
+	platform_set_drvdata(pdev, mdss);
 
 	/*
 	 * MDP5/DPU based devices don't have a flat hierarchy. There is a top
@@ -347,42 +321,17 @@ static int mdss_probe(struct platform_device *pdev)
 	ret = of_platform_populate(dev->of_node, NULL, NULL, dev);
 	if (ret) {
 		DRM_DEV_ERROR(dev, "failed to populate children devices\n");
-		goto fail;
-	}
-
-	mdp_dev = device_find_child(dev, NULL, find_mdp_node);
-	if (!mdp_dev) {
-		DRM_DEV_ERROR(dev, "failed to find MDSS MDP node\n");
-		of_platform_depopulate(dev);
-		ret = -ENODEV;
-		goto fail;
+		msm_mdss_destroy(mdss);
+		return ret;
 	}
 
-	/*
-	 * on MDP5 based platforms, the MDSS platform device is the component
-	 * that adds MDP5 and other display interface components to
-	 * itself.
-	 */
-	ret = msm_drv_probe(dev, mdp_dev);
-	put_device(mdp_dev);
-	if (ret)
-		goto fail;
-
 	return 0;
-
-fail:
-	of_platform_depopulate(dev);
-	msm_mdss_destroy(priv->mdss);
-
-	return ret;
 }
 
 static int mdss_remove(struct platform_device *pdev)
 {
-	struct msm_drm_private *priv = platform_get_drvdata(pdev);
-	struct msm_mdss *mdss = priv->mdss;
+	struct msm_mdss *mdss = platform_get_drvdata(pdev);
 
-	component_master_del(&pdev->dev, &msm_drm_ops);
 	of_platform_depopulate(&pdev->dev);
 
 	msm_mdss_destroy(mdss);
-- 
2.35.1

