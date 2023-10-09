Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C9827BE78B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Oct 2023 19:18:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376935AbjJIRSH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Oct 2023 13:18:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377403AbjJIRSG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Oct 2023 13:18:06 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C051CF
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Oct 2023 10:18:05 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2bff936e10fso69587401fa.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Oct 2023 10:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696871883; x=1697476683; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oNuBdgTqnLvsaFXnef7V2YyQGajnGwk3qDz3SFukOEs=;
        b=N39+Zw6jTefNiwREjt6JbW4X3sycwahn5VFS884uz1VX1xQHa4O6gqqYjqGJ30ACHy
         ScgsRPv/0muv+JEMQQ9PYO7ROMKSxAeGllpCe0pyOjbapkPGonLe2nFcvYNt0PZngJu0
         q+/5puBCnSxixvzKQztZujaf4yEeRi+GG8U5517iFQaSYVCQmT+Zyc3s2lIJAvdPDAnR
         rQtgCrN0dc/4ZU4NerQW5R0tkomRGO0wze8/xwX8me6hy3CWgtPWl72/XJowEmzQduAc
         I8mQ5PWg6TfRM85gP7kIAESxKvjM5WSLN5nL4Y1exfzCxUBgrU7dbtPHkzV+OPCHH0M+
         8qGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696871883; x=1697476683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oNuBdgTqnLvsaFXnef7V2YyQGajnGwk3qDz3SFukOEs=;
        b=Vm9iyc1VBvd4HlB1b8ArVub0VrMqOiUis6f/SW7VzmNanTb9HUC1T9sovQPsJZvwKn
         j4K82aZ7a8ZiYYTgLsRGly14Dr0+hJpPSR1YiZXQbJTCbbk4HkXxMvsZDSybJ8fFBomv
         thOZS+msTsySiNi83dwhfTgXYG2h34zEjNZk/kz+AD8FRjvYXTeH8K5FkAaz81Tse41i
         kUz2cM4D0CVBLzTVnYGcnV560p9ehY2uVD3E/sslT4y47g4waU1kKq/iRyEoOm0XMV4O
         lBhtyxoLoHHRGZtSlzn9Tvwi5TGef/btVnLDoTGg/QpL2KjNBE+lKSsZ/ah7VN7ibLF/
         uu0g==
X-Gm-Message-State: AOJu0Yyj6az0YItN5j7NydK2eV26nhhDQ2OQ7H8YzVWZOExGETLJ4XdJ
        XhdUj7b4KKrzXi/Ww2JXv2SOSA==
X-Google-Smtp-Source: AGHT+IFqUXB62QSOWQHg8DjJu6B8zTraugdCMY3Fw7pHyqr58gvCtWcGEMFyMnrJ1920E4eblAq6CQ==
X-Received: by 2002:a05:651c:1699:b0:2c1:6d1c:2cef with SMTP id bd25-20020a05651c169900b002c16d1c2cefmr10009637ljb.14.1696871882713;
        Mon, 09 Oct 2023 10:18:02 -0700 (PDT)
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
Subject: [RFT PATCH 2/4] drm/msm/dpu: enable writeback on SC8108X
Date:   Mon,  9 Oct 2023 20:17:58 +0300
Message-Id: <20231009171800.2691247-3-dmitry.baryshkov@linaro.org>
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
 .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index f3de21025ca7..1631a121e471 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -34,6 +34,7 @@ static const struct dpu_mdp_cfg sc8180x_mdp = {
 		[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
 		[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2bc, .bit_off = 8 },
 		[DPU_CLK_CTRL_DMA3] = { .reg_off = 0x2c4, .bit_off = 8 },
+		[DPU_CLK_CTRL_WB2] = { .reg_off = 0x3b8, .bit_off = 24 },
 	},
 };
 
@@ -304,6 +305,21 @@ static const struct dpu_dsc_cfg sc8180x_dsc[] = {
 	},
 };
 
+static const struct dpu_wb_cfg sc8180x_wb[] = {
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
 static const struct dpu_intf_cfg sc8180x_intf[] = {
 	{
 		.name = "intf_0", .id = INTF_0,
@@ -420,6 +436,8 @@ const struct dpu_mdss_cfg dpu_sc8180x_cfg = {
 	.pingpong = sc8180x_pp,
 	.merge_3d_count = ARRAY_SIZE(sc8180x_merge_3d),
 	.merge_3d = sc8180x_merge_3d,
+	.wb_count = ARRAY_SIZE(sc8180x_wb),
+	.wb = sc8180x_wb,
 	.intf_count = ARRAY_SIZE(sc8180x_intf),
 	.intf = sc8180x_intf,
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
-- 
2.39.2

