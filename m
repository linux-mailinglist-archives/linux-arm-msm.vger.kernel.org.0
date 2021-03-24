Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D00E6347B87
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Mar 2021 16:02:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236399AbhCXPB3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Mar 2021 11:01:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236420AbhCXPBB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Mar 2021 11:01:01 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 198BCC061763
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Mar 2021 08:01:01 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id o10so32456951lfb.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Mar 2021 08:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=K+oEmbTI+ZjniTkaGXPzbMX+/sehusvnH9bTTAOnwik=;
        b=h3TsOptXkBV6pylgZf1iYu94H3nrLg1EwnaNNEn9LlAolu9IzdqonaCKrZyL11Gn4N
         oHvLrS4PHorXoD4nkVdZhJGWSVAOnFT/SLBFpdjUxWz6DSgsj9QXiByoje7C/1ulCkUM
         lN4o0qCZyrEky1Qfe/p+65IVZV79m5NOv25qPIdsJzXejeSQeX8YlHK8D+WaL6VykIeC
         PLSlhFrBN6nbEgbCFF8RrG93yw8wg53Y6UZqhD8T3qdJX99/HfHp68gtARw9ce3+mgxZ
         4SixgYMilY+/VyQ/Eod/obkuI5dMCvhOyonvrfnvgFHve1ZgttAdeykzA/S4bajScUK2
         N6Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=K+oEmbTI+ZjniTkaGXPzbMX+/sehusvnH9bTTAOnwik=;
        b=RxnGDWH6xb0dc/bIxv4VmMVplCncTwI6b3IW1XOyCYIkiUUKXk8s46dOaNaHcug3Uy
         4o0JJ4shKJvuWUe1kvCZLbrf+GRlouHCqC5G2n567C1zUtRRpcgAqwesQ+eei/X7wygb
         lpua73Am1ihlykoyxdjuOf4Czy/pR2UzByYpayd8r5JgvI7RmWHUzPGPJs9tAbKKXKik
         5x8fYDj3lZQ+dxvnJ1bA1n0FiCrxXB/iu7vZPXS284DTzjb4AOwASxnZWjAB1jcGvlNd
         2WQib3Q+heNUJLPdOYrF5pgCjKNFVLJsnXBq39IMxOZHVKLQzeuRw6ACrTsPl32JMwaq
         vmMw==
X-Gm-Message-State: AOAM533WerIwh2zRI9rP0o5tK68EveaGeJXioFiT7jBzfdWNk3h/W+he
        1YI+bU2c6f/gST/E0YzwWiEJnw==
X-Google-Smtp-Source: ABdhPJyHdvvAdtwxnzTedyfBeteO6j/xvWanyBm7xmdbrtMm3eiFqf7AGt26qzEdoqSXtqCjQLSkng==
X-Received: by 2002:a19:b81:: with SMTP id 123mr2193932lfl.553.1616598055149;
        Wed, 24 Mar 2021 08:00:55 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id p5sm252463lfe.154.2021.03.24.08.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 08:00:54 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 20/21] drm/msm/dpu: fix smart dma support
Date:   Wed, 24 Mar 2021 18:00:23 +0300
Message-Id: <20210324150024.2768215-21-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324150024.2768215-1-dmitry.baryshkov@linaro.org>
References: <20210324150024.2768215-1-dmitry.baryshkov@linaro.org>
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
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c |  8 ++++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 16 ++++++++++++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c    |  9 +++++----
 3 files changed, 21 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index f21f630af476..5552f45f818c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -145,7 +145,7 @@ static const struct dpu_caps sdm845_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.qseed_type = DPU_SSPP_SCALER_QSEED3,
-	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2,
+	.smart_dma_rev = DPU_SMART_DMA_V2,
 	.ubwc_version = DPU_HW_UBWC_VER_20,
 	.has_src_split = true,
 	.has_dim_layer = true,
@@ -161,7 +161,7 @@ static const struct dpu_caps sc7180_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0x9,
 	.qseed_type = DPU_SSPP_SCALER_QSEED4,
-	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2,
+	.smart_dma_rev = DPU_SMART_DMA_V2,
 	.ubwc_version = DPU_HW_UBWC_VER_20,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
@@ -173,7 +173,7 @@ static const struct dpu_caps sm8150_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.qseed_type = DPU_SSPP_SCALER_QSEED3,
-	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
+	.smart_dma_rev = DPU_SMART_DMA_V2, /* TODO: v2.5 */
 	.ubwc_version = DPU_HW_UBWC_VER_30,
 	.has_src_split = true,
 	.has_dim_layer = true,
@@ -189,7 +189,7 @@ static const struct dpu_caps sm8250_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.qseed_type = DPU_SSPP_SCALER_QSEED3LITE,
-	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
+	.smart_dma_rev = DPU_SMART_DMA_V2, /* TODO: v2.5 */
 	.ubwc_version = DPU_HW_UBWC_VER_40,
 	.has_src_split = true,
 	.has_dim_layer = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 08864f0addc4..1202a82918eb 100644
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
index 8734a47040aa..4165ff2d7a3c 100644
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
@@ -731,7 +732,7 @@ struct dpu_hw_pipe *dpu_hw_sspp_init(enum dpu_sspp idx,
 	hw_pipe->mdp = &catalog->mdp[0];
 	hw_pipe->idx = idx;
 	hw_pipe->cap = cfg;
-	_setup_layer_ops(hw_pipe, hw_pipe->cap->features);
+	_setup_layer_ops(hw_pipe, hw_pipe->cap->features, catalog->caps->smart_dma_rev);
 
 	dpu_hw_blk_init(&hw_pipe->base, DPU_HW_BLK_SSPP, idx);
 
-- 
2.30.2

