Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A17461D6743
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2020 12:04:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727972AbgEQKEy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 17 May 2020 06:04:54 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:55194 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727835AbgEQKEy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 17 May 2020 06:04:54 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589709894; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=NBN8cU+DkjD31J6jihD5B1XeCzYpePF0KQOB8xoQNVs=; b=LXKxsYRtcejnwvhL14oXI9vtYOTS+1sDp0QGII/6VKuHLZ0AX0qWqVsqvZ2UdK1beootPuWO
 Iot1wy3vgmyS1gCD303YU9TnsWy5xf8cjSdlzK+u2ayFYno2h6aQQ+5/lZfDQ4kDA7XfhtGr
 hTb9tgQJlsvoOO0110wo1PlzzZI=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ec10c3c.7f19b9ce1b58-smtp-out-n04;
 Sun, 17 May 2020 10:04:44 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3AAC2C4478F; Sun, 17 May 2020 10:04:44 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from tdas-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5E0A9C433D2;
        Sun, 17 May 2020 10:04:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5E0A9C433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
From:   Taniya Das <tdas@codeaurora.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Michael=20Turquette=20=C2=A0?= <mturquette@baylibre.com>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v2 3/3] clk: qcom: gcc: Add support for Secure control source clock
Date:   Sun, 17 May 2020 15:34:21 +0530
Message-Id: <1589709861-27580-4-git-send-email-tdas@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1589709861-27580-1-git-send-email-tdas@codeaurora.org>
References: <1589709861-27580-1-git-send-email-tdas@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The secure controller driver requires to request for various frequencies
on the source clock, thus add support for the same.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
---
 drivers/clk/qcom/gcc-sc7180.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/clk/qcom/gcc-sc7180.c b/drivers/clk/qcom/gcc-sc7180.c
index 7338052..ca4383e 100644
--- a/drivers/clk/qcom/gcc-sc7180.c
+++ b/drivers/clk/qcom/gcc-sc7180.c
@@ -817,6 +817,26 @@ static struct clk_rcg2 gcc_usb3_prim_phy_aux_clk_src = {
 	},
 };
 
+static const struct freq_tbl ftbl_gcc_sec_ctrl_clk_src[] = {
+	F(4800000, P_BI_TCXO, 4, 0, 0),
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_sec_ctrl_clk_src = {
+	.cmd_rcgr = 0x3d030,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_3,
+	.freq_tbl = ftbl_gcc_sec_ctrl_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gcc_sec_ctrl_clk_src",
+		.parent_data = gcc_parent_data_3,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_3),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
 static struct clk_branch gcc_aggre_ufs_phy_axi_clk = {
 	.halt_reg = 0x82024,
 	.halt_check = BRANCH_HALT_DELAY,
@@ -2407,6 +2427,7 @@ static struct clk_regmap *gcc_sc7180_clocks[] = {
 	[GCC_MSS_NAV_AXI_CLK] = &gcc_mss_nav_axi_clk.clkr,
 	[GCC_MSS_Q6_MEMNOC_AXI_CLK] = &gcc_mss_q6_memnoc_axi_clk.clkr,
 	[GCC_MSS_SNOC_AXI_CLK] = &gcc_mss_snoc_axi_clk.clkr,
+	[GCC_SEC_CTRL_CLK_SRC] = &gcc_sec_ctrl_clk_src.clkr,
 };
 
 static const struct qcom_reset_map gcc_sc7180_resets[] = {
-- 
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.
