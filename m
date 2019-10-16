Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB6DDD89BD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2019 09:35:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390811AbfJPHfO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Oct 2019 03:35:14 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:46963 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390610AbfJPHfO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Oct 2019 03:35:14 -0400
Received: by mail-pf1-f194.google.com with SMTP id q5so14131153pfg.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Oct 2019 00:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=/kNhWSzT1XF3+/kAR7Dxjp13J1ZI+CyyKCX+EYBQmx8=;
        b=QmzymGkdzTKuxhlQQbG1q+cOpiRxZSL4bdv7TTVHrcS7uAjgk0NhCFOkhZSDoi0agg
         dfs2fDlBES/nfc5WbMchIaqgOFuKZZZ5lnP2maSL3pITe59vcfuNo+veBb7BWXWh9MIN
         elCftBIxAO646pb6sAd0Ej0vLFEYSQITYp6Y1C3BT1toeeScAk8P/zDRxnmDSmdaP4JT
         SDHTUIwg1v6fpMQH3w4yZ5qhnIESZOLl4EL2Q4xdx0dlu1CDgtHge5LJx29Lta020jge
         pnkaZ+gNJ1FCG7Dde3tKXqfEqG87y6g1uMl1gNWmZKMty67hlR5rzQjDrGWHmmnaQV/4
         QLfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=/kNhWSzT1XF3+/kAR7Dxjp13J1ZI+CyyKCX+EYBQmx8=;
        b=Y7rzc2V7QL8qI3RDbgw8m4pc22P5fQKAinvSDfoKX1RRiAoeLVk6OqgYEVKdqOV95R
         4cyUqroqp3Q9mpWFuSASZztHqD1QXXIbCP1Q5bb27E70+gGMj5ODnTrTjTOL9AobTe0s
         Dk+pQvglqhgpXHqX+BAL8E1H1651T3iV6+C5IfsCxPq4LR8m2tAtle5j22cxvz9QH3wG
         LhmDmdCF/cAuP5xNaa/n406+soRf9D7gWFxg5S18ky9jScpgCVc5KaEegpDhUiN3IHVV
         E6eB7KZvru9l0CBQtOt1rwyakHK7xbPVJUyh7/yY8cPj+CG/NCMnwwkb0Ey47jMKRQGM
         g9+g==
X-Gm-Message-State: APjAAAXAji7fhruhFhFMoM/n4RUOt6hnIS9U0Ybc0nwuwSkKxo/4aJjt
        nxYhIU8naz8oCJcL/aVfR/MmZA==
X-Google-Smtp-Source: APXvYqzW3Yokr508aGfspxAB1bRkDKPRBSHVECG1pH9ihR8mBDtUA5nnuAE4IIQT+9sNJ6KNK6RUCA==
X-Received: by 2002:aa7:93de:: with SMTP id y30mr42412010pff.98.1571211313730;
        Wed, 16 Oct 2019 00:35:13 -0700 (PDT)
Received: from localhost ([49.248.175.127])
        by smtp.gmail.com with ESMTPSA id v68sm28026272pfv.47.2019.10.16.00.35.12
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Oct 2019 00:35:13 -0700 (PDT)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, edubezval@gmail.com, agross@kernel.org,
        masneyb@onstation.org, swboyd@chromium.org,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     linux-pm@vger.kernel.org
Subject: [PATCH 14/15] drivers: thermal: tsens: Create function to return sign-extended temperature
Date:   Wed, 16 Oct 2019 13:04:13 +0530
Message-Id: <0689917475cf83b7e01f6978504fd37352a5e3ca.1571210269.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1571210269.git.amit.kucheria@linaro.org>
References: <cover.1571210269.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1571210269.git.amit.kucheria@linaro.org>
References: <cover.1571210269.git.amit.kucheria@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hide the details of how to convert values read from TSENS HW to mCelsius
behind a function. All versions of the IP can be supported as a result.

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/thermal/qcom/tsens-common.c | 49 ++++++++++++++++++++---------
 1 file changed, 35 insertions(+), 14 deletions(-)

diff --git a/drivers/thermal/qcom/tsens-common.c b/drivers/thermal/qcom/tsens-common.c
index ea2c46cc6a66..c34a1a26ce29 100644
--- a/drivers/thermal/qcom/tsens-common.c
+++ b/drivers/thermal/qcom/tsens-common.c
@@ -84,13 +84,46 @@ static inline int code_to_degc(u32 adc_code, const struct tsens_sensor *s)
 	return degc;
 }
 
+/**
+ * tsens_hw_to_mC - Return sign-extended temperature in mCelsius.
+ * @s:     Pointer to sensor struct
+ * @field: Index into regmap_field array pointing to temperature data
+ *
+ * This function handles temperature returned in ADC code or deciCelsius
+ * depending on IP version.
+ *
+ * Return: Temperature in milliCelsius on success, a negative errno will
+ * be returned in error cases
+ */
+static int tsens_hw_to_mC(struct tsens_sensor *s, int field)
+{
+	struct tsens_priv *priv = s->priv;
+	u32 resolution;
+	u32 temp = 0;
+	int ret;
+
+	resolution = priv->fields[LAST_TEMP_0].msb -
+		priv->fields[LAST_TEMP_0].lsb;
+
+	ret = regmap_field_read(priv->rf[field], &temp);
+	if (ret)
+		return ret;
+
+	/* Convert temperature from ADC code to milliCelsius */
+	if (priv->feat->adc)
+		return code_to_degc(temp, s) * 1000;
+
+	/* deciCelsius -> milliCelsius along with sign extension */
+	return sign_extend32(temp, resolution) * 100;
+}
+
 int get_temp_tsens_valid(struct tsens_sensor *s, int *temp)
 {
 	struct tsens_priv *priv = s->priv;
 	int hw_id = s->hw_id;
 	u32 temp_idx = LAST_TEMP_0 + hw_id;
 	u32 valid_idx = VALID_0 + hw_id;
-	u32 last_temp = 0, valid, mask;
+	u32 valid;
 	int ret;
 
 	ret = regmap_field_read(priv->rf[valid_idx], &valid);
@@ -108,19 +141,7 @@ int get_temp_tsens_valid(struct tsens_sensor *s, int *temp)
 	}
 
 	/* Valid bit is set, OK to read the temperature */
-	ret = regmap_field_read(priv->rf[temp_idx], &last_temp);
-	if (ret)
-		return ret;
-
-	if (priv->feat->adc) {
-		/* Convert temperature from ADC code to milliCelsius */
-		*temp = code_to_degc(last_temp, s) * 1000;
-	} else {
-		mask = GENMASK(priv->fields[LAST_TEMP_0].msb,
-			       priv->fields[LAST_TEMP_0].lsb);
-		/* Convert temperature from deciCelsius to milliCelsius */
-		*temp = sign_extend32(last_temp, fls(mask) - 1) * 100;
-	}
+	*temp = tsens_hw_to_mC(s, temp_idx);
 
 	return 0;
 }
-- 
2.17.1

