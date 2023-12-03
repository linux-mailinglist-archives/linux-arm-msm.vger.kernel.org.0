Return-Path: <linux-arm-msm+bounces-3073-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D8FC6802004
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 01:27:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A973280FEA
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 00:27:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2E9463E;
	Sun,  3 Dec 2023 00:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S+NETxpd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86AB6107
	for <linux-arm-msm@vger.kernel.org>; Sat,  2 Dec 2023 16:27:47 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-50be3611794so1322423e87.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 Dec 2023 16:27:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701563266; x=1702168066; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ENcXyo3oZAHAuh9PGU9frNT54lZo45N4oHXWIm8z5V0=;
        b=S+NETxpd9n0HrFfm3sdoLEnJh4BgQD7p2W0VJKPnaa4qGvPlc9zKPtibDArklyuKde
         8jh44WmYtx4tVcuhn+/LM+xd94bMyxkZjMDHVX8XSHw2LYNZkxfOZI1HvhWRDHMDnlSP
         L6tqkVVX0I+4rlib/Uoq/qEEyzJh3cLN1OR83zCH91s9l0ILaLOioQraPyuqCKTo3DdU
         CiSw9PZVYYCHGXEe+X36+xR4N5mN1gT3ialGYXvKbTAYW7a3s1mk39unsZOHQECbrM8d
         JtDbZQ961zdw1ef/8dbUVI5LY3ISoU6S5kbkCXnOIdWkFXSO5JCyp1a/8Y9/4T/oeSlQ
         rfBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701563266; x=1702168066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ENcXyo3oZAHAuh9PGU9frNT54lZo45N4oHXWIm8z5V0=;
        b=BnnNo3gsZtS1p0Pa7zoS6+H9PA09m9OIkfDhz0N9tRnhjO1R5uQ9ted5sgOG0fvS9k
         8Q8++mfHdznOo1q4E/2tJcHl38D5Yi5S1zPIxXmzu0oQyIKKnzTb0bx9sQsAWa9o2VBm
         TFT3QYq7FPn/27kTHjVFZZSq9SeO8VUsyptrevBisaAGA6LYTW5ijUYkR8q/gPF+kJ9E
         ikw4T5yRRlp3XkNs2j1g1IgIHm9QbDQL1iP+8FWzQC7YBu6TMmcRTrBIyHEMeYyv+YUF
         SxPBYqBO8BPNP6Sgijd1s2d+MEgk7ZL9RIoptNeHtitzUjOlQolzcJ9ZpGvMC2RqiDp1
         473A==
X-Gm-Message-State: AOJu0Yz0fX7PtK6zJQPgx4hkCobfRaFBtBu8JNnfpGQxcNv/2nTqz0nC
	83CV8B3dQUAhziEi8jIDAlRP/Q==
X-Google-Smtp-Source: AGHT+IEXF+0Xwsi/ENxGTcfrA+aAzvE7wKsHOb3v0hlzBTqqJGcvX5fXchQklqrENzatQzSg2giZiA==
X-Received: by 2002:a05:6512:ac3:b0:50b:e229:23b0 with SMTP id n3-20020a0565120ac300b0050be22923b0mr1151799lfu.94.1701563265776;
        Sat, 02 Dec 2023 16:27:45 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id v13-20020a056512348d00b0050bca79a59bsm317231lfr.196.2023.12.02.16.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Dec 2023 16:27:45 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Marijn Suijten <marijn.suijten@somainline.org>
Cc: Stephen Boyd <swboyd@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH v2 1/3] drm/msm/dpu: enable writeback on SDM845
Date: Sun,  3 Dec 2023 03:27:41 +0300
Message-Id: <20231203002743.1291956-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231203002743.1291956-1-dmitry.baryshkov@linaro.org>
References: <20231203002743.1291956-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable WB2 hardware block, enabling writeback support on this platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h | 18 ++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c |  6 ++++--
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
index 38ac0c1a134b..d44e00fd898d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -34,6 +34,7 @@ static const struct dpu_mdp_cfg sdm845_mdp = {
 		[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
 		[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2bc, .bit_off = 8 },
 		[DPU_CLK_CTRL_DMA3] = { .reg_off = 0x2c4, .bit_off = 8 },
+		[DPU_CLK_CTRL_WB2] = { .reg_off = 0x2bc, .bit_off = 16 },
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
@@ -344,6 +360,8 @@ const struct dpu_mdss_cfg dpu_sdm845_cfg = {
 	.pingpong = sdm845_pp,
 	.dsc_count = ARRAY_SIZE(sdm845_dsc),
 	.dsc = sdm845_dsc,
+	.wb_count = ARRAY_SIZE(sdm845_wb),
+	.wb = sdm845_wb,
 	.intf_count = ARRAY_SIZE(sdm845_intf),
 	.intf = sdm845_intf,
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index a1aada630780..1b71fa3ebe73 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -105,14 +105,16 @@
 
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


