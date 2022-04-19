Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5656550724A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Apr 2022 17:54:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349553AbiDSP4q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Apr 2022 11:56:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354095AbiDSP4n (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Apr 2022 11:56:43 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DB2D1F627
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Apr 2022 08:53:51 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id u7so30151264lfs.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Apr 2022 08:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4HesR5jnbU3cd9p+3DtuuwxaxDTGUPZcsjIKqF0Dzko=;
        b=IVXzgnXVTYJaUCyUSrMVZ0Fyhxp+yuE6NcLwtCxr+PpaydtPiaNYzfkn9OSMN6NfS0
         6DdoyKpu4IOcvAnE+sYta3Bi5SOJdim6Dht14+DPyRZtwjpCr4fe/0bypFvWkSO8I8nq
         gL4EXywgwUtDHDMwV6nXKQcbjKMztjs2/Im8kVc6d9omv9p29MIHNqSzV1CtR8vJd+YB
         XYO9LaVg9b5t9zaNKEmi3qz7Xpa/nRQWnhcBTs+ewOTbrsffu6evt7CAWFCf0YWPrU3p
         mVbWNMuMPF8HsCZQk4p2TcGWCFteBpmcBLNEcp9feTVLAQMr4ziV5NpvsHhA4wGnhjU1
         jJRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4HesR5jnbU3cd9p+3DtuuwxaxDTGUPZcsjIKqF0Dzko=;
        b=RBEeN1cJDhXPqm2qNQg4Mc6m38aq6uYSb3Wt/JGDzSByNdkAVyAQ5hSbJPtL70HEKr
         4Ppc8agw9dAekkAbyCm61nN230mFJ9408Cwe6NDvtHdY+E1sCEYcCGuAIoL8tE1nqD1X
         hV0N+ldDic4EINTnWx+TlVKx+ZHvhvo5I/N8f1Yf9OGC+mfuB60aPYum47Y3lIdT1u2y
         SFFZ2fapiPh/AK7ImOlFcAhlMrObn6jXbSRfzX6BSwzqyWyAzU/lSI5GjdlYwiTYY4o2
         ixXTYU7wdQXPLUwiHrgbif9VD+ABZE0IkDhAUQH1nloNi+ij07u/QWbWxy/FVNCu+GwF
         XLdg==
X-Gm-Message-State: AOAM533xpIyz76cQtYu8x4in/hxL0w/OPrgXjk+Blzc7nVWHFEJ5XD6i
        vI5vEj0Ek1WqLH+p2F3jHTB5RQ==
X-Google-Smtp-Source: ABdhPJy8S3paYcZi3QTjOkSEsCor4+mLsOzFX3pHH9+livy5hNhvFNc6MMKKAItlkVVN57m+008eIg==
X-Received: by 2002:ac2:447a:0:b0:470:6249:1953 with SMTP id y26-20020ac2447a000000b0047062491953mr10571457lfl.423.1650383629437;
        Tue, 19 Apr 2022 08:53:49 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id r25-20020ac25f99000000b00471a439838esm313911lfe.145.2022.04.19.08.53.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Apr 2022 08:53:49 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        kernel test robot <lkp@intel.com>
Subject: [PATCH v5 3/6] drm/msm: split the main platform driver
Date:   Tue, 19 Apr 2022 18:53:43 +0300
Message-Id: <20220419155346.1272627-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419155346.1272627-1-dmitry.baryshkov@linaro.org>
References: <20220419155346.1272627-1-dmitry.baryshkov@linaro.org>
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

Currently the msm platform driver is a multiplex handling several cases:
- headless GPU-only driver,
- MDP4 with flat device nodes,
- MDP5/DPU MDSS with all the nodes being children of MDSS node.

This results in not-so-perfect code, checking the hardware version
(MDP4/MDP5/DPU) in several places, checking for mdss even when it can
not exist, etc. Split the code into three handling subdrivers (mdp4,
mdss and headless msm).

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reported-by: kernel test robot <lkp@intel.com>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c |  56 ++++++
 drivers/gpu/drm/msm/msm_drv.c            | 228 ++++-------------------
 drivers/gpu/drm/msm/msm_drv.h            |  27 ++-
 drivers/gpu/drm/msm/msm_kms.h            |   7 -
 drivers/gpu/drm/msm/msm_mdss.c           | 175 ++++++++++++++++-
 5 files changed, 288 insertions(+), 205 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index 3cf476c55158..5dc839184aef 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -569,3 +569,59 @@ static struct mdp4_platform_config *mdp4_get_config(struct platform_device *dev)
 
 	return &config;
 }
+
+static const struct dev_pm_ops mdp4_pm_ops = {
+	.prepare = msm_pm_prepare,
+	.complete = msm_pm_complete,
+};
+
+static int mdp4_probe(struct platform_device *pdev)
+{
+	struct msm_drm_private *priv;
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, priv);
+
+	/*
+	 * on MDP4 based platforms, the MDP platform device is the component
+	 * that adds other display interface components to itself.
+	 */
+	return msm_drv_probe(&pdev->dev, &pdev->dev);
+}
+
+static int mdp4_remove(struct platform_device *pdev)
+{
+	component_master_del(&pdev->dev, &msm_drm_ops);
+
+	return 0;
+}
+
+static const struct of_device_id mdp4_dt_match[] = {
+	{ .compatible = "qcom,mdp4", .data = (void *)KMS_MDP4 },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, mdp4_dt_match);
+
+static struct platform_driver mdp4_platform_driver = {
+	.probe      = mdp4_probe,
+	.remove     = mdp4_remove,
+	.shutdown   = msm_drv_shutdown,
+	.driver     = {
+		.name   = "mdp4",
+		.of_match_table = mdp4_dt_match,
+		.pm     = &mdp4_pm_ops,
+	},
+};
+
+void __init msm_mdp4_register(void)
+{
+	platform_driver_register(&mdp4_platform_driver);
+}
+
+void __exit msm_mdp4_unregister(void)
+{
+	platform_driver_unregister(&mdp4_platform_driver);
+}
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 4877d4c90465..8bcc86685f2d 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -256,10 +256,6 @@ static int msm_drm_uninit(struct device *dev)
 	return 0;
 }
 
-#define KMS_MDP4 4
-#define KMS_MDP5 5
-#define KMS_DPU  3
-
 static int get_mdp_ver(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -973,50 +969,7 @@ static const struct drm_driver msm_driver = {
 	.patchlevel         = MSM_VERSION_PATCHLEVEL,
 };
 
-static int __maybe_unused msm_runtime_suspend(struct device *dev)
-{
-	struct msm_drm_private *priv = dev_get_drvdata(dev);
-	struct msm_mdss *mdss = priv->mdss;
-
-	DBG("");
-
-	if (mdss)
-		return msm_mdss_disable(mdss);
-
-	return 0;
-}
-
-static int __maybe_unused msm_runtime_resume(struct device *dev)
-{
-	struct msm_drm_private *priv = dev_get_drvdata(dev);
-	struct msm_mdss *mdss = priv->mdss;
-
-	DBG("");
-
-	if (mdss)
-		return msm_mdss_enable(mdss);
-
-	return 0;
-}
-
-static int __maybe_unused msm_pm_suspend(struct device *dev)
-{
-
-	if (pm_runtime_suspended(dev))
-		return 0;
-
-	return msm_runtime_suspend(dev);
-}
-
-static int __maybe_unused msm_pm_resume(struct device *dev)
-{
-	if (pm_runtime_suspended(dev))
-		return 0;
-
-	return msm_runtime_resume(dev);
-}
-
-static int __maybe_unused msm_pm_prepare(struct device *dev)
+int msm_pm_prepare(struct device *dev)
 {
 	struct msm_drm_private *priv = dev_get_drvdata(dev);
 	struct drm_device *ddev = priv ? priv->dev : NULL;
@@ -1027,7 +980,7 @@ static int __maybe_unused msm_pm_prepare(struct device *dev)
 	return drm_mode_config_helper_suspend(ddev);
 }
 
-static void __maybe_unused msm_pm_complete(struct device *dev)
+void msm_pm_complete(struct device *dev)
 {
 	struct msm_drm_private *priv = dev_get_drvdata(dev);
 	struct drm_device *ddev = priv ? priv->dev : NULL;
@@ -1039,8 +992,6 @@ static void __maybe_unused msm_pm_complete(struct device *dev)
 }
 
 static const struct dev_pm_ops msm_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(msm_pm_suspend, msm_pm_resume)
-	SET_RUNTIME_PM_OPS(msm_runtime_suspend, msm_runtime_resume, NULL)
 	.prepare = msm_pm_prepare,
 	.complete = msm_pm_complete,
 };
@@ -1055,25 +1006,11 @@ static const struct dev_pm_ops msm_pm_ops = {
  * is no external component that we need to add since LVDS is within MDP4
  * itself.
  */
-static int add_components_mdp(struct device *mdp_dev,
+static int add_components_mdp(struct device *master_dev, struct device *mdp_dev,
 			      struct component_match **matchptr)
 {
 	struct device_node *np = mdp_dev->of_node;
 	struct device_node *ep_node;
-	struct device *master_dev;
-
-	/*
-	 * on MDP4 based platforms, the MDP platform device is the component
-	 * master that adds other display interface components to itself.
-	 *
-	 * on MDP5 based platforms, the MDSS platform device is the component
-	 * master that adds MDP5 and other display interface components to
-	 * itself.
-	 */
-	if (of_device_is_compatible(np, "qcom,mdp4"))
-		master_dev = mdp_dev;
-	else
-		master_dev = mdp_dev->parent;
 
 	for_each_endpoint_of_node(np, ep_node) {
 		struct device_node *intf;
@@ -1114,60 +1051,6 @@ static int add_components_mdp(struct device *mdp_dev,
 	return 0;
 }
 
-static int find_mdp_node(struct device *dev, void *data)
-{
-	return of_match_node(dpu_dt_match, dev->of_node) ||
-		of_match_node(mdp5_dt_match, dev->of_node);
-}
-
-static int add_display_components(struct platform_device *pdev,
-				  struct component_match **matchptr)
-{
-	struct device *mdp_dev;
-	struct device *dev = &pdev->dev;
-	int ret;
-
-	/*
-	 * MDP5/DPU based devices don't have a flat hierarchy. There is a top
-	 * level parent: MDSS, and children: MDP5/DPU, DSI, HDMI, eDP etc.
-	 * Populate the children devices, find the MDP5/DPU node, and then add
-	 * the interfaces to our components list.
-	 */
-	switch (get_mdp_ver(pdev)) {
-	case KMS_MDP5:
-	case KMS_DPU:
-		ret = of_platform_populate(dev->of_node, NULL, NULL, dev);
-		if (ret) {
-			DRM_DEV_ERROR(dev, "failed to populate children devices\n");
-			return ret;
-		}
-
-		mdp_dev = device_find_child(dev, NULL, find_mdp_node);
-		if (!mdp_dev) {
-			DRM_DEV_ERROR(dev, "failed to find MDSS MDP node\n");
-			of_platform_depopulate(dev);
-			return -ENODEV;
-		}
-
-		put_device(mdp_dev);
-
-		/* add the MDP component itself */
-		drm_of_component_match_add(dev, matchptr, component_compare_of,
-					   mdp_dev->of_node);
-		break;
-	case KMS_MDP4:
-		/* MDP4 */
-		mdp_dev = dev;
-		break;
-	}
-
-	ret = add_components_mdp(mdp_dev, matchptr);
-	if (ret)
-		of_platform_depopulate(dev);
-
-	return ret;
-}
-
 /*
  * We don't know what's the best binding to link the gpu with the drm device.
  * Fow now, we just hunt for all the possible gpus that we support, and add them
@@ -1208,93 +1091,70 @@ static void msm_drm_unbind(struct device *dev)
 	msm_drm_uninit(dev);
 }
 
-static const struct component_master_ops msm_drm_ops = {
+const struct component_master_ops msm_drm_ops = {
 	.bind = msm_drm_bind,
 	.unbind = msm_drm_unbind,
 };
 
-/*
- * Platform driver:
- */
-
-static int msm_pdev_probe(struct platform_device *pdev)
+int msm_drv_probe(struct device *master_dev, struct device *mdp_dev)
 {
 	struct component_match *match = NULL;
-	struct msm_mdss *mdss;
-	struct msm_drm_private *priv;
 	int ret;
 
-	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
-	if (!priv)
-		return -ENOMEM;
-
-	platform_set_drvdata(pdev, priv);
-
-	switch (get_mdp_ver(pdev)) {
-	case KMS_MDP5:
-		mdss = msm_mdss_init(pdev, true);
-		break;
-	case KMS_DPU:
-		mdss = msm_mdss_init(pdev, false);
-		break;
-	default:
-		mdss = NULL;
-		break;
-	}
-	if (IS_ERR(mdss)) {
-		ret = PTR_ERR(mdss);
-		return ret;
-	}
-
-	priv->mdss = mdss;
+	if (mdp_dev) {
+		/* add the MDP component itself */
+		drm_of_component_match_add(master_dev, &match, component_compare_of,
+				mdp_dev->of_node);
 
-	if (get_mdp_ver(pdev)) {
-		ret = add_display_components(pdev, &match);
+		ret = add_components_mdp(master_dev, mdp_dev, &match);
 		if (ret)
-			goto fail;
+			return ret;
 	}
 
-	ret = add_gpu_components(&pdev->dev, &match);
+	ret = add_gpu_components(master_dev, &match);
 	if (ret)
-		goto fail;
+		return ret;
 
 	/* on all devices that I am aware of, iommu's which can map
 	 * any address the cpu can see are used:
 	 */
-	ret = dma_set_mask_and_coherent(&pdev->dev, ~0);
+	ret = dma_set_mask_and_coherent(master_dev, ~0);
 	if (ret)
-		goto fail;
+		return ret;
 
-	ret = component_master_add_with_match(&pdev->dev, &msm_drm_ops, match);
+	ret = component_master_add_with_match(master_dev, &msm_drm_ops, match);
 	if (ret)
-		goto fail;
+		return ret;
 
 	return 0;
+}
 
-fail:
-	of_platform_depopulate(&pdev->dev);
+/*
+ * Platform driver:
+ * Used only for headlesss GPU instances
+ */
 
-	if (priv->mdss)
-		msm_mdss_destroy(priv->mdss);
+static int msm_pdev_probe(struct platform_device *pdev)
+{
+	struct msm_drm_private *priv;
 
-	return ret;
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, priv);
+
+	return msm_drv_probe(&pdev->dev, NULL);
 }
 
 static int msm_pdev_remove(struct platform_device *pdev)
 {
-	struct msm_drm_private *priv = platform_get_drvdata(pdev);
-	struct msm_mdss *mdss = priv->mdss;
-
 	component_master_del(&pdev->dev, &msm_drm_ops);
-	of_platform_depopulate(&pdev->dev);
-
-	if (mdss)
-		msm_mdss_destroy(mdss);
 
 	return 0;
 }
 
-static void msm_pdev_shutdown(struct platform_device *pdev)
+void msm_drv_shutdown(struct platform_device *pdev)
 {
 	struct msm_drm_private *priv = platform_get_drvdata(pdev);
 	struct drm_device *drm = priv ? priv->dev : NULL;
@@ -1305,28 +1165,12 @@ static void msm_pdev_shutdown(struct platform_device *pdev)
 	drm_atomic_helper_shutdown(drm);
 }
 
-static const struct of_device_id dt_match[] = {
-	{ .compatible = "qcom,mdp4", .data = (void *)KMS_MDP4 },
-	{ .compatible = "qcom,mdss", .data = (void *)KMS_MDP5 },
-	{ .compatible = "qcom,msm8998-mdss", .data = (void *)KMS_DPU },
-	{ .compatible = "qcom,qcm2290-mdss", .data = (void *)KMS_DPU },
-	{ .compatible = "qcom,sdm845-mdss", .data = (void *)KMS_DPU },
-	{ .compatible = "qcom,sc7180-mdss", .data = (void *)KMS_DPU },
-	{ .compatible = "qcom,sc7280-mdss", .data = (void *)KMS_DPU },
-	{ .compatible = "qcom,sc8180x-mdss", .data = (void *)KMS_DPU },
-	{ .compatible = "qcom,sm8150-mdss", .data = (void *)KMS_DPU },
-	{ .compatible = "qcom,sm8250-mdss", .data = (void *)KMS_DPU },
-	{}
-};
-MODULE_DEVICE_TABLE(of, dt_match);
-
 static struct platform_driver msm_platform_driver = {
 	.probe      = msm_pdev_probe,
 	.remove     = msm_pdev_remove,
-	.shutdown   = msm_pdev_shutdown,
+	.shutdown   = msm_drv_shutdown,
 	.driver     = {
 		.name   = "msm",
-		.of_match_table = dt_match,
 		.pm     = &msm_pm_ops,
 	},
 };
@@ -1343,6 +1187,8 @@ static int __init msm_drm_register(void)
 	msm_hdmi_register();
 	msm_dp_register();
 	adreno_register();
+	msm_mdp4_register();
+	msm_mdss_register();
 	return platform_driver_register(&msm_platform_driver);
 }
 
@@ -1350,6 +1196,8 @@ static void __exit msm_drm_unregister(void)
 {
 	DBG("fini");
 	platform_driver_unregister(&msm_platform_driver);
+	msm_mdss_unregister();
+	msm_mdp4_unregister();
 	msm_dp_unregister();
 	msm_hdmi_unregister();
 	adreno_unregister();
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index d661debb50f1..d6b827bbeaf5 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -431,10 +431,18 @@ static inline void msm_dp_debugfs_init(struct msm_dp *dp_display,
 
 #endif
 
-void __init msm_mdp_register(void);
-void __exit msm_mdp_unregister(void);
-void __init msm_dpu_register(void);
-void __exit msm_dpu_unregister(void);
+#define KMS_MDP4 4
+#define KMS_MDP5 5
+#define KMS_DPU  3
+
+void msm_mdp4_register(void);
+void msm_mdp4_unregister(void);
+void msm_mdp_register(void);
+void msm_mdp_unregister(void);
+void msm_dpu_register(void);
+void msm_dpu_unregister(void);
+void msm_mdss_register(void);
+void msm_mdss_unregister(void);
 
 #ifdef CONFIG_DEBUG_FS
 void msm_framebuffer_describe(struct drm_framebuffer *fb, struct seq_file *m);
@@ -534,4 +542,15 @@ static inline unsigned long timeout_to_jiffies(const ktime_t *timeout)
 	return clamp(remaining_jiffies, 0LL, (s64)INT_MAX);
 }
 
+/* Driver helpers */
+
+extern const struct component_master_ops msm_drm_ops;
+
+int msm_pm_prepare(struct device *dev);
+void msm_pm_complete(struct device *dev);
+
+int msm_drv_probe(struct device *master_dev, struct device *mdp_dev);
+void msm_drv_shutdown(struct platform_device *pdev);
+
+
 #endif /* __MSM_DRV_H__ */
diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index 09c219988884..13c2eb0b2bcf 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -201,13 +201,6 @@ struct msm_kms *dpu_kms_init(struct drm_device *dev);
 extern const struct of_device_id dpu_dt_match[];
 extern const struct of_device_id mdp5_dt_match[];
 
-struct msm_mdss;
-
-struct msm_mdss *msm_mdss_init(struct platform_device *pdev, bool is_mdp5);
-int msm_mdss_enable(struct msm_mdss *mdss);
-int msm_mdss_disable(struct msm_mdss *mdss);
-void msm_mdss_destroy(struct msm_mdss *mdss);
-
 #define for_each_crtc_mask(dev, crtc, crtc_mask) \
 	drm_for_each_crtc(crtc, dev) \
 		for_each_if (drm_crtc_mask(crtc) & (crtc_mask))
diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 60c90a382b54..43a8e3376f17 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -10,6 +10,9 @@
 #include <linux/irqchip/chained_irq.h>
 #include <linux/pm_runtime.h>
 
+#include "msm_drv.h"
+#include "msm_kms.h"
+
 /* for DPU_HW_* defines */
 #include "disp/dpu1/dpu_hw_catalog.h"
 
@@ -127,7 +130,7 @@ static int _msm_mdss_irq_domain_add(struct msm_mdss *msm_mdss)
 	return 0;
 }
 
-int msm_mdss_enable(struct msm_mdss *msm_mdss)
+static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 {
 	int ret;
 
@@ -170,14 +173,14 @@ int msm_mdss_enable(struct msm_mdss *msm_mdss)
 	return ret;
 }
 
-int msm_mdss_disable(struct msm_mdss *msm_mdss)
+static int msm_mdss_disable(struct msm_mdss *msm_mdss)
 {
 	clk_bulk_disable_unprepare(msm_mdss->num_clocks, msm_mdss->clocks);
 
 	return 0;
 }
 
-void msm_mdss_destroy(struct msm_mdss *msm_mdss)
+static void msm_mdss_destroy(struct msm_mdss *msm_mdss)
 {
 	struct platform_device *pdev = to_platform_device(msm_mdss->dev);
 	int irq;
@@ -220,7 +223,7 @@ static int mdp5_mdss_parse_clock(struct platform_device *pdev, struct clk_bulk_d
 	return num_clocks;
 }
 
-struct msm_mdss *msm_mdss_init(struct platform_device *pdev, bool is_mdp5)
+static struct msm_mdss *msm_mdss_init(struct platform_device *pdev, bool is_mdp5)
 {
 	struct msm_mdss *msm_mdss;
 	int ret;
@@ -264,3 +267,167 @@ struct msm_mdss *msm_mdss_init(struct platform_device *pdev, bool is_mdp5)
 
 	return msm_mdss;
 }
+
+static int __maybe_unused mdss_runtime_suspend(struct device *dev)
+{
+	struct msm_drm_private *priv = dev_get_drvdata(dev);
+
+	DBG("");
+
+	return msm_mdss_disable(priv->mdss);
+}
+
+static int __maybe_unused mdss_runtime_resume(struct device *dev)
+{
+	struct msm_drm_private *priv = dev_get_drvdata(dev);
+
+	DBG("");
+
+	return msm_mdss_enable(priv->mdss);
+}
+
+static int __maybe_unused mdss_pm_suspend(struct device *dev)
+{
+
+	if (pm_runtime_suspended(dev))
+		return 0;
+
+	return mdss_runtime_suspend(dev);
+}
+
+static int __maybe_unused mdss_pm_resume(struct device *dev)
+{
+	if (pm_runtime_suspended(dev))
+		return 0;
+
+	return mdss_runtime_resume(dev);
+}
+
+static const struct dev_pm_ops mdss_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(mdss_pm_suspend, mdss_pm_resume)
+	SET_RUNTIME_PM_OPS(mdss_runtime_suspend, mdss_runtime_resume, NULL)
+	.prepare = msm_pm_prepare,
+	.complete = msm_pm_complete,
+};
+
+static int get_mdp_ver(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+
+	return (int) (unsigned long) of_device_get_match_data(dev);
+}
+
+static int find_mdp_node(struct device *dev, void *data)
+{
+	return of_match_node(dpu_dt_match, dev->of_node) ||
+		of_match_node(mdp5_dt_match, dev->of_node);
+}
+
+static int mdss_probe(struct platform_device *pdev)
+{
+	struct msm_mdss *mdss;
+	struct msm_drm_private *priv;
+	int mdp_ver = get_mdp_ver(pdev);
+	struct device *mdp_dev;
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	mdss = msm_mdss_init(pdev, mdp_ver == KMS_MDP5);
+	if (IS_ERR(mdss))
+		return PTR_ERR(mdss);
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv) {
+		ret = -ENOMEM;
+		goto fail;
+	}
+
+	priv->mdss = mdss;
+	platform_set_drvdata(pdev, priv);
+
+	/*
+	 * MDP5/DPU based devices don't have a flat hierarchy. There is a top
+	 * level parent: MDSS, and children: MDP5/DPU, DSI, HDMI, eDP etc.
+	 * Populate the children devices, find the MDP5/DPU node, and then add
+	 * the interfaces to our components list.
+	 */
+	ret = of_platform_populate(dev->of_node, NULL, NULL, dev);
+	if (ret) {
+		DRM_DEV_ERROR(dev, "failed to populate children devices\n");
+		goto fail;
+	}
+
+	mdp_dev = device_find_child(dev, NULL, find_mdp_node);
+	if (!mdp_dev) {
+		DRM_DEV_ERROR(dev, "failed to find MDSS MDP node\n");
+		of_platform_depopulate(dev);
+		ret = -ENODEV;
+		goto fail;
+	}
+
+	/*
+	 * on MDP5 based platforms, the MDSS platform device is the component
+	 * that adds MDP5 and other display interface components to
+	 * itself.
+	 */
+	ret = msm_drv_probe(dev, mdp_dev);
+	put_device(mdp_dev);
+	if (ret)
+		goto fail;
+
+	return 0;
+
+fail:
+	of_platform_depopulate(dev);
+	msm_mdss_destroy(priv->mdss);
+
+	return ret;
+}
+
+static int mdss_remove(struct platform_device *pdev)
+{
+	struct msm_drm_private *priv = platform_get_drvdata(pdev);
+	struct msm_mdss *mdss = priv->mdss;
+
+	component_master_del(&pdev->dev, &msm_drm_ops);
+	of_platform_depopulate(&pdev->dev);
+
+	msm_mdss_destroy(mdss);
+
+	return 0;
+}
+
+static const struct of_device_id mdss_dt_match[] = {
+	{ .compatible = "qcom,mdss", .data = (void *)KMS_MDP5 },
+	{ .compatible = "qcom,msm8998-mdss", .data = (void *)KMS_DPU },
+	{ .compatible = "qcom,qcm2290-mdss", .data = (void *)KMS_DPU },
+	{ .compatible = "qcom,sdm845-mdss", .data = (void *)KMS_DPU },
+	{ .compatible = "qcom,sc7180-mdss", .data = (void *)KMS_DPU },
+	{ .compatible = "qcom,sc7280-mdss", .data = (void *)KMS_DPU },
+	{ .compatible = "qcom,sc8180x-mdss", .data = (void *)KMS_DPU },
+	{ .compatible = "qcom,sm8150-mdss", .data = (void *)KMS_DPU },
+	{ .compatible = "qcom,sm8250-mdss", .data = (void *)KMS_DPU },
+	{}
+};
+MODULE_DEVICE_TABLE(of, mdss_dt_match);
+
+static struct platform_driver mdss_platform_driver = {
+	.probe      = mdss_probe,
+	.remove     = mdss_remove,
+	.shutdown   = msm_drv_shutdown,
+	.driver     = {
+		.name   = "msm-mdss",
+		.of_match_table = mdss_dt_match,
+		.pm     = &mdss_pm_ops,
+	},
+};
+
+void __init msm_mdss_register(void)
+{
+	platform_driver_register(&mdss_platform_driver);
+}
+
+void __exit msm_mdss_unregister(void)
+{
+	platform_driver_unregister(&mdss_platform_driver);
+}
-- 
2.35.1

