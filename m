Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CFA83ABEC6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jun 2021 00:20:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231250AbhFQWWq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Jun 2021 18:22:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231901AbhFQWWp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Jun 2021 18:22:45 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9341EC061574
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jun 2021 15:20:37 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id d2so11177097ljj.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jun 2021 15:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bkA5c9ii0qJZG2ZzNNjKLo+VzDj5DJgDPEb9+KJ/Wzk=;
        b=ja+FatRVlB+C6a8diuIQEsuQxDJys2PjEGDmTOhv/rK67wa9XzdhrtGcLJ9u5F+CLT
         5enRg8DxL3S/DM6BqZugWDkXOuhohfTylDIj2Ykei3x79tkHOI4ssAt35ubJfgCCuD4i
         omr6eXR6LEdUbwOTOztNQdl2yeOlE7SlWsXiGYfQ8msjCDziVMaS5dag9ATu2wuyYKFG
         KdodChieV938sKa2ASSvlLFO1ky1jn9z9Z8ikxuXQ7GJE9l3dimsAyl18IKS5uvyMarS
         BEfBAB7teJ1AmUhOn8dN2qsZgHzEQfMyKLY7MH0NEDCLuyUqU2lW09tM+irhsk8UdUDq
         MeHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bkA5c9ii0qJZG2ZzNNjKLo+VzDj5DJgDPEb9+KJ/Wzk=;
        b=nbjvuEr+Ekc51JlNHjELU/ifj+CU098sHCR+TV4FGMmABdd4PikXjlNfNe3jCaHe9r
         +XiBUTKS/VRPRhUSm/t4dQQ58rS7nQPcCb6li1Vw3GQjSJvolyvilvmlq2jZCUqfgvfN
         dfCXe+EgLsoHqjKCHt25eFNeYsYfQxMU0y1WvHZLWYAfdhv30ze6cRLqmK/BpGGwZZS8
         WWRylfiLGt9JFNFuGzgtUA/QKCpHgqqF1elvWj1n7AHbOlSPrRjRH+ngw/M8fg0QTzO0
         Nnjm+CLnZxuy4F26l0CPRex2zUbK6MzhAfDylIcULZpBNdO0ZTH8K2EqCM9QQysZGhQm
         Pyvg==
X-Gm-Message-State: AOAM530mJ4nS8NNeYPeGus4K3Q63vEx08Pi4tmTC9vJyfHJSS1k+WKtM
        U0fmAYZ24mB/IMDrz5hRAhonfYUiEPsO/A==
X-Google-Smtp-Source: ABdhPJzKmpd8PGdNWRkDdxmnEgmEcOepmNSV2ikHI08mTDXJrtlkMdzGWZ5wZLRBiK7XGZ8rdemw+g==
X-Received: by 2002:a2e:751d:: with SMTP id q29mr6532604ljc.118.1623968435922;
        Thu, 17 Jun 2021 15:20:35 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id a5sm895594ljq.0.2021.06.17.15.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jun 2021 15:20:35 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v2 5/7] drm/msm/dpu: remove extra wrappers around dpu_core_irq
Date:   Fri, 18 Jun 2021 01:20:27 +0300
Message-Id: <20210617222029.463045-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210617222029.463045-1-dmitry.baryshkov@linaro.org>
References: <20210617222029.463045-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Remove extra dpu_irq_* wrappers from dpu_kms.c, merge them directly into
dpu_core_irq_* functions.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h  | 12 ++++-----
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c |  9 ++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       | 27 +++----------------
 3 files changed, 15 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h
index 44ab97fb2964..afc8cd546368 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h
@@ -10,24 +10,24 @@
 
 /**
  * dpu_core_irq_preinstall - perform pre-installation of core IRQ handler
- * @dpu_kms:		DPU handle
+ * @kms:		MSM KMS handle
  * @return:		none
  */
-void dpu_core_irq_preinstall(struct dpu_kms *dpu_kms);
+void dpu_core_irq_preinstall(struct msm_kms *kms);
 
 /**
  * dpu_core_irq_uninstall - uninstall core IRQ handler
- * @dpu_kms:		DPU handle
+ * @kms:		MSM KMS handle
  * @return:		none
  */
-void dpu_core_irq_uninstall(struct dpu_kms *dpu_kms);
+void dpu_core_irq_uninstall(struct msm_kms *kms);
 
 /**
  * dpu_core_irq - core IRQ handler
- * @dpu_kms:		DPU handle
+ * @kms:		MSM KMS handle
  * @return:		interrupt handling status
  */
-irqreturn_t dpu_core_irq(struct dpu_kms *dpu_kms);
+irqreturn_t dpu_core_irq(struct msm_kms *kms);
 
 /**
  * dpu_core_irq_read - IRQ helper function for reading IRQ status
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index 7062e7f0e860..9b74cfdf5355 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -140,8 +140,9 @@ static void dpu_core_irq_callback_handler(struct dpu_kms *dpu_kms, int irq_idx)
 	dpu_kms->hw_intr->irq_tbl[irq_idx].cb(dpu_kms->hw_intr->irq_tbl[irq_idx].arg, irq_idx);
 }
 
-irqreturn_t dpu_core_irq(struct dpu_kms *dpu_kms)
+irqreturn_t dpu_core_irq(struct msm_kms *kms)
 {
+	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
 	struct dpu_hw_intr *intr = dpu_kms->hw_intr;
 	int reg_idx;
 	int irq_idx;
@@ -526,8 +527,9 @@ void dpu_debugfs_core_irq_init(struct dpu_kms *dpu_kms,
 }
 #endif
 
-void dpu_core_irq_preinstall(struct dpu_kms *dpu_kms)
+void dpu_core_irq_preinstall(struct msm_kms *kms)
 {
+	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
 	int i;
 
 	pm_runtime_get_sync(&dpu_kms->pdev->dev);
@@ -539,8 +541,9 @@ void dpu_core_irq_preinstall(struct dpu_kms *dpu_kms)
 		atomic_set(&dpu_kms->hw_intr->irq_tbl[i].count, 0);
 }
 
-void dpu_core_irq_uninstall(struct dpu_kms *dpu_kms)
+void dpu_core_irq_uninstall(struct msm_kms *kms)
 {
+	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
 	int i;
 
 	pm_runtime_get_sync(&dpu_kms->pdev->dev);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 1d3a4f395e74..c1706205a514 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -761,20 +761,6 @@ static void _dpu_kms_set_encoder_mode(struct msm_kms *kms,
 			encoder->base.id, rc);
 }
 
-static irqreturn_t dpu_irq(struct msm_kms *kms)
-{
-	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
-
-	return dpu_core_irq(dpu_kms);
-}
-
-static void dpu_irq_preinstall(struct msm_kms *kms)
-{
-	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
-
-	dpu_core_irq_preinstall(dpu_kms);
-}
-
 static int dpu_irq_postinstall(struct msm_kms *kms)
 {
 	struct msm_drm_private *priv;
@@ -792,13 +778,6 @@ static int dpu_irq_postinstall(struct msm_kms *kms)
 	return 0;
 }
 
-static void dpu_irq_uninstall(struct msm_kms *kms)
-{
-	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
-
-	dpu_core_irq_uninstall(dpu_kms);
-}
-
 static void dpu_kms_mdp_snapshot(struct msm_disp_state *disp_state, struct msm_kms *kms)
 {
 	int i;
@@ -846,10 +825,10 @@ static void dpu_kms_mdp_snapshot(struct msm_disp_state *disp_state, struct msm_k
 
 static const struct msm_kms_funcs kms_funcs = {
 	.hw_init         = dpu_kms_hw_init,
-	.irq_preinstall  = dpu_irq_preinstall,
+	.irq_preinstall  = dpu_core_irq_preinstall,
 	.irq_postinstall = dpu_irq_postinstall,
-	.irq_uninstall   = dpu_irq_uninstall,
-	.irq             = dpu_irq,
+	.irq_uninstall   = dpu_core_irq_uninstall,
+	.irq             = dpu_core_irq,
 	.enable_commit   = dpu_kms_enable_commit,
 	.disable_commit  = dpu_kms_disable_commit,
 	.vsync_time      = dpu_kms_vsync_time,
-- 
2.30.2

