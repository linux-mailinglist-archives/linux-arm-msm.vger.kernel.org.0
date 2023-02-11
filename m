Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C1C6D6934E5
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Feb 2023 00:13:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229619AbjBKXNp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 11 Feb 2023 18:13:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229611AbjBKXNn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 11 Feb 2023 18:13:43 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE78B1630F
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Feb 2023 15:13:40 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id p26so23885538ejx.13
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Feb 2023 15:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rm/IjS7by1Yv4Y91SXzmZAMl5sZ0ShdQEAy8EqlRvDA=;
        b=RSi1sJ83wCOxUom79Qm5Qk0D79fOm4Gfd+o6co9tU82mgz30Ch0phn2Xze9mr5b1El
         ZUdTrDsjzZ1xW6FLX+l7QR6InOEuWIoGKiYvFXD423Fe0cXUg6Rn1v/TtiQFoCozXgrG
         8XHeLi0kWOENJI3LZzOE/3DOvkZafJlLigzuot0C8WXjIEJUU4UrZE+tFizghNh5zoqU
         XfbTTSKfhKgAcbUWsitTwFiZFDgwfREX8BNYPj6t370IQ7pvELuTnoXL4QPSsAnI0BQR
         7a7seh/mxPKnm61wEzZ+pNSLcuDm4KJejOVNf8cNtP/GyKVERebnbITivP/fCtcla7Qk
         ZqbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rm/IjS7by1Yv4Y91SXzmZAMl5sZ0ShdQEAy8EqlRvDA=;
        b=WhAliYtkswu7Zn6pcJVUsPwcCcI/kII7xF4/CFpI5oPV9+MYEzBHIEJ711BloOmItM
         fyWiOAt5TbwOvPi+4txmbcZhhJqPyxa3NJWkKid6TC98CZTLjlYIpmC74o3r+HA0NMhS
         kSJiKJCzwCl0nhRt9sMWRNtQds/plWiQLMNjHpXe2n63g5bZ523TIwFIClfhBb4soNGy
         +wMpQTzEif6ZAOUYBT/KrIHZFp/p9Mi+TWiMgJod3P6FWvyBiPCEIOOyc/ot44aKQvJB
         aQxwelPDPIWEb59OwcvYfAzk2Cww+NOxlyHJRCswmXYwK/9u+iCkOZMGwtlzf7eZP3lr
         ew4Q==
X-Gm-Message-State: AO0yUKV6fsYqvLH4MAQm1Zpy6XAamL1SEIzlXWETHZ2qwQoPOY96S9/2
        Q8Np6Qpxs1dC1qXLzH8l4tEbgQ==
X-Google-Smtp-Source: AK7set/LyHT8LEvYozMZSQW9RH2Tqb048EjhXZPo3/SAG2Mk+ALET6/Ci7mD4YfeLZNt05ByWW0qfw==
X-Received: by 2002:a17:907:2175:b0:88b:109e:fbd3 with SMTP id rl21-20020a170907217500b0088b109efbd3mr20233069ejb.24.1676157220530;
        Sat, 11 Feb 2023 15:13:40 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id k20-20020a1709061c1400b00871390a3b74sm4517149ejg.177.2023.02.11.15.13.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 15:13:40 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 33/50] drm/msm/dpu: duplicate sm8150 catalog entries
Date:   Sun, 12 Feb 2023 01:12:42 +0200
Message-Id: <20230211231259.1308718-34-dmitry.baryshkov@linaro.org>
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

Duplicate some of sm8150 catalog entries to remove dependencies between
DPU major generations.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    | 134 ++++++++++++++++--
 .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    |  34 ++++-
 .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  |  15 +-
 .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    |  33 ++++-
 .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    |  33 ++++-
 5 files changed, 221 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index 677e3202141a..4e667c7e98e9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -44,6 +44,45 @@ static const struct dpu_mdp_cfg sm8250_mdp[] = {
 	},
 };
 
+static const struct dpu_ctl_cfg sm8250_ctl[] = {
+	{
+	.name = "ctl_0", .id = CTL_0,
+	.base = 0x1000, .len = 0x1e0,
+	.features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_SPLIT_DISPLAY),
+	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
+	},
+	{
+	.name = "ctl_1", .id = CTL_1,
+	.base = 0x1200, .len = 0x1e0,
+	.features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_SPLIT_DISPLAY),
+	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
+	},
+	{
+	.name = "ctl_2", .id = CTL_2,
+	.base = 0x1400, .len = 0x1e0,
+	.features = BIT(DPU_CTL_ACTIVE_CFG),
+	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
+	},
+	{
+	.name = "ctl_3", .id = CTL_3,
+	.base = 0x1600, .len = 0x1e0,
+	.features = BIT(DPU_CTL_ACTIVE_CFG),
+	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
+	},
+	{
+	.name = "ctl_4", .id = CTL_4,
+	.base = 0x1800, .len = 0x1e0,
+	.features = BIT(DPU_CTL_ACTIVE_CFG),
+	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
+	},
+	{
+	.name = "ctl_5", .id = CTL_5,
+	.base = 0x1a00, .len = 0x1e0,
+	.features = BIT(DPU_CTL_ACTIVE_CFG),
+	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
+	},
+};
+
 static const struct dpu_sspp_cfg sm8250_sspp[] = {
 	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1f8, VIG_SC7180_MASK,
 		sm8250_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
@@ -63,6 +102,73 @@ static const struct dpu_sspp_cfg sm8250_sspp[] = {
 		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
 };
 
+static const struct dpu_lm_cfg sm8250_lm[] = {
+	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
+		&sdm845_lm_sblk, PINGPONG_0, LM_1, DSPP_0),
+	LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK,
+		&sdm845_lm_sblk, PINGPONG_1, LM_0, DSPP_1),
+	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK,
+		&sdm845_lm_sblk, PINGPONG_2, LM_3, 0),
+	LM_BLK("lm_3", LM_3, 0x47000, MIXER_SDM845_MASK,
+		&sdm845_lm_sblk, PINGPONG_3, LM_2, 0),
+	LM_BLK("lm_4", LM_4, 0x48000, MIXER_SDM845_MASK,
+		&sdm845_lm_sblk, PINGPONG_4, LM_5, 0),
+	LM_BLK("lm_5", LM_5, 0x49000, MIXER_SDM845_MASK,
+		&sdm845_lm_sblk, PINGPONG_5, LM_4, 0),
+};
+
+static const struct dpu_dspp_cfg sm8250_dspp[] = {
+	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
+		 &sm8150_dspp_sblk),
+	DSPP_BLK("dspp_1", DSPP_1, 0x56000, DSPP_SC7180_MASK,
+		 &sm8150_dspp_sblk),
+	DSPP_BLK("dspp_2", DSPP_2, 0x58000, DSPP_SC7180_MASK,
+		 &sm8150_dspp_sblk),
+	DSPP_BLK("dspp_3", DSPP_3, 0x5a000, DSPP_SC7180_MASK,
+		 &sm8150_dspp_sblk),
+};
+
+static const struct dpu_pingpong_cfg sm8250_pp[] = {
+	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000, MERGE_3D_0, sdm845_pp_sblk_te,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
+	PP_BLK_TE("pingpong_1", PINGPONG_1, 0x70800, MERGE_3D_0, sdm845_pp_sblk_te,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13)),
+	PP_BLK("pingpong_2", PINGPONG_2, 0x71000, MERGE_3D_1, sdm845_pp_sblk,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 14)),
+	PP_BLK("pingpong_3", PINGPONG_3, 0x71800, MERGE_3D_1, sdm845_pp_sblk,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15)),
+	PP_BLK("pingpong_4", PINGPONG_4, 0x72000, MERGE_3D_2, sdm845_pp_sblk,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
+			-1),
+	PP_BLK("pingpong_5", PINGPONG_5, 0x72800, MERGE_3D_2, sdm845_pp_sblk,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
+			-1),
+};
+
+static const struct dpu_merge_3d_cfg sm8250_merge_3d[] = {
+	MERGE_3D_BLK("merge_3d_0", MERGE_3D_0, 0x83000),
+	MERGE_3D_BLK("merge_3d_1", MERGE_3D_1, 0x83100),
+	MERGE_3D_BLK("merge_3d_2", MERGE_3D_2, 0x83200),
+};
+
+static const struct dpu_dsc_cfg sm8250_dsc[] = {
+	DSC_BLK("dsc_0", DSC_0, 0x80000, BIT(DPU_DSC_OUTPUT_CTRL)),
+	DSC_BLK("dsc_1", DSC_1, 0x80400, BIT(DPU_DSC_OUTPUT_CTRL)),
+	DSC_BLK("dsc_2", DSC_2, 0x80800, BIT(DPU_DSC_OUTPUT_CTRL)),
+	DSC_BLK("dsc_3", DSC_3, 0x80c00, BIT(DPU_DSC_OUTPUT_CTRL)),
+};
+
+static const struct dpu_intf_cfg sm8250_intf[] = {
+	INTF_BLK("intf_0", INTF_0, 0x6a000, 0x2b8, INTF_DP, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
+	INTF_BLK("intf_1", INTF_1, 0x6a800, 0x2b8, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
+	INTF_BLK("intf_2", INTF_2, 0x6b000, 0x2b8, INTF_DSI, 1, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
+	INTF_BLK("intf_3", INTF_3, 0x6b800, 0x2b8, INTF_DP, 1, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
+};
+
 static const struct dpu_wb_cfg sm8250_wb[] = {
 	WB_BLK("wb_2", WB_2, 0x65000, WB_SM8250_MASK, DPU_CLK_CTRL_WB2, 6,
 			VBIF_RT, MDP_SSPP_TOP0_INTR, 4096, 4),
@@ -102,22 +208,22 @@ static const struct dpu_mdss_cfg sm8250_dpu_cfg = {
 	.ubwc = &sm8250_ubwc_cfg,
 	.mdp_count = ARRAY_SIZE(sm8250_mdp),
 	.mdp = sm8250_mdp,
-	.ctl_count = ARRAY_SIZE(sm8150_ctl),
-	.ctl = sm8150_ctl,
+	.ctl_count = ARRAY_SIZE(sm8250_ctl),
+	.ctl = sm8250_ctl,
 	.sspp_count = ARRAY_SIZE(sm8250_sspp),
 	.sspp = sm8250_sspp,
-	.mixer_count = ARRAY_SIZE(sm8150_lm),
-	.mixer = sm8150_lm,
-	.dspp_count = ARRAY_SIZE(sm8150_dspp),
-	.dspp = sm8150_dspp,
-	.dsc_count = ARRAY_SIZE(sm8150_dsc),
-	.dsc = sm8150_dsc,
-	.pingpong_count = ARRAY_SIZE(sm8150_pp),
-	.pingpong = sm8150_pp,
-	.merge_3d_count = ARRAY_SIZE(sm8150_merge_3d),
-	.merge_3d = sm8150_merge_3d,
-	.intf_count = ARRAY_SIZE(sm8150_intf),
-	.intf = sm8150_intf,
+	.mixer_count = ARRAY_SIZE(sm8250_lm),
+	.mixer = sm8250_lm,
+	.dspp_count = ARRAY_SIZE(sm8250_dspp),
+	.dspp = sm8250_dspp,
+	.dsc_count = ARRAY_SIZE(sm8250_dsc),
+	.dsc = sm8250_dsc,
+	.pingpong_count = ARRAY_SIZE(sm8250_pp),
+	.pingpong = sm8250_pp,
+	.merge_3d_count = ARRAY_SIZE(sm8250_merge_3d),
+	.merge_3d = sm8250_merge_3d,
+	.intf_count = ARRAY_SIZE(sm8250_intf),
+	.intf = sm8250_intf,
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
 	.vbif = sdm845_vbif,
 	.wb_count = ARRAY_SIZE(sm8250_wb),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index 75a99da150ae..d723a690bd41 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -81,6 +81,32 @@ static const struct dpu_ctl_cfg sm8350_ctl[] = {
 	},
 };
 
+static const struct dpu_lm_cfg sm8350_lm[] = {
+	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
+		&sdm845_lm_sblk, PINGPONG_0, LM_1, DSPP_0),
+	LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK,
+		&sdm845_lm_sblk, PINGPONG_1, LM_0, DSPP_1),
+	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK,
+		&sdm845_lm_sblk, PINGPONG_2, LM_3, 0),
+	LM_BLK("lm_3", LM_3, 0x47000, MIXER_SDM845_MASK,
+		&sdm845_lm_sblk, PINGPONG_3, LM_2, 0),
+	LM_BLK("lm_4", LM_4, 0x48000, MIXER_SDM845_MASK,
+		&sdm845_lm_sblk, PINGPONG_4, LM_5, 0),
+	LM_BLK("lm_5", LM_5, 0x49000, MIXER_SDM845_MASK,
+		&sdm845_lm_sblk, PINGPONG_5, LM_4, 0),
+};
+
+static const struct dpu_dspp_cfg sm8350_dspp[] = {
+	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
+		 &sm8150_dspp_sblk),
+	DSPP_BLK("dspp_1", DSPP_1, 0x56000, DSPP_SC7180_MASK,
+		 &sm8150_dspp_sblk),
+	DSPP_BLK("dspp_2", DSPP_2, 0x58000, DSPP_SC7180_MASK,
+		 &sm8150_dspp_sblk),
+	DSPP_BLK("dspp_3", DSPP_3, 0x5a000, DSPP_SC7180_MASK,
+		 &sm8150_dspp_sblk),
+};
+
 static const struct dpu_pingpong_cfg sm8350_pp[] = {
 	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x69000, MERGE_3D_0, sdm845_pp_sblk_te,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
@@ -154,10 +180,10 @@ static const struct dpu_mdss_cfg sm8350_dpu_cfg = {
 	.ctl = sm8350_ctl,
 	.sspp_count = ARRAY_SIZE(sm8250_sspp),
 	.sspp = sm8250_sspp,
-	.mixer_count = ARRAY_SIZE(sm8150_lm),
-	.mixer = sm8150_lm,
-	.dspp_count = ARRAY_SIZE(sm8150_dspp),
-	.dspp = sm8150_dspp,
+	.mixer_count = ARRAY_SIZE(sm8350_lm),
+	.mixer = sm8350_lm,
+	.dspp_count = ARRAY_SIZE(sm8350_dspp),
+	.dspp = sm8350_dspp,
 	.pingpong_count = ARRAY_SIZE(sm8350_pp),
 	.pingpong = sm8350_pp,
 	.merge_3d_count = ARRAY_SIZE(sm8350_merge_3d),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index d13ddf63871c..748f7e14dfcc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -111,6 +111,17 @@ static const struct dpu_lm_cfg sc8280xp_lm[] = {
 	LM_BLK("lm_5", LM_5, 0x49000, MIXER_SDM845_MASK, &sdm845_lm_sblk, PINGPONG_5, LM_4, 0),
 };
 
+static const struct dpu_dspp_cfg sc8280xp_dspp[] = {
+	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
+		 &sm8150_dspp_sblk),
+	DSPP_BLK("dspp_1", DSPP_1, 0x56000, DSPP_SC7180_MASK,
+		 &sm8150_dspp_sblk),
+	DSPP_BLK("dspp_2", DSPP_2, 0x58000, DSPP_SC7180_MASK,
+		 &sm8150_dspp_sblk),
+	DSPP_BLK("dspp_3", DSPP_3, 0x5a000, DSPP_SC7180_MASK,
+		 &sm8150_dspp_sblk),
+};
+
 static const struct dpu_pingpong_cfg sc8280xp_pp[] = {
 	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x69000, MERGE_3D_0, sdm845_pp_sblk_te,
 		  DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8), -1),
@@ -177,8 +188,8 @@ static const struct dpu_mdss_cfg sc8280xp_dpu_cfg = {
 	.sspp = sc8280xp_sspp,
 	.mixer_count = ARRAY_SIZE(sc8280xp_lm),
 	.mixer = sc8280xp_lm,
-	.dspp_count = ARRAY_SIZE(sm8150_dspp),
-	.dspp = sm8150_dspp,
+	.dspp_count = ARRAY_SIZE(sc8280xp_dspp),
+	.dspp = sc8280xp_dspp,
 	.pingpong_count = ARRAY_SIZE(sc8280xp_pp),
 	.pingpong = sc8280xp_pp,
 	.merge_3d_count = ARRAY_SIZE(sm8350_merge_3d),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index 5fcb4d49473a..a3faaab2226c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -101,6 +101,31 @@ static const struct dpu_sspp_cfg sm8450_sspp[] = {
 		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
 };
 
+static const struct dpu_lm_cfg sm8450_lm[] = {
+	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
+		&sdm845_lm_sblk, PINGPONG_0, LM_1, DSPP_0),
+	LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK,
+		&sdm845_lm_sblk, PINGPONG_1, LM_0, DSPP_1),
+	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK,
+		&sdm845_lm_sblk, PINGPONG_2, LM_3, 0),
+	LM_BLK("lm_3", LM_3, 0x47000, MIXER_SDM845_MASK,
+		&sdm845_lm_sblk, PINGPONG_3, LM_2, 0),
+	LM_BLK("lm_4", LM_4, 0x48000, MIXER_SDM845_MASK,
+		&sdm845_lm_sblk, PINGPONG_4, LM_5, 0),
+	LM_BLK("lm_5", LM_5, 0x49000, MIXER_SDM845_MASK,
+		&sdm845_lm_sblk, PINGPONG_5, LM_4, 0),
+};
+
+static const struct dpu_dspp_cfg sm8450_dspp[] = {
+	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
+		 &sm8150_dspp_sblk),
+	DSPP_BLK("dspp_1", DSPP_1, 0x56000, DSPP_SC7180_MASK,
+		 &sm8150_dspp_sblk),
+	DSPP_BLK("dspp_2", DSPP_2, 0x58000, DSPP_SC7180_MASK,
+		 &sm8150_dspp_sblk),
+	DSPP_BLK("dspp_3", DSPP_3, 0x5a000, DSPP_SC7180_MASK,
+		 &sm8150_dspp_sblk),
+};
 /* FIXME: interrupts */
 static const struct dpu_pingpong_cfg sm8450_pp[] = {
 	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x69000, MERGE_3D_0, sdm845_pp_sblk_te,
@@ -182,10 +207,10 @@ static const struct dpu_mdss_cfg sm8450_dpu_cfg = {
 	.ctl = sm8450_ctl,
 	.sspp_count = ARRAY_SIZE(sm8450_sspp),
 	.sspp = sm8450_sspp,
-	.mixer_count = ARRAY_SIZE(sm8150_lm),
-	.mixer = sm8150_lm,
-	.dspp_count = ARRAY_SIZE(sm8150_dspp),
-	.dspp = sm8150_dspp,
+	.mixer_count = ARRAY_SIZE(sm8450_lm),
+	.mixer = sm8450_lm,
+	.dspp_count = ARRAY_SIZE(sm8450_dspp),
+	.dspp = sm8450_dspp,
 	.pingpong_count = ARRAY_SIZE(sm8450_pp),
 	.pingpong = sm8450_pp,
 	.merge_3d_count = ARRAY_SIZE(sm8450_merge_3d),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index b44b9981431b..1d74ea789b4d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -106,6 +106,31 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
 		sm8550_dma_sblk_5, 15, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA5),
 };
 
+static const struct dpu_lm_cfg sm8550_lm[] = {
+	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
+		&sdm845_lm_sblk, PINGPONG_0, LM_1, DSPP_0),
+	LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK,
+		&sdm845_lm_sblk, PINGPONG_1, LM_0, DSPP_1),
+	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK,
+		&sdm845_lm_sblk, PINGPONG_2, LM_3, 0),
+	LM_BLK("lm_3", LM_3, 0x47000, MIXER_SDM845_MASK,
+		&sdm845_lm_sblk, PINGPONG_3, LM_2, 0),
+	LM_BLK("lm_4", LM_4, 0x48000, MIXER_SDM845_MASK,
+		&sdm845_lm_sblk, PINGPONG_4, LM_5, 0),
+	LM_BLK("lm_5", LM_5, 0x49000, MIXER_SDM845_MASK,
+		&sdm845_lm_sblk, PINGPONG_5, LM_4, 0),
+};
+
+static const struct dpu_dspp_cfg sm8550_dspp[] = {
+	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
+		 &sm8150_dspp_sblk),
+	DSPP_BLK("dspp_1", DSPP_1, 0x56000, DSPP_SC7180_MASK,
+		 &sm8150_dspp_sblk),
+	DSPP_BLK("dspp_2", DSPP_2, 0x58000, DSPP_SC7180_MASK,
+		 &sm8150_dspp_sblk),
+	DSPP_BLK("dspp_3", DSPP_3, 0x5a000, DSPP_SC7180_MASK,
+		 &sm8150_dspp_sblk),
+};
 static const struct dpu_pingpong_cfg sm8550_pp[] = {
 	PP_BLK_DIPHER("pingpong_0", PINGPONG_0, 0x69000, MERGE_3D_0, sc7280_pp_sblk,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
@@ -157,10 +182,10 @@ static const struct dpu_mdss_cfg sm8550_dpu_cfg = {
 	.ctl = sm8550_ctl,
 	.sspp_count = ARRAY_SIZE(sm8550_sspp),
 	.sspp = sm8550_sspp,
-	.mixer_count = ARRAY_SIZE(sm8150_lm),
-	.mixer = sm8150_lm,
-	.dspp_count = ARRAY_SIZE(sm8150_dspp),
-	.dspp = sm8150_dspp,
+	.mixer_count = ARRAY_SIZE(sm8550_lm),
+	.mixer = sm8550_lm,
+	.dspp_count = ARRAY_SIZE(sm8550_dspp),
+	.dspp = sm8550_dspp,
 	.pingpong_count = ARRAY_SIZE(sm8550_pp),
 	.pingpong = sm8550_pp,
 	.merge_3d_count = ARRAY_SIZE(sm8550_merge_3d),
-- 
2.39.1

