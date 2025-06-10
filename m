Return-Path: <linux-arm-msm+bounces-60780-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B6CAD3718
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 14:47:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 517E5174ACE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 12:46:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02B532BFC80;
	Tue, 10 Jun 2025 12:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ULbB1EY1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B464E2BEC59
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 12:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749559088; cv=none; b=AduqWvZW8avSIJUnZOE+9TfSaHDApfaPBLnlEWjXpcI2C4423VSxHAvzYx/DiacRJCNn5xoaiwZc7epGlp9yYSmExvjKPiBGq3QQE6unO/GYdEcHZQHukEmpz6c9qJFEgmPKBf3Q1BHXnpNt6gBnn5tuA4CX6VfnB5rzFmHIF30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749559088; c=relaxed/simple;
	bh=GvgMWLo3v09W5wB7l9cl0mqQY3DSJ1MedVvejheMqM8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k7bqomNwYsSJvkAh4V+wgJuUj3DhLlOAYxGggJCZ0LD5vDIM567WEcc6QFF30OS50xby3Cuu8omZgFgcdMBrZT6mxiNQ0M4xIZf3ZwH84FJeX5PVswICHli0o/edjdp/2sJlXCL+kwOtBEb2koCCepQ0Wba6ccg/jITTPRnvLCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ULbB1EY1; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-451e2f0d9c2so42063765e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 05:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749559085; x=1750163885; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XTr0inICqzQ40JhWVH9IpfJkMwVhTdLoWQ78V1Jjb84=;
        b=ULbB1EY1UY1YUJqE2VUQQ6mPaNt33ilLpGKfO7C5BVhV/P/A1BTq5LqaFYihLJXo2s
         8Ab6qP4uZFN1puLhIUesqMkjluzpl1LFlyBQ0KxL8RX/HoMqTFSdQ0Kpt+lELZOunCHS
         +910ApCOo8pKWEF1yT/MKjuh/+MdCH4eu3uBam7q9Z5Ap9ajakR+f0X9k1cBSCdyOUuh
         NK6XqX7GxZtfnL0o7mGJzbeoQxwQTiOUijOW07c8AeDfEZm3nMl8/ejn05ni5rR5NjOk
         7tb/50EAhqh39HhtXPZQcySDGw6BvXnbwDgDM6Ix6gkNJQh4AhNmmm4WAUngdddyWdPZ
         bmxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749559085; x=1750163885;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XTr0inICqzQ40JhWVH9IpfJkMwVhTdLoWQ78V1Jjb84=;
        b=lgCb3dEwCTS6rmnjH5C1Fym0U9sM5EOEMAjAv80evs7UrjtmFsnS8jGl3ttmTy4j/c
         Gaqp1fP4YN+2B+hgLueJYP8CuVTqA8J01kWbqMxol5BGHLpHWlyrU5+Uvgz8kqZBD3To
         33jI/bb5xPdZLPIoc4RFG9qSku9jSNYyPTPS21xczUot20nSA2YDrtmhjl8qXjmta6BS
         Tufbuaztz5Q4o6chh/ld3iOm48itA7gEV0+IOKfl2tr9Bk2/FjS3saLIk8wNhH9O/Oep
         cx8ySDR5DtgMG3DZezusqdpDrdz5o/k45JdaDeYfNo1j7/KVzot+z8dXhBxS6rCJElBK
         FwJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFp1woOyvfGcDwmHeJ4IoMA23Iz6t5BTXNYQQXXQZX4dVhMkoXdpTsBqlnN3Jo9GG7A/1H1p8/HC2E0/NB@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5zMP13fWLcrBJ9EuSIC+foQZnavcSwZ552HTO9hC6PBQy5XaA
	yYS8B3uSwqmvDUi7JybS7NoJoXwtGyAcckuls70NpO43rFEuGiYN0eOiA0PxWNOcggU=
X-Gm-Gg: ASbGncsL1LPDoEE5vQAxXjHeyrkQUIOe7ciE86Q5Ns2lu5Wbok8C5dDfL6csisFH3wZ
	oULCUzPOeAJf8l2fspG7LWuCcZThKx5smUJHOlb9qBxAr+0137aMBBcinqJjIok3b5KTSpoaiul
	NGS8UXLfiKG68pjCJk5kBHo3k5iwzG4jnoAk/EQDHoRdN0jBpx1sQvNDyHJSEYklIwBsvXpaZrI
	/rHYavrskqEmwGrF8lH5g2xeNaiDvKPWsbg2VQY72F6zOfYJMkY9aiAdb6maGC+sk4yc7rXGSBF
	/LuX62ZQxm8EpViBBaL4wlyVPpp/dJiKAft59HNmfO3MRZXPllAZvde2AZmDJBli
X-Google-Smtp-Source: AGHT+IHzFp5JvTZ7l1OpOejBOEwCS7yH077Wpi4SDtJY3ulJlf0B+102s2G4CnPyWgM17PCQBMBlxQ==
X-Received: by 2002:a05:600c:3ba6:b0:43d:fa5f:7d30 with SMTP id 5b1f17b1804b1-4531d00c453mr31747955e9.16.1749559084818;
        Tue, 10 Jun 2025 05:38:04 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45213759fb2sm142476805e9.38.2025.06.10.05.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:38:04 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 14:38:00 +0200
Subject: [PATCH 4/4] net: phy: qca807x: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-gpiochip-set-rv-net-v1-4-35668dd1c76f@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1888;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=MAnjKHaMoYF5O3f5BcIOHcEhF8AXjM+PNGzo8Pp9cg8=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSCcnC1sEIoktf6UHY2MqMzPGNw9DXFVujb7Kq
 dZR+XEf6QGJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEgnJwAKCRARpy6gFHHX
 csmrD/99f0lIH+W3DfmoJQoGq0LOeqm5buMf8Ch/sw2VizC+NzZBIJnfGPUt6/dMjtzjqFKZdUb
 PqOQGMYAyle/pWuVoS4rqbX6Y6Ct8op5TOVgYw9OJ+Vm2+tpdkJ9O0RGKgPLqidx7WxmDle7eCD
 Ce0FNDGVTnCvEjLlAbUVrnLvH5xp4/5cyi3oDa8DofuWMhbtpowOpcSUHjjAYgn8/lqKl0yz7NK
 g4+uyOJHPYWep1Kr/L1SrDH9reI0B4lnK0N4qyTTJJ1df0JoWw8ZludlKXfa08juZk3BWprkwLT
 Gsri56yEFWJrig1ad/dfL2ME7p4cayZQ2InlJ2uWZbiGhGJwe5XoNfi2bCo45uqO+1F7Nnp8KAA
 3Zjr61t3T6+FauqS5RAzKMjnBDsccpotbDB0oBQjUG1EdBgC8TvAxyy56FujRh8nkIBU1WpJLrz
 TfBdZ+mmrfbnvrNsiz/KAq7yaVOLRltW1nefhvGjP09tnqCEe0vQCK1ENpBKhTb8QoFG7b0x+xt
 AyD2DICy5a6mUUWRrlXQAVlnS2BJ+f8s8pHm+EWr5f52gyithh1/FwFo3LJfiDJtEbzo6+XAer7
 wnx7GBla5W1pPXIf9AI9UPcP0lHc6ECfA8NLILvEcgdNI1UdotkBPEEyG5PhsMMgZa+INZbIV7j
 Sm+SNOSFlvaCYpA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/net/phy/qcom/qca807x.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/net/phy/qcom/qca807x.c b/drivers/net/phy/qcom/qca807x.c
index 1af6b5ead74bf615ad155e396b0ecc6fe5636e8c..bc480710c2bd27d621dad3b5595f0a292a4c72c1 100644
--- a/drivers/net/phy/qcom/qca807x.c
+++ b/drivers/net/phy/qcom/qca807x.c
@@ -377,7 +377,7 @@ static int qca807x_gpio_get(struct gpio_chip *gc, unsigned int offset)
 	return FIELD_GET(QCA807X_GPIO_FORCE_MODE_MASK, val);
 }
 
-static void qca807x_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
+static int qca807x_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
 {
 	struct qca807x_gpio_priv *priv = gpiochip_get_data(gc);
 	u16 reg;
@@ -390,14 +390,12 @@ static void qca807x_gpio_set(struct gpio_chip *gc, unsigned int offset, int valu
 	val |= QCA807X_GPIO_FORCE_EN;
 	val |= FIELD_PREP(QCA807X_GPIO_FORCE_MODE_MASK, value);
 
-	phy_write_mmd(priv->phy, MDIO_MMD_AN, reg, val);
+	return phy_write_mmd(priv->phy, MDIO_MMD_AN, reg, val);
 }
 
 static int qca807x_gpio_dir_out(struct gpio_chip *gc, unsigned int offset, int value)
 {
-	qca807x_gpio_set(gc, offset, value);
-
-	return 0;
+	return qca807x_gpio_set(gc, offset, value);
 }
 
 static int qca807x_gpio(struct phy_device *phydev)
@@ -425,7 +423,7 @@ static int qca807x_gpio(struct phy_device *phydev)
 	gc->get_direction = qca807x_gpio_get_direction;
 	gc->direction_output = qca807x_gpio_dir_out;
 	gc->get = qca807x_gpio_get;
-	gc->set = qca807x_gpio_set;
+	gc->set_rv = qca807x_gpio_set;
 
 	return devm_gpiochip_add_data(dev, gc, priv);
 }

-- 
2.48.1


