Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CC6236A544
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Apr 2021 09:09:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229837AbhDYHJo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 25 Apr 2021 03:09:44 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:45553 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229828AbhDYHJn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 25 Apr 2021 03:09:43 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1619334544; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=M7/gztcsuqHr7jLZXwVGqGrB8iHlOwvthXDr81P5UP8=; b=Bt6P7Eqxp5TzGfcHvr50PeHZwpqyN/AK91JsLXWEuhTTtwdTp+Wb8HfF1Jtzzsvusdvx3Edz
 sqOKbNHhGyU74N4qsD96ihkuuRqPkKO28xApX6do6f2Xz3CsauaIK2DBEdt2Uxf7MiFY55E6
 xbhwQvxUTz5HKO9EIB0yg3yWQDA=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 6085157d2cc44d3aea6e6354 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sun, 25 Apr 2021 07:08:45
 GMT
Sender: tdas=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9BAFFC433F1; Sun, 25 Apr 2021 07:08:45 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from tdas-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 67954C433D3;
        Sun, 25 Apr 2021 07:08:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 67954C433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=tdas@codeaurora.org
From:   Taniya Das <tdas@codeaurora.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Michael=20Turquette=20=C2=A0?= <mturquette@baylibre.com>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v3] clk: qcom: clk-rcg2: Add support for duty-cycle for RCG
Date:   Sun, 25 Apr 2021 12:38:22 +0530
Message-Id: <1619334502-9880-2-git-send-email-tdas@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1619334502-9880-1-git-send-email-tdas@codeaurora.org>
References: <1619334502-9880-1-git-send-email-tdas@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The root clock generators with MND divider has the capability to support
change in duty-cycle by updating the 'D'. Add the clock ops which would
check all the boundary conditions and enable setting the desired duty-cycle
as per the consumer.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
---
 drivers/clk/qcom/clk-rcg2.c | 81 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
index 05ff3b0..aa03e31 100644
--- a/drivers/clk/qcom/clk-rcg2.c
+++ b/drivers/clk/qcom/clk-rcg2.c
@@ -357,6 +357,83 @@ static int clk_rcg2_set_floor_rate_and_parent(struct clk_hw *hw,
 	return __clk_rcg2_set_rate(hw, rate, FLOOR);
 }

+static int clk_rcg2_get_duty_cycle(struct clk_hw *hw, struct clk_duty *duty)
+{
+	struct clk_rcg2 *rcg = to_clk_rcg2(hw);
+	u32 notn_m_val, n_val, m_val, d_val, not2d_val, mask;
+
+	if (!rcg->mnd_width) {
+		/* 50 % duty-cycle for Non-MND RCGs */
+		duty->num = 1;
+		duty->den = 2;
+		return 0;
+	}
+
+	regmap_read(rcg->clkr.regmap, RCG_D_OFFSET(rcg), &not2d_val);
+	regmap_read(rcg->clkr.regmap, RCG_M_OFFSET(rcg), &m_val);
+	regmap_read(rcg->clkr.regmap, RCG_N_OFFSET(rcg), &notn_m_val);
+
+	if (!not2d_val && !m_val && !notn_m_val) {
+		/* 50 % duty-cycle always */
+		duty->num = 1;
+		duty->den = 2;
+		return 0;
+	}
+
+	mask = BIT(rcg->mnd_width) - 1;
+
+	d_val = ~(not2d_val) & mask;
+	d_val = DIV_ROUND_CLOSEST(d_val, 2);
+
+	n_val = (~(notn_m_val) + m_val) & mask;
+
+	duty->num = d_val;
+	duty->den = n_val;
+
+	return 0;
+}
+
+static int clk_rcg2_set_duty_cycle(struct clk_hw *hw, struct clk_duty *duty)
+{
+	struct clk_rcg2 *rcg = to_clk_rcg2(hw);
+	u32 notn_m_val, n_val, m_val, d_val, not2d_val, mask, duty_per;
+	int ret;
+
+	/* Duty-cycle cannot be modified for non-MND RCGs */
+	if (!rcg->mnd_width)
+		return -EINVAL;
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
+	 /* Check bit widths of 2d. If D is too big reduce duty cycle. */
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
@@ -365,6 +442,8 @@ const struct clk_ops clk_rcg2_ops = {
 	.determine_rate = clk_rcg2_determine_rate,
 	.set_rate = clk_rcg2_set_rate,
 	.set_rate_and_parent = clk_rcg2_set_rate_and_parent,
+	.get_duty_cycle = clk_rcg2_get_duty_cycle,
+	.set_duty_cycle = clk_rcg2_set_duty_cycle,
 };
 EXPORT_SYMBOL_GPL(clk_rcg2_ops);

@@ -376,6 +455,8 @@ const struct clk_ops clk_rcg2_floor_ops = {
 	.determine_rate = clk_rcg2_determine_floor_rate,
 	.set_rate = clk_rcg2_set_floor_rate,
 	.set_rate_and_parent = clk_rcg2_set_floor_rate_and_parent,
+	.get_duty_cycle = clk_rcg2_get_duty_cycle,
+	.set_duty_cycle = clk_rcg2_set_duty_cycle,
 };
 EXPORT_SYMBOL_GPL(clk_rcg2_floor_ops);

--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.

