Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9166436BC8A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Apr 2021 02:18:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234598AbhD0ATR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Apr 2021 20:19:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234602AbhD0ATQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Apr 2021 20:19:16 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59056C061756
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Apr 2021 17:18:32 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id d27so34155574lfv.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Apr 2021 17:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JwxuG74uhNga9fKZWEeeRqVpEDpXYceyiLB44T+ycoQ=;
        b=dpLSCFCE3Zj3knOag1qpTpfNYYrNvVe1hJNcih/1b78uavs3DWyLrtGLitMCm9HLAo
         LjYEkoX4tHhypL4842jDbN75rUtqYBLqDCjlWwWX6QxnyhB9bEJBPfmG92PFT7LwfDp5
         S5HJCjWchmFymozr1gCS7eO4ORFTaOPhJvWC9rkzXyTATjXtOIEd9MtDmaStXkjTsi38
         A81DMy/tMVuX1iGtXB+G3drL6C68leMXWq+w423p/D42uemKZ78l7npxOTnGlT6mSH+J
         UktwcXnCoPj+DeQhCious7Fjkix2/oNaJfjJ3C0VMTHjytTDqgd+sOp0DzcT2Sbl6oPM
         sDtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JwxuG74uhNga9fKZWEeeRqVpEDpXYceyiLB44T+ycoQ=;
        b=NbAJ94wnWWWDXrNdVHGWl3xQuxWab29evzrdr/Z2EulDi0hEJ245TxEX/zWwPbunUW
         tNpXWdT+btKkcWlkU37Cq/0dWg3dAE9AMdWBSnoR8RrTyurcgeOlSlSiokZSOY8IGOAC
         D7c6zCBLDhlKcfh3+oyqF0/lNQ/6+C2uhc1DEk8bEbHElXwsqjgs6jYS/pa3Rn5PkNT8
         M/CbGMY6pFw5zAfL9gfYJG+XHsJsTrS0fNbPtfqKf8Ad5bNaXVqQ6vOLt4W8IV1AdK4p
         zY0LCoLdawwQaHEnbDBus4cF/H0MCeMzaZqpj/2jnSKd/YSJHzyTYCxwZcYaKeK+tvYm
         HEeg==
X-Gm-Message-State: AOAM531AwS40Q5UoHyL3RTR/yFTR7i+QM/SMQlp4JcyWMnNwjEGatNrX
        DH8bAUDxsHMR7IcjYkm/M2plxA==
X-Google-Smtp-Source: ABdhPJw7ZTbOTKWLQ+YRabdhLhLZtlmsEeNBpOjQIn3yfwl+RtYkyLIV4tC/+rA2XP/wERtkaBwRwQ==
X-Received: by 2002:a05:6512:10c6:: with SMTP id k6mr6656918lfg.558.1619482710904;
        Mon, 26 Apr 2021 17:18:30 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id d15sm1555100lfn.7.2021.04.26.17.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Apr 2021 17:18:30 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v2 1/4] drm/msm: pass dump state as a function argument
Date:   Tue, 27 Apr 2021 03:18:25 +0300
Message-Id: <20210427001828.2375555-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210427001828.2375555-1-dmitry.baryshkov@linaro.org>
References: <20210427001828.2375555-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Instead of always getting the disp_state from drm device, pass it as an
argument.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c         |  5 +----
 drivers/gpu/drm/msm/disp/msm_disp_snapshot.h    |  8 --------
 .../gpu/drm/msm/disp/msm_disp_snapshot_util.c   | 17 +++--------------
 drivers/gpu/drm/msm/dp/dp_display.c             |  4 +---
 drivers/gpu/drm/msm/dsi/dsi.c                   |  4 ++--
 drivers/gpu/drm/msm/dsi/dsi.h                   |  4 ++--
 drivers/gpu/drm/msm/dsi/dsi_host.c              |  6 +-----
 drivers/gpu/drm/msm/msm_drv.h                   |  3 ++-
 drivers/gpu/drm/msm/msm_kms.h                   |  2 +-
 9 files changed, 13 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index ead247864c1b..e500a9294528 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -799,15 +799,12 @@ static void dpu_irq_uninstall(struct msm_kms *kms)
 	dpu_core_irq_uninstall(dpu_kms);
 }
 
-static void dpu_kms_mdp_snapshot(struct msm_kms *kms)
+static void dpu_kms_mdp_snapshot(struct msm_disp_state *disp_state, struct msm_kms *kms)
 {
 	int i;
 	struct dpu_kms *dpu_kms;
 	struct dpu_mdss_cfg *cat;
 	struct dpu_hw_mdp *top;
-	struct msm_disp_state *disp_state;
-
-	disp_state = kms->disp_state;
 
 	dpu_kms = to_dpu_kms(kms);
 
diff --git a/drivers/gpu/drm/msm/disp/msm_disp_snapshot.h b/drivers/gpu/drm/msm/disp/msm_disp_snapshot.h
index 7e075e799f0a..32f52799a1ba 100644
--- a/drivers/gpu/drm/msm/disp/msm_disp_snapshot.h
+++ b/drivers/gpu/drm/msm/disp/msm_disp_snapshot.h
@@ -104,14 +104,6 @@ void msm_disp_snapshot_destroy(struct drm_device *drm_dev);
  */
 void msm_disp_snapshot_state(struct drm_device *drm_dev);
 
-/**
- * msm_disp_state_get - get the handle to msm_disp_state struct from the drm device
- * @drm:	    handle to drm device
-
- * Returns:	handle to the msm_disp_state struct
- */
-struct msm_disp_state *msm_disp_state_get(struct drm_device *drm);
-
 /**
  * msm_disp_state_print - print out the current dpu state
  * @disp_state:	    handle to drm device
diff --git a/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c b/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
index 44dc68295ddb..ca6632550337 100644
--- a/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
+++ b/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
@@ -69,17 +69,6 @@ static void msm_disp_state_print_regs(u32 **reg, u32 len, void __iomem *base_add
 	}
 }
 
-struct msm_disp_state *msm_disp_state_get(struct drm_device *drm)
-{
-	struct msm_drm_private *priv;
-	struct msm_kms *kms;
-
-	priv = drm->dev_private;
-	kms = priv->kms;
-
-	return kms->disp_state;
-}
-
 void msm_disp_state_print(struct msm_disp_state *state, struct drm_printer *p)
 {
 	struct msm_disp_state_block *block, *tmp;
@@ -138,17 +127,17 @@ void msm_disp_snapshot_capture_state(struct msm_disp_state *disp_state)
 	kms = priv->kms;
 
 	if (priv->dp)
-		msm_dp_snapshot(priv->dp);
+		msm_dp_snapshot(disp_state, priv->dp);
 
 	for (i = 0; i < ARRAY_SIZE(priv->dsi); i++) {
 		if (!priv->dsi[i])
 			continue;
 
-		msm_dsi_snapshot(priv->dsi[i]);
+		msm_dsi_snapshot(disp_state, priv->dsi[i]);
 	}
 
 	if (kms->funcs->snapshot)
-		kms->funcs->snapshot(kms);
+		kms->funcs->snapshot(disp_state, kms);
 
 	msm_disp_capture_atomic_state(disp_state);
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 66705588f751..95d0bba7e172 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1009,15 +1009,13 @@ int dp_display_get_test_bpp(struct msm_dp *dp)
 		dp_display->link->test_video.test_bit_depth);
 }
 
-void msm_dp_snapshot(struct msm_dp *dp)
+void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp)
 {
 	struct dp_display_private *dp_display;
 	struct drm_device *drm;
-	struct msm_disp_state *disp_state;
 
 	dp_display = container_of(dp, struct dp_display_private, dp_display);
 	drm = dp->drm_dev;
-	disp_state = msm_disp_state_get(drm);
 
 	/*
 	 * if we are reading registers we need the link clocks to be on
diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
index bccc00603aa8..322d2e535df0 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.c
+++ b/drivers/gpu/drm/msm/dsi/dsi.c
@@ -266,8 +266,8 @@ int msm_dsi_modeset_init(struct msm_dsi *msm_dsi, struct drm_device *dev,
 	return ret;
 }
 
-void msm_dsi_snapshot(struct msm_dsi *msm_dsi)
+void msm_dsi_snapshot(struct msm_disp_state *disp_state, struct msm_dsi *msm_dsi)
 {
-	msm_dsi_host_snapshot(msm_dsi->host);
+	msm_dsi_host_snapshot(disp_state, msm_dsi->host);
 }
 
diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index e26223c3b6ec..b5679cf89413 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -91,7 +91,7 @@ static inline bool msm_dsi_device_connected(struct msm_dsi *msm_dsi)
 	return msm_dsi->panel || msm_dsi->external_bridge;
 }
 
-void msm_dsi_snapshot(struct msm_dsi *msm_dsi);
+void msm_dsi_snapshot(struct msm_disp_state *disp_state, struct msm_dsi *msm_dsi);
 
 struct drm_encoder *msm_dsi_get_encoder(struct msm_dsi *msm_dsi);
 
@@ -149,7 +149,7 @@ int dsi_clk_init_v2(struct msm_dsi_host *msm_host);
 int dsi_clk_init_6g_v2(struct msm_dsi_host *msm_host);
 int dsi_calc_clk_rate_v2(struct msm_dsi_host *msm_host, bool is_dual_dsi);
 int dsi_calc_clk_rate_6g(struct msm_dsi_host *msm_host, bool is_dual_dsi);
-void msm_dsi_host_snapshot(struct mipi_dsi_host *host);
+void msm_dsi_host_snapshot(struct msm_disp_state *disp_state, struct mipi_dsi_host *host);
 /* dsi phy */
 struct msm_dsi_phy;
 struct msm_dsi_phy_shared_timings {
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 899b6fc2b634..1a63368c3912 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -2488,13 +2488,9 @@ struct drm_bridge *msm_dsi_host_get_bridge(struct mipi_dsi_host *host)
 	return of_drm_find_bridge(msm_host->device_node);
 }
 
-void msm_dsi_host_snapshot(struct mipi_dsi_host *host)
+void msm_dsi_host_snapshot(struct msm_disp_state *disp_state, struct mipi_dsi_host *host)
 {
 	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
-	struct drm_device *dev = msm_host->dev;
-	struct msm_disp_state *disp_state;
-
-	disp_state = msm_disp_state_get(dev);
 
 	pm_runtime_get_sync(&msm_host->pdev->dev);
 
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 9c40bac8a050..15cb34451ded 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -367,7 +367,8 @@ void msm_dp_display_mode_set(struct msm_dp *dp, struct drm_encoder *encoder,
 				struct drm_display_mode *mode,
 				struct drm_display_mode *adjusted_mode);
 void msm_dp_irq_postinstall(struct msm_dp *dp_display);
-void msm_dp_snapshot(struct msm_dp *dp_display);
+struct msm_disp_state;
+void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp_display);
 
 void msm_dp_debugfs_init(struct msm_dp *dp_display, struct drm_minor *minor);
 
diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index b31fdad3f055..146dcab123f4 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -124,7 +124,7 @@ struct msm_kms_funcs {
 	void (*destroy)(struct msm_kms *kms);
 
 	/* snapshot: */
-	void (*snapshot)(struct msm_kms *kms);
+	void (*snapshot)(struct msm_disp_state *disp_state, struct msm_kms *kms);
 
 #ifdef CONFIG_DEBUG_FS
 	/* debugfs: */
-- 
2.30.2

