Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6AFA673B937
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jun 2023 15:58:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230262AbjFWN6u (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Jun 2023 09:58:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230280AbjFWN6t (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Jun 2023 09:58:49 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24A65189
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jun 2023 06:58:48 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2b47bfd4e45so11505431fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jun 2023 06:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687528726; x=1690120726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uu4tO5xYJ0NxTWthiYAhtDRdLcT1akEL+Zz+iqF7n+Y=;
        b=CeZmV9U9mY0Oe6yVcOFjNNmY65BZvOY2Fnkc/pjHFQg1zHtNG16yScBId/vX9hOscw
         EH5S1sKvF4QXAooRmyMpMEPFCEsyk3Daq5f55LOfFDJR1L4HZ/zMB2KkF/KHLUxDCwzy
         gt+d2CRUIeYmryw9CXM3xj+8cTnIUanFOt77PnaV03wqmDNAnW0Bq/U89hsoNeIEyhHS
         Mpf2ZgaPrYoQYj6ZK4ApCnbCMm/2UmLDkUlT9moQ8NoZZaVKpnrXZh2CaDTovEbamABk
         1z9UrvEFDhG3AnQC5/CPHshCikgRXj+6HzuILd4sP7FOVo51gd9PY0xMZ8KevVsXsGtF
         oiXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687528726; x=1690120726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uu4tO5xYJ0NxTWthiYAhtDRdLcT1akEL+Zz+iqF7n+Y=;
        b=J7AoshuwPgA5kgL4yIZhZA1VsnW8yFpxJTA7wgzObuMyMPTFWNIaV5/6leyDiyP83e
         0G/zfyF751jU+JZxbEpNw6rnhSDNNDSRFKwXUmSEfEhguxdRncjvxeUbDnpZP+AgluPu
         hLFGOKteev06qG/0AnvGjiVcR5yys7LIWJcE+ujO/xQ3g/Lbh03l535gQYS9HYATHVJh
         pPJciJcax6UeDGfgsTjUJX2PhBEyCkUY+STqMy2knLI4I2nHDWQHhe3eH5MYfETegf6+
         i/fdKNKaNRvmA9ht6vSxvQrivED6lyUOffeg0RP+9uL3cNj2S8+efVLvIilDvhYpgtSK
         sX/w==
X-Gm-Message-State: AC+VfDwzJMbVzZAzcnQj/zLqFqma5/aWa4p4OFXA2rEh24wOTx3yzV9X
        At/UT4n34Ycm/r0dwTWpzh0yruV3NJVPG2brlhI=
X-Google-Smtp-Source: ACHHUZ4q0llGNOWagJB/0UMXga9gIOHOPY1ju4BIwQ9uSliSZIX0muDGrenDifUdXjS8FPajrssCNg==
X-Received: by 2002:a2e:9b13:0:b0:2b4:6c47:6257 with SMTP id u19-20020a2e9b13000000b002b46c476257mr12923195lji.40.1687528726282;
        Fri, 23 Jun 2023 06:58:46 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 11-20020a05651c008b00b002ac7b0fc473sm1756869ljq.38.2023.06.23.06.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 06:58:45 -0700 (PDT)
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
Subject: [PATCH 1/7] drm/msm/dpu: drop the `id' field from DPU_HW_SUBBLK_INFO
Date:   Fri, 23 Jun 2023 16:58:38 +0300
Message-Id: <20230623135844.1113908-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230623135844.1113908-1-dmitry.baryshkov@linaro.org>
References: <20230623135844.1113908-1-dmitry.baryshkov@linaro.org>
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

The field `id' is not used for subblocks. The handling code usually
knows, which sub-block it is now looking at. Drop the field completely.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 24 ++++++++++---------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  2 --
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 3efa22429e5f..4a99144a5a85 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -254,10 +254,8 @@ static const uint32_t wb2_formats[] = {
 	.maxupscale = MAX_UPSCALE_RATIO, \
 	.smart_dma_priority = sdma_pri, \
 	.scaler_blk = {.name = STRCAT("sspp_scaler", num), \
-		.id = qseed_ver, \
 		.base = 0xa00, .len = 0xa0,}, \
 	.csc_blk = {.name = STRCAT("sspp_csc", num), \
-		.id = DPU_SSPP_CSC_10BIT, \
 		.base = 0x1a00, .len = 0x100,}, \
 	.format_list = plane_formats_yuv, \
 	.num_formats = ARRAY_SIZE(plane_formats_yuv), \
@@ -272,10 +270,8 @@ static const uint32_t wb2_formats[] = {
 	.maxupscale = MAX_UPSCALE_RATIO, \
 	.smart_dma_priority = sdma_pri, \
 	.scaler_blk = {.name = STRCAT("sspp_scaler", num), \
-		.id = qseed_ver, \
 		.base = 0xa00, .len = 0xa0,}, \
 	.csc_blk = {.name = STRCAT("sspp_csc", num), \
-		.id = DPU_SSPP_CSC_10BIT, \
 		.base = 0x1a00, .len = 0x100,}, \
 	.format_list = plane_formats_yuv, \
 	.num_formats = ARRAY_SIZE(plane_formats_yuv), \
@@ -417,12 +413,14 @@ static const struct dpu_lm_sub_blks qcm2290_lm_sblk = {
  * DSPP sub blocks config
  *************************************************************/
 static const struct dpu_dspp_sub_blks msm8998_dspp_sblk = {
-	.pcc = {.id = DPU_DSPP_PCC, .base = 0x1700,
+	.pcc = {
+		.base = 0x1700,
 		.len = 0x90, .version = 0x10007},
 };
 
 static const struct dpu_dspp_sub_blks sm8150_dspp_sblk = {
-	.pcc = {.id = DPU_DSPP_PCC, .base = 0x1700,
+	.pcc = {
+		.base = 0x1700,
 		.len = 0x90, .version = 0x40000},
 };
 
@@ -430,20 +428,24 @@ static const struct dpu_dspp_sub_blks sm8150_dspp_sblk = {
  * PINGPONG sub blocks config
  *************************************************************/
 static const struct dpu_pingpong_sub_blks sdm845_pp_sblk_te = {
-	.te2 = {.id = DPU_PINGPONG_TE2, .base = 0x2000, .len = 0x0,
+	.te2 = {
+		.base = 0x2000, .len = 0x0,
 		.version = 0x1},
-	.dither = {.id = DPU_PINGPONG_DITHER, .base = 0x30e0,
+	.dither = {
+		.base = 0x30e0,
 		.len = 0x20, .version = 0x10000},
 };
 
 static const struct dpu_pingpong_sub_blks sdm845_pp_sblk = {
-	.dither = {.id = DPU_PINGPONG_DITHER, .base = 0x30e0,
+	.dither = {
+		.base = 0x30e0,
 		.len = 0x20, .version = 0x10000},
 };
 
 static const struct dpu_pingpong_sub_blks sc7280_pp_sblk = {
-	.dither = {.id = DPU_PINGPONG_DITHER, .base = 0xe0,
-	.len = 0x20, .version = 0x20000},
+	.dither = {
+		.base = 0xe0,
+		.len = 0x20, .version = 0x20000},
 };
 
 /*************************************************************
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 3b816e36d12d..bf7a525206ee 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -274,14 +274,12 @@ enum {
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

