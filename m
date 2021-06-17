Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D6B83AB576
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jun 2021 16:09:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231437AbhFQOL0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Jun 2021 10:11:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231311AbhFQOLZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Jun 2021 10:11:25 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6427EC061574
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jun 2021 07:09:16 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id q20so10791747lfo.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jun 2021 07:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4XEPDWpou1Uj6o1MsManrUpa1eNXrSdOdZOLHnBXclU=;
        b=VScIFoYNixSH3ebhBZLrngzUYoBNDhwnW2byROfEwAsu8x6hmXJLSFMg5NvCK9nTsz
         agbgyGnCubBbr97FdKFJH4ZCCHMF9J+qqQSuRl9ijS8LqBEBf4FAYisZZAGaw56olEJu
         N7HYDM00MzUZVvPa90t/ZaJ/2Dm9tR128oNIeb7bJMTKAUqIGoS9BmvQ+3KZdOwCV+E+
         J4YVQgh7DgTzIYPfBDsLFkvfOF+ELjPN2147kZ/1zOroVzy2169GRnTSVL14riSxMeqZ
         4YW35EPdoYzhk0uVE7k1vt1mHStG/6xTTm25EyhXIZa88FBYdJ0kqQbK08z/WBWYl2qL
         hDJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4XEPDWpou1Uj6o1MsManrUpa1eNXrSdOdZOLHnBXclU=;
        b=IrWhpS/6sVWnFVzvHYjwVOPPPtOg418E4wJL3/k7bYgld0WiJ1yeCsNBrYrnAuBkse
         cYiLk7XzoNbLEtIyRB12FmB8xXpCo8DYW6oFYEjhMIhmOew4IRnATIhV+z5GJjR6i0Ce
         vVwt8ARrmMRM/xguryr4rHWgvSmfXu8gGV686yZEB+BzNBazVsB6Z35qSg7LUMa9e5Q0
         VrSwghJ61yAFcM6+r2wHtb6IbL4ctDTNMaRwqRDxhT2zDuaLwnipJK8rKJ2sQMRSsghw
         ML13t5meTyYyNyH0VaqIQRii8ZmCeP596HuQBPI+hoZ0sLhq/iPmkKvHi3UsKNdSij/+
         Ii2g==
X-Gm-Message-State: AOAM530rjjnuGJUh0s+F7d54qQjjggEZai7VdQSYDPAl95/Ij4Wc/Pma
        STG8yN3GLu/Kjq4wdnnDanxmhw==
X-Google-Smtp-Source: ABdhPJzhz9N6740hGPG7WppBlpP6ATPMVwFH3mvMI5arVfteh31rsu7rZzkilY34oaGBKVPK64NTJw==
X-Received: by 2002:a05:6512:3044:: with SMTP id b4mr4024782lfb.289.1623938954742;
        Thu, 17 Jun 2021 07:09:14 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f23sm592471lfm.128.2021.06.17.07.09.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jun 2021 07:09:14 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 5/7] drm/msm/dpu: remove extra wrappers around dpu_core_irq
Date:   Thu, 17 Jun 2021 17:09:06 +0300
Message-Id: <20210617140908.412298-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210617140908.412298-1-dmitry.baryshkov@linaro.org>
References: <20210617140908.412298-1-dmitry.baryshkov@linaro.org>
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
index 73a20fc5c766..124b38e2102c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -156,8 +156,9 @@ static void dpu_core_irq_callback_handler(struct dpu_kms *dpu_kms, int irq_idx)
 			cb->func(cb->arg, irq_idx);
 }
 
-irqreturn_t dpu_core_irq(struct dpu_kms *dpu_kms)
+irqreturn_t dpu_core_irq(struct msm_kms *kms)
 {
+	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
 	struct dpu_hw_intr *intr = dpu_kms->hw_intr;
 	int reg_idx;
 	int irq_idx;
@@ -583,8 +584,9 @@ void dpu_debugfs_core_irq_init(struct dpu_kms *dpu_kms,
 }
 #endif
 
-void dpu_core_irq_preinstall(struct dpu_kms *dpu_kms)
+void dpu_core_irq_preinstall(struct msm_kms *kms)
 {
+	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
 	int i;
 
 	pm_runtime_get_sync(&dpu_kms->pdev->dev);
@@ -603,8 +605,9 @@ void dpu_core_irq_preinstall(struct dpu_kms *dpu_kms)
 	}
 }
 
-void dpu_core_irq_uninstall(struct dpu_kms *dpu_kms)
+void dpu_core_irq_uninstall(struct msm_kms *kms)
 {
+	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
 	int i;
 
 	pm_runtime_get_sync(&dpu_kms->pdev->dev);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index e500a9294528..0e4352a4c28c 100644
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

