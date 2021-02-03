Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D537330D93D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Feb 2021 12:56:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234296AbhBCLzI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Feb 2021 06:55:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234210AbhBCLzG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Feb 2021 06:55:06 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77449C06178A
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 Feb 2021 03:54:04 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id 7so23922848wrz.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Feb 2021 03:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Jf1oKzKtxHAKQjrR3pGFqCZX0fsUjZbCoIA88THXekk=;
        b=Shk0cV6btl9gr5pEyJZtgYebo+d5vN5RwINBxKhE7wmLymPrvjDAKRhnqQ6wHZybeb
         +NrWJuMCuAGgcMLMRIhYk0ViYNLprGtVxyAvHS+PPbWJds5Ki2O7YVmqCSK4en/Vq7Xo
         ZQkf2QRAbL8R2D9Dakvtbtx56cDg/Qx3dZFpB4mO85tEHe6DxcHDqJ/vUvv+Z5/awBLQ
         LmHWx/zKMSHJSoI5aM4lZHOVJzpKRrtZfcgIeaiuCXvlqkEcY4/i2UIoZGJrc0bUFHSQ
         FCmi4W7WZT/Ja+ZHhFmgiVXldusxX502U7YYl4CCqLy+53zSjPXtqXEaZhIJ0GjdJMbz
         HesA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Jf1oKzKtxHAKQjrR3pGFqCZX0fsUjZbCoIA88THXekk=;
        b=rPtglGzc+nS9LXTVH7vpyBKDzup/3A6akdjACJdMlwA0D3ZVx3/Fat/8BpSv/xFBgi
         xHFJHz/oPvKKQ7BegF/zcz63y+Tm4xJ7ojWceJcKn6mQvNCZemL/+HjDR/62Y4xWq2oR
         tPmla7dtIqST4b42e8Cl6ZGe+WH7kT13+kgs3HwzKLShg8O050w4Yb7Xt5IImy9UMUsW
         bFrhpLQ/Fk5yRoNUQJjco4VZC1U4K2cbUUf7NSlk+7EFPeXyka1qpLrfGxSGcqZHRCb3
         WUNUhHTvR3HMtf0me6VNTAL34fRM5WLWV/ahdV8u+aMyXeufjSEMcmGhrGcOwnygI8oA
         2xvA==
X-Gm-Message-State: AOAM530LRWDLo5X50UF1be4bq/TWCIMQgZhpNzjTGhnj3+VY6t+UjTYt
        HUYqaUhRupVWBQUZrHl3VWJQWUuaXtGB8Q==
X-Google-Smtp-Source: ABdhPJyHSSkRWTMSPrSItAmTMJjB8yCJKvK6Do48JrGtA7VjTEVlfcZWmuMEM1BlJHeyIcJO/1Qnng==
X-Received: by 2002:adf:f8c1:: with SMTP id f1mr3110968wrq.76.1612353243293;
        Wed, 03 Feb 2021 03:54:03 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id 35sm3687362wrn.42.2021.02.03.03.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Feb 2021 03:54:02 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org, agross@kernel.org
Cc:     bryan.odonoghue@linaro.org, jonathan@marek.ca,
        dikshita@codeaurora.org, dmitry.baryshkov@linaro.org,
        stanimir.varbanov@linaro.org
Subject: [PATCH 2/4] clk: qcom: videocc: Add sm8250 VIDEO_CC_MVS0_DIV_CLK_SRC
Date:   Wed,  3 Feb 2021 11:54:54 +0000
Message-Id: <20210203115456.1072975-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210203115456.1072975-1-bryan.odonoghue@linaro.org>
References: <20210203115456.1072975-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch adds the missing video_cc_mvs0_div_clk_src entry to
videocc-sm8250 replicating in upstream the explicit entry for this clock in
downstream.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/clk/qcom/videocc-sm8250.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/clk/qcom/videocc-sm8250.c b/drivers/clk/qcom/videocc-sm8250.c
index 2797c61f5938..cc84963ced40 100644
--- a/drivers/clk/qcom/videocc-sm8250.c
+++ b/drivers/clk/qcom/videocc-sm8250.c
@@ -169,6 +169,21 @@ static struct clk_regmap_div video_cc_mvs0c_div2_div_clk_src = {
 	},
 };
 
+static struct clk_regmap_div video_cc_mvs0_div_clk_src = {
+	.reg = 0xd54,
+	.shift = 0,
+	.width = 2,
+	.clkr.hw.init = &(struct clk_init_data) {
+		.name = "video_cc_mvs0_div_clk_src",
+		.parent_data = &(const struct clk_parent_data){
+			.hw = &video_cc_mvs0_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
 static struct clk_regmap_div video_cc_mvs1c_div2_div_clk_src = {
 	.reg = 0xcf4,
 	.shift = 0,
@@ -276,6 +291,7 @@ static struct gdsc mvs1_gdsc = {
 
 static struct clk_regmap *video_cc_sm8250_clocks[] = {
 	[VIDEO_CC_MVS0_CLK_SRC] = &video_cc_mvs0_clk_src.clkr,
+	[VIDEO_CC_MVS0_DIV_CLK_SRC] = &video_cc_mvs0_div_clk_src.clkr,
 	[VIDEO_CC_MVS0C_CLK] = &video_cc_mvs0c_clk.clkr,
 	[VIDEO_CC_MVS0C_DIV2_DIV_CLK_SRC] = &video_cc_mvs0c_div2_div_clk_src.clkr,
 	[VIDEO_CC_MVS1_CLK_SRC] = &video_cc_mvs1_clk_src.clkr,
-- 
2.29.2

