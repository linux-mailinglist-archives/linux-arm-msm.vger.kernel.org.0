Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 199527219C1
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Jun 2023 22:35:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231375AbjFDUft (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Jun 2023 16:35:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231368AbjFDUfr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Jun 2023 16:35:47 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA357DB
        for <linux-arm-msm@vger.kernel.org>; Sun,  4 Jun 2023 13:35:45 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4f5f728c4aaso4564322e87.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Jun 2023 13:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685910945; x=1688502945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n5f7zOtlk5zYdRPMDN1UX1oba6Ttkew6YLBLwkGUvHc=;
        b=eAu+DL7uaMDZfsKrYDT6+8K6Y+kytbxGPsgSl53jHVNs1bOOAt5+armcDJXdeeLbss
         Q1drvq9x4O1d4nfM1nQkcoYhdl3C3uATqhzO3GmcYu28qNon6IIwsUYNembSSPArFT8A
         SIbc0/UXbozsxV58ihYn86VRChBYEhw5m4j9FQ+yuIlt61xepzjMRLy5gMyS3azCqrZT
         8D000puamSUvaFNnlSL9G7XdKJl757pRvzHGScVtW3UUpOv1vZT9qecLQUQtDFoSuwsq
         bP4bSjXXbGhOHjmSQrC5OxHhxqHHJGAnNObw4czmIOMrXj3f8CM4ATYnNtjsGaeZC42n
         lCEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685910945; x=1688502945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n5f7zOtlk5zYdRPMDN1UX1oba6Ttkew6YLBLwkGUvHc=;
        b=LsHZkCs97Wg9TzSLgQvy5BxshjWzPYYWZeXZUA53REmh3A5cTRiW8O+f/qyX67Xiqr
         mv1cs5l4dbM11i8Za7MBlyuJqcNtrUh+7eXGjpz70qIp318Ub2wKVapO4wX6pksDjohX
         TvzOwR7/9lUmy16LYgl4n/eQqNSfXyXTqQyhJAK7stndZBjsDYe2iQdKbZqTkbsGVcUK
         BCCuDKmeG2ilh9jau409MKOQCKQzODbZddV5u3fEecfhbAUdCGPNILFCpVtAPwBze6pF
         MmZezvcfy1XhgWJVVL1zT3GlN/Xxsr/0Hp1w7Gr+vojY0EdQ5x3gOCif59VyOW34iQzY
         /3WQ==
X-Gm-Message-State: AC+VfDymilNms9WPxX8CUsz0WeRJEKifMhlEsoj7VRVwFL7EHi9e2BK7
        wEyO0NeCBWjSpI01hfqone5cIQ==
X-Google-Smtp-Source: ACHHUZ4a1Th1AKlpI4DFzcgGooCwzm+rZflRJUezfV7Fwp2M+/tZXQ7pjxX3aMNHAN4t5ynKQhh9Uw==
X-Received: by 2002:ac2:4c50:0:b0:4eb:4258:bf62 with SMTP id o16-20020ac24c50000000b004eb4258bf62mr3248834lfk.8.1685910945390;
        Sun, 04 Jun 2023 13:35:45 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id a19-20020a19f813000000b004f2794dcb4asm875822lff.255.2023.06.04.13.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jun 2023 13:35:44 -0700 (PDT)
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
Subject: [PATCH 11/22] drm/msm/dpu: drop zero features from dpu_mdp_cfg data
Date:   Sun,  4 Jun 2023 23:35:21 +0300
Message-Id: <20230604203532.1094249-12-dmitry.baryshkov@linaro.org>
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

Drop useless zero assignments to the dpu_mdp_cfg::features field.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h  | 1 -
 5 files changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index 1d831645cac4..e183f619bb89 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -28,7 +28,6 @@ static const struct dpu_ubwc_cfg sm8250_ubwc_cfg = {
 static const struct dpu_mdp_cfg sm8250_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x494,
-	.features = 0,
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
index ce8b8fbbd72d..a2b4475def30 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
@@ -25,7 +25,6 @@ static const struct dpu_ubwc_cfg sc7180_ubwc_cfg = {
 static const struct dpu_mdp_cfg sc7180_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x494,
-	.features = 0,
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 		[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
index 8821a3c89064..db3939b855fc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
@@ -26,7 +26,6 @@ static const struct dpu_ubwc_cfg sm6115_ubwc_cfg = {
 static const struct dpu_mdp_cfg sm6115_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x494,
-	.features = 0,
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 		[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
index bbc6ea7fcb23..6208566d4955 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
@@ -23,7 +23,6 @@ static const struct dpu_ubwc_cfg qcm2290_ubwc_cfg = {
 static const struct dpu_mdp_cfg qcm2290_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x494,
-	.features = 0,
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 		[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index f7c1f6803def..19fd39646559 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -27,7 +27,6 @@ static const struct dpu_ubwc_cfg sm8350_ubwc_cfg = {
 static const struct dpu_mdp_cfg sm8350_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x494,
-	.features = 0,
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
-- 
2.39.2

