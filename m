Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC5CA3B8329
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jun 2021 15:32:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235055AbhF3Neb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Jun 2021 09:34:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235142AbhF3Ne1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Jun 2021 09:34:27 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A3EBC06121D
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jun 2021 06:31:56 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id k8so3323542lja.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jun 2021 06:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Tl387mt4MjPWYSU9zDyMRbXy2Bncp1nuQ43d/RB/LnM=;
        b=JduIj8fmPPWcgRmNiuAVOpaJbgEzPiW5eHQxRYoFuPr6B7eF6W9aLTrDrt/c5ffgGL
         RI61ZznbBIZUfbgQyCRGkf+dGP1oS4S2bigChpjQHSUoqFok0d9cSsch1t5SCmWx83GF
         N8bJSTR9kV5eKwtGpSLPWw4d4Ft+41EVNw3hBCf/0kOrdZ6dPXJ4U5SYLstdqwCBfNTn
         KDWI3zqquRv5XG+LajKUWwUB70gWBJSQ2/ZFAx8oAJBpidpX0vPzrsmLQl9V/tOU3AK3
         eMSIV5DN1di9s26XDc1rfDXduZH+L5WWFU8na6b/p+9ekoAPs56//nvcAgx0mH8PDQKh
         BWGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Tl387mt4MjPWYSU9zDyMRbXy2Bncp1nuQ43d/RB/LnM=;
        b=oVv4iexZG5NI1O7iXUlb1FeVK+UBar5M8OyEt/Nccw/8s2M7cPjYjpCB7fXJIyK1mb
         QiEc16+WQTxGxaCMG1BEp5tFjSFpchFoMcx59TMTdq51WBNCT0utLoOS3DMoffGnHMpQ
         1oCFz1ZyD0tRCCIaRSvFxGAP+iaD2T4mZqOMRTj3Os68pGEz8FT/BTPIXvU5IO1YZU1A
         u68c+xK6cegV9zZaZyMjb6kTdPLiRgNsTS56vkA2nPjxBSH+az6+Tz4E2N2SrzpH5/Ko
         bz250POW3BAunxs9xjwiJ+vbdMcpYbpS+8Crr7ItTHJsUO37cIaCX3EY7prERfkwyfjM
         JyrQ==
X-Gm-Message-State: AOAM531arHcC33WUSufoQ51CofwCZcKB+JZV8ifa++3YNsUnlARnYVYm
        RfzPkGOMx5fFM2NZsaLQ2Jx4kw==
X-Google-Smtp-Source: ABdhPJwEAm31OeTgk7DR5OOhWDZZsb8Av/WIF5iSuYoWL6cjfvUQaYaTsAoKSBFxL1PoM1iv3OIDog==
X-Received: by 2002:a2e:a548:: with SMTP id e8mr7895530ljn.331.1625059914751;
        Wed, 30 Jun 2021 06:31:54 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id x20sm1578098lfd.128.2021.06.30.06.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jun 2021 06:31:54 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/6] clk: qcom: gdsc: enable optional power domain support
Date:   Wed, 30 Jun 2021 16:31:46 +0300
Message-Id: <20210630133149.3204290-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210630133149.3204290-1-dmitry.baryshkov@linaro.org>
References: <20210630133149.3204290-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On sm8250 dispcc and videocc registers are powered up by the MMCX power
domain. Currently we used a regulator to enable this domain on demand,
however this has some consequences, as genpd code is not reentrant.

Teach Qualcomm clock controller code about setting up power domains and
using them for gdsc control.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/common.c | 55 ++++++++++++++++++++++++++++++++++-----
 drivers/clk/qcom/gdsc.c   |  6 +++++
 2 files changed, 55 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index 60d2a78d1395..eeb5b8c93032 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -10,6 +10,8 @@
 #include <linux/clk-provider.h>
 #include <linux/reset-controller.h>
 #include <linux/of.h>
+#include <linux/pm_opp.h>
+#include <linux/pm_runtime.h>
 
 #include "common.h"
 #include "clk-rcg.h"
@@ -76,6 +78,16 @@ qcom_cc_map(struct platform_device *pdev, const struct qcom_cc_desc *desc)
 	struct resource *res;
 	struct device *dev = &pdev->dev;
 
+	if (of_find_property(dev->of_node, "required-opps", NULL)) {
+		int pd_opp;
+
+		pd_opp = of_get_required_opp_performance_state(dev->of_node, 0);
+		if (pd_opp < 0)
+			return ERR_PTR(pd_opp);
+
+		dev_pm_genpd_set_performance_state(dev, pd_opp);
+	}
+
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	base = devm_ioremap_resource(dev, res);
 	if (IS_ERR(base))
@@ -224,6 +236,11 @@ static struct clk_hw *qcom_cc_clk_hw_get(struct of_phandle_args *clkspec,
 	return cc->rclks[idx] ? &cc->rclks[idx]->hw : NULL;
 }
 
+static void qcom_cc_pm_runtime_disable(void *data)
+{
+	pm_runtime_disable(data);
+}
+
 int qcom_cc_really_probe(struct platform_device *pdev,
 			 const struct qcom_cc_desc *desc, struct regmap *regmap)
 {
@@ -236,11 +253,28 @@ int qcom_cc_really_probe(struct platform_device *pdev,
 	struct clk_regmap **rclks = desc->clks;
 	size_t num_clk_hws = desc->num_clk_hws;
 	struct clk_hw **clk_hws = desc->clk_hws;
+	bool use_pm = false;
 
 	cc = devm_kzalloc(dev, sizeof(*cc), GFP_KERNEL);
 	if (!cc)
 		return -ENOMEM;
 
+	if (of_find_property(dev->of_node, "required-opps", NULL)) {
+		use_pm = true;
+
+		pm_runtime_enable(dev);
+		ret = pm_runtime_get_sync(dev);
+		if (ret < 0) {
+			pm_runtime_put(dev);
+			pm_runtime_disable(dev);
+			return ret;
+		}
+
+		ret = devm_add_action_or_reset(dev, qcom_cc_pm_runtime_disable, dev);
+		if (ret)
+			return ret;
+	}
+
 	reset = &cc->reset;
 	reset->rcdev.of_node = dev->of_node;
 	reset->rcdev.ops = &qcom_reset_ops;
@@ -251,7 +285,7 @@ int qcom_cc_really_probe(struct platform_device *pdev,
 
 	ret = devm_reset_controller_register(dev, &reset->rcdev);
 	if (ret)
-		return ret;
+		goto err;
 
 	if (desc->gdscs && desc->num_gdscs) {
 		scd = devm_kzalloc(dev, sizeof(*scd), GFP_KERNEL);
@@ -262,11 +296,11 @@ int qcom_cc_really_probe(struct platform_device *pdev,
 		scd->num = desc->num_gdscs;
 		ret = gdsc_register(scd, &reset->rcdev, regmap);
 		if (ret)
-			return ret;
+			goto err;
 		ret = devm_add_action_or_reset(dev, qcom_cc_gdsc_unregister,
 					       scd);
 		if (ret)
-			return ret;
+			goto err;
 	}
 
 	cc->rclks = rclks;
@@ -277,7 +311,7 @@ int qcom_cc_really_probe(struct platform_device *pdev,
 	for (i = 0; i < num_clk_hws; i++) {
 		ret = devm_clk_hw_register(dev, clk_hws[i]);
 		if (ret)
-			return ret;
+			goto err;
 	}
 
 	for (i = 0; i < num_clks; i++) {
@@ -286,14 +320,23 @@ int qcom_cc_really_probe(struct platform_device *pdev,
 
 		ret = devm_clk_register_regmap(dev, rclks[i]);
 		if (ret)
-			return ret;
+			goto err;
 	}
 
 	ret = devm_of_clk_add_hw_provider(dev, qcom_cc_clk_hw_get, cc);
 	if (ret)
-		return ret;
+		goto err;
+
+	if (use_pm)
+		pm_runtime_put(dev);
 
 	return 0;
+
+err:
+	if (use_pm)
+		pm_runtime_put(dev);
+
+	return ret;
 }
 EXPORT_SYMBOL_GPL(qcom_cc_really_probe);
 
diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
index 51ed640e527b..40c384bda4fc 100644
--- a/drivers/clk/qcom/gdsc.c
+++ b/drivers/clk/qcom/gdsc.c
@@ -11,6 +11,7 @@
 #include <linux/kernel.h>
 #include <linux/ktime.h>
 #include <linux/pm_domain.h>
+#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/reset-controller.h>
@@ -237,6 +238,8 @@ static int gdsc_enable(struct generic_pm_domain *domain)
 	struct gdsc *sc = domain_to_gdsc(domain);
 	int ret;
 
+	pm_runtime_get_sync(domain->dev.parent);
+
 	if (sc->pwrsts == PWRSTS_ON)
 		return gdsc_deassert_reset(sc);
 
@@ -326,6 +329,8 @@ static int gdsc_disable(struct generic_pm_domain *domain)
 	if (sc->flags & CLAMP_IO)
 		gdsc_assert_clamp_io(sc);
 
+	pm_runtime_put(domain->dev.parent);
+
 	return 0;
 }
 
@@ -427,6 +432,7 @@ int gdsc_register(struct gdsc_desc *desc,
 			continue;
 		scs[i]->regmap = regmap;
 		scs[i]->rcdev = rcdev;
+		scs[i]->pd.dev.parent = desc->dev;
 		ret = gdsc_init(scs[i]);
 		if (ret)
 			return ret;
-- 
2.30.2

