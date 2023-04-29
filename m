Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A2546F220A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Apr 2023 03:24:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347161AbjD2BYD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Apr 2023 21:24:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347257AbjD2BYA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Apr 2023 21:24:00 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9B0540F0
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Apr 2023 18:23:58 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-3f182d745deso3225805e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Apr 2023 18:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682731437; x=1685323437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XpHRCDl8YUqkvzGdi9xj3a31C+ZLIPISEtnli6YWyd8=;
        b=u2t1BbsEvLJsnd4haLznJtlvYjxKqBGVHQAPIb3m371bwOG6enT5Ukd1Bw9aIcfsxt
         IL1y003mSznP1CBJfmRDEvIuf/qQYUePPKXw+s2wr2BaNj2DjjcoWKjVf9/oHFqwz8Uq
         RPWXYpmQl24WllwEYSTsY7jd2TIk2Lmw2tmLOskDahaclH2E+AsD4mdlWYbAuhTRh9y4
         aETvUyggCsDlVcN71ehfLa+9O5ydXLFgM06Y71q/XS5OCNCN1hXIqeDsvVd0YrumvMOS
         JXod0tfaucW56Zmiz126LPbg9oo+Uf4Hgblg4956FEC4iCL2ibbO1hYaYmZ5JxIDdgkP
         MNVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682731437; x=1685323437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XpHRCDl8YUqkvzGdi9xj3a31C+ZLIPISEtnli6YWyd8=;
        b=PFr8Aw/Kbz2jP84SJM0D/tTRzJdZevHjMzIy1zeQLd0d8tX9bXJIAJ1ttXXwbGFpyI
         ZsPCmvMJ9HjK3L0B/ypjjXDwNa8T39lorISk91eY1AX8GwcPQIif1QvfUkeQJhGt/bzk
         aPxpcHOsPqvf1gtaw/aPbRcbn5PKvJQ7EmFRIgStGAMvdoxD3d3/6vQtQwGoYBVAzTTK
         c1kHX4XffdaCkNStKVWXxgboMjghEBDgEN8ZOkyL7J+SYwphNTw2dDAuJRwYQMr5dHFa
         9ZSJ71au1AgbK8qY1Qk9QhH7Vkw2ac2mkbbKUmZ2zMDd5byZ33Xni1RgEK9+hfN+FnuX
         LFhg==
X-Gm-Message-State: AC+VfDzcC3DbYpLV65NdGaqGQkbBkLbdcwkojvj6w8vLlM2woNAbMA8W
        zp+bJw4/C/HmQNXrSvOo0K/gew==
X-Google-Smtp-Source: ACHHUZ7UGhVk/hWFxV7349dYMYcFwWyPjAS+bnGonW90J8FBTiYvv5a9C69sPp7xss24J2zXiOt5Gg==
X-Received: by 2002:a1c:f217:0:b0:3f2:5be3:cd6a with SMTP id s23-20020a1cf217000000b003f25be3cd6amr5096302wmc.4.1682731437417;
        Fri, 28 Apr 2023 18:23:57 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([212.140.138.218])
        by smtp.gmail.com with ESMTPSA id p10-20020a5d48ca000000b003047dc162f7sm12983554wrs.67.2023.04.28.18.23.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Apr 2023 18:23:57 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Jeykumar Sankaran <quic_jeykumar@quicinc.com>
Subject: [PATCH v2 3/3] drm/msm/dpu: access CSC/CSC10 registers directly
Date:   Sat, 29 Apr 2023 04:23:53 +0300
Message-Id: <20230429012353.2569481-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230429012353.2569481-1-dmitry.baryshkov@linaro.org>
References: <20230429012353.2569481-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Stop using _sspp_subblk_offset() to get offset of the csc_blk. Inline
this function and use ctx->cap->sblk->csc_blk.base directly.

As this was the last user, drop _sspp_subblk_offset() too.

Reviewed-by: Jeykumar Sankaran <quic_jeykumar@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 43 +++++----------------
 1 file changed, 9 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index 37cd5f4396c6..fd9714659293 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -136,30 +136,6 @@
 #define TS_CLK			19200000
 
 
-static int _sspp_subblk_offset(struct dpu_hw_sspp *ctx,
-		int s_id,
-		u32 *idx)
-{
-	int rc = 0;
-	const struct dpu_sspp_sub_blks *sblk;
-
-	if (!ctx || !ctx->cap || !ctx->cap->sblk)
-		return -EINVAL;
-
-	sblk = ctx->cap->sblk;
-
-	switch (s_id) {
-	case DPU_SSPP_CSC:
-	case DPU_SSPP_CSC_10BIT:
-		*idx = sblk->csc_blk.base;
-		break;
-	default:
-		rc = -EINVAL;
-	}
-
-	return rc;
-}
-
 static void dpu_hw_sspp_setup_multirect(struct dpu_sw_pipe *pipe)
 {
 	struct dpu_hw_sspp *ctx = pipe->sspp;
@@ -210,19 +186,16 @@ static void _sspp_setup_opmode(struct dpu_hw_sspp *ctx,
 static void _sspp_setup_csc10_opmode(struct dpu_hw_sspp *ctx,
 		u32 mask, u8 en)
 {
-	u32 idx;
+	const struct dpu_sspp_sub_blks *sblk = ctx->cap->sblk;
 	u32 opmode;
 
-	if (_sspp_subblk_offset(ctx, DPU_SSPP_CSC_10BIT, &idx))
-		return;
-
-	opmode = DPU_REG_READ(&ctx->hw, SSPP_VIG_CSC_10_OP_MODE + idx);
+	opmode = DPU_REG_READ(&ctx->hw, sblk->csc_blk.base + SSPP_VIG_CSC_10_OP_MODE);
 	if (en)
 		opmode |= mask;
 	else
 		opmode &= ~mask;
 
-	DPU_REG_WRITE(&ctx->hw, SSPP_VIG_CSC_10_OP_MODE + idx, opmode);
+	DPU_REG_WRITE(&ctx->hw, sblk->csc_blk.base + SSPP_VIG_CSC_10_OP_MODE, opmode);
 }
 
 /*
@@ -530,18 +503,20 @@ static void dpu_hw_sspp_setup_sourceaddress(struct dpu_sw_pipe *pipe,
 static void dpu_hw_sspp_setup_csc(struct dpu_hw_sspp *ctx,
 		const struct dpu_csc_cfg *data)
 {
-	u32 idx;
+	u32 offset;
 	bool csc10 = false;
 
-	if (_sspp_subblk_offset(ctx, DPU_SSPP_CSC, &idx) || !data)
+	if (!ctx || !data)
 		return;
 
+	offset = ctx->cap->sblk->csc_blk.base;
+
 	if (test_bit(DPU_SSPP_CSC_10BIT, &ctx->cap->features)) {
-		idx += CSC_10BIT_OFFSET;
+		offset += CSC_10BIT_OFFSET;
 		csc10 = true;
 	}
 
-	dpu_hw_csc_setup(&ctx->hw, idx, data, csc10);
+	dpu_hw_csc_setup(&ctx->hw, offset, data, csc10);
 }
 
 static void dpu_hw_sspp_setup_solidfill(struct dpu_sw_pipe *pipe, u32 color)
-- 
2.39.2

