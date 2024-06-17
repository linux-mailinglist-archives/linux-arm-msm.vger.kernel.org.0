Return-Path: <linux-arm-msm+bounces-22866-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5066990B227
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 16:34:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 600711C237F2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 14:34:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCF811BBBC9;
	Mon, 17 Jun 2024 13:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="lbi+Psxt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C84F1BB696
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2024 13:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718632196; cv=none; b=G+MEQApjIHaC42a0YOPXjNzA7cKlbFmUkjK6oVqpbA9CmZP9YFULRCwNNeHrqUw4bxZyuPNU9Y4oxXvt8oHE4mpW44SSioudVdx762sQYw1ZkCo931lhNPHLxvOoZjrYYKDI3md/lRwab6G2iSlptvpJGkel4IQ9ynEQ0yvuplU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718632196; c=relaxed/simple;
	bh=F6edunFIUcDZTIb1mqBjURHwGYYpBYudXYPFSJXncC8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k708Umd+7IC/WJzL222ou8ievw5nONBUSIfzBhwEIMjC5eNuNlahIKJdQhejwoWI4XN5fZIr/A2dJgM6tTpa//bR8zURHzcm332JgRt0J1vNhNRM3rmJT2tsBYiSxjNGQL3N+Z7K9fabWOJFCFAI84OTUpi7El3KOdBGPs82Zdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=lbi+Psxt; arc=none smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-254e42df409so2770738fac.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2024 06:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632193; x=1719236993; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EcLjABCmPDgHOzLEYjNK5DROGA4JTxd15k6kwWpFoxg=;
        b=lbi+Psxtto/X6B21cjIvaI9jHqK1D47qOVQtJMs7qWWJkF+yzwmq9vI19sICfXj7xc
         ymsvVVVPpkidITO52EWJBBh3ke0UJMjnpkROyK2JQDrbLU0G798WVYFjG8LmrHPXkmOY
         YfOwezi/5suN6SVWCCzocztLAU4hEX85isuIulfGRATkUmfMVNKMAnqlSOQ75STFD0qz
         i6PA0r/pxW1z+zcqtMue19iD9gXmy/ylzWzE8ngfL3VFIKde5ddOh0fBkvnAvgP/+uq8
         sk6pcjdKkVTDHYWoLmokXzaGT7DICnA9XJ5EKCArENSmDnMFTJxe1hm2inWIr4OymefW
         HaAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718632193; x=1719236993;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EcLjABCmPDgHOzLEYjNK5DROGA4JTxd15k6kwWpFoxg=;
        b=pdDtfWmLXwhQyYv3M2osW1LyIg5S+V45COA/QVZALvZbqY3LLBgnV5l+/EsWl2it3G
         x87kVsQY/8DxGV71ACXwdCFqEnDWLZ3UXAXIQx5qutBL1HgMJ5q73hh6l8IIWCtjfEoJ
         whmpQxx68KNriIYi+jUPjY/yLtKbrQ+WNF9bar52jE4TumqHs2SLEMgSsFwn4kzJKL3Y
         ansc62rmlfGKXrrJ7S43kO6ryolPW9JHNZ0+4H4LwSK5W08AhnJPibPRbqhMxSAXHxsb
         UDXFy7vxvX3GoHsrkaZsC/luWFqbdpJ1I0pYcJTS7F9KHN3blENhMrx6cnWAjRT0gghx
         USMA==
X-Forwarded-Encrypted: i=1; AJvYcCVpjObJJIDEGED7NGHU+1Lil3JqLXkTGPuasT/b/mGQQg5EAcZ67Nby3gyDRYVsHMvqM9DN083CY7Z5Oab8ktOAqluRugyqHPgMkDHeoA==
X-Gm-Message-State: AOJu0Yz3StoDbANzyzS1b/AeODg3cAu28a/ue9SFzJULk2i/ND/SWvq+
	ROXLiC6vrfNEWaDZSitPyk421fEmiKRn5wG+SMzXPtCs+P9yRiFVL5XW0O/V0C4=
X-Google-Smtp-Source: AGHT+IGzXK8LLO+jQf8g3iL5MCifYqjIipjPlFcW7eDQk67H8aKJxfmuoG4FYBXo33Z8PvtltK6jug==
X-Received: by 2002:a05:6870:4728:b0:24f:d9de:3bed with SMTP id 586e51a60fabf-25842b793famr10756815fac.41.1718632193273;
        Mon, 17 Jun 2024 06:49:53 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:49:53 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:49:44 -0400
Subject: [PATCH v3 04/41] iio: adc: ad4130: make use of regmap_clear_bits()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240617-review-v3-4-88d1338c4cca@baylibre.com>
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
 drivers/iio/adc/ad4130.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/adc/ad4130.c b/drivers/iio/adc/ad4130.c
index aaf1fb0ac447..e134d6497827 100644
--- a/drivers/iio/adc/ad4130.c
+++ b/drivers/iio/adc/ad4130.c
@@ -1883,8 +1883,8 @@ static int ad4130_setup(struct iio_dev *indio_dev)
 	if (ret)
 		return ret;
 
-	ret = regmap_update_bits(st->regmap, AD4130_FIFO_CONTROL_REG,
-				 AD4130_FIFO_CONTROL_HEADER_MASK, 0);
+	ret = regmap_clear_bits(st->regmap, AD4130_FIFO_CONTROL_REG,
+				AD4130_FIFO_CONTROL_HEADER_MASK);
 	if (ret)
 		return ret;
 

-- 
2.45.2


