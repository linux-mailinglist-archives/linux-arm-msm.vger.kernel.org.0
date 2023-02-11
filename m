Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E67A6934FF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Feb 2023 00:14:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229605AbjBKXOA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 11 Feb 2023 18:14:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229634AbjBKXN6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 11 Feb 2023 18:13:58 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 467A71114D
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Feb 2023 15:13:54 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id lu11so23984190ejb.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Feb 2023 15:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u+Axp3s7z0mZ0VxmySFUz0HeRB+QnJYDVbyr1prRKuc=;
        b=Dhz36Y1C0AaVqFYkAi9g0p/Drmt6G8qeihdIpwN80gXwGX9tv0mjnncH5jkCMLXpfu
         UfygXlQbhtFyyuaT12RJWVQn3Yu1Y955lSg1pK0iTPSl8zb1W8r9T6Frhy/oggTzcLiq
         Ahk/tkL7CL9GIekhsg055oXJKkSdpRztu0DrfuS8Un9VhIREIZCGFyyUU19iCytui71C
         syQLlg0Dp8zj9BTqtievt0ToDhArtpwXWwuKCf09+tufhnE5NgM24eSKy8gbYupg93Ey
         2f0FyJCJOj3Ijd+6ZO2pMDyjcc0mHXBnTDBh/cOxP+t3aHIT610aA96gtYuHhAOWoPbe
         OAVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u+Axp3s7z0mZ0VxmySFUz0HeRB+QnJYDVbyr1prRKuc=;
        b=w44bu8QY/XzTTjRdynti9uqtQedv0xQP7zaovzHc42WCFQ3CrSi4q6HNHlYQGcm+K3
         AopR9dTJsYDRzt3NyCNaVkh9NAKMPcB6UmojdoiLb/TcXfu6FtMN8nhYdxCv9p2RkaAQ
         YhgOfOMU+1FeleDDU/CvLOpZbgbulfYtRnBT0MB7u1NRECTG8U014M+kOAOp0O5zyXSk
         //iAp/uSQmCAtRaU6stuMzUb2tZ8FMWx+cSL/09G5SCNgpZ8jv13W/E70dwpN5uBdKgW
         g91Yc1ixbVHWfwN8VqQaHmtFaGCPzLdBQonww0sRQcQj7zqkqY5vL+cxnvZoa1RCaoS4
         LFHg==
X-Gm-Message-State: AO0yUKWZmirns40LQoEEGwI1ZBJ7aGAvBmsUrHHJbPuTrNOAfEzKDxCV
        hEEDrYmPPmWWLrNFe/FXQjq4CA==
X-Google-Smtp-Source: AK7set8MGbo7GtCkmsJfufk8wDLnTL40nxMR492tkbMkz2teh0gBPYGAW3/srFRfaJMz6RKVN806xg==
X-Received: by 2002:a17:907:72d2:b0:8af:ef00:b853 with SMTP id du18-20020a17090772d200b008afef00b853mr5185378ejc.73.1676157233816;
        Sat, 11 Feb 2023 15:13:53 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id k20-20020a1709061c1400b00871390a3b74sm4517149ejg.177.2023.02.11.15.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 15:13:53 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 45/50] drm/msm/dpu: inline IRQ_n_MASK defines
Date:   Sun, 12 Feb 2023 01:12:54 +0200
Message-Id: <20230211231259.1308718-46-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
References: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
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

IRQ masks are rarely shared between different DPU revisions. Inline them
to the dpu_mdss_cfg intances and drop them from the dpu_hw_catalog.c

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   |  9 ++-
 .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    | 10 ++-
 .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    | 10 ++-
 .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   | 12 ++-
 .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    |  9 ++-
 .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |  6 +-
 .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    |  6 +-
 .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   |  6 +-
 .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    |  8 +-
 .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |  7 +-
 .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  | 13 +++-
 .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    |  8 +-
 .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    |  8 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 73 -------------------
 14 files changed, 99 insertions(+), 86 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
index 36a4f11f44b7..1eb3b5a9d485 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
@@ -198,7 +198,14 @@ static const struct dpu_mdss_cfg msm8998_dpu_cfg = {
 	.vbif = msm8998_vbif,
 	.reg_dma_count = 0,
 	.perf = &msm8998_perf_data,
-	.mdss_irqs = IRQ_SM8250_MASK,
+	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
+		     BIT(MDP_SSPP_TOP0_INTR2) | \
+		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
+		     BIT(MDP_INTF0_INTR) | \
+		     BIT(MDP_INTF1_INTR) | \
+		     BIT(MDP_INTF2_INTR) | \
+		     BIT(MDP_INTF3_INTR) | \
+		     BIT(MDP_INTF4_INTR),
 };
 
 #endif
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
index 739a301afcb4..cc6431e42932 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -197,7 +197,15 @@ static const struct dpu_mdss_cfg sdm845_dpu_cfg = {
 	.reg_dma_count = 1,
 	.dma_cfg = &sdm845_regdma,
 	.perf = &sdm845_perf_data,
-	.mdss_irqs = IRQ_SDM845_MASK,
+	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
+		     BIT(MDP_SSPP_TOP0_INTR2) | \
+		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
+		     BIT(MDP_INTF0_INTR) | \
+		     BIT(MDP_INTF1_INTR) | \
+		     BIT(MDP_INTF2_INTR) | \
+		     BIT(MDP_INTF3_INTR) | \
+		     BIT(MDP_AD4_0_INTR) | \
+		     BIT(MDP_AD4_1_INTR),
 };
 
 #endif
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index 33303040fbd0..a2c8b7c51890 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -83,7 +83,15 @@ static const struct dpu_mdss_cfg sm8150_dpu_cfg = {
 	.reg_dma_count = 1,
 	.dma_cfg = &sm8150_regdma,
 	.perf = &sm8150_perf_data,
-	.mdss_irqs = IRQ_SDM845_MASK,
+	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
+		     BIT(MDP_SSPP_TOP0_INTR2) | \
+		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
+		     BIT(MDP_INTF0_INTR) | \
+		     BIT(MDP_INTF1_INTR) | \
+		     BIT(MDP_INTF2_INTR) | \
+		     BIT(MDP_INTF3_INTR) | \
+		     BIT(MDP_AD4_0_INTR) | \
+		     BIT(MDP_AD4_1_INTR),
 };
 
 #endif
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index 48185e3dc873..26211f4fad99 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -75,7 +75,17 @@ static const struct dpu_mdss_cfg sc8180x_dpu_cfg = {
 	.reg_dma_count = 1,
 	.dma_cfg = &sm8150_regdma,
 	.perf = &sc8180x_perf_data,
-	.mdss_irqs = IRQ_SC8180X_MASK,
+	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
+		     BIT(MDP_SSPP_TOP0_INTR2) | \
+		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
+		     BIT(MDP_INTF0_INTR) | \
+		     BIT(MDP_INTF1_INTR) | \
+		     BIT(MDP_INTF2_INTR) | \
+		     BIT(MDP_INTF3_INTR) | \
+		     BIT(MDP_INTF4_INTR) | \
+		     BIT(MDP_INTF5_INTR) | \
+		     BIT(MDP_AD4_0_INTR) | \
+		     BIT(MDP_AD4_1_INTR),
 };
 
 #endif
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index 4e667c7e98e9..b3d3b6fb4412 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -231,7 +231,14 @@ static const struct dpu_mdss_cfg sm8250_dpu_cfg = {
 	.reg_dma_count = 1,
 	.dma_cfg = &sm8250_regdma,
 	.perf = &sm8250_perf_data,
-	.mdss_irqs = IRQ_SM8250_MASK,
+	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
+		     BIT(MDP_SSPP_TOP0_INTR2) | \
+		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
+		     BIT(MDP_INTF0_INTR) | \
+		     BIT(MDP_INTF1_INTR) | \
+		     BIT(MDP_INTF2_INTR) | \
+		     BIT(MDP_INTF3_INTR) | \
+		     BIT(MDP_INTF4_INTR),
 };
 
 #endif
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
index 7f998ffa195f..2c991cb6ed7a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
@@ -142,7 +142,11 @@ static const struct dpu_mdss_cfg sc7180_dpu_cfg = {
 	.reg_dma_count = 1,
 	.dma_cfg = &sdm845_regdma,
 	.perf = &sc7180_perf_data,
-	.mdss_irqs = IRQ_SC7180_MASK,
+	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
+		     BIT(MDP_SSPP_TOP0_INTR2) | \
+		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
+		     BIT(MDP_INTF0_INTR) | \
+		     BIT(MDP_INTF1_INTR),
 };
 
 #endif
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
index 7e4cfb0d6901..1ba646cb96a9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
@@ -82,7 +82,11 @@ static const struct dpu_mdss_cfg sm6115_dpu_cfg = {
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
 	.vbif = sdm845_vbif,
 	.perf = &sm6115_perf_data,
-	.mdss_irqs = IRQ_SC7180_MASK,
+	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
+		     BIT(MDP_SSPP_TOP0_INTR2) | \
+		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
+		     BIT(MDP_INTF0_INTR) | \
+		     BIT(MDP_INTF1_INTR),
 };
 
 #endif
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
index 440240860635..2d9b54ff6510 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
@@ -72,7 +72,11 @@ static const struct dpu_mdss_cfg qcm2290_dpu_cfg = {
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
 	.vbif = sdm845_vbif,
 	.perf = &qcm2290_perf_data,
-	.mdss_irqs = IRQ_SC7180_MASK,
+	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
+		     BIT(MDP_SSPP_TOP0_INTR2) | \
+		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
+		     BIT(MDP_INTF0_INTR) | \
+		     BIT(MDP_INTF1_INTR),
 };
 
 #endif
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index b27f6c528a1f..3080f34d2e5e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -214,7 +214,13 @@ static const struct dpu_mdss_cfg sm8350_dpu_cfg = {
 	.reg_dma_count = 1,
 	.dma_cfg = &sm8350_regdma,
 	.perf = &sm8350_perf_data,
-	.mdss_irqs = IRQ_SM8350_MASK,
+	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
+		     BIT(MDP_SSPP_TOP0_INTR2) | \
+		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
+		     BIT(MDP_INTF0_7xxx_INTR) | \
+		     BIT(MDP_INTF1_7xxx_INTR) | \
+		     BIT(MDP_INTF2_7xxx_INTR) | \
+		     BIT(MDP_INTF3_7xxx_INTR),
 };
 
 #endif
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index 3117bb358117..37b1f410e2c4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -148,7 +148,12 @@ static const struct dpu_mdss_cfg sc7280_dpu_cfg = {
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
 	.vbif = sdm845_vbif,
 	.perf = &sc7280_perf_data,
-	.mdss_irqs = IRQ_SC7280_MASK,
+	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
+		     BIT(MDP_SSPP_TOP0_INTR2) | \
+		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
+		     BIT(MDP_INTF0_7xxx_INTR) | \
+		     BIT(MDP_INTF1_7xxx_INTR) | \
+		     BIT(MDP_INTF5_7xxx_INTR),
 };
 
 #endif
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index 81cbc99334a6..a023f4b1b92a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -100,7 +100,18 @@ static const struct dpu_mdss_cfg sc8280xp_dpu_cfg = {
 	.reg_dma_count = 1,
 	.dma_cfg = &sc8280xp_regdma,
 	.perf = &sc8280xp_perf_data,
-	.mdss_irqs = IRQ_SC8280XP_MASK,
+	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
+		     BIT(MDP_SSPP_TOP0_INTR2) | \
+		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
+		     BIT(MDP_INTF0_7xxx_INTR) | \
+		     BIT(MDP_INTF1_7xxx_INTR) | \
+		     BIT(MDP_INTF2_7xxx_INTR) | \
+		     BIT(MDP_INTF3_7xxx_INTR) | \
+		     BIT(MDP_INTF4_7xxx_INTR) | \
+		     BIT(MDP_INTF5_7xxx_INTR) | \
+		     BIT(MDP_INTF6_7xxx_INTR) | \
+		     BIT(MDP_INTF7_7xxx_INTR) | \
+		     BIT(MDP_INTF8_7xxx_INTR),
 };
 
 #endif
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index a453c31c4bc7..2b6d48073bce 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -111,7 +111,13 @@ static const struct dpu_mdss_cfg sm8450_dpu_cfg = {
 	.reg_dma_count = 1,
 	.dma_cfg = &sm8450_regdma,
 	.perf = &sm8450_perf_data,
-	.mdss_irqs = IRQ_SM8450_MASK,
+	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
+		     BIT(MDP_SSPP_TOP0_INTR2) | \
+		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
+		     BIT(MDP_INTF0_7xxx_INTR) | \
+		     BIT(MDP_INTF1_7xxx_INTR) | \
+		     BIT(MDP_INTF2_7xxx_INTR) | \
+		     BIT(MDP_INTF3_7xxx_INTR),
 };
 
 #endif
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index 1d74ea789b4d..c54b77f3c940 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -197,7 +197,13 @@ static const struct dpu_mdss_cfg sm8550_dpu_cfg = {
 	.reg_dma_count = 1,
 	.dma_cfg = &sm8450_regdma,
 	.perf = &sm8450_perf_data,
-	.mdss_irqs = IRQ_SM8450_MASK,
+	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
+		     BIT(MDP_SSPP_TOP0_INTR2) | \
+		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
+		     BIT(MDP_INTF0_7xxx_INTR) | \
+		     BIT(MDP_INTF1_7xxx_INTR) | \
+		     BIT(MDP_INTF2_7xxx_INTR) | \
+		     BIT(MDP_INTF3_7xxx_INTR),
 };
 
 #endif
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 3b015f3be31a..0b73e34d50a6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -83,79 +83,6 @@
 
 #define INTF_SC7280_MASK INTF_SC7180_MASK | BIT(DPU_DATA_HCTL_EN)
 
-#define IRQ_SDM845_MASK (BIT(MDP_SSPP_TOP0_INTR) | \
-			 BIT(MDP_SSPP_TOP0_INTR2) | \
-			 BIT(MDP_SSPP_TOP0_HIST_INTR) | \
-			 BIT(MDP_INTF0_INTR) | \
-			 BIT(MDP_INTF1_INTR) | \
-			 BIT(MDP_INTF2_INTR) | \
-			 BIT(MDP_INTF3_INTR) | \
-			 BIT(MDP_AD4_0_INTR) | \
-			 BIT(MDP_AD4_1_INTR))
-
-#define IRQ_SC7180_MASK (BIT(MDP_SSPP_TOP0_INTR) | \
-			 BIT(MDP_SSPP_TOP0_INTR2) | \
-			 BIT(MDP_SSPP_TOP0_HIST_INTR) | \
-			 BIT(MDP_INTF0_INTR) | \
-			 BIT(MDP_INTF1_INTR))
-
-#define IRQ_SC7280_MASK (BIT(MDP_SSPP_TOP0_INTR) | \
-			 BIT(MDP_SSPP_TOP0_INTR2) | \
-			 BIT(MDP_SSPP_TOP0_HIST_INTR) | \
-			 BIT(MDP_INTF0_7xxx_INTR) | \
-			 BIT(MDP_INTF1_7xxx_INTR) | \
-			 BIT(MDP_INTF5_7xxx_INTR))
-
-#define IRQ_SM8250_MASK (BIT(MDP_SSPP_TOP0_INTR) | \
-			 BIT(MDP_SSPP_TOP0_INTR2) | \
-			 BIT(MDP_SSPP_TOP0_HIST_INTR) | \
-			 BIT(MDP_INTF0_INTR) | \
-			 BIT(MDP_INTF1_INTR) | \
-			 BIT(MDP_INTF2_INTR) | \
-			 BIT(MDP_INTF3_INTR) | \
-			 BIT(MDP_INTF4_INTR))
-
-#define IRQ_SM8350_MASK (BIT(MDP_SSPP_TOP0_INTR) | \
-			 BIT(MDP_SSPP_TOP0_INTR2) | \
-			 BIT(MDP_SSPP_TOP0_HIST_INTR) | \
-			 BIT(MDP_INTF0_7xxx_INTR) | \
-			 BIT(MDP_INTF1_7xxx_INTR) | \
-			 BIT(MDP_INTF2_7xxx_INTR) | \
-			 BIT(MDP_INTF3_7xxx_INTR))
-
-#define IRQ_SC8180X_MASK (BIT(MDP_SSPP_TOP0_INTR) | \
-			  BIT(MDP_SSPP_TOP0_INTR2) | \
-			  BIT(MDP_SSPP_TOP0_HIST_INTR) | \
-			  BIT(MDP_INTF0_INTR) | \
-			  BIT(MDP_INTF1_INTR) | \
-			  BIT(MDP_INTF2_INTR) | \
-			  BIT(MDP_INTF3_INTR) | \
-			  BIT(MDP_INTF4_INTR) | \
-			  BIT(MDP_INTF5_INTR) | \
-			  BIT(MDP_AD4_0_INTR) | \
-			  BIT(MDP_AD4_1_INTR))
-
-#define IRQ_SC8280XP_MASK (BIT(MDP_SSPP_TOP0_INTR) | \
-			   BIT(MDP_SSPP_TOP0_INTR2) | \
-			   BIT(MDP_SSPP_TOP0_HIST_INTR) | \
-			   BIT(MDP_INTF0_7xxx_INTR) | \
-			   BIT(MDP_INTF1_7xxx_INTR) | \
-			   BIT(MDP_INTF2_7xxx_INTR) | \
-			   BIT(MDP_INTF3_7xxx_INTR) | \
-			   BIT(MDP_INTF4_7xxx_INTR) | \
-			   BIT(MDP_INTF5_7xxx_INTR) | \
-			   BIT(MDP_INTF6_7xxx_INTR) | \
-			   BIT(MDP_INTF7_7xxx_INTR) | \
-			   BIT(MDP_INTF8_7xxx_INTR))
-
-#define IRQ_SM8450_MASK (BIT(MDP_SSPP_TOP0_INTR) | \
-			 BIT(MDP_SSPP_TOP0_INTR2) | \
-			 BIT(MDP_SSPP_TOP0_HIST_INTR) | \
-			 BIT(MDP_INTF0_7xxx_INTR) | \
-			 BIT(MDP_INTF1_7xxx_INTR) | \
-			 BIT(MDP_INTF2_7xxx_INTR) | \
-			 BIT(MDP_INTF3_7xxx_INTR))
-
 #define WB_SM8250_MASK (BIT(DPU_WB_LINE_MODE) | \
 			 BIT(DPU_WB_UBWC) | \
 			 BIT(DPU_WB_YUV_CONFIG) | \
-- 
2.39.1

