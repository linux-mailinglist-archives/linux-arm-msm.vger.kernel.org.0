Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B5537BB8CA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Oct 2023 15:15:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232358AbjJFNPR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Oct 2023 09:15:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232362AbjJFNPP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Oct 2023 09:15:15 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC27583
        for <linux-arm-msm@vger.kernel.org>; Fri,  6 Oct 2023 06:15:12 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-504a7f9204eso2665669e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Oct 2023 06:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696598111; x=1697202911; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QHfdu4MrabZvn+Jjy73POHdJXT6r6n7+Q0QS6MEZh30=;
        b=iyzIhnOnVsvjjOgBiXy/8V8ZifKer/hmj+7i1YDAjcJZ8ZK0IsuxR8UlxyCOBFMCc4
         l66AFDHy7kGY1cHirvFHv3t7ZWqtk1so8fheC1d80ZHduS/TFNspOA+NmjBj8dfi36n9
         aTqFZ/QrxmWAOdTGR6NElkg2w1khz9aiV7ZfJ5aezWu8sz54TIvBv0tdMGZvedzkqX/X
         pVfuTFZZmhyJ6AjELUD9YoTghHPgXd0/dltcz73W0LAhlwtFLj9u3XPxiHz1wyi0KKnp
         gpG3P0/+D7zLyf4d3MJBrdwHVU1SNl8VN0MW9emQQk7uAZg2+unChqX9tl/5K/SEFgOy
         kPnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696598111; x=1697202911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QHfdu4MrabZvn+Jjy73POHdJXT6r6n7+Q0QS6MEZh30=;
        b=iFX6+UptVjqvCFtZyvYOkjiYTzZtAfeWbPgWYQFE7AKTf20ohef4ttqdZTBu2/ORXx
         ki2c4EHMKZbDpYbr6nX2eHDcC70DmojR1b/CoaL2MxTK+fI6PgI6a/euBao4oIqZGO5b
         9Ibqqw1Uwb8X/DSFUNATpqMOxqkXvii+0lwzPpptEFyCKYsSzk9i+d1lxBDbodlDcv57
         yP+g2elaRAvrm2OUXyRCiiAFCrtrUVqcnpLx3SIpmDvWjImyd33+Ap39nHgDsWHFyjUW
         6BeBUW2AZI4DMV++sDQ99999+lTdniXjQw8gis1KhUJTMwF83jL8DxxIQe4/Ej2w9uBV
         9RPg==
X-Gm-Message-State: AOJu0Ywe0q5SFr2Bh9R/0ASloq4B5I42F0T4/cV/1QSvctqr4ELO+5cq
        /6ciDvzG7XqRaA1GcfrkEVEo1A==
X-Google-Smtp-Source: AGHT+IE3VwvUvNIi5ZbW289VFq27v7KMOV7j0aSH4XhbxHBb+g+3pJyw4wNBA6oqUX9RKni4cmzvRA==
X-Received: by 2002:a05:6512:208d:b0:500:bfcb:1bf9 with SMTP id t13-20020a056512208d00b00500bfcb1bf9mr6772281lfr.67.1696598110909;
        Fri, 06 Oct 2023 06:15:10 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id g9-20020a19ee09000000b004fbb011c9bcsm301285lfb.161.2023.10.06.06.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 06:15:10 -0700 (PDT)
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
Subject: [PATCH v6 09/10] drm/msm/dpu: merge DPU_SSPP_SCALER_QSEED3, QSEED3LITE, QSEED4
Date:   Fri,  6 Oct 2023 16:14:49 +0300
Message-Id: <20231006131450.2436688-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231006131450.2436688-1-dmitry.baryshkov@linaro.org>
References: <20231006131450.2436688-1-dmitry.baryshkov@linaro.org>
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

Three different features, DPU_SSPP_SCALER_QSEED3, QSEED3LITE and QSEED4
are all related to different versions of the same HW scaling block.
Corresponding driver parts use scaler_blk.version to identify the
correct way to program the hardware. In order to simplify the driver
codepath, merge these three feature bits.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 6 +-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c    | 9 ++-------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c      | 3 +--
 4 files changed, 6 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 32c396abf877..eb867c8123d7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -31,10 +31,10 @@
 	(VIG_SDM845_MASK | BIT(DPU_SSPP_SMART_DMA_V2))
 
 #define VIG_SC7180_MASK \
-	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED4))
+	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3))
 
 #define VIG_SM6125_MASK \
-	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3LITE))
+	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3))
 
 #define VIG_SC7180_MASK_SDMA \
 	(VIG_SC7180_MASK | BIT(DPU_SSPP_SMART_DMA_V2))
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index fc5027b0123a..ba262b3f0bdc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -51,9 +51,7 @@ enum {
 /**
  * SSPP sub-blocks/features
  * @DPU_SSPP_SCALER_QSEED2,  QSEED2 algorithm support
- * @DPU_SSPP_SCALER_QSEED3,  QSEED3 alogorithm support
- * @DPU_SSPP_SCALER_QSEED3LITE,  QSEED3 Lite alogorithm support
- * @DPU_SSPP_SCALER_QSEED4,  QSEED4 algorithm support
+ * @DPU_SSPP_SCALER_QSEED3,  QSEED3 alogorithm support (also QSEED3LITE and QSEED4)
  * @DPU_SSPP_SCALER_RGB,     RGB Scaler, supported by RGB pipes
  * @DPU_SSPP_CSC,            Support of Color space converion
  * @DPU_SSPP_CSC_10BIT,      Support of 10-bit Color space conversion
@@ -72,8 +70,6 @@ enum {
 enum {
 	DPU_SSPP_SCALER_QSEED2 = 0x1,
 	DPU_SSPP_SCALER_QSEED3,
-	DPU_SSPP_SCALER_QSEED3LITE,
-	DPU_SSPP_SCALER_QSEED4,
 	DPU_SSPP_SCALER_RGB,
 	DPU_SSPP_CSC,
 	DPU_SSPP_CSC_10BIT,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index 7e9c87088e17..d1b70cf72eef 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -594,9 +594,7 @@ static void _setup_layer_ops(struct dpu_hw_sspp *c,
 		test_bit(DPU_SSPP_SMART_DMA_V2, &c->cap->features))
 		c->ops.setup_multirect = dpu_hw_sspp_setup_multirect;
 
-	if (test_bit(DPU_SSPP_SCALER_QSEED3, &features) ||
-			test_bit(DPU_SSPP_SCALER_QSEED3LITE, &features) ||
-			test_bit(DPU_SSPP_SCALER_QSEED4, &features))
+	if (test_bit(DPU_SSPP_SCALER_QSEED3, &features))
 		c->ops.setup_scaler = _dpu_hw_sspp_setup_scaler3;
 
 	if (test_bit(DPU_SSPP_CDP, &features))
@@ -629,10 +627,7 @@ int _dpu_hw_sspp_init_debugfs(struct dpu_hw_sspp *hw_pipe, struct dpu_kms *kms,
 			cfg->len,
 			kms);
 
-	if (cfg->features & BIT(DPU_SSPP_SCALER_QSEED3) ||
-			cfg->features & BIT(DPU_SSPP_SCALER_QSEED3LITE) ||
-			cfg->features & BIT(DPU_SSPP_SCALER_QSEED2) ||
-			cfg->features & BIT(DPU_SSPP_SCALER_QSEED4))
+	if (sblk->scaler_blk.len)
 		dpu_debugfs_create_regset32("scaler_blk", 0400,
 				debugfs_root,
 				sblk->scaler_blk.base + cfg->base,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 43135894263c..ba3ee4ba25b3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -438,8 +438,7 @@ static void _dpu_plane_setup_scaler3(struct dpu_hw_sspp *pipe_hw,
 			scale_cfg->src_height[i] /= chroma_subsmpl_v;
 		}
 
-		if (pipe_hw->cap->features &
-			BIT(DPU_SSPP_SCALER_QSEED4)) {
+		if (pipe_hw->cap->sblk->scaler_blk.version >= 0x3000) {
 			scale_cfg->preload_x[i] = DPU_QSEED4_DEFAULT_PRELOAD_H;
 			scale_cfg->preload_y[i] = DPU_QSEED4_DEFAULT_PRELOAD_V;
 		} else {
-- 
2.39.2

