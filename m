Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26B4536A842
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Apr 2021 18:08:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230288AbhDYQIz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 25 Apr 2021 12:08:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230331AbhDYQIr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 25 Apr 2021 12:08:47 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1C91C061756
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Apr 2021 09:08:06 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id h36so30428870lfv.7
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Apr 2021 09:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BMIhpj4wAIh3nwl08GQFavQMlt1NeZvB1JQeAErJ4VA=;
        b=J80NcvRv6JkCBV6fZ8vi4ijaDHlivWu4V49S0mETXbSoM97bgam828lzoGWOmzomIx
         7PivQK6qQO1wer3KVvnokJvpqo+y8ujQPF9LMOpw7V6E3fo+YM/pVh0IeIXS7k0CFQtv
         RUW4eBRDPCxoqrHPLy8JJfZfRUo+fZpKYcJZWU0cK288zAIuYnXzlsSWh743qGEUEKRF
         lVsTOD9zXQjG2l19PtIS+ArHI056fHEHESqkXb563LleZC58WO+rVx+WvDdyprpNNHMG
         pAc763yWe7Fe35ZL+QNuiXgDICFs/pyg2mdAkVt0OiE8kfL6cJAqNntlsZlKMWJ1zt13
         Yd8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BMIhpj4wAIh3nwl08GQFavQMlt1NeZvB1JQeAErJ4VA=;
        b=pFAoeGmr5kXLsl3Q0HirAGkdLbjcIHe9XiVv/E+Kz5kQsqcIUrg/YsGx9zY6tUBZQG
         v6+CmPj6JpIvNyRHxMZgHcL3F/PgQKW7BFCA//2vThtX9ekXSvy2OgwTKug5nsl1uGA9
         XCU5ricpohZmq21enMHBAP0Lgt++11zAaD/xrbXpZUvN2hE646QPXYzmIKGUvxGgg5Cw
         UTwmCtC3lJ8dok5GY4td3L7dqkZOsFjlwQs5BdWok8+N2TPHvXi5PTxuhzvbv0KWKw/I
         4xWuIA6hIcugfuKzImDj4si3F9kr5OEVijR935vCMPtkM+RPVb2zZRFv+IxJRSaAFLVq
         nEiQ==
X-Gm-Message-State: AOAM5319gu6ksfplPuv7PQ3J2MxCRPr32rsGVvW35HJfWsMoLnbDHDDe
        xxOReBoDTzPlrQtA7XurMUrMQw==
X-Google-Smtp-Source: ABdhPJy6m37Ssb2qkLIbvhlF6cprjAdU4ClfqwxRq74RfNtCo6V6N1p3JWskTwOuSbxsuWi86uk5yQ==
X-Received: by 2002:ac2:4ecc:: with SMTP id p12mr9572836lfr.531.1619366885232;
        Sun, 25 Apr 2021 09:08:05 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id l24sm1141575lfc.23.2021.04.25.09.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Apr 2021 09:08:04 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 1/2] drm/msm: pass dump state as a function argument
Date:   Sun, 25 Apr 2021 19:07:59 +0300
Message-Id: <20210425160800.1201337-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210425160800.1201337-1-dmitry.baryshkov@linaro.org>
References: <20210425160800.1201337-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Instead of always getting the disp_state from drm device, pass it as an
argument.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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

