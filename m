Return-Path: <linux-arm-msm+bounces-22872-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A605F90B23A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 16:35:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 185D3286CDE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 14:35:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02A6E1BD511;
	Mon, 17 Jun 2024 13:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="bnQbpyfv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1A21BD503
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2024 13:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718632208; cv=none; b=AD0C+n7vBkKg83cU3lU+NG4yy+8XeMuFnprLHBIyd/CefPkBQOlOXVG2etV7m27oDWtV4kUMSBNat6T0eX5P58BfNKNJ2eFGNVO6VSk7roU/5tyWsU9FXh9PNP93RwvqI03rY6HHxtYXefXh7EFJn3d6tq3Kn0boiiU7ExazI1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718632208; c=relaxed/simple;
	bh=zWMvkgbpb12CypNp6YHAF3/7MiDNI6jYeCI/ir0hmEs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XShzD1FmRY7WrHeuZQJ80N8QBiwBHYku3A2khS/Un10jLQsq94ozt8RkHY/i+YGYG0qsPLdv+NhstbO6S3reOzi5Vbc0aCxUOp7vQ0pVJBetE03T4FRLPSzFEDYVCN6rFEHeVGCoYGLGra/y27Jr4CjtadVepZfiVMxNJYotvRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=bnQbpyfv; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7955af79812so246238485a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2024 06:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632206; x=1719237006; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QUJvHuZZxgwBDIkIwz1c6/5nEPPRUcnNJo5C6L4NEfc=;
        b=bnQbpyfvHpmXYcjI52caXkQLZZtDHPxuhyUKlqA1Fw67bZyFDnhExXfZnYsRxZ/9vd
         YJyr8sA0dAMW+w2fTj/0u10G9XdhDz2Vz6x3vmhP3Y9Lk22gCpDpvpJcqK5qhNLJvo0U
         s8zF80A3JxRmWrICMmpWgzJI/vibSmMA+9OUhjjzV97QheLfEwHjJ8xcsBbtzdfE2RoT
         K8ULayVbCk4PrH3m3U2/DZlmKWev6i/kAE7TSJMVyTyKfhIBBnjLzvGilmefpKAr/4ui
         4DYqSZcLMaQ02AqN4fqRPPr+Jrj6EI/Z6Jujl5R4TPDXkxh4tWr2QozInE8FICqFsQE3
         YG5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718632206; x=1719237006;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QUJvHuZZxgwBDIkIwz1c6/5nEPPRUcnNJo5C6L4NEfc=;
        b=rOKBWX9vDS8r1qZR1TWZA+GkdClKRq2FExMl2L3vA3hJvbUt7KZtWQQq45aatZP0DJ
         24N6rXmjttxE6/v97CQAY0vlSMNJnai+cecDvm6rYtfdcX2Q10H7opgTtiUOE0xl8USL
         2CCPKxCsTaiSiVX726HCAkux2qGsKbnP60oYqeVXw8DfCCyYHOekLT8rUWaP+dLOdX6s
         Dwm0tYJokwHZHWR6yqftL/vGKy7XPxmAq6cnkv9slJ/Z9RTGfID3+XtqfBTLhylUclIT
         J5fy1DSJ+lqy+ulCBYvcjQaIxR0pWkLTUhhbTWLERiUGxHwTr5e5jU2P7o5+/g0QBOSn
         uypg==
X-Forwarded-Encrypted: i=1; AJvYcCV316c33j0ttj9jC64DOewNRcVrzlSpBFsRx0kU4LjT3lT14qOoLtJSCuzTCSXtVU5EKw9Doz+O/bAU8d3mRM004/Gi6vff4aK5yNbANg==
X-Gm-Message-State: AOJu0YyZ6pXO+XJ2xexNlk2J1ISYt0+J2Gy/DGsG5I3DH/zMPbEw4FU7
	iCW5T5omZeX6CwtCZNiTWEXPkeQKQovE6B/j7tOgViAf8QdFh2xjDZ4ajhF752g=
X-Google-Smtp-Source: AGHT+IEuE3X+Ttrgd1pciF1gOmiGqm6CNudwXH5GABygzdDAc5BXX3iLlJx1my8INZ4E7qgPOczVYA==
X-Received: by 2002:a05:620a:444f:b0:795:5815:2f9f with SMTP id af79cd13be357-798d241d00fmr1205475685a.25.1718632206164;
        Mon, 17 Jun 2024 06:50:06 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:50:05 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:49:50 -0400
Subject: [PATCH v3 10/41] iio: adc: fsl-imx25-gcq: make use of
 regmap_clear_bits(), regmap_set_bits()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240617-review-v3-10-88d1338c4cca@baylibre.com>
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
 drivers/iio/adc/fsl-imx25-gcq.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/iio/adc/fsl-imx25-gcq.c b/drivers/iio/adc/fsl-imx25-gcq.c
index b680690631db..b3f037510e35 100644
--- a/drivers/iio/adc/fsl-imx25-gcq.c
+++ b/drivers/iio/adc/fsl-imx25-gcq.c
@@ -87,13 +87,13 @@ static irqreturn_t mx25_gcq_irq(int irq, void *data)
 	regmap_read(priv->regs, MX25_ADCQ_SR, &stats);
 
 	if (stats & MX25_ADCQ_SR_EOQ) {
-		regmap_update_bits(priv->regs, MX25_ADCQ_MR,
-				   MX25_ADCQ_MR_EOQ_IRQ, MX25_ADCQ_MR_EOQ_IRQ);
+		regmap_set_bits(priv->regs, MX25_ADCQ_MR,
+				MX25_ADCQ_MR_EOQ_IRQ);
 		complete(&priv->completed);
 	}
 
 	/* Disable conversion queue run */
-	regmap_update_bits(priv->regs, MX25_ADCQ_CR, MX25_ADCQ_CR_FQS, 0);
+	regmap_clear_bits(priv->regs, MX25_ADCQ_CR, MX25_ADCQ_CR_FQS);
 
 	/* Acknowledge all possible irqs */
 	regmap_write(priv->regs, MX25_ADCQ_SR, MX25_ADCQ_SR_FRR |
@@ -115,11 +115,10 @@ static int mx25_gcq_get_raw_value(struct device *dev,
 	regmap_write(priv->regs, MX25_ADCQ_ITEM_7_0,
 		     MX25_ADCQ_ITEM(0, chan->channel));
 
-	regmap_update_bits(priv->regs, MX25_ADCQ_MR, MX25_ADCQ_MR_EOQ_IRQ, 0);
+	regmap_clear_bits(priv->regs, MX25_ADCQ_MR, MX25_ADCQ_MR_EOQ_IRQ);
 
 	/* Trigger queue for one run */
-	regmap_update_bits(priv->regs, MX25_ADCQ_CR, MX25_ADCQ_CR_FQS,
-			   MX25_ADCQ_CR_FQS);
+	regmap_set_bits(priv->regs, MX25_ADCQ_CR, MX25_ADCQ_CR_FQS);
 
 	time_left = wait_for_completion_interruptible_timeout(
 		&priv->completed, MX25_GCQ_TIMEOUT);
@@ -272,9 +271,8 @@ static int mx25_gcq_setup_cfgs(struct platform_device *pdev,
 				   MX25_ADCQ_CFG_REFN_MASK,
 				   refp | refn);
 	}
-	regmap_update_bits(priv->regs, MX25_ADCQ_CR,
-			   MX25_ADCQ_CR_FRST | MX25_ADCQ_CR_QRST,
-			   MX25_ADCQ_CR_FRST | MX25_ADCQ_CR_QRST);
+	regmap_set_bits(priv->regs, MX25_ADCQ_CR,
+			MX25_ADCQ_CR_FRST | MX25_ADCQ_CR_QRST);
 
 	regmap_write(priv->regs, MX25_ADCQ_CR,
 		     MX25_ADCQ_CR_PDMSK | MX25_ADCQ_CR_QSM_FQS);

-- 
2.45.2


