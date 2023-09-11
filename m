Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9BFBE79C4B1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Sep 2023 06:22:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234088AbjILEWg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Sep 2023 00:22:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234506AbjILEWW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Sep 2023 00:22:22 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76AC7C7B01
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Sep 2023 16:06:37 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-401c90ed2ecso54140275e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Sep 2023 16:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694473517; x=1695078317; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LdwacgZPE1/ikbVik+c0K8BcfiAwiIlXGK7el9tanAU=;
        b=ditP3UZA6CNhrPNxWLeWWix7LvLwNneSQJWU+FPX0xTtPm07lJm3O7wZpWLzLJNFzS
         S8yMv9TbE6NTRWExqwpX4KByhufimzhBxfjRLpXey4J0YeTWEZzcpeRLuOhN9wG8HKwL
         b4OFLsa9OtE6R0oQKqVNofGy2Hn38K1EoKW8ZOLK2JzWOyFVjfE2eu+d8H8so1u+Xy27
         137xujVRNIWLWZQvawJOWifmPCwdq6zC491BSN1AigvJQrbWQggxBJKa2sDmVWsJYfca
         JSTLfG8W8lHWX1SY2VCfNrzE0gsC0Ge9VLKOHRPiX5IBCpQEC8qO6vncKrLeucANGytd
         PDFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694473517; x=1695078317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LdwacgZPE1/ikbVik+c0K8BcfiAwiIlXGK7el9tanAU=;
        b=VvuJ3JpisqXy/8I8FEqz/kvUn4koG2Ow2MeisH6+0e3mv69MsSZjUictQM0BK4XzOU
         RN3oxQ8fl6hMP8Oxr0Ia129kQ3V4HwgESCvUb6fSfY/Vxum9rGmaeeSr0MlKQX7BcFGE
         3xAbx9FNJ7M7wbZdfvw2Ayh+wBWXBddrAC1LObLb0dHYMXYWg7WIj4CGQmhRNzphiFCU
         whrOIZgja0QeCt2Kt1a050GddqUOov74GFVp17Ag7ph0D9Jzj2KQMe/HhA/0DpRdjl0y
         uUPd45qIp0O2jX/GbMxJm5d+gDO0f8cSh6EsW32KabcG4jOICe3XqWL7MWgZsAOcQmIe
         PO/A==
X-Gm-Message-State: AOJu0YwsWNubC3vhUOQm2wYBUveeY+AJJ5lWdYwG7RQHa8m2PueNXLUI
        1o9D1e7HdzOCuhLJEp20ZZryzxsH3923UQ+PEMk=
X-Google-Smtp-Source: AGHT+IFcDyctc+d+deNA2NzqMG+wQcqH3L9kAd2RJfK9Ei/9eXzURV4QYI5BVDiGUVWNotXkztHH9w==
X-Received: by 2002:ac2:597b:0:b0:500:a092:d085 with SMTP id h27-20020ac2597b000000b00500a092d085mr8499783lfp.68.1694468728930;
        Mon, 11 Sep 2023 14:45:28 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id b5-20020a0565120b8500b004ff9bfda9d6sm1168804lfv.212.2023.09.11.14.45.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 14:45:28 -0700 (PDT)
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
Subject: [PATCH v4 8/9] drm/msm/dpu: merge DPU_SSPP_SCALER_QSEED3, QSEED3LITE, QSEED4
Date:   Tue, 12 Sep 2023 00:45:20 +0300
Message-Id: <20230911214521.787453-9-dmitry.baryshkov@linaro.org>
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
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index ca02f86c94ed..b157ed7da065 100644
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

