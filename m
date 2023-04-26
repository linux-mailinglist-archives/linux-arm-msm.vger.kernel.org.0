Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98E1E6EFD74
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Apr 2023 00:38:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239971AbjDZWh6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Apr 2023 18:37:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239385AbjDZWhg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Apr 2023 18:37:36 -0400
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [5.144.164.165])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DBA1A1;
        Wed, 26 Apr 2023 15:37:31 -0700 (PDT)
Received: from Marijn-Arch-PC.localdomain (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id E35662022C;
        Thu, 27 Apr 2023 00:37:29 +0200 (CEST)
From:   Marijn Suijten <marijn.suijten@somainline.org>
Date:   Thu, 27 Apr 2023 00:37:31 +0200
Subject: [PATCH v4 17/22] drm/msm/dpu: Factor out shared interrupt register
 in INTF_BLK macro
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230411-dpu-intf-te-v4-17-27ce1a5ab5c6@somainline.org>
References: <20230411-dpu-intf-te-v4-0-27ce1a5ab5c6@somainline.org>
In-Reply-To: <20230411-dpu-intf-te-v4-0-27ce1a5ab5c6@somainline.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Adam Skladowski <a39.skl@gmail.com>,
        Loic Poulain <loic.poulain@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Robert Foss <rfoss@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
X-Mailer: b4 0.12.2
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As the INTF block is going to attain more interrupts that don't share
the same MDP_SSPP_TOP0_INTR register, factor out the _reg argument for
the caller to construct the right interrupt index (register and bit
index) to not make the interrupt bit arguments depend on one of multiple
interrupt register indices.  This brings us more in line with how PP_BLK
specifies its interrupts and allows for better wrapping in the arrays.

Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h    | 16 +++++++---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h | 16 +++++++---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h | 16 +++++++---
 .../drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    | 24 +++++++++++----
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h | 16 +++++++---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h |  8 +++--
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h |  6 ++--
 .../drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h    |  6 ++--
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h | 16 +++++++---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h | 12 ++++++--
 .../drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   | 36 ++++++++++++++++------
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h | 16 +++++++---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h | 16 +++++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  6 ++--
 14 files changed, 155 insertions(+), 55 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
index 6906f8046b9e0..c0dd4776f539d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
@@ -134,10 +134,18 @@ static const struct dpu_dspp_cfg msm8998_dspp[] = {
 };
 
 static const struct dpu_intf_cfg msm8998_intf[] = {
-	INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, 0, 25, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
-	INTF_BLK("intf_1", INTF_1, 0x6a800, 0x280, INTF_DSI, 0, 25, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
-	INTF_BLK("intf_2", INTF_2, 0x6b000, 0x280, INTF_DSI, 1, 25, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
-	INTF_BLK("intf_3", INTF_3, 0x6b800, 0x280, INTF_HDMI, 0, 25, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
+	INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, 0, 25, INTF_SDM845_MASK,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
+	INTF_BLK("intf_1", INTF_1, 0x6a800, 0x280, INTF_DSI, 0, 25, INTF_SDM845_MASK,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27)),
+	INTF_BLK("intf_2", INTF_2, 0x6b000, 0x280, INTF_DSI, 1, 25, INTF_SDM845_MASK,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29)),
+	INTF_BLK("intf_3", INTF_3, 0x6b800, 0x280, INTF_HDMI, 0, 25, INTF_SDM845_MASK,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31)),
 };
 
 static const struct dpu_perf_cfg msm8998_perf_data = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
index 14ce397800d5b..b109757b06723 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -132,10 +132,18 @@ static const struct dpu_dsc_cfg sdm845_dsc[] = {
 };
 
 static const struct dpu_intf_cfg sdm845_intf[] = {
-	INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, 0, 24, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
-	INTF_BLK("intf_1", INTF_1, 0x6a800, 0x280, INTF_DSI, 0, 24, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
-	INTF_BLK("intf_2", INTF_2, 0x6b000, 0x280, INTF_DSI, 1, 24, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
-	INTF_BLK("intf_3", INTF_3, 0x6b800, 0x280, INTF_DP, 1, 24, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
+	INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, 0, 24, INTF_SDM845_MASK,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
+	INTF_BLK("intf_1", INTF_1, 0x6a800, 0x280, INTF_DSI, 0, 24, INTF_SDM845_MASK,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27)),
+	INTF_BLK("intf_2", INTF_2, 0x6b000, 0x280, INTF_DSI, 1, 24, INTF_SDM845_MASK,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29)),
+	INTF_BLK("intf_3", INTF_3, 0x6b800, 0x280, INTF_DP, 1, 24, INTF_SDM845_MASK,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31)),
 };
 
 static const struct dpu_perf_cfg sdm845_perf_data = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index 074ba54d420f4..e9c1c624ee950 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -162,10 +162,18 @@ static const struct dpu_dsc_cfg sm8150_dsc[] = {
 };
 
 static const struct dpu_intf_cfg sm8150_intf[] = {
-	INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
-	INTF_BLK("intf_1", INTF_1, 0x6a800, 0x2bc, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
-	INTF_BLK("intf_2", INTF_2, 0x6b000, 0x2bc, INTF_DSI, 1, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
-	INTF_BLK("intf_3", INTF_3, 0x6b800, 0x280, INTF_DP, 1, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
+	INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, 0, 24, INTF_SC7180_MASK,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
+	INTF_BLK("intf_1", INTF_1, 0x6a800, 0x2bc, INTF_DSI, 0, 24, INTF_SC7180_MASK,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27)),
+	INTF_BLK("intf_2", INTF_2, 0x6b000, 0x2bc, INTF_DSI, 1, 24, INTF_SC7180_MASK,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29)),
+	INTF_BLK("intf_3", INTF_3, 0x6b800, 0x280, INTF_DP, 1, 24, INTF_SC7180_MASK,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31)),
 };
 
 static const struct dpu_perf_cfg sm8150_perf_data = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index 0540d21810857..d096d90fd227b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -143,13 +143,25 @@ static const struct dpu_merge_3d_cfg sc8180x_merge_3d[] = {
 };
 
 static const struct dpu_intf_cfg sc8180x_intf[] = {
-	INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
-	INTF_BLK("intf_1", INTF_1, 0x6a800, 0x2bc, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
-	INTF_BLK("intf_2", INTF_2, 0x6b000, 0x2bc, INTF_DSI, 1, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
+	INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7180_MASK,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
+	INTF_BLK("intf_1", INTF_1, 0x6a800, 0x2bc, INTF_DSI, 0, 24, INTF_SC7180_MASK,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27)),
+	INTF_BLK("intf_2", INTF_2, 0x6b000, 0x2bc, INTF_DSI, 1, 24, INTF_SC7180_MASK,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29)),
 	/* INTF_3 is for MST, wired to INTF_DP 0 and 1, use dummy index until this is supported */
-	INTF_BLK("intf_3", INTF_3, 0x6b800, 0x280, INTF_DP, 999, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
-	INTF_BLK("intf_4", INTF_4, 0x6c000, 0x280, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 20, 21),
-	INTF_BLK("intf_5", INTF_5, 0x6c800, 0x280, INTF_DP, MSM_DP_CONTROLLER_2, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 22, 23),
+	INTF_BLK("intf_3", INTF_3, 0x6b800, 0x280, INTF_DP, 999, 24, INTF_SC7180_MASK,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31)),
+	INTF_BLK("intf_4", INTF_4, 0x6c000, 0x280, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7180_MASK,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 20),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 21)),
+	INTF_BLK("intf_5", INTF_5, 0x6c800, 0x280, INTF_DP, MSM_DP_CONTROLLER_2, 24, INTF_SC7180_MASK,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 22),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 23)),
 };
 
 static const struct dpu_perf_cfg sc8180x_perf_data = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index b3284de35b8fa..7cc82de95a1e9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -163,10 +163,18 @@ static const struct dpu_dsc_cfg sm8250_dsc[] = {
 };
 
 static const struct dpu_intf_cfg sm8250_intf[] = {
-	INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
-	INTF_BLK("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
-	INTF_BLK("intf_2", INTF_2, 0x6b000, 0x2c0, INTF_DSI, 1, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
-	INTF_BLK("intf_3", INTF_3, 0x6b800, 0x280, INTF_DP, 1, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
+	INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, 0, 24, INTF_SC7180_MASK,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
+	INTF_BLK("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, 0, 24, INTF_SC7180_MASK,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27)),
+	INTF_BLK("intf_2", INTF_2, 0x6b000, 0x2c0, INTF_DSI, 1, 24, INTF_SC7180_MASK,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29)),
+	INTF_BLK("intf_3", INTF_3, 0x6b800, 0x280, INTF_DP, 1, 24, INTF_SC7180_MASK,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31)),
 };
 
 static const struct dpu_wb_cfg sm8250_wb[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
index 03f546e05d095..de0894f7a594f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
@@ -85,8 +85,12 @@ static const struct dpu_pingpong_cfg sc7180_pp[] = {
 };
 
 static const struct dpu_intf_cfg sc7180_intf[] = {
-	INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
-	INTF_BLK("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
+	INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7180_MASK,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
+	INTF_BLK("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, 0, 24, INTF_SC7180_MASK,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27)),
 };
 
 static const struct dpu_wb_cfg sc7180_wb[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
index e15dc96f1286a..88a0d6119ad50 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
@@ -66,8 +66,10 @@ static const struct dpu_pingpong_cfg sm6115_pp[] = {
 };
 
 static const struct dpu_intf_cfg sm6115_intf[] = {
-	INTF_BLK("intf_0", INTF_0, 0x00000, 0x280, INTF_NONE, 0, 0, 0, 0, 0, 0),
-	INTF_BLK("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
+	INTF_BLK("intf_0", INTF_0, 0x00000, 0x280, INTF_NONE, 0, 0, 0, 0, 0),
+	INTF_BLK("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, 0, 24, INTF_SC7180_MASK,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27)),
 };
 
 static const struct dpu_perf_cfg sm6115_perf_data = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
index 2ff98ef6999fe..cd6f4048f286b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
@@ -63,8 +63,10 @@ static const struct dpu_pingpong_cfg qcm2290_pp[] = {
 };
 
 static const struct dpu_intf_cfg qcm2290_intf[] = {
-	INTF_BLK("intf_0", INTF_0, 0x00000, 0x280, INTF_NONE, 0, 0, 0, 0, 0, 0),
-	INTF_BLK("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
+	INTF_BLK("intf_0", INTF_0, 0x00000, 0x280, INTF_NONE, 0, 0, 0, 0, 0),
+	INTF_BLK("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, 0, 24, INTF_SC7180_MASK,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27)),
 };
 
 static const struct dpu_perf_cfg qcm2290_perf_data = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index 4f6a965bcd90b..5b5834fc02063 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -154,10 +154,18 @@ static const struct dpu_merge_3d_cfg sm8350_merge_3d[] = {
 };
 
 static const struct dpu_intf_cfg sm8350_intf[] = {
-	INTF_BLK("intf_0", INTF_0, 0x34000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
-	INTF_BLK("intf_1", INTF_1, 0x35000, 0x2c4, INTF_DSI, 0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
-	INTF_BLK("intf_2", INTF_2, 0x36000, 0x2c4, INTF_DSI, 1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
-	INTF_BLK("intf_3", INTF_3, 0x37000, 0x280, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
+	INTF_BLK("intf_0", INTF_0, 0x34000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
+	INTF_BLK("intf_1", INTF_1, 0x35000, 0x2c4, INTF_DSI, 0, 24, INTF_SC7280_MASK,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27)),
+	INTF_BLK("intf_2", INTF_2, 0x36000, 0x2c4, INTF_DSI, 1, 24, INTF_SC7280_MASK,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29)),
+	INTF_BLK("intf_3", INTF_3, 0x37000, 0x280, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31)),
 };
 
 static const struct dpu_perf_cfg sm8350_perf_data = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index 6b2c7eae71d99..2e04438a9cbc1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -94,9 +94,15 @@ static const struct dpu_pingpong_cfg sc7280_pp[] = {
 };
 
 static const struct dpu_intf_cfg sc7280_intf[] = {
-	INTF_BLK("intf_0", INTF_0, 0x34000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
-	INTF_BLK("intf_1", INTF_1, 0x35000, 0x2c4, INTF_DSI, 0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
-	INTF_BLK("intf_5", INTF_5, 0x39000, 0x280, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 22, 23),
+	INTF_BLK("intf_0", INTF_0, 0x34000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
+	INTF_BLK("intf_1", INTF_1, 0x35000, 0x2c4, INTF_DSI, 0, 24, INTF_SC7280_MASK,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27)),
+	INTF_BLK("intf_5", INTF_5, 0x39000, 0x280, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 22),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 23)),
 };
 
 static const struct dpu_perf_cfg sc7280_perf_data = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index 706d0f13b598e..e9841a278b8cf 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -143,15 +143,33 @@ static const struct dpu_merge_3d_cfg sc8280xp_merge_3d[] = {
 
 /* TODO: INTF 3, 8 and 7 are used for MST, marked as INTF_NONE for now */
 static const struct dpu_intf_cfg sc8280xp_intf[] = {
-	INTF_BLK("intf_0", INTF_0, 0x34000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
-	INTF_BLK("intf_1", INTF_1, 0x35000, 0x300, INTF_DSI, 0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
-	INTF_BLK("intf_2", INTF_2, 0x36000, 0x300, INTF_DSI, 1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
-	INTF_BLK("intf_3", INTF_3, 0x37000, 0x280, INTF_NONE, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
-	INTF_BLK("intf_4", INTF_4, 0x38000, 0x280, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 20, 21),
-	INTF_BLK("intf_5", INTF_5, 0x39000, 0x280, INTF_DP, MSM_DP_CONTROLLER_3, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 22, 23),
-	INTF_BLK("intf_6", INTF_6, 0x3a000, 0x280, INTF_DP, MSM_DP_CONTROLLER_2, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 16, 17),
-	INTF_BLK("intf_7", INTF_7, 0x3b000, 0x280, INTF_NONE, MSM_DP_CONTROLLER_2, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 18, 19),
-	INTF_BLK("intf_8", INTF_8, 0x3c000, 0x280, INTF_NONE, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 12, 13),
+	INTF_BLK("intf_0", INTF_0, 0x34000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
+	INTF_BLK("intf_1", INTF_1, 0x35000, 0x300, INTF_DSI, 0, 24, INTF_SC7280_MASK,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27)),
+	INTF_BLK("intf_2", INTF_2, 0x36000, 0x300, INTF_DSI, 1, 24, INTF_SC7280_MASK,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29)),
+	INTF_BLK("intf_3", INTF_3, 0x37000, 0x280, INTF_NONE, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31)),
+	INTF_BLK("intf_4", INTF_4, 0x38000, 0x280, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 20),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 21)),
+	INTF_BLK("intf_5", INTF_5, 0x39000, 0x280, INTF_DP, MSM_DP_CONTROLLER_3, 24, INTF_SC7280_MASK,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 22),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 23)),
+	INTF_BLK("intf_6", INTF_6, 0x3a000, 0x280, INTF_DP, MSM_DP_CONTROLLER_2, 24, INTF_SC7280_MASK,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 16),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 17)),
+	INTF_BLK("intf_7", INTF_7, 0x3b000, 0x280, INTF_NONE, MSM_DP_CONTROLLER_2, 24, INTF_SC7280_MASK,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 18),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 19)),
+	INTF_BLK("intf_8", INTF_8, 0x3c000, 0x280, INTF_NONE, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13)),
 };
 
 static const struct dpu_perf_cfg sc8280xp_perf_data = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index 4ecb3df5cbc02..8a21b4946e2ef 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -162,10 +162,18 @@ static const struct dpu_merge_3d_cfg sm8450_merge_3d[] = {
 };
 
 static const struct dpu_intf_cfg sm8450_intf[] = {
-	INTF_BLK("intf_0", INTF_0, 0x34000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
-	INTF_BLK("intf_1", INTF_1, 0x35000, 0x300, INTF_DSI, 0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
-	INTF_BLK("intf_2", INTF_2, 0x36000, 0x300, INTF_DSI, 1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
-	INTF_BLK("intf_3", INTF_3, 0x37000, 0x280, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
+	INTF_BLK("intf_0", INTF_0, 0x34000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
+	INTF_BLK("intf_1", INTF_1, 0x35000, 0x300, INTF_DSI, 0, 24, INTF_SC7280_MASK,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27)),
+	INTF_BLK("intf_2", INTF_2, 0x36000, 0x300, INTF_DSI, 1, 24, INTF_SC7280_MASK,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29)),
+	INTF_BLK("intf_3", INTF_3, 0x37000, 0x280, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31)),
 };
 
 static const struct dpu_perf_cfg sm8450_perf_data = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index d0ab351b6a8b9..55c72419964d1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -166,11 +166,19 @@ static const struct dpu_merge_3d_cfg sm8550_merge_3d[] = {
 };
 
 static const struct dpu_intf_cfg sm8550_intf[] = {
-	INTF_BLK("intf_0", INTF_0, 0x34000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
+	INTF_BLK("intf_0", INTF_0, 0x34000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
 	/* TODO TE sub-blocks for intf1 & intf2 */
-	INTF_BLK("intf_1", INTF_1, 0x35000, 0x300, INTF_DSI, 0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
-	INTF_BLK("intf_2", INTF_2, 0x36000, 0x300, INTF_DSI, 1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
-	INTF_BLK("intf_3", INTF_3, 0x37000, 0x280, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
+	INTF_BLK("intf_1", INTF_1, 0x35000, 0x300, INTF_DSI, 0, 24, INTF_SC7280_MASK,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27)),
+	INTF_BLK("intf_2", INTF_2, 0x36000, 0x300, INTF_DSI, 1, 24, INTF_SC7280_MASK,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29)),
+	INTF_BLK("intf_3", INTF_3, 0x37000, 0x280, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31)),
 };
 
 static const struct dpu_perf_cfg sm8550_perf_data = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 23a78c38ec777..49244eb05a176 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -540,7 +540,7 @@ static const struct dpu_pingpong_sub_blks sc7280_pp_sblk = {
 /*************************************************************
  * INTF sub blocks config
  *************************************************************/
-#define INTF_BLK(_name, _id, _base, _len, _type, _ctrl_id, _progfetch, _features, _reg, _underrun_bit, _vsync_bit) \
+#define INTF_BLK(_name, _id, _base, _len, _type, _ctrl_id, _progfetch, _features, _underrun, _vsync) \
 	{\
 	.name = _name, .id = _id, \
 	.base = _base, .len = _len, \
@@ -548,8 +548,8 @@ static const struct dpu_pingpong_sub_blks sc7280_pp_sblk = {
 	.type = _type, \
 	.controller_id = _ctrl_id, \
 	.prog_fetch_lines_worst_case = _progfetch, \
-	.intr_underrun = DPU_IRQ_IDX(_reg, _underrun_bit), \
-	.intr_vsync = DPU_IRQ_IDX(_reg, _vsync_bit), \
+	.intr_underrun = _underrun, \
+	.intr_vsync = _vsync, \
 	}
 
 /*************************************************************

-- 
2.40.1

