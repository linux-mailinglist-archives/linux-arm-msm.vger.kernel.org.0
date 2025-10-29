Return-Path: <linux-arm-msm+bounces-79423-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C387CC19FDD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 12:24:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D8FB84F0A70
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 11:22:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0254A334C18;
	Wed, 29 Oct 2025 11:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="AA2VF4dz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6260431E0E1
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 11:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761736870; cv=none; b=eoBbLP/dAaeZ/k2Tmzr8GCRZ/zwBga9hTBEYilj+snWKzoZHAqqMYmADF0s4WvnBD81jn7PBzeoltlhIawqyraxu24l+rRhL5RXby3dsJvtGmTL4sESiGEQVRLZGS/tWsko125tRSvYpKMIMqNgg0SK9m+YfMv33Iy98+j5g9Kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761736870; c=relaxed/simple;
	bh=QOIVfl+TJ+NysL33d9l/tNLpZoKFZVt0t++/WjOc0Gg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BVY1cypT7py5cW6ZD3oV+SWsNFjwVIzzPSGTNIEUYRnsdf9kf82oPDupMj9vHgnd83J4lF/NmCUcSMJ/kiRGgVCQufxIOwTAKvrbJao2MsmWPVnT2yupWhgr91ducOd80J2jBxDjxuNiZl7D3nRG4+6dFPbJJFYEBQNs8Hn/AGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=AA2VF4dz; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3ee12807d97so6808998f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 04:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761736866; x=1762341666; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jZnk+nYLZl4QMw6EhjYCVYds4/Rzm6O866RrS4AjrMs=;
        b=AA2VF4dz3g7RvBQTbAkfXUBpEzJZ7qmy/IXa6wtQiJCcIlDT/IMmdaelrz3fpQ0l55
         ficK/AnYQgZccxQnGSe5OU81hKExBtoTaK2S5IkZ2mG/uiW6SiU4de4AI98FQ4OpPGvk
         3fkOcgt4bUHHiznzJ6eFREUUQ5xUjNkzipatzFBhlKG+rjVU1DUKh0lWzzsjQ2Ja5dfE
         OoZQwW3VQvz6pugXZI3wZ2ikjl6p70i9aHr/CjzV2ovs7a4DrlibVN1ZJLKkYflPD7gm
         1kVaCZgWMkq/NbuEDY+s40cpzZJFiDgjR2KEGLI8wexYc4IUFxy5kbGWdiLDfUKE/Jru
         5DvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761736866; x=1762341666;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jZnk+nYLZl4QMw6EhjYCVYds4/Rzm6O866RrS4AjrMs=;
        b=RPFgoSwc9fN3E3IMP0h9xj0Kq68ajNKQRlYKkT1wcH1H2zUKidWNG9Pc29HuM0MHFX
         z7hrqWi61NeoPZuHyXu9ojEA8xV+eQnlKGvxUcZze4QwR6DvpbPpiw4tZ4jDWBZoz/eY
         1lx1I/5dRIkMJvZn2pP2NKnp4FN9y05LhhekYoZVQ3l81NthukHBMTYTnZcT3BAwaRYm
         +uOnRFWtT4RKghNq3cpf2d4JIsoqSqN9DQ47+1o4z1N4cBl/+u0PA7M6w5NyXOMtIWku
         PCZDGZ1ZE6wAtrbNShj4rFrETqC3tuVWTPERSiM5FA9+dJhJnX5cmYhpnPY1QxMpaZ1+
         teVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwi8mjWPDceiIZKanhKBOlv21vbWnOkMw65ATLybeqrKcLa2FhswjTayP83qF5uOqwFZE9KHLuCiP1pWp1@vger.kernel.org
X-Gm-Message-State: AOJu0YwhcorJwvtmQRq4ugehbRyCHVIBpRGH3KfJOdx1nNqDAHI7zjjs
	wIkp8vjTsyj5PI8aJiQ4009ieCIenvle6JlRQoKQGQUy0ZiS1OdiQYVmPDmxQTElpeM=
X-Gm-Gg: ASbGncvjpsztOWnwd9y/jQotcY1ZIzj2Yf1Dob7DWqTscfcuNe7vJPL6jnOYr0IPtml
	kBUyyvAsTrs4uU5U9JPyKg2wrXOexmldOnLWg60nxFbqsoP2UZotAzn1ztImOWy9HOLPBxSPtT5
	yeavy9CX/0qFAYSAJX30T13TkoqT6VXYX0X26cts9RQSlO65PqL73VeqPBbokR9yAj85MPxoCoV
	NYg6TRiuMe4ctMD3xEKeMOtq8dw6yMX2FEsVPjAZsE6w0j54m7VwYebWaAoKKDexTnDytoeV5V2
	/j1UnGrEDh3Y0Otceznq67Z8vJY7dSi1m3EX8GC+Tir3nMnSKWBVWHmGZTR0UG1JxGmxVAZhscv
	3hWlPMTNSl32x7Lhk+o08j2ERFLHZRigWWtpEwFfKju5A/KArUZOzWF8GHUhOxMzIROz3wck5cv
	MGF99C
X-Google-Smtp-Source: AGHT+IEQUECFDEstV6QYZ881rRQLkcezBKVFVx3TzPPXX9d1qB7SalXkzG6fyMdXz4omLQ4r+N8hwQ==
X-Received: by 2002:a05:6000:26ca:b0:429:8d0f:ebf with SMTP id ffacd0b85a97d-429aefcce70mr2187907f8f.42.1761736865935;
        Wed, 29 Oct 2025 04:21:05 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:69f2:5f2d:9ffc:a805])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952df682sm25657486f8f.43.2025.10.29.04.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 04:21:05 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 29 Oct 2025 12:20:41 +0100
Subject: [PATCH v3 05/10] gpiolib: support shared GPIOs in core subsystem
 code
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-gpio-shared-v3-5-71c568acf47c@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4422;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=Gv6nJIcFpujEIkYYyh8HXEYQVPnSJEXWWrdVFvalF94=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBpAfiW6yvKWgnemCKDMGGGyJIWSPB+dDUrSnYnN
 Wiel7dmsj2JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaQH4lgAKCRARpy6gFHHX
 crO/D/4tlrX9yp1WjVs8pqfpRZSAPKctw3sdEeECrsNrR405t6KWbicf+OQ5JsugurdU4e9dEbB
 e2e46BloGBdTXEUJkOrn1r5rNX4fWzu1+PzqGz0g5xCbwtgxt++E/aGHr9Qt+BbYXmDD1eWSl0X
 ELqRsSwD0SI+BhNg8c8JYHOka42MroUFrP44E2Nt0wHFxvb3JItYz3Lj+FJ/XCN/UBscAhIg5nt
 N/SvZu73HDR/C/Kxi2QNMXLBHm4CBdHYzit4n2PO4ExLiNGI34Swsujoq6sv4JMNTop7nwzatqW
 0yadz+ifq/TfQZckDcpX6YB+VSyPyvYIGHZiTYz858Hg9ZMeZWzOCQX99neYMIPR/ncDxw0MaQ5
 1u98lJwk93IDhKU2bdn68hUP4XkDQPRrdiNNKaSi7nkMFSAYMKf787DhbEfFkP7IAkx2gzTPq2Q
 Og3LL6Kvc8e4W/KZBE0Vc+aHNe8nyESm7sAcyZ8ts3Y2nGsAUuI6QJ0s4BLxCqPxWZWjhx81P68
 qBRZ6nIi3cpK/shSnOLxW6BsUsA0Za8GP5ZwxdIy01lkH6Bp+pNOnR8Zk8uP2/BjHXdqL1VFbDi
 gzkJlQt4E0QSD4tx7v88qtkyBrDDQ+35e0utG+K6WWkd2bAEDsdzzGE6G/RsapiIfVmBgJmwQBw
 TI9kgjbFato4a2Q==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

As the final step in adding official support for shared GPIOs, enable
the previously added elements in core GPIO subsystem code. Set-up shared
GPIOs when adding a GPIO chip, tear it down on removal and check if a
GPIO descriptor looked up during the firmware-node stage is shared and
fall-back to machine lookup in this case.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.c | 50 +++++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 41 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index a81981336b36db49d899634feafcd9bc25edf96f..c0c0e9370f150c340a7c79dc03c5afec64a440f4 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -37,6 +37,7 @@
 #include "gpiolib-acpi.h"
 #include "gpiolib-cdev.h"
 #include "gpiolib-of.h"
+#include "gpiolib-shared.h"
 #include "gpiolib-swnode.h"
 #include "gpiolib-sysfs.h"
 #include "gpiolib.h"
@@ -1213,6 +1214,10 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 	if (ret)
 		goto err_remove_irqchip_mask;
 
+	ret = gpio_device_setup_shared(gdev);
+	if (ret)
+		goto err_remove_irqchip;
+
 	/*
 	 * By first adding the chardev, and then adding the device,
 	 * we get a device node entry in sysfs under
@@ -1224,10 +1229,13 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 	if (gpiolib_initialized) {
 		ret = gpiochip_setup_dev(gdev);
 		if (ret)
-			goto err_remove_irqchip;
+			goto err_teardown_shared;
 	}
+
 	return 0;
 
+err_teardown_shared:
+	gpio_device_teardown_shared(gdev);
 err_remove_irqchip:
 	gpiochip_irqchip_remove(gc);
 err_remove_irqchip_mask:
@@ -1296,6 +1304,7 @@ void gpiochip_remove(struct gpio_chip *gc)
 	/* Numb the device, cancelling all outstanding operations */
 	rcu_assign_pointer(gdev->chip, NULL);
 	synchronize_srcu(&gdev->srcu);
+	gpio_device_teardown_shared(gdev);
 	gpiochip_irqchip_remove(gc);
 	acpi_gpiochip_remove(gc);
 	of_gpiochip_remove(gc);
@@ -4659,11 +4668,29 @@ struct gpio_desc *gpiod_find_and_request(struct device *consumer,
 	scoped_guard(srcu, &gpio_devices_srcu) {
 		desc = gpiod_fwnode_lookup(fwnode, consumer, con_id, idx,
 					   &flags, &lookupflags);
+		if (!IS_ERR_OR_NULL(desc) &&
+		    test_bit(GPIOD_FLAG_SHARED, &desc->flags)) {
+			/*
+			 * We're dealing with a GPIO shared by multiple
+			 * consumers. This is the moment to add the machine
+			 * lookup table for the proxy device as previously
+			 * we only knew the consumer's fwnode.
+			 */
+			ret = gpio_shared_add_proxy_lookup(consumer, lookupflags);
+			if (ret)
+				return ERR_PTR(ret);
+
+			/* Trigger platform lookup for shared GPIO proxy. */
+			desc = ERR_PTR(-ENOENT);
+			/* Trigger it even for fwnode-only gpiod_get(). */
+			platform_lookup_allowed = true;
+		}
+
 		if (gpiod_not_found(desc) && platform_lookup_allowed) {
 			/*
 			 * Either we are not using DT or ACPI, or their lookup
-			 * did not return a result. In that case, use platform
-			 * lookup as a fallback.
+			 * did not return a result or this is a shared GPIO. In
+			 * that case, use platform lookup as a fallback.
 			 */
 			dev_dbg(consumer,
 				"using lookup tables for GPIO lookup\n");
@@ -4686,14 +4713,19 @@ struct gpio_desc *gpiod_find_and_request(struct device *consumer,
 			return ERR_PTR(ret);
 
 		/*
-		 * This happens when there are several consumers for
-		 * the same GPIO line: we just return here without
-		 * further initialization. It is a bit of a hack.
-		 * This is necessary to support fixed regulators.
+		 * This happens when there are several consumers for the same
+		 * GPIO line: we just return here without further
+		 * initialization. It's a hack introduced long ago to support
+		 * fixed regulators. We now have a better solution with
+		 * automated scanning where affected platforms just need to
+		 * select the provided Kconfig option.
 		 *
-		 * FIXME: Make this more sane and safe.
+		 * FIXME: Remove the GPIOD_FLAGS_BIT_NONEXCLUSIVE flag after
+		 * making sure all platforms use the new mechanism.
 		 */
-		dev_info(consumer, "nonexclusive access to GPIO for %s\n", name);
+		dev_info(consumer,
+			 "nonexclusive access to GPIO for %s, consider updating your code to using gpio-shared-proxy\n",
+			 name);
 		return desc;
 	}
 

-- 
2.48.1


