Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84CC07BE78C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Oct 2023 19:18:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377414AbjJIRSI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Oct 2023 13:18:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376797AbjJIRSH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Oct 2023 13:18:07 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3EA8B9
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Oct 2023 10:18:05 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2c186ea81c7so60628001fa.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Oct 2023 10:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696871884; x=1697476684; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CEblOIocXlow3cb9XQyMsSKR9zDBhqpUmKljUztzkSU=;
        b=g+su7kyhAUFKbA/K4+QgokTkuDJfn9el3AQ22PU48K+31qP85RHAC3lSqDuarTVoLc
         Q7VZAROETRfp8XdI/1bXFxwKyV6mcj57RuqzEXcP8M69NwgSwBNGhAl8azg/AlnIkZoY
         ZWT6BSxmc6DUSDdeTRb9KW4GyA24oHD4lrRrdXjMFqcb96X8fK5HvPM4zvSaoPdsSpwo
         0+pNO45M5cJoo0OL3R/+CM4xf5+hLFDinRaurq9Wyf1KLLmzHbRQsrg3Q22Pt7SqEjQZ
         kcI8u/3mSYnWzIvbOnDe1sTvynC1CHbnXXRQGxRP38vY1coCPfzYtKesFFnJkweyQbgv
         YTEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696871884; x=1697476684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CEblOIocXlow3cb9XQyMsSKR9zDBhqpUmKljUztzkSU=;
        b=G8ax1X1JvwDJW0xMaZiTLdCXNdaiYxHpw3ibNCzajPJFMe35LrPE90e+jPyARbwXIm
         UNj7rtf0PL6zLwbz+l+ICjTRFHaSWxO2Z5oOS1B0jM9FI3h/IG4soRh0HblKc/s9r797
         +OPR1uYZj7HabIzm0dQaBn7MBPxNyQIEp456afS6cX4tst1BJncLbGNcwyjrTxKVYedV
         GyJ1EnG2tJoExBmOehc6S1NfF9rbpg+N89sd+v67taxzMpM7NHtKccNr0imZutoJdl3+
         siNEMU/XRPYqOEShNH5GC5sRcjR5cLULc7v+U95ShjD1mvMwBe0ddT0LdZWDNQDgsT/+
         L55w==
X-Gm-Message-State: AOJu0YwLKXlxaomjAfQ8H1X8sx7rAdfb6EIc42tkBV5ifV0DSMMXNoMz
        BsZ8173vQv067mw3IPxHcfGz1w==
X-Google-Smtp-Source: AGHT+IG4RdCPzZlKt6l4Watu6D2W7vlq+2/tsr/8tE/NcaZWsglRlppVXo11VIt0pfqpBekhWpNfEA==
X-Received: by 2002:a05:651c:87:b0:2c0:a2:77d7 with SMTP id 7-20020a05651c008700b002c000a277d7mr13038278ljq.24.1696871884288;
        Mon, 09 Oct 2023 10:18:04 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id p18-20020a2e7412000000b002bcd2653872sm2088284ljc.30.2023.10.09.10.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 10:18:03 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [RFT PATCH 4/4] drm/msm/dpu: enable writeback on SM6350
Date:   Mon,  9 Oct 2023 20:18:00 +0300
Message-Id: <20231009171800.2691247-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009171800.2691247-1-dmitry.baryshkov@linaro.org>
References: <20231009171800.2691247-1-dmitry.baryshkov@linaro.org>
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

Enable WB2 hardware block, enabling writeback support on this platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
index cf5db6f296bd..206ee16acb86 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
@@ -27,6 +27,7 @@ static const struct dpu_mdp_cfg sm6350_mdp = {
 		[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
 		[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
 		[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2c4, .bit_off = 8 },
+		[DPU_CLK_CTRL_WB2] = { .reg_off = 0x3b8, .bit_off = 24 },
 		[DPU_CLK_CTRL_REG_DMA] = { .reg_off = 0x2bc, .bit_off = 20 },
 	},
 };
@@ -148,6 +149,21 @@ static const struct dpu_dsc_cfg sm6350_dsc[] = {
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
@@ -222,6 +238,8 @@ const struct dpu_mdss_cfg dpu_sm6350_cfg = {
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

