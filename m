Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D7D4507244
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Apr 2022 17:54:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354104AbiDSP4p (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Apr 2022 11:56:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349553AbiDSP4m (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Apr 2022 11:56:42 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1A24205F6
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Apr 2022 08:53:50 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id d6so12478884lfv.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Apr 2022 08:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Zjk0mT+2lk4cY/mnQMCPd08Oo47CvryYC7ZJYEmEG20=;
        b=gQCRLj6aIzc9dGIhd2K+fAL7WmoXBJSESYVvAnl9X7gU3Okurz/BYhvbwMVnkpT76J
         kI3OkOvuRW/VA3skUq1WJxmvo0Z+ohoWP4Lmt77CPresEy68JRunyDpErtqVoW48FPDp
         mbwpbsc6bv+rQfHxxtJF32VRQh51PCFsSOQjRkXYk1UANhVQwqGfSom9P1JZ5VrTnnmv
         pxuKfPXOuczXKmKK+PusHt0VimMa2hz8jp0M+J6Fad6bxiN383utriI/0uPQrzzv1xO/
         pAtUQMJAr8GJDV6stkSIc0l1wvXzH7NaURvxxZtY95qd6nJULevwG0GrgpA4Xx0o4yjW
         kDEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Zjk0mT+2lk4cY/mnQMCPd08Oo47CvryYC7ZJYEmEG20=;
        b=XmzwFxKYSabfL3UD/NMpgEUOcoQ0ZMTK1FmXoknMbEcYnsCvKJTC2hlq+1syQEkY2x
         XgUVjw3l5HljgjXp/+c7N02ArYOcC8P0/RWoTgdAst4EBQuDgzzsgWdLNNGNI4szJDlP
         bT5uw6sVQUwDuIwwR9ycbgNofai1skFzL24NzGYKq09EDCdcZfwlTvF8pLIY03RMj+aT
         Gp/EEQuro7rpydEwcoWQhtQbvURLKbsiySVTrKUvGoZS9GyWQNSqEvOdTPfmV1OeUX7m
         U69DpJejE4hXH3szl4zqyO01+7QvZJpsOXXYP1qaruIimmKqU6pXqjhQ68bMLPPiSAyh
         ho+A==
X-Gm-Message-State: AOAM5332DofNAWxGa8e6tMTLiC8mAVNU+XfCJaWd62tJ625oKyzwDj6s
        5VD1w+yWmyOxDSS9TDyLmh48sw==
X-Google-Smtp-Source: ABdhPJwpotWRci303ilvNR93zydLrqXbdBre5jWXE4zvW2s/fwp1veYwI3aILh5DOtyd+eYoXLHUJQ==
X-Received: by 2002:a05:6512:b28:b0:44a:9b62:3212 with SMTP id w40-20020a0565120b2800b0044a9b623212mr11800940lfu.320.1650383628713;
        Tue, 19 Apr 2022 08:53:48 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id r25-20020ac25f99000000b00471a439838esm313911lfe.145.2022.04.19.08.53.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Apr 2022 08:53:48 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v5 2/6] drm/msm: remove extra indirection for msm_mdss
Date:   Tue, 19 Apr 2022 18:53:42 +0300
Message-Id: <20220419155346.1272627-3-dmitry.baryshkov@linaro.org>
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

Since now there is just one mdss subdriver, drop all the indirection,
make msm_mdss struct completely opaque (and defined inside msm_mdss.c)
and call mdss functions directly.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_drv.c  |  29 ++++---
 drivers/gpu/drm/msm/msm_kms.h  |  16 ++--
 drivers/gpu/drm/msm/msm_mdss.c | 140 +++++++++++++++------------------
 3 files changed, 83 insertions(+), 102 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 82b662812d72..4877d4c90465 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -980,8 +980,8 @@ static int __maybe_unused msm_runtime_suspend(struct device *dev)
 
 	DBG("");
 
-	if (mdss && mdss->funcs)
-		return mdss->funcs->disable(mdss);
+	if (mdss)
+		return msm_mdss_disable(mdss);
 
 	return 0;
 }
@@ -993,8 +993,8 @@ static int __maybe_unused msm_runtime_resume(struct device *dev)
 
 	DBG("");
 
-	if (mdss && mdss->funcs)
-		return mdss->funcs->enable(mdss);
+	if (mdss)
+		return msm_mdss_enable(mdss);
 
 	return 0;
 }
@@ -1220,6 +1220,7 @@ static const struct component_master_ops msm_drm_ops = {
 static int msm_pdev_probe(struct platform_device *pdev)
 {
 	struct component_match *match = NULL;
+	struct msm_mdss *mdss;
 	struct msm_drm_private *priv;
 	int ret;
 
@@ -1231,20 +1232,22 @@ static int msm_pdev_probe(struct platform_device *pdev)
 
 	switch (get_mdp_ver(pdev)) {
 	case KMS_MDP5:
-		ret = msm_mdss_init(pdev, true);
+		mdss = msm_mdss_init(pdev, true);
 		break;
 	case KMS_DPU:
-		ret = msm_mdss_init(pdev, false);
+		mdss = msm_mdss_init(pdev, false);
 		break;
 	default:
-		ret = 0;
+		mdss = NULL;
 		break;
 	}
-	if (ret) {
-		platform_set_drvdata(pdev, NULL);
+	if (IS_ERR(mdss)) {
+		ret = PTR_ERR(mdss);
 		return ret;
 	}
 
+	priv->mdss = mdss;
+
 	if (get_mdp_ver(pdev)) {
 		ret = add_display_components(pdev, &match);
 		if (ret)
@@ -1271,8 +1274,8 @@ static int msm_pdev_probe(struct platform_device *pdev)
 fail:
 	of_platform_depopulate(&pdev->dev);
 
-	if (priv->mdss && priv->mdss->funcs)
-		priv->mdss->funcs->destroy(priv->mdss);
+	if (priv->mdss)
+		msm_mdss_destroy(priv->mdss);
 
 	return ret;
 }
@@ -1285,8 +1288,8 @@ static int msm_pdev_remove(struct platform_device *pdev)
 	component_master_del(&pdev->dev, &msm_drm_ops);
 	of_platform_depopulate(&pdev->dev);
 
-	if (mdss && mdss->funcs)
-		mdss->funcs->destroy(mdss);
+	if (mdss)
+		msm_mdss_destroy(mdss);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index 10d5ae3e76df..09c219988884 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -201,18 +201,12 @@ struct msm_kms *dpu_kms_init(struct drm_device *dev);
 extern const struct of_device_id dpu_dt_match[];
 extern const struct of_device_id mdp5_dt_match[];
 
-struct msm_mdss_funcs {
-	int (*enable)(struct msm_mdss *mdss);
-	int (*disable)(struct msm_mdss *mdss);
-	void (*destroy)(struct msm_mdss *mdss);
-};
-
-struct msm_mdss {
-	struct device *dev;
-	const struct msm_mdss_funcs *funcs;
-};
+struct msm_mdss;
 
-int msm_mdss_init(struct platform_device *pdev, bool is_mdp5);
+struct msm_mdss *msm_mdss_init(struct platform_device *pdev, bool is_mdp5);
+int msm_mdss_enable(struct msm_mdss *mdss);
+int msm_mdss_disable(struct msm_mdss *mdss);
+void msm_mdss_destroy(struct msm_mdss *mdss);
 
 #define for_each_crtc_mask(dev, crtc, crtc_mask) \
 	drm_for_each_crtc(crtc, dev) \
diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index f4f92c11bf14..60c90a382b54 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -3,19 +3,16 @@
  * Copyright (c) 2018, The Linux Foundation
  */
 
+#include <linux/clk.h>
 #include <linux/irq.h>
 #include <linux/irqchip.h>
 #include <linux/irqdesc.h>
 #include <linux/irqchip/chained_irq.h>
-
-#include "msm_drv.h"
-#include "msm_kms.h"
+#include <linux/pm_runtime.h>
 
 /* for DPU_HW_* defines */
 #include "disp/dpu1/dpu_hw_catalog.h"
 
-#define to_dpu_mdss(x) container_of(x, struct dpu_mdss, base)
-
 #define HW_REV				0x0
 #define HW_INTR_STATUS			0x0010
 
@@ -23,8 +20,9 @@
 #define UBWC_CTRL_2			0x150
 #define UBWC_PREDICTION_MODE		0x154
 
-struct dpu_mdss {
-	struct msm_mdss base;
+struct msm_mdss {
+	struct device *dev;
+
 	void __iomem *mmio;
 	struct clk_bulk_data *clocks;
 	size_t num_clocks;
@@ -37,22 +35,22 @@ struct dpu_mdss {
 
 static void msm_mdss_irq(struct irq_desc *desc)
 {
-	struct dpu_mdss *dpu_mdss = irq_desc_get_handler_data(desc);
+	struct msm_mdss *msm_mdss = irq_desc_get_handler_data(desc);
 	struct irq_chip *chip = irq_desc_get_chip(desc);
 	u32 interrupts;
 
 	chained_irq_enter(chip, desc);
 
-	interrupts = readl_relaxed(dpu_mdss->mmio + HW_INTR_STATUS);
+	interrupts = readl_relaxed(msm_mdss->mmio + HW_INTR_STATUS);
 
 	while (interrupts) {
 		irq_hw_number_t hwirq = fls(interrupts) - 1;
 		int rc;
 
-		rc = generic_handle_domain_irq(dpu_mdss->irq_controller.domain,
+		rc = generic_handle_domain_irq(msm_mdss->irq_controller.domain,
 					       hwirq);
 		if (rc < 0) {
-			DRM_ERROR("handle irq fail: irq=%lu rc=%d\n",
+			dev_err(msm_mdss->dev, "handle irq fail: irq=%lu rc=%d\n",
 				  hwirq, rc);
 			break;
 		}
@@ -65,28 +63,28 @@ static void msm_mdss_irq(struct irq_desc *desc)
 
 static void msm_mdss_irq_mask(struct irq_data *irqd)
 {
-	struct dpu_mdss *dpu_mdss = irq_data_get_irq_chip_data(irqd);
+	struct msm_mdss *msm_mdss = irq_data_get_irq_chip_data(irqd);
 
 	/* memory barrier */
 	smp_mb__before_atomic();
-	clear_bit(irqd->hwirq, &dpu_mdss->irq_controller.enabled_mask);
+	clear_bit(irqd->hwirq, &msm_mdss->irq_controller.enabled_mask);
 	/* memory barrier */
 	smp_mb__after_atomic();
 }
 
 static void msm_mdss_irq_unmask(struct irq_data *irqd)
 {
-	struct dpu_mdss *dpu_mdss = irq_data_get_irq_chip_data(irqd);
+	struct msm_mdss *msm_mdss = irq_data_get_irq_chip_data(irqd);
 
 	/* memory barrier */
 	smp_mb__before_atomic();
-	set_bit(irqd->hwirq, &dpu_mdss->irq_controller.enabled_mask);
+	set_bit(irqd->hwirq, &msm_mdss->irq_controller.enabled_mask);
 	/* memory barrier */
 	smp_mb__after_atomic();
 }
 
 static struct irq_chip msm_mdss_irq_chip = {
-	.name = "dpu_mdss",
+	.name = "msm_mdss",
 	.irq_mask = msm_mdss_irq_mask,
 	.irq_unmask = msm_mdss_irq_unmask,
 };
@@ -96,12 +94,12 @@ static struct lock_class_key msm_mdss_lock_key, msm_mdss_request_key;
 static int msm_mdss_irqdomain_map(struct irq_domain *domain,
 		unsigned int irq, irq_hw_number_t hwirq)
 {
-	struct dpu_mdss *dpu_mdss = domain->host_data;
+	struct msm_mdss *msm_mdss = domain->host_data;
 
 	irq_set_lockdep_class(irq, &msm_mdss_lock_key, &msm_mdss_request_key);
 	irq_set_chip_and_handler(irq, &msm_mdss_irq_chip, handle_level_irq);
 
-	return irq_set_chip_data(irq, dpu_mdss);
+	return irq_set_chip_data(irq, msm_mdss);
 }
 
 static const struct irq_domain_ops msm_mdss_irqdomain_ops = {
@@ -109,34 +107,33 @@ static const struct irq_domain_ops msm_mdss_irqdomain_ops = {
 	.xlate = irq_domain_xlate_onecell,
 };
 
-static int _msm_mdss_irq_domain_add(struct dpu_mdss *dpu_mdss)
+static int _msm_mdss_irq_domain_add(struct msm_mdss *msm_mdss)
 {
 	struct device *dev;
 	struct irq_domain *domain;
 
-	dev = dpu_mdss->base.dev;
+	dev = msm_mdss->dev;
 
 	domain = irq_domain_add_linear(dev->of_node, 32,
-			&msm_mdss_irqdomain_ops, dpu_mdss);
+			&msm_mdss_irqdomain_ops, msm_mdss);
 	if (!domain) {
-		DRM_ERROR("failed to add irq_domain\n");
+		dev_err(dev, "failed to add irq_domain\n");
 		return -EINVAL;
 	}
 
-	dpu_mdss->irq_controller.enabled_mask = 0;
-	dpu_mdss->irq_controller.domain = domain;
+	msm_mdss->irq_controller.enabled_mask = 0;
+	msm_mdss->irq_controller.domain = domain;
 
 	return 0;
 }
 
-static int msm_mdss_enable(struct msm_mdss *mdss)
+int msm_mdss_enable(struct msm_mdss *msm_mdss)
 {
-	struct dpu_mdss *dpu_mdss = to_dpu_mdss(mdss);
 	int ret;
 
-	ret = clk_bulk_prepare_enable(dpu_mdss->num_clocks, dpu_mdss->clocks);
+	ret = clk_bulk_prepare_enable(msm_mdss->num_clocks, msm_mdss->clocks);
 	if (ret) {
-		DRM_ERROR("clock enable failed, ret:%d\n", ret);
+		dev_err(msm_mdss->dev, "clock enable failed, ret:%d\n", ret);
 		return ret;
 	}
 
@@ -144,64 +141,55 @@ static int msm_mdss_enable(struct msm_mdss *mdss)
 	 * HW_REV requires MDSS_MDP_CLK, which is not enabled by the mdss on
 	 * mdp5 hardware. Skip reading it for now.
 	 */
-	if (dpu_mdss->is_mdp5)
+	if (msm_mdss->is_mdp5)
 		return 0;
 
 	/*
 	 * ubwc config is part of the "mdss" region which is not accessible
 	 * from the rest of the driver. hardcode known configurations here
 	 */
-	switch (readl_relaxed(dpu_mdss->mmio + HW_REV)) {
+	switch (readl_relaxed(msm_mdss->mmio + HW_REV)) {
 	case DPU_HW_VER_500:
 	case DPU_HW_VER_501:
-		writel_relaxed(0x420, dpu_mdss->mmio + UBWC_STATIC);
+		writel_relaxed(0x420, msm_mdss->mmio + UBWC_STATIC);
 		break;
 	case DPU_HW_VER_600:
 		/* TODO: 0x102e for LP_DDR4 */
-		writel_relaxed(0x103e, dpu_mdss->mmio + UBWC_STATIC);
-		writel_relaxed(2, dpu_mdss->mmio + UBWC_CTRL_2);
-		writel_relaxed(1, dpu_mdss->mmio + UBWC_PREDICTION_MODE);
+		writel_relaxed(0x103e, msm_mdss->mmio + UBWC_STATIC);
+		writel_relaxed(2, msm_mdss->mmio + UBWC_CTRL_2);
+		writel_relaxed(1, msm_mdss->mmio + UBWC_PREDICTION_MODE);
 		break;
 	case DPU_HW_VER_620:
-		writel_relaxed(0x1e, dpu_mdss->mmio + UBWC_STATIC);
+		writel_relaxed(0x1e, msm_mdss->mmio + UBWC_STATIC);
 		break;
 	case DPU_HW_VER_720:
-		writel_relaxed(0x101e, dpu_mdss->mmio + UBWC_STATIC);
+		writel_relaxed(0x101e, msm_mdss->mmio + UBWC_STATIC);
 		break;
 	}
 
 	return ret;
 }
 
-static int msm_mdss_disable(struct msm_mdss *mdss)
+int msm_mdss_disable(struct msm_mdss *msm_mdss)
 {
-	struct dpu_mdss *dpu_mdss = to_dpu_mdss(mdss);
-
-	clk_bulk_disable_unprepare(dpu_mdss->num_clocks, dpu_mdss->clocks);
+	clk_bulk_disable_unprepare(msm_mdss->num_clocks, msm_mdss->clocks);
 
 	return 0;
 }
 
-static void msm_mdss_destroy(struct msm_mdss *mdss)
+void msm_mdss_destroy(struct msm_mdss *msm_mdss)
 {
-	struct platform_device *pdev = to_platform_device(mdss->dev);
-	struct dpu_mdss *dpu_mdss = to_dpu_mdss(mdss);
+	struct platform_device *pdev = to_platform_device(msm_mdss->dev);
 	int irq;
 
-	pm_runtime_suspend(mdss->dev);
-	pm_runtime_disable(mdss->dev);
-	irq_domain_remove(dpu_mdss->irq_controller.domain);
-	dpu_mdss->irq_controller.domain = NULL;
+	pm_runtime_suspend(msm_mdss->dev);
+	pm_runtime_disable(msm_mdss->dev);
+	irq_domain_remove(msm_mdss->irq_controller.domain);
+	msm_mdss->irq_controller.domain = NULL;
 	irq = platform_get_irq(pdev, 0);
 	irq_set_chained_handler_and_data(irq, NULL, NULL);
 }
 
-static const struct msm_mdss_funcs mdss_funcs = {
-	.enable	= msm_mdss_enable,
-	.disable = msm_mdss_disable,
-	.destroy = msm_mdss_destroy,
-};
-
 /*
  * MDP5 MDSS uses at most three specified clocks.
  */
@@ -232,51 +220,47 @@ static int mdp5_mdss_parse_clock(struct platform_device *pdev, struct clk_bulk_d
 	return num_clocks;
 }
 
-int msm_mdss_init(struct platform_device *pdev, bool is_mdp5)
+struct msm_mdss *msm_mdss_init(struct platform_device *pdev, bool is_mdp5)
 {
-	struct msm_drm_private *priv = platform_get_drvdata(pdev);
-	struct dpu_mdss *dpu_mdss;
+	struct msm_mdss *msm_mdss;
 	int ret;
 	int irq;
 
-	dpu_mdss = devm_kzalloc(&pdev->dev, sizeof(*dpu_mdss), GFP_KERNEL);
-	if (!dpu_mdss)
-		return -ENOMEM;
+	msm_mdss = devm_kzalloc(&pdev->dev, sizeof(*msm_mdss), GFP_KERNEL);
+	if (!msm_mdss)
+		return ERR_PTR(-ENOMEM);
 
-	dpu_mdss->mmio = msm_ioremap(pdev, is_mdp5 ? "mdss_phys" : "mdss");
-	if (IS_ERR(dpu_mdss->mmio))
-		return PTR_ERR(dpu_mdss->mmio);
+	msm_mdss->mmio = devm_platform_ioremap_resource_byname(pdev, is_mdp5 ? "mdss_phys" : "mdss");
+	if (IS_ERR(msm_mdss->mmio))
+		return ERR_CAST(msm_mdss->mmio);
 
-	DRM_DEBUG("mapped mdss address space @%pK\n", dpu_mdss->mmio);
+	dev_dbg(&pdev->dev, "mapped mdss address space @%pK\n", msm_mdss->mmio);
 
 	if (is_mdp5)
-		ret = mdp5_mdss_parse_clock(pdev, &dpu_mdss->clocks);
+		ret = mdp5_mdss_parse_clock(pdev, &msm_mdss->clocks);
 	else
-		ret = devm_clk_bulk_get_all(&pdev->dev, &dpu_mdss->clocks);
+		ret = devm_clk_bulk_get_all(&pdev->dev, &msm_mdss->clocks);
 	if (ret < 0) {
-		DRM_ERROR("failed to parse clocks, ret=%d\n", ret);
-		return ret;
+		dev_err(&pdev->dev, "failed to parse clocks, ret=%d\n", ret);
+		return ERR_PTR(ret);
 	}
-	dpu_mdss->num_clocks = ret;
-	dpu_mdss->is_mdp5 = is_mdp5;
+	msm_mdss->num_clocks = ret;
+	msm_mdss->is_mdp5 = is_mdp5;
 
-	dpu_mdss->base.dev = &pdev->dev;
-	dpu_mdss->base.funcs = &mdss_funcs;
+	msm_mdss->dev = &pdev->dev;
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
-		return irq;
+		return ERR_PTR(irq);
 
-	ret = _msm_mdss_irq_domain_add(dpu_mdss);
+	ret = _msm_mdss_irq_domain_add(msm_mdss);
 	if (ret)
-		return ret;
+		return ERR_PTR(ret);
 
 	irq_set_chained_handler_and_data(irq, msm_mdss_irq,
-					 dpu_mdss);
-
-	priv->mdss = &dpu_mdss->base;
+					 msm_mdss);
 
 	pm_runtime_enable(&pdev->dev);
 
-	return 0;
+	return msm_mdss;
 }
-- 
2.35.1

