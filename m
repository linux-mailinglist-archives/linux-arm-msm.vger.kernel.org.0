Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2305F30F7D0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Feb 2021 17:30:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237103AbhBDQ1F (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Feb 2021 11:27:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237078AbhBDPBx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Feb 2021 10:01:53 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A730EC0617AA
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 Feb 2021 07:00:11 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id c4so3835063wru.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Feb 2021 07:00:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=g/PBuY8B4LXNYC34z8jQVbK8y5NFUz4tvBI8DdIY53A=;
        b=M9BCIDzcktZjQecTpiVhGDYOkUGUHa/rmdy2ilwUXyNji5zUInq9f2kxQO3n8NumnJ
         Pnh5bwYj8Q/5dVQvWkY/0WG7hWPm+xDy4yrfTAo7YCH/8xvVd9Ejf40bKqR39jqq/uwr
         pd87GC5wyEme21xX0DANlh3sZOi1r+NS+B1OMfP8ovTZhXr/t8bXBKpJqCApO9ws3tp3
         KsZAmItJUURxLox3vo9QtxiU/1jc6E6w1F7jHw7N0IutFc0Zd7ZsbEHXI63YahVyTuqs
         bUS6joHC9mEVmozx+aetuQBV/adxpvt9oqGsxHhXVz4oaZ1JCuS8HWV/r7y5pq2Q6fDo
         b4IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=g/PBuY8B4LXNYC34z8jQVbK8y5NFUz4tvBI8DdIY53A=;
        b=qWx1P8/vwDrX4NwCCq+y8VlMPScXBJYocrM3+2OBAehDKXkdl4O9syVQn/zB3l3LT6
         nVDN8253A7/Nul5c+4qPW/FluU0A/8eUbPzKOKTevjEStezbMz8wcz/pUHeeHcP+tv7F
         UaJBTi81MwlXtZrsAknujdw8sMX6cKfBWhqWCLzU6T1NohlVDy10CFNSOpTTE89HHk+R
         EIdhhDncc7/gaasug1WPVxTYzd2FhsXjlywDBkyqAahHA2kT+nQ+AKpc8xj3mRHdkpyJ
         GY+sDKBvUz3i6t16XuiURoMnoATW4KB5tryPYjPiGgcCuocV+gbOnQB1HOdbQ2Y7VwMi
         uNMw==
X-Gm-Message-State: AOAM5338sIyOUwlpZo1oSwTVwdPX2fsp53ym+7DLh1LITwBvEzIOLooX
        HVckD/HVvY8Nm96x6IQMBJt6DQ==
X-Google-Smtp-Source: ABdhPJyANz9+onWs56zbNEa8fiYd8RlFkVZ7GbhoMud5mHLN3TMDIvOySStd+OGB1xGnTX47kyFTuw==
X-Received: by 2002:a5d:44cc:: with SMTP id z12mr9703806wrr.7.1612450810456;
        Thu, 04 Feb 2021 07:00:10 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id c11sm8312664wrs.28.2021.02.04.07.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Feb 2021 07:00:09 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org, agross@kernel.org
Cc:     bryan.odonoghue@linaro.org, jonathan@marek.ca,
        dikshita@codeaurora.org, dmitry.baryshkov@linaro.org,
        stanimir.varbanov@linaro.org
Subject: [PATCH v2 3/4] clk: qcom: videocc: Add sm8250 VIDEO_CC_MVS0_CLK
Date:   Thu,  4 Feb 2021 15:01:19 +0000
Message-Id: <20210204150120.1521959-4-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210204150120.1521959-1-bryan.odonoghue@linaro.org>
References: <20210204150120.1521959-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch adds the missing video_cc_mvs0_clk entry to
videocc-sm8250 replicating in upstream the explicit entry for this clock in
downstream.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/videocc-sm8250.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/clk/qcom/videocc-sm8250.c b/drivers/clk/qcom/videocc-sm8250.c
index cc84963ced40..3ade240bd49c 100644
--- a/drivers/clk/qcom/videocc-sm8250.c
+++ b/drivers/clk/qcom/videocc-sm8250.c
@@ -217,6 +217,24 @@ static struct clk_branch video_cc_mvs0c_clk = {
 	},
 };
 
+static struct clk_branch video_cc_mvs0_clk = {
+	.halt_reg = 0xd34,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0xd34,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "video_cc_mvs0_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &video_cc_mvs0_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct clk_branch video_cc_mvs1_div2_clk = {
 	.halt_reg = 0xdf4,
 	.halt_check = BRANCH_HALT_VOTED,
@@ -290,6 +308,7 @@ static struct gdsc mvs1_gdsc = {
 };
 
 static struct clk_regmap *video_cc_sm8250_clocks[] = {
+	[VIDEO_CC_MVS0_CLK] = &video_cc_mvs0_clk.clkr,
 	[VIDEO_CC_MVS0_CLK_SRC] = &video_cc_mvs0_clk_src.clkr,
 	[VIDEO_CC_MVS0_DIV_CLK_SRC] = &video_cc_mvs0_div_clk_src.clkr,
 	[VIDEO_CC_MVS0C_CLK] = &video_cc_mvs0c_clk.clkr,
-- 
2.29.2

