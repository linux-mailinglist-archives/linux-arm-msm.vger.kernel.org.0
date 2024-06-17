Return-Path: <linux-arm-msm+bounces-22896-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A401C90B293
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 16:43:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2F1641F25BCE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 14:43:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FF5C1CF3E1;
	Mon, 17 Jun 2024 13:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="t50Pv9IM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C4B1CF3C1
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2024 13:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718632260; cv=none; b=DEEZ4iUBsKNV/DRbc9QbElgVrhWAP/VmeoA2OPbQuWv1XEHxoFXEUpI2/iYbpqVae7pfxxLsPpN/xiAfcd6WTe0go+vBKZhch6g0vZC+jJ0o/APdbgdPkmkVR3k53zgMWtJacACKTaWLu62GzHK/DtW6mJxD7nOSH6Hz19fTY7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718632260; c=relaxed/simple;
	bh=iu06Agy4gwP3mD/XsHj6uJ5NOzKIr+fvZxk9qZQspyI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b9NHLDBwy3yLbC343Nu1hYSEpOWw81eWcMgtLSCMVAh6yFzFkV7pQFhYXI32MFOW41b392BLSRp1DKJFt3ChZz9PBsNgqSdfrVfIbRrgU/pC5BukOQHCpLvcKUMubakkgyIUlzPbs0J7DkdquPPfryTDqJS99jZA0mHmnfrViNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=t50Pv9IM; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-797a7f9b52eso343352685a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2024 06:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632258; x=1719237058; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bd9TIH+WbKUd6xwGH770DEQhZI10Wa7zRAAyumCALaY=;
        b=t50Pv9IMa/aFlQrmOq7eBIfG0FMGJenpAycrBTNFT5mEH+XnA0k/tEo0pmmvt5OcPP
         7I5h/1IlUFEVU7hUWIZQRVqftajSDMgBrDoA8ZnhbkaaNPvyXw6Q2Ne3uOt/g4+VKSxU
         ACnLPu7RESrVGIC1wDchabs8AOr6QFmavHEgP8yw1830jwZ94yAGIi5LgB1zsEJo9Hnh
         k6Bd4PaaKxVvF5HDiD3XAZ3x661wzMSV0gpSTV7QjCSDtwCepJCPmK+eEM5xis8+WZO/
         cYx1c8ZmBNaiaGyN83y+LtKrfoNVLJdl2yTjJ6AZuEUnm+GW60AN9/R0PUS2di8qhxPl
         n2rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718632258; x=1719237058;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bd9TIH+WbKUd6xwGH770DEQhZI10Wa7zRAAyumCALaY=;
        b=uXngQnWsSP7B1/pXY8ce5X9/5nKvCMN7yjCUzA3BKEroFFHM44TqbqJaEpqRR9/sJj
         JmU9URy/KBlMduMXvzwVRgXPqM9xikoZng1JilHKABKSeULfHAWQQMgl6RkMex+AXtxa
         2VOe8kx1BmqW7aILH4mbcbMJBoNi5q0bpFNEt9Kq0lCh2RQ0dTCVDcxEkEcYeSB7bHns
         aBubvBCkvZSF8GyZ/arzJxkF+0TsRae1GeW+cAdkh2O98vYWuAXzsRg3g0hH24uB/04X
         FaZOSvITkDpmifo0noLIPDKSrsgYF1WuqUBme2P92nYGflESJQwOrYu53YaySgNQsimU
         YinA==
X-Forwarded-Encrypted: i=1; AJvYcCUZtiSsKxWwr2pcZ9/BIcsO3xKiZ7wi3jzXi7OWDGmZl660V0cS7Q/oLfqrkQUFT6bWNG+w/5tLKmK1DjsWmh1vHfDjJ0qscJKfjOq0Ig==
X-Gm-Message-State: AOJu0YwTME9qegt6f/aRTujH50kRatRyjqK1XbtC1d2s+8qbB5Mnwknv
	cJvryzHVumwV3XNUxBP4bvYWo5p+OIPg/kV7AyZ6+yOrs9ezuIRouKxODhYguzk=
X-Google-Smtp-Source: AGHT+IHIgplKyy0pftg/5a2SG9pITo7fxr5SdNNjpCXiI/wTi4jbCSV+DPabl4pWpKgzNJgkUownfQ==
X-Received: by 2002:a05:620a:2684:b0:797:8ee3:9f01 with SMTP id af79cd13be357-798d2437ce1mr1017310785a.34.1718632257705;
        Mon, 17 Jun 2024 06:50:57 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.50.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:50:57 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:50:14 -0400
Subject: [PATCH v3 34/41] iio: magnetometer: mmc35240: make use of
 regmap_set_bits()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240617-review-v3-34-88d1338c4cca@baylibre.com>
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

Suggested-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 drivers/iio/magnetometer/mmc35240.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/magnetometer/mmc35240.c b/drivers/iio/magnetometer/mmc35240.c
index 6b9f4b056191..ec35e9543a96 100644
--- a/drivers/iio/magnetometer/mmc35240.c
+++ b/drivers/iio/magnetometer/mmc35240.c
@@ -186,9 +186,8 @@ static int mmc35240_hw_set(struct mmc35240_data *data, bool set)
 	 * Recharge the capacitor at VCAP pin, requested to be issued
 	 * before a SET/RESET command.
 	 */
-	ret = regmap_update_bits(data->regmap, MMC35240_REG_CTRL0,
-				 MMC35240_CTRL0_REFILL_BIT,
-				 MMC35240_CTRL0_REFILL_BIT);
+	ret = regmap_set_bits(data->regmap, MMC35240_REG_CTRL0,
+			      MMC35240_CTRL0_REFILL_BIT);
 	if (ret < 0)
 		return ret;
 	usleep_range(MMC35240_WAIT_CHARGE_PUMP, MMC35240_WAIT_CHARGE_PUMP + 1);
@@ -198,8 +197,7 @@ static int mmc35240_hw_set(struct mmc35240_data *data, bool set)
 	else
 		coil_bit = MMC35240_CTRL0_RESET_BIT;
 
-	return regmap_update_bits(data->regmap, MMC35240_REG_CTRL0,
-				  coil_bit, coil_bit);
+	return regmap_set_bits(data->regmap, MMC35240_REG_CTRL0, coil_bit);
 
 }
 

-- 
2.45.2


