Return-Path: <linux-arm-msm+bounces-25632-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D8C92BA39
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 15:00:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA4E62879E3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 13:00:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AF3115B117;
	Tue,  9 Jul 2024 13:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gj0VHe7N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCCA215ECCC
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jul 2024 12:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720530000; cv=none; b=Qbg7ynxiVmQieH4V2JwCWEwfeo4sQ8qcKnL5Azukb2YLVaKDOHkWkg4G8R1SX+bXdqxQSlthEmMwT4I7GfzdfpMs1SRW6B7tyODNjkMhdCz+9Ped8XrtXzBzcTxp95Iz6wOpHzVAd/BkOp2a8JX0nMKE+lPmHOe/vqqNAgijjYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720530000; c=relaxed/simple;
	bh=RjQC1uaBbB53Yhyi/P627uqyyfOFXDOXyq3s45ZWBxM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tkQiCWdZ43MAroIZ/HI8uG+gyvp1/fHZ0GP0uM4pHy7l2cVpHv4nB+sXuv/B8cRA6EyM1wZE9KrvQGWKYYM8KGkbI/e/NzZW3BoCWstEfO3ZnxF495RwKWL8LT7e3RQRxxZDL66m9xyRdxIqycC5LcwIIh2JPasZsc8LQavPSI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gj0VHe7N; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-58b447c51bfso6333366a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jul 2024 05:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720529997; x=1721134797; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fJcFoKTGACpTmim9P1Jj976nNi4mK1jNtUQEiTDOytw=;
        b=gj0VHe7Nbctx68GXt3585TYM0d7NqeTsYiS6w9NpR0WninOqd+nO/OTf9oky7BKSqC
         rLSIoeqDBBCOTVAtz3uWVMT04Mw+9T1+BxfYYK/d67BJBizp6/UoS7whQJG7epju6WCH
         lX5kBdHk9R1sH+aZ912k1gApSzjtxHUGkYvl7yRuSTCuDFj7pCMoD4hPo90Uau4bc/zH
         /yVLutSD1gyIEsfnl69OTiFi0dNiEwevnOLIB8xLEU9X+pVjz3hKNPt5INdJrBK1fFl3
         7VHaP3BiV1ar1QnmmFMHIs5eQAXhM+fdQdHx9/PjMhDuOOG8n4+KIvjHYFU7d1jGh8fL
         7m4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720529997; x=1721134797;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fJcFoKTGACpTmim9P1Jj976nNi4mK1jNtUQEiTDOytw=;
        b=E+AduuSWA1n07UM07K3f/9xX1IJ4wPS1QxRRaeqbVAXq3Njd4Hqq8Qt1kwv9qXioxo
         ZPyNZ8kjFnrnUYL7whrWA2RcVMhRONdk8/GU1Dja+4DjKIc54akubtjFXxpEQyhR6XMz
         83bxxIRNy0Gb25Ms9510AEgg3cEy4/MOHspCxNuigES9ODz5cV/9oP2mQZQOUA3B9QLX
         GvPKiJSaKIp67ilmElMiQiwdfaSrwgF8SOpwJBBv8F70ptiShM6K2aREWAS7GENAvHGt
         OS1XLG6Ry//LL3mTYKP09VLQsJPHpKC4aIsor8Ui+FVQRahp3OkNaBegwGugwy9dQ4uI
         eemA==
X-Forwarded-Encrypted: i=1; AJvYcCXNWGxzNk/+D/YNl4860L90v/A40qOINcmfXbBH0Lr6pFY+qD4xjwLYZwrh8FYPZzzcTXG5NfQnirnSSJlWMUlDm1i63x1Rwkhqr9dHug==
X-Gm-Message-State: AOJu0YwAJXtYp54JTzoAOtVlKcx0UR1LI1Wuu8ksaFX5K0UGynk/fR/X
	9Mu1CLG6588gwvWgy7so9lB/35vOJoCKo2jtegQHmL9pHfR8VSR/1QREhop8LD4=
X-Google-Smtp-Source: AGHT+IG/EpZ0t5toIJgYsDmy+lSlwqUPLBP4gxC5n68gAk80zAa31z2OQcnm9hjDsoTrcaOQEdEFCA==
X-Received: by 2002:a05:6402:3549:b0:57c:8022:a3db with SMTP id 4fb4d7f45d1cf-594baa8bb2amr1889713a12.6.1720529997238;
        Tue, 09 Jul 2024 05:59:57 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a780a6e157bsm76643166b.80.2024.07.09.05.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 05:59:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 09 Jul 2024 14:59:32 +0200
Subject: [PATCH 02/12] thermal/drivers/broadcom: simplify probe() with
 local dev variable
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240709-thermal-probe-v1-2-241644e2b6e0@linaro.org>
References: <20240709-thermal-probe-v1-0-241644e2b6e0@linaro.org>
In-Reply-To: <20240709-thermal-probe-v1-0-241644e2b6e0@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>
Cc: linux-pm@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2740;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=RjQC1uaBbB53Yhyi/P627uqyyfOFXDOXyq3s45ZWBxM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmjTQ9amtrI+aNEa3oCx4ZxPydRqeuklpa52dAB
 LGNOL97Zk2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZo00PQAKCRDBN2bmhouD
 1z5sD/99WDRBu4QU5V6WwYvNDyQArr+Kc2PBsmf7Idjv8/MU3ZqLQIQuCWsC5nPd11Ql1+rOivm
 OEh6aMGPc06qrxHrXChjSuuZT1n2lUMbuT4NSG0enYERdETI3Ocj5LE/XiwWz0CO1ONudHpaBsH
 F+PRAMNIuskbDHmKhGgaMzY4ekLQUD2ari8bhiE6AWwC7iBqwC43Vz1Y5a9TiIBU7GLLGDleKaR
 p1S2xYbuRg1L5MrR42iA0Yh/ZERZPK6pe9aZqRR/OKrAAQE3U20uV7o+ujzlOEpgjCpIUODy2hz
 MclX9k/EQI6gIgM3OVI4raCPyFOpmGybe+XhpDJl+Kpl/Su756LC2Njv61g4LkomaJ9M2QDtJME
 VFz036ln7aRMRWHLnYhwRLQOgrK3P7ZqDLv84hNPcgC7cSpKGXOvY/+9SoybNVYa27VTUX4M93R
 +yfkJx1zshd4RJbTAmPt5GUkf40Zw3hwD4iEB2/soETgKykZNflVmSMC6byQaem9oq9I4qd5ixh
 CG8JnwcJolzgqSh7/6gj4qSj6GlZVaJJT50IelYMGOGCj/TFCL5oayXWeKgNG7i5tYfKZXO69mc
 dFzUE5BnRVEncP9OHsl4AJ530wlEYhnH2y1o3wUuFmuRFyLbRdCabfqKDg18j1PksVyDdKs/xOo
 lpZZiFYAvBM7lXg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Simplify the probe() function by using local 'dev' instead of
&pdev->dev.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/thermal/broadcom/bcm2835_thermal.c | 23 +++++++++--------------
 1 file changed, 9 insertions(+), 14 deletions(-)

diff --git a/drivers/thermal/broadcom/bcm2835_thermal.c b/drivers/thermal/broadcom/bcm2835_thermal.c
index 3b1030fc4fbf..38fb0c8cd55e 100644
--- a/drivers/thermal/broadcom/bcm2835_thermal.c
+++ b/drivers/thermal/broadcom/bcm2835_thermal.c
@@ -163,6 +163,7 @@ MODULE_DEVICE_TABLE(of, bcm2835_thermal_of_match_table);
 
 static int bcm2835_thermal_probe(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
 	const struct of_device_id *match;
 	struct thermal_zone_device *tz;
 	struct bcm2835_thermal_data *data;
@@ -170,12 +171,11 @@ static int bcm2835_thermal_probe(struct platform_device *pdev)
 	u32 val;
 	unsigned long rate;
 
-	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
 
-	match = of_match_device(bcm2835_thermal_of_match_table,
-				&pdev->dev);
+	match = of_match_device(bcm2835_thermal_of_match_table, dev);
 	if (!match)
 		return -EINVAL;
 
@@ -185,28 +185,25 @@ static int bcm2835_thermal_probe(struct platform_device *pdev)
 		return err;
 	}
 
-	data->clk = devm_clk_get_enabled(&pdev->dev, NULL);
+	data->clk = devm_clk_get_enabled(dev, NULL);
 	if (IS_ERR(data->clk)) {
 		err = PTR_ERR(data->clk);
 		if (err != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "Could not get clk: %d\n", err);
+			dev_err(dev, "Could not get clk: %d\n", err);
 		return err;
 	}
 
 	rate = clk_get_rate(data->clk);
 	if ((rate < 1920000) || (rate > 5000000))
-		dev_warn(&pdev->dev,
+		dev_warn(dev,
 			 "Clock %pCn running at %lu Hz is outside of the recommended range: 1.92 to 5MHz\n",
 			 data->clk, rate);
 
 	/* register of thermal sensor and get info from DT */
-	tz = devm_thermal_of_zone_register(&pdev->dev, 0, data,
-					   &bcm2835_thermal_ops);
+	tz = devm_thermal_of_zone_register(dev, 0, data, &bcm2835_thermal_ops);
 	if (IS_ERR(tz)) {
 		err = PTR_ERR(tz);
-		dev_err(&pdev->dev,
-			"Failed to register the thermal device: %d\n",
-			err);
+		dev_err(dev, "Failed to register the thermal device: %d\n", err);
 		return err;
 	}
 
@@ -229,9 +226,7 @@ static int bcm2835_thermal_probe(struct platform_device *pdev)
 		 */
 		err = thermal_zone_get_trip(tz, 0, &trip);
 		if (err < 0) {
-			dev_err(&pdev->dev,
-				"Not able to read trip_temp: %d\n",
-				err);
+			dev_err(dev, "Not able to read trip_temp: %d\n", err);
 			return err;
 		}
 

-- 
2.43.0


