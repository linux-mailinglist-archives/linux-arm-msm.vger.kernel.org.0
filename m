Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47A107CBF8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2019 20:27:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730031AbfGaS1a (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Jul 2019 14:27:30 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:45248 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730037AbfGaS13 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Jul 2019 14:27:29 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id E58DF60591; Wed, 31 Jul 2019 18:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1564597647;
        bh=6Cyj5ClFdXUYHbBy8BuqqKm+cdofMD2U/hYjgwujy0U=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=m932ooWV5d3e1mlKxKdoEotb/lVza3lqK9RdOICnEV4Ro5o3HW9MIyruGeCuqcJhH
         pMJnbQ69hjgbBTjvRT8LKUIB6ZITu7MUOs8oAGPLTJvuJxQFly8124B5xSELgc8H96
         3hyT2rEXvWdKN7LW8Xh8ejq0I5fjXA9CZMBS/BW0=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from tdas-linux.qualcomm.com (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D3C7B60721;
        Wed, 31 Jul 2019 18:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1564597647;
        bh=6Cyj5ClFdXUYHbBy8BuqqKm+cdofMD2U/hYjgwujy0U=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=m932ooWV5d3e1mlKxKdoEotb/lVza3lqK9RdOICnEV4Ro5o3HW9MIyruGeCuqcJhH
         pMJnbQ69hjgbBTjvRT8LKUIB6ZITu7MUOs8oAGPLTJvuJxQFly8124B5xSELgc8H96
         3hyT2rEXvWdKN7LW8Xh8ejq0I5fjXA9CZMBS/BW0=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D3C7B60721
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
From:   Taniya Das <tdas@codeaurora.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Michael=20Turquette=20=C2=A0?= <mturquette@baylibre.com>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v3 1/2] clk: qcom: rcg2: Add support for display port clock ops
Date:   Wed, 31 Jul 2019 23:57:12 +0530
Message-Id: <20190731182713.8123-2-tdas@codeaurora.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190731182713.8123-1-tdas@codeaurora.org>
References: <20190731182713.8123-1-tdas@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

New display port clock ops supported for display port clocks.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
---
 drivers/clk/qcom/Kconfig    |  1 +
 drivers/clk/qcom/clk-rcg.h  |  1 +
 drivers/clk/qcom/clk-rcg2.c | 77 +++++++++++++++++++++++++++++++++++++
 3 files changed, 79 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index e1ff83cc361e..f36a2e0e4c95 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -14,6 +14,7 @@ menuconfig COMMON_CLK_QCOM
 	tristate "Support for Qualcomm's clock controllers"
 	depends on OF
 	depends on ARCH_QCOM || COMPILE_TEST
+	select RATIONAL
 	select REGMAP_MMIO
 	select RESET_CONTROLLER

diff --git a/drivers/clk/qcom/clk-rcg.h b/drivers/clk/qcom/clk-rcg.h
index c25b57c3cbc8..c6f64be22479 100644
--- a/drivers/clk/qcom/clk-rcg.h
+++ b/drivers/clk/qcom/clk-rcg.h
@@ -161,6 +161,7 @@ extern const struct clk_ops clk_byte2_ops;
 extern const struct clk_ops clk_pixel_ops;
 extern const struct clk_ops clk_gfx3d_ops;
 extern const struct clk_ops clk_rcg2_shared_ops;
+extern const struct clk_ops clk_dp_ops;

 struct clk_rcg_dfs_data {
 	struct clk_rcg2 *rcg;
diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
index 8c02bffe50df..a4a6b87827d0 100644
--- a/drivers/clk/qcom/clk-rcg2.c
+++ b/drivers/clk/qcom/clk-rcg2.c
@@ -10,6 +10,7 @@
 #include <linux/export.h>
 #include <linux/clk-provider.h>
 #include <linux/delay.h>
+#include <linux/rational.h>
 #include <linux/regmap.h>
 #include <linux/math64.h>
 #include <linux/slab.h>
@@ -1128,3 +1129,79 @@ int qcom_cc_register_rcg_dfs(struct regmap *regmap,
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
+	if (!num || !den)
+		return -EINVAL;
+
+	regmap_read(rcg->clkr.regmap, rcg->cmd_rcgr + CFG_REG, &cfg);
+	hid_div = cfg;
+	cfg &= CFG_SRC_SEL_MASK;
+	cfg >>= CFG_SRC_SEL_SHIFT;
+
+	for (i = 0; i < num_parents; i++) {
+		if (cfg == rcg->parent_map[i].cfg) {
+			f.src = rcg->parent_map[i].src;
+			break;
+		}
+	}
+
+	f.pre_div = hid_div;
+	f.pre_div >>= CFG_SRC_DIV_SHIFT;
+	f.pre_div &= mask;
+
+	if (num != den) {
+		f.m = num;
+		f.n = den;
+	} else {
+		f.m = 0;
+		f.n = 0;
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

