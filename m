Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE41B66B111
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Jan 2023 13:42:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231397AbjAOMmF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 15 Jan 2023 07:42:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231346AbjAOMmE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 15 Jan 2023 07:42:04 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFC3383F0
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Jan 2023 04:42:02 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id s25so27286030lji.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Jan 2023 04:42:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uhk6AG+vgVStc/vBGK1JOmzHraPBW70vYQnmsaNQwVk=;
        b=bOXCLBB/Dw6sq3EQ2QjASZRL/hyEYdhHl5/T6dKrYi48iISarIzTfKPxv8t9pHoKpT
         SyJEpr2HCll1a8ho2e1HilFEkorRdS9egGkmFbv4o+2R9TIBLeWNRK3rT4CldJd8GxNu
         BBg6zabIMvfP2HIwm4vHC5AWxEJhJ893bfikmcpdNSboXOyXaMce0yJ3b4aDbiofxU56
         bB5F+nuoiiwib8FbgsT+GJzzaBhVc1Vm6G6gWYrY+YeOQIrcI4loCXKL8VVohvZPGlTk
         dYQR6aLNPt+K0lfVLsP95MEylDFlvfupczMRJQ9OaQMjMJxkXGIzgrXwcA25JnOSKjt2
         mk/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uhk6AG+vgVStc/vBGK1JOmzHraPBW70vYQnmsaNQwVk=;
        b=D1ma6Bv6+WYxIEWuoMWEasgZdqeRTC7XSHa7f/Gw6bXnwYClv0LJcJEuaITfvYzXF1
         a5Yd8dC0kBmDn5upXLjc5NM6fNktBVsonMB/R22N02+DSGy0EiTwS7pMXXOeZTlp1KnU
         6EAEDxIo2/z4dvS9MCBO4lIJsRmvVl/69dZ7vd+huFsRguG6XVa1/rzcrGl6W8N3sBIc
         BiDGFijNmKzXYkRLsM9YfW5C8LuFBzMlp5Le5Qu9JCelL0TxJ1w4ZHocTNsBBmQvxROp
         qokOkSCaQmsHEPDcxePGsk2H4S04vEmLQDCPOh1lGQZ+s+g/pd19izcV9xEQ8SfOF619
         JjwQ==
X-Gm-Message-State: AFqh2kp85Qndh9KY5q2NNA+NxSa7iVxyAidGxx44Q84PkfMiUItp5oBt
        wbgkJK/vOhMP7Ll/VqCcd3JT0Q==
X-Google-Smtp-Source: AMrXdXt0R9R6hjZfgiXQa0o+XQK2FtwQdalpX2Gcdixk5YUSBbV9ozEAiuuee9Uf36ty3KjwViQC1Q==
X-Received: by 2002:a05:651c:2de:b0:282:fe0b:d167 with SMTP id f30-20020a05651c02de00b00282fe0bd167mr1992536ljo.7.1673786521181;
        Sun, 15 Jan 2023 04:42:01 -0800 (PST)
Received: from eriador.lumag.spb.ru ([188.170.85.102])
        by smtp.gmail.com with ESMTPSA id 22-20020a2e1456000000b0028559373a31sm2688243lju.112.2023.01.15.04.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jan 2023 04:42:00 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 2/2] drm/msm/dpu: don't use DPU_CLK_CTRL_CURSORn for DMA SSPP clocks
Date:   Sun, 15 Jan 2023 14:41:43 +0200
Message-Id: <20230115124143.464809-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230115124143.464809-1-dmitry.baryshkov@linaro.org>
References: <20230115124143.464809-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

DPU driver has been using the DPU_CLK_CTRL_CURSOR prefix for the DMA
SSPP blocks used for the cursor planes. This has lead to the confusion
at least for the MSM8998 platform. In preparation to supporting the
cursor SSPP blocks, use proper enum values to index DMA SSPP clock
controls.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 64 +++++++++----------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  2 +
 2 files changed, 34 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index ad0c55464154..b0f6e071fe4b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -522,9 +522,9 @@ static const struct dpu_mdp_cfg sdm845_mdp[] = {
 			.reg_off = 0x2AC, .bit_off = 8},
 	.clk_ctrls[DPU_CLK_CTRL_DMA1] = {
 			.reg_off = 0x2B4, .bit_off = 8},
-	.clk_ctrls[DPU_CLK_CTRL_CURSOR0] = {
+	.clk_ctrls[DPU_CLK_CTRL_DMA2] = {
 			.reg_off = 0x2BC, .bit_off = 8},
-	.clk_ctrls[DPU_CLK_CTRL_CURSOR1] = {
+	.clk_ctrls[DPU_CLK_CTRL_DMA3] = {
 			.reg_off = 0x2C4, .bit_off = 8},
 	},
 };
@@ -539,9 +539,9 @@ static const struct dpu_mdp_cfg sc7180_mdp[] = {
 		.reg_off = 0x2AC, .bit_off = 0},
 	.clk_ctrls[DPU_CLK_CTRL_DMA0] = {
 		.reg_off = 0x2AC, .bit_off = 8},
-	.clk_ctrls[DPU_CLK_CTRL_CURSOR0] = {
+	.clk_ctrls[DPU_CLK_CTRL_DMA1] = {
 		.reg_off = 0x2B4, .bit_off = 8},
-	.clk_ctrls[DPU_CLK_CTRL_CURSOR1] = {
+	.clk_ctrls[DPU_CLK_CTRL_DMA2] = {
 		.reg_off = 0x2C4, .bit_off = 8},
 	},
 };
@@ -564,9 +564,9 @@ static const struct dpu_mdp_cfg sc8180x_mdp[] = {
 			.reg_off = 0x2AC, .bit_off = 8},
 	.clk_ctrls[DPU_CLK_CTRL_DMA1] = {
 			.reg_off = 0x2B4, .bit_off = 8},
-	.clk_ctrls[DPU_CLK_CTRL_CURSOR0] = {
+	.clk_ctrls[DPU_CLK_CTRL_DMA2] = {
 			.reg_off = 0x2BC, .bit_off = 8},
-	.clk_ctrls[DPU_CLK_CTRL_CURSOR1] = {
+	.clk_ctrls[DPU_CLK_CTRL_DMA3] = {
 			.reg_off = 0x2C4, .bit_off = 8},
 	},
 };
@@ -602,9 +602,9 @@ static const struct dpu_mdp_cfg sm8250_mdp[] = {
 			.reg_off = 0x2AC, .bit_off = 8},
 	.clk_ctrls[DPU_CLK_CTRL_DMA1] = {
 			.reg_off = 0x2B4, .bit_off = 8},
-	.clk_ctrls[DPU_CLK_CTRL_CURSOR0] = {
+	.clk_ctrls[DPU_CLK_CTRL_DMA2] = {
 			.reg_off = 0x2BC, .bit_off = 8},
-	.clk_ctrls[DPU_CLK_CTRL_CURSOR1] = {
+	.clk_ctrls[DPU_CLK_CTRL_DMA3] = {
 			.reg_off = 0x2C4, .bit_off = 8},
 	.clk_ctrls[DPU_CLK_CTRL_REG_DMA] = {
 			.reg_off = 0x2BC, .bit_off = 20},
@@ -631,9 +631,9 @@ static const struct dpu_mdp_cfg sm8350_mdp[] = {
 			.reg_off = 0x2ac, .bit_off = 8},
 	.clk_ctrls[DPU_CLK_CTRL_DMA1] = {
 			.reg_off = 0x2b4, .bit_off = 8},
-	.clk_ctrls[DPU_CLK_CTRL_CURSOR0] = {
+	.clk_ctrls[DPU_CLK_CTRL_DMA2] = {
 			.reg_off = 0x2bc, .bit_off = 8},
-	.clk_ctrls[DPU_CLK_CTRL_CURSOR1] = {
+	.clk_ctrls[DPU_CLK_CTRL_DMA3] = {
 			.reg_off = 0x2c4, .bit_off = 8},
 	.clk_ctrls[DPU_CLK_CTRL_REG_DMA] = {
 			.reg_off = 0x2bc, .bit_off = 20},
@@ -658,9 +658,9 @@ static const struct dpu_mdp_cfg sm8450_mdp[] = {
 			.reg_off = 0x2AC, .bit_off = 8},
 	.clk_ctrls[DPU_CLK_CTRL_DMA1] = {
 			.reg_off = 0x2B4, .bit_off = 8},
-	.clk_ctrls[DPU_CLK_CTRL_CURSOR0] = {
+	.clk_ctrls[DPU_CLK_CTRL_DMA2] = {
 			.reg_off = 0x2BC, .bit_off = 8},
-	.clk_ctrls[DPU_CLK_CTRL_CURSOR1] = {
+	.clk_ctrls[DPU_CLK_CTRL_DMA3] = {
 			.reg_off = 0x2C4, .bit_off = 8},
 	.clk_ctrls[DPU_CLK_CTRL_REG_DMA] = {
 			.reg_off = 0x2BC, .bit_off = 20},
@@ -676,9 +676,9 @@ static const struct dpu_mdp_cfg sc7280_mdp[] = {
 		.reg_off = 0x2AC, .bit_off = 0},
 	.clk_ctrls[DPU_CLK_CTRL_DMA0] = {
 		.reg_off = 0x2AC, .bit_off = 8},
-	.clk_ctrls[DPU_CLK_CTRL_CURSOR0] = {
+	.clk_ctrls[DPU_CLK_CTRL_DMA1] = {
 		.reg_off = 0x2B4, .bit_off = 8},
-	.clk_ctrls[DPU_CLK_CTRL_CURSOR1] = {
+	.clk_ctrls[DPU_CLK_CTRL_DMA2] = {
 		.reg_off = 0x2C4, .bit_off = 8},
 	},
 };
@@ -696,8 +696,8 @@ static const struct dpu_mdp_cfg sc8280xp_mdp[] = {
 	.clk_ctrls[DPU_CLK_CTRL_VIG3] = { .reg_off = 0x2c4, .bit_off = 0},
 	.clk_ctrls[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8},
 	.clk_ctrls[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8},
-	.clk_ctrls[DPU_CLK_CTRL_CURSOR0] = { .reg_off = 0x2bc, .bit_off = 8},
-	.clk_ctrls[DPU_CLK_CTRL_CURSOR1] = { .reg_off = 0x2c4, .bit_off = 8},
+	.clk_ctrls[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2bc, .bit_off = 8},
+	.clk_ctrls[DPU_CLK_CTRL_DMA3] = { .reg_off = 0x2c4, .bit_off = 8},
 	.clk_ctrls[DPU_CLK_CTRL_REG_DMA] = { .reg_off = 0x2bc, .bit_off = 20},
 	},
 };
@@ -724,9 +724,9 @@ static const struct dpu_mdp_cfg sm8550_mdp[] = {
 			.reg_off = 0x28330, .bit_off = 0},
 	.clk_ctrls[DPU_CLK_CTRL_DMA3] = {
 			.reg_off = 0x2a330, .bit_off = 0},
-	.clk_ctrls[DPU_CLK_CTRL_CURSOR0] = {
+	.clk_ctrls[DPU_CLK_CTRL_DMA4] = {
 			.reg_off = 0x2c330, .bit_off = 0},
-	.clk_ctrls[DPU_CLK_CTRL_CURSOR1] = {
+	.clk_ctrls[DPU_CLK_CTRL_DMA5] = {
 			.reg_off = 0x2e330, .bit_off = 0},
 	.clk_ctrls[DPU_CLK_CTRL_REG_DMA] = {
 			.reg_off = 0x2bc, .bit_off = 20},
@@ -1199,9 +1199,9 @@ static const struct dpu_sspp_cfg sdm845_sspp[] = {
 	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_SDM845_MASK,
 		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
 	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_SDM845_MASK,
-		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0),
+		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
 	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000,  DMA_CURSOR_SDM845_MASK,
-		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
+		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
 };
 
 static const struct dpu_sspp_sub_blks sc7180_vig_sblk_0 =
@@ -1216,9 +1216,9 @@ static const struct dpu_sspp_cfg sc7180_sspp[] = {
 	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK,
 		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
 	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_CURSOR_SDM845_MASK,
-		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0),
+		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
 	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_SDM845_MASK,
-		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
+		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
 };
 
 static const struct dpu_sspp_sub_blks sm6115_vig_sblk_0 =
@@ -1254,9 +1254,9 @@ static const struct dpu_sspp_cfg sm8250_sspp[] = {
 	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_SDM845_MASK,
 		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
 	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_SDM845_MASK,
-		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0),
+		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
 	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000,  DMA_CURSOR_SDM845_MASK,
-		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
+		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
 };
 
 static const struct dpu_sspp_sub_blks sm8450_vig_sblk_0 =
@@ -1282,9 +1282,9 @@ static const struct dpu_sspp_cfg sm8450_sspp[] = {
 	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_SDM845_MASK,
 		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
 	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_SDM845_MASK,
-		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0),
+		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
 	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000,  DMA_CURSOR_SDM845_MASK,
-		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
+		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
 };
 
 static const struct dpu_sspp_sub_blks sm8550_vig_sblk_0 =
@@ -1316,9 +1316,9 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
 	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000,  DMA_SDM845_MASK,
 		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
 	SSPP_BLK("sspp_12", SSPP_DMA4, 0x2c000,  DMA_CURSOR_SDM845_MASK,
-		sm8550_dma_sblk_4, 14, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0),
+		sm8550_dma_sblk_4, 14, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA4),
 	SSPP_BLK("sspp_13", SSPP_DMA5, 0x2e000,  DMA_CURSOR_SDM845_MASK,
-		sd8550_dma_sblk_5, 15, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
+		sd8550_dma_sblk_5, 15, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA5),
 };
 
 static const struct dpu_sspp_cfg sc7280_sspp[] = {
@@ -1327,9 +1327,9 @@ static const struct dpu_sspp_cfg sc7280_sspp[] = {
 	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK,
 		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
 	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_CURSOR_SDM845_MASK,
-		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0),
+		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
 	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_SDM845_MASK,
-		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
+		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
 };
 
 static const struct dpu_sspp_sub_blks sc8280xp_vig_sblk_0 =
@@ -1355,9 +1355,9 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
 	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, DMA_SDM845_MASK,
 		 sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
 	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, DMA_CURSOR_SDM845_MASK,
-		 sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0),
+		 sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
 	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, DMA_CURSOR_SDM845_MASK,
-		 sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
+		 sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
 };
 
 #define _VIG_SBLK_NOSCALE(num, sdma_pri) \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 56d98b4dd2ac..9c96920e1849 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -513,6 +513,8 @@ enum dpu_clk_ctrl_type {
 	DPU_CLK_CTRL_DMA1,
 	DPU_CLK_CTRL_DMA2,
 	DPU_CLK_CTRL_DMA3,
+	DPU_CLK_CTRL_DMA4,
+	DPU_CLK_CTRL_DMA5,
 	DPU_CLK_CTRL_CURSOR0,
 	DPU_CLK_CTRL_CURSOR1,
 	DPU_CLK_CTRL_INLINE_ROT0_SSPP,
-- 
2.39.0

