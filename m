Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 91EF16D115B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Mar 2023 23:54:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230222AbjC3Vy1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Mar 2023 17:54:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230209AbjC3VyW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Mar 2023 17:54:22 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19E2410A90
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 14:54:21 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id y20so26423179lfj.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 14:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680213259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R0t3Rt2DvpqiMHSiZ9DLLPb70ERf4TWXuClRgOegz44=;
        b=ILeWqB0MDnaoDoYUodJls4fLM2ryizpHxTD0SQB1FM9rlQtfRhk5wU9Wesq+tLd4li
         MMRyRCM6FLn3II0fDektqfnt6TxRhwbucBhTKVhLX2VXnC7oQTa7UCC9PXqxPJdt8qn9
         xLyTaZVpwxgGFm721ruQJoSd6c6FpGxsPqbgBjR8p5Wa8cBiLmSJmybAkOxxbrEYoevf
         EeIP8/qni+xyeSKv6sCiWvKCgBZCUZPNz300WQUlm4J5kvp+IQegi+KxKc6bBw5i04Wb
         ijKJ9pUJYwPKSpZ1XRsCGGbLs/cOmgOvV+TlE0Pb8RzdH04pm/0aiFSLSG10FTGgOU+t
         +rAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680213259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R0t3Rt2DvpqiMHSiZ9DLLPb70ERf4TWXuClRgOegz44=;
        b=YQkAjNoWqIz2R7FZ1efWERLamgkep7IeoCQYzlmQUpuhsagT4Fgrch9wEAcCP3crpy
         i4dRKNR6wlsQJJhQYAGvGXpxVA/jlTVnRHhHf0rwXx06VIfpRDc63G5IZYKHW0v01XZC
         jXyWv3CVD6qN5SiDHexWKqJelqtqujJFpDBXquayziDAHaqOjmmizCB69MZro6tSmYXA
         QA8EFdK+AB7kTGnq5CR0aUz8Pu2t3ZYTH/5B9TGOUVdXBeFiwTWkSVWiJ8zYJX2pKEkz
         c1QrqGCz3W60ufQkbok6aSXqu3bxZHGNFvUQ2mgiSihu8f6PJzt31ERWGfGrMJaJ6AvP
         0aLQ==
X-Gm-Message-State: AAQBX9dg6GiurOdGTweS/0Qxb0m/V+Ala7rFq0ArPqhj0bkcn2c++YMf
        7LTehw3xvDppY0xm88hV+18bUg==
X-Google-Smtp-Source: AKy350ZaPz3giIuxyAdkE6oj8+X1sytmgflHC93JW86bICcyTikj+suU3fWyVf+AnS59N0RFAMEQfw==
X-Received: by 2002:ac2:5623:0:b0:4eb:c24:205b with SMTP id b3-20020ac25623000000b004eb0c24205bmr5136856lff.69.1680213259375;
        Thu, 30 Mar 2023 14:54:19 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id f16-20020a056512093000b004cc8207741fsm104574lft.93.2023.03.30.14.54.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 14:54:19 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v3 33/38] drm/msm/dpu: inline IRQ_n_MASK defines
Date:   Fri, 31 Mar 2023 00:53:19 +0300
Message-Id: <20230330215324.1853304-34-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230330215324.1853304-1-dmitry.baryshkov@linaro.org>
References: <20230330215324.1853304-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

IRQ masks are rarely shared between different DPU revisions. Inline them
to the dpu_mdss_cfg intances and drop them from the dpu_hw_catalog.c

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
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
index 8e6650aaa8a2..e5a42ebda4d7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
@@ -197,7 +197,14 @@ static const struct dpu_mdss_cfg msm8998_dpu_cfg = {
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
index 3e3b9967dd12..46b0e9e50ced 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -196,7 +196,15 @@ static const struct dpu_mdss_cfg sdm845_dpu_cfg = {
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
index cfaa68a25427..542d75253f41 100644
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
index 4580121ac269..5f3b8f789a73 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
@@ -141,7 +141,11 @@ static const struct dpu_mdss_cfg sc7180_dpu_cfg = {
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
index f9d45b98cedf..6e6b95aab3a0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
@@ -81,7 +81,11 @@ static const struct dpu_mdss_cfg sm6115_dpu_cfg = {
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
index 314ec678fcc6..7ed8aab0504a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
@@ -71,7 +71,11 @@ static const struct dpu_mdss_cfg qcm2290_dpu_cfg = {
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
index 84396240f0d1..f915fd8e2dc1 100644
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
index 10bf737f9a60..e8cda3a1a9d0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -147,7 +147,12 @@ static const struct dpu_mdss_cfg sc7280_dpu_cfg = {
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
index 4ce3f0fe2170..b21370f61dca 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -119,7 +119,18 @@ static const struct dpu_mdss_cfg sc8280xp_dpu_cfg = {
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
index de4989c8d307..95bd88cdf920 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -130,7 +130,13 @@ static const struct dpu_mdss_cfg sm8450_dpu_cfg = {
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
index c9d1892ec8f5..a0e9f06c72bd 100644
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
index 547546d85474..0fcde3757b72 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -102,79 +102,6 @@
 
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
2.39.2

