Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8007137A8BF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 May 2021 16:16:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231676AbhEKORH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 May 2021 10:17:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231489AbhEKORD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 May 2021 10:17:03 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4976C06174A
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 May 2021 07:15:56 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id h4so28945907lfv.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 May 2021 07:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hBmd15f4gI+skxR0YYI+l2GJSo9/7fslMrRS0N7gKa0=;
        b=sKgtrajzvCg2ZRtmkZTJrmCqvte1iHEC32EOrCls22uyvHun6xr+oqSdfVScQCBFjU
         6B8rcajY+jQS5PvD/1gZur/DfjsKKfrpzkPkAu3oAESGX71hPzgEdrOiRwKsP7BE5G6v
         RF+AVQl4RIF/+plpldSDGDfWNwPCse9C+pJJ3RsaJYeYvVd0ellsIHsKKmr2hZenTDHt
         m4/JqpShwlJbNU7jhsPLc7ML+iqLBsTYwQsfTd50BBVyiM1tj4o58hVC0jeavl3uQ3Ir
         Y4ntZV5YSjUxgIc2L3C4fMN0Ol3pR0SDvAr4tnJahXrtEZwqQfGIIzrm1RXrZCRYFkHh
         ROGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hBmd15f4gI+skxR0YYI+l2GJSo9/7fslMrRS0N7gKa0=;
        b=JVP7vZzMXE37AkW3ltU1BlcttNUwBvUrKq8eewjZhiG1g8JCNXlgZMEKOq9w4EIdFC
         sjsY2XX8JIfWyY4uRIzPLR/sZNZ4kpASAmpWVb4SG4UmUFSPqsNyplEgMAEZMDhvjnYv
         EAs05y79pfWrhqGb1t5jOiC0iaq0YyjqT1GyC9qzExEs50g/lpfGpw8Z0jIcqCX79AhH
         ghuZZ0Xwv1nU+dFjL/AoRxadJCdgTPv1VGjyFwYHeEP3rbIAZGHPUaogxt1kfZx4LeH7
         dRYmSfXt4nsaTe5YjxakwY1HB9HLOpyt8CgfK3/idaK4wFKLqGiUQESNxifUVROWefJD
         4qyQ==
X-Gm-Message-State: AOAM532nwLTs+W6XH4YseCl47Nvx55bLKDi3mgvITLhm6fOtZz5wOMnq
        KTPqxbBTQzX+Vr6duVlyJAhMcg==
X-Google-Smtp-Source: ABdhPJzag1mnJMmTyv7/ozD8pQFxGUfTFQLlxyLnM1gcs4ANl4F3DuZdLTcCgIGrSP3yBSNbvRJG0A==
X-Received: by 2002:a05:6512:3693:: with SMTP id d19mr21276699lfs.559.1620742555230;
        Tue, 11 May 2021 07:15:55 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id x207sm2649299lff.234.2021.05.11.07.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 May 2021 07:15:54 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm/dpu: simplify dpu_core_irq_en/disable helpers
Date:   Tue, 11 May 2021 17:15:54 +0300
Message-Id: <20210511141554.629380-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

dpu_core_irq_en/disable helpers are always called with the irq_count
equal to 1. Merge them with _dpu_core_en/disable functions and make them
handle just one interrupt index at a time.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c | 50 ++++----------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h | 20 ++++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c  |  4 +-
 3 files changed, 18 insertions(+), 56 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
index c10761ea191c..0ee9ac21e24a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
@@ -63,11 +63,11 @@ int dpu_core_irq_idx_lookup(struct dpu_kms *dpu_kms,
 }
 
 /**
- * _dpu_core_irq_enable - enable core interrupt given by the index
+ * dpu_core_irq_enable - enable core interrupt given by the index
  * @dpu_kms:		Pointer to dpu kms context
  * @irq_idx:		interrupt index
  */
-static int _dpu_core_irq_enable(struct dpu_kms *dpu_kms, int irq_idx)
+int dpu_core_irq_enable(struct dpu_kms *dpu_kms, int irq_idx)
 {
 	unsigned long irq_flags;
 	int ret = 0, enable_count;
@@ -85,6 +85,8 @@ static int _dpu_core_irq_enable(struct dpu_kms *dpu_kms, int irq_idx)
 	}
 
 	enable_count = atomic_read(&dpu_kms->irq_obj.enable_counts[irq_idx]);
+	if (enable_count)
+		DRM_ERROR("irq_idx=%d enable_count=%d\n", irq_idx, enable_count);
 	DRM_DEBUG_KMS("irq_idx=%d enable_count=%d\n", irq_idx, enable_count);
 	trace_dpu_core_irq_enable_idx(irq_idx, enable_count);
 
@@ -109,31 +111,12 @@ static int _dpu_core_irq_enable(struct dpu_kms *dpu_kms, int irq_idx)
 	return ret;
 }
 
-int dpu_core_irq_enable(struct dpu_kms *dpu_kms, int *irq_idxs, u32 irq_count)
-{
-	int i, ret = 0, counts;
-
-	if (!irq_idxs || !irq_count) {
-		DPU_ERROR("invalid params\n");
-		return -EINVAL;
-	}
-
-	counts = atomic_read(&dpu_kms->irq_obj.enable_counts[irq_idxs[0]]);
-	if (counts)
-		DRM_ERROR("irq_idx=%d enable_count=%d\n", irq_idxs[0], counts);
-
-	for (i = 0; (i < irq_count) && !ret; i++)
-		ret = _dpu_core_irq_enable(dpu_kms, irq_idxs[i]);
-
-	return ret;
-}
-
 /**
- * _dpu_core_irq_disable - disable core interrupt given by the index
+ * dpu_core_irq_disable - disable core interrupt given by the index
  * @dpu_kms:		Pointer to dpu kms context
  * @irq_idx:		interrupt index
  */
-static int _dpu_core_irq_disable(struct dpu_kms *dpu_kms, int irq_idx)
+int dpu_core_irq_disable(struct dpu_kms *dpu_kms, int irq_idx)
 {
 	int ret = 0, enable_count;
 
@@ -148,6 +131,8 @@ static int _dpu_core_irq_disable(struct dpu_kms *dpu_kms, int irq_idx)
 	}
 
 	enable_count = atomic_read(&dpu_kms->irq_obj.enable_counts[irq_idx]);
+	if (enable_count > 1)
+		DRM_ERROR("irq_idx=%d enable_count=%d\n", irq_idx, enable_count);
 	DRM_DEBUG_KMS("irq_idx=%d enable_count=%d\n", irq_idx, enable_count);
 	trace_dpu_core_irq_disable_idx(irq_idx, enable_count);
 
@@ -164,25 +149,6 @@ static int _dpu_core_irq_disable(struct dpu_kms *dpu_kms, int irq_idx)
 	return ret;
 }
 
-int dpu_core_irq_disable(struct dpu_kms *dpu_kms, int *irq_idxs, u32 irq_count)
-{
-	int i, ret = 0, counts;
-
-	if (!irq_idxs || !irq_count) {
-		DPU_ERROR("invalid params\n");
-		return -EINVAL;
-	}
-
-	counts = atomic_read(&dpu_kms->irq_obj.enable_counts[irq_idxs[0]]);
-	if (counts == 2)
-		DRM_ERROR("irq_idx=%d enable_count=%d\n", irq_idxs[0], counts);
-
-	for (i = 0; (i < irq_count) && !ret; i++)
-		ret = _dpu_core_irq_disable(dpu_kms, irq_idxs[i]);
-
-	return ret;
-}
-
 u32 dpu_core_irq_read(struct dpu_kms *dpu_kms, int irq_idx, bool clear)
 {
 	if (!dpu_kms->hw_intr)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h
index e30775e6585b..2ac781738e83 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h
@@ -43,34 +43,30 @@ int dpu_core_irq_idx_lookup(
 		uint32_t instance_idx);
 
 /**
- * dpu_core_irq_enable - IRQ helper function for enabling one or more IRQs
+ * dpu_core_irq_enable - IRQ helper function for enabling IRQ
  * @dpu_kms:		DPU handle
- * @irq_idxs:		Array of irq index
- * @irq_count:		Number of irq_idx provided in the array
+ * @irq_idx:		irq index
  * @return:		0 for success enabling IRQ, otherwise failure
  *
  * This function increments count on each enable and decrements on each
- * disable.  Interrupts is enabled if count is 0 before increment.
+ * disable.  Interrupt is enabled if count is 0 before increment.
  */
 int dpu_core_irq_enable(
 		struct dpu_kms *dpu_kms,
-		int *irq_idxs,
-		uint32_t irq_count);
+		int irq_idxs);
 
 /**
- * dpu_core_irq_disable - IRQ helper function for disabling one of more IRQs
+ * dpu_core_irq_disable - IRQ helper function for disabling IRQ
  * @dpu_kms:		DPU handle
- * @irq_idxs:		Array of irq index
- * @irq_count:		Number of irq_idx provided in the array
+ * @irq_idx:		irq index
  * @return:		0 for success disabling IRQ, otherwise failure
  *
  * This function increments count on each enable and decrements on each
- * disable.  Interrupts is disabled if count is 0 after decrement.
+ * disable.  Interrupt is disabled if count is 0 after decrement.
  */
 int dpu_core_irq_disable(
 		struct dpu_kms *dpu_kms,
-		int *irq_idxs,
-		uint32_t irq_count);
+		int irq_idxs);
 
 /**
  * dpu_core_irq_read - IRQ helper function for reading IRQ status
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 72eb245341bf..e365815e6e28 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -367,7 +367,7 @@ int dpu_encoder_helper_register_irq(struct dpu_encoder_phys *phys_enc,
 		return ret;
 	}
 
-	ret = dpu_core_irq_enable(phys_enc->dpu_kms, &irq->irq_idx, 1);
+	ret = dpu_core_irq_enable(phys_enc->dpu_kms, irq->irq_idx);
 	if (ret) {
 		DRM_ERROR("enable failed id=%u, intr=%d, hw=%d, irq=%d",
 			  DRMID(phys_enc->parent), intr_idx, irq->hw_idx,
@@ -400,7 +400,7 @@ int dpu_encoder_helper_unregister_irq(struct dpu_encoder_phys *phys_enc,
 		return 0;
 	}
 
-	ret = dpu_core_irq_disable(phys_enc->dpu_kms, &irq->irq_idx, 1);
+	ret = dpu_core_irq_disable(phys_enc->dpu_kms, irq->irq_idx);
 	if (ret) {
 		DRM_ERROR("disable failed id=%u, intr=%d, hw=%d, irq=%d ret=%d",
 			  DRMID(phys_enc->parent), intr_idx, irq->hw_idx,
-- 
2.30.2

