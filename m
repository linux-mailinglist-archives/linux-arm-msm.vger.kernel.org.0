Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 789DE46593D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Dec 2021 23:27:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353616AbhLAWaZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Dec 2021 17:30:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353637AbhLAWaG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Dec 2021 17:30:06 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EA71C061574
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Dec 2021 14:26:44 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id j18so37877055ljc.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Dec 2021 14:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YRqnfrlexYYeGgagIUTamZ7RSQEhaY33J7GOhnJ7GdQ=;
        b=OKtfr+1I+2gKgILYOWnJ48PN5lG/F4Rc2IJ4v66zyuk4hFgJxpdkEqwsQCxOwM5qu8
         BnN01N0TVYd0qPRyHWfQpd7XIg2S2qtZWOW5sZEoVjuFK1OdDu9EeQZFvQWPiLHHX313
         tp/2TTEoN02EuT5cKH6Q54fbhbc8sSm98GNXRGuE3iBtulGTyhl1GkeeK4OgBq4X6QMb
         ReCFPDiRIT6SehCblltg1IThuj4tUTRiBIDh5bZ8pu7RpyLJt6GKt6FUtjMXcB6Xaueo
         IlJ0lbY9N6ZXOAUm4VR0uvBfLz1DDsAKflwMrGBgtjlvyTgii015kNqLqxFrNl7YvkZN
         NOmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YRqnfrlexYYeGgagIUTamZ7RSQEhaY33J7GOhnJ7GdQ=;
        b=g+rIXqS25bT0M8ffUqetIrDUWeHnhjN99uOn6EUr6LUobc8h2GdAXD0vDt/GeRi69/
         s6UpZxr6PBXqvPLHxuP6Cr7+qkGT2ttFE6ZIMnT1HgwVqMF+K4rohQsN1M40PKgcOQH+
         Po9RhF7USMZcPMArrKmu61D0jTtByxqZinLiBgvYhz4kjirbMquL7XgX8iaLOMAxB61s
         3H52pBd8L8uoIpROQXpViKv6ncnXKnitGbakXVbPaUaarGt/KiCOGkOo7p5vm3YujMAw
         Ps7cOClq727lW156uYxJLqdk3KrL2mbEqQe6N+3f3xcxWzwpJX+X/mWJTOJ1nfymYYdY
         YLsA==
X-Gm-Message-State: AOAM53258YxdYzfQgBi9m2qk2967fN9ps64AhhKUsAIeRKSJWMLho9F6
        9WOBcolbfV6pnTNBHhFVL8UeMg==
X-Google-Smtp-Source: ABdhPJwDw8mg6Ac7jXrYVO26B/DawQwFuWNgo5CGv+bIsSwPjqdbQ0OBdChQBX6va0udGdhEBb2B7A==
X-Received: by 2002:a2e:2f1d:: with SMTP id v29mr8333578ljv.439.1638397602469;
        Wed, 01 Dec 2021 14:26:42 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u7sm117004lfs.144.2021.12.01.14.26.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Dec 2021 14:26:41 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v1 8/8] drm/msm/dpu: move SSPP debugfs support from plane to SSPP code
Date:   Thu,  2 Dec 2021 01:26:33 +0300
Message-Id: <20211201222633.2476780-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211201222633.2476780-1-dmitry.baryshkov@linaro.org>
References: <20211201222633.2476780-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

We are preparing to change DPU plane implementation. Move SSPP debugfs
code from dpu_plane.c to dpu_hw_sspp.c, where it belongs.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 67 +++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h |  4 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |  1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 82 +++------------------
 4 files changed, 84 insertions(+), 70 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index d77eb7da5daf..ae3cf2e4d7d9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -8,6 +8,8 @@
 #include "dpu_hw_sspp.h"
 #include "dpu_kms.h"
 
+#include <drm/drm_file.h>
+
 #define DPU_FETCH_CONFIG_RESET_VALUE   0x00000087
 
 /* DPU_SSPP_SRC */
@@ -686,6 +688,71 @@ static void _setup_layer_ops(struct dpu_hw_pipe *c,
 		c->ops.setup_cdp = dpu_hw_sspp_setup_cdp;
 }
 
+#ifdef CONFIG_DEBUG_FS
+int _dpu_hw_sspp_init_debugfs(struct dpu_hw_pipe *hw_pipe, struct dpu_kms *kms, struct dentry *entry)
+{
+	const struct dpu_sspp_cfg *cfg = hw_pipe->cap;
+	const struct dpu_sspp_sub_blks *sblk = cfg->sblk;
+	struct dentry *debugfs_root;
+	char sspp_name[32];
+
+	snprintf(sspp_name, sizeof(sspp_name), "%d", hw_pipe->idx);
+
+	/* create overall sub-directory for the pipe */
+	debugfs_root =
+		debugfs_create_dir(sspp_name, entry);
+
+	/* don't error check these */
+	debugfs_create_xul("features", 0600,
+			debugfs_root, (unsigned long *)&hw_pipe->cap->features);
+
+	/* add register dump support */
+	dpu_debugfs_create_regset32("src_blk", 0400,
+			debugfs_root,
+			sblk->src_blk.base + cfg->base,
+			sblk->src_blk.len,
+			kms);
+
+	if (cfg->features & BIT(DPU_SSPP_SCALER_QSEED3) ||
+			cfg->features & BIT(DPU_SSPP_SCALER_QSEED3LITE) ||
+			cfg->features & BIT(DPU_SSPP_SCALER_QSEED2) ||
+			cfg->features & BIT(DPU_SSPP_SCALER_QSEED4))
+		dpu_debugfs_create_regset32("scaler_blk", 0400,
+				debugfs_root,
+				sblk->scaler_blk.base + cfg->base,
+				sblk->scaler_blk.len,
+				kms);
+
+	if (cfg->features & BIT(DPU_SSPP_CSC) ||
+			cfg->features & BIT(DPU_SSPP_CSC_10BIT))
+		dpu_debugfs_create_regset32("csc_blk", 0400,
+				debugfs_root,
+				sblk->csc_blk.base + cfg->base,
+				sblk->csc_blk.len,
+				kms);
+
+	debugfs_create_u32("xin_id",
+			0400,
+			debugfs_root,
+			(u32 *) &cfg->xin_id);
+	debugfs_create_u32("clk_ctrl",
+			0400,
+			debugfs_root,
+			(u32 *) &cfg->clk_ctrl);
+	debugfs_create_x32("creq_vblank",
+			0600,
+			debugfs_root,
+			(u32 *) &sblk->creq_vblank);
+	debugfs_create_x32("danger_vblank",
+			0600,
+			debugfs_root,
+			(u32 *) &sblk->danger_vblank);
+
+	return 0;
+}
+#endif
+
+
 static const struct dpu_sspp_cfg *_sspp_offset(enum dpu_sspp sspp,
 		void __iomem *addr,
 		struct dpu_mdss_cfg *catalog,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index e8939d7387cb..cef281687bab 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -381,6 +381,7 @@ struct dpu_hw_pipe {
 	struct dpu_hw_sspp_ops ops;
 };
 
+struct dpu_kms;
 /**
  * dpu_hw_sspp_init - initializes the sspp hw driver object.
  * Should be called once before accessing every pipe.
@@ -400,5 +401,8 @@ struct dpu_hw_pipe *dpu_hw_sspp_init(enum dpu_sspp idx,
  */
 void dpu_hw_sspp_destroy(struct dpu_hw_pipe *ctx);
 
+void dpu_debugfs_sspp_init(struct dpu_kms *dpu_kms, struct dentry *debugfs_root);
+int _dpu_hw_sspp_init_debugfs(struct dpu_hw_pipe *hw_pipe, struct dpu_kms *kms, struct dentry *entry);
+
 #endif /*_DPU_HW_SSPP_H */
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 7e7a619769a8..de9efe6dcf7c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -281,6 +281,7 @@ static int dpu_kms_debugfs_init(struct msm_kms *kms, struct drm_minor *minor)
 	dpu_debugfs_danger_init(dpu_kms, entry);
 	dpu_debugfs_vbif_init(dpu_kms, entry);
 	dpu_debugfs_core_irq_init(dpu_kms, entry);
+	dpu_debugfs_sspp_init(dpu_kms, entry);
 
 	for (i = 0; i < ARRAY_SIZE(priv->dp); i++) {
 		if (priv->dp[i])
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index ef66af696a40..cc7a7eb84fdd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -13,7 +13,6 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_uapi.h>
 #include <drm/drm_damage_helper.h>
-#include <drm/drm_file.h>
 #include <drm/drm_gem_atomic_helper.h>
 
 #include "msm_drv.h"
@@ -1356,78 +1355,22 @@ void dpu_plane_danger_signal_ctrl(struct drm_plane *plane, bool enable)
 	pm_runtime_put_sync(&dpu_kms->pdev->dev);
 }
 
-static int _dpu_plane_init_debugfs(struct drm_plane *plane)
+/* SSPP live inside dpu_plane private data only. Enumerate them here. */
+void dpu_debugfs_sspp_init(struct dpu_kms *dpu_kms, struct dentry *debugfs_root)
 {
-	struct dpu_plane *pdpu = to_dpu_plane(plane);
-	struct dpu_kms *kms = _dpu_plane_get_kms(plane);
-	const struct dpu_sspp_cfg *cfg = pdpu->pipe_hw->cap;
-	const struct dpu_sspp_sub_blks *sblk = cfg->sblk;
-	struct dentry *debugfs_root;
-
-	/* create overall sub-directory for the pipe */
-	debugfs_root =
-		debugfs_create_dir(plane->name,
-				plane->dev->primary->debugfs_root);
-
-	/* don't error check these */
-	debugfs_create_xul("features", 0600,
-			debugfs_root, (unsigned long *)&pdpu->pipe_hw->cap->features);
-
-	/* add register dump support */
-	dpu_debugfs_create_regset32("src_blk", 0400,
-			debugfs_root,
-			sblk->src_blk.base + cfg->base,
-			sblk->src_blk.len,
-			kms);
-
-	if (cfg->features & BIT(DPU_SSPP_SCALER_QSEED3) ||
-			cfg->features & BIT(DPU_SSPP_SCALER_QSEED3LITE) ||
-			cfg->features & BIT(DPU_SSPP_SCALER_QSEED2) ||
-			cfg->features & BIT(DPU_SSPP_SCALER_QSEED4))
-		dpu_debugfs_create_regset32("scaler_blk", 0400,
-				debugfs_root,
-				sblk->scaler_blk.base + cfg->base,
-				sblk->scaler_blk.len,
-				kms);
-
-	if (cfg->features & BIT(DPU_SSPP_CSC) ||
-			cfg->features & BIT(DPU_SSPP_CSC_10BIT))
-		dpu_debugfs_create_regset32("csc_blk", 0400,
-				debugfs_root,
-				sblk->csc_blk.base + cfg->base,
-				sblk->csc_blk.len,
-				kms);
-
-	debugfs_create_u32("xin_id",
-			0400,
-			debugfs_root,
-			(u32 *) &cfg->xin_id);
-	debugfs_create_u32("clk_ctrl",
-			0400,
-			debugfs_root,
-			(u32 *) &cfg->clk_ctrl);
-	debugfs_create_x32("creq_vblank",
-			0600,
-			debugfs_root,
-			(u32 *) &sblk->creq_vblank);
-	debugfs_create_x32("danger_vblank",
-			0600,
-			debugfs_root,
-			(u32 *) &sblk->danger_vblank);
+	struct drm_plane *plane;
+	struct dentry *entry = debugfs_create_dir("sspp", debugfs_root);
 
-	return 0;
-}
-#else
-static int _dpu_plane_init_debugfs(struct drm_plane *plane)
-{
-	return 0;
-}
-#endif
+	if (IS_ERR(entry))
+		return;
 
-static int dpu_plane_late_register(struct drm_plane *plane)
-{
-	return _dpu_plane_init_debugfs(plane);
+	drm_for_each_plane(plane, dpu_kms->dev) {
+		struct dpu_plane *pdpu = to_dpu_plane(plane);
+
+		_dpu_hw_sspp_init_debugfs(pdpu->pipe_hw, dpu_kms, entry);
+	}
 }
+#endif
 
 static bool dpu_plane_format_mod_supported(struct drm_plane *plane,
 		uint32_t format, uint64_t modifier)
@@ -1453,7 +1396,6 @@ static const struct drm_plane_funcs dpu_plane_funcs = {
 		.reset = dpu_plane_reset,
 		.atomic_duplicate_state = dpu_plane_duplicate_state,
 		.atomic_destroy_state = dpu_plane_destroy_state,
-		.late_register = dpu_plane_late_register,
 		.format_mod_supported = dpu_plane_format_mod_supported,
 };
 
-- 
2.33.0

