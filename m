Return-Path: <linux-arm-msm+bounces-28511-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 46964951E07
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 17:05:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C80491F2297F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 15:05:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA5731B5830;
	Wed, 14 Aug 2024 15:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wHRYqxwo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157BF1B3F0D
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Aug 2024 15:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723647867; cv=none; b=gZh9/fv6vdJsAiRiawW1Agw/ilao4n/pDLAusD7GMMwdp+oDVmFy/fC+43pI1RJhDkk0nt4g+Xry8i7YmciViPp/bM2WSzT3+vAmLJdZwwJaCLk6dLRYL1XfIYvnI/Sx1aVmHFkGIbAkgwo2isy0h20W1Dkl/M24ZBwwvUEd4ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723647867; c=relaxed/simple;
	bh=krE+SHok9HZd63yAd9AD4NQ/RWe30H45bGKZExWRrHY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G8K8ta/44AU51c2LVjbtvLNj80awfAlMNAiCK8JkqTgx1yeo9lVYyYLxOpkacI9DQYkeCD5rpSAEvWEupC6HGFwo9p/ZcTnL0E6506dvhU2H5p0O+vkRTHuMQXMC/hoJdfTPTZQO4ObCOHrYdfyz1zCrjLC00GLBbotYfI/7rVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wHRYqxwo; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-428fb103724so5726375e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Aug 2024 08:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723647864; x=1724252664; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5O3B7PyV7G/t+42xNPn3Ro9dRzqDxhODbgBFGwCT/6c=;
        b=wHRYqxwo8E0KAtu+UVZl3G3ST45mn8I+jDYG9/VF7z8Zd5IBGq8Jpe3duqwwoNfrtJ
         j4Fyd79I11IqWAlW17kMmVGMRN7A7cNIaNWvLWufRIUcVVlua91LlvbGx3S5g9PyayrW
         AW6pwiJft0aMICAu+a8wV1quoPGN9qWojH0Tk1JygZy5EKE/9IvJ89zfIciP3vW1tZwx
         s9oWessgZcWaeGpXzMO3Nyohu5owaFBDrBcNwAFocCRFScotUNsKPcRH0RaVtFckWB54
         BuWWDOk86xlsVyYemZdEAb7In85gjGHS3CdrVOqt0S4zKHOHwGINt7FXOOxBImzgIaMM
         oRaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723647864; x=1724252664;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5O3B7PyV7G/t+42xNPn3Ro9dRzqDxhODbgBFGwCT/6c=;
        b=a+sR1/dEVBqPI9j6uD7Zf+CN4GmPajkIIYcMZVLoucGqjv5rsglL+uI2Ldsbbq3G/m
         EhLzEbYYCHa7vHEK5tmC4UbhvC+USK35WhSaPTlSaOwcnqu03NU0l49X3OJ6SeZ+y+Zj
         SSG9gPlyTdXVMpT9uz1H+ULYP1IgY7n4xz2Pia6gm9k8jefHhbg1Y27E0mSYJbbfZ9Vh
         EabLwNpQ7U+VCJUjo7NoPIAaQhO7G7Nt8cBfpQWSjFx1CWxfY55ybQ7LBTDdkQVPDoz/
         MXdfhfhGSJjg9TN93Ap9bvxvibDRi+TA3dIc308NUd9Yyaw1eIpxtEVXCGKSu+BbxCa0
         ZO9w==
X-Forwarded-Encrypted: i=1; AJvYcCUGiL3l8oMHofzmeaHC69Bd3K0pOMvYMTQryEA2UuG5Sb7lHBGDyuU4NDYu68oA81+ksWVU0w91qq39p4TKDk9OJQnkVK6Mpb96xhPoBQ==
X-Gm-Message-State: AOJu0YwG4pGIFXl4Yjle6958ysVxunIOnSZ8WSXRvfyJcMZokqzqRJJV
	7GNePTCoJ9lKj5ePwA30Qi94BcX3nF6jnNLKrO7cwv/JLMUWBr64aXsHH8MU4y0=
X-Google-Smtp-Source: AGHT+IE6GnWj7iNSWQ5cVSoFgUQG2+GjrEsQBNVpM5I8gWXB0aUTdw2SAlkBE6MigloaWs//cNK/xw==
X-Received: by 2002:a05:600c:3512:b0:428:e820:37dc with SMTP id 5b1f17b1804b1-429deeb550cmr19752005e9.7.1723647864513;
        Wed, 14 Aug 2024 08:04:24 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ded7cfbasm22313425e9.45.2024.08.14.08.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 08:04:24 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 14 Aug 2024 17:04:08 +0200
Subject: [PATCH 4/7] regulator: s5m8767: Use scoped device node handling to
 simplify error paths
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240814-cleanup-h-of-node-put-regulator-v1-4-87151088b883@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2654;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=krE+SHok9HZd63yAd9AD4NQ/RWe30H45bGKZExWRrHY=;
 b=kA0DAAoBwTdm5oaLg9cByyZiAGa8x2qgzdRJ7uWuEFgWetBG5o2CYJimnjQmNpYDIYru8BeeL
 YkCMwQAAQoAHRYhBN3SYig9ERsjO264qME3ZuaGi4PXBQJmvMdqAAoJEME3ZuaGi4PXq6AP/jvd
 Iimx4qgmPCWd3AGNnGR+rQ0isWDzcSZQ93/mymBfT9iD3jkwm1+U+h245332W//C7xyrDnDvFEO
 O+z8IQ6QVDTylIa+aIly14fHTaGQ51qEEvVU/4sf0sKAjNFbclF4R8B8ODNyyyIQre4qEqDTQGa
 WGHHsBoWTYTTdBm7XMgA5Kl2aEyoabBzM6rKFZ8emQ0+yGbR5L6XxJjlwjTWzRxdpS/ZFNBwmBQ
 YPUHwKvyrgtoBpWY09moq3QNmVLyAxiOnXmeBG+EBYAA5m3FjTjwMo9JTHgjoxdSbHr6OAJ/eaI
 46o3/Ono7o1YrlF3563wCxSwiwLb24/vt/arV7ZmY4yhAoMTJKALvCCtbLpSeAjRMeTXumyOfhK
 6w06o9uPWfgzxDKpjkw8+MpmfWCMGKUUkAdzfbu/yem76YuWlt2iqkz00OKhYRXlgdrXaPzdejO
 5858LZ163EUFa8telnsJtiYQQFmgwNALmBejk/7EbDehPyqOMAY01nulvbpWYsRf220BlU7xN1K
 TIWxwdmuQNzx9KhFJ56Gs1XGIvpf1dWOSaHM7FIhgymlpuFAgTx8wmDYs4vO5soTo9f9YAJ/0MG
 D9q4QsGtXdqz37clEN9yMkXAIYuCFND1xYHehOvVX1iyvLTpyGXczNwxabb6T50odkjWwTKlxWk
 +7TUE
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Obtain the device node reference with scoped/cleanup.h to reduce error
handling and make the code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/regulator/s5m8767.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/regulator/s5m8767.c b/drivers/regulator/s5m8767.c
index bfc0e143bf40..d25cd81e3f36 100644
--- a/drivers/regulator/s5m8767.c
+++ b/drivers/regulator/s5m8767.c
@@ -3,6 +3,7 @@
 // Copyright (c) 2011 Samsung Electronics Co., Ltd
 //              http://www.samsung.com
 
+#include <linux/cleanup.h>
 #include <linux/err.h>
 #include <linux/of_gpio.h>
 #include <linux/gpio/consumer.h>
@@ -521,7 +522,7 @@ static int s5m8767_pmic_dt_parse_pdata(struct platform_device *pdev,
 					struct sec_platform_data *pdata)
 {
 	struct sec_pmic_dev *iodev = dev_get_drvdata(pdev->dev.parent);
-	struct device_node *pmic_np, *regulators_np, *reg_np;
+	struct device_node *pmic_np, *reg_np;
 	struct sec_regulator_data *rdata;
 	struct sec_opmode_data *rmode;
 	unsigned int i, dvs_voltage_nr = 8, ret;
@@ -532,7 +533,8 @@ static int s5m8767_pmic_dt_parse_pdata(struct platform_device *pdev,
 		return -ENODEV;
 	}
 
-	regulators_np = of_get_child_by_name(pmic_np, "regulators");
+	struct device_node *regulators_np __free(device_node) = of_get_child_by_name(pmic_np,
+										     "regulators");
 	if (!regulators_np) {
 		dev_err(iodev->dev, "could not find regulators sub-node\n");
 		return -EINVAL;
@@ -544,18 +546,14 @@ static int s5m8767_pmic_dt_parse_pdata(struct platform_device *pdev,
 	rdata = devm_kcalloc(&pdev->dev,
 			     pdata->num_regulators, sizeof(*rdata),
 			     GFP_KERNEL);
-	if (!rdata) {
-		of_node_put(regulators_np);
+	if (!rdata)
 		return -ENOMEM;
-	}
 
 	rmode = devm_kcalloc(&pdev->dev,
 			     pdata->num_regulators, sizeof(*rmode),
 			     GFP_KERNEL);
-	if (!rmode) {
-		of_node_put(regulators_np);
+	if (!rmode)
 		return -ENOMEM;
-	}
 
 	pdata->regulators = rdata;
 	pdata->opmode = rmode;
@@ -581,7 +579,6 @@ static int s5m8767_pmic_dt_parse_pdata(struct platform_device *pdev,
 			rdata->ext_control_gpiod = NULL;
 		} else if (IS_ERR(rdata->ext_control_gpiod)) {
 			of_node_put(reg_np);
-			of_node_put(regulators_np);
 			return PTR_ERR(rdata->ext_control_gpiod);
 		}
 
@@ -603,8 +600,6 @@ static int s5m8767_pmic_dt_parse_pdata(struct platform_device *pdev,
 		rmode++;
 	}
 
-	of_node_put(regulators_np);
-
 	if (of_property_read_bool(pmic_np, "s5m8767,pmic-buck2-uses-gpio-dvs")) {
 		pdata->buck2_gpiodvs = true;
 

-- 
2.43.0


