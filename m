Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFD5246592E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Dec 2021 23:26:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353583AbhLAWaK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Dec 2021 17:30:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353629AbhLAWaD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Dec 2021 17:30:03 -0500
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD59AC06174A
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Dec 2021 14:26:41 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id e11so50990138ljo.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Dec 2021 14:26:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IPVLDgnWhiffGg+ltlm6jFDDP7VKjhpJAJFiDVdO8N0=;
        b=ffxswi7e6qVsGwiUetlg2L9vL1KHpzBwwSPSnXcaqR0F41NLuoj5+MLMxsYH137iwu
         3k8xqvbXPdWJQ8PFyzOYbJCJlYh7SowrTTwNYar2gKU0n6dAyms1UvLqmLhT3gmpx9iV
         gHqDa9L28bygXdk0YVphcmvvFrHgtVGRELM61CsjhwjaBu+Ht1AtJymz0E2Gyev57xgu
         romX3Q6yJu6sGu08xTeu4qDo1L4OfvS7bA5X3uSmfSlnJu0L4wNz814JQWpazv7mxM0J
         MsLCAp3/HB9+X86Jj4suguB9WlIS4zqZXFrpPWzvF5BwZBL4Z/tv3jGNcJSGZZ64bH5x
         uhCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IPVLDgnWhiffGg+ltlm6jFDDP7VKjhpJAJFiDVdO8N0=;
        b=3ZhStaqK3VTI/aSuj+m4l96CYNuOY37/M6vxK94ynD8+8T8qPjVxDbuHpEKksxE7nL
         Vsz300L9IOpVSb13L0sODJAXessJr+8ejivvHZQlqHnR97I/aacW2G5oif627YQXv6Wf
         tFNoh2Wk08O3dpe8/2o73MCwnHPYnKMxfVIr60a0DnyeiuNfc0YVpcNXBUjHJ9Tbg7vE
         XqqPrLM9gXnyPP80rKN7ysZ4DJYsfu6H4FmthNNB7vYehcazf7v9XI8tym8Mv7dm0qG7
         NXv8rUF2Zw9wgZZh1uylBigwhBYkkr+xkBWLtjZh10lJCp4uekBlqJCCzKh8hRW+3JhT
         NiVg==
X-Gm-Message-State: AOAM53049SvjsRPy7FypQaIWqz8kbhl9Jjh5V4sr5CNd0Ufcok7kKyoh
        y9mvXtihocK1pZvvODbsnNvaWg==
X-Google-Smtp-Source: ABdhPJzBozT03glC0cSzbckwkIGAr0LRXKjsB6uYW6kKFalJ9YpUhJ4sE2AHDJXNYRvYE/eH5mFhqQ==
X-Received: by 2002:a2e:b8cf:: with SMTP id s15mr8225808ljp.364.1638397600114;
        Wed, 01 Dec 2021 14:26:40 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u7sm117004lfs.144.2021.12.01.14.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Dec 2021 14:26:39 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v1 5/8] drm/msm/dpu: stop manually removing debugfs files for the DPU plane
Date:   Thu,  2 Dec 2021 01:26:30 +0300
Message-Id: <20211201222633.2476780-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211201222633.2476780-1-dmitry.baryshkov@linaro.org>
References: <20211201222633.2476780-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

DRM code handles removing all debugfs recursively. Drop plane-specific
code to perform that.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 28 ++++++++---------------
 1 file changed, 10 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index f80ee3ba9a8a..d3176f58708e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -110,7 +110,6 @@ struct dpu_plane {
 	struct dpu_mdss_cfg *catalog;
 
 	/* debugfs related stuff */
-	struct dentry *debugfs_root;
 	struct dpu_debugfs_regset32 debugfs_src;
 	struct dpu_debugfs_regset32 debugfs_scaler;
 	struct dpu_debugfs_regset32 debugfs_csc;
@@ -1368,15 +1367,16 @@ static int _dpu_plane_init_debugfs(struct drm_plane *plane)
 	struct dpu_kms *kms = _dpu_plane_get_kms(plane);
 	const struct dpu_sspp_cfg *cfg = pdpu->pipe_hw->cap;
 	const struct dpu_sspp_sub_blks *sblk = cfg->sblk;
+	struct dentry *debugfs_root;
 
 	/* create overall sub-directory for the pipe */
-	pdpu->debugfs_root =
+	debugfs_root =
 		debugfs_create_dir(plane->name,
 				plane->dev->primary->debugfs_root);
 
 	/* don't error check these */
 	debugfs_create_xul("features", 0600,
-			pdpu->debugfs_root, (unsigned long *)&pdpu->pipe_hw->cap->features);
+			debugfs_root, (unsigned long *)&pdpu->pipe_hw->cap->features);
 
 	/* add register dump support */
 	dpu_debugfs_setup_regset32(&pdpu->debugfs_src,
@@ -1384,7 +1384,7 @@ static int _dpu_plane_init_debugfs(struct drm_plane *plane)
 			sblk->src_blk.len,
 			kms);
 	dpu_debugfs_create_regset32("src_blk", 0400,
-			pdpu->debugfs_root, &pdpu->debugfs_src);
+			debugfs_root, &pdpu->debugfs_src);
 
 	if (cfg->features & BIT(DPU_SSPP_SCALER_QSEED3) ||
 			cfg->features & BIT(DPU_SSPP_SCALER_QSEED3LITE) ||
@@ -1395,7 +1395,7 @@ static int _dpu_plane_init_debugfs(struct drm_plane *plane)
 				sblk->scaler_blk.len,
 				kms);
 		dpu_debugfs_create_regset32("scaler_blk", 0400,
-				pdpu->debugfs_root,
+				debugfs_root,
 				&pdpu->debugfs_scaler);
 	}
 
@@ -1406,24 +1406,24 @@ static int _dpu_plane_init_debugfs(struct drm_plane *plane)
 				sblk->csc_blk.len,
 				kms);
 		dpu_debugfs_create_regset32("csc_blk", 0400,
-				pdpu->debugfs_root, &pdpu->debugfs_csc);
+				debugfs_root, &pdpu->debugfs_csc);
 	}
 
 	debugfs_create_u32("xin_id",
 			0400,
-			pdpu->debugfs_root,
+			debugfs_root,
 			(u32 *) &cfg->xin_id);
 	debugfs_create_u32("clk_ctrl",
 			0400,
-			pdpu->debugfs_root,
+			debugfs_root,
 			(u32 *) &cfg->clk_ctrl);
 	debugfs_create_x32("creq_vblank",
 			0600,
-			pdpu->debugfs_root,
+			debugfs_root,
 			(u32 *) &sblk->creq_vblank);
 	debugfs_create_x32("danger_vblank",
 			0600,
-			pdpu->debugfs_root,
+			debugfs_root,
 			(u32 *) &sblk->danger_vblank);
 
 	return 0;
@@ -1440,13 +1440,6 @@ static int dpu_plane_late_register(struct drm_plane *plane)
 	return _dpu_plane_init_debugfs(plane);
 }
 
-static void dpu_plane_early_unregister(struct drm_plane *plane)
-{
-	struct dpu_plane *pdpu = to_dpu_plane(plane);
-
-	debugfs_remove_recursive(pdpu->debugfs_root);
-}
-
 static bool dpu_plane_format_mod_supported(struct drm_plane *plane,
 		uint32_t format, uint64_t modifier)
 {
@@ -1472,7 +1465,6 @@ static const struct drm_plane_funcs dpu_plane_funcs = {
 		.atomic_duplicate_state = dpu_plane_duplicate_state,
 		.atomic_destroy_state = dpu_plane_destroy_state,
 		.late_register = dpu_plane_late_register,
-		.early_unregister = dpu_plane_early_unregister,
 		.format_mod_supported = dpu_plane_format_mod_supported,
 };
 
-- 
2.33.0

