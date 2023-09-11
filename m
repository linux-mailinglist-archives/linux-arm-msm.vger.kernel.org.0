Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B6BB79C140
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Sep 2023 02:45:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231902AbjILApR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Sep 2023 20:45:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231609AbjILAo7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Sep 2023 20:44:59 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 189BA188311
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Sep 2023 17:40:21 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-9aa2c6f0806so194252066b.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Sep 2023 17:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694479148; x=1695083948; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nCPkyIzCpIXuMOZVeZfw9KVbCD0IwFfn/z1n85Lz06o=;
        b=vPvaxQeXxZ36PC5jHylBcExOohCmlFtGj6aMZK8dzlWL3kprgdZfeczik1/LduUfoT
         /KnjbBjSasp0TTPyrajRQJNTdHmfKZes8c+0b9cpQj0djPBCEUoLzYnydk59BToZGW1O
         VL+VDWrXMBuNzUG/XavCF+MMRzQCt3SfsuhQ79/Me5EIf+mT7pMPQF3skpyMNtjqT3aA
         ELe1tf6nvKQ9RjfozErC5l6ucdXrI/EVJJwCn25aGx5ne450KbUOSpJtRE+U+9frT/Z5
         2VOttMyKM5CnovcgiyOJy1Z0jgvbwQXJwSkzTexH+tqfqg939d3KOBWFLsmJzi3GV9Q4
         zJqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694479148; x=1695083948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nCPkyIzCpIXuMOZVeZfw9KVbCD0IwFfn/z1n85Lz06o=;
        b=VC41NIVZ/0xBWUirMTjcDjLShaZZ2rmlNwFnZ+07IATNTcESvLRwJicITF1hvBfJf+
         fR9IHY29akuUWHeCfJVzSgtoE4NBoZiPQModEp+myJi8uf5RPK8IXhLW9zQq2Oxq2z4u
         N2t+ZhspEJXMM0A0EzpIcJQqx0c9SOqkxffpzFpQLT2YllZGfXuhf4kz8EocCjT84hl+
         VI0Pexok5T/9JWLiRlFMsL0BwZHvHKsn1E8gBaS2O5sghBXWyrp5ihPWADYm8AAabQMz
         1z+9TIg9JY5jiLtoJe3IUGMF8ZpcDR0zj6ywRd9icrala95K2bzlTcKg5fvEdga7gEuE
         tImQ==
X-Gm-Message-State: AOJu0Yy8kKvoHkTG0wgJqPnuuwD/Qkfbmwg1+C/kL2xjjdb+0fAhAD5k
        LtKXYRA4s3Ae88VWjXPbTD6JW+BwJAPndZXJMdY=
X-Google-Smtp-Source: AGHT+IGySeemPINcuQBm7xz8UNZhHHNjCoNHNPiNils2nWbEJ/FpbjYza72O2ZjcXIXHv1q7eg4fRQ==
X-Received: by 2002:ac2:446f:0:b0:500:a08e:2fcf with SMTP id y15-20020ac2446f000000b00500a08e2fcfmr7625001lfl.47.1694468723205;
        Mon, 11 Sep 2023 14:45:23 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id b5-20020a0565120b8500b004ff9bfda9d6sm1168804lfv.212.2023.09.11.14.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 14:45:22 -0700 (PDT)
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
Subject: [PATCH v4 1/9] drm/msm/dpu: populate SSPP scaler block version
Date:   Tue, 12 Sep 2023 00:45:13 +0300
Message-Id: <20230911214521.787453-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230911214521.787453-1-dmitry.baryshkov@linaro.org>
References: <20230911214521.787453-1-dmitry.baryshkov@linaro.org>
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

The function _dpu_hw_sspp_setup_scaler3() passes and
dpu_hw_setup_scaler3() uses scaler_blk.version to determine in which way
the scaler (QSEED3) block should be programmed. However up to now we
were not setting this field. Set it now, splitting the vig_sblk data
which has different version fields.

Reported-by: Marijn Suijten <marijn.suijten@somainline.org>
Fixes: 9b6f4fedaac2 ("drm/msm/dpu: Add SM6125 support")
Fixes: 27f0df03f3ff ("drm/msm/dpu: Add SM6375 support")
Fixes: 3186acba5cdc ("drm/msm/dpu: Add SM6350 support")
Fixes: efcd0107727c ("drm/msm/dpu: add support for SM8550")
Fixes: 4a352c2fc15a ("drm/msm/dpu: Introduce SC8280XP")
Fixes: 0e91bcbb0016 ("drm/msm/dpu: Add SM8350 to hw catalog")
Fixes: 100d7ef6995d ("drm/msm/dpu: add support for SM8450")
Fixes: 3581b7062cec ("drm/msm/disp/dpu1: add support for display on SM6115")
Fixes: dabfdd89eaa9 ("drm/msm/disp/dpu1: add inline rotation support for sc7280")
Fixes: f3af2d6ee9ab ("drm/msm/dpu: Add SC8180x to hw catalog")
Fixes: 94391a14fc27 ("drm/msm/dpu1: Add MSM8998 to hw catalog")
Fixes: af776a3e1c30 ("drm/msm/dpu: add SM8250 to hw catalog")
Fixes: 386fced3f76f ("drm/msm/dpu: add SM8150 to hw catalog")
Fixes: b75ab05a3479 ("msm:disp:dpu1: add scaler support on SC7180 display")
Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    |  8 +-
 .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   |  8 +-
 .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    |  8 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 95 ++++++++++++++-----
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  3 +-
 5 files changed, 87 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index 99acaf917e43..f0c3804f4258 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -77,7 +77,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x1f0,
 		.features = VIG_SDM845_MASK,
-		.sblk = &sdm845_vig_sblk_0,
+		.sblk = &sm8150_vig_sblk_0,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG0,
@@ -85,7 +85,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
 		.name = "sspp_1", .id = SSPP_VIG1,
 		.base = 0x6000, .len = 0x1f0,
 		.features = VIG_SDM845_MASK,
-		.sblk = &sdm845_vig_sblk_1,
+		.sblk = &sm8150_vig_sblk_1,
 		.xin_id = 4,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG1,
@@ -93,7 +93,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
 		.name = "sspp_2", .id = SSPP_VIG2,
 		.base = 0x8000, .len = 0x1f0,
 		.features = VIG_SDM845_MASK,
-		.sblk = &sdm845_vig_sblk_2,
+		.sblk = &sm8150_vig_sblk_2,
 		.xin_id = 8,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG2,
@@ -101,7 +101,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
 		.name = "sspp_3", .id = SSPP_VIG3,
 		.base = 0xa000, .len = 0x1f0,
 		.features = VIG_SDM845_MASK,
-		.sblk = &sdm845_vig_sblk_3,
+		.sblk = &sm8150_vig_sblk_3,
 		.xin_id = 12,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG3,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index f3de21025ca7..3ec954722a8e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -76,7 +76,7 @@ static const struct dpu_sspp_cfg sc8180x_sspp[] = {
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x1f0,
 		.features = VIG_SDM845_MASK,
-		.sblk = &sdm845_vig_sblk_0,
+		.sblk = &sm8150_vig_sblk_0,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG0,
@@ -84,7 +84,7 @@ static const struct dpu_sspp_cfg sc8180x_sspp[] = {
 		.name = "sspp_1", .id = SSPP_VIG1,
 		.base = 0x6000, .len = 0x1f0,
 		.features = VIG_SDM845_MASK,
-		.sblk = &sdm845_vig_sblk_1,
+		.sblk = &sm8150_vig_sblk_1,
 		.xin_id = 4,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG1,
@@ -92,7 +92,7 @@ static const struct dpu_sspp_cfg sc8180x_sspp[] = {
 		.name = "sspp_2", .id = SSPP_VIG2,
 		.base = 0x8000, .len = 0x1f0,
 		.features = VIG_SDM845_MASK,
-		.sblk = &sdm845_vig_sblk_2,
+		.sblk = &sm8150_vig_sblk_2,
 		.xin_id = 8,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG2,
@@ -100,7 +100,7 @@ static const struct dpu_sspp_cfg sc8180x_sspp[] = {
 		.name = "sspp_3", .id = SSPP_VIG3,
 		.base = 0xa000, .len = 0x1f0,
 		.features = VIG_SDM845_MASK,
-		.sblk = &sdm845_vig_sblk_3,
+		.sblk = &sm8150_vig_sblk_3,
 		.xin_id = 12,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG3,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index 1b12178dfbca..3aed290a4111 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -76,7 +76,7 @@ static const struct dpu_sspp_cfg sm8450_sspp[] = {
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x32c,
 		.features = VIG_SC7180_MASK,
-		.sblk = &sm8250_vig_sblk_0,
+		.sblk = &sm8450_vig_sblk_0,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG0,
@@ -84,7 +84,7 @@ static const struct dpu_sspp_cfg sm8450_sspp[] = {
 		.name = "sspp_1", .id = SSPP_VIG1,
 		.base = 0x6000, .len = 0x32c,
 		.features = VIG_SC7180_MASK,
-		.sblk = &sm8250_vig_sblk_1,
+		.sblk = &sm8450_vig_sblk_1,
 		.xin_id = 4,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG1,
@@ -92,7 +92,7 @@ static const struct dpu_sspp_cfg sm8450_sspp[] = {
 		.name = "sspp_2", .id = SSPP_VIG2,
 		.base = 0x8000, .len = 0x32c,
 		.features = VIG_SC7180_MASK,
-		.sblk = &sm8250_vig_sblk_2,
+		.sblk = &sm8450_vig_sblk_2,
 		.xin_id = 8,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG2,
@@ -100,7 +100,7 @@ static const struct dpu_sspp_cfg sm8450_sspp[] = {
 		.name = "sspp_3", .id = SSPP_VIG3,
 		.base = 0xa000, .len = 0x32c,
 		.features = VIG_SC7180_MASK,
-		.sblk = &sm8250_vig_sblk_3,
+		.sblk = &sm8450_vig_sblk_3,
 		.xin_id = 12,
 		.type = SSPP_TYPE_VIG,
 		.clk_ctrl = DPU_CLK_CTRL_VIG3,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 713dfc079718..77d09f961d86 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -250,14 +250,17 @@ static const uint32_t wb2_formats[] = {
  * SSPP sub blocks config
  *************************************************************/
 
+#define SSPP_SCALER_VER(maj, min) (((maj) << 16) | (min))
+
 /* SSPP common configuration */
-#define _VIG_SBLK(sdma_pri, qseed_ver) \
+#define _VIG_SBLK(sdma_pri, qseed_ver, scaler_ver) \
 	{ \
 	.maxdwnscale = MAX_DOWNSCALE_RATIO, \
 	.maxupscale = MAX_UPSCALE_RATIO, \
 	.smart_dma_priority = sdma_pri, \
 	.scaler_blk = {.name = "scaler", \
 		.id = qseed_ver, \
+		.version = scaler_ver, \
 		.base = 0xa00, .len = 0xa0,}, \
 	.csc_blk = {.name = "csc", \
 		.id = DPU_SSPP_CSC_10BIT, \
@@ -269,13 +272,14 @@ static const uint32_t wb2_formats[] = {
 	.rotation_cfg = NULL, \
 	}
 
-#define _VIG_SBLK_ROT(sdma_pri, qseed_ver, rot_cfg) \
+#define _VIG_SBLK_ROT(sdma_pri, qseed_ver, scaler_ver, rot_cfg) \
 	{ \
 	.maxdwnscale = MAX_DOWNSCALE_RATIO, \
 	.maxupscale = MAX_UPSCALE_RATIO, \
 	.smart_dma_priority = sdma_pri, \
 	.scaler_blk = {.name = "scaler", \
 		.id = qseed_ver, \
+		.version = scaler_ver, \
 		.base = 0xa00, .len = 0xa0,}, \
 	.csc_blk = {.name = "csc", \
 		.id = DPU_SSPP_CSC_10BIT, \
@@ -299,13 +303,17 @@ static const uint32_t wb2_formats[] = {
 	}
 
 static const struct dpu_sspp_sub_blks msm8998_vig_sblk_0 =
-				_VIG_SBLK(0, DPU_SSPP_SCALER_QSEED3);
+				_VIG_SBLK(0, DPU_SSPP_SCALER_QSEED3,
+					  SSPP_SCALER_VER(1, 2));
 static const struct dpu_sspp_sub_blks msm8998_vig_sblk_1 =
-				_VIG_SBLK(0, DPU_SSPP_SCALER_QSEED3);
+				_VIG_SBLK(0, DPU_SSPP_SCALER_QSEED3,
+					  SSPP_SCALER_VER(1, 2));
 static const struct dpu_sspp_sub_blks msm8998_vig_sblk_2 =
-				_VIG_SBLK(0, DPU_SSPP_SCALER_QSEED3);
+				_VIG_SBLK(0, DPU_SSPP_SCALER_QSEED3,
+					  SSPP_SCALER_VER(1, 2));
 static const struct dpu_sspp_sub_blks msm8998_vig_sblk_3 =
-				_VIG_SBLK(0, DPU_SSPP_SCALER_QSEED3);
+				_VIG_SBLK(0, DPU_SSPP_SCALER_QSEED3,
+					  SSPP_SCALER_VER(1, 2));
 
 static const struct dpu_rotation_cfg dpu_rot_sc7280_cfg_v2 = {
 	.rot_maxheight = 1088,
@@ -314,13 +322,30 @@ static const struct dpu_rotation_cfg dpu_rot_sc7280_cfg_v2 = {
 };
 
 static const struct dpu_sspp_sub_blks sdm845_vig_sblk_0 =
-				_VIG_SBLK(5, DPU_SSPP_SCALER_QSEED3);
+				_VIG_SBLK(5, DPU_SSPP_SCALER_QSEED3,
+					  SSPP_SCALER_VER(1, 3));
 static const struct dpu_sspp_sub_blks sdm845_vig_sblk_1 =
-				_VIG_SBLK(6, DPU_SSPP_SCALER_QSEED3);
+				_VIG_SBLK(6, DPU_SSPP_SCALER_QSEED3,
+					  SSPP_SCALER_VER(1, 3));
 static const struct dpu_sspp_sub_blks sdm845_vig_sblk_2 =
-				_VIG_SBLK(7, DPU_SSPP_SCALER_QSEED3);
+				_VIG_SBLK(7, DPU_SSPP_SCALER_QSEED3,
+					  SSPP_SCALER_VER(1, 3));
 static const struct dpu_sspp_sub_blks sdm845_vig_sblk_3 =
-				_VIG_SBLK(8, DPU_SSPP_SCALER_QSEED3);
+				_VIG_SBLK(8, DPU_SSPP_SCALER_QSEED3,
+					  SSPP_SCALER_VER(1, 3));
+
+static const struct dpu_sspp_sub_blks sm8150_vig_sblk_0 =
+				_VIG_SBLK(5, DPU_SSPP_SCALER_QSEED3,
+					  SSPP_SCALER_VER(1, 4));
+static const struct dpu_sspp_sub_blks sm8150_vig_sblk_1 =
+				_VIG_SBLK(6, DPU_SSPP_SCALER_QSEED3,
+					  SSPP_SCALER_VER(1, 4));
+static const struct dpu_sspp_sub_blks sm8150_vig_sblk_2 =
+				_VIG_SBLK(7, DPU_SSPP_SCALER_QSEED3,
+					  SSPP_SCALER_VER(1, 4));
+static const struct dpu_sspp_sub_blks sm8150_vig_sblk_3 =
+				_VIG_SBLK(8, DPU_SSPP_SCALER_QSEED3,
+					  SSPP_SCALER_VER(1, 4));
 
 static const struct dpu_sspp_sub_blks sdm845_dma_sblk_0 = _DMA_SBLK(1);
 static const struct dpu_sspp_sub_blks sdm845_dma_sblk_1 = _DMA_SBLK(2);
@@ -328,34 +353,60 @@ static const struct dpu_sspp_sub_blks sdm845_dma_sblk_2 = _DMA_SBLK(3);
 static const struct dpu_sspp_sub_blks sdm845_dma_sblk_3 = _DMA_SBLK(4);
 
 static const struct dpu_sspp_sub_blks sc7180_vig_sblk_0 =
-				_VIG_SBLK(4, DPU_SSPP_SCALER_QSEED4);
+				_VIG_SBLK(4, DPU_SSPP_SCALER_QSEED4,
+					  SSPP_SCALER_VER(3, 0));
 
 static const struct dpu_sspp_sub_blks sc7280_vig_sblk_0 =
-			_VIG_SBLK_ROT(4, DPU_SSPP_SCALER_QSEED4, &dpu_rot_sc7280_cfg_v2);
+			_VIG_SBLK_ROT(4, DPU_SSPP_SCALER_QSEED4,
+				      SSPP_SCALER_VER(3, 0),
+				      &dpu_rot_sc7280_cfg_v2);
 
 static const struct dpu_sspp_sub_blks sm6115_vig_sblk_0 =
-				_VIG_SBLK(2, DPU_SSPP_SCALER_QSEED4);
+				_VIG_SBLK(2, DPU_SSPP_SCALER_QSEED4,
+					  SSPP_SCALER_VER(3, 0));
 
 static const struct dpu_sspp_sub_blks sm6125_vig_sblk_0 =
-				_VIG_SBLK(3, DPU_SSPP_SCALER_QSEED3LITE);
+				_VIG_SBLK(3, DPU_SSPP_SCALER_QSEED3LITE,
+					  SSPP_SCALER_VER(2, 4));
 
 static const struct dpu_sspp_sub_blks sm8250_vig_sblk_0 =
-				_VIG_SBLK(5, DPU_SSPP_SCALER_QSEED4);
+				_VIG_SBLK(5, DPU_SSPP_SCALER_QSEED4,
+					  SSPP_SCALER_VER(3, 0));
 static const struct dpu_sspp_sub_blks sm8250_vig_sblk_1 =
-				_VIG_SBLK(6, DPU_SSPP_SCALER_QSEED4);
+				_VIG_SBLK(6, DPU_SSPP_SCALER_QSEED4,
+					  SSPP_SCALER_VER(3, 0));
 static const struct dpu_sspp_sub_blks sm8250_vig_sblk_2 =
-				_VIG_SBLK(7, DPU_SSPP_SCALER_QSEED4);
+				_VIG_SBLK(7, DPU_SSPP_SCALER_QSEED4,
+					  SSPP_SCALER_VER(3, 0));
 static const struct dpu_sspp_sub_blks sm8250_vig_sblk_3 =
-				_VIG_SBLK(8, DPU_SSPP_SCALER_QSEED4);
+				_VIG_SBLK(8, DPU_SSPP_SCALER_QSEED4,
+					  SSPP_SCALER_VER(3, 0));
+
+static const struct dpu_sspp_sub_blks sm8450_vig_sblk_0 =
+				_VIG_SBLK(5, DPU_SSPP_SCALER_QSEED4,
+					  SSPP_SCALER_VER(3, 1));
+static const struct dpu_sspp_sub_blks sm8450_vig_sblk_1 =
+				_VIG_SBLK(6, DPU_SSPP_SCALER_QSEED4,
+					  SSPP_SCALER_VER(3, 1));
+static const struct dpu_sspp_sub_blks sm8450_vig_sblk_2 =
+				_VIG_SBLK(7, DPU_SSPP_SCALER_QSEED4,
+					  SSPP_SCALER_VER(3, 1));
+static const struct dpu_sspp_sub_blks sm8450_vig_sblk_3 =
+				_VIG_SBLK(8, DPU_SSPP_SCALER_QSEED4,
+					  SSPP_SCALER_VER(3, 1));
 
 static const struct dpu_sspp_sub_blks sm8550_vig_sblk_0 =
-				_VIG_SBLK(7, DPU_SSPP_SCALER_QSEED4);
+				_VIG_SBLK(7, DPU_SSPP_SCALER_QSEED4,
+					  SSPP_SCALER_VER(3, 2));
 static const struct dpu_sspp_sub_blks sm8550_vig_sblk_1 =
-				_VIG_SBLK(8, DPU_SSPP_SCALER_QSEED4);
+				_VIG_SBLK(8, DPU_SSPP_SCALER_QSEED4,
+					  SSPP_SCALER_VER(3, 2));
 static const struct dpu_sspp_sub_blks sm8550_vig_sblk_2 =
-				_VIG_SBLK(9, DPU_SSPP_SCALER_QSEED4);
+				_VIG_SBLK(9, DPU_SSPP_SCALER_QSEED4,
+					  SSPP_SCALER_VER(3, 2));
 static const struct dpu_sspp_sub_blks sm8550_vig_sblk_3 =
-				_VIG_SBLK(10, DPU_SSPP_SCALER_QSEED4);
+				_VIG_SBLK(10, DPU_SSPP_SCALER_QSEED4,
+					  SSPP_SCALER_VER(3, 2));
 static const struct dpu_sspp_sub_blks sm8550_dma_sblk_4 = _DMA_SBLK(5);
 static const struct dpu_sspp_sub_blks sm8550_dma_sblk_5 = _DMA_SBLK(6);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 6c9634209e9f..3f82d84bd1c9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -269,7 +269,8 @@ enum {
 /**
  * struct dpu_scaler_blk: Scaler information
  * @info:   HW register and features supported by this sub-blk
- * @version: qseed block revision
+ * @version: qseed block revision, on QSEED3+ platforms this is the value of
+ *           scaler_blk.base + QSEED3_HW_VERSION registers.
  */
 struct dpu_scaler_blk {
 	DPU_HW_SUBBLK_INFO;
-- 
2.39.2

