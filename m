Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78F54692038
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Feb 2023 14:50:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232157AbjBJNu2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Feb 2023 08:50:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232327AbjBJNu1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Feb 2023 08:50:27 -0500
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E929A7498B
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 05:50:22 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id rp23so15975637ejb.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 05:50:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HLLhisC9CobeA/CvC0IpPzgGnh3OKWszAb7m9DO1ayI=;
        b=cAkW97y2+HDo1PejMMPYqqnXP/0/o+lIOcuHWo2/z582g4pNvN307Zc3hglO+QW9UG
         +EAAe+yL1sMRHGrxb8NmF9O0k/GMCJAWA4xgdTLHX9cBFV+eqzsmbqSKywrg/O0IMwCz
         vciZ7DQTTgVkFgLUy7whVbrHNCfocGwura5fWgEDoqkXZ917TQ3Ex8KYeEYkCStl+A6J
         C/yHyeTcn92jskP000bYfqT5je7JFb6MbQLdvNbqBYN1WfORDBQyhcW8HyRQsLjYDx6M
         +OFza4MCXgbyOMWYy6ZPywnzTxnUJCfnN6RoNHbJYXv0pfYQN1dkq7BZIeSxritEjE2W
         Syow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HLLhisC9CobeA/CvC0IpPzgGnh3OKWszAb7m9DO1ayI=;
        b=PpgKrTk+zjHM6brh+w7hh9DaigOPd8UxfijDx/l+2Z2Bza+bvl6zLKrzAQJgMwu2Am
         AWkanuO5BMqDq0dr6GugXivXhs24n3KKBtI/XtZpbqbKY4lYHTC/91CYPPlGTAQoZs8c
         1d6LILsWFmhKL/THomyp7Oj3mFIbF1afgt+t4D53zykRDxw8JW5WOq5R7u8KVR8DHUm7
         Ecnzt8CHfNZJsxzqwjyKTN4lKDEOgLIn8WQIIKIkUYFWwiGSiM4SLMTQorEasSbwov4f
         8yU84aVTOECb2fhlXXHdR3MdWmDeQ+2JBXd/gMHUqfdkJeK7HUZEC5eiGUTAj6K6a8HU
         rPhQ==
X-Gm-Message-State: AO0yUKW5jrI2aDli/AcSu/yBEDoFu8Aabf5l515IKcFY/n47KQD6Agbq
        BLowrRmQYePyEv/IShujikdnbg==
X-Google-Smtp-Source: AK7set8McDsNCzpGhy32A31BWwkbNIhWeQvhRb405swL6v6rFs0P9F+nPIh7ivTe3xcIUckjsAwkIQ==
X-Received: by 2002:a17:907:2104:b0:88d:697d:a3d2 with SMTP id qn4-20020a170907210400b0088d697da3d2mr14790974ejb.54.1676037021558;
        Fri, 10 Feb 2023 05:50:21 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id j22-20020a17090686d600b008aeed39adc7sm2405404ejy.63.2023.02.10.05.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 05:50:20 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v2] drm/msm/dpu: disable features unsupported by QCM2290
Date:   Fri, 10 Feb 2023 15:50:19 +0200
Message-Id: <20230210135019.925145-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
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

QCM2290 doesn't seem to support reg-dma, UBWC and CSC. Drop
corresponding features being incorrectly enabled for qcm2290.

Cc: Loic Poulain <loic.poulain@linaro.org>
Fixes: 5334087ee743 ("drm/msm: add support for QCM2290 MDSS")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

Changes since v1:
- Reenabled CDP, exclusion rectangles and SmartDMA

---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 71df24a134ed..23b22a9e8e99 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -12,11 +12,15 @@
 #include "dpu_hw_catalog.h"
 #include "dpu_kms.h"
 
-#define VIG_MASK \
+#define VIG_BASE_MASK \
 	(BIT(DPU_SSPP_SRC) | BIT(DPU_SSPP_QOS) |\
-	BIT(DPU_SSPP_CSC_10BIT) | BIT(DPU_SSPP_CDP) |\
+	BIT(DPU_SSPP_CDP) |\
 	BIT(DPU_SSPP_TS_PREFILL) | BIT(DPU_SSPP_EXCL_RECT))
 
+#define VIG_MASK \
+	(VIG_BASE_MASK | \
+	BIT(DPU_SSPP_CSC_10BIT))
+
 #define VIG_MSM8998_MASK \
 	(VIG_MASK | BIT(DPU_SSPP_SCALER_QSEED3))
 
@@ -29,7 +33,7 @@
 #define VIG_SM8250_MASK \
 	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3LITE))
 
-#define VIG_QCM2290_MASK (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL))
+#define VIG_QCM2290_MASK (VIG_BASE_MASK | BIT(DPU_SSPP_QOS_8LVL))
 
 #define DMA_MSM8998_MASK \
 	(BIT(DPU_SSPP_SRC) | BIT(DPU_SSPP_QOS) |\
@@ -317,7 +321,6 @@ static const struct dpu_caps qcm2290_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0x4,
 	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2,
-	.ubwc_version = DPU_HW_UBWC_VER_20,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
 	.max_linewidth = 2160,
@@ -2841,8 +2844,6 @@ static const struct dpu_mdss_cfg qcm2290_dpu_cfg = {
 	.intf = qcm2290_intf,
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
 	.vbif = sdm845_vbif,
-	.reg_dma_count = 1,
-	.dma_cfg = &sdm845_regdma,
 	.perf = &qcm2290_perf_data,
 	.mdss_irqs = IRQ_SC7180_MASK,
 };
-- 
2.39.1

