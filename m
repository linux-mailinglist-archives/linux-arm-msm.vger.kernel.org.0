Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4339474B7F0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jul 2023 22:37:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229471AbjGGUhc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Jul 2023 16:37:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230245AbjGGUhb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Jul 2023 16:37:31 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C45221986
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Jul 2023 13:37:28 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2b6ff1ad155so43210451fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Jul 2023 13:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688762247; x=1691354247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QVNUqRxGSvqZGhfUwezGpm5aWkk2unbiIok3/DPMWHk=;
        b=Cw7DbQ+exWThzz4VkPpX5E/sLH//s6l21a73QaBM6njIFcVFlQQ7apaKHRfrd92Yq2
         T/iKbBR11tnnocKGPwQIv36zKvP+VQI10QH0UfZBtLQAL/zRaEC1pRfdYfJV25/Rj3ZM
         tYSJQj+YW5YsGoynnuxLzDdjkYFOvV3PeQBFAIYkaPpYwwMlYj/LQUwukl8/1Ua00V7j
         aWDjtg9U6QSQWvj451pNU4TUggjj8c2oaIbLx9Inq1GrBYDdMHfs8GeabeKGKS4qHZAe
         nvzWbMJeN7xWogsSSJ1GiLxPTOKrVXrPtTs62vrZJiKt337JND0s/GFcOVT+Y9o/RSP2
         G0Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688762247; x=1691354247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QVNUqRxGSvqZGhfUwezGpm5aWkk2unbiIok3/DPMWHk=;
        b=IMmRia3CrN/I8BoG7no3f8pyLGHVwERGFNDf290rjGNI0dxyLTNZmYK7oqpGYYaf+X
         gVk35RQ/ZMefYXXfC9wiK70s+KmuKyaCeOzCr1IZf7RBGb9ky1vzqejaXEUi+btOZPTT
         iRMjK+wWBHvLgE+HiCd456YHj+XAfmEjSu8XS5rvALlgl2R02EBxY0blFUIWeT8Al8z/
         ML4obVS+8wGt1UwpJKdUDvnRaDZwbLC10mug9Pl5S5sv5Ytb+bmq91+i5RRg0EcsCrHE
         MlCMFzGX6vBuXFHK3FC/g+YOEphjZfTYLy3qFSOSIfKjgpibIAczuLo/nYG0hgHQgL2/
         E2nA==
X-Gm-Message-State: ABy/qLbUMH3tKQUGTQSmHlDs9ddr/Uilfazv8cHvPNseB3tHeygK9p2K
        KuuBy8sJN7tBpDI9AOKlGUdFjA==
X-Google-Smtp-Source: APBJJlHRAT7NBD93kQ4JaTf3hfiIrKgHXC6VAhcG56WhpT6ayg3RO3b8QJg9f4EMD/gb0dT+QSpe9Q==
X-Received: by 2002:a05:6512:3111:b0:4f8:52a8:d123 with SMTP id n17-20020a056512311100b004f852a8d123mr2133303lfb.12.1688762247008;
        Fri, 07 Jul 2023 13:37:27 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d4-20020ac244c4000000b004fb738796casm808899lfm.40.2023.07.07.13.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 13:37:26 -0700 (PDT)
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
Subject: [PATCH 03/13] drm/msm/dpu: use devres-managed allocation for interrupts data
Date:   Fri,  7 Jul 2023 23:37:14 +0300
Message-Id: <20230707203724.3820757-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230707203724.3820757-1-dmitry.baryshkov@linaro.org>
References: <20230707203724.3820757-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use devm_kzalloc to create interrupts data structure. This allows us to
remove corresponding kfree and drop dpu_hw_intr_destroy() function.

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
index 85b8c9cc99ef..ef232dc838c7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -807,8 +807,6 @@ static void _dpu_kms_hw_destroy(struct dpu_kms *dpu_kms)
 {
 	int i;
 
-	if (dpu_kms->hw_intr)
-		dpu_hw_intr_destroy(dpu_kms->hw_intr);
 	dpu_kms->hw_intr = NULL;
 
 	/* safe to call these more than once during shutdown */
@@ -1095,7 +1093,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 		goto err_pm_put;
 	}
 
-	dpu_kms->hw_intr = dpu_hw_intr_init(dpu_kms->mmio, dpu_kms->catalog);
+	dpu_kms->hw_intr = dpu_hw_intr_init(dev, dpu_kms->mmio, dpu_kms->catalog);
 	if (IS_ERR(dpu_kms->hw_intr)) {
 		rc = PTR_ERR(dpu_kms->hw_intr);
 		DPU_ERROR("hw_intr init failed: %d\n", rc);
-- 
2.39.2

