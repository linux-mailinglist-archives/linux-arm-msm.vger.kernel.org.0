Return-Path: <linux-arm-msm+bounces-22887-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B0590B2FD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 16:56:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B6AD1B30CAF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 14:40:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D7F91CCCA2;
	Mon, 17 Jun 2024 13:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="EUAwEH0h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5B21D47A6
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2024 13:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718632241; cv=none; b=e9EuYJmj9V3P8QMAqZPNALsHiNgDkNYKYDnW9zeCaOG2fJti3FaLd30MSSg3ZvYqED6ABl5Xcn8c3iGPt5a/hZe78F4gljI7vLJ5SeOpiruW0GuAAw6JvfocLvKtJg4ILfxwkX1DVjasYeX+PiTRWfVvxUr0VvhLnr8KAkbijcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718632241; c=relaxed/simple;
	bh=l1cofpntirPxR2Ec7wzKzI6J9yRh6+FgHHryvnvZtdc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p4IzenwLTE3Z852ojaDc+TM/SrpZsFJRErzeFxnsIg+O2g7GV0/M/AcO8MG1DY97DtrkFEzRvT1Ty6gZNB9be+OejOpbFeAvL5RStM9iqFvbx79etcozZLICj9l+YiSPYXMKh6i/HzbM47dPUo7ASLceXr0nvWmVgtsANOFreeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=EUAwEH0h; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-79776e3e351so312726985a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2024 06:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632238; x=1719237038; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7n1vQrJKdah20S8ZMrVRWoElzUuvEAd8XeagF8Tz1M4=;
        b=EUAwEH0hYkSmccyJLyFLI6q8sdY67ZL0W5GBAEjkA+ODrQ6GjWSBkXW9Aa30E+fXgE
         07X5CIQLGgQtWJpSorTGYysi7BAtPcUvoGK4igF0frldlkhRzKPqCLSTXhHjqzTACNpG
         /gZPSzff3DeFhYPcqu+iF4ZKHsgaCFVsjJxcKY23FrPCJ9LJpI47e9L4pdS3C5y+X6L9
         YmMXlfJv2R+UcXL0ErPh3iypqKvzZ129LGCSciG5/sUolh42D41dTS+/SXnqyeiq8ewC
         dqXas3g+1ycyJW5m9TDbKwck+AfuALsRyllzgctAIL7Tx0LJwZhIL94tRvEXpz+7xMH0
         YrMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718632238; x=1719237038;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7n1vQrJKdah20S8ZMrVRWoElzUuvEAd8XeagF8Tz1M4=;
        b=qjjK/YWSZoCvTODRKv80EGdAp720SuwTPVTvKgWJXgi/mj7FFIzv5wgl9qgJsRY2Si
         7jfxQ4Mqnw1mEmTD2mpi6IeesIKhgiJ0kJC8nLy4Ip+1kBfnCE1a7mbeovusSA3bRuvT
         Hy1aDvHNEF6pVdv/3AIILYqJ1kEHB5WeQZgbtNuELmxSxJwSHJzolQK5gpZkwLpmFW4X
         Ua72gRDHzax9q+NxA/Sh1EOVSFfU29RuVhuQiKEoyuYsNOlnQc1PnMGVyHSqjuUzJ9TU
         6YnaCjHanicfDZmt416ifmQbbCE+eZK3o1+CB1Db2QRdsvkh/XPCKGkm4gdgsOMy9TjU
         ZFlQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZsumtFIeFRye/j5hJL6+1/4a5hQYDrpXzBEIVA8JgDX6QpOC+X+b0PFOV63cxHuCq9qeJGVmTqCwMCdnYfI82o2i3rrVi+/TUtY+acg==
X-Gm-Message-State: AOJu0YwbQiGfLhvY/0ymEr/nIS1hJw8f+KpVDEhFMyAKv7CRsXSBUqZY
	yFnhQm7dwC2Y17j7sSlWsh9dyuUYmRZQHZs5XQbWOSCPkDyu2uTmawLF7CMsF2w=
X-Google-Smtp-Source: AGHT+IFPBsXk8OC1fXhOsjN5sQEyfL0NaDJoRNSti0BCnQHlNJa0XX2KPq4TD0tgoqruv2mBvc8G+w==
X-Received: by 2002:a05:620a:2947:b0:795:60b0:3f5 with SMTP id af79cd13be357-798d2430e27mr984123785a.34.1718632238585;
        Mon, 17 Jun 2024 06:50:38 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.50.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:50:38 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:50:05 -0400
Subject: [PATCH v3 25/41] iio: health: max30100: make use of
 regmap_set_bits()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240617-review-v3-25-88d1338c4cca@baylibre.com>
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
 drivers/iio/health/max30100.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/health/max30100.c b/drivers/iio/health/max30100.c
index 6236b4d96137..c1867c2ef8e2 100644
--- a/drivers/iio/health/max30100.c
+++ b/drivers/iio/health/max30100.c
@@ -363,9 +363,8 @@ static int max30100_get_temp(struct max30100_data *data, int *val)
 	int ret;
 
 	/* start acquisition */
-	ret = regmap_update_bits(data->regmap, MAX30100_REG_MODE_CONFIG,
-				 MAX30100_REG_MODE_CONFIG_TEMP_EN,
-				 MAX30100_REG_MODE_CONFIG_TEMP_EN);
+	ret = regmap_set_bits(data->regmap, MAX30100_REG_MODE_CONFIG,
+			      MAX30100_REG_MODE_CONFIG_TEMP_EN);
 	if (ret)
 		return ret;
 

-- 
2.45.2


