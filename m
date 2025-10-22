Return-Path: <linux-arm-msm+bounces-78331-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C7DBFC261
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 15:29:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DA19B5605EB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 13:14:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80E3734B198;
	Wed, 22 Oct 2025 13:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="l2ueCF4X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1690834A795
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 13:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761138678; cv=none; b=tCl93JZYVFmiUmoian4U/dp5TqxutmDl/qkZm45omKYar2zmYufvrdTQwfmSJ6B/bzp9kN9gyYzA/UAKa41BTDh9pfOu3zP79ue2xXt2eDrib4EtJFYqD2qqdlNKQlu1BAjv+i/ck8vIDZ7oOGWCk0yS5XE01f4jRJE5/iM1BwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761138678; c=relaxed/simple;
	bh=o3i7hzZy+G5XVTT/nrasUIRd9dxxVmZhC6vwJZuaTAA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y7GKl7LSFu1+VVLwnoMNrgB/igEvW+CqGyqHPhhv5L/ZkwXOH7d0QP7OOrQlEEQG7edV3UPo0KROUbKOkOK/eNez1xjGzsK3jeskyj1nHo/LEpwGCXlCW4iy/0T6MobNiR2rTvPAjySMej7PlUouGWUrv4FvujSx5NU4ro4+L64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=l2ueCF4X; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4711825a02bso45775235e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 06:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761138673; x=1761743473; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NmyJwyGotfh3JyXhmJS/1rlzs+tHyJOuYkq2PFxtZmQ=;
        b=l2ueCF4XM9Aqpc5JXNE5pziPjP4cP77Evs/POq4tQJMwgSUIY/ELByr+58FVS9THac
         huwrNH9XkVNwYUAG3i33KrQ4ozEJSZbQdoRcLPxrYp2HkEo+FZ7uuxQgfYRXnUe1wfBK
         uQ+Ik+ob8AzUkF8k4jeoE6xOrdo32IZR4WwlKkIWVgKs7qVykoTpnGV6RG/PZD7eRcpM
         0Zw6JinzH2hgyrGP9MDRSSRxEJtPPVX35LOw4ZMqzbpZLIiyLiOGcii4NWf0B8EQTFJD
         InLWa/7VWiRLyWQe3L9sXa4zEAx4U0HHHLd1J03XQhvRadRrnFXR6no6ywU5/1p2dmkv
         vSnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761138673; x=1761743473;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NmyJwyGotfh3JyXhmJS/1rlzs+tHyJOuYkq2PFxtZmQ=;
        b=QDN1gvMXMaRSOVLSZN98+2TZN5hx5fNTunwAu6GqrzlG404oeZMNHdmubmGHiP1Ea8
         tzwmcGQ7l2+e2zy+BmrCmUg2Gise4Rp5WpXj9OOsGZhZPC76uv9QyFBoDMWKRzXhoi5M
         aHxgeQwq/UxH3FsCoQ2wT2dAaH2Dp/VfzUreP+UwRbSoxwnL3UKa4irSw/sl6IopnEBg
         JvqWiVZ7H3Zv87ixX3v0A0Sg6P9qU5aaNJsUMNkgBYmU8kUl5HO2rcdUU9iCsNJhqVqq
         pvo7EtITywt7nJlq/4+63H/5AvfAhhSF8vyV/Y+D0B+Iz0tE49nyC2ILuHeFif6Zt2pf
         mQCw==
X-Forwarded-Encrypted: i=1; AJvYcCUiUiBb2LgigN6SMxPsyJyxUnx0PW6PIrAu9kgvMWRWU3Ln0SUd7pHRXBxq1p5GSXqNk1Bk2GCoHFcOw4Fo@vger.kernel.org
X-Gm-Message-State: AOJu0Ywu+tnBx8JpNg2dk+ANOhv621M7pyKfOP8b8x1nVjsdDK7WkfI1
	cEC8/dyg//bEbDcdlkUcgAhez13ykRU/k6hzLXq5tDBMNhKjIvO+0IW3X+VuPZFLLqg=
X-Gm-Gg: ASbGncuLneFCCnSg2QbZZVITIX+rLN0QSZ2/8H7rKk+vboPG1VeGHy+SVwhnLK99ZPO
	toOBenll+LZFB3cr8dFIF51ec/H3pBnPlSsgmIfAc8rBNeCTqjttEzd+FBAPEPX1czzNHFh+3fC
	aSXpeg4zZIDE7UWKrTiqADmGBPqwAmkURa5y1YdZk59W6kIstAFQi0R4O1m14bmKiuqjQFIjFGl
	39SVikIwG8JBnB12FnzEg6f/mrRszDI8F/TLyofwYqV7A5OYkELN0Yv7dck2/VvAii+PE32EfM4
	SfwShrbUsimpxCkT0fXfdU4sAdwIXPJ4a06utdZx7W5BD86M7cxQQzi0W5SfXPlQMInBQHR1qN7
	5NijYIsiPgWUeQ+VQvaa2G1AdNA0l3Ajli7UPjdlkABZ00S6JPsClWAfhlM2m/tU04HqVMqU=
X-Google-Smtp-Source: AGHT+IFvKb3JoyG866nslJyNC3Ibg/oUQ/wlCU6/03uxa7bXbKsZVrSqlRlb8S4Ya6isf5ldIVuivg==
X-Received: by 2002:a05:600d:14:b0:46e:4705:4958 with SMTP id 5b1f17b1804b1-471179174f4mr126289245e9.30.1761138673264;
        Wed, 22 Oct 2025 06:11:13 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:69df:73af:f16a:eada])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47496afd459sm38839905e9.1.2025.10.22.06.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 06:11:11 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 22 Oct 2025 15:10:45 +0200
Subject: [PATCH v2 06/10] gpio: provide gpiod_is_shared()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251022-gpio-shared-v2-6-d34aa1fbdf06@linaro.org>
References: <20251022-gpio-shared-v2-0-d34aa1fbdf06@linaro.org>
In-Reply-To: <20251022-gpio-shared-v2-0-d34aa1fbdf06@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4760;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=x7L0RijU+LCdHfGCAJ/VkOYZp/t4v/DX9On78RPb0YU=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo+NfdZs8MgTMizrWDvDv1UjUZTogiIeLTWekA/
 YC4FrScCIGJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaPjX3QAKCRARpy6gFHHX
 cnAgEADBzLwtXPh2XKMVjNVTb3+/+na90OoVl87WRHstD2bKhyf3X1zCGxWwdcpFH7ZAY3X5cj6
 /QMO3st1TRPyuwvJjld52dtJWPYqkpxKokQOroUrZUNtkurk1CW87T3aGzO8lOZbo0Lfm23dQwO
 sBkrJTztEWsGyJiq6ofdmzamQhN1EVEQJRWC/c2QY1lozPK2lp5Egdi0Z0tlhxeqpA/phf9Ncw7
 Qe8kksbK1r5OO4SyBZZxCe9gNQYH04PEzWsgCI5oT0pKIyaFaQXAtEhUI8S70m+77npYxr8Mzz0
 xBzSAFPuVIYx3RLeQFPnpxMpT5XgGTzD4knJaa0ONGXTZGLYvUg7VJK2tmwb1bhL3aShR73MpDv
 MTeQjM7Ss/oksGzF5/Pt+VPnNBESFJ2cwYIuCP0S14CuOoqZwvMmrU4Afd8ZyS8CnQjfbzNkp/n
 abe0kCW+B8VEJMnXQiboWKlmEvmOSpmPFAlv8e/jNV8e/JV9stT4bXTjKxHtoQBjC1Df4Va/24w
 0o/JgFDARBNyFVOM3GYNWuZjFv8lSd/Ux3+vFPnWEhyVDjDbAqoeZrJL3fbWfiCfZmlup58aZPA
 PzJmNLr/bcmpc/+f4I4gy+TNt7c88z+qB7fnIdOPkbYuTBDtkrGpHMutGANHANOxN3C7Pt+Uy1f
 5DYXoQM9Pkhsz0Q==
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
index d2087d0df4ab7bcd23d3736e341c0f57cd748af4..b5c33bccff0765eb940fedd5d678c47a05f1a25d 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -309,6 +309,24 @@ int gpio_device_setup_shared(struct gpio_device *gdev)
 
 	guard(mutex)(&gpio_shared_lock);
 
+	list_for_each_entry(entry, &gpio_shared_list, list) {
+		list_for_each_entry(ref, &entry->refs, list) {
+			if (gdev->dev.parent == &ref->adev.dev) {
+				/*
+				 * This is a shared GPIO proxy. Mark its
+				 * descriptor as such and return here.
+				 */
+				set_bit(GPIOD_FLAG_SHARED_PROXY,
+					&gdev->descs[0].flags);
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
index 03fd60e787fcf5846519fb2db9a701770ed15d6b..d689065471a1269ac0671b964c67670df5c95dd7 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -3984,6 +3984,26 @@ int gpiod_set_consumer_name(struct gpio_desc *desc, const char *name)
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
index ae9aa145ca055c08dad55a537567a27de57f7066..8deed8a7d1128f01f0696af040d06f5fe140c7f8 100644
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
index 00df68c514051434e6fa67dc2307c6a8ce4ce3df..a8acb7c0b5af5066fd05e533468fc28616c68d78 100644
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
@@ -520,6 +522,13 @@ static inline int gpiod_set_consumer_name(struct gpio_desc *desc,
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


