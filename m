Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 805E6732CDF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jun 2023 12:04:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242492AbjFPKEm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Jun 2023 06:04:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241496AbjFPKEk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Jun 2023 06:04:40 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14E602D67
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jun 2023 03:04:37 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4f642a24568so619799e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jun 2023 03:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686909875; x=1689501875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w8TNv2gxV2YTcwbmafIGQ8gR5hfTkpOZKIT/DEdEnEg=;
        b=Er/qXcTrMgNa1QGDI1CUXyJDkNyJ+bUDoAMN7+Gzs41eCrNvg6SvcxaAYXPJGuyJv2
         /V2a6KB0wleukh6CyCwVWX4NHiA3+ZXEawgFFOUiX5MEu24n1NMk6O2djchfGaH05+o5
         g+WiFJaKoHCZbUXZ8JziBAfH8oirxYuviChwXE1xI008aXwBy+XMmR0EtJ8nyEeteZ50
         OeYV8+5cGxK7clIbVh22FY30lpks8xNEhaJaVBAcD+XDVmjNRzqxopf+GgWXZ4rxpddM
         CFORII94pkbYKNzEBS6VxmZuqGMZlcNr+k7JYcmnGicC+9+k2Pgjt3vjkZmZi2DlHaGC
         xFbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686909875; x=1689501875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w8TNv2gxV2YTcwbmafIGQ8gR5hfTkpOZKIT/DEdEnEg=;
        b=Q2aE8ENqiYvgunoCZtj48EXJF0ZhAydHFGh786giSIiO18JV704p95ahPCf8G2J/Yy
         GJoZQiJvHRg2H+WOVoHMYOZFb1okLGAh/EXfLrk3/42EWnzcFyUSMSZ0iRpKIN7zunce
         WnOHf5DlfdLHqxsHMhkgrfNvVyPw1zxppbdQdM2jQe42YlaoBXbKuUxwAaICAWDA5r8n
         f8dDPnYS4VhdsMlSfDBkiPGjkFhvhEeQ4nMSwStviscRuEluwmmC+NV13utFuHA3+NBW
         6NCEzV1kIA8TS+6onIGzU33E8KnB2QDvJCoZ0QfbPYr9aShbljmAlSQP3MYi7QuDWkBB
         tlOw==
X-Gm-Message-State: AC+VfDy7cG/bTlHV+iHgOglj1eVuYU+mNGZT+cOdx0pj2yRqk3fZpBbQ
        Gwjlp/vtSKZ4BzQScZ5UBvNAPg==
X-Google-Smtp-Source: ACHHUZ6rUVQErqPqcO8+HWJl64LyToDTd1zc6AOIN1AM9K5EGKn53wDqTWyUpYqDiC9/B3dy00Udig==
X-Received: by 2002:a19:d609:0:b0:4f8:57c2:3933 with SMTP id n9-20020a19d609000000b004f857c23933mr565824lfg.22.1686909875263;
        Fri, 16 Jun 2023 03:04:35 -0700 (PDT)
Received: from eriador.lan (85-76-68-127-nat.elisa-mobile.fi. [85.76.68.127])
        by smtp.gmail.com with ESMTPSA id r12-20020ac24d0c000000b004f4ce9c9338sm2967423lfi.283.2023.06.16.03.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jun 2023 03:04:34 -0700 (PDT)
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
Subject: [PATCH v3 18/19] drm/msm/dpu: drop empty features mask MERGE_3D_SM8150_MASK
Date:   Fri, 16 Jun 2023 13:03:16 +0300
Message-Id: <20230616100317.500687-19-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230616100317.500687-1-dmitry.baryshkov@linaro.org>
References: <20230616100317.500687-1-dmitry.baryshkov@linaro.org>
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
index c8c702e4f045..94d97d7f6ff3 100644
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
index 11bf4cec0f95..acf14227e68e 100644
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
index bf35b5bf0cd1..0936b719b9c6 100644
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

