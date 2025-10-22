Return-Path: <linux-arm-msm+bounces-78335-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B06BFC273
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 15:31:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A1718568051
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 13:15:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A31BA34B681;
	Wed, 22 Oct 2025 13:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="GtwNNOqd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F4E734B413
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 13:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761138686; cv=none; b=lSeM0HMwhKxBiv5r3Pa80sK7KD4AwtAYybUc5JfsN+TnT+hXJgUhYl/paKS3Jlk3VDqtUiIC+L7f3K2ndaqwj+K7/alvHFrpfe5FgmxMPBW2tR/I68YkUSAm8pFyFqZmu4RfZwgXFSM8L6VF3frPY5LBFcdw+2K3IMUPYvUCNSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761138686; c=relaxed/simple;
	bh=stH3r1LHkClCkcDML8lbPe+sizlONl6NhOJhh9xR7lY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i1t7WJLoZ1k5kQkvjZA8RTtuHK2ZHdonQQgluuSReCj92DkwaYEW8rMOUcQSZCFP/flZWOBxu6UDTQusIvA8gh2pnTy2ogPeQU4RTTPldA5SKHZgakuh2xtD0COgUidMrsi+XeINL3jugG/Rph5py2vujFw7338D7cA2QcpxyGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=GtwNNOqd; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4711810948aso48486525e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 06:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761138682; x=1761743482; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KIoKmjIInajLiemN3aTwTX5GXSgnREsQmJKoJ1Pkspk=;
        b=GtwNNOqd+3jlSwKgIEOyDgmxAS5B8M+Rj3gvNzrDFgX049wlW2V92ERVsdPNzxF9Ak
         DUTwcKKhVxvBfaUl9RPdBLz2ucR3H9pTuqUvyMN1xy4tMcp0P9kgrGmd1GptSg5kKhcb
         1faAHMOPEPRDEpNMsoyWhvUsM8tUT/+k/znpp19r22mJLHeu5SUh3nRXwvT+2x2CXpgv
         FKA/3IkGa//zx2cARzzdRFoYXFofUEdf7N5vJOJ5BT00i/vUIbVwh8biN08Tn6xa4faY
         tAwm+d5ylHAxpiOxxAfsMlvaAEgk38zanr3ZOTIT2mX+AuTQ4Vpqdbf3b7ExxtonFA1W
         aGrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761138682; x=1761743482;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KIoKmjIInajLiemN3aTwTX5GXSgnREsQmJKoJ1Pkspk=;
        b=IcYdt71FAZ/9BhniN8Adxrzgs86zeH3H1DkwOWqSjmAhnMJwXAbNnoKhifdEiLH5S3
         5fN9yMLt5pTHvGvAJ3UPz++tGSd6kLtapAWpqng7eTol+vLW+mDKQHvp7aq38lXNxxFR
         5pjGHaG0T0uBhQkMdp/djUlKVSpqEZLNBgjv9kteX3cO5HgLHsDcnCBeTT8EGJhqI5Re
         ybM3MeSv05vqOdvRcKLnePbhIKScAk6+T4zHHgMGfO/wPza4Z8IrhcW0NKQ7WejG6u1r
         Di5HA4bTTy1ELCn4FSVWv+xKdRcw+kW83b43kFSa5Dky8TiPucd48Qb06dkTiU+zSZQP
         WS2A==
X-Forwarded-Encrypted: i=1; AJvYcCVyi9+CmZ6pVosbYxQirNmii6UXIEn1F/IEh4lWFhbPKHkTq4DEl976tHIak8h5rXmAMakO6jNT3jnLNN0g@vger.kernel.org
X-Gm-Message-State: AOJu0YzlZfy4rR6DSy0j/RaNH6SYjbmjxVcFgKjtoD4E+1/UsaJrYS5x
	+uECwmuCqHT8Fk9IRRavDeWtw9Cdrh7rGpYExvMk7nf6HH/Jekb9xGjTC0qJYoYvhio=
X-Gm-Gg: ASbGnctA2wLVVGRzcgNY29HAsrp+/TGSovcjrcmmqDO7UR/UxSQy1vMNmye+D1qdFN+
	3fBUqTjycft0/ln31N4U6lpPgylPmjTjeRnFE8vQEfCRpligbx5XcioHufle7Acn7B6avqqkQdJ
	/n2mMTcTGuMbtcZYVULpffreKRCzllhJV8036Yd1z4jtCw33sKEeuLW1YQVXYVTpL55zvRUAqD5
	Afw3KojE96W3BOJn6wd1kyg9ZDbtbQ6m9Lw9BvnPpcr1EWT6P2zBxyJMrWyqk4HTdPv434hLeHo
	QinkOjDxk8MCCCQUwdqPI9UGTDwoVelKLaS0zTeD6V57bA4pk3lMNAKj1tkFdIiqORN6H08hha6
	3q+j+7qzhKzIlLtUdID1Wgy5Zm3XZULfgo4DnhCBlYAlez16L1wOXFBXB3qTjQABmsv9x6MDqqH
	t8UG/V7g==
X-Google-Smtp-Source: AGHT+IGkIuCyg+IuvK9C8PoKW8hm0lv3AC2LKI6qqGW0oK7q5GOxpXH1DI2XWiXLmBBfGx1o6tVduA==
X-Received: by 2002:a05:600c:3b8d:b0:46e:4883:27d with SMTP id 5b1f17b1804b1-4711791c8d3mr166553265e9.30.1761138682075;
        Wed, 22 Oct 2025 06:11:22 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:69df:73af:f16a:eada])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47496afd459sm38839905e9.1.2025.10.22.06.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 06:11:21 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 22 Oct 2025 15:10:49 +0200
Subject: [PATCH v2 10/10] regulator: make the subsystem aware of shared
 GPIOs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251022-gpio-shared-v2-10-d34aa1fbdf06@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1358;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=p+y5IQEHjJOnxni5Zye5YZtGuUrzZOARpYGAZB998dI=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo+Nfe/WgJn3MUlv6tip0kIveOZg897ohp1tW6c
 islxAr8UxuJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaPjX3gAKCRARpy6gFHHX
 ckM8D/9Wzn/ftmZoRgjjTg5RZ1xRGR72VM20yOSyWEGtCSNeu4uUvBMNAdArlUONgpBYOFuCQ6f
 jxeo2x6+b3i0y/TKIIqp8XOebUFaChUTpW4V2aTOTzZvTL9CQWh7zsEHSztQvU9oHI+7XxP8KMW
 9CY/L3iA8HVGuidSKPr780WTf1ctlM73GpwS8DZHS/+4f9kx8503W6W622tEi7x+fNx7TMYJnE1
 8SkUCFoyxWoLyDmWJFr4Y9uXOrBzTTdTf0h6dGmUMoAVAYCQx90fRDcywibndcFyxTUs/XULCVl
 WcQzccUha2IfGjR+TpqQW/LtoW8xc7Vjig9winnhfWlIrLu0ddM0Xy3AjcWQGeiHoIGUGYy+vi8
 gbRAq4h6J5vlyLsZIgr+4Q+AgPz6xZtpNyVc8hSkFHVQITKHY+xY9gRPIaptn0fMtoCSE7WslZ+
 9d7gHhQrdmlUDrJI68PPaPDaWumjqblocdZYLUS3nxddlkaOEzremAVAmSg2BK6TDEIBagmde57
 lz3x7gKQp1EHI5GrfRSyIHKSkVKyTDnYFAumAYlYaVLc0UBrIvJPqQxUNkn2GGTWLOVC8qb/sgN
 +yauMt1Nu2ItKQTye6/6dBoSixx98QV5zlqOqM0MICJlNSyqWLbPU0uV/Xq2uI236ar5Lzwo/ie
 jAmXnk1wKw3Geaw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

GPIOLIB is now aware of shared GPIOs and - for platforms where access to
such pins is managed internally - we don't need to keep track of the
enable count.

Once all users in the kernel switch to using the new mechanism, we'll be
able to drop the internal counting of users from the regulator code.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/regulator/core.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index dd7b10e768c06c83d2a4fb5dfd0fce8d796c9185..f9690f0689fda85123d07967f3c87105829e330c 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -2616,6 +2616,13 @@ static int regulator_ena_gpio_request(struct regulator_dev *rdev,
 
 	mutex_lock(&regulator_list_mutex);
 
+	if (gpiod_is_shared(gpiod))
+		/*
+		 * The sharing of this GPIO pin is managed internally by
+		 * GPIOLIB. We don't need to keep track of its enable count.
+		 */
+		goto skip_compare;
+
 	list_for_each_entry(pin, &regulator_ena_gpio_list, list) {
 		if (gpiod_is_equal(pin->gpiod, gpiod)) {
 			rdev_dbg(rdev, "GPIO is already used\n");
@@ -2628,6 +2635,7 @@ static int regulator_ena_gpio_request(struct regulator_dev *rdev,
 		return -ENOMEM;
 	}
 
+skip_compare:
 	pin = new_pin;
 	new_pin = NULL;
 

-- 
2.48.1


