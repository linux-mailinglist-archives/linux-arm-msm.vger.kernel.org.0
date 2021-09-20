Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9CFE411039
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Sep 2021 09:36:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235207AbhITHiC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Sep 2021 03:38:02 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:23550 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235099AbhITHh6 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Sep 2021 03:37:58 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1632123392; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=c9ljN+xjp5wOZeBRStwSabSjXyaHPIpDlX/URlVoR3U=; b=tVOcutsx5/V0a9xcJmdsveuKpJfVfycFMvF73O0+ITW7uudf4KFlIzx5Okuq0/wCqMrG0QPf
 R0R6rYaviwzY+1b4GF60muqGeMBoShcowJEgupH0j1E43Y40MCwgoUawlGOlX63NOU4QYXSs
 P+UekkaeRiaheMR+kD9Cl59Ud1A=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 614839fb648642cc1c337015 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 20 Sep 2021 07:36:27
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 16FEDC4361B; Mon, 20 Sep 2021 07:36:26 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from hu-srivasam-hyd.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 85155C43618;
        Mon, 20 Sep 2021 07:36:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 85155C43618
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
Subject: [PATCH 5/7] ASoC: codecs: lpass-rx-macro: Change bulk voting to individual clock voting
Date:   Mon, 20 Sep 2021 13:05:29 +0530
Message-Id: <1632123331-2425-6-git-send-email-srivasam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1632123331-2425-1-git-send-email-srivasam@codeaurora.org>
References: <1632123331-2425-1-git-send-email-srivasam@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Change bulk clock frequency voting to individual voting.

Fixes: af3d54b99764 (ASoC: codecs: lpass-rx-macro: add support for lpass rx macro)

Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
---
 sound/soc/codecs/lpass-rx-macro.c | 68 +++++++++++++++++++++++++++------------
 1 file changed, 48 insertions(+), 20 deletions(-)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index 520c760..349d879 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -608,7 +608,11 @@ struct rx_macro {
 	int softclip_clk_users;
 
 	struct regmap *regmap;
-	struct clk_bulk_data clks[RX_NUM_CLKS_MAX];
+	struct clk *mclk;
+	struct clk *npl;
+	struct clk *macro;
+	struct clk *dcodec;
+	struct clk *fsgen;
 	struct clk_hw hw;
 };
 #define to_rx_macro(_hw) container_of(_hw, struct rx_macro, hw)
@@ -3423,6 +3427,8 @@ static int swclk_gate_enable(struct clk_hw *hw)
 {
 	struct rx_macro *rx = to_rx_macro(hw);
 
+	clk_set_rate(rx->npl, MCLK_FREQ);
+	clk_prepare_enable(rx->npl);
 	rx_macro_mclk_enable(rx, true);
 	if (rx->reset_swr)
 		regmap_update_bits(rx->regmap, CDC_RX_CLK_RST_CTRL_SWR_CONTROL,
@@ -3448,6 +3454,7 @@ static void swclk_gate_disable(struct clk_hw *hw)
 			   CDC_RX_SWR_CLK_EN_MASK, 0);
 
 	rx_macro_mclk_enable(rx, false);
+	clk_disable_unprepare(rx->npl);
 }
 
 static int swclk_gate_is_enabled(struct clk_hw *hw)
@@ -3485,7 +3492,7 @@ static struct clk *rx_macro_register_mclk_output(struct rx_macro *rx)
 	struct clk_init_data init;
 	int ret;
 
-	parent_clk_name = __clk_get_name(rx->clks[2].clk);
+	parent_clk_name = __clk_get_name(rx->mclk);
 
 	init.name = clk_name;
 	init.ops = &swclk_gate_ops;
@@ -3525,17 +3532,25 @@ static int rx_macro_probe(struct platform_device *pdev)
 	if (!rx)
 		return -ENOMEM;
 
-	rx->clks[0].id = "macro";
-	rx->clks[1].id = "dcodec";
-	rx->clks[2].id = "mclk";
-	rx->clks[3].id = "npl";
-	rx->clks[4].id = "fsgen";
+	rx->mclk = devm_clk_get(dev, "mclk");
+	if (IS_ERR(rx->mclk))
+		return PTR_ERR(rx->mclk);
+	rx->npl = devm_clk_get(dev, "npl");
+	if (IS_ERR(rx->npl))
+		return PTR_ERR(rx->npl);
 
-	ret = devm_clk_bulk_get(dev, RX_NUM_CLKS_MAX, rx->clks);
-	if (ret) {
-		dev_err(dev, "Error getting RX Clocks (%d)\n", ret);
-		return ret;
-	}
+
+	rx->macro = devm_clk_get_optional(dev, "macro");
+	if (IS_ERR(rx->macro))
+		return PTR_ERR(rx->macro);
+
+	rx->dcodec = devm_clk_get_optional(dev, "dcodec");
+	if (IS_ERR(rx->dcodec))
+		return PTR_ERR(rx->dcodec);
+
+	rx->fsgen = devm_clk_get(dev, "fsgen");
+	if (IS_ERR(rx->fsgen))
+		return PTR_ERR(rx->fsgen);
 
 	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
@@ -3549,21 +3564,28 @@ static int rx_macro_probe(struct platform_device *pdev)
 	rx->dev = dev;
 
 	/* set MCLK and NPL rates */
-	clk_set_rate(rx->clks[2].clk, MCLK_FREQ);
-	clk_set_rate(rx->clks[3].clk, 2 * MCLK_FREQ);
+	clk_set_rate(rx->mclk, MCLK_FREQ);
+	clk_set_rate(rx->npl, 2 * MCLK_FREQ);
 
-	ret = clk_bulk_prepare_enable(RX_NUM_CLKS_MAX, rx->clks);
-	if (ret)
-		return ret;
+	clk_prepare_enable(rx->macro);
+	clk_prepare_enable(rx->dcodec);
+	clk_prepare_enable(rx->mclk);
+	clk_prepare_enable(rx->npl);
+	clk_prepare_enable(rx->fsgen);
 
 	rx_macro_register_mclk_output(rx);
 
 	ret = devm_snd_soc_register_component(dev, &rx_macro_component_drv,
 					      rx_macro_dai,
 					      ARRAY_SIZE(rx_macro_dai));
-	if (ret)
-		clk_bulk_disable_unprepare(RX_NUM_CLKS_MAX, rx->clks);
+	if (ret) {
+		clk_disable_unprepare(rx->mclk);
+		clk_disable_unprepare(rx->npl);
+		clk_disable_unprepare(rx->macro);
+		clk_disable_unprepare(rx->dcodec);
+		clk_disable_unprepare(rx->fsgen);
 
+	}
 	return ret;
 }
 
@@ -3572,7 +3594,13 @@ static int rx_macro_remove(struct platform_device *pdev)
 	struct rx_macro *rx = dev_get_drvdata(&pdev->dev);
 
 	of_clk_del_provider(pdev->dev.of_node);
-	clk_bulk_disable_unprepare(RX_NUM_CLKS_MAX, rx->clks);
+
+	clk_disable_unprepare(rx->mclk);
+	clk_disable_unprepare(rx->npl);
+	clk_disable_unprepare(rx->macro);
+	clk_disable_unprepare(rx->dcodec);
+	clk_disable_unprepare(rx->fsgen);
+
 	return 0;
 }
 
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

