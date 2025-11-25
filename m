Return-Path: <linux-arm-msm+bounces-83247-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC42C85095
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 13:56:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 29E1D3B27FF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 12:55:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C7CD320CCD;
	Tue, 25 Nov 2025 12:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Qh/3KRmd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4404E320CC3
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 12:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764075347; cv=none; b=a6R1QwkfXReQrK4xm2CfYRpSAVN2tc4/Y8UmsgEAHrb4FEaSzQItDfvyVL9qUOSFHCCmvm2Ju59r/Kf5NZAQ2FgjAw07WT8C50UZfLJSstdReZnceD5cAtLFbbuOQoifQobdTBqk1puXSdrR1bGmJ8fBzz+D1OLcLe01fCSbGdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764075347; c=relaxed/simple;
	bh=bHglC6U1OozqxXTVhErD34h2QO4PSi/HpXrwWbmU4x8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=dbIEqzunXWObAdy+q1AhS5SGceLIqyD0s5lno9mFfh+jmzHyh2fre/KfAzFCS5d3lIue6rrv7krpARUMWMegMnUE1WRYZG/Z1hajJ3A6xMb6iP60xwtu4EDlDNK9eTnwNvZjGThau9g4bzAS5lNVrtaSkisZZw1C1aDII8JReyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Qh/3KRmd; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4779a637712so33534095e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 04:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1764075343; x=1764680143; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VrQgVPpQ2lbVMny7bag/S2NlxymSgh2UoS920uymtPM=;
        b=Qh/3KRmdvVXSdWnHXoYJzzu9/UHMZTHZeWnPVx9AVpVrUAeXQoX6se7dKaJHH7UNvc
         e/kgr+UmkKTW+FKAG09WVfP89O8Dp5vkaNcF52JiNcScIwxMHO0JR6musRPs+hz1apeP
         C9qdwyl0AU72xlvmSGBNrbe71biYdJD/iDLOKswEVUYI1FVFp6SmbnjzzUbGtCFGHYgd
         H6dIOx07ZbC4UCwk2YPG6FIcqp20NvUurriE98RprrLVCzgUNYj2UC3qLmAoN1j60dOE
         IcGO3h4aVD/faVw0h2poUuuOKBJUBtgiI5+5MtB4zjnwgrd70/LqnyuHC5hVZc7STypF
         hbWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764075343; x=1764680143;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VrQgVPpQ2lbVMny7bag/S2NlxymSgh2UoS920uymtPM=;
        b=RJ7VgqAyWoqGsofO1QvURMfnVhIV9FhEB2pOtEE4gnabLP0v9LTp8H/eMLnvXSQDYK
         RYw0UL4/l9xWSYo1kWZBToicDd6ZP0dNPRci0zHEjf8yQiBKOndKHhdNAjDDt7Ary3qH
         lAO7pqG7KNKhlYadYp51VYQKwUidceEPRq8HWmPd8B+SIVZNuM80tz2voOgVaI+6V1hi
         NK6WXpXiwFrj308LBGISNoVvr4pEmfKA0K9fdKhoJmeorfHPaYu7/ey79MB2fyv8mk2/
         U8FV/uREEabGg2N7VscWT998QIvghufKfazntqwF0F4zUWR8nmDqrCv3cIHv9p2QbxOR
         FxTQ==
X-Gm-Message-State: AOJu0YxbAfpyqr7a/n2UAxSBbghxfF3BQ8/qofZlNaDYrSsDEVQHoWqt
	peZS8L47rV/kVDPiMg4FSYgjOqZUE5SlPz4kb5r4ZY+AUiFpreldzz/L52KIHkxwN+d5dluS+Az
	Xbnra
X-Gm-Gg: ASbGncumea3UkoFcX9dsJ8Ab138ic4G6P1vdMrXfOdwNJSos6FtKlymoxZz9+29k97o
	zSqCqVaayBirLDsS/5+aY/TrA7SLCwzTQ3REopeqNJMagekgxY+jNRCSfqzmwap974VIPTZuEVs
	pDgPhlZ5llcW/RMi+iPCVP+a8VOzZqeUbJqARHAOc+t3l1TFziXZ8B6VhwdZL46/I57Yi+SrG/e
	8Nq2gBGOib6HmY63WHeXTfRxEVFHU7Q8THsbAHJu5CI0wq50tDwZT/rol5zVAGhyn8Cn/Qc2dua
	Xrzdfx7rL7uGOAYBzrBv4tX2/dOno611X7Wmx0HW1I7f9V8QGozhVeV+15bK8gQ+2JQDwGaUTxC
	tiRjMm1QiMsGAPLnYya381vz1cuK3z2gE65nhNoveinX+VZQeWMFSNAbenL1arukgKPD9Zc8ek8
	80Vt7hwQ==
X-Google-Smtp-Source: AGHT+IHJl/rt+yQiY4gVfjuBNuANNJaM+KMK8zu0UKJ6yg8A/y3fdJYtIycxtF69cDY/P960+lp6NA==
X-Received: by 2002:a05:600c:450b:b0:477:b642:9dc9 with SMTP id 5b1f17b1804b1-477c01d736dmr138658875e9.28.1764075342833;
        Tue, 25 Nov 2025 04:55:42 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:df0c:79ae:5345:c3b0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479052d9445sm15075685e9.11.2025.11.25.04.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 04:55:42 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 25 Nov 2025 13:55:35 +0100
Subject: [PATCH] reset: gpio: add a devlink between reset-gpio and its
 consumer
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251125-reset-gpio-add-devlink-v1-1-a1909fef227b@linaro.org>
X-B4-Tracking: v=1; b=H4sIAEanJWkC/x3MQQqEMBAF0atIr20wgYiZq4gLtb/aOERJRATx7
 gaXb1F1U0JUJPoVN0WcmnQLGaYsaFz6MINVsslW1hljHUckHDzvunEvwoLzr2HlZoIbvGuk9p5
 yvEdMen3jtnueF8PtNmhoAAAA
X-Change-ID: 20251125-reset-gpio-add-devlink-8fe5b958d699
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Val Packett <val@packett.cool>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5894;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=/Cn5DzGw9tmuv7/Ad/S+TzmqH885u2CaCD6/Juv1SFs=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpJadKf6RqXl6qeQROjtis3NItU4IW8WxjtgcvO
 HGOPJQZBVmJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaSWnSgAKCRAFnS7L/zaE
 w0CKEACNlTu7UbZOAwjahuRMO6wxaEmhpxBHIi8gLefC/h+nT1DDIdy2CnVHZdWF3eQ9/+r0YlQ
 Qh50Pi9jJt0p02d4mW3HM4bOgA8hNoDLSMjIokTfUTpBm+5f29PsFVct2FEFpnURWNd1UYe3jrE
 R5aeX/2AbE1mOVT2fsmcEYj8FwtvBzBEYFLXe5bz08iiCtz91S5PNP1lBrBDAP1NUQD0u6hREdv
 Ln0+m3h58PxL6CmX3wIZBEwY0DanEDbOEjDiDNHiEA/yxyxb9G0WGp223zZdjfWWril9NTeOqaI
 mRkjxLtgAS7jZaoj6GN2KU1gqcfk2tVKSfMwx+6EM/mKD2hZsJ0f1tX6xTL9gbRut3MA/mHinrC
 dcF1KQ2+FSBKhnVz+0XZqUk/XE/h2hYx4GQzUpdDLQcrgveQ/AovhgFpRHRszEo2eJQAolyt8EF
 PvFg7zsvorNdA3tz6jtFTbnpsaJi25g5vya+2lveZqscSMfvXppW2Fbd43Ffpj1acNveQK4THvj
 8JF05V81jNBZFMyWDEOJqt9rN3nlQbcRhhmcTwhspc7+mHXf7+NaTaHMic0UsJh3xZghPJZkl5G
 2zq0H65Y+lMeNSQ5U0Q2DEMV+vU/WKYzhhSvE3/ng3xzkEdsBz1xlrjRp5xr42PVJU7Cs5+Qgo3
 yGNZdS0eJI9oimw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The device that requests the reset control managed by the reset-gpio
device is effectively its consumer but the devlink is only established
between it and the GPIO controller exposing the reset pin. Add a devlink
between the consumer of the reset control and its supplier. This will
allow us to simplify the GPIOLIB code managing shared GPIOs when
handling the corner case of reset-gpio and gpiolib-shared interacting.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
This change will allow us to simplify the code in gpiolib-shared.c in
the next cycle, so it would be awesome if it could make v6.19.

Val: I'm Cc'ing you as you're already playing with audio on hamoa. If v2
of the reset-gpios fix works for you, could you please also test this
and make sure it doesn't break anything with soundwire?

Thanks in advance,
Bart
---
 drivers/reset/core.c | 73 +++++++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 58 insertions(+), 15 deletions(-)

diff --git a/drivers/reset/core.c b/drivers/reset/core.c
index 0135dd0ae20498396fdb5a682f913b6048cb5750..15b8da9ebcf196f7d5ce7921e4f8aba0ea6b0de4 100644
--- a/drivers/reset/core.c
+++ b/drivers/reset/core.c
@@ -20,6 +20,7 @@
 #include <linux/kref.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_platform.h>
 #include <linux/reset.h>
 #include <linux/reset-controller.h>
 #include <linux/slab.h>
@@ -82,6 +83,7 @@ struct reset_gpio_lookup {
 	struct of_phandle_args of_args;
 	struct fwnode_handle *swnode;
 	struct list_head list;
+	struct auxiliary_device *adev;
 };
 
 static const char *rcdev_name(struct reset_controller_dev *rcdev)
@@ -829,16 +831,16 @@ static void reset_gpio_aux_device_release(struct device *dev)
 	kfree(adev);
 }
 
-static int reset_add_gpio_aux_device(struct device *parent,
-				     struct fwnode_handle *swnode,
-				     int id, void *pdata)
+static struct auxiliary_device *
+reset_add_gpio_aux_device(struct device *parent, struct fwnode_handle *swnode,
+			  int id, void *pdata)
 {
 	struct auxiliary_device *adev;
 	int ret;
 
 	adev = kzalloc(sizeof(*adev), GFP_KERNEL);
 	if (!adev)
-		return -ENOMEM;
+		return ERR_PTR(-ENOMEM);
 
 	adev->id = id;
 	adev->name = "gpio";
@@ -850,23 +852,55 @@ static int reset_add_gpio_aux_device(struct device *parent,
 	ret = auxiliary_device_init(adev);
 	if (ret) {
 		kfree(adev);
-		return ret;
+		return ERR_PTR(ret);
 	}
 
 	ret = __auxiliary_device_add(adev, "reset");
 	if (ret) {
 		auxiliary_device_uninit(adev);
 		kfree(adev);
-		return ret;
+		return ERR_PTR(ret);
 	}
 
-	return ret;
+	return adev;
+}
+
+static void reset_gpio_add_devlink(struct device_node *np,
+				   struct reset_gpio_lookup *rgpio_dev)
+{
+	struct device *consumer;
+
+	/*
+	 * We must use get_dev_from_fwnode() and not of_find_device_by_node()
+	 * because the latter only considers the platform bus while we want to
+	 * get consumers of any kind that can be associated with firmware
+	 * nodes: auxiliary, soundwire, etc.
+	 */
+	consumer = get_dev_from_fwnode(of_fwnode_handle(np));
+	if (consumer) {
+		if (!device_link_add(consumer, &rgpio_dev->adev->dev, DL_FLAG_STATELESS))
+			pr_warn("Failed to create a device link between reset-gpio and its consumer");
+
+		put_device(consumer);
+	}
+	/*
+	 * else { }
+	 *
+	 * TODO: If ever there's a case where we need to support shared
+	 * reset-gpios retrieved from a device node for which there's no
+	 * device present yet, this is where we'd set up a notifier waiting
+	 * for the device to appear in the system. This would be a lot of code
+	 * that would go unused for now so let's cross that bridge when and if
+	 * we get there.
+	 */
 }
 
 /*
- * @args:	phandle to the GPIO provider with all the args like GPIO number
+ * @np: OF-node associated with the consumer
+ * @args: phandle to the GPIO provider with all the args like GPIO number
  */
-static int __reset_add_reset_gpio_device(const struct of_phandle_args *args)
+static int __reset_add_reset_gpio_device(struct device_node *np,
+					 const struct of_phandle_args *args)
 {
 	struct property_entry properties[2] = { };
 	unsigned int offset, of_flags, lflags;
@@ -916,8 +950,14 @@ static int __reset_add_reset_gpio_device(const struct of_phandle_args *args)
 
 	list_for_each_entry(rgpio_dev, &reset_gpio_lookup_list, list) {
 		if (args->np == rgpio_dev->of_args.np) {
-			if (of_phandle_args_equal(args, &rgpio_dev->of_args))
-				return 0; /* Already on the list, done */
+			if (of_phandle_args_equal(args, &rgpio_dev->of_args)) {
+				/*
+				 * Already on the list, create the device link
+				 * and stop here.
+				 */
+				reset_gpio_add_devlink(np, rgpio_dev);
+				return 0;
+			}
 		}
 	}
 
@@ -950,11 +990,14 @@ static int __reset_add_reset_gpio_device(const struct of_phandle_args *args)
 		goto err_put_of_node;
 	}
 
-	ret = reset_add_gpio_aux_device(parent, rgpio_dev->swnode, id,
-					&rgpio_dev->of_args);
-	if (ret)
+	rgpio_dev->adev = reset_add_gpio_aux_device(parent, rgpio_dev->swnode,
+						    id, &rgpio_dev->of_args);
+	if (IS_ERR(rgpio_dev->adev)) {
+		ret = PTR_ERR(rgpio_dev->adev);
 		goto err_del_swnode;
+	}
 
+	reset_gpio_add_devlink(np, rgpio_dev);
 	list_add(&rgpio_dev->list, &reset_gpio_lookup_list);
 
 	return 0;
@@ -1034,7 +1077,7 @@ __of_reset_control_get(struct device_node *node, const char *id, int index,
 
 		gpio_fallback = true;
 
-		ret = __reset_add_reset_gpio_device(&args);
+		ret = __reset_add_reset_gpio_device(node, &args);
 		if (ret) {
 			rstc = ERR_PTR(ret);
 			goto out_put;

---
base-commit: 0067c9346f8746a9d9ddc15ffc0ddf7545d318e6
change-id: 20251125-reset-gpio-add-devlink-8fe5b958d699

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


