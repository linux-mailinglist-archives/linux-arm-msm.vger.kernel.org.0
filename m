Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4014D4B978B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Feb 2022 05:16:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233639AbiBQEQl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Feb 2022 23:16:41 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:44950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233653AbiBQEQk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Feb 2022 23:16:40 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46CA223D3F9
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Feb 2022 20:16:24 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id m14so7647526lfu.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Feb 2022 20:16:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dtg5/Z2GMYyUrAPpDCBg7YlfrWShGhSc7RVgL/BXArY=;
        b=mqdOf+WeeNhmuVT4wHCOWg6GTJX+U8hzvUDOrfy3mI2ttxCzZZUrmuXAPVtRxIRBTP
         zfvyPjWM2QwIKDVZNW/EyXpqfXnN6hdjNktbEwCKmfjnO7WiggdlQQYBwg7SInnZielK
         uOU8hzQCUcqHCTGb1+6HBtV+l0E5p//5YsOx7SC8wFY3j/5XHk9DvNkDCqz2taVZAIpI
         zNb7evk+iD45h9VSdr9k4NK4rgBB7gKL7fPGKniONQuQWzWhNXYR8WW3NuXBKbhw2Kx+
         TKN0JRvpZL7wUhQ0j1FWAGj1wF4X7ibu/ihh1xEqldKTDD05AzPPLpW/BRigbVyHcdME
         bwGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dtg5/Z2GMYyUrAPpDCBg7YlfrWShGhSc7RVgL/BXArY=;
        b=LBdTF05BkM94ShpHhB1Kd/7KqlsFdcFMHuSewTcd4o7vX7KduAJb4h6N6LeP4XLQ1G
         Nrpw9dMyVG2GBFdb4mXSc+SRfi0HztTYMWeYbwHA4HSrJy55lHhWsUpIVTQFl0RGQTNY
         3FinQKPj/P7agEUXURiwuPTCROaFCfabXh33zm2A8q03w/13msV8WVJTPCPymR+LZV1E
         XsphJqo4pvwKeRUa4DpsSyqniqqNYtCFI5j4qhvJRsvfAC98IDNpz5gW/5ShJ0WTn/m2
         fhYlqlhWOgiHQq6nvvhEGnu1qpuBmUtDQdlaK9gJGaOzoI/k2RN9rtMUsVOQJo/j7Zjc
         7r2w==
X-Gm-Message-State: AOAM533owjz6rZv6MFF6bWVNaslWSDP1M+C7JjAWm6//bPKTXC34XSWf
        iDiy9bB8szYp3aj2UJodnj7A3A==
X-Google-Smtp-Source: ABdhPJx8NbiRXGeOBOMT6ezH8rHnNtrJzWpcoNGeCGtRWM8TjYHgf1bxwO+Fm4AzI2KmZx6f0n34NQ==
X-Received: by 2002:a05:6512:3f18:b0:443:7b8c:5571 with SMTP id y24-20020a0565123f1800b004437b8c5571mr806335lfa.671.1645071379724;
        Wed, 16 Feb 2022 20:16:19 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id k16sm2452349ljg.25.2022.02.16.20.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Feb 2022 20:16:19 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v2 1/6] drm/msm/dpu: remove extra wrappers around dpu_core_irq
Date:   Thu, 17 Feb 2022 07:16:12 +0300
Message-Id: <20220217041617.470875-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220217041617.470875-1-dmitry.baryshkov@linaro.org>
References: <20220217041617.470875-1-dmitry.baryshkov@linaro.org>
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

Remove extra dpu_irq_* wrappers from dpu_kms.c, merge them directly into
dpu_core_irq_* functions.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h  | 12 ++++-----
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c |  9 ++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       | 27 +++----------------
 3 files changed, 15 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h
index 90ae6c9ccc95..7023ccb79814 100644
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
index a77a5eaa78ad..71882d3fe705 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -162,8 +162,9 @@ static void dpu_core_irq_callback_handler(struct dpu_kms *dpu_kms, int irq_idx)
 			cb->func(cb->arg, irq_idx);
 }
 
-irqreturn_t dpu_core_irq(struct dpu_kms *dpu_kms)
+irqreturn_t dpu_core_irq(struct msm_kms *kms)
 {
+	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
 	struct dpu_hw_intr *intr = dpu_kms->hw_intr;
 	int reg_idx;
 	int irq_idx;
@@ -569,8 +570,9 @@ void dpu_debugfs_core_irq_init(struct dpu_kms *dpu_kms,
 }
 #endif
 
-void dpu_core_irq_preinstall(struct dpu_kms *dpu_kms)
+void dpu_core_irq_preinstall(struct msm_kms *kms)
 {
+	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
 	int i;
 
 	pm_runtime_get_sync(&dpu_kms->pdev->dev);
@@ -589,8 +591,9 @@ void dpu_core_irq_preinstall(struct dpu_kms *dpu_kms)
 	}
 }
 
-void dpu_core_irq_uninstall(struct dpu_kms *dpu_kms)
+void dpu_core_irq_uninstall(struct msm_kms *kms)
 {
+	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
 	int i;
 
 	pm_runtime_get_sync(&dpu_kms->pdev->dev);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 47fe11a84a77..364bd4e60fba 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -841,20 +841,6 @@ static void dpu_kms_destroy(struct msm_kms *kms)
 	msm_kms_destroy(&dpu_kms->base);
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
@@ -874,13 +860,6 @@ static int dpu_irq_postinstall(struct msm_kms *kms)
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
@@ -933,10 +912,10 @@ static void dpu_kms_mdp_snapshot(struct msm_disp_state *disp_state, struct msm_k
 
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
2.34.1

