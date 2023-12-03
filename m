Return-Path: <linux-arm-msm+bounces-3075-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D59802012
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 01:32:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B8CB280FEA
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 00:32:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3751646;
	Sun,  3 Dec 2023 00:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xu3yw9KJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90EED115
	for <linux-arm-msm@vger.kernel.org>; Sat,  2 Dec 2023 16:32:07 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-50be3eed85aso1368993e87.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 Dec 2023 16:32:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701563526; x=1702168326; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AjlZ6WQ4BOO03gr4n9ZYpinJkeVX9iUFc0IE12rIVWc=;
        b=xu3yw9KJo9HfH0I17Z+NJXtVv4H0DMeD1mQkP0QkmOKwUw+i6/Jft9bZIQWSdMmBcv
         FhjyPmgICanzx0JUAJS19ApHHzY/VRvOz6EAWb4GYSmW8S84KefOrItVaQCdtm1W/gJa
         /9+MbZT4ZlUEKu9vf43yU6zzkPcE60k81kPu9fXlxVSOe7/wXsy2DTfcGwv284wyxP16
         Lla7Y9bcelt87fk0NsjST5xFltSvGAkS5Bum5T4kIat4UsQtPKaX1c/RlorV0FrsQJIF
         63zNW5yShJw7x2gHTC+kKaBI29gLM7cNVG5VHTjXWCWqFImZseYOHdGekH0/MMFhq9uB
         BAVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701563526; x=1702168326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AjlZ6WQ4BOO03gr4n9ZYpinJkeVX9iUFc0IE12rIVWc=;
        b=Tbn5ghAahnBwsNNQhs7uFtOTRQF7TN/aH445SdZHMQhpBgj5CxhCGj1lB6URYenbmy
         qOpK4k6vwuoqWtUcbwaOJyMz1TKa+Dl5D2dzzD2zay5XJuRY3ic0cMY2wgYMZ8dSgoFl
         eqAe0WXz9orAsjRZ6uvfTIYq4psfMgjsIVild90NN0ccedgYO8ayOZ/OTegMc4FTdA7w
         P8qdbXCw/ccdMjI7O+MXrQJYjcmTyP01bz/K0Z/80hWiNDnDEmld4/poX6jay8HVhf4y
         7sAnbmJTTQ2Lq30fInTMvTYHjq9Hl1sfAHfVP3FIzRFJ9JCHRwCzoN/v0x4BQ4sVJQMT
         jW4g==
X-Gm-Message-State: AOJu0YwBz+Q8seyvpuroOWNSNYlhsOVLjNdtolGTAokdBCHgOITruND/
	0R4HZXJduZDHndH6l2iHQrXaag==
X-Google-Smtp-Source: AGHT+IEO96VwvP5rnAVCPO+mFh1U6q/eFqagFnB+Ak7L+DqphZJ3tV6+/mMGxGdl0c91k1iwnC+pkA==
X-Received: by 2002:ac2:5472:0:b0:50b:c164:8481 with SMTP id e18-20020ac25472000000b0050bc1648481mr1765696lfn.36.1701563525862;
        Sat, 02 Dec 2023 16:32:05 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id i7-20020ac25b47000000b0050ba4a26fccsm422408lfp.117.2023.12.02.16.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Dec 2023 16:32:05 -0800 (PST)
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
Subject: [RFT PATCH v2 1/4] drm/msm/dpu: enable writeback on SM8150
Date: Sun,  3 Dec 2023 03:32:00 +0300
Message-Id: <20231203003203.1293087-2-dmitry.baryshkov@linaro.org>
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
 .../drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index 9392ad2b4d3f..62deedb206b4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -34,6 +34,7 @@ static const struct dpu_mdp_cfg sm8150_mdp = {
 		[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
 		[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2bc, .bit_off = 8 },
 		[DPU_CLK_CTRL_DMA3] = { .reg_off = 0x2c4, .bit_off = 8 },
+		[DPU_CLK_CTRL_WB2] = { .reg_off = 0x2bc, .bit_off = 16 },
 	},
 };
 
@@ -291,6 +292,21 @@ static const struct dpu_dsc_cfg sm8150_dsc[] = {
 	},
 };
 
+static const struct dpu_wb_cfg sm8150_wb[] = {
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
 static const struct dpu_intf_cfg sm8150_intf[] = {
 	{
 		.name = "intf_0", .id = INTF_0,
@@ -385,6 +401,8 @@ const struct dpu_mdss_cfg dpu_sm8150_cfg = {
 	.pingpong = sm8150_pp,
 	.merge_3d_count = ARRAY_SIZE(sm8150_merge_3d),
 	.merge_3d = sm8150_merge_3d,
+	.wb_count = ARRAY_SIZE(sm8150_wb),
+	.wb = sm8150_wb,
 	.intf_count = ARRAY_SIZE(sm8150_intf),
 	.intf = sm8150_intf,
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
-- 
2.39.2


