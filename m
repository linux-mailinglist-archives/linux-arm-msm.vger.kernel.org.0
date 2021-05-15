Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44A70381B9A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 May 2021 00:58:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230469AbhEOW7V (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 15 May 2021 18:59:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230233AbhEOW7R (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 15 May 2021 18:59:17 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01F51C061756
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 May 2021 15:58:03 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id p20so2758971ljj.8
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 May 2021 15:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pS41R21Kdg2MmcKBTyjnw0yHw3Ez1TlaPoWHnStvfNA=;
        b=aPUCWGh+vNfJNivK/BITT25rtgA6N/cMRPumGioUlS799PWqV8rG/J2p3TzNETY6nP
         h9YHoeYqAeyVNn40tc7a38OQYUqGFgmfJICTmUNaW1xiwJSPnEdcCvxA9Rw02LAejhEc
         R/1N+gH45A+hjOEPHhFUzG1Rs0T6v24crKVDmAcXkqvc5JMpGiMU74x2CQwVsbC2p6H2
         5M0XZsL2OmdhMYHyym/oTrm9m5fbUFsAeBqI6doB+vLpCiQXcpZLLsy26loNRB4MK5bc
         vt0BblfIDQR5fyZR15ydNu58j/VpQITYzkAHwXAnhBocVgtdCEH4V/vOWwEYbEed4f7r
         ThxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pS41R21Kdg2MmcKBTyjnw0yHw3Ez1TlaPoWHnStvfNA=;
        b=t9Qy7JBNknkT4e/xWn6uTxdxjUc4vLmghMSRGbQRIVgFWXT16Y/UkjkuHP5E+SoG0z
         ktDFj1KILBpWexslh6yhE8gHN6CBmVK5KwJ7cZvXHComk+chTdpmsF6ITlDHpmawZjL2
         aGce1QCkH5RXfYrStayu4Sp68AdTjVFI4d0tocF+Wk0WgUsVtMT40H8JIzPak1A/Fnsh
         PjOfuXC71Ctt3dtBzzyiAqrggLVGjXRo7mxV70vuUjCXcnYiMoDgKGTjOPed3VlXvWxS
         tZyG93N3s82vDue4gaAj0/R2TgZYVSaq7oqMkXU3RotES9Ll68X4o83802DezRMmxtWv
         8XWg==
X-Gm-Message-State: AOAM532WLhzUgLyPdxRvsAUmdv7bJvwQKlkVYqU4GHafKeBCM1HFO5Rr
        GnrWrbHjfoHNd8NeYNhkWZc8tQ==
X-Google-Smtp-Source: ABdhPJx7oXXw4dgFgIC6fharP2iMftX/medgJpy7btxLI1M0+UaBqH7bwjxGxibyCgWOjsB2P5EGZw==
X-Received: by 2002:a2e:5347:: with SMTP id t7mr35575027ljd.464.1621119481416;
        Sat, 15 May 2021 15:58:01 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id j3sm1499729lfe.5.2021.05.15.15.58.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 May 2021 15:58:01 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v2 2/6] drm/msm/dpu: get MERGE_3D blocks directly rather than through RM
Date:   Sun, 16 May 2021 01:57:53 +0300
Message-Id: <20210515225757.1989955-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210515225757.1989955-1-dmitry.baryshkov@linaro.org>
References: <20210515225757.1989955-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

MERGE_3D blocks are not really handled by resource manager, they are
used by corresponding PP blocks directly, each merge_3d is used by two
known PP blocks. So allocate them outside of RM and use them directly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c   |  7 +++-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h   |  4 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       | 29 ++++++++++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |  1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        | 36 +++----------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h        |  8 ++---
 6 files changed, 45 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
index 55766c97c4c8..3ac53ff8c2ae 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
@@ -8,6 +8,7 @@
 #include "dpu_hwio.h"
 #include "dpu_hw_catalog.h"
 #include "dpu_hw_pingpong.h"
+#include "dpu_hw_merge3d.h"
 #include "dpu_kms.h"
 #include "dpu_trace.h"
 
@@ -263,7 +264,8 @@ static void _setup_pingpong_ops(struct dpu_hw_pingpong *c,
 
 struct dpu_hw_pingpong *dpu_hw_pingpong_init(enum dpu_pingpong idx,
 		void __iomem *addr,
-		const struct dpu_mdss_cfg *m)
+		const struct dpu_mdss_cfg *m,
+		struct dpu_hw_merge_3d **merge_3d_blks)
 {
 	struct dpu_hw_pingpong *c;
 	const struct dpu_pingpong_cfg *cfg;
@@ -282,6 +284,9 @@ struct dpu_hw_pingpong *dpu_hw_pingpong_init(enum dpu_pingpong idx,
 	c->caps = cfg;
 	_setup_pingpong_ops(c, c->caps->features);
 
+	if (cfg->merge_3d && cfg->merge_3d < MERGE_3D_MAX)
+		c->merge_3d = merge_3d_blks[cfg->merge_3d];
+
 	return c;
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
index 89d08a715c16..75e6cb393b9c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
@@ -157,11 +157,13 @@ static inline struct dpu_hw_pingpong *to_dpu_hw_pingpong(struct dpu_hw_blk *hw)
  * @idx:  Pingpong index for which driver object is required
  * @addr: Mapped register io address of MDP
  * @m:    Pointer to mdss catalog data
+ * @merge_3d_blks: Pointer to merge 3d blocks
  * Returns: Error code or allocated dpu_hw_pingpong context
  */
 struct dpu_hw_pingpong *dpu_hw_pingpong_init(enum dpu_pingpong idx,
 		void __iomem *addr,
-		const struct dpu_mdss_cfg *m);
+		const struct dpu_mdss_cfg *m,
+		struct dpu_hw_merge_3d **merge_3d_blks);
 
 /**
  * dpu_hw_pingpong_destroy - destroys pingpong driver context
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index e3aed844bf82..ca89229d9f42 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -23,6 +23,7 @@
 #include "dpu_kms.h"
 #include "dpu_core_irq.h"
 #include "dpu_formats.h"
+#include "dpu_hw_merge3d.h"
 #include "dpu_hw_vbif.h"
 #include "dpu_vbif.h"
 #include "dpu_encoder.h"
@@ -688,6 +689,16 @@ static void _dpu_kms_hw_destroy(struct dpu_kms *dpu_kms)
 		dpu_rm_destroy(&dpu_kms->rm);
 	dpu_kms->rm_init = false;
 
+	/* After RM destroy, as PP blocks reference MERGE_3D blocks */
+	if (dpu_kms->catalog) {
+		for (i = 0; i < dpu_kms->catalog->merge_3d_count; i++) {
+			u32 merge_3d_idx = dpu_kms->catalog->merge_3d[i].id;
+
+			if ((merge_3d_idx < MERGE_3D_MAX) && dpu_kms->hw_merge_3d[merge_3d_idx])
+				dpu_hw_merge_3d_destroy(dpu_kms->hw_merge_3d[merge_3d_idx]);
+		}
+	}
+
 	if (dpu_kms->catalog)
 		dpu_hw_catalog_deinit(dpu_kms->catalog);
 	dpu_kms->catalog = NULL;
@@ -962,7 +973,23 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 		goto power_error;
 	}
 
-	rc = dpu_rm_init(&dpu_kms->rm, dpu_kms->catalog, dpu_kms->mmio);
+	/* Before RM init so PP blocks can find MERGE_3D blocks */
+	for (i = 0; i < dpu_kms->catalog->merge_3d_count; i++) {
+		u32 merge_3d_idx = dpu_kms->catalog->merge_3d[i].id;
+
+		dpu_kms->hw_merge_3d[merge_3d_idx] = dpu_hw_merge_3d_init(merge_3d_idx,
+				dpu_kms->mmio, dpu_kms->catalog);
+		if (IS_ERR_OR_NULL(dpu_kms->hw_merge_3d[merge_3d_idx])) {
+			rc = PTR_ERR(dpu_kms->hw_merge_3d[merge_3d_idx]);
+			if (!dpu_kms->hw_merge_3d[merge_3d_idx])
+				rc = -EINVAL;
+			DPU_ERROR("failed to init merge_3d %d: %d\n", merge_3d_idx, rc);
+			dpu_kms->hw_merge_3d[merge_3d_idx] = NULL;
+			goto power_error;
+		}
+	}
+
+	rc = dpu_rm_init(&dpu_kms->rm, dpu_kms);
 	if (rc) {
 		DPU_ERROR("rm init failed: %d\n", rc);
 		goto power_error;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index 195a854245fa..057fdf0ca9f4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -123,6 +123,7 @@ struct dpu_kms {
 	bool rm_init;
 
 	struct dpu_hw_vbif *hw_vbif[VBIF_MAX];
+	struct dpu_hw_merge_3d *hw_merge_3d[MERGE_3D_MAX];
 	struct dpu_hw_mdp *hw_mdp;
 
 	bool has_danger_ctrl;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 6e7b5578cc81..138efa7e51e5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -9,7 +9,6 @@
 #include "dpu_hw_ctl.h"
 #include "dpu_hw_pingpong.h"
 #include "dpu_hw_intf.h"
-#include "dpu_hw_merge3d.h"
 #include "dpu_encoder.h"
 #include "dpu_trace.h"
 
@@ -42,14 +41,6 @@ int dpu_rm_destroy(struct dpu_rm *rm)
 			dpu_hw_pingpong_destroy(hw);
 		}
 	}
-	for (i = 0; i < ARRAY_SIZE(rm->merge_3d_blks); i++) {
-		struct dpu_hw_merge_3d *hw;
-
-		if (rm->merge_3d_blks[i]) {
-			hw = to_dpu_hw_merge_3d(rm->merge_3d_blks[i]);
-			dpu_hw_merge_3d_destroy(hw);
-		}
-	}
 	for (i = 0; i < ARRAY_SIZE(rm->mixer_blks); i++) {
 		struct dpu_hw_mixer *hw;
 
@@ -79,9 +70,10 @@ int dpu_rm_destroy(struct dpu_rm *rm)
 }
 
 int dpu_rm_init(struct dpu_rm *rm,
-		struct dpu_mdss_cfg *cat,
-		void __iomem *mmio)
+		struct dpu_kms *dpu_kms)
 {
+	struct dpu_mdss_cfg *cat = dpu_kms->catalog;
+	void __iomem *mmio = dpu_kms->mmio;
 	int rc, i;
 
 	if (!rm || !cat || !mmio) {
@@ -127,24 +119,6 @@ int dpu_rm_init(struct dpu_rm *rm,
 		}
 	}
 
-	for (i = 0; i < cat->merge_3d_count; i++) {
-		struct dpu_hw_merge_3d *hw;
-		const struct dpu_merge_3d_cfg *merge_3d = &cat->merge_3d[i];
-
-		if (merge_3d->id < MERGE_3D_0 || merge_3d->id >= MERGE_3D_MAX) {
-			DPU_ERROR("skip merge_3d %d with invalid id\n", merge_3d->id);
-			continue;
-		}
-		hw = dpu_hw_merge_3d_init(merge_3d->id, mmio, cat);
-		if (IS_ERR_OR_NULL(hw)) {
-			rc = PTR_ERR(hw);
-			DPU_ERROR("failed merge_3d object creation: err %d\n",
-				rc);
-			goto fail;
-		}
-		rm->merge_3d_blks[merge_3d->id - MERGE_3D_0] = &hw->base;
-	}
-
 	for (i = 0; i < cat->pingpong_count; i++) {
 		struct dpu_hw_pingpong *hw;
 		const struct dpu_pingpong_cfg *pp = &cat->pingpong[i];
@@ -153,15 +127,13 @@ int dpu_rm_init(struct dpu_rm *rm,
 			DPU_ERROR("skip pingpong %d with invalid id\n", pp->id);
 			continue;
 		}
-		hw = dpu_hw_pingpong_init(pp->id, mmio, cat);
+		hw = dpu_hw_pingpong_init(pp->id, mmio, cat, dpu_kms->hw_merge_3d);
 		if (IS_ERR_OR_NULL(hw)) {
 			rc = PTR_ERR(hw);
 			DPU_ERROR("failed pingpong object creation: err %d\n",
 				rc);
 			goto fail;
 		}
-		if (pp->merge_3d && pp->merge_3d < MERGE_3D_MAX)
-			hw->merge_3d = to_dpu_hw_merge_3d(rm->merge_3d_blks[pp->merge_3d - MERGE_3D_0]);
 		rm->pingpong_blks[pp->id - PINGPONG_0] = &hw->base;
 	}
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
index 91952af6c75b..4c0c15453c98 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
@@ -27,22 +27,20 @@ struct dpu_rm {
 	struct dpu_hw_blk *mixer_blks[LM_MAX - LM_0];
 	struct dpu_hw_blk *ctl_blks[CTL_MAX - CTL_0];
 	struct dpu_hw_blk *intf_blks[INTF_MAX - INTF_0];
-	struct dpu_hw_blk *merge_3d_blks[MERGE_3D_MAX - MERGE_3D_0];
 
 	uint32_t lm_max_width;
 };
 
+struct dpu_kms;
 /**
  * dpu_rm_init - Read hardware catalog and create reservation tracking objects
  *	for all HW blocks.
  * @rm: DPU Resource Manager handle
- * @cat: Pointer to hardware catalog
- * @mmio: mapped register io address of MDP
+ * @dpu_kms: DPU KMS data
  * @Return: 0 on Success otherwise -ERROR
  */
 int dpu_rm_init(struct dpu_rm *rm,
-		struct dpu_mdss_cfg *cat,
-		void __iomem *mmio);
+		struct dpu_kms *dpu_kms);
 
 /**
  * dpu_rm_destroy - Free all memory allocated by dpu_rm_init
-- 
2.30.2

