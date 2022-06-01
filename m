Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6409A53A9C7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jun 2022 17:16:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355047AbiFAPQY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Jun 2022 11:16:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354999AbiFAPQX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Jun 2022 11:16:23 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1C7491568
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jun 2022 08:16:20 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id r8so1792668ljp.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jun 2022 08:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xYxlE5597ZcZmTlXF2dl5qXElXHwqjwPbfY34fV+gq0=;
        b=NMyVVf8m1xQ7ZOUDYpW2KARyNnALmY8z0jElziz1BK1nzXCnnBuRv0YQMJSJVTj4WC
         czVGOAbrhiB70WWft+3FlPUZ+0UqZWJGOCyROgO5l/G9NV0RAV7NumJozk7EbR7qaH5G
         KTMB4lSpRjW2Kc+ZJXNHrxqVSXRaOfd/IA+XaV10O/DTUKHcvxQmslbXznsyMG0GbABa
         wm7Dq+ml6qgToe10s2zXph5WD7+YDAmhN1Qiqh/77+cFg27NDKd+F+2f+echFHBMb/Yk
         stI2NSOHDoAv7Yw5MDHy98ZMhYPlfZK5ZXCKes0tLNXl3mNjh0QDM07m3PmPkx1Bg9Ko
         giFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xYxlE5597ZcZmTlXF2dl5qXElXHwqjwPbfY34fV+gq0=;
        b=ksfocm/V0eXABzAZyNvq4KUCaJa0KzhgcjR01nnwpozEAmvOsnVV+pplFf9T10WM1m
         1MVPvGSKdC/eTdb37CuohYk8AfqhdsiIPU9X6trQvgxPyVuMHrx89mjHyP6qWR5Fma7F
         5wBX/vMQbxjfXu20TEewRYMHyT4b6BUXFOrsq3my8hN8yIAdqP47mqVl24pCwq+oQl3X
         7uRK3M5cv4GjiS8rnY/xBjEthsHuENCdGJL9m9GGfvy524r3rl4Rr490ZhdhKYn6Eq36
         zOPP97UFZQyOQhAZN6EI3XLZ8SvLOrasIlhDGcVDvKnIutWqGkifNpwSRDWew+DlNW6Q
         ULyg==
X-Gm-Message-State: AOAM531YuD4Nh7qPPybREBkAjswusMVwrIERxIT/Dqidqln42muJ3EWA
        MwgwFMOr6fRMUsBE+x9u3GtyiQ==
X-Google-Smtp-Source: ABdhPJw21fh1qz67U+W52IZdQ991BCTvOALgbOSXfrlrucHsZpDMhwD0WRCX7i9FOBE1wV+9m+hYsg==
X-Received: by 2002:a2e:7f17:0:b0:253:adc1:697f with SMTP id a23-20020a2e7f17000000b00253adc1697fmr38070267ljd.418.1654096579171;
        Wed, 01 Jun 2022 08:16:19 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id bp17-20020a056512159100b0047255d21186sm415294lfb.181.2022.06.01.08.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 08:16:18 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v1 5/5] drm/msm/dpu: make dpu hardware catalog static const
Date:   Wed,  1 Jun 2022 18:16:13 +0300
Message-Id: <20220601151613.1513554-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220601151613.1513554-1-dmitry.baryshkov@linaro.org>
References: <20220601151613.1513554-1-dmitry.baryshkov@linaro.org>
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

Replace superfluous cfg_init functions, which just assign a static
config to the struct dpu_mdss_cfg, with static instances of struct
dpu_mdss_cfg.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 475 ++++++++----------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   2 +-
 3 files changed, 213 insertions(+), 269 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 28fc11e8da4f..67e3ab0b666d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -1722,283 +1722,228 @@ static const struct dpu_perf_cfg qcm2290_perf_data = {
 	.bw_inefficiency_factor = 120,
 };
 /*************************************************************
- * Hardware catalog init
+ * Hardware catalog
  *************************************************************/
 
-/*
- * msm8998_cfg_init(): populate sdm845 dpu sub-blocks reg offsets
- * and instance counts.
- */
-static void msm8998_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
-{
-	*dpu_cfg = (struct dpu_mdss_cfg){
-		.caps = &msm8998_dpu_caps,
-		.mdp_count = ARRAY_SIZE(msm8998_mdp),
-		.mdp = msm8998_mdp,
-		.ctl_count = ARRAY_SIZE(msm8998_ctl),
-		.ctl = msm8998_ctl,
-		.sspp_count = ARRAY_SIZE(msm8998_sspp),
-		.sspp = msm8998_sspp,
-		.mixer_count = ARRAY_SIZE(msm8998_lm),
-		.mixer = msm8998_lm,
-		.dspp_count = ARRAY_SIZE(msm8998_dspp),
-		.dspp = msm8998_dspp,
-		.pingpong_count = ARRAY_SIZE(sdm845_pp),
-		.pingpong = sdm845_pp,
-		.intf_count = ARRAY_SIZE(msm8998_intf),
-		.intf = msm8998_intf,
-		.vbif_count = ARRAY_SIZE(msm8998_vbif),
-		.vbif = msm8998_vbif,
-		.reg_dma_count = 0,
-		.perf = msm8998_perf_data,
-		.mdss_irqs = IRQ_SM8250_MASK,
-	};
-}
-
-/*
- * sdm845_cfg_init(): populate sdm845 dpu sub-blocks reg offsets
- * and instance counts.
- */
-static void sdm845_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
-{
-	*dpu_cfg = (struct dpu_mdss_cfg){
-		.caps = &sdm845_dpu_caps,
-		.mdp_count = ARRAY_SIZE(sdm845_mdp),
-		.mdp = sdm845_mdp,
-		.ctl_count = ARRAY_SIZE(sdm845_ctl),
-		.ctl = sdm845_ctl,
-		.sspp_count = ARRAY_SIZE(sdm845_sspp),
-		.sspp = sdm845_sspp,
-		.mixer_count = ARRAY_SIZE(sdm845_lm),
-		.mixer = sdm845_lm,
-		.pingpong_count = ARRAY_SIZE(sdm845_pp),
-		.pingpong = sdm845_pp,
-		.dsc_count = ARRAY_SIZE(sdm845_dsc),
-		.dsc = sdm845_dsc,
-		.intf_count = ARRAY_SIZE(sdm845_intf),
-		.intf = sdm845_intf,
-		.vbif_count = ARRAY_SIZE(sdm845_vbif),
-		.vbif = sdm845_vbif,
-		.reg_dma_count = 1,
-		.dma_cfg = sdm845_regdma,
-		.perf = sdm845_perf_data,
-		.mdss_irqs = IRQ_SDM845_MASK,
-	};
-}
-
-/*
- * sc7180_cfg_init(): populate sc7180 dpu sub-blocks reg offsets
- * and instance counts.
- */
-static void sc7180_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
-{
-	*dpu_cfg = (struct dpu_mdss_cfg){
-		.caps = &sc7180_dpu_caps,
-		.mdp_count = ARRAY_SIZE(sc7180_mdp),
-		.mdp = sc7180_mdp,
-		.ctl_count = ARRAY_SIZE(sc7180_ctl),
-		.ctl = sc7180_ctl,
-		.sspp_count = ARRAY_SIZE(sc7180_sspp),
-		.sspp = sc7180_sspp,
-		.mixer_count = ARRAY_SIZE(sc7180_lm),
-		.mixer = sc7180_lm,
-		.dspp_count = ARRAY_SIZE(sc7180_dspp),
-		.dspp = sc7180_dspp,
-		.pingpong_count = ARRAY_SIZE(sc7180_pp),
-		.pingpong = sc7180_pp,
-		.intf_count = ARRAY_SIZE(sc7180_intf),
-		.intf = sc7180_intf,
-		.vbif_count = ARRAY_SIZE(sdm845_vbif),
-		.vbif = sdm845_vbif,
-		.reg_dma_count = 1,
-		.dma_cfg = sdm845_regdma,
-		.perf = sc7180_perf_data,
-		.mdss_irqs = IRQ_SC7180_MASK,
-	};
-}
-
-/*
- * sm8150_cfg_init(): populate sm8150 dpu sub-blocks reg offsets
- * and instance counts.
- */
-static void sm8150_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
-{
-	*dpu_cfg = (struct dpu_mdss_cfg){
-		.caps = &sm8150_dpu_caps,
-		.mdp_count = ARRAY_SIZE(sdm845_mdp),
-		.mdp = sdm845_mdp,
-		.ctl_count = ARRAY_SIZE(sm8150_ctl),
-		.ctl = sm8150_ctl,
-		.sspp_count = ARRAY_SIZE(sdm845_sspp),
-		.sspp = sdm845_sspp,
-		.mixer_count = ARRAY_SIZE(sm8150_lm),
-		.mixer = sm8150_lm,
-		.dspp_count = ARRAY_SIZE(sm8150_dspp),
-		.dspp = sm8150_dspp,
-		.pingpong_count = ARRAY_SIZE(sm8150_pp),
-		.pingpong = sm8150_pp,
-		.merge_3d_count = ARRAY_SIZE(sm8150_merge_3d),
-		.merge_3d = sm8150_merge_3d,
-		.intf_count = ARRAY_SIZE(sm8150_intf),
-		.intf = sm8150_intf,
-		.vbif_count = ARRAY_SIZE(sdm845_vbif),
-		.vbif = sdm845_vbif,
-		.reg_dma_count = 1,
-		.dma_cfg = sm8150_regdma,
-		.perf = sm8150_perf_data,
-		.mdss_irqs = IRQ_SDM845_MASK,
-	};
-}
-
-/*
- * sc8180x_cfg_init(): populate sc8180 dpu sub-blocks reg offsets
- * and instance counts.
- */
-static void sc8180x_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
-{
-	*dpu_cfg = (struct dpu_mdss_cfg){
-		.caps = &sc8180x_dpu_caps,
-		.mdp_count = ARRAY_SIZE(sc8180x_mdp),
-		.mdp = sc8180x_mdp,
-		.ctl_count = ARRAY_SIZE(sm8150_ctl),
-		.ctl = sm8150_ctl,
-		.sspp_count = ARRAY_SIZE(sdm845_sspp),
-		.sspp = sdm845_sspp,
-		.mixer_count = ARRAY_SIZE(sm8150_lm),
-		.mixer = sm8150_lm,
-		.pingpong_count = ARRAY_SIZE(sm8150_pp),
-		.pingpong = sm8150_pp,
-		.merge_3d_count = ARRAY_SIZE(sm8150_merge_3d),
-		.merge_3d = sm8150_merge_3d,
-		.intf_count = ARRAY_SIZE(sc8180x_intf),
-		.intf = sc8180x_intf,
-		.vbif_count = ARRAY_SIZE(sdm845_vbif),
-		.vbif = sdm845_vbif,
-		.reg_dma_count = 1,
-		.dma_cfg = sm8150_regdma,
-		.perf = sc8180x_perf_data,
-		.mdss_irqs = IRQ_SC8180X_MASK,
-	};
-}
-
-/*
- * sm8250_cfg_init(): populate sm8250 dpu sub-blocks reg offsets
- * and instance counts.
- */
-static void sm8250_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
-{
-	*dpu_cfg = (struct dpu_mdss_cfg){
-		.caps = &sm8250_dpu_caps,
-		.mdp_count = ARRAY_SIZE(sm8250_mdp),
-		.mdp = sm8250_mdp,
-		.ctl_count = ARRAY_SIZE(sm8150_ctl),
-		.ctl = sm8150_ctl,
-		.sspp_count = ARRAY_SIZE(sm8250_sspp),
-		.sspp = sm8250_sspp,
-		.mixer_count = ARRAY_SIZE(sm8150_lm),
-		.mixer = sm8150_lm,
-		.dspp_count = ARRAY_SIZE(sm8150_dspp),
-		.dspp = sm8150_dspp,
-		.pingpong_count = ARRAY_SIZE(sm8150_pp),
-		.pingpong = sm8150_pp,
-		.merge_3d_count = ARRAY_SIZE(sm8150_merge_3d),
-		.merge_3d = sm8150_merge_3d,
-		.intf_count = ARRAY_SIZE(sm8150_intf),
-		.intf = sm8150_intf,
-		.vbif_count = ARRAY_SIZE(sdm845_vbif),
-		.vbif = sdm845_vbif,
-		.wb_count = ARRAY_SIZE(sm8250_wb),
-		.wb = sm8250_wb,
-		.reg_dma_count = 1,
-		.dma_cfg = sm8250_regdma,
-		.perf = sm8250_perf_data,
-		.mdss_irqs = IRQ_SM8250_MASK,
-	};
-}
-
-static void sc7280_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
-{
-	*dpu_cfg = (struct dpu_mdss_cfg){
-		.caps = &sc7280_dpu_caps,
-		.mdp_count = ARRAY_SIZE(sc7280_mdp),
-		.mdp = sc7280_mdp,
-		.ctl_count = ARRAY_SIZE(sc7280_ctl),
-		.ctl = sc7280_ctl,
-		.sspp_count = ARRAY_SIZE(sc7280_sspp),
-		.sspp = sc7280_sspp,
-		.mixer_count = ARRAY_SIZE(sc7280_lm),
-		.mixer = sc7280_lm,
-		.pingpong_count = ARRAY_SIZE(sc7280_pp),
-		.pingpong = sc7280_pp,
-		.intf_count = ARRAY_SIZE(sc7280_intf),
-		.intf = sc7280_intf,
-		.vbif_count = ARRAY_SIZE(sdm845_vbif),
-		.vbif = sdm845_vbif,
-		.perf = sc7280_perf_data,
-		.mdss_irqs = IRQ_SC7280_MASK,
-	};
-}
-
-
-/*
- * qcm2290_cfg_init(): populate qcm2290 dpu sub-blocks reg offsets
- * and instance counts.
- */
-static void qcm2290_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
-{
-	*dpu_cfg = (struct dpu_mdss_cfg){
-		.caps = &qcm2290_dpu_caps,
-		.mdp_count = ARRAY_SIZE(qcm2290_mdp),
-		.mdp = qcm2290_mdp,
-		.ctl_count = ARRAY_SIZE(qcm2290_ctl),
-		.ctl = qcm2290_ctl,
-		.sspp_count = ARRAY_SIZE(qcm2290_sspp),
-		.sspp = qcm2290_sspp,
-		.mixer_count = ARRAY_SIZE(qcm2290_lm),
-		.mixer = qcm2290_lm,
-		.dspp_count = ARRAY_SIZE(qcm2290_dspp),
-		.dspp = qcm2290_dspp,
-		.pingpong_count = ARRAY_SIZE(qcm2290_pp),
-		.pingpong = qcm2290_pp,
-		.intf_count = ARRAY_SIZE(qcm2290_intf),
-		.intf = qcm2290_intf,
-		.vbif_count = ARRAY_SIZE(sdm845_vbif),
-		.vbif = sdm845_vbif,
-		.reg_dma_count = 1,
-		.dma_cfg = sdm845_regdma,
-		.perf = qcm2290_perf_data,
-		.mdss_irqs = IRQ_SC7180_MASK,
-	};
-}
+static const struct dpu_mdss_cfg msm8998_dpu_cfg = {
+	.caps = &msm8998_dpu_caps,
+	.mdp_count = ARRAY_SIZE(msm8998_mdp),
+	.mdp = msm8998_mdp,
+	.ctl_count = ARRAY_SIZE(msm8998_ctl),
+	.ctl = msm8998_ctl,
+	.sspp_count = ARRAY_SIZE(msm8998_sspp),
+	.sspp = msm8998_sspp,
+	.mixer_count = ARRAY_SIZE(msm8998_lm),
+	.mixer = msm8998_lm,
+	.dspp_count = ARRAY_SIZE(msm8998_dspp),
+	.dspp = msm8998_dspp,
+	.pingpong_count = ARRAY_SIZE(sdm845_pp),
+	.pingpong = sdm845_pp,
+	.intf_count = ARRAY_SIZE(msm8998_intf),
+	.intf = msm8998_intf,
+	.vbif_count = ARRAY_SIZE(msm8998_vbif),
+	.vbif = msm8998_vbif,
+	.reg_dma_count = 0,
+	.perf = msm8998_perf_data,
+	.mdss_irqs = IRQ_SM8250_MASK,
+};
+
+static const struct dpu_mdss_cfg sdm845_dpu_cfg = {
+	.caps = &sdm845_dpu_caps,
+	.mdp_count = ARRAY_SIZE(sdm845_mdp),
+	.mdp = sdm845_mdp,
+	.ctl_count = ARRAY_SIZE(sdm845_ctl),
+	.ctl = sdm845_ctl,
+	.sspp_count = ARRAY_SIZE(sdm845_sspp),
+	.sspp = sdm845_sspp,
+	.mixer_count = ARRAY_SIZE(sdm845_lm),
+	.mixer = sdm845_lm,
+	.pingpong_count = ARRAY_SIZE(sdm845_pp),
+	.pingpong = sdm845_pp,
+	.dsc_count = ARRAY_SIZE(sdm845_dsc),
+	.dsc = sdm845_dsc,
+	.intf_count = ARRAY_SIZE(sdm845_intf),
+	.intf = sdm845_intf,
+	.vbif_count = ARRAY_SIZE(sdm845_vbif),
+	.vbif = sdm845_vbif,
+	.reg_dma_count = 1,
+	.dma_cfg = sdm845_regdma,
+	.perf = sdm845_perf_data,
+	.mdss_irqs = IRQ_SDM845_MASK,
+};
+
+static const struct dpu_mdss_cfg sc7180_dpu_cfg = {
+	.caps = &sc7180_dpu_caps,
+	.mdp_count = ARRAY_SIZE(sc7180_mdp),
+	.mdp = sc7180_mdp,
+	.ctl_count = ARRAY_SIZE(sc7180_ctl),
+	.ctl = sc7180_ctl,
+	.sspp_count = ARRAY_SIZE(sc7180_sspp),
+	.sspp = sc7180_sspp,
+	.mixer_count = ARRAY_SIZE(sc7180_lm),
+	.mixer = sc7180_lm,
+	.dspp_count = ARRAY_SIZE(sc7180_dspp),
+	.dspp = sc7180_dspp,
+	.pingpong_count = ARRAY_SIZE(sc7180_pp),
+	.pingpong = sc7180_pp,
+	.intf_count = ARRAY_SIZE(sc7180_intf),
+	.intf = sc7180_intf,
+	.vbif_count = ARRAY_SIZE(sdm845_vbif),
+	.vbif = sdm845_vbif,
+	.reg_dma_count = 1,
+	.dma_cfg = sdm845_regdma,
+	.perf = sc7180_perf_data,
+	.mdss_irqs = IRQ_SC7180_MASK,
+};
+
+static const struct dpu_mdss_cfg sm8150_dpu_cfg = {
+	.caps = &sm8150_dpu_caps,
+	.mdp_count = ARRAY_SIZE(sdm845_mdp),
+	.mdp = sdm845_mdp,
+	.ctl_count = ARRAY_SIZE(sm8150_ctl),
+	.ctl = sm8150_ctl,
+	.sspp_count = ARRAY_SIZE(sdm845_sspp),
+	.sspp = sdm845_sspp,
+	.mixer_count = ARRAY_SIZE(sm8150_lm),
+	.mixer = sm8150_lm,
+	.dspp_count = ARRAY_SIZE(sm8150_dspp),
+	.dspp = sm8150_dspp,
+	.pingpong_count = ARRAY_SIZE(sm8150_pp),
+	.pingpong = sm8150_pp,
+	.merge_3d_count = ARRAY_SIZE(sm8150_merge_3d),
+	.merge_3d = sm8150_merge_3d,
+	.intf_count = ARRAY_SIZE(sm8150_intf),
+	.intf = sm8150_intf,
+	.vbif_count = ARRAY_SIZE(sdm845_vbif),
+	.vbif = sdm845_vbif,
+	.reg_dma_count = 1,
+	.dma_cfg = sm8150_regdma,
+	.perf = sm8150_perf_data,
+	.mdss_irqs = IRQ_SDM845_MASK,
+};
+
+static const struct dpu_mdss_cfg sc8180x_dpu_cfg = {
+	.caps = &sc8180x_dpu_caps,
+	.mdp_count = ARRAY_SIZE(sc8180x_mdp),
+	.mdp = sc8180x_mdp,
+	.ctl_count = ARRAY_SIZE(sm8150_ctl),
+	.ctl = sm8150_ctl,
+	.sspp_count = ARRAY_SIZE(sdm845_sspp),
+	.sspp = sdm845_sspp,
+	.mixer_count = ARRAY_SIZE(sm8150_lm),
+	.mixer = sm8150_lm,
+	.pingpong_count = ARRAY_SIZE(sm8150_pp),
+	.pingpong = sm8150_pp,
+	.merge_3d_count = ARRAY_SIZE(sm8150_merge_3d),
+	.merge_3d = sm8150_merge_3d,
+	.intf_count = ARRAY_SIZE(sc8180x_intf),
+	.intf = sc8180x_intf,
+	.vbif_count = ARRAY_SIZE(sdm845_vbif),
+	.vbif = sdm845_vbif,
+	.reg_dma_count = 1,
+	.dma_cfg = sm8150_regdma,
+	.perf = sc8180x_perf_data,
+	.mdss_irqs = IRQ_SC8180X_MASK,
+};
+
+static const struct dpu_mdss_cfg sm8250_dpu_cfg = {
+	.caps = &sm8250_dpu_caps,
+	.mdp_count = ARRAY_SIZE(sm8250_mdp),
+	.mdp = sm8250_mdp,
+	.ctl_count = ARRAY_SIZE(sm8150_ctl),
+	.ctl = sm8150_ctl,
+	.sspp_count = ARRAY_SIZE(sm8250_sspp),
+	.sspp = sm8250_sspp,
+	.mixer_count = ARRAY_SIZE(sm8150_lm),
+	.mixer = sm8150_lm,
+	.dspp_count = ARRAY_SIZE(sm8150_dspp),
+	.dspp = sm8150_dspp,
+	.pingpong_count = ARRAY_SIZE(sm8150_pp),
+	.pingpong = sm8150_pp,
+	.merge_3d_count = ARRAY_SIZE(sm8150_merge_3d),
+	.merge_3d = sm8150_merge_3d,
+	.intf_count = ARRAY_SIZE(sm8150_intf),
+	.intf = sm8150_intf,
+	.vbif_count = ARRAY_SIZE(sdm845_vbif),
+	.vbif = sdm845_vbif,
+	.wb_count = ARRAY_SIZE(sm8250_wb),
+	.wb = sm8250_wb,
+	.reg_dma_count = 1,
+	.dma_cfg = sm8250_regdma,
+	.perf = sm8250_perf_data,
+	.mdss_irqs = IRQ_SM8250_MASK,
+};
+
+static const struct dpu_mdss_cfg sc7280_dpu_cfg = {
+	.caps = &sc7280_dpu_caps,
+	.mdp_count = ARRAY_SIZE(sc7280_mdp),
+	.mdp = sc7280_mdp,
+	.ctl_count = ARRAY_SIZE(sc7280_ctl),
+	.ctl = sc7280_ctl,
+	.sspp_count = ARRAY_SIZE(sc7280_sspp),
+	.sspp = sc7280_sspp,
+	.mixer_count = ARRAY_SIZE(sc7280_lm),
+	.mixer = sc7280_lm,
+	.pingpong_count = ARRAY_SIZE(sc7280_pp),
+	.pingpong = sc7280_pp,
+	.intf_count = ARRAY_SIZE(sc7280_intf),
+	.intf = sc7280_intf,
+	.vbif_count = ARRAY_SIZE(sdm845_vbif),
+	.vbif = sdm845_vbif,
+	.perf = sc7280_perf_data,
+	.mdss_irqs = IRQ_SC7280_MASK,
+};
+
+static const struct dpu_mdss_cfg qcm2290_dpu_cfg = {
+	.caps = &qcm2290_dpu_caps,
+	.mdp_count = ARRAY_SIZE(qcm2290_mdp),
+	.mdp = qcm2290_mdp,
+	.ctl_count = ARRAY_SIZE(qcm2290_ctl),
+	.ctl = qcm2290_ctl,
+	.sspp_count = ARRAY_SIZE(qcm2290_sspp),
+	.sspp = qcm2290_sspp,
+	.mixer_count = ARRAY_SIZE(qcm2290_lm),
+	.mixer = qcm2290_lm,
+	.dspp_count = ARRAY_SIZE(qcm2290_dspp),
+	.dspp = qcm2290_dspp,
+	.pingpong_count = ARRAY_SIZE(qcm2290_pp),
+	.pingpong = qcm2290_pp,
+	.intf_count = ARRAY_SIZE(qcm2290_intf),
+	.intf = qcm2290_intf,
+	.vbif_count = ARRAY_SIZE(sdm845_vbif),
+	.vbif = sdm845_vbif,
+	.reg_dma_count = 1,
+	.dma_cfg = sdm845_regdma,
+	.perf = qcm2290_perf_data,
+	.mdss_irqs = IRQ_SC7180_MASK,
+};
 
 static const struct dpu_mdss_hw_cfg_handler cfg_handler[] = {
-	{ .hw_rev = DPU_HW_VER_300, .cfg_init = msm8998_cfg_init},
-	{ .hw_rev = DPU_HW_VER_301, .cfg_init = msm8998_cfg_init},
-	{ .hw_rev = DPU_HW_VER_400, .cfg_init = sdm845_cfg_init},
-	{ .hw_rev = DPU_HW_VER_401, .cfg_init = sdm845_cfg_init},
-	{ .hw_rev = DPU_HW_VER_500, .cfg_init = sm8150_cfg_init},
-	{ .hw_rev = DPU_HW_VER_501, .cfg_init = sm8150_cfg_init},
-	{ .hw_rev = DPU_HW_VER_510, .cfg_init = sc8180x_cfg_init},
-	{ .hw_rev = DPU_HW_VER_600, .cfg_init = sm8250_cfg_init},
-	{ .hw_rev = DPU_HW_VER_620, .cfg_init = sc7180_cfg_init},
-	{ .hw_rev = DPU_HW_VER_650, .cfg_init = qcm2290_cfg_init},
-	{ .hw_rev = DPU_HW_VER_720, .cfg_init = sc7280_cfg_init},
-};
-
-const struct dpu_mdss_cfg *dpu_hw_catalog_init(struct device *dev, u32 hw_rev)
+	{ .hw_rev = DPU_HW_VER_300, .dpu_cfg = &msm8998_dpu_cfg},
+	{ .hw_rev = DPU_HW_VER_301, .dpu_cfg = &msm8998_dpu_cfg},
+	{ .hw_rev = DPU_HW_VER_400, .dpu_cfg = &sdm845_dpu_cfg},
+	{ .hw_rev = DPU_HW_VER_401, .dpu_cfg = &sdm845_dpu_cfg},
+	{ .hw_rev = DPU_HW_VER_500, .dpu_cfg = &sm8150_dpu_cfg},
+	{ .hw_rev = DPU_HW_VER_501, .dpu_cfg = &sm8150_dpu_cfg},
+	{ .hw_rev = DPU_HW_VER_510, .dpu_cfg = &sc8180x_dpu_cfg},
+	{ .hw_rev = DPU_HW_VER_600, .dpu_cfg = &sm8250_dpu_cfg},
+	{ .hw_rev = DPU_HW_VER_620, .dpu_cfg = &sc7180_dpu_cfg},
+	{ .hw_rev = DPU_HW_VER_650, .dpu_cfg = &qcm2290_dpu_cfg},
+	{ .hw_rev = DPU_HW_VER_720, .dpu_cfg = &sc7280_dpu_cfg},
+};
+
+const struct dpu_mdss_cfg *dpu_hw_catalog_init(u32 hw_rev)
 {
 	int i;
 	struct dpu_mdss_cfg *dpu_cfg;
 
-	dpu_cfg = devm_kzalloc(dev, sizeof(*dpu_cfg), GFP_KERNEL);
+	dpu_cfg = kzalloc(sizeof(*dpu_cfg), GFP_KERNEL);
 	if (!dpu_cfg)
 		return ERR_PTR(-ENOMEM);
 
 	for (i = 0; i < ARRAY_SIZE(cfg_handler); i++) {
-		if (cfg_handler[i].hw_rev == hw_rev) {
-			cfg_handler[i].cfg_init(dpu_cfg);
-			return dpu_cfg;
-		}
+		if (cfg_handler[i].hw_rev == hw_rev)
+			return cfg_handler[i].dpu_cfg;
 	}
 
 	DPU_ERROR("unsupported chipset id:%X\n", hw_rev);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 4e0d1ae21f6f..1c26b6180d01 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -878,17 +878,16 @@ struct dpu_mdss_cfg {
 
 struct dpu_mdss_hw_cfg_handler {
 	u32 hw_rev;
-	void (*cfg_init)(struct dpu_mdss_cfg *dpu_cfg);
+	const struct dpu_mdss_cfg *dpu_cfg;
 };
 
 /**
  * dpu_hw_catalog_init - dpu hardware catalog init API retrieves
  * hardcoded target specific catalog information in config structure
- * @dev:          DPU device
  * @hw_rev:       caller needs provide the hardware revision.
  *
  * Return: dpu config structure
  */
-const struct dpu_mdss_cfg *dpu_hw_catalog_init(struct device *dev, u32 hw_rev);
+const struct dpu_mdss_cfg *dpu_hw_catalog_init(u32 hw_rev);
 
 #endif /* _DPU_HW_CATALOG_H */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index bba29c31f843..688dc4409af6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1093,7 +1093,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 
 	pr_info("dpu hardware revision:0x%x\n", dpu_kms->core_rev);
 
-	dpu_kms->catalog = dpu_hw_catalog_init(dev->dev, dpu_kms->core_rev);
+	dpu_kms->catalog = dpu_hw_catalog_init(dpu_kms->core_rev);
 	if (IS_ERR_OR_NULL(dpu_kms->catalog)) {
 		rc = PTR_ERR(dpu_kms->catalog);
 		if (!dpu_kms->catalog)
-- 
2.35.1

