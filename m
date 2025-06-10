Return-Path: <linux-arm-msm+bounces-60778-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EE218AD3719
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 14:47:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BA185189CF7F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 12:46:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A1D62BF3C3;
	Tue, 10 Jun 2025 12:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="tmir59LZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7A2299956
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 12:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749559087; cv=none; b=JyT1PaodR9AyEcyrOZzXVBVc5WH7UfQFVPF7HQUXcn0eQdrAfH6IGeTqIq9ZsEjXjTz4eBxS1JRiKkl4dSV4N17/2wRiX/91ZAaGcJxdSRb80TM+eANmuS+4ELtmNPrHIja88qxLddaajs1zr4AoWyUOFOhBN5PJhyS4PATXREc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749559087; c=relaxed/simple;
	bh=Or2j7o3D1slLZ5D8EJTGF6KLpMpv566+WGN2+SIZWMA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZAbR7d0R2A++oLwhB95Lpa77G3tvjCs8xoX6W3LFrkOqXkqOyyzLPNQDr166quRmo75iSY0sQ3q1E6xKGiTmQZzrvQQ2dv2fzomoAAvz21493RoGmOYgHIRWg1l2cvn2M6A1d6p9HA/xfc8xGequxfXXz3Il5p/Vl04r9nyVfuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=tmir59LZ; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a507e88b0aso4883119f8f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 05:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749559083; x=1750163883; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jIXq3f74XDnDymhzUWUlAdt1JYy6kAW2baobRVnYyes=;
        b=tmir59LZW5I3LrLdjq+8LtZhBS/m6IVE+ujEATimbQTrB0+EoJ0bv0a45/c3T0O5SP
         UrRsPCvkZL0PMeKdnOIoHxeSgGE7nKOKStUfIRmzT85zgdjuci+5liGiuFcoFRCBYBQ1
         bSo0nCuT+u451Gvf19T4vP+lJgyzJdtrRnvX6Nt6NoqO96XB6VeaQdbLMHrL4whX8rhs
         Cl4TWsKmFCg4Kg6rQS7FNp/GGVYM/F0ommYwGbebbksWIg4sQd0p6nFnEvBgZ/1rw7yO
         K+y4BJGygWOORBHB1BcCmHHPFPIGcVfmT5VUCj5GYB1Qmz862GmyO6DwqQSpZQ4HOT34
         YFtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749559083; x=1750163883;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jIXq3f74XDnDymhzUWUlAdt1JYy6kAW2baobRVnYyes=;
        b=uR4+OLfUffV82KSFaBykj2qW7J2q4XHjC1hDa1cTy1te8T8XO5Gwl6sakegrWiYR0l
         oq0h5LtL3lyfMuhp2W9TUk97VlWTGv7dPkMq4iWmBWEdl1T8u+8qEaNfEAT5x1DN0JHF
         tKo0jeh0LKVPGVdoHPW7l3dKyOUMTbRj/42LfhajnXvZzu046XVQ8anG1zJ59kgm+AW+
         Wi48q7al5gCfPdlN2MA+muzzRp/hJbb2eeDzDuN7otb1xeey9JNx6jqp5lsne7ZzVA+3
         YlN7teLy0UJpTN4fWouQRComzn4KvIhnx4HcL6iumRTSk/maQzKHl0sqJnuzy7m4iDH5
         R6wA==
X-Forwarded-Encrypted: i=1; AJvYcCXmHwxu7O4e3wWCirvmnE95yyRDR6kcqCFV9lDE78vpHU38aUWsS6OR8rsd+5nEhABPuLEpncett43dobwY@vger.kernel.org
X-Gm-Message-State: AOJu0YyJGOeG20XURs0b4nfpWes4YRgOMtID7Vr4EWkWOfAqinjA/eOV
	SB2g/0SzuSFR4DTnB7JD7u6Sab1Nn4R99rpiMF1buqsgVpP6VVMv4hNy5NJgq9A6BMI=
X-Gm-Gg: ASbGncvfw8IOhElGPjn3AduhsCnTnSMo+xiHYcB2vrDUXrM7DZ+n1KaVqDaDLgB4Fn6
	Y8+p7MVNZIsIT7WD5kUAHF7pI2YCLRqq0tB22P4cdC8rkexlhB/pfoX/K0baHu3y7OXvryoLE/W
	YrqFbFFLCbq9niilbTS4ry7pqa/ul5nxwdEMGbbGqeiDKGAC6hYQEg7NWx1q9X1oc1V5cRubIYD
	7E3kDNpbQkL++f/81LtDXeKvsk2tnrM1XvbabKXaL9rbp6sDkZnzxTQFAzmNccXP7xLbdcrrm7H
	BjlJzF7AG95C5lTfowMGWWp5NDiYEqqj821EO82TN2yHVhQXvqBgOA==
X-Google-Smtp-Source: AGHT+IF1sjJM5pofo61+rAaAFnyoyxsaF8iXln4c8GMDaLLOLPbSpt71Yyi5+rfZP7JDU4CBDRpaJw==
X-Received: by 2002:a05:6000:2485:b0:3a5:2ec5:35a3 with SMTP id ffacd0b85a97d-3a531ab6deamr14138562f8f.45.1749559082522;
        Tue, 10 Jun 2025 05:38:02 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45213759fb2sm142476805e9.38.2025.06.10.05.38.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:38:02 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 14:37:58 +0200
Subject: [PATCH 2/4] net: dsa: mt7530: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-gpiochip-set-rv-net-v1-2-35668dd1c76f@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1434;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=cOyYyWO13YQfp2ycss27bUpedNvkM8EVvpF8/6G0QtI=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSCcmOJqMpStYT0y///IcwrrF7vPSuHRSTtpq4
 PaUnOoEX12JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEgnJgAKCRARpy6gFHHX
 cvQQEADiW3kFLxHnjktVipyS1lWqpqUs/PRamO2K7EdZ3LEa3oBKMHO7NxO4tn88n4qBcqaRdBS
 xWiPasgM+D2bAKHRiWFubXfcX8+E6kqj1TRRD0tGFRZ8bEw6jxOgvWBLbNc5l+A5Jpam4C/Cxkh
 ytgOcWU/Z8l6HLXy6qB3eD9EzoV44hQuuXTVr15H8weDtiX/TVmFRmjum+EWJv+bEfX3TJgzzeS
 524eckUNGcETJZpSp40yCGaF60AsojrvWQgCiXTQ5yOdZww7qxLekfqfkIf7r25pR0DnoW/2o1Q
 RIXgtjfzUQba3gjji8qomvm6u6O5FzPOBMPXMh/iJvMF1/e4FM0fyjfgV2bhcmR0KO7FsuTMjiJ
 Y7VbZpb/Enp2Aw6IumftClH23TsCcY0qFV4GA5LQfQ0a2s/BmWCp0zigrkmav7dn658IwwjZr4q
 ZnhQ20TD+CkDXUb0rsJDMgPW8pAXgpVc9x6bWLtriVswB67g8A1KznR3Yw589QQWzZthFUfbH+z
 zPvgoMWP1E4fIQeNgF1gpCIBbflteGr54bOzk6OCEeWcX/WmgGIvkSAos+eXzyB88RyuS2TS4fn
 QoJ6wynYzPjm3x6hE+k15YLMKVwy6Ba4BaZuC+25uTEX/eUkL/rDLKbxICdQ/52g0VTHQ1HlDIb
 UZeJjVfo1T2W6gw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/net/dsa/mt7530.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index df213c37b4fe6ab85fc5b01c62297a35b7b6b2ed..e5bed4237ff4c46457b46598f07b65d0daa84ae9 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2112,7 +2112,7 @@ mt7530_gpio_get(struct gpio_chip *gc, unsigned int offset)
 	return !!(mt7530_read(priv, MT7530_LED_GPIO_DATA) & bit);
 }
 
-static void
+static int
 mt7530_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
 {
 	struct mt7530_priv *priv = gpiochip_get_data(gc);
@@ -2122,6 +2122,8 @@ mt7530_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
 		mt7530_set(priv, MT7530_LED_GPIO_DATA, bit);
 	else
 		mt7530_clear(priv, MT7530_LED_GPIO_DATA, bit);
+
+	return 0;
 }
 
 static int
@@ -2185,7 +2187,7 @@ mt7530_setup_gpio(struct mt7530_priv *priv)
 	gc->direction_input = mt7530_gpio_direction_input;
 	gc->direction_output = mt7530_gpio_direction_output;
 	gc->get = mt7530_gpio_get;
-	gc->set = mt7530_gpio_set;
+	gc->set_rv = mt7530_gpio_set;
 	gc->base = -1;
 	gc->ngpio = 15;
 	gc->can_sleep = true;

-- 
2.48.1


