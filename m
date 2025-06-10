Return-Path: <linux-arm-msm+bounces-60779-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C38AD3715
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 14:47:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5D7A317840A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 12:45:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F6482BF3F4;
	Tue, 10 Jun 2025 12:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Y3OfEAf6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16F929995C
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 12:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749559088; cv=none; b=hdulh8U2V0+ptFSqU3PrwNHCwzHINYTM3N/TOFsa3389+vFicoIiuVO+IzjVIEZP8DEEW9u3AnSE0p/rtIAmmzRqhaDENrAHt7S7eEEf2ktpN1nS+ihBTE4qWO3D66TSUIYHk4+kNBuVmQ9YhqxvZguYfhayaG32Hgu+6JMyB1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749559088; c=relaxed/simple;
	bh=2NQ1cPOt4XkS2Zypkx+pVvT81DOqnbvnHNN8rSdp7gQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S6oqLue0kc1TXqRX0mZ6SK47TA37CKrnJvWrzQzaz15nLTnmCJ2MACb+XNqq3HsduS/HyRqTKxbctiHFLuhBm/Of/6ee6y1pRirlUIJzLiQQDAC5P72csFdmTiivPJvYmw6D0TTAuBxDoCcrsrHZpySRhZhYGJwun5L+thDrf6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Y3OfEAf6; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-441ab63a415so56277105e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 05:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749559084; x=1750163884; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+v15tNEANzRm+7r/NoXuqDH3IXJTclSdS8jb+naQrrI=;
        b=Y3OfEAf6+zk21KovJ4HiuMfmVXLnuXgSWOGMwo2H5ssRODOCnSDVY5xkKXqLnayDF4
         6nZa3t2YdCDY4gM/v5iscN4P8yImHnWG4IRsCmHTgPBU7Sngeb+rCpszlZsZV7GTfSN1
         xbJuUAa9vydz3PjovWMG0Mtf0E2ijo/27+kxqbN0dOxqJTO/l87PytSXNZjFheSyNcCl
         OHWKdA/mfCVmF1iiG2ILGEtAbfe1Pkwmr1XQA5MJ3kew4K/DtTurYQXOQo6Y6G7g5S93
         joVBE0M7azNwCtszbNDsFFB3kfOO9FUCS07ICel+2k2sy17VX9MQopAzysANJLgUA3kT
         L36Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749559084; x=1750163884;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+v15tNEANzRm+7r/NoXuqDH3IXJTclSdS8jb+naQrrI=;
        b=W6Z6YJb2p3+UK5yUhIGKyRn2PlXRW+DL4KwlldlR+5PEZrZetu7CFEtBmlNiH21QBl
         4nhYAhKTcbLcr1SmGR/6LktN0P/uBxG+5W+Q+Az81/W9mWFPEQWx77yw8kg53jBAntl/
         joegg+xa+7mW9x6v+m9eBjC+oK5b6Gl1Jh6KtkJXDbHxS5F8P9978JFDhSmtAjV0+r3E
         O4kzJffXeFBPvP2CiZyDKAtHKCMiLXfEDQ9445Kl3XMAaHw4yzTFIHixud8yKm5N5MDO
         Wgr5TzAewWFGJVLgOOOpkYImcjVtqg1YDh4rQTKGHtMTCKBc9z1JFop2f6aU2CLifAOD
         NniQ==
X-Forwarded-Encrypted: i=1; AJvYcCWf3IgcgtQCCyEFGWmNLqHGr6/RG1ePVq7KmgpBHx/uMyBYcO5Be+XGue9wQ98ObaH0YXGsEBSgDH5qmeRn@vger.kernel.org
X-Gm-Message-State: AOJu0Yyn54KlS+eN2/xvPMc9RzeeoQXcy4U0Pa8CdWoLCUDsNucJRxOV
	KQdjBnEuNA7+87jGcrmdnCmKosTO2bjxgPJhIkOshV5DGQrgGF3JBTvbpVetAwCBR9M=
X-Gm-Gg: ASbGnctc5A5KtQg31aLwWGp4FM9Fz93HacbOGGL/9kPnmmDMSPGdYpeLRbazdaYG5eb
	Ef4cGhmRUpQ6Vl9E+OMp8RH2kG/f1b4V27bRSQZkxfcR3QhmYf3A0I6HAbBWWwchHrq0Sd/Q+j1
	7DYz37aLt/ATOwQ4H6/Y6qtQu+cDz89PQGfX+/rRWuPHnjZhTwjV3J7/GcOx9EgCM+vNAfxKaC2
	jFD0trEuKZlo9vu8E/0Phn/qz57R5DPiSN6dot1jkw18FdfeRk6B5UwajDfvs2yqo0Yr0GBa9I/
	Ud2bXhPKX4P8xQmAKVTMkatAc7+aszqEHLX5kwbZu7cXAQO3Vi7gRg==
X-Google-Smtp-Source: AGHT+IGXM/E446xVdY1FfP9/Um69E9UBtSzy/WmUYaOKdEEtjBVdyfljAEXkdz5bvzeT/0NV6hacqw==
X-Received: by 2002:a05:6000:430a:b0:3a4:e56a:48c1 with SMTP id ffacd0b85a97d-3a5522dee1bmr2326990f8f.55.1749559083748;
        Tue, 10 Jun 2025 05:38:03 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45213759fb2sm142476805e9.38.2025.06.10.05.38.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:38:03 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 14:37:59 +0200
Subject: [PATCH 3/4] net: can: mcp251x: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-gpiochip-set-rv-net-v1-3-35668dd1c76f@linaro.org>
References: <20250610-gpiochip-set-rv-net-v1-0-35668dd1c76f@linaro.org>
In-Reply-To: <20250610-gpiochip-set-rv-net-v1-0-35668dd1c76f@linaro.org>
To: Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 "Chester A. Unal" <chester.a.unal@arinc9.com>, 
 Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Marc Kleine-Budde <mkl@pengutronix.de>, 
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-can@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2241;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=KLDDGKd5WeP1ZH7PFOPPjiypGPKpSmUdnfupIQJn/j4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSCcm2R5upegqsW89/iBNvrpgrj3SxMSCFC3Nl
 TOttqE00BqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEgnJgAKCRARpy6gFHHX
 co7eD/4q7jk4pUE8gWfdeMax9QSwEEkHfhqOylZzhdJH37vjfb5+genXs5+a9aSiMhVv+CUzVRo
 3fzN6/I10/CJqsoImMl+BGSVREdFJcXIVrezmcX3g/CoDU5C5lbMo/PXX/V0c3VycIEYSOm0gzN
 bK8W/frTMV20VkpA9RLNqZEdT5b+3tbAXY3KUruz/73xY8myLP1bsvqIJcSy3+8fpw0XzH6mqSO
 fJ1O+wf69HliyNoYdUIuJ4RNUabK6X3knM3Fq5i2S3Utkpx0QTaAch5ftKvyI82zEjOyyf3B8FZ
 +d/SAeGCuhnoN5mWeVWSPBVUU2N1zxNJPXhQ3Oc1VhFUdWoltDMsO0pAwFzSZbaGuFq2VRW9Mq/
 h2ECjHxSj537C92XxO4LIlDV7LNKSDWKfQqvuee9lOH4H4oqCgfDwoonedPMeoUUJFP2xs80v33
 77CBBKvc7mrkCSwH5ZgVX+ShUZvq6TP2T70qICUOgnQOG+j6Cb/rpEeYI1XdtZqX3MTSCiU+zlA
 Sl6LJqWqF5NCbc5Tp4TbMXJ7p5Bq9ATgsoC5IFpIDbWzAHIYWDpNQRe+dQB+NT2SAGWlct361Hn
 N7MHWvrch2Y/nuHsq7YlV1MgLW8lEFXgpk4FW4tev1/7VTv2SenC2isVuMt0TlfEhDucadN6ghF
 oHodahRBqdw+TJA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/net/can/spi/mcp251x.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/net/can/spi/mcp251x.c b/drivers/net/can/spi/mcp251x.c
index ec5c64006a16f703bc816983765584c5f3ac76e8..7545497d14b46c6388f3976c2bf7b9a99e959c1e 100644
--- a/drivers/net/can/spi/mcp251x.c
+++ b/drivers/net/can/spi/mcp251x.c
@@ -530,8 +530,8 @@ static int mcp251x_gpio_get_multiple(struct gpio_chip *chip,
 	return 0;
 }
 
-static void mcp251x_gpio_set(struct gpio_chip *chip, unsigned int offset,
-			     int value)
+static int mcp251x_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			    int value)
 {
 	struct mcp251x_priv *priv = gpiochip_get_data(chip);
 	u8 mask, val;
@@ -545,9 +545,11 @@ static void mcp251x_gpio_set(struct gpio_chip *chip, unsigned int offset,
 
 	priv->reg_bfpctrl &= ~mask;
 	priv->reg_bfpctrl |= val;
+
+	return 0;
 }
 
-static void
+static int
 mcp251x_gpio_set_multiple(struct gpio_chip *chip,
 			  unsigned long *maskp, unsigned long *bitsp)
 {
@@ -561,7 +563,7 @@ mcp251x_gpio_set_multiple(struct gpio_chip *chip,
 	val = FIELD_PREP(BFPCTRL_BFS_MASK, val);
 
 	if (!mask)
-		return;
+		return 0;
 
 	mutex_lock(&priv->mcp_lock);
 	mcp251x_write_bits(priv->spi, BFPCTRL, mask, val);
@@ -569,6 +571,8 @@ mcp251x_gpio_set_multiple(struct gpio_chip *chip,
 
 	priv->reg_bfpctrl &= ~mask;
 	priv->reg_bfpctrl |= val;
+
+	return 0;
 }
 
 static void mcp251x_gpio_restore(struct spi_device *spi)
@@ -594,8 +598,8 @@ static int mcp251x_gpio_setup(struct mcp251x_priv *priv)
 	gpio->get_direction = mcp251x_gpio_get_direction;
 	gpio->get = mcp251x_gpio_get;
 	gpio->get_multiple = mcp251x_gpio_get_multiple;
-	gpio->set = mcp251x_gpio_set;
-	gpio->set_multiple = mcp251x_gpio_set_multiple;
+	gpio->set_rv = mcp251x_gpio_set;
+	gpio->set_multiple_rv = mcp251x_gpio_set_multiple;
 	gpio->base = -1;
 	gpio->ngpio = ARRAY_SIZE(mcp251x_gpio_names);
 	gpio->names = mcp251x_gpio_names;

-- 
2.48.1


