Return-Path: <linux-arm-msm+bounces-53308-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5457BA7D00D
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Apr 2025 22:02:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1654C7A48C7
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Apr 2025 20:00:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E236A186E2D;
	Sun,  6 Apr 2025 20:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="do0g/yUD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B48192D8F
	for <linux-arm-msm@vger.kernel.org>; Sun,  6 Apr 2025 20:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743969713; cv=none; b=nG1+YypXw8xQ3MJLKHog3C57Iz4hThhlfeZjoZr6r1VMDI7Mq7LKrE/+r/kMTKgbdpa99B0bplqu4jmsHz0NQnOSb7ldy144K6Wxv5+9/Kyzcn9E1aV6NSUqG+7+ILxAvdDyqB7oBB8qXDv+tQYDd7UVNXTgtP3aLadZ7+tavcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743969713; c=relaxed/simple;
	bh=JTR/P3EkGZofvJK08o84UvnirFpKqEhg8gq395B9I70=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iO8cRU2e1UCuK830BbGu01Q5/k3z22zGU42MKjHgQ89aYNllTFwy+/de1MFcucybDKXnbhSqzy2SbBpTIbkJSk+I+ecsQKr600CcCOtkW7tzcr1872rz//cQQ+0SnFfaUrKIR1TchM8XKv9CaXTVCTG6ZCr1zAxxgR8wEG4cRa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=do0g/yUD; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-39ab85402c9so448135f8f.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Apr 2025 13:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743969710; x=1744574510; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oWlwiQDg0h2Z8rmTGPwySdCuGsBToV5oB+DTAJXaZkw=;
        b=do0g/yUDNfeJzZ5wYBFfoutJcxGWBxO/csMx0pdt0eEc8UK9B+IgqFY4nw+qR6E8Bi
         sPDFcwZQQDDsmCO9T3yVWzlKGA8qujuDQnfRAUvfCWy6BjegurzWmscAU3cNBcYPM0hM
         fQrz6ticrK9iJdPVXRNTV5KgTh5/Zkh1kJgwabKi+/4rLqCx6zAEqnAutkI7oi/oXC4J
         oj5jKoNq4MQbFh0DMarSRkq9BZ62C8WTKBRlUwmbQ19dpH4PwXc0zWBVyr8JeCTT+Wvq
         pWLM1VGGCRlPjp5XKPi1McHg2SjAdbPAin82IpNRJYMWuAw0T7m6WJ1mU0iyDAPPxCES
         s29w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743969710; x=1744574510;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oWlwiQDg0h2Z8rmTGPwySdCuGsBToV5oB+DTAJXaZkw=;
        b=oMAuGtdafFg77ms6+EnEu4N8lyROWpUbmAx1UNEY2iiE3awKkE4YLJRsqxNH6JjdyH
         rxn+fccqh5QfiSfH9Ab5/A+SdIWnPJWNOoMjIia6ej4Dzsk5G0Lq6M7J4o3jbKWXaYSw
         dpB0ODdJh68YmVDsRkQjPkqDv9YZ87y3hx59b6zl5mkB4XBh6u/Kww8LoAplZupIZysr
         klxdADwgwuqXfBsuKjs3AceY1ee1ZI/TXhdZ7k3iRhNUcdb1BZUCr3rsR1m8+LqfkALF
         UhqcwgkhRPEsVxOFYRyVZZP0a6eujzEoxl+2pXP1aDwv2J1CMed8P/qh7BVb/NztJMUw
         nAZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFOciozXXvWGrpJU/GIA6ysgj60Eqe5IjWqIYHMAEF9P0ziPyEvne0tgm08wg1sUj0Gwa77cHj8y8/4DEL@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6U0oWiDiBueMSlLiNDJDHKKvS1T3h9OBLmh4fQ99OWueGoN7W
	cBvWLENY+CCoyj2yfnP0ma//nGakNPQtBibr0Pyx34jxpG/3CcYSn0Tc2rMMBjY=
X-Gm-Gg: ASbGnctotzAci+QfhB0W1n8dJ7+Y5kvoGKXOtHpjxTjoUfdWoF0bb1i58gxXySidSRH
	M7HLIWEl/QVXFU+/lI2AzBCY8EcjHrd93mIlG++SWHQImnP1ubcxS2/dJcBYVhWnEx8BzUJ7uHs
	FX4f6I+Xgnqy8/+v2eR6Uknir7gvsUFaOOd6GJIRN8vh4vfeS3hq3fZO/Vwws2UcrVrWjKeYAnC
	tz+9ic2tsD2peFQWJSWNhtEV2Xgsk5JmkYGS2w0AV/MmVhBCZ0ASYZ+tDD69Bpg3WqCbVaBgWOI
	8Vv0NrtT/S9rRuIh48PCrVShldzBnqq790y78c+N5b5cvZ2enyMmgWyzQoMieug=
X-Google-Smtp-Source: AGHT+IEZjB4MI6wC9+JoB/jO2g6h/C6OH9uFv3PiHq9NZtSTSQkamc0Yiv5WCgkk3m3FLqGD4ixTkg==
X-Received: by 2002:a05:600c:a4d:b0:43d:fa5d:2675 with SMTP id 5b1f17b1804b1-43ecfa5aa44mr35392475e9.9.1743969710316;
        Sun, 06 Apr 2025 13:01:50 -0700 (PDT)
Received: from [192.168.1.26] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d98bsm10199924f8f.76.2025.04.06.13.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 13:01:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 06 Apr 2025 22:01:42 +0200
Subject: [PATCH 1/3] iio: accel: fxls8962af: Fix wakeup source leaks on
 device unbind
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250406-b4-device-wakeup-leak-iio-v1-1-2d7d322a4a93@linaro.org>
References: <20250406-b4-device-wakeup-leak-iio-v1-0-2d7d322a4a93@linaro.org>
In-Reply-To: <20250406-b4-device-wakeup-leak-iio-v1-0-2d7d322a4a93@linaro.org>
To: Jonathan Cameron <jic23@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1010;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=JTR/P3EkGZofvJK08o84UvnirFpKqEhg8gq395B9I70=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBn8t2pUcGp11KcDBPbWINpnXNq1f8z1KQg5S0km
 HZ67mDWZfSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ/LdqQAKCRDBN2bmhouD
 1zfEEACYo6+sMdke/FBBVYQRLHP+qNj5MfxwUFwuDCgH6dBgvPzD2DljR4eYT8v6/qxOcAafsEn
 FsLSPN+2ZqX9U2sAvePioblX5EhBn9chywso3k9ISsHhcdzxKFQcAS7KUM0HbEB8KWmh5FX1ijH
 HfFUlNK9uSE57jw19nRFYFNnAlA4VlXbtQzubeYiSz2hoRXwDu2V+TkssQ/AlW/yKgaz9tP9tjx
 7FCeXeKJpybmwbA2+kw8cGkA33x8lZgd7U2CwdFOjQ8uxL+ZDmypk3ck49VrXtl0c3i3WfDbWWt
 6pWYHQ4grirBQkBRquN6tRjpvpuG0oLmCKT3YwB8xUB0IJY6BlIvdH8rUPKvvKvOKtJUFHmAPtD
 VpGC3gnzoxM8xR+1X5Bq21KS2HVEnF/Y3XqUe1tcnuthYcbv2auhMRm3AdL8lhHafCLOnJvcikW
 vKHsZSCoo5POCsUGj077F68cJnw+FgKa1YIKKlYLMD9io2sh+5kfbnsuG/9wpXAzV3QkWC3iwgD
 goADtSNKF38JVatHDTbPnG449E24D7M/36949/OQRZG6KTOGVbwntV7Y5adgS5qDmImDsZ2pIKt
 k6mLLfhfkpnsIH3ybYQeetcsBtNkEomPfz5/fFgxgrGC2v27gAZ8ygJTOd1EDEuFst6medTHKoX
 jlevVgAf+BBUVXw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Device can be unbound, so driver must also release memory for the wakeup
source.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/iio/accel/fxls8962af-core.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/accel/fxls8962af-core.c b/drivers/iio/accel/fxls8962af-core.c
index 48e4282964a0698d422df49739365648e19bdef6..bf1d3923a181798a1c884ee08b62d86ab5aed26f 100644
--- a/drivers/iio/accel/fxls8962af-core.c
+++ b/drivers/iio/accel/fxls8962af-core.c
@@ -1226,8 +1226,11 @@ int fxls8962af_core_probe(struct device *dev, struct regmap *regmap, int irq)
 	if (ret)
 		return ret;
 
-	if (device_property_read_bool(dev, "wakeup-source"))
-		device_init_wakeup(dev, true);
+	if (device_property_read_bool(dev, "wakeup-source")) {
+		ret = devm_device_init_wakeup(dev);
+		if (ret)
+			return dev_err_probe(dev, ret, "Failed to init wakeup\n");
+	}
 
 	return devm_iio_device_register(dev, indio_dev);
 }

-- 
2.45.2


