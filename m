Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98E0066B786
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jan 2023 07:34:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231899AbjAPGeD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Jan 2023 01:34:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231964AbjAPGdc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Jan 2023 01:33:32 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE581E38A
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Jan 2023 22:33:19 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id cf42so41364750lfb.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Jan 2023 22:33:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qnc3VjmJt0l7uQ9FOV895mn3eK0O49EcwHK3zAPxAr8=;
        b=dGn2vcisff3ilMyiCeXZLDbmeNPTLVX0iS7dmmUZxNOwziDeA2nRxN1GdW70i56/Kq
         LK7LPCjoPT1+/vLEL/u2hDuanbgjvhVAZ88Bg2q5e1Ytz7FeA3zzTamoSfkb58SZ+ZIt
         58ODEGv6NPXrnnxjpj0upyIYew9K1RFNGiQqqXy3dP+EhrpfpS7OTE7FDqopo8NNpgUM
         4uVABampG8wn5YQVHUaLaS8TLF0LPKaFLQtzzSmiTAjxZ9LOrSw1UkhUXCg6bUUrvho5
         3UInh6A8RcbjUx8KdnJFUu+dRfHWvUl3sMXvmv/ilSz8Oi2M3UsPJnj0WFa7b1vl09MC
         t4GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qnc3VjmJt0l7uQ9FOV895mn3eK0O49EcwHK3zAPxAr8=;
        b=GL3D5fZYUT6/8fjUx15mke8sbaoAwwFUgTlKaGmnAz3HEyUA9DT5B1yaq2ix9L6P7L
         jxdCy4ciIj6stTLMD9MpAzf6O5MVuxLJEqfEK0IgStwGhfxKHMBoQeTa//2/p2rL/7AM
         wPHBRAJIRCxqp4YiTwhiPnMvctYvzrCdJ3pWpE1daMnP5aZ32haSf+fpAS4510E7awiI
         4KE8Hnux0lAgT6gO7XqVIAsNAqlE8Q7oer0hgImeRDHCqCT63JIaBEnELu73Mm9qnmOw
         C1ujJXdKDHR6oLUuyNQLnEdYbTa1bVjcLVVx4LDfwZMhfkURaPWYOqAZcEDeQWRBxxJk
         wtXQ==
X-Gm-Message-State: AFqh2korUl/oWX4wkxgBqvof/np6dyeEWNZFIBQM/rKNYZxHnFH5llnP
        CdS4Tv7vvZ5efiMgiXuwP0yoYA==
X-Google-Smtp-Source: AMrXdXtCxGKbGTQQf9OHoTemFIhDvqqAlBNy2pzYBJVciLCpjCjY6JRzwZTEO9GWA6IuPyQOj+LCzA==
X-Received: by 2002:ac2:5976:0:b0:4cc:84da:44bd with SMTP id h22-20020ac25976000000b004cc84da44bdmr7507689lfp.39.1673850798108;
        Sun, 15 Jan 2023 22:33:18 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id v2-20020a056512348200b004b572ad14b2sm4912304lfr.251.2023.01.15.22.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jan 2023 22:33:17 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 1/3] drm/msm/dpu: fix blend setup for DMA4 and DMA5 layers
Date:   Mon, 16 Jan 2023 08:33:14 +0200
Message-Id: <20230116063316.728496-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
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

SM8550 uses new register to map SSPP_DMA4 and SSPP_DMA5 units to blend
stages. Add proper support for this register to allow using these two
planes for image processing.

Fixes: efcd0107727c ("drm/msm/dpu: add support for SM8550")
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 15 +++++++++------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  2 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c    | 19 +++++++++++++++++++
 3 files changed, 30 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 835d6d2c4115..504a22c76412 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -67,6 +67,9 @@
 #define CTL_SC7280_MASK \
 	(BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_FETCH_ACTIVE) | BIT(DPU_CTL_VM_CFG))
 
+#define CTL_SM8550_MASK \
+	(CTL_SC7280_MASK | BIT(DPU_CTL_HAS_LAYER_EXT4))
+
 #define MERGE_3D_SM8150_MASK (0)
 
 #define DSPP_MSM8998_MASK BIT(DPU_DSPP_PCC) | BIT(DPU_DSPP_GC)
@@ -999,37 +1002,37 @@ static const struct dpu_ctl_cfg sm8550_ctl[] = {
 	{
 	.name = "ctl_0", .id = CTL_0,
 	.base = 0x15000, .len = 0x290,
-	.features = CTL_SC7280_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
+	.features = CTL_SM8550_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	},
 	{
 	.name = "ctl_1", .id = CTL_1,
 	.base = 0x16000, .len = 0x290,
-	.features = CTL_SC7280_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
+	.features = CTL_SM8550_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	},
 	{
 	.name = "ctl_2", .id = CTL_2,
 	.base = 0x17000, .len = 0x290,
-	.features = CTL_SC7280_MASK,
+	.features = CTL_SM8550_MASK,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	},
 	{
 	.name = "ctl_3", .id = CTL_3,
 	.base = 0x18000, .len = 0x290,
-	.features = CTL_SC7280_MASK,
+	.features = CTL_SM8550_MASK,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	},
 	{
 	.name = "ctl_4", .id = CTL_4,
 	.base = 0x19000, .len = 0x290,
-	.features = CTL_SC7280_MASK,
+	.features = CTL_SM8550_MASK,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
 	},
 	{
 	.name = "ctl_5", .id = CTL_5,
 	.base = 0x1a000, .len = 0x290,
-	.features = CTL_SC7280_MASK,
+	.features = CTL_SM8550_MASK,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index a1f18d53db6d..d152fef438f9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -199,6 +199,7 @@ enum {
  * @DPU_CTL_SPLIT_DISPLAY:	CTL supports video mode split display
  * @DPU_CTL_FETCH_ACTIVE:	Active CTL for fetch HW (SSPPs)
  * @DPU_CTL_VM_CFG:		CTL config to support multiple VMs
+ * @DPU_CTL_HAS_LAYER_EXT4:	CTL has the CTL_LAYER_EXT4 register
  * @DPU_CTL_MAX
  */
 enum {
@@ -206,6 +207,7 @@ enum {
 	DPU_CTL_ACTIVE_CFG,
 	DPU_CTL_FETCH_ACTIVE,
 	DPU_CTL_VM_CFG,
+	DPU_CTL_HAS_LAYER_EXT4,
 	DPU_CTL_MAX
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index a35ecb6676c8..f4fdf537616c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -17,6 +17,8 @@
 	(0x70 + (((lm) - LM_0) * 0x004))
 #define   CTL_LAYER_EXT3(lm)             \
 	(0xA0 + (((lm) - LM_0) * 0x004))
+#define CTL_LAYER_EXT4(lm)             \
+        (0xB8 + (((lm) - LM_0) * 0x004))
 #define   CTL_TOP                       0x014
 #define   CTL_FLUSH                     0x018
 #define   CTL_START                     0x01C
@@ -383,6 +385,7 @@ static void dpu_hw_ctl_setup_blendstage(struct dpu_hw_ctl *ctx,
 	struct dpu_hw_blk_reg_map *c = &ctx->hw;
 	u32 mixercfg = 0, mixercfg_ext = 0, mix, ext;
 	u32 mixercfg_ext2 = 0, mixercfg_ext3 = 0;
+	u32 mixercfg_ext4 = 0;
 	int i, j;
 	int stages;
 	int pipes_per_stage;
@@ -492,6 +495,20 @@ static void dpu_hw_ctl_setup_blendstage(struct dpu_hw_ctl *ctx,
 					mixercfg_ext2 |= mix << 4;
 				}
 				break;
+			case SSPP_DMA4:
+				if (rect_index == DPU_SSPP_RECT_1) {
+					mixercfg_ext4 |= ((i + 1) & 0xF) << 8;
+				} else {
+					mixercfg_ext4 |= ((i + 1) & 0xF) << 0;
+				}
+				break;
+			case SSPP_DMA5:
+				if (rect_index == DPU_SSPP_RECT_1) {
+					mixercfg_ext4 |= ((i + 1) & 0xF) << 12;
+				} else {
+					mixercfg_ext4 |= ((i + 1) & 0xF) << 4;
+				}
+				break;
 			case SSPP_CURSOR0:
 				mixercfg_ext |= ((i + 1) & 0xF) << 20;
 				break;
@@ -509,6 +526,8 @@ static void dpu_hw_ctl_setup_blendstage(struct dpu_hw_ctl *ctx,
 	DPU_REG_WRITE(c, CTL_LAYER_EXT(lm), mixercfg_ext);
 	DPU_REG_WRITE(c, CTL_LAYER_EXT2(lm), mixercfg_ext2);
 	DPU_REG_WRITE(c, CTL_LAYER_EXT3(lm), mixercfg_ext3);
+	if ((test_bit(DPU_CTL_HAS_LAYER_EXT4, &ctx->caps->features)))
+		DPU_REG_WRITE(c, CTL_LAYER_EXT4(lm), mixercfg_ext4);
 }
 
 
-- 
2.39.0

