Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A66D6EB62E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Apr 2023 02:08:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233600AbjDVAIs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Apr 2023 20:08:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233554AbjDVAIp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Apr 2023 20:08:45 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7625C26A2
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Apr 2023 17:08:44 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4ec8ce03818so2359018e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Apr 2023 17:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682122123; x=1684714123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WP6jZyGNHRewIJlCXz+F9uUuWlrE02oEGxGwZ/q40nQ=;
        b=vckHYYxhCPBBPT+HzipZYP9N/5gRxfYkengL8ShZnTcx9ugr5POFUiTkJTtdlTVx9q
         ZPPIfvgmG9lt8O1kpyGLTAovTOJBTk65GsC3ryUOixXsd1ad7oElOyK/ZjN+f6eguDf0
         P/VrRdHZSi+K6GMlQRLaIZDH+nyM0s/J8lMEnQIDl6twf5YWwSTi5yHpAPw1kmIMY4R8
         +Eu7fibBl81qxW4/YEPZyINpebLXQ8A4PaSVJbt8hyTbC8VJs/9kop3BdUOTj8cqOQBs
         0iOCuwkES/w+MlWZfm03qA642GyHMoft4cZw0YCoAhwVmGf0NDglzQqLhF737XErQ/yt
         cJpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682122123; x=1684714123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WP6jZyGNHRewIJlCXz+F9uUuWlrE02oEGxGwZ/q40nQ=;
        b=Ab8VQKHMxYsFy4Z2peGnKRlvkxk+742bCjvUY8tiG4zbfuluS3WurOmhDeIxjcypwM
         XVfL9UGl/2ogw1AkxlH+bVY566t8/eV7+ZVjIukVHJNA61PjXMoDF0abMr6sx1cc79cJ
         dCC9UYMfyOlDoV7NCm5CoaT5Ob5bSkflTfHjKdP/lGqgyk02Nls9KTQ63tvcebWEdrex
         NCvXOHZfSiiliicI2aU2ry4x0+ZGNHWpT0fWvkbz7zgLAucbhYBMPpBEk6tUy9QaYrr2
         YHvnjSh5TpicL+5jZ3nx4jqemkHg187jeh3UXv74R/Pmmla7q6HddYjnrRcmBFskSPhE
         h/PA==
X-Gm-Message-State: AAQBX9ehWTFS3H40oBW4mlf/ymdt5IMisosR6ky0d7geUWXj//cb+7NZ
        OcibcZ8jnr9F9yKldb4hapFS1g==
X-Google-Smtp-Source: AKy350ZMCAdwH1cE95oOlgbmi+djz0yk6b01uaFZAYDxBEQkCcdYAJjp8s0Dmo45RYkJtN14EwQu0w==
X-Received: by 2002:a05:6512:145:b0:4e0:a426:6ddc with SMTP id m5-20020a056512014500b004e0a4266ddcmr1543409lfo.0.1682122122747;
        Fri, 21 Apr 2023 17:08:42 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id g24-20020a2e9cd8000000b002a8bce7ce0dsm744681ljj.107.2023.04.21.17.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Apr 2023 17:08:42 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 3/3] drm/msm/dpu: access CSC/CSC10 registers directly
Date:   Sat, 22 Apr 2023 03:08:39 +0300
Message-Id: <20230422000839.1921358-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230422000839.1921358-1-dmitry.baryshkov@linaro.org>
References: <20230422000839.1921358-1-dmitry.baryshkov@linaro.org>
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

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 43 +++++----------------
 1 file changed, 9 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index 22c59f2250be..f4698e28e197 100644
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
2.30.2

