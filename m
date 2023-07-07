Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59F9D74B9D5
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Jul 2023 01:13:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229471AbjGGXM7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Jul 2023 19:12:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231280AbjGGXM6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Jul 2023 19:12:58 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4582D1FF0
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Jul 2023 16:12:57 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4fbc0314a7bso3954077e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Jul 2023 16:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688771575; x=1691363575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=axm03dDWl1OT6XtpYCbLVcsPiVDnTCWolvbvQzZd1B0=;
        b=YWmZtzOgoatV+CTtQkBRuuFIY5zd93a5u90LUA+0zLelxukAX2Vo/GTGrKxxItr5tA
         ErlXmOkr7R5pUUuJIfyVr4Fo1mKvnLpxZPLAAMh31U4p80/OR5mzM/L0XvUoyO0Rt/tR
         n24Te78PRsbo0Wkv1D9Sm0KNnw66mfyn27GKcKm2q2Bkr3BLFr5/l/0o9kJUhw/LoSmg
         CDXCuJ1kVqqqDk26PdOYy4dh0AthfCdr2QgRP4feEaixetB9VGSvG6WH6N4QDSWc3xQs
         713qMWEtn9HxQncXPETST6w+gTyExoEyPQ6rkDfxhH18MGcbK6fo/7PlySLdN7JOeqkz
         WeTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688771575; x=1691363575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=axm03dDWl1OT6XtpYCbLVcsPiVDnTCWolvbvQzZd1B0=;
        b=H53FkSW9LJZn9qsvDhtbNmKvDjeGyTra65N0WxGCZYXgpI73S7PpVsVBEJbqXrBswj
         TxDxHIuM+kqlgIWVYSKRSLrR71aEFdBmeMij8ARgzKuLzFK2btDgZfRsFj4OIPegTCrJ
         wzZ/iTzGUontgsNaL4MZBUeQOcGFB1deA2kthlg1TFq2RDLaw3YdQaoYLfnPUj75BW9v
         D8IlpcS1nHg/+STGI+ihCnEBx8Qw6k/+GtReKYZVFpXyulWXN2VXD2ogI0FlONfuGTTP
         S/HcwgLh+VaMt5+4pFlIFViaZDonTPUd+7/nEAmgwH3O3q/G6f+bNZvKy93kXIEna78I
         Py/g==
X-Gm-Message-State: ABy/qLZ4d/YjOADVehvl7Y6tr98jo35LuzF6ZWXmqLZkEjsR3334S2nY
        Fm2VCiem3kf46U7UtQ8P3txq3mjqNpXiVsm3b4g=
X-Google-Smtp-Source: APBJJlGQwYuF47w+rUxUggnYn/nYLZhs5wBT0OiFQQi7c7mYH/3meWHmyw9NkYJ54Homqef3s/LLUQ==
X-Received: by 2002:a05:6512:eaa:b0:4fb:772a:af12 with SMTP id bi42-20020a0565120eaa00b004fb772aaf12mr5743568lfb.21.1688771575531;
        Fri, 07 Jul 2023 16:12:55 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d1-20020ac25441000000b004fb7388360esm841643lfn.188.2023.07.07.16.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 16:12:55 -0700 (PDT)
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
Subject: [PATCH v2 04/13] drm/msm/dpu: use devres-managed allocation for VBIF data
Date:   Sat,  8 Jul 2023 02:12:42 +0300
Message-Id: <20230707231251.3849701-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230707231251.3849701-1-dmitry.baryshkov@linaro.org>
References: <20230707231251.3849701-1-dmitry.baryshkov@linaro.org>
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

Use devm_kzalloc to create VBIF data structure. This allows us to
remove corresponding kfree and drop dpu_hw_intr_destroy() function.

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
index ef232dc838c7..f7723f89cbbc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -812,13 +812,8 @@ static void _dpu_kms_hw_destroy(struct dpu_kms *dpu_kms)
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
@@ -1070,7 +1065,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 		struct dpu_hw_vbif *hw;
 		const struct dpu_vbif_cfg *vbif = &dpu_kms->catalog->vbif[i];
 
-		hw = dpu_hw_vbif_init(vbif, dpu_kms->vbif[vbif->id]);
+		hw = dpu_hw_vbif_init(dev, vbif, dpu_kms->vbif[vbif->id]);
 		if (IS_ERR(hw)) {
 			rc = PTR_ERR(hw);
 			DPU_ERROR("failed to init vbif %d: %d\n", vbif->id, rc);
-- 
2.39.2

