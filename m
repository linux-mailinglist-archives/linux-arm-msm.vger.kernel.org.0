Return-Path: <linux-arm-msm+bounces-86972-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D18ACE9BA3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 14:03:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 437C13005F17
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 13:03:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 825E52144C7;
	Tue, 30 Dec 2025 13:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mMVAfwjW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBDB51D6DA9
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 13:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767099783; cv=none; b=awU5/kTffwT0xLgyqX6V0ETfo6+pswa6NVrbvWYgteX+FrLN/7SWUrhTkFCfDE4IOrhkh+fxUhdrb1vOTNGczEfw8pZxc8+mWB83BJwzNR+KhpaCH68n9jLgZxK31dkKIOdmfWWfjpPS/dTKHA56YPXXnSV9vFzc2KZcfvaHMHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767099783; c=relaxed/simple;
	bh=ZQ6Y7IFZTaEd6ktsVoxdPOs72CPIs+7PsUG1QLPNjHU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=a8klY4mrWSiH2irt9qyrPczGoKDmTiFgRZV+yDhnHHzLPTnbZ9JPbmIrMP3StpN75u6+Ap9+/kBEIzuscX/r7kSPlpEhL67Lo82GSli8YQoDApI/j7cx7X4n0u/cisvoa4FkktHpttvJgOc34/Z5jqpTatnn3+kpV5dR+uEm8AA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mMVAfwjW; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-29f30233d8aso115629885ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 05:03:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767099781; x=1767704581; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bFt+oA/6TnGUcf1mQLhvyTPCz7K2SXMiNJhoCpH+0PQ=;
        b=mMVAfwjW+b8cuJ2dwjTdp8T8VEVWy3RZSJRsAaKzXDEE/s7MfXGStu4SM7JO5vj24E
         apwhy77uafCtmqzIVLjYIEv6KJOJAElq+giAK13P0V4usoDkJMBQu+hTNzqHyGAi+D/B
         gKUKc0u4llVgnb8G6domyUHQ0jXTBLgns8sQvQDvOgncKF3fSAxJi51YZhXhJn3VM8yR
         8jHth8edA5vB/VRpYOiLhtqh2Ncgf/g5sLWsWxzV8NAAEjG+E9WDTV853qn1D/Eg3279
         uWRCPvKssC4lBOFSjE+UNqk5XeY+8IOVOJgtRqspUZo778Q4NrHpvBE5QNriwzoUZGTk
         QgCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767099781; x=1767704581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bFt+oA/6TnGUcf1mQLhvyTPCz7K2SXMiNJhoCpH+0PQ=;
        b=o2zaGHm1uaQsdG3J7s603m3ZZyUrBLHVls0kgbTZ0kpvsHmI+8O61HxaNiRJoJfQD3
         g7FEpnSAHH22r6NaRZmOfeMOp4nr23crbWATCyGPFTFhyX2I06r5HT0cVc1mx3eE0L/R
         Dn1qU6moOvV5u0f73pBHHtGDXxS7zpNFhGQbAjMaUiXb9cfmxo02TCtif41Js/tuwLho
         IE40TPpFuPeJGx6lIB1/3cYogbDe9PB6CJGC9LTN/lRDgeyhBv+OVgIqVIiOhXlaQwu5
         431UTCKod8MWChSIslIeALYF+plXsw1mIBRHZsgn81p94FzHIxXPlai3w7lqKKNqSs6f
         3+AA==
X-Forwarded-Encrypted: i=1; AJvYcCU7jrfthKNWUhG838L2EnDTKtHWEkMcbQlcSLf3wUeD4LEZY5vsgQ35v2m14paEY5CGGz4cPnd7j3Obn3Oa@vger.kernel.org
X-Gm-Message-State: AOJu0Yzdyejx+jWaYk6F0VQHPU5w1cbVfpYATKFzAkXwPtlQNhwtMiDv
	RcYix7yHDsl3Jxc55h38YSST9n4iwSzo7G88Z8wYiIWMwqAcxwkj6pHX
X-Gm-Gg: AY/fxX5D8YzUPN0FnsGZyi133TMJvHYDpnsNI3Ku30Pr8OGfNmeyjl0N0kHrV//I3qN
	sCGDPvXhKVhTuUk1r/RUA/9ebD2Cpo7QOK9IMWSMeNtd7mtfEXXZeG7PJNrfe+0ezMHv3OZI8Fv
	mdIDDM0Ntv12+7RjCOj5m3i6oMy3K27a3vsKu5i1P7JJ443nlUqIkejGT0dZb/ZB/YqBV4SMmf+
	i6UHKOTwiLZpaXLMZH95ed88J/Lxwvcw+4+PqhwTOtgKeeGEYfxVGDzstnDIlpbVZwZ98+k0kXV
	Hjk5f5DhSiX13Z2/2Zp90NryMEU4NeIA0xb5qDlsRt7QrBoApoYLGVzfCmkMx7/QL8b2iDKFgjU
	NfbdXHfsyq3C/e2Y7yRQymlPYDmjAbJ09bORjHPYsH0GZE5OdMCiGOaHWLO1iNn/Sg1XxmMsDIu
	bksqgenGF6JnUqkOim19Cjxf6lXjdJCyFDwgUD
X-Google-Smtp-Source: AGHT+IFOsQ07Jl6rs2Cw6NmpVbi6zdWPsCauR5WaD4vFkdSAOc437iw7lgABjk+ZfmAgdXjbg4je8w==
X-Received: by 2002:a17:903:fad:b0:295:54cb:16ac with SMTP id d9443c01a7336-2a2f2218accmr324255055ad.18.1767099781202;
        Tue, 30 Dec 2025 05:03:01 -0800 (PST)
Received: from test-HP-Desktop-Pro-G3.. ([103.218.174.23])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d6ec6bsm296003075ad.87.2025.12.30.05.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 05:03:00 -0800 (PST)
From: Sudarshan Shetty <tessolveupstream@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sudarshan Shetty <tessolveupstream@gmail.com>
Subject: [PATCH v10 3/5] backlight: gpio: add support for multiple GPIOs for backlight control
Date: Tue, 30 Dec 2025 18:32:25 +0530
Message-Id: <20251230130227.3503590-4-tessolveupstream@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251230130227.3503590-1-tessolveupstream@gmail.com>
References: <20251230130227.3503590-1-tessolveupstream@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extend the gpio-backlight driver to handle multiple GPIOs instead of a
single one. This allows panels that require driving several enable pins
to be controlled by the backlight framework.

Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
---
 drivers/video/backlight/gpio_backlight.c | 61 +++++++++++++++++-------
 1 file changed, 45 insertions(+), 16 deletions(-)

diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/video/backlight/gpio_backlight.c
index 728a546904b0..037e1c111e48 100644
--- a/drivers/video/backlight/gpio_backlight.c
+++ b/drivers/video/backlight/gpio_backlight.c
@@ -17,14 +17,18 @@
 
 struct gpio_backlight {
 	struct device *dev;
-	struct gpio_desc *gpiod;
+	struct gpio_desc **gpiods;
+	unsigned int num_gpios;
 };
 
 static int gpio_backlight_update_status(struct backlight_device *bl)
 {
 	struct gpio_backlight *gbl = bl_get_data(bl);
+	unsigned int i;
+	int br = backlight_get_brightness(bl);
 
-	gpiod_set_value_cansleep(gbl->gpiod, backlight_get_brightness(bl));
+	for (i = 0; i < gbl->num_gpios; i++)
+		gpiod_set_value_cansleep(gbl->gpiods[i], br);
 
 	return 0;
 }
@@ -52,6 +56,7 @@ static int gpio_backlight_probe(struct platform_device *pdev)
 	struct backlight_device *bl;
 	struct gpio_backlight *gbl;
 	int ret, init_brightness, def_value;
+	unsigned int i;
 
 	gbl = devm_kzalloc(dev, sizeof(*gbl), GFP_KERNEL);
 	if (gbl == NULL)
@@ -62,10 +67,22 @@ static int gpio_backlight_probe(struct platform_device *pdev)
 
 	def_value = device_property_read_bool(dev, "default-on");
 
-	gbl->gpiod = devm_gpiod_get(dev, NULL, GPIOD_ASIS);
-	if (IS_ERR(gbl->gpiod))
-		return dev_err_probe(dev, PTR_ERR(gbl->gpiod),
-				     "The gpios parameter is missing or invalid\n");
+	gbl->num_gpios = gpiod_count(dev, NULL);
+	if (gbl->num_gpios == 0)
+		return dev_err_probe(dev, -EINVAL,
+			"The gpios parameter is missing or invalid\n");
+	gbl->gpiods = devm_kcalloc(dev, gbl->num_gpios, sizeof(*gbl->gpiods),
+				   GFP_KERNEL);
+	if (!gbl->gpiods)
+		return -ENOMEM;
+
+	for (i = 0; i < gbl->num_gpios; i++) {
+		gbl->gpiods[i] =
+			devm_gpiod_get_index(dev, NULL, i, GPIOD_ASIS);
+		if (IS_ERR(gbl->gpiods[i]))
+			return dev_err_probe(dev, PTR_ERR(gbl->gpiods[i]),
+					"Failed to get GPIO at index %u\n", i);
+	}
 
 	memset(&props, 0, sizeof(props));
 	props.type = BACKLIGHT_RAW;
@@ -78,22 +95,34 @@ static int gpio_backlight_probe(struct platform_device *pdev)
 	}
 
 	/* Set the initial power state */
-	if (!of_node || !of_node->phandle)
+	if (!of_node || !of_node->phandle) {
 		/* Not booted with device tree or no phandle link to the node */
 		bl->props.power = def_value ? BACKLIGHT_POWER_ON
-					    : BACKLIGHT_POWER_OFF;
-	else if (gpiod_get_value_cansleep(gbl->gpiod) == 0)
-		bl->props.power = BACKLIGHT_POWER_OFF;
-	else
-		bl->props.power = BACKLIGHT_POWER_ON;
+						    : BACKLIGHT_POWER_OFF;
+	} else {
+		bool all_high = true;
+
+		for (i = 0; i < gbl->num_gpios; i++) {
+			if (gpiod_get_value_cansleep(gbl->gpiods[i]) != 0) {
+				all_high = false;
+				break;
+			}
+		}
+
+		bl->props.power =
+			all_high ? BACKLIGHT_POWER_ON :  BACKLIGHT_POWER_OFF;
+	}
 
 	bl->props.brightness = 1;
 
 	init_brightness = backlight_get_brightness(bl);
-	ret = gpiod_direction_output(gbl->gpiod, init_brightness);
-	if (ret) {
-		dev_err(dev, "failed to set initial brightness\n");
-		return ret;
+
+	for (i = 0; i < gbl->num_gpios; i++) {
+		ret = gpiod_direction_output(gbl->gpiods[i], init_brightness);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					"failed to set gpio %u direction\n",
+					i);
 	}
 
 	platform_set_drvdata(pdev, bl);
-- 
2.34.1


