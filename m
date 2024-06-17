Return-Path: <linux-arm-msm+bounces-22889-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9929990B27D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 16:40:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 847801C23BF9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 14:40:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E8181CD5AB;
	Mon, 17 Jun 2024 13:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="pSs4ODFK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02E41D362F
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2024 13:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718632245; cv=none; b=LP3YVVcdAe6To9faoFy/D6auN/zGmmdHoAYSPlc82bIOooBZ6u7ocg+1r8c7yWsx3xnIYk51pUoak/rMkgGqf1zHt9pw/yHxmm4ezNG0pSd3jo/cWxn4gaDr1oJYP0KJRzK5TYhx0s+aKMBYweeFKdIAGL8q1KhysRkEHJD+cOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718632245; c=relaxed/simple;
	bh=+4mUxpFBa9t5WO+gS7VMEdFKNqvRfouDWQBE4gXDtPo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FZYZuHqPAfX+jYZrtjAzj0h9FyvQ+uQRFHBKBVGGiroeegO0cSNghkBnNQHO0ewCuA3YyZvAIYhCVE87Y+71m+P7yACHnXoQXwLD9lrku0hIZyNlIgUezPWjwGR+/vWrSgZV6DHLajZICwSmqLF0ITYGwcXifZVusnrrx0uzBjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=pSs4ODFK; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7965d034cedso284215985a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2024 06:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632243; x=1719237043; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S/wwf4Pyf9v8s/HS7lCuvhL4I665hNiJrFxeq5WtNz8=;
        b=pSs4ODFK2N2NS4iUPkEJOLncIhtYeL8uUtYrEbSBM2R6ae9v1i5eObmeabzwFrHtDp
         LhC3a1FcN6SXVuykNtZPcDV2qKxCN/Q19bvXn9YKANunfQK3Iu9Q+Yrr6UBof1e6faAl
         xupS6STsVDknkHNvNZIQprAWm2frscKHqnQGHSoI6RZD/c+9B6d/A/q62NWb0gePJGSF
         2rt3uvV++ZXz8ZQM7Zf5QayPcSDimELtIcR0pqPv8VyygE2gKzyuwXhyUW3qXdsIankn
         GCW8QiTZFEcq6GAxGPZQ7aKBbhz5EnQj1PMMkV7slyFD+csRCyDpSEN4RsjfyBj6EheY
         +0Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718632243; x=1719237043;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S/wwf4Pyf9v8s/HS7lCuvhL4I665hNiJrFxeq5WtNz8=;
        b=HfHkVqsDDTRT9/bchef3EW/32ffg2aE0WfsN35heGx5iuxL+aZZoyZdqgl/5kSX2h3
         dmCLAf6xdnQZUWKrKEB8s3SeSRPs9yFWp9zdQCKaSXS6S/vy4x1/MeEEyBsiopeMw9gn
         Xw9P6vY7it9GdTJL5vVkLKkm8/PvTcu2PWs64pAHKzX6y0+bpseLCV0tpHSZfcw+3SHB
         0p2zXblC7eSfT/6ES12mE3rKIhYLjqt7CaM0LJTBiYCKj1uoHF424iNH+b8SxTS/XCiZ
         uojTO9CCGx4JMpjILoL4NMbAiHskMxfXvjxcd4CrePyMXalgsZDjVXCzmI1eaAWMHtqu
         jwfA==
X-Forwarded-Encrypted: i=1; AJvYcCVFqsxU5zDnfThzrWMtip/woPos42LAkMdsRelnWbspbHTynkqrVAgq+OpPCfc1XVBfbklYqccbXZV/BIuqbRQ1OdZnGtylzk6UIYJjTw==
X-Gm-Message-State: AOJu0Yxr2uGwRHjhqFxu8ATr9dubNEgP0s9ZXiUnoULbgCaftlSWihQE
	pX4yagKd5b8uJ2qdxHIUDpV9jdGU0BiMLxNQBFtosib9RSS05tlqsUYHaNd1oFI=
X-Google-Smtp-Source: AGHT+IFGOx2s8Nnos2uW+1yz9gXjI96q1FUrsSHsvdHqjpAdDpOLj6w2PTD0THhqXhocLH6W1aVi0w==
X-Received: by 2002:a05:620a:46a1:b0:79a:2613:9b40 with SMTP id af79cd13be357-79a26139e04mr977624785a.50.1718632242836;
        Mon, 17 Jun 2024 06:50:42 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:50:42 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:50:07 -0400
Subject: [PATCH v3 27/41] iio: imu: inv_icm42600: make use of
 regmap_clear_bits(), regmap_set_bits()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240617-review-v3-27-88d1338c4cca@baylibre.com>
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
 drivers/iio/imu/inv_icm42600/inv_icm42600_buffer.c | 14 ++++++--------
 drivers/iio/imu/inv_icm42600/inv_icm42600_core.c   |  9 ++++-----
 drivers/iio/imu/inv_icm42600/inv_icm42600_i2c.c    |  4 ++--
 drivers/iio/imu/inv_icm42600/inv_icm42600_spi.c    |  4 ++--
 4 files changed, 14 insertions(+), 17 deletions(-)

diff --git a/drivers/iio/imu/inv_icm42600/inv_icm42600_buffer.c b/drivers/iio/imu/inv_icm42600/inv_icm42600_buffer.c
index 63b85ec88c13..509fe6a3ae97 100644
--- a/drivers/iio/imu/inv_icm42600/inv_icm42600_buffer.c
+++ b/drivers/iio/imu/inv_icm42600/inv_icm42600_buffer.c
@@ -262,9 +262,8 @@ int inv_icm42600_buffer_update_watermark(struct inv_icm42600_state *st)
 
 	/* restore watermark interrupt */
 	if (restore) {
-		ret = regmap_update_bits(st->map, INV_ICM42600_REG_INT_SOURCE0,
-					 INV_ICM42600_INT_SOURCE0_FIFO_THS_INT1_EN,
-					 INV_ICM42600_INT_SOURCE0_FIFO_THS_INT1_EN);
+		ret = regmap_set_bits(st->map, INV_ICM42600_REG_INT_SOURCE0,
+				      INV_ICM42600_INT_SOURCE0_FIFO_THS_INT1_EN);
 		if (ret)
 			return ret;
 	}
@@ -306,9 +305,8 @@ static int inv_icm42600_buffer_postenable(struct iio_dev *indio_dev)
 	}
 
 	/* set FIFO threshold interrupt */
-	ret = regmap_update_bits(st->map, INV_ICM42600_REG_INT_SOURCE0,
-				 INV_ICM42600_INT_SOURCE0_FIFO_THS_INT1_EN,
-				 INV_ICM42600_INT_SOURCE0_FIFO_THS_INT1_EN);
+	ret = regmap_set_bits(st->map, INV_ICM42600_REG_INT_SOURCE0,
+			      INV_ICM42600_INT_SOURCE0_FIFO_THS_INT1_EN);
 	if (ret)
 		goto out_unlock;
 
@@ -363,8 +361,8 @@ static int inv_icm42600_buffer_predisable(struct iio_dev *indio_dev)
 		goto out_unlock;
 
 	/* disable FIFO threshold interrupt */
-	ret = regmap_update_bits(st->map, INV_ICM42600_REG_INT_SOURCE0,
-				 INV_ICM42600_INT_SOURCE0_FIFO_THS_INT1_EN, 0);
+	ret = regmap_clear_bits(st->map, INV_ICM42600_REG_INT_SOURCE0,
+				INV_ICM42600_INT_SOURCE0_FIFO_THS_INT1_EN);
 	if (ret)
 		goto out_unlock;
 
diff --git a/drivers/iio/imu/inv_icm42600/inv_icm42600_core.c b/drivers/iio/imu/inv_icm42600/inv_icm42600_core.c
index 96116a68ab29..bb302f5540cf 100644
--- a/drivers/iio/imu/inv_icm42600/inv_icm42600_core.c
+++ b/drivers/iio/imu/inv_icm42600/inv_icm42600_core.c
@@ -435,9 +435,8 @@ static int inv_icm42600_setup(struct inv_icm42600_state *st,
 		return ret;
 
 	/* sensor data in big-endian (default) */
-	ret = regmap_update_bits(st->map, INV_ICM42600_REG_INTF_CONFIG0,
-				 INV_ICM42600_INTF_CONFIG0_SENSOR_DATA_ENDIAN,
-				 INV_ICM42600_INTF_CONFIG0_SENSOR_DATA_ENDIAN);
+	ret = regmap_set_bits(st->map, INV_ICM42600_REG_INTF_CONFIG0,
+			      INV_ICM42600_INTF_CONFIG0_SENSOR_DATA_ENDIAN);
 	if (ret)
 		return ret;
 
@@ -532,8 +531,8 @@ static int inv_icm42600_irq_init(struct inv_icm42600_state *st, int irq,
 		return ret;
 
 	/* Deassert async reset for proper INT pin operation (cf datasheet) */
-	ret = regmap_update_bits(st->map, INV_ICM42600_REG_INT_CONFIG1,
-				 INV_ICM42600_INT_CONFIG1_ASYNC_RESET, 0);
+	ret = regmap_clear_bits(st->map, INV_ICM42600_REG_INT_CONFIG1,
+				INV_ICM42600_INT_CONFIG1_ASYNC_RESET);
 	if (ret)
 		return ret;
 
diff --git a/drivers/iio/imu/inv_icm42600/inv_icm42600_i2c.c b/drivers/iio/imu/inv_icm42600/inv_icm42600_i2c.c
index 8d33504d770f..ebb31b385881 100644
--- a/drivers/iio/imu/inv_icm42600/inv_icm42600_i2c.c
+++ b/drivers/iio/imu/inv_icm42600/inv_icm42600_i2c.c
@@ -28,8 +28,8 @@ static int inv_icm42600_i2c_bus_setup(struct inv_icm42600_state *st)
 			   INV_ICM42600_INTF_CONFIG6_MASK,
 			   INV_ICM42600_INTF_CONFIG6_I3C_EN);
 
-	ret = regmap_update_bits(st->map, INV_ICM42600_REG_INTF_CONFIG4,
-				 INV_ICM42600_INTF_CONFIG4_I3C_BUS_ONLY, 0);
+	ret = regmap_clear_bits(st->map, INV_ICM42600_REG_INTF_CONFIG4,
+				INV_ICM42600_INTF_CONFIG4_I3C_BUS_ONLY);
 	if (ret)
 		return ret;
 
diff --git a/drivers/iio/imu/inv_icm42600/inv_icm42600_spi.c b/drivers/iio/imu/inv_icm42600/inv_icm42600_spi.c
index cc2bf1799a46..eae5ff7a3cc1 100644
--- a/drivers/iio/imu/inv_icm42600/inv_icm42600_spi.c
+++ b/drivers/iio/imu/inv_icm42600/inv_icm42600_spi.c
@@ -27,8 +27,8 @@ static int inv_icm42600_spi_bus_setup(struct inv_icm42600_state *st)
 	if (ret)
 		return ret;
 
-	ret = regmap_update_bits(st->map, INV_ICM42600_REG_INTF_CONFIG4,
-				 INV_ICM42600_INTF_CONFIG4_I3C_BUS_ONLY, 0);
+	ret = regmap_clear_bits(st->map, INV_ICM42600_REG_INTF_CONFIG4,
+				INV_ICM42600_INTF_CONFIG4_I3C_BUS_ONLY);
 	if (ret)
 		return ret;
 

-- 
2.45.2


