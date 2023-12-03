Return-Path: <linux-arm-msm+bounces-3076-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B654802013
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 01:32:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 266E51F20CA5
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 00:32:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 411B2658;
	Sun,  3 Dec 2023 00:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TnQLM9Bg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39544116
	for <linux-arm-msm@vger.kernel.org>; Sat,  2 Dec 2023 16:32:08 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-50bc2e7f1e4so4644390e87.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 Dec 2023 16:32:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701563526; x=1702168326; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0C9JIY3GCJCSUXtT2mszaRF/C74fxdUxFphdfFtUxjQ=;
        b=TnQLM9Bg6rNtIke6Z92newyioIoq2WXG8A/DAObpulx8GbvTAjZoQjS3nQKzE2wX/E
         4ESGOt67XLaABkWjoCbyWkN7otFcJ9tT7Zpd8Gp5MTJrctjwz8IpGNiWiJk5c7gfMY/1
         iCO7OH5+9diAs3PvpSArnkHgvAJ+AlXfULxRHLxgEvMv6orN45hbvIxJkMZDP8/H5WiJ
         CzzWZb3b+wTi4fH7LgCnYW1lPab9+G7335xQ4P7v4SMUsONauAWhKlzKVmu5jhz6dRPI
         VtEWEonRPrj32ADVVToj6tR+udhayLjl6boCrFcEf/s4uLgwi8cQQuoMH/8yhjR3lOGd
         63pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701563526; x=1702168326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0C9JIY3GCJCSUXtT2mszaRF/C74fxdUxFphdfFtUxjQ=;
        b=VARIJrHY/spHg8q12GoFKo6paVGNPtQtVVFmeLbJCGr2VB0RW3U+OpvdZzeHuvvjrf
         kSY0oW/MQYuxGuChZ9G57cJVTqjaCHHnORn7gb7pU2ZJhp/+YcTtXSGJwMW1dVHQnkHN
         M945kAxqvRMBP4mbzxS/CFwtPUItdw2+Q/1I5/SSjsCq2tyOU9eNSyhlo+TXWl1EYIzY
         WCYwwnbLEz0ebCOCii5edIhWDHZsO0MCJu9tyDbRq/oU3xd4DX+xzvSfm9fRgVnSPXBS
         lJfaJpLnNp/NUlgnUrRKRMiouLaGBB6cJ5orCOs77Yp3K3Db3v6hmqR9UpIxRacJZu7h
         VVKQ==
X-Gm-Message-State: AOJu0Yyvr4ZX3i0yGdg+jyuiFB2maxjO+7E3af1yUAHygJ2xMphdFmj5
	daRSIg5ScBbIkQ4jap4pYhzxtA==
X-Google-Smtp-Source: AGHT+IHZY5lfzqNBQ2sQQka0ULP8B/jhtDVtHjo4ZC3ymr6KOGt1SoLOCi/yWR+HkNAzq6rwseUwgw==
X-Received: by 2002:a05:6512:398e:b0:50b:e5a9:a467 with SMTP id j14-20020a056512398e00b0050be5a9a467mr939319lfu.88.1701563526621;
        Sat, 02 Dec 2023 16:32:06 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id i7-20020ac25b47000000b0050ba4a26fccsm422408lfp.117.2023.12.02.16.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Dec 2023 16:32:06 -0800 (PST)
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
Subject: [RFT PATCH v2 2/4] drm/msm/dpu: enable writeback on SC8108X
Date: Sun,  3 Dec 2023 03:32:01 +0300
Message-Id: <20231203003203.1293087-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231203003203.1293087-1-dmitry.baryshkov@linaro.org>
References: <20231203003203.1293087-1-dmitry.baryshkov@linaro.org>
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
 .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index 9ffc8804a6fc..d4b531752ec2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -34,6 +34,7 @@ static const struct dpu_mdp_cfg sc8180x_mdp = {
 		[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
 		[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2bc, .bit_off = 8 },
 		[DPU_CLK_CTRL_DMA3] = { .reg_off = 0x2c4, .bit_off = 8 },
+		[DPU_CLK_CTRL_WB2] = { .reg_off = 0x2bc, .bit_off = 16 },
 	},
 };
 
@@ -298,6 +299,21 @@ static const struct dpu_dsc_cfg sc8180x_dsc[] = {
 	},
 };
 
+static const struct dpu_wb_cfg sc8180x_wb[] = {
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
 static const struct dpu_intf_cfg sc8180x_intf[] = {
 	{
 		.name = "intf_0", .id = INTF_0,
@@ -411,6 +427,8 @@ const struct dpu_mdss_cfg dpu_sc8180x_cfg = {
 	.pingpong = sc8180x_pp,
 	.merge_3d_count = ARRAY_SIZE(sc8180x_merge_3d),
 	.merge_3d = sc8180x_merge_3d,
+	.wb_count = ARRAY_SIZE(sc8180x_wb),
+	.wb = sc8180x_wb,
 	.intf_count = ARRAY_SIZE(sc8180x_intf),
 	.intf = sc8180x_intf,
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
-- 
2.39.2


