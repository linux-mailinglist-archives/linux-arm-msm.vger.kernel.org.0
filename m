Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A868442B33
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Nov 2021 10:58:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231383AbhKBKAU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Nov 2021 06:00:20 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:19017 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231176AbhKBKAO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Nov 2021 06:00:14 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1635847060; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=xEp4cY0mLa1do9x2vcWS+WYrDvGl3H3y8rLCPQj0v4Y=; b=Ynzks8zqnvIZ1YMduiDntXRVq34OF0z+hoserZf0S2cY9I3H49und+5O4GfJQI8ZHQUJoLBn
 Yf00ibUKXOujYA/F9JdljUDCdB1B+I+2hC32b2XL6pUIOELfKdhCvYtZ9LLx+d+Vh7sOKHXs
 TwyR9gw2NCHu9S/Iqf5oVajMEsQ=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 61810b7df6a3eeacf97cc6bb (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 02 Nov 2021 09:57:17
 GMT
Sender: tdas=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 21204C43617; Tue,  2 Nov 2021 09:57:17 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from tdas-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 617A1C4360D;
        Tue,  2 Nov 2021 09:57:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 617A1C4360D
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Taniya Das <tdas@codeaurora.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Michael=20Turquette=20=C2=A0?= <mturquette@baylibre.com>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v1 2/4] clk: qcom: gdsc: Add support for clock voting from GDSC
Date:   Tue,  2 Nov 2021 15:26:51 +0530
Message-Id: <1635847013-3220-3-git-send-email-tdas@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635847013-3220-1-git-send-email-tdas@codeaurora.org>
References: <1635847013-3220-1-git-send-email-tdas@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In the cases where the clock is required to be enabled before the genpd
enable add support for the same.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
---
 drivers/clk/qcom/gdsc.c | 45 +++++++++++++++++++++++++++++++++++++++------
 drivers/clk/qcom/gdsc.h |  3 +++
 2 files changed, 42 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
index 7e1dd8c..1caca32 100644
--- a/drivers/clk/qcom/gdsc.c
+++ b/drivers/clk/qcom/gdsc.c
@@ -4,6 +4,7 @@
  */

 #include <linux/bitops.h>
+#include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/export.h>
@@ -256,6 +257,15 @@ static int _gdsc_enable(struct gdsc *sc)
 	if (sc->pwrsts == PWRSTS_ON)
 		return gdsc_deassert_reset(sc);

+	if (sc->clk) {
+		ret = clk_enable(sc->clk);
+		if (ret) {
+			pr_err("Failed to enable clock %s\n", sc->clk_name);
+			return ret;
+		}
+		sc->clk_enable = true;
+	}
+
 	if (sc->flags & SW_RESET) {
 		gdsc_assert_reset(sc);
 		udelay(1);
@@ -269,8 +279,11 @@ static int _gdsc_enable(struct gdsc *sc)
 	}

 	ret = gdsc_toggle_logic(sc, GDSC_ON);
-	if (ret)
+	if (ret) {
+		if (sc->clk)
+			clk_disable(sc->clk);
 		return ret;
+	}

 	if (sc->pwrsts & PWRSTS_OFF)
 		gdsc_force_mem_on(sc);
@@ -287,8 +300,12 @@ static int _gdsc_enable(struct gdsc *sc)
 	/* Turn on HW trigger mode if supported */
 	if (sc->flags & HW_CTRL) {
 		ret = gdsc_hwctrl(sc, true);
-		if (ret)
+		if (ret) {
+			if (sc->clk)
+				clk_disable(sc->clk);
 			return ret;
+		}
+
 		/*
 		 * Wait for the GDSC to go through a power down and
 		 * up cycle.  In case a firmware ends up polling status
@@ -329,7 +346,7 @@ static int _gdsc_disable(struct gdsc *sc)
 	if (sc->flags & HW_CTRL) {
 		ret = gdsc_hwctrl(sc, false);
 		if (ret < 0)
-			return ret;
+			goto disable_clk;
 		/*
 		 * Wait for the GDSC to go through a power down and
 		 * up cycle.  In case we end up polling status
@@ -340,7 +357,7 @@ static int _gdsc_disable(struct gdsc *sc)

 		ret = gdsc_poll_status(sc, GDSC_ON);
 		if (ret)
-			return ret;
+			goto disable_clk;
 	}

 	if (sc->pwrsts & PWRSTS_OFF)
@@ -348,12 +365,16 @@ static int _gdsc_disable(struct gdsc *sc)

 	ret = gdsc_toggle_logic(sc, GDSC_OFF);
 	if (ret)
-		return ret;
+		goto disable_clk;

 	if (sc->flags & CLAMP_IO)
 		gdsc_assert_clamp_io(sc);

-	return 0;
+disable_clk:
+	if (sc->clk && sc->clk_enable)
+		clk_disable(sc->clk);
+
+	return ret;
 }

 static int gdsc_disable(struct generic_pm_domain *domain)
@@ -478,6 +499,18 @@ int gdsc_register(struct gdsc_desc *desc,
 			return PTR_ERR(scs[i]->rsupply);
 	}

+	for (i = 0; i < num; i++) {
+		if (!scs[i])
+			continue;
+
+		scs[i]->clk = devm_clk_get(dev, scs[i]->clk_name);
+		if (IS_ERR(scs[i]->clk))
+			return PTR_ERR(scs[i]->clk);
+		ret = clk_prepare(scs[i]->clk);
+		if (ret)
+			return ret;
+	}
+
 	data->num_domains = num;
 	for (i = 0; i < num; i++) {
 		if (!scs[i])
diff --git a/drivers/clk/qcom/gdsc.h b/drivers/clk/qcom/gdsc.h
index 702d47a..cff5440 100644
--- a/drivers/clk/qcom/gdsc.h
+++ b/drivers/clk/qcom/gdsc.h
@@ -59,6 +59,9 @@ struct gdsc {

 	const char 			*supply;
 	struct regulator		*rsupply;
+	const char			*clk_name;
+	struct clk			*clk;
+	bool				clk_enable;
 	struct device 			*dev;
 };

--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.

