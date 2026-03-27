Return-Path: <linux-arm-msm+bounces-100374-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SC4UAviuxmmiNgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100374-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 17:23:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A4B34760B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 17:23:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E60B2310068D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 16:13:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A281356A23;
	Fri, 27 Mar 2026 16:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="MXG9z9LG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 733D7349B18
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 16:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774627964; cv=none; b=NHAsv2USxB5MsAJGTyxz/mFSsevHyLjXOdW2dW/Ed5bWXKBkOLxRcLXyOPO98sX/x8Yrs5KgMquv2WUg+vLO/O6H3uYcYflBaROQ4Cwz715GQD/hdElU1dWAKMO/BOGdj/ffSU7sBZhufWFGEqm0nOm1LQ2twdMP2Dv7ydl9cqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774627964; c=relaxed/simple;
	bh=iKsxeLMALhkJyLMhTvLyLfN9d/jMx3vnocKrUpXfqKI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lswa5otCdXl3XXwsLAaHOmSANp2YUM4/8HlVm41yYSwp0mcyEpIQ7iFnPk58GlShCcH7ELCznCfIbr8SdaUB82DzaREKKGIY3Fr4BxHqMUeScbxGTWNfCXvrlctiVGmh9WLmQy9C7WuKrVlAMS5/+qZrN43Qtenlc0cNcTwY1Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=MXG9z9LG; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b9382e59c0eso374839366b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 09:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1774627960; x=1775232760; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=48VlatUV+GiIhWyM6foZDkKT11onjwwumD31krhzoJ4=;
        b=MXG9z9LGIqRI8VCqFTLT8eba6EDK7pJnLN6wc0xWpkpYfveR0b25fVXMKxFVQSM47L
         aMxRKqZIypgOioSU2gD+SF+5rByWQbAH9USTvOUUBiXGLtY85ud/nWf1RDQKifElABXU
         THnYf5FhYFYfBrQRVhnBK3gXzWqUbVjkZPCrYceV6NBT/ZyANnVvrfDGA90iHEE7plhT
         RnP+mk8fwIDvO2xdVlqJSaQhcmNwLCq/dYqTu/W04naWDvHVdBEinqMt/6Yag+cowJb1
         4xoFxrziMZrkqGJ1ZNTy84wMisCAjIZ+sqQCsh6cvIyh3pARoW3r6M2znXjG6h65bSGD
         f9ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774627960; x=1775232760;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=48VlatUV+GiIhWyM6foZDkKT11onjwwumD31krhzoJ4=;
        b=Gy5UX9rNC3Te5Th+oJtKXT8/Kvqjz4ULENFOJzJknI+bJUa8ts4xL3fycFWVdhDxe+
         Ef/cDLdtd4zcmiYciAooKDN/p9jx+7PiBb58JpEd7KPDqDKYQiOXApEny1YmPMPpwwcE
         24l199KLDCvNyFqyNdjzbpEI2pWP9J+xEfS9zqQlA6SuiTZeigMWqkSXosBA/Y4QB+vQ
         pbJgp309SLQlI0ZNaT+eyhFM2tUOFf01yI3/r0wuotvuJ8tFDcHmgXBMEs7Xr99Meyqm
         3/WuPkSd1sx7th6NDAdVicwLUK0DvF0KF2EhnVd3a/n3XxcezYUGlLoIXfYRak0VQfm3
         LBJA==
X-Forwarded-Encrypted: i=1; AJvYcCVAKW3s9Od0w1ai6AnHtYpFr+Iv9P+ZEqjZtBt7Z5Lt9hEinjnM8PiKwDFYzqV3OGt2jEo2/RGcVgNN9JrB@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2JofUy2jkrXn5v920PKr1rOmJRnhSpGGgdtI/poqXN6NXZw8G
	8CPVDQKKxjbCkWgSVZLV3Oq4v69cr52XrbEStXeGkYc1bs3LLz0cPjEFW6BoHYOh2v4=
X-Gm-Gg: ATEYQzye4a9hNMWV68u4Ip1qV4fq2dOfmODFA/JT16rBUEVi4dkQcjWDpfh/eXR9f+v
	FW2czOeHVFE8kGM5g73FdzfEewbUX+qXfxCRjLCE+WbHkoUJWK225fXZIPAS/2eeW7xqgqfE2qt
	dSnPYWhRnLoT/7hVIYzTvvNDtZKW3pOO2RMX+KlmOCtAUwe6Ltz+hBInWQkdR35VtKOiS+xb755
	TwEraDn/CZTJ30OKZ9xqa5rxma7bf4JVvQBlGVIki5Z9Ic1lAL3q7kU5MS800xwXvgiL5pAQFdq
	v/uqoBPZ3c4JoTk5vRw0JKjPCTFRQsv8YKFcccl/qxl4oJ71Lvtx1wSiBQ3BNbI66SKdekxs9GH
	w6nFfMDMmjfcKUtbh+SrkM/aTQfFtAP7D8fYxWjT3oYzSASftrcqnWjhnUfgXYIP7gOqEbm92AL
	AUsno0jBq+JSYfgeVJz4C8AQgxx5KqLLpzOIUbXPxxLcRTgJgkF0O/jn3FSda2LXbrAkinxRGBf
	6Q9CA==
X-Received: by 2002:a17:906:f5a2:b0:b97:2a5:8a4d with SMTP id a640c23a62f3a-b9b507a4c29mr187926966b.26.1774627959644;
        Fri, 27 Mar 2026 09:12:39 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b20265cc0sm273518366b.15.2026.03.27.09.12.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 09:12:39 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 27 Mar 2026 17:12:27 +0100
Subject: [PATCH v2 8/9] drm/msm/dpu: Add Milos support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-milos-mdss-v2-8-bc586683f5ca@fairphone.com>
References: <20260327-milos-mdss-v2-0-bc586683f5ca@fairphone.com>
In-Reply-To: <20260327-milos-mdss-v2-0-bc586683f5ca@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Marek <jonathan@marek.ca>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Alexander Koskovich <akoskovich@pm.me>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774627949; l=12018;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=iKsxeLMALhkJyLMhTvLyLfN9d/jMx3vnocKrUpXfqKI=;
 b=T/vsj5cUTIyUBz+q1KpOW1hiA1qpYu5VrGB+gfQ9oOjH4Izzt8gb3W3MicCEne/xqWOXeogno
 EuBa6ed9FuWCLuv8qnV8mbejXBDlWCZlAPd8BS6cqFBh+nia6yAoLIK
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100374-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,marek.ca,quicinc.com,linaro.org,pm.me];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[fairphone.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fairphone.com:dkim,fairphone.com:email,fairphone.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 95A4B34760B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add definitions for the display hardware used on the Qualcomm Milos
platform.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_10_2_milos.h | 279 +++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  29 +++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
 4 files changed, 310 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_2_milos.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_2_milos.h
new file mode 100644
index 000000000000..1aa8aea4e352
--- /dev/null
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_2_milos.h
@@ -0,0 +1,279 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2022. Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2015-2018, 2020 The Linux Foundation. All rights reserved.
+ * Copyright (c) 2026, Luca Weiss <luca.weiss@fairphone.com>
+ */
+
+#ifndef _DPU_10_2_MILOS_H
+#define _DPU_10_2_MILOS_H
+
+static const struct dpu_caps milos_dpu_caps = {
+	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
+	.max_mixer_blendstages = 0x7,
+	.has_src_split = true,
+	.has_dim_layer = true,
+	.has_idle_pc = true,
+	.has_3d_merge = true,
+	.max_linewidth = 8192,
+	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
+};
+
+static const struct dpu_mdp_cfg milos_mdp = {
+	.name = "top_0",
+	.base = 0, .len = 0x494,
+	.clk_ctrls = {
+		[DPU_CLK_CTRL_REG_DMA] = { .reg_off = 0x2bc, .bit_off = 20 },
+	},
+};
+
+static const struct dpu_ctl_cfg milos_ctl[] = {
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
+	},
+};
+
+static const struct dpu_sspp_cfg milos_sspp[] = {
+	{
+		.name = "sspp_0", .id = SSPP_VIG0,
+		.base = 0x4000, .len = 0x344,
+		.features = VIG_SDM845_MASK_SDMA,
+		.sblk = &dpu_vig_sblk_qseed3_3_3,
+		.xin_id = 0,
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
+	},
+};
+
+static const struct dpu_lm_cfg milos_lm[] = {
+	{
+		.name = "lm_0", .id = LM_0,
+		.base = 0x44000, .len = 0x400,
+		.features = MIXER_MSM8998_MASK,
+		.sblk = &sdm845_lm_sblk,
+		.pingpong = PINGPONG_0,
+		.dspp = DSPP_0,
+	}, {
+		.name = "lm_2", .id = LM_2,
+		.base = 0x46000, .len = 0x400,
+		.features = MIXER_MSM8998_MASK,
+		.sblk = &sdm845_lm_sblk,
+		.lm_pair = LM_3,
+		.pingpong = PINGPONG_2,
+	}, {
+		.name = "lm_3", .id = LM_3,
+		.base = 0x47000, .len = 0x400,
+		.features = MIXER_MSM8998_MASK,
+		.sblk = &sdm845_lm_sblk,
+		.lm_pair = LM_2,
+		.pingpong = PINGPONG_3,
+	},
+};
+
+static const struct dpu_dspp_cfg milos_dspp[] = {
+	{
+		.name = "dspp_0", .id = DSPP_0,
+		.base = 0x54000, .len = 0x1800,
+		.sblk = &sdm845_dspp_sblk,
+	},
+};
+
+static const struct dpu_pingpong_cfg milos_pp[] = {
+	{
+		.name = "pingpong_0", .id = PINGPONG_0,
+		.base = 0x69000, .len = 0,
+		.sblk = &sc7280_pp_sblk,
+		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
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
+		.name = "pingpong_cwb_0", .id = PINGPONG_CWB_0,
+		.base = 0x66000, .len = 0,
+		.sblk = &sc7280_pp_sblk,
+	},
+};
+
+static const struct dpu_merge_3d_cfg milos_merge_3d[] = {
+	{
+		.name = "merge_3d_1", .id = MERGE_3D_1,
+		.base = 0x4f000, .len = 0x8,
+	},
+};
+
+/*
+ * NOTE: Each display compression engine (DCE) contains dual hard
+ * slice DSC encoders so both share same base address but with
+ * its own different sub block address.
+ */
+static const struct dpu_dsc_cfg milos_dsc[] = {
+	{
+		.name = "dce_0_0", .id = DSC_0,
+		.base = 0x80000, .len = 0x6,
+		.features = BIT(DPU_DSC_NATIVE_42x_EN),
+		.sblk = &milos_dsc_sblk_0,
+	}, {
+		.name = "dce_0_1", .id = DSC_1,
+		.base = 0x80000, .len = 0x6,
+		.features = BIT(DPU_DSC_NATIVE_42x_EN),
+		.sblk = &milos_dsc_sblk_1,
+	},
+};
+
+static const struct dpu_wb_cfg milos_wb[] = {
+	{
+		.name = "wb_2", .id = WB_2,
+		.base = 0x65000, .len = 0x2c8,
+		.features = WB_SDM845_MASK,
+		.format_list = wb2_formats_rgb_yuv,
+		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
+		.xin_id = 6,
+		.maxlinewidth = 4096,
+		.intr_wb_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 4),
+	},
+};
+
+static const struct dpu_cwb_cfg milos_cwb[] = {
+	{
+		.name = "cwb_0", .id = CWB_0,
+		.base = 0x66200, .len = 0x8,
+	},
+};
+
+static const struct dpu_intf_cfg milos_intf[] = {
+	{
+		.name = "intf_0", .id = INTF_0,
+		.base = 0x34000, .len = 0x300,
+		.type = INTF_DP,
+		.controller_id = MSM_DP_CONTROLLER_0,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25),
+	}, {
+		.name = "intf_1", .id = INTF_1,
+		.base = 0x35000, .len = 0x300,
+		.type = INTF_DSI,
+		.controller_id = MSM_DSI_CONTROLLER_0,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
+		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2),
+	}, {
+		.name = "intf_3", .id = INTF_3,
+		.base = 0x37000, .len = 0x300,
+		.type = INTF_DP,
+		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31),
+	},
+};
+
+static const struct dpu_perf_cfg milos_perf_data = {
+	.max_bw_low = 7100000,
+	.max_bw_high = 9800000,
+	.min_core_ib = 2500000,
+	.min_llcc_ib = 0,
+	.min_dram_ib = 1600000,
+	.min_prefill_lines = 40,
+	/* FIXME: lut tables */
+	.danger_lut_tbl = {0x3ffff, 0x3ffff, 0x0},
+	.safe_lut_tbl = {0xff00, 0xfff0, 0x0fff},
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
+static const struct dpu_mdss_version milos_mdss_ver = {
+	.core_major_ver = 10,
+	.core_minor_ver = 2,
+};
+
+const struct dpu_mdss_cfg dpu_milos_cfg = {
+	.mdss_ver = &milos_mdss_ver,
+	.caps = &milos_dpu_caps,
+	.mdp = &milos_mdp,
+	.cdm = &dpu_cdm_5_x,
+	.ctl_count = ARRAY_SIZE(milos_ctl),
+	.ctl = milos_ctl,
+	.sspp_count = ARRAY_SIZE(milos_sspp),
+	.sspp = milos_sspp,
+	.mixer_count = ARRAY_SIZE(milos_lm),
+	.mixer = milos_lm,
+	.dspp_count = ARRAY_SIZE(milos_dspp),
+	.dspp = milos_dspp,
+	.pingpong_count = ARRAY_SIZE(milos_pp),
+	.pingpong = milos_pp,
+	.dsc_count = ARRAY_SIZE(milos_dsc),
+	.dsc = milos_dsc,
+	.merge_3d_count = ARRAY_SIZE(milos_merge_3d),
+	.merge_3d = milos_merge_3d,
+	.wb_count = ARRAY_SIZE(milos_wb),
+	.wb = milos_wb,
+	.cwb_count = ARRAY_SIZE(milos_cwb),
+	.cwb = milos_cwb,
+	.intf_count = ARRAY_SIZE(milos_intf),
+	.intf = milos_intf,
+	.vbif = &milos_vbif,
+	.perf = &milos_perf_data,
+};
+
+#endif
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index bb4fd5fa4b22..2e10add84fd7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -454,6 +454,16 @@ static const struct dpu_dsc_sub_blks dsc_sblk_1 = {
 	.ctl = {.name = "ctl", .base = 0xF80, .len = 0x10},
 };
 
+static const struct dpu_dsc_sub_blks milos_dsc_sblk_0 = {
+	.enc = {.name = "enc", .base = 0x100, .len = 0x100},
+	.ctl = {.name = "ctl", .base = 0xF00, .len = 0x80},
+};
+
+static const struct dpu_dsc_sub_blks milos_dsc_sblk_1 = {
+	.enc = {.name = "enc", .base = 0x200, .len = 0x100},
+	.ctl = {.name = "ctl", .base = 0xF80, .len = 0x80},
+};
+
 static const struct dpu_dsc_sub_blks sm8750_dsc_sblk_0 = {
 	.enc = {.name = "enc", .base = 0x100, .len = 0x100},
 	.ctl = {.name = "ctl", .base = 0xF00, .len = 0x24},
@@ -513,6 +523,23 @@ static const struct dpu_vbif_dynamic_ot_cfg msm8998_ot_rdwr_cfg[] = {
 	},
 };
 
+static const struct dpu_vbif_cfg milos_vbif = {
+	.len = 0x1074,
+	.features = BIT(DPU_VBIF_QOS_REMAP),
+	.xin_halt_timeout = 0x4000,
+	.qos_rp_remap_size = 0x40,
+	.qos_rt_tbl = {
+		.npriority_lvl = ARRAY_SIZE(sdm845_rt_pri_lvl),
+		.priority_lvl = sdm845_rt_pri_lvl,
+		},
+	.qos_nrt_tbl = {
+		.npriority_lvl = ARRAY_SIZE(sdm845_nrt_pri_lvl),
+		.priority_lvl = sdm845_nrt_pri_lvl,
+		},
+	.memtype_count = 16,
+	.memtype = {3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3},
+};
+
 static const struct dpu_vbif_cfg msm8996_vbif = {
 	.len = 0x1040,
 	.default_ot_rd_limit = 32,
@@ -754,6 +781,8 @@ static const struct dpu_qos_lut_entry sc7180_qos_nrt[] = {
 #include "catalog/dpu_9_2_x1e80100.h"
 
 #include "catalog/dpu_10_0_sm8650.h"
+#include "catalog/dpu_10_2_milos.h"
+
 #include "catalog/dpu_12_0_sm8750.h"
 #include "catalog/dpu_12_2_glymur.h"
 #include "catalog/dpu_12_4_eliza.h"
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index ba04ac24d5a9..f45faf87333e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -766,6 +766,7 @@ struct dpu_mdss_cfg {
 extern const struct dpu_mdss_cfg dpu_eliza_cfg;
 extern const struct dpu_mdss_cfg dpu_glymur_cfg;
 extern const struct dpu_mdss_cfg dpu_kaanapali_cfg;
+extern const struct dpu_mdss_cfg dpu_milos_cfg;
 extern const struct dpu_mdss_cfg dpu_msm8917_cfg;
 extern const struct dpu_mdss_cfg dpu_msm8937_cfg;
 extern const struct dpu_mdss_cfg dpu_msm8953_cfg;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 35f7af4743d7..7c37bd51f934 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1483,6 +1483,7 @@ static const struct of_device_id dpu_dt_match[] = {
 	{ .compatible = "qcom,eliza-dpu", .data = &dpu_eliza_cfg, },
 	{ .compatible = "qcom,glymur-dpu", .data = &dpu_glymur_cfg, },
 	{ .compatible = "qcom,kaanapali-dpu", .data = &dpu_kaanapali_cfg, },
+	{ .compatible = "qcom,milos-dpu", .data = &dpu_milos_cfg, },
 	{ .compatible = "qcom,msm8917-mdp5", .data = &dpu_msm8917_cfg, },
 	{ .compatible = "qcom,msm8937-mdp5", .data = &dpu_msm8937_cfg, },
 	{ .compatible = "qcom,msm8953-mdp5", .data = &dpu_msm8953_cfg, },

-- 
2.53.0


