Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E0D187BABF3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Oct 2023 23:27:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231128AbjJEV1O (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Oct 2023 17:27:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230396AbjJEV1N (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Oct 2023 17:27:13 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EDA4D8
        for <linux-arm-msm@vger.kernel.org>; Thu,  5 Oct 2023 14:27:12 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-50433d8385cso1931090e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Oct 2023 14:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696541230; x=1697146030; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MGY8XNUMIpqcQ8toHqOGCriEZZdnRFn/WfV+Pd3FFIA=;
        b=wQnnx4OgflYGEkaabElSv4irmfNVg67tBfU77LbQwSsqReHlLWVvfNilIQfivJBINw
         YPgG5a2CPJVaXcF6lf6O64yhBHhxQ08JCY0wKw9xoIvDVJC/Ye9/rul/TaVN2k3dDbJ8
         d6n/Cq1YSPIlYjQNkpfxAyGA0dFNFajVZedZwjBAlo7fr4CtXOglGn127vU3fJ4/hdql
         WObuzNPeiFRgG4e7ibOUw+uboerz3JDsYXiMg1bYq6QIcihrgEGkgxkUW59hkLFa5TO3
         w/c6NoSAhPTFWOOGO6UhfUvDE69KWjI94qjWvGxjYaUQqwGEYfBALye7n9kQthxtTTdx
         237A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696541230; x=1697146030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MGY8XNUMIpqcQ8toHqOGCriEZZdnRFn/WfV+Pd3FFIA=;
        b=krLk4i6vo4ftWw058mxc1eaDHm4vL6fcwtDZA3XjVoCB1pyRO8PEEjpb3Lj/54cUSw
         XFPKC5tJSJsv5igVZ71Jvv4+fFSUrVLiH1svtWEKxw6wx3gkgdXX0mM9vFti3rVvrQaf
         Yz+seyrDm9zKN9DvlYZMSQDKIKHgzjlzjNi0JRufzVFBRE7+qV+Bke1wqCX4+l5rbXPY
         ZPl3UzA32yWtUvgNznF000P/pH2GquKc5Sg/pyB1DWIQMz4lOvDVTz9viWUs5yKVQBbp
         Xg0IlNHDQv61ru6tFxd8sb8Rh2NR9BIbnRO4ylEq5K5RdNfj1dp7i9ekyI2+hjwJ9p3J
         QNVw==
X-Gm-Message-State: AOJu0YzZ7H1xfx29Z3Dbz+gTd7TBkvkaLWC7PNKJGavju2dw35qKo7xf
        oigyNwdJDQh5NfMH5rzNb33LrQ==
X-Google-Smtp-Source: AGHT+IGeFPlbwHytXW0CEgJMbHl//wND0YtqmClaEpjL6xHAM4n5lLa5EjlYeDA8/2RITOAc7A/usw==
X-Received: by 2002:ac2:5b9e:0:b0:500:c765:bbe with SMTP id o30-20020ac25b9e000000b00500c7650bbemr4988725lfn.0.1696541230398;
        Thu, 05 Oct 2023 14:27:10 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id a6-20020a19f806000000b00500b3157ec6sm8435lff.143.2023.10.05.14.27.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 14:27:10 -0700 (PDT)
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
Subject: [PATCH v5 09/10] drm/msm/dpu: merge DPU_SSPP_SCALER_QSEED3, QSEED3LITE, QSEED4
Date:   Fri,  6 Oct 2023 00:27:02 +0300
Message-Id: <20231005212703.2400237-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231005212703.2400237-1-dmitry.baryshkov@linaro.org>
References: <20231005212703.2400237-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
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
index 23c0d4c85668..cccafee33825 100644
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

