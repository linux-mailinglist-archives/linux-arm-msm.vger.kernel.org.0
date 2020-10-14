Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B20EC28EA94
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Oct 2020 03:59:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732525AbgJOB7i (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Oct 2020 21:59:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732513AbgJOB7i (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Oct 2020 21:59:38 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EEC1C0613E3
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2020 14:13:32 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id a17so459782pju.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2020 14:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ylSV4Oq4qz/xX1YAW+l4G+GXioVSyeB5dhzFjO2+tps=;
        b=LBmYPQyTXwj0PY8V23RGlNZ4Grq/Xekx8vxkcidHqMpuIqC6Sn9TtxPyskOTL11nxt
         cxDRxQmZoTLiYAevOv11KX9vfC7lRLtaYOahxcJxllpKncjoOfErmmmi7XM/uyBNsF9q
         LGEa5CS0uqZhlPeKSkBsLI/50/STjc63erwzk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ylSV4Oq4qz/xX1YAW+l4G+GXioVSyeB5dhzFjO2+tps=;
        b=UHhtCX8/h+rFS9DLv/aeLaywU/PUxQhQbc6uQTXf/+gdKpoSsewyCiqYYTy5c8L67a
         WVn7VPbY2rjHafeRQBVW0yTe/TVbdLD2E4ui6kScC3Tfbz0Qp3oiwG8F3YLTE/wtXeHe
         uylXwSJCbfd6DfgKu/H+CsnbALr9RgC3Dj6EkBsChA4h1S0SEi5Uyd+K/dJEmuJQCTKT
         0v82vq9NspUkb+kBQsEzuv1uROkqhk7chthtsJm5yeQ8Hem8XzGpx6Ul2ygseiE/Hb6g
         rnHzKrOwaHMjP+j6jXHSOk8BxtNZ0szjoIUB89MzIk1zKcU2cD8SwYvT++fAezMhEtE4
         SPfA==
X-Gm-Message-State: AOAM530SjNO8HGOzhcHCZuvewpeaRNchAejDfm1om6hLDz9td6S6Uc62
        gnv0qXI+ahEuqOaTagm+x9fXzw==
X-Google-Smtp-Source: ABdhPJwwKbRc+Px6RO9uTHVXyy2OpFqERo2NOmZYWoDpx+OnO6nwhsgh97BiSfjYs/q8gT9/P4+jzQ==
X-Received: by 2002:a17:90a:8403:: with SMTP id j3mr1026621pjn.127.1602710011884;
        Wed, 14 Oct 2020 14:13:31 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id p19sm517713pfn.204.2020.10.14.14.13.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2020 14:13:31 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Taniya Das <tdas@codeaurora.org>, linux-soc@vger.kernel.org,
        David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] clk: qcom: lpass-sc7180: Disentangle the two clock devices
Date:   Wed, 14 Oct 2020 14:05:22 -0700
Message-Id: <20201014140507.v3.2.I75c409497d4dea9daefa53ec5f93824081c4ecbe@changeid>
X-Mailer: git-send-email 2.28.0.1011.ga647a8990f-goog
In-Reply-To: <20201014140507.v3.1.I4567b5e7e17bbb15ef063d447cb83fd43746cb18@changeid>
References: <20201014140507.v3.1.I4567b5e7e17bbb15ef063d447cb83fd43746cb18@changeid>
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

Changes in v3:
- ("clk: qcom: lpass-sc7180: Disentangle the two clock devices") new for v3.

 drivers/clk/qcom/lpasscorecc-sc7180.c | 121 +++++++++++++++-----------
 1 file changed, 72 insertions(+), 49 deletions(-)

diff --git a/drivers/clk/qcom/lpasscorecc-sc7180.c b/drivers/clk/qcom/lpasscorecc-sc7180.c
index abcf36006926..48d370e2108e 100644
--- a/drivers/clk/qcom/lpasscorecc-sc7180.c
+++ b/drivers/clk/qcom/lpasscorecc-sc7180.c
@@ -356,12 +356,48 @@ static const struct qcom_cc_desc lpass_audio_hm_sc7180_desc = {
 	.num_gdscs = ARRAY_SIZE(lpass_audio_hm_sc7180_gdscs),
 };
 
+static void lpass_pm_runtime_disable(void *data)
+{
+	pm_runtime_disable(data);
+}
+
+static void lapss_pm_clk_destroy(void *data)
+{
+	pm_clk_destroy(data);
+}
+
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
+	ret = devm_add_action_or_reset(&pdev->dev, lapss_pm_clk_destroy, &pdev->dev);
+	if (ret)
+		return ret;
+
+	ret = pm_clk_add(&pdev->dev, "iface");
+	if (ret < 0)
+		dev_err(&pdev->dev, "failed to acquire iface clock\n");
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
@@ -392,6 +428,11 @@ static int lpass_core_cc_sc7180_probe(struct platform_device *pdev)
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
@@ -399,65 +440,28 @@ static int lpass_hm_core_probe(struct platform_device *pdev)
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
 
-static void lpass_pm_runtime_disable(void *data)
-{
-	pm_runtime_disable(data);
-}
-
-static void lapss_pm_clk_destroy(void *data)
-{
-	pm_clk_destroy(data);
-}
-
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
-	ret = devm_add_action_or_reset(&pdev->dev, lapss_pm_clk_destroy, &pdev->dev);
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
@@ -465,17 +469,36 @@ static struct platform_driver lpass_core_cc_sc7180_driver = {
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
2.28.0.1011.ga647a8990f-goog

