Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 76DB770B28B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 May 2023 02:42:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229917AbjEVAmi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 21 May 2023 20:42:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229798AbjEVAmf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 21 May 2023 20:42:35 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4111DB
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 May 2023 17:42:33 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4effb818c37so6029617e87.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 May 2023 17:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684716152; x=1687308152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d0zTBmLJIs+8qn5dEcx6BQ7EwtRdb4yJxKEDTye+SyQ=;
        b=vqcaWrXpJvkiz/OGkWZ9tZ6sdEaoLn+0U2p/4mnfzioPZCfXhdnYSMWtTLSAWIcjGr
         tmurBslG5JRZi2f+FzcJP2a2UCateUb79ZJeQq4qAMVZebAd/Y5idofCp6i2alvM5YQw
         5eKmHmFjV7M6S/dg7lEaBRT7Qb39q0DueL/M0hnLXugHC3kVbZGC/DZUn6JiSnBZ26YV
         LkBPSr7h4Qdjz0FYFZeVHRXmt7w8Jy1FD5uuv+hRuWDhhfkltlQX3Pxuq8SwTVrsXDUQ
         8b6n/Yo1ukZM5hrWp2kKjJJW8P6uKemkZO5p4pMQ/LjeZKiRMs4I1vzdiLPetTImgpfF
         TtSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684716152; x=1687308152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d0zTBmLJIs+8qn5dEcx6BQ7EwtRdb4yJxKEDTye+SyQ=;
        b=XXpFGhvByskVRMPWX3HuWAZRE67CpC7LsM7OIUQQgxXdfFFizUz/E2fgYtDrr/2+DW
         9nLRfboaaqcuBaD3Ox2+mvATpDpYxxSefRQuVTcU93hYZigLLY+9XHLIJ9oOZFgCReMm
         i0135xuDJUngTIPE39DfhHjmPg3Y+GVUZQNGeLFoz1wuVwA2zXi80dxYyq5E3P1UVfoz
         sEMp3lgBUf4lWKOm7DGUo84geqX237ao2tBqdpTyh/Kuh40fJCUG0bwHggfc7+1zBAf5
         ZMmPXk22AW7d65W06M2fAymq6XYMflJ1TrN7/Oz1nGQ/4zg6ScaKZhj3VbogABMOXI1y
         hAeA==
X-Gm-Message-State: AC+VfDwnjo39QrS+Le9nax/VDIIQjf/KOngo8CBmG6OIXOBg7rsnI/n3
        hjbl6LZsr/0zCYiaG2zmQtbSrw==
X-Google-Smtp-Source: ACHHUZ4XT3g3hi8U7Zau3cQ16ucToQToY1R0MODz1s7Do+OhGKbnNQrJQ8N3Qb/lzpxEMR8+aznPzw==
X-Received: by 2002:ac2:47f0:0:b0:4f3:a921:a9fb with SMTP id b16-20020ac247f0000000b004f3a921a9fbmr2906497lfp.24.1684716152161;
        Sun, 21 May 2023 17:42:32 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id b15-20020ac25e8f000000b004f139712835sm768159lfq.293.2023.05.21.17.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 May 2023 17:42:31 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 5/6] drm/msm/dpu: drop now-unused mdss_irqs field from hw catalog
Date:   Mon, 22 May 2023 03:42:26 +0300
Message-Id: <20230522004227.134501-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230522004227.134501-1-dmitry.baryshkov@linaro.org>
References: <20230522004227.134501-1-dmitry.baryshkov@linaro.org>
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

Now as the list of the interrupts is constructed from the catalog
data, drop the mdss_irqs field from catalog.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h    |  8 --------
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h |  9 ---------
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h | 11 -----------
 .../drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    | 13 -------------
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h | 10 ----------
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h |  6 ------
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h |  5 -----
 .../drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h    |  5 -----
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h |  9 ---------
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h |  7 -------
 .../drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   | 14 --------------
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h |  9 ---------
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h |  9 ---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |  3 ---
 14 files changed, 118 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
index 3c732a0360c7..ff7c3d522046 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
@@ -204,14 +204,6 @@ const struct dpu_mdss_cfg dpu_msm8998_cfg = {
 	.vbif_count = ARRAY_SIZE(msm8998_vbif),
 	.vbif = msm8998_vbif,
 	.perf = &msm8998_perf_data,
-	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
-		     BIT(MDP_SSPP_TOP0_INTR2) | \
-		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
-		     BIT(MDP_INTF0_INTR) | \
-		     BIT(MDP_INTF1_INTR) | \
-		     BIT(MDP_INTF2_INTR) | \
-		     BIT(MDP_INTF3_INTR) | \
-		     BIT(MDP_INTF4_INTR),
 };
 
 #endif
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
index 36ea1af10894..c4ccd742690a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -202,15 +202,6 @@ const struct dpu_mdss_cfg dpu_sdm845_cfg = {
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
 	.vbif = sdm845_vbif,
 	.perf = &sdm845_perf_data,
-	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
-		     BIT(MDP_SSPP_TOP0_INTR2) | \
-		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
-		     BIT(MDP_INTF0_INTR) | \
-		     BIT(MDP_INTF1_INTR) | \
-		     BIT(MDP_INTF2_INTR) | \
-		     BIT(MDP_INTF3_INTR) | \
-		     BIT(MDP_AD4_0_INTR) | \
-		     BIT(MDP_AD4_1_INTR),
 };
 
 #endif
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index b5f751354267..fb7069d470ff 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -231,17 +231,6 @@ const struct dpu_mdss_cfg dpu_sm8150_cfg = {
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
 	.vbif = sdm845_vbif,
 	.perf = &sm8150_perf_data,
-	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
-		     BIT(MDP_SSPP_TOP0_INTR2) | \
-		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
-		     BIT(MDP_INTF0_INTR) | \
-		     BIT(MDP_INTF1_INTR) | \
-		     BIT(MDP_INTF1_TEAR_INTR) | \
-		     BIT(MDP_INTF2_INTR) | \
-		     BIT(MDP_INTF2_TEAR_INTR) | \
-		     BIT(MDP_INTF3_INTR) | \
-		     BIT(MDP_AD4_0_INTR) | \
-		     BIT(MDP_AD4_1_INTR),
 };
 
 #endif
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index 8ed2b263c5ea..bd7422e597aa 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -237,19 +237,6 @@ const struct dpu_mdss_cfg dpu_sc8180x_cfg = {
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
 	.vbif = sdm845_vbif,
 	.perf = &sc8180x_perf_data,
-	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
-		     BIT(MDP_SSPP_TOP0_INTR2) | \
-		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
-		     BIT(MDP_INTF0_INTR) | \
-		     BIT(MDP_INTF1_INTR) | \
-		     BIT(MDP_INTF1_TEAR_INTR) | \
-		     BIT(MDP_INTF2_INTR) | \
-		     BIT(MDP_INTF2_TEAR_INTR) | \
-		     BIT(MDP_INTF3_INTR) | \
-		     BIT(MDP_INTF4_INTR) | \
-		     BIT(MDP_INTF5_INTR) | \
-		     BIT(MDP_AD4_0_INTR) | \
-		     BIT(MDP_AD4_1_INTR),
 };
 
 #endif
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index daebd2170041..75a5c1b5a74a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -239,16 +239,6 @@ const struct dpu_mdss_cfg dpu_sm8250_cfg = {
 	.wb_count = ARRAY_SIZE(sm8250_wb),
 	.wb = sm8250_wb,
 	.perf = &sm8250_perf_data,
-	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
-		     BIT(MDP_SSPP_TOP0_INTR2) | \
-		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
-		     BIT(MDP_INTF0_INTR) | \
-		     BIT(MDP_INTF1_INTR) | \
-		     BIT(MDP_INTF1_TEAR_INTR) | \
-		     BIT(MDP_INTF2_INTR) | \
-		     BIT(MDP_INTF2_TEAR_INTR) | \
-		     BIT(MDP_INTF3_INTR) | \
-		     BIT(MDP_INTF4_INTR),
 };
 
 #endif
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
index 0b05da2592c0..84be02ce9c9c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
@@ -149,12 +149,6 @@ const struct dpu_mdss_cfg dpu_sc7180_cfg = {
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
 	.vbif = sdm845_vbif,
 	.perf = &sc7180_perf_data,
-	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
-		     BIT(MDP_SSPP_TOP0_INTR2) | \
-		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
-		     BIT(MDP_INTF0_INTR) | \
-		     BIT(MDP_INTF1_INTR) | \
-		     BIT(MDP_INTF1_TEAR_INTR),
 };
 
 #endif
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
index ba9de008519b..71d6e036a7a7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
@@ -122,11 +122,6 @@ const struct dpu_mdss_cfg dpu_sm6115_cfg = {
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
 	.vbif = sdm845_vbif,
 	.perf = &sm6115_perf_data,
-	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
-		     BIT(MDP_SSPP_TOP0_INTR2) | \
-		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
-		     BIT(MDP_INTF1_INTR) | \
-		     BIT(MDP_INTF1_TEAR_INTR),
 };
 
 #endif
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
index 92ac348eea6b..d80b383d874d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
@@ -112,11 +112,6 @@ const struct dpu_mdss_cfg dpu_qcm2290_cfg = {
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
 	.vbif = sdm845_vbif,
 	.perf = &qcm2290_perf_data,
-	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
-		     BIT(MDP_SSPP_TOP0_INTR2) | \
-		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
-		     BIT(MDP_INTF1_INTR) | \
-		     BIT(MDP_INTF1_TEAR_INTR),
 };
 
 #endif
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index 3c1b2c13398d..f9e5f252ae54 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -222,15 +222,6 @@ const struct dpu_mdss_cfg dpu_sm8350_cfg = {
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
 	.vbif = sdm845_vbif,
 	.perf = &sm8350_perf_data,
-	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
-		     BIT(MDP_SSPP_TOP0_INTR2) | \
-		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
-		     BIT(MDP_INTF0_7xxx_INTR) | \
-		     BIT(MDP_INTF1_7xxx_INTR) | \
-		     BIT(MDP_INTF1_7xxx_TEAR_INTR) | \
-		     BIT(MDP_INTF2_7xxx_INTR) | \
-		     BIT(MDP_INTF2_7xxx_TEAR_INTR) | \
-		     BIT(MDP_INTF3_7xxx_INTR),
 };
 
 #endif
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index 5d894cbb0a62..dede8cb2d784 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -162,13 +162,6 @@ const struct dpu_mdss_cfg dpu_sc7280_cfg = {
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
 	.vbif = sdm845_vbif,
 	.perf = &sc7280_perf_data,
-	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
-		     BIT(MDP_SSPP_TOP0_INTR2) | \
-		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
-		     BIT(MDP_INTF0_7xxx_INTR) | \
-		     BIT(MDP_INTF1_7xxx_INTR) | \
-		     BIT(MDP_INTF1_7xxx_TEAR_INTR) | \
-		     BIT(MDP_INTF5_7xxx_INTR),
 };
 
 #endif
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index c3f1ae000a21..79ab2d015a44 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -224,20 +224,6 @@ const struct dpu_mdss_cfg dpu_sc8280xp_cfg = {
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
 	.vbif = sdm845_vbif,
 	.perf = &sc8280xp_perf_data,
-	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
-		     BIT(MDP_SSPP_TOP0_INTR2) | \
-		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
-		     BIT(MDP_INTF0_7xxx_INTR) | \
-		     BIT(MDP_INTF1_7xxx_INTR) | \
-		     BIT(MDP_INTF1_7xxx_TEAR_INTR) | \
-		     BIT(MDP_INTF2_7xxx_INTR) | \
-		     BIT(MDP_INTF2_7xxx_TEAR_INTR) | \
-		     BIT(MDP_INTF3_7xxx_INTR) | \
-		     BIT(MDP_INTF4_7xxx_INTR) | \
-		     BIT(MDP_INTF5_7xxx_INTR) | \
-		     BIT(MDP_INTF6_7xxx_INTR) | \
-		     BIT(MDP_INTF7_7xxx_INTR) | \
-		     BIT(MDP_INTF8_7xxx_INTR),
 };
 
 #endif
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index 86c2e68ebd2c..b0bc88136e86 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -230,15 +230,6 @@ const struct dpu_mdss_cfg dpu_sm8450_cfg = {
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
 	.vbif = sdm845_vbif,
 	.perf = &sm8450_perf_data,
-	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
-		     BIT(MDP_SSPP_TOP0_INTR2) | \
-		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
-		     BIT(MDP_INTF0_7xxx_INTR) | \
-		     BIT(MDP_INTF1_7xxx_INTR) | \
-		     BIT(MDP_INTF1_7xxx_TEAR_INTR) | \
-		     BIT(MDP_INTF2_7xxx_INTR) | \
-		     BIT(MDP_INTF2_7xxx_TEAR_INTR) | \
-		     BIT(MDP_INTF3_7xxx_INTR),
 };
 
 #endif
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index 85dc34458b88..afed62e44f90 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -234,15 +234,6 @@ const struct dpu_mdss_cfg dpu_sm8550_cfg = {
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
 	.vbif = sdm845_vbif,
 	.perf = &sm8550_perf_data,
-	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
-		     BIT(MDP_SSPP_TOP0_INTR2) | \
-		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
-		     BIT(MDP_INTF0_7xxx_INTR) | \
-		     BIT(MDP_INTF1_7xxx_INTR) | \
-		     BIT(MDP_INTF1_7xxx_TEAR_INTR) | \
-		     BIT(MDP_INTF2_7xxx_INTR) | \
-		     BIT(MDP_INTF2_7xxx_TEAR_INTR) | \
-		     BIT(MDP_INTF3_7xxx_INTR),
 };
 
 #endif
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 72530ebb0ae6..6d8c2fa8558a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -777,7 +777,6 @@ struct dpu_perf_cfg {
  * @dma_formats        Supported formats for dma pipe
  * @cursor_formats     Supported formats for cursor pipe
  * @vig_formats        Supported formats for vig pipe
- * @mdss_irqs:         Bitmap with the irqs supported by the target
  */
 struct dpu_mdss_cfg {
 	const struct dpu_caps *caps;
@@ -825,8 +824,6 @@ struct dpu_mdss_cfg {
 	const struct dpu_format_extended *dma_formats;
 	const struct dpu_format_extended *cursor_formats;
 	const struct dpu_format_extended *vig_formats;
-
-	unsigned long mdss_irqs;
 };
 
 extern const struct dpu_mdss_cfg dpu_msm8998_cfg;
-- 
2.39.2

