Return-Path: <linux-arm-msm+bounces-25641-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C52B792BA5F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 15:03:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E84F21C22628
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 13:03:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 972B315EFAA;
	Tue,  9 Jul 2024 13:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NggXZ3VL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0972215B117
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jul 2024 13:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720530037; cv=none; b=WpkeyZF/ieSwWa82ZpqmZZS2EvkQRqlxrumCNM+q5Lkt5/Le1UmXwJLXbAJIn+nk5cFBwU1o5iWmSz4p3ix0o/AgOZ0wleSox24WbiAjPI9sNw1YV/g0PdZEePA/k0+XJ/7For4O0suSC7cHt/M4egJ9Gr/skAjkjbCGoAlHLrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720530037; c=relaxed/simple;
	bh=dRNPdiMHs5AjBJLVXY9f2jPIkcAHpa0b1bsVOlnJ7RA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UOSGAWbb6l/azvDgah49NyQmxVz4zQHPrqCzHXbG3i+AIj7SR/nuhDgkq3XinJqeK+AMQCtFoVAt/ihBtGOZAnnp0HJo9BKcPxJuDI1mUH3w9cAAi6iaU/1KKgR/Su5w2BJ8STVHW3BkXohR5OdX0wmr+0+uujdyt3gQ6KNKXqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NggXZ3VL; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a77cbb5e987so465142466b.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jul 2024 06:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720530034; x=1721134834; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jjGA/qGgx+mIcxP+gFJINfnUDkg2XfZfkekchd5J/GM=;
        b=NggXZ3VL0uh0yAlFRRwN5lROMANhkBzrqyyxLCVpi9duxllYu9gaB7xARtS/LUWp4A
         dU48PTvleBbYmaYJbbjyNvlk39QwN6T6BTWezULlikGELgNObMepdpppLlsOZ1E8BUya
         wAk/WhLOsKe3BlnvbmDKmii1lb6ryA4bTxnUyIERHPxo8PjtY9g+jITsx4ee5+cVgkgU
         /aBov8If2sq4r++u4XcmHvc2n5u6zNDv+OHPc4sMroUratnB9grMzO87EWM4+5PWU1S0
         Aiuol+t0APh0WyETELFfs6Tk+0X65uec7i6dvJ/4qZQG+d9zSZ5snGKfltr+k0cO3rTG
         SjZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720530034; x=1721134834;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jjGA/qGgx+mIcxP+gFJINfnUDkg2XfZfkekchd5J/GM=;
        b=vZDrLrbHFAOny0ljU6mexaJpgpNpRfqIp62TPT7dtshAB/AokwgrlAVCK9IkaPgidj
         3vNt9eLs9wSYH1omFC7gzq+ZkwVUpaJweYM+LwEbJBLBJzR7+TNf3Um/dQdSL2CcuX8v
         5pdt8R5Mfuxq4vp69enGdHvsI8QKD0kI5irZ0xVoduJhFZZ2/fHOpVNOErjnf8KLdP5U
         f8Oxsz3dK+OQFeero3Auxzl3/qYkJJq8AMXEl5UBDClp/TBWVKceXkXtpZfBSB5ELtaW
         vXSnfZTBn7LJXWPuIc5UsZkoCuhNUnbM0Okf36nZzQlGn6sMZY70+FWg/gxhC4wkSkam
         T4fQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/n5RVbW9PD//4m7n+7+52t1agvLVx3I2IwRrcPKaebhaB0LYbufNB4mwNe3Fr+opmLCthDTDhioFO4pqC5eNg69FOS1L4X4sWYRCnVw==
X-Gm-Message-State: AOJu0Yx7WFGkNcz1F98NWsEsIBDB+QFqxsM1oPO8tZkpDMUeOoYmE/aE
	ZmFWZ6ZrTNrGdwTu7yaA/pf9e1Q+y/DBiXDH1hhpxyC+tPn0sPDUTCK8uqjHUZc=
X-Google-Smtp-Source: AGHT+IEvlSBh+Szj5ezUq5/+0OHoN+tL3GwMj4ME8t9YN2RMSRh308GAXCgqTDwSX+Qvm/IYABP5uQ==
X-Received: by 2002:a17:907:7246:b0:a77:dbf0:d30 with SMTP id a640c23a62f3a-a780b705283mr174415366b.41.1720530013327;
        Tue, 09 Jul 2024 06:00:13 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a780a6e157bsm76643166b.80.2024.07.09.06.00.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 06:00:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 09 Jul 2024 14:59:41 +0200
Subject: [PATCH 11/12] thermal/drivers/generic-adc: simplify probe() with
 local dev variable
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240709-thermal-probe-v1-11-241644e2b6e0@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2174;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=dRNPdiMHs5AjBJLVXY9f2jPIkcAHpa0b1bsVOlnJ7RA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmjTRFZ5MLzIVp7LvkdrHSPaSlqf6y8s01csIEj
 qkfohuXlouJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZo00RQAKCRDBN2bmhouD
 1wGREACN2X1SM0a5l36cmwMYVTDJYxFXet8S8CCm1qRc9HNMvKSHAsYsEar/4yX4RCVdwXDOf8q
 TVfvsvVLvi+AUnLXyO/mnAmOl6eommFQXgj+4/m42iWvIjQBdAIA5mpY6l8omPngKnf6IZAWXmD
 4r2VzHfX5medjrTt6mC/LJwF3Do52VpnQN31eYcQmGzsskmQ2LoSfXYSzm79GDQjrmboKXUtZop
 A4qZmEZJ1y5OFdv4eDeOrpn9Bm8YRObeOyU3AzyBgOFCmnY14cvPjWuORSUj9y4FdT+yed5f3Sw
 bl3VlshqNjNK+vn/4AidJCYSDzuASTfyqCINvyebP/WY8AErrCA/12eJMF7RMvllwg4sKxKJeJG
 6Pyd1cANRuMTwsDdqH0bnFxrwtV6ob1OU4gtL64jfMl8SPA9GMQXJNXeTFbdcnIDeYpbXralofE
 ruVJlaoMFhKMyyrbsGRCIc/GpYs/lmpFYMQ4QsR/6sZ692iuxND3b/rwhplPPBV3PvSYIbd3EzW
 xUvEp2P7HZMWHwPHm9wadE8heVQhrvxal6FQ1STTQFI4Ucyfa4FDM2eu7wDNri7M2rxf8x7czuE
 FpVcL5fWoMiUxtS44PCun2/gC5tFtWLekLByvUBR0acrR9R/O5qwgnJ8KBLCTwuhGLBBHjicWme
 +OqH4VRpb7uVS2g==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Simplify the probe() function by using local 'dev' instead of
&pdev->dev.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/thermal/thermal-generic-adc.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/thermal/thermal-generic-adc.c b/drivers/thermal/thermal-generic-adc.c
index 1717e4a19dcb..d08bff91ac3d 100644
--- a/drivers/thermal/thermal-generic-adc.c
+++ b/drivers/thermal/thermal-generic-adc.c
@@ -117,44 +117,45 @@ static int gadc_thermal_read_linear_lookup_table(struct device *dev,
 
 static int gadc_thermal_probe(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
 	struct gadc_thermal_info *gti;
 	int ret;
 
-	if (!pdev->dev.of_node) {
-		dev_err(&pdev->dev, "Only DT based supported\n");
+	if (!dev->of_node) {
+		dev_err(dev, "Only DT based supported\n");
 		return -ENODEV;
 	}
 
-	gti = devm_kzalloc(&pdev->dev, sizeof(*gti), GFP_KERNEL);
+	gti = devm_kzalloc(dev, sizeof(*gti), GFP_KERNEL);
 	if (!gti)
 		return -ENOMEM;
 
-	gti->channel = devm_iio_channel_get(&pdev->dev, "sensor-channel");
+	gti->channel = devm_iio_channel_get(dev, "sensor-channel");
 	if (IS_ERR(gti->channel)) {
 		ret = PTR_ERR(gti->channel);
 		if (ret != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "IIO channel not found: %d\n", ret);
+			dev_err(dev, "IIO channel not found: %d\n", ret);
 		return ret;
 	}
 
-	ret = gadc_thermal_read_linear_lookup_table(&pdev->dev, gti);
+	ret = gadc_thermal_read_linear_lookup_table(dev, gti);
 	if (ret < 0)
 		return ret;
 
-	gti->dev = &pdev->dev;
+	gti->dev = dev;
 
-	gti->tz_dev = devm_thermal_of_zone_register(&pdev->dev, 0, gti,
+	gti->tz_dev = devm_thermal_of_zone_register(dev, 0, gti,
 						    &gadc_thermal_ops);
 	if (IS_ERR(gti->tz_dev)) {
 		ret = PTR_ERR(gti->tz_dev);
 		if (ret != -EPROBE_DEFER)
-			dev_err(&pdev->dev,
+			dev_err(dev,
 				"Thermal zone sensor register failed: %d\n",
 				ret);
 		return ret;
 	}
 
-	devm_thermal_add_hwmon_sysfs(&pdev->dev, gti->tz_dev);
+	devm_thermal_add_hwmon_sysfs(dev, gti->tz_dev);
 
 	return 0;
 }

-- 
2.43.0


