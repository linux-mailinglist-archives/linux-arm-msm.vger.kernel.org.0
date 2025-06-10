Return-Path: <linux-arm-msm+bounces-60818-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99EC6AD3A9D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 16:09:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2C5DD7A69DF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 14:08:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7DCF2D8DC0;
	Tue, 10 Jun 2025 14:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HV7R75ET"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A3A2D8DB3
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 14:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749564401; cv=none; b=Qph5NhF30noDG+lKs7TjTdnRfUqxpgj67pDhQdavT0w/E0XG2fw8peEE5fo4NqoG+zdfV8yRt3BItmnGFWEBqEEJxYl07FIX3jXEjn83KGUowRbvqDBgkakTAmKUoTSvuANQhQik32Lf0KBOXXAp1KFxr/80IVpmZ4BewbY0PPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749564401; c=relaxed/simple;
	bh=9Pj7Z/cWajLnxwxWaf/h+pVz5yTEei1Ql0+OZD4CqNw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aEomRsib61uP/uRJ4EJyTwbONRkQH6NlL08jYnJOjMzB47XDnw+6x3wYZxC+BUEnweNIkeIdyi68yymAVjLuQrDjJ0xSEcDT4etwdWsJ+Z6U6Sswc3+CUTA8XYQ83O+qcZyFjm5VfCPQsvdI0j6qISTTC39NuErekAEgamzc5LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HV7R75ET; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-450d0526132so2556165e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 07:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749564396; x=1750169196; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A9ZWQybGIT9pk/r23HTdQ1LqXIT6yHtJ2X2MvFB13UA=;
        b=HV7R75ETiAWBnYemxFYuG0x/J/sw+twferUcAYc5AebUFVH+IzpZLDMra3VNY7cqzU
         qtO9FLmaEb/a8kX1p+hR0BYMr6tKUTJVLstbT1S37DIMUF0W2GVVsyKhUmqhjqYxZfuG
         q24uVjyMSVKPoSE0c0yUgN8sG6grLqX+J6smUB30Pclv7eHLF2p+DR/ObK34P8J6ltij
         ayuY/37JaMIF9mkydzv1KJxMzrDF4p0xvk6gbrItnlhuIMMk1vX6utrIYC7agoEIzWLz
         M8ZozNtg4GPdzzMDroPPdDauHPxq+s7pxDclP098gpV79y8y66/yv/gjLyXgIXYnGRX5
         /9yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749564396; x=1750169196;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A9ZWQybGIT9pk/r23HTdQ1LqXIT6yHtJ2X2MvFB13UA=;
        b=iCqQFT36+xEI71Avkw9f+UkZklWO931A0xfF7k6Oere1j6+EuO34TeXCL10VKBnX7G
         g2ArXQsqr+d0QQ4/urOCQ7A1T7icyVfgD9p0s5bUMYlWyfmFLdX1gxSFdtW8DfOiOz4/
         33mEezRDauPvKChufbinZRp9pqfSqSQzBG49C/3Y2ES5QCslHPKzvnj7UlOR15pEB9Lq
         So/wRDNKLdtdmuTJ9NIi5huySNfrnz3h/l1r4kz3u01jBzt2SDsNOR75zKhOiG+OxWac
         DERhHYDJmVyxa2Kgn4677rq/bWcZbVEB5OqeDDrI6VhnQH0aTU5NLmW6EelLRPcnJfl0
         U8kg==
X-Gm-Message-State: AOJu0YxiSOl9NMjjHdEjcH2XQa4Tw6o+AzBOyJ1Vcd8JPvtHvIaD1fH9
	GD+Odo/k9X/t6AeBs8mkVWuF17gLVHKWYd9zArcCwA6ncEDdPrsZxh4yaop+o7VjICg=
X-Gm-Gg: ASbGncsIB5ZZF15Ot5ASppng8RqEYTOJlJp0PdQPb3re6EmpX2vwaaxKXNcd3YylLjR
	qVEv5l3UzaK4m1SS960ntaWV+ey8mafcqc94wtUX/hk17JGU/Oyu8ATPb6hSCny4fbaO/u6rwGy
	FiylVMVvN847USjRRIKpjgcMgRQ+3+kgQ99A0WXWNDy9u/k6H199vDG0DL0cDSnQCMFZWf0PyTi
	X7moHBfrVv9rJiX3leLQ/hIaAl2F6/w3XZcuEGFN1kt9kVutxX/x/EEQq5MdQEE17aVwolm1Oym
	PYb6vH/3vqHsVMyB5Xfwjdn2Kgo6hjOoLsfBou5xk/plVnSQ1PmfLWWzvUW96uSIJi//7YoHBvS
	AllotEw==
X-Google-Smtp-Source: AGHT+IF9rWetZA8aq/ZyInH2riOru8Jxxffwa5+89PShq0USi64/M5xsdt7ibbjw3+PcuCXHaBleqQ==
X-Received: by 2002:a05:600c:c83:b0:439:a30f:2e49 with SMTP id 5b1f17b1804b1-452014b3cdamr58907795e9.5.1749564394723;
        Tue, 10 Jun 2025 07:06:34 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244df06sm12734469f8f.69.2025.06.10.07.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 07:06:34 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 10 Jun 2025 16:05:50 +0200
Subject: [PATCH v6 12/17] drm/msm/dpu: Add support for SM8750
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-b4-sm8750-display-v6-12-ee633e3ddbff@linaro.org>
References: <20250610-b4-sm8750-display-v6-0-ee633e3ddbff@linaro.org>
In-Reply-To: <20250610-b4-sm8750-display-v6-0-ee633e3ddbff@linaro.org>
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
 Dmitry Baryshkov <lumag@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-clk@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=19147;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=9Pj7Z/cWajLnxwxWaf/h+pVz5yTEei1Ql0+OZD4CqNw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoSDvJOVtF2cgges6j3KUlPKS2nDMBORl5ceKZf
 PXPGyiNn+CJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaEg7yQAKCRDBN2bmhouD
 1+xJEACDhoUc9fJFVwzJFf9XFjTHEFDkvjYB8qJmm9qWJqTlYk6h6RtxBtIPmtmhd+AhOdrfJap
 tJyS/t9/fTQ9qdXyke9pJqZbkTUCl+mKMoSmLMzMOYE2yHkRu8yA3hcrshsl5CwpJESCIUHrFgU
 Fy158Lxki9LA5TUYcPywgsp0Qvpye0T0Z0PgjmncPqHqGv7LCrBmGdw8JqzObUeeo9GVHa0YWYZ
 Hi6LDybR7XxeM6EVeHsRRqQ0VD9g9AClJ1My/MNjNQA5n+/Ui/bE9pLoGsiRVA2LjLu80BkY3o5
 BpaokHKHywlXEWbuRXg2ePjOx6Z8FWvxI2uyd8FY1nABUyuTwY+MK4ugZ/oeQqWnVUg+t/8q6Xc
 okyBWJNkGaUJoQmdzLoKlAr6lmdzI8+OIyXA8DyTGaU+A0p2CGOH3o1rT4HpWO2MCtwqGan9upg
 ssBfGmihjkeeU816WVDPx7VECH8ST6eWb4AXLjN5lc5h4LRnN4bmMw4DaL2XKuPaaf6j5hycgVX
 X3JvUapp8E4JA49tYfRNxYi2A8PL55cBi49eC9U4zwHArE9mgp8rT1SmPKx+PK7z73gXSHNlWkr
 kJv4Fu25a/zE2emQ1QRUGQXqkry3NT5+eQNNTSd9+HNj0TN4KGUBhlRLFIeb+khuI/zk3jsxxGm
 HEbu8iga2BQezBQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Add DPU version v12.0 support for the Qualcomm SM8750 platform.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Changes in v6:
1. Changes due to rebase on newer HW features patchset rework from
   Dmitry.

Changes in v2:
1. Add CDM
---
 .../drm/msm/disp/dpu1/catalog/dpu_12_0_sm8750.h    | 494 +++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  29 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
 4 files changed, 525 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_0_sm8750.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_0_sm8750.h
new file mode 100644
index 0000000000000000000000000000000000000000..db8cc2d0112c87711a420e4912d6e76dd432bc87
--- /dev/null
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_0_sm8750.h
@@ -0,0 +1,494 @@
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
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
+	}, {
+		.name = "ctl_1", .id = CTL_1,
+		.base = 0x16000, .len = 0x1000,
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
+		.features = MIXER_MSM8998_MASK,
+		.sblk = &sm8750_lm_sblk,
+		.lm_pair = LM_1,
+		.pingpong = PINGPONG_0,
+		.dspp = DSPP_0,
+	}, {
+		.name = "lm_1", .id = LM_1,
+		.base = 0x45000, .len = 0x400,
+		.features = MIXER_MSM8998_MASK,
+		.sblk = &sm8750_lm_sblk,
+		.lm_pair = LM_0,
+		.pingpong = PINGPONG_1,
+		.dspp = DSPP_1,
+	}, {
+		.name = "lm_2", .id = LM_2,
+		.base = 0x46000, .len = 0x400,
+		.features = MIXER_MSM8998_MASK,
+		.sblk = &sm8750_lm_sblk,
+		.lm_pair = LM_3,
+		.pingpong = PINGPONG_2,
+		.dspp = DSPP_2,
+	}, {
+		.name = "lm_3", .id = LM_3,
+		.base = 0x47000, .len = 0x400,
+		.features = MIXER_MSM8998_MASK,
+		.sblk = &sm8750_lm_sblk,
+		.lm_pair = LM_2,
+		.pingpong = PINGPONG_3,
+		.dspp = DSPP_3,
+	}, {
+		.name = "lm_4", .id = LM_4,
+		.base = 0x48000, .len = 0x400,
+		.features = MIXER_MSM8998_MASK,
+		.sblk = &sm8750_lm_sblk,
+		.lm_pair = LM_5,
+		.pingpong = PINGPONG_4,
+	}, {
+		.name = "lm_5", .id = LM_5,
+		.base = 0x49000, .len = 0x400,
+		.features = MIXER_MSM8998_MASK,
+		.sblk = &sm8750_lm_sblk,
+		.lm_pair = LM_4,
+		.pingpong = PINGPONG_5,
+	}, {
+		.name = "lm_6", .id = LM_6,
+		.base = 0x4a000, .len = 0x400,
+		.features = MIXER_MSM8998_MASK,
+		.sblk = &sm8750_lm_sblk,
+		.lm_pair = LM_7,
+		.pingpong = PINGPONG_6,
+	}, {
+		.name = "lm_7", .id = LM_7,
+		.base = 0x4b000, .len = 0x400,
+		.features = MIXER_MSM8998_MASK,
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
+		.features = BIT(DPU_DSC_NATIVE_42x_EN),
+		.sblk = &sm8750_dsc_sblk_0,
+	}, {
+		.name = "dce_0_1", .id = DSC_1,
+		.base = 0x80000, .len = 0x8,
+		.features = BIT(DPU_DSC_NATIVE_42x_EN),
+		.sblk = &sm8750_dsc_sblk_1,
+	}, {
+		.name = "dce_1_0", .id = DSC_2,
+		.base = 0x81000, .len = 0x8,
+		.features = BIT(DPU_DSC_NATIVE_42x_EN),
+		.sblk = &sm8750_dsc_sblk_0,
+	}, {
+		.name = "dce_1_1", .id = DSC_3,
+		.base = 0x81000, .len = 0x8,
+		.features = BIT(DPU_DSC_NATIVE_42x_EN),
+		.sblk = &sm8750_dsc_sblk_1,
+	}, {
+		.name = "dce_2_0", .id = DSC_4,
+		.base = 0x82000, .len = 0x8,
+		.features = BIT(DPU_DSC_NATIVE_42x_EN),
+		.sblk = &sm8750_dsc_sblk_0,
+	}, {
+		.name = "dce_2_1", .id = DSC_5,
+		.base = 0x82000, .len = 0x8,
+		.features = BIT(DPU_DSC_NATIVE_42x_EN),
+		.sblk = &sm8750_dsc_sblk_1,
+	}, {
+		.name = "dce_3_0", .id = DSC_6,
+		.base = 0x83000, .len = 0x8,
+		.features = BIT(DPU_DSC_NATIVE_42x_EN),
+		.sblk = &sm8750_dsc_sblk_0,
+	}, {
+		.name = "dce_3_1", .id = DSC_7,
+		.base = 0x83000, .len = 0x8,
+		.features = BIT(DPU_DSC_NATIVE_42x_EN),
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
index a276a1beaf95d183f6119452e5516fa8ee60cef6..e824cd64fd3fdf2ab0db92794a0aaa57c109decb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -326,6 +326,9 @@ static const struct dpu_sspp_sub_blks dpu_vig_sblk_qseed3_3_2 =
 static const struct dpu_sspp_sub_blks dpu_vig_sblk_qseed3_3_3 =
 				_VIG_SBLK(SSPP_SCALER_VER(3, 3));
 
+static const struct dpu_sspp_sub_blks dpu_vig_sblk_qseed3_3_4 =
+				_VIG_SBLK(SSPP_SCALER_VER(3, 4));
+
 static const struct dpu_sspp_sub_blks dpu_rgb_sblk = _RGB_SBLK();
 
 static const struct dpu_sspp_sub_blks dpu_dma_sblk = _DMA_SBLK();
@@ -360,6 +363,16 @@ static const struct dpu_lm_sub_blks sc7180_lm_sblk = {
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
@@ -381,6 +394,11 @@ static const struct dpu_dspp_sub_blks sdm845_dspp_sblk = {
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
@@ -412,6 +430,16 @@ static const struct dpu_dsc_sub_blks dsc_sblk_1 = {
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
@@ -702,3 +730,4 @@ static const struct dpu_qos_lut_entry sc7180_qos_nrt[] = {
 #include "catalog/dpu_9_2_x1e80100.h"
 
 #include "catalog/dpu_10_0_sm8650.h"
+#include "catalog/dpu_12_0_sm8750.h"
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 47d82b83ac5378cb0001b3ea6605dc0f98aec5ef..a78bb2c334e30bc86554bde45355808b790c6235 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -778,6 +778,7 @@ extern const struct dpu_mdss_cfg dpu_sm8450_cfg;
 extern const struct dpu_mdss_cfg dpu_sa8775p_cfg;
 extern const struct dpu_mdss_cfg dpu_sm8550_cfg;
 extern const struct dpu_mdss_cfg dpu_sm8650_cfg;
+extern const struct dpu_mdss_cfg dpu_sm8750_cfg;
 extern const struct dpu_mdss_cfg dpu_x1e80100_cfg;
 
 #endif /* _DPU_HW_CATALOG_H */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index d478a7bce7568ab000d73467bcad91e29f049abc..df9d6a509bcd453978bc2491795a6ef87cc95638 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1533,6 +1533,7 @@ static const struct of_device_id dpu_dt_match[] = {
 	{ .compatible = "qcom,sm8450-dpu", .data = &dpu_sm8450_cfg, },
 	{ .compatible = "qcom,sm8550-dpu", .data = &dpu_sm8550_cfg, },
 	{ .compatible = "qcom,sm8650-dpu", .data = &dpu_sm8650_cfg, },
+	{ .compatible = "qcom,sm8750-dpu", .data = &dpu_sm8750_cfg, },
 	{ .compatible = "qcom,x1e80100-dpu", .data = &dpu_x1e80100_cfg, },
 	{}
 };

-- 
2.45.2


