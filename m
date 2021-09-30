Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98A8141DBC0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Sep 2021 16:00:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351597AbhI3OCW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Sep 2021 10:02:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351628AbhI3OCW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Sep 2021 10:02:22 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 632BAC06176A
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Sep 2021 07:00:39 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id x27so25538585lfa.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Sep 2021 07:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PFqUkWD8NGSgiezsCrQRa8mXM2jLTUXGOJfmgaOle5I=;
        b=mOHrfvpmmDqTDBwhfFSyVdbQcJ5S2FE3Azr++pVzCWT6Y2d2nSkUU9XmqAcK6Jm/Gf
         d/4rAuJjlDa0mvWkWSzu/DdJYq+ty5sxO8hdM3ub/ulQUdVxGVdWHFwayMCZlr2NlUWw
         H8c/nEi1PSCZER//pxCmEXsfk+vVDzgo/tWVHBeA8Ey27byr3gtR05197aVaa65l3jPn
         FqQqYiZYJyZccZOsqvKx0RS3jqNgsj26CmN1pABjHeB1MgHdNfhhA+k0RFwgXPUqYg9y
         zz1nZilBrlKrFObj7UwfQ54QJ4jQuFTbQqq1A80Tmv8CFLvbaJsCUFq//8JrJKVhK2Lu
         T4Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PFqUkWD8NGSgiezsCrQRa8mXM2jLTUXGOJfmgaOle5I=;
        b=eKXFmx8TdURi2X70x7oqjixn0G2/5j9ZIEDXMoaKxQ1KiYTGnoSwcXRo8vMgFk14wD
         i90+enYPx5kxWusyIVmbzgJslaVzViSHD2KFySeCds6EHF7/h1jewWNMHYFqQrZXyRRy
         Yt14C9xhyWb2CRD17LY/HdqgIbiAprGxt0El6uxWO9KE4cdyrd16sGKfb0nSnYs668hk
         OqNSCaD3nIJFkaKCTtA+o4z6F5MxE2PbvXVG5/pPlClosZJY93JShba1VYBQeGAGUhex
         WeWAHgPnmxPe5eY5pF834z4MiiZa3+FP8YBOWY1vk0IqxlT2P3c0VJ/jbGXOUpgWEWXF
         IlNA==
X-Gm-Message-State: AOAM533cOD7Ono71gwJR+rj5FX9rF14PGq9ZeQkl2iuB0PUzJcBjO3JG
        VKh8PM804d6qTzYgNsG9WDO09g==
X-Google-Smtp-Source: ABdhPJzQUvCX1HzL4qY3yPVwu37h0ENC0leNv4zsN/ayXRiYgSqcmj8GbCR3FcnNsG3EXBSHgrfWQA==
X-Received: by 2002:a2e:a553:: with SMTP id e19mr6498915ljn.420.1633010427976;
        Thu, 30 Sep 2021 07:00:27 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id o7sm380481lfr.216.2021.09.30.07.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Sep 2021 07:00:27 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 09/11] drm/msm/dpu: don't cache pipe->cap->features in dpu_plane
Date:   Thu, 30 Sep 2021 17:00:00 +0300
Message-Id: <20210930140002.308628-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210930140002.308628-1-dmitry.baryshkov@linaro.org>
References: <20210930140002.308628-1-dmitry.baryshkov@linaro.org>
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
index d3ae0cb2047c..af403c0d3d7d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -100,7 +100,6 @@ struct dpu_plane {
 	struct mutex lock;
 
 	enum dpu_sspp pipe;
-	uint32_t features;      /* capabilities from catalog */
 
 	struct dpu_hw_pipe *pipe_hw;
 	uint32_t color_fill;
@@ -644,7 +643,7 @@ static const struct dpu_csc_cfg *_dpu_plane_get_csc(struct dpu_plane *pdpu, cons
 	if (!DPU_FORMAT_IS_YUV(fmt))
 		return NULL;
 
-	if (BIT(DPU_SSPP_CSC_10BIT) & pdpu->features)
+	if (BIT(DPU_SSPP_CSC_10BIT) & pdpu->pipe_hw->cap->features)
 		csc_ptr = &dpu_csc10_YUV2RGB_601L;
 	else
 		csc_ptr = &dpu_csc_YUV2RGB_601L;
@@ -1012,8 +1011,8 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	min_src_size = DPU_FORMAT_IS_YUV(fmt) ? 2 : 1;
 
 	if (DPU_FORMAT_IS_YUV(fmt) &&
-		(!(pdpu->features & DPU_SSPP_SCALER) ||
-		 !(pdpu->features & (BIT(DPU_SSPP_CSC)
+		(!(pdpu->pipe_hw->cap->features & DPU_SSPP_SCALER) ||
+		 !(pdpu->pipe_hw->cap->features & (BIT(DPU_SSPP_CSC)
 		 | BIT(DPU_SSPP_CSC_10BIT))))) {
 		DPU_DEBUG_PLANE(pdpu,
 				"plane doesn't have scaler/csc for yuv\n");
@@ -1439,8 +1438,8 @@ static int _dpu_plane_init_debugfs(struct drm_plane *plane)
 				plane->dev->primary->debugfs_root);
 
 	/* don't error check these */
-	debugfs_create_x32("features", 0600,
-			pdpu->debugfs_root, &pdpu->features);
+	debugfs_create_xul("features", 0600,
+			pdpu->debugfs_root, (unsigned long *)&pdpu->pipe_hw->cap->features);
 
 	/* add register dump support */
 	dpu_debugfs_setup_regset32(&pdpu->debugfs_src,
@@ -1613,7 +1612,6 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
 	}
 
 	/* cache features mask for later */
-	pdpu->features = pdpu->pipe_hw->cap->features;
 	pdpu->pipe_sblk = pdpu->pipe_hw->cap->sblk;
 	if (!pdpu->pipe_sblk) {
 		DPU_ERROR("[%u]invalid sblk\n", pipe);
-- 
2.33.0

