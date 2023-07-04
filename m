Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0633D746762
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jul 2023 04:21:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230090AbjGDCVz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Jul 2023 22:21:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230011AbjGDCVx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Jul 2023 22:21:53 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B66213D
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Jul 2023 19:21:52 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2b5c2433134so64005331fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Jul 2023 19:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688437311; x=1691029311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bb9Z7X9imjc06dAsgGbbVM7zp6yMgVecEP/KTGre5s4=;
        b=yAS/xofGrGfq4LLO8rmW5WapVrWumCPsPQp7ZBXS9H//PbhbsfQORZoSdbZvZYv11x
         dJUovX89cpju4lWkaWxT37ucUz64avzN6wc41vu6mG8gLv57jaCrLmoI5Q8GV6P/BokA
         0upjZ0mVHr92PQNLGDwyu91PrqBjozRbrCEUFfS1o5HzQN6VbpvjkXwP2gELD3Uqj4Ts
         zZhkYPDGyQAAqB/q9OdCIUvuhOwAyFnnElg3OF3wATG5uS6F4u4Mzg8GZoF22+W9SkFa
         /PpmM2vHrzMxAcJ9d+ZkTYi94xFpMlS77m7O7+cYPxG8n+gXTWh0uLk+rG8QW2a6RSy6
         xzXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688437311; x=1691029311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bb9Z7X9imjc06dAsgGbbVM7zp6yMgVecEP/KTGre5s4=;
        b=OCbPQFA7iTdd4eGMn/4pfSAWm9thCx3BqcFovexT7LOtqzcABGEaaA9tWekT9k288d
         0ndpmEP1SVM7GnZx9O0PiaU3PbJNLi9cpmXZcRRVjQTLrtEyXf5iXkVPmov3NWcFTWcz
         gn+TE1Woh/twEIUGdjsKtX/gDWXRVAgv0MXdxZdemIa+s5AVrd96aYELyLixnnYNXMsn
         uxjczKqezlbB47VOxiQ4Nim80Kd9vHVbRknRZZOGN7JO3LlKxcIotDhKFaXCfKamXJSP
         TRVlszR3Camrjk0SEuMuIxTv5dzZJqdn4Al96R/VwuYRCwR1kLD2K07vc8fJ/bxPKp9k
         5p8g==
X-Gm-Message-State: ABy/qLaEcO7wDK54O7QnIzVkTlUhq9zZbo/Hol5LARpgT18A/rwy3N0X
        I/wkW3kitSfqCQ3a+jFlWvwlpQ==
X-Google-Smtp-Source: APBJJlGkJxsy388PtF4vZ+8IdXgWLjNB6/XEiK7mTm0CqKtRj6lUVovYkztn2FtSJTSasCFv/O4ltA==
X-Received: by 2002:a2e:b5cb:0:b0:2b6:ef8a:d98d with SMTP id g11-20020a2eb5cb000000b002b6ef8ad98dmr755068ljn.20.1688437310889;
        Mon, 03 Jul 2023 19:21:50 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id y16-20020a05651c021000b002b6e863108esm1137830ljn.9.2023.07.03.19.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jul 2023 19:21:50 -0700 (PDT)
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
Subject: [PATCH v5 18/19] drm/msm/dpu: drop empty features mask MERGE_3D_SM8150_MASK
Date:   Tue,  4 Jul 2023 05:21:35 +0300
Message-Id: <20230704022136.130522-19-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230704022136.130522-1-dmitry.baryshkov@linaro.org>
References: <20230704022136.130522-1-dmitry.baryshkov@linaro.org>
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

The MERGE_3D_SM8150_MASK features mask is zero. Drop it completely.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Tested-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h   | 3 ---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h  | 3 ---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h   | 3 ---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   | 3 ---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 3 ---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   | 4 ----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 4 ----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c           | 2 --
 8 files changed, 25 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index 341ab9b84d20..e6d4a2bfc2be 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -273,15 +273,12 @@ static const struct dpu_merge_3d_cfg sm8150_merge_3d[] = {
 	{
 		.name = "merge_3d_0", .id = MERGE_3D_0,
 		.base = 0x83000, .len = 0x8,
-		.features = MERGE_3D_SM8150_MASK,
 	}, {
 		.name = "merge_3d_1", .id = MERGE_3D_1,
 		.base = 0x83100, .len = 0x8,
-		.features = MERGE_3D_SM8150_MASK,
 	}, {
 		.name = "merge_3d_2", .id = MERGE_3D_2,
 		.base = 0x83200, .len = 0x8,
-		.features = MERGE_3D_SM8150_MASK,
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index 8dd36a85b685..b4baf6707018 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -272,15 +272,12 @@ static const struct dpu_merge_3d_cfg sc8180x_merge_3d[] = {
 	{
 		.name = "merge_3d_0", .id = MERGE_3D_0,
 		.base = 0x83000, .len = 0x8,
-		.features = MERGE_3D_SM8150_MASK,
 	}, {
 		.name = "merge_3d_1", .id = MERGE_3D_1,
 		.base = 0x83100, .len = 0x8,
-		.features = MERGE_3D_SM8150_MASK,
 	}, {
 		.name = "merge_3d_2", .id = MERGE_3D_2,
 		.base = 0x83200, .len = 0x8,
-		.features = MERGE_3D_SM8150_MASK,
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index e16ffade5aca..265d88b288b6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -273,15 +273,12 @@ static const struct dpu_merge_3d_cfg sm8250_merge_3d[] = {
 	{
 		.name = "merge_3d_0", .id = MERGE_3D_0,
 		.base = 0x83000, .len = 0x8,
-		.features = MERGE_3D_SM8150_MASK,
 	}, {
 		.name = "merge_3d_1", .id = MERGE_3D_1,
 		.base = 0x83100, .len = 0x8,
-		.features = MERGE_3D_SM8150_MASK,
 	}, {
 		.name = "merge_3d_2", .id = MERGE_3D_2,
 		.base = 0x83200, .len = 0x8,
-		.features = MERGE_3D_SM8150_MASK,
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index d5191a663ae1..59a96a4b250c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -271,15 +271,12 @@ static const struct dpu_merge_3d_cfg sm8350_merge_3d[] = {
 	{
 		.name = "merge_3d_0", .id = MERGE_3D_0,
 		.base = 0x4e000, .len = 0x8,
-		.features = MERGE_3D_SM8150_MASK,
 	}, {
 		.name = "merge_3d_1", .id = MERGE_3D_1,
 		.base = 0x4f000, .len = 0x8,
-		.features = MERGE_3D_SM8150_MASK,
 	}, {
 		.name = "merge_3d_2", .id = MERGE_3D_2,
 		.base = 0x50000, .len = 0x8,
-		.features = MERGE_3D_SM8150_MASK,
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index 9f94cc6369dd..7110caae7251 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -275,15 +275,12 @@ static const struct dpu_merge_3d_cfg sc8280xp_merge_3d[] = {
 	{
 		.name = "merge_3d_0", .id = MERGE_3D_0,
 		.base = 0x4e000, .len = 0x8,
-		.features = MERGE_3D_SM8150_MASK,
 	}, {
 		.name = "merge_3d_1", .id = MERGE_3D_1,
 		.base = 0x4f000, .len = 0x8,
-		.features = MERGE_3D_SM8150_MASK,
 	}, {
 		.name = "merge_3d_2", .id = MERGE_3D_2,
 		.base = 0x50000, .len = 0x8,
-		.features = MERGE_3D_SM8150_MASK,
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index 517629c4a168..dcafab3e4b1a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -291,19 +291,15 @@ static const struct dpu_merge_3d_cfg sm8450_merge_3d[] = {
 	{
 		.name = "merge_3d_0", .id = MERGE_3D_0,
 		.base = 0x4e000, .len = 0x8,
-		.features = MERGE_3D_SM8150_MASK,
 	}, {
 		.name = "merge_3d_1", .id = MERGE_3D_1,
 		.base = 0x4f000, .len = 0x8,
-		.features = MERGE_3D_SM8150_MASK,
 	}, {
 		.name = "merge_3d_2", .id = MERGE_3D_2,
 		.base = 0x50000, .len = 0x8,
-		.features = MERGE_3D_SM8150_MASK,
 	}, {
 		.name = "merge_3d_3", .id = MERGE_3D_3,
 		.base = 0x65f00, .len = 0x8,
-		.features = MERGE_3D_SM8150_MASK,
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index ed1d1d4092e8..7b96f827c2b1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -305,19 +305,15 @@ static const struct dpu_merge_3d_cfg sm8550_merge_3d[] = {
 	{
 		.name = "merge_3d_0", .id = MERGE_3D_0,
 		.base = 0x4e000, .len = 0x8,
-		.features = MERGE_3D_SM8150_MASK,
 	}, {
 		.name = "merge_3d_1", .id = MERGE_3D_1,
 		.base = 0x4f000, .len = 0x8,
-		.features = MERGE_3D_SM8150_MASK,
 	}, {
 		.name = "merge_3d_2", .id = MERGE_3D_2,
 		.base = 0x50000, .len = 0x8,
-		.features = MERGE_3D_SM8150_MASK,
 	}, {
 		.name = "merge_3d_3", .id = MERGE_3D_3,
 		.base = 0x66700, .len = 0x8,
-		.features = MERGE_3D_SM8150_MASK,
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 6acd34e61aca..4a18fc66a412 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -93,8 +93,6 @@
 #define CTL_SM8550_MASK \
 	(CTL_SC7280_MASK | BIT(DPU_CTL_HAS_LAYER_EXT4))
 
-#define MERGE_3D_SM8150_MASK (0)
-
 #define DSPP_SC7180_MASK BIT(DPU_DSPP_PCC)
 
 #define INTF_SDM845_MASK (0)
-- 
2.39.2

