Return-Path: <linux-arm-msm+bounces-22901-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D9890B2AF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 16:45:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E99C41C2135B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 14:45:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F02C71D3652;
	Mon, 17 Jun 2024 13:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="oazY+j9j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D991D0F77
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2024 13:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718632270; cv=none; b=UkIy1y1fPn2fiB6H0/d/LxmvFQ2HwRo/nzOh/J2f+0L5ZlfwokFI4B+nGHawPNdkSchq/Ij6w+kv5PO8qrm9tUYKxC8bBSIwa8dgD7gqOQxHO6YNee1JBVapRlwcxK8GN2ktuXwMWylpHzPJf5olp95VE5JP5kbTczMEoo1kmGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718632270; c=relaxed/simple;
	bh=lrT4UVJxbYPigfpUfvDqNd6ndl1eVcIzUfVJ/1QCCbs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gexd6DaQRSmu6B0nW0TMi1C+InTI4G0Ylhd2sB0np1XYsZKILuKPfBaKA7IfoxgL2bz/WAF/MUMHPpxl95KdhkeHiBhF7wcjpVpIXipZl/hP1cTaOTJYWQrIoBX0E0mFDx2PtQr7esU7d+dWtyCdZ9mPqljtLRWCRSP4S4YwrKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=oazY+j9j; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-44051a92f37so35894571cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2024 06:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632268; x=1719237068; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tvabn+RMpG3uovvK1+JaZOuuhTQ0Y5v5qxh3XvN8Rq8=;
        b=oazY+j9jwiHu0wxRO+kO36SdiQE/16HGaJhB4FIWY5UrZ0KsiD6p+Gd9qRuS1Vcw6u
         C9kjFmUwnRGZ/kYmgeXlDQ9WBmPJUzoeOqDJMKgbItUFuqHB26M2343sNgn0D/PBKclg
         TpmoiCWRVK0CD0JBqzqNpMNsYf3D7CjWKY7/MCq6AqlaU4eYgGz6i1jArVfQzzUVKV/p
         VFoneSUaG/HOwh8a3O+hd9q3V+O5gPWPENe6Z1j/OxUqNTMKPMqEQ80UvQ6Nzt4ztsUr
         UYi49OqvZJtFBZOC8DxCCm41vvVWjNUglGzoLV1i8X9k5nEijO0wiG9v//HY60KfvA7f
         qoNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718632268; x=1719237068;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tvabn+RMpG3uovvK1+JaZOuuhTQ0Y5v5qxh3XvN8Rq8=;
        b=tM6V2V4X+nPX+jDv5ZcjQ5+7Szm6CJvIHjKdNtPzBqRYRkouYm8UCf9o/NILYCNrH+
         ktZ54EUGidVPCxRUzCV/7Y8QvoeSv7cAo+aZnnPprvlZOAHKSNtrzRy7Cj+h9dYiw1sN
         dxJxKnb/If1vjodxh+fYCxhA3Xp1Wk/jbFbL8sbcLN8y5PXsf1vdQM2Cvy6Ouww7XWc1
         6OHwiULDaecpiNrpE6rFxeaFBNB659bGu0B4fAKKIM0IGHx2hE8nZsoiQXnwEi4csdXk
         CbU5ChZG/RZrE968Q1PxDjCitJYhtL8RoFBgFPGwfTc2wIL84sxF1hnqzMaa3Y0zNgUZ
         BG3A==
X-Forwarded-Encrypted: i=1; AJvYcCV6Vz+PVvFczG6LoJY28BCd3kmnlx+cF5YNH5VujqJul92X56QeCfZvjznNjKmiMNkbJtvlYaF/SBja3i6O+850auDEIxI1iGWkN/NAUQ==
X-Gm-Message-State: AOJu0Yy0FnkcjGJXbNI7HgA4rkYFqJz3DiMaNiS5PcZhLY7yEyiyPpZC
	kwD2KGAzda9V48HGuRAmnel2qrI1xJtAij6HPx5ATeq/2pBApCX1nAsH84o5N0Q=
X-Google-Smtp-Source: AGHT+IGCNTX7XI85nrdMwm8HgjdhSBF2upAbofRDQ4N0lo0/7MseIEDdacRNTzR/tFRJhwns3PxO2A==
X-Received: by 2002:ac8:71d7:0:b0:442:198e:cb9 with SMTP id d75a77b69052e-442198e0e4bmr132788711cf.27.1718632268400;
        Mon, 17 Jun 2024 06:51:08 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:51:08 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:50:19 -0400
Subject: [PATCH v3 39/41] iio: proximity: sx_common: make use of
 regmap_clear_bits(), regmap_set_bits()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240617-review-v3-39-88d1338c4cca@baylibre.com>
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
 drivers/iio/proximity/sx_common.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/proximity/sx_common.c b/drivers/iio/proximity/sx_common.c
index fe07d1444ac3..a95e9814aaf2 100644
--- a/drivers/iio/proximity/sx_common.c
+++ b/drivers/iio/proximity/sx_common.c
@@ -111,17 +111,16 @@ static int sx_common_enable_irq(struct sx_common_data *data, unsigned int irq)
 {
 	if (!data->client->irq)
 		return 0;
-	return regmap_update_bits(data->regmap, data->chip_info->reg_irq_msk,
-				  irq << data->chip_info->irq_msk_offset,
-				  irq << data->chip_info->irq_msk_offset);
+	return regmap_set_bits(data->regmap, data->chip_info->reg_irq_msk,
+			       irq << data->chip_info->irq_msk_offset);
 }
 
 static int sx_common_disable_irq(struct sx_common_data *data, unsigned int irq)
 {
 	if (!data->client->irq)
 		return 0;
-	return regmap_update_bits(data->regmap, data->chip_info->reg_irq_msk,
-				  irq << data->chip_info->irq_msk_offset, 0);
+	return regmap_clear_bits(data->regmap, data->chip_info->reg_irq_msk,
+				 irq << data->chip_info->irq_msk_offset);
 }
 
 static int sx_common_update_chan_en(struct sx_common_data *data,

-- 
2.45.2


