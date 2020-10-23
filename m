Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55803297033
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Oct 2020 15:19:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S464446AbgJWNTl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Oct 2020 09:19:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S464437AbgJWNTi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Oct 2020 09:19:38 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6932C0613CE
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2020 06:19:36 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id c21so1544983ljj.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2020 06:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AqOOQJkhUfvKoNHnpeyzoyANmDhc3aHrYoF+q2ExrGE=;
        b=X9/k2IJLvlOHdTHBPXpgN4RmgFl3Oq62n61bxmVEhlMNmljFgL94Rd4cOvNlRLehAD
         GIS4FbH9mh3Qvqh0/li1DbfMKSjAImGtgWKCqn7IKBgyGAChiOLr5kXnwDQjzgRyyWHr
         CcATQGMj704tN98Lp+HEFgs1L3wG424ko9dpXlQurxVu42r4vqzwPvtkoa1X/BxpDqeI
         651Cdtn6q/zdmRJNAXHxY9OJFX8uoc9xa3XLMxdCE1SMnvNn0OtlzNr1TVUPPIA3jd0R
         G0PAvM53ysGj/72ELEYqo4xYNjgWPkduqv3fdkEiVjbB/JdCW+tZqtC4BTqyGkJMkYJ0
         Da7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AqOOQJkhUfvKoNHnpeyzoyANmDhc3aHrYoF+q2ExrGE=;
        b=Qbp7rL77aA9jiS0FuycU5KQRbJhJFGqCF8VvHEbXKVO+j7asPng0kj7slYRVPGFmjH
         j3wldHVA6b2RQUSTnKa8WEVOtVQW4lE4B7aNbtVPSNUDCLiu+IsNUrQRvzMSKw4Cdyzi
         O95gY/MhTbJhM8rmT1v7FE5nx+zyFKvAxcim9SfYtwGXpL/ajiNSoLa074AmvtNBfICN
         1pL20f9FCG9779HPQtSkf7qkCUAiRam+r8YUb2oFBqaJGdZiBGilIqebHcphPWFoP+g0
         pEazk0o/gVxFSHdBA3T6BlzMlHD/ycKnN25IoQhVrSwW9DpXtBb+u9CNrWM/ID6iWpAo
         5bsA==
X-Gm-Message-State: AOAM530Rr98gJ1itr1EHd4pvvlot/RlbaK78akRMcP7wSqVDQd3fpfc3
        +PrV4ycwdqOM2PLj13ZwB6JscA==
X-Google-Smtp-Source: ABdhPJyKYcn13crHVHPIp5NgBoi1S4qmyj+ZQu0TvENFZQFgiwZs7aHHuN23fxPvwDp1+VVti3lVDg==
X-Received: by 2002:a2e:b0e4:: with SMTP id h4mr816744ljl.119.1603459175157;
        Fri, 23 Oct 2020 06:19:35 -0700 (PDT)
Received: from eriador.lan ([188.162.64.195])
        by smtp.gmail.com with ESMTPSA id o22sm161564ljg.122.2020.10.23.06.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2020 06:19:34 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/5] regulator: fixed: support using power domain for enable/disable
Date:   Fri, 23 Oct 2020 16:19:22 +0300
Message-Id: <20201023131925.334864-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201023131925.334864-1-dmitry.baryshkov@linaro.org>
References: <20201023131925.334864-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Adds possibility to choose the compatible "fixed-regulator-domain" for
regulators which use power domain for enabling/disabling corresponding
regulator.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/regulator/fixed.c | 63 +++++++++++++++++++++++++++++++++++----
 1 file changed, 57 insertions(+), 6 deletions(-)

diff --git a/drivers/regulator/fixed.c b/drivers/regulator/fixed.c
index 3de7709bdcd4..02ad83153e19 100644
--- a/drivers/regulator/fixed.c
+++ b/drivers/regulator/fixed.c
@@ -18,6 +18,8 @@
 #include <linux/mutex.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/pm_domain.h>
+#include <linux/pm_opp.h>
 #include <linux/regulator/driver.h>
 #include <linux/regulator/fixed.h>
 #include <linux/gpio/consumer.h>
@@ -34,11 +36,13 @@ struct fixed_voltage_data {
 	struct regulator_dev *dev;
 
 	struct clk *enable_clock;
-	unsigned int clk_enable_counter;
+	unsigned int enable_counter;
+	int performance_state;
 };
 
 struct fixed_dev_type {
 	bool has_enable_clock;
+	bool has_performance_state;
 };
 
 static int reg_clock_enable(struct regulator_dev *rdev)
@@ -50,7 +54,7 @@ static int reg_clock_enable(struct regulator_dev *rdev)
 	if (ret)
 		return ret;
 
-	priv->clk_enable_counter++;
+	priv->enable_counter++;
 
 	return ret;
 }
@@ -60,16 +64,41 @@ static int reg_clock_disable(struct regulator_dev *rdev)
 	struct fixed_voltage_data *priv = rdev_get_drvdata(rdev);
 
 	clk_disable_unprepare(priv->enable_clock);
-	priv->clk_enable_counter--;
+	priv->enable_counter--;
 
 	return 0;
 }
 
-static int reg_clock_is_enabled(struct regulator_dev *rdev)
+static int reg_domain_enable(struct regulator_dev *rdev)
 {
 	struct fixed_voltage_data *priv = rdev_get_drvdata(rdev);
+	struct device *dev = rdev->dev.parent;
+	int ret;
+
+	ret = dev_pm_genpd_set_performance_state(dev, priv->performance_state);
+	if (ret)
+		return ret;
 
-	return priv->clk_enable_counter > 0;
+	priv->enable_counter++;
+
+	return ret;
+}
+
+static int reg_domain_disable(struct regulator_dev *rdev)
+{
+	struct fixed_voltage_data *priv = rdev_get_drvdata(rdev);
+	struct device *dev = rdev->dev.parent;
+
+	priv->enable_counter--;
+
+	return dev_pm_genpd_set_performance_state(dev, 0);
+}
+
+static int reg_is_enabled(struct regulator_dev *rdev)
+{
+	struct fixed_voltage_data *priv = rdev_get_drvdata(rdev);
+
+	return priv->enable_counter > 0;
 }
 
 
@@ -129,7 +158,13 @@ static const struct regulator_ops fixed_voltage_ops = {
 static const struct regulator_ops fixed_voltage_clkenabled_ops = {
 	.enable = reg_clock_enable,
 	.disable = reg_clock_disable,
-	.is_enabled = reg_clock_is_enabled,
+	.is_enabled = reg_is_enabled,
+};
+
+static const struct regulator_ops fixed_voltage_domain_ops = {
+	.enable = reg_domain_enable,
+	.disable = reg_domain_disable,
+	.is_enabled = reg_is_enabled,
 };
 
 static int reg_fixed_voltage_probe(struct platform_device *pdev)
@@ -177,6 +212,14 @@ static int reg_fixed_voltage_probe(struct platform_device *pdev)
 			dev_err(dev, "Can't get enable-clock from devicetree\n");
 			return -ENOENT;
 		}
+	} else if (drvtype && drvtype->has_performance_state) {
+		drvdata->desc.ops = &fixed_voltage_domain_ops;
+
+		drvdata->performance_state = of_get_required_opp_performance_state(dev->of_node, 0);
+		if (drvdata->performance_state < 0) {
+			dev_err(dev, "Can't get performance state from devicetree\n");
+			return drvdata->performance_state;
+		}
 	} else {
 		drvdata->desc.ops = &fixed_voltage_ops;
 	}
@@ -260,6 +303,10 @@ static const struct fixed_dev_type fixed_clkenable_data = {
 	.has_enable_clock = true,
 };
 
+static const struct fixed_dev_type fixed_domain_data = {
+	.has_performance_state = true,
+};
+
 static const struct of_device_id fixed_of_match[] = {
 	{
 		.compatible = "regulator-fixed",
@@ -269,6 +316,10 @@ static const struct of_device_id fixed_of_match[] = {
 		.compatible = "regulator-fixed-clock",
 		.data = &fixed_clkenable_data,
 	},
+	{
+		.compatible = "regulator-fixed-domain",
+		.data = &fixed_domain_data,
+	},
 	{
 	},
 };
-- 
2.28.0

