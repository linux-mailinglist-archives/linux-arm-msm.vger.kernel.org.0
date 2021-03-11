Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1155337317
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Mar 2021 13:52:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232825AbhCKMvz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Mar 2021 07:51:55 -0500
Received: from m42-2.mailgun.net ([69.72.42.2]:54408 "EHLO m42-2.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233251AbhCKMvu (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Mar 2021 07:51:50 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1615467110; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=lEjPYvoALiGGyRhX1AzfcP+F007PTFPI9XdXMUWl2FQ=; b=sv816Maf8wY2EyZvp3Wti6Srg/8WGOsJYxUzzZOa1nsab0jCFuMDEny7XhJgSRSLhUsX3igi
 nJOmlO041v9LUS9OUWNBvTU6CM5R0d9xfIjQj6MhJ5U+0N9pfrI2cvPR+17g/mES4tYlkBkJ
 lJnnQ+P0Gqq8LiggrXcNbcTihnw=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 604a1262fa6ebd85e8080068 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 11 Mar 2021 12:51:46
 GMT
Sender: tdas=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D33B0C43461; Thu, 11 Mar 2021 12:51:45 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from tdas-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id F1FF2C433CA;
        Thu, 11 Mar 2021 12:51:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org F1FF2C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=tdas@codeaurora.org
From:   Taniya Das <tdas@codeaurora.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Michael=20Turquette=20=C2=A0?= <mturquette@baylibre.com>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v2] clk: qcom: clk-rcg2: Add support for duty-cycle for RCG
Date:   Thu, 11 Mar 2021 18:21:32 +0530
Message-Id: <1615467092-6982-1-git-send-email-tdas@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The root clock generators with MND divider has the capability to support
change in duty-cycle by updating the 'D'. Add the clock ops which would
check all the boundary conditions and enable setting the desired duty-cycle
as per the consumer.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
---
 drivers/clk/qcom/clk-rcg2.c | 42 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
index 42f13a2..aac6893 100644
--- a/drivers/clk/qcom/clk-rcg2.c
+++ b/drivers/clk/qcom/clk-rcg2.c
@@ -357,6 +357,46 @@ static int clk_rcg2_set_floor_rate_and_parent(struct clk_hw *hw,
 	return __clk_rcg2_set_rate(hw, rate, FLOOR);
 }

+static int clk_rcg2_set_duty_cycle(struct clk_hw *hw, struct clk_duty *duty)
+{
+	struct clk_rcg2 *rcg = to_clk_rcg2(hw);
+	u32 notn_m_val, n_val, m_val, d_val, not2d_val, mask, duty_per;
+	int ret;
+
+	if (!rcg->mnd_width)
+		return 0;
+
+	mask = BIT(rcg->mnd_width) - 1;
+
+	regmap_read(rcg->clkr.regmap, RCG_N_OFFSET(rcg), &notn_m_val);
+	regmap_read(rcg->clkr.regmap, RCG_M_OFFSET(rcg), &m_val);
+
+	n_val = (~(notn_m_val) + m_val) & mask;
+
+	duty_per = (duty->num * 100) / duty->den;
+
+	/* Calculate 2d value */
+	d_val = DIV_ROUND_CLOSEST(n_val * duty_per * 2, 100);
+
+	 /* Check BIT WIDTHS OF 2d. If D is too big reduce Duty cycle. */
+	if (d_val > mask)
+		d_val = mask;
+
+	if ((d_val / 2) > (n_val - m_val))
+		d_val = (n_val - m_val) * 2;
+	else if ((d_val / 2) < (m_val / 2))
+		d_val = m_val;
+
+	not2d_val = ~d_val & mask;
+
+	ret = regmap_update_bits(rcg->clkr.regmap, RCG_D_OFFSET(rcg), mask,
+				 not2d_val);
+	if (ret)
+		return ret;
+
+	return update_config(rcg);
+}
+
 const struct clk_ops clk_rcg2_ops = {
 	.is_enabled = clk_rcg2_is_enabled,
 	.get_parent = clk_rcg2_get_parent,
@@ -365,6 +405,7 @@ const struct clk_ops clk_rcg2_ops = {
 	.determine_rate = clk_rcg2_determine_rate,
 	.set_rate = clk_rcg2_set_rate,
 	.set_rate_and_parent = clk_rcg2_set_rate_and_parent,
+	.set_duty_cycle = clk_rcg2_set_duty_cycle,
 };
 EXPORT_SYMBOL_GPL(clk_rcg2_ops);

@@ -376,6 +417,7 @@ const struct clk_ops clk_rcg2_floor_ops = {
 	.determine_rate = clk_rcg2_determine_floor_rate,
 	.set_rate = clk_rcg2_set_floor_rate,
 	.set_rate_and_parent = clk_rcg2_set_floor_rate_and_parent,
+	.set_duty_cycle = clk_rcg2_set_duty_cycle,
 };
 EXPORT_SYMBOL_GPL(clk_rcg2_floor_ops);

--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.

