Return-Path: <linux-arm-msm+bounces-22871-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DBAE490B236
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 16:35:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5EDB81F24084
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 14:35:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF52F1BD4F2;
	Mon, 17 Jun 2024 13:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="drFxu3QI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA8F1BD025
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2024 13:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718632206; cv=none; b=Cjqu5l0rSBCtbb9HDmWNW3fxWf9/T3737krKoVdFVcwhVLsDL3WKG0qoGGzO6esQEZ8/fgiZcDCoq1fZX9TPOphjPPqAMqa7hVH06j8NHjfEWa7HHgXat+j9/x59LzG2IhbC7bhAzkzQtJvwecb6yJnrWHH8/rmWO0rDrtWD0WY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718632206; c=relaxed/simple;
	bh=C6gfMUeKRh6vNiJAqdCzmX2JzDDgIvBqfFNnNfFuGtI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gvHEaDZ0dEfPPzYQg4KXsPpUqQsZdfWtZ8sJu5U/WfVTSQLo0hTTaQ9S4DJItu9VrrOh5d8or/OVbTQY6RGQXPbnW99/mjChSB0XspOpS76ofZvz9rBB8aXE1SKtHRzQYnqiB9fWO7zq93Df+q/Vp8tUGrrngI9IdTOKemQN4As=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=drFxu3QI; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-79550284502so267227285a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2024 06:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632204; x=1719237004; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ClhrI/fyo1cx6bZjSpXIGRy7tTTxclMqWX7+F4JU4yY=;
        b=drFxu3QI4Jfvs2ujZ3Arn31o5F0Kntml736IZUKsfgMFT6L5CaT5270DJpwaqPdj4/
         HaSUliJb2j9haRk5To9EjFCLALX5Iagbw5KvU1mS2QW+s1W5mXqJI6jCXd7mv4xXFLI6
         ri8c99Q3ZJUO9+3VqZTdZgyde3qeB9LaE64Ln/s0LNoy2j1cXmFeg/hbEwscAITrN7uX
         3eXkNH2QcxopTwSUXpeUt5r7ii2RU3LC6Kai0rOr422dxgM3SOAWkhGF+xeMAkUj/cvF
         uyQIVjFJGxf0zNbK/A6zng/CvAfXMkvUZLJ1qH6KgJIsVIh4JiZCef1G/gHJA42Gzxcd
         eVug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718632204; x=1719237004;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ClhrI/fyo1cx6bZjSpXIGRy7tTTxclMqWX7+F4JU4yY=;
        b=cliTeY3oD9XvuWJue+MHABOSptTxWa5VbeEL9v4Bn+Gm87GkF5ZY3sojLbn+h22MEl
         evvdrOQJKmsrQXxn5mWRQrTXmryOPyeVwaKi2OH2FQWwEzPck0RZDKzCccVREOBhEjc8
         M+yEVVUkL8eFot5JSHg2H9oWKDn+lSdEXjfcCTdl2Dk0rQ+ctH3ZRgYTWZISUnJXFEFK
         lana80VHekxaI1Py/a0h7O7D2q6+7V5DLLW90MgkhnVkMQATSZzK4ii06DeHqdE9xDmL
         Yid6b3bTBJoYFiBhtjlJGRppyKg6Id/AhryVsiRrvVrD1c8YDRw8GjJNC0w171RoBvCQ
         U8JA==
X-Forwarded-Encrypted: i=1; AJvYcCUKR8qj4/U7XESQzoaOckLrxKe67PRPpsKtRfLUMueUVWHZPgbUhUCnvxr0PceMwCtnBaeEz43Z3yApGOqEeGjH8d+I6hN7ncUs4JfpjQ==
X-Gm-Message-State: AOJu0YwJawJk3UOwr6dxVmP0XBU0On4LfmCne8jB0mPzDnbINwxuUzz6
	hF0LNSpOZYj7Rheq69kgEnmmFtPJ/rwc+qQeBW0nd9Ad1ZZkGBV0Tq/X+MTp8/g=
X-Google-Smtp-Source: AGHT+IGEJP+y4ORB/qQsSLGS1aQN67uw6XFJYR5D2HpTVdZajfNzX+EcKLbp10S7XC6/Qne2Ev/fMQ==
X-Received: by 2002:a05:620a:4721:b0:795:55a1:9dd3 with SMTP id af79cd13be357-798d23c4382mr1195766785a.16.1718632204033;
        Mon, 17 Jun 2024 06:50:04 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:50:03 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:49:49 -0400
Subject: [PATCH v3 09/41] iio: adc: cpcap-adc: make use of
 regmap_clear_bits(), regmap_set_bits()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240617-review-v3-9-88d1338c4cca@baylibre.com>
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
 drivers/iio/adc/cpcap-adc.c | 46 +++++++++++++++++++--------------------------
 1 file changed, 19 insertions(+), 27 deletions(-)

diff --git a/drivers/iio/adc/cpcap-adc.c b/drivers/iio/adc/cpcap-adc.c
index b6c4ef70484e..c218acf6c9c6 100644
--- a/drivers/iio/adc/cpcap-adc.c
+++ b/drivers/iio/adc/cpcap-adc.c
@@ -385,9 +385,8 @@ static irqreturn_t cpcap_adc_irq_thread(int irq, void *data)
 	struct cpcap_adc *ddata = iio_priv(indio_dev);
 	int error;
 
-	error = regmap_update_bits(ddata->reg, CPCAP_REG_ADCC2,
-				   CPCAP_BIT_ADTRIG_DIS,
-				   CPCAP_BIT_ADTRIG_DIS);
+	error = regmap_set_bits(ddata->reg, CPCAP_REG_ADCC2,
+				CPCAP_BIT_ADTRIG_DIS);
 	if (error)
 		return IRQ_NONE;
 
@@ -424,23 +423,19 @@ static void cpcap_adc_setup_calibrate(struct cpcap_adc *ddata,
 	if (error)
 		return;
 
-	error = regmap_update_bits(ddata->reg, CPCAP_REG_ADCC2,
-				   CPCAP_BIT_ATOX_PS_FACTOR |
-				   CPCAP_BIT_ADC_PS_FACTOR1 |
-				   CPCAP_BIT_ADC_PS_FACTOR0,
-				   0);
+	error = regmap_clear_bits(ddata->reg, CPCAP_REG_ADCC2,
+				  CPCAP_BIT_ATOX_PS_FACTOR |
+				  CPCAP_BIT_ADC_PS_FACTOR1 |
+				  CPCAP_BIT_ADC_PS_FACTOR0);
 	if (error)
 		return;
 
-	error = regmap_update_bits(ddata->reg, CPCAP_REG_ADCC2,
-				   CPCAP_BIT_ADTRIG_DIS,
-				   CPCAP_BIT_ADTRIG_DIS);
+	error = regmap_set_bits(ddata->reg, CPCAP_REG_ADCC2,
+				CPCAP_BIT_ADTRIG_DIS);
 	if (error)
 		return;
 
-	error = regmap_update_bits(ddata->reg, CPCAP_REG_ADCC2,
-				   CPCAP_BIT_ASC,
-				   CPCAP_BIT_ASC);
+	error = regmap_set_bits(ddata->reg, CPCAP_REG_ADCC2, CPCAP_BIT_ASC);
 	if (error)
 		return;
 
@@ -455,8 +450,8 @@ static void cpcap_adc_setup_calibrate(struct cpcap_adc *ddata,
 		dev_err(ddata->dev,
 			"Timeout waiting for calibration to complete\n");
 
-	error = regmap_update_bits(ddata->reg, CPCAP_REG_ADCC1,
-				   CPCAP_BIT_CAL_MODE, 0);
+	error = regmap_clear_bits(ddata->reg, CPCAP_REG_ADCC1,
+				  CPCAP_BIT_CAL_MODE);
 	if (error)
 		return;
 }
@@ -602,26 +597,23 @@ static void cpcap_adc_setup_bank(struct cpcap_adc *ddata,
 		return;
 
 	if (req->timing == CPCAP_ADC_TIMING_IMM) {
-		error = regmap_update_bits(ddata->reg, CPCAP_REG_ADCC2,
-					   CPCAP_BIT_ADTRIG_DIS,
-					   CPCAP_BIT_ADTRIG_DIS);
+		error = regmap_set_bits(ddata->reg, CPCAP_REG_ADCC2,
+					CPCAP_BIT_ADTRIG_DIS);
 		if (error)
 			return;
 
-		error = regmap_update_bits(ddata->reg, CPCAP_REG_ADCC2,
-					   CPCAP_BIT_ASC,
-					   CPCAP_BIT_ASC);
+		error = regmap_set_bits(ddata->reg, CPCAP_REG_ADCC2,
+					CPCAP_BIT_ASC);
 		if (error)
 			return;
 	} else {
-		error = regmap_update_bits(ddata->reg, CPCAP_REG_ADCC2,
-					   CPCAP_BIT_ADTRIG_ONESHOT,
-					   CPCAP_BIT_ADTRIG_ONESHOT);
+		error = regmap_set_bits(ddata->reg, CPCAP_REG_ADCC2,
+					CPCAP_BIT_ADTRIG_ONESHOT);
 		if (error)
 			return;
 
-		error = regmap_update_bits(ddata->reg, CPCAP_REG_ADCC2,
-					   CPCAP_BIT_ADTRIG_DIS, 0);
+		error = regmap_clear_bits(ddata->reg, CPCAP_REG_ADCC2,
+					  CPCAP_BIT_ADTRIG_DIS);
 		if (error)
 			return;
 	}

-- 
2.45.2


