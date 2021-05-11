Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70FBE37A8D8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 May 2021 16:17:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231757AbhEKOS3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 May 2021 10:18:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231834AbhEKOSX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 May 2021 10:18:23 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA06CC06175F
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 May 2021 07:17:13 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id h4so28952552lfv.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 May 2021 07:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aOd7P4mBcttOVEf7HItejeiFqW+qHDzpMy6VXQImmCE=;
        b=ppwjVQYrg0L0189wNpdzqx/BAvIaAcaX28pMnEIzPrI7NmwDhBZaJmqZTGgJIlRiln
         gFv6afDICNq+V/oESi/sY7UBb2Ms1K6CRNfumsPGQ4o+25edL+KmcxAkJ27Vum92TPGJ
         M9Wk/S1YwhUS5EG/ai+jmuMPW4S2hTI07CKbIA3TQTBH/5Pr32FlyYC6Vn0GMkR9X9Y1
         cGtU7/eUCUY4OsZOdUMHYToT66cvPKu3e0kBba+hwu43aHNSWTAJcc16rw+LoW7jTnCF
         rdYp4oGh9Mc06w96HnzxkP7CR46R+Ehe5kUTEkTGMoxTVDDwZyosUhB0FvZJGnljsaBV
         M1RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aOd7P4mBcttOVEf7HItejeiFqW+qHDzpMy6VXQImmCE=;
        b=pgEBoPTJ+3Av/j0Ia3t9evsUPAhQppDSXZ7nUTtAP8VYsCGs9TcSRZH78an3IpfQbV
         7cDhOqSDvdQ0Hja9DKuLTt9xlDvuJ7My0g1Fz2prF+jFx4d+a1lywNCaLpkWpVOnF1k7
         sa9Igv5LY5aFGvmNfDVd9wgB/BoeiYC88MOpOncnVfKtQceL1tXbPXxOzlVH7CBtahpy
         L/FFC9ROecrVWFHrYaw51mYuTNzRx0NM+XuCfIEe/gZGw7uNG1UyNeMfQM1DQa/5owib
         r8XLcrf1unWP+CGrdAHTKUfq5a36dj5DXdgJ187tsOenZe7dNA6Vq/716H770k3dHldE
         mang==
X-Gm-Message-State: AOAM532lGM5ZFL9FsTrTawOaLLbc7zMbYdVnV+YVNXkMy9jhYrUQhUND
        Du2cgWDgBOZ5iLWf4aFnQLVUpA==
X-Google-Smtp-Source: ABdhPJy9rFK4wrge+Nx3BJKqqF3UmHbEvmzMeFTmbSoaQMr+/QAvzBiPxt8jHqYIe0qRnoLoXG2tyw==
X-Received: by 2002:a19:6b18:: with SMTP id d24mr20602230lfa.103.1620742632213;
        Tue, 11 May 2021 07:17:12 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id x41sm2631543lfa.236.2021.05.11.07.17.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 May 2021 07:17:11 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm/dpu: fix smart dma support
Date:   Tue, 11 May 2021 17:17:11 +0300
Message-Id: <20210511141711.635820-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Downstream driver uses dpu->caps->smart_dma_rev to update
sspp->cap->features with the bit corresponding to the supported SmartDMA
version. Upstream driver does not do this, resulting in SSPP subdriver
not enbaling setup_multirect callback. Make SSPP subdriver check global
smart_dma_rev to decide if setup_multirect should be enabled.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 10 +++++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 16 ++++++++++++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c    |  9 +++++----
 3 files changed, 22 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index b569030a0847..036334e3d99d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -157,7 +157,7 @@ static const struct dpu_caps sdm845_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.qseed_type = DPU_SSPP_SCALER_QSEED3,
-	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2,
+	.smart_dma_rev = DPU_SMART_DMA_V2,
 	.ubwc_version = DPU_HW_UBWC_VER_20,
 	.has_src_split = true,
 	.has_dim_layer = true,
@@ -173,7 +173,7 @@ static const struct dpu_caps sc7180_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0x9,
 	.qseed_type = DPU_SSPP_SCALER_QSEED4,
-	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2,
+	.smart_dma_rev = DPU_SMART_DMA_V2,
 	.ubwc_version = DPU_HW_UBWC_VER_20,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
@@ -185,7 +185,7 @@ static const struct dpu_caps sm8150_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.qseed_type = DPU_SSPP_SCALER_QSEED3,
-	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
+	.smart_dma_rev = DPU_SMART_DMA_V2, /* TODO: v2.5 */
 	.ubwc_version = DPU_HW_UBWC_VER_30,
 	.has_src_split = true,
 	.has_dim_layer = true,
@@ -201,7 +201,7 @@ static const struct dpu_caps sm8250_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.qseed_type = DPU_SSPP_SCALER_QSEED3LITE,
-	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
+	.smart_dma_rev = DPU_SMART_DMA_V2, /* TODO: v2.5 */
 	.ubwc_version = DPU_HW_UBWC_VER_40,
 	.has_src_split = true,
 	.has_dim_layer = true,
@@ -215,7 +215,7 @@ static const struct dpu_caps sc7280_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0x7,
 	.qseed_type = DPU_SSPP_SCALER_QSEED4,
-	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2,
+	.smart_dma_rev = DPU_SMART_DMA_V2,
 	.ubwc_version = DPU_HW_UBWC_VER_30,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 4dfd8a20ad5c..04ebccd92d4e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -70,6 +70,18 @@ enum {
 	DPU_HW_UBWC_VER_40 = 0x400,
 };
 
+/**
+ * SmartDMA support
+ * @DPU_SMART_DMA_UNSUPPORTED,   SmartDMA not support
+ * @DPU_SMART_DMA_V1,   SmartDMA 1.0 support
+ * @DPU_SMART_DMA_V2,   SmartDMA 2.0 support
+ */
+enum {
+	DPU_SMART_DMA_UNSUPPORTED,
+	DPU_SMART_DMA_V1,
+	DPU_SMART_DMA_V2,
+};
+
 /**
  * MDP TOP BLOCK features
  * @DPU_MDP_PANIC_PER_PIPE Panic configuration needs to be be done per pipe
@@ -104,8 +116,6 @@ enum {
  * @DPU_SSPP_QOS,            SSPP support QoS control, danger/safe/creq
  * @DPU_SSPP_QOS_8LVL,       SSPP support 8-level QoS control
  * @DPU_SSPP_EXCL_RECT,      SSPP supports exclusion rect
- * @DPU_SSPP_SMART_DMA_V1,   SmartDMA 1.0 support
- * @DPU_SSPP_SMART_DMA_V2,   SmartDMA 2.0 support
  * @DPU_SSPP_TS_PREFILL      Supports prefill with traffic shaper
  * @DPU_SSPP_TS_PREFILL_REC1 Supports prefill with traffic shaper multirec
  * @DPU_SSPP_CDP             Supports client driven prefetch
@@ -124,8 +134,6 @@ enum {
 	DPU_SSPP_QOS,
 	DPU_SSPP_QOS_8LVL,
 	DPU_SSPP_EXCL_RECT,
-	DPU_SSPP_SMART_DMA_V1,
-	DPU_SSPP_SMART_DMA_V2,
 	DPU_SSPP_TS_PREFILL,
 	DPU_SSPP_TS_PREFILL_REC1,
 	DPU_SSPP_CDP,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index 34d81aa16041..3ce4c5cd5d05 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -647,7 +647,8 @@ static void dpu_hw_sspp_setup_cdp(struct dpu_hw_pipe *ctx,
 }
 
 static void _setup_layer_ops(struct dpu_hw_pipe *c,
-		unsigned long features)
+		unsigned long features,
+		int smart_dma_rev)
 {
 	if (test_bit(DPU_SSPP_SRC, &features)) {
 		c->ops.setup_format = dpu_hw_sspp_setup_format;
@@ -668,8 +669,8 @@ static void _setup_layer_ops(struct dpu_hw_pipe *c,
 		test_bit(DPU_SSPP_CSC_10BIT, &features))
 		c->ops.setup_csc = dpu_hw_sspp_setup_csc;
 
-	if (test_bit(DPU_SSPP_SMART_DMA_V1, &c->cap->features) ||
-		test_bit(DPU_SSPP_SMART_DMA_V2, &c->cap->features))
+	if (smart_dma_rev == DPU_SMART_DMA_V1 ||
+	    smart_dma_rev == DPU_SMART_DMA_V2)
 		c->ops.setup_multirect = dpu_hw_sspp_setup_multirect;
 
 	if (test_bit(DPU_SSPP_SCALER_QSEED3, &features) ||
@@ -733,7 +734,7 @@ struct dpu_hw_pipe *dpu_hw_sspp_init(enum dpu_sspp idx,
 	hw_pipe->mdp = &catalog->mdp[0];
 	hw_pipe->idx = idx;
 	hw_pipe->cap = cfg;
-	_setup_layer_ops(hw_pipe, hw_pipe->cap->features);
+	_setup_layer_ops(hw_pipe, hw_pipe->cap->features, catalog->caps->smart_dma_rev);
 
 	dpu_hw_blk_init(&hw_pipe->base, DPU_HW_BLK_SSPP, idx, &dpu_hw_ops);
 
-- 
2.30.2

