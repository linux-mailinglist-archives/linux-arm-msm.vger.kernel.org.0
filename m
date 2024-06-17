Return-Path: <linux-arm-msm+bounces-22863-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C3E90B21C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 16:33:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6E8CF1C22C2B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 14:33:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FE191BA867;
	Mon, 17 Jun 2024 13:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="PMg8avdZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C181B5836
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2024 13:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718632189; cv=none; b=uKNeQTwwHG9fhVXMjHNu1G+BXKS/mg4v6b/6qVE5PtpVu0tYjTO8rfFt2kmTK16Wif9Pyl2eTL/R+BnR9NG9rUVV5xA7cHg35gj/eZ2/F/36DOmGqlkG7XCB2jZ0k9Hs1aniMPpTATO7oGwcbkDBgo0KPALgv/VdLtBHcS8GOtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718632189; c=relaxed/simple;
	bh=V5OVdhy+qCvjDRbv3yGURnLSWDE3JAmTDMZiE2ZFhuA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Merol63TFcSRYb4zbcjBE+cveN9t1Tccitie0JronuEOzWkB25MOoqZCL71a168jun1wh1u1ZbhUblzsEdSU5SNPFbEs+vY6tOHoZ/YT9UCAS6dQBl9y8HKk8zXa3f4O5Yo+vi+YXPBPxO3hf4JmSfuU/iyv+xygEDiP6w9fsxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=PMg8avdZ; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-6f98178ceb3so2379837a34.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2024 06:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632187; x=1719236987; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uOw9ZuYF7yVVJfGh3LeTM6VDPH42QqBSzznALZp99zM=;
        b=PMg8avdZSFF3ZwMcIHKvjVEI2tXg58BzFK48JfZedLfIYTrVw7aT1nmmaHBb7okwOA
         JznbVIL8xsXdzu8GJY9R5or5b91ZVqlNpjPf2fLbHXtPjCKSCAokpk9Ol4EN0lxBczob
         xZDrrr1ehbMLTtyDpUcMpXJMxBJWwMirVZYE7FSTzn1SAA9JgJq2qS960bdpRg57NoC5
         6jS4+F9rRpyxJ7EHVqrpv8wi7iCXFy6seDDA8z4QV/eYixU7OptDa6jpTPB/WXBqkoNR
         r73MRSIh2/yEkbJ3UzD4Jb55SgWH5XgHkUczllz5RuAsJBIhVU9tP2Tb4s8XLrpJ16WP
         UJNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718632187; x=1719236987;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uOw9ZuYF7yVVJfGh3LeTM6VDPH42QqBSzznALZp99zM=;
        b=N7mJFpYLSVJQGkgmuzgqEkIrdmPzr2Hmmos/U2jmNeY7liQjzsnUz+AKepoCwcoW72
         KX3m3pZeSjJ/NdbUa9cJx1dekKOISpbJPYsb0MkcEzPIlrjrAX9EW7J0jjPCF0ukfvAC
         Qz6gkzfarcMiLF46Q8avqiAwshyVRGjeVeJVj6TP1eb287LQ5KsdaHl5O9ICla437FBR
         8myMWQxW6rCfX5vkgtJRK85rIDafYCAhHNHBsuFxH/4qFtMosXYnK+2oYElc2/g0LcGL
         gnLwUwpUT+3MpmgS2mffhDKKxb5nx8yYYCwV5lEfWqiQ5NKaQ5LOQj9BfMBlf98n5rv5
         v7bg==
X-Forwarded-Encrypted: i=1; AJvYcCVrx3oxYvL7o0LzsVDoHIWxgbQgEF1+p5WhnhISO/DdCuJ+Us7k8H26Lqi0n8qGdSfTB2+RQ9axJhio73KVIoEVWz8UeJPOCXp34eWADw==
X-Gm-Message-State: AOJu0Yz4qsNEkFnqXrkxUDFbeIofQ4mJ3ZsGKRkPgCzT30q899rHGqfZ
	eesFlayAHB7Tc9SkLWHWrmiUpoG9FDhvMWO0yh2CaM5axCDMae2Gjf7qLfi2APU=
X-Google-Smtp-Source: AGHT+IFJGSJ8d0p4WXCzz2NyljOfF1k3KjSXOWFFs3OCSrxLmfdmtEDsU18y1hD0hfEhjyu+NXEwMw==
X-Received: by 2002:a05:6870:8188:b0:255:1bb8:85ec with SMTP id 586e51a60fabf-2584288e46bmr10661973fac.12.1718632186790;
        Mon, 17 Jun 2024 06:49:46 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:49:46 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:49:41 -0400
Subject: [PATCH v3 01/41] iio: accel: fxls8962af-core: Make use of
 regmap_set_bits(), regmap_clear_bits()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240617-review-v3-1-88d1338c4cca@baylibre.com>
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
 drivers/iio/accel/fxls8962af-core.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/iio/accel/fxls8962af-core.c b/drivers/iio/accel/fxls8962af-core.c
index 4fbc01bda62e..d25e31613413 100644
--- a/drivers/iio/accel/fxls8962af-core.c
+++ b/drivers/iio/accel/fxls8962af-core.c
@@ -228,8 +228,8 @@ static int fxls8962af_power_off(struct fxls8962af_data *data)
 
 static int fxls8962af_standby(struct fxls8962af_data *data)
 {
-	return regmap_update_bits(data->regmap, FXLS8962AF_SENS_CONFIG1,
-				  FXLS8962AF_SENS_CONFIG1_ACTIVE, 0);
+	return regmap_clear_bits(data->regmap, FXLS8962AF_SENS_CONFIG1,
+				 FXLS8962AF_SENS_CONFIG1_ACTIVE);
 }
 
 static int fxls8962af_active(struct fxls8962af_data *data)
@@ -785,9 +785,8 @@ static int fxls8962af_reset(struct fxls8962af_data *data)
 	unsigned int reg;
 	int ret;
 
-	ret = regmap_update_bits(data->regmap, FXLS8962AF_SENS_CONFIG1,
-				 FXLS8962AF_SENS_CONFIG1_RST,
-				 FXLS8962AF_SENS_CONFIG1_RST);
+	ret = regmap_set_bits(data->regmap, FXLS8962AF_SENS_CONFIG1,
+			      FXLS8962AF_SENS_CONFIG1_RST);
 	if (ret)
 		return ret;
 
@@ -830,9 +829,8 @@ static int fxls8962af_buffer_postenable(struct iio_dev *indio_dev)
 	fxls8962af_standby(data);
 
 	/* Enable buffer interrupt */
-	ret = regmap_update_bits(data->regmap, FXLS8962AF_INT_EN,
-				 FXLS8962AF_INT_EN_BUF_EN,
-				 FXLS8962AF_INT_EN_BUF_EN);
+	ret = regmap_set_bits(data->regmap, FXLS8962AF_INT_EN,
+			      FXLS8962AF_INT_EN_BUF_EN);
 	if (ret)
 		return ret;
 
@@ -851,8 +849,8 @@ static int fxls8962af_buffer_predisable(struct iio_dev *indio_dev)
 	fxls8962af_standby(data);
 
 	/* Disable buffer interrupt */
-	ret = regmap_update_bits(data->regmap, FXLS8962AF_INT_EN,
-				 FXLS8962AF_INT_EN_BUF_EN, 0);
+	ret = regmap_clear_bits(data->regmap, FXLS8962AF_INT_EN,
+				FXLS8962AF_INT_EN_BUF_EN);
 	if (ret)
 		return ret;
 

-- 
2.45.2


