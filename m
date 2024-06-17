Return-Path: <linux-arm-msm+bounces-22881-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B08CC90B266
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 16:38:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C43CA1C23409
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 14:38:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D30219B5BB;
	Mon, 17 Jun 2024 13:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="WsddIHuG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 821AC1C8FB7
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2024 13:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718632229; cv=none; b=Nsytp+1MwzCcznPvMihoCH16N2epXmRe+8b+7mGROVytyJK/qD0cbbxDhSz5qQuRW1ua9N/X5im/d4KWc5uF2HtUatXZ+Av8aXT89Qy0CmfAg5dqBNK+NkfnoWYuCkR4moikF9VJV8K6XJy/k0gko9sxo6C07GQWu4LZfHW9tKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718632229; c=relaxed/simple;
	bh=vF9eCSFK9zsl5BTxl6iZi/Jw5sWK8MiJQHD/bb1xgts=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FCDZ6Ft71g2pL1ZQPdwb25wJMt8QlztT1bKlMGzaHYTGayqE76MBvSEgizwJY2QakoTraDgRdrGTEPi6uSlrYeIrgrGcDFa8Lx6a4Pg2dPwefgOHQBikiKTQPtDcI9qAvYVt38gv92SRpTMffPIC8vHiEHlJTc8Tz0smxkCfZBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=WsddIHuG; arc=none smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-5b9f9e7176eso2148863eaf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2024 06:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632225; x=1719237025; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TsjL1PDi95mMX5sXzypBRu5MAqP+mGu/27hW1rxKMDQ=;
        b=WsddIHuGoPLbiwQ9fZO9e6Q01j04Kr1Eyajx/IEPmW6HybYvwYjvstz051uiqnG202
         by1Up2/AD2yYRghZ7vH4BdjHZ4KkesLB2rpTb/SZHefdT3RaSG5QqnF9PQK9k64Yk+Bs
         rRaPPGZdS+LAPqq69VHBba5FJ5VOtsBOc1JFNpVX+zRrJ95xIbHnZoAGUJwnb1PBzdny
         W15ASpND+A79ir44wIfJGiZIKwMF9TaNCB1DlJONWu364IC6i7bccOxaAxFRaA0iM2uW
         RMHVWqyxB/nFSZrtbEUfdDek0a+RaoK2mC5tWJ1PXf5yA0QUGT7OeH6MktirMsBhVhOk
         75TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718632225; x=1719237025;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TsjL1PDi95mMX5sXzypBRu5MAqP+mGu/27hW1rxKMDQ=;
        b=oa0KotOyTSSB9K10IbdnATomIYX4LmMnpoZGfKvxh8UwnGbVlSaDrun5XPX4f8H87i
         RwpZDrtaLtv7EoLMGaoCnkoHjkVNxIZBjuqQRoysk9AriGuPsrlmoANqnycwBVYNPd25
         Ue2WsQA5msjKdmTEFxSSriLtSF3bqkta2CvInEuigQSLVNooF0riezTz+rBvpoQtojIq
         8iifYqlxW5cyeRhWSC0jcewnBH5bJwjetABPi6hwCO13pZ9LH+0DCdp2Qj4HgAtdVuOs
         mAE9uSaW56KUI28ycBeB0SuhMSrI3x+8xnPxjeNZpE/ReqaC2pN0u8uy+Pc/U1hETC1h
         8DVw==
X-Forwarded-Encrypted: i=1; AJvYcCWmcI+Fx78Dh17GqRGSh9ltfwieR+E7qoK86fE/jbY5PD01Ao1UWEZGXDKxcAsjcrpFELG8zsf38f5FS01E5NCvBIMiYKUC4DxxGkPu3Q==
X-Gm-Message-State: AOJu0Yzj0gCzf0ZGuUpkOdN9nY2XRfcK9hU+kYab1hoNauPylOE63jfF
	qPfvNRnIn17+eiSOWS23lETurauWd8xjQnJDQcQEYcZuEFKSiu8nGqFvpW2IrQI=
X-Google-Smtp-Source: AGHT+IFvblxIubOLu7csKqd2DaYsYhFE9mHOS6tHSYRNjsfIzum/J8kKl7oiGVOQ0fHTuqtXTzPk8w==
X-Received: by 2002:a05:6870:d383:b0:254:ac99:1152 with SMTP id 586e51a60fabf-25842baade0mr8855321fac.58.1718632225631;
        Mon, 17 Jun 2024 06:50:25 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:50:25 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:49:59 -0400
Subject: [PATCH v3 19/41] iio: dac: ltc2688: make use of regmap_set_bits()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240617-review-v3-19-88d1338c4cca@baylibre.com>
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
 drivers/iio/dac/ltc2688.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/dac/ltc2688.c b/drivers/iio/dac/ltc2688.c
index c4b1ba30f935..af50d2a95898 100644
--- a/drivers/iio/dac/ltc2688.c
+++ b/drivers/iio/dac/ltc2688.c
@@ -860,9 +860,8 @@ static int ltc2688_setup(struct ltc2688_state *st, struct regulator *vref)
 		/* bring device out of reset */
 		gpiod_set_value_cansleep(gpio, 0);
 	} else {
-		ret = regmap_update_bits(st->regmap, LTC2688_CMD_CONFIG,
-					 LTC2688_CONFIG_RST,
-					 LTC2688_CONFIG_RST);
+		ret = regmap_set_bits(st->regmap, LTC2688_CMD_CONFIG,
+				      LTC2688_CONFIG_RST);
 		if (ret)
 			return ret;
 	}

-- 
2.45.2


