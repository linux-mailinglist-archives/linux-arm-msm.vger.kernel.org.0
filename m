Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A38C3BB4B1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jul 2021 03:25:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229817AbhGEB1x (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Jul 2021 21:27:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229744AbhGEB1x (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Jul 2021 21:27:53 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 097D6C061762
        for <linux-arm-msm@vger.kernel.org>; Sun,  4 Jul 2021 18:25:16 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id t17so29603783lfq.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Jul 2021 18:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yinWqN6sitnN8VvWfqsYfxul5z49radOuOsQ6IiCc/o=;
        b=raxV6kKpSU2jsR4bKPXudOKVrgMbTqNuB/McIhO0LUU+3WV99Q5c4FWI8Aaiq6D0BB
         8yaI10eFF+20zN4gcJVQIO6Kflg0GtCngaUD0Ady3qbYnlEXlpfLCbHp8jG9UCTOX/5O
         al81cqDU34/GxOPh18eKw/JgwL5axaV6uaYxuyVWpmyl00MJ2KPTU1FGddOe8diGMoVw
         jpty0R37Jmg2ca2+8G6kjJ36z4v5rZ2zHtJW80WmH+XllXJ9h08kvmrsSgK7JGGPDHF/
         sXE/m5jU0Ablbjv5RCeUeiHgbdiSlaWLX0hqF1uzfbUF7NHaNcB+1o5e16rBTe+NgPp/
         c/Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yinWqN6sitnN8VvWfqsYfxul5z49radOuOsQ6IiCc/o=;
        b=Xo6Eq5AleGzgzZkurBFZpFW8lgD9mz3/v7IHGk8+9rsT/i1kr2Jj6sjBjTlPox8iXj
         RYj4fimFeX8apzWVPRyJYXx+N0Vt2k0ihtODMMEc26vlxIr7YbUmSS9JZAaW3aOWMyhx
         eAwuJoYZYwnjKwvB5wGPCL+InWmRQFgcVLGcLej8xImsvoRGbv+WbumVbMB4DmZgXH5/
         uzMCW9H6XxVoA/UMKsp5UhwudX5xysLw5hHSO0+pUkS+g7S9+qOwqoCd/z1cedTcGCmK
         YnP9jNaIC8SmMiQSt+YH5MNt9cEmO79Ny+AQmK4uNhIIj0Q8an+P27RV2L6MpopdLTGE
         //zA==
X-Gm-Message-State: AOAM532BvyZomcMT4U4b/20oT+XnM9Dye6XDirH1e1DzKAOkpiGWF1e0
        ZaCDq3xb6f5/xeyvodlVVhpyOw==
X-Google-Smtp-Source: ABdhPJxXXCISyXSXqTpw1NmcO+okUMZsNuxIEPYRFRE+dPJhfMcsNupZt2sPHMls4ZZXRU3POrB/3A==
X-Received: by 2002:a05:6512:3e24:: with SMTP id i36mr8311158lfv.368.1625448314421;
        Sun, 04 Jul 2021 18:25:14 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id c7sm1004345lfm.50.2021.07.04.18.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jul 2021 18:25:13 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v2 10/22] drm/msm/dpu: don't cache pipe->cap->features in dpu_plane
Date:   Mon,  5 Jul 2021 04:21:03 +0300
Message-Id: <20210705012115.4179824-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210705012115.4179824-1-dmitry.baryshkov@linaro.org>
References: <20210705012115.4179824-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Do not cache hw_pipe's features in dpu_plane. Use
pdpu->pipe_hw->cap->features directly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index fdae6520c2bb..65446e8f5718 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -99,7 +99,6 @@ struct dpu_plane {
 	struct mutex lock;
 
 	enum dpu_sspp pipe;
-	uint32_t features;      /* capabilities from catalog */
 
 	struct dpu_hw_pipe *pipe_hw;
 	uint32_t color_fill;
@@ -629,7 +628,7 @@ static const struct dpu_csc_cfg *_dpu_plane_get_csc(struct dpu_plane *pdpu, cons
 	if (!DPU_FORMAT_IS_YUV(fmt))
 		return NULL;
 
-	if (BIT(DPU_SSPP_CSC_10BIT) & pdpu->features)
+	if (BIT(DPU_SSPP_CSC_10BIT) & pdpu->pipe_hw->cap->features)
 		csc_ptr = &dpu_csc10_YUV2RGB_601L;
 	else
 		csc_ptr = &dpu_csc_YUV2RGB_601L;
@@ -992,8 +991,8 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	min_src_size = DPU_FORMAT_IS_YUV(fmt) ? 2 : 1;
 
 	if (DPU_FORMAT_IS_YUV(fmt) &&
-		(!(pdpu->features & DPU_SSPP_SCALER) ||
-		 !(pdpu->features & (BIT(DPU_SSPP_CSC)
+		(!(pdpu->pipe_hw->cap->features & DPU_SSPP_SCALER) ||
+		 !(pdpu->pipe_hw->cap->features & (BIT(DPU_SSPP_CSC)
 		 | BIT(DPU_SSPP_CSC_10BIT))))) {
 		DPU_DEBUG_PLANE(pdpu,
 				"plane doesn't have scaler/csc for yuv\n");
@@ -1415,8 +1414,8 @@ static int _dpu_plane_init_debugfs(struct drm_plane *plane)
 				plane->dev->primary->debugfs_root);
 
 	/* don't error check these */
-	debugfs_create_x32("features", 0600,
-			pdpu->debugfs_root, &pdpu->features);
+	debugfs_create_xul("features", 0600,
+			pdpu->debugfs_root, (unsigned long *)&pdpu->pipe_hw->cap->features);
 
 	/* add register dump support */
 	dpu_debugfs_setup_regset32(&pdpu->debugfs_src,
@@ -1575,7 +1574,6 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
 	}
 
 	/* cache features mask for later */
-	pdpu->features = pdpu->pipe_hw->cap->features;
 	pdpu->pipe_sblk = pdpu->pipe_hw->cap->sblk;
 	if (!pdpu->pipe_sblk) {
 		DPU_ERROR("[%u]invalid sblk\n", pipe);
-- 
2.30.2

