Return-Path: <linux-arm-msm+bounces-2954-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E4164801514
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 22:19:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 96BD8281C6F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 21:19:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB16C59B44;
	Fri,  1 Dec 2023 21:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XiHTvc1B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D074B10D0
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Dec 2023 13:18:52 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2c9c149848fso33509431fa.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Dec 2023 13:18:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701465531; x=1702070331; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LXR/7tuHbtP+5AKtOICn/pEajVepnWyvGZqXoVnHuDY=;
        b=XiHTvc1B+k2nd3P7ASuu9xjfkUBUGlBGCpuKbe0r2XX2+QJuQFv6DUX/VIpcIM9SGW
         1dmAXj1u6YiYvu7WCMLOVbaKfCaOGgl0wLDmDDU2TIglHcZe8cmcawqLxQ0YbyDDmYnS
         Sr/mRdkq7/+gXybmv/Ye5RH8KC0cm4ArlZP/ZclxKQVDEwIse3c2bA1MGgilUyoFajHs
         GFSFUP6dO7j3mnvmTuykzU7CpUa197baGXFp90zhMMgEvhHElEFWMHUVUNnY4sZR0f7c
         kRqPoAMO6ZKFI7PpBLeUAymCAt7LzggbRffJnaS8hRNVWOaueu4PHRKYkyneEdFvr+k5
         QrQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701465531; x=1702070331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LXR/7tuHbtP+5AKtOICn/pEajVepnWyvGZqXoVnHuDY=;
        b=ICTVuxxe42Qpdvu+pJV0WgyaZVltP/hJwfUD/RbijSJ9CkwVVx+nr4ZhqnM8VQwExH
         vk0EVCBzPuLTFEuUPmBfvbQlX8VhT5HwDz1Y0ZUNI18tzNwOtrJDlLnSmkRciFhkl5dK
         Y0LbaUXZ3sXBW+/FquHLnJGgNJdfCn6cB41SbIPy/zrb46WYntGSR3dDQhJUfU61d3yh
         A85046tb+fSFCshiw8AUiZlF2hswmgnvAkQ+CHHr7Yzy3mHdql4pRW/q+XRDHBnOMil6
         TUt5zn8TnpiwJ+0jxdQcA+bD3Bfyu0ADQimD8qV84K9Wi6AP2SzAWFmo3+WgwXnRDk1B
         5i2w==
X-Gm-Message-State: AOJu0YzJ+7nWkMWdnPeRImpn3gPZL9kro2CGoRV7RJ3CTNQmA5n1bO8a
	o/AECzYUCf5kQGcyYq3+qmkSMw==
X-Google-Smtp-Source: AGHT+IGK48ddRqxobQmInFADoGtXMj/6d+Jdrho4qWRVFlbmJVsNq6SU6cWORLV4l9ukmfPJiffOqw==
X-Received: by 2002:a2e:a175:0:b0:2c9:d873:5c46 with SMTP id u21-20020a2ea175000000b002c9d8735c46mr1526361ljl.88.1701465531234;
        Fri, 01 Dec 2023 13:18:51 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id z4-20020a05651c022400b002c123b976acsm503612ljn.76.2023.12.01.13.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 13:18:50 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Marijn Suijten <marijn.suijten@somainline.org>
Cc: Stephen Boyd <swboyd@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: [PATCH v4 03/13] drm/msm/dpu: use devres-managed allocation for interrupts data
Date: Sat,  2 Dec 2023 00:18:35 +0300
Message-Id: <20231201211845.1026967-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231201211845.1026967-1-dmitry.baryshkov@linaro.org>
References: <20231201211845.1026967-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
index 088807db2c83..946dd0135dff 100644
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
@@ -472,8 +474,9 @@ u32 dpu_core_irq_read(struct dpu_kms *dpu_kms,
 	return intr_status;
 }
 
-struct dpu_hw_intr *dpu_hw_intr_init(void __iomem *addr,
-		const struct dpu_mdss_cfg *m)
+struct dpu_hw_intr *dpu_hw_intr_init(struct drm_device *dev,
+				     void __iomem *addr,
+				     const struct dpu_mdss_cfg *m)
 {
 	struct dpu_hw_intr *intr;
 	unsigned int i;
@@ -481,7 +484,7 @@ struct dpu_hw_intr *dpu_hw_intr_init(void __iomem *addr,
 	if (!addr || !m)
 		return ERR_PTR(-EINVAL);
 
-	intr = kzalloc(sizeof(*intr), GFP_KERNEL);
+	intr = drmm_kzalloc(dev, sizeof(*intr), GFP_KERNEL);
 	if (!intr)
 		return ERR_PTR(-ENOMEM);
 
@@ -512,11 +515,6 @@ struct dpu_hw_intr *dpu_hw_intr_init(void __iomem *addr,
 	return intr;
 }
 
-void dpu_hw_intr_destroy(struct dpu_hw_intr *intr)
-{
-	kfree(intr);
-}
-
 int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms,
 				   unsigned int irq_idx,
 				   void (*irq_cb)(void *arg),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
index 53a21ebc57e8..564b750a28fe 100644
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
index 8fa1f8f52e70..0afaea894b31 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -806,8 +806,6 @@ static void _dpu_kms_hw_destroy(struct dpu_kms *dpu_kms)
 {
 	int i;
 
-	if (dpu_kms->hw_intr)
-		dpu_hw_intr_destroy(dpu_kms->hw_intr);
 	dpu_kms->hw_intr = NULL;
 
 	/* safe to call these more than once during shutdown */
@@ -1149,7 +1147,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 		goto err_pm_put;
 	}
 
-	dpu_kms->hw_intr = dpu_hw_intr_init(dpu_kms->mmio, dpu_kms->catalog);
+	dpu_kms->hw_intr = dpu_hw_intr_init(dev, dpu_kms->mmio, dpu_kms->catalog);
 	if (IS_ERR(dpu_kms->hw_intr)) {
 		rc = PTR_ERR(dpu_kms->hw_intr);
 		DPU_ERROR("hw_intr init failed: %d\n", rc);
-- 
2.39.2


