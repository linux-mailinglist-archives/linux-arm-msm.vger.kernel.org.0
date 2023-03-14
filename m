Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 676DA6B99CF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Mar 2023 16:37:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231226AbjCNPhh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Mar 2023 11:37:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230030AbjCNPhS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Mar 2023 11:37:18 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10583B257E
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 08:36:12 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id i20so16423565lja.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 08:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678808152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pRJiyruca+XEPy1zuI06ONM+B1Ubhz0WZOxlKyV8opo=;
        b=Bfg1V4vXQccqaVqKFvJVrmaTR6OWqu01CTaI0b720qchaOdrwWgX3ZeOJ7O6qE/YJd
         Rtazt7GDK6TJBaC0CccZxExeVb2CgLB2ZMi5XFCOixsypKTxhqo8B3qxJjKoMNeyQab4
         K8XsNux/pP6K5+xg9bGb1+mQPdf8MuHkVEFG0SJIYyceM6tx7pAchytYASVgawKFqsRR
         eVhzNvHGyn4M52vsb9iP3WajND1WtGOQkM2GxtxBu6+0n/HIR/O2x8UTFipJ5GtU1Fnk
         wPvBYsWHPXQwvNoqFsEcHZrwo9EWv/e7JKjlnjhh57h2bQBMhmxFpS4lIL/7j25ybKUh
         xAoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678808152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pRJiyruca+XEPy1zuI06ONM+B1Ubhz0WZOxlKyV8opo=;
        b=pRMaRgQJ02azDHVfcamV7IGwdR2ULlz7rR+Tz4pcumZGj1+cNlsTRzyT9DI8vQ0N/R
         ud7Cj92mKmzM02N/FbUZb17fDOMgNWSjE7KUFMgSOGKFK7yodzrfOS/B/Gs21dCP4Zxz
         FoRYuxIFHdnMk/1db2JAxvBzUvh1JLQbPXiKjNo7Ejwfkg1BVWyxdqKvsccsEDh06XAJ
         n1C2PxiW+71u8GMA/6akFv7CViitUtFA4OGvsv18b9nZqWEgxGpB3KjwW+yAIzdGXB7Q
         z9rRW0m+3nH3Kacv6Un3Aot//bUS+yxtSO/7uMdHPqssIuCtD4DiD6TV+6LBzRY8/t+Y
         yAdQ==
X-Gm-Message-State: AO0yUKV1VI95csVpUEZr7KuZBAkok0cs8JycalUVJY2OAJEoFtXJNqgf
        3JB03FNtJu+mySXAnKcHsxP2UQ==
X-Google-Smtp-Source: AK7set/piCTViqCtyl6Ptr2ydDD7m2Zki+Y2VsIPTDrUUxmlMqnR9mWEPyfaX/frE68DbjHZJdQT1A==
X-Received: by 2002:a05:651c:513:b0:295:9659:fba5 with SMTP id o19-20020a05651c051300b002959659fba5mr15349870ljp.37.1678808152134;
        Tue, 14 Mar 2023 08:35:52 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id z8-20020a2eb528000000b0029573844d03sm470854ljm.109.2023.03.14.08.35.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 08:35:51 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v6 08/32] drm/msm/dpu: use dpu_sw_pipe for dpu_hw_sspp callbacks
Date:   Tue, 14 Mar 2023 18:35:21 +0300
Message-Id: <20230314153545.3442879-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230314153545.3442879-1-dmitry.baryshkov@linaro.org>
References: <20230314153545.3442879-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Where feasible, use dpu_sw_pipe rather than a combo of dpu_hw_sspp and
multirect_index/_mode arguments.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 59 +++++++++--------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h | 46 +++++--------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 73 ++++++++++-----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h   |  9 ++-
 4 files changed, 84 insertions(+), 103 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index 3e65bfd65b62..a1492a7e43ce 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -168,17 +168,16 @@ static int _sspp_subblk_offset(struct dpu_hw_sspp *ctx,
 	return rc;
 }
 
-static void dpu_hw_sspp_setup_multirect(struct dpu_hw_sspp *ctx,
-		enum dpu_sspp_multirect_index index,
-		enum dpu_sspp_multirect_mode mode)
+static void dpu_hw_sspp_setup_multirect(struct dpu_sw_pipe *pipe)
 {
+	struct dpu_hw_sspp *ctx = pipe->sspp;
 	u32 mode_mask;
 	u32 idx;
 
 	if (_sspp_subblk_offset(ctx, DPU_SSPP_SRC, &idx))
 		return;
 
-	if (index == DPU_SSPP_RECT_SOLO) {
+	if (pipe->multirect_index == DPU_SSPP_RECT_SOLO) {
 		/**
 		 * if rect index is RECT_SOLO, we cannot expect a
 		 * virtual plane sharing the same SSPP id. So we go
@@ -187,8 +186,8 @@ static void dpu_hw_sspp_setup_multirect(struct dpu_hw_sspp *ctx,
 		mode_mask = 0;
 	} else {
 		mode_mask = DPU_REG_READ(&ctx->hw, SSPP_MULTIRECT_OPMODE + idx);
-		mode_mask |= index;
-		if (mode == DPU_SSPP_MULTIRECT_TIME_MX)
+		mode_mask |= pipe->multirect_index;
+		if (pipe->multirect_mode == DPU_SSPP_MULTIRECT_TIME_MX)
 			mode_mask |= BIT(2);
 		else
 			mode_mask &= ~BIT(2);
@@ -239,10 +238,10 @@ static void _sspp_setup_csc10_opmode(struct dpu_hw_sspp *ctx,
 /*
  * Setup source pixel format, flip,
  */
-static void dpu_hw_sspp_setup_format(struct dpu_hw_sspp *ctx,
-		const struct dpu_format *fmt, u32 flags,
-		enum dpu_sspp_multirect_index rect_mode)
+static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
+		const struct dpu_format *fmt, u32 flags)
 {
+	struct dpu_hw_sspp *ctx = pipe->sspp;
 	struct dpu_hw_blk_reg_map *c;
 	u32 chroma_samp, unpack, src_format;
 	u32 opmode = 0;
@@ -253,7 +252,8 @@ static void dpu_hw_sspp_setup_format(struct dpu_hw_sspp *ctx,
 	if (_sspp_subblk_offset(ctx, DPU_SSPP_SRC, &idx) || !fmt)
 		return;
 
-	if (rect_mode == DPU_SSPP_RECT_SOLO || rect_mode == DPU_SSPP_RECT_0) {
+	if (pipe->multirect_index == DPU_SSPP_RECT_SOLO ||
+	    pipe->multirect_index == DPU_SSPP_RECT_0) {
 		op_mode_off = SSPP_SRC_OP_MODE;
 		unpack_pat_off = SSPP_SRC_UNPACK_PATTERN;
 		format_off = SSPP_SRC_FORMAT;
@@ -447,10 +447,10 @@ static u32 _dpu_hw_sspp_get_scaler3_ver(struct dpu_hw_sspp *ctx)
 /*
  * dpu_hw_sspp_setup_rects()
  */
-static void dpu_hw_sspp_setup_rects(struct dpu_hw_sspp *ctx,
-		struct dpu_hw_sspp_cfg *cfg,
-		enum dpu_sspp_multirect_index rect_index)
+static void dpu_hw_sspp_setup_rects(struct dpu_sw_pipe *pipe,
+		struct dpu_hw_sspp_cfg *cfg)
 {
+	struct dpu_hw_sspp *ctx = pipe->sspp;
 	struct dpu_hw_blk_reg_map *c;
 	u32 src_size, src_xy, dst_size, dst_xy, ystride0, ystride1;
 	u32 src_size_off, src_xy_off, out_size_off, out_xy_off;
@@ -461,7 +461,8 @@ static void dpu_hw_sspp_setup_rects(struct dpu_hw_sspp *ctx,
 
 	c = &ctx->hw;
 
-	if (rect_index == DPU_SSPP_RECT_SOLO || rect_index == DPU_SSPP_RECT_0) {
+	if (pipe->multirect_index == DPU_SSPP_RECT_SOLO ||
+	    pipe->multirect_index == DPU_SSPP_RECT_0) {
 		src_size_off = SSPP_SRC_SIZE;
 		src_xy_off = SSPP_SRC_XY;
 		out_size_off = SSPP_OUT_SIZE;
@@ -482,7 +483,7 @@ static void dpu_hw_sspp_setup_rects(struct dpu_hw_sspp *ctx,
 	dst_size = (drm_rect_height(&cfg->dst_rect) << 16) |
 		drm_rect_width(&cfg->dst_rect);
 
-	if (rect_index == DPU_SSPP_RECT_SOLO) {
+	if (pipe->multirect_index == DPU_SSPP_RECT_SOLO) {
 		ystride0 = (cfg->layout.plane_pitch[0]) |
 			(cfg->layout.plane_pitch[1] << 16);
 		ystride1 = (cfg->layout.plane_pitch[2]) |
@@ -491,7 +492,7 @@ static void dpu_hw_sspp_setup_rects(struct dpu_hw_sspp *ctx,
 		ystride0 = DPU_REG_READ(c, SSPP_SRC_YSTRIDE0 + idx);
 		ystride1 = DPU_REG_READ(c, SSPP_SRC_YSTRIDE1 + idx);
 
-		if (rect_index == DPU_SSPP_RECT_0) {
+		if (pipe->multirect_index == DPU_SSPP_RECT_0) {
 			ystride0 = (ystride0 & 0xFFFF0000) |
 				(cfg->layout.plane_pitch[0] & 0x0000FFFF);
 			ystride1 = (ystride1 & 0xFFFF0000)|
@@ -516,21 +517,21 @@ static void dpu_hw_sspp_setup_rects(struct dpu_hw_sspp *ctx,
 	DPU_REG_WRITE(c, SSPP_SRC_YSTRIDE1 + idx, ystride1);
 }
 
-static void dpu_hw_sspp_setup_sourceaddress(struct dpu_hw_sspp *ctx,
-		struct dpu_hw_sspp_cfg *cfg,
-		enum dpu_sspp_multirect_index rect_mode)
+static void dpu_hw_sspp_setup_sourceaddress(struct dpu_sw_pipe *pipe,
+		struct dpu_hw_sspp_cfg *cfg)
 {
+	struct dpu_hw_sspp *ctx = pipe->sspp;
 	int i;
 	u32 idx;
 
 	if (_sspp_subblk_offset(ctx, DPU_SSPP_SRC, &idx))
 		return;
 
-	if (rect_mode == DPU_SSPP_RECT_SOLO) {
+	if (pipe->multirect_index == DPU_SSPP_RECT_SOLO) {
 		for (i = 0; i < ARRAY_SIZE(cfg->layout.plane_addr); i++)
 			DPU_REG_WRITE(&ctx->hw, SSPP_SRC0_ADDR + idx + i * 0x4,
 					cfg->layout.plane_addr[i]);
-	} else if (rect_mode == DPU_SSPP_RECT_0) {
+	} else if (pipe->multirect_index == DPU_SSPP_RECT_0) {
 		DPU_REG_WRITE(&ctx->hw, SSPP_SRC0_ADDR + idx,
 				cfg->layout.plane_addr[0]);
 		DPU_REG_WRITE(&ctx->hw, SSPP_SRC2_ADDR + idx,
@@ -560,15 +561,16 @@ static void dpu_hw_sspp_setup_csc(struct dpu_hw_sspp *ctx,
 	dpu_hw_csc_setup(&ctx->hw, idx, data, csc10);
 }
 
-static void dpu_hw_sspp_setup_solidfill(struct dpu_hw_sspp *ctx, u32 color, enum
-		dpu_sspp_multirect_index rect_index)
+static void dpu_hw_sspp_setup_solidfill(struct dpu_sw_pipe *pipe, u32 color)
 {
+	struct dpu_hw_sspp *ctx = pipe->sspp;
 	u32 idx;
 
 	if (_sspp_subblk_offset(ctx, DPU_SSPP_SRC, &idx))
 		return;
 
-	if (rect_index == DPU_SSPP_RECT_SOLO || rect_index == DPU_SSPP_RECT_0)
+	if (pipe->multirect_index == DPU_SSPP_RECT_SOLO ||
+	    pipe->multirect_index == DPU_SSPP_RECT_0)
 		DPU_REG_WRITE(&ctx->hw, SSPP_SRC_CONSTANT_COLOR + idx, color);
 	else
 		DPU_REG_WRITE(&ctx->hw, SSPP_SRC_CONSTANT_COLOR_REC1 + idx,
@@ -630,10 +632,10 @@ static void dpu_hw_sspp_setup_qos_ctrl(struct dpu_hw_sspp *ctx,
 	DPU_REG_WRITE(&ctx->hw, SSPP_QOS_CTRL + idx, qos_ctrl);
 }
 
-static void dpu_hw_sspp_setup_cdp(struct dpu_hw_sspp *ctx,
-		struct dpu_hw_cdp_cfg *cfg,
-		enum dpu_sspp_multirect_index index)
+static void dpu_hw_sspp_setup_cdp(struct dpu_sw_pipe *pipe,
+		struct dpu_hw_cdp_cfg *cfg)
 {
+	struct dpu_hw_sspp *ctx = pipe->sspp;
 	u32 idx;
 	u32 cdp_cntl = 0;
 	u32 cdp_cntl_offset = 0;
@@ -644,7 +646,8 @@ static void dpu_hw_sspp_setup_cdp(struct dpu_hw_sspp *ctx,
 	if (_sspp_subblk_offset(ctx, DPU_SSPP_SRC, &idx))
 		return;
 
-	if (index == DPU_SSPP_RECT_SOLO || index == DPU_SSPP_RECT_0)
+	if (pipe->multirect_index == DPU_SSPP_RECT_SOLO ||
+	    pipe->multirect_index == DPU_SSPP_RECT_0)
 		cdp_cntl_offset = SSPP_CDP_CNTL;
 	else
 		cdp_cntl_offset = SSPP_CDP_CNTL_REC1;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index 13d9e04a5153..5903413256ea 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -217,24 +217,20 @@ struct dpu_sw_pipe {
 struct dpu_hw_sspp_ops {
 	/**
 	 * setup_format - setup pixel format cropping rectangle, flip
-	 * @ctx: Pointer to pipe context
+	 * @pipe: Pointer to software pipe context
 	 * @cfg: Pointer to pipe config structure
 	 * @flags: Extra flags for format config
-	 * @index: rectangle index in multirect
 	 */
-	void (*setup_format)(struct dpu_hw_sspp *ctx,
-			const struct dpu_format *fmt, u32 flags,
-			enum dpu_sspp_multirect_index index);
+	void (*setup_format)(struct dpu_sw_pipe *pipe,
+			     const struct dpu_format *fmt, u32 flags);
 
 	/**
 	 * setup_rects - setup pipe ROI rectangles
-	 * @ctx: Pointer to pipe context
+	 * @pipe: Pointer to software pipe context
 	 * @cfg: Pointer to pipe config structure
-	 * @index: rectangle index in multirect
 	 */
-	void (*setup_rects)(struct dpu_hw_sspp *ctx,
-			struct dpu_hw_sspp_cfg *cfg,
-			enum dpu_sspp_multirect_index index);
+	void (*setup_rects)(struct dpu_sw_pipe *pipe,
+			    struct dpu_hw_sspp_cfg *cfg);
 
 	/**
 	 * setup_pe - setup pipe pixel extension
@@ -246,13 +242,11 @@ struct dpu_hw_sspp_ops {
 
 	/**
 	 * setup_sourceaddress - setup pipe source addresses
-	 * @ctx: Pointer to pipe context
+	 * @pipe: Pointer to software pipe context
 	 * @cfg: Pointer to pipe config structure
-	 * @index: rectangle index in multirect
 	 */
-	void (*setup_sourceaddress)(struct dpu_hw_sspp *ctx,
-			struct dpu_hw_sspp_cfg *cfg,
-			enum dpu_sspp_multirect_index index);
+	void (*setup_sourceaddress)(struct dpu_sw_pipe *ctx,
+				    struct dpu_hw_sspp_cfg *cfg);
 
 	/**
 	 * setup_csc - setup color space coversion
@@ -263,24 +257,18 @@ struct dpu_hw_sspp_ops {
 
 	/**
 	 * setup_solidfill - enable/disable colorfill
-	 * @ctx: Pointer to pipe context
+	 * @pipe: Pointer to software pipe context
 	 * @const_color: Fill color value
 	 * @flags: Pipe flags
-	 * @index: rectangle index in multirect
 	 */
-	void (*setup_solidfill)(struct dpu_hw_sspp *ctx, u32 color,
-			enum dpu_sspp_multirect_index index);
+	void (*setup_solidfill)(struct dpu_sw_pipe *pipe, u32 color);
 
 	/**
 	 * setup_multirect - setup multirect configuration
-	 * @ctx: Pointer to pipe context
-	 * @index: rectangle index in multirect
-	 * @mode: parallel fetch / time multiplex multirect mode
+	 * @pipe: Pointer to software pipe context
 	 */
 
-	void (*setup_multirect)(struct dpu_hw_sspp *ctx,
-			enum dpu_sspp_multirect_index index,
-			enum dpu_sspp_multirect_mode mode);
+	void (*setup_multirect)(struct dpu_sw_pipe *pipe);
 
 	/**
 	 * setup_sharpening - setup sharpening
@@ -345,13 +333,11 @@ struct dpu_hw_sspp_ops {
 
 	/**
 	 * setup_cdp - setup client driven prefetch
-	 * @ctx: Pointer to pipe context
+	 * @pipe: Pointer to software pipe context
 	 * @cfg: Pointer to cdp configuration
-	 * @index: rectangle index in multirect
 	 */
-	void (*setup_cdp)(struct dpu_hw_sspp *ctx,
-			struct dpu_hw_cdp_cfg *cfg,
-			enum dpu_sspp_multirect_index index);
+	void (*setup_cdp)(struct dpu_sw_pipe *pipe,
+			  struct dpu_hw_cdp_cfg *cfg);
 };
 
 /**
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index ce726bec0c31..6ec39f937042 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -483,23 +483,21 @@ static void _dpu_plane_set_scanout(struct drm_plane *plane,
 	if (ret)
 		DPU_ERROR_PLANE(pdpu, "failed to get format layout, %d\n", ret);
 	else if (pstate->pipe.sspp->ops.setup_sourceaddress) {
-		trace_dpu_plane_set_scanout(pstate->pipe.sspp->idx,
-					    &pipe_cfg->layout,
-					    pstate->pipe.multirect_index);
-		pstate->pipe.sspp->ops.setup_sourceaddress(pstate->pipe.sspp, pipe_cfg,
-						pstate->pipe.multirect_index);
+		trace_dpu_plane_set_scanout(&pstate->pipe,
+					    &pipe_cfg->layout);
+		pstate->pipe.sspp->ops.setup_sourceaddress(&pstate->pipe, pipe_cfg);
 	}
 }
 
-static void _dpu_plane_setup_scaler3(struct dpu_plane *pdpu,
-		struct dpu_plane_state *pstate,
+static void _dpu_plane_setup_scaler3(struct dpu_hw_sspp *pipe_hw,
 		uint32_t src_w, uint32_t src_h, uint32_t dst_w, uint32_t dst_h,
 		struct dpu_hw_scaler3_cfg *scale_cfg,
 		const struct dpu_format *fmt,
-		uint32_t chroma_subsmpl_h, uint32_t chroma_subsmpl_v)
+		uint32_t chroma_subsmpl_h, uint32_t chroma_subsmpl_v,
+		unsigned int rotation)
 {
 	uint32_t i;
-	bool inline_rotation = pstate->rotation & DRM_MODE_ROTATE_90;
+	bool inline_rotation = rotation & DRM_MODE_ROTATE_90;
 
 	/*
 	 * For inline rotation cases, scaler config is post-rotation,
@@ -538,7 +536,7 @@ static void _dpu_plane_setup_scaler3(struct dpu_plane *pdpu,
 			scale_cfg->src_height[i] /= chroma_subsmpl_v;
 		}
 
-		if (pstate->pipe.sspp->cap->features &
+		if (pipe_hw->cap->features &
 			BIT(DPU_SSPP_SCALER_QSEED4)) {
 			scale_cfg->preload_x[i] = DPU_QSEED4_DEFAULT_PRELOAD_H;
 			scale_cfg->preload_y[i] = DPU_QSEED4_DEFAULT_PRELOAD_V;
@@ -635,11 +633,12 @@ static const struct dpu_csc_cfg *_dpu_plane_get_csc(struct dpu_plane *pdpu, cons
 	return csc_ptr;
 }
 
-static void _dpu_plane_setup_scaler(struct dpu_plane *pdpu,
-		struct dpu_plane_state *pstate,
+static void _dpu_plane_setup_scaler(struct dpu_sw_pipe *pipe,
 		const struct dpu_format *fmt, bool color_fill,
-		struct dpu_hw_sspp_cfg *pipe_cfg)
+		struct dpu_hw_sspp_cfg *pipe_cfg,
+		unsigned int rotation)
 {
+	struct dpu_hw_sspp *pipe_hw = pipe->sspp;
 	const struct drm_format_info *info = drm_format_info(fmt->base.pixel_format);
 	struct dpu_hw_scaler3_cfg scaler3_cfg;
 	struct dpu_hw_pixel_ext pixel_ext;
@@ -653,20 +652,21 @@ static void _dpu_plane_setup_scaler(struct dpu_plane *pdpu,
 
 	/* don't chroma subsample if decimating */
 	/* update scaler. calculate default config for QSEED3 */
-	_dpu_plane_setup_scaler3(pdpu, pstate,
+	_dpu_plane_setup_scaler3(pipe_hw,
 			src_width,
 			src_height,
 			dst_width,
 			dst_height,
 			&scaler3_cfg, fmt,
-			info->hsub, info->vsub);
+			info->hsub, info->vsub,
+			rotation);
 
 	/* configure pixel extension based on scalar config */
 	_dpu_plane_setup_pixel_ext(&scaler3_cfg, &pixel_ext,
 			src_width, src_height, info->hsub, info->vsub);
 
-	if (pstate->pipe.sspp->ops.setup_pe)
-		pstate->pipe.sspp->ops.setup_pe(pstate->pipe.sspp,
+	if (pipe_hw->ops.setup_pe)
+		pipe_hw->ops.setup_pe(pipe_hw,
 				&pixel_ext);
 
 	/**
@@ -674,9 +674,9 @@ static void _dpu_plane_setup_scaler(struct dpu_plane *pdpu,
 	 * bypassed. Still we need to update alpha and bitwidth
 	 * ONLY for RECT0
 	 */
-	if (pstate->pipe.sspp->ops.setup_scaler &&
-			pstate->pipe.multirect_index != DPU_SSPP_RECT_1)
-		pstate->pipe.sspp->ops.setup_scaler(pstate->pipe.sspp,
+	if (pipe_hw->ops.setup_scaler &&
+			pipe->multirect_index != DPU_SSPP_RECT_1)
+		pipe_hw->ops.setup_scaler(pipe_hw,
 				pipe_cfg,
 				&scaler3_cfg);
 }
@@ -706,9 +706,8 @@ static int _dpu_plane_color_fill(struct dpu_plane *pdpu,
 
 	/* update sspp */
 	if (fmt && pstate->pipe.sspp->ops.setup_solidfill) {
-		pstate->pipe.sspp->ops.setup_solidfill(pstate->pipe.sspp,
-				(color & 0xFFFFFF) | ((alpha & 0xFF) << 24),
-				pstate->pipe.multirect_index);
+		pstate->pipe.sspp->ops.setup_solidfill(&pstate->pipe,
+				(color & 0xFFFFFF) | ((alpha & 0xFF) << 24));
 
 		/* override scaler/decimation if solid fill */
 		pipe_cfg.dst_rect = pstate->base.dst;
@@ -721,16 +720,14 @@ static int _dpu_plane_color_fill(struct dpu_plane *pdpu,
 			drm_rect_height(&pipe_cfg.dst_rect);
 
 		if (pstate->pipe.sspp->ops.setup_format)
-			pstate->pipe.sspp->ops.setup_format(pstate->pipe.sspp,
-					fmt, DPU_SSPP_SOLID_FILL,
-					pstate->pipe.multirect_index);
+			pstate->pipe.sspp->ops.setup_format(&pstate->pipe,
+					fmt, DPU_SSPP_SOLID_FILL);
 
 		if (pstate->pipe.sspp->ops.setup_rects)
-			pstate->pipe.sspp->ops.setup_rects(pstate->pipe.sspp,
-					&pipe_cfg,
-					pstate->pipe.multirect_index);
+			pstate->pipe.sspp->ops.setup_rects(&pstate->pipe,
+					&pipe_cfg);
 
-		_dpu_plane_setup_scaler(pdpu, pstate, fmt, true, &pipe_cfg);
+		_dpu_plane_setup_scaler(&pstate->pipe, fmt, true, &pipe_cfg, pstate->rotation);
 	}
 
 	return 0;
@@ -1169,18 +1166,15 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 	}
 
 	if (pipe->sspp->ops.setup_rects) {
-		pipe->sspp->ops.setup_rects(pipe->sspp,
-				&pipe_cfg,
-				pipe->multirect_index);
+		pipe->sspp->ops.setup_rects(pipe,
+				&pipe_cfg);
 	}
 
-	_dpu_plane_setup_scaler(pdpu, pstate, fmt, false, &pipe_cfg);
+	_dpu_plane_setup_scaler(pipe, fmt, false, &pipe_cfg, pstate->rotation);
 
 	if (pipe->sspp->ops.setup_multirect)
 		pipe->sspp->ops.setup_multirect(
-				pipe->sspp,
-				pipe->multirect_index,
-				pipe->multirect_mode);
+				pipe);
 
 	if (pipe->sspp->ops.setup_format) {
 		unsigned int rotation = pstate->rotation;
@@ -1197,8 +1191,7 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 			src_flags |= DPU_SSPP_ROT_90;
 
 		/* update format */
-		pipe->sspp->ops.setup_format(pipe->sspp, fmt, src_flags,
-				pipe->multirect_index);
+		pipe->sspp->ops.setup_format(pipe, fmt, src_flags);
 
 		if (pipe->sspp->ops.setup_cdp) {
 			struct dpu_hw_cdp_cfg cdp_cfg;
@@ -1214,7 +1207,7 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 					DPU_FORMAT_IS_TILE(fmt);
 			cdp_cfg.preload_ahead = DPU_SSPP_CDP_PRELOAD_AHEAD_64;
 
-			pipe->sspp->ops.setup_cdp(pipe->sspp, &cdp_cfg, pipe->multirect_index);
+			pipe->sspp->ops.setup_cdp(pipe, &cdp_cfg);
 		}
 	}
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
index d7059972499f..0ad148cc2fb8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
@@ -762,18 +762,17 @@ TRACE_EVENT(dpu_crtc_disable_frame_pending,
 );
 
 TRACE_EVENT(dpu_plane_set_scanout,
-	TP_PROTO(enum dpu_sspp index, struct dpu_hw_fmt_layout *layout,
-		 enum dpu_sspp_multirect_index multirect_index),
-	TP_ARGS(index, layout, multirect_index),
+	TP_PROTO(struct dpu_sw_pipe *pipe, struct dpu_hw_fmt_layout *layout),
+	TP_ARGS(pipe, layout),
 	TP_STRUCT__entry(
 		__field(	enum dpu_sspp,			index	)
 		__field_struct(	struct dpu_hw_fmt_layout,	layout	)
 		__field(	enum dpu_sspp_multirect_index,	multirect_index)
 	),
 	TP_fast_assign(
-		__entry->index = index;
+		__entry->index = pipe->sspp->idx;
 		__entry->layout = *layout;
-		__entry->multirect_index = multirect_index;
+		__entry->multirect_index = pipe->multirect_index;
 	),
 	TP_printk("index:%d layout:{%ux%u @ [%u/%u, %u/%u, %u/%u, %u/%u]} "
 		  "multirect_index:%d", __entry->index, __entry->layout.width,
-- 
2.30.2

