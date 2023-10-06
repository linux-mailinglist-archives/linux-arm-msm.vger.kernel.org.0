Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6B6D7BB932
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Oct 2023 15:37:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232082AbjJFNh3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Oct 2023 09:37:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232300AbjJFNh2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Oct 2023 09:37:28 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71E1C9F
        for <linux-arm-msm@vger.kernel.org>; Fri,  6 Oct 2023 06:37:25 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-505748580ceso2717603e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Oct 2023 06:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696599444; x=1697204244; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gyJMLPywgfD3zTWmrTHppa2YLQ4qubiZc1LQVFl5178=;
        b=MARFraXJ0KAJi4G1ypouasEtaY3MxHdQANrlDSZ/wZemcF2ACY6oTc8SiLKTCKFlUX
         K0KQBz+Iwvui6oK0NJB0d2W/ibDTiMUwzgYh1/DXDGO9BpB9IJXa+VEkYB0rFjbmqYMA
         KCyTRXMhg6NXaSDeMD7eI2HJTfj9aeTUK8I9dmL85Cgw1+IU65HJjXtSUWWpJQ/cjF1W
         GBXLcW9/lw8/pfzoSz8LWTFIRFDxAdogf7hAy4RuJiBASAu7hc/gi8P8sfDLCWjMY/o5
         OYjuUR+Q9ZH3MHXUeW+DOBg5hd77oqy1yiGUwBp5c84OK13NF383vagLTlfVDUrImtqR
         aCwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696599444; x=1697204244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gyJMLPywgfD3zTWmrTHppa2YLQ4qubiZc1LQVFl5178=;
        b=iunm3LBrzs7KryGRJ7W9Hb4wKFh1kzDXAFdDQvWFAiX/O8a6mWO/NYixqUxruPRn/4
         Cu3Z+B5qGMAJuDoBMnocnChnIxzHUw7uX4dm4xMz8e24Nc5UxP75UrV9mZgWID6qhr+w
         8tytGTmGIvmyE8/WHHABcikv3koUjC3PWM7k82p5mHPXJcctX68lQuuR/IVEWsK1dyh2
         cfxgxU2KaUCgFwJ8gUW+qRXIF2kUzXIBTBndD1j/PLGyuJafqi83NyXbXRoXuVCnylH2
         6wJRdz1foY35NVwxfZeToHZNYIAnW9GjvmQFPrALNRagHsGKu55hMU7fNTcNNpisWShm
         Sn1Q==
X-Gm-Message-State: AOJu0Yyg+gGUGYBT8+u/VWuH2jnUg0r8+cqiZUX49CDgivoeeR0lwSUx
        0rWJBrCf5JFhIwjGeFBWA9aINg==
X-Google-Smtp-Source: AGHT+IH6c2ZYwGnOkl33KIei9yXzOw5rsLB1ZiighPCughyBVaqBkrAqKQdB+hxQZ9tpdW15OCtWnw==
X-Received: by 2002:a05:6512:ba7:b0:500:a3be:1ab6 with SMTP id b39-20020a0565120ba700b00500a3be1ab6mr8799100lfv.6.1696599443728;
        Fri, 06 Oct 2023 06:37:23 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id m27-20020a056512015b00b0050567cdb8f6sm303534lfo.239.2023.10.06.06.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 06:37:23 -0700 (PDT)
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
Subject: [PATCH v2 2/5] drm/msm/dpu: support binding to the mdp5 devices
Date:   Fri,  6 Oct 2023 16:37:17 +0300
Message-Id: <20231006133720.2471770-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231006133720.2471770-1-dmitry.baryshkov@linaro.org>
References: <20231006133720.2471770-1-dmitry.baryshkov@linaro.org>
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

Existing MDP5 devices have slightly different bindings. The main
register region is called `mdp_phys' instead of `mdp'. Also vbif
register regions are a part of the parent, MDSS device. Add support for
handling this binding differences.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 88 ++++++++++++++++++++-----
 drivers/gpu/drm/msm/msm_drv.h           |  3 +
 drivers/gpu/drm/msm/msm_io_utils.c      | 13 ++++
 3 files changed, 86 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 82381d12414d..20ba03e9c936 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1054,37 +1054,53 @@ unsigned long dpu_kms_get_clk_rate(struct dpu_kms *dpu_kms, char *clock_name)
 
 #define	DPU_PERF_DEFAULT_MAX_CORE_CLK_RATE	412500000
 
-static int dpu_kms_hw_init(struct msm_kms *kms)
+static int dpu_kms_mmap_mdp5(struct dpu_kms *dpu_kms)
 {
-	struct dpu_kms *dpu_kms;
-	struct drm_device *dev;
-	int i, rc = -EINVAL;
-	unsigned long max_core_clk_rate;
-	u32 core_rev;
+	struct platform_device *mdss_dev;
+	int rc;
 
-	if (!kms) {
-		DPU_ERROR("invalid kms\n");
+	mdss_dev = to_platform_device(dpu_kms->pdev->dev.parent);
+
+	dpu_kms->mmio = msm_ioremap(dpu_kms->pdev, "mdp_phys");
+	if (IS_ERR(dpu_kms->mmio)) {
+		rc = PTR_ERR(dpu_kms->mmio);
+		DPU_ERROR("mdp register memory map failed: %d\n", rc);
+		dpu_kms->mmio = NULL;
 		return rc;
 	}
+	DRM_DEBUG("mapped dpu address space @%pK\n", dpu_kms->mmio);
 
-	dpu_kms = to_dpu_kms(kms);
-	dev = dpu_kms->dev;
+	dpu_kms->vbif[VBIF_RT] = msm_ioremap_mdss(mdss_dev,
+						  dpu_kms->pdev,
+						  "vbif_phys");
+	if (IS_ERR(dpu_kms->vbif[VBIF_RT])) {
+		rc = PTR_ERR(dpu_kms->vbif[VBIF_RT]);
+		DPU_ERROR("vbif register memory map failed: %d\n", rc);
+		dpu_kms->vbif[VBIF_RT] = NULL;
+		return rc;
+	}
 
-	dev->mode_config.cursor_width = 512;
-	dev->mode_config.cursor_height = 512;
+	dpu_kms->vbif[VBIF_NRT] = msm_ioremap_mdss(mdss_dev,
+						   dpu_kms->pdev,
+						   "vbif_nrt_phys");
+	if (IS_ERR(dpu_kms->vbif[VBIF_NRT])) {
+		dpu_kms->vbif[VBIF_NRT] = NULL;
+		DPU_DEBUG("VBIF NRT is not defined");
+	}
 
-	rc = dpu_kms_global_obj_init(dpu_kms);
-	if (rc)
-		return rc;
+	return 0;
+}
 
-	atomic_set(&dpu_kms->bandwidth_ref, 0);
+static int dpu_kms_mmap_dpu(struct dpu_kms *dpu_kms)
+{
+	int rc;
 
 	dpu_kms->mmio = msm_ioremap(dpu_kms->pdev, "mdp");
 	if (IS_ERR(dpu_kms->mmio)) {
 		rc = PTR_ERR(dpu_kms->mmio);
 		DPU_ERROR("mdp register memory map failed: %d\n", rc);
 		dpu_kms->mmio = NULL;
-		goto error;
+		return rc;
 	}
 	DRM_DEBUG("mapped dpu address space @%pK\n", dpu_kms->mmio);
 
@@ -1093,14 +1109,50 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 		rc = PTR_ERR(dpu_kms->vbif[VBIF_RT]);
 		DPU_ERROR("vbif register memory map failed: %d\n", rc);
 		dpu_kms->vbif[VBIF_RT] = NULL;
-		goto error;
+		return rc;
 	}
+
 	dpu_kms->vbif[VBIF_NRT] = msm_ioremap_quiet(dpu_kms->pdev, "vbif_nrt");
 	if (IS_ERR(dpu_kms->vbif[VBIF_NRT])) {
 		dpu_kms->vbif[VBIF_NRT] = NULL;
 		DPU_DEBUG("VBIF NRT is not defined");
 	}
 
+	return 0;
+}
+
+static int dpu_kms_hw_init(struct msm_kms *kms)
+{
+	struct dpu_kms *dpu_kms;
+	struct drm_device *dev;
+	int i, rc = -EINVAL;
+	unsigned long max_core_clk_rate;
+	u32 core_rev;
+
+	if (!kms) {
+		DPU_ERROR("invalid kms\n");
+		return rc;
+	}
+
+	dpu_kms = to_dpu_kms(kms);
+	dev = dpu_kms->dev;
+
+	dev->mode_config.cursor_width = 512;
+	dev->mode_config.cursor_height = 512;
+
+	rc = dpu_kms_global_obj_init(dpu_kms);
+	if (rc)
+		return rc;
+
+	atomic_set(&dpu_kms->bandwidth_ref, 0);
+
+	if (of_device_is_compatible(dpu_kms->pdev->dev.of_node, "qcom,mdp5"))
+		rc = dpu_kms_mmap_mdp5(dpu_kms);
+	else
+		rc = dpu_kms_mmap_dpu(dpu_kms);
+	if (rc)
+		return rc;
+
 	dpu_kms_parse_data_bus_icc_path(dpu_kms);
 
 	rc = pm_runtime_resume_and_get(&dpu_kms->pdev->dev);
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index e2fc56f161b5..6eeb3517c3e4 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -485,6 +485,9 @@ void __iomem *msm_ioremap(struct platform_device *pdev, const char *name);
 void __iomem *msm_ioremap_size(struct platform_device *pdev, const char *name,
 		phys_addr_t *size);
 void __iomem *msm_ioremap_quiet(struct platform_device *pdev, const char *name);
+void __iomem *msm_ioremap_mdss(struct platform_device *mdss_pdev,
+			       struct platform_device *dev,
+			       const char *name);
 
 struct icc_path *msm_icc_get(struct device *dev, const char *name);
 
diff --git a/drivers/gpu/drm/msm/msm_io_utils.c b/drivers/gpu/drm/msm/msm_io_utils.c
index 59d2788c4510..afedd61c3e28 100644
--- a/drivers/gpu/drm/msm/msm_io_utils.c
+++ b/drivers/gpu/drm/msm/msm_io_utils.c
@@ -50,6 +50,19 @@ struct clk *msm_clk_get(struct platform_device *pdev, const char *name)
 	return clk;
 }
 
+void __iomem *msm_ioremap_mdss(struct platform_device *mdss_pdev,
+			       struct platform_device *pdev,
+			       const char *name)
+{
+	struct resource *res;
+
+	res = platform_get_resource_byname(mdss_pdev, IORESOURCE_MEM, name);
+	if (!res)
+		return ERR_PTR(-EINVAL);
+
+	return devm_ioremap_resource(&pdev->dev, res);
+}
+
 static void __iomem *_msm_ioremap(struct platform_device *pdev, const char *name,
 				  bool quiet, phys_addr_t *psize)
 {
-- 
2.39.2

