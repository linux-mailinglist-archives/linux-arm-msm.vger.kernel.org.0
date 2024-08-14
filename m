Return-Path: <linux-arm-msm+bounces-28510-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 061E5951E06
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 17:05:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1C90D1C21D6D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 15:05:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9F961B5828;
	Wed, 14 Aug 2024 15:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="orDNm7Ao"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14011B580B
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Aug 2024 15:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723647867; cv=none; b=QjfoVQ65jWowECHqiEDDnmCiWxj3uTx5ng4C+seifinO1Ku6Uarmp8ceyWEPIlO3Pxbz8YSGPisMkEufurLnXU3ypFuYV6iFnDlMfLRMKD7P1pTftr8ky9lhPkNBA8SUJJ3bUdQ/OiaWi+uWUjjEuFQQ+JXu8rVqJGYTf4R3YW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723647867; c=relaxed/simple;
	bh=HKFKyZib5VKnJdUuDJakQAsIhOr5X3HZ7uhakSIt1BE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p5ZIPv9cr/M6P4/5yLu9pere8ghxwrMu8P4xIF6W2LmmtNWY7k6Us+fDcv7CVU8VJ7XXrZ6IHSl1N/4vrQ3QAGj6nQmOdn9Pt+0eozPSec1KcqIeW8UMEN3fMZZyl1lTaX6qhXeDUJquMohfa16mKz49aT4Q0kUZuGpJJBkbz8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=orDNm7Ao; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52efa16aad9so8699157e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Aug 2024 08:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723647863; x=1724252663; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ql92g3IlSel/JMsJTBmGL12yP4qS4j4UtrmTRytGT1s=;
        b=orDNm7AoFP7TzEYZEMbQ98x7rfuzflilFXbLB6r46d1feAFzpArl8m16zfVU5FPA15
         cZg/vrgj/fp3bVPG6dvJwXrzHHSYzIGCzaIrYooEEuR5SsdbuekwvCPwcWf8lChYw4IV
         7M9FmYcgwXZKq2q9MlAZB+7yyC9HeLKuBPAnc3VBlLMhGwTKLKpB7zNu6xdtfK0fAjHS
         ux8B/sKDZTzEkOraGkGSAe/3amkAern+B6LCKVJAA+qC1N1roYWoQEpfnOcniJEv4Xwu
         2bAMmwhxOhxpEgdWDR/PWN1Rs83k9vNDZXBn0RBEwf7aT6gvon2tcdkYVkKe8DWVKalD
         DMMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723647863; x=1724252663;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ql92g3IlSel/JMsJTBmGL12yP4qS4j4UtrmTRytGT1s=;
        b=YCybJTPEXqCjXmYKSRITv1LpR8dFL40vvUlWHrmRnxpNGMeLoSynTP1SsqbvLXQfa4
         m6mL+TCCfjEnidmbnM3tzg5SFj4r17OUQBEPRDji3NHqei1x+daDgHDxM9ywmq+QLPcr
         1uRy53FjNpT5wyo6ePQzxISyjQeHIMT/UfCvpC7W247SXlYpxtacSMluxGJnawPcm5Rh
         CU3RcrQX8saNhqrpJr+QAf8sO+4tAi/8SahnFrR7gF0P2xZIYoxxZsyNUP7rNqaWsto4
         l4KOIKln78GnWj3IhJksk4TGNQOHgeXNsuNg1P+DytvePItRPGQDx6ZnJ5fROtkf7Wyz
         phng==
X-Forwarded-Encrypted: i=1; AJvYcCUL5gexbHCwfYdEV5CB4JjyWx1/OewV1JK8zMI7iKbp7lVaLqrE80rwXU31lAgg2wS/8mIEAiNvJc7yLsmf/qN76T/tqblu1wFZovEoxQ==
X-Gm-Message-State: AOJu0Yyh9REKoqkVq/XK7HTREua3lXtkLFCEXCp78RMHAQX08oF4h0Q4
	Lf7S7GxW6cOF5MutRW/XLIofXKvLtn1xYpwZWUlJRfRMG+K808H/McJsWwckqB8=
X-Google-Smtp-Source: AGHT+IGu3DwjbZr/7noh9P2H71pz2ZOViSHbSyH2U0t4pwvKJvHyX+AJnV0p3bUqSkfSvtJejl7obw==
X-Received: by 2002:a05:6512:239b:b0:52e:fa5f:b6b1 with SMTP id 2adb3069b0e04-532edbd598fmr1593960e87.60.1723647862671;
        Wed, 14 Aug 2024 08:04:22 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ded7cfbasm22313425e9.45.2024.08.14.08.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 08:04:22 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 14 Aug 2024 17:04:07 +0200
Subject: [PATCH 3/7] regulator: max8997: Use scoped device node handling to
 simplify error paths
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240814-cleanup-h-of-node-put-regulator-v1-3-87151088b883@linaro.org>
References: <20240814-cleanup-h-of-node-put-regulator-v1-0-87151088b883@linaro.org>
In-Reply-To: <20240814-cleanup-h-of-node-put-regulator-v1-0-87151088b883@linaro.org>
To: Matti Vaittinen <mazziesaccount@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, arm-scmi@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2267;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=HKFKyZib5VKnJdUuDJakQAsIhOr5X3HZ7uhakSIt1BE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmvMdp9nwqP+7IBK1IA/FESYOQpVx8C/ZOu7nHN
 dyB7jnGN/iJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZrzHaQAKCRDBN2bmhouD
 19D8D/9qJRD6vc6koDrB7DKkh+SqxKz5mPXuv81NfvAKp+tFZIxwGsSE38f242goqHEvg0UqrX9
 dawZdUvXXPprvW8yQUvzaosVLYsXRc6VmfshmGrpqBOk1m7yHeJLDFbwYAvAxMbQSTjub+eHBnN
 R8a14Pkkize/+HCavGbDnRoeJskMzDuMt3Vpdic7fxO7D55FQ1aAT2NLQpMt3rOpCxnc+QNF84g
 PFN22YiJ/B2BWzAydXgdiNxzseufjng+ISc0XK5QCxtC9L9F0gNZnFZ7+iRLRu3rZgRGSJmFYfw
 QlC5J0Iwpm+sxUTvElWmuSTx/LXZhWZ0xVCPWhD92bnWtjRTKG+cPiVf1aKNTycw88Wq1a8dSv9
 PuPlf2Y3RIPsJgfNmgYoy/SarvcQ6DD5hm9lzdz9qRxq4ymiYnDQRj6sF7N0TFXHCnU3UDMyAs3
 t6UaPf5u1/NlLJCcIGwl1GFQnZVvVBESEkXWMWKTDNExWPgxXaM+/1kA56qZF+XzWvG6EEewhVL
 rT1bbgSgbq9UYwRaK3nj1lbQSF64DQqb5o0l5trm4M8Zvwj8zqtICo1+qGYnC1qWdB9aKaiH26S
 LGa+pzCVV7KA/5n8YKfdMYFDfROyoBI8vLci1zwaovbUlNk67VJYY41rGvFg5znsw5ne6eSX6/b
 4rvA8VGg995OeZg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Obtain the device node reference with scoped/cleanup.h to reduce error
handling and make the code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/regulator/max8997-regulator.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/regulator/max8997-regulator.c b/drivers/regulator/max8997-regulator.c
index cdbfb4561dd8..e77621b6466c 100644
--- a/drivers/regulator/max8997-regulator.c
+++ b/drivers/regulator/max8997-regulator.c
@@ -8,6 +8,7 @@
 // This driver is based on max8998.c
 
 #include <linux/bug.h>
+#include <linux/cleanup.h>
 #include <linux/err.h>
 #include <linux/gpio/consumer.h>
 #include <linux/slab.h>
@@ -876,7 +877,7 @@ static int max8997_pmic_dt_parse_pdata(struct platform_device *pdev,
 					struct max8997_platform_data *pdata)
 {
 	struct max8997_dev *iodev = dev_get_drvdata(pdev->dev.parent);
-	struct device_node *pmic_np, *regulators_np, *reg_np;
+	struct device_node *pmic_np, *reg_np;
 	struct max8997_regulator_data *rdata;
 	unsigned int i, dvs_voltage_nr = 1;
 
@@ -886,7 +887,8 @@ static int max8997_pmic_dt_parse_pdata(struct platform_device *pdev,
 		return -ENODEV;
 	}
 
-	regulators_np = of_get_child_by_name(pmic_np, "regulators");
+	struct device_node *regulators_np __free(device_node) = of_get_child_by_name(pmic_np,
+										     "regulators");
 	if (!regulators_np) {
 		dev_err(&pdev->dev, "could not find regulators sub-node\n");
 		return -EINVAL;
@@ -898,10 +900,8 @@ static int max8997_pmic_dt_parse_pdata(struct platform_device *pdev,
 	rdata = devm_kcalloc(&pdev->dev,
 			     pdata->num_regulators, sizeof(*rdata),
 			     GFP_KERNEL);
-	if (!rdata) {
-		of_node_put(regulators_np);
+	if (!rdata)
 		return -ENOMEM;
-	}
 
 	pdata->regulators = rdata;
 	for_each_child_of_node(regulators_np, reg_np) {
@@ -922,7 +922,6 @@ static int max8997_pmic_dt_parse_pdata(struct platform_device *pdev,
 		rdata->reg_node = reg_np;
 		rdata++;
 	}
-	of_node_put(regulators_np);
 
 	pdata->buck1_gpiodvs = of_property_read_bool(pmic_np, "max8997,pmic-buck1-uses-gpio-dvs");
 	pdata->buck2_gpiodvs = of_property_read_bool(pmic_np, "max8997,pmic-buck2-uses-gpio-dvs");

-- 
2.43.0


