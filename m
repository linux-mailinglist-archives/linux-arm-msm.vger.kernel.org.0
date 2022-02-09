Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6200A4AF833
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Feb 2022 18:26:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238176AbiBIRZh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Feb 2022 12:25:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238174AbiBIRZf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Feb 2022 12:25:35 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB88CC05CB88
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Feb 2022 09:25:36 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id c15so4379643ljf.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Feb 2022 09:25:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RtLHSAoz1EuoestMpwULlanMyjrDZ1WhmOpsF6uy0XY=;
        b=RcTDoHsD3R3U6BdICovgZkP8GLP3/gTvYERNROan9ob8p97Ic45MXiJ10w+l4KI2P4
         LNhp75w4lVdNQlyv3ty7Bs/GY0FQyXzA3Kk+Vvl5ChZerv3c0dtUmaSODA589CKR98u3
         BYGwvE+LdC6gZ86/FIsUhYuiJae6gnHVG6+G9/oyE9NG/zvPQFNX0g/2aHsEKzlHsxdr
         7/NaF24pT2EK+P6GTcl2S42x2AuDEpvaMoOKInLw1xD4Wz3OqH0Boq9INyg7r3yCAp4r
         oaQdpB1wYf1DH9swEcJjX2yk8u0NehDUisD6wmdf2K9WEcWy//678926hje6Olf+Iqkt
         5Csg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RtLHSAoz1EuoestMpwULlanMyjrDZ1WhmOpsF6uy0XY=;
        b=mfPYOv6a9uQ0HLf8xRkqpdJRyfUeMCqwSWpXSLYssTszEIUFYz4q6CaeA0kkYMK8c6
         cFPLtfstD0pyz+3CtA2iaj+IyJHmu44gilFK0Fa2qkkF+kWQRR4YUi5Z+gZEmnwJdICQ
         peQ5XPU9ePNkrnWahZ5frXGv7zNGBhmQcN5Qpu0YrtGP4tfIbiYQ5uAip7Z1Hs3LPv8I
         pyIf8JMXk8Erx1Nq4nQCfJPq5ioWDOggAdnDT37UDcOWd75OAO+DCAr18osxDygQ4jbW
         7myBYplPpGbmF815z2pJSz+doRxGeeHe3LmgO8raurLa9nnFBx2K2zeymf/+v+P+6UJW
         6Gsw==
X-Gm-Message-State: AOAM532b3/t5zjhO77A2voNWsALhdyEt7DpOpSCyZxTtSS7W8FIw8C9H
        bO3/ESkmSdncVxcIDFVsKVP2EA==
X-Google-Smtp-Source: ABdhPJyIYZff0OPRE8np43HJxNeG40Jirl+IRb0GEc4Wy/ghPNaL+jVLnnTSWrJ4Skn3zUPYSjlY9Q==
X-Received: by 2002:a05:651c:1a10:: with SMTP id by16mr2152921ljb.94.1644427535086;
        Wed, 09 Feb 2022 09:25:35 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u14sm2560055lji.40.2022.02.09.09.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 09:25:34 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 14/25] drm/msm/dpu: move stride programming to dpu_hw_sspp_setup_sourceaddress
Date:   Wed,  9 Feb 2022 20:25:09 +0300
Message-Id: <20220209172520.3719906-15-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220209172520.3719906-1-dmitry.baryshkov@linaro.org>
References: <20220209172520.3719906-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Move stride programming to dpu_hw_sspp_setup_sourceaddress(), so that
dpu_hw_sspp_setup_rects() programs only source and destination
rectangles.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 57 +++++++++++----------
 1 file changed, 29 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index 7194c14f87bc..2186506e6315 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -447,7 +447,7 @@ static void dpu_hw_sspp_setup_rects(struct dpu_sw_pipe *pipe,
 {
 	struct dpu_hw_pipe *ctx = pipe->sspp;
 	struct dpu_hw_blk_reg_map *c;
-	u32 src_size, src_xy, dst_size, dst_xy, ystride0, ystride1;
+	u32 src_size, src_xy, dst_size, dst_xy;
 	u32 src_size_off, src_xy_off, out_size_off, out_xy_off;
 	u32 idx;
 
@@ -478,44 +478,18 @@ static void dpu_hw_sspp_setup_rects(struct dpu_sw_pipe *pipe,
 	dst_size = (drm_rect_height(&cfg->dst_rect) << 16) |
 		drm_rect_width(&cfg->dst_rect);
 
-	if (pipe->multirect_index == DPU_SSPP_RECT_SOLO) {
-		ystride0 = (cfg->layout.plane_pitch[0]) |
-			(cfg->layout.plane_pitch[1] << 16);
-		ystride1 = (cfg->layout.plane_pitch[2]) |
-			(cfg->layout.plane_pitch[3] << 16);
-	} else {
-		ystride0 = DPU_REG_READ(c, SSPP_SRC_YSTRIDE0 + idx);
-		ystride1 = DPU_REG_READ(c, SSPP_SRC_YSTRIDE1 + idx);
-
-		if (pipe->multirect_index == DPU_SSPP_RECT_0) {
-			ystride0 = (ystride0 & 0xFFFF0000) |
-				(cfg->layout.plane_pitch[0] & 0x0000FFFF);
-			ystride1 = (ystride1 & 0xFFFF0000)|
-				(cfg->layout.plane_pitch[2] & 0x0000FFFF);
-		} else {
-			ystride0 = (ystride0 & 0x0000FFFF) |
-				((cfg->layout.plane_pitch[0] << 16) &
-				 0xFFFF0000);
-			ystride1 = (ystride1 & 0x0000FFFF) |
-				((cfg->layout.plane_pitch[2] << 16) &
-				 0xFFFF0000);
-		}
-	}
-
 	/* rectangle register programming */
 	DPU_REG_WRITE(c, src_size_off + idx, src_size);
 	DPU_REG_WRITE(c, src_xy_off + idx, src_xy);
 	DPU_REG_WRITE(c, out_size_off + idx, dst_size);
 	DPU_REG_WRITE(c, out_xy_off + idx, dst_xy);
-
-	DPU_REG_WRITE(c, SSPP_SRC_YSTRIDE0 + idx, ystride0);
-	DPU_REG_WRITE(c, SSPP_SRC_YSTRIDE1 + idx, ystride1);
 }
 
 static void dpu_hw_sspp_setup_sourceaddress(struct dpu_sw_pipe *pipe,
 		struct dpu_hw_pipe_cfg *cfg)
 {
 	struct dpu_hw_pipe *ctx = pipe->sspp;
+	u32 ystride0, ystride1;
 	int i;
 	u32 idx;
 
@@ -537,6 +511,33 @@ static void dpu_hw_sspp_setup_sourceaddress(struct dpu_sw_pipe *pipe,
 		DPU_REG_WRITE(&ctx->hw, SSPP_SRC3_ADDR + idx,
 				cfg->layout.plane_addr[2]);
 	}
+
+	if (pipe->multirect_index == DPU_SSPP_RECT_SOLO) {
+		ystride0 = (cfg->layout.plane_pitch[0]) |
+			(cfg->layout.plane_pitch[1] << 16);
+		ystride1 = (cfg->layout.plane_pitch[2]) |
+			(cfg->layout.plane_pitch[3] << 16);
+	} else {
+		ystride0 = DPU_REG_READ(&ctx->hw, SSPP_SRC_YSTRIDE0 + idx);
+		ystride1 = DPU_REG_READ(&ctx->hw, SSPP_SRC_YSTRIDE1 + idx);
+
+		if (pipe->multirect_index == DPU_SSPP_RECT_0) {
+			ystride0 = (ystride0 & 0xFFFF0000) |
+				(cfg->layout.plane_pitch[0] & 0x0000FFFF);
+			ystride1 = (ystride1 & 0xFFFF0000)|
+				(cfg->layout.plane_pitch[2] & 0x0000FFFF);
+		} else {
+			ystride0 = (ystride0 & 0x0000FFFF) |
+				((cfg->layout.plane_pitch[0] << 16) &
+				 0xFFFF0000);
+			ystride1 = (ystride1 & 0x0000FFFF) |
+				((cfg->layout.plane_pitch[2] << 16) &
+				 0xFFFF0000);
+		}
+	}
+
+	DPU_REG_WRITE(&ctx->hw, SSPP_SRC_YSTRIDE0 + idx, ystride0);
+	DPU_REG_WRITE(&ctx->hw, SSPP_SRC_YSTRIDE1 + idx, ystride1);
 }
 
 static void dpu_hw_sspp_setup_csc(struct dpu_hw_pipe *ctx,
-- 
2.34.1

