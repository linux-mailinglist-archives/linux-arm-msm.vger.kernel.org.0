Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 341861AD6AE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2020 09:01:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728234AbgDQHBN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Apr 2020 03:01:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728083AbgDQHBL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Apr 2020 03:01:11 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F723C061A41
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2020 00:01:11 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id t11so679310pgg.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2020 00:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yknmXxbqGxVfxrNz0jvbTW2mgVTxtXbV4FI/gCIqcjM=;
        b=civ0gk1keolqnPGVaUGkyNSJDvVGU8ajyEYU3VaMBeM0lgdwWv5cMHq80pGerPytVm
         XBJXBtZa38KYD3dTapc4WNr9WFNQbJBFIu7KWxHcnyby2tihC4fsexPQQCQClq40NVyV
         aVve2BQivQFk9fn4IjdsAfwQLVfheYEWGhHWn9wpcpRkv8qBSsux16mO8yrr41qZJ8ZI
         vQbG4WQTcBVJ/ais/d6KHidfArAzBMss1PQEPe8ebx3Cg1V+QwasTyRFb2vm4SdaQSSL
         BO/MjafY2c6wQkij+Bv8W+OCVT+iSYl8CJdx3YADy4+60SCTiGfHILXYq+H175/xlLQj
         3/Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yknmXxbqGxVfxrNz0jvbTW2mgVTxtXbV4FI/gCIqcjM=;
        b=nt/Oo2ve0TQApiYN64K11SwdRKZj9akzSs9z1kcndtjdrNWkLrRJKLwg1RtKC1ZF8m
         NQfeX7Ws8BikRrn5CTzAfRK4v9a6dtX0hV/SnRe5xZQd+wZzpylTm/esDVfpv0CLjka4
         342g5vXZjm2AZjJdoIRi3vT9Z/BMRL+Oj9dtaJfEXBg9auJXIKN/gtG9nFAL+Wj1OE9K
         jbEnINo/QNhXTaPCMyI+VN1Bh4wcvJkCk4fkFfmVsilvcm6tPT6COq8aOjZbLDjuIRnq
         fwCpIZx7b6BXwRFtkhFPCqWWSOPQciChTtHGnsoHPGUEuIOQQp4seD4idni8iG7XPsBs
         zV1A==
X-Gm-Message-State: AGi0PuZhhox7/7zntUj3FuJ2/JyIAX8aJm+DVBaiQOiJiMT3jC+mic42
        /6txDLU62/fKdUHybn2JX1uIrw==
X-Google-Smtp-Source: APiQypLVvbrjumlCLlmTCPuXNewSaDSHjE0x0aDETbToJCw1qIkwOjllFHprFIl39+UtGyokRT4g1Q==
X-Received: by 2002:a05:6a00:2cf:: with SMTP id b15mr1777440pft.174.1587106870611;
        Fri, 17 Apr 2020 00:01:10 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id c125sm18561609pfa.142.2020.04.17.00.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2020 00:01:09 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] clk: qcom: gdsc: Handle GDSC regulator supplies
Date:   Fri, 17 Apr 2020 00:00:41 -0700
Message-Id: <20200417070044.1376212-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200417070044.1376212-1-bjorn.andersson@linaro.org>
References: <20200417070044.1376212-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Certain GDSCs, such as the GPU_GX on MSM8996, requires that the upstream
regulator supply is powered in order to be turned on.

It's not guaranteed that the bootloader will leave these supplies on and
the driver core will attempt to enable any GDSCs before allowing the
individual drivers to probe defer on the PMIC regulator driver not yet
being present.

So the gdsc driver needs to be made aware of supplying regulators and
probe defer on their absence, and it needs to enable and disable the
regulator accordingly.

Voltage adjustments of the supplying regulator are deferred to the
client drivers themselves.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- Sorted includes
- Dropped unnecessary comment

 drivers/clk/qcom/gdsc.c | 23 +++++++++++++++++++++++
 drivers/clk/qcom/gdsc.h |  4 ++++
 2 files changed, 27 insertions(+)

diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
index a250f59708d8..04944f11659b 100644
--- a/drivers/clk/qcom/gdsc.c
+++ b/drivers/clk/qcom/gdsc.c
@@ -11,6 +11,7 @@
 #include <linux/ktime.h>
 #include <linux/pm_domain.h>
 #include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
 #include <linux/reset-controller.h>
 #include <linux/slab.h>
 #include "gdsc.h"
@@ -112,6 +113,12 @@ static int gdsc_toggle_logic(struct gdsc *sc, enum gdsc_status status)
 	int ret;
 	u32 val = (status == GDSC_ON) ? 0 : SW_COLLAPSE_MASK;
 
+	if (status == GDSC_ON && sc->rsupply) {
+		ret = regulator_enable(sc->rsupply);
+		if (ret < 0)
+			return ret;
+	}
+
 	ret = regmap_update_bits(sc->regmap, sc->gdscr, SW_COLLAPSE_MASK, val);
 	if (ret)
 		return ret;
@@ -143,6 +150,13 @@ static int gdsc_toggle_logic(struct gdsc *sc, enum gdsc_status status)
 
 	ret = gdsc_poll_status(sc, status);
 	WARN(ret, "%s status stuck at 'o%s'", sc->pd.name, status ? "ff" : "n");
+
+	if (!ret && status == GDSC_OFF && sc->rsupply) {
+		ret = regulator_disable(sc->rsupply);
+		if (ret < 0)
+			return ret;
+	}
+
 	return ret;
 }
 
@@ -371,6 +385,15 @@ int gdsc_register(struct gdsc_desc *desc,
 	if (!data->domains)
 		return -ENOMEM;
 
+	for (i = 0; i < num; i++) {
+		if (!scs[i] || !scs[i]->supply)
+			continue;
+
+		scs[i]->rsupply = devm_regulator_get(dev, scs[i]->supply);
+		if (IS_ERR(scs[i]->rsupply))
+			return PTR_ERR(scs[i]->rsupply);
+	}
+
 	data->num_domains = num;
 	for (i = 0; i < num; i++) {
 		if (!scs[i])
diff --git a/drivers/clk/qcom/gdsc.h b/drivers/clk/qcom/gdsc.h
index 64cdc8cf0d4d..c36fc26dcdff 100644
--- a/drivers/clk/qcom/gdsc.h
+++ b/drivers/clk/qcom/gdsc.h
@@ -10,6 +10,7 @@
 #include <linux/pm_domain.h>
 
 struct regmap;
+struct regulator;
 struct reset_controller_dev;
 
 /**
@@ -52,6 +53,9 @@ struct gdsc {
 	struct reset_controller_dev	*rcdev;
 	unsigned int			*resets;
 	unsigned int			reset_count;
+
+	const char 			*supply;
+	struct regulator		*rsupply;
 };
 
 struct gdsc_desc {
-- 
2.24.0

