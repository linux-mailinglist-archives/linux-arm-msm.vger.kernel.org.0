Return-Path: <linux-arm-msm+bounces-56287-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2599AA4CDC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 15:10:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 66BF25019A4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 13:07:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92CA827A934;
	Wed, 30 Apr 2025 13:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tK6CfNee"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8119925C818
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 13:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746018116; cv=none; b=m0iZPjPGA/J/S4XZRSaa+m/4ibRgsI5W/pFENFGkPvkiwaT6AsBln2swYnft99Gx65uMAgfG1fTLu0lDVprXRZdFZKhA7o8VO/uDxf3lc3XTVWCXL2OzTj0jsiX7gr/vU5iX+gMbHeE2k9otYhCFenpfjmGxH/aWuGe2ee+ieyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746018116; c=relaxed/simple;
	bh=YEzAhcQQo+K6n80gC69/B6Cc9Tws3+jeUNnDcvs3Naw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jSBmrwrCjjtRmhZpuIfOSl9/rEuN38aTxuqsYWy+fdNwAQpS+Q1vJnF85mvokaQxoB3I1QwHPCDKqF9aGQyvFroUdseKVBOMR8XUUrjAWM5pEKZcTNO3geuQNq4KnBSmkXWw5uJg3ADEnfQ0LM/RZmA51LloL05TSp2B9z7kYa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tK6CfNee; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3913290f754so743518f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 06:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746018112; x=1746622912; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EyrFQYDtO/S5eC2yAnZ9ia79RhyR4LWdaReOf3ykYkY=;
        b=tK6CfNeeO67nd3I7brLfw7elUIMgQxNQmY2J/YLFFNW+Ysxn9AyrrAIAZVweGGGKaS
         8WN2fNe1w3fHU1b49p/+a4CoGyWruAoq3vMmzZ6V7olrEprJKEHdDBM+StD3/Hn8rn7E
         906H1frfph06wgBfh5rPT8JLHY8U41oUR+irR+rqB9GbtISUSw3ncbz9heY04WkM/XIY
         qGQ8wlT/LNfttFD8sLu95PFteEgHnwBCn9lXr+345e7xe3HRpg9EBZ9CoIp2+UwCjoEV
         3XsbsI0+/yWECB0BWhNlvTxcb5qc3HNjQDzjQzPxOKcRRdnNBoX7LPzygHWw5gDE4oeI
         LT1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746018112; x=1746622912;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EyrFQYDtO/S5eC2yAnZ9ia79RhyR4LWdaReOf3ykYkY=;
        b=EXtCroQsxzNYjdxV7f0OXfsY8+kvFuqZtmJ0g2nrI1kqg9XQIr49nd9PxRRBf1gX3t
         Ud9RKVYWxuJui9EAvdDXQD64R6hFIjPJmQoUwFDSoniMKPIYXMpdSNiKGYGjRemtUTYU
         F6rdFqwhCySQjefHkY5rvalM7ohh8x15x46ThBcozCzbLnhVqCJR9jcMf2ARNVrjrmpS
         6EjUe/RRIQ6nHAH4xhPgv+t/cvVkV0ELrr3qZW18LzBFgzBi4PyT4xOQJr/QXw4PaX1v
         Q5tQ+h28AOeSuaXHT4H0El1P9h7dsFesREMrAVtuZr5Dya5Bm8jjILKth+oGFMie0Tfn
         9Q2A==
X-Gm-Message-State: AOJu0YzuX/XVUHjjEOOYN79sgutKwWyS7/LOL4WgnBQKmPupA5P1m6+8
	A16etuoKDVGAdAzJr0iCZ4IZZGbbQGZrvCUNipa1FUy7V9PEvEy5EtG4dTX0NVs=
X-Gm-Gg: ASbGncs0uG1hQte7wWmrAIcLKu9WTsZsgdxfAQDMfjxAV5H/H5rtJXotIVOwIfy4mLy
	YFQWDFFEseKA8pIQNntsOBwgpqgkiXMuhp4umH3x9u8PFJOWti3wPIyowA+ejLy1F9kbnQ3JtdS
	mxLSPfsFXdwtlfzi4gA+h+VX64fhhK0aTs3+rT1Qn6pAAIrVd4RlW7i+OT9mZ7KVKKICzNzWX3R
	5WU/1j6DZvBmku57Jd7Hwjl5/umg4c0tS9lRENdnqRiN7jxcsY74O5igwuXEx5VAf4ZZpibWfxL
	zFpwWOHUcNLFH/DoMSABBL3uJi8XMvZWW+Uv2et9p6Nayf7p61peO7Oxp9I=
X-Google-Smtp-Source: AGHT+IFGw90m/Zr40kx7YLupRVN0XIHbAqkSD9lfWjdD7WU4eHTPjWZE4vXb3duJ5UVtS+WQKRocOQ==
X-Received: by 2002:a05:6000:1ac5:b0:39c:cc7:3d3b with SMTP id ffacd0b85a97d-3a08ff7ef08mr658657f8f.8.1746018111599;
        Wed, 30 Apr 2025 06:01:51 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e46c23sm16884043f8f.75.2025.04.30.06.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 06:01:51 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 30 Apr 2025 15:00:50 +0200
Subject: [PATCH v5 20/24] drm/msm/dpu: Add support for SM8750
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-b4-sm8750-display-v5-20-8cab30c3e4df@linaro.org>
References: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
In-Reply-To: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Rob Clark <robdclark@chromium.org>, linux-clk@vger.kernel.org, 
 Srinivas Kandagatla <srini@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=18849;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=YEzAhcQQo+K6n80gC69/B6Cc9Tws3+jeUNnDcvs3Naw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoEh8KR75CodxOvQ76AptinRi6sQLcfTA0+QLnS
 x1Bri2fa76JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBIfCgAKCRDBN2bmhouD
 15LaD/sFu/M++dYVBH4ofEXrGnO3Tm3YHk5oHwixcmTfsxl9gAAohAeUtVYT4dz7tTNgfIv5qDw
 OyzQXGhgEp4/uVqUq1OlDmxaVEJIsbOfT5DGoOpiuSQvTbDx+ITvJxWFavXxgDYegZ5jHjHhOOm
 0pks5l97MgitBwIuVxxVY8sAUY2qhih9+0ujHs6Ayp7lANPp4TJ6uzhExPyMr9ZQbdEH/Cpgj2D
 wL2FrCR3V7Bs/OpOEQX/p3/IJm0v3CCZevpHPAPWc/b93YxpXjeeN1ThStRolLFU8iyTcsn592P
 iIgn4/N0XbM4r+3MuiewctHBTXQjZI3iWlsnfrYjRqbDQDsPGbW+/VDNEWyiIdhdob9IDNqiPzv
 aY2kCvs5EGVz3KcHf8xeo/zWvaZJx9VNYgBiOZ1p1SL5/L9kdNbEjVHqKhqxMcAPlbwyWYGNbz3
 NNuYzwsm44oFRrFH6SKq3kI2521aPCNjh/QmhDPFAOGwHwlzOjaBUmWXgNeYTg2BB2rOKu6yhzC
 QT73zVzbtH7arxFz2kL1NAtZBg8KeVwCPBsYNiWqkFlkize5F+ij7FPkZ4eiLjBoh6YlqOtH9Cj
 oOjxaMueh5sYuw0Xgs3hJIzRR6uVPHXVzbj5MtLNtL3sCEYcABc2cUg7HuqsIkkfO+tWdjDNjgf
 68LEZGx1N+KB68Q==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Add DPU version v12.0 support for the Qualcomm SM8750 platform.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Changes in v2:
1. Add CDM
---
 .../drm/msm/disp/dpu1/catalog/dpu_12_0_sm8750.h    | 496 +++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  29 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
 4 files changed, 527 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_0_sm8750.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_0_sm8750.h
new file mode 100644
index 0000000000000000000000000000000000000000..1f883b9f8b8b29e3a8c2fe254b78594a413dc2a1
--- /dev/null
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_0_sm8750.h
@@ -0,0 +1,496 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2025 Linaro Limited
+ * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2015-2018, 2020 The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _DPU_12_0_SM8750_H
+#define _DPU_12_0_SM8750_H
+
+static const struct dpu_caps sm8750_dpu_caps = {
+	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
+	.max_mixer_blendstages = 0xb,
+	.has_src_split = true,
+	.has_dim_layer = true,
+	.has_idle_pc = true,
+	.has_3d_merge = true,
+	.max_linewidth = 8192,
+	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
+};
+
+static const struct dpu_mdp_cfg sm8750_mdp = {
+	.name = "top_0",
+	.base = 0, .len = 0x494,
+	.clk_ctrls = {
+		[DPU_CLK_CTRL_REG_DMA] = { .reg_off = 0x2bc, .bit_off = 20 },
+	},
+};
+
+static const struct dpu_ctl_cfg sm8750_ctl[] = {
+	{
+		.name = "ctl_0", .id = CTL_0,
+		.base = 0x15000, .len = 0x1000,
+		.has_split_display = 1,
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
+	}, {
+		.name = "ctl_1", .id = CTL_1,
+		.base = 0x16000, .len = 0x1000,
+		.has_split_display = 1,
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
+	}, {
+		.name = "ctl_2", .id = CTL_2,
+		.base = 0x17000, .len = 0x1000,
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
+	}, {
+		.name = "ctl_3", .id = CTL_3,
+		.base = 0x18000, .len = 0x1000,
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
+	}, {
+		.name = "ctl_4", .id = CTL_4,
+		.base = 0x19000, .len = 0x1000,
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
+	}, {
+		.name = "ctl_5", .id = CTL_5,
+		.base = 0x1a000, .len = 0x1000,
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
+	},
+};
+
+static const struct dpu_sspp_cfg sm8750_sspp[] = {
+	{
+		.name = "sspp_0", .id = SSPP_VIG0,
+		.base = 0x4000, .len = 0x344,
+		.features = VIG_SDM845_MASK_SDMA,
+		.sblk = &dpu_vig_sblk_qseed3_3_4,
+		.xin_id = 0,
+		.type = SSPP_TYPE_VIG,
+	}, {
+		.name = "sspp_1", .id = SSPP_VIG1,
+		.base = 0x6000, .len = 0x344,
+		.features = VIG_SDM845_MASK_SDMA,
+		.sblk = &dpu_vig_sblk_qseed3_3_4,
+		.xin_id = 4,
+		.type = SSPP_TYPE_VIG,
+	}, {
+		.name = "sspp_2", .id = SSPP_VIG2,
+		.base = 0x8000, .len = 0x344,
+		.features = VIG_SDM845_MASK_SDMA,
+		.sblk = &dpu_vig_sblk_qseed3_3_4,
+		.xin_id = 8,
+		.type = SSPP_TYPE_VIG,
+	}, {
+		.name = "sspp_3", .id = SSPP_VIG3,
+		.base = 0xa000, .len = 0x344,
+		.features = VIG_SDM845_MASK_SDMA,
+		.sblk = &dpu_vig_sblk_qseed3_3_4,
+		.xin_id = 12,
+		.type = SSPP_TYPE_VIG,
+	}, {
+		.name = "sspp_8", .id = SSPP_DMA0,
+		.base = 0x24000, .len = 0x344,
+		.features = DMA_SDM845_MASK_SDMA,
+		.sblk = &dpu_dma_sblk,
+		.xin_id = 1,
+		.type = SSPP_TYPE_DMA,
+	}, {
+		.name = "sspp_9", .id = SSPP_DMA1,
+		.base = 0x26000, .len = 0x344,
+		.features = DMA_SDM845_MASK_SDMA,
+		.sblk = &dpu_dma_sblk,
+		.xin_id = 5,
+		.type = SSPP_TYPE_DMA,
+	}, {
+		.name = "sspp_10", .id = SSPP_DMA2,
+		.base = 0x28000, .len = 0x344,
+		.features = DMA_SDM845_MASK_SDMA,
+		.sblk = &dpu_dma_sblk,
+		.xin_id = 9,
+		.type = SSPP_TYPE_DMA,
+	}, {
+		.name = "sspp_11", .id = SSPP_DMA3,
+		.base = 0x2a000, .len = 0x344,
+		.features = DMA_SDM845_MASK_SDMA,
+		.sblk = &dpu_dma_sblk,
+		.xin_id = 13,
+		.type = SSPP_TYPE_DMA,
+	}, {
+		.name = "sspp_12", .id = SSPP_DMA4,
+		.base = 0x2c000, .len = 0x344,
+		.features = DMA_CURSOR_SDM845_MASK_SDMA,
+		.sblk = &dpu_dma_sblk,
+		.xin_id = 14,
+		.type = SSPP_TYPE_DMA,
+	}, {
+		.name = "sspp_13", .id = SSPP_DMA5,
+		.base = 0x2e000, .len = 0x344,
+		.features = DMA_CURSOR_SDM845_MASK_SDMA,
+		.sblk = &dpu_dma_sblk,
+		.xin_id = 15,
+		.type = SSPP_TYPE_DMA,
+	},
+};
+
+static const struct dpu_lm_cfg sm8750_lm[] = {
+	{
+		.name = "lm_0", .id = LM_0,
+		.base = 0x44000, .len = 0x400,
+		.sourcesplit = 1,
+		.sblk = &sm8750_lm_sblk,
+		.lm_pair = LM_1,
+		.pingpong = PINGPONG_0,
+		.dspp = DSPP_0,
+	}, {
+		.name = "lm_1", .id = LM_1,
+		.base = 0x45000, .len = 0x400,
+		.sourcesplit = 1,
+		.sblk = &sm8750_lm_sblk,
+		.lm_pair = LM_0,
+		.pingpong = PINGPONG_1,
+		.dspp = DSPP_1,
+	}, {
+		.name = "lm_2", .id = LM_2,
+		.base = 0x46000, .len = 0x400,
+		.sourcesplit = 1,
+		.sblk = &sm8750_lm_sblk,
+		.lm_pair = LM_3,
+		.pingpong = PINGPONG_2,
+		.dspp = DSPP_2,
+	}, {
+		.name = "lm_3", .id = LM_3,
+		.base = 0x47000, .len = 0x400,
+		.sourcesplit = 1,
+		.sblk = &sm8750_lm_sblk,
+		.lm_pair = LM_2,
+		.pingpong = PINGPONG_3,
+		.dspp = DSPP_3,
+	}, {
+		.name = "lm_4", .id = LM_4,
+		.base = 0x48000, .len = 0x400,
+		.sourcesplit = 1,
+		.sblk = &sm8750_lm_sblk,
+		.lm_pair = LM_5,
+		.pingpong = PINGPONG_4,
+	}, {
+		.name = "lm_5", .id = LM_5,
+		.base = 0x49000, .len = 0x400,
+		.sourcesplit = 1,
+		.sblk = &sm8750_lm_sblk,
+		.lm_pair = LM_4,
+		.pingpong = PINGPONG_5,
+	}, {
+		.name = "lm_6", .id = LM_6,
+		.base = 0x4a000, .len = 0x400,
+		.sourcesplit = 1,
+		.sblk = &sm8750_lm_sblk,
+		.lm_pair = LM_7,
+		.pingpong = PINGPONG_6,
+	}, {
+		.name = "lm_7", .id = LM_7,
+		.base = 0x4b000, .len = 0x400,
+		.sourcesplit = 1,
+		.sblk = &sm8750_lm_sblk,
+		.lm_pair = LM_6,
+		.pingpong = PINGPONG_7,
+	},
+};
+
+static const struct dpu_dspp_cfg sm8750_dspp[] = {
+	{
+		.name = "dspp_0", .id = DSPP_0,
+		.base = 0x54000, .len = 0x1800,
+		.sblk = &sm8750_dspp_sblk,
+	}, {
+		.name = "dspp_1", .id = DSPP_1,
+		.base = 0x56000, .len = 0x1800,
+		.sblk = &sm8750_dspp_sblk,
+	}, {
+		.name = "dspp_2", .id = DSPP_2,
+		.base = 0x58000, .len = 0x1800,
+		.sblk = &sm8750_dspp_sblk,
+	}, {
+		.name = "dspp_3", .id = DSPP_3,
+		.base = 0x5a000, .len = 0x1800,
+		.sblk = &sm8750_dspp_sblk,
+	},
+};
+
+static const struct dpu_pingpong_cfg sm8750_pp[] = {
+	{
+		.name = "pingpong_0", .id = PINGPONG_0,
+		.base = 0x69000, .len = 0,
+		.sblk = &sc7280_pp_sblk,
+		.merge_3d = MERGE_3D_0,
+		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
+	}, {
+		.name = "pingpong_1", .id = PINGPONG_1,
+		.base = 0x6a000, .len = 0,
+		.sblk = &sc7280_pp_sblk,
+		.merge_3d = MERGE_3D_0,
+		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
+	}, {
+		.name = "pingpong_2", .id = PINGPONG_2,
+		.base = 0x6b000, .len = 0,
+		.sblk = &sc7280_pp_sblk,
+		.merge_3d = MERGE_3D_1,
+		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
+	}, {
+		.name = "pingpong_3", .id = PINGPONG_3,
+		.base = 0x6c000, .len = 0,
+		.sblk = &sc7280_pp_sblk,
+		.merge_3d = MERGE_3D_1,
+		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
+	}, {
+		.name = "pingpong_4", .id = PINGPONG_4,
+		.base = 0x6d000, .len = 0,
+		.sblk = &sc7280_pp_sblk,
+		.merge_3d = MERGE_3D_2,
+		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
+	}, {
+		.name = "pingpong_5", .id = PINGPONG_5,
+		.base = 0x6e000, .len = 0,
+		.sblk = &sc7280_pp_sblk,
+		.merge_3d = MERGE_3D_2,
+		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
+	}, {
+		.name = "pingpong_6", .id = PINGPONG_6,
+		.base = 0x6f000, .len = 0,
+		.sblk = &sc7280_pp_sblk,
+		.merge_3d = MERGE_3D_3,
+		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 20),
+	}, {
+		.name = "pingpong_7", .id = PINGPONG_7,
+		.base = 0x70000, .len = 0,
+		.sblk = &sc7280_pp_sblk,
+		.merge_3d = MERGE_3D_3,
+		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 21),
+	}, {
+		.name = "pingpong_cwb_0", .id = PINGPONG_CWB_0,
+		.base = 0x66000, .len = 0,
+		.sblk = &sc7280_pp_sblk,
+		.merge_3d = MERGE_3D_4,
+	}, {
+		.name = "pingpong_cwb_1", .id = PINGPONG_CWB_1,
+		.base = 0x66400, .len = 0,
+		.sblk = &sc7280_pp_sblk,
+		.merge_3d = MERGE_3D_4,
+	}, {
+		.name = "pingpong_cwb_2", .id = PINGPONG_CWB_2,
+		.base = 0x7e000, .len = 0,
+		.sblk = &sc7280_pp_sblk,
+		.merge_3d = MERGE_3D_5,
+	}, {
+		.name = "pingpong_cwb_3", .id = PINGPONG_CWB_3,
+		.base = 0x7e400, .len = 0,
+		.sblk = &sc7280_pp_sblk,
+		.merge_3d = MERGE_3D_5,
+	},
+};
+
+static const struct dpu_merge_3d_cfg sm8750_merge_3d[] = {
+	{
+		.name = "merge_3d_0", .id = MERGE_3D_0,
+		.base = 0x4e000, .len = 0x1c,
+	}, {
+		.name = "merge_3d_1", .id = MERGE_3D_1,
+		.base = 0x4f000, .len = 0x1c,
+	}, {
+		.name = "merge_3d_2", .id = MERGE_3D_2,
+		.base = 0x50000, .len = 0x1c,
+	}, {
+		.name = "merge_3d_3", .id = MERGE_3D_3,
+		.base = 0x51000, .len = 0x1c,
+	}, {
+		.name = "merge_3d_4", .id = MERGE_3D_4,
+		.base = 0x66700, .len = 0x1c,
+	}, {
+		.name = "merge_3d_5", .id = MERGE_3D_5,
+		.base = 0x7e700, .len = 0x1c,
+	},
+};
+
+/*
+ * NOTE: Each display compression engine (DCE) contains dual hard
+ * slice DSC encoders so both share same base address but with
+ * its own different sub block address.
+ */
+static const struct dpu_dsc_cfg sm8750_dsc[] = {
+	{
+		.name = "dce_0_0", .id = DSC_0,
+		.base = 0x80000, .len = 0x8,
+		.have_native_42x = 1,
+		.sblk = &sm8750_dsc_sblk_0,
+	}, {
+		.name = "dce_0_1", .id = DSC_1,
+		.base = 0x80000, .len = 0x8,
+		.have_native_42x = 1,
+		.sblk = &sm8750_dsc_sblk_1,
+	}, {
+		.name = "dce_1_0", .id = DSC_2,
+		.base = 0x81000, .len = 0x8,
+		.have_native_42x = 1,
+		.sblk = &sm8750_dsc_sblk_0,
+	}, {
+		.name = "dce_1_1", .id = DSC_3,
+		.base = 0x81000, .len = 0x8,
+		.have_native_42x = 1,
+		.sblk = &sm8750_dsc_sblk_1,
+	}, {
+		.name = "dce_2_0", .id = DSC_4,
+		.base = 0x82000, .len = 0x8,
+		.have_native_42x = 1,
+		.sblk = &sm8750_dsc_sblk_0,
+	}, {
+		.name = "dce_2_1", .id = DSC_5,
+		.base = 0x82000, .len = 0x8,
+		.have_native_42x = 1,
+		.sblk = &sm8750_dsc_sblk_1,
+	}, {
+		.name = "dce_3_0", .id = DSC_6,
+		.base = 0x83000, .len = 0x8,
+		.have_native_42x = 1,
+		.sblk = &sm8750_dsc_sblk_0,
+	}, {
+		.name = "dce_3_1", .id = DSC_7,
+		.base = 0x83000, .len = 0x8,
+		.have_native_42x = 1,
+		.sblk = &sm8750_dsc_sblk_1,
+	},
+};
+
+static const struct dpu_wb_cfg sm8750_wb[] = {
+	{
+		.name = "wb_2", .id = WB_2,
+		.base = 0x65000, .len = 0x2c8,
+		.features = WB_SDM845_MASK,
+		.format_list = wb2_formats_rgb_yuv,
+		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
+		.xin_id = 6,
+		.vbif_idx = VBIF_RT,
+		.maxlinewidth = 4096,
+		.intr_wb_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 4),
+	},
+};
+
+static const struct dpu_cwb_cfg sm8750_cwb[] = {
+	{
+		.name = "cwb_0", .id = CWB_0,
+		.base = 0x66200, .len = 0x20,
+	},
+	{
+		.name = "cwb_1", .id = CWB_1,
+		.base = 0x66600, .len = 0x20,
+	},
+	{
+		.name = "cwb_2", .id = CWB_2,
+		.base = 0x7e200, .len = 0x20,
+	},
+	{
+		.name = "cwb_3", .id = CWB_3,
+		.base = 0x7e600, .len = 0x20,
+	},
+};
+
+static const struct dpu_intf_cfg sm8750_intf[] = {
+	{
+		.name = "intf_0", .id = INTF_0,
+		.base = 0x34000, .len = 0x4bc,
+		.type = INTF_DP,
+		.controller_id = MSM_DP_CONTROLLER_0,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25),
+	}, {
+		.name = "intf_1", .id = INTF_1,
+		.base = 0x35000, .len = 0x4bc,
+		.type = INTF_DSI,
+		.controller_id = MSM_DSI_CONTROLLER_0,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
+		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2),
+	}, {
+		.name = "intf_2", .id = INTF_2,
+		.base = 0x36000, .len = 0x4bc,
+		.type = INTF_DSI,
+		.controller_id = MSM_DSI_CONTROLLER_1,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
+		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF2_TEAR_INTR, 2),
+	}, {
+		.name = "intf_3", .id = INTF_3,
+		.base = 0x37000, .len = 0x4bc,
+		.type = INTF_DP,
+		.controller_id = MSM_DP_CONTROLLER_1,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31),
+	},
+};
+
+static const struct dpu_perf_cfg sm8750_perf_data = {
+	.max_bw_low = 18900000,
+	.max_bw_high = 28500000,
+	.min_core_ib = 2500000,
+	.min_llcc_ib = 0,
+	.min_dram_ib = 800000,
+	.min_prefill_lines = 35,
+	.danger_lut_tbl = {0x3ffff, 0x3ffff, 0x0},
+	.safe_lut_tbl = {0xfe00, 0xfe00, 0xffff},
+	.qos_lut_tbl = {
+		{.nentry = ARRAY_SIZE(sc7180_qos_linear),
+		.entries = sc7180_qos_linear
+		},
+		{.nentry = ARRAY_SIZE(sc7180_qos_macrotile),
+		.entries = sc7180_qos_macrotile
+		},
+		{.nentry = ARRAY_SIZE(sc7180_qos_nrt),
+		.entries = sc7180_qos_nrt
+		},
+		/* TODO: macrotile-qseed is different from macrotile */
+	},
+	.cdp_cfg = {
+		{.rd_enable = 1, .wr_enable = 1},
+		{.rd_enable = 1, .wr_enable = 0}
+	},
+	.clk_inefficiency_factor = 105,
+	.bw_inefficiency_factor = 120,
+};
+
+static const struct dpu_mdss_version sm8750_mdss_ver = {
+	.core_major_ver = 12,
+	.core_minor_ver = 0,
+};
+
+const struct dpu_mdss_cfg dpu_sm8750_cfg = {
+	.mdss_ver = &sm8750_mdss_ver,
+	.caps = &sm8750_dpu_caps,
+	.mdp = &sm8750_mdp,
+	.cdm = &dpu_cdm_5_x,
+	.ctl_count = ARRAY_SIZE(sm8750_ctl),
+	.ctl = sm8750_ctl,
+	.sspp_count = ARRAY_SIZE(sm8750_sspp),
+	.sspp = sm8750_sspp,
+	.mixer_count = ARRAY_SIZE(sm8750_lm),
+	.mixer = sm8750_lm,
+	.dspp_count = ARRAY_SIZE(sm8750_dspp),
+	.dspp = sm8750_dspp,
+	.pingpong_count = ARRAY_SIZE(sm8750_pp),
+	.pingpong = sm8750_pp,
+	.dsc_count = ARRAY_SIZE(sm8750_dsc),
+	.dsc = sm8750_dsc,
+	.merge_3d_count = ARRAY_SIZE(sm8750_merge_3d),
+	.merge_3d = sm8750_merge_3d,
+	.wb_count = ARRAY_SIZE(sm8750_wb),
+	.wb = sm8750_wb,
+	.cwb_count = ARRAY_SIZE(sm8750_cwb),
+	.cwb = sm8650_cwb,
+	.intf_count = ARRAY_SIZE(sm8750_intf),
+	.intf = sm8750_intf,
+	.vbif_count = ARRAY_SIZE(sm8650_vbif),
+	.vbif = sm8650_vbif,
+	.perf = &sm8750_perf_data,
+};
+
+#endif
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index a310a5234e99ea4886e82ac2100c4099e6a1841e..1ccef3cdc5227ab785bd805b44cec132b2881e46 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -323,6 +323,9 @@ static const struct dpu_sspp_sub_blks dpu_vig_sblk_qseed3_3_2 =
 static const struct dpu_sspp_sub_blks dpu_vig_sblk_qseed3_3_3 =
 				_VIG_SBLK(SSPP_SCALER_VER(3, 3));
 
+static const struct dpu_sspp_sub_blks dpu_vig_sblk_qseed3_3_4 =
+				_VIG_SBLK(SSPP_SCALER_VER(3, 4));
+
 static const struct dpu_sspp_sub_blks dpu_rgb_sblk = _RGB_SBLK();
 
 static const struct dpu_sspp_sub_blks dpu_dma_sblk = _DMA_SBLK();
@@ -357,6 +360,16 @@ static const struct dpu_lm_sub_blks sc7180_lm_sblk = {
 	},
 };
 
+static const struct dpu_lm_sub_blks sm8750_lm_sblk = {
+	.maxwidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
+	.maxblendstages = 11, /* excluding base layer */
+	.blendstage_base = { /* offsets relative to mixer base */
+		/* 0x40 + n*0x30 */
+		0x40, 0x70, 0xa0, 0xd0, 0x100, 0x130, 0x160, 0x190, 0x1c0,
+		0x1f0, 0x220
+	},
+};
+
 static const struct dpu_lm_sub_blks qcm2290_lm_sblk = {
 	.maxwidth = DEFAULT_DPU_LINE_WIDTH,
 	.maxblendstages = 4, /* excluding base layer */
@@ -378,6 +391,11 @@ static const struct dpu_dspp_sub_blks sdm845_dspp_sblk = {
 		.len = 0x90, .version = 0x40000},
 };
 
+static const struct dpu_dspp_sub_blks sm8750_dspp_sblk = {
+	.pcc = {.name = "pcc", .base = 0x1700,
+		.len = 0x90, .version = 0x60000},
+};
+
 /*************************************************************
  * PINGPONG sub blocks config
  *************************************************************/
@@ -420,6 +438,16 @@ static const struct dpu_dsc_sub_blks dsc_sblk_1 = {
 	.ctl = {.name = "ctl", .base = 0xF80, .len = 0x10},
 };
 
+static const struct dpu_dsc_sub_blks sm8750_dsc_sblk_0 = {
+	.enc = {.name = "enc", .base = 0x100, .len = 0x100},
+	.ctl = {.name = "ctl", .base = 0xF00, .len = 0x24},
+};
+
+static const struct dpu_dsc_sub_blks sm8750_dsc_sblk_1 = {
+	.enc = {.name = "enc", .base = 0x200, .len = 0x100},
+	.ctl = {.name = "ctl", .base = 0xF80, .len = 0x24},
+};
+
 /*************************************************************
  * CDM block config
  *************************************************************/
@@ -710,3 +738,4 @@ static const struct dpu_qos_lut_entry sc7180_qos_nrt[] = {
 #include "catalog/dpu_9_2_x1e80100.h"
 
 #include "catalog/dpu_10_0_sm8650.h"
+#include "catalog/dpu_12_0_sm8750.h"
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index f5ce35cd966459f0edf2dbdd2dbc2693779fac73..de124b722340e98dc78999af1e0ff50bd65a53c2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -749,6 +749,7 @@ extern const struct dpu_mdss_cfg dpu_sm8450_cfg;
 extern const struct dpu_mdss_cfg dpu_sa8775p_cfg;
 extern const struct dpu_mdss_cfg dpu_sm8550_cfg;
 extern const struct dpu_mdss_cfg dpu_sm8650_cfg;
+extern const struct dpu_mdss_cfg dpu_sm8750_cfg;
 extern const struct dpu_mdss_cfg dpu_x1e80100_cfg;
 
 #endif /* _DPU_HW_CATALOG_H */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index d44461e7e1641b25c5181bf7c0c9bbedffcc869d..18d2237b291fd7acd37da8f74ea924c4f4f3d542 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1532,6 +1532,7 @@ static const struct of_device_id dpu_dt_match[] = {
 	{ .compatible = "qcom,sm8450-dpu", .data = &dpu_sm8450_cfg, },
 	{ .compatible = "qcom,sm8550-dpu", .data = &dpu_sm8550_cfg, },
 	{ .compatible = "qcom,sm8650-dpu", .data = &dpu_sm8650_cfg, },
+	{ .compatible = "qcom,sm8750-dpu", .data = &dpu_sm8750_cfg, },
 	{ .compatible = "qcom,x1e80100-dpu", .data = &dpu_x1e80100_cfg, },
 	{}
 };

-- 
2.45.2


