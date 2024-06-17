Return-Path: <linux-arm-msm+bounces-22893-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3412390B2AC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 16:45:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5C020B30D96
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 14:42:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6295D1CE9E2;
	Mon, 17 Jun 2024 13:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="FKZo7ofn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3767A1CE083
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2024 13:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718632254; cv=none; b=EdOZyxHEqnqIItlD14E/rWKeZQxiOohBG6H8/PiGCBRPicLxIm2kkFnMwldNCO2OKZ1D9HlB1ZSX0UaJXqqjoCbho0PzahBX8cMxVTT8ffHb6BR4cnSTwft028En6uaMbHwK3/R1X9BzOtsufFLMoBPFrqLmXK9kYrfHFtCB+EM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718632254; c=relaxed/simple;
	bh=ckMo8AE5ydYAYNgqLQ5pfM8APLagaTP89WYb9paKWrI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ouogf+CCt4vPDlgdx7N7/jtn3cULAccPUW80DtHMmeffSD5rzEnfoA+J3St3LN96Ht7gpEHDUPDbdfgwtQqYgiASfPxuE39f/681dnGBkwoIGo1rDaONhklcafJHEvfbNfvt1YnNH14jOXXvaoN7UnyVePgifRJAk61kTAEOlsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=FKZo7ofn; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-797e2834c4eso366755585a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2024 06:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632251; x=1719237051; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b+ymucZ3m6lrJGr3WTAeCvzidHKg4xOe2grvPyQxJhA=;
        b=FKZo7ofnqZPmtP5B2Ngq0wBVjC1RVdrqQtZtMjghKmILB36EO0+2Y9Pl4NqL40FgMF
         YEQ84S/BrbcHEWHLQF2iyNHU35H4NxeS/xmXxMnyECYXlS8ONTEWcFVTsnz9AcmO7nIY
         lOiFBucF1d5amYlVh8ws1Gp8O3d2Il3sb4P6sTwvRZy5H+IZe9ARP4KKl9J8fKIdOxjc
         /X2B5tN4yOgx1gAwbZydGo1OOW5SCxKBnjOR3sz2j7e4L6dWcmwgwEJjKBSC9+g0bONA
         i/pinsqpdXoSykUO0UULDsmUg8Yeh1o6ONdTo8LRN4hF5bep8MAAkMaTHvE/HkxsOw/U
         SlnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718632251; x=1719237051;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b+ymucZ3m6lrJGr3WTAeCvzidHKg4xOe2grvPyQxJhA=;
        b=gCXpQHcJSw6HJYzFq+bdB7+zDKfmD94TSsZ7/OW5jd99BpxobleBhdELkwO2ozuJ+8
         znWQGIbNMoTph5B9gtcJ5sMw/XxHO1f5Old1CBZANh8vJIywC6U+sfhC2a/TRhVKN9V8
         23OaLScGVBlIEOHjqPctm2GiVjaLuu2fu20D5s1qwpZ+iMPcw7V/aOvaLb2lWtiYuRZL
         nDDhtDmXvz3rSTr9fqaZ/cYuobp/alC82oZH8pVJ/4mgpZhZczegYmNiYslwmPrbDJDK
         oGrY2CDwb2QzxlSeubkWUHCIUC8UK2OpHbIE1HwrjCYBWrYFzDbBS2q3jgdPL2X3X1x+
         U60A==
X-Forwarded-Encrypted: i=1; AJvYcCVA2tXOLaInTu/289PEJnzUZh39NAf1QX0znqFt3w9n/arGFc77wRsSfXhzVhV6CK0Wx8wGgLd2l9zDv8aY+ZrxtHcEsORggq2tQJcQTw==
X-Gm-Message-State: AOJu0YzVccSycMNo3ZDCqBOF5aD6FP+RRJq1UfcshBh8t0fEFXKwlVX4
	KdDS6jcBAYjAIvIrZ7vHyzgIXKC37cQppcTWaj6/49CGNLBcKsPSQTGv47bitGs=
X-Google-Smtp-Source: AGHT+IFhD2JefGeiJgsg6Ae7QRIe/BDndSP0Z/WiCRPC91zIn6+wpqBzLsiQzn3/JIP4kN+hagVe4g==
X-Received: by 2002:a05:620a:4056:b0:795:56a1:6c0a with SMTP id af79cd13be357-798d03b78c4mr1852443685a.30.1718632251285;
        Mon, 17 Jun 2024 06:50:51 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:50:51 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:50:11 -0400
Subject: [PATCH v3 31/41] iio: light: st_uvis25_core: make use of
 regmap_clear_bits()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240617-review-v3-31-88d1338c4cca@baylibre.com>
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
 drivers/iio/light/st_uvis25_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/light/st_uvis25_core.c b/drivers/iio/light/st_uvis25_core.c
index d4e17079b2f4..fba3997574bb 100644
--- a/drivers/iio/light/st_uvis25_core.c
+++ b/drivers/iio/light/st_uvis25_core.c
@@ -330,8 +330,8 @@ static int st_uvis25_suspend(struct device *dev)
 	struct iio_dev *iio_dev = dev_get_drvdata(dev);
 	struct st_uvis25_hw *hw = iio_priv(iio_dev);
 
-	return regmap_update_bits(hw->regmap, ST_UVIS25_REG_CTRL1_ADDR,
-				  ST_UVIS25_REG_ODR_MASK, 0);
+	return regmap_clear_bits(hw->regmap, ST_UVIS25_REG_CTRL1_ADDR,
+				 ST_UVIS25_REG_ODR_MASK);
 }
 
 static int st_uvis25_resume(struct device *dev)

-- 
2.45.2


