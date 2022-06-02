Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01CE353BFA4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jun 2022 22:22:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238891AbiFBUWY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Jun 2022 16:22:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238732AbiFBUWU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Jun 2022 16:22:20 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DAE82AC3
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jun 2022 13:22:18 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id v9so6393200lja.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jun 2022 13:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uAheKADgU7FFP6gs93z+GaOaC3MGdLNxwxQqmTpG/bA=;
        b=D3GCEaEybSNUlwfKdNCWFDDhq05pNjKhofiz2sWBEqA1RP9cyAhrk8BKtt13L2jyMW
         w7kr0UNjDwgU1bOISh53bcvjEdNE/ZtCCnMYKM/dHA/Bz6w4mCSlQf6Z56oCqdHrQ2UN
         7OwVjBQwnHspIx2lwbyVo2J9YNe6+zhHfKR/yTk7m+b3FEY/b5pJJwNi6oAySoSTUzOV
         759f0pAD9LGvhZ2nFGnjAJqTgu1gmbgFsZmowlB3IYndRVTAbIaHJWH05kG5c80pO03c
         AcQYJDROZfbVQEtaLiaQ9owrfv8DwJlGJQly2xPOFVGi8XqluImOAFAx9Q8pFlITbnmu
         N8cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uAheKADgU7FFP6gs93z+GaOaC3MGdLNxwxQqmTpG/bA=;
        b=Ln4e7pshZ1fwHTaywOllbz7hQuPmjML3pqR5lfaimycD3q4Iewm12VhloJP2cAlvxK
         D55WyfIGrfByaFLkWfHF3m/8AyxTGi928cNIyU0R2TN3UwWWzlBqO8F8gWVu6CPo49dM
         CAvmg/v07ASY0e9zlXG9DboNRrdW9ZI+r4r3RhRXoUyY2ABs48OmINaHrMunjnoonR9r
         ruDfUpZ9t3qCTX3MnNxtj5dfLYzVUpYVm7FxRV52GDTKRY5CwbEcrZemjmxG70ReJ1yc
         YooQjN5Z6uZxuboWFkV+Hk2vpnjT6HdSy9Ek1Eh87FkuPDOufvPUyRHyB2p0k3DI7MEE
         /RNA==
X-Gm-Message-State: AOAM533pZKsMl+TKg3p6YITQKyJCJs8M71FjZ8y/DQ0b+DiQB7QuJi5G
        8kx16maUUS6oPKh93ZbIbMAbFQ==
X-Google-Smtp-Source: ABdhPJwMP111n9Zn+7SslGSwDoOCodjdDUIQjtvndgQXrDbsgDChIQPyuo1z1YpOSjWkSH4GJRW8QA==
X-Received: by 2002:a2e:9695:0:b0:255:6eb1:469c with SMTP id q21-20020a2e9695000000b002556eb1469cmr4979483lji.188.1654201336459;
        Thu, 02 Jun 2022 13:22:16 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([94.25.229.139])
        by smtp.gmail.com with ESMTPSA id p12-20020a2e740c000000b0024f3d1daef5sm992451ljc.125.2022.06.02.13.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jun 2022 13:22:16 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, kernel test robot <lkp@intel.com>
Subject: [PATCH v3 5/7] drm/msm/dpu: change catalog->dma_cfg to be a const pointer
Date:   Thu,  2 Jun 2022 23:22:05 +0300
Message-Id: <20220602202207.1754351-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220602202207.1754351-1-dmitry.baryshkov@linaro.org>
References: <20220602202207.1754351-1-dmitry.baryshkov@linaro.org>
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

Change dpu_mdss_cfg::dma_cfg to be a const pointer rather than embedding
the dpu_reg_dma_cfg struct into the struct dpu_mdss_cfg.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 12 ++++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 95b3ecc4db60..cca3b3a0c231 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -1780,7 +1780,7 @@ static void sdm845_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
 		.vbif_count = ARRAY_SIZE(sdm845_vbif),
 		.vbif = sdm845_vbif,
 		.reg_dma_count = 1,
-		.dma_cfg = sdm845_regdma,
+		.dma_cfg = &sdm845_regdma,
 		.perf = &sdm845_perf_data,
 		.mdss_irqs = IRQ_SDM845_MASK,
 	};
@@ -1811,7 +1811,7 @@ static void sc7180_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
 		.vbif_count = ARRAY_SIZE(sdm845_vbif),
 		.vbif = sdm845_vbif,
 		.reg_dma_count = 1,
-		.dma_cfg = sdm845_regdma,
+		.dma_cfg = &sdm845_regdma,
 		.perf = &sc7180_perf_data,
 		.mdss_irqs = IRQ_SC7180_MASK,
 	};
@@ -1844,7 +1844,7 @@ static void sm8150_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
 		.vbif_count = ARRAY_SIZE(sdm845_vbif),
 		.vbif = sdm845_vbif,
 		.reg_dma_count = 1,
-		.dma_cfg = sm8150_regdma,
+		.dma_cfg = &sm8150_regdma,
 		.perf = &sm8150_perf_data,
 		.mdss_irqs = IRQ_SDM845_MASK,
 	};
@@ -1875,7 +1875,7 @@ static void sc8180x_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
 		.vbif_count = ARRAY_SIZE(sdm845_vbif),
 		.vbif = sdm845_vbif,
 		.reg_dma_count = 1,
-		.dma_cfg = sm8150_regdma,
+		.dma_cfg = &sm8150_regdma,
 		.perf = &sc8180x_perf_data,
 		.mdss_irqs = IRQ_SC8180X_MASK,
 	};
@@ -1910,7 +1910,7 @@ static void sm8250_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
 		.wb_count = ARRAY_SIZE(sm8250_wb),
 		.wb = sm8250_wb,
 		.reg_dma_count = 1,
-		.dma_cfg = sm8250_regdma,
+		.dma_cfg = &sm8250_regdma,
 		.perf = &sm8250_perf_data,
 		.mdss_irqs = IRQ_SM8250_MASK,
 	};
@@ -1965,7 +1965,7 @@ static void qcm2290_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
 		.vbif_count = ARRAY_SIZE(sdm845_vbif),
 		.vbif = sdm845_vbif,
 		.reg_dma_count = 1,
-		.dma_cfg = sdm845_regdma,
+		.dma_cfg = &sdm845_regdma,
 		.perf = &qcm2290_perf_data,
 		.mdss_irqs = IRQ_SC7180_MASK,
 	};
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 64ed96b2fa3d..60b403ac9f0f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -859,7 +859,7 @@ struct dpu_mdss_cfg {
 	const struct dpu_wb_cfg *wb;
 
 	u32 reg_dma_count;
-	struct dpu_reg_dma_cfg dma_cfg;
+	const struct dpu_reg_dma_cfg *dma_cfg;
 
 	u32 ad_count;
 
-- 
2.35.1

