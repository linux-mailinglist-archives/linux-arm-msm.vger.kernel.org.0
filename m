Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1B10792805
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Sep 2023 18:42:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238601AbjIEQGa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Sep 2023 12:06:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244680AbjIEBZf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Sep 2023 21:25:35 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 194ADCC7
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Sep 2023 18:25:31 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5007616b756so3368480e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Sep 2023 18:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693877129; x=1694481929; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UMg75ELtD1pjVeY3jFphuiTRR31e7S3HJFDQZ3ZYM8U=;
        b=Rt1l+T9IM3BNk7WL7Rj6Wg4KSH1RuQwqAzqSLqXRYzLjT1xDfeAcJhZycF7qYw6P+h
         3Kd96PiCe3py67d6vt1x2nJK7LC0ET84LwL+TqjPbxvIOLnM9X7xhd5oy3lQqLDalj9P
         asd717CTRkyX4I8r2ppSl13LxFTNOU7PcPHayU5iU2adTsbGqt/uKLS2+7Cl6jvvh4sV
         W+Ei34nspgseShTkELnOibaNl6hPbIJJaJvNTJqLphDU8unUDl60ZLu5+YX2ML+Sp1Bo
         7kkxfuskZX4YtDBij64MDiKMvkTVC3ivy8u0j7S1TkKualVGWgVTQxrzvNZeUJ39SXgw
         Prfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693877129; x=1694481929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UMg75ELtD1pjVeY3jFphuiTRR31e7S3HJFDQZ3ZYM8U=;
        b=avaE5yTJ/iLOW4PJYovWm0OFbqwvYnkKecz1tV0QkC6DdbYsu7r1nREpFbH3PlIcRf
         le3jC68cN3RmQoOkGHT51TrdtG7IOoaKiWVheN/vgbxV7a/x/5j1e7E1UX+cSinXbov4
         brnyHyyXWiOy09Mhr/5536VQ8hzsiLroffyz+RLiwdN6cxXLMti+9FxaJ24IaUfM1iYl
         T+E0GI9y8OWbMNbNyWoRN2mOwbR5P0b2U0n2wWf+EtVIHaaDQgAPqafWQeRYpID4Hr7u
         w8QOAoCxXoqGMsU1hgoc8VYar0WvxE0w1XtHM03OjRuz1d40fO2rP03JsA5yAg1Wy54K
         GRjw==
X-Gm-Message-State: AOJu0YzPiHYf6YGqK7esJQyk1NqRpPNJAzecNfYTnKPDXYEJTTFPklJT
        7Wh/blx2tgx6dJjp+BNaV6xcFA==
X-Google-Smtp-Source: AGHT+IFg0oStFJaOzr0M82/x/bvSO9sL6EZr4jSBX144oqqK1cT6+J5etY02N/xisrskkakPkXtFXA==
X-Received: by 2002:a05:6512:3d8a:b0:4fd:c844:6a43 with SMTP id k10-20020a0565123d8a00b004fdc8446a43mr9466164lfv.43.1693877129442;
        Mon, 04 Sep 2023 18:25:29 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id v25-20020ac25599000000b004ff70c76208sm2062369lfg.84.2023.09.04.18.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Sep 2023 18:25:28 -0700 (PDT)
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
Subject: [PATCH v3 2/8] drm/msm/dpu: drop the `id' field from DPU_HW_SUBBLK_INFO
Date:   Tue,  5 Sep 2023 04:25:20 +0300
Message-Id: <20230905012526.3010798-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230905012526.3010798-1-dmitry.baryshkov@linaro.org>
References: <20230905012526.3010798-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
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
index 6c9634209e9f..cbffbef11ee7 100644
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

