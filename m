Return-Path: <linux-arm-msm+bounces-79428-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE14C1A020
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 12:28:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 20274467DE5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 11:23:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3960B33F8BC;
	Wed, 29 Oct 2025 11:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="dDOzwtaa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8496E2773CA
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 11:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761736882; cv=none; b=OnnuMcv4TNi3f8t/hz0mtXJtkzkT734aLBN4+bGJtecjN3sygqUbWa3Ka0mJ11xa9ewTe+25KbAkRh/XR3OgobMEoEbe4/33Oaoc/UrpiRthoJZIKXHiJzsYkSp3QFGkU+tbYQESQfeGwXEOevc4MmiMXMFECS/PWHU05zDqsNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761736882; c=relaxed/simple;
	bh=+ydNsxmsAlBQnhT7Rao8bdkeqweoItUHWkkNDmPd0sQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vdt+aU1JMnsrvrIvi+b0NKGiqqK32BCNIYjHP0eA5zxQ4nc1JMmgWDbOFKnxUgnE7rOGRV/JoAignExIdC/2+8cpEp4/GviFF4fajk/1hLQ5v6/BhoTdSVq9UPdxprZ7FyDuxFEabfiW63XH3Ji8l7ogT8sxRk2bbI3w8Fc3WPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=dDOzwtaa; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-475dbb524e4so29349185e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 04:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761736875; x=1762341675; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B2rTEU/R4flNUm5DKfIw19dyA8fnd0V3L0Lxu0SXKBI=;
        b=dDOzwtaa9OQ7o9Ckl2Jvh/FjC6JHGpP1WSVC0EUyh41S2UOSLX3hyVrSl6cqKqUErD
         TGFxFr0Z9lL/JMaD5NFSIZJakAp32vHn7uvEgrvuxfVi2f38ImhiyI9tfBeGH4EZ2QMV
         q1RH99Ek98k7q+khIUd7Up9x+OT1XV/EpjOQgCVcyXxqR1GcvwPz7Ih80PMhNrl4Xs4A
         zuWLHV3Pwx4DVX6YdU0Kga0jTGqqTXVFpRnAW3nuzX77tlatd51xAIXS0wBdi99nskO0
         uFIM56CnTiSkCgda/3PcFYEHJw5T1uHsJdD6myNDswec7Sh7vE+oJ0b23sGdzWxC36V5
         yOFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761736875; x=1762341675;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B2rTEU/R4flNUm5DKfIw19dyA8fnd0V3L0Lxu0SXKBI=;
        b=KNT/Jlk+b3Shb37rfHGLLKyep6h716ZqWqr3aLMBMqlUhkGRvk7VqH5bYnwR8wdS03
         ZAHV+sE7UcDerXIFJKcUjIVijU7/EFHSVwY+3ZOd0J+nUIvloV3nq5ZNk9jSGMjyRsf3
         CYJgzCczNKfsuOfNae/B1NB+lLagR6ys38HopdcxJKMqqvH9PRR446TA+lf9sx0eKD0o
         AdB81Oap8A5XQB0sOsaUBE/HRY6J3et1ODN6rsnBNConeAxOOGMIPMXUbIJ7gKlzgZ14
         wTXVkxz72JH3Va7ogtqU1HsMydkaN8fAG/CgkGZF+cNxvuyDTgUSlru/XMQKJYi9Kx5g
         VOZw==
X-Forwarded-Encrypted: i=1; AJvYcCV8jxwzktZQOgohvrxC7QhxMIwcHDIYrRynTvhDZJm17/hmzWjrM1QPePEjbAtOFGeD8wd360aneBV1g6G8@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ+CLB556pf/NMHBV3AhEnG2IiLZ3PvBxtD5AZgRJGl20aIVYh
	IUkDLSlnHYjWNE+EsfG1R31vK5xz+7KW10QYfKDV3ynJ62kdWG5WUta1ReAFexEBDxc=
X-Gm-Gg: ASbGncuc+/b+MzxvUND5QowK2gm9Lz8K6SifRiNPud4mN9BK2c+csHF6slUb4SQ/hub
	HU9oblWNWEPUgnvkc7brMqmRgNjLvvx1B2PXXfgDzj+NQdRnHoVDnCaS92ojmzswK1J5ac/ITHL
	PoJPHqoA/t745YVP8Z0FQJrzm4IN3q4lDaRL4r8jSvndiF1Meflc12W7DueCXZukIJRuA45CWZk
	d26sJfGk5IbQDqSOyWmlytaVTU2BybaRcq5HYLE3OaiOL+oWoxbLJBF7JIy7ko2b55Q9kq0itw7
	6Ndu84By25+RpYmmR3yRdzY5Agg+kXrZ5eniKuF5thp4uriQw8CI4BCFijiDQ0WF1q7lVMWBDlm
	d4ds+dA43Kh4GRs6AAqJcpUstgsVL1IUPdSao6RqyuZJ9GBX1DBDW5/6zb8LwMVHhDG31Vg==
X-Google-Smtp-Source: AGHT+IGR7PwU0mQOpYzSCMCZbMwDSmhLvLVnDgvEOcrKX+beh3H3tKQBd4cE2sGECLQ4LCyzu99rrQ==
X-Received: by 2002:a05:600c:c48e:b0:477:942:7515 with SMTP id 5b1f17b1804b1-4771e17e177mr21559155e9.11.1761736875026;
        Wed, 29 Oct 2025 04:21:15 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:69f2:5f2d:9ffc:a805])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952df682sm25657486f8f.43.2025.10.29.04.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 04:21:14 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 29 Oct 2025 12:20:46 +0100
Subject: [PATCH v3 10/10] regulator: make the subsystem aware of shared
 GPIOs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-gpio-shared-v3-10-71c568acf47c@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1401;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=GIqAeLMClqYJzQksRPUzaJ9e76p5dkwgt728MWTS1+0=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBpAfiXYH7uSZSvv2U/L5oE1AwbmsCdQLfg+BT6I
 BexNof4UFKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaQH4lwAKCRARpy6gFHHX
 cjuVD/9pKMy9xOMmFOqySa84qtPZZ//MaWg8zuKJKEL2j3t/Hf1aiGZpWMx1/YNjCFZIAGQ3H0A
 NmjnygexP/IQFMGnRRSzA3mCgF/IU11qJSprjKr4evOZYIqoMxfFlWR6eDpuSncPQmqpCSV9MDl
 YZ35OCglMwmVOaFaPRnjzfhvhbGZkpo03RrPkeI7EQ+v4h4S2bpY2UveAKe71Br5o57eAmvik8v
 rwnRwpIvS1cmm/zK02sGg0go1c/tbdKbFrwoGdJ1OZhEtTxv+iiB2PXpc22/MJlDUi0mQBhS07m
 b8LPIoT6scWDQHlLr1K5qWSPfJt7u5OhjUfhXNa8Q/GdP6ViFr8EzemKdsBjUeJxwkOVS0zWc77
 V4kkjWa2olMwV/ZgOY313FoUVqBxBu2lCJuEE5C3F34WDSVzP80gsG9VlL8yznE6JhH6MaGf5ZA
 0zh3q323KhY+vaQ2Nb6MbS1C7sKA09nuBUZEOQ7HoD2oTY9Pp6krNOpSDNkJnT3jdyQrIfTvRlL
 fwpPx0GQfTYfxGonj6ayd0vZO/elG2eQSjCgUUcsdVvYgrasgibmrH6S7kxSo8/teNU4ptvP8H0
 fjA+DVAvFqG6lY5ipB1BVRVcoaywy+RgkCu5Kqk4zWOBT7yMzLZzxgNtsDabMykXPK8ciXibwvJ
 zSkCr/gfsw52I2Q==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

GPIOLIB is now aware of shared GPIOs and - for platforms where access to
such pins is managed internally - we don't need to keep track of the
enable count.

Once all users in the kernel switch to using the new mechanism, we'll be
able to drop the internal counting of users from the regulator code.

Acked-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/regulator/core.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 84bc38911dba308539a25dd3af30a5c24802b890..e13cf5e120466cebc4d3f8400b89be07d3303338 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -2737,6 +2737,13 @@ static int regulator_ena_gpio_request(struct regulator_dev *rdev,
 
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
@@ -2749,6 +2756,7 @@ static int regulator_ena_gpio_request(struct regulator_dev *rdev,
 		return -ENOMEM;
 	}
 
+skip_compare:
 	pin = new_pin;
 	new_pin = NULL;
 

-- 
2.48.1


