Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77E7E79C20C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Sep 2023 03:59:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234446AbjILB7E (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Sep 2023 21:59:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229605AbjILB6u (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Sep 2023 21:58:50 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56230145E57
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Sep 2023 18:29:33 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-52a39a1c4d5so6604667a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Sep 2023 18:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694482172; x=1695086972; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FDiy42MWQp2cIU+1xSHE+JG1rTLkF3/vTzm9faFHw2w=;
        b=szVmoXrr7kukeVSlNJw/LwSAQBACairVrDr/v4nupA1jLwzcN6MUdO4mANOt3v80ok
         adqMUPJDOAfujaZlB5QonQbWFdZd7MJVWr7UisvCQ9jpE/2byV/4Kz/kumHax8aOef+y
         Yk59sZewqiEK3LXdaIErSfi9kDTRLsw6LglPTr30/Xu0DVRTELvS/fwwyVlZnu3iYcVz
         TBamON1aJTgU/G6m1KmWdvgOxWVKutaywj2goOKlLTCBO8cq78+8Vk7eYERfyuNm4Kj4
         KyjXksLix7q26z169/19FXVp8Jh2NFLQKLj4GD/Q+3bH9y0rXJuyTPSLahBefsk4b6oF
         FMvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694482172; x=1695086972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FDiy42MWQp2cIU+1xSHE+JG1rTLkF3/vTzm9faFHw2w=;
        b=QHArslyZ3XxqzEhV97Ox1EEgE7lL6Mfx1V5xI1EDKagmnWU7Pgz6W0ItWYhlCnTRMJ
         EjYyB7KK/CPeJtMDvrwYBlphpCbjvV9HTeR5JNF1UA2qdtQL5Pb6IL6HsttspbYnMi3g
         dH/FdkKkBVbpCzRmw8UsEd609Rg0Eay8h4t+ygZN06bu8jYMUwKcu15z4lORGA8KeNEP
         27EkbYFEMe9Qj6xle75eSdWuyrMC34PFQ0f9yxY1FD0nxOTRc+UqxCxSUWSk7ptlqoQB
         fxXTj1F4Avy6bJdC9yYUBSSV+0V/ObwVlMY3v6x4pyhu4jCBSlmv5HkIBsYf3Lj2KIO/
         dPTA==
X-Gm-Message-State: AOJu0Ywvq0/cYoSwTPaaOfk2epOBmKahCNdiHYpF7CdWTXkAIhiZSwg2
        rICh95zbtZo6PYsagOe0mTSfH4NeodPadXmprr4=
X-Google-Smtp-Source: AGHT+IHLLB/mlSJqnY+gfz8LBUwzx/Z6tLbsahZqCeIjMplqxljFDeEFziXk82Rq4s8zSIbEwMDQYA==
X-Received: by 2002:a05:6512:3c8c:b0:500:7f51:d129 with SMTP id h12-20020a0565123c8c00b005007f51d129mr10285419lfv.34.1694468725837;
        Mon, 11 Sep 2023 14:45:25 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id b5-20020a0565120b8500b004ff9bfda9d6sm1168804lfv.212.2023.09.11.14.45.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 14:45:25 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v4 4/9] drm/msm/dpu: drop the `id' field from DPU_HW_SUBBLK_INFO
Date:   Tue, 12 Sep 2023 00:45:16 +0300
Message-Id: <20230911214521.787453-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230911214521.787453-1-dmitry.baryshkov@linaro.org>
References: <20230911214521.787453-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The field `id' is not used for subblocks. The handling code usually
knows, which sub-block it is now looking at. Drop the field completely.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 76 +++++++++----------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  2 -
 2 files changed, 36 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 77d09f961d86..ed7458991509 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -253,17 +253,15 @@ static const uint32_t wb2_formats[] = {
 #define SSPP_SCALER_VER(maj, min) (((maj) << 16) | (min))
 
 /* SSPP common configuration */
-#define _VIG_SBLK(sdma_pri, qseed_ver, scaler_ver) \
+#define _VIG_SBLK(sdma_pri, scaler_ver) \
 	{ \
 	.maxdwnscale = MAX_DOWNSCALE_RATIO, \
 	.maxupscale = MAX_UPSCALE_RATIO, \
 	.smart_dma_priority = sdma_pri, \
 	.scaler_blk = {.name = "scaler", \
-		.id = qseed_ver, \
 		.version = scaler_ver, \
 		.base = 0xa00, .len = 0xa0,}, \
 	.csc_blk = {.name = "csc", \
-		.id = DPU_SSPP_CSC_10BIT, \
 		.base = 0x1a00, .len = 0x100,}, \
 	.format_list = plane_formats_yuv, \
 	.num_formats = ARRAY_SIZE(plane_formats_yuv), \
@@ -272,17 +270,15 @@ static const uint32_t wb2_formats[] = {
 	.rotation_cfg = NULL, \
 	}
 
-#define _VIG_SBLK_ROT(sdma_pri, qseed_ver, scaler_ver, rot_cfg) \
+#define _VIG_SBLK_ROT(sdma_pri, scaler_ver, rot_cfg) \
 	{ \
 	.maxdwnscale = MAX_DOWNSCALE_RATIO, \
 	.maxupscale = MAX_UPSCALE_RATIO, \
 	.smart_dma_priority = sdma_pri, \
 	.scaler_blk = {.name = "scaler", \
-		.id = qseed_ver, \
 		.version = scaler_ver, \
 		.base = 0xa00, .len = 0xa0,}, \
 	.csc_blk = {.name = "csc", \
-		.id = DPU_SSPP_CSC_10BIT, \
 		.base = 0x1a00, .len = 0x100,}, \
 	.format_list = plane_formats_yuv, \
 	.num_formats = ARRAY_SIZE(plane_formats_yuv), \
@@ -303,16 +299,16 @@ static const uint32_t wb2_formats[] = {
 	}
 
 static const struct dpu_sspp_sub_blks msm8998_vig_sblk_0 =
-				_VIG_SBLK(0, DPU_SSPP_SCALER_QSEED3,
+				_VIG_SBLK(0,
 					  SSPP_SCALER_VER(1, 2));
 static const struct dpu_sspp_sub_blks msm8998_vig_sblk_1 =
-				_VIG_SBLK(0, DPU_SSPP_SCALER_QSEED3,
+				_VIG_SBLK(0,
 					  SSPP_SCALER_VER(1, 2));
 static const struct dpu_sspp_sub_blks msm8998_vig_sblk_2 =
-				_VIG_SBLK(0, DPU_SSPP_SCALER_QSEED3,
+				_VIG_SBLK(0,
 					  SSPP_SCALER_VER(1, 2));
 static const struct dpu_sspp_sub_blks msm8998_vig_sblk_3 =
-				_VIG_SBLK(0, DPU_SSPP_SCALER_QSEED3,
+				_VIG_SBLK(0,
 					  SSPP_SCALER_VER(1, 2));
 
 static const struct dpu_rotation_cfg dpu_rot_sc7280_cfg_v2 = {
@@ -322,29 +318,29 @@ static const struct dpu_rotation_cfg dpu_rot_sc7280_cfg_v2 = {
 };
 
 static const struct dpu_sspp_sub_blks sdm845_vig_sblk_0 =
-				_VIG_SBLK(5, DPU_SSPP_SCALER_QSEED3,
+				_VIG_SBLK(5,
 					  SSPP_SCALER_VER(1, 3));
 static const struct dpu_sspp_sub_blks sdm845_vig_sblk_1 =
-				_VIG_SBLK(6, DPU_SSPP_SCALER_QSEED3,
+				_VIG_SBLK(6,
 					  SSPP_SCALER_VER(1, 3));
 static const struct dpu_sspp_sub_blks sdm845_vig_sblk_2 =
-				_VIG_SBLK(7, DPU_SSPP_SCALER_QSEED3,
+				_VIG_SBLK(7,
 					  SSPP_SCALER_VER(1, 3));
 static const struct dpu_sspp_sub_blks sdm845_vig_sblk_3 =
-				_VIG_SBLK(8, DPU_SSPP_SCALER_QSEED3,
+				_VIG_SBLK(8,
 					  SSPP_SCALER_VER(1, 3));
 
 static const struct dpu_sspp_sub_blks sm8150_vig_sblk_0 =
-				_VIG_SBLK(5, DPU_SSPP_SCALER_QSEED3,
+				_VIG_SBLK(5,
 					  SSPP_SCALER_VER(1, 4));
 static const struct dpu_sspp_sub_blks sm8150_vig_sblk_1 =
-				_VIG_SBLK(6, DPU_SSPP_SCALER_QSEED3,
+				_VIG_SBLK(6,
 					  SSPP_SCALER_VER(1, 4));
 static const struct dpu_sspp_sub_blks sm8150_vig_sblk_2 =
-				_VIG_SBLK(7, DPU_SSPP_SCALER_QSEED3,
+				_VIG_SBLK(7,
 					  SSPP_SCALER_VER(1, 4));
 static const struct dpu_sspp_sub_blks sm8150_vig_sblk_3 =
-				_VIG_SBLK(8, DPU_SSPP_SCALER_QSEED3,
+				_VIG_SBLK(8,
 					  SSPP_SCALER_VER(1, 4));
 
 static const struct dpu_sspp_sub_blks sdm845_dma_sblk_0 = _DMA_SBLK(1);
@@ -353,59 +349,59 @@ static const struct dpu_sspp_sub_blks sdm845_dma_sblk_2 = _DMA_SBLK(3);
 static const struct dpu_sspp_sub_blks sdm845_dma_sblk_3 = _DMA_SBLK(4);
 
 static const struct dpu_sspp_sub_blks sc7180_vig_sblk_0 =
-				_VIG_SBLK(4, DPU_SSPP_SCALER_QSEED4,
+				_VIG_SBLK(4,
 					  SSPP_SCALER_VER(3, 0));
 
 static const struct dpu_sspp_sub_blks sc7280_vig_sblk_0 =
-			_VIG_SBLK_ROT(4, DPU_SSPP_SCALER_QSEED4,
+			_VIG_SBLK_ROT(4,
 				      SSPP_SCALER_VER(3, 0),
 				      &dpu_rot_sc7280_cfg_v2);
 
 static const struct dpu_sspp_sub_blks sm6115_vig_sblk_0 =
-				_VIG_SBLK(2, DPU_SSPP_SCALER_QSEED4,
+				_VIG_SBLK(2,
 					  SSPP_SCALER_VER(3, 0));
 
 static const struct dpu_sspp_sub_blks sm6125_vig_sblk_0 =
-				_VIG_SBLK(3, DPU_SSPP_SCALER_QSEED3LITE,
+				_VIG_SBLK(3,
 					  SSPP_SCALER_VER(2, 4));
 
 static const struct dpu_sspp_sub_blks sm8250_vig_sblk_0 =
-				_VIG_SBLK(5, DPU_SSPP_SCALER_QSEED4,
+				_VIG_SBLK(5,
 					  SSPP_SCALER_VER(3, 0));
 static const struct dpu_sspp_sub_blks sm8250_vig_sblk_1 =
-				_VIG_SBLK(6, DPU_SSPP_SCALER_QSEED4,
+				_VIG_SBLK(6,
 					  SSPP_SCALER_VER(3, 0));
 static const struct dpu_sspp_sub_blks sm8250_vig_sblk_2 =
-				_VIG_SBLK(7, DPU_SSPP_SCALER_QSEED4,
+				_VIG_SBLK(7,
 					  SSPP_SCALER_VER(3, 0));
 static const struct dpu_sspp_sub_blks sm8250_vig_sblk_3 =
-				_VIG_SBLK(8, DPU_SSPP_SCALER_QSEED4,
+				_VIG_SBLK(8,
 					  SSPP_SCALER_VER(3, 0));
 
 static const struct dpu_sspp_sub_blks sm8450_vig_sblk_0 =
-				_VIG_SBLK(5, DPU_SSPP_SCALER_QSEED4,
+				_VIG_SBLK(5,
 					  SSPP_SCALER_VER(3, 1));
 static const struct dpu_sspp_sub_blks sm8450_vig_sblk_1 =
-				_VIG_SBLK(6, DPU_SSPP_SCALER_QSEED4,
+				_VIG_SBLK(6,
 					  SSPP_SCALER_VER(3, 1));
 static const struct dpu_sspp_sub_blks sm8450_vig_sblk_2 =
-				_VIG_SBLK(7, DPU_SSPP_SCALER_QSEED4,
+				_VIG_SBLK(7,
 					  SSPP_SCALER_VER(3, 1));
 static const struct dpu_sspp_sub_blks sm8450_vig_sblk_3 =
-				_VIG_SBLK(8, DPU_SSPP_SCALER_QSEED4,
+				_VIG_SBLK(8,
 					  SSPP_SCALER_VER(3, 1));
 
 static const struct dpu_sspp_sub_blks sm8550_vig_sblk_0 =
-				_VIG_SBLK(7, DPU_SSPP_SCALER_QSEED4,
+				_VIG_SBLK(7,
 					  SSPP_SCALER_VER(3, 2));
 static const struct dpu_sspp_sub_blks sm8550_vig_sblk_1 =
-				_VIG_SBLK(8, DPU_SSPP_SCALER_QSEED4,
+				_VIG_SBLK(8,
 					  SSPP_SCALER_VER(3, 2));
 static const struct dpu_sspp_sub_blks sm8550_vig_sblk_2 =
-				_VIG_SBLK(9, DPU_SSPP_SCALER_QSEED4,
+				_VIG_SBLK(9,
 					  SSPP_SCALER_VER(3, 2));
 static const struct dpu_sspp_sub_blks sm8550_vig_sblk_3 =
-				_VIG_SBLK(10, DPU_SSPP_SCALER_QSEED4,
+				_VIG_SBLK(10,
 					  SSPP_SCALER_VER(3, 2));
 static const struct dpu_sspp_sub_blks sm8550_dma_sblk_4 = _DMA_SBLK(5);
 static const struct dpu_sspp_sub_blks sm8550_dma_sblk_5 = _DMA_SBLK(6);
@@ -474,12 +470,12 @@ static const struct dpu_lm_sub_blks qcm2290_lm_sblk = {
  * DSPP sub blocks config
  *************************************************************/
 static const struct dpu_dspp_sub_blks msm8998_dspp_sblk = {
-	.pcc = {.name = "pcc", .id = DPU_DSPP_PCC, .base = 0x1700,
+	.pcc = {.name = "pcc", .base = 0x1700,
 		.len = 0x90, .version = 0x10007},
 };
 
 static const struct dpu_dspp_sub_blks sdm845_dspp_sblk = {
-	.pcc = {.name = "pcc", .id = DPU_DSPP_PCC, .base = 0x1700,
+	.pcc = {.name = "pcc", .base = 0x1700,
 		.len = 0x90, .version = 0x40000},
 };
 
@@ -487,19 +483,19 @@ static const struct dpu_dspp_sub_blks sdm845_dspp_sblk = {
  * PINGPONG sub blocks config
  *************************************************************/
 static const struct dpu_pingpong_sub_blks sdm845_pp_sblk_te = {
-	.te2 = {.name = "te2", .id = DPU_PINGPONG_TE2, .base = 0x2000, .len = 0x0,
+	.te2 = {.name = "te2", .base = 0x2000, .len = 0x0,
 		.version = 0x1},
-	.dither = {.name = "dither", .id = DPU_PINGPONG_DITHER, .base = 0x30e0,
+	.dither = {.name = "dither", .base = 0x30e0,
 		.len = 0x20, .version = 0x10000},
 };
 
 static const struct dpu_pingpong_sub_blks sdm845_pp_sblk = {
-	.dither = {.name = "dither", .id = DPU_PINGPONG_DITHER, .base = 0x30e0,
+	.dither = {.name = "dither", .base = 0x30e0,
 		.len = 0x20, .version = 0x10000},
 };
 
 static const struct dpu_pingpong_sub_blks sc7280_pp_sblk = {
-	.dither = {.name = "dither", .id = DPU_PINGPONG_DITHER, .base = 0xe0,
+	.dither = {.name = "dither", .base = 0xe0,
 	.len = 0x20, .version = 0x20000},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 9e7750c47cd0..c47969ba7ed5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -255,14 +255,12 @@ enum {
 /**
  * MACRO DPU_HW_SUBBLK_INFO - information of HW sub-block inside DPU
  * @name:              string name for debug purposes
- * @id:                enum identifying this sub-block
  * @base:              offset of this sub-block relative to the block
  *                     offset
  * @len                register block length of this sub-block
  */
 #define DPU_HW_SUBBLK_INFO \
 	char name[DPU_HW_BLK_NAME_LEN]; \
-	u32 id; \
 	u32 base; \
 	u32 len
 
-- 
2.39.2

