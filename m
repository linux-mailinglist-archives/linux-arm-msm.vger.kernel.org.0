Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E682E72D562
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jun 2023 02:10:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238367AbjFMAKV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Jun 2023 20:10:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238355AbjFMAKT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Jun 2023 20:10:19 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9C151713
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jun 2023 17:10:17 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4f63ab1ac4aso5912387e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jun 2023 17:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686615016; x=1689207016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BiOQLVbEJ8ovzYllqJZQlvinPY8fq9c1cCfmcyPgzgI=;
        b=PbM3U81sZftKGmTYAwImfG8XxIXdBpOXLcYaZz9gTELWAgMhr+Dc53/Fc6W6T76bzs
         KSwrxWbpxG4NN15Q1pM6WTGfrBGT6s1C8Y4JOMVKktkMuq6uvUsYoxA0iqkU8IkF5ZyG
         RG2TgLUaKt8bhUqypt6yYBcRWU1cqkTBnB9DXl5u44oZxl3jUskOVWSF9HNqYADVN548
         81vPkyHvr1djg/E0Wv4kctaxf5fNZOcBhnYFe8ualNmQwMvgvuIcgWZNt7yKozCmrXN6
         KYorneCVvY3y7GlXw6khPm5IPLw86jDbo4gd8oVem5UCdkXN7QK/Phxbl9PpE4nqsUci
         8dNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686615016; x=1689207016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BiOQLVbEJ8ovzYllqJZQlvinPY8fq9c1cCfmcyPgzgI=;
        b=KY+6gDRVBG+7Pime66Pple34YdGbhQAKAXuzkS9ymue0rWEnWbclwUzhN2ziwgIVlG
         dUto7URNGdPI1e6mJ19fzo7mKxviWFMZXbOHeifMmXwg9qNgqIznGPhORVc2RGBbyE0W
         LJuyOXBlZ7EhDlPqoGlQgQ91vtA9YrlpaXO/VfmMgjS/LZ+zDbcXUkcY7KuKSN1HaGQD
         z1ovGnTesEYnjWFF22qtdcBZwgJESVf4zXBcAwVyWztCJgsIIrcY0gYOyFXRbpQJ08XI
         lM+2JH8+e8cZ9Ox8SBqYCHNdr3rgCKh4f4vMNmM4rWievu2clQPs3JPbxSPWwxn+2Prj
         wJWA==
X-Gm-Message-State: AC+VfDz1XhjcxZm32gHiK9Be1AcOSYd0KCfSobBg7M2KZl1eyJxs1aqk
        HJtfdxQFmoZIZlQVcQEe5mddmw==
X-Google-Smtp-Source: ACHHUZ4a6fk+CKcCb3NY6cAQnIYP/w1qb5wC8cdXkMKXzuyMCZZumrRIsOyUT5OEM8y15wZaMEsZfA==
X-Received: by 2002:a05:6512:290:b0:4f3:a71a:9e5f with SMTP id j16-20020a056512029000b004f3a71a9e5fmr4935972lfp.65.1686615016287;
        Mon, 12 Jun 2023 17:10:16 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id c10-20020ac2530a000000b004f63eea01a7sm1581604lfh.192.2023.06.12.17.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 17:10:15 -0700 (PDT)
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
Subject: [PATCH v2 10/22] drm/msm/dpu: drop zero features from dpu_mdp_cfg data
Date:   Tue, 13 Jun 2023 03:09:49 +0300
Message-Id: <20230613001004.3426676-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230613001004.3426676-1-dmitry.baryshkov@linaro.org>
References: <20230613001004.3426676-1-dmitry.baryshkov@linaro.org>
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

Drop useless zero assignments to the dpu_mdp_cfg::features field.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h  | 1 -
 7 files changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index ab1820f1ac54..e321cc0a80ee 100644
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
index 2df9a00728c0..1919ee487e68 100644
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
index 1982654e74a0..0252fe9590e7 100644
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
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
index 7cf8183ce76f..c354915e1f57 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
@@ -28,7 +28,6 @@ static const struct dpu_ubwc_cfg sm6350_ubwc_cfg = {
 static const struct dpu_mdp_cfg sm6350_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x494,
-	.features = 0,
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 		[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
index 24c4536e7981..54cc6ad8ee36 100644
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
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
index a9805ca1f5c5..163a6ca11aad 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
@@ -27,7 +27,6 @@ static const struct dpu_ubwc_cfg sm6375_ubwc_cfg = {
 static const struct dpu_mdp_cfg sm6375_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x494,
-	.features = 0,
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 		[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index 7db3a6969189..318bed612da5 100644
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

