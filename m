Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8DC6E7BE78F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Oct 2023 19:18:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377403AbjJIRSJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Oct 2023 13:18:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377410AbjJIRSH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Oct 2023 13:18:07 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C3F194
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Oct 2023 10:18:05 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2c1807f3400so58406561fa.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Oct 2023 10:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696871883; x=1697476683; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D+M8hrUb+u/XzpJ6qoH9Pb/8miMIjbd1ZgpYuYEGZ78=;
        b=F1iaRuQLEhWHTvyZH/fD30yCM8rFxPbHcgqEVICRoSSD6UGfNYlDW5eBagCfYtekp9
         +KcZd6tb+AQof3NHo5vRlumeuvTtNQ87ofBYE4RsmOIXpMHptQM3ceLjqXn1fXeuAPAA
         +pY053bgTi1wiSNzteIZeFUN3GlpgulHo2psZCd3Zvm6V+ljqadolx7mv+zvPZcyvCqQ
         JM9a21ggamHzWbXJgTSPVlGcA3tva4wIcXuJf5y48pAdcLSY2OtiCQIT2ndhp8DlGKIi
         HcyMQ+/ypvG8DgLn6NdcuWl7Y01L2vFm7WlWkr1wj7sr5b9RuN90BPZ9yGG704Ssu8Om
         KuAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696871883; x=1697476683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D+M8hrUb+u/XzpJ6qoH9Pb/8miMIjbd1ZgpYuYEGZ78=;
        b=qEJjQUs20dQXPI6YvsLOZIRw0OYyvkWkkVXV+ETRBYHtsM46z4YQVoqnNJD9I9rwW3
         u48yjJrZkoaAoacSS/G4ed7gZFDNJaAmGVN15NECCpAK3B1EgVQinqFknSFaqaou92tw
         fBH2jrx+bTH0CP9H4KkX3YBWppK/UCQe+FuDAFNFwAhngoO/309NOdsK2/hdbzGXceOz
         hie2RB4bDcOj442qnHoDPAAYhYll2C5oeohpZo+1Xds7PFe/SF5hb+rLuUrLYi7YTyDu
         N2WD8dQADkBlndNl5x6rfx4hrr6xxMSQA8p5FqOrtu+1dVslrsZcUrh98Fx2P2UDauoG
         QZEg==
X-Gm-Message-State: AOJu0YxU10uBj6+YCW1sNPKhpFhHcs5XWmNXLe1NDk4JjrcfY+n0iuWn
        7nNRVNw+tOWzoY3fZnjoDiGxBQ==
X-Google-Smtp-Source: AGHT+IH1NT1m/e250wIAJtsyFe63IKbaoF3hiLBrzHBN/C99UBBxtv+az0vLuWUjD65N5IK+mHt18Q==
X-Received: by 2002:a2e:b4b3:0:b0:2c1:86da:3f61 with SMTP id q19-20020a2eb4b3000000b002c186da3f61mr9085547ljm.9.1696871883614;
        Mon, 09 Oct 2023 10:18:03 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id p18-20020a2e7412000000b002bcd2653872sm2088284ljc.30.2023.10.09.10.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 10:18:02 -0700 (PDT)
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
Subject: [RFT PATCH 3/4] drm/msm/dpu: enable writeback on SM6125
Date:   Mon,  9 Oct 2023 20:17:59 +0300
Message-Id: <20231009171800.2691247-4-dmitry.baryshkov@linaro.org>
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
 .../drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
index 2491eed10039..c1b31a063a6f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
@@ -27,6 +27,7 @@ static const struct dpu_mdp_cfg sm6125_mdp = {
 		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 		[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
 		[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
+		[DPU_CLK_CTRL_WB2] = { .reg_off = 0x3b8, .bit_off = 24 },
 	},
 };
 
@@ -141,6 +142,21 @@ static const struct dpu_pingpong_cfg sm6125_pp[] = {
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
@@ -213,6 +229,8 @@ const struct dpu_mdss_cfg dpu_sm6125_cfg = {
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

