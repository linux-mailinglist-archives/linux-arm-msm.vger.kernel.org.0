Return-Path: <linux-arm-msm+bounces-3077-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72045802015
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 01:32:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A35641C20845
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 00:32:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14F64635;
	Sun,  3 Dec 2023 00:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N9ojhrI5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3750107
	for <linux-arm-msm@vger.kernel.org>; Sat,  2 Dec 2023 16:32:08 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-50bc053a9a7so4700809e87.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 Dec 2023 16:32:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701563527; x=1702168327; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zzawnv+H8eBQZ1f28Md0xL056czBkqWOMr7/krgRvws=;
        b=N9ojhrI5vhwuTt+LD4fQK0EDBkxdUDaLxYBHIVe/Dg5xuilYHSEiu/MrjYfA/jByIj
         4Oh0KP98lXkMDCGdiXX39jI0kaVTi6EqT2yaC+SqeoesvWWsrMRtOOFwvE/zjKHdXkb/
         DOxVm+3CsIdVbHzu9l4mKpmQcJubglRwzDEUKRLfWFBvD5768OUbkk468jmM38rFl3Br
         9utA2K5+uHeEZDtT/HtrLIpBS2TK3kOHvYyRUNteEynn3C+p95JS9WR9YuoSnFGdQX82
         STSMNkCzyYHmvxkiOi67EY2T95yusT9A9wORNBsIU6/fVDHv8mictLb02gyGDiJqlIsa
         OEAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701563527; x=1702168327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zzawnv+H8eBQZ1f28Md0xL056czBkqWOMr7/krgRvws=;
        b=DKXxEWEFsiJYJiubqD211apQufBG6YszvGPdH917OxkY3X790wRr2c8yUAUVPJy0pv
         BkQ4K/RgIJXgIgzTe3eXH1ERyRDq31dSkKXiL9Gbl8zzdR7VitFeqw7zxydN+aALZuS/
         4tqBuuTAhNP7syUwPEwordR8OHPpCMLkQA5I/j2ijoimMaAdBu/8DKaezIR9mY39dYha
         D+5/JIhxWSEC725+bWn293r77QkV1RxrOA99MdZwvmeMCY1ff2bI9jjdsX6TIDAnCuqE
         Mr7RfG6/yJGItTSW/j/dTF8R8joKPzJGZH7VxpEGxG6pyKvTpvrg2uyOUlLSuXMFj2um
         dhTg==
X-Gm-Message-State: AOJu0YzEr773EiInsyYpYYp8n/v8HIYC9NsB1ju2Nm2aMiI4PKDV9v0m
	S10OOBIBQ9F2nqxtfm4lEMbDVw==
X-Google-Smtp-Source: AGHT+IHPoMoW+IkTm8S0Mv9PnrYHKs5uHnRTWcNf/X845nTvEjQ6crWLuMR6wcSGJxcHPv8g630uIQ==
X-Received: by 2002:ac2:5f43:0:b0:50b:d764:2911 with SMTP id 3-20020ac25f43000000b0050bd7642911mr1050984lfz.169.1701563527377;
        Sat, 02 Dec 2023 16:32:07 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id i7-20020ac25b47000000b0050ba4a26fccsm422408lfp.117.2023.12.02.16.32.06
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
Subject: [RFT PATCH v2 3/4] drm/msm/dpu: enable writeback on SM6125
Date: Sun,  3 Dec 2023 03:32:02 +0300
Message-Id: <20231203003203.1293087-4-dmitry.baryshkov@linaro.org>
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
 .../drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
index cec7af6667dc..79fca229df18 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
@@ -27,6 +27,7 @@ static const struct dpu_mdp_cfg sm6125_mdp = {
 		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 		[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
 		[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
+		[DPU_CLK_CTRL_WB2] = { .reg_off = 0x2bc, .bit_off = 16 },
 	},
 };
 
@@ -139,6 +140,21 @@ static const struct dpu_pingpong_cfg sm6125_pp[] = {
 	},
 };
 
+static const struct dpu_wb_cfg sm6125_wb[] = {
+	{
+		.name = "wb_2", .id = WB_2,
+		.base = 0x65000, .len = 0x2c8,
+		.features = WB_SDM845_MASK,
+		.format_list = wb2_formats,
+		.num_formats = ARRAY_SIZE(wb2_formats),
+		.clk_ctrl = DPU_CLK_CTRL_WB2,
+		.xin_id = 6,
+		.vbif_idx = VBIF_RT,
+		.maxlinewidth = 2160,
+		.intr_wb_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 4),
+	},
+};
+
 static const struct dpu_intf_cfg sm6125_intf[] = {
 	{
 		.name = "intf_0", .id = INTF_0,
@@ -210,6 +226,8 @@ const struct dpu_mdss_cfg dpu_sm6125_cfg = {
 	.dspp = sm6125_dspp,
 	.pingpong_count = ARRAY_SIZE(sm6125_pp),
 	.pingpong = sm6125_pp,
+	.wb_count = ARRAY_SIZE(sm6125_wb),
+	.wb = sm6125_wb,
 	.intf_count = ARRAY_SIZE(sm6125_intf),
 	.intf = sm6125_intf,
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
-- 
2.39.2


