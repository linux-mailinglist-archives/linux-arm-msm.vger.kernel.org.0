Return-Path: <linux-arm-msm+bounces-79424-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3F5C19FE9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 12:25:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8A176504864
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 11:22:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3F6A336EC1;
	Wed, 29 Oct 2025 11:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="wHfsyfBC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6FB43346A2
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 11:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761736872; cv=none; b=PCd6CDI4PBN5jyKAKxQCXcfUE4DPmhkG737KPxkm1moEntjJrkWRbZn7xYLSBlnyNKl766S6zpFCbTCZ/VKzW0ljP7jGdEEbKQ29JMgffyJA0EnK8pVK3gozKupcojU8MhPxO0Xltmq/vDk7umL4705HnYjFAu9iLco+SiTguwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761736872; c=relaxed/simple;
	bh=MVlKPIvAL/e9P6rRlyzXBZOIkV9VrbynrQLdkfSFr3I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d/IHcZAQVdTJ4iQoj831cwpiG92Jk374+NSp3LRY6Hfq1Km6iP1HYX7WfVKLSTUMvR98QwXe8ruaFtTdxJ9B5nfNMs1EI6aY5WBdvRfu0TLNN29lxkUoQh9ReOafyR9Da7sW7gz0G8WZW7XTdG1PIaOOggGJRy/O1jzE9Ly+YsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=wHfsyfBC; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-475dbc3c9efso32627005e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 04:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761736868; x=1762341668; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OwyOQFxKD6v8+Vijfrpb6af7Tgda7juGJv7xRyBxXBI=;
        b=wHfsyfBCn5RKLEH2usq1Hfh5pPvEMXZXNzOAZWZE4jagDmhnCI1YdkGgfjV+Fo4elr
         ZYvdVWMLlQPqbMyChkypygDzvbke19XP+T3FUX+OHuUxLIhOTcyO3OCsN2kIXJWkwlOH
         BFw9x+X0mhF2BMi2a64y9LP2XIc6bQBJHbHn1XQTGI4w4MyjtCh425C/49NpwMaZ4KLl
         yWA1GJFNRemKq0h1VBVLpCwetwEiJA3poffMA3sGJZjvmp+DumZ6AkBQika199s+vt13
         z/SMZtdUOAIgl8qRoBSi5Uao3RECx4zkcFxrefEzr5m0cUHksV6dIO8e0NppKPMVvl4m
         1MJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761736868; x=1762341668;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OwyOQFxKD6v8+Vijfrpb6af7Tgda7juGJv7xRyBxXBI=;
        b=U6trtTVWbzYXiI/TbiEA/Jw+lwtMhSXKcWagFWUhxN/rF89DVyqtHRZP/4fUgfcqFz
         qtSV3Czowc5eU5gLIPFOZzqik8Gxv+OkUeWKl0dIQJ5DJdqvxsW//fDubGyxQ76WPmA5
         Kbu42tWr8XNSiITDPs8lhulYGBxJ/JFEs8YLBv4Y/yUJjYHi/s9yqnFboenwWmklfEG1
         nIFrR+09s4vUbRwvFrIm822mUbro0b3QsJJJ2ZVhgDtTioSdLTRou0fNr98EzctK9gUm
         t//LV8YbqQ+YPsSu20aDxwvFnY/ft0S7d+25coAG9/kkTYpANd6R6OJCTfLG3KN/VhMt
         npwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWe1BZYGqoQJGHjUP3bk8GXG6ayKcqR2hxqlXXidHCk2mH/NtdAc8GDMRIPRgASnkjLiDAwMwYh3mmVuo8b@vger.kernel.org
X-Gm-Message-State: AOJu0YwlCmOe2NcAI99xH1DnbDyzFMzODqpGJraKOjTb7p2oaW56w6JV
	Z4KojEa4nzE0Ehr0Eqz5IVXyMkGtqR67GagGpPp8L/gREDFLVy9c6cSG3jivvu2+EwE=
X-Gm-Gg: ASbGnctVZbjFwKA2M/whUMzfMM9O+f7Aey2zLWuVbmNnyXVK0+Z4B+xyuzsAoI32mVQ
	1C7DbrTKDjOsL6lc+OGsxVW9KpQMGAnPulSGqoYZAPPvGOrzjYlKxcVpCT65o8BcUE5lddlfnCt
	vIP2WEvggIjVtntMLG1qt0QUJFubUMLttZtXAuDpGzHikvcVHwn8XvbLY1LBcBVa00owCErgJeK
	RprGlzSFrMp5ovxBHwO5YyfcI3Ss2X/HCd7EDgR8tFwHlMnmUTh+RZnnhu8o9V9i/1JvY9EoK4a
	GJU5RAIquDUSBLhmmExhUlN9ePMRxeOqAT2SBX9SoDvsdSKawyOBwFIA+x7kdAR9iMYPDmRBH6Z
	2WshLfdO+Ta3lc+UFk5a2ZzOrnUfzKL/9NB9LEKp/J7cOEsdwIiPm68ApBKIkfTm3I1G19A==
X-Google-Smtp-Source: AGHT+IFIp7+UTDG8Mo+34fKN/ODFuhtxQqO8HkLZOExm++avTsEPa/O05hlDIAIwB6f3V1lsHOMS/A==
X-Received: by 2002:a05:6000:3107:b0:427:370:20a3 with SMTP id ffacd0b85a97d-429aefbdc04mr2206317f8f.38.1761736867751;
        Wed, 29 Oct 2025 04:21:07 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:69f2:5f2d:9ffc:a805])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952df682sm25657486f8f.43.2025.10.29.04.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 04:21:06 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 29 Oct 2025 12:20:42 +0100
Subject: [PATCH v3 06/10] gpio: provide gpiod_is_shared()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-gpio-shared-v3-6-71c568acf47c@linaro.org>
References: <20251029-gpio-shared-v3-0-71c568acf47c@linaro.org>
In-Reply-To: <20251029-gpio-shared-v3-0-71c568acf47c@linaro.org>
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
 Takashi Iwai <tiwai@suse.com>, Alexey Klimov <alexey.klimov@linaro.org>
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4764;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=SHc2LMOdJGlhdyjQkFVMTs07D3cYT7+feKhUydYkGmE=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBpAfiW0Na3G1N5t7fsKNsK2pUTfvrIgTuAwZdX6
 A4Q9KaaezWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaQH4lgAKCRARpy6gFHHX
 ckPbEACjlYkF7MWG/wEbiOP6H5JvyALh/B9OFrKmPM1LM/UFQaXskpAsIWILwlcCFQjmfYb/OK5
 f0auh39mZpVSR2cHXl+2KYaEIZ4xmlTl1UATnRKrCt5QtWCGuLtwG5i/O/EFvrPpei3vJFFiO1R
 EPF2Li4Kd2y5OA0QrCf3ssPORs9Hl5e/QUvvSwCL/m8mfJ2AN3DZ13SVezWk5O3jGLPAYXEwO6p
 tCkFlhEvpIDQ5m1FuzjcphPFgK+NZsTnr3pgxjnEF3morSktQxFraqnL+McdZTMJiWaawgXw1Vo
 QgTg3JAOlq6kgoh4NrdYAlg7mboV3GtNssgRbqENq5p5fDK4LIp0xkfz1Zda18Qqe4ucpr/Pf1z
 XmLT5hl3Ee8hkY2Iu/zXhK618YH3gerDRmED6d/XCL7TWkEq/UvTpXmNWOKlxjTZ2a2Y3kx9xqs
 gTFnUcpokMmLC/eFwEcQIT6b+GClp+ufnH/l94/28rSRZt4QNNkULCrOSNMKLX+t+eA//Chxyfg
 GD9dFaGpJ7aQAk9OHImV+xhowrQPJ3ZVhjkmou5X6XoVqt8KxP9s5MXJDFOoF7kquHTIUqIZZ0j
 2FwjrM28Mg70hu4fkzW7MXfppWUYje8SFOGvWWDIj/I5yYNrugag4ZHP3U3mTnZXrUM4WHo62uO
 lr9QzzS3hxNQ5Dg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Provide an interface allowing consumers to check if a GPIO descriptor
represents a GPIO that can potentially be shared by multiple consumers
at the same time. This is exposed to allow subsystems that already
work around the limitations of the current non-exclusive GPIO handling
in some ways, to gradually convert to relying on the new shared GPIO
feature of GPIOLIB.

Extend the gpiolib-shared module to mark the GPIO shared proxy
descriptors with a flag checked by the new interface.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-shared.c | 18 ++++++++++++++++++
 drivers/gpio/gpiolib.c        | 20 ++++++++++++++++++++
 drivers/gpio/gpiolib.h        |  1 +
 include/linux/gpio/consumer.h |  9 +++++++++
 4 files changed, 48 insertions(+)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index 56b9b03cbb6dbcdf095a656fc36ff321770035da..c22eaf05eef23a7f5f111708c3db9412c4c30231 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -314,6 +314,24 @@ int gpio_device_setup_shared(struct gpio_device *gdev)
 
 	guard(mutex)(&gpio_shared_lock);
 
+	list_for_each_entry(entry, &gpio_shared_list, list) {
+		list_for_each_entry(ref, &entry->refs, list) {
+			if (gdev->dev.parent == &ref->adev.dev) {
+				/*
+				 * This is a shared GPIO proxy. Mark its
+				 * descriptor as such and return here.
+				 */
+				__set_bit(GPIOD_FLAG_SHARED_PROXY,
+					  &gdev->descs[0].flags);
+				return 0;
+			}
+		}
+	}
+
+	/*
+	 * This is not a shared GPIO proxy but it still may be the device
+	 * exposing shared pins. Find them and create the proxy devices.
+	 */
 	list_for_each_entry(entry, &gpio_shared_list, list) {
 		if (!device_match_fwnode(&gdev->dev, entry->fwnode))
 			continue;
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index c0c0e9370f150c340a7c79dc03c5afec64a440f4..fb4311d41161051dfd3c996b6e8e9e8556b97cbc 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -3997,6 +3997,26 @@ int gpiod_set_consumer_name(struct gpio_desc *desc, const char *name)
 }
 EXPORT_SYMBOL_GPL(gpiod_set_consumer_name);
 
+/**
+ * gpiod_is_shared() - check if this GPIO can be shared by multiple consumers
+ * @desc: GPIO to inspect
+ *
+ * Returns:
+ * True if this GPIO can be shared by multiple consumers at once. False if it's
+ * a regular, exclusive GPIO.
+ *
+ * Note:
+ * This function returning true does not mean that this GPIO is currently being
+ * shared. It means the GPIO core has registered the fact that the firmware
+ * configuration indicates that it can be shared by multiple consumers and is
+ * in charge of arbitrating the access.
+ */
+bool gpiod_is_shared(const struct gpio_desc *desc)
+{
+	return test_bit(GPIOD_FLAG_SHARED_PROXY, &desc->flags);
+}
+EXPORT_SYMBOL_GPL(gpiod_is_shared);
+
 /**
  * gpiod_to_irq() - return the IRQ corresponding to a GPIO
  * @desc: gpio whose IRQ will be returned (already requested)
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index c9de4bb10584206f4888c0f28468762a3680aae6..77f6f2936dc263a67b31a38799a841128a57603a 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -205,6 +205,7 @@ struct gpio_desc {
 #define GPIOD_FLAG_EVENT_CLOCK_REALTIME	18 /* GPIO CDEV reports REALTIME timestamps in events */
 #define GPIOD_FLAG_EVENT_CLOCK_HTE	19 /* GPIO CDEV reports hardware timestamps in events */
 #define GPIOD_FLAG_SHARED		20 /* GPIO is shared by multiple consumers */
+#define GPIOD_FLAG_SHARED_PROXY		21 /* GPIO is a virtual proxy to a physically shared pin. */
 
 	/* Connection label */
 	struct gpio_desc_label __rcu *label;
diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index 994d46874d560416175c9099e18180237839bd4c..cafeb7a40ad1c25aeb7deaf598410d5f2f004a82 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -167,6 +167,8 @@ int gpiod_cansleep(const struct gpio_desc *desc);
 int gpiod_to_irq(const struct gpio_desc *desc);
 int gpiod_set_consumer_name(struct gpio_desc *desc, const char *name);
 
+bool gpiod_is_shared(const struct gpio_desc *desc);
+
 /* Convert between the old gpio_ and new gpiod_ interfaces */
 struct gpio_desc *gpio_to_desc(unsigned gpio);
 int desc_to_gpio(const struct gpio_desc *desc);
@@ -522,6 +524,13 @@ static inline int gpiod_set_consumer_name(struct gpio_desc *desc,
 	return -EINVAL;
 }
 
+static inline bool gpiod_is_shared(const struct gpio_desc *desc)
+{
+	/* GPIO can never have been requested */
+	WARN_ON(desc);
+	return false;
+}
+
 static inline struct gpio_desc *gpio_to_desc(unsigned gpio)
 {
 	return NULL;

-- 
2.48.1


