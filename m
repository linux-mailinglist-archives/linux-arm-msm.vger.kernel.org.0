Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A87F29317E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Oct 2020 00:49:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388692AbgJSWt4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Oct 2020 18:49:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388690AbgJSWtz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Oct 2020 18:49:55 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1791C0613D4
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2020 15:49:54 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id y14so836667pfp.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2020 15:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JTx26RZgAqCsKfzwkiSZg5rClbsyn6MYzPRoe0bjgYQ=;
        b=bG1yEuj6ghwmVfgv4MprES7oMN1eTrdoAa6hRRtlZrIKE2b9AAw4dS2w1tCdfSVBMe
         DH83hZotlFPjhstXf691gZLmx5T8J5CepQnw5UrsAO8dwVJoPOrkEhPgI15Rusfgj/B4
         BjekasqRLpJw3cw7NjM+LY7RVixma4lBCUGJo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JTx26RZgAqCsKfzwkiSZg5rClbsyn6MYzPRoe0bjgYQ=;
        b=HZirn9LU2BWC/VXiAEvb2UeFv2fYt2JkFLHfZsgNr4YvdTJKNiGF2pcFlSTx4Uwj12
         /t8uq36ouSQSJxM0LbFacGiBwW5+sViRZogWFlZKdkOxYtCnIAh7jUJPlisMzMTV3IYr
         tCJLMN3uXn7DFLo4nuB3pgaMuhpQk2k9o4AwPZpoWotpYb/7POanqpUv1/cNLPLcEHF3
         3uLXtnPdXIoxHr+UFn670A9ZDSsk0QEMYEAWHEdXbinscKjs9zqMOC94/hq/1ZioVnwo
         OR2XPU+GehaB0FFaxWW668KPvrwiqysdL/U7/OTDxbjgOkaf7Gytp5gBimQI90e26sC8
         28ag==
X-Gm-Message-State: AOAM532Zqbgr9eMs3hcFcg09mLr4n/pBPwVNWB9DfgzqN4OH6KYD5zHa
        k4luroz3Hzue8ehdQxq/q/mclg==
X-Google-Smtp-Source: ABdhPJwpVO7kPW23Ns/kgYxg64vbaC4B0ZONbTL6lPXWH3KM7BvUqrwp8hN8gIjiXfBRDuM8wscfRg==
X-Received: by 2002:a62:6044:0:b029:151:1a04:895 with SMTP id u65-20020a6260440000b02901511a040895mr1873256pfb.34.1603147794230;
        Mon, 19 Oct 2020 15:49:54 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id in6sm19912pjb.42.2020.10.19.15.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 15:49:53 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Taniya Das <tdas@codeaurora.org>,
        David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-soc@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/2] clk: qcom: lpass-sc7180: Disentangle the two clock devices
Date:   Mon, 19 Oct 2020 15:49:35 -0700
Message-Id: <20201019154857.v5.2.I75c409497d4dea9daefa53ec5f93824081c4ecbe@changeid>
X-Mailer: git-send-email 2.29.0.rc1.297.gfa9743e501-goog
In-Reply-To: <20201019154857.v5.1.I4567b5e7e17bbb15ef063d447cb83fd43746cb18@changeid>
References: <20201019154857.v5.1.I4567b5e7e17bbb15ef063d447cb83fd43746cb18@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The sc7180 lpass clock driver manages two different devices.  These
two devices were tangled together, using one probe and a lookup to
figure out the real probe.  I think it's cleaner to really separate
the probe for these two devices since they're really different things,
just both managed by the same driver.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Note: this is now a 2-patch cleanup series with no actual bugfixes
since the problem solved by patch #3 was better solved with:

https://lore.kernel.org/r/20201017020137.1251319-1-sboyd@kernel.org

Changes in v5:
- Two blank lines inserted before "return" statements.

Changes in v3:
- ("clk: qcom: lpass-sc7180: Disentangle the two clock devices") new for v3.

 drivers/clk/qcom/lpasscorecc-sc7180.c | 103 ++++++++++++++++----------
 1 file changed, 64 insertions(+), 39 deletions(-)

diff --git a/drivers/clk/qcom/lpasscorecc-sc7180.c b/drivers/clk/qcom/lpasscorecc-sc7180.c
index 2d15e33ec837..1a3925badd7c 100644
--- a/drivers/clk/qcom/lpasscorecc-sc7180.c
+++ b/drivers/clk/qcom/lpasscorecc-sc7180.c
@@ -366,12 +366,39 @@ static void lpass_pm_clk_destroy(void *data)
 	pm_clk_destroy(data);
 }
 
+static int lpass_create_pm_clks(struct platform_device *pdev)
+{
+	int ret;
+
+	pm_runtime_enable(&pdev->dev);
+	ret = devm_add_action_or_reset(&pdev->dev, lpass_pm_runtime_disable, &pdev->dev);
+	if (ret)
+		return ret;
+
+	ret = pm_clk_create(&pdev->dev);
+	if (ret)
+		return ret;
+	ret = devm_add_action_or_reset(&pdev->dev, lpass_pm_clk_destroy, &pdev->dev);
+	if (ret)
+		return ret;
+
+	ret = pm_clk_add(&pdev->dev, "iface");
+	if (ret < 0)
+		dev_err(&pdev->dev, "failed to acquire iface clock\n");
+
+	return ret;
+}
+
 static int lpass_core_cc_sc7180_probe(struct platform_device *pdev)
 {
 	const struct qcom_cc_desc *desc;
 	struct regmap *regmap;
 	int ret;
 
+	ret = lpass_create_pm_clks(pdev);
+	if (ret)
+		return ret;
+
 	lpass_core_cc_sc7180_regmap_config.name = "lpass_audio_cc";
 	desc = &lpass_audio_hm_sc7180_desc;
 	ret = qcom_cc_probe_by_index(pdev, 1, desc);
@@ -402,6 +429,11 @@ static int lpass_core_cc_sc7180_probe(struct platform_device *pdev)
 static int lpass_hm_core_probe(struct platform_device *pdev)
 {
 	const struct qcom_cc_desc *desc;
+	int ret;
+
+	ret = lpass_create_pm_clks(pdev);
+	if (ret)
+		return ret;
 
 	lpass_core_cc_sc7180_regmap_config.name = "lpass_hm_core";
 	desc = &lpass_core_hm_sc7180_desc;
@@ -409,55 +441,28 @@ static int lpass_hm_core_probe(struct platform_device *pdev)
 	return qcom_cc_probe_by_index(pdev, 0, desc);
 }
 
-static const struct of_device_id lpass_core_cc_sc7180_match_table[] = {
+static const struct of_device_id lpass_hm_sc7180_match_table[] = {
 	{
 		.compatible = "qcom,sc7180-lpasshm",
-		.data = lpass_hm_core_probe,
 	},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, lpass_hm_sc7180_match_table);
+
+static const struct of_device_id lpass_core_cc_sc7180_match_table[] = {
 	{
 		.compatible = "qcom,sc7180-lpasscorecc",
-		.data = lpass_core_cc_sc7180_probe,
 	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, lpass_core_cc_sc7180_match_table);
 
-static int lpass_core_sc7180_probe(struct platform_device *pdev)
-{
-	int (*clk_probe)(struct platform_device *p);
-	int ret;
-
-	pm_runtime_enable(&pdev->dev);
-	ret = devm_add_action_or_reset(&pdev->dev, lpass_pm_runtime_disable, &pdev->dev);
-	if (ret)
-		return ret;
-
-	ret = pm_clk_create(&pdev->dev);
-	if (ret)
-		return ret;
-	ret = devm_add_action_or_reset(&pdev->dev, lpass_pm_clk_destroy, &pdev->dev);
-	if (ret)
-		return ret;
-
-	ret = pm_clk_add(&pdev->dev, "iface");
-	if (ret < 0) {
-		dev_err(&pdev->dev, "failed to acquire iface clock\n");
-		return ret;
-	}
-
-	clk_probe = of_device_get_match_data(&pdev->dev);
-	if (!clk_probe)
-		return -EINVAL;
-
-	return clk_probe(pdev);
-}
-
 static const struct dev_pm_ops lpass_core_cc_pm_ops = {
 	SET_RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
 };
 
 static struct platform_driver lpass_core_cc_sc7180_driver = {
-	.probe = lpass_core_sc7180_probe,
+	.probe = lpass_core_cc_sc7180_probe,
 	.driver = {
 		.name = "lpass_core_cc-sc7180",
 		.of_match_table = lpass_core_cc_sc7180_match_table,
@@ -465,17 +470,37 @@ static struct platform_driver lpass_core_cc_sc7180_driver = {
 	},
 };
 
-static int __init lpass_core_cc_sc7180_init(void)
+static const struct dev_pm_ops lpass_hm_pm_ops = {
+	SET_RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
+};
+
+static struct platform_driver lpass_hm_sc7180_driver = {
+	.probe = lpass_hm_core_probe,
+	.driver = {
+		.name = "lpass_hm-sc7180",
+		.of_match_table = lpass_hm_sc7180_match_table,
+		.pm = &lpass_hm_pm_ops,
+	},
+};
+
+static int __init lpass_sc7180_init(void)
 {
-	return platform_driver_register(&lpass_core_cc_sc7180_driver);
+	int ret;
+
+	ret = platform_driver_register(&lpass_core_cc_sc7180_driver);
+	if (ret)
+		return ret;
+
+	return platform_driver_register(&lpass_hm_sc7180_driver);
 }
-subsys_initcall(lpass_core_cc_sc7180_init);
+subsys_initcall(lpass_sc7180_init);
 
-static void __exit lpass_core_cc_sc7180_exit(void)
+static void __exit lpass_sc7180_exit(void)
 {
+	platform_driver_unregister(&lpass_hm_sc7180_driver);
 	platform_driver_unregister(&lpass_core_cc_sc7180_driver);
 }
-module_exit(lpass_core_cc_sc7180_exit);
+module_exit(lpass_sc7180_exit);
 
 MODULE_DESCRIPTION("QTI LPASS_CORE_CC SC7180 Driver");
 MODULE_LICENSE("GPL v2");
-- 
2.29.0.rc1.297.gfa9743e501-goog

