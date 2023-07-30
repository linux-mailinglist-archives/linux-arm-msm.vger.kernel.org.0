Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6704768327
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Jul 2023 03:19:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229573AbjG3BTc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 29 Jul 2023 21:19:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229579AbjG3BTb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 29 Jul 2023 21:19:31 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36C8C273F
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jul 2023 18:19:29 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-99bdd262bb0so455811866b.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jul 2023 18:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690679967; x=1691284767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HFNbR+ZvV6Mfe20gE2ZzhyyeIN/0BX/Da+/Jmf9rJUI=;
        b=Z4Ht95wpLfEVy7vjq2T1WaPfX+YczvLZfNsYsLojEjcivBFXuq//EhxZFS7UzcZDAk
         +DS+xrUvbOXB+gWpQvAAHWC0nMfXDkK0vmQJSnjQFOL587S8JQr9uBPuR5BwE/TxhRFa
         8EhZ3/E1YJHaAbgnRgGHAbEIP7uGsc473U8OyVYfBdEfnVYxhWw0hkubzBaWe8t/l4aG
         ABzxO+z/cRqJBQaBvcjmNBmHOOeo5QZoMxl+YN2b2UXNSh5D1rv/hmSAhrpU7bCCTe3V
         D+Rw0rYJ/iNqKNvxA4Am1b0Szw+z5/QxjxnHN0PeeHIko+cTnVXsntR2LgpESl7WlmxO
         6KlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690679967; x=1691284767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HFNbR+ZvV6Mfe20gE2ZzhyyeIN/0BX/Da+/Jmf9rJUI=;
        b=Ema9xpB+7YfKpfRxqN6h6LcE7RPT4PZ1zbWG82wr13xq5Bk5r8infT7SyKwdwFiGD/
         QF1fnT+jJP0cukjb3m4OMgcXezenzYRDpU6cMv10vYJ42xQdLomZUM2VUqC7rkyDVxaT
         CV87kq3OrBMj9urkKUYQu42s0SY7GRTqtnrGHddIYIUA5ZJf2MYl7/RZc0VLwVNreMN8
         LaMzfxIJ65EJwynyCmnWk+gjUK9FaCD+mSLsjv+VZnd2H5Pi3a2QIZJ4YT78xHXYDogc
         AJRXa3Czp7b62PkU9TaqjdY/GR5KLPjLRrI05Qhb1dWfqi5V1gXwCdcE08IuUXgyQNQ/
         omrg==
X-Gm-Message-State: ABy/qLZ4wu6Em8f+zp9XgBmwwyO6rtjwjFN/vYBm9WkfR/318rbt/4XI
        lD/DMUO3TeVrtKZTA7SesYxKog==
X-Google-Smtp-Source: APBJJlFlBGTMMzZWosKOcNcgJMF3BsO5HpWk80Ii29DSrslmUuqRZonRm1SB34wY8JZNBvTZF2DhFg==
X-Received: by 2002:a17:906:1045:b0:987:16c6:6ff3 with SMTP id j5-20020a170906104500b0098716c66ff3mr3148949ejj.38.1690679967194;
        Sat, 29 Jul 2023 18:19:27 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id rk21-20020a170907215500b00992ea405a79sm3915835ejb.166.2023.07.29.18.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jul 2023 18:19:26 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: [PATCH v3 03/13] drm/msm/dpu: use devres-managed allocation for interrupts data
Date:   Sun, 30 Jul 2023 04:19:10 +0300
Message-Id: <20230730011920.354575-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230730011920.354575-1-dmitry.baryshkov@linaro.org>
References: <20230730011920.354575-1-dmitry.baryshkov@linaro.org>
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

Use devm_kzalloc to create interrupts data structure. This allows us to
remove corresponding kfree and drop dpu_hw_intr_destroy() function.

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 14 ++++++--------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h | 11 ++++-------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c           |  4 +---
 3 files changed, 11 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index 5e2d68ebb113..945f34736206 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -6,6 +6,8 @@
 #include <linux/debugfs.h>
 #include <linux/slab.h>
 
+#include <drm/drm_managed.h>
+
 #include "dpu_core_irq.h"
 #include "dpu_kms.h"
 #include "dpu_hw_interrupts.h"
@@ -441,8 +443,9 @@ static void __intr_offset(const struct dpu_mdss_cfg *m,
 	hw->blk_addr = addr + m->mdp[0].base;
 }
 
-struct dpu_hw_intr *dpu_hw_intr_init(void __iomem *addr,
-		const struct dpu_mdss_cfg *m)
+struct dpu_hw_intr *dpu_hw_intr_init(struct drm_device *dev,
+				     void __iomem *addr,
+				     const struct dpu_mdss_cfg *m)
 {
 	struct dpu_hw_intr *intr;
 	int nirq = MDP_INTR_MAX * 32;
@@ -450,7 +453,7 @@ struct dpu_hw_intr *dpu_hw_intr_init(void __iomem *addr,
 	if (!addr || !m)
 		return ERR_PTR(-EINVAL);
 
-	intr = kzalloc(struct_size(intr, irq_tbl, nirq), GFP_KERNEL);
+	intr = drmm_kzalloc(dev, struct_size(intr, irq_tbl, nirq), GFP_KERNEL);
 	if (!intr)
 		return ERR_PTR(-ENOMEM);
 
@@ -465,11 +468,6 @@ struct dpu_hw_intr *dpu_hw_intr_init(void __iomem *addr,
 	return intr;
 }
 
-void dpu_hw_intr_destroy(struct dpu_hw_intr *intr)
-{
-	kfree(intr);
-}
-
 int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms, int irq_idx,
 		void (*irq_cb)(void *arg, int irq_idx),
 		void *irq_arg)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
index 1f2dabc54c22..b0d7bb073203 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
@@ -70,15 +70,12 @@ struct dpu_hw_intr {
 
 /**
  * dpu_hw_intr_init(): Initializes the interrupts hw object
+ * @dev:  Corresponding device for devres management
  * @addr: mapped register io address of MDP
  * @m:    pointer to MDSS catalog data
  */
-struct dpu_hw_intr *dpu_hw_intr_init(void __iomem *addr,
-		const struct dpu_mdss_cfg *m);
+struct dpu_hw_intr *dpu_hw_intr_init(struct drm_device *dev,
+				     void __iomem *addr,
+				     const struct dpu_mdss_cfg *m);
 
-/**
- * dpu_hw_intr_destroy(): Cleanup interrutps hw object
- * @intr: pointer to interrupts hw object
- */
-void dpu_hw_intr_destroy(struct dpu_hw_intr *intr);
 #endif
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 3fe43d9be2e5..23d11bd4397e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -805,8 +805,6 @@ static void _dpu_kms_hw_destroy(struct dpu_kms *dpu_kms)
 {
 	int i;
 
-	if (dpu_kms->hw_intr)
-		dpu_hw_intr_destroy(dpu_kms->hw_intr);
 	dpu_kms->hw_intr = NULL;
 
 	/* safe to call these more than once during shutdown */
@@ -1135,7 +1133,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 		goto err_pm_put;
 	}
 
-	dpu_kms->hw_intr = dpu_hw_intr_init(dpu_kms->mmio, dpu_kms->catalog);
+	dpu_kms->hw_intr = dpu_hw_intr_init(dev, dpu_kms->mmio, dpu_kms->catalog);
 	if (IS_ERR(dpu_kms->hw_intr)) {
 		rc = PTR_ERR(dpu_kms->hw_intr);
 		DPU_ERROR("hw_intr init failed: %d\n", rc);
-- 
2.39.2

