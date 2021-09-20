Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CE1441103D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Sep 2021 09:36:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235098AbhITHiS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Sep 2021 03:38:18 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:15040 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235194AbhITHiC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Sep 2021 03:38:02 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1632123396; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=K50d4npJAxjWiTCuGHctX6FyO/bfVsZLYNZSmtAgHws=; b=ove8m33I5kyZVogSwE6/c0WLwtbf/nB1F/W2f6Ha3mOnSzPsupk/4zxBbcrkI31snd+YIksf
 WI3n3nOG1YnwuZi5GuBl6IcP2MmzMbWFFB2i+aw4HrUpVi+dTTtlLagAgwwwaW054Km4ukYg
 2WLJfbHc3/ZuNDaKIaiJt0bO3wg=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 61483a03b585cc7d24d55853 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 20 Sep 2021 07:36:35
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 70210C43635; Mon, 20 Sep 2021 07:36:34 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from hu-srivasam-hyd.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C7168C43635;
        Mon, 20 Sep 2021 07:36:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org C7168C43635
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        srinivas.kandagatla@linaro.org, rohitkr@codeaurora.org,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        swboyd@chromium.org, judyhsiao@chromium.org
Cc:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        Venkata Prasad Potturu <potturu@codeaurora.org>
Subject: [PATCH 6/7] ASoC: codecs: lpass-tx-macro: Change bulk voting to individual clock voting
Date:   Mon, 20 Sep 2021 13:05:30 +0530
Message-Id: <1632123331-2425-7-git-send-email-srivasam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1632123331-2425-1-git-send-email-srivasam@codeaurora.org>
References: <1632123331-2425-1-git-send-email-srivasam@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Change bulk clock frequency voting to individual voting.

Fixes: c39667ddcfc5 (ASoC: codecs: lpass-tx-macro: add support for lpass tx macro)

Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
---
 sound/soc/codecs/lpass-tx-macro.c | 67 +++++++++++++++++++++++++++------------
 1 file changed, 47 insertions(+), 20 deletions(-)

diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
index e65b592..78e5e0b 100644
--- a/sound/soc/codecs/lpass-tx-macro.c
+++ b/sound/soc/codecs/lpass-tx-macro.c
@@ -6,6 +6,7 @@
 #include <linux/clk.h>
 #include <linux/io.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <sound/soc.h>
 #include <sound/soc-dapm.h>
@@ -258,7 +259,11 @@ struct tx_macro {
 	unsigned long active_ch_cnt[TX_MACRO_MAX_DAIS];
 	unsigned long active_decimator[TX_MACRO_MAX_DAIS];
 	struct regmap *regmap;
-	struct clk_bulk_data clks[TX_NUM_CLKS_MAX];
+	struct clk *mclk;
+	struct clk *npl;
+	struct clk *macro;
+	struct clk *dcodec;
+	struct clk *fsgen;
 	struct clk_hw hw;
 	bool dec_active[NUM_DECIMATORS];
 	bool reset_swr;
@@ -1695,7 +1700,9 @@ static int swclk_gate_enable(struct clk_hw *hw)
 {
 	struct tx_macro *tx = to_tx_macro(hw);
 	struct regmap *regmap = tx->regmap;
-
+	pm_runtime_get_sync(tx->dev);
+	clk_set_rate(tx->npl, 2 * MCLK_FREQ);
+	clk_prepare_enable(tx->npl);
 	tx_macro_mclk_enable(tx, true);
 	if (tx->reset_swr)
 		regmap_update_bits(regmap, CDC_TX_CLK_RST_CTRL_SWR_CONTROL,
@@ -1722,6 +1729,7 @@ static void swclk_gate_disable(struct clk_hw *hw)
 			   CDC_TX_SWR_CLK_EN_MASK, 0x0);
 
 	tx_macro_mclk_enable(tx, false);
+	clk_disable_unprepare(tx->npl);
 }
 
 static int swclk_gate_is_enabled(struct clk_hw *hw)
@@ -1759,7 +1767,7 @@ static struct clk *tx_macro_register_mclk_output(struct tx_macro *tx)
 	struct clk_init_data init;
 	int ret;
 
-	parent_clk_name = __clk_get_name(tx->clks[2].clk);
+	parent_clk_name = __clk_get_name(tx->mclk);
 
 	init.name = clk_name;
 	init.ops = &swclk_gate_ops;
@@ -1799,17 +1807,25 @@ static int tx_macro_probe(struct platform_device *pdev)
 	if (!tx)
 		return -ENOMEM;
 
-	tx->clks[0].id = "macro";
-	tx->clks[1].id = "dcodec";
-	tx->clks[2].id = "mclk";
-	tx->clks[3].id = "npl";
-	tx->clks[4].id = "fsgen";
+	tx->mclk = devm_clk_get(dev, "mclk");
+	if (IS_ERR(tx->mclk))
+		return PTR_ERR(tx->mclk);
 
-	ret = devm_clk_bulk_get(dev, TX_NUM_CLKS_MAX, tx->clks);
-	if (ret) {
-		dev_err(dev, "Error getting RX Clocks (%d)\n", ret);
-		return ret;
-	}
+	tx->npl = devm_clk_get(dev, "npl");
+	if (IS_ERR(tx->npl))
+		return PTR_ERR(tx->npl);
+
+	tx->macro = devm_clk_get_optional(dev, "macro");
+	if (IS_ERR(tx->macro))
+		return PTR_ERR(tx->macro);
+
+	tx->dcodec = devm_clk_get_optional(dev, "dcodec");
+	if (IS_ERR(tx->dcodec))
+		return PTR_ERR(tx->dcodec);
+
+	tx->fsgen = devm_clk_get(dev, "fsgen");
+	if (IS_ERR(tx->fsgen))
+		return PTR_ERR(tx->fsgen);
 
 	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
@@ -1823,12 +1839,15 @@ static int tx_macro_probe(struct platform_device *pdev)
 	tx->dev = dev;
 
 	/* set MCLK and NPL rates */
-	clk_set_rate(tx->clks[2].clk, MCLK_FREQ);
-	clk_set_rate(tx->clks[3].clk, 2 * MCLK_FREQ);
+	clk_set_rate(tx->mclk, MCLK_FREQ);
+	clk_set_rate(tx->npl, 2 * MCLK_FREQ);
 
-	ret = clk_bulk_prepare_enable(TX_NUM_CLKS_MAX, tx->clks);
-	if (ret)
-		return ret;
+	clk_prepare_enable(tx->macro);
+	clk_prepare_enable(tx->dcodec);
+
+	clk_prepare_enable(tx->mclk);
+	clk_prepare_enable(tx->npl);
+	clk_prepare_enable(tx->fsgen);
 
 	tx_macro_register_mclk_output(tx);
 
@@ -1839,7 +1858,11 @@ static int tx_macro_probe(struct platform_device *pdev)
 		goto err;
 	return ret;
 err:
-	clk_bulk_disable_unprepare(TX_NUM_CLKS_MAX, tx->clks);
+	clk_disable_unprepare(tx->mclk);
+	clk_disable_unprepare(tx->npl);
+	clk_disable_unprepare(tx->macro);
+	clk_disable_unprepare(tx->dcodec);
+	clk_disable_unprepare(tx->fsgen);
 
 	return ret;
 }
@@ -1850,7 +1873,11 @@ static int tx_macro_remove(struct platform_device *pdev)
 
 	of_clk_del_provider(pdev->dev.of_node);
 
-	clk_bulk_disable_unprepare(TX_NUM_CLKS_MAX, tx->clks);
+	clk_disable_unprepare(tx->mclk);
+	clk_disable_unprepare(tx->npl);
+	clk_disable_unprepare(tx->macro);
+	clk_disable_unprepare(tx->dcodec);
+	clk_disable_unprepare(tx->fsgen);
 
 	return 0;
 }
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

