Return-Path: <linux-arm-msm+bounces-6506-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D4F8251B3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jan 2024 11:17:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 636311F23D01
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jan 2024 10:17:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5D5B2D791;
	Fri,  5 Jan 2024 10:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GYVLloUV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394CF2D623
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Jan 2024 10:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a28e31563ebso158941366b.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jan 2024 02:16:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704449789; x=1705054589; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M2SbbmAUvxuz+3O7vyQxuSBbpMgT1hRNIR0aHAh7TUs=;
        b=GYVLloUVaVP0riLgSjtPH/PD5jfpGnMu3U5Fr/ojJyQ1Qc/9sOoFRPsQyOdM1LCxk8
         resGA2jVBNUvbeDFt29mje+kYLvuEH6aj0cnQ41L/RpDFsszRZsdAwLBmiKb+yyNpZph
         6ZoMuyaSsXbeqR9kRqOdJ6PG1IzkQ3s0WFGpquJqDTwYO8V6Wu3FibnmqCr4wddmgbA2
         P1TorMuMxLwgC9fRJkn8d6n87hlI69RAVSVJUVTf+TC3KRq1pVnNNcVYjrcNXbl7N8pQ
         tTqloBygtroU14uoGN6X612TZm/u1965XcZHCEKkLzNWUR+zfsD242BKNy7oDp/y4f4W
         nwlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704449789; x=1705054589;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M2SbbmAUvxuz+3O7vyQxuSBbpMgT1hRNIR0aHAh7TUs=;
        b=goSjhUmr06tT871+24NayABTUNEpIwIDBcEaCdXfdp0SwgCyU9pc3B2QlSfzTfY0gJ
         9cjESoOrU7U0AgKe6GnptWqwrbtms/kYSxp5IWGrkcK3k6hDi3jEn7Ru3qLQCtZo/xOO
         6FUwJQQFJLxZvCsHgDpG8F20E5yWm5TLNY2qq1radn04PYmc5m+VLaB1Nf22vs/9JbJi
         XwqykZUbPWhsBcy+p1rLUIrptD99/UpGihgQEGxEDYeWGM1LrxxYD84j7KdHWLJPEsx0
         bGJZpHHUSC/SFLiWtrO5zNgmp+J5p4wu0DLq9qBASBeSQyZq2UFFbVHkr2PPXdCsl7ce
         mfZA==
X-Gm-Message-State: AOJu0Yw/Xlg5VtknUfsFeOOHUPypjaGXZ+1Hnyubxgengg0FApoyLkMh
	zJgtb/ErsdPFfUa9d2vXCBxjFVCGm0M10Q==
X-Google-Smtp-Source: AGHT+IGXz2g8H97RWKY+7sFScbllJc8+MA2CAHJyVkS1v+Mjo7+A0HD5O0yVEja/MabxVgS6haXrfg==
X-Received: by 2002:a17:906:1d9:b0:a28:ad97:e214 with SMTP id 25-20020a17090601d900b00a28ad97e214mr1018779ejj.1.1704449789326;
        Fri, 05 Jan 2024 02:16:29 -0800 (PST)
Received: from [127.0.1.1] ([79.115.23.25])
        by smtp.gmail.com with ESMTPSA id o9-20020a170906358900b00a2824bff5b1sm713180ejb.216.2024.01.05.02.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jan 2024 02:16:28 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Fri, 05 Jan 2024 12:16:16 +0200
Subject: [PATCH v2 1/2] phy: qualcomm: eusb2-repeater: Fix the regfields
 for multiple instances
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240105-phy-qcom-eusb2-repeater-fixes-v2-1-775d98e7df05@linaro.org>
References: <20240105-phy-qcom-eusb2-repeater-fixes-v2-0-775d98e7df05@linaro.org>
In-Reply-To: <20240105-phy-qcom-eusb2-repeater-fixes-v2-0-775d98e7df05@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: Elliot Berman <quic_eberman@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2272; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=vIbUfNQlZTi1v25Ve+Sd4HHhwYJTXbuLuFkWrD7aJiM=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBll9b412/e8NdvgMxOeqdne0SbNS5xvfDpT5ibA
 mNOTJNMutmJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZZfW+AAKCRAbX0TJAJUV
 VvHvEACX+B/Dfb3IwGS3F1o+zp26fCXYgaMHeIrlqxwCWDSKYGcmjmCH8lBMHKOVzaPSKz+hExZ
 Q8sVmp0CuZkAAhuTs4YQSywX54L1BLD49ApRdASsfzvucIUXcqOf4aW4E8UvBTXX2YrD2xZG/+b
 Y9jus7yZF0GCbabI9hnxd4HYaDn+KBzSoWz5+iEzU3kLsYI+MyzkdmNxXJnZwm+khQ3YqjjbXgd
 FUe9CotAQlXu6OFqSBCC4PJ4uOWdPWT1XB9QK/3PqqH9C1d3A35KC8lG7dybHfsexHrBwxux/1s
 1qMtc2xw/yLtQp1OZSyPiHU4OkoyRBiKYMYllWjutWCzxXAqD0FLax+k3AsCcXQLUECjKERivM2
 5FMIdxS318g9etxPl/7BsnbOV10/yUoVazYudaCCnXiOlfv6b6gcWRm4zghRc9kt73QPKO35Bt0
 JsTc/w1u0H8WwceWNV65T2AXOmMLX0b56orO7CGuXtXQJGhc1OaknOcgURit54n0LFtEt9BHh4m
 PLms9g4BJbcBgqkkkqxFD4Dg+h0zbMKRRHI+k/2Y9wNxX7U9OsYwTtJinUMgNyNHKIHDtIdVyo2
 CUBQAeg9Ms+1f8fHsSSD6NiYiJbNIeDwBkQSjeg5WXg2Y05qbrEc/AxcY6tKQhoAmeGac8G8W1k
 pzX3kGTBm2uD7dA==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

The global regmap fields offsets currently get incremented with the base
address of the repeater. This issue doesn't get noticed unless the probe
defers or there are multiple repeaters on that platform. So instead of
incrementing the global ones, copy them for each instance of the
repeater.

Fixes: 4ba2e52718c0 ("phy: qualcomm: phy-qcom-eusb2-repeater: Use regmap_fields")
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c b/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
index a623f092b11f..5f5862a68b73 100644
--- a/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
+++ b/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
@@ -101,6 +101,7 @@ struct eusb2_repeater {
 	struct regmap_field *regs[F_NUM_FIELDS];
 	struct phy *phy;
 	struct regulator_bulk_data *vregs;
+	struct reg_field *regfields;
 	const struct eusb2_repeater_cfg *cfg;
 	enum phy_mode mode;
 };
@@ -140,8 +141,8 @@ static int eusb2_repeater_init_vregs(struct eusb2_repeater *rptr)
 
 static int eusb2_repeater_init(struct phy *phy)
 {
-	struct reg_field *regfields = eusb2_repeater_tune_reg_fields;
 	struct eusb2_repeater *rptr = phy_get_drvdata(phy);
+	struct reg_field *regfields = rptr->regfields;
 	struct device_node *np = rptr->dev->of_node;
 	u32 init_tbl[F_NUM_TUNE_FIELDS] = { 0 };
 	u8 override;
@@ -262,15 +263,21 @@ static int eusb2_repeater_probe(struct platform_device *pdev)
 	if (!regmap)
 		return -ENODEV;
 
+	rptr->regfields = devm_kmemdup(dev, eusb2_repeater_tune_reg_fields,
+				       sizeof(eusb2_repeater_tune_reg_fields),
+				       GFP_KERNEL);
+	if (!rptr->regfields)
+		return -ENOMEM;
+
 	ret = of_property_read_u32(np, "reg", &res);
 	if (ret < 0)
 		return ret;
 
 	for (i = 0; i < F_NUM_FIELDS; i++)
-		eusb2_repeater_tune_reg_fields[i].reg += res;
+		rptr->regfields[i].reg += res;
 
 	ret = devm_regmap_field_bulk_alloc(dev, regmap, rptr->regs,
-					   eusb2_repeater_tune_reg_fields,
+					   rptr->regfields,
 					   F_NUM_FIELDS);
 	if (ret)
 		return ret;

-- 
2.34.1


