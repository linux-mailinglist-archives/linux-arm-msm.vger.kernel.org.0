Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19746768328
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Jul 2023 03:19:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229559AbjG3BTc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 29 Jul 2023 21:19:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229582AbjG3BTb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 29 Jul 2023 21:19:31 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11D982D5D
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jul 2023 18:19:30 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-51de9c2bc77so4350166a12.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jul 2023 18:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690679968; x=1691284768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9A/JrCiAAb5n0ZMvvVq2hV0n4WOzuWTVRFLd6WjMCnQ=;
        b=HewAfHVVrWVv6qy7ayLtd1XXG4hE8Tll42C/HlQrHgBGsfJ15I9og4cdr+wwugY62r
         kGvfpojbZXgiMEBVoJ0IwvsGr37fWKIDB3h24hlfD/R7AJ3bZ8fHGL04t5KeCs1o5RWZ
         q44BS71fxryGgeCsQACtvAIEoM8wZkcjK5kAFyyMJS6oRTLgPjs6EfmI1ZhE5Qm9wjbq
         aSNF8hMawRellhlKOKkCwv9x7fMgswwLsxRrjndBxfYmtgY36cKwEIgaotHe++EGcsZ3
         Mk6fuxg8CoZ4ebxd08+66miiSUjOwfwx7ZQJMlO/v6vOad3R/0BO7CQ1jz0qY5WRRXyA
         VeeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690679968; x=1691284768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9A/JrCiAAb5n0ZMvvVq2hV0n4WOzuWTVRFLd6WjMCnQ=;
        b=Re9yrFioVVlOYU3VFGyS4Hsmf2ja24n6+U6WSCWKPl9jH882cDyMjIZ/d2nS+WiC77
         twZ9WoVtQ4H8bKeqKio7Lj/UzEJ1oj9qeCeKk8SpS/EK1UxVDAtUVR/SRCUscBkBedhg
         io3keghZ/Pq3InFalnz25xpwxwwBzMQ7YfgP1T8zhBwX4I3EIXFwcqe5vJS8GkYARWSk
         VQZiYQ3RDfgc1sNKMXvZLcOZxfCwy7hZY/Fq2qjmeHOFN14PT8JmmQ4Oug1dXhTUl4iH
         LR6mTaBYoXk4Ql1AmMCy6hVlxiVKOMbGgvwqvwJoXWWONFx3VH9IAlYdm4rSyObHPukR
         d7xg==
X-Gm-Message-State: ABy/qLbkTTyDl7TxTpQ5DatRlLz+rScWlxBbjgxy13a96YRSNyBrg/TJ
        Z0cwhPlk7NVhK5jLyJII+RG02w==
X-Google-Smtp-Source: APBJJlF0vz5JTxFsYGvXRYQQihs8ZmgkrQj7gjs2N4DqJg0ROmff9wY7HThu0q0bSaUpsegnM5v2xQ==
X-Received: by 2002:a17:906:ef90:b0:987:5761:2868 with SMTP id ze16-20020a170906ef9000b0098757612868mr3291777ejb.11.1690679968566;
        Sat, 29 Jul 2023 18:19:28 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id rk21-20020a170907215500b00992ea405a79sm3915835ejb.166.2023.07.29.18.19.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jul 2023 18:19:28 -0700 (PDT)
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
Subject: [PATCH v3 04/13] drm/msm/dpu: use devres-managed allocation for VBIF data
Date:   Sun, 30 Jul 2023 04:19:11 +0300
Message-Id: <20230730011920.354575-5-dmitry.baryshkov@linaro.org>
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
index 23d11bd4397e..6e0643ea4868 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -810,13 +810,8 @@ static void _dpu_kms_hw_destroy(struct dpu_kms *dpu_kms)
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
@@ -1110,7 +1105,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 		struct dpu_hw_vbif *hw;
 		const struct dpu_vbif_cfg *vbif = &dpu_kms->catalog->vbif[i];
 
-		hw = dpu_hw_vbif_init(vbif, dpu_kms->vbif[vbif->id]);
+		hw = dpu_hw_vbif_init(dev, vbif, dpu_kms->vbif[vbif->id]);
 		if (IS_ERR(hw)) {
 			rc = PTR_ERR(hw);
 			DPU_ERROR("failed to init vbif %d: %d\n", vbif->id, rc);
-- 
2.39.2

