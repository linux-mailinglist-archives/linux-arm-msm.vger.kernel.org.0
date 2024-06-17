Return-Path: <linux-arm-msm+bounces-22873-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC8290B240
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 16:36:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B10A51C22EE6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 14:35:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F66B1BE243;
	Mon, 17 Jun 2024 13:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="rPkG0Cl2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 946051BD519
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2024 13:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718632211; cv=none; b=n9Aq0DABOT0V7V7/SBwTYHwWYDqsOvYI9UdP/pG3w0RK5EwZqlQXWi26rZvY14x/QWuLXb9h5vfV4Cto/PI9bZ+wVBLWFD94454FSYfg2q4BNM9YVR1SqzS+GNCzAxsX6Ep32v3XhlDyXOXZkgiyevGIUawgndtYTYqy7T8s/LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718632211; c=relaxed/simple;
	bh=5OuEWFVCpArtZhx4z8JpNnfTVTHf4ULROK8X14+lutQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eo06vRFVyY/Wv5wpfsF/6vsoWX1rbWRisEe13MjFbUBx/SKEQMzmUf/HO3rwBeFcqTQHlmcpdR0tm3PQ5kFHpd5XQIJdfqibpN7ZD/f2vDF3xo5w8iszzefpMLWNxp5tdrws7ZvIxjRmC/Bzi6S05Pkv342DW0Ch3Kt64dTtuUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=rPkG0Cl2; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-80d6c63af28so1721668241.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2024 06:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632208; x=1719237008; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SS/VahdjQ8SKQC25MQPNc7rg+KDijJeHwUtRITveNmM=;
        b=rPkG0Cl2shSQIneiZQflpmkJKpg5MsRHetJAThXbIHyRMYD18s8Ofq1q/L0kpPKbP0
         Cl/uh7rfN8yyJM/Xg+gS0o4ANk1MzcRMDjHa4v7JohwIoknwkhzK5g39qGHFO07qhVp0
         tfHE8SJN0nAJ/C9wuFCm4ZiWVsT86trJ6R2VykqeFprDI8JB5XZb10L3a2RXN4gmfNLf
         471o4y+mjtlMipgHevnkDkqMSJ0zS1P2iZm/fo6Y6vfIgXprIjr6XekZgo3qc/HcIuYp
         67NceCH3DK3JSZ2xnMJep6bNED/K4uyQcvPL54j9GDFSv/LdYaw914xlofCYEqp10XD6
         id4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718632208; x=1719237008;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SS/VahdjQ8SKQC25MQPNc7rg+KDijJeHwUtRITveNmM=;
        b=qxyt2YmM82hOFEGi3i+A0JdaQDpN1viKA7IWjvBDlAM6DyLU8bRxDwmQcNX7aDnAcN
         MR3Yp0sl5ucEUSBGjjDrKakTamdascOgRd0P2lPlqAcO/oR1hyg2KVGcqVSUU7liBF8w
         TYWuIQrG5F7GcxuLpQwPYmfFVIP/LWKi/BcQptzd3i58hmYsGBo9jKr9EcQFllSoxb1E
         gLg1TqgS1XmjsdE1V+byrQRBDtUyH+uLPG8ALhlG/wxLrGmyb1ZkdBg3HqpMr5N6WvzK
         /aPrjVHiKVEaDQZnWZ+r2d6Rr/i6mWQrhgw7AyWPp0oBOr2RD0srz8rTPitlLfcRUsUM
         BinQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYY9/hLOd82A5TLFKrIa2sTJCe2zqdVXuF9ccR6gpFW/Uqtokrd5StXGemNe8mB+pa4M4W8y2cMDBo8k+Erlw3ccSEA9guH1wLloSu8w==
X-Gm-Message-State: AOJu0YzykHBIWUR3uSHjA8x33Ja7hXaP++HaWYKt/jVfjiBeodlrSEV+
	zRBq4gC0YRpHHejMPQoMQuybDZ8/mLR2WgkLlJc6DvVfsGSphrkjU07DpaOX0wE=
X-Google-Smtp-Source: AGHT+IExs5o6BBy2GiVBbRbl5RTcmAHYS/6pj70WZUFQ8c7/pJkIjoippgtnc/biSc9YFfMmt2B/ig==
X-Received: by 2002:a67:f783:0:b0:48d:9b03:3ff4 with SMTP id ada2fe7eead31-48dae3e1559mr9042383137.28.1718632208483;
        Mon, 17 Jun 2024 06:50:08 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:50:08 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:49:51 -0400
Subject: [PATCH v3 11/41] iio: adc: ina2xx-adc: make use of
 regmap_clear_bits()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240617-review-v3-11-88d1338c4cca@baylibre.com>
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

Instead of using regmap_update_bits() and passing val = 0, use
regmap_clear_bits().

Suggested-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 drivers/iio/adc/ina2xx-adc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/iio/adc/ina2xx-adc.c b/drivers/iio/adc/ina2xx-adc.c
index 9e52207352fb..727e390bd979 100644
--- a/drivers/iio/adc/ina2xx-adc.c
+++ b/drivers/iio/adc/ina2xx-adc.c
@@ -1046,8 +1046,7 @@ static void ina2xx_remove(struct i2c_client *client)
 	iio_device_unregister(indio_dev);
 
 	/* Powerdown */
-	ret = regmap_update_bits(chip->regmap, INA2XX_CONFIG,
-				 INA2XX_MODE_MASK, 0);
+	ret = regmap_clear_bits(chip->regmap, INA2XX_CONFIG, INA2XX_MODE_MASK);
 	if (ret)
 		dev_warn(&client->dev, "Failed to power down device (%pe)\n",
 			 ERR_PTR(ret));

-- 
2.45.2


