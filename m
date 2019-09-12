Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 28457B10DA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Sep 2019 16:16:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732480AbfILOPu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Sep 2019 10:15:50 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:53263 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732573AbfILOPt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Sep 2019 10:15:49 -0400
Received: by mail-wm1-f65.google.com with SMTP id q18so238789wmq.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Sep 2019 07:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=U94LXB0H1SLchTUsgjMZwjp3h0cafdMB0BynvaN+clQ=;
        b=c2LsHJ3tBEwEu++rxVvsn78g0L8UGdn7yiC4/N4WA91klnp22ccVAB1m6chQL/Onzq
         RhHrr9XFtyyqbHwCu1B1W+g94jvzJjkTfeDlIRm1O27WepyHaoth/Gs16hJe+L0Z9pbo
         njNWTGxQCTm1gyfrIhwhNHhqw+frkZfE4FpyYuoXtKj2XdpxVE/NV4Y4VvX/AakWvjys
         v8tipJcte9cSWKsE9GIJCbTR/X74OPRpl09XBDpkPW9vo/zKKDTtXStOUMoe4g4o6n9k
         xZxx0QvX8cFKWC00/Y1UN+WXaYKiXKNDC7V+qx0/JFXxnzziXfJBQM+gb9Y2DGDnJ1r+
         tTMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=U94LXB0H1SLchTUsgjMZwjp3h0cafdMB0BynvaN+clQ=;
        b=jliZoZkrqA+CrACLCIjrum0eyVa1UNIKtffgKgNNEuIQF7bPm9rQSZc/DCquME3Awb
         Ag7karLpv+dqTcHAOV4WNzX8Ch00Yu/4Rp9kbpIPjS4fnfxZa4kOrQyL44+DdA1yBaED
         AyTqrmBChg3PbsII430wpH4/eTQPCQudN0i3OUXe5fAgl7u6U8Rej3FGN5DvkO/PfzW3
         DMn+jM+CiL51nkhhmryV0cX7JKTtdw/EuKh3EM62DvkQghmfsqHmPLEO9RWP3yoP9LiG
         qtr4L+yhBEvj9+ye8N029dqVIAbb2Zp2olr5Qi0fyoQal+9rtWUBmn3ftOXsoTUZRirs
         noeA==
X-Gm-Message-State: APjAAAUutaELpU6F2J0aA5bsA3ZfdmxnWkva+a0zF6caz7KZ+8WebvD5
        BsAwQjctmjCJAmylqRpg3lFVGw==
X-Google-Smtp-Source: APXvYqy70e0LTKSHReHGBTwSYaCcOtPua5H4LToUok6GoIgFi9Fwo1Yl8Gyg5lX985HrVLB3xIj4Bw==
X-Received: by 2002:a1c:7a14:: with SMTP id v20mr197811wmc.75.1568297745884;
        Thu, 12 Sep 2019 07:15:45 -0700 (PDT)
Received: from localhost.localdomain (69.red-83-35-113.dynamicip.rima-tde.net. [83.35.113.69])
        by smtp.gmail.com with ESMTPSA id p23sm137599wma.18.2019.09.12.07.15.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 12 Sep 2019 07:15:45 -0700 (PDT)
From:   Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
To:     jorge.ramirez-ortiz@linaro.org, sboyd@kernel.org,
        agross@kernel.org, mturquette@baylibre.com,
        bjorn.andersson@linaro.org
Cc:     niklas.cassel@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/5] clk: qcom: apcs-msm8916: get parent clock names from DT
Date:   Thu, 12 Sep 2019 16:15:34 +0200
Message-Id: <20190912141534.28870-6-jorge.ramirez-ortiz@linaro.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190912141534.28870-1-jorge.ramirez-ortiz@linaro.org>
References: <20190912141534.28870-1-jorge.ramirez-ortiz@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Allow accessing the parent clock names required for the driver
operation by using the device tree node.

This permits extending the driver to other platforms without having to
modify its source code.

For backwards compatibility leave previous values as default.

Co-developed-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/clk/qcom/apcs-msm8916.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/apcs-msm8916.c b/drivers/clk/qcom/apcs-msm8916.c
index a6c89a310b18..099b028dbc20 100644
--- a/drivers/clk/qcom/apcs-msm8916.c
+++ b/drivers/clk/qcom/apcs-msm8916.c
@@ -19,7 +19,7 @@
 
 static const u32 gpll0_a53cc_map[] = { 4, 5 };
 
-static const char * const gpll0_a53cc[] = {
+static const char *gpll0_a53cc[] = {
 	"gpll0_vote",
 	"a53pll",
 };
@@ -50,6 +50,7 @@ static int qcom_apcs_msm8916_clk_probe(struct platform_device *pdev)
 	struct regmap *regmap;
 	struct clk_init_data init = { };
 	int ret = -ENODEV;
+	const char *parents[2];
 
 	regmap = dev_get_regmap(parent, NULL);
 	if (!regmap) {
@@ -61,6 +62,9 @@ static int qcom_apcs_msm8916_clk_probe(struct platform_device *pdev)
 	if (!a53cc)
 		return -ENOMEM;
 
+	if (of_clk_parent_fill(parent->of_node, parents, 2) == 2)
+		memcpy(gpll0_a53cc, parents, sizeof(parents));
+
 	init.name = "a53mux";
 	init.parent_names = gpll0_a53cc;
 	init.num_parents = ARRAY_SIZE(gpll0_a53cc);
@@ -76,10 +80,11 @@ static int qcom_apcs_msm8916_clk_probe(struct platform_device *pdev)
 	a53cc->src_shift = 8;
 	a53cc->parent_map = gpll0_a53cc_map;
 
-	a53cc->pclk = devm_clk_get(parent, NULL);
+	a53cc->pclk = of_clk_get(parent->of_node, 0);
 	if (IS_ERR(a53cc->pclk)) {
 		ret = PTR_ERR(a53cc->pclk);
-		dev_err(dev, "failed to get clk: %d\n", ret);
+		if (ret != -EPROBE_DEFER)
+			dev_err(dev, "failed to get clk: %d\n", ret);
 		return ret;
 	}
 
@@ -87,6 +92,7 @@ static int qcom_apcs_msm8916_clk_probe(struct platform_device *pdev)
 	ret = clk_notifier_register(a53cc->pclk, &a53cc->clk_nb);
 	if (ret) {
 		dev_err(dev, "failed to register clock notifier: %d\n", ret);
+		clk_put(a53cc->pclk);
 		return ret;
 	}
 
@@ -109,6 +115,8 @@ static int qcom_apcs_msm8916_clk_probe(struct platform_device *pdev)
 
 err:
 	clk_notifier_unregister(a53cc->pclk, &a53cc->clk_nb);
+	clk_put(a53cc->pclk);
+
 	return ret;
 }
 
@@ -117,6 +125,7 @@ static int qcom_apcs_msm8916_clk_remove(struct platform_device *pdev)
 	struct clk_regmap_mux_div *a53cc = platform_get_drvdata(pdev);
 
 	clk_notifier_unregister(a53cc->pclk, &a53cc->clk_nb);
+	clk_put(a53cc->pclk);
 
 	return 0;
 }
-- 
2.23.0

