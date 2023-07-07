Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADB8E74B7EF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jul 2023 22:37:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230516AbjGGUhb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Jul 2023 16:37:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbjGGUha (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Jul 2023 16:37:30 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 720751994
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Jul 2023 13:37:29 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4fa48b5dc2eso3786764e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Jul 2023 13:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688762248; x=1691354248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=axm03dDWl1OT6XtpYCbLVcsPiVDnTCWolvbvQzZd1B0=;
        b=wutI/1jhNRWkxrFXEBMNrvg7piYBvyWp9CyiF7H7/Eirm4MT/IjQsTKRdY/EbZt6T0
         FWfhn6dbyCEjJukYM4BQ9+W22uVMxgXmHNhwI9br8AiEMTMDSk2mUHtkjmn5Rxc41VdH
         3bvYKDV2B8t5wsq4slM5Q025nK8unHR30oCGY4FVuVNWJbkuHdmvW9rhSJy58ygefpBg
         f1d864kBCacPutTjTam+9oKKHFtBrWFIwOn2Ea6cTkJwlMO+wAS8cA+qwoD6mPujmZto
         0F/eOreakHuLecjPAhgkBNUTFnDQTDqti2f6g9Z0586OH/s87mQTtl24ZCnWwBxvxo4r
         B2Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688762248; x=1691354248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=axm03dDWl1OT6XtpYCbLVcsPiVDnTCWolvbvQzZd1B0=;
        b=RlM5AFT+IvYbcqq0q3/VTHa16nVBWT+rkzd8Dwevvn0Q9vm/QFb32qzAhcfI3ai+6i
         7e7ZsW+iaEaFWUIoxfQLrbGSVlaWRFgjLgiPZBvznhbF7rJO2Xh4eQo50odyGb4LyucO
         ggyBO++oGqHzfG7Gi4kkDK7xl0IwHMeQ/tIot74WjmltL8EZdiRV9DVOuFa6/w2EFlE4
         XJpUuI/g5H1uNf7BijlCzRBs8/YnbRExfvSVkUufHfnY9Q+FQD5aG9yZt5ZEmt53bEm7
         bcgkJ8Z+ckkkCzfR+oeSDW6IQgC+z4+osVaHxAbeNhVZI+nmF3/YktWSuKEyFg4mvXmX
         jgFQ==
X-Gm-Message-State: ABy/qLY+0tWkfeloDfB4xnggAOkvtzgVwHcBjZmdDNzxPHnDDkEiRqzK
        sISCxosgKK1fAEaFGILIimmnpw==
X-Google-Smtp-Source: APBJJlGSZlQqgn13r3gmqf5prCswCXrzIduEJbC3JTwvSdqCE+r3FqG5kSsdZXH/Hk18nxtny18Yvw==
X-Received: by 2002:a05:6512:ac4:b0:4f9:5ff6:c06a with SMTP id n4-20020a0565120ac400b004f95ff6c06amr5112208lfu.67.1688762247722;
        Fri, 07 Jul 2023 13:37:27 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d4-20020ac244c4000000b004fb738796casm808899lfm.40.2023.07.07.13.37.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 13:37:27 -0700 (PDT)
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
Subject: [PATCH 04/13] drm/msm/dpu: use devres-managed allocation for VBIF data
Date:   Fri,  7 Jul 2023 23:37:15 +0300
Message-Id: <20230707203724.3820757-5-dmitry.baryshkov@linaro.org>
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

