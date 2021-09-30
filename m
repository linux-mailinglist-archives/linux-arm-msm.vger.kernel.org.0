Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E283A41DBC1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Sep 2021 16:00:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351628AbhI3OCY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Sep 2021 10:02:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351630AbhI3OCX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Sep 2021 10:02:23 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05DE5C06176A
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Sep 2021 07:00:41 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id m3so25394402lfu.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Sep 2021 07:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=L8VFiMaw/E7ZxLbSKWJNqx7JXJFevPLqAT9XC+qZX/M=;
        b=XRuUHdXCcPCZ31nfxTJEdDWUqsG94tWf5gHM+hYAKNvCVjNm6vpUXYv/YC7ZHwsVZO
         syFCxIojZo3abxSfywZCM2ErvAEZD6oi3DKJBMOgfVOfsC+n5QlhEXVdhxPjj1Yccmvd
         vdVlDiqzQrCkv/ToVSNbFEs9a5UMiOeoixg0MFsTfqJdbumbrg6iFS45ccVusyhsF3lf
         mTJ8Y75uWkhO+iN04eoScym/DupoWqphY0hpQzWGUpN5CxrGA4S4JAr6hkGjeG1P6PzN
         9dIPH6qwWqcFH3t3tSTKdy6FlB52QSU2VcA8LYgZ0phfFOUKxLK2MZWuhWTvBb1qcGHy
         2GJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=L8VFiMaw/E7ZxLbSKWJNqx7JXJFevPLqAT9XC+qZX/M=;
        b=LBXSysuOwmb05arkUG1rRb2brph1P/abUDCQrPMcZr0fOqfDa9eygOeXfoBSfaf6rR
         8CwYgqv15fyHLgEri7KkFBHrzSonqPsBlItARAS2TQDeRaNJTGiqgjbYoWhbl2lONRpF
         h8VduWbzQajjj1oswJJZ42+ufkyz8wejlNISYirZkGQjgfG+mvNGuN+UEH20YAIYY8Yu
         KZkqzq01QkAtRj4bJT/6ic88OYOxnSQg0lvy19ONJViJfZ6OtpE9Gi1462mO2187ZTE2
         //aqigxxGsvKkioN52ERnqYHA+NduWNGBt1NWqGoscjTZzGqzP/DXDkv5jz9rathBEQV
         ZRdw==
X-Gm-Message-State: AOAM532PbhAw35EYmEq/n/P6kAIXqI/45hbc7Rl6rrEFrJzqjccHKsIC
        0iyOalwoQjKXj7w2ko5OKnAEzg==
X-Google-Smtp-Source: ABdhPJw6dfFXdeXo/uMfW9AsWXcpNcAm91wNAr2TQcJw1gtsUJ8+fgztk0Jo/clZHwsEgo+uN+bfkQ==
X-Received: by 2002:a2e:2f02:: with SMTP id v2mr5985435ljv.46.1633010428781;
        Thu, 30 Sep 2021 07:00:28 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id o7sm380481lfr.216.2021.09.30.07.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Sep 2021 07:00:28 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 10/11] drm/msm/dpu: don't cache pipe->cap->sblk in dpu_plane
Date:   Thu, 30 Sep 2021 17:00:01 +0300
Message-Id: <20210930140002.308628-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210930140002.308628-1-dmitry.baryshkov@linaro.org>
References: <20210930140002.308628-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Do not cache hw_pipe's sblk in dpu_plane. Use
pdpu->pipe_hw->cap->sblk directly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 25 ++++++++---------------
 1 file changed, 8 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index af403c0d3d7d..d8018e664925 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -109,8 +109,6 @@ struct dpu_plane {
 	struct list_head mplane_list;
 	struct dpu_mdss_cfg *catalog;
 
-	const struct dpu_sspp_sub_blks *pipe_sblk;
-
 	/* debugfs related stuff */
 	struct dentry *debugfs_root;
 	struct dpu_debugfs_regset32 debugfs_src;
@@ -425,9 +423,9 @@ static void _dpu_plane_set_qos_ctrl(struct drm_plane *plane,
 	memset(&pipe_qos_cfg, 0, sizeof(pipe_qos_cfg));
 
 	if (flags & DPU_PLANE_QOS_VBLANK_CTRL) {
-		pipe_qos_cfg.creq_vblank = pdpu->pipe_sblk->creq_vblank;
+		pipe_qos_cfg.creq_vblank = pdpu->pipe_hw->cap->sblk->creq_vblank;
 		pipe_qos_cfg.danger_vblank =
-				pdpu->pipe_sblk->danger_vblank;
+				pdpu->pipe_hw->cap->sblk->danger_vblank;
 		pipe_qos_cfg.vblank_en = enable;
 	}
 
@@ -982,10 +980,10 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 		crtc_state = drm_atomic_get_new_crtc_state(state,
 							   new_plane_state->crtc);
 
-	min_scale = FRAC_16_16(1, pdpu->pipe_sblk->maxupscale);
+	min_scale = FRAC_16_16(1, pdpu->pipe_hw->cap->sblk->maxupscale);
 	ret = drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
 						  min_scale,
-						  pdpu->pipe_sblk->maxdwnscale << 16,
+						  pdpu->pipe_hw->cap->sblk->maxdwnscale << 16,
 						  true, true);
 	if (ret) {
 		DPU_DEBUG_PLANE(pdpu, "Check plane state failed (%d)\n", ret);
@@ -1611,20 +1609,13 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
 		goto clean_sspp;
 	}
 
-	/* cache features mask for later */
-	pdpu->pipe_sblk = pdpu->pipe_hw->cap->sblk;
-	if (!pdpu->pipe_sblk) {
-		DPU_ERROR("[%u]invalid sblk\n", pipe);
-		goto clean_sspp;
-	}
-
 	if (pdpu->is_virtual) {
-		format_list = pdpu->pipe_sblk->virt_format_list;
-		num_formats = pdpu->pipe_sblk->virt_num_formats;
+		format_list = pdpu->pipe_hw->cap->sblk->virt_format_list;
+		num_formats = pdpu->pipe_hw->cap->sblk->virt_num_formats;
 	}
 	else {
-		format_list = pdpu->pipe_sblk->format_list;
-		num_formats = pdpu->pipe_sblk->num_formats;
+		format_list = pdpu->pipe_hw->cap->sblk->format_list;
+		num_formats = pdpu->pipe_hw->cap->sblk->num_formats;
 	}
 
 	ret = drm_universal_plane_init(dev, plane, 0xff, &dpu_plane_funcs,
-- 
2.33.0

