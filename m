Return-Path: <linux-arm-msm+bounces-28513-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA4C951E10
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 17:05:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0D2E61C2183B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 15:05:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2C071B9B22;
	Wed, 14 Aug 2024 15:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="avRnCjsQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B141B86C8
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Aug 2024 15:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723647873; cv=none; b=vDrIxasU8XtJe/kJE+w4veJ1KjsgFS3aSbQ2yb6TmUYzE7GQxYL2mA9o+6zOn3opSXBbCiwTy6vb1kt+86eVZLPyBJH++Gzc/6J0XYo1s7TUf60mWc1GXvq3TtwGDiSjBO7cnRFZIqVq+JMSgFjs8boS5OUA8pyOwo0rC0AhT+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723647873; c=relaxed/simple;
	bh=eBGTSGUpvddpWZ+1sT4gEslKcB5kBGvw5yw7ydkjC2k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Jfj9wbQQKHzTHumEIhjNPGkNNBlomHybgxzcVTfN3zN68dlnh1zbJI/4V3467MrLNU9L1rwHebBXwMw5TB4sGtlpBTfuMPcqgLkDlh+LNJhfYNsfCPo87KaUZclevwmZpvsUqv4BGw1M5Ar5puzTtTpEdfEKWw4xYzpuHXBfpTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=avRnCjsQ; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-530e2235688so7295441e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Aug 2024 08:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723647869; x=1724252669; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uby3vx5C44xympQeIPbZuYUa73IoZNR3m1Cs5S0QTJc=;
        b=avRnCjsQ9b+v2L261w03SscxwU2RjV5e51dxK/jIslXiau1RUlDUcJD2358vHY/ftC
         XW6UWoJQJqKasx44c/KLcw0Bi44pFez6SqwaZhs9Gt+3bytgL9nhb/eXre5BycHduonW
         FXaJ0DVBSWGyF4YGL/m9FdYLSyMen34QHj9YlYGuFDLvvniEd4AY0I0wMYQg/hI2ER23
         mTJyj8JOnw0Vv565XuR7On9nX7pHlsQQWM1OkTmwkzNhVzJ1SBiOpjC0xQTj4BJyGIgL
         cedp4UPvujhkkgOP4fK2Gd9v8RFsiCV2vMfBKMv9m1fzekKvw8Ax9hQsgX9p6vBLsgkR
         MlVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723647869; x=1724252669;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uby3vx5C44xympQeIPbZuYUa73IoZNR3m1Cs5S0QTJc=;
        b=agmAqM9yUt4hOIIB+SEbHH9AUvAqFfG2M3VlMwj5xR6YWnugAeP4D3kOw0ICZbFjAV
         Ldv+QXzMg78JBihtINxfjZw/Xgr2CblHPbH7XyCiHRbR9xTFoi3wdUJselqTOaBQzYAy
         pAq0OH87Hy+DaPlxD6NUfWCuG97J/l5xlK1/2hdctNEqeQYKJowMTXWslrYgDfco7BFt
         P92tqPSAnoUWD3W/QeBA+IYAHQMpS3+VoCZD9CjXBTrAvFnRcdfqg/vvacO5opB5p7IV
         aqH+nSYovBx7HW0zdrtxb0L2antv88Bc72lmmLyiw4BoSYO0Nyy1Mz4ztDv4/f55D4+B
         oGBw==
X-Forwarded-Encrypted: i=1; AJvYcCU0dwU0B+SL6auauZBE+I96jT0LzOUWeA12qWiVbEaD0lkbDY9YYeYUHf0Wza9ytR8y4gVOmd6fQCj0soHfMNKaWXYqMnkcIMcTlJwnrA==
X-Gm-Message-State: AOJu0Yw/mbQlnf7nDQQY9EMpOZXLp6NjVcnFQ75MiDzXiZGYSSerHpMx
	gPY6ktKAbjk9D2kmCoeDhqJETIatrviBft/GF64qhoekPHDUL93YcPHgLxm2Uv0=
X-Google-Smtp-Source: AGHT+IGocQ+sfcCI0BsP7dFMq93jhRdGBeu3R77b4skm0zxlJaGhDpoe9Yu7aRhk+YK7m/4igocdpA==
X-Received: by 2002:a05:6512:3daa:b0:52c:d9a3:58af with SMTP id 2adb3069b0e04-532edbbea6dmr1706687e87.49.1723647868534;
        Wed, 14 Aug 2024 08:04:28 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ded7cfbasm22313425e9.45.2024.08.14.08.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 08:04:28 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 14 Aug 2024 17:04:10 +0200
Subject: [PATCH 6/7] regulator: qcom-smd: Simplify with scoped for each OF
 child loop
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240814-cleanup-h-of-node-put-regulator-v1-6-87151088b883@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1371;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=eBGTSGUpvddpWZ+1sT4gEslKcB5kBGvw5yw7ydkjC2k=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmvMdsbGg5jhGJCbxxUs0v8Bv4OUF1uvi+EO1FC
 F3GEVhn6JeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZrzHbAAKCRDBN2bmhouD
 1yPiEACadxHRdHC3Qbt35GS0lKK/OD/r0A69dULWvdqQ1NN9HvfQaK5Hx7jbFXnjONsqn3KPMDC
 EGL0ATj/SWGAUxYjIXNk/EzUw1vF461IkUHUstovhu7pqEZsMTdS8t9YxFzYBOh5DdmOQZrfHtU
 SWFo7VISazhvpFuge/3lQS7L/NYMeb1k6nREZd926dVaoL15IJpyAnrbd+k5nUP9eHsOGTIinUF
 b2sdJ9GsfnIWvUh503gqMx47bBb51hauURzkb9g6CmFJd7Gwo6wbCCwlhp2KKWGsGywJ9vozaSH
 8ggbvKEVF1TsTNPHI19jkqdRD7yySvl73tsQTe6nOg2ueJWvBRfjMuhcmXeirtgeW2vAJGShEjN
 /iJ1+ep5RSfkl5QEKfO4OreTj2NELrlxm2B2HzCZGxv6c8b1GXVjqLSWvELfR34stg4/RgKcV7r
 FGCFwPGoQaaq0tHYOglqBaX/KnHKCjRH3CK/ZrjyaOBcF2rRzgZLT/7g6hJDkerfOCx7qcB7lWU
 HRlK9/Ocgj0gVyfCHppH4q1/bBtt33K0osv+E+1L51Hl5J4LWqMkDIaCo4pnG71h4lW8DGXYATs
 On62TrglDkCpWgvmimD3jbo704nE2gh/g+kZPrLN1lEEf33c5BKh1Nku83Oywr3QkwXySFt6d8R
 jrAv31M2iAyjOKQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use scoped for_each_available_child_of_node_scoped() when iterating over
device nodes to make code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/regulator/qcom_smd-regulator.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/regulator/qcom_smd-regulator.c b/drivers/regulator/qcom_smd-regulator.c
index 3b7e06b9f5ce..6761ada0cf7d 100644
--- a/drivers/regulator/qcom_smd-regulator.c
+++ b/drivers/regulator/qcom_smd-regulator.c
@@ -1435,7 +1435,6 @@ static int rpm_reg_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	const struct rpm_regulator_data *vreg_data;
-	struct device_node *node;
 	struct qcom_rpm_reg *vreg;
 	struct qcom_smd_rpm *rpm;
 	int ret;
@@ -1455,18 +1454,14 @@ static int rpm_reg_probe(struct platform_device *pdev)
 	if (!vreg_data)
 		return -ENODEV;
 
-	for_each_available_child_of_node(dev->of_node, node) {
+	for_each_available_child_of_node_scoped(dev->of_node, node) {
 		vreg = devm_kzalloc(&pdev->dev, sizeof(*vreg), GFP_KERNEL);
-		if (!vreg) {
-			of_node_put(node);
+		if (!vreg)
 			return -ENOMEM;
-		}
 
 		ret = rpm_regulator_init_vreg(vreg, dev, node, vreg_data);
-		if (ret < 0) {
-			of_node_put(node);
+		if (ret < 0)
 			return ret;
-		}
 	}
 
 	return 0;

-- 
2.43.0


