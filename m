Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBA3F41DBAD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Sep 2021 16:00:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351594AbhI3OCI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Sep 2021 10:02:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351567AbhI3OCH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Sep 2021 10:02:07 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5594C06176A
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Sep 2021 07:00:24 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id j5so20886627lfg.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Sep 2021 07:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=K24m6l0NnBZbk6oY1NJdmmNReuA8KGWltScg/Ra42NU=;
        b=QtJgb548MrKRthSLXxC6fDjo4gouo3g156/3Xwi9vwdlRq86GgwP4P1/8fszHIgWIj
         3mfPKfzmaw+0kqE7rH3yqoGD0XSVqAHTsjNIIGfQZ77z+y6bc5Q0QdnVewWy8ELVWX1o
         ggqzN2gYsDzZ3ylZZhrebkztkN1dZ8N5PEusN3fEGEXzzSjBxDFGuNm6wpweWHPngppi
         39pBpJreRD09Pd1DJPHXr56PdJL0nl1VdTJkSo+POxPFZ8CmEd6zLtslKi3dyLcRogKu
         v07D8ey4la+QDyZzIUw4H/g6zkP2hcBC8gz9WzJs7xd6rX7tsEynl4Ty+P7HeV2Utph1
         2qeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=K24m6l0NnBZbk6oY1NJdmmNReuA8KGWltScg/Ra42NU=;
        b=P1tyrkzPwChA0t9qvNwtG5cQpRqweetNaSiCng5toAuqa8pOgd4FGjxemMJ5WZlbqF
         /F79ZTt0wlHpFCRawF7WPhJs89vhMdLgcxVaM7ikpGqJAMr+GD5rYHh3ZyLBT0B9/EJ5
         YwnP2oJLuB9PZMGe1ZkMlzIBBY19q1LLZFdNiowEdFJm42zTboOFbDg5KQRT0I/dF82S
         ib8Fd3/GSSgpYc0RLmlbMW4GJN+p9s/HQtbQBfsj8DBmrt2UBZU3TbvZ4G71M1/qB6+Z
         7YtQE/GuJlePT3KbLyApUe9jQk1sXqFG2k5g3ROanquLfonNqaQyrTK4Pi5DS4QMjTh6
         m+8Q==
X-Gm-Message-State: AOAM531mm118wsgor2TnHyXdNM42LodwZrU55RJ6eum0gB21eaRixCph
        wbRPSDS4IgePGHjZP9Xq9f2XTw==
X-Google-Smtp-Source: ABdhPJxMP0/y+hKybqSwpDrZ+90drfU8FXoTxtNpSWFNW0yDeFQgrWDXZlaXgn/QtJqOXhJPofB2HA==
X-Received: by 2002:a2e:6f1a:: with SMTP id k26mr5710514ljc.11.1633010420461;
        Thu, 30 Sep 2021 07:00:20 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id o7sm380481lfr.216.2021.09.30.07.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Sep 2021 07:00:19 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 01/11] drm/msm/dpu: move LUT levels out of QOS config
Date:   Thu, 30 Sep 2021 16:59:52 +0300
Message-Id: <20210930140002.308628-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210930140002.308628-1-dmitry.baryshkov@linaro.org>
References: <20210930140002.308628-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

LUT levels are setup outside of setup_qos_ctrl, so remove them from the
struct dpu_hw_pipe_qos_cfg.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 15 ++++++++-------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h | 16 ++++++----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 17 ++++++-----------
 3 files changed, 20 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index 69eed7932486..cbafb61404d0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -569,19 +569,20 @@ static void dpu_hw_sspp_setup_solidfill(struct dpu_hw_pipe *ctx, u32 color, enum
 }
 
 static void dpu_hw_sspp_setup_danger_safe_lut(struct dpu_hw_pipe *ctx,
-		struct dpu_hw_pipe_qos_cfg *cfg)
+			u32 danger_lut,
+			u32 safe_lut)
 {
 	u32 idx;
 
 	if (_sspp_subblk_offset(ctx, DPU_SSPP_SRC, &idx))
 		return;
 
-	DPU_REG_WRITE(&ctx->hw, SSPP_DANGER_LUT + idx, cfg->danger_lut);
-	DPU_REG_WRITE(&ctx->hw, SSPP_SAFE_LUT + idx, cfg->safe_lut);
+	DPU_REG_WRITE(&ctx->hw, SSPP_DANGER_LUT + idx, danger_lut);
+	DPU_REG_WRITE(&ctx->hw, SSPP_SAFE_LUT + idx, safe_lut);
 }
 
 static void dpu_hw_sspp_setup_creq_lut(struct dpu_hw_pipe *ctx,
-		struct dpu_hw_pipe_qos_cfg *cfg)
+			u64 creq_lut)
 {
 	u32 idx;
 
@@ -589,11 +590,11 @@ static void dpu_hw_sspp_setup_creq_lut(struct dpu_hw_pipe *ctx,
 		return;
 
 	if (ctx->cap && test_bit(DPU_SSPP_QOS_8LVL, &ctx->cap->features)) {
-		DPU_REG_WRITE(&ctx->hw, SSPP_CREQ_LUT_0 + idx, cfg->creq_lut);
+		DPU_REG_WRITE(&ctx->hw, SSPP_CREQ_LUT_0 + idx, creq_lut);
 		DPU_REG_WRITE(&ctx->hw, SSPP_CREQ_LUT_1 + idx,
-				cfg->creq_lut >> 32);
+				creq_lut >> 32);
 	} else {
-		DPU_REG_WRITE(&ctx->hw, SSPP_CREQ_LUT + idx, cfg->creq_lut);
+		DPU_REG_WRITE(&ctx->hw, SSPP_CREQ_LUT + idx, creq_lut);
 	}
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index fdfd4b46e2c6..27263bc1a1ef 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -166,18 +166,12 @@ struct dpu_hw_pipe_cfg {
 
 /**
  * struct dpu_hw_pipe_qos_cfg : Source pipe QoS configuration
- * @danger_lut: LUT for generate danger level based on fill level
- * @safe_lut: LUT for generate safe level based on fill level
- * @creq_lut: LUT for generate creq level based on fill level
  * @creq_vblank: creq value generated to vbif during vertical blanking
  * @danger_vblank: danger value generated during vertical blanking
  * @vblank_en: enable creq_vblank and danger_vblank during vblank
  * @danger_safe_en: enable danger safe generation
  */
 struct dpu_hw_pipe_qos_cfg {
-	u32 danger_lut;
-	u32 safe_lut;
-	u64 creq_lut;
 	u32 creq_vblank;
 	u32 danger_vblank;
 	bool vblank_en;
@@ -302,20 +296,22 @@ struct dpu_hw_sspp_ops {
 	/**
 	 * setup_danger_safe_lut - setup danger safe LUTs
 	 * @ctx: Pointer to pipe context
-	 * @cfg: Pointer to pipe QoS configuration
+	 * @danger_lut: LUT for generate danger level based on fill level
+	 * @safe_lut: LUT for generate safe level based on fill level
 	 *
 	 */
 	void (*setup_danger_safe_lut)(struct dpu_hw_pipe *ctx,
-			struct dpu_hw_pipe_qos_cfg *cfg);
+			u32 danger_lut,
+			u32 safe_lut);
 
 	/**
 	 * setup_creq_lut - setup CREQ LUT
 	 * @ctx: Pointer to pipe context
-	 * @cfg: Pointer to pipe QoS configuration
+	 * @creq_lut: LUT for generate creq level based on fill level
 	 *
 	 */
 	void (*setup_creq_lut)(struct dpu_hw_pipe *ctx,
-			struct dpu_hw_pipe_qos_cfg *cfg);
+			u64 creq_lut);
 
 	/**
 	 * setup_qos_ctrl - setup QoS control
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index c989621209aa..5e0d06f26e53 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -348,8 +348,6 @@ static void _dpu_plane_set_qos_lut(struct drm_plane *plane,
 	qos_lut = _dpu_plane_get_qos_lut(
 			&pdpu->catalog->perf.qos_lut_tbl[lut_usage], total_fl);
 
-	pdpu->pipe_qos_cfg.creq_lut = qos_lut;
-
 	trace_dpu_perf_set_qos_luts(pdpu->pipe - SSPP_VIG0,
 			(fmt) ? fmt->base.pixel_format : 0,
 			pdpu->is_rt_pipe, total_fl, qos_lut, lut_usage);
@@ -359,7 +357,7 @@ static void _dpu_plane_set_qos_lut(struct drm_plane *plane,
 			fmt ? (char *)&fmt->base.pixel_format : NULL,
 			pdpu->is_rt_pipe, total_fl, qos_lut);
 
-	pdpu->pipe_hw->ops.setup_creq_lut(pdpu->pipe_hw, &pdpu->pipe_qos_cfg);
+	pdpu->pipe_hw->ops.setup_creq_lut(pdpu->pipe_hw, qos_lut);
 }
 
 /**
@@ -397,24 +395,21 @@ static void _dpu_plane_set_danger_lut(struct drm_plane *plane,
 		}
 	}
 
-	pdpu->pipe_qos_cfg.danger_lut = danger_lut;
-	pdpu->pipe_qos_cfg.safe_lut = safe_lut;
-
 	trace_dpu_perf_set_danger_luts(pdpu->pipe - SSPP_VIG0,
 			(fmt) ? fmt->base.pixel_format : 0,
 			(fmt) ? fmt->fetch_mode : 0,
-			pdpu->pipe_qos_cfg.danger_lut,
-			pdpu->pipe_qos_cfg.safe_lut);
+			danger_lut,
+			safe_lut);
 
 	DPU_DEBUG_PLANE(pdpu, "pnum:%d fmt: %4.4s mode:%d luts[0x%x, 0x%x]\n",
 		pdpu->pipe - SSPP_VIG0,
 		fmt ? (char *)&fmt->base.pixel_format : NULL,
 		fmt ? fmt->fetch_mode : -1,
-		pdpu->pipe_qos_cfg.danger_lut,
-		pdpu->pipe_qos_cfg.safe_lut);
+		danger_lut,
+		safe_lut);
 
 	pdpu->pipe_hw->ops.setup_danger_safe_lut(pdpu->pipe_hw,
-			&pdpu->pipe_qos_cfg);
+			danger_lut, safe_lut);
 }
 
 /**
-- 
2.33.0

