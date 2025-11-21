Return-Path: <linux-arm-msm+bounces-82856-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 82973C7A038
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 15:11:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A7484367FC0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 14:03:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A045634F473;
	Fri, 21 Nov 2025 13:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="nKswA7Kc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC27C34F241
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 13:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763733469; cv=none; b=VO0gZ1xVydlqmIEYs68c7wgj8UpFt696bjcfWP1egBLABCHRVWjicYkFldveMofNDGo7nNxedzVl0f9XhuOoGy+OAj5V4XN3aOkPmVcvQIZukIgST+GyX7Gaq7MykI2cvjuOKEkcrwp9KOoi0n+jAUsoueBd8VkuLmUf8s8C3aQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763733469; c=relaxed/simple;
	bh=9hfR6lPLiYKZuGG6OK/BuGpIW+kaFDskfdiaSoP2Frk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J1BHayjNTykwFQWM0sh6xzm0ahIegcJ4gJ3URIcYQIXLwf9qJublwpyletsEIH86QhpSSeiO1awWiNqH+B/ngxWC4dd4V26CO6L0UGI6+yI6sNXqavIJWgEEx0LhGD2DRsiWt9cEnWwR/3XKWX4R35dTjNMgK8YTQJ3I0xNvAx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=nKswA7Kc; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-477770019e4so19603375e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 05:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763733466; x=1764338266; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C46FqWkUX4UlmSnKm4hBuwsXTT8KxEdpLSw3EKSN07E=;
        b=nKswA7KcSbI8H8GJFXA/rC07DgH/xVwQ9J/ip4x0FiyNle0hRnpr7wdtOGN2VAi90K
         COaVZ5zPyJ6XbDg62gBGFAfe8hL0xnbcY0z2RDXDelsz9AdhIPS5RVCyWRgg3uJG8erL
         wuVDBYspJoLWlRlp1dVLF/QmImHVC3Rgs17TP22PrgasoE90LLnOfner4cQzn/yeHpEc
         Jr0k7UcnU74PmZE91g8n5wX8TRtQJhUxtDjkv5V9z9K7s/ds6e/ep2cgHcJ9ysTM++dW
         3tiTRXrp5BuIRmD3ncDU6DOi9qGqKCiV3nv2/w6qOI7E6U56s+Zqm2rglXmRqlO+eVE0
         tt6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763733466; x=1764338266;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C46FqWkUX4UlmSnKm4hBuwsXTT8KxEdpLSw3EKSN07E=;
        b=KiPJsrJEo17BgfG9IojMpnjdjFt/S5Xez3FH9UQdUJ+TE7Ah19ZyGVBZw7JMb3YSVD
         MPlJQTNqCh7rAptRJJiPa5jlN3I5Mih1b4uHQU1/eU8vrQ2TCXSd1pHmxUqIECSy8Ddq
         oUl2hgNjC21qHosMrqTPAGHNkA/0Q0aUso4cX/hidtOBlHQWkJqrDUE4R6UOE0LgA2nq
         4FAe4qf6f96xMggWj7zpB3mbfmLkZe4wZ8xUfhPwiqJNWOXgve2lekMiJebQ0EipzFGv
         BqIBcdMeEs31o5ASleLMSyBAevGeVbShiuKVliv0pdlxT1Ux8iko7ioUMp5IbORx5mjP
         viyg==
X-Forwarded-Encrypted: i=1; AJvYcCWAqhtXZhIVrA1/MySRET+RK/HdOovm5OYIBOe3lHXvqHeL/QQkGB2SZ77g91eaYcR+KVOZyyydeszNgtH5@vger.kernel.org
X-Gm-Message-State: AOJu0YxYchU4168jbo4kuYgiRFrZGU1bB3EDuj9UcSzdw1oKZl9YkqlB
	LGPMcat2XScav+fPswDHQ8TiqeOa/RMSAVm3ewCVUgKTbrVe6SmyrKhUXfAUcj0++/A=
X-Gm-Gg: ASbGncsHZwjpmCeg+sP8M00jfz/KB9lrhkZjUgLSGmySWKGEsEyz6fjZovtK74xlvh+
	3W0x4HwoVlXaM20OLGWL2r4Lhd8IbLr95RpIAutkzZyt8sv4/mMDf0noD/VkrAcBmUmz63lyhpv
	PseUE/uafyLZYd7nT5Ms8qWbu4mkIiqVQqFiVfUnfgY1Qx3UAEILmao/yWNogz2UE8QducvO05G
	JM4TSXWOkp5dVIQe+AZOJI6Rpy937KZIDkcAI6d5R4vktk/Ai6lT7g7eqwoG3j83xCoEdX0CJPe
	QwMZmS13TMK/EYpB+hMYgdDwOHdxlpjADEBnTDPmOeRQ8yq+RTH6skBC2YlnmA6tnj9RF2m2cD6
	pLb4TJHG4b0WZ95JNt0aKWekDoTIg1NsnBiONpL5Z04+1TDPxvcpB4NNiZOrVFB03TwQBgHtMcT
	knwWckyw==
X-Google-Smtp-Source: AGHT+IFxZ+aospWVN4yYPZGiuL3kA2QfNDwKLhCYMijVUFbLykgza4SWebMBQHazSsPDgSCoGjLTMQ==
X-Received: by 2002:a05:600c:470d:b0:475:dd7f:f6cd with SMTP id 5b1f17b1804b1-477c01f751cmr27140375e9.35.1763733466112;
        Fri, 21 Nov 2025 05:57:46 -0800 (PST)
Received: from brgl-uxlite ([2a01:cb1d:dc:7e00:ab1f:63b4:bcef:12ba])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f34ffesm12155648f8f.10.2025.11.21.05.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 05:57:45 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] reset: gpio: add the "compatible" property
Date: Fri, 21 Nov 2025 14:57:39 +0100
Message-ID: <20251121135739.66528-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

In order to correctly handle the interaction between the reset-gpio
devices and shared GPIOs managed by GPIOLIB, we need to be able to
identify the former. Add the "compatible" property to allow us to use
the device_is_compatible() helper.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Philipp: this can go directly into your branch, I will fix the GPIO part
in the next cycle. For now it just parses the device name.

 drivers/reset/core.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/reset/core.c b/drivers/reset/core.c
index 843cffc939097..b56dace6c42ed 100644
--- a/drivers/reset/core.c
+++ b/drivers/reset/core.c
@@ -898,11 +898,11 @@ static int reset_add_gpio_aux_device(struct device *parent,
  */
 static int __reset_add_reset_gpio_device(const struct of_phandle_args *args)
 {
-	struct property_entry properties[2] = { };
+	struct property_entry properties[3] = { };
 	unsigned int offset, of_flags, lflags;
 	struct reset_gpio_lookup *rgpio_dev;
 	struct device *parent;
-	int id, ret;
+	int id, ret, prop = 0;
 
 	/*
 	 * Currently only #gpio-cells=2 is supported with the meaning of:
@@ -953,7 +953,8 @@ static int __reset_add_reset_gpio_device(const struct of_phandle_args *args)
 
 	lflags = GPIO_PERSISTENT | (of_flags & GPIO_ACTIVE_LOW);
 	parent = gpio_device_to_device(gdev);
-	properties[0] = PROPERTY_ENTRY_GPIO("reset-gpios", parent->fwnode, offset, lflags);
+	properties[prop++] = PROPERTY_ENTRY_STRING("compatible", "reset-gpio");
+	properties[prop++] = PROPERTY_ENTRY_GPIO("reset-gpios", parent->fwnode, offset, lflags);
 
 	id = ida_alloc(&reset_gpio_ida, GFP_KERNEL);
 	if (id < 0)
-- 
2.51.0


