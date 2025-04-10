Return-Path: <linux-arm-msm+bounces-53805-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B909A83EED
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 11:37:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 995F44403F7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 09:36:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45DF726B2A8;
	Thu, 10 Apr 2025 09:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="0cs86pYG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8E826A0EB
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 09:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744277710; cv=none; b=lXHE9mGmR4ZcGAUjFvnpWnLkTtcxGekEBSeG23rZ337ySFyEte/pj3xK4DfTnk7zX9vxusOtPd2Dae9YpR8uWX/twdZNtxbbXa6X2JtSLU4emzIe6TtSurTpuh7xY6sBDhvEDdU/T6etf2dSkvlCZ95CuTkS6s0DqFOpD8It1wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744277710; c=relaxed/simple;
	bh=CBNSk3yrCFCOlbMgCfYWRT8QGkYmxOkTlZAWAhHftYU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E/5EJs/iiH5MmsgHOORGVjdzdoZj/eFgNcyT1LOL966evDitSg/DFn4vodtD4GP1FS1uz08R0or1g34rYy81axL8/IvAE9BU4FccdtcMCWNyHRE4/5IrIf0OSgLTw1Blquz18YVq7re7eIFhCV4Dj6d7cU49PzpbHC1pSHHwBtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=0cs86pYG; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso3869145e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 02:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744277706; x=1744882506; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9gEo2m/viZuy0Hum07/62VQBUfloVHDkw2x/xR0+XyA=;
        b=0cs86pYGm70abco9fjhM56Qmym0LhpLkpUrxLBo0/CFg8TLRyz3qmKXaW0FjHK6XuX
         nIElyWL4LjpT8RKtNo9LEkamYipdLZTg/xNwSjOALmuNb6YOn92is+IhkdO3zomOeTOk
         lZkT6Tidf5NKh7NZFqz+QL1CtaBEsoD5kzcZvADFYEtD0Mk57dHw8UC50RObtE8CadsC
         jV83lIgOzaC1f2+zL723m1zwLv9QKs7RNfS8CUu0ME2ejzue5Zx22jK734ypgRyeYESf
         91rgJardeEFqDH1qyauFKubcem07r3kpli/FPiSA54LX6YUnQwTAcviKkt8OHeG9vuRx
         uMGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744277706; x=1744882506;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9gEo2m/viZuy0Hum07/62VQBUfloVHDkw2x/xR0+XyA=;
        b=nNM66SN8jDYmxaIiB3MK6y1ma+AQ0KJ5EVVDhjdzGoY3OVfvN7LTspdowWBZZ+Veo6
         rshMtxMrO29qb0T8dZCPQzPmZmlaaF8GIwWioNfrj/L87aMSMaUOwSlBAG+xH4fhNcwN
         mDysu9dxARLAZ6vAl/rnLSEMB9RpXtxy7ufwBo5PaDfI3xBwg7/FGgaUXpXkRomfZNbr
         TYuPojrBvA0yy5HIGnoyrpaz3TsSugTtcieVUY4fSSKCrHgh5zVIzYtofAWdhtA2Ry6B
         paEDUJxLJjSgrgspteMX/Yjr/mc/I7MFUyqlmFvKGReyWqlxe8WSbIuh3DKPPTeosjCu
         CIvg==
X-Gm-Message-State: AOJu0YwxdfHDjr1C6I6S7wm3GQcU7ZqzstQikxbubGe4AvlENGGwStvC
	2HZ0WGmB7DPVF0HcyA1wPiM74UNPl2u+7awRJdsBevTM5sgKEFd/TUyJvPjKYRUOj7HOxjc1BxQ
	eTRc=
X-Gm-Gg: ASbGncsJO835XFqrYjj5NX5PSbotoC3un42x+eMOwgD0twweZ8s9mg79/HMMyOWGPU7
	+XciIEdwdR7udZNjyNykrzp4EPjnTTzEXRFoF6f3XqEAFVuh6TptTkwAmNXbqhGRrsce5vFXSmy
	gwnu40ih0QsDUKQvUgRXsGgLRKHJtlg+42D+HmSCuctMcBHZEboudlpNbbo5PgB4QWP3ccRDhim
	dkoVO/Ff7h0TrDb2mL9uHj3elVn2wu2FP5palj2oRAwssbZ6wiXzuUqwpbHjr+cYch72u+RwViq
	0IwLwVpB6bMkxe61Fb54qM51Th53rhYwpw==
X-Google-Smtp-Source: AGHT+IGQMtxSsq5/DE95xt49hSnwg6XZGyLcP+OE0baBUHtuUXr/MHr9x/DHvH7LZH95Mxedo/aa/w==
X-Received: by 2002:a05:600c:3c84:b0:439:91c7:895a with SMTP id 5b1f17b1804b1-43f2ea651bcmr18434155e9.7.1744277705965;
        Thu, 10 Apr 2025 02:35:05 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:7c4f:f9d1:94e0:53f8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f206264a1sm49698435e9.9.2025.04.10.02.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 02:35:05 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 10 Apr 2025 11:34:47 +0200
Subject: [PATCH 5/6] pinctrl: qcom: ssbi-gpio: use new GPIO line value
 setter callbacks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-gpiochip-set-rv-pinctrl-qcom-v1-5-6a6891338aae@linaro.org>
References: <20250410-gpiochip-set-rv-pinctrl-qcom-v1-0-6a6891338aae@linaro.org>
In-Reply-To: <20250410-gpiochip-set-rv-pinctrl-qcom-v1-0-6a6891338aae@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1682;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=xuF564c737gHGSAxOu3BnJZRQm091DpG8CWSw+xr7mk=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn95DEb1OYPZ+ZieVXFnz0F0FKQSWFLy4/qEKp3
 g9UkQaGDgeJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/eQxAAKCRARpy6gFHHX
 cpUREADdsULQgfyLf1FD3y7lCUngOFoOXSIwIrnRGGnV6dhK2OgKaj39Tls94XN8rhXJmaB5sEN
 rzMQlgx6LPSQmtDp3ommBKAl6XXJmVpcoV+IbFwGUfl22YKcbbYMoPV6DscGqmrjKaW319adR5c
 oITO9oitlqJKv/8mcI1DYGLzU6BeDnerRTsXk/KeggzCt8PHTfe2u06NBU652qYoH9gl50FOehT
 bP1RiE6bSPO7cyTx7fuuvlLVkOuRF+Bbou+htvyVRuDsaLKpRXTBosXDte3QcUEFeR58J4NdaMV
 KhIPuDKTV8Al9aDT1BIlBPkn3G3xXKMJXsACgD7Mc0jROrFdGghF2TLUxBvuJEGnGCjwmBnWrDP
 mZxKw5fQTPfiq0EvVd+5O6IyGGhL+KZoqDXCZ+HxXL7jS4W3iWaGHRg6tljnKsAwm4IZ0xpFDOG
 vIP4jDPnhkKX9P1I9qtGFMruUE+CX9/A4Ksy7mfu7VoMhlcxFCXrJsgEQvEwwY6xJLc7A3tJnsw
 O3z42DNFTPwz7VizVvVx6HlZ5uf0m7yjLAOf9y1t+0tzsAUbx5q5Py7RTmNDdVnzS5EzPC8J8Z4
 kyUOaRLi3fLnVWpy1pJYrBV4LfiR5e3PVrjgUTipIcVv4eDFpE4vgppvYdY/fM2Ovn9Vfv8Y8zY
 g1bUBeQJ08MT9sQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c b/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c
index 82679417e25f..3a8014ebf064 100644
--- a/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c
@@ -507,7 +507,8 @@ static int pm8xxx_gpio_get(struct gpio_chip *chip, unsigned offset)
 	return ret;
 }
 
-static void pm8xxx_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+static int pm8xxx_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			   int value)
 {
 	struct pm8xxx_gpio *pctrl = gpiochip_get_data(chip);
 	struct pm8xxx_pin_data *pin = pctrl->desc.pins[offset].drv_data;
@@ -519,7 +520,7 @@ static void pm8xxx_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 	val |= pin->open_drain << 1;
 	val |= pin->output_value;
 
-	pm8xxx_write_bank(pctrl, pin, 1, val);
+	return pm8xxx_write_bank(pctrl, pin, 1, val);
 }
 
 static int pm8xxx_gpio_of_xlate(struct gpio_chip *chip,
@@ -596,7 +597,7 @@ static const struct gpio_chip pm8xxx_gpio_template = {
 	.direction_input = pm8xxx_gpio_direction_input,
 	.direction_output = pm8xxx_gpio_direction_output,
 	.get = pm8xxx_gpio_get,
-	.set = pm8xxx_gpio_set,
+	.set_rv = pm8xxx_gpio_set,
 	.of_xlate = pm8xxx_gpio_of_xlate,
 	.dbg_show = pm8xxx_gpio_dbg_show,
 	.owner = THIS_MODULE,

-- 
2.45.2


