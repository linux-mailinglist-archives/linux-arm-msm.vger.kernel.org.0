Return-Path: <linux-arm-msm+bounces-2955-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D810801515
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 22:19:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5FA521C2098D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 21:19:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 385FD58ADC;
	Fri,  1 Dec 2023 21:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZLIU1KgO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D59D710D7
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Dec 2023 13:18:53 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-50bc57d81f4so3806196e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Dec 2023 13:18:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701465532; x=1702070332; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GUzB2tbp3esC0KLDbConpOHJHGgMLh8bEbyQXdbmp+g=;
        b=ZLIU1KgOQ+CwogEWmsKAXAaqdFVHWsvBwwBUgc3fy5wkL4fn3OL5KTGtush/VUHKak
         hkmet7ZfjVSl4/5sByBLGF6iHwDY4ImjCiExMfRCwlRgMlKiC3lbYSzfNYfDAYmHA4bF
         f3VJYWzwIK9HI3ApYUK8wRabwhldM2h/8cRORLB6wQuOp4qT+a+taGK6Ly0YTX+ueXMA
         oS4qGeOqFul4+9e1wTS6AFIL1R822RDxdUoaEgWeUzivmHYw0WrOEvNLOr0tcQ44UqMZ
         3tpZxYx3+TRn1yDvjLg42egxcXR/0LusqR4pFy2EyOMZ2K5k7JXPseHqo3SRuYb7PBzn
         10xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701465532; x=1702070332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GUzB2tbp3esC0KLDbConpOHJHGgMLh8bEbyQXdbmp+g=;
        b=VlnqT9Fy5fYeMcxTrIEVoJOZDw1Lwxql3yY940VvFy2CEkDV3+KU+PyT8pmx9VNOP8
         L87dfVTVoLBLzRCSt/TkosH5d848k8+VlLK6gYDfF0OYCEJ8pBsbAvaZszSLI1Nf4leK
         5tllDgV4P6JGF3pMX9+XR1TG1bY7ajVGFSEJePUbWXI2FLoRbPkyTsluzxB0rwShlIiZ
         ad0zPy6ub3LLsG+YAmVykIGEnolOJMV0WFmReB0ZxUpiqIl74sOMI+3c0Ph+nzItnQ5l
         e6s9C8OQvcO/I9v1k403fuIEDicpesEbzlOhVkJEbNwg5pHh3Bw4T7tLUoHjBMX1Dbhc
         Iw2w==
X-Gm-Message-State: AOJu0YxQ0xiGcnHN9M8xPVXKUuwl4U+2yxkrKYgQ8nlzMGqP1/CRY34m
	/iMl2YZz7uPxsBPDZYLcua9tBA==
X-Google-Smtp-Source: AGHT+IF33OqMQm1+EzsyracFItCU6AIe+w/7i3U8/fakUwACn6PmVPjDj/wnBcy13+yT/ccbveXwrA==
X-Received: by 2002:a2e:be9c:0:b0:2c9:c0f8:67e8 with SMTP id a28-20020a2ebe9c000000b002c9c0f867e8mr1583306ljr.12.1701465532241;
        Fri, 01 Dec 2023 13:18:52 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id z4-20020a05651c022400b002c123b976acsm503612ljn.76.2023.12.01.13.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 13:18:51 -0800 (PST)
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
Subject: [PATCH v4 04/13] drm/msm/dpu: use devres-managed allocation for VBIF data
Date: Sat,  2 Dec 2023 00:18:36 +0300
Message-Id: <20231201211845.1026967-5-dmitry.baryshkov@linaro.org>
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

Use devm_kzalloc to create VBIF data structure. This allows us to
remove corresponding kfree and drop dpu_hw_vbif_destroy() function.

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c | 14 ++++++--------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h |  8 ++++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 11 +++--------
 3 files changed, 13 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c
index a5121a50b2bb..98e34afde2d2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c
@@ -2,6 +2,8 @@
 /* Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
  */
 
+#include <drm/drm_managed.h>
+
 #include "dpu_hwio.h"
 #include "dpu_hw_catalog.h"
 #include "dpu_hw_vbif.h"
@@ -211,12 +213,13 @@ static void _setup_vbif_ops(struct dpu_hw_vbif_ops *ops,
 	ops->set_write_gather_en = dpu_hw_set_write_gather_en;
 }
 
-struct dpu_hw_vbif *dpu_hw_vbif_init(const struct dpu_vbif_cfg *cfg,
-		void __iomem *addr)
+struct dpu_hw_vbif *dpu_hw_vbif_init(struct drm_device *dev,
+				     const struct dpu_vbif_cfg *cfg,
+				     void __iomem *addr)
 {
 	struct dpu_hw_vbif *c;
 
-	c = kzalloc(sizeof(*c), GFP_KERNEL);
+	c = drmm_kzalloc(dev, sizeof(*c), GFP_KERNEL);
 	if (!c)
 		return ERR_PTR(-ENOMEM);
 
@@ -234,8 +237,3 @@ struct dpu_hw_vbif *dpu_hw_vbif_init(const struct dpu_vbif_cfg *cfg,
 
 	return c;
 }
-
-void dpu_hw_vbif_destroy(struct dpu_hw_vbif *vbif)
-{
-	kfree(vbif);
-}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h
index 7e10d2a172b4..e2b4307500e4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h
@@ -108,12 +108,12 @@ struct dpu_hw_vbif {
 /**
  * dpu_hw_vbif_init() - Initializes the VBIF driver for the passed
  * VBIF catalog entry.
+ * @dev:  Corresponding device for devres management
  * @cfg:  VBIF catalog entry for which driver object is required
  * @addr: Mapped register io address of MDSS
  */
-struct dpu_hw_vbif *dpu_hw_vbif_init(const struct dpu_vbif_cfg *cfg,
-		void __iomem *addr);
-
-void dpu_hw_vbif_destroy(struct dpu_hw_vbif *vbif);
+struct dpu_hw_vbif *dpu_hw_vbif_init(struct drm_device *dev,
+				     const struct dpu_vbif_cfg *cfg,
+				     void __iomem *addr);
 
 #endif /*_DPU_HW_VBIF_H */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 0afaea894b31..e1fbac351fc2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -811,13 +811,8 @@ static void _dpu_kms_hw_destroy(struct dpu_kms *dpu_kms)
 	/* safe to call these more than once during shutdown */
 	_dpu_kms_mmu_destroy(dpu_kms);
 
-	if (dpu_kms->catalog) {
-		for (i = 0; i < ARRAY_SIZE(dpu_kms->hw_vbif); i++) {
-			if (dpu_kms->hw_vbif[i]) {
-				dpu_hw_vbif_destroy(dpu_kms->hw_vbif[i]);
-				dpu_kms->hw_vbif[i] = NULL;
-			}
-		}
+	for (i = 0; i < ARRAY_SIZE(dpu_kms->hw_vbif); i++) {
+		dpu_kms->hw_vbif[i] = NULL;
 	}
 
 	if (dpu_kms->rm_init)
@@ -1124,7 +1119,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 		struct dpu_hw_vbif *hw;
 		const struct dpu_vbif_cfg *vbif = &dpu_kms->catalog->vbif[i];
 
-		hw = dpu_hw_vbif_init(vbif, dpu_kms->vbif[vbif->id]);
+		hw = dpu_hw_vbif_init(dev, vbif, dpu_kms->vbif[vbif->id]);
 		if (IS_ERR(hw)) {
 			rc = PTR_ERR(hw);
 			DPU_ERROR("failed to init vbif %d: %d\n", vbif->id, rc);
-- 
2.39.2


