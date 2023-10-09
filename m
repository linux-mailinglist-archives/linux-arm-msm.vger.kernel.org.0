Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67CCD7BE771
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Oct 2023 19:11:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377384AbjJIRLT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Oct 2023 13:11:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377348AbjJIRLR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Oct 2023 13:11:17 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9113F94
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Oct 2023 10:11:15 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-505a62d24b9so5627308e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Oct 2023 10:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696871474; x=1697476274; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yj6njcBJvVSdEt/itrCaxDqmJfa3khgLnrpbIsNXMlQ=;
        b=oqugjzacuuCoKJZpvOrv+ZBA0hIZaA3HBlmLBz17nVv24Ue0bhbvvfVSr/giisH/xo
         VUIXzZy23PhY++971JbNllhFXnkyqSQwNYcjY+KTrwSjloCEC5Yi82g63z5RthVX36S0
         PU7F+IEUh54lxEjMCzIFfeRFZ6HjBH3MQAnb6tCNLKi0WBelHKwviV3qUDaYZ43q3edQ
         3JpJDxPKywkj5NkrqG07YmF1UKg+aFcaboGlq4u4pUjIJVbf3xUKC8auOISnykJwQoHp
         n4q2SDohqhPTHp28rusc/N4Lp6QQTPvnp8aJTAPWVTsZhAuxLLseVTNu/aEtCYU/6VpF
         v8cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696871474; x=1697476274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yj6njcBJvVSdEt/itrCaxDqmJfa3khgLnrpbIsNXMlQ=;
        b=nr95YV14xQLM4PSziihFeq0/YVAo5T1InqEjZnkmqHVCpmA2DAkCeh+Y5fnT63LFFh
         Z+Ff3jIHWFnZPr8gX8eGsMIQV0oiglIWHOQl633z1X4u+m6PO6/nRloTuXrOWbiYDso5
         qZaou5WBrMngfmR3Ib0Nlm+Zb7sb1B15B/zG8RYNwhSBTg6QWcWC0BdSOb4upbbmUy49
         5Ge1ma7rHHll54sGJI2VpPlsfHP0ssmmUG2hIYAe5t27nZ6C6gYe7/rUGjl31kkFPIAA
         gc0AOXf6S57ZXiRa4hiHRQqhoquSLDS/zYMhm1al8TSi1/n4ck8z3iS2gY4JFin0GdJJ
         FW1Q==
X-Gm-Message-State: AOJu0YzosninvAP7zkvj47OIR+81nuiT4CJ7vk/80h8/Tdc1B8qeCCyh
        08q4922cq9H+nL8p4muz41IyBQ==
X-Google-Smtp-Source: AGHT+IF6x9eUIfqM1YlOqJeCkA5+e7lU1HnygagGf6z5gj4tauD5DVNCC9HYvmV7lqMjEci6dxJsVA==
X-Received: by 2002:a19:771d:0:b0:505:6ede:20b0 with SMTP id s29-20020a19771d000000b005056ede20b0mr12446558lfc.58.1696871473848;
        Mon, 09 Oct 2023 10:11:13 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id x14-20020a19f60e000000b00502e0388846sm1475991lfe.244.2023.10.09.10.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 10:11:13 -0700 (PDT)
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
Subject: [PATCH 3/3] drm/msm/dpu: enable writeback on SM8450
Date:   Mon,  9 Oct 2023 20:11:10 +0300
Message-Id: <20231009171110.2691115-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009171110.2691115-1-dmitry.baryshkov@linaro.org>
References: <20231009171110.2691115-1-dmitry.baryshkov@linaro.org>
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
 .../drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index d0214edcbb0e..9a3d1286d160 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -32,6 +32,7 @@ static const struct dpu_mdp_cfg sm8450_mdp = {
 		[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
 		[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2bc, .bit_off = 8 },
 		[DPU_CLK_CTRL_DMA3] = { .reg_off = 0x2c4, .bit_off = 8 },
+		[DPU_CLK_CTRL_WB2] = { .reg_off = 0x2bc, .bit_off = 16 },
 		[DPU_CLK_CTRL_REG_DMA] = { .reg_off = 0x2bc, .bit_off = 20 },
 	},
 };
@@ -326,6 +327,21 @@ static const struct dpu_dsc_cfg sm8450_dsc[] = {
 	},
 };
 
+static const struct dpu_wb_cfg sm8450_wb[] = {
+	{
+		.name = "wb_2", .id = WB_2,
+		.base = 0x65000, .len = 0x2c8,
+		.features = WB_SM8250_MASK,
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
 static const struct dpu_intf_cfg sm8450_intf[] = {
 	{
 		.name = "intf_0", .id = INTF_0,
@@ -423,6 +439,8 @@ const struct dpu_mdss_cfg dpu_sm8450_cfg = {
 	.dsc = sm8450_dsc,
 	.merge_3d_count = ARRAY_SIZE(sm8450_merge_3d),
 	.merge_3d = sm8450_merge_3d,
+	.wb_count = ARRAY_SIZE(sm8450_wb),
+	.wb = sm8450_wb,
 	.intf_count = ARRAY_SIZE(sm8450_intf),
 	.intf = sm8450_intf,
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
-- 
2.39.2

