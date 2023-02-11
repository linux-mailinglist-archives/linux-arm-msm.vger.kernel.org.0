Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5452A6934B8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Feb 2023 00:13:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229576AbjBKXNV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 11 Feb 2023 18:13:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229545AbjBKXNU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 11 Feb 2023 18:13:20 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C56D416301
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Feb 2023 15:13:18 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id p26so23884377ejx.13
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Feb 2023 15:13:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ipFzsK4uevaNSa5kzoZBFwGfAOGsYkb27k28u0kwQ20=;
        b=pAX2awFK8vFG9EZ8Bo4UrqW6kSutSET6A4/New4ORfBa7Y1+ve47WfO5OVDg53gywT
         qESqQwxUwi1AC5zawnU6wU+i5R9MRNAuot0xJ0C+9NFQ9X4ymXePoEgGfVj40yfye1bx
         Xz8WT3VQh/v26/tc2QSDwwoFVFCi5uzT7zNgv/9UM4EERJzozx2Mky3BHMEkQbcNelCG
         CJylKpje16dl0eaiOaeOZvH9h1xD3YFICU+vecOvnwXbljOyl66ivWSs2xXe9iX7Nsok
         ecAiRY/UaSo88Ed36ZR7cRWmv0UdMiN9JEYxYuJcYCyy2dQXBAcIcGNTCtbmrH2NANWh
         AFGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ipFzsK4uevaNSa5kzoZBFwGfAOGsYkb27k28u0kwQ20=;
        b=e8U0225wTVqxUfs/eyFU398LoSEJaCf0YNO8KmyVyZCMaJ2XrKpoIYanGXfFo3OV0B
         ogSajRFokJuApkyQTC5G7kBYpAADdDq6aVoxpAdZ+nFSv/VE5g81ZKAFysGBnhynZRcB
         S9iGs9VyZagYPuxkCli1wr6OAW2AqC5sbenvpxgL5Q/sk95KdXZZSuDI+0wNiNcqjdi9
         HfMDQOS3druVzXAruSVAev+1myj+ZkbKAzCEj1oWGS2d0Ylg1hxeqZnYZFrELAw7876U
         /j43vRYEgs2sJPuN5+4l2SZFeVEmVA/K7VKfif5l1y3Tms/hvTLkLoSEmI8fvWkQjU9s
         9MFw==
X-Gm-Message-State: AO0yUKVqFO5KFtpDerv8cT6/tVCjA5CVIamnv9daEIBW3ipiHHTPWXaO
        s1TtpMfXeAb8alwLd/J5jglLykxR1NzBedOG
X-Google-Smtp-Source: AK7set/qn8UJiLCojvQR+k5ns46NMC0RWElJ6IBH3497bDqzyBKWfWM9MCJv32BBmhw2nJ9T3wo0WQ==
X-Received: by 2002:a17:906:f1d0:b0:86f:b99c:ac8d with SMTP id gx16-20020a170906f1d000b0086fb99cac8dmr22167517ejb.44.1676157197383;
        Sat, 11 Feb 2023 15:13:17 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id k20-20020a1709061c1400b00871390a3b74sm4517149ejg.177.2023.02.11.15.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 15:13:16 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 13/50] drm/msm/dpu: don't use DPU_CLK_CTRL_CURSORn for DMA SSPP clocks
Date:   Sun, 12 Feb 2023 01:12:22 +0200
Message-Id: <20230211231259.1308718-14-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
References: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
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

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550 on top of next-20230116
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 64 +++++++++----------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  2 +
 2 files changed, 34 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index e3460b35058f..e390be4ef10b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -525,9 +525,9 @@ static const struct dpu_mdp_cfg sdm845_mdp[] = {
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
@@ -542,9 +542,9 @@ static const struct dpu_mdp_cfg sc7180_mdp[] = {
 		.reg_off = 0x2AC, .bit_off = 0},
 	.clk_ctrls[DPU_CLK_CTRL_DMA0] = {
 		.reg_off = 0x2AC, .bit_off = 8},
-	.clk_ctrls[DPU_CLK_CTRL_CURSOR0] = {
+	.clk_ctrls[DPU_CLK_CTRL_DMA1] = {
 		.reg_off = 0x2B4, .bit_off = 8},
-	.clk_ctrls[DPU_CLK_CTRL_CURSOR1] = {
+	.clk_ctrls[DPU_CLK_CTRL_DMA2] = {
 		.reg_off = 0x2C4, .bit_off = 8},
 	.clk_ctrls[DPU_CLK_CTRL_WB2] = {
 		.reg_off = 0x3B8, .bit_off = 24},
@@ -569,9 +569,9 @@ static const struct dpu_mdp_cfg sc8180x_mdp[] = {
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
@@ -609,9 +609,9 @@ static const struct dpu_mdp_cfg sm8250_mdp[] = {
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
@@ -638,9 +638,9 @@ static const struct dpu_mdp_cfg sm8350_mdp[] = {
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
@@ -666,9 +666,9 @@ static const struct dpu_mdp_cfg sm8450_mdp[] = {
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
@@ -685,9 +685,9 @@ static const struct dpu_mdp_cfg sc7280_mdp[] = {
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
@@ -705,8 +705,8 @@ static const struct dpu_mdp_cfg sc8280xp_mdp[] = {
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
@@ -734,9 +734,9 @@ static const struct dpu_mdp_cfg sm8550_mdp[] = {
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
@@ -1209,9 +1209,9 @@ static const struct dpu_sspp_cfg sdm845_sspp[] = {
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
@@ -1226,9 +1226,9 @@ static const struct dpu_sspp_cfg sc7180_sspp[] = {
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
@@ -1264,9 +1264,9 @@ static const struct dpu_sspp_cfg sm8250_sspp[] = {
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
@@ -1292,9 +1292,9 @@ static const struct dpu_sspp_cfg sm8450_sspp[] = {
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
@@ -1326,9 +1326,9 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
 	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000,  DMA_SDM845_MASK,
 		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
 	SSPP_BLK("sspp_12", SSPP_DMA4, 0x2c000,  DMA_CURSOR_SDM845_MASK,
-		sm8550_dma_sblk_4, 14, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0),
+		sm8550_dma_sblk_4, 14, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA4),
 	SSPP_BLK("sspp_13", SSPP_DMA5, 0x2e000,  DMA_CURSOR_SDM845_MASK,
-		sm8550_dma_sblk_5, 15, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
+		sm8550_dma_sblk_5, 15, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA5),
 };
 
 static const struct dpu_sspp_cfg sc7280_sspp[] = {
@@ -1337,9 +1337,9 @@ static const struct dpu_sspp_cfg sc7280_sspp[] = {
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
@@ -1365,9 +1365,9 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
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
index ddab9caebb18..e6590302b3bf 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -515,6 +515,8 @@ enum dpu_clk_ctrl_type {
 	DPU_CLK_CTRL_DMA1,
 	DPU_CLK_CTRL_DMA2,
 	DPU_CLK_CTRL_DMA3,
+	DPU_CLK_CTRL_DMA4,
+	DPU_CLK_CTRL_DMA5,
 	DPU_CLK_CTRL_CURSOR0,
 	DPU_CLK_CTRL_CURSOR1,
 	DPU_CLK_CTRL_INLINE_ROT0_SSPP,
-- 
2.39.1

