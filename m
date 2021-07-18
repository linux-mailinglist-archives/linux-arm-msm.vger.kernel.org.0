Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0726F3CC88E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Jul 2021 12:49:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232851AbhGRKwQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 18 Jul 2021 06:52:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233046AbhGRKwM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 18 Jul 2021 06:52:12 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E78D8C0613DE
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 Jul 2021 03:49:13 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id h9so21213216ljm.5
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 Jul 2021 03:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lYWJNz4RjhdOK3xgOEToM1HEgwLI9uBrUK4vDt0ZL48=;
        b=zpvRKC8FyYNchdzHLterZZRcnXOibDPnmrNJbeuyo3fw3zuEhDgQCJ0dpuJpARUqyT
         NtVCUUvQTSPYP6yecupgZVu4E/yvMyP4jnDJs5OpT/Cq3CZ8pb5E0v+wVVyrvTqPopSr
         MRifeAA1c5W7vyNaIlPiz1Z1uSbyNF4BhY+DaVJpiRCeLALGPCRzjCpywOL82F+hjzD6
         QDeh1Gs1ePASoscEhcv5Y8RXy2uJTQudBra0sJbsxOFsRsP7SaoQGaqYOYre+Y2LADpS
         JI+oRXfwQAj4X3bMB/izS8Z3VF39Qbusf79Ar5fy/7736ptLRmEIG99vfX3KVyymnjI9
         +fvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lYWJNz4RjhdOK3xgOEToM1HEgwLI9uBrUK4vDt0ZL48=;
        b=IM5Ct8Y3Ndc9vdUef7fQETXx6dE2YgeMm+O4AUYC5UGYaPI5gj46QsQzSmuFOKyYUv
         RXB+QzoliHBbt7QxXd6XQevLYdbyS4hIg032yT0ZwYoneXHE+vAP08/8VMCzsYG9YaDT
         /liXIGx5MwQGMEMHYM/QFyogenuKfi1W3OXALrnVqpQiuCY13nSie/QUdmkFMsO0a2xD
         DfpqlExHNf7+JcJICt3JcuGhM6z1knfoAuPVPnsMx4ztQIspav+vknQx14nfuClsoS3G
         junYSG4lIIZm5e1COCScd99yhUZtRP3hpWeF4On5zX0oEQAj2HyuWccZHcr6RC3NcQ31
         Xzxg==
X-Gm-Message-State: AOAM531PqpxcjGeBlLtG9LILGEebk/s+kW3t6kuX7fL6rcPnRpQg2y4S
        eYkHhKA9IGSrtNM+fHUYN3E9LA==
X-Google-Smtp-Source: ABdhPJwoq3uuZ5wcVgOC89J45Vc8WLkFm1xkOj3Zpon6mb2K7wzf5/lKITc7L981i6t6HT4hGeJYKg==
X-Received: by 2002:a05:651c:1253:: with SMTP id h19mr17404671ljh.303.1626605352314;
        Sun, 18 Jul 2021 03:49:12 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id y22sm1039528lfh.154.2021.07.18.03.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jul 2021 03:49:11 -0700 (PDT)
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
Subject: [PATCH v5 6/9] clk: qcom: gdsc: enable optional power domain support
Date:   Sun, 18 Jul 2021 13:48:58 +0300
Message-Id: <20210718104901.454843-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210718104901.454843-1-dmitry.baryshkov@linaro.org>
References: <20210718104901.454843-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On sm8250 dispcc and videocc registers are powered up by the MMCX power
domain. Currently we use a regulator to enable this domain on demand,
however this has some consequences, as genpd code is not reentrant.

Make gdsc code also use pm_runtime calls to ensure that registers are
accessible during the gdsc_enable/gdsc_disable operations.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gdsc.c | 59 ++++++++++++++++++++++++++++++++++++++---
 drivers/clk/qcom/gdsc.h |  2 ++
 2 files changed, 58 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
index 51ed640e527b..a0781d7284cc 100644
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
@@ -50,6 +51,22 @@ enum gdsc_status {
 	GDSC_ON
 };
 
+static int gdsc_pm_runtime_get(struct gdsc *sc)
+{
+	if (!sc->dev)
+		return 0;
+
+	return pm_runtime_resume_and_get(sc->dev);
+}
+
+static int gdsc_pm_runtime_put(struct gdsc *sc)
+{
+	if (!sc->dev)
+		return 0;
+
+	return pm_runtime_put_sync(sc->dev);
+}
+
 /* Returns 1 if GDSC status is status, 0 if not, and < 0 on error */
 static int gdsc_check_status(struct gdsc *sc, enum gdsc_status status)
 {
@@ -232,9 +249,8 @@ static void gdsc_retain_ff_on(struct gdsc *sc)
 	regmap_update_bits(sc->regmap, sc->gdscr, mask, mask);
 }
 
-static int gdsc_enable(struct generic_pm_domain *domain)
+static int _gdsc_enable(struct gdsc *sc)
 {
-	struct gdsc *sc = domain_to_gdsc(domain);
 	int ret;
 
 	if (sc->pwrsts == PWRSTS_ON)
@@ -290,11 +306,26 @@ static int gdsc_enable(struct generic_pm_domain *domain)
 	return 0;
 }
 
-static int gdsc_disable(struct generic_pm_domain *domain)
+static int gdsc_enable(struct generic_pm_domain *domain)
 {
 	struct gdsc *sc = domain_to_gdsc(domain);
 	int ret;
 
+	ret = gdsc_pm_runtime_get(sc);
+	if (ret)
+		return ret;
+
+	ret = _gdsc_enable(sc);
+
+	gdsc_pm_runtime_put(sc);
+
+	return ret;
+}
+
+static int _gdsc_disable(struct gdsc *sc)
+{
+	int ret;
+
 	if (sc->pwrsts == PWRSTS_ON)
 		return gdsc_assert_reset(sc);
 
@@ -329,6 +360,22 @@ static int gdsc_disable(struct generic_pm_domain *domain)
 	return 0;
 }
 
+static int gdsc_disable(struct generic_pm_domain *domain)
+{
+	struct gdsc *sc = domain_to_gdsc(domain);
+	int ret;
+
+	ret = gdsc_pm_runtime_get(sc);
+	if (ret)
+		return ret;
+
+	ret = _gdsc_disable(sc);
+
+	gdsc_pm_runtime_put(sc);
+
+	return ret;
+}
+
 static int gdsc_init(struct gdsc *sc)
 {
 	u32 mask, val;
@@ -425,6 +472,8 @@ int gdsc_register(struct gdsc_desc *desc,
 	for (i = 0; i < num; i++) {
 		if (!scs[i])
 			continue;
+		if (pm_runtime_enabled(dev))
+			scs[i]->dev = dev;
 		scs[i]->regmap = regmap;
 		scs[i]->rcdev = rcdev;
 		ret = gdsc_init(scs[i]);
@@ -439,6 +488,8 @@ int gdsc_register(struct gdsc_desc *desc,
 			continue;
 		if (scs[i]->parent)
 			pm_genpd_add_subdomain(scs[i]->parent, &scs[i]->pd);
+		else if (!IS_ERR_OR_NULL(dev->pm_domain))
+			pm_genpd_add_subdomain(pd_to_genpd(dev->pm_domain), &scs[i]->pd);
 	}
 
 	return of_genpd_add_provider_onecell(dev->of_node, data);
@@ -457,6 +508,8 @@ void gdsc_unregister(struct gdsc_desc *desc)
 			continue;
 		if (scs[i]->parent)
 			pm_genpd_remove_subdomain(scs[i]->parent, &scs[i]->pd);
+		else if (!IS_ERR_OR_NULL(dev->pm_domain))
+			pm_genpd_remove_subdomain(pd_to_genpd(dev->pm_domain), &scs[i]->pd);
 	}
 	of_genpd_del_provider(dev->of_node);
 }
diff --git a/drivers/clk/qcom/gdsc.h b/drivers/clk/qcom/gdsc.h
index 5bb396b344d1..702d47a87af6 100644
--- a/drivers/clk/qcom/gdsc.h
+++ b/drivers/clk/qcom/gdsc.h
@@ -25,6 +25,7 @@ struct reset_controller_dev;
  * @resets: ids of resets associated with this gdsc
  * @reset_count: number of @resets
  * @rcdev: reset controller
+ * @dev: the device holding the GDSC, used for pm_runtime calls
  */
 struct gdsc {
 	struct generic_pm_domain	pd;
@@ -58,6 +59,7 @@ struct gdsc {
 
 	const char 			*supply;
 	struct regulator		*rsupply;
+	struct device 			*dev;
 };
 
 struct gdsc_desc {
-- 
2.30.2

