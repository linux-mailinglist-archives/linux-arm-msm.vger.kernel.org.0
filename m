Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3012E46593C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Dec 2021 23:27:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353612AbhLAWaY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Dec 2021 17:30:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353635AbhLAWaF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Dec 2021 17:30:05 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77D84C061748
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Dec 2021 14:26:43 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id 13so50997511ljj.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Dec 2021 14:26:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=notfP1OjEVUqD6diGKORg1DThS/PAwpugZOcLB9s/EA=;
        b=ZZGVpSp7W4jOs0K9u4b2fTnl5kl7vhEGXXkuvxlVjtCszqbtXjGuFb8vje5A+szfZW
         FTQgx4ZueemhIKSm3WYUKCTLNGcywo7gcEpvDPR+J5UiGU24IE/j7NP/sxjsCfhu0ZL6
         d/0GS708qj78XgC4g7W4oboBS1DHex743wN3IBd6thSSBEljAI7g6pdMag2+4om9qhuz
         5CVCPmufGz8yw/b+pq1pbLBEkADlX+A4Xqpd5HScmidKEncpZLDqjqPifUUguSYrh8jW
         M7XgXPh6T4NVIBEG2U+CsoBclbI7uMmPc7s1mdEhaELXlDgM5I/3EqAOie+HSa4T7kVa
         /dqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=notfP1OjEVUqD6diGKORg1DThS/PAwpugZOcLB9s/EA=;
        b=HcTKxSo7m9EA93nZ0e5Z55WgRIpjFgs2k3BQdyZQNccZhxUfZdZsC79vLubmLIME6W
         i/B1pBE61KsP7XR/40hwL+zFb70WGhAZqNLv+dJa+NIx4tIqhVxZbl+AtWFbmEZMUKBk
         0qTnLAiplAP6hyCD9DOJt0dzQrDkKfluWtPHlOTfo2P5QcWFjFqbqwCl5QDznuSRmirz
         +rIQEyEdJruN9FqI3qx7VnfCyHwVdjA9xw/RTwD/vmK0O3kkeqqZizzh6E+VArznllUC
         /2v5VwaNBIQswOqU4dtbdBob9HKixb8sRy58iJsBUc7syt0T/F1BJqCV9QnZAq0Nh/X9
         6W2A==
X-Gm-Message-State: AOAM533aFwG7lrHHkH4i4R8MIuvqICBWRUeyHPb2jpBMnCzP+X8bGi6M
        aKNo9+Eg2EaQ9oQw0Zuyz5BLIA==
X-Google-Smtp-Source: ABdhPJytnX+M9vOm2nMGuL3tsKyRcli/SIULb4mjqlSF+xtcKtWFR/Yu3z4oSEoJWHgEzhZ3EWFFyA==
X-Received: by 2002:a05:651c:210f:: with SMTP id a15mr8000910ljq.486.1638397601658;
        Wed, 01 Dec 2021 14:26:41 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u7sm117004lfs.144.2021.12.01.14.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Dec 2021 14:26:41 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v1 7/8] drm/msm/dpu: simplify DPU's regset32 code
Date:   Thu,  2 Dec 2021 01:26:32 +0300
Message-Id: <20211201222633.2476780-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211201222633.2476780-1-dmitry.baryshkov@linaro.org>
References: <20211201222633.2476780-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Squash dpu_debugfs_setup_regset32() into dpu_debugfs_create_regset32().
it makes little sense to have separate function to just setup the
structure.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c   | 32 ++++++++++++-------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h   | 38 +++--------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 27 +++++-----------
 3 files changed, 33 insertions(+), 64 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 4c04982c71b2..7e7a619769a8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -182,6 +182,15 @@ static void dpu_debugfs_danger_init(struct dpu_kms *dpu_kms,
 
 }
 
+/*
+ * Companion structure for dpu_debugfs_create_regset32.
+ */
+struct dpu_debugfs_regset32 {
+	uint32_t offset;
+	uint32_t blk_len;
+	struct dpu_kms *dpu_kms;
+};
+
 static int _dpu_debugfs_show_regset32(struct seq_file *s, void *data)
 {
 	struct dpu_debugfs_regset32 *regset = s->private;
@@ -229,24 +238,23 @@ static const struct file_operations dpu_fops_regset32 = {
 	.release =	single_release,
 };
 
-void dpu_debugfs_setup_regset32(struct dpu_debugfs_regset32 *regset,
+void dpu_debugfs_create_regset32(const char *name, umode_t mode,
+		void *parent,
 		uint32_t offset, uint32_t length, struct dpu_kms *dpu_kms)
 {
-	if (regset) {
-		regset->offset = offset;
-		regset->blk_len = length;
-		regset->dpu_kms = dpu_kms;
-	}
-}
+	struct dpu_debugfs_regset32 *regset;
 
-void dpu_debugfs_create_regset32(const char *name, umode_t mode,
-		void *parent, struct dpu_debugfs_regset32 *regset)
-{
-	if (!name || !regset || !regset->dpu_kms || !regset->blk_len)
+	if (WARN_ON(!name || !dpu_kms || !length))
+		return;
+
+	regset = devm_kzalloc(&dpu_kms->pdev->dev, sizeof(*regset), GFP_KERNEL);
+	if (!regset)
 		return;
 
 	/* make sure offset is a multiple of 4 */
-	regset->offset = round_down(regset->offset, 4);
+	regset->offset = round_down(offset, 4);
+	regset->blk_len = length;
+	regset->dpu_kms = dpu_kms;
 
 	debugfs_create_file(name, mode, parent, regset, &dpu_fops_regset32);
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index 775bcbda860f..b53cdeb1b5c4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -160,33 +160,9 @@ struct dpu_global_state
  *
  * Documentation/filesystems/debugfs.rst
  *
- * @dpu_debugfs_setup_regset32: Initialize data for dpu_debugfs_create_regset32
  * @dpu_debugfs_create_regset32: Create 32-bit register dump file
- * @dpu_debugfs_get_root: Get root dentry for DPU_KMS's debugfs node
  */
 
-/**
- * Companion structure for dpu_debugfs_create_regset32. Do not initialize the
- * members of this structure explicitly; use dpu_debugfs_setup_regset32 instead.
- */
-struct dpu_debugfs_regset32 {
-	uint32_t offset;
-	uint32_t blk_len;
-	struct dpu_kms *dpu_kms;
-};
-
-/**
- * dpu_debugfs_setup_regset32 - Initialize register block definition for debugfs
- * This function is meant to initialize dpu_debugfs_regset32 structures for use
- * with dpu_debugfs_create_regset32.
- * @regset: opaque register definition structure
- * @offset: sub-block offset
- * @length: sub-block length, in bytes
- * @dpu_kms: pointer to dpu kms structure
- */
-void dpu_debugfs_setup_regset32(struct dpu_debugfs_regset32 *regset,
-		uint32_t offset, uint32_t length, struct dpu_kms *dpu_kms);
-
 /**
  * dpu_debugfs_create_regset32 - Create register read back file for debugfs
  *
@@ -195,20 +171,16 @@ void dpu_debugfs_setup_regset32(struct dpu_debugfs_regset32 *regset,
  * names/offsets do not need to be provided. The 'read' function simply outputs
  * sequential register values over a specified range.
  *
- * Similar to the related debugfs_create_regset32 API, the structure pointed to
- * by regset needs to persist for the lifetime of the created file. The calling
- * code is responsible for initialization/management of this structure.
- *
- * The structure pointed to by regset is meant to be opaque. Please use
- * dpu_debugfs_setup_regset32 to initialize it.
- *
  * @name:   File name within debugfs
  * @mode:   File mode within debugfs
  * @parent: Parent directory entry within debugfs, can be NULL
- * @regset: Pointer to persistent register block definition
+ * @offset: sub-block offset
+ * @length: sub-block length, in bytes
+ * @dpu_kms: pointer to dpu kms structure
  */
 void dpu_debugfs_create_regset32(const char *name, umode_t mode,
-		void *parent, struct dpu_debugfs_regset32 *regset);
+		void *parent,
+		uint32_t offset, uint32_t length, struct dpu_kms *dpu_kms);
 
 /**
  * dpu_debugfs_get_root - Return root directory entry for KMS's debugfs
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index d3176f58708e..ef66af696a40 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -108,11 +108,6 @@ struct dpu_plane {
 	bool is_virtual;
 	struct list_head mplane_list;
 	struct dpu_mdss_cfg *catalog;
-
-	/* debugfs related stuff */
-	struct dpu_debugfs_regset32 debugfs_src;
-	struct dpu_debugfs_regset32 debugfs_scaler;
-	struct dpu_debugfs_regset32 debugfs_csc;
 };
 
 static const uint64_t supported_format_modifiers[] = {
@@ -1379,35 +1374,29 @@ static int _dpu_plane_init_debugfs(struct drm_plane *plane)
 			debugfs_root, (unsigned long *)&pdpu->pipe_hw->cap->features);
 
 	/* add register dump support */
-	dpu_debugfs_setup_regset32(&pdpu->debugfs_src,
+	dpu_debugfs_create_regset32("src_blk", 0400,
+			debugfs_root,
 			sblk->src_blk.base + cfg->base,
 			sblk->src_blk.len,
 			kms);
-	dpu_debugfs_create_regset32("src_blk", 0400,
-			debugfs_root, &pdpu->debugfs_src);
 
 	if (cfg->features & BIT(DPU_SSPP_SCALER_QSEED3) ||
 			cfg->features & BIT(DPU_SSPP_SCALER_QSEED3LITE) ||
 			cfg->features & BIT(DPU_SSPP_SCALER_QSEED2) ||
-			cfg->features & BIT(DPU_SSPP_SCALER_QSEED4)) {
-		dpu_debugfs_setup_regset32(&pdpu->debugfs_scaler,
+			cfg->features & BIT(DPU_SSPP_SCALER_QSEED4))
+		dpu_debugfs_create_regset32("scaler_blk", 0400,
+				debugfs_root,
 				sblk->scaler_blk.base + cfg->base,
 				sblk->scaler_blk.len,
 				kms);
-		dpu_debugfs_create_regset32("scaler_blk", 0400,
-				debugfs_root,
-				&pdpu->debugfs_scaler);
-	}
 
 	if (cfg->features & BIT(DPU_SSPP_CSC) ||
-			cfg->features & BIT(DPU_SSPP_CSC_10BIT)) {
-		dpu_debugfs_setup_regset32(&pdpu->debugfs_csc,
+			cfg->features & BIT(DPU_SSPP_CSC_10BIT))
+		dpu_debugfs_create_regset32("csc_blk", 0400,
+				debugfs_root,
 				sblk->csc_blk.base + cfg->base,
 				sblk->csc_blk.len,
 				kms);
-		dpu_debugfs_create_regset32("csc_blk", 0400,
-				debugfs_root, &pdpu->debugfs_csc);
-	}
 
 	debugfs_create_u32("xin_id",
 			0400,
-- 
2.33.0

