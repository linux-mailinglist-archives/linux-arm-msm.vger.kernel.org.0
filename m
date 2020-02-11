Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF011158E23
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2020 13:14:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727960AbgBKMO2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Feb 2020 07:14:28 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:15495 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727911AbgBKMO2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Feb 2020 07:14:28 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1581423267; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=u1q5C/3e5zHh/x52XPH51N6g1G9jstuQCCgJKVOicgY=; b=PP2l1s3L1ZxWuILZbwINjoONJQaPz4zoR+f2EwhsP0+i8XVifdo2BOiRcYeBq4yUw9M6q9D1
 9EOnTDU6nD3cLimboJx/cLq2vyFMrG+kd6Md+QJ5rY3cd4IteC9Far5Dj2jKHDgZfoEfXXh0
 cSQAGBjgB6Q8htyOCVETsb73r/o=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e429a9e.7f5331baa378-smtp-out-n03;
 Tue, 11 Feb 2020 12:14:22 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B42E8C4479D; Tue, 11 Feb 2020 12:14:22 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from tdas-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A51A4C43383;
        Tue, 11 Feb 2020 12:14:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A51A4C43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
From:   Taniya Das <tdas@codeaurora.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Michael=20Turquette=20=C2=A0?= <mturquette@baylibre.com>,
        robh@kernel.org
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh+dt@kernel.org, Doug Anderson <dianders@chromium.org>,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v1 2/2] clk: qcom: dispcc: Remove support of disp_cc_mdss_rscc_ahb_clk
Date:   Tue, 11 Feb 2020 17:43:56 +0530
Message-Id: <1581423236-21341-2-git-send-email-tdas@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1581423236-21341-1-git-send-email-tdas@codeaurora.org>
References: <1581423236-21341-1-git-send-email-tdas@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The disp_cc_mdss_rscc_ahb_clk is default enabled from hardware and thus
does not require to be marked CRITICAL. This which would allow the RCG to
be turned OFF when the display turns OFF and not blocking XO.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
---
 drivers/clk/qcom/dispcc-sc7180.c | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sc7180.c b/drivers/clk/qcom/dispcc-sc7180.c
index dd7af41..0a5d395 100644
--- a/drivers/clk/qcom/dispcc-sc7180.c
+++ b/drivers/clk/qcom/dispcc-sc7180.c
@@ -592,24 +592,6 @@ static struct clk_branch disp_cc_mdss_rot_clk = {
 	},
 };

-static struct clk_branch disp_cc_mdss_rscc_ahb_clk = {
-	.halt_reg = 0x400c,
-	.halt_check = BRANCH_HALT,
-	.clkr = {
-		.enable_reg = 0x400c,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "disp_cc_mdss_rscc_ahb_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &disp_cc_mdss_ahb_clk_src.clkr.hw,
-			},
-			.num_parents = 1,
-			.flags = CLK_IS_CRITICAL | CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
 static struct clk_branch disp_cc_mdss_rscc_vsync_clk = {
 	.halt_reg = 0x4008,
 	.halt_check = BRANCH_HALT,
@@ -687,7 +669,6 @@ static struct clk_regmap *disp_cc_sc7180_clocks[] = {
 	[DISP_CC_MDSS_PCLK0_CLK_SRC] = &disp_cc_mdss_pclk0_clk_src.clkr,
 	[DISP_CC_MDSS_ROT_CLK] = &disp_cc_mdss_rot_clk.clkr,
 	[DISP_CC_MDSS_ROT_CLK_SRC] = &disp_cc_mdss_rot_clk_src.clkr,
-	[DISP_CC_MDSS_RSCC_AHB_CLK] = &disp_cc_mdss_rscc_ahb_clk.clkr,
 	[DISP_CC_MDSS_RSCC_VSYNC_CLK] = &disp_cc_mdss_rscc_vsync_clk.clkr,
 	[DISP_CC_MDSS_VSYNC_CLK] = &disp_cc_mdss_vsync_clk.clkr,
 	[DISP_CC_MDSS_VSYNC_CLK_SRC] = &disp_cc_mdss_vsync_clk_src.clkr,
--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.
