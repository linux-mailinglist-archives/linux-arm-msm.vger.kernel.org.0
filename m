Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 69E536D1143
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Mar 2023 23:54:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230182AbjC3VyO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Mar 2023 17:54:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230185AbjC3VyM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Mar 2023 17:54:12 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64BE510ABD
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 14:54:10 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id c9so15964623lfb.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 14:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680213248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TPDpuAt8Bb3A9T/UXaZUizIojDj3JG+8qwPi50aB398=;
        b=xktTyQd4xYfOe0W7kkQAs8uHO2JlfdtZmlegKS25g+DfIlRE6BoAeuTZlPIgpf8v1C
         709rUsWXQQTtKp76ff4nLkpF98ID43O7jie2cmaskDT2k/38MPlLE5HGuxehEKUa5lHF
         TsNv26onKwzs7CNF+GChwxLJZOb+khD24lVjN+bL2clBTuBtkLGa5Q2KZothT90iNbWc
         gm3MO+W+Tz+sQMhn04TJfSzdPZRPm+sYWeNZGa88HgLqEcu9Y5ErVWJYmW6hoEoFC9+U
         yNjIge9v4aYLqLFXveoz+JpIaydG2ZdWVtT28dfatL7U3BLKDkwVjJMqPJekHFNBHd4v
         osFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680213248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TPDpuAt8Bb3A9T/UXaZUizIojDj3JG+8qwPi50aB398=;
        b=qbnVDb6O+ESsFI774bCqg2fAJNY9Vyf6hJbNP3parvifimhwnYbHLuP0yqVLLH0nwz
         QrablPUqVlNm+J/xS1uvmLR83Ix9Kh2PbJQ1iiO+DhOBHAc6GV559bv7QUIgOmN/5Z2U
         i4iuC2tbH9id+06zDNekH9CzACvohicgXGYUkCh6/0QIIEAVsOKUhV0sJuNOqDisNFTh
         vOLV/HDDu/f0F9wLD0b7ylBEqw1hQGFASN3peDxPXr6TrsJt83I5M3+4hrsp0e5R59FC
         6s/oOlegxiYdF/oMAHchqHkon4cqKFCg1n24HKcNyKoToOq9QWVGkYtxFC9y5z3ojQkD
         7K+g==
X-Gm-Message-State: AAQBX9dbWGWswdZNralq/fdpyBfY3eElprR4r+ethPSlPTNuaFbBp8N/
        l5QcZodrVKDFDBPdQWzSjIoRig==
X-Google-Smtp-Source: AKy350bKZs5SWH/2berOU4LbbPIjg0BB8W5wtaUC0fTFX01LVEvIAa3XoUyBS6zyjekwo2LBh5uJ7g==
X-Received: by 2002:ac2:53ad:0:b0:4dc:6ad4:5fe4 with SMTP id j13-20020ac253ad000000b004dc6ad45fe4mr7177285lfh.32.1680213248525;
        Thu, 30 Mar 2023 14:54:08 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id f16-20020a056512093000b004cc8207741fsm104574lft.93.2023.03.30.14.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 14:54:07 -0700 (PDT)
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
Subject: [PATCH v3 18/38] drm/msm/dpu: duplicate sdm845 catalog entries
Date:   Fri, 31 Mar 2023 00:53:04 +0300
Message-Id: <20230330215324.1853304-19-dmitry.baryshkov@linaro.org>
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

Duplicate some of sdm845 catalog entries to remove dependencies between
DPU major generations.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   | 19 +++++++-
 .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    | 43 +++++++++++++++++--
 .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   |  4 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  4 +-
 4 files changed, 60 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
index 6c988b3a7325..8e6650aaa8a2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
@@ -111,6 +111,21 @@ static const struct dpu_lm_cfg msm8998_lm[] = {
 		&msm8998_lm_sblk, PINGPONG_3, LM_1, 0),
 };
 
+static const struct dpu_pingpong_cfg msm8998_pp[] = {
+	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000, 0, sdm845_pp_sblk_te,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
+	PP_BLK_TE("pingpong_1", PINGPONG_1, 0x70800, 0, sdm845_pp_sblk_te,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13)),
+	PP_BLK("pingpong_2", PINGPONG_2, 0x71000, 0, sdm845_pp_sblk,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 14)),
+	PP_BLK("pingpong_3", PINGPONG_3, 0x71800, 0, sdm845_pp_sblk,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15)),
+};
+
 static const struct dpu_dspp_cfg msm8998_dspp[] = {
 	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_MSM8998_MASK,
 		 &msm8998_dspp_sblk),
@@ -174,8 +189,8 @@ static const struct dpu_mdss_cfg msm8998_dpu_cfg = {
 	.mixer = msm8998_lm,
 	.dspp_count = ARRAY_SIZE(msm8998_dspp),
 	.dspp = msm8998_dspp,
-	.pingpong_count = ARRAY_SIZE(sdm845_pp),
-	.pingpong = sdm845_pp,
+	.pingpong_count = ARRAY_SIZE(msm8998_pp),
+	.pingpong = msm8998_pp,
 	.intf_count = ARRAY_SIZE(msm8998_intf),
 	.intf = msm8998_intf,
 	.vbif_count = ARRAY_SIZE(msm8998_vbif),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index 4558e31d260f..e6280b0cb207 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -26,6 +26,22 @@ static const struct dpu_ubwc_cfg sm8150_ubwc_cfg = {
 	.highest_bank_bit = 0x2,
 };
 
+static const struct dpu_mdp_cfg sm8150_mdp[] = {
+	{
+	.name = "top_0", .id = MDP_TOP,
+	.base = 0x0, .len = 0x45c,
+	.features = BIT(DPU_MDP_AUDIO_SELECT),
+	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
+	.clk_ctrls[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
+	.clk_ctrls[DPU_CLK_CTRL_VIG2] = { .reg_off = 0x2bc, .bit_off = 0 },
+	.clk_ctrls[DPU_CLK_CTRL_VIG3] = { .reg_off = 0x2c4, .bit_off = 0 },
+	.clk_ctrls[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
+	.clk_ctrls[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
+	.clk_ctrls[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2bc, .bit_off = 8 },
+	.clk_ctrls[DPU_CLK_CTRL_DMA3] = { .reg_off = 0x2c4, .bit_off = 8 },
+	},
+};
+
 static const struct dpu_ctl_cfg sm8150_ctl[] = {
 	{
 	.name = "ctl_0", .id = CTL_0,
@@ -65,6 +81,25 @@ static const struct dpu_ctl_cfg sm8150_ctl[] = {
 	},
 };
 
+static const struct dpu_sspp_cfg sm8150_sspp[] = {
+	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1f0, VIG_SDM845_MASK,
+		sdm845_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
+	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, 0x1f0, VIG_SDM845_MASK,
+		sdm845_vig_sblk_1, 4, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
+	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, 0x1f0, VIG_SDM845_MASK,
+		sdm845_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
+	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, 0x1f0, VIG_SDM845_MASK,
+		sdm845_vig_sblk_3, 12, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
+	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1f0, DMA_SDM845_MASK,
+		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
+	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x1f0, DMA_SDM845_MASK,
+		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
+	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x1f0, DMA_CURSOR_SDM845_MASK,
+		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
+	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, 0x1f0, DMA_CURSOR_SDM845_MASK,
+		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
+};
+
 static const struct dpu_lm_cfg sm8150_lm[] = {
 	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
 		&sdm845_lm_sblk, PINGPONG_0, LM_1, DSPP_0),
@@ -164,12 +199,12 @@ static const struct dpu_perf_cfg sm8150_perf_data = {
 static const struct dpu_mdss_cfg sm8150_dpu_cfg = {
 	.caps = &sm8150_dpu_caps,
 	.ubwc = &sm8150_ubwc_cfg,
-	.mdp_count = ARRAY_SIZE(sdm845_mdp),
-	.mdp = sdm845_mdp,
+	.mdp_count = ARRAY_SIZE(sm8150_mdp),
+	.mdp = sm8150_mdp,
 	.ctl_count = ARRAY_SIZE(sm8150_ctl),
 	.ctl = sm8150_ctl,
-	.sspp_count = ARRAY_SIZE(sdm845_sspp),
-	.sspp = sdm845_sspp,
+	.sspp_count = ARRAY_SIZE(sm8150_sspp),
+	.sspp = sm8150_sspp,
 	.mixer_count = ARRAY_SIZE(sm8150_lm),
 	.mixer = sm8150_lm,
 	.dspp_count = ARRAY_SIZE(sm8150_dspp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index 86411eb9f051..92a8e474e380 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -86,8 +86,8 @@ static const struct dpu_mdss_cfg sc8180x_dpu_cfg = {
 	.mdp = sc8180x_mdp,
 	.ctl_count = ARRAY_SIZE(sm8150_ctl),
 	.ctl = sm8150_ctl,
-	.sspp_count = ARRAY_SIZE(sdm845_sspp),
-	.sspp = sdm845_sspp,
+	.sspp_count = ARRAY_SIZE(sm8150_sspp),
+	.sspp = sm8150_sspp,
 	.mixer_count = ARRAY_SIZE(sm8150_lm),
 	.mixer = sm8150_lm,
 	.pingpong_count = ARRAY_SIZE(sm8150_pp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 9ee87c24a504..105fa05454e1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -875,10 +875,10 @@ static const struct dpu_qos_lut_entry sc7180_qos_nrt[] = {
  * Hardware catalog
  *************************************************************/
 
-#include "catalog/dpu_4_0_sdm845.h"
-
 #include "catalog/dpu_3_0_msm8998.h"
 
+#include "catalog/dpu_4_0_sdm845.h"
+
 #include "catalog/dpu_5_0_sm8150.h"
 #include "catalog/dpu_5_1_sc8180x.h"
 
-- 
2.39.2

