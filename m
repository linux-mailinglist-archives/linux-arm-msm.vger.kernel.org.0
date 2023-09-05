Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E16727926CB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Sep 2023 18:33:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238400AbjIEQGH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Sep 2023 12:06:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244678AbjIEBZf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Sep 2023 21:25:35 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6270ECC6
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Sep 2023 18:25:30 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-500b66f8b27so3231203e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Sep 2023 18:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693877128; x=1694481928; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sXmSm3Uq9OyXvN4akSGA0ddgkXH0TA5WhIg2pP+OmsE=;
        b=T2x3zmXQ9fs+ZGLzpQ7iGNvpm1j+OJ6xSm41SLthmUHM3bsrLr+zrixEnVsX8IjbCx
         PVxMf1KcBkA8YocFdy9cDrjeey3MLPMYy3o4/8zSxIaTAq43FrgeLBkEyvmnSSnHlaFz
         EMr3dWGuoLz0Y2sUmMlK1HlcLZQG06Zk+Thwrvg3/345odPtC758RmYyGL9rzPK8p0fT
         0g/3gfZJy975mR/WO6qHaHbbpf+sPzO8dI+bArdiA7lK6PfHS0+NfYAp/77oFN7yOx6B
         UZXlpucOT+T6WEvqB8ay5h3v6X9WRIHVT4STmK7tNPorYflTya4q4ZkzfHpJDEkXB7bK
         spaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693877128; x=1694481928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sXmSm3Uq9OyXvN4akSGA0ddgkXH0TA5WhIg2pP+OmsE=;
        b=XNcvhUPKSgCNXHeZPxcx/yN3Y9x+795hIYYIbOdwyZ3S8JVSeJSil1T5xuDzfzHMKd
         +Ypejso/DogTexXxY0ljOdSdkSWXfMYpdpHpvsfBuQfEDHYpCZ9BUxxixGSIcqmVVcBT
         zwJ77HqK2z+FZ9s90RiUcKm8lQtWewnB61TUFf0M9r/ZZT7HokLTK4cj8SpF7z1iniEm
         rg0JWds4VfNVWqW+gSXt5AlW3eFMEqwKqFhQaYOKKLLTEvE0E8BLQV7Pi7zu64zpoIy8
         QZs215fdxQ2rKHcFU+z26Rk4kJFzZXnCbcLIHQEFLn2T7JXOI5SQt/cF62poTELOtixw
         DFSg==
X-Gm-Message-State: AOJu0YyR7xjrbmXrhaQ3Bd86gE6QU+Yk8BAWwEtfmyRWVUS/Cs4DxlDZ
        8rXf4fabQ0SXRaEF5FtSSnIq7w==
X-Google-Smtp-Source: AGHT+IGrLgN6WawP2qKOhjPFQbL3WYROukr94DDRNQKHKWwC7p2bNSt2GNGRhlzSOYVj9P+m4G5ecA==
X-Received: by 2002:a19:ca4e:0:b0:4fb:9050:1d92 with SMTP id h14-20020a19ca4e000000b004fb90501d92mr6949620lfj.51.1693877128672;
        Mon, 04 Sep 2023 18:25:28 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id v25-20020ac25599000000b004ff70c76208sm2062369lfg.84.2023.09.04.18.25.27
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
Subject: [PATCH v3 1/8] drm/msm/dpu: populate SSPP scaler block version
Date:   Tue,  5 Sep 2023 04:25:19 +0300
Message-Id: <20230905012526.3010798-2-dmitry.baryshkov@linaro.org>
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
 4 files changed, 85 insertions(+), 34 deletions(-)

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
 
-- 
2.39.2

