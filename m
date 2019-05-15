Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 042EC1E76A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 May 2019 06:20:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726656AbfEOEU5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 May 2019 00:20:57 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:52674 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725876AbfEOEU5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 May 2019 00:20:57 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id DA27960CEC; Wed, 15 May 2019 04:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1557894055;
        bh=fKCQN5y5mgClWK0394NqzH6pExXlkJ6U1cXmYiQPvjc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LpkBtlwYRqSe7DVnZgcGtLlxGxMmEvceZl1t7WzG8BNuggxW4wUyV9sk8QVleaqbc
         o1m5lM1sxxum8Wu23iD71b9guOw1jYMn4liHsjj5feDrYrbtbebZp+Vd4pNmZfbLKV
         3+lpzturFxQWXBbmvQqRJpC198xROCks8rMenhO8=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from tdas-linux.qualcomm.com (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1046060128;
        Wed, 15 May 2019 04:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1557894054;
        bh=fKCQN5y5mgClWK0394NqzH6pExXlkJ6U1cXmYiQPvjc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WfuK8cr6x2OwJilqETfXK75BoRqDng2WirEQGmtuaAEHeUya27oz6eiXz3If0DHLC
         My1uOtqHWOma1kVkzlbOzA+KXxUF8h1T37ZrXkmuS6EDgdqpOVU2ft9pD/9hDMHJkR
         azbL9ZJnFK13Q8bgPjWg0vBw5HNIBAkICFmj/3iU=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1046060128
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
From:   Taniya Das <tdas@codeaurora.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v2 1/2] clk: qcom: rcg2: Add support for display port clock ops
Date:   Wed, 15 May 2019 09:50:38 +0530
Message-Id: <1557894039-31835-2-git-send-email-tdas@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1557894039-31835-1-git-send-email-tdas@codeaurora.org>
References: <1557894039-31835-1-git-send-email-tdas@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

New display port clock ops supported for display port clocks.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
---
 drivers/clk/qcom/Kconfig    |  1 +
 drivers/clk/qcom/clk-rcg.h  |  1 +
 drivers/clk/qcom/clk-rcg2.c | 81 ++++++++++++++++++++++++++++++++++++++++++++-
 3 files changed, 82 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 18bdf34..0de080f 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -15,6 +15,7 @@ menuconfig COMMON_CLK_QCOM
 	depends on ARCH_QCOM || COMPILE_TEST
 	select REGMAP_MMIO
 	select RESET_CONTROLLER
+	select RATIONAL

 if COMMON_CLK_QCOM

diff --git a/drivers/clk/qcom/clk-rcg.h b/drivers/clk/qcom/clk-rcg.h
index c25b57c..c6f64be 100644
--- a/drivers/clk/qcom/clk-rcg.h
+++ b/drivers/clk/qcom/clk-rcg.h
@@ -161,6 +161,7 @@ struct clk_rcg2 {
 extern const struct clk_ops clk_pixel_ops;
 extern const struct clk_ops clk_gfx3d_ops;
 extern const struct clk_ops clk_rcg2_shared_ops;
+extern const struct clk_ops clk_dp_ops;

 struct clk_rcg_dfs_data {
 	struct clk_rcg2 *rcg;
diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
index 8c02bff..98071c0 100644
--- a/drivers/clk/qcom/clk-rcg2.c
+++ b/drivers/clk/qcom/clk-rcg2.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Copyright (c) 2013, 2018, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2013, 2018-2019, The Linux Foundation. All rights reserved.
  */

 #include <linux/kernel.h>
@@ -10,6 +10,7 @@
 #include <linux/export.h>
 #include <linux/clk-provider.h>
 #include <linux/delay.h>
+#include <linux/rational.h>
 #include <linux/regmap.h>
 #include <linux/math64.h>
 #include <linux/slab.h>
@@ -1128,3 +1129,81 @@ int qcom_cc_register_rcg_dfs(struct regmap *regmap,
 	return 0;
 }
 EXPORT_SYMBOL_GPL(qcom_cc_register_rcg_dfs);
+
+static int clk_rcg2_dp_set_rate(struct clk_hw *hw, unsigned long rate,
+			unsigned long parent_rate)
+{
+	struct clk_rcg2 *rcg = to_clk_rcg2(hw);
+	struct freq_tbl f = { 0 };
+	u32 mask = BIT(rcg->hid_width) - 1;
+	u32 hid_div, cfg;
+	int i, num_parents = clk_hw_get_num_parents(hw);
+	unsigned long num, den;
+
+	rational_best_approximation(parent_rate, rate,
+			GENMASK(rcg->mnd_width - 1, 0),
+			GENMASK(rcg->mnd_width - 1, 0), &den, &num);
+
+	if (!num || !den) {
+		pr_err("Invalid MN values derived for requested rate %lu\n",
+							rate);
+		return -EINVAL;
+	}
+
+	regmap_read(rcg->clkr.regmap, rcg->cmd_rcgr + CFG_REG, &cfg);
+	hid_div = cfg;
+	cfg &= CFG_SRC_SEL_MASK;
+	cfg >>= CFG_SRC_SEL_SHIFT;
+
+	for (i = 0; i < num_parents; i++)
+		if (cfg == rcg->parent_map[i].cfg) {
+			f.src = rcg->parent_map[i].src;
+			break;
+	}
+
+	f.pre_div = hid_div;
+	f.pre_div >>= CFG_SRC_DIV_SHIFT;
+	f.pre_div &= mask;
+
+	if (num == den) {
+		f.m = 0;
+		f.n = 0;
+	} else {
+		f.m = num;
+		f.n = den;
+	}
+
+	return clk_rcg2_configure(rcg, &f);
+}
+
+static int clk_rcg2_dp_set_rate_and_parent(struct clk_hw *hw,
+		unsigned long rate, unsigned long parent_rate, u8 index)
+{
+	return clk_rcg2_dp_set_rate(hw, rate, parent_rate);
+}
+
+static int clk_rcg2_dp_determine_rate(struct clk_hw *hw,
+				struct clk_rate_request *req)
+{
+	struct clk_rate_request parent_req = *req;
+	int ret;
+
+	ret = __clk_determine_rate(clk_hw_get_parent(hw), &parent_req);
+	if (ret)
+		return ret;
+
+	req->best_parent_rate = parent_req.rate;
+
+	return 0;
+}
+
+const struct clk_ops clk_dp_ops = {
+	.is_enabled = clk_rcg2_is_enabled,
+	.get_parent = clk_rcg2_get_parent,
+	.set_parent = clk_rcg2_set_parent,
+	.recalc_rate = clk_rcg2_recalc_rate,
+	.set_rate = clk_rcg2_dp_set_rate,
+	.set_rate_and_parent = clk_rcg2_dp_set_rate_and_parent,
+	.determine_rate = clk_rcg2_dp_determine_rate,
+};
+EXPORT_SYMBOL_GPL(clk_dp_ops);
--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.

