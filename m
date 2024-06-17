Return-Path: <linux-arm-msm+bounces-22886-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A635E90B277
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 16:39:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BED081C237C9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 14:39:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3706C1D365B;
	Mon, 17 Jun 2024 13:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="n3dn54LE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B34E1D362C
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2024 13:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718632239; cv=none; b=GBsycy4BL1W1/JQIpvsqOG78SBVe64aDc+spldw15eW5Q7ukaGB0cmK+sNxnl7oDkGCyrRWUfrPd3iZsJIXR7VHRTi/cq+P7XbBodk5IGvewa0Ui2YNi7v6Q/Gx+WnrkCDAFrq95Vw79GfxfA69AyZpuNEuNMxjZnthHPUwbfqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718632239; c=relaxed/simple;
	bh=TWHdKrtS1Us38JyZe9XnqcqTqye1G+StH2qcb0F+nZI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZDQwI1vp13HGqpkeljEt4bXPqTXtDyMgHd/1GU3fSATH+vsd/5yQ6NHDk1KLxBUaDIgEY8CST1dBLe5j/AqO/zEqcOkQmwhqYBY0iiGqvSYam9jD1wVq1w6TEGyUi8QorHJCMymYxMODJjM/QSByw/9loWoMnbGhBBh+fyDSKT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=n3dn54LE; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3d24a231342so1952102b6e.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2024 06:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632236; x=1719237036; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fGWBtK2gGzg6dOcIkV68NwvgEBcr/hA30WsTyKyEtwo=;
        b=n3dn54LEHxvrAd6YTRqrbvAEh5ziJYX4qVK+I4q3082ZqIJnZpG1/osKR40oLDRs5D
         nbBCGlHojK8wfHjV4/vorTqHH1jkK7daB1K8XF4Z1F99owhtjpgqK37wG4AFY72+2nDt
         VWlfIBCpO0WSivvjvgfPwAGl+loJQAdEtz5DGpYkUiinADxtGT+JAzb9ipsgUFsk/j2j
         VRx4Zh0qyoVExdXma0Hg2rMOOoHLZaWdPEUAVvTZONejDsnWRj5/Fckn8oILfNrw6nqa
         ijW9EgPSfHh1N6HqMpXNaCtthDFtUIvy71DU94N9dV/HRlvLnPtiGPcHC19l652FCw1B
         8WaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718632236; x=1719237036;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fGWBtK2gGzg6dOcIkV68NwvgEBcr/hA30WsTyKyEtwo=;
        b=rgNeo9o3s9EZRQOeU2wi8B1u78LnGDfVUAd6X+7zTc8C1aeacz0B9q3MMAYJWg4Y4b
         ds3TGSm+225nmL/QNNMdmNNKEb5KlEJRdyeeQAqVLIsipdoW1QvvoxbYPaFd2Vrfly8K
         Gegt2fYU1RqLNImUc16JMAGIVrnAxYmFsSOZLs6aslgDv4mCDmva8zTrHo3Vf8Wum1NR
         qfgZW5MzaaUhsFC1O9rVWQ0iuJ91zfKxyjxDTLa61oonAfOW6MUswPaHFu5SkoEED082
         GvbrSlxfQJHAbU8YddWCeeQhSTLqhSGLwqhYIScpOEe+Ntl9ZB/+KKMcWCveOBah7XML
         epQg==
X-Forwarded-Encrypted: i=1; AJvYcCXDY286T1JTanGvHEspv4fsbfZcx39HLVWSumBNCYR/BfZatXuj3VICBGhKStH/nSAwqv0uHQBt8/7Gkf5ppYgAegA6PqRIkYpQzadc9A==
X-Gm-Message-State: AOJu0YzwAnTnyBBuvxITvDKHGIQoiw9WrNqELBfDJ/HRHFG0gnBLHiPA
	aL1wAzIZUnxw9lG5CxD8QXmtTR884s4lrgeAM6QeoMAVj7QyUyPuuDoRGfalyLE=
X-Google-Smtp-Source: AGHT+IENHYKm3NgqHa1MPYUPJeZqzEGABKtYhMj6CIPi8s9CW+uIlwWgMeUoLMPd9TX2TqZf6pVe1w==
X-Received: by 2002:a05:6808:e83:b0:3d2:27d3:2928 with SMTP id 5614622812f47-3d24e8f5deamr10493207b6e.28.1718632234195;
        Mon, 17 Jun 2024 06:50:34 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:50:33 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:50:03 -0400
Subject: [PATCH v3 23/41] iio: health: afe4403: make use of
 regmap_clear_bits(), regmap_set_bits()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240617-review-v3-23-88d1338c4cca@baylibre.com>
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
 drivers/iio/health/afe4403.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/health/afe4403.c b/drivers/iio/health/afe4403.c
index 1dbe48dae74e..52326dc521ac 100644
--- a/drivers/iio/health/afe4403.c
+++ b/drivers/iio/health/afe4403.c
@@ -422,9 +422,8 @@ static int afe4403_suspend(struct device *dev)
 	struct afe4403_data *afe = iio_priv(indio_dev);
 	int ret;
 
-	ret = regmap_update_bits(afe->regmap, AFE440X_CONTROL2,
-				 AFE440X_CONTROL2_PDN_AFE,
-				 AFE440X_CONTROL2_PDN_AFE);
+	ret = regmap_set_bits(afe->regmap, AFE440X_CONTROL2,
+			      AFE440X_CONTROL2_PDN_AFE);
 	if (ret)
 		return ret;
 
@@ -449,8 +448,8 @@ static int afe4403_resume(struct device *dev)
 		return ret;
 	}
 
-	ret = regmap_update_bits(afe->regmap, AFE440X_CONTROL2,
-				 AFE440X_CONTROL2_PDN_AFE, 0);
+	ret = regmap_clear_bits(afe->regmap, AFE440X_CONTROL2,
+				AFE440X_CONTROL2_PDN_AFE);
 	if (ret)
 		return ret;
 

-- 
2.45.2


