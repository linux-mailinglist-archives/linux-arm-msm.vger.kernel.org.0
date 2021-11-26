Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EAA945E451
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Nov 2021 03:20:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244834AbhKZCYG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Nov 2021 21:24:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357474AbhKZCWE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Nov 2021 21:22:04 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FD16C06175A
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Nov 2021 18:18:12 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id l7so15783060lja.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Nov 2021 18:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tHEwG0qG7vB9UywDg04WwYzX7P8+cxitGw10PyMAi7k=;
        b=ZUrY8t93oTCikn0xyY4SWKf6EjCcZwpndHggSv5miijtdDnE8SfbFPisKwTmhrR0q/
         0qEEYcB2Xwt6py7qHSJTmeVCjxJQ55zaWhDFIY4qLT8ZK6GXvZQPxVuyqk1hKiZ7pez3
         kcl9GkL10k4RmWLlZ0MilyIiYvh8DPNcvUlhpSUfdyj4fgLUc+RyeyoufSuIYD6EEU4s
         f3DHNmoRzy01Rjwd55vj9SrGfXiIDD/fyak+/r1/DUwFFO0or23ad3xxpMmQUbF1mm/2
         gDuSiCSPwBVJAoWaf+VbqyDfNO1p9GiL5TPwqelF33olwPqv6vjtjr036Txb+t7lFu4b
         dWpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tHEwG0qG7vB9UywDg04WwYzX7P8+cxitGw10PyMAi7k=;
        b=Bf8ypF3Hh+4Q2zCT4fo9mbvkOoQT4IX8oni/CIle1kd5b4/Rkv+GqnCzo+hXvu2lTm
         cOH8rGcFt8sJlyFYwMBnSMndt+k0ahRJSL2EH1gd3pa/hX9EYmQxQOTirgSO76typkWj
         XIFv2plY4+mSY3M/vMZah/9N3MAnpM0NYWKZirwPvcsaLIYTaJmifi3KNmGnMrGd3dAW
         Yuye+CFuuoGA1he/sV22b1gSKJg07gulDKLv1mI9J+pxpg10ZHITFCz+FAhmcEOzPBJ4
         Ul/hieHmvHkYiw5S8u9lvEdfq0mZHXPfsFA75KvmhuwOPPj5wIKrSMkvklyBgVoS4oSn
         hxbA==
X-Gm-Message-State: AOAM532ifRUWwhwc7twpfOnCN4Be9ywqTjZNxCFw2uscIwvydrSjeQu/
        VyMPN9xELN1L8iEt9o3Qw4Sv4pHneH6YYg==
X-Google-Smtp-Source: ABdhPJxmVX1f6xs25hGh7kKe133Tu3aEyrOaCWmuCC4eCcLYhDSdFp7QP3qP46qwo/krRgWw7l0zvg==
X-Received: by 2002:a2e:b01a:: with SMTP id y26mr27560359ljk.317.1637893090667;
        Thu, 25 Nov 2021 18:18:10 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id g6sm387328lfu.275.2021.11.25.18.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 18:18:10 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm/dpu: remove extra wrappers around dpu_core_irq
Date:   Fri, 26 Nov 2021 05:18:09 +0300
Message-Id: <20211126021809.1105535-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
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
index fc1b6c47c93d..d76edf55693a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -144,8 +144,9 @@ static void dpu_core_irq_callback_handler(struct dpu_kms *dpu_kms, int irq_idx)
 			cb->func(cb->arg, irq_idx);
 }
 
-irqreturn_t dpu_core_irq(struct dpu_kms *dpu_kms)
+irqreturn_t dpu_core_irq(struct msm_kms *kms)
 {
+	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
 	struct dpu_hw_intr *intr = dpu_kms->hw_intr;
 	int reg_idx;
 	int irq_idx;
@@ -551,8 +552,9 @@ void dpu_debugfs_core_irq_init(struct dpu_kms *dpu_kms,
 }
 #endif
 
-void dpu_core_irq_preinstall(struct dpu_kms *dpu_kms)
+void dpu_core_irq_preinstall(struct msm_kms *kms)
 {
+	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
 	int i;
 
 	pm_runtime_get_sync(&dpu_kms->pdev->dev);
@@ -571,8 +573,9 @@ void dpu_core_irq_preinstall(struct dpu_kms *dpu_kms)
 	}
 }
 
-void dpu_core_irq_uninstall(struct dpu_kms *dpu_kms)
+void dpu_core_irq_uninstall(struct msm_kms *kms)
 {
+	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
 	int i;
 
 	if (!dpu_kms->hw_intr)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index a15b26428280..704474c4d655 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -784,20 +784,6 @@ static void dpu_kms_destroy(struct msm_kms *kms)
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
@@ -817,13 +803,6 @@ static int dpu_irq_postinstall(struct msm_kms *kms)
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
@@ -871,10 +850,10 @@ static void dpu_kms_mdp_snapshot(struct msm_disp_state *disp_state, struct msm_k
 
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
2.33.0

