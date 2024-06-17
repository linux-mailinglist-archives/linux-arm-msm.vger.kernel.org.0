Return-Path: <linux-arm-msm+bounces-22899-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D0090B572
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 17:57:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AB564B3B55F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 14:44:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7F381D0F57;
	Mon, 17 Jun 2024 13:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Dy12cCfk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127631D0525
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2024 13:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718632267; cv=none; b=aBOPByFBTqDuXAs0q9FIimqAaBs6b6jOmTScyVrA296vM1qEtwhrjLkVzzvjy4SOyjoLMmUKAGqaJKMCqylz4Cu3eRfh5FHyYtBeuYUV1fj4+oAl/uOMAlJhk4pjHogCc/+slKdc2EzpIfUWY9a/LTVuc2vOW134j35TjhU85jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718632267; c=relaxed/simple;
	bh=z9RyjZU19LnLgrucgjYl1CZ1GaGyJEE70HiZ5+JD4QI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ECfxZrDtMYzcOYuqVnVcuLIx7k9Jmjoq8hdr6cdRUdvxpLITUKuuKsWnS4eHZgYCo+iVjk86anzKiR4uZDYNZTDMpmzm4Vqmuvk7bm3S1BVBfzTp7dXCIOBmiZPZkGvTtM+JMqrEb1W+QbCUGNeGSbUJIAzZfjEJOiPe526JcMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Dy12cCfk; arc=none smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-25837a78858so2021658fac.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2024 06:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632264; x=1719237064; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MWd9RIrs8wL0I/TcIsG/QAgGB9T5+fxOkhv6E/dAdZI=;
        b=Dy12cCfkpW3OL89p6eIQO5WH1yQEQIxtUbBpYOr0DMQTPPo2oXcQGurmwSGRjj7iko
         Qt8uKZNgcRkyqr/auHF/DgUXYo49cEyrkZj991EgIMWdQYkEIvdw2pBnTyh2TQdJDEC8
         DGKl5W/D9hUO67mvJQs/MI9R1r8m0p81LgeV331z10yvMT0/snQcTMzizP37itnr4egl
         VsZsgIJGopyWyJD1i1YVDAo+9VZzywCHDHqOpdymBoZv8OqQB1lRWz0eQ2g2lCFUWW7K
         Of9OC0bdaI4zv3KSiTwDdqXos9QlxGIxqhFP3ygpVP6ZK/cG7i3BammmgPAQGZsHVexq
         Wsqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718632264; x=1719237064;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MWd9RIrs8wL0I/TcIsG/QAgGB9T5+fxOkhv6E/dAdZI=;
        b=wB077Ciq9lO+mFehDRoXvVg2OE+V8FIdoJl1S2NSHAwCBvHXZAAMaYVB19Tp4gGlVU
         d5shhnMBsQfA5TCNyNjAJjBaeNz69Gx1neMRD/w7+6FI9W91vtt11fuCUZvaWBtv11Wr
         06CDp0nj7MAniQXknv9OOFExAswiGX+2i51QWR5mX+olU9BzCslmPDZSOj2iCYRcfD7R
         +FGR5DG9cj+a05nM+WizG/Ld7jKtH6UkHpZ/KEnPX+59D7pDemAHesA7T9tNd783cz19
         J0hDFf7lZPD2PzR8lspC1jRPm7VoWXqTokN/WLWx2FUkPPcBCejJmfSwnJCilLNU1LlV
         d0nQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDow+CH9u5CT2kOeA5S7Gta8G7dqnFY34ugb7+G30y6c5KaJFADriRYLTegw8nuC1nGjClcoXE6Y+LxvC6mg/2egqiDaXjXhYb9XvEiw==
X-Gm-Message-State: AOJu0YxLiBDoEyNVktRlnnCySnQnO+7A5ZlLbr07Jy8inoOol587ZrnN
	596eBEduf7oabxM4AW8w/4VdgbwwayCESyyxXcU6VzFKVtejcOo9sRbeR8+evdM=
X-Google-Smtp-Source: AGHT+IH8uTWV+X4VQg+Hvv7+Ss0V04PvnK1VdmrqhUaV/+VFOL4UdwUlA2xHiJMwUxJKiw4xuPCudA==
X-Received: by 2002:a05:6870:15d5:b0:254:8bb9:d0bf with SMTP id 586e51a60fabf-2584298505cmr11157462fac.32.1718632264185;
        Mon, 17 Jun 2024 06:51:04 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.51.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:51:03 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:50:17 -0400
Subject: [PATCH v3 37/41] iio: proximity: sx9360: make use of
 regmap_set_bits()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240617-review-v3-37-88d1338c4cca@baylibre.com>
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
 drivers/iio/proximity/sx9360.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/proximity/sx9360.c b/drivers/iio/proximity/sx9360.c
index 75a1c29f14eb..2b90bf45a201 100644
--- a/drivers/iio/proximity/sx9360.c
+++ b/drivers/iio/proximity/sx9360.c
@@ -672,9 +672,8 @@ static int sx9360_init_compensation(struct iio_dev *indio_dev)
 	int ret;
 
 	/* run the compensation phase on all channels */
-	ret = regmap_update_bits(data->regmap, SX9360_REG_STAT,
-				 SX9360_REG_STAT_COMPSTAT_MASK,
-				 SX9360_REG_STAT_COMPSTAT_MASK);
+	ret = regmap_set_bits(data->regmap, SX9360_REG_STAT,
+			      SX9360_REG_STAT_COMPSTAT_MASK);
 	if (ret)
 		return ret;
 

-- 
2.45.2


