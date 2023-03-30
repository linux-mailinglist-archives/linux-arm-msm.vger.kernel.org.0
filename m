Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 577276D1153
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Mar 2023 23:54:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230198AbjC3VyW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Mar 2023 17:54:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230214AbjC3VyT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Mar 2023 17:54:19 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF4EE10A91
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 14:54:17 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id br6so26348448lfb.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 14:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680213257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6NrLM0fbA2xKF+BzZeHAhYf+T7YiUJ5uersxZDx73ww=;
        b=SJ3xhMkVBvmz9tyH+Jr+x9l97UMirHpWLo0s8dLaNTh2czK75AqPbTWNWPp7QvBVpR
         kp85OpFG4u6LYanh8eCWuFWi6RqBxMiuloTBlfaFO34S3SN9PFFIEl8UOCHYDgYv3VWg
         65t/vWtZ87dLELA61KPpwASpQgGWYGR5hbLIrhHW+xLRoe13K81OpD8n+WW+UcTKBO0c
         MCOCEi0ycNNIjU9+8t5c4V5mWHIIvGZd4IoAeye8AG4pHV1cOKDNxdasanfMfolRVXdA
         QX27BcKtlW9CtUZ7WPbVDmK0HAdGxQ7+5kSc9uGM19OwZAOTpKzpaNeeK2DPZ0jG7fZ/
         apsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680213257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6NrLM0fbA2xKF+BzZeHAhYf+T7YiUJ5uersxZDx73ww=;
        b=3txaRjznF4XLtu5/HDGBOXFOPXUo/gAoUDpdkOhhg3xUmI8Z3XKMin2fvV8KUF6nbf
         1+alnOPwdyd1dAKG5vASnhtA+kwL4jh4iwb+TxBxFTMJG2UCjA6m9ntbJo2MPqIyCOX5
         F2j2X94Ni8twNNwL07HGQ4qFS+CZXFpOUDbYtfckOYrH5gypV1u9JjIWkGcdPV23ZxZq
         5fiU+EBDCUy1uFa4r7fqmMxVCCNchJxQoWyR5BTwBcKuafykhLYqMVp+/Sxu3lCUrYV8
         BVSROZUBd6JUyuI3uCiGygaCtfusab2l1P/931FIYROwdcXbnj9O4XwwG0TUcRiEiQ7p
         sRCg==
X-Gm-Message-State: AAQBX9dszq5t/ilKlnEJqayWHmgmzd+8DeoUroRPtTFY50XFogR7/ELg
        k5m7W7o235suiudNE7czGDlwDA==
X-Google-Smtp-Source: AKy350aSsrtmjD6wGBbNTH6qmLMFiEojmx2y8CeBrel4+99LFz/tZnGGhGp42tX00qLSg6YOyen0Sg==
X-Received: by 2002:ac2:51c7:0:b0:4ea:f7be:e06e with SMTP id u7-20020ac251c7000000b004eaf7bee06emr6623191lfm.17.1680213257509;
        Thu, 30 Mar 2023 14:54:17 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id f16-20020a056512093000b004cc8207741fsm104574lft.93.2023.03.30.14.54.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 14:54:16 -0700 (PDT)
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
Subject: [PATCH v3 30/38] drm/msm/dpu: deduplicate sm6115 with qcm2290
Date:   Fri, 31 Mar 2023 00:53:16 +0300
Message-Id: <20230330215324.1853304-31-dmitry.baryshkov@linaro.org>
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

Remove duplicate between sm6115 and qcm2290, which belong to the same
DPU major revision.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    | 36 ++++------
 .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   | 66 ++++---------------
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_lm1.h | 50 ++++++++++++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  2 +-
 4 files changed, 79 insertions(+), 75 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_lm1.h

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
index f6db2d42a0ed..f9d45b98cedf 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
@@ -7,6 +7,8 @@
 #ifndef _DPU_6_3_SM6115_H
 #define _DPU_6_3_SM6115_H
 
+#include "dpu_6_lm1.h"
+
 static const struct dpu_caps sm6115_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_LINE_WIDTH,
 	.max_mixer_blendstages = 0x4,
@@ -23,16 +25,6 @@ static const struct dpu_ubwc_cfg sm6115_ubwc_cfg = {
 	.ubwc_swizzle = 0x7,
 };
 
-static const struct dpu_mdp_cfg sm6115_mdp[] = {
-	{
-	.name = "top_0", .id = MDP_TOP,
-	.base = 0x0, .len = 0x494,
-	.features = 0,
-	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
-	.clk_ctrls[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
-	},
-};
-
 static const struct dpu_sspp_cfg sm6115_sspp[] = {
 	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1f8, VIG_SC7180_MASK,
 		sm6115_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
@@ -72,20 +64,20 @@ static const struct dpu_perf_cfg sm6115_perf_data = {
 static const struct dpu_mdss_cfg sm6115_dpu_cfg = {
 	.caps = &sm6115_dpu_caps,
 	.ubwc = &sm6115_ubwc_cfg,
-	.mdp_count = ARRAY_SIZE(sm6115_mdp),
-	.mdp = sm6115_mdp,
-	.ctl_count = ARRAY_SIZE(qcm2290_ctl),
-	.ctl = qcm2290_ctl,
+	.mdp_count = ARRAY_SIZE(dpu_6_lm1_mdp),
+	.mdp = dpu_6_lm1_mdp,
+	.ctl_count = ARRAY_SIZE(dpu_6_lm1_ctl),
+	.ctl = dpu_6_lm1_ctl,
 	.sspp_count = ARRAY_SIZE(sm6115_sspp),
 	.sspp = sm6115_sspp,
-	.mixer_count = ARRAY_SIZE(qcm2290_lm),
-	.mixer = qcm2290_lm,
-	.dspp_count = ARRAY_SIZE(qcm2290_dspp),
-	.dspp = qcm2290_dspp,
-	.pingpong_count = ARRAY_SIZE(qcm2290_pp),
-	.pingpong = qcm2290_pp,
-	.intf_count = ARRAY_SIZE(qcm2290_intf),
-	.intf = qcm2290_intf,
+	.mixer_count = ARRAY_SIZE(dpu_6_lm1_lm),
+	.mixer = dpu_6_lm1_lm,
+	.dspp_count = ARRAY_SIZE(dpu_6_lm1_dspp),
+	.dspp = dpu_6_lm1_dspp,
+	.pingpong_count = ARRAY_SIZE(dpu_6_lm1_pp),
+	.pingpong = dpu_6_lm1_pp,
+	.intf_count = ARRAY_SIZE(dpu_6_lm1_intf),
+	.intf = dpu_6_lm1_intf,
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
 	.vbif = sdm845_vbif,
 	.perf = &sm6115_perf_data,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
index 10dd35cd67bc..314ec678fcc6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
@@ -7,6 +7,8 @@
 #ifndef _DPU_6_5_QCM2290_H
 #define _DPU_6_5_QCM2290_H
 
+#include "dpu_6_lm1.h"
+
 static const struct dpu_caps qcm2290_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_LINE_WIDTH,
 	.max_mixer_blendstages = 0x4,
@@ -20,25 +22,6 @@ static const struct dpu_ubwc_cfg qcm2290_ubwc_cfg = {
 	.highest_bank_bit = 0x2,
 };
 
-static const struct dpu_mdp_cfg qcm2290_mdp[] = {
-	{
-	.name = "top_0", .id = MDP_TOP,
-	.base = 0x0, .len = 0x494,
-	.features = 0,
-	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
-	.clk_ctrls[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
-	},
-};
-
-static const struct dpu_ctl_cfg qcm2290_ctl[] = {
-	{
-	.name = "ctl_0", .id = CTL_0,
-	.base = 0x1000, .len = 0x1dc,
-	.features = BIT(DPU_CTL_ACTIVE_CFG),
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
-	},
-};
-
 static const struct dpu_sspp_cfg qcm2290_sspp[] = {
 	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1f8, VIG_QCM2290_MASK,
 		 qcm2290_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
@@ -46,27 +29,6 @@ static const struct dpu_sspp_cfg qcm2290_sspp[] = {
 		 qcm2290_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
 };
 
-static const struct dpu_lm_cfg qcm2290_lm[] = {
-	LM_BLK("lm_0", LM_0, 0x44000, MIXER_QCM2290_MASK,
-		&qcm2290_lm_sblk, PINGPONG_0, 0, DSPP_0),
-};
-
-static const struct dpu_dspp_cfg qcm2290_dspp[] = {
-	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
-		 &sm8150_dspp_sblk),
-};
-
-static const struct dpu_pingpong_cfg qcm2290_pp[] = {
-	PP_BLK("pingpong_0", PINGPONG_0, 0x70000, 0, sdm845_pp_sblk,
-		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
-		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
-};
-
-static const struct dpu_intf_cfg qcm2290_intf[] = {
-	INTF_BLK("intf_0", INTF_0, 0x00000, 0x2b8, INTF_NONE, 0, 0, 0, 0, 0, 0),
-	INTF_BLK("intf_1", INTF_1, 0x6a800, 0x2b8, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
-};
-
 static const struct dpu_perf_cfg qcm2290_perf_data = {
 	.max_bw_low = 2700000,
 	.max_bw_high = 2700000,
@@ -92,20 +54,20 @@ static const struct dpu_perf_cfg qcm2290_perf_data = {
 static const struct dpu_mdss_cfg qcm2290_dpu_cfg = {
 	.caps = &qcm2290_dpu_caps,
 	.ubwc = &qcm2290_ubwc_cfg,
-	.mdp_count = ARRAY_SIZE(qcm2290_mdp),
-	.mdp = qcm2290_mdp,
-	.ctl_count = ARRAY_SIZE(qcm2290_ctl),
-	.ctl = qcm2290_ctl,
+	.mdp_count = ARRAY_SIZE(dpu_6_lm1_mdp),
+	.mdp = dpu_6_lm1_mdp,
+	.ctl_count = ARRAY_SIZE(dpu_6_lm1_ctl),
+	.ctl = dpu_6_lm1_ctl,
 	.sspp_count = ARRAY_SIZE(qcm2290_sspp),
 	.sspp = qcm2290_sspp,
-	.mixer_count = ARRAY_SIZE(qcm2290_lm),
-	.mixer = qcm2290_lm,
-	.dspp_count = ARRAY_SIZE(qcm2290_dspp),
-	.dspp = qcm2290_dspp,
-	.pingpong_count = ARRAY_SIZE(qcm2290_pp),
-	.pingpong = qcm2290_pp,
-	.intf_count = ARRAY_SIZE(qcm2290_intf),
-	.intf = qcm2290_intf,
+	.mixer_count = ARRAY_SIZE(dpu_6_lm1_lm),
+	.mixer = dpu_6_lm1_lm,
+	.dspp_count = ARRAY_SIZE(dpu_6_lm1_dspp),
+	.dspp = dpu_6_lm1_dspp,
+	.pingpong_count = ARRAY_SIZE(dpu_6_lm1_pp),
+	.pingpong = dpu_6_lm1_pp,
+	.intf_count = ARRAY_SIZE(dpu_6_lm1_intf),
+	.intf = dpu_6_lm1_intf,
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
 	.vbif = sdm845_vbif,
 	.perf = &qcm2290_perf_data,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_lm1.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_lm1.h
new file mode 100644
index 000000000000..2bd3c4051dbc
--- /dev/null
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_lm1.h
@@ -0,0 +1,50 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2022. Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2015-2018, 2020 The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _DPU_6_LM1_H
+#define _DPU_6_LM1_H
+
+static const struct dpu_mdp_cfg dpu_6_lm1_mdp[] = {
+	{
+	.name = "top_0", .id = MDP_TOP,
+	.base = 0x0, .len = 0x494,
+	.features = 0,
+	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
+	.clk_ctrls[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
+	},
+};
+
+static const struct dpu_ctl_cfg dpu_6_lm1_ctl[] = {
+	{
+	.name = "ctl_0", .id = CTL_0,
+	.base = 0x1000, .len = 0x1dc,
+	.features = BIT(DPU_CTL_ACTIVE_CFG),
+	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
+	},
+};
+
+static const struct dpu_lm_cfg dpu_6_lm1_lm[] = {
+	LM_BLK("lm_0", LM_0, 0x44000, MIXER_QCM2290_MASK,
+		&qcm2290_lm_sblk, PINGPONG_0, 0, DSPP_0),
+};
+
+static const struct dpu_dspp_cfg dpu_6_lm1_dspp[] = {
+	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
+		 &sm8150_dspp_sblk),
+};
+
+static const struct dpu_pingpong_cfg dpu_6_lm1_pp[] = {
+	PP_BLK("pingpong_0", PINGPONG_0, 0x70000, 0, sdm845_pp_sblk,
+		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
+		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
+};
+
+static const struct dpu_intf_cfg dpu_6_lm1_intf[] = {
+	INTF_BLK("intf_0", INTF_0, 0x00000, 0x2b8, INTF_NONE, 0, 0, 0, 0, 0, 0),
+	INTF_BLK("intf_1", INTF_1, 0x6a800, 0x2b8, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
+};
+
+#endif
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index d3c22c2e2f6a..547546d85474 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -866,8 +866,8 @@ static const struct dpu_qos_lut_entry sc7180_qos_nrt[] = {
 
 #include "catalog/dpu_6_0_sm8250.h"
 #include "catalog/dpu_6_2_sc7180.h"
-#include "catalog/dpu_6_5_qcm2290.h"
 #include "catalog/dpu_6_3_sm6115.h"
+#include "catalog/dpu_6_5_qcm2290.h"
 
 #include "catalog/dpu_7_0_sm8350.h"
 #include "catalog/dpu_7_2_sc7280.h"
-- 
2.39.2

