Return-Path: <linux-arm-msm+bounces-22345-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 50FF490471B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 00:38:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BD18A1F244EC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2024 22:38:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AC2B155A52;
	Tue, 11 Jun 2024 22:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="gGJcrIfN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp47.i.mail.ru (smtp47.i.mail.ru [95.163.41.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659EC15572F;
	Tue, 11 Jun 2024 22:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.163.41.85
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718145492; cv=none; b=pUO5umoNokttkmUfv8lju2l6EumHdaJ+8sU/8z7lu67XX1NIYNDidNiqBfxqES6nYq+esOMEfl4uJyE/TswA81naMQwehigO08fDDVAW5/zhMasYNj/tMxreOkYEfm3/deO85oE1HGB1gkc6uJmdhTIIHfhbApwV6144spwKeLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718145492; c=relaxed/simple;
	bh=Da1v7gcFegx57rwMGLMQD6sQ8dBCaJGjfo1OzSui82Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VGeubKtq76deyROTJtxu3Rieix/5c9QhyEhsPBqznHx5jeLSmH09KgAlx8DjYaULLllO1B3yStAVPmG6+VwUOHJBiUzaCognYcWlzZixR7u1OOBHpi54uQeMV3mZwe0hnJqwhm8Ax+gyg8VnBum+78ey57kDGXEHLd+nD247BY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com; spf=pass smtp.mailfrom=jiaxyga.com; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=gGJcrIfN; arc=none smtp.client-ip=95.163.41.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jiaxyga.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
	; s=mailru; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
	X-Cloud-Ids:Disposition-Notification-To;
	bh=xaEuK/tpUEqdk0IRIoLlmkLNkt/+IPwbnR4WqbScp30=; t=1718145489; x=1718235489; 
	b=gGJcrIfNERrE9qwWcMj/aT3m0v9XjYUL+27eJj0+08/7/iO0JrGuWbsc5EDsejp/XJ1aGzwjiyV
	6551Xben4zoZMgZTVvYUotggRbQTdV95h+goxQDksBUKGJA908c0yuMBhYgjYqGI0Q+xSn97np/ea
	6ciIIf0Wzv/F+aKkPNQ=;
Received: by smtp47.i.mail.ru with esmtpa (envelope-from <danila@jiaxyga.com>)
	id 1sHA7w-00000000PfZ-49Sx; Wed, 12 Jun 2024 01:38:06 +0300
From: Danila Tikhonov <danila@jiaxyga.com>
To: robdclark@gmail.com,
	quic_abhinavk@quicinc.com,
	dmitry.baryshkov@linaro.org,
	sean@poorly.run,
	marijn.suijten@somainline.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	daniel@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	quic_rmccann@quicinc.com,
	konrad.dybcio@linaro.org,
	neil.armstrong@linaro.org,
	jonathan@marek.ca,
	swboyd@chromium.org,
	quic_khsieh@quicinc.com,
	quic_jesszhan@quicinc.com
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danila Tikhonov <danila@jiaxyga.com>
Subject: [PATCH 4/4] drm/msm/dpu: Add SM7150 support
Date: Wed, 12 Jun 2024 01:37:43 +0300
Message-ID: <20240611223743.113223-5-danila@jiaxyga.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240611223743.113223-1-danila@jiaxyga.com>
References: <20240611223743.113223-1-danila@jiaxyga.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp47.i.mail.ru; auth=pass smtp.auth=danila@jiaxyga.com smtp.mailfrom=danila@jiaxyga.com
X-Mailru-Src: smtp
X-7564579A: 78E4E2B564C1792B
X-77F55803: 4F1203BC0FB41BD9AC8CA0B4439200FA41DE42749F357741E440C2FC2F02794100894C459B0CD1B9C350646711512FF006104296DCCA83D226FF172BA2B6780D42442993E2508E0A16B550D20AEFFB87
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7082EE828F322BB18EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637B1AF1CB5CD5D34E98638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8ECCF92E0CAE3266B408FF9FAEF290F8BBEA5E3E7FAA9EF78CC7F00164DA146DAFE8445B8C89999728AA50765F79006370BDB19F53EE528DD389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC8C2B5EEE3591E0D35F6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA73AA81AA40904B5D9A18204E546F3947C68E4D7E803FA7AD56136E347CC761E074AD6D5ED66289B523666184CF4C3C14F6136E347CC761E07725E5C173C3A84C3326391042396B1B4BA3038C0950A5D36B5C8C57E37DE458B330BD67F2E7D9AF16D1867E19FE14079C09775C1D3CA48CFE478A468B35FE7671DD303D21008E298D5E8D9A59859A8B636DA1BED736F932875ECD9A6C639B01B78DA827A17800CE70D44ABEBB09E7BA443847C11F186F3C59DAA53EE0834AAEE
X-C1DE0DAB: 0D63561A33F958A50F382784A0D7B0635002B1117B3ED69619516B013ADB654F4A0A47EBA01A636A823CB91A9FED034534781492E4B8EEAD577AE849BCD98940C79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF1A7696BD3DB6164E7B67D26D5F93AC330E4EACFCB4BA55224A7488D196BF9716BDB65CFD5BA197A704A26A3878DC1330977C5AA4A79ED02FE3725B7D062D8D4306949E0D724962CF54A6BD6C3A9AE7E002C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj7p5wIdCuWKPNVJvlberUSw==
X-Mailru-Sender: 9EB879F2C80682A09F26F806C73949810CCDD7C2C42388EEDF237C39DF1304749D7B73855EED0BB6506B3003D678B13E2C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok

Add definitions for the display hardware used on the Qualcomm SM7150
platform.

Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
---
 .../msm/disp/dpu1/catalog/dpu_5_2_sm7150.h    | 349 ++++++++++++++++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |   1 +
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   1 +
 4 files changed, 352 insertions(+)
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
new file mode 100644
index 0000000000000..4d50814edcffd
--- /dev/null
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
@@ -0,0 +1,349 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2018-2019, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2024, Danila Tikhonov <danila@jiaxyga.com>
+ */
+
+#ifndef _DPU_5_2_SM7150_H
+#define _DPU_5_2_SM7150_H
+
+static const struct dpu_caps sm7150_dpu_caps = {
+	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
+	.max_mixer_blendstages = 0xb,
+	.has_src_split = true,
+	.has_dim_layer = true,
+	.has_idle_pc = true,
+	.has_3d_merge = true,
+	.max_linewidth = 2880,
+	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
+	.max_hdeci_exp = MAX_HORZ_DECIMATION,
+	.max_vdeci_exp = MAX_VERT_DECIMATION,
+};
+
+static const struct dpu_mdp_cfg sm7150_mdp = {
+	.name = "top_0",
+	.base = 0x0, .len = 0x45c,
+	.features = BIT(DPU_MDP_AUDIO_SELECT),
+	.clk_ctrls = {
+		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
+		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
+		[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
+		[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
+		[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2bc, .bit_off = 8 },
+		[DPU_CLK_CTRL_WB2] = { .reg_off = 0x2bc, .bit_off = 16 },
+	},
+};
+
+static const struct dpu_ctl_cfg sm7150_ctl[] = {
+	{
+		.name = "ctl_0", .id = CTL_0,
+		.base = 0x1000, .len = 0x1e0,
+		.features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_SPLIT_DISPLAY),
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
+	}, {
+		.name = "ctl_1", .id = CTL_1,
+		.base = 0x1200, .len = 0x1e0,
+		.features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_SPLIT_DISPLAY),
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
+	}, {
+		.name = "ctl_2", .id = CTL_2,
+		.base = 0x1400, .len = 0x1e0,
+		.features = BIT(DPU_CTL_ACTIVE_CFG),
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
+	}, {
+		.name = "ctl_3", .id = CTL_3,
+		.base = 0x1600, .len = 0x1e0,
+		.features = BIT(DPU_CTL_ACTIVE_CFG),
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
+	}, {
+		.name = "ctl_4", .id = CTL_4,
+		.base = 0x1800, .len = 0x1e0,
+		.features = BIT(DPU_CTL_ACTIVE_CFG),
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
+	}, {
+		.name = "ctl_5", .id = CTL_5,
+		.base = 0x1a00, .len = 0x1e0,
+		.features = BIT(DPU_CTL_ACTIVE_CFG),
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
+	},
+};
+
+static const struct dpu_sspp_cfg sm7150_sspp[] = {
+	{
+		.name = "sspp_0", .id = SSPP_VIG0,
+		.base = 0x4000, .len = 0x1f0,
+		.features = VIG_SDM845_MASK,
+		.sblk = &dpu_vig_sblk_qseed3_1_4,
+		.xin_id = 0,
+		.type = SSPP_TYPE_VIG,
+		.clk_ctrl = DPU_CLK_CTRL_VIG0,
+	}, {
+		.name = "sspp_1", .id = SSPP_VIG1,
+		.base = 0x6000, .len = 0x1f0,
+		.features = VIG_SDM845_MASK,
+		.sblk = &dpu_vig_sblk_qseed3_1_4,
+		.xin_id = 4,
+		.type = SSPP_TYPE_VIG,
+		.clk_ctrl = DPU_CLK_CTRL_VIG1,
+	}, {
+		.name = "sspp_2", .id = SSPP_DMA0,
+		.base = 0x24000, .len = 0x1f0,
+		.features = DMA_SDM845_MASK,
+		.sblk = &dpu_dma_sblk,
+		.xin_id = 1,
+		.type = SSPP_TYPE_DMA,
+		.clk_ctrl = DPU_CLK_CTRL_DMA0,
+	}, {
+		.name = "sspp_9", .id = SSPP_DMA1,
+		.base = 0x26000, .len = 0x1f0,
+		.features = DMA_SDM845_MASK,
+		.sblk = &dpu_dma_sblk,
+		.xin_id = 5,
+		.type = SSPP_TYPE_DMA,
+		.clk_ctrl = DPU_CLK_CTRL_DMA1,
+	}, {
+		.name = "sspp_10", .id = SSPP_DMA2,
+		.base = 0x28000, .len = 0x1f0,
+		.features = DMA_CURSOR_SDM845_MASK,
+		.sblk = &dpu_dma_sblk,
+		.xin_id = 9,
+		.type = SSPP_TYPE_DMA,
+		.clk_ctrl = DPU_CLK_CTRL_DMA2,
+	},
+};
+
+static const struct dpu_lm_cfg sm7150_lm[] = {
+	{
+		.name = "lm_0", .id = LM_0,
+		.base = 0x44000, .len = 0x320,
+		.features = MIXER_SDM845_MASK,
+		.sblk = &sdm845_lm_sblk,
+		.lm_pair = LM_1,
+		.pingpong = PINGPONG_0,
+		.dspp = DSPP_0,
+	}, {
+		.name = "lm_1", .id = LM_1,
+		.base = 0x45000, .len = 0x320,
+		.features = MIXER_SDM845_MASK,
+		.sblk = &sdm845_lm_sblk,
+		.lm_pair = LM_0,
+		.pingpong = PINGPONG_1,
+		.dspp = DSPP_1,
+	}, {
+		.name = "lm_2", .id = LM_2,
+		.base = 0x46000, .len = 0x320,
+		.features = MIXER_SDM845_MASK,
+		.sblk = &sdm845_lm_sblk,
+		.lm_pair = LM_3,
+		.pingpong = PINGPONG_2,
+	}, {
+		.name = "lm_3", .id = LM_3,
+		.base = 0x47000, .len = 0x320,
+		.features = MIXER_SDM845_MASK,
+		.sblk = &sdm845_lm_sblk,
+		.lm_pair = LM_2,
+		.pingpong = PINGPONG_3,
+	}, {
+		.name = "lm_4", .id = LM_4,
+		.base = 0x0, .len = 0x320,
+		.features = MIXER_SDM845_MASK,
+		.sblk = &sdm845_lm_sblk,
+		.lm_pair = 0,
+		.pingpong = PINGPONG_4,
+	}, {
+		.name = "lm_5", .id = LM_5,
+		.base = 0x0, .len = 0x320,
+		.features = MIXER_SDM845_MASK,
+		.sblk = &sdm845_lm_sblk,
+		.lm_pair = 0,
+		.pingpong = PINGPONG_5,
+	},
+};
+
+static const struct dpu_dspp_cfg sm7150_dspp[] = {
+	{
+		.name = "dspp_0", .id = DSPP_0,
+		.base = 0x54000, .len = 0x1800,
+		.features = DSPP_SC7180_MASK,
+		.sblk = &sdm845_dspp_sblk,
+	}, {
+		.name = "dspp_1", .id = DSPP_1,
+		.base = 0x56000, .len = 0x1800,
+		.features = DSPP_SC7180_MASK,
+		.sblk = &sdm845_dspp_sblk,
+	},
+};
+
+static const struct dpu_pingpong_cfg sm7150_pp[] = {
+	{
+		.name = "pingpong_0", .id = PINGPONG_0,
+		.base = 0x70000, .len = 0xd4,
+		.features = PINGPONG_SM8150_MASK,
+		.sblk = &sdm845_pp_sblk,
+		.merge_3d = MERGE_3D_0,
+		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
+	}, {
+		.name = "pingpong_1", .id = PINGPONG_1,
+		.base = 0x70800, .len = 0xd4,
+		.features = PINGPONG_SM8150_MASK,
+		.sblk = &sdm845_pp_sblk,
+		.merge_3d = MERGE_3D_0,
+		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
+	}, {
+		.name = "pingpong_2", .id = PINGPONG_2,
+		.base = 0x71000, .len = 0xd4,
+		.features = PINGPONG_SM8150_MASK,
+		.sblk = &sdm845_pp_sblk,
+		.merge_3d = MERGE_3D_1,
+		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
+	}, {
+		.name = "pingpong_3", .id = PINGPONG_3,
+		.base = 0x71800, .len = 0xd4,
+		.features = PINGPONG_SM8150_MASK,
+		.sblk = &sdm845_pp_sblk,
+		.merge_3d = MERGE_3D_1,
+		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
+	},
+};
+
+static const struct dpu_merge_3d_cfg sm7150_merge_3d[] = {
+	{
+		.name = "merge_3d_0", .id = MERGE_3D_0,
+		.base = 0x83000, .len = 0x8,
+	}, {
+		.name = "merge_3d_1", .id = MERGE_3D_1,
+		.base = 0x83100, .len = 0x8,
+	},
+};
+
+static const struct dpu_dsc_cfg sm7150_dsc[] = {
+	{
+		.name = "dsc_0", .id = DSC_0,
+		.base = 0x80000, .len = 0x140,
+		.features = BIT(DPU_DSC_OUTPUT_CTRL),
+	}, {
+		.name = "dsc_1", .id = DSC_1,
+		.base = 0x80400, .len = 0x140,
+		.features = BIT(DPU_DSC_OUTPUT_CTRL),
+	},
+};
+
+static const struct dpu_intf_cfg sm7150_intf[] = {
+	{
+		.name = "intf_0", .id = INTF_0,
+		.base = 0x6a000, .len = 0x280,
+		.features = INTF_SC7180_MASK,
+		.type = INTF_DP,
+		.controller_id = MSM_DP_CONTROLLER_0,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25),
+	}, {
+		.name = "intf_1", .id = INTF_1,
+		.base = 0x6a800, .len = 0x2bc,
+		.features = INTF_SC7180_MASK,
+		.type = INTF_DSI,
+		.controller_id = MSM_DSI_CONTROLLER_0,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
+		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2),
+	}, {
+		.name = "intf_2", .id = INTF_2,
+		.base = 0x6b000, .len = 0x2bc,
+		.features = INTF_SC7180_MASK,
+		.type = INTF_DSI,
+		.controller_id = MSM_DSI_CONTROLLER_1,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
+		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF2_TEAR_INTR, 2),
+	}, {
+		.name = "intf_3", .id = INTF_3,
+		.base = 0x6b800, .len = 0x280,
+		.features = INTF_SC7180_MASK,
+		.type = INTF_DP,
+		.controller_id = MSM_DP_CONTROLLER_1,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31),
+	},
+};
+
+static const struct dpu_wb_cfg sm7150_wb[] = {
+	{
+		.name = "wb_2", .id = WB_2,
+		.base = 0x65000, .len = 0x2c8,
+		.features = WB_SM8250_MASK,
+		.format_list = wb2_formats_rgb,
+		.num_formats = ARRAY_SIZE(wb2_formats_rgb),
+		.clk_ctrl = DPU_CLK_CTRL_WB2,
+		.xin_id = 6,
+		.vbif_idx = VBIF_RT,
+		.maxlinewidth = 4096,
+		.intr_wb_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 4),
+	},
+};
+
+static const struct dpu_perf_cfg sm7150_perf_data = {
+	.max_bw_low = 7100000,
+	.max_bw_high = 7100000,
+	.min_core_ib = 2400000,
+	.min_llcc_ib = 800000,
+	.min_dram_ib = 800000,
+	.min_prefill_lines = 24,
+	.danger_lut_tbl = {0xf, 0xffff, 0x0},
+	.safe_lut_tbl = {0xfff8, 0xf000, 0xffff},
+	.qos_lut_tbl = {
+		{
+		.nentry = ARRAY_SIZE(sm8150_qos_linear),
+		.entries = sm8150_qos_linear
+		}, {
+		.nentry = ARRAY_SIZE(sc7180_qos_macrotile),
+		.entries = sc7180_qos_macrotile
+		}, {
+		.nentry = ARRAY_SIZE(sc7180_qos_nrt),
+		.entries = sc7180_qos_nrt
+		},
+	},
+	.cdp_cfg = {
+		{.rd_enable = 1, .wr_enable = 1},
+		{.rd_enable = 1, .wr_enable = 0}
+	},
+	.clk_inefficiency_factor = 105,
+	.bw_inefficiency_factor = 120,
+};
+
+static const struct dpu_mdss_version sm7150_mdss_ver = {
+	.core_major_ver = 5,
+	.core_minor_ver = 2,
+};
+
+const struct dpu_mdss_cfg dpu_sm7150_cfg = {
+	.mdss_ver = &sm7150_mdss_ver,
+	.caps = &sm7150_dpu_caps,
+	.mdp = &sm7150_mdp,
+	.ctl_count = ARRAY_SIZE(sm7150_ctl),
+	.ctl = sm7150_ctl,
+	.sspp_count = ARRAY_SIZE(sm7150_sspp),
+	.sspp = sm7150_sspp,
+	.mixer_count = ARRAY_SIZE(sm7150_lm),
+	.mixer = sm7150_lm,
+	.dspp_count = ARRAY_SIZE(sm7150_dspp),
+	.dspp = sm7150_dspp,
+	.pingpong_count = ARRAY_SIZE(sm7150_pp),
+	.pingpong = sm7150_pp,
+	.merge_3d_count = ARRAY_SIZE(sm7150_merge_3d),
+	.merge_3d = sm7150_merge_3d,
+	.dsc_count = ARRAY_SIZE(sm7150_dsc),
+	.dsc = sm7150_dsc,
+	.intf_count = ARRAY_SIZE(sm7150_intf),
+	.intf = sm7150_intf,
+	.wb_count = ARRAY_SIZE(sm7150_wb),
+	.wb = sm7150_wb,
+	.vbif_count = ARRAY_SIZE(sdm845_vbif),
+	.vbif = sdm845_vbif,
+	.perf = &sm7150_perf_data,
+};
+
+#endif
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index f2b6eac7601dd..a488af935bfa8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -688,6 +688,7 @@ static const struct dpu_qos_lut_entry sc7180_qos_nrt[] = {
 
 #include "catalog/dpu_5_0_sm8150.h"
 #include "catalog/dpu_5_1_sc8180x.h"
+#include "catalog/dpu_5_2_sm7150.h"
 #include "catalog/dpu_5_4_sm6125.h"
 
 #include "catalog/dpu_6_0_sm8250.h"
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index d1aef778340be..37e18e820a20a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -838,6 +838,7 @@ extern const struct dpu_mdss_cfg dpu_sdm845_cfg;
 extern const struct dpu_mdss_cfg dpu_sdm670_cfg;
 extern const struct dpu_mdss_cfg dpu_sm8150_cfg;
 extern const struct dpu_mdss_cfg dpu_sc8180x_cfg;
+extern const struct dpu_mdss_cfg dpu_sm7150_cfg;
 extern const struct dpu_mdss_cfg dpu_sm8250_cfg;
 extern const struct dpu_mdss_cfg dpu_sc7180_cfg;
 extern const struct dpu_mdss_cfg dpu_sm6115_cfg;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 1955848b1b781..291af6b406b2a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1405,6 +1405,7 @@ static const struct of_device_id dpu_dt_match[] = {
 	{ .compatible = "qcom,sm6125-dpu", .data = &dpu_sm6125_cfg, },
 	{ .compatible = "qcom,sm6350-dpu", .data = &dpu_sm6350_cfg, },
 	{ .compatible = "qcom,sm6375-dpu", .data = &dpu_sm6375_cfg, },
+	{ .compatible = "qcom,sm7150-dpu", .data = &dpu_sm7150_cfg, },
 	{ .compatible = "qcom,sm8150-dpu", .data = &dpu_sm8150_cfg, },
 	{ .compatible = "qcom,sm8250-dpu", .data = &dpu_sm8250_cfg, },
 	{ .compatible = "qcom,sm8350-dpu", .data = &dpu_sm8350_cfg, },
-- 
2.45.2


