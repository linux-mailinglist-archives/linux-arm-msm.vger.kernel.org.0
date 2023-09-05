Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C792D792796
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Sep 2023 18:37:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238739AbjIEQGs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Sep 2023 12:06:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244690AbjIEBZi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Sep 2023 21:25:38 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01895CC8
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Sep 2023 18:25:35 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2b962535808so30003461fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Sep 2023 18:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693877133; x=1694481933; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Rm3Y5KAtKu5ohVxEVzs5WePQAFUL7jzU8IZiFS6eHM=;
        b=Jw4NsrrGzS/IJ9J9DTlST7Z2WdSP2Ygd9Zfs4tIUCcrJvd5wyFOvc118Jdks9JonuZ
         YoSgIvGmCHiazwIQq3A3Pn++LusEmJ/bPhWdEoi21kcV013TalrfqHJXDxzftY371P92
         4tomedPaH++svN9V2VX9D7v7aGzLxkdTaYzzvA38FnUOnVPokf20Rd/2AVIadU8Ygo7e
         6C6Js2fCTzWSvBnjjBW7Klj3ITd9N7+OetKFxvShOCTCCvC+PIAv/zquHgrK/E4Z4kZn
         mgI21jUqyASqU3ImUldOiWY+RNF1d064BomwkWtVGQgyM2UG+uG8PchXXSfPa+Pe4VzG
         qXKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693877133; x=1694481933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Rm3Y5KAtKu5ohVxEVzs5WePQAFUL7jzU8IZiFS6eHM=;
        b=MmVmgOmQM4MIR4Aoem7Szsgc2eDE8iCJJ77rneGhCOFOWkYHpKp6eLn2DSboKJTG8L
         7Nbt5id7YRBUKACG94rNDZHk+S+KRGqoS1eRx+baNvxSuTyiTQCRwKWExacEKIPz9hNC
         CiJD/1cJTysP153+iL+Hv2Pz+fo36Sc5sIT05q4UjUNCcYQTPFrSZR1O7YWZy0K9JZnS
         90ZrTmO3NKv+js8nP5Z6b231YKB1QWNGvh8M7xs7JZyarenF5crvoSnhF9VQZX+/77th
         ZIu0YX995iQhAl2GWT/ftuSm67SIJMjzyYsggmxFihqHOe5+AvIpZdmW4a64v2DGpdqY
         TKWA==
X-Gm-Message-State: AOJu0YztvKOhaAub3INM3+TJOGzJF+9OA6OhXEJrp6XJ+PquejjKoWCM
        HSYFQygAhUjIAGb+P4GF2heuRw==
X-Google-Smtp-Source: AGHT+IFISVrODvciD3wTkeSF8eCILfBUiFH6C734EjjBz5hFOMj/JPaBvd/KoMHYhMSBh8gV3ssqAw==
X-Received: by 2002:a05:6512:3e1a:b0:500:9214:b308 with SMTP id i26-20020a0565123e1a00b005009214b308mr8473224lfv.65.1693877133308;
        Mon, 04 Sep 2023 18:25:33 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id v25-20020ac25599000000b004ff70c76208sm2062369lfg.84.2023.09.04.18.25.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Sep 2023 18:25:32 -0700 (PDT)
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
Subject: [PATCH v3 7/8] drm/msm/dpu: merge DPU_SSPP_SCALER_QSEED3, QSEED3LITE, QSEED4
Date:   Tue,  5 Sep 2023 04:25:25 +0300
Message-Id: <20230905012526.3010798-8-dmitry.baryshkov@linaro.org>
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
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h    | 4 +---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c      | 3 +--
 5 files changed, 7 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index b37b4076e53a..67d66319a825 100644
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
index 7ca6286756f6..8dbf0322394e 100644
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
index f2192de93713..c20f37c8033c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -603,9 +603,7 @@ static void _setup_layer_ops(struct dpu_hw_sspp *c,
 		test_bit(DPU_SSPP_SMART_DMA_V2, &c->cap->features))
 		c->ops.setup_multirect = dpu_hw_sspp_setup_multirect;
 
-	if (test_bit(DPU_SSPP_SCALER_QSEED3, &features) ||
-			test_bit(DPU_SSPP_SCALER_QSEED3LITE, &features) ||
-			test_bit(DPU_SSPP_SCALER_QSEED4, &features)) {
+	if (test_bit(DPU_SSPP_SCALER_QSEED3, &features)) {
 		c->ops.setup_scaler = _dpu_hw_sspp_setup_scaler3;
 		c->ops.get_scaler_ver = _dpu_hw_sspp_get_scaler3_ver;
 	}
@@ -640,10 +638,7 @@ int _dpu_hw_sspp_init_debugfs(struct dpu_hw_sspp *hw_pipe, struct dpu_kms *kms,
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
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index cbf4f95ff0fd..d7954e900296 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -26,9 +26,7 @@ struct dpu_hw_sspp;
  */
 #define DPU_SSPP_SCALER (BIT(DPU_SSPP_SCALER_RGB) | \
 			 BIT(DPU_SSPP_SCALER_QSEED2) | \
-			 BIT(DPU_SSPP_SCALER_QSEED3) | \
-			 BIT(DPU_SSPP_SCALER_QSEED3LITE) | \
-			 BIT(DPU_SSPP_SCALER_QSEED4))
+			 BIT(DPU_SSPP_SCALER_QSEED3))
 
 /*
  * Define all CSC feature bits in catalog
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index c2aaaded07ed..109355275ec5 100644
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

