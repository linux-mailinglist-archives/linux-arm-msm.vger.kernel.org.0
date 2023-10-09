Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 663EB7BE76B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Oct 2023 19:11:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377114AbjJIRLQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Oct 2023 13:11:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376797AbjJIRLP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Oct 2023 13:11:15 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 269B29E
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Oct 2023 10:11:14 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-505a62d24b9so5627285e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Oct 2023 10:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696871472; x=1697476272; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HrOeSqSvWBurLO1tHVKBNeKW8O5/gmeYRnrbc2wTr9o=;
        b=V1os/fWZ49x35DtnkxjDSVea7m/yqoKj2qzxRv8nQHiICsoPAbqpKQBafK3VoUQPT/
         Y1sWCvmkTjPgfRFBR3uf3rEUFqmr+jBEw32CRkt6uedKB/RAZQ8HGA6EAqgKpNMsFuQ7
         pXvPT+xgaIMg0BXIqcbUm/GvTWIRu1ifMPEPRwLk6M731ExJYVjFwZrwfP49Ne3cZQYJ
         JMQYKNXSVsjAeAULiDkt+x2jOyyzgxFYRTETBgMdiZkDIAZwe717ArmMnEaqXNpHhOr6
         v+TNo3aecMG2bHFGLvUVuut0fKSfkg3kG6fZyNUUsurYDG3pU4YaEH9GWDyhHmLayiA6
         /FRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696871472; x=1697476272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HrOeSqSvWBurLO1tHVKBNeKW8O5/gmeYRnrbc2wTr9o=;
        b=DDuftun9cBey21zErf4MvYEwI1agMFWuRjudzNCJW8v6B9CQHiqAKFonWapotOOqzH
         dtst6nXOryJD8ADH7jPI6j3PkoS9wv0rGghCXIlht1ZxCmD7saHi9bZSY0Ii/OmpiMvG
         SKRmyvclbIaJtNIsfczKogXOXgKuB2RhxSsiExjYmm4hIMa72Jci1ruTZT+WSPJ0sxqy
         HPS/S0lIlkZn83j088ecu3pe+yimfq9YS7xLTVG1KY1eoTWNaz3JEXDnGY/uhWtjcwhF
         9BOx26qEkitg5JXnz0CZMAVwr4uDO3TRAPrRu2fVgNTMH0QEE+Sous/g6LskKSyjxjFp
         RJXA==
X-Gm-Message-State: AOJu0YzJVi/5bcBOHngyV1Z+hgtk7QBd7nuGil9EwlphoDzrQvG11IJq
        Pi2zLPkOV9XkjWIFGUbqQbZXdQ==
X-Google-Smtp-Source: AGHT+IEydAT68rYk/7rWxi9ITpcyFc8MEOOyBPZk1rrH3Vv8ocA619aOEL17H/Z7wEHLrYN+Z5BcgQ==
X-Received: by 2002:a05:6512:2f0:b0:500:780b:5bdc with SMTP id m16-20020a05651202f000b00500780b5bdcmr13110820lfq.49.1696871472341;
        Mon, 09 Oct 2023 10:11:12 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id x14-20020a19f60e000000b00502e0388846sm1475991lfe.244.2023.10.09.10.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 10:11:11 -0700 (PDT)
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
Subject: [PATCH 1/3] drm/msm/dpu: enable writeback on SDM845
Date:   Mon,  9 Oct 2023 20:11:08 +0300
Message-Id: <20231009171110.2691115-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009171110.2691115-1-dmitry.baryshkov@linaro.org>
References: <20231009171110.2691115-1-dmitry.baryshkov@linaro.org>
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

Enable WB2 hardware block, enabling writeback support on this platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h | 18 ++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c |  6 ++++--
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
index 88a5177dfdb7..14ea173dc986 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -34,6 +34,7 @@ static const struct dpu_mdp_cfg sdm845_mdp = {
 		[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
 		[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2bc, .bit_off = 8 },
 		[DPU_CLK_CTRL_DMA3] = { .reg_off = 0x2c4, .bit_off = 8 },
+		[DPU_CLK_CTRL_WB2] = { .reg_off = 0x3b8, .bit_off = 24 },
 	},
 };
 
@@ -251,6 +252,21 @@ static const struct dpu_dsc_cfg sdm845_dsc[] = {
 	},
 };
 
+static const struct dpu_wb_cfg sdm845_wb[] = {
+	{
+		.name = "wb_2", .id = WB_2,
+		.base = 0x65000, .len = 0x2c8,
+		.features = WB_SDM845_MASK,
+		.format_list = wb2_formats,
+		.num_formats = ARRAY_SIZE(wb2_formats),
+		.clk_ctrl = DPU_CLK_CTRL_WB2,
+		.xin_id = 6,
+		.vbif_idx = VBIF_RT,
+		.maxlinewidth = 4096,
+		.intr_wb_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 4),
+	},
+};
+
 static const struct dpu_intf_cfg sdm845_intf[] = {
 	{
 		.name = "intf_0", .id = INTF_0,
@@ -348,6 +364,8 @@ const struct dpu_mdss_cfg dpu_sdm845_cfg = {
 	.pingpong = sdm845_pp,
 	.dsc_count = ARRAY_SIZE(sdm845_dsc),
 	.dsc = sdm845_dsc,
+	.wb_count = ARRAY_SIZE(sdm845_wb),
+	.wb = sdm845_wb,
 	.intf_count = ARRAY_SIZE(sdm845_intf),
 	.intf = sdm845_intf,
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 713dfc079718..cd86294d5818 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -106,14 +106,16 @@
 
 #define INTF_SC7280_MASK (INTF_SC7180_MASK)
 
-#define WB_SM8250_MASK (BIT(DPU_WB_LINE_MODE) | \
+#define WB_SDM845_MASK (BIT(DPU_WB_LINE_MODE) | \
 			 BIT(DPU_WB_UBWC) | \
 			 BIT(DPU_WB_YUV_CONFIG) | \
 			 BIT(DPU_WB_PIPE_ALPHA) | \
 			 BIT(DPU_WB_XY_ROI_OFFSET) | \
 			 BIT(DPU_WB_QOS) | \
 			 BIT(DPU_WB_QOS_8LVL) | \
-			 BIT(DPU_WB_CDP) | \
+			 BIT(DPU_WB_CDP))
+
+#define WB_SM8250_MASK (WB_SDM845_MASK | \
 			 BIT(DPU_WB_INPUT_CTRL))
 
 #define DEFAULT_PIXEL_RAM_SIZE		(50 * 1024)
-- 
2.39.2

