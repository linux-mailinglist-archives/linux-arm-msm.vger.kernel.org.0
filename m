Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60170AF6C6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2019 09:24:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727299AbfIKHRd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Sep 2019 03:17:33 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:43354 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727307AbfIKHRd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Sep 2019 03:17:33 -0400
Received: by mail-pf1-f193.google.com with SMTP id d15so13071655pfo.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Sep 2019 00:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=3XLPlhPImWAomUfs/g8BXhfm3lVXoZB+dL/zQw9KVyY=;
        b=GJlxsZb21zDn7otYAc58zN7PyahcMkAX7EQUNWffJZs6M0x8PWTmcZ1KKAhmuxa7/v
         ue70ggqmS5flX5o6oKsh1Yz/o9isB7U1Q3arBhYZJUbO9XqYbFzYbdN35eDe8QaTjGvp
         tUPhdIgxrboTihBK+X6FS+TpH+nZkcLCRz45g2Mlk3LqqkhmthATiA41Bw20vGxFJbIc
         MBXQvVkz7jJ0GrBYNYyZOy6cQc9epnmjzyWMhWZ9AMKHyiYXXrk7TZrfRuLmxWtBBz5j
         i1H1Q4fuYCbQgJ4p+8GfZQLgM5HRg7nrOmYVRS+chWO1JrYsfTnRUS0G5WIPkBXF9PbX
         z7Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=3XLPlhPImWAomUfs/g8BXhfm3lVXoZB+dL/zQw9KVyY=;
        b=q0Wh1DrESH51sVj4JxHmYPJw1TnX/avBPHKZ90MGe6yuCZHIJ5zrgh6SOzXMMs20rV
         3DOdUNBI6xGZbvXE+waADr2sDVnpNVcrOMpT2YWIMaGqNZ3t62BepJp12wDGcnFd+4ri
         NLP/cWHR2NCsgxR+QgffHz/sAlgTjZjehwgO2H1nKfliyCRaNuGWvRhANF7k+Tg+Va8C
         /t6z8ilpR8N4pSJWlexrumwa+stU39vn/PqO+b/8Eu0Yn98xoDnLR3MXgt9bQurgTgPh
         mKYCB3yPq9ZG6Nd4arn5AbaZv1kCN5TMe0cvQWnQhVixMgRhtjSOCV4EXzcHFdp5b1OK
         9VXg==
X-Gm-Message-State: APjAAAWxn2xBmEr/ucXOTcCnRVTq/7bS+I+7Az7WrXfRbfJkyMunHrB9
        64qQ49hJYDR8iBqWs2Q0mR5/2w==
X-Google-Smtp-Source: APXvYqzN60HuYuLCnJPEkqZsm/s5+WhfDQTCtn2qAVU9cHJ5lsnpY3WrGzuMoIBnXeqqNrV8oFi6FQ==
X-Received: by 2002:a65:6097:: with SMTP id t23mr31510470pgu.357.1568186251210;
        Wed, 11 Sep 2019 00:17:31 -0700 (PDT)
Received: from localhost ([49.248.201.118])
        by smtp.gmail.com with ESMTPSA id h3sm833961pgb.13.2019.09.11.00.17.30
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Sep 2019 00:17:30 -0700 (PDT)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, edubezval@gmail.com, agross@kernel.org,
        masneyb@onstation.org, swboyd@chromium.org,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     linux-pm@vger.kernel.org
Subject: [PATCH v3 14/15] drivers: thermal: tsens: Create function to return sign-extended temperature
Date:   Wed, 11 Sep 2019 12:46:31 +0530
Message-Id: <a70e3fd63774f87d24374c12f63c2f311d6d4ba5.1568185732.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1568185732.git.amit.kucheria@linaro.org>
References: <cover.1568185732.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1568185732.git.amit.kucheria@linaro.org>
References: <cover.1568185732.git.amit.kucheria@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hide the details of how to convert values read from TSENS HW to mCelsius
behind a function. All versions of the IP can be supported as a result.

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
---
 drivers/thermal/qcom/tsens-common.c | 50 +++++++++++++++++++++--------
 1 file changed, 36 insertions(+), 14 deletions(-)

diff --git a/drivers/thermal/qcom/tsens-common.c b/drivers/thermal/qcom/tsens-common.c
index ea2c46cc6a66..6b6b3841c2d0 100644
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
@@ -310,6 +331,7 @@ int __init init_common(struct tsens_priv *priv)
 			goto err_put_device;
 		}
 	}
+
 	for (i = 0, j = VALID_0; i < priv->feat->max_sensors; i++, j++) {
 		priv->rf[j] = devm_regmap_field_alloc(dev, priv->tm_map,
 						      priv->fields[j]);
-- 
2.17.1

