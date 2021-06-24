Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB0CA3B31EC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jun 2021 16:57:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232268AbhFXPAF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Jun 2021 11:00:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232196AbhFXPAE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Jun 2021 11:00:04 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34B19C06175F
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jun 2021 07:57:45 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id u13so10832274lfk.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jun 2021 07:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hys3VoodSCY+pIfMzjrkMFnG9NkOn3VbfSGPhyfFM/w=;
        b=OtPWTlR7VlVAwZ88Rn4mR1aDNFmFeS6Ft8kTw42PERDQnPxBw1LgJwA/IGQet5qXqJ
         R8T2y4HmREsnNk1fFhm5ROegMkBDOoG+CkccID38fN/1DgwaWQIjJUjIuPD1rT5RjlGW
         Gfj2cX/jydWmrsuqgJWWL1/XetOAPTyF7KAY71Zdc2iUwqSlO2CF0SV/34jaUN4r23PS
         jLuYH31q6HhQHAbl9hTqnPHErC/vhDI4M6Uz0ZshncHv6lRmw2SIufgmazoKgswlzUui
         12YFwviMtXJ+G5YdTjnn8MDDgVYLMNwWs9GmOtDOs83cTDhsU2p+lyyyg5XemsdmtJl9
         3rPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hys3VoodSCY+pIfMzjrkMFnG9NkOn3VbfSGPhyfFM/w=;
        b=eLq2/TVgz6nP06atc7wEzYNK5Xkw2sdNk0TXle53MUvqIL5KiVL6Q674QrFIBZ0TOy
         hA0haGsNmzCQBsf/4y2/whckvoe/GAdI958xadMMWjLmfp1DAYq6XoDIAwerJrKW8Yfv
         yDcAgjyCR1jnPqs72KsxI2O/sj4IaWirhFcW8D8VW0sAg8UWZLutt4bU+GixejvY7/s1
         e/HQiy2f4aClxii1mkb2x0/lNcylLutbg79sRUqqGSfZQ1LtZWAEZSEiA+p+9a8WJqLY
         G1+zAvF25AsQJhSJqwNHzkbsiFCyYU0OhRN+yL4wT2PiLXYdpA9ThRfFQpngDnnCV1vV
         VrPA==
X-Gm-Message-State: AOAM530g2DbPi2nwcn0UZg6CEBB2V8czJ8pdVBv7ECWim5cA1nDMXwQd
        8BwLHYGhsVsf4c+w4V6oEdBnXg==
X-Google-Smtp-Source: ABdhPJyfp/lezMEkLPUEBxNCauD2O3a7VevfMPowkL9NHbNo3lizCRH+iIeRxCHirl1z/zNfSrw6pA==
X-Received: by 2002:ac2:4d19:: with SMTP id r25mr4185459lfi.150.1624546663565;
        Thu, 24 Jun 2021 07:57:43 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id e17sm306329ljn.125.2021.06.24.07.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jun 2021 07:57:43 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 07/17] drm/msm/dpu: don't cache pipe->cap->features in dpu_plane
Date:   Thu, 24 Jun 2021 17:57:23 +0300
Message-Id: <20210624145733.2561992-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210624145733.2561992-1-dmitry.baryshkov@linaro.org>
References: <20210624145733.2561992-1-dmitry.baryshkov@linaro.org>
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
index 521ae699dc5a..cf45a86877e2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -100,7 +100,6 @@ struct dpu_plane {
 	struct mutex lock;
 
 	enum dpu_sspp pipe;
-	uint32_t features;      /* capabilities from catalog */
 
 	struct dpu_hw_pipe *pipe_hw;
 	uint32_t color_fill;
@@ -624,7 +623,7 @@ static void _dpu_plane_setup_csc(struct dpu_plane *pdpu)
 		return;
 	}
 
-	if (BIT(DPU_SSPP_CSC_10BIT) & pdpu->features)
+	if (BIT(DPU_SSPP_CSC_10BIT) & pdpu->pipe_hw->cap->features)
 		pdpu->csc_ptr = (struct dpu_csc_cfg *)&dpu_csc10_YUV2RGB_601L;
 	else
 		pdpu->csc_ptr = (struct dpu_csc_cfg *)&dpu_csc_YUV2RGB_601L;
@@ -972,8 +971,8 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	min_src_size = DPU_FORMAT_IS_YUV(fmt) ? 2 : 1;
 
 	if (DPU_FORMAT_IS_YUV(fmt) &&
-		(!(pdpu->features & DPU_SSPP_SCALER) ||
-		 !(pdpu->features & (BIT(DPU_SSPP_CSC)
+		(!(pdpu->pipe_hw->cap->features & DPU_SSPP_SCALER) ||
+		 !(pdpu->pipe_hw->cap->features & (BIT(DPU_SSPP_CSC)
 		 | BIT(DPU_SSPP_CSC_10BIT))))) {
 		DPU_DEBUG_PLANE(pdpu,
 				"plane doesn't have scaler/csc for yuv\n");
@@ -1412,8 +1411,8 @@ static int _dpu_plane_init_debugfs(struct drm_plane *plane)
 				plane->dev->primary->debugfs_root);
 
 	/* don't error check these */
-	debugfs_create_x32("features", 0600,
-			pdpu->debugfs_root, &pdpu->features);
+	debugfs_create_xul("features", 0600,
+			pdpu->debugfs_root, (unsigned long *)&pdpu->pipe_hw->cap->features);
 
 	/* add register dump support */
 	dpu_debugfs_setup_regset32(&pdpu->debugfs_src,
@@ -1572,7 +1571,6 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
 	}
 
 	/* cache features mask for later */
-	pdpu->features = pdpu->pipe_hw->cap->features;
 	pdpu->pipe_sblk = pdpu->pipe_hw->cap->sblk;
 	if (!pdpu->pipe_sblk) {
 		DPU_ERROR("[%u]invalid sblk\n", pipe);
-- 
2.30.2

