Return-Path: <linux-arm-msm+bounces-74607-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3384EB9A6BF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 17:00:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B9B7E3248F3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 14:58:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51D2E31CA5D;
	Wed, 24 Sep 2025 14:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="rkbIF0wW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B1631C56F
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 14:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758725537; cv=none; b=q/KPZzDdzzhluQWJ0EifUsePuStINyjYSlPIeqJ81Ue+h+GwUboYojM4Lv46vThtBQOYipjf7qR4WBrgo1fJIdGBPMUfpDm2da3oHtsb9804WgIqv3FzaOYJUGFbvYK8h5abzsGINvTTEvS/FomKJqbtrhIfNtEvwVNdZhNiztQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758725537; c=relaxed/simple;
	bh=kA7iX9loqcR1iPNQOHLnQ9pDOo+AVwSl3LLk/F4br8U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VZuwNr8c3mWGsjC9KhbaGdUJr6pVfimko0IUiN2JljjuGJD9se9UE5O1p53oTDLYj7vxFRWNN3CAwdASFD2snH7u8fzYYjHMc3/ASIDe8n+ex49WH/ftSDTyr6cqKlq5VgcasKRHQ81vDINfaMckuGIlQ7GJyRbkCVBRDSUC23Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=rkbIF0wW; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-46d25f99d5aso8006615e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 07:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1758725533; x=1759330333; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ndMaJDazpE5vfGfuGA/DbEp6kihBYbJYnxWQMZaUODQ=;
        b=rkbIF0wWiiVi3XAxja1+YxX81Ry7Rb3TCnWgON2cQ/qp0VfhvoZS0bdOIAqrNtC60t
         s38zVQGwI4FIKdqzHuzD448DP7XYfsIUNzAITNDCdnEyq6VVNr5zGmVbugXuVIpXZ7NO
         fJfmVRdPqDp/V43lq2E8AKMJh6dsyMkk611nxXhbrp9kBUNNdAlf0s3mYSC0p7R4bjer
         Dq0+gki5JGmFw8iAg8498/c7gGR/b6gNhSjwDyQOom6pN5P19lm8Sxip8umjA6wIX1YG
         ciM77BHJa6vqaI/BdbHuDvXBTZVbmkpS9IMIfBtfI8kVM95RRoGK5zA7ZPTlrosffUYW
         bCqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758725533; x=1759330333;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ndMaJDazpE5vfGfuGA/DbEp6kihBYbJYnxWQMZaUODQ=;
        b=ItdZNp1IZHmt1nzvNCg+f9vrSpllQfWxpqGjF24rH0l23gT0SZQndIh7/kbT+I6cQi
         zccCafauCJa/y8WFOh19e7K9VI1JrvVji8VW/ujdcNyb49jTjNK1/4//xpXQwjAJksC2
         kPHhDh3aIcsgPEdyHuykdNCYy04XXnLWT+L4UKxstDiHwmYG94LyeJ92x16onPKrTDNc
         9eE9kvZG/KN6ZPCc8f9apYnYiotvXKSHMdc9aodJx0KZPCIeEwmJyrc86LiFnJSkIeLl
         pJg9Iuv6yyX1RjsWQVZPNaufaXv+MuP6utL5bGleh+Aa9s6sZvtWih9NZ684ItGJqhcI
         E3ww==
X-Forwarded-Encrypted: i=1; AJvYcCVLEDq3oqaz1viEre05OLnoz0nCZ6oC/C0DZGPmgzQT2mNuQAGOKNR+HugJlrDCdYhMkpvYjGJxuYW/1xTR@vger.kernel.org
X-Gm-Message-State: AOJu0Yze6NOhalOPHZitXklUvkkOIGbyfUoC3iu9jmUwDU4G8qc+9zEr
	EmXdPyAi6y/oTRwdhkRB+rRRrRs4N66oyogeSZ6qbISYxGSlq4+irSSskKmr85VTWyQ=
X-Gm-Gg: ASbGncvXewBWmNJNN1GqgRq1IhSHzV23qAxMYLMejrz8bDacGDejUXvsvEx9lZk/S7i
	pXFJs3adRcvGILTSM3ZsS8apTaBHgQfcFIk8fFr5U9TqKaetHxQq+nbXVUoR+qyDnGuW/Od7LTI
	z2xGxVwO3kcD/FL7Y37AAqDcLo7/T3f7h3mo6yMorIPYrICs9YZurBZjwAFso3eTNIyAjRbKILq
	E1Y3VVM1AbZk91pN0bo8v7l5Ge/CSUT2QTIiEhB13FjPj8LqmA/7L5P/NYrfQrzOobdr8LR5onY
	5S96VrUAVTuZ0akAuyDxPqOZD49n6gGTeDoKScku2hnlKr53bwalRzwL5mnhts/Nfn+zgz/S0S8
	GvPanaXWV8gRoVUKCzfsFiebaR+3m
X-Google-Smtp-Source: AGHT+IHNoygF5K6NbFZFn73ylgRAxtpGZVjEv4fnMw43TW4zazr6wr096y7fD1mLuRt7rZlC64ts9g==
X-Received: by 2002:a05:6000:2010:b0:401:ae97:a1ab with SMTP id ffacd0b85a97d-40abe093fdbmr2608816f8f.10.1758725532824;
        Wed, 24 Sep 2025 07:52:12 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:1729:c9b6:7a46:b4a3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ee0fbc7188sm29514750f8f.37.2025.09.24.07.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 07:52:10 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 24 Sep 2025 16:51:37 +0200
Subject: [PATCH RFC 9/9] ASoC: wsa883x: drop GPIOD_FLAGS_BIT_NONEXCLUSIVE
 flag from GPIO lookup
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-gpio-shared-v1-9-775e7efeb1a3@linaro.org>
References: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
In-Reply-To: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
To: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Andy Shevchenko <andy@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1242;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=xxM5DFs0HrWkdhU2lVlfFzKEyxjnJBr+LeYHk9Z5T9I=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo1AWGsIAdL4UJeiMya3ALuTFpKjTN7aiOFeRzH
 +UVHZT5JrCJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaNQFhgAKCRARpy6gFHHX
 cphcEACKy+MOIGJFHlexGtoihY6/OLkWdmrBXTUoO645qSw8NQvk7z2y3yUjzvjBKr9hX81y36k
 bi2ATgazhH2Y1qvRZLbCIyviBSlA/Ng/tlMWhAih3C07fcUG4xSkIpQmEvG11WfZbM1/JEdat4H
 oD3+pxKwrYyGakphDygC2/1nRA6QdzY6faa2Z6Q1DULdAyY6UoySb7D4odXllJNuZyJCCtiqxWE
 ubY3EMGOgrUzkIo5o17rtWlh6q+lU86nd59+duDIMpp6jgsUk/A1crptrmnhptqlh4HqNaUyHSS
 rS+ejjtDOTT46Z1nSE5u86Pg8+VJOjulDbM+epJg7NwA8n/Nz4uSLBbYABdnCaq3kG4s4OYHoGW
 2EUoRTdUaKhnQOn2B/C8/W6zEkf+y6PjFboefj7wsslTNN7vlPo4vYmHA7jdCnDzWs4cW3AEdOZ
 sMMbRrfmlrfPatsBaEL+HZH71qMXTu/zBucKIg58ZckX9wKRAS+FWVtm04JHuuqGgS1XtkMwu4p
 Szr//k1rQp23kajM4IU5f9EUL1JLmpeoiDQEjUKcS1u0OiMeqkC+5RrMHwKd4uP6zPFkpkaQcLQ
 VSogCIlRTTQ4/NIBHy7HHxQD5Ehky/V5JKlAuCEStvEZ/XxunMEiLV0qz5adX0fh3iAMdhZ8igI
 MtfsM1m9NuzFvHw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This driver is only used on Qualcomm platforms which now select
HAVE_SHARED_GPIOS so this flag can be dropped.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 sound/soc/codecs/wsa883x.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
index ca4520ade79aa2c9377449e29cdd33e9e8dd28c5..ba60b4de6cab7740cd8aa70c89f6e03e1dc2dd12 100644
--- a/sound/soc/codecs/wsa883x.c
+++ b/sound/soc/codecs/wsa883x.c
@@ -1572,13 +1572,10 @@ static int wsa883x_get_reset(struct device *dev, struct wsa883x_priv *wsa883x)
 	if (IS_ERR(wsa883x->sd_reset))
 		return dev_err_probe(dev, PTR_ERR(wsa883x->sd_reset),
 				     "Failed to get reset\n");
-	/*
-	 * if sd_reset: NULL, so use the backwards compatible way for powerdown-gpios,
-	 * which does not handle sharing GPIO properly.
-	 */
+
+	 /* if sd_reset: NULL, so use the backwards compatible way for powerdown-gpios */
 	if (!wsa883x->sd_reset) {
 		wsa883x->sd_n = devm_gpiod_get_optional(dev, "powerdown",
-							GPIOD_FLAGS_BIT_NONEXCLUSIVE |
 							GPIOD_OUT_HIGH);
 		if (IS_ERR(wsa883x->sd_n))
 			return dev_err_probe(dev, PTR_ERR(wsa883x->sd_n),

-- 
2.48.1


