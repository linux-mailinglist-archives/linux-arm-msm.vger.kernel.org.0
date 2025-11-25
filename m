Return-Path: <linux-arm-msm+bounces-83221-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id F2ABCC846B7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 11:19:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 51E0334B8FB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 10:19:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9E78258ECC;
	Tue, 25 Nov 2025 10:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ah3Z+H5K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCEEC185B48
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 10:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764065960; cv=none; b=RvmD+TYpGOp87EteEl45VL3f0eQ3OhBC9Ca+iU2hzX97O1w/WnUtEoJVzt8Dpg+XIZbPz3UHwEhgLhshIy+dXaArApRQayR0048VZqFjJgRgkeqRx8vm6rrQfl+J3QZW8v4lJ82RO9rF1iRp42tV/iU64RYHCL/5JIJltkb1rhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764065960; c=relaxed/simple;
	bh=4TjQoesRtOi9VvDdWCFJB2g5O3xdH21QKzdf450490I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=KTLf+kKn4niOu9zIbyJ+eY40EMPdbERaDt+QSJg4zwyPLPod/rZDdBSWheQh1z1+k/RUGxSfE6wOHPOgmTz7oUEDvCG5Yyf7abxQ+0RBTA73UrylTtvR98Z3nz5ikhy8SbA31Tr9xV7igK1bHayM4E9SXicCmqTfq9q9NL+LR2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ah3Z+H5K; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-429c7869704so4425046f8f.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 02:19:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1764065957; x=1764670757; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mHsazSRjBBdLw/5wTjNE+V06skEMqfKGBJCeXidVHP8=;
        b=ah3Z+H5KCFIwNFETk3M6EMhMJ5eG7tk5xaTsszAnRGNliWPgFlWyL153zr6GRBKdjN
         PpZ/EJeEo/IIlP+SEm02NxXI53UEb7S568TxvRJfhq8nRirF4IXnLTTSZCOCtjyArktD
         a2nYDnWZRJ8y18hK23MMLJr8S2fz3Am9dYtwK3qssyP15C9n5fGM8/8a7R0PaKInk+Vq
         /WtYUO7tvw+ueTXRWhPzCIW83Q+f9rUaLEzXypcOrRPK5tCt7Q0hb3WU9YtduE/wpile
         Z8kcSKvae4urDrmAsFxyexdqN74FE1dSDAB+i+rtSPg8nivuHWfs8+t9akXCqUsZS//v
         gEDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764065957; x=1764670757;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mHsazSRjBBdLw/5wTjNE+V06skEMqfKGBJCeXidVHP8=;
        b=HJ1JfFS74pPsrHFTISjtTIypD+iX23NXxwCYAowACoCh1JdWvXtGkj6yk2/9Ojigmt
         HhvGyi+TJkMyeyUxY4RIWNyG7HHwNihB3Wu+rZHqAsncvY3SyitLehE6Tf85PyXCH3o9
         027RW29S+RS3SEqPr1V7mR6dJCKoSLLwUpyRLm0vnKkQbZq57PPe1dm9mG49lByIR9E/
         b/EoP1C/bRIOg/FKcYrQQB3OwtCtBg+t5HYrtTQGhhRLBOzhDToYKvDbAwpXnupGvEIy
         CQMT3q41P6hK9Mmd5MAAUSz/gxOqaqh6gtkD9SIi4qO21WdkOQWE2qtByyOJ1wzA2MsF
         IpqA==
X-Forwarded-Encrypted: i=1; AJvYcCUJLXfmlE3VBGhHbOFLuIFHRZ7FNWspXrjZuoTYA3uRTdXVL0VNZDeMFAiRlDg9OtP6PDqvOwOPWVf35njf@vger.kernel.org
X-Gm-Message-State: AOJu0YwbS01rMLBsGmlm3nAAFKll+FvfPdAGynZ0yoMO/Zb7nvbtv+RK
	tYh/WWZQqtETZTs0YZnI18kL9XzagOAw822FXTJXkuEWLrbIfgDFuEP2LLM7gFiZCP8=
X-Gm-Gg: ASbGncsFa7nvCbV3+ivHTqOkmB5u1TfTD0QOJcD2gD39esCwBETfzNUL9/ZftIQ3B61
	kZdjJS0m1fvJ8tTQ8Q7YF1Mf+VGgn5NHUr2CjQplE1FPKWPeyqIzU7b7ag5Au5A9LIuoJB4P+s1
	DP28Plw7QXtGJ2pFlLjLQeAR9O5988gTR5Nwn0nSGmgwEfT7sqoSdXqKYy3WmIQkEjJNVkQzC/K
	NodPzWgMPXCPWTQPl7NKX22+GqEXU9AGb6VDjBu9Rsz6DNurXlqvFrO3H83cdqBqRmzIwckA+T1
	2wVXE8wFm9h3WWZAr1Lbn3OXI+J1yVC1d8ryK3yH/oc7rqHpVVeUp9KZWtf8EtcIv/3dCCJYeRA
	kIeCNH3Wju+jjf0JYDOyWnBDgkhm6sEhHLCkMXiTR3qwg9oG/zM9xq7hCGRzOSlRGsYTxfdkCE8
	aSI+kRiA==
X-Google-Smtp-Source: AGHT+IElDzPPFo4R1Ku7VyEdXDsLFVn8Cz67qhPRUicZhyExrx80sPETRT42LzKc2vysci1RyB+4NA==
X-Received: by 2002:a05:6000:1789:b0:42b:3ccc:91ec with SMTP id ffacd0b85a97d-42e0f2047b3mr2147500f8f.22.1764065956581;
        Tue, 25 Nov 2025 02:19:16 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:df0c:79ae:5345:c3b0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fb8a29sm34001497f8f.30.2025.11.25.02.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 02:19:16 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 25 Nov 2025 11:19:09 +0100
Subject: [PATCH v2] gpio: shared: handle the reset-gpios corner case
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251125-gpiolib-shared-reset-gpio-fix-v2-1-4eb6fa41f1dd@linaro.org>
X-B4-Tracking: v=1; b=H4sIAJyCJWkC/42NQQqDMBAAvyJ77hY3WGt78h/Fg4kbXRAjGwkt4
 t+b+oIeZw4zO0RW4QjPYgflJFHCksFcCnBTv4yMMmQGU5obkSEcVwmzWIxTrzygcuTtlOjlja5
 hqsk+fO0s5MaqnPXZf3WZJ4lb0M+5S/Sz/5YTIaHzJZnGc2WrezvL0mu4Bh2hO47jC2VFOoHLA
 AAA
X-Change-ID: 20251121-gpiolib-shared-reset-gpio-fix-c8e161b9f6cb
To: Val Packett <val@packett.cool>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5799;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=Bh4WSLi6y/CnVH3wsSIW37S1oJbk0T+/9wnfMDOpxrY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpJYKgXlWqwGiMyybTu1eEQuKBS/GGqWEztq0G1
 Stt4o0MRM2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaSWCoAAKCRAFnS7L/zaE
 w8RpD/4iTjKDMaSQseHyBVPfP6DcSIFr6FMR1aaoASkR7Ung6+kb13y3dxPvAfLSqQn5+qFvzGL
 ZErUbONFVgA7xx+dtSlnSDkJNwvl8XXKuYiWtRexZUisSarB0oZa0S+1GqPTE7t8J4zcV2IK6Rn
 tX5EXLaWv5zo2ncE9y3r0f7rjRNUW5Y7OZ+DgeAEhUg75o7blDvWHKBHiZ0XPX9E0OBoJljR9fN
 Ikxys1kJLn2FsUYom/cXsl+c2JpqQwEafBxaPzbl/kblWTzkH5pNbjLAKIaF5P2fdireW1KnD31
 vjXGsUATf4NPeCwFrFVXIRpnB0pOyae56jzoB2SQK7Sn9IR+A9dDUXIZXFO8ZzF/kTyoNasTZk+
 nuuJovWnOswBJlT2OiW4Q40Iwv/bmyqZeNqWQmV2kFBzbhF/RgZimMJxspoG/pWUuBwu4FG54Xm
 xO5bRt0iMg23UQd3hCIPck2Z0g3IRBH8ysVLcX88rOEivVtEqDRnqWsKfwUcFXsdU3Pq5oEDZmj
 Oyav87GhqHJorCgb6bi9OJ0VgDaQuUvGzjVWU/m/up6Yv8fU8y05sT8E74Tv5JzduNbKzf9efdg
 SqiR7XMUjBhn6ChCyKPaAmFtNUOFZscotSprdrfcw5Delickr82uZ4XBinId1gcFB3bfVA+09ER
 8w/HRWgDZR/Cfkw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

There's an unexpected interaction between the reset-gpio driver and the
shared GPIO support. The reset-gpio device is an auxiliary device that's
created dynamically and fulfills a similar role to the gpio-shared-proxy
driver but is limited in scope to just supporting the "reset-gpios"
property.

The shared GPIO core code does not take into account that the machine
lookup entry we create when scanning the device-tree must connect the
reset-gpio device - that is the actual consumer of the GPIO and not the
consumer defined on the device tree, which in turn consumes the shared
reset control exposed by the reset-gpio device - to the GPIO controller.

We also must not skip the gpio-shared-proxy driver as it's possible that
a shared GPIO may be used by one consumer as a reset-gpios going through
the reset-gpio device and another that uses GPIOLIB.

We need to make it a special case handled in gpiolib-shared.c. Add a new
function - gpio_shared_dev_is_reset_gpio() - whose role it is to verify
if a non-matching consumer of a shared pin is a reset-gpio device and
make sure it's the right one for this pin. To that end make sure that
its parent is the GPIO controller in question and that the fwnode we
identified as sharing the pin references that controller via the
"reset-gpios" property.

Only include that code if the reset-gpio driver is enabled.

Fixes: a060b8c511ab ("gpiolib: implement low-level, shared GPIO support")
Reported-by: Val Packett <val@packett.cool>
Closes: https://lore.kernel.org/all/3b5d9df5-934d-4591-8827-6c9573a6f7ba@packett.cool/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Changes in v2:
- Make the reset-gpio checks stricter to cover use-cases with multiple
  reset-gpio devices using pins from the same controller
- Link to v1: https://lore.kernel.org/r/20251121-gpiolib-shared-reset-gpio-fix-v1-1-cf0128fe4b47@linaro.org
---
 drivers/gpio/gpiolib-shared.c | 81 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 80 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index 3803b5c938f9933dab01c6d777c349ed3b42ce9b..cc8646f563d2fa7b1972c94c734b19c4cb01244c 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -253,6 +253,84 @@ static int gpio_shared_make_adev(struct gpio_device *gdev,
 	return 0;
 }
 
+#if IS_ENABLED(CONFIG_RESET_GPIO)
+/*
+ * Special case: reset-gpio is an auxiliary device that's created dynamically
+ * and put in between the GPIO controller and consumers of shared GPIOs
+ * referred to by the "reset-gpios" property.
+ *
+ * If the supposed consumer of a shared GPIO didn't match any of the mappings
+ * we created when scanning the firmware nodes, it's still possible that it's
+ * the reset-gpio device which didn't exist at the time of the scan.
+ *
+ * This function verifies it an return true if it's the case.
+ */
+static bool gpio_shared_dev_is_reset_gpio(struct device *consumer,
+					  struct gpio_shared_entry *entry,
+					  struct gpio_shared_ref *ref)
+{
+	struct fwnode_handle *reset_fwnode = dev_fwnode(consumer);
+	struct fwnode_reference_args ref_args, aux_args;
+	struct device *parent = consumer->parent;
+	bool match;
+	int ret;
+
+	/* The reset-gpio device must have a parent AND a firmware node. */
+	if (!parent || !reset_fwnode)
+		return false;
+
+	/*
+	 * FIXME: use device_is_compatible() once the reset-gpio drivers gains
+	 * a compatible string which it currently does not have.
+	 */
+	if (!strstarts(dev_name(consumer), "reset.gpio."))
+		return false;
+
+	/*
+	 * Parent of the reset-gpio auxiliary device is the GPIO chip whose
+	 * fwnode we stored in the entry structure.
+	 */
+	if (!device_match_fwnode(parent, entry->fwnode))
+		return false;
+
+	/*
+	 * The device associated with the shared reference's firmware node is
+	 * the consumer of the reset control exposed by the reset-gpio device.
+	 * It must have a "reset-gpios" property that's referencing the entry's
+	 * firmware node.
+	 *
+	 * The reference args must agree between the real consumer and the
+	 * auxiliary reset-gpio device.
+	 */
+	ret = fwnode_property_get_reference_args(ref->fwnode, "reset-gpios",
+						 NULL, 2, 0, &ref_args);
+	if (ret)
+		return false;
+
+	ret = fwnode_property_get_reference_args(reset_fwnode, "reset-gpios",
+						 NULL, 2, 0, &aux_args);
+	if (ret) {
+		fwnode_handle_put(ref_args.fwnode);
+		return false;
+	}
+
+	match = ((ref_args.fwnode == entry->fwnode) &&
+		 (aux_args.fwnode == entry->fwnode) &&
+		 (ref_args.args[0] == aux_args.args[0]));
+
+	fwnode_handle_put(ref_args.fwnode);
+	fwnode_handle_put(aux_args.fwnode);
+	return match;
+}
+#else
+static bool gpio_shared_dev_is_reset_gpio(struct device *consumer,
+					  struct gpio_shared_entry *entry,
+					  struct gpio_shared_ref *ref)
+{
+	return false;
+}
+#endif /* CONFIG_RESET_GPIO */
+
 int gpio_shared_add_proxy_lookup(struct device *consumer, unsigned long lflags)
 {
 	const char *dev_id = dev_name(consumer);
@@ -268,7 +346,8 @@ int gpio_shared_add_proxy_lookup(struct device *consumer, unsigned long lflags)
 
 	list_for_each_entry(entry, &gpio_shared_list, list) {
 		list_for_each_entry(ref, &entry->refs, list) {
-			if (!device_match_fwnode(consumer, ref->fwnode))
+			if (!device_match_fwnode(consumer, ref->fwnode) &&
+			    !gpio_shared_dev_is_reset_gpio(consumer, entry, ref))
 				continue;
 
 			/* We've already done that on a previous request. */

---
base-commit: 71dfa12e37df94917955574484b122abaf0e7bf5
change-id: 20251121-gpiolib-shared-reset-gpio-fix-c8e161b9f6cb

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


