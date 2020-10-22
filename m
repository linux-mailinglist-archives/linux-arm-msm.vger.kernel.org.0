Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7616B295F8E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Oct 2020 15:17:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2899440AbgJVNRM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Oct 2020 09:17:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2899437AbgJVNRM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Oct 2020 09:17:12 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAA80C0613CE
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2020 06:17:10 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id b1so2201593lfp.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2020 06:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TyXq3yjsQPYdsJgpFHjxB/VRn0ETbIYTAv/S0yiOfjs=;
        b=nlLagyEepawUDEx1Aw+Oh5h0+kN+b6w2IXZr5NqwQB2NeHc1bM9Wr/vixYF25Pfo/T
         KwsjdVsYBiYLZkbCvY2X2hBdgrrKt7fEbrk2bYPPFgecb5X6lYAfUI/axqBTUWbghjIM
         kvrAOT+yNb+sLZWX8BFp2OmtMptEe4hKqiRc5kh9hvI4Mwqw4/nB8TxdDAECkgwnnpdp
         vpF6l7nbmgQDD7OhnSVtDFSnKUJHmD1EQevMDFAdSg8A4noItMAyi1fxqn8Mw4p6NnUH
         96niKBiuk1toK17LwztzYDrbJkhon9uUwNVctMJFqn7gjYgykdCDxDnBLPpGCICpijYw
         fGxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TyXq3yjsQPYdsJgpFHjxB/VRn0ETbIYTAv/S0yiOfjs=;
        b=ma9ugK428FjQqC/Hl9fi3RMcNucFerr/3ZovWisS9WcT9cT2xz3xRgwcxEpQsvBtTK
         xERk9eM5iFHZXcN5P07srcI1KGdd5E1ZLC7ZGQBRbgipWqv7BBq9CYxg9oq8aF+wrape
         jbnkdreiApjH5FROa0kCyX5qSBigTvLlRkEx/0UE7dxiNxEzrlXYoq28cL4cipZeV3rp
         uLam6n15d4E/Mvmd9Uu3f3E07zRXFPodM43MIp9eLi9cTYPocFioh9A+FzlsbR9eAxrP
         uMC8KQN6zNDe4midT3ji0fSJYQsEdxJQu7SRpGi8ER7HW5aH+pMrC5vwOAa6CamQAUQR
         kkvA==
X-Gm-Message-State: AOAM530O6pUAWlGYQIkvfqFblVHFt6KUJRfNL1aVApk61rp7pZsFZNZF
        A0i8t6OtgZujwfqFLWiAwWjkCoLJVhCelG4F
X-Google-Smtp-Source: ABdhPJyCrdIJ2vddYvTYMxpPQHPlzFkILPndQw8l8xjMRy333FHr+u46YkWIHf9i47vj5j3IwvO3zA==
X-Received: by 2002:a19:cb14:: with SMTP id b20mr812828lfg.162.1603372629174;
        Thu, 22 Oct 2020 06:17:09 -0700 (PDT)
Received: from eriador.lan ([188.162.64.195])
        by smtp.gmail.com with ESMTPSA id j10sm308514ljb.93.2020.10.22.06.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2020 06:17:08 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 2/5] drm/msm/dpu: initial support for merge3D hardware block
Date:   Thu, 22 Oct 2020 16:16:55 +0300
Message-Id: <20201022131658.181363-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201022131658.181363-1-dmitry.baryshkov@linaro.org>
References: <20201022131658.181363-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add initial support for merge3D hardware block on SM8[12]50. Merge3D is
reposible for merging contents of two LMs (two PPs) into single
interface.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/Makefile                  |  1 +
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 53 ++++++++++----
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    | 18 +++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h   |  8 ++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c    | 73 +++++++++++++++++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.h    | 64 ++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        | 27 +++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h        |  1 +
 8 files changed, 231 insertions(+), 14 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.h

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index 340682cd0f32..3cc906121fb3 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -67,6 +67,7 @@ msm-y := \
 	disp/dpu1/dpu_hw_pingpong.o \
 	disp/dpu1/dpu_hw_sspp.o \
 	disp/dpu1/dpu_hw_dspp.o \
+	disp/dpu1/dpu_hw_merge3d.o \
 	disp/dpu1/dpu_hw_top.o \
 	disp/dpu1/dpu_hw_util.o \
 	disp/dpu1/dpu_hw_vbif.o \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 60b304b72b7c..6a6a7172e3be 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -41,6 +41,8 @@
 #define PINGPONG_SDM845_SPLIT_MASK \
 	(PINGPONG_SDM845_MASK | BIT(DPU_PINGPONG_TE2))
 
+#define MERGE_3D_SM8150_MASK (0)
+
 #define DSPP_SC7180_MASK BIT(DPU_DSPP_PCC)
 
 #define INTF_SDM845_MASK (0)
@@ -481,40 +483,59 @@ static const struct dpu_pingpong_sub_blks sdm845_pp_sblk = {
 		.len = 0x20, .version = 0x10000},
 };
 
-#define PP_BLK_TE(_name, _id, _base) \
+#define PP_BLK_TE(_name, _id, _base, _merge_3d) \
 	{\
 	.name = _name, .id = _id, \
 	.base = _base, .len = 0xd4, \
 	.features = PINGPONG_SDM845_SPLIT_MASK, \
+	.merge_3d = _merge_3d, \
 	.sblk = &sdm845_pp_sblk_te \
 	}
-#define PP_BLK(_name, _id, _base) \
+#define PP_BLK(_name, _id, _base, _merge_3d) \
 	{\
 	.name = _name, .id = _id, \
 	.base = _base, .len = 0xd4, \
 	.features = PINGPONG_SDM845_MASK, \
+	.merge_3d = _merge_3d, \
 	.sblk = &sdm845_pp_sblk \
 	}
 
 static const struct dpu_pingpong_cfg sdm845_pp[] = {
-	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000),
-	PP_BLK_TE("pingpong_1", PINGPONG_1, 0x70800),
-	PP_BLK("pingpong_2", PINGPONG_2, 0x71000),
-	PP_BLK("pingpong_3", PINGPONG_3, 0x71800),
+	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000, 0),
+	PP_BLK_TE("pingpong_1", PINGPONG_1, 0x70800, 0),
+	PP_BLK("pingpong_2", PINGPONG_2, 0x71000, 0),
+	PP_BLK("pingpong_3", PINGPONG_3, 0x71800, 0),
 };
 
 static struct dpu_pingpong_cfg sc7180_pp[] = {
-	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000),
-	PP_BLK_TE("pingpong_1", PINGPONG_1, 0x70800),
+	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000, 0),
+	PP_BLK_TE("pingpong_1", PINGPONG_1, 0x70800, 0),
 };
 
 static const struct dpu_pingpong_cfg sm8150_pp[] = {
-	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000),
-	PP_BLK_TE("pingpong_1", PINGPONG_1, 0x70800),
-	PP_BLK("pingpong_2", PINGPONG_2, 0x71000),
-	PP_BLK("pingpong_3", PINGPONG_3, 0x71800),
-	PP_BLK("pingpong_4", PINGPONG_4, 0x72000),
-	PP_BLK("pingpong_5", PINGPONG_5, 0x72800),
+	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000, MERGE_3D_0),
+	PP_BLK_TE("pingpong_1", PINGPONG_1, 0x70800, MERGE_3D_0),
+	PP_BLK("pingpong_2", PINGPONG_2, 0x71000, MERGE_3D_1),
+	PP_BLK("pingpong_3", PINGPONG_3, 0x71800, MERGE_3D_1),
+	PP_BLK("pingpong_4", PINGPONG_4, 0x72000, MERGE_3D_2),
+	PP_BLK("pingpong_5", PINGPONG_5, 0x72800, MERGE_3D_2),
+};
+
+/*************************************************************
+ * MERGE_3D sub blocks config
+ *************************************************************/
+#define MERGE_3D_BLK(_name, _id, _base) \
+	{\
+	.name = _name, .id = _id, \
+	.base = _base, .len = 0x100, \
+	.features = MERGE_3D_SM8150_MASK, \
+	.sblk = NULL \
+	}
+
+static const struct dpu_merge_3d_cfg sm8150_merge_3d[] = {
+	MERGE_3D_BLK("merge_3d_0", MERGE_3D_0, 0x83000),
+	MERGE_3D_BLK("merge_3d_1", MERGE_3D_1, 0x83100),
+	MERGE_3D_BLK("merge_3d_2", MERGE_3D_2, 0x83200),
 };
 
 /*************************************************************
@@ -838,6 +859,8 @@ static void sm8150_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
 		.mixer = sm8150_lm,
 		.pingpong_count = ARRAY_SIZE(sm8150_pp),
 		.pingpong = sm8150_pp,
+		.merge_3d_count = ARRAY_SIZE(sm8150_merge_3d),
+		.merge_3d = sm8150_merge_3d,
 		.intf_count = ARRAY_SIZE(sm8150_intf),
 		.intf = sm8150_intf,
 		.vbif_count = ARRAY_SIZE(sdm845_vbif),
@@ -868,6 +891,8 @@ static void sm8250_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
 		.mixer = sm8150_lm,
 		.pingpong_count = ARRAY_SIZE(sm8150_pp),
 		.pingpong = sm8150_pp,
+		.merge_3d_count = ARRAY_SIZE(sm8150_merge_3d),
+		.merge_3d = sm8150_merge_3d,
 		.intf_count = ARRAY_SIZE(sm8150_intf),
 		.intf = sm8150_intf,
 		.vbif_count = ARRAY_SIZE(sdm845_vbif),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 3544af1a45c5..eaef99db2d2f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -524,9 +524,23 @@ struct dpu_dspp_cfg  {
  */
 struct dpu_pingpong_cfg  {
 	DPU_HW_BLK_INFO;
+	u32 merge_3d;
 	const struct dpu_pingpong_sub_blks *sblk;
 };
 
+/**
+ * struct dpu_merge_3d_cfg - information of DSPP blocks
+ * @id                 enum identifying this block
+ * @base               register offset of this block
+ * @features           bit mask identifying sub-blocks/features
+ *                     supported by this block
+ * @sblk               sub-blocks information
+ */
+struct dpu_merge_3d_cfg  {
+	DPU_HW_BLK_INFO;
+	const struct dpu_merge_3d_sub_blks *sblk;
+};
+
 /**
  * struct dpu_intf_cfg - information of timing engine blocks
  * @id                 enum identifying this block
@@ -724,6 +738,9 @@ struct dpu_mdss_cfg {
 	u32 pingpong_count;
 	const struct dpu_pingpong_cfg *pingpong;
 
+	u32 merge_3d_count;
+	const struct dpu_merge_3d_cfg *merge_3d;
+
 	u32 intf_count;
 	const struct dpu_intf_cfg *intf;
 
@@ -767,6 +784,7 @@ struct dpu_mdss_hw_cfg_handler {
 #define BLK_INTF(s) ((s)->intf)
 #define BLK_AD(s) ((s)->ad)
 #define BLK_DSPP(s) ((s)->dspp)
+#define BLK_MERGE3d(s) ((s)->merge_3d)
 
 /**
  * dpu_hw_catalog_init - dpu hardware catalog init API retrieves
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
index 979fd2c60aa0..09a3fb3e89f5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
@@ -96,6 +96,7 @@ enum dpu_hw_blk_type {
 	DPU_HW_BLK_INTF,
 	DPU_HW_BLK_WB,
 	DPU_HW_BLK_DSPP,
+	DPU_HW_BLK_MERGE_3D,
 	DPU_HW_BLK_MAX,
 };
 
@@ -186,6 +187,13 @@ enum dpu_pingpong {
 	PINGPONG_MAX
 };
 
+enum dpu_merge_3d {
+	MERGE_3D_0 = 1,
+	MERGE_3D_1,
+	MERGE_3D_2,
+	MERGE_3D_MAX
+};
+
 enum dpu_intf {
 	INTF_0 = 1,
 	INTF_1,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c
new file mode 100644
index 000000000000..5c7ad19feea3
--- /dev/null
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c
@@ -0,0 +1,73 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
+ */
+
+#include <linux/iopoll.h>
+
+#include "dpu_hw_mdss.h"
+#include "dpu_hwio.h"
+#include "dpu_hw_catalog.h"
+#include "dpu_hw_merge3d.h"
+#include "dpu_kms.h"
+#include "dpu_trace.h"
+
+static const struct dpu_merge_3d_cfg *_merge_3d_offset(enum dpu_merge_3d idx,
+		const struct dpu_mdss_cfg *m,
+		void __iomem *addr,
+		struct dpu_hw_blk_reg_map *b)
+{
+	int i;
+
+	for (i = 0; i < m->merge_3d_count; i++) {
+		if (idx == m->merge_3d[i].id) {
+			b->base_off = addr;
+			b->blk_off = m->merge_3d[i].base;
+			b->length = m->merge_3d[i].len;
+			b->hwversion = m->hwversion;
+			b->log_mask = DPU_DBG_MASK_PINGPONG;
+			return &m->merge_3d[i];
+		}
+	}
+
+	return ERR_PTR(-EINVAL);
+}
+
+static void _setup_merge_3d_ops(struct dpu_hw_merge_3d *c,
+				unsigned long features)
+{
+};
+
+static struct dpu_hw_blk_ops dpu_hw_ops;
+
+struct dpu_hw_merge_3d *dpu_hw_merge_3d_init(enum dpu_merge_3d idx,
+		void __iomem *addr,
+		const struct dpu_mdss_cfg *m)
+{
+	struct dpu_hw_merge_3d *c;
+	const struct dpu_merge_3d_cfg *cfg;
+
+	c = kzalloc(sizeof(*c), GFP_KERNEL);
+	if (!c)
+		return ERR_PTR(-ENOMEM);
+
+	cfg = _merge_3d_offset(idx, m, addr, &c->hw);
+	if (IS_ERR_OR_NULL(cfg)) {
+		kfree(c);
+		return ERR_PTR(-EINVAL);
+	}
+
+	c->idx = idx;
+	c->caps = cfg;
+	_setup_merge_3d_ops(c, c->caps->features);
+
+	dpu_hw_blk_init(&c->base, DPU_HW_BLK_MERGE_3D, idx, &dpu_hw_ops);
+
+	return c;
+}
+
+void dpu_hw_merge_3d_destroy(struct dpu_hw_merge_3d *hw)
+{
+	if (hw)
+		dpu_hw_blk_destroy(&hw->base);
+	kfree(hw);
+}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.h
new file mode 100644
index 000000000000..aaad7c90cfb0
--- /dev/null
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.h
@@ -0,0 +1,64 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _DPU_HW_MERGE3D_H
+#define _DPU_HW_MERGE3D_H
+
+#include "dpu_hw_catalog.h"
+#include "dpu_hw_mdss.h"
+#include "dpu_hw_util.h"
+#include "dpu_hw_blk.h"
+
+struct dpu_hw_merge_3d;
+
+/**
+ *
+ * struct dpu_hw_merge_3d_ops : Interface to the merge_3d Hw driver functions
+ *  Assumption is these functions will be called after clocks are enabled
+ */
+struct dpu_hw_merge_3d_ops {
+};
+
+struct dpu_hw_merge_3d {
+	struct dpu_hw_blk base;
+	struct dpu_hw_blk_reg_map hw;
+
+	/* merge_3d */
+	enum dpu_merge_3d idx;
+	const struct dpu_merge_3d_cfg *caps;
+
+	/* ops */
+	struct dpu_hw_merge_3d_ops ops;
+};
+
+/**
+ * to_dpu_hw_merge_3d - convert base object dpu_hw_base to container
+ * @hw: Pointer to base hardware block
+ * return: Pointer to hardware block container
+ */
+static inline struct dpu_hw_merge_3d *to_dpu_hw_merge_3d(struct dpu_hw_blk *hw)
+{
+	return container_of(hw, struct dpu_hw_merge_3d, base);
+}
+
+/**
+ * dpu_hw_merge_3d_init - initializes the merge_3d driver for the passed
+ *	merge_3d idx.
+ * @idx:  Pingpong index for which driver object is required
+ * @addr: Mapped register io address of MDP
+ * @m:    Pointer to mdss catalog data
+ * Returns: Error code or allocated dpu_hw_merge_3d context
+ */
+struct dpu_hw_merge_3d *dpu_hw_merge_3d_init(enum dpu_merge_3d idx,
+		void __iomem *addr,
+		const struct dpu_mdss_cfg *m);
+
+/**
+ * dpu_hw_merge_3d_destroy - destroys merge_3d driver context
+ *	should be called to free the context
+ * @pp:   Pointer to PP driver context returned by dpu_hw_merge_3d_init
+ */
+void dpu_hw_merge_3d_destroy(struct dpu_hw_merge_3d *pp);
+
+#endif /*_DPU_HW_MERGE3D_H */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 9b2b5044e8e0..7ddc26f51d8e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -10,6 +10,7 @@
 #include "dpu_hw_pingpong.h"
 #include "dpu_hw_intf.h"
 #include "dpu_hw_dspp.h"
+#include "dpu_hw_merge3d.h"
 #include "dpu_encoder.h"
 #include "dpu_trace.h"
 
@@ -42,6 +43,14 @@ int dpu_rm_destroy(struct dpu_rm *rm)
 			dpu_hw_pingpong_destroy(hw);
 		}
 	}
+	for (i = 0; i < ARRAY_SIZE(rm->merge_3d_blks); i++) {
+		struct dpu_hw_merge_3d *hw;
+
+		if (rm->merge_3d_blks[i]) {
+			hw = to_dpu_hw_merge_3d(rm->merge_3d_blks[i]);
+			dpu_hw_merge_3d_destroy(hw);
+		}
+	}
 	for (i = 0; i < ARRAY_SIZE(rm->mixer_blks); i++) {
 		struct dpu_hw_mixer *hw;
 
@@ -119,6 +128,24 @@ int dpu_rm_init(struct dpu_rm *rm,
 		}
 	}
 
+	for (i = 0; i < cat->merge_3d_count; i++) {
+		struct dpu_hw_merge_3d *hw;
+		const struct dpu_merge_3d_cfg *merge_3d = &cat->merge_3d[i];
+
+		if (merge_3d->id < MERGE_3D_0 || merge_3d->id >= MERGE_3D_MAX) {
+			DPU_ERROR("skip merge_3d %d with invalid id\n", merge_3d->id);
+			continue;
+		}
+		hw = dpu_hw_merge_3d_init(merge_3d->id, mmio, cat);
+		if (IS_ERR_OR_NULL(hw)) {
+			rc = PTR_ERR(hw);
+			DPU_ERROR("failed merge_3d object creation: err %d\n",
+				rc);
+			goto fail;
+		}
+		rm->merge_3d_blks[merge_3d->id - MERGE_3D_0] = &hw->base;
+	}
+
 	for (i = 0; i < cat->pingpong_count; i++) {
 		struct dpu_hw_pingpong *hw;
 		const struct dpu_pingpong_cfg *pp = &cat->pingpong[i];
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
index 08726bb1063a..1f12c8d5b8aa 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
@@ -29,6 +29,7 @@ struct dpu_rm {
 	struct dpu_hw_blk *ctl_blks[CTL_MAX - CTL_0];
 	struct dpu_hw_blk *intf_blks[INTF_MAX - INTF_0];
 	struct dpu_hw_blk *dspp_blks[DSPP_MAX - DSPP_0];
+	struct dpu_hw_blk *merge_3d_blks[MERGE_3D_MAX - MERGE_3D_0];
 
 	uint32_t lm_max_width;
 };
-- 
2.28.0

