Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 368B4334707
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Mar 2021 19:45:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232934AbhCJSoY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Mar 2021 13:44:24 -0500
Received: from z11.mailgun.us ([104.130.96.11]:38090 "EHLO z11.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233182AbhCJSoW (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Mar 2021 13:44:22 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1615401862; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=F2JTvsNlkIMMJh2BTm0uaQtaxygT/jOeBnJgSyPDleU=; b=TBciUygVvJpcgAkjWa+2OBuqXs4XGj86S43np4Xf4BXTgVRFuPo25gFL2xWBev1fCaumFNHE
 6o4rXCSPjq1cePAbH1Ty5+z123x5eOoj0bsB/SGzfkVL+mc2nnbXIYQ9raSfyiV9ua97lh5l
 hfAgPEw81+4rQUF9ZlCq/0F0UMU=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 60491378fa6ebd85e8008ebf (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 10 Mar 2021 18:44:08
 GMT
Sender: tdas=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8BCA8C433CA; Wed, 10 Mar 2021 18:44:08 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from tdas-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E526BC433C6;
        Wed, 10 Mar 2021 18:44:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E526BC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=tdas@codeaurora.org
From:   Taniya Das <tdas@codeaurora.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Michael=20Turquette=20=C2=A0?= <mturquette@baylibre.com>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v1] clk: qcom: clk-rcg2: Add support for duty-cycle for RCG
Date:   Thu, 11 Mar 2021 00:13:48 +0530
Message-Id: <1615401828-6905-1-git-send-email-tdas@codeaurora.org>
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
 drivers/clk/qcom/clk-rcg2.c | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
index 42f13a2..e070f1a 100644
--- a/drivers/clk/qcom/clk-rcg2.c
+++ b/drivers/clk/qcom/clk-rcg2.c
@@ -357,6 +357,44 @@ static int clk_rcg2_set_floor_rate_and_parent(struct clk_hw *hw,
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
@@ -365,6 +403,7 @@ const struct clk_ops clk_rcg2_ops = {
 	.determine_rate = clk_rcg2_determine_rate,
 	.set_rate = clk_rcg2_set_rate,
 	.set_rate_and_parent = clk_rcg2_set_rate_and_parent,
+	.set_duty_cycle = clk_rcg2_set_duty_cycle,
 };
 EXPORT_SYMBOL_GPL(clk_rcg2_ops);

@@ -376,6 +415,7 @@ const struct clk_ops clk_rcg2_floor_ops = {
 	.determine_rate = clk_rcg2_determine_floor_rate,
 	.set_rate = clk_rcg2_set_floor_rate,
 	.set_rate_and_parent = clk_rcg2_set_floor_rate_and_parent,
+	.set_duty_cycle = clk_rcg2_set_duty_cycle,
 };
 EXPORT_SYMBOL_GPL(clk_rcg2_floor_ops);

--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.

