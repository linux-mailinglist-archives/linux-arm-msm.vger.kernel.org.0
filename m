Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF125732CD4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jun 2023 12:04:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234518AbjFPKEZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Jun 2023 06:04:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234069AbjFPKEW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Jun 2023 06:04:22 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB85F2137
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jun 2023 03:04:20 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4f769c37d26so624382e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jun 2023 03:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686909859; x=1689501859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=97XjgwdwmaJkwgryBByTEYhJimjLR8WZ3kp+c6KRDoo=;
        b=wUWniIwqBf5TrjM30susqFop4uzr80Qa617aLr/NmAxZpdQLJAykxlBJ4V1ncL2mW9
         qXrRDHPcUu5slYCHcW+jTcFK6KxWHRBYhKQyRNS1B+vz706AqOvnUL5y8HHKLL8rG1DZ
         O+dJ13OOmWFgif6i0i/QKNpC2cmdV6HQMJlxmDnik4KGHGUVe5iRaDXnCl88/gg7lgly
         W4u/DxHdbtgI0/RDUvZDZ0LAlVO1iEIHq/QHeOLldMx9nKyMZNT2uC4PoBhJGrJnBg2v
         8qZ4ujJx1DPasC5pbHfGJ9bTP7958056Re9SVisvElvHeY3WUiIiVByEOy0FTcM0ZgBs
         jbqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686909859; x=1689501859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=97XjgwdwmaJkwgryBByTEYhJimjLR8WZ3kp+c6KRDoo=;
        b=Zr2KZqkrNq+IwE0BlLqi8a7kqzv/THVzfaLYPZjM29ruGqMjAy90TvUCMeCZaT8W0v
         SirwFm3t24LS3Z0Up5aVgYu0OKBPympAFbPYsTwHsAZ2eS9BvSI/R3vZjCI/fae/lWrf
         +vuuikQYGWnPYuVmkaYtBTeO8qlvuGd1u2zbTbJJrm/6Q/O+7vwS3VYPUxp1a4JpHAsZ
         3m/3zlPHxUTsv3ycaGc+xeHUiAIoH4StJRgjAtfKda2csMqIwpqtx1MKycl9vM64maEK
         Qol8D9TP81Z4LuATA/8NV9OdIk3Laayr58tDisvy/2QHyuymdBKaaWk0Sx2yBcrcLYhl
         xx2g==
X-Gm-Message-State: AC+VfDyd68xiA7214NKlaX+oyolgxD2bAeTNZOGJiasJiCasw+ll4M28
        OwMRdKZxzD6NrDX7CFGQ4Z7Cqg==
X-Google-Smtp-Source: ACHHUZ78hBSwJrNRwBtX/dE27qm54VY+byYc7aqxPR43BkesKILBgoEp32+MEu/FgjK2GCLS8L21XQ==
X-Received: by 2002:a05:6512:32a5:b0:4f8:4de1:5ae9 with SMTP id q5-20020a05651232a500b004f84de15ae9mr976803lfe.25.1686909859057;
        Fri, 16 Jun 2023 03:04:19 -0700 (PDT)
Received: from eriador.lan (85-76-68-127-nat.elisa-mobile.fi. [85.76.68.127])
        by smtp.gmail.com with ESMTPSA id r12-20020ac24d0c000000b004f4ce9c9338sm2967423lfi.283.2023.06.16.03.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jun 2023 03:04:18 -0700 (PDT)
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
Subject: [PATCH v3 14/19] drm/msm/dpu: inline MERGE_3D_BLK macros
Date:   Fri, 16 Jun 2023 13:03:12 +0300
Message-Id: <20230616100317.500687-15-dmitry.baryshkov@linaro.org>
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

To simplify making changes to the hardware block definitions, expand
corresponding macros. This way making all the changes are more obvious
and visible in the source files.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    | 16 +++++++++++---
 .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   | 16 +++++++++++---
 .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    | 16 +++++++++++---
 .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    | 16 +++++++++++---
 .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  | 16 +++++++++++---
 .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    | 21 +++++++++++++++----
 .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    | 21 +++++++++++++++----
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 11 ----------
 8 files changed, 99 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index 5b068521de13..b152fb1e3399 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -239,9 +239,19 @@ static const struct dpu_pingpong_cfg sm8150_pp[] = {
 };
 
 static const struct dpu_merge_3d_cfg sm8150_merge_3d[] = {
-	MERGE_3D_BLK("merge_3d_0", MERGE_3D_0, 0x83000),
-	MERGE_3D_BLK("merge_3d_1", MERGE_3D_1, 0x83100),
-	MERGE_3D_BLK("merge_3d_2", MERGE_3D_2, 0x83200),
+	{
+		.name = "merge_3d_0", .id = MERGE_3D_0,
+		.base = 0x83000, .len = 0x8,
+		.features = MERGE_3D_SM8150_MASK,
+	}, {
+		.name = "merge_3d_1", .id = MERGE_3D_1,
+		.base = 0x83100, .len = 0x8,
+		.features = MERGE_3D_SM8150_MASK,
+	}, {
+		.name = "merge_3d_2", .id = MERGE_3D_2,
+		.base = 0x83200, .len = 0x8,
+		.features = MERGE_3D_SM8150_MASK,
+	},
 };
 
 static const struct dpu_dsc_cfg sm8150_dsc[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index ba5420f334ec..c13c0059936c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -238,9 +238,19 @@ static const struct dpu_pingpong_cfg sc8180x_pp[] = {
 };
 
 static const struct dpu_merge_3d_cfg sc8180x_merge_3d[] = {
-	MERGE_3D_BLK("merge_3d_0", MERGE_3D_0, 0x83000),
-	MERGE_3D_BLK("merge_3d_1", MERGE_3D_1, 0x83100),
-	MERGE_3D_BLK("merge_3d_2", MERGE_3D_2, 0x83200),
+	{
+		.name = "merge_3d_0", .id = MERGE_3D_0,
+		.base = 0x83000, .len = 0x8,
+		.features = MERGE_3D_SM8150_MASK,
+	}, {
+		.name = "merge_3d_1", .id = MERGE_3D_1,
+		.base = 0x83100, .len = 0x8,
+		.features = MERGE_3D_SM8150_MASK,
+	}, {
+		.name = "merge_3d_2", .id = MERGE_3D_2,
+		.base = 0x83200, .len = 0x8,
+		.features = MERGE_3D_SM8150_MASK,
+	},
 };
 
 static const struct dpu_dsc_cfg sc8180x_dsc[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index 01b61467a700..9213c1f90735 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -239,9 +239,19 @@ static const struct dpu_pingpong_cfg sm8250_pp[] = {
 };
 
 static const struct dpu_merge_3d_cfg sm8250_merge_3d[] = {
-	MERGE_3D_BLK("merge_3d_0", MERGE_3D_0, 0x83000),
-	MERGE_3D_BLK("merge_3d_1", MERGE_3D_1, 0x83100),
-	MERGE_3D_BLK("merge_3d_2", MERGE_3D_2, 0x83200),
+	{
+		.name = "merge_3d_0", .id = MERGE_3D_0,
+		.base = 0x83000, .len = 0x8,
+		.features = MERGE_3D_SM8150_MASK,
+	}, {
+		.name = "merge_3d_1", .id = MERGE_3D_1,
+		.base = 0x83100, .len = 0x8,
+		.features = MERGE_3D_SM8150_MASK,
+	}, {
+		.name = "merge_3d_2", .id = MERGE_3D_2,
+		.base = 0x83200, .len = 0x8,
+		.features = MERGE_3D_SM8150_MASK,
+	},
 };
 
 static const struct dpu_dsc_cfg sm8250_dsc[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index 8a9bfc4af72a..0added438239 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -237,9 +237,19 @@ static const struct dpu_pingpong_cfg sm8350_pp[] = {
 };
 
 static const struct dpu_merge_3d_cfg sm8350_merge_3d[] = {
-	MERGE_3D_BLK("merge_3d_0", MERGE_3D_0, 0x4e000),
-	MERGE_3D_BLK("merge_3d_1", MERGE_3D_1, 0x4f000),
-	MERGE_3D_BLK("merge_3d_2", MERGE_3D_2, 0x50000),
+	{
+		.name = "merge_3d_0", .id = MERGE_3D_0,
+		.base = 0x4e000, .len = 0x8,
+		.features = MERGE_3D_SM8150_MASK,
+	}, {
+		.name = "merge_3d_1", .id = MERGE_3D_1,
+		.base = 0x4f000, .len = 0x8,
+		.features = MERGE_3D_SM8150_MASK,
+	}, {
+		.name = "merge_3d_2", .id = MERGE_3D_2,
+		.base = 0x50000, .len = 0x8,
+		.features = MERGE_3D_SM8150_MASK,
+	},
 };
 
 /*
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index b676819db42c..0b4915dabe7a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -235,9 +235,19 @@ static const struct dpu_pingpong_cfg sc8280xp_pp[] = {
 };
 
 static const struct dpu_merge_3d_cfg sc8280xp_merge_3d[] = {
-	MERGE_3D_BLK("merge_3d_0", MERGE_3D_0, 0x4e000),
-	MERGE_3D_BLK("merge_3d_1", MERGE_3D_1, 0x4f000),
-	MERGE_3D_BLK("merge_3d_2", MERGE_3D_2, 0x50000),
+	{
+		.name = "merge_3d_0", .id = MERGE_3D_0,
+		.base = 0x4e000, .len = 0x8,
+		.features = MERGE_3D_SM8150_MASK,
+	}, {
+		.name = "merge_3d_1", .id = MERGE_3D_1,
+		.base = 0x4f000, .len = 0x8,
+		.features = MERGE_3D_SM8150_MASK,
+	}, {
+		.name = "merge_3d_2", .id = MERGE_3D_2,
+		.base = 0x50000, .len = 0x8,
+		.features = MERGE_3D_SM8150_MASK,
+	},
 };
 
 /*
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index 568523abc1d0..45cda9162685 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -247,10 +247,23 @@ static const struct dpu_pingpong_cfg sm8450_pp[] = {
 };
 
 static const struct dpu_merge_3d_cfg sm8450_merge_3d[] = {
-	MERGE_3D_BLK("merge_3d_0", MERGE_3D_0, 0x4e000),
-	MERGE_3D_BLK("merge_3d_1", MERGE_3D_1, 0x4f000),
-	MERGE_3D_BLK("merge_3d_2", MERGE_3D_2, 0x50000),
-	MERGE_3D_BLK("merge_3d_3", MERGE_3D_3, 0x65f00),
+	{
+		.name = "merge_3d_0", .id = MERGE_3D_0,
+		.base = 0x4e000, .len = 0x8,
+		.features = MERGE_3D_SM8150_MASK,
+	}, {
+		.name = "merge_3d_1", .id = MERGE_3D_1,
+		.base = 0x4f000, .len = 0x8,
+		.features = MERGE_3D_SM8150_MASK,
+	}, {
+		.name = "merge_3d_2", .id = MERGE_3D_2,
+		.base = 0x50000, .len = 0x8,
+		.features = MERGE_3D_SM8150_MASK,
+	}, {
+		.name = "merge_3d_3", .id = MERGE_3D_3,
+		.base = 0x65f00, .len = 0x8,
+		.features = MERGE_3D_SM8150_MASK,
+	},
 };
 
 /*
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index 419624948e83..66dd414253f1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -261,10 +261,23 @@ static const struct dpu_pingpong_cfg sm8550_pp[] = {
 };
 
 static const struct dpu_merge_3d_cfg sm8550_merge_3d[] = {
-	MERGE_3D_BLK("merge_3d_0", MERGE_3D_0, 0x4e000),
-	MERGE_3D_BLK("merge_3d_1", MERGE_3D_1, 0x4f000),
-	MERGE_3D_BLK("merge_3d_2", MERGE_3D_2, 0x50000),
-	MERGE_3D_BLK("merge_3d_3", MERGE_3D_3, 0x66700),
+	{
+		.name = "merge_3d_0", .id = MERGE_3D_0,
+		.base = 0x4e000, .len = 0x8,
+		.features = MERGE_3D_SM8150_MASK,
+	}, {
+		.name = "merge_3d_1", .id = MERGE_3D_1,
+		.base = 0x4f000, .len = 0x8,
+		.features = MERGE_3D_SM8150_MASK,
+	}, {
+		.name = "merge_3d_2", .id = MERGE_3D_2,
+		.base = 0x50000, .len = 0x8,
+		.features = MERGE_3D_SM8150_MASK,
+	}, {
+		.name = "merge_3d_3", .id = MERGE_3D_3,
+		.base = 0x66700, .len = 0x8,
+		.features = MERGE_3D_SM8150_MASK,
+	},
 };
 
 /*
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index ee24402bf253..72634a8109e8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -471,17 +471,6 @@ static const struct dpu_pingpong_sub_blks sc7280_pp_sblk = {
 	.intr_rdptr = _rdptr, \
 	}
 
-/*************************************************************
- * MERGE_3D sub blocks config
- *************************************************************/
-#define MERGE_3D_BLK(_name, _id, _base) \
-	{\
-	.name = _name, .id = _id, \
-	.base = _base, .len = 0x8, \
-	.features = MERGE_3D_SM8150_MASK, \
-	.sblk = NULL \
-	}
-
 /*************************************************************
  * DSC sub blocks config
  *************************************************************/
-- 
2.39.2

