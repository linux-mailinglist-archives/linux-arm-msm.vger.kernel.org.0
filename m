Return-Path: <linux-arm-msm+bounces-3078-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AFD2802018
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 01:32:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B6649281009
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 00:32:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9419E7F0;
	Sun,  3 Dec 2023 00:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ue+uWrUU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA888114
	for <linux-arm-msm@vger.kernel.org>; Sat,  2 Dec 2023 16:32:09 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-50be8ced3ddso785073e87.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 Dec 2023 16:32:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701563528; x=1702168328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dUi6QKN0qZ859wsIOcquZfetN1GsdPLuB9ODzPF+Xac=;
        b=ue+uWrUUqFpvcfNHOcAj5vMvor68/SGkq1fKMaqD1GZwQTrvia5Hj/Bi5yxsR7E/q5
         urC2j/9siCoCu2ZAmWtD2anJ+Hr5wdNSg8fNloxQVJbmKpbU53kS1GjifhAWe3OV+0dG
         qvTGnAiP+oX++Lq8W8oXJ9QML1uzTAfbXjpMj00Xu/ALdECE70NvKsuVNF25ZzTa+puT
         EyeHG++4YdtogpnJRnBVfvmQq4+wH6FfX0eJDRAoAj2hlAq+M2luSBuC25uogNLQ9fml
         8d2rGkbVVHSr6FSqTcxCERhkvk+qiGUZOHUpKKKt+IN0Ai3xfVEwvOTRpzOU/fJfi+F7
         2KZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701563528; x=1702168328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dUi6QKN0qZ859wsIOcquZfetN1GsdPLuB9ODzPF+Xac=;
        b=mZxNApLHF9/4+D/Ac9QZK0w0JMJ5ukGnEewndM+HlYv9ndHdPdnxEOI3XObx8jNaem
         Xsta7CgXv8rxgHHuoXVygJiJILlAHJa666v41HqHMrlNlBBPZPCxmtbir5GeDJgVl3Do
         132ihz1a/ChqlOQEfEnhQe47vz+VLPx+NaVxJC4fd9JeKK9h9+Ql/kbgjssuERdBjdef
         JP7q01bULpq2xb+f9RD/seXxQUztgHERevpNmrNzGQZvQrGj9rRmjBT5I8tix3baJljX
         T40J9L1c7PBSfQf0F794Ly2JtRAzi5B09nTKlWESAieok/hGxjZe5oPMwaNfUKBeRRjW
         DCDA==
X-Gm-Message-State: AOJu0Yw4QDzg1wd+1E4W2Q/e27bpCzFO6/X/ODFwZZo8BZuQEaV4VeNS
	/2SD581NFV0oBITnzvLo3DXLyg==
X-Google-Smtp-Source: AGHT+IH4cg6wWyl23jyswquCXROqmqiFTtHeAnCuqWAXJ5nyGZhx7Jin+V/SbzHLIknUTdUjGeImvA==
X-Received: by 2002:a05:6512:3109:b0:50b:f113:2cf8 with SMTP id n9-20020a056512310900b0050bf1132cf8mr116309lfb.118.1701563528124;
        Sat, 02 Dec 2023 16:32:08 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id i7-20020ac25b47000000b0050ba4a26fccsm422408lfp.117.2023.12.02.16.32.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Dec 2023 16:32:07 -0800 (PST)
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
Subject: [RFT PATCH v2 4/4] drm/msm/dpu: enable writeback on SM6350
Date: Sun,  3 Dec 2023 03:32:03 +0300
Message-Id: <20231203003203.1293087-5-dmitry.baryshkov@linaro.org>
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
 .../drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
index 62db84bd15f2..3c179a73c030 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
@@ -27,6 +27,7 @@ static const struct dpu_mdp_cfg sm6350_mdp = {
 		[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
 		[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
 		[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2c4, .bit_off = 8 },
+		[DPU_CLK_CTRL_WB2] = { .reg_off = 0x2bc, .bit_off = 16 },
 		[DPU_CLK_CTRL_REG_DMA] = { .reg_off = 0x2bc, .bit_off = 20 },
 	},
 };
@@ -146,6 +147,21 @@ static const struct dpu_dsc_cfg sm6350_dsc[] = {
 	},
 };
 
+static const struct dpu_wb_cfg sm6350_wb[] = {
+	{
+		.name = "wb_2", .id = WB_2,
+		.base = 0x65000, .len = 0x2c8,
+		.features = WB_SM8250_MASK,
+		.format_list = wb2_formats,
+		.num_formats = ARRAY_SIZE(wb2_formats),
+		.clk_ctrl = DPU_CLK_CTRL_WB2,
+		.xin_id = 6,
+		.vbif_idx = VBIF_RT,
+		.maxlinewidth = 1920,
+		.intr_wb_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 4),
+	},
+};
+
 static const struct dpu_intf_cfg sm6350_intf[] = {
 	{
 		.name = "intf_0", .id = INTF_0,
@@ -219,6 +235,8 @@ const struct dpu_mdss_cfg dpu_sm6350_cfg = {
 	.dsc = sm6350_dsc,
 	.pingpong_count = ARRAY_SIZE(sm6350_pp),
 	.pingpong = sm6350_pp,
+	.wb_count = ARRAY_SIZE(sm6350_wb),
+	.wb = sm6350_wb,
 	.intf_count = ARRAY_SIZE(sm6350_intf),
 	.intf = sm6350_intf,
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
-- 
2.39.2


