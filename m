Return-Path: <linux-arm-msm+bounces-22870-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57FA990B233
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 16:35:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 488581C22B0B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 14:35:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C37D71BD032;
	Mon, 17 Jun 2024 13:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="q8WPYh6Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F531BC092
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2024 13:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718632205; cv=none; b=iqRtIe1crB9sS0V9GhvKPWSITiSZuHVeacQdVsqJpe9UrCsw/mfrZurpNJNwKSIJtRbEoewIdwZ3gjbOVkcl4R6i88iTckc2FRaId81iVJc9FND/MCnNrrTlrlRUB0549fRs9DsXqT+39EpM1jHMfi6HPHe0ocbE0Q3bOIrV9cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718632205; c=relaxed/simple;
	bh=ut+W8QUP8tQabPWzbyke7d8OEC6HNxiYzZgFQhQRoBI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j3mH79Yq9ou8lvkc2XHpxEbO8LhAbA4KL6TFwm0KcEZqbHG2VXxGl1yJEv5b1m5QCGqpoBkq1Segf6mgQ9oe27yNUgktO/V1QJI714NA5ChJt4wIfY/1YpMecMk42noBgi6kOyJbK8D7jxsd0u6gMR4SVw2xLQWKb1qklj9nr7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=q8WPYh6Q; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-79a3f1d007fso174506185a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2024 06:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632202; x=1719237002; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/J+uii6o7EZaRWTf6fwT0Zq6b6sr2oRr59Sqisc7RFA=;
        b=q8WPYh6QaYRI3DRJrUTczZGbTcxEhdJdqBFtgCr7m5TSnUTxkeOrVHrH6OQphUXrim
         1Hko0JpivOL3ngn1JCB9235ahjVmewFLOk3A1+if/kOFk5qsTyurxdFMwa9UcTl2DoVs
         rIk+XSkDaDlpHuLSsXif52k/7T4hXpDbB/zdZ4KFdkw6aiDdZszySZnotSvrdKHzF04E
         clCLwb3dGQcLtSRPjujCa/AE5OfmRkztbho5pVop6yioq5h3tUGASV8m85lnm2bbkZHc
         Zq5K08exhOA/YRTqJdLEDEOPr7FAE9h9oG1q5w3zeWQv08BM4n7RP+IqSpvEko8vdhQR
         9nig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718632202; x=1719237002;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/J+uii6o7EZaRWTf6fwT0Zq6b6sr2oRr59Sqisc7RFA=;
        b=QcfHIgr5lB6lD/DARcV6KUgG0vt9sy7/6fyA9GZ5j/6ElFU+WmSX4bSLA2gVk7JaXs
         jr9cWkZ1Hc0ux1u3wpxAmRcWVwI1WqPqTzcj92tQtOOQm0DPJeZVGnJ4Xc+cQy7sc5AW
         g5mZ+SLmCSiJ1s8tDkXSBTXuNgSp8sdSuLlGZVNhMYyr35qd6UCspKSOfeDShEUaWwA3
         nfuCDSlDRWALAltdnrFc1BnSG0w1ZznDO7zlhs9jpusgxmsWKqCkshgZjWbjJ8rUksT0
         ocwFkys+Q115EZwDi8rV61NvX7VseErQmgLDv2vVsAFGkmT/ZnHBKYghlRkKS5UIuv4/
         LWrw==
X-Forwarded-Encrypted: i=1; AJvYcCW/5kzqFMMDwbFMONlRjCgV3bU+fnrIHyKe3edNcR4DrCS3fwdkVLVvo8GKCaYvXPfy67oM/MLb/XXlO6YiF3hzed5NLL1uBWBvAjNvZw==
X-Gm-Message-State: AOJu0Yw841/vH1AwHSMh1zB6MX6flJ8gK6Kw0rIWZSjxCg3kjMt/Wb6p
	+U+BXl/orVuWowqxATIQSN4LV9Mh3P1RJiUx/2CUft3mm/jLseTf7HhZWQiWEHA=
X-Google-Smtp-Source: AGHT+IHQO7lDiG1TVDzbCtPAbJI8uHKSdU2/yIiDIlagRddBfJsOkXoStyLOw9TY/mBvF1osZeRq9Q==
X-Received: by 2002:a05:620a:2955:b0:792:c34d:482 with SMTP id af79cd13be357-798d2413b26mr1228938285a.25.1718632201881;
        Mon, 17 Jun 2024 06:50:01 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:50:01 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:49:48 -0400
Subject: [PATCH v3 08/41] iio: adc: berlin2-adc: make use of
 regmap_clear_bits(), regmap_set_bits()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240617-review-v3-8-88d1338c4cca@baylibre.com>
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
 drivers/iio/adc/berlin2-adc.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/iio/adc/berlin2-adc.c b/drivers/iio/adc/berlin2-adc.c
index a4e7c7eff5ac..4cdddc6e36e9 100644
--- a/drivers/iio/adc/berlin2-adc.c
+++ b/drivers/iio/adc/berlin2-adc.c
@@ -129,8 +129,8 @@ static int berlin2_adc_read(struct iio_dev *indio_dev, int channel)
 					       msecs_to_jiffies(1000));
 
 	/* Disable the interrupts */
-	regmap_update_bits(priv->regmap, BERLIN2_SM_ADC_STATUS,
-			   BERLIN2_SM_ADC_STATUS_INT_EN(channel), 0);
+	regmap_clear_bits(priv->regmap, BERLIN2_SM_ADC_STATUS,
+			  BERLIN2_SM_ADC_STATUS_INT_EN(channel));
 
 	if (ret == 0)
 		ret = -ETIMEDOUT;
@@ -139,8 +139,8 @@ static int berlin2_adc_read(struct iio_dev *indio_dev, int channel)
 		return ret;
 	}
 
-	regmap_update_bits(priv->regmap, BERLIN2_SM_CTRL,
-			   BERLIN2_SM_CTRL_ADC_START, 0);
+	regmap_clear_bits(priv->regmap, BERLIN2_SM_CTRL,
+			  BERLIN2_SM_CTRL_ADC_START);
 
 	data = priv->data;
 	priv->data_available = false;
@@ -180,8 +180,8 @@ static int berlin2_adc_tsen_read(struct iio_dev *indio_dev)
 					       msecs_to_jiffies(1000));
 
 	/* Disable interrupts */
-	regmap_update_bits(priv->regmap, BERLIN2_SM_TSEN_STATUS,
-			   BERLIN2_SM_TSEN_STATUS_INT_EN, 0);
+	regmap_clear_bits(priv->regmap, BERLIN2_SM_TSEN_STATUS,
+			  BERLIN2_SM_TSEN_STATUS_INT_EN);
 
 	if (ret == 0)
 		ret = -ETIMEDOUT;
@@ -190,8 +190,8 @@ static int berlin2_adc_tsen_read(struct iio_dev *indio_dev)
 		return ret;
 	}
 
-	regmap_update_bits(priv->regmap, BERLIN2_SM_TSEN_CTRL,
-			   BERLIN2_SM_TSEN_CTRL_START, 0);
+	regmap_clear_bits(priv->regmap, BERLIN2_SM_TSEN_CTRL,
+			  BERLIN2_SM_TSEN_CTRL_START);
 
 	data = priv->data;
 	priv->data_available = false;
@@ -284,8 +284,7 @@ static const struct iio_info berlin2_adc_info = {
 
 static void berlin2_adc_powerdown(void *regmap)
 {
-	regmap_update_bits(regmap, BERLIN2_SM_CTRL,
-			   BERLIN2_SM_CTRL_ADC_POWER, 0);
+	regmap_clear_bits(regmap, BERLIN2_SM_CTRL, BERLIN2_SM_CTRL_ADC_POWER);
 
 }
 
@@ -339,9 +338,8 @@ static int berlin2_adc_probe(struct platform_device *pdev)
 	indio_dev->num_channels = ARRAY_SIZE(berlin2_adc_channels);
 
 	/* Power up the ADC */
-	regmap_update_bits(priv->regmap, BERLIN2_SM_CTRL,
-			   BERLIN2_SM_CTRL_ADC_POWER,
-			   BERLIN2_SM_CTRL_ADC_POWER);
+	regmap_set_bits(priv->regmap, BERLIN2_SM_CTRL,
+			BERLIN2_SM_CTRL_ADC_POWER);
 
 	ret = devm_add_action_or_reset(&pdev->dev, berlin2_adc_powerdown,
 				       priv->regmap);

-- 
2.45.2


