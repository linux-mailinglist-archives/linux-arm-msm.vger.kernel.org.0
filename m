Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E740F76CA6B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Aug 2023 12:04:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234237AbjHBKEx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Aug 2023 06:04:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231358AbjHBKEj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Aug 2023 06:04:39 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E36DB2D5F
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Aug 2023 03:04:34 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4fe3678010eso5196964e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Aug 2023 03:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690970673; x=1691575473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5pUiB6TuSpMEjzn0i4N9x957q4082cVP7g69Ve01TwQ=;
        b=oXG9u8G/tYkhEX3dr5YEoSbTWnb54yKXnxH7S+wisTBoRkuUYEdbbHO/iP6G1Xqa0i
         fh+8ytzEkp9dQLgpbrGft9Y25d1dzuROVoaLJKljZO3zUVH0duxzKkx1nZ5QRmbR4Ndr
         5La3f7Y0iVxEcT8gQpKdbzJ3QqFyNJDOvz/fi9Z/dgR5eWNZiQZeoObcakQU1ZTPIdLK
         gL52zqXuc1xXygt5MHCrWqaN7ebbS4K/1rckhE3hcuXkUlGKtJOVrcaAMEIJOhPfxx5B
         2FOoStaH+eldh9S9OrtdKg5cZhdmyavCAsw1tDq+0hg4tOrG8i4gpiBvRssTn74GQQZZ
         HWDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690970673; x=1691575473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5pUiB6TuSpMEjzn0i4N9x957q4082cVP7g69Ve01TwQ=;
        b=ci8t9feHthvL7lcltC2XVPq9TmQ1ouTubZ1F7csyOVhi1MH26bdPFBYsbtdRm7ubXY
         2RV8qbWtyTngBcU40pjWJET4Tbn2GkmqfeGd6vrlnPiyA+qXkUPLLRtiGfrUL5pE23VF
         IavwAUEXjYnYw59uTeT9usWull755Iut0DrpMZ1AFS5zFvKFAYPheeOIbbSolvLPO1US
         KGcDiRtTFQtUPtE9hpJ1eb36Pl5PAT3TvkdJj6oaj+/NnOUTZ+6VY1Q/My+5lYkhGUiO
         ExYQSj4swnHNJjCBx3+zTv1ndVGgL/jr7BBI6hw9HRm4pZX440vJdBnPUYVi/1XBEOmN
         COeA==
X-Gm-Message-State: ABy/qLbUMsXc6WHyUXg5VnKyC6gulZ4cI7TkI6Zr6t69nnyoxs4tOl4s
        io0ZZY14mmIgw1tGuv5HP+p/UA==
X-Google-Smtp-Source: APBJJlHk487iYP2R4+mQaRtmc+z/s+2N03aI4CT5I0Ed7V2uhR9ij9mkST/I8VPx7FcaaPpPIZuETw==
X-Received: by 2002:a19:e052:0:b0:4fb:8987:734e with SMTP id g18-20020a19e052000000b004fb8987734emr4170785lfj.68.1690970673020;
        Wed, 02 Aug 2023 03:04:33 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id p21-20020a19f015000000b004fbf5242e8bsm2402353lfc.231.2023.08.02.03.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 03:04:32 -0700 (PDT)
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
Subject: [PATCH v5 8/8] drm/msm/dpu: shift IRQ indices by 1
Date:   Wed,  2 Aug 2023 13:04:26 +0300
Message-Id: <20230802100426.4184892-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230802100426.4184892-1-dmitry.baryshkov@linaro.org>
References: <20230802100426.4184892-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In order to simplify IRQ declarations, shift IRQ indices by 1. This
makes 0 the 'no IRQ' value. Thanks to this change, we do no longer have
to explicitly set the 'no interrupt' fields in catalog structures.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   |  4 --
 .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    |  4 --
 .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    |  8 ----
 .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   | 10 -----
 .../msm/disp/dpu1/catalog/dpu_5_4_sm6125.h    |  3 --
 .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    |  8 ----
 .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |  3 --
 .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    |  1 -
 .../msm/disp/dpu1/catalog/dpu_6_4_sm6350.h    |  3 --
 .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   |  1 -
 .../msm/disp/dpu1/catalog/dpu_6_9_sm6375.h    |  1 -
 .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    |  8 ----
 .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |  6 ---
 .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  | 13 -------
 .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    | 12 ------
 .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    | 12 ------
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h  |  6 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |  9 +----
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  4 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    | 14 +++----
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 37 +++++++++++--------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |  6 +--
 22 files changed, 38 insertions(+), 135 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
index 43c47a19cd94..aa1867943c9f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
@@ -244,7 +244,6 @@ static const struct dpu_intf_cfg msm8998_intf[] = {
 		.prog_fetch_lines_worst_case = 21,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25),
-		.intr_tear_rd_ptr = -1,
 	}, {
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x6a800, .len = 0x280,
@@ -253,7 +252,6 @@ static const struct dpu_intf_cfg msm8998_intf[] = {
 		.prog_fetch_lines_worst_case = 21,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
-		.intr_tear_rd_ptr = -1,
 	}, {
 		.name = "intf_2", .id = INTF_2,
 		.base = 0x6b000, .len = 0x280,
@@ -262,7 +260,6 @@ static const struct dpu_intf_cfg msm8998_intf[] = {
 		.prog_fetch_lines_worst_case = 21,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
-		.intr_tear_rd_ptr = -1,
 	}, {
 		.name = "intf_3", .id = INTF_3,
 		.base = 0x6b800, .len = 0x280,
@@ -270,7 +267,6 @@ static const struct dpu_intf_cfg msm8998_intf[] = {
 		.prog_fetch_lines_worst_case = 21,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31),
-		.intr_tear_rd_ptr = -1,
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
index 88a5177dfdb7..38ac0c1a134b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -260,7 +260,6 @@ static const struct dpu_intf_cfg sdm845_intf[] = {
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25),
-		.intr_tear_rd_ptr = -1,
 	}, {
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x6a800, .len = 0x280,
@@ -269,7 +268,6 @@ static const struct dpu_intf_cfg sdm845_intf[] = {
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
-		.intr_tear_rd_ptr = -1,
 	}, {
 		.name = "intf_2", .id = INTF_2,
 		.base = 0x6b000, .len = 0x280,
@@ -278,7 +276,6 @@ static const struct dpu_intf_cfg sdm845_intf[] = {
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
-		.intr_tear_rd_ptr = -1,
 	}, {
 		.name = "intf_3", .id = INTF_3,
 		.base = 0x6b800, .len = 0x280,
@@ -287,7 +284,6 @@ static const struct dpu_intf_cfg sdm845_intf[] = {
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31),
-		.intr_tear_rd_ptr = -1,
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index 99acaf917e43..9392ad2b4d3f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -220,7 +220,6 @@ static const struct dpu_pingpong_cfg sm8150_pp[] = {
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_0,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
-		.intr_rdptr = -1,
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
@@ -228,7 +227,6 @@ static const struct dpu_pingpong_cfg sm8150_pp[] = {
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_0,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
-		.intr_rdptr = -1,
 	}, {
 		.name = "pingpong_2", .id = PINGPONG_2,
 		.base = 0x71000, .len = 0xd4,
@@ -236,7 +234,6 @@ static const struct dpu_pingpong_cfg sm8150_pp[] = {
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_1,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
-		.intr_rdptr = -1,
 	}, {
 		.name = "pingpong_3", .id = PINGPONG_3,
 		.base = 0x71800, .len = 0xd4,
@@ -244,7 +241,6 @@ static const struct dpu_pingpong_cfg sm8150_pp[] = {
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_1,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
-		.intr_rdptr = -1,
 	}, {
 		.name = "pingpong_4", .id = PINGPONG_4,
 		.base = 0x72000, .len = 0xd4,
@@ -252,7 +248,6 @@ static const struct dpu_pingpong_cfg sm8150_pp[] = {
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_2,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
-		.intr_rdptr = -1,
 	}, {
 		.name = "pingpong_5", .id = PINGPONG_5,
 		.base = 0x72800, .len = 0xd4,
@@ -260,7 +255,6 @@ static const struct dpu_pingpong_cfg sm8150_pp[] = {
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_2,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
-		.intr_rdptr = -1,
 	},
 };
 
@@ -307,7 +301,6 @@ static const struct dpu_intf_cfg sm8150_intf[] = {
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25),
-		.intr_tear_rd_ptr = -1,
 	}, {
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x6a800, .len = 0x2bc,
@@ -337,7 +330,6 @@ static const struct dpu_intf_cfg sm8150_intf[] = {
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31),
-		.intr_tear_rd_ptr = -1,
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index f3de21025ca7..e07f4c8c25b9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -219,7 +219,6 @@ static const struct dpu_pingpong_cfg sc8180x_pp[] = {
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_0,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
-		.intr_rdptr = -1,
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
@@ -227,7 +226,6 @@ static const struct dpu_pingpong_cfg sc8180x_pp[] = {
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_0,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
-		.intr_rdptr = -1,
 	}, {
 		.name = "pingpong_2", .id = PINGPONG_2,
 		.base = 0x71000, .len = 0xd4,
@@ -235,7 +233,6 @@ static const struct dpu_pingpong_cfg sc8180x_pp[] = {
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_1,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
-		.intr_rdptr = -1,
 	}, {
 		.name = "pingpong_3", .id = PINGPONG_3,
 		.base = 0x71800, .len = 0xd4,
@@ -243,7 +240,6 @@ static const struct dpu_pingpong_cfg sc8180x_pp[] = {
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_1,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
-		.intr_rdptr = -1,
 	}, {
 		.name = "pingpong_4", .id = PINGPONG_4,
 		.base = 0x72000, .len = 0xd4,
@@ -251,7 +247,6 @@ static const struct dpu_pingpong_cfg sc8180x_pp[] = {
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_2,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
-		.intr_rdptr = -1,
 	}, {
 		.name = "pingpong_5", .id = PINGPONG_5,
 		.base = 0x72800, .len = 0xd4,
@@ -259,7 +254,6 @@ static const struct dpu_pingpong_cfg sc8180x_pp[] = {
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_2,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
-		.intr_rdptr = -1,
 	},
 };
 
@@ -314,7 +308,6 @@ static const struct dpu_intf_cfg sc8180x_intf[] = {
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25),
-		.intr_tear_rd_ptr = -1,
 	}, {
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x6a800, .len = 0x2bc,
@@ -346,7 +339,6 @@ static const struct dpu_intf_cfg sc8180x_intf[] = {
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31),
-		.intr_tear_rd_ptr = -1,
 	}, {
 		.name = "intf_4", .id = INTF_4,
 		.base = 0x6c000, .len = 0x280,
@@ -356,7 +348,6 @@ static const struct dpu_intf_cfg sc8180x_intf[] = {
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 20),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 21),
-		.intr_tear_rd_ptr = -1,
 	}, {
 		.name = "intf_5", .id = INTF_5,
 		.base = 0x6c800, .len = 0x280,
@@ -366,7 +357,6 @@ static const struct dpu_intf_cfg sc8180x_intf[] = {
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 22),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 23),
-		.intr_tear_rd_ptr = -1,
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
index 2491eed10039..cec7af6667dc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
@@ -129,7 +129,6 @@ static const struct dpu_pingpong_cfg sm6125_pp[] = {
 		.merge_3d = 0,
 		.sblk = &sdm845_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
-		.intr_rdptr = -1,
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
@@ -137,7 +136,6 @@ static const struct dpu_pingpong_cfg sm6125_pp[] = {
 		.merge_3d = 0,
 		.sblk = &sdm845_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
-		.intr_rdptr = -1,
 	},
 };
 
@@ -151,7 +149,6 @@ static const struct dpu_intf_cfg sm6125_intf[] = {
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25),
-		.intr_tear_rd_ptr = -1,
 	}, {
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x6a800, .len = 0x2c0,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index 5f9b437b82a6..94278a3e3483 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -219,7 +219,6 @@ static const struct dpu_pingpong_cfg sm8250_pp[] = {
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_0,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
-		.intr_rdptr = -1,
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
@@ -227,7 +226,6 @@ static const struct dpu_pingpong_cfg sm8250_pp[] = {
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_0,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
-		.intr_rdptr = -1,
 	}, {
 		.name = "pingpong_2", .id = PINGPONG_2,
 		.base = 0x71000, .len = 0xd4,
@@ -235,7 +233,6 @@ static const struct dpu_pingpong_cfg sm8250_pp[] = {
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_1,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
-		.intr_rdptr = -1,
 	}, {
 		.name = "pingpong_3", .id = PINGPONG_3,
 		.base = 0x71800, .len = 0xd4,
@@ -243,7 +240,6 @@ static const struct dpu_pingpong_cfg sm8250_pp[] = {
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_1,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
-		.intr_rdptr = -1,
 	}, {
 		.name = "pingpong_4", .id = PINGPONG_4,
 		.base = 0x72000, .len = 0xd4,
@@ -251,7 +247,6 @@ static const struct dpu_pingpong_cfg sm8250_pp[] = {
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_2,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
-		.intr_rdptr = -1,
 	}, {
 		.name = "pingpong_5", .id = PINGPONG_5,
 		.base = 0x72800, .len = 0xd4,
@@ -259,7 +254,6 @@ static const struct dpu_pingpong_cfg sm8250_pp[] = {
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_2,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
-		.intr_rdptr = -1,
 	},
 };
 
@@ -306,7 +300,6 @@ static const struct dpu_intf_cfg sm8250_intf[] = {
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25),
-		.intr_tear_rd_ptr = -1,
 	}, {
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x6a800, .len = 0x2c0,
@@ -336,7 +329,6 @@ static const struct dpu_intf_cfg sm8250_intf[] = {
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31),
-		.intr_tear_rd_ptr = -1,
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
index d030c08636b4..c0d88ddccb28 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
@@ -120,7 +120,6 @@ static const struct dpu_pingpong_cfg sc7180_pp[] = {
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = 0,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
-		.intr_rdptr = -1,
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
@@ -128,7 +127,6 @@ static const struct dpu_pingpong_cfg sc7180_pp[] = {
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = 0,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
-		.intr_rdptr = -1,
 	},
 };
 
@@ -142,7 +140,6 @@ static const struct dpu_intf_cfg sc7180_intf[] = {
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25),
-		.intr_tear_rd_ptr = -1,
 	}, {
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x6a800, .len = 0x2c0,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
index 7e6000167ef0..57ce14c18def 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
@@ -83,7 +83,6 @@ static const struct dpu_pingpong_cfg sm6115_pp[] = {
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = 0,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
-		.intr_rdptr = -1,
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
index cf5db6f296bd..62db84bd15f2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
@@ -128,7 +128,6 @@ static struct dpu_pingpong_cfg sm6350_pp[] = {
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = 0,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
-		.intr_rdptr = -1,
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
@@ -136,7 +135,6 @@ static struct dpu_pingpong_cfg sm6350_pp[] = {
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = 0,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
-		.intr_rdptr = -1,
 	},
 };
 
@@ -158,7 +156,6 @@ static const struct dpu_intf_cfg sm6350_intf[] = {
 		.prog_fetch_lines_worst_case = 35,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25),
-		.intr_tear_rd_ptr = -1,
 	}, {
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x6a800, .len = 0x2c0,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
index 87a03aa16554..fb36fba5171c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
@@ -82,7 +82,6 @@ static const struct dpu_pingpong_cfg qcm2290_pp[] = {
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = 0,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
-		.intr_rdptr = -1,
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
index a327e21c90fb..5a3aad364c78 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
@@ -85,7 +85,6 @@ static const struct dpu_pingpong_cfg sm6375_pp[] = {
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = 0,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
-		.intr_rdptr = -1,
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index c906b6864b5e..63f8856325fc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -218,7 +218,6 @@ static const struct dpu_pingpong_cfg sm8350_pp[] = {
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_0,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
-		.intr_rdptr = -1,
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x6a000, .len = 0,
@@ -226,7 +225,6 @@ static const struct dpu_pingpong_cfg sm8350_pp[] = {
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_0,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
-		.intr_rdptr = -1,
 	}, {
 		.name = "pingpong_2", .id = PINGPONG_2,
 		.base = 0x6b000, .len = 0,
@@ -234,7 +232,6 @@ static const struct dpu_pingpong_cfg sm8350_pp[] = {
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_1,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
-		.intr_rdptr = -1,
 	}, {
 		.name = "pingpong_3", .id = PINGPONG_3,
 		.base = 0x6c000, .len = 0,
@@ -242,7 +239,6 @@ static const struct dpu_pingpong_cfg sm8350_pp[] = {
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_1,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
-		.intr_rdptr = -1,
 	}, {
 		.name = "pingpong_4", .id = PINGPONG_4,
 		.base = 0x6d000, .len = 0,
@@ -250,7 +246,6 @@ static const struct dpu_pingpong_cfg sm8350_pp[] = {
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_2,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
-		.intr_rdptr = -1,
 	}, {
 		.name = "pingpong_5", .id = PINGPONG_5,
 		.base = 0x6e000, .len = 0,
@@ -258,7 +253,6 @@ static const struct dpu_pingpong_cfg sm8350_pp[] = {
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_2,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
-		.intr_rdptr = -1,
 	},
 };
 
@@ -314,7 +308,6 @@ static const struct dpu_intf_cfg sm8350_intf[] = {
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25),
-		.intr_tear_rd_ptr = -1,
 	}, {
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x35000, .len = 0x2c4,
@@ -344,7 +337,6 @@ static const struct dpu_intf_cfg sm8350_intf[] = {
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31),
-		.intr_tear_rd_ptr = -1,
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index 2bf9f34e54c6..1bb733994a5d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -131,7 +131,6 @@ static const struct dpu_pingpong_cfg sc7280_pp[] = {
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = 0,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
-		.intr_rdptr = -1,
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x6a000, .len = 0,
@@ -139,7 +138,6 @@ static const struct dpu_pingpong_cfg sc7280_pp[] = {
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = 0,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
-		.intr_rdptr = -1,
 	}, {
 		.name = "pingpong_2", .id = PINGPONG_2,
 		.base = 0x6b000, .len = 0,
@@ -147,7 +145,6 @@ static const struct dpu_pingpong_cfg sc7280_pp[] = {
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = 0,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
-		.intr_rdptr = -1,
 	}, {
 		.name = "pingpong_3", .id = PINGPONG_3,
 		.base = 0x6c000, .len = 0,
@@ -155,7 +152,6 @@ static const struct dpu_pingpong_cfg sc7280_pp[] = {
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = 0,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
-		.intr_rdptr = -1,
 	},
 };
 
@@ -194,7 +190,6 @@ static const struct dpu_intf_cfg sc7280_intf[] = {
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25),
-		.intr_tear_rd_ptr = -1,
 	}, {
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x35000, .len = 0x2c4,
@@ -214,7 +209,6 @@ static const struct dpu_intf_cfg sc7280_intf[] = {
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 22),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 23),
-		.intr_tear_rd_ptr = -1,
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index ccd0477f4877..7fbfdc0d13a4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -221,7 +221,6 @@ static const struct dpu_pingpong_cfg sc8280xp_pp[] = {
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_0,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
-		.intr_rdptr = -1,
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x6a000, .len = 0,
@@ -229,7 +228,6 @@ static const struct dpu_pingpong_cfg sc8280xp_pp[] = {
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_0,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
-		.intr_rdptr = -1,
 	}, {
 		.name = "pingpong_2", .id = PINGPONG_2,
 		.base = 0x6b000, .len = 0,
@@ -237,7 +235,6 @@ static const struct dpu_pingpong_cfg sc8280xp_pp[] = {
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_1,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
-		.intr_rdptr = -1,
 	}, {
 		.name = "pingpong_3", .id = PINGPONG_3,
 		.base = 0x6c000, .len = 0,
@@ -245,7 +242,6 @@ static const struct dpu_pingpong_cfg sc8280xp_pp[] = {
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_1,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
-		.intr_rdptr = -1,
 	}, {
 		.name = "pingpong_4", .id = PINGPONG_4,
 		.base = 0x6d000, .len = 0,
@@ -253,7 +249,6 @@ static const struct dpu_pingpong_cfg sc8280xp_pp[] = {
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_2,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
-		.intr_rdptr = -1,
 	}, {
 		.name = "pingpong_5", .id = PINGPONG_5,
 		.base = 0x6e000, .len = 0,
@@ -261,7 +256,6 @@ static const struct dpu_pingpong_cfg sc8280xp_pp[] = {
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_2,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
-		.intr_rdptr = -1,
 	},
 };
 
@@ -328,7 +322,6 @@ static const struct dpu_intf_cfg sc8280xp_intf[] = {
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25),
-		.intr_tear_rd_ptr = -1,
 	}, {
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x35000, .len = 0x300,
@@ -358,7 +351,6 @@ static const struct dpu_intf_cfg sc8280xp_intf[] = {
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31),
-		.intr_tear_rd_ptr = -1,
 	}, {
 		.name = "intf_4", .id = INTF_4,
 		.base = 0x38000, .len = 0x280,
@@ -368,7 +360,6 @@ static const struct dpu_intf_cfg sc8280xp_intf[] = {
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 20),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 21),
-		.intr_tear_rd_ptr = -1,
 	}, {
 		.name = "intf_5", .id = INTF_5,
 		.base = 0x39000, .len = 0x280,
@@ -378,7 +369,6 @@ static const struct dpu_intf_cfg sc8280xp_intf[] = {
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 22),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 23),
-		.intr_tear_rd_ptr = -1,
 	}, {
 		.name = "intf_6", .id = INTF_6,
 		.base = 0x3a000, .len = 0x280,
@@ -388,7 +378,6 @@ static const struct dpu_intf_cfg sc8280xp_intf[] = {
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 16),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 17),
-		.intr_tear_rd_ptr = -1,
 	}, {
 		.name = "intf_7", .id = INTF_7,
 		.base = 0x3b000, .len = 0x280,
@@ -398,7 +387,6 @@ static const struct dpu_intf_cfg sc8280xp_intf[] = {
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 18),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 19),
-		.intr_tear_rd_ptr = -1,
 	}, {
 		.name = "intf_8", .id = INTF_8,
 		.base = 0x3c000, .len = 0x280,
@@ -408,7 +396,6 @@ static const struct dpu_intf_cfg sc8280xp_intf[] = {
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13),
-		.intr_tear_rd_ptr = -1,
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index 2b2e9d4800f8..8377b6567f25 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -221,7 +221,6 @@ static const struct dpu_pingpong_cfg sm8450_pp[] = {
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_0,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
-		.intr_rdptr = -1,
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x6a000, .len = 0,
@@ -229,7 +228,6 @@ static const struct dpu_pingpong_cfg sm8450_pp[] = {
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_0,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
-		.intr_rdptr = -1,
 	}, {
 		.name = "pingpong_2", .id = PINGPONG_2,
 		.base = 0x6b000, .len = 0,
@@ -237,7 +235,6 @@ static const struct dpu_pingpong_cfg sm8450_pp[] = {
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_1,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
-		.intr_rdptr = -1,
 	}, {
 		.name = "pingpong_3", .id = PINGPONG_3,
 		.base = 0x6c000, .len = 0,
@@ -245,7 +242,6 @@ static const struct dpu_pingpong_cfg sm8450_pp[] = {
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_1,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
-		.intr_rdptr = -1,
 	}, {
 		.name = "pingpong_4", .id = PINGPONG_4,
 		.base = 0x6d000, .len = 0,
@@ -253,7 +249,6 @@ static const struct dpu_pingpong_cfg sm8450_pp[] = {
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_2,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
-		.intr_rdptr = -1,
 	}, {
 		.name = "pingpong_5", .id = PINGPONG_5,
 		.base = 0x6e000, .len = 0,
@@ -261,23 +256,18 @@ static const struct dpu_pingpong_cfg sm8450_pp[] = {
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_2,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
-		.intr_rdptr = -1,
 	}, {
 		.name = "pingpong_6", .id = PINGPONG_6,
 		.base = 0x65800, .len = 0,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_3,
-		.intr_done = -1,
-		.intr_rdptr = -1,
 	}, {
 		.name = "pingpong_7", .id = PINGPONG_7,
 		.base = 0x65c00, .len = 0,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_3,
-		.intr_done = -1,
-		.intr_rdptr = -1,
 	},
 };
 
@@ -336,7 +326,6 @@ static const struct dpu_intf_cfg sm8450_intf[] = {
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25),
-		.intr_tear_rd_ptr = -1,
 	}, {
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x35000, .len = 0x300,
@@ -366,7 +355,6 @@ static const struct dpu_intf_cfg sm8450_intf[] = {
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31),
-		.intr_tear_rd_ptr = -1,
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index 833be1167499..e0ca42a4675c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -236,7 +236,6 @@ static const struct dpu_pingpong_cfg sm8550_pp[] = {
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_0,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
-		.intr_rdptr = -1,
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x6a000, .len = 0,
@@ -244,7 +243,6 @@ static const struct dpu_pingpong_cfg sm8550_pp[] = {
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_0,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
-		.intr_rdptr = -1,
 	}, {
 		.name = "pingpong_2", .id = PINGPONG_2,
 		.base = 0x6b000, .len = 0,
@@ -252,7 +250,6 @@ static const struct dpu_pingpong_cfg sm8550_pp[] = {
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_1,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
-		.intr_rdptr = -1,
 	}, {
 		.name = "pingpong_3", .id = PINGPONG_3,
 		.base = 0x6c000, .len = 0,
@@ -260,7 +257,6 @@ static const struct dpu_pingpong_cfg sm8550_pp[] = {
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_1,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
-		.intr_rdptr = -1,
 	}, {
 		.name = "pingpong_4", .id = PINGPONG_4,
 		.base = 0x6d000, .len = 0,
@@ -268,7 +264,6 @@ static const struct dpu_pingpong_cfg sm8550_pp[] = {
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_2,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
-		.intr_rdptr = -1,
 	}, {
 		.name = "pingpong_5", .id = PINGPONG_5,
 		.base = 0x6e000, .len = 0,
@@ -276,23 +271,18 @@ static const struct dpu_pingpong_cfg sm8550_pp[] = {
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_2,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
-		.intr_rdptr = -1,
 	}, {
 		.name = "pingpong_6", .id = PINGPONG_6,
 		.base = 0x66000, .len = 0,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_3,
-		.intr_done = -1,
-		.intr_rdptr = -1,
 	}, {
 		.name = "pingpong_7", .id = PINGPONG_7,
 		.base = 0x66400, .len = 0,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_3,
-		.intr_done = -1,
-		.intr_rdptr = -1,
 	},
 };
 
@@ -351,7 +341,6 @@ static const struct dpu_intf_cfg sm8550_intf[] = {
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25),
-		.intr_tear_rd_ptr = -1,
 	}, {
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x35000, .len = 0x300,
@@ -381,7 +370,6 @@ static const struct dpu_intf_cfg sm8550_intf[] = {
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31),
-		.intr_tear_rd_ptr = -1,
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h
index ba06312cbb16..7c286bafb948 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h
@@ -37,7 +37,7 @@ irqreturn_t dpu_core_irq(struct msm_kms *kms);
  */
 u32 dpu_core_irq_read(
 		struct dpu_kms *dpu_kms,
-		int irq_idx);
+		unsigned int irq_idx);
 
 /**
  * dpu_core_irq_register_callback - For registering callback function on IRQ
@@ -52,7 +52,7 @@ u32 dpu_core_irq_read(
  */
 int dpu_core_irq_register_callback(
 		struct dpu_kms *dpu_kms,
-		int irq_idx,
+		unsigned int irq_idx,
 		void (*irq_cb)(void *arg),
 		void *irq_arg);
 
@@ -67,7 +67,7 @@ int dpu_core_irq_register_callback(
  */
 int dpu_core_irq_unregister_callback(
 		struct dpu_kms *dpu_kms,
-		int irq_idx);
+		unsigned int irq_idx);
 
 /**
  * dpu_debugfs_core_irq_init - register core irq debugfs
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 80b0dfd58226..149339db4533 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -351,7 +351,7 @@ static int dpu_encoder_helper_wait_event_timeout(int32_t drm_id,
 		u32 irq_idx, struct dpu_encoder_wait_info *info);
 
 int dpu_encoder_helper_wait_for_irq(struct dpu_encoder_phys *phys_enc,
-		int irq_idx,
+		unsigned int irq_idx,
 		void (*func)(void *arg),
 		struct dpu_encoder_wait_info *wait_info)
 {
@@ -1541,7 +1541,7 @@ void dpu_encoder_helper_trigger_start(struct dpu_encoder_phys *phys_enc)
 
 static int dpu_encoder_helper_wait_event_timeout(
 		int32_t drm_id,
-		u32 irq_idx,
+		unsigned int irq_idx,
 		struct dpu_encoder_wait_info *info)
 {
 	int rc = 0;
@@ -2545,8 +2545,6 @@ unsigned int dpu_encoder_helper_get_dsc(struct dpu_encoder_phys *phys_enc)
 void dpu_encoder_phys_init(struct dpu_encoder_phys *phys_enc,
 			  struct dpu_enc_phys_init_params *p)
 {
-	int i;
-
 	phys_enc->hw_mdptop = p->dpu_kms->hw_mdp;
 	phys_enc->hw_intf = p->hw_intf;
 	phys_enc->hw_wb = p->hw_wb;
@@ -2556,9 +2554,6 @@ void dpu_encoder_phys_init(struct dpu_encoder_phys *phys_enc,
 	phys_enc->enc_spinlock = p->enc_spinlock;
 	phys_enc->enable_state = DPU_ENC_DISABLED;
 
-	for (i = 0; i < ARRAY_SIZE(phys_enc->irq); i++)
-		phys_enc->irq[i] = -EINVAL;
-
 	atomic_set(&phys_enc->vblank_refcount, 0);
 	atomic_set(&phys_enc->pending_kickoff_cnt, 0);
 	atomic_set(&phys_enc->pending_ctlstart_cnt, 0);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index f91661a69888..6f04c3d56e77 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -193,7 +193,7 @@ struct dpu_encoder_phys {
 	atomic_t pending_ctlstart_cnt;
 	atomic_t pending_kickoff_cnt;
 	wait_queue_head_t pending_kickoff_wq;
-	int irq[INTR_IDX_MAX];
+	unsigned int irq[INTR_IDX_MAX];
 	bool has_intf_te;
 };
 
@@ -364,7 +364,7 @@ void dpu_encoder_helper_report_irq_timeout(struct dpu_encoder_phys *phys_enc,
  * @Return: 0 or -ERROR
  */
 int dpu_encoder_helper_wait_for_irq(struct dpu_encoder_phys *phys_enc,
-		int irq,
+		unsigned int irq,
 		void (*func)(void *arg),
 		struct dpu_encoder_wait_info *wait_info);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 6c9634209e9f..39a77777fa37 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -494,7 +494,7 @@ struct dpu_mdp_cfg {
  */
 struct dpu_ctl_cfg {
 	DPU_HW_BLK_INFO;
-	s32 intr_start;
+	unsigned int intr_start;
 };
 
 /**
@@ -557,8 +557,8 @@ struct dpu_dspp_cfg  {
 struct dpu_pingpong_cfg  {
 	DPU_HW_BLK_INFO;
 	u32 merge_3d;
-	s32 intr_done;
-	s32 intr_rdptr;
+	unsigned int intr_done;
+	unsigned int intr_rdptr;
 	const struct dpu_pingpong_sub_blks *sblk;
 };
 
@@ -605,9 +605,9 @@ struct dpu_intf_cfg  {
 	u32 type;   /* interface type*/
 	u32 controller_id;
 	u32 prog_fetch_lines_worst_case;
-	s32 intr_underrun;
-	s32 intr_vsync;
-	s32 intr_tear_rd_ptr;
+	unsigned int intr_underrun;
+	unsigned int intr_vsync;
+	unsigned int intr_tear_rd_ptr;
 };
 
 /**
@@ -626,7 +626,7 @@ struct dpu_wb_cfg {
 	u8 vbif_idx;
 	u32 maxlinewidth;
 	u32 xin_id;
-	s32 intr_wb_done;
+	unsigned int intr_wb_done;
 	const u32 *format_list;
 	u32 num_formats;
 	enum dpu_clk_ctrl_type clk_ctrl;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index f85558f257f3..90f2e661c2c8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -201,13 +201,13 @@ static const struct dpu_intr_reg dpu_intr_set_7xxx[] = {
 
 static inline bool dpu_core_irq_is_valid(int irq_idx)
 {
-	return irq_idx >= 0 && irq_idx < DPU_NUM_IRQS;
+	return irq_idx && irq_idx <= DPU_NUM_IRQS;
 }
 
 static inline struct dpu_hw_intr_entry *dpu_core_irq_get_entry(struct dpu_hw_intr *intr,
-							       int irq_idx)
+							       unsigned int irq_idx)
 {
-	return &intr->irq_tbl[irq_idx];
+	return &intr->irq_tbl[irq_idx - 1];
 }
 
 /**
@@ -215,7 +215,7 @@ static inline struct dpu_hw_intr_entry *dpu_core_irq_get_entry(struct dpu_hw_int
  * @dpu_kms:		Pointer to DPU's KMS structure
  * @irq_idx:		interrupt index
  */
-static void dpu_core_irq_callback_handler(struct dpu_kms *dpu_kms, int irq_idx)
+static void dpu_core_irq_callback_handler(struct dpu_kms *dpu_kms, unsigned int irq_idx)
 {
 	struct dpu_hw_intr_entry *irq_entry = dpu_core_irq_get_entry(dpu_kms->hw_intr, irq_idx);
 
@@ -238,7 +238,7 @@ irqreturn_t dpu_core_irq(struct msm_kms *kms)
 	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
 	struct dpu_hw_intr *intr = dpu_kms->hw_intr;
 	int reg_idx;
-	int irq_idx;
+	unsigned int irq_idx;
 	u32 irq_status;
 	u32 enable_mask;
 	int bit;
@@ -294,7 +294,8 @@ irqreturn_t dpu_core_irq(struct msm_kms *kms)
 	return IRQ_HANDLED;
 }
 
-static int dpu_hw_intr_enable_irq_locked(struct dpu_hw_intr *intr, int irq_idx)
+static int dpu_hw_intr_enable_irq_locked(struct dpu_hw_intr *intr,
+					 unsigned int irq_idx)
 {
 	int reg_idx;
 	const struct dpu_intr_reg *reg;
@@ -349,7 +350,8 @@ static int dpu_hw_intr_enable_irq_locked(struct dpu_hw_intr *intr, int irq_idx)
 	return 0;
 }
 
-static int dpu_hw_intr_disable_irq_locked(struct dpu_hw_intr *intr, int irq_idx)
+static int dpu_hw_intr_disable_irq_locked(struct dpu_hw_intr *intr,
+					  unsigned int irq_idx)
 {
 	int reg_idx;
 	const struct dpu_intr_reg *reg;
@@ -436,7 +438,8 @@ static void dpu_disable_all_irqs(struct dpu_kms *dpu_kms)
 	wmb();
 }
 
-u32 dpu_core_irq_read(struct dpu_kms *dpu_kms, int irq_idx)
+u32 dpu_core_irq_read(struct dpu_kms *dpu_kms,
+		      unsigned int irq_idx)
 {
 	struct dpu_hw_intr *intr = dpu_kms->hw_intr;
 	int reg_idx;
@@ -500,7 +503,7 @@ struct dpu_hw_intr *dpu_hw_intr_init(void __iomem *addr,
 
 		intr->irq_mask |= BIT(MDP_INTFn_INTR(intf->id));
 
-		if (intf->intr_tear_rd_ptr != -1)
+		if (intf->intr_tear_rd_ptr)
 			intr->irq_mask |= BIT(DPU_IRQ_REG(intf->intr_tear_rd_ptr));
 	}
 
@@ -514,9 +517,10 @@ void dpu_hw_intr_destroy(struct dpu_hw_intr *intr)
 	kfree(intr);
 }
 
-int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms, int irq_idx,
-		void (*irq_cb)(void *arg),
-		void *irq_arg)
+int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms,
+				   unsigned int irq_idx,
+				   void (*irq_cb)(void *arg),
+				   void *irq_arg)
 {
 	struct dpu_hw_intr_entry *irq_entry;
 	unsigned long irq_flags;
@@ -563,7 +567,8 @@ int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms, int irq_idx,
 	return 0;
 }
 
-int dpu_core_irq_unregister_callback(struct dpu_kms *dpu_kms, int irq_idx)
+int dpu_core_irq_unregister_callback(struct dpu_kms *dpu_kms,
+				     unsigned int irq_idx)
 {
 	struct dpu_hw_intr_entry *irq_entry;
 	unsigned long irq_flags;
@@ -606,7 +611,7 @@ static int dpu_debugfs_core_irq_show(struct seq_file *s, void *v)
 	int i, irq_count;
 	void *cb;
 
-	for (i = 0; i < DPU_NUM_IRQS; i++) {
+	for (i = 1; i <= DPU_NUM_IRQS; i++) {
 		spin_lock_irqsave(&dpu_kms->hw_intr->irq_lock, irq_flags);
 		irq_entry = dpu_core_irq_get_entry(dpu_kms->hw_intr, i);
 		irq_count = atomic_read(&irq_entry->count);
@@ -642,7 +647,7 @@ void dpu_core_irq_preinstall(struct msm_kms *kms)
 	dpu_disable_all_irqs(dpu_kms);
 	pm_runtime_put_sync(&dpu_kms->pdev->dev);
 
-	for (i = 0; i < DPU_NUM_IRQS; i++) {
+	for (i = 1; i <= DPU_NUM_IRQS; i++) {
 		irq_entry = dpu_core_irq_get_entry(dpu_kms->hw_intr, i);
 		atomic_set(&irq_entry->count, 0);
 	}
@@ -658,7 +663,7 @@ void dpu_core_irq_uninstall(struct msm_kms *kms)
 		return;
 
 	pm_runtime_get_sync(&dpu_kms->pdev->dev);
-	for (i = 0; i < DPU_NUM_IRQS; i++) {
+	for (i = 1; i <= DPU_NUM_IRQS; i++) {
 		irq_entry = dpu_core_irq_get_entry(dpu_kms->hw_intr, i);
 		if (irq_entry->cb)
 			DPU_ERROR("IRQ=[%d, %d] still enabled/registered\n",
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
index 9df5d6e737a1..53a21ebc57e8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
@@ -36,9 +36,9 @@ enum dpu_hw_intr_reg {
 
 #define MDP_INTFn_INTR(intf)	(MDP_INTF0_INTR + (intf - INTF_0))
 
-#define DPU_IRQ_IDX(reg_idx, offset)	(reg_idx * 32 + offset)
-#define DPU_IRQ_REG(irq_idx)	(irq_idx / 32)
-#define DPU_IRQ_BIT(irq_idx)	(irq_idx % 32)
+#define DPU_IRQ_IDX(reg_idx, offset)	(1 + reg_idx * 32 + offset)
+#define DPU_IRQ_REG(irq_idx)	((irq_idx - 1) / 32)
+#define DPU_IRQ_BIT(irq_idx)	((irq_idx - 1) % 32)
 
 #define DPU_NUM_IRQS		(MDP_INTR_MAX * 32)
 
-- 
2.39.2

