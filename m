Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E03B4B9884
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Feb 2022 06:55:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233196AbiBQFzt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Feb 2022 00:55:49 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:34164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234540AbiBQFzt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Feb 2022 00:55:49 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07D88295FFF
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Feb 2022 21:55:34 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id g39so7921640lfv.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Feb 2022 21:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2k62AZseMfcWxapeXxcujNY0ggjEydBfDPHhBq11HOY=;
        b=VRWeu0/NZslZ0D2OZbNPBV5ySzSRK4Iw0NdlTi32/gjJ0sRDnq0XVNXl3sibjRIRDd
         yk2VNbyotott2qHt6Wf6c78Ykq1N1cLSWW1wFrO2v8xcnOeUcO90tEaoGgjdNbAi3SBP
         EUaE1ooMzN5C8KlZs0apUsCY9LLqLDrS/Ar6QVJlLKcIRaeZ774H95DOiIHEL3kpMprS
         uzHzGTC2m14jyAfVSnH0fhFwvxZM/PxoQZZseP/abXu2XjiFcd6FKu3MKXBK1HnvYy+j
         x3xIEUYF3YNFoukagS9KhxyXpAc5ldhgJCHS06u2Hfum5I6v1BtlS7iVziEaaCvUwvRa
         Cfzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2k62AZseMfcWxapeXxcujNY0ggjEydBfDPHhBq11HOY=;
        b=r0lC513mw9jMJdIwTHiy6tM5VIKvY3kCQM8ZWtjUsd+XTQ3l8Q5WdrnRmLZV3oKkPf
         4DFgBpi6yEG7w8WxE78KfdkUBasOBTfmgkrqD222bvx3gBpfqUFLI/KS2cw8RGfk1xx5
         jKYcWOJd0h+/i3Er4NCHmaBrucRzGuEOzT3AbfapE40E3+1T9xb/Lww91CjdLHNpmyUA
         c25NaXyy4ZXEJKeXCL+YjQjmdTxQdHVV/HcBjopSc87xqJ0wIHG9gBedioIui8NOArwG
         c2p81dp8zTNFiRP5kqiSZc0e9neulEpzEZj668tUOu8+7UmmUeGW07S4Oi7Ad+CS0Zer
         Kgug==
X-Gm-Message-State: AOAM530RtkxQgcoKiJui/r2ueIRrdJsVQfXMxqYsdC7rWN2b89GiCiqH
        lnxKOrrxu/ctZlB1wGERkI4XhzI2sVbmcw==
X-Google-Smtp-Source: ABdhPJxQjqTfe9Emymfatt/BW4j7OP+SvnUQsTtt1DH0yvD9xie96q9rwzdRsQWmFoJcMgCjAiDTxw==
X-Received: by 2002:a05:6512:22c4:b0:43a:13a8:7e55 with SMTP id g4-20020a05651222c400b0043a13a87e55mr1020332lfu.296.1645077331784;
        Wed, 16 Feb 2022 21:55:31 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u13sm5015998lfs.260.2022.02.16.21.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Feb 2022 21:55:31 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: [PATCH v5 1/5] drm/msm/dpu: simplify clocks handling
Date:   Thu, 17 Feb 2022 08:55:25 +0300
Message-Id: <20220217055529.499829-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220217055529.499829-1-dmitry.baryshkov@linaro.org>
References: <20220217055529.499829-1-dmitry.baryshkov@linaro.org>
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

DPU driver contains code to parse clock items from device tree into
special data struct and then enable/disable/set rate for the clocks
using that data struct. However the DPU driver itself uses only parsing
and enabling/disabling part (the rate setting is used by DP driver).

Move this implementation to the DP driver (which actually uses rate
setting) and replace hand-coded enable/disable/get loops in the DPU
with the respective clk_bulk operations. Put operation is removed
completely because, it is handled using devres instead.

DP implementation is unchanged for now.

Tested-by: Jessica Zhang <quic_jesszhan@quicinc.com> # RB3 (sdm845) and RB5  (qrb5165)
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/Makefile                  |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 23 ++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |  6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       | 46 +++----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |  4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c      | 26 +++----
 .../dpu1/dpu_io_util.c => dp/dp_clk_util.c}   | 69 +------------------
 .../dpu1/dpu_io_util.h => dp/dp_clk_util.h}   |  8 +--
 drivers/gpu/drm/msm/dp/dp_parser.h            |  2 +-
 9 files changed, 36 insertions(+), 150 deletions(-)
 rename drivers/gpu/drm/msm/{disp/dpu1/dpu_io_util.c => dp/dp_clk_util.c} (61%)
 rename drivers/gpu/drm/msm/{disp/dpu1/dpu_io_util.h => dp/dp_clk_util.h} (85%)

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index 03ab55c37beb..a44abf0a7660 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -66,7 +66,6 @@ msm-y := \
 	disp/dpu1/dpu_hw_top.o \
 	disp/dpu1/dpu_hw_util.o \
 	disp/dpu1/dpu_hw_vbif.o \
-	disp/dpu1/dpu_io_util.o \
 	disp/dpu1/dpu_kms.o \
 	disp/dpu1/dpu_mdss.o \
 	disp/dpu1/dpu_plane.o \
@@ -102,6 +101,7 @@ msm-$(CONFIG_DRM_MSM_GPU_STATE)	+= adreno/a6xx_gpu_state.o
 
 msm-$(CONFIG_DRM_MSM_DP)+= dp/dp_aux.o \
 	dp/dp_catalog.o \
+	dp/dp_clk_util.o \
 	dp/dp_ctrl.o \
 	dp/dp_display.o \
 	dp/dp_drm.o \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 60fe06018581..a7492dd6ed65 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -284,17 +284,6 @@ void dpu_core_perf_crtc_release_bw(struct drm_crtc *crtc)
 	}
 }
 
-static int _dpu_core_perf_set_core_clk_rate(struct dpu_kms *kms, u64 rate)
-{
-	struct dss_clk *core_clk = kms->perf.core_clk;
-
-	if (core_clk->max_rate && (rate > core_clk->max_rate))
-		rate = core_clk->max_rate;
-
-	core_clk->rate = rate;
-	return dev_pm_opp_set_rate(&kms->pdev->dev, core_clk->rate);
-}
-
 static u64 _dpu_core_perf_get_core_clk_rate(struct dpu_kms *kms)
 {
 	u64 clk_rate = kms->perf.perf_tune.min_core_clk;
@@ -306,7 +295,7 @@ static u64 _dpu_core_perf_get_core_clk_rate(struct dpu_kms *kms)
 			dpu_cstate = to_dpu_crtc_state(crtc->state);
 			clk_rate = max(dpu_cstate->new_perf.core_clk_rate,
 							clk_rate);
-			clk_rate = clk_round_rate(kms->perf.core_clk->clk,
+			clk_rate = clk_round_rate(kms->perf.core_clk,
 					clk_rate);
 		}
 	}
@@ -405,10 +394,10 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
 
 		trace_dpu_core_perf_update_clk(kms->dev, stop_req, clk_rate);
 
-		ret = _dpu_core_perf_set_core_clk_rate(kms, clk_rate);
+		clk_rate = min(clk_rate, kms->perf.max_core_clk_rate);
+		ret = dev_pm_opp_set_rate(&kms->pdev->dev, clk_rate);
 		if (ret) {
-			DPU_ERROR("failed to set %s clock rate %llu\n",
-					kms->perf.core_clk->clk_name, clk_rate);
+			DPU_ERROR("failed to set core clock rate %llu\n", clk_rate);
 			return ret;
 		}
 
@@ -529,13 +518,13 @@ void dpu_core_perf_destroy(struct dpu_core_perf *perf)
 int dpu_core_perf_init(struct dpu_core_perf *perf,
 		struct drm_device *dev,
 		struct dpu_mdss_cfg *catalog,
-		struct dss_clk *core_clk)
+		struct clk *core_clk)
 {
 	perf->dev = dev;
 	perf->catalog = catalog;
 	perf->core_clk = core_clk;
 
-	perf->max_core_clk_rate = core_clk->max_rate;
+	perf->max_core_clk_rate = clk_get_rate(core_clk);
 	if (!perf->max_core_clk_rate) {
 		DPU_DEBUG("optional max core clk rate, use default\n");
 		perf->max_core_clk_rate = DPU_PERF_DEFAULT_MAX_CORE_CLK_RATE;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
index cf4b9b5964c6..8dfcc6db7176 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
@@ -56,7 +56,7 @@ struct dpu_core_perf_tune {
  * @dev: Pointer to drm device
  * @debugfs_root: top level debug folder
  * @catalog: Pointer to catalog configuration
- * @core_clk: Pointer to core clock structure
+ * @core_clk: Pointer to the core clock
  * @core_clk_rate: current core clock rate
  * @max_core_clk_rate: maximum allowable core clock rate
  * @perf_tune: debug control for performance tuning
@@ -69,7 +69,7 @@ struct dpu_core_perf {
 	struct drm_device *dev;
 	struct dentry *debugfs_root;
 	struct dpu_mdss_cfg *catalog;
-	struct dss_clk *core_clk;
+	struct clk *core_clk;
 	u64 core_clk_rate;
 	u64 max_core_clk_rate;
 	struct dpu_core_perf_tune perf_tune;
@@ -120,7 +120,7 @@ void dpu_core_perf_destroy(struct dpu_core_perf *perf);
 int dpu_core_perf_init(struct dpu_core_perf *perf,
 		struct drm_device *dev,
 		struct dpu_mdss_cfg *catalog,
-		struct dss_clk *core_clk);
+		struct clk *core_clk);
 
 struct dpu_kms;
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 47fe11a84a77..9059c6d3631a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -998,29 +998,15 @@ static int _dpu_kms_mmu_init(struct dpu_kms *dpu_kms)
 	return 0;
 }
 
-static struct dss_clk *_dpu_kms_get_clk(struct dpu_kms *dpu_kms,
-		char *clock_name)
-{
-	struct dss_module_power *mp = &dpu_kms->mp;
-	int i;
-
-	for (i = 0; i < mp->num_clk; i++) {
-		if (!strcmp(mp->clk_config[i].clk_name, clock_name))
-			return &mp->clk_config[i];
-	}
-
-	return NULL;
-}
-
 u64 dpu_kms_get_clk_rate(struct dpu_kms *dpu_kms, char *clock_name)
 {
-	struct dss_clk *clk;
+	struct clk *clk;
 
-	clk = _dpu_kms_get_clk(dpu_kms, clock_name);
+	clk = msm_clk_bulk_get_clock(dpu_kms->clocks, dpu_kms->num_clocks, clock_name);
 	if (!clk)
 		return -EINVAL;
 
-	return clk_get_rate(clk->clk);
+	return clk_get_rate(clk);
 }
 
 static int dpu_kms_hw_init(struct msm_kms *kms)
@@ -1132,7 +1118,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 	}
 
 	rc = dpu_core_perf_init(&dpu_kms->perf, dev, dpu_kms->catalog,
-			_dpu_kms_get_clk(dpu_kms, "core"));
+			msm_clk_bulk_get_clock(dpu_kms->clocks, dpu_kms->num_clocks, "core"));
 	if (rc) {
 		DPU_ERROR("failed to init perf %d\n", rc);
 		goto perf_err;
@@ -1219,7 +1205,6 @@ static int dpu_bind(struct device *dev, struct device *master, void *data)
 	struct platform_device *pdev = to_platform_device(dev);
 	struct drm_device *ddev = priv->dev;
 	struct dpu_kms *dpu_kms;
-	struct dss_module_power *mp;
 	int ret = 0;
 
 	dpu_kms = devm_kzalloc(&pdev->dev, sizeof(*dpu_kms), GFP_KERNEL);
@@ -1236,12 +1221,12 @@ static int dpu_bind(struct device *dev, struct device *master, void *data)
 		return ret;
 	}
 
-	mp = &dpu_kms->mp;
-	ret = msm_dss_parse_clock(pdev, mp);
-	if (ret) {
+	ret = devm_clk_bulk_get_all(&pdev->dev, &dpu_kms->clocks);
+	if (ret < 0) {
 		DPU_ERROR("failed to parse clocks, ret=%d\n", ret);
 		return ret;
 	}
+	dpu_kms->num_clocks = ret;
 
 	platform_set_drvdata(pdev, dpu_kms);
 
@@ -1265,11 +1250,6 @@ static void dpu_unbind(struct device *dev, struct device *master, void *data)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct dpu_kms *dpu_kms = platform_get_drvdata(pdev);
-	struct dss_module_power *mp = &dpu_kms->mp;
-
-	msm_dss_put_clk(mp->clk_config, mp->num_clk);
-	devm_kfree(&pdev->dev, mp->clk_config);
-	mp->num_clk = 0;
 
 	if (dpu_kms->rpm_enabled)
 		pm_runtime_disable(&pdev->dev);
@@ -1293,21 +1273,18 @@ static int dpu_dev_remove(struct platform_device *pdev)
 
 static int __maybe_unused dpu_runtime_suspend(struct device *dev)
 {
-	int i, rc = -1;
+	int i;
 	struct platform_device *pdev = to_platform_device(dev);
 	struct dpu_kms *dpu_kms = platform_get_drvdata(pdev);
-	struct dss_module_power *mp = &dpu_kms->mp;
 
 	/* Drop the performance state vote */
 	dev_pm_opp_set_rate(dev, 0);
-	rc = msm_dss_enable_clk(mp->clk_config, mp->num_clk, false);
-	if (rc)
-		DPU_ERROR("clock disable failed rc:%d\n", rc);
+	clk_bulk_disable_unprepare(dpu_kms->num_clocks, dpu_kms->clocks);
 
 	for (i = 0; i < dpu_kms->num_paths; i++)
 		icc_set_bw(dpu_kms->path[i], 0, 0);
 
-	return rc;
+	return 0;
 }
 
 static int __maybe_unused dpu_runtime_resume(struct device *dev)
@@ -1317,7 +1294,6 @@ static int __maybe_unused dpu_runtime_resume(struct device *dev)
 	struct dpu_kms *dpu_kms = platform_get_drvdata(pdev);
 	struct drm_encoder *encoder;
 	struct drm_device *ddev;
-	struct dss_module_power *mp = &dpu_kms->mp;
 	int i;
 
 	ddev = dpu_kms->dev;
@@ -1327,7 +1303,7 @@ static int __maybe_unused dpu_runtime_resume(struct device *dev)
 	for (i = 0; i < dpu_kms->num_paths; i++)
 		icc_set_bw(dpu_kms->path[i], 0, Bps_to_icc(MIN_IB_BW));
 
-	rc = msm_dss_enable_clk(mp->clk_config, mp->num_clk, true);
+	rc = clk_bulk_prepare_enable(dpu_kms->num_clocks, dpu_kms->clocks);
 	if (rc) {
 		DPU_ERROR("clock enable failed rc:%d\n", rc);
 		return rc;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index 2d385b4b7f5e..26984bf8b8c7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -21,7 +21,6 @@
 #include "dpu_hw_lm.h"
 #include "dpu_hw_interrupts.h"
 #include "dpu_hw_top.h"
-#include "dpu_io_util.h"
 #include "dpu_rm.h"
 #include "dpu_core_perf.h"
 
@@ -113,7 +112,8 @@ struct dpu_kms {
 	struct platform_device *pdev;
 	bool rpm_enabled;
 
-	struct dss_module_power mp;
+	struct clk_bulk_data *clocks;
+	size_t num_clocks;
 
 	/* reference count bandwidth requests, so we know when we can
 	 * release bandwidth.  Each atomic update increments, and frame-
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
index 131c1f1a869c..25b0fe67ea9c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
@@ -29,7 +29,8 @@ struct dpu_irq_controller {
 struct dpu_mdss {
 	struct msm_mdss base;
 	void __iomem *mmio;
-	struct dss_module_power mp;
+	struct clk_bulk_data *clocks;
+	size_t num_clocks;
 	struct dpu_irq_controller irq_controller;
 };
 
@@ -136,10 +137,9 @@ static void _dpu_mdss_irq_domain_fini(struct dpu_mdss *dpu_mdss)
 static int dpu_mdss_enable(struct msm_mdss *mdss)
 {
 	struct dpu_mdss *dpu_mdss = to_dpu_mdss(mdss);
-	struct dss_module_power *mp = &dpu_mdss->mp;
 	int ret;
 
-	ret = msm_dss_enable_clk(mp->clk_config, mp->num_clk, true);
+	ret = clk_bulk_prepare_enable(dpu_mdss->num_clocks, dpu_mdss->clocks);
 	if (ret) {
 		DPU_ERROR("clock enable failed, ret:%d\n", ret);
 		return ret;
@@ -174,21 +174,16 @@ static int dpu_mdss_enable(struct msm_mdss *mdss)
 static int dpu_mdss_disable(struct msm_mdss *mdss)
 {
 	struct dpu_mdss *dpu_mdss = to_dpu_mdss(mdss);
-	struct dss_module_power *mp = &dpu_mdss->mp;
-	int ret;
 
-	ret = msm_dss_enable_clk(mp->clk_config, mp->num_clk, false);
-	if (ret)
-		DPU_ERROR("clock disable failed, ret:%d\n", ret);
+	clk_bulk_disable_unprepare(dpu_mdss->num_clocks, dpu_mdss->clocks);
 
-	return ret;
+	return 0;
 }
 
 static void dpu_mdss_destroy(struct msm_mdss *mdss)
 {
 	struct platform_device *pdev = to_platform_device(mdss->dev);
 	struct dpu_mdss *dpu_mdss = to_dpu_mdss(mdss);
-	struct dss_module_power *mp = &dpu_mdss->mp;
 	int irq;
 
 	pm_runtime_suspend(mdss->dev);
@@ -196,8 +191,6 @@ static void dpu_mdss_destroy(struct msm_mdss *mdss)
 	_dpu_mdss_irq_domain_fini(dpu_mdss);
 	irq = platform_get_irq(pdev, 0);
 	irq_set_chained_handler_and_data(irq, NULL, NULL);
-	msm_dss_put_clk(mp->clk_config, mp->num_clk);
-	devm_kfree(&pdev->dev, mp->clk_config);
 
 	if (dpu_mdss->mmio)
 		devm_iounmap(&pdev->dev, dpu_mdss->mmio);
@@ -214,7 +207,6 @@ int dpu_mdss_init(struct platform_device *pdev)
 {
 	struct msm_drm_private *priv = platform_get_drvdata(pdev);
 	struct dpu_mdss *dpu_mdss;
-	struct dss_module_power *mp;
 	int ret;
 	int irq;
 
@@ -228,12 +220,12 @@ int dpu_mdss_init(struct platform_device *pdev)
 
 	DRM_DEBUG("mapped mdss address space @%pK\n", dpu_mdss->mmio);
 
-	mp = &dpu_mdss->mp;
-	ret = msm_dss_parse_clock(pdev, mp);
-	if (ret) {
+	ret = devm_clk_bulk_get_all(&pdev->dev, &dpu_mdss->clocks);
+	if (ret < 0) {
 		DPU_ERROR("failed to parse clocks, ret=%d\n", ret);
 		goto clk_parse_err;
 	}
+	dpu_mdss->num_clocks = ret;
 
 	dpu_mdss->base.dev = &pdev->dev;
 	dpu_mdss->base.funcs = &mdss_funcs;
@@ -260,9 +252,7 @@ int dpu_mdss_init(struct platform_device *pdev)
 irq_error:
 	_dpu_mdss_irq_domain_fini(dpu_mdss);
 irq_domain_error:
-	msm_dss_put_clk(mp->clk_config, mp->num_clk);
 clk_parse_err:
-	devm_kfree(&pdev->dev, mp->clk_config);
 	if (dpu_mdss->mmio)
 		devm_iounmap(&pdev->dev, dpu_mdss->mmio);
 	dpu_mdss->mmio = NULL;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.c b/drivers/gpu/drm/msm/dp/dp_clk_util.c
similarity index 61%
rename from drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.c
rename to drivers/gpu/drm/msm/dp/dp_clk_util.c
index 078afc5f5882..44a4fc59ff31 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.c
+++ b/drivers/gpu/drm/msm/dp/dp_clk_util.c
@@ -11,7 +11,7 @@
 
 #include <drm/drm_print.h>
 
-#include "dpu_io_util.h"
+#include "dp_clk_util.h"
 
 void msm_dss_put_clk(struct dss_clk *clk_arry, int num_clk)
 {
@@ -118,70 +118,3 @@ int msm_dss_enable_clk(struct dss_clk *clk_arry, int num_clk, int enable)
 
 	return rc;
 }
-
-int msm_dss_parse_clock(struct platform_device *pdev,
-			struct dss_module_power *mp)
-{
-	u32 i, rc = 0;
-	const char *clock_name;
-	int num_clk = 0;
-
-	if (!pdev || !mp)
-		return -EINVAL;
-
-	mp->num_clk = 0;
-	num_clk = of_property_count_strings(pdev->dev.of_node, "clock-names");
-	if (num_clk <= 0) {
-		pr_debug("clocks are not defined\n");
-		return 0;
-	}
-
-	mp->clk_config = devm_kcalloc(&pdev->dev,
-				      num_clk, sizeof(struct dss_clk),
-				      GFP_KERNEL);
-	if (!mp->clk_config)
-		return -ENOMEM;
-
-	for (i = 0; i < num_clk; i++) {
-		rc = of_property_read_string_index(pdev->dev.of_node,
-						   "clock-names", i,
-						   &clock_name);
-		if (rc) {
-			DRM_DEV_ERROR(&pdev->dev, "Failed to get clock name for %d\n",
-				i);
-			break;
-		}
-		strlcpy(mp->clk_config[i].clk_name, clock_name,
-			sizeof(mp->clk_config[i].clk_name));
-
-		mp->clk_config[i].type = DSS_CLK_AHB;
-	}
-
-	rc = msm_dss_get_clk(&pdev->dev, mp->clk_config, num_clk);
-	if (rc) {
-		DRM_DEV_ERROR(&pdev->dev, "Failed to get clock refs %d\n", rc);
-		goto err;
-	}
-
-	rc = of_clk_set_defaults(pdev->dev.of_node, false);
-	if (rc) {
-		DRM_DEV_ERROR(&pdev->dev, "Failed to set clock defaults %d\n", rc);
-		goto err;
-	}
-
-	for (i = 0; i < num_clk; i++) {
-		u32 rate = clk_get_rate(mp->clk_config[i].clk);
-		if (!rate)
-			continue;
-		mp->clk_config[i].rate = rate;
-		mp->clk_config[i].type = DSS_CLK_PCLK;
-		mp->clk_config[i].max_rate = rate;
-	}
-
-	mp->num_clk = num_clk;
-	return 0;
-
-err:
-	msm_dss_put_clk(mp->clk_config, num_clk);
-	return rc;
-}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.h b/drivers/gpu/drm/msm/dp/dp_clk_util.h
similarity index 85%
rename from drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.h
rename to drivers/gpu/drm/msm/dp/dp_clk_util.h
index e6b5c772fa3b..067bf87f3d97 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.h
+++ b/drivers/gpu/drm/msm/dp/dp_clk_util.h
@@ -2,8 +2,8 @@
 /* Copyright (c) 2012, 2017-2018, The Linux Foundation. All rights reserved.
  */
 
-#ifndef __DPU_IO_UTIL_H__
-#define __DPU_IO_UTIL_H__
+#ifndef __DP_CLK_UTIL_H__
+#define __DP_CLK_UTIL_H__
 
 #include <linux/platform_device.h>
 #include <linux/types.h>
@@ -35,6 +35,4 @@ int msm_dss_get_clk(struct device *dev, struct dss_clk *clk_arry, int num_clk);
 void msm_dss_put_clk(struct dss_clk *clk_arry, int num_clk);
 int msm_dss_clk_set_rate(struct dss_clk *clk_arry, int num_clk);
 int msm_dss_enable_clk(struct dss_clk *clk_arry, int num_clk, int enable);
-int msm_dss_parse_clock(struct platform_device *pdev,
-		struct dss_module_power *mp);
-#endif /* __DPU_IO_UTIL_H__ */
+#endif /* __DP_CLK_UTIL_H__ */
diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h b/drivers/gpu/drm/msm/dp/dp_parser.h
index 3172da089421..094b39bfed8c 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.h
+++ b/drivers/gpu/drm/msm/dp/dp_parser.h
@@ -10,7 +10,7 @@
 #include <linux/phy/phy.h>
 #include <linux/phy/phy-dp.h>
 
-#include "dpu_io_util.h"
+#include "dp_clk_util.h"
 #include "msm_drv.h"
 
 #define DP_LABEL "MDSS DP DISPLAY"
-- 
2.34.1

