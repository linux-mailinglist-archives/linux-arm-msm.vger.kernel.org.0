Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A955F41DBB9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Sep 2021 16:00:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351635AbhI3OCQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Sep 2021 10:02:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351628AbhI3OCQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Sep 2021 10:02:16 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5442FC06176C
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Sep 2021 07:00:33 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id b20so25971838lfv.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Sep 2021 07:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aYS1x2CbuXKYXkeQ/VC/wMMzn40BtQr4/xDHUA+NAmM=;
        b=qfUqdVEHwCiTJby47jhOjmEMOVuGVC0EjARWMKgebT9mVYZqy7+0NCCG+5QUC6owXJ
         Nd5G1XPQ7M9Lu3xPgiBzXLVe/HxEq6ceaHn0QwZplZRfda8gY4LE3I3pTmeNAaWPjuQS
         eILL0Fa5a1YK98Rfu4psajfagMyfbGIzTES/+Hepe9qYlkTNe2I271VNQhK4Xnc0Vu7W
         KXi1oQ+wiec7WwHK7kJynQ7xGhbq4zjdQNWGe2qs233MhWvA4uJEJPZrAhye1nYc7vbK
         jtfVDZ720NVzyZjkZwHq1V3b7LQGjPrOv8N0nNS1SG57xhVKGEzJaTHZk8X13SkRgttU
         rDGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aYS1x2CbuXKYXkeQ/VC/wMMzn40BtQr4/xDHUA+NAmM=;
        b=rIVvHYj3FuKnmnEs/pqe4GgoZM0IPQ4dVvxrykf2uMHMU5F0bRvnc+b3piGdodWPpv
         2gheDHVy64xS8tYgV97Xjn/yCT4qiPgZ9VzkxhG1jU6CZSbPlfGMR9oMOKaWcpBUKRQl
         8tP5cmn+wJgVgCveQq7YmiFaDgB5KFu+4DYfDfY355dDBXNZEUozPQeD2ipwJlHIteis
         78yCROkj26jZsquCkYrI0jxFCz8ordnXR4AFXyKYCiqwZaCzcirx7yib0JAiCBygHVHi
         5IyUl8l5Gb6Nx7vsD1wNgEhk/7AJ9Py25ktYuB5baOVFrhUluGNgEv8tZZ6qIdM+khu3
         Fbow==
X-Gm-Message-State: AOAM531wKoHg6/AuFE0aHxSUwk8mj46FNV1nP8xsqAvXQTBEn2wYwWP7
        wdjTXJQMPMjih+PlQq417dcIQ1YfcFfwyw==
X-Google-Smtp-Source: ABdhPJzGRfyulK3CuoZiYVNaTKGaWsNl+Zr9zOCkWXH0pdakflEQe5prg13QsiG+uaPQsH5CsQ3kIg==
X-Received: by 2002:a05:651c:1067:: with SMTP id y7mr6244759ljm.481.1633010427100;
        Thu, 30 Sep 2021 07:00:27 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id o7sm380481lfr.216.2021.09.30.07.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Sep 2021 07:00:26 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 08/11] drm/msm/dpu: remove dpu_hw_pipe_cdp_cfg from dpu_plane
Date:   Thu, 30 Sep 2021 16:59:59 +0300
Message-Id: <20210930140002.308628-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210930140002.308628-1-dmitry.baryshkov@linaro.org>
References: <20210930140002.308628-1-dmitry.baryshkov@linaro.org>
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
index b8836c089863..d3ae0cb2047c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1182,20 +1182,20 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
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
index 087194be3c22..1ee5ca5fcdf7 100644
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
2.33.0

