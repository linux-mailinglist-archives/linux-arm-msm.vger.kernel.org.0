Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B25E1411035
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Sep 2021 09:36:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235150AbhITHiB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Sep 2021 03:38:01 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:59371 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235106AbhITHh4 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Sep 2021 03:37:56 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1632123390; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=ffcyisodcBdF9BO8GbzfssdNwyEkzbdhdwQtAO1wPYg=; b=ZAiKpA6WTt1dfIW5HSndHNvO9R5ku5dG4B5+GtyFyJAM7WS8tCBfrENueykm3NpkCfn8GLPB
 TadWh8oxBYtPcgAK0+XTY9zh9ozndhX0e1EQ+dUkWb8VpgMOGWLP0MlXflxfzHoCOQDOPpd+
 yDtHSLKh7B5WmPKTynGXp/M/VwM=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 614839f0e0f78151d6ca911b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 20 Sep 2021 07:36:16
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2F92EC4360C; Mon, 20 Sep 2021 07:36:16 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from hu-srivasam-hyd.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id F3A7AC4338F;
        Mon, 20 Sep 2021 07:36:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org F3A7AC4338F
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
Subject: [PATCH 4/7] ASoC: codecs: lpass-va-macro: Change bulk voting to individual clock voting
Date:   Mon, 20 Sep 2021 13:05:28 +0530
Message-Id: <1632123331-2425-5-git-send-email-srivasam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1632123331-2425-1-git-send-email-srivasam@codeaurora.org>
References: <1632123331-2425-1-git-send-email-srivasam@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Change bulk clock frequency voting to individual voting.

Fixes: 908e6b1df26e (ASoC: codecs: lpass-va-macro: Add support to VA Macro)

Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
---
 sound/soc/codecs/lpass-va-macro.c | 46 ++++++++++++++++++++++++---------------
 1 file changed, 28 insertions(+), 18 deletions(-)

diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index d312a14..0ea39ae 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -193,7 +193,10 @@ struct va_macro {
 
 	int dec_mode[VA_MACRO_NUM_DECIMATORS];
 	struct regmap *regmap;
-	struct clk_bulk_data clks[VA_NUM_CLKS_MAX];
+	struct clk *mclk;
+	struct clk *macro;
+	struct clk *dcodec;
+
 	struct clk_hw hw;
 
 	s32 dmic_0_1_clk_cnt;
@@ -1321,7 +1324,7 @@ static const struct clk_ops fsgen_gate_ops = {
 
 static int va_macro_register_fsgen_output(struct va_macro *va)
 {
-	struct clk *parent = va->clks[2].clk;
+	struct clk *parent = va->mclk;
 	struct device *dev = va->dev;
 	struct device_node *np = dev->of_node;
 	const char *parent_clk_name;
@@ -1404,15 +1407,18 @@ static int va_macro_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	va->dev = dev;
-	va->clks[0].id = "macro";
-	va->clks[1].id = "dcodec";
-	va->clks[2].id = "mclk";
 
-	ret = devm_clk_bulk_get(dev, VA_NUM_CLKS_MAX, va->clks);
-	if (ret) {
-		dev_err(dev, "Error getting VA Clocks (%d)\n", ret);
-		return ret;
-	}
+	va->macro = devm_clk_get_optional(dev, "macro");
+	if (IS_ERR(va->macro))
+		return PTR_ERR(va->macro);
+
+	va->dcodec = devm_clk_get_optional(dev, "dcodec");
+	if (IS_ERR(va->dcodec))
+		return PTR_ERR(va->dcodec);
+
+	va->mclk = devm_clk_get(dev, "mclk");
+	if (IS_ERR(va->mclk))
+		return PTR_ERR(va->mclk);
 
 	ret = of_property_read_u32(dev->of_node, "qcom,dmic-sample-rate",
 				   &sample_rate);
@@ -1426,10 +1432,11 @@ static int va_macro_probe(struct platform_device *pdev)
 	}
 
 	/* mclk rate */
-	clk_set_rate(va->clks[1].clk, VA_MACRO_MCLK_FREQ);
-	ret = clk_bulk_prepare_enable(VA_NUM_CLKS_MAX, va->clks);
-	if (ret)
-		return ret;
+	clk_set_rate(va->mclk, VA_MACRO_MCLK_FREQ);
+
+	clk_prepare_enable(va->mclk);
+	clk_prepare_enable(va->macro);
+	clk_prepare_enable(va->dcodec);
 
 	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base)) {
@@ -1457,8 +1464,9 @@ static int va_macro_probe(struct platform_device *pdev)
 	return ret;
 
 err:
-	clk_bulk_disable_unprepare(VA_NUM_CLKS_MAX, va->clks);
-
+	clk_disable_unprepare(va->mclk);
+	clk_disable_unprepare(va->macro);
+	clk_disable_unprepare(va->dcodec);
 	return ret;
 }
 
@@ -1466,8 +1474,10 @@ static int va_macro_remove(struct platform_device *pdev)
 {
 	struct va_macro *va = dev_get_drvdata(&pdev->dev);
 
-	clk_bulk_disable_unprepare(VA_NUM_CLKS_MAX, va->clks);
-
+	of_clk_del_provider(pdev->dev.of_node);
+	clk_disable_unprepare(va->mclk);
+	clk_disable_unprepare(va->macro);
+	clk_disable_unprepare(va->dcodec);
 	return 0;
 }
 
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

