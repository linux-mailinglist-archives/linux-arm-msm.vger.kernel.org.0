Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26C287219D0
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Jun 2023 22:36:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231699AbjFDUf7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Jun 2023 16:35:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231618AbjFDUf6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Jun 2023 16:35:58 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 100C3CF
        for <linux-arm-msm@vger.kernel.org>; Sun,  4 Jun 2023 13:35:57 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4f3b9755961so5079892e87.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Jun 2023 13:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685910955; x=1688502955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=20vMCgEs5xV6/yWaQFs3XKxaRqwFIXRb9K9OLvetB2I=;
        b=FCAI7C/JTEDnWkS+jH8IMel8+RFx9OaJSbijPVslY0CMqhRwl3BZ+vtZScyFJTxCYV
         N3zOVzvJkNnnv/zFDR3UUIh4546/t3Y1tX/BsgI8mkv6WfH6qD082Ixv58d6DukjOwEM
         DUgqsow8y1YJ4yRj2KwcvSNPVLs6ciHGHKPmw4MvzVH8nSSCOtEm+mp5nXlnDJ+5pUna
         h+OaOvIWrSLx/YStfkv6dcQ1oF1gA+U/oEuv6I//08ozNorQcbgbpaSEstoYdySZZBca
         S6PAFXaTNzhdnq7jWcsjRnQ2j8c9dlSlkFDrrAOT71uDiqHokomb+lfp8yxrRDA0miFa
         es/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685910955; x=1688502955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=20vMCgEs5xV6/yWaQFs3XKxaRqwFIXRb9K9OLvetB2I=;
        b=l6sViMEwOVy8EP0hWmVD9cwtEYbLW/9vVzD/ybGaOSaCcRJllXC7594ybIt7o/yGOt
         Px3YlWKIcPE2v+pO+1ijP/jgPn54IBJ5v6aBgLL/j1E/G1Dn6U6NkmOrerJoIL16PP/C
         TI410ueBNWx06ogBY5x2eQF+ky8T+K6iozOPsmXp2amX9kuV1zoPbM/h400FO+rA+EsF
         78BeP+gyp0FylIX7Ia4fRd0LsVYvbi9Sr/rqz26Usv55YxuT395z+hd/RQtWH1Uq50zC
         g0GZF/gZCBi9YU4Rd67pht/MPtLmOvMNNdvm+I/Sve2gfYoQ6yQvLEnghy7JKhvRYIeQ
         6Pkw==
X-Gm-Message-State: AC+VfDzhpzINidaw6kmDzZ599isad4fj8slsxv51PYoIklteqzp09PHz
        J0rTg8+QB8zmpJQX9bVk6ionUQ==
X-Google-Smtp-Source: ACHHUZ5+uJ7YnIlGuWWfeFjybFYat2Z+kK9F5eV1MoBHdVNEeCn/C3yc7AbpkHXz7m4h2P5LLao3Zw==
X-Received: by 2002:a05:6512:50f:b0:4f2:5338:d0a8 with SMTP id o15-20020a056512050f00b004f25338d0a8mr4083468lfb.56.1685910955404;
        Sun, 04 Jun 2023 13:35:55 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id a19-20020a19f813000000b004f2794dcb4asm875822lff.255.2023.06.04.13.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jun 2023 13:35:54 -0700 (PDT)
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
Subject: [PATCH 20/22] drm/msm/dpu: drop empty features mask MERGE_3D_SM8150_MASK
Date:   Sun,  4 Jun 2023 23:35:30 +0300
Message-Id: <20230604203532.1094249-21-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230604203532.1094249-1-dmitry.baryshkov@linaro.org>
References: <20230604203532.1094249-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The MERGE_3D_SM8150_MASK features mask is zero. Drop it completely.

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
index c09cb2c61782..9846a1536515 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -292,17 +292,14 @@ static const struct dpu_merge_3d_cfg sm8150_merge_3d[] = {
 	{
 		.name = "merge_3d_0", .id = MERGE_3D_0,
 		.base = 0x83000, .len = 0x8,
-		.features = MERGE_3D_SM8150_MASK,
 	},
 	{
 		.name = "merge_3d_1", .id = MERGE_3D_1,
 		.base = 0x83100, .len = 0x8,
-		.features = MERGE_3D_SM8150_MASK,
 	},
 	{
 		.name = "merge_3d_2", .id = MERGE_3D_2,
 		.base = 0x83200, .len = 0x8,
-		.features = MERGE_3D_SM8150_MASK,
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index a0377fe708da..2453ddf91e2d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -291,17 +291,14 @@ static const struct dpu_merge_3d_cfg sc8180x_merge_3d[] = {
 	{
 		.name = "merge_3d_0", .id = MERGE_3D_0,
 		.base = 0x83000, .len = 0x8,
-		.features = MERGE_3D_SM8150_MASK,
 	},
 	{
 		.name = "merge_3d_1", .id = MERGE_3D_1,
 		.base = 0x83100, .len = 0x8,
-		.features = MERGE_3D_SM8150_MASK,
 	},
 	{
 		.name = "merge_3d_2", .id = MERGE_3D_2,
 		.base = 0x83200, .len = 0x8,
-		.features = MERGE_3D_SM8150_MASK,
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index deb868b893fe..5221c3c63d1b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -292,17 +292,14 @@ static const struct dpu_merge_3d_cfg sm8250_merge_3d[] = {
 	{
 		.name = "merge_3d_0", .id = MERGE_3D_0,
 		.base = 0x83000, .len = 0x8,
-		.features = MERGE_3D_SM8150_MASK,
 	},
 	{
 		.name = "merge_3d_1", .id = MERGE_3D_1,
 		.base = 0x83100, .len = 0x8,
-		.features = MERGE_3D_SM8150_MASK,
 	},
 	{
 		.name = "merge_3d_2", .id = MERGE_3D_2,
 		.base = 0x83200, .len = 0x8,
-		.features = MERGE_3D_SM8150_MASK,
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index 5af78ef6cfe1..669ab6915d17 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -290,17 +290,14 @@ static const struct dpu_merge_3d_cfg sm8350_merge_3d[] = {
 	{
 		.name = "merge_3d_0", .id = MERGE_3D_0,
 		.base = 0x4e000, .len = 0x8,
-		.features = MERGE_3D_SM8150_MASK,
 	},
 	{
 		.name = "merge_3d_1", .id = MERGE_3D_1,
 		.base = 0x4f000, .len = 0x8,
-		.features = MERGE_3D_SM8150_MASK,
 	},
 	{
 		.name = "merge_3d_2", .id = MERGE_3D_2,
 		.base = 0x50000, .len = 0x8,
-		.features = MERGE_3D_SM8150_MASK,
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index 7c05ecebe212..f50ee416f5d5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -294,17 +294,14 @@ static const struct dpu_merge_3d_cfg sc8280xp_merge_3d[] = {
 	{
 		.name = "merge_3d_0", .id = MERGE_3D_0,
 		.base = 0x4e000, .len = 0x8,
-		.features = MERGE_3D_SM8150_MASK,
 	},
 	{
 		.name = "merge_3d_1", .id = MERGE_3D_1,
 		.base = 0x4f000, .len = 0x8,
-		.features = MERGE_3D_SM8150_MASK,
 	},
 	{
 		.name = "merge_3d_2", .id = MERGE_3D_2,
 		.base = 0x50000, .len = 0x8,
-		.features = MERGE_3D_SM8150_MASK,
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index 22214c9626fa..03d0549e15f8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -310,22 +310,18 @@ static const struct dpu_merge_3d_cfg sm8450_merge_3d[] = {
 	{
 		.name = "merge_3d_0", .id = MERGE_3D_0,
 		.base = 0x4e000, .len = 0x8,
-		.features = MERGE_3D_SM8150_MASK,
 	},
 	{
 		.name = "merge_3d_1", .id = MERGE_3D_1,
 		.base = 0x4f000, .len = 0x8,
-		.features = MERGE_3D_SM8150_MASK,
 	},
 	{
 		.name = "merge_3d_2", .id = MERGE_3D_2,
 		.base = 0x50000, .len = 0x8,
-		.features = MERGE_3D_SM8150_MASK,
 	},
 	{
 		.name = "merge_3d_3", .id = MERGE_3D_3,
 		.base = 0x65f00, .len = 0x8,
-		.features = MERGE_3D_SM8150_MASK,
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index 06a63bcdd197..616a162e8bad 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -326,22 +326,18 @@ static const struct dpu_merge_3d_cfg sm8550_merge_3d[] = {
 	{
 		.name = "merge_3d_0", .id = MERGE_3D_0,
 		.base = 0x4e000, .len = 0x8,
-		.features = MERGE_3D_SM8150_MASK,
 	},
 	{
 		.name = "merge_3d_1", .id = MERGE_3D_1,
 		.base = 0x4f000, .len = 0x8,
-		.features = MERGE_3D_SM8150_MASK,
 	},
 	{
 		.name = "merge_3d_2", .id = MERGE_3D_2,
 		.base = 0x50000, .len = 0x8,
-		.features = MERGE_3D_SM8150_MASK,
 	},
 	{
 		.name = "merge_3d_3", .id = MERGE_3D_3,
 		.base = 0x66700, .len = 0x8,
-		.features = MERGE_3D_SM8150_MASK,
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index fd18388bd03f..aa45ed378884 100644
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

