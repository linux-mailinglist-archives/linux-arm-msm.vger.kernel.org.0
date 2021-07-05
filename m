Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 610A43BB4AF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jul 2021 03:25:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229813AbhGEB1w (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Jul 2021 21:27:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229744AbhGEB1w (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Jul 2021 21:27:52 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40196C061574
        for <linux-arm-msm@vger.kernel.org>; Sun,  4 Jul 2021 18:25:15 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id u25so22343146ljj.11
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Jul 2021 18:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8c3sgvuHdJKDI8oSDc/VT13RBuCWzIij8O7ZSxecGZ4=;
        b=CTXDRElAcOyDEOMY/9lotZPieTRYm3AK12V8evu+RlxZzSOJY11pcmsJK03o/SrqYT
         tfB3aUqCnYi4jOYVPRXNqkwWrblRFk+7DAmkdYAfqUDgtHlLpWHBjL5EVt+TikIOToc0
         g5llO5gYdOLnJoZmPTw8yggRWYXeKmUwirBD/k7IrjUd5+zakAXdrrQhcr0mtjtLBWl0
         ll78rBPBCFVqdjAIDm61vJwuU0Tqwpha3rHOvdPQoyM9ToG6UMOkZ7NKuoFYi7PuTN5T
         b0OiJL/uLwF7JA5vP7v/p0att8PRORG1jFJTH3BIuRmpWHzN70nQV26TJscggZRL0bns
         GNrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8c3sgvuHdJKDI8oSDc/VT13RBuCWzIij8O7ZSxecGZ4=;
        b=W8zXMGgXRtA/9/+1bz5ziCDoYP1VL2BR4626mlfzTZGXRE0cJLTWznVN+d+i9aa13+
         8TbLjHbkQLCSK1SkAnBIX9ZT4pVUnqjsgTQE96c4WN3sh5arGX5VHR5bGoNn77uoZOiy
         paqfi0kwVNs5XWtVZB2KUBiBqPESbWXpz/qdfNCEpMKxiiQiVXPOJ3v54K96Mz8OHlOV
         tLLpAjEe+lYo/9s7gjdBnoQJbXM0Ug14UD0oVzf4V1xq141+5mcQSlsdRiM0zk2dKrX2
         XzcjAHpnbMXS39PtZpJzhzHL4rck+vZLgT+spsVrFU6PeDAikEanLUqup9pmvs8rK/Lv
         fxzw==
X-Gm-Message-State: AOAM5316sQO8lh5Rb4qe+wnMkA304LovGLgdw+5D9UDGyn1aWMMuiLP7
        W0bwspJ9Xer/he4HvEV28OfM8w==
X-Google-Smtp-Source: ABdhPJxwjPzPvQR/qc+fJbi6y5GLsRoKgiBFYoSJokZ0TbGtORVEQL/F6VxAhMYIiq9moBu8HvLQLg==
X-Received: by 2002:a2e:9e18:: with SMTP id e24mr9397145ljk.336.1625448313539;
        Sun, 04 Jul 2021 18:25:13 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id c7sm1004345lfm.50.2021.07.04.18.25.12
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
Subject: [PATCH v2 09/22] drm/msm/dpu: remove dpu_hw_pipe_cdp_cfg from dpu_plane
Date:   Mon,  5 Jul 2021 04:21:02 +0300
Message-Id: <20210705012115.4179824-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210705012115.4179824-1-dmitry.baryshkov@linaro.org>
References: <20210705012115.4179824-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Remove struct dpu_hw_pipe_cdp_cfg instance from dpu_plane, it is an
interim configuration structure. Allocate it on stack instead.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 14 +++++++-------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |  2 --
 2 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 6f856aeaf6bc..fdae6520c2bb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1162,20 +1162,20 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 				pstate->multirect_index);
 
 		if (pdpu->pipe_hw->ops.setup_cdp) {
-			struct dpu_hw_pipe_cdp_cfg *cdp_cfg = &pstate->cdp_cfg;
+			struct dpu_hw_pipe_cdp_cfg cdp_cfg;
 
-			memset(cdp_cfg, 0, sizeof(struct dpu_hw_pipe_cdp_cfg));
+			memset(&cdp_cfg, 0, sizeof(struct dpu_hw_pipe_cdp_cfg));
 
-			cdp_cfg->enable = pdpu->catalog->perf.cdp_cfg
+			cdp_cfg.enable = pdpu->catalog->perf.cdp_cfg
 					[DPU_PERF_CDP_USAGE_RT].rd_enable;
-			cdp_cfg->ubwc_meta_enable =
+			cdp_cfg.ubwc_meta_enable =
 					DPU_FORMAT_IS_UBWC(fmt);
-			cdp_cfg->tile_amortize_enable =
+			cdp_cfg.tile_amortize_enable =
 					DPU_FORMAT_IS_UBWC(fmt) ||
 					DPU_FORMAT_IS_TILE(fmt);
-			cdp_cfg->preload_ahead = DPU_SSPP_CDP_PRELOAD_AHEAD_64;
+			cdp_cfg.preload_ahead = DPU_SSPP_CDP_PRELOAD_AHEAD_64;
 
-			pdpu->pipe_hw->ops.setup_cdp(pdpu->pipe_hw, cdp_cfg);
+			pdpu->pipe_hw->ops.setup_cdp(pdpu->pipe_hw, &cdp_cfg);
 		}
 	}
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
index 3e4ed8a33a3e..48366da5e86e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
@@ -23,7 +23,6 @@
  * @multirect_index: index of the rectangle of SSPP
  * @multirect_mode: parallel or time multiplex multirect mode
  * @pending:	whether the current update is still pending
- * @cdp_cfg:	CDP configuration
  * @plane_fetch_bw: calculated BW per plane
  * @plane_clk: calculated clk per plane
  */
@@ -36,7 +35,6 @@ struct dpu_plane_state {
 	uint32_t multirect_mode;
 	bool pending;
 
-	struct dpu_hw_pipe_cdp_cfg cdp_cfg;
 	u64 plane_fetch_bw;
 	u64 plane_clk;
 };
-- 
2.30.2

