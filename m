Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E68A653B9B2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jun 2022 15:30:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235327AbiFBNat (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Jun 2022 09:30:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235328AbiFBNar (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Jun 2022 09:30:47 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9AD73A180
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jun 2022 06:30:46 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id a2so7842636lfc.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jun 2022 06:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=i/XTMTD0LVXEOoIu5AuQp8qLO/Sbc1QaXul+C52u7gg=;
        b=jsDI4b/haxFCsoBrn7dU9i9An8wnGAlZcjnVw1sQDt3wotIeISdk6zv+6P129DCcm4
         dEYQz07HA1QMiH5iZ9jmk/zxyRpN+LbewTF1ZhbrTxyV7VmkRDMZvVZHMYkyBjTO1eJ1
         U1R8W1uhevxtfmLYNFpCqRsleGste5FqJl5s9F4kS+WQWjSN2JrBb06YtaTu2ckyAXGL
         MZHrwfWwXzFizDdTEODQYvGGHBOQGrNQX6PsG3PiMosj3+eWhAN/v7ji4y4jw1TlcIys
         tZdRtiplpRQWYBAsPCL28gdb6VY6E/j9wVh2beL/yPZ80OHvImMYCi+qzHA85z1d+Ks1
         vxwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=i/XTMTD0LVXEOoIu5AuQp8qLO/Sbc1QaXul+C52u7gg=;
        b=R1W/YPdDtTOOVFthPPjW9gw7KMPucS7HOHwBq3Yh1mZXtvBNyPS2+0cm0Yf8k7IPlj
         MPJ6CmRpqbzuX9901tOzE9Y7kH3C/elPGjExNlFVU/DzG4gcYakW5zV6D8cy6JO188+r
         Gyqho46CeN1jQbAzLWYczjHuDIqGvsdn3PdmpxSNAXNlMQ9PWkAhRkEXcackZH4uDoH8
         zP9iy/l1MIZUk7xX3eVKZmsinhxNzjs5bo6JHEpEl8qUP5g3MYQJfafvODetEp+KGOy+
         XHnMipF5W0bT1eV4lZG6K5fNH01QqLtLzbWMoGf/zWPbjvETrn0UY2d8s3YNjhI7Ax3N
         jRJQ==
X-Gm-Message-State: AOAM533GivGKT07oXv6Jpl2Xk2/7MvvIAFOzZcMGr/fSR5meFzdAxYrl
        oT3z24eQBt8NMQ3ugJS939J/8w==
X-Google-Smtp-Source: ABdhPJwDvB2WPgi2ZWzPXce68IAWarleZiNlSvM41A9N4oB2UdItmsjg+xBBt0Kxk5yBuiNN2p1OCg==
X-Received: by 2002:a05:6512:3dab:b0:478:f3ba:ac74 with SMTP id k43-20020a0565123dab00b00478f3baac74mr3614580lfv.506.1654176644908;
        Thu, 02 Jun 2022 06:30:44 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id i20-20020a056512341400b0047255d211a2sm1025399lfr.209.2022.06.02.06.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jun 2022 06:30:44 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, kernel test robot <lkp@intel.com>
Subject: [PATCH v2 5/7] drm/msm/dpu: change catalog->dma_cfg to be a const pointer
Date:   Thu,  2 Jun 2022 16:30:37 +0300
Message-Id: <20220602133039.1739490-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220602133039.1739490-1-dmitry.baryshkov@linaro.org>
References: <20220602133039.1739490-1-dmitry.baryshkov@linaro.org>
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
index a7040ca5da72..5470b8b14b0a 100644
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

