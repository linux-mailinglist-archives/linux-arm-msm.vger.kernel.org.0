Return-Path: <linux-arm-msm+bounces-53801-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3A0A83F15
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 11:40:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BCC7B8A42C2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 09:35:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19FD8267701;
	Thu, 10 Apr 2025 09:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="d8TeUlbU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35EF8266B5B
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 09:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744277707; cv=none; b=rBeOCzOHw3AoVd/ms/lF/Y5/ARxby52yPL3rGFoORh6DcOwS1LAQJNCP3e2DPwWgV6GPCVwiPl/WheYCyRGFsFm9KwBCSwoYN9RhfSV5r5y9xEpUlKK+KUqMbCg3WqlF/aEwaQP4EwuuCcs/bR7IVjCWLjfO2SAyeTTyV59rXdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744277707; c=relaxed/simple;
	bh=DZ/xb93rJ3XNbgASkJ7xfZpeXZhU7bMWq3R9qJtV1u0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TFcCX9FaIEvpHEPRiJEjviPcIt6hVIewhiN4YwRIR6k1epsOcPaH+yCyUqvrlGeA1hRJCMI+8p7JNdSmraTiKIQt9+GM8p7+h37Sc4S0nSX7YHBSztKyCa0Uou6d+B7W5MID7P4R9OWKfDSmRQux94trnIaZliCZfFjMRlHo4P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=d8TeUlbU; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3913d129c1aso425126f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 02:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744277702; x=1744882502; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vKc4ni2bYp396pJgjc+ApP+2GPXywPdKnppMH0GYZOE=;
        b=d8TeUlbULOYZG0iOzWv4jpBu6k+lOYUtC16FIxGD5KjE3IPxI9UbathgToemTK1U4A
         BwXIV6ANYgRKXackzZkB3YUoPhcH3BiCXAyGYiL70hhXtoWYjVsurh7IdqG7PhK1WhZE
         vLG3fqlseXjn5ZROSavFBbDwE8qCSwOT9SS8ZP8Jxn6zJBO4IbzIEFY1VvyTlkEWbIfM
         yl1hAA6Xyx6fvf1UHy7A944H+HOzlZ8h8pnB5gFRugdlIeV8ZGdCYUr6l9G2d9X/OJoh
         5QKomVNdFGFGY9fN/ndkr3y8uNuDqWwxAe7HyJ1/zZh0t0VGYk/RcyFSGf5i+cMlq0UF
         xnQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744277702; x=1744882502;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vKc4ni2bYp396pJgjc+ApP+2GPXywPdKnppMH0GYZOE=;
        b=twtAs3GNFFVkbzBO3umzHYjzvoHWpDb6QbD0RNBo7W7Gx5KRSKcNlQj8wqC+4wqZmO
         /wjOpAnj055C23NdFvcpqT7NGrAI1d4PAQuNj0zQxpZrPth3daQOzU6jAUdOy+CnSf7q
         uXSZYs1KzF04qlHNDI+iQ3GVvXscGXqjtrwwCJYfKOWm9kR1v+SpPe4HI588+OIuHn/y
         +EO6XBkZL3e8T9WYXjSvkzLlo5RhAd8xtjh65LE562GIxV8tSL+8aviUicOIB76E+vC8
         /5XZzVYdOq1F13qy8S/iKsRAdT5CKloz0k4A3LH9ubYVZrrPnA12NKbLYl6NgYi7tQ2I
         q7JA==
X-Gm-Message-State: AOJu0YxQtRlddjYkMAxB7AomEXiD+nhWIZlIy7UkIgn43OrbTenaOO16
	bBvmxs7U1Yn/1nz8LXb75ek1HPoDzrKuXVc64CD6FVB2hfRqw5kHFlcle6kbxS46eC6ALn90g16
	xDMM=
X-Gm-Gg: ASbGncvwnbkHTeglITnJvrJ32pYOvGmBopL1DtHBAFjPKjVAsjfrWcfk48MfNRyDQ6t
	Ga9atghLOz6JtNcvbCPizupyac7x0gDwXcoXvypva61d5YH2kJxSVtsezE7O26YkLil+NpN6Y9o
	KbqaiuJ2apYs9pSZo9FmXT5uRQpZXVPhIC8zVb4etn8K8UdxjHj8ToCZLETK0Ozx+s1T0qxSSQb
	I9Zbdq+oqZ+dk1BlUBzbhyicbTRjdVGG3qjMY4ifkUpfwjn5zowEwaog4y/02lziOFfUbKl8ncw
	GT7fOVZlkJ/M/kfn4d5u3wdV31Zavs9HhA==
X-Google-Smtp-Source: AGHT+IF9CCOYu0sZ4EtoBET0PxviFQ0BAKr/anVSOO4WNE5lPQ4fauspuBSv5FegePef7LtmJ26IhA==
X-Received: by 2002:a05:6000:1acb:b0:39c:12ce:1112 with SMTP id ffacd0b85a97d-39d8f4c9638mr1721576f8f.21.1744277702477;
        Thu, 10 Apr 2025 02:35:02 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:7c4f:f9d1:94e0:53f8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f206264a1sm49698435e9.9.2025.04.10.02.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 02:35:01 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 10 Apr 2025 11:34:43 +0200
Subject: [PATCH 1/6] pinctrl: qcom: lpass-lpi: use new GPIO line value
 setter callbacks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-gpiochip-set-rv-pinctrl-qcom-v1-1-6a6891338aae@linaro.org>
References: <20250410-gpiochip-set-rv-pinctrl-qcom-v1-0-6a6891338aae@linaro.org>
In-Reply-To: <20250410-gpiochip-set-rv-pinctrl-qcom-v1-0-6a6891338aae@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1522;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=8O4bilVXxN82WosLGq1PiA2eweBBlC7Bp7cOdXvJsAE=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn95DDStxdfGuVBR3XOsSKVkN/z/7yJgXF4ro6N
 rUvBcL81jqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/eQwwAKCRARpy6gFHHX
 cpQWD/4884nUwImCE01ziWTugyxvx/Vel3SSsEo6GAKVf87PvRQRixhIciKdlPSk709Pm06Ue2R
 E2ochgWHNoV7YW3VWQJ0hgv3zrRfKGEcVZ37X/xeknxR/K2lB14J1bRunyB331PR5P0djPtadT7
 Wb2MTOdSYuFSUtMLJnHEXNRvtKEcrFjLi6B/zuNR2wH0pg3d3t2mpz/vTaS5jOAX0bDbI934NeS
 6KnhGwGiE0PUFjyN5O5nRpClZI5kQMMRrZxNRX/OTxwctPMrDDT+EZt6Fqv2inHVpR4QXfokDKL
 MS2ns96W1qJ2uByniuqRFyQekqckQxA3nxEa4nFRdh58jmIP4va5ZBhtyISewo0kbBDCyKQ3ELV
 jsOvDx+UbRA8kVGTxuK/iKAveJ45RcDUAv+l/Yv/BdFeIob4Nx9XbmvoKIXPFIZO4vLQromhvRU
 UFpR1p/AQSGwgiLtpY5rXobnwRi5FwunR/Qn06NE0em83JNQyS28DomKMEw+YdcnvoWImzcidt7
 0PHyxr/4ZaU5LlJ2zxyFau7N5o1gy4/REdwz4G6ivNgpmh4pKokNm0gREPsy0eTey2UmJu+fH4g
 F2JDIOPZC5+eyjVoJHPRhcEdP9hllwUNcsBFjwKsMzbXikINeZMqvtzqMOTeYNJ1gc1dRY2vhgW
 ReVgBFqFT1kNL0A==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
index 7366aba5a199..57fefeb603f0 100644
--- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
@@ -327,14 +327,14 @@ static int lpi_gpio_get(struct gpio_chip *chip, unsigned int pin)
 		LPI_GPIO_VALUE_IN_MASK;
 }
 
-static void lpi_gpio_set(struct gpio_chip *chip, unsigned int pin, int value)
+static int lpi_gpio_set(struct gpio_chip *chip, unsigned int pin, int value)
 {
 	struct lpi_pinctrl *state = gpiochip_get_data(chip);
 	unsigned long config;
 
 	config = pinconf_to_config_packed(PIN_CONFIG_OUTPUT, value);
 
-	lpi_config_set(state->ctrl, pin, &config, 1);
+	return lpi_config_set(state->ctrl, pin, &config, 1);
 }
 
 #ifdef CONFIG_DEBUG_FS
@@ -398,7 +398,7 @@ static const struct gpio_chip lpi_gpio_template = {
 	.direction_input	= lpi_gpio_direction_input,
 	.direction_output	= lpi_gpio_direction_output,
 	.get			= lpi_gpio_get,
-	.set			= lpi_gpio_set,
+	.set_rv			= lpi_gpio_set,
 	.request		= gpiochip_generic_request,
 	.free			= gpiochip_generic_free,
 	.dbg_show		= lpi_gpio_dbg_show,

-- 
2.45.2


