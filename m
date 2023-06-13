Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E53272D564
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jun 2023 02:10:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238355AbjFMAKV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Jun 2023 20:10:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238388AbjFMAKU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Jun 2023 20:10:20 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A5D2171D
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jun 2023 17:10:19 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4f611ac39c5so6131593e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jun 2023 17:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686615017; x=1689207017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Z6dm2XLnqrBhq2Tt8Kc44vvonw+W/q8cr8K+n2c5Go=;
        b=kL2zLIKc3K1RIhbcSBHGhQAZSxclG4Fzx8D+fnY2NCfT1Zmb0ak6YsafowDmc3bOCZ
         T7tB+c/xZigGfHYWhBJz/J0WkUPwbBTcDFMfyuzk928lwz6bh2YiMAwfqSl3Zye18+BS
         lDm8ZI7Q9G+d2HyRHOgFCCrd7MBefdW37PIuoe+3TrMB+ThK7ZOBUPrJbkW79+3EJNf2
         dZdwasg4ljziQ/pHbWy7rdeqZqx3DR04ZQfEnyAFMEus+N+q5YLLyn1pPldf7NL7NzXH
         0zh2W2OZnMHTtPOGTuIytCaIsJlhiN0GnZv3KFC4CFWGr1mCKDburgZ02hPs8XiweqJv
         t/lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686615017; x=1689207017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Z6dm2XLnqrBhq2Tt8Kc44vvonw+W/q8cr8K+n2c5Go=;
        b=citiy+JOo10Nm+gx0JaAIi2HL5CQJ+8HuG+wVTm7dK7w5WotjKGOlrSNUrXUmeiopP
         W5e+srV/cxJcXlI0LnD51w5I2E8RIhvV8erysHWzH2ahL+wRR9901rhumI9ztDENO9yb
         4VQxgVVNRPP5gmjI8bZnq++cJxnDU4PQL7Bu74QxXNA4WtnEoHK7eq+JPKxMMA9WVrX5
         EEQBcr/30IOJPWU8B96c5S/HMSyljrL4q8Ya9jM3gjd/e3t3yE2wGm0yHqgOvGXNoDlZ
         E9K0TgQ2cV3oTnnwrweQIUReI4EP8YmpdI9xIGxbAwyiZ6ZbYQwrEfzMYaYr//Zy/3Ys
         MGag==
X-Gm-Message-State: AC+VfDzN0HKe5cxQvdUJhyNnMw5xgryBYYCpxsTO8jMD9s/OI4nGzbR5
        dwC+JzCQXo5+DFb8YGC0pQ7E9Q==
X-Google-Smtp-Source: ACHHUZ4ymOIFZTCpo2UGGUHH/1lDi05HFldscAeD80cSZ6T1hiNar3lfd5/hDhCbJ9pqU+esdJAHdA==
X-Received: by 2002:a05:6512:340f:b0:4ef:f583:ee16 with SMTP id i15-20020a056512340f00b004eff583ee16mr5913368lfr.57.1686615017615;
        Mon, 12 Jun 2023 17:10:17 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id c10-20020ac2530a000000b004f63eea01a7sm1581604lfh.192.2023.06.12.17.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 17:10:16 -0700 (PDT)
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
Subject: [PATCH v2 11/22] drm/msm/dpu: drop zero features from dpu_ctl_cfg data
Date:   Tue, 13 Jun 2023 03:09:50 +0300
Message-Id: <20230613001004.3426676-12-dmitry.baryshkov@linaro.org>
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

Drop useless zero assignments to the dpu_ctl_cfg::features field.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h | 3 ---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h  | 3 ---
 2 files changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
index 757ac648a692..e0cc1ce3f3e2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
@@ -54,7 +54,6 @@ static const struct dpu_ctl_cfg msm8998_ctl[] = {
 	{
 	.name = "ctl_1", .id = CTL_1,
 	.base = 0x1200, .len = 0x94,
-	.features = 0,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	},
 	{
@@ -66,13 +65,11 @@ static const struct dpu_ctl_cfg msm8998_ctl[] = {
 	{
 	.name = "ctl_3", .id = CTL_3,
 	.base = 0x1600, .len = 0x94,
-	.features = 0,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	},
 	{
 	.name = "ctl_4", .id = CTL_4,
 	.base = 0x1800, .len = 0x94,
-	.features = 0,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
index 9fb8ef21c7f0..f52e1fa27e2c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -58,19 +58,16 @@ static const struct dpu_ctl_cfg sdm845_ctl[] = {
 	{
 	.name = "ctl_2", .id = CTL_2,
 	.base = 0x1400, .len = 0xe4,
-	.features = 0,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	},
 	{
 	.name = "ctl_3", .id = CTL_3,
 	.base = 0x1600, .len = 0xe4,
-	.features = 0,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	},
 	{
 	.name = "ctl_4", .id = CTL_4,
 	.base = 0x1800, .len = 0xe4,
-	.features = 0,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
 	},
 };
-- 
2.39.2

