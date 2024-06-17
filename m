Return-Path: <linux-arm-msm+bounces-22877-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A04990B24E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 16:37:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C96251F20CD6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 14:37:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 196FD1C231C;
	Mon, 17 Jun 2024 13:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="bEAZPSDn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A3A1C2302
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2024 13:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718632220; cv=none; b=Csjq79AlfFc4jgUTksvrjZq/szcvklqeyu133bT8s9sjPRbg6wkLiuNl57D5MU7pdlEzs6uPLcB8iAIMBkEMx04fvfKryXJnrZnBfDiad+oWQlXJefF3ehRYGHCQapd6BaGATJc1f5FAiQnpS7GaSc5/c4O5AdjSB6N4jq+kawQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718632220; c=relaxed/simple;
	bh=MPFBeRiBqEWL2ZmKqHZsE/yYze6ZRHtpV3TD+LCyks4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fgXq+5QyrPqexSPNgaq+TgFnLqNyMnQfH7AKmufeJTUZx8VJ+Px8hYnTn+9P6PA8SHFTt+SAFKa+Wep9IYmTz6id5z3TVg5Goz+oIOcvnpchkTMFykzeeUFi/s/+xFbaGktq9D7VVTG1cYujorgagHSNkiNJetOaFXgh2PsvVvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=bEAZPSDn; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7954f8b818fso290886985a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2024 06:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632217; x=1719237017; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FJ898fDCKj42D5/vtQAto1s5SAQxhzxV4OLmCarOpnQ=;
        b=bEAZPSDnjFTXq7axyppRkNjq9rnh9UY2tflooNd1skPj/QepFdnGhnqUWyhhMTTcMV
         0OQk2Dcap5xKi3Ri3y+DP5Y1FrBVUih9ss3fiavHl8MjHu3aax4zci4fufxOWt6BK3Ka
         Rnd53Ec5t1kRcnXCapPeQCjzlITXBue0H6+pnOv7IqQzTAHUrIXw4Bom4j+551GwJtGx
         MCq50sELaOCV7E813Pv4LndyUmUtZ1w6Jo/79/HmNrJaZmhLUuRGE4CmkvAK/QEk26cQ
         JlAkobXzZ7SI0tw8otTS/nKZjqVVSOD9srk4WSh/ObL4yN74BXmDNpUGa7QejgpzOJ2V
         Gdbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718632217; x=1719237017;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FJ898fDCKj42D5/vtQAto1s5SAQxhzxV4OLmCarOpnQ=;
        b=Bv3YizrP1Knu/kzeMqsrB8HOHFNezZqa6qT0mpogPeJWZqfxMYxruEaRWR7XX1zsUz
         sfsi9RwKvJIDD2g6zzdICYdKk788lxpGBLperweFmHjbecyB754RKJmag4fYuhpfKacS
         kmBHcPbhhni//A/3G3KS7dL1OGI2ARuEvzE7UdjUcsqPqD427uZUwirLjE+qCJ1j+Njv
         z4Ai+Xalq1lxAyD0ntJc8cq32v3B75pPkbEEbcCn8/ClOqCCKSziUrP2vaua2inXaZVu
         RlP+Goj6NH27a7Gb5mTT59s7tRLFgQ1JQODQq21iNlbmiXbpxkY2ZU2u2AkmzqDRml7m
         /G5A==
X-Forwarded-Encrypted: i=1; AJvYcCWIcDShDhbaerNNn0M6/MNjMQdQ6uqexYmZ6GvZrolDxau+OtSs01iJ++8PyeKJoZyO6ykjjQGsXvp7ViZs7HO38a6gaXgDqtDy/yX9NQ==
X-Gm-Message-State: AOJu0Yz/vvGY/oWzHUzXKj0DyzbY5tfRHL6A6IAwGhzSFJryM7i7L7e4
	64oXVKWGDDuty3LgquOqvc/4On7c1WSJTgQ0snBv/8N/5sCk6fSYcAfzJMadk9k=
X-Google-Smtp-Source: AGHT+IG7O2bJi0GCfnphwmiN8zuYwAKTZAA7K/LgtdsfOhK/hCe8sAhzrzmLoDYS8PhLsNItnynlLA==
X-Received: by 2002:a05:620a:404a:b0:795:2307:97ec with SMTP id af79cd13be357-798d2588f12mr1074628285a.56.1718632217032;
        Mon, 17 Jun 2024 06:50:17 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:50:16 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:49:55 -0400
Subject: [PATCH v3 15/41] iio: adc: qcom-spmi-rradc: make use of
 regmap_clear_bits(), regmap_set_bits()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240617-review-v3-15-88d1338c4cca@baylibre.com>
References: <20240617-review-v3-0-88d1338c4cca@baylibre.com>
In-Reply-To: <20240617-review-v3-0-88d1338c4cca@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 Dmitry Rokosov <ddrokosov@sberdevices.ru>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Cosmin Tanislav <cosmin.tanislav@analog.com>, Chen-Yu Tsai <wens@csie.org>, 
 Hans de Goede <hdegoede@redhat.com>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Saravanan Sekar <sravanhome@gmail.com>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Jean-Baptiste Maneyrol <jmaneyrol@invensense.com>, 
 Crt Mori <cmo@melexis.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 Trevor Gamblin <tgamblin@baylibre.com>
X-Mailer: b4 0.13.0

Instead of using regmap_update_bits() and passing the mask twice, use
regmap_set_bits().

Instead of using regmap_update_bits() and passing val = 0, use
regmap_clear_bits().

Suggested-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 drivers/iio/adc/qcom-spmi-rradc.c | 50 +++++++++++++++++++--------------------
 1 file changed, 24 insertions(+), 26 deletions(-)

diff --git a/drivers/iio/adc/qcom-spmi-rradc.c b/drivers/iio/adc/qcom-spmi-rradc.c
index 56a713766954..1402df68dd52 100644
--- a/drivers/iio/adc/qcom-spmi-rradc.c
+++ b/drivers/iio/adc/qcom-spmi-rradc.c
@@ -358,15 +358,15 @@ static int rradc_enable_continuous_mode(struct rradc_chip *chip)
 	int ret;
 
 	/* Clear channel log */
-	ret = regmap_update_bits(chip->regmap, chip->base + RR_ADC_LOG,
-				 RR_ADC_LOG_CLR_CTRL, RR_ADC_LOG_CLR_CTRL);
+	ret = regmap_set_bits(chip->regmap, chip->base + RR_ADC_LOG,
+			      RR_ADC_LOG_CLR_CTRL);
 	if (ret < 0) {
 		dev_err(chip->dev, "log ctrl update to clear failed:%d\n", ret);
 		return ret;
 	}
 
-	ret = regmap_update_bits(chip->regmap, chip->base + RR_ADC_LOG,
-				 RR_ADC_LOG_CLR_CTRL, 0);
+	ret = regmap_clear_bits(chip->regmap, chip->base + RR_ADC_LOG,
+				RR_ADC_LOG_CLR_CTRL);
 	if (ret < 0) {
 		dev_err(chip->dev, "log ctrl update to not clear failed:%d\n",
 			ret);
@@ -374,9 +374,8 @@ static int rradc_enable_continuous_mode(struct rradc_chip *chip)
 	}
 
 	/* Switch to continuous mode */
-	ret = regmap_update_bits(chip->regmap, chip->base + RR_ADC_CTL,
-				 RR_ADC_CTL_CONTINUOUS_SEL,
-				 RR_ADC_CTL_CONTINUOUS_SEL);
+	ret = regmap_set_bits(chip->regmap, chip->base + RR_ADC_CTL,
+			      RR_ADC_CTL_CONTINUOUS_SEL);
 	if (ret < 0)
 		dev_err(chip->dev, "Update to continuous mode failed:%d\n",
 			ret);
@@ -389,8 +388,8 @@ static int rradc_disable_continuous_mode(struct rradc_chip *chip)
 	int ret;
 
 	/* Switch to non continuous mode */
-	ret = regmap_update_bits(chip->regmap, chip->base + RR_ADC_CTL,
-				 RR_ADC_CTL_CONTINUOUS_SEL, 0);
+	ret = regmap_clear_bits(chip->regmap, chip->base + RR_ADC_CTL,
+				RR_ADC_CTL_CONTINUOUS_SEL);
 	if (ret < 0)
 		dev_err(chip->dev, "Update to non-continuous mode failed:%d\n",
 			ret);
@@ -434,8 +433,8 @@ static int rradc_read_status_in_cont_mode(struct rradc_chip *chip,
 		return -EINVAL;
 	}
 
-	ret = regmap_update_bits(chip->regmap, chip->base + chan->trigger_addr,
-				 chan->trigger_mask, chan->trigger_mask);
+	ret = regmap_set_bits(chip->regmap, chip->base + chan->trigger_addr,
+			      chan->trigger_mask);
 	if (ret < 0) {
 		dev_err(chip->dev,
 			"Failed to apply trigger for channel '%s' ret=%d\n",
@@ -469,8 +468,8 @@ static int rradc_read_status_in_cont_mode(struct rradc_chip *chip,
 	rradc_disable_continuous_mode(chip);
 
 disable_trigger:
-	regmap_update_bits(chip->regmap, chip->base + chan->trigger_addr,
-			   chan->trigger_mask, 0);
+	regmap_clear_bits(chip->regmap, chip->base + chan->trigger_addr,
+			  chan->trigger_mask);
 
 	return ret;
 }
@@ -481,17 +480,16 @@ static int rradc_prepare_batt_id_conversion(struct rradc_chip *chip,
 {
 	int ret;
 
-	ret = regmap_update_bits(chip->regmap, chip->base + RR_ADC_BATT_ID_CTRL,
-				 RR_ADC_BATT_ID_CTRL_CHANNEL_CONV,
-				 RR_ADC_BATT_ID_CTRL_CHANNEL_CONV);
+	ret = regmap_set_bits(chip->regmap, chip->base + RR_ADC_BATT_ID_CTRL,
+			      RR_ADC_BATT_ID_CTRL_CHANNEL_CONV);
 	if (ret < 0) {
 		dev_err(chip->dev, "Enabling BATT ID channel failed:%d\n", ret);
 		return ret;
 	}
 
-	ret = regmap_update_bits(chip->regmap,
-				 chip->base + RR_ADC_BATT_ID_TRIGGER,
-				 RR_ADC_TRIGGER_CTL, RR_ADC_TRIGGER_CTL);
+	ret = regmap_set_bits(chip->regmap,
+			      chip->base + RR_ADC_BATT_ID_TRIGGER,
+			      RR_ADC_TRIGGER_CTL);
 	if (ret < 0) {
 		dev_err(chip->dev, "BATT_ID trigger set failed:%d\n", ret);
 		goto out_disable_batt_id;
@@ -500,12 +498,12 @@ static int rradc_prepare_batt_id_conversion(struct rradc_chip *chip,
 	ret = rradc_read_status_in_cont_mode(chip, chan_address);
 
 	/* Reset registers back to default values */
-	regmap_update_bits(chip->regmap, chip->base + RR_ADC_BATT_ID_TRIGGER,
-			   RR_ADC_TRIGGER_CTL, 0);
+	regmap_clear_bits(chip->regmap, chip->base + RR_ADC_BATT_ID_TRIGGER,
+			  RR_ADC_TRIGGER_CTL);
 
 out_disable_batt_id:
-	regmap_update_bits(chip->regmap, chip->base + RR_ADC_BATT_ID_CTRL,
-			   RR_ADC_BATT_ID_CTRL_CHANNEL_CONV, 0);
+	regmap_clear_bits(chip->regmap, chip->base + RR_ADC_BATT_ID_CTRL,
+			  RR_ADC_BATT_ID_CTRL_CHANNEL_CONV);
 
 	return ret;
 }
@@ -965,9 +963,9 @@ static int rradc_probe(struct platform_device *pdev)
 
 	if (batt_id_delay >= 0) {
 		batt_id_delay = FIELD_PREP(BATT_ID_SETTLE_MASK, batt_id_delay);
-		ret = regmap_update_bits(chip->regmap,
-					 chip->base + RR_ADC_BATT_ID_CFG,
-					 batt_id_delay, batt_id_delay);
+		ret = regmap_set_bits(chip->regmap,
+				      chip->base + RR_ADC_BATT_ID_CFG,
+				      batt_id_delay);
 		if (ret < 0) {
 			dev_err(chip->dev,
 				"BATT_ID settling time config failed:%d\n",

-- 
2.45.2


