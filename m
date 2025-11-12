Return-Path: <linux-arm-msm+bounces-81427-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75FEFC52ABC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 15:21:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE8AA4A031D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 13:57:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2992733ADBF;
	Wed, 12 Nov 2025 13:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="peYjgCqc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6FE233A026
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 13:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762955755; cv=none; b=f2EN2kujAp81QRYFKggS/TIFhHTvVdYAWQVjA64HPhCW4rUPycjYx5WR8N47PP29xZbKQA9OwVW+1vyNTrh5KILnCzP18N0gs1L4UZV8beb2hals57SNQ7Ky+xQGmGzGWwnc8NbrBzZb7Xgwgj0U8SilfaqeEgrRPch4FDZHTIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762955755; c=relaxed/simple;
	bh=SjuucycP/0Q2Xk30EDiwcJsYjdryTcHS9+y5uWbSXvs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M5HMJ39bgr2uDUnSQIo+o5dI6v1J/jEhT7y8Zi9lnJkKjvXHGs4+CGFn7HdcrzKj9Mp7LGdYmF9/oBKNC2mPbVgTWQ1+UqS6v9/kn7Vq8HcM8Qwr9T5YP4nBeRz2VmEOqxomWKhs5CXTrKNFTNqartKqPu826sqOnULxujSicY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=peYjgCqc; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47721743fd0so4933365e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 05:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762955751; x=1763560551; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=79Q7HabNP3kse4nLU/vAYoWcwWnuSm1uGzBIAnSPTng=;
        b=peYjgCqcQ2d1Rhz1LjANgzHoPt40wgWy/YWTR9e9FKL8+bn4nqFOCkDKg3ZA8e/wNV
         4beyRt2u8UyeQ10MCBNKmnJ/3ophvLmgk1n4KVVj3Rgr+pBzf0BQg314S73LdYD3C6+g
         4FaJWgW88lUdUue+IBTcb4IOvnJ7iGJuVMwwakdccz/IEJFlq3k4q+29Ad/XKFBssCjm
         9+gcJ1oydLy03/G4COAV9kmwyxXm+InBc7kndRDcfgcF43PVvSH4t8z/zd6SzCb0yUTE
         xy4iWiRbc9WdE7jTbXWUj3oMI7NhRogi+utZhSi3maixHZk9mxlY2rii1w9RfwcMmpZ7
         rqKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762955751; x=1763560551;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=79Q7HabNP3kse4nLU/vAYoWcwWnuSm1uGzBIAnSPTng=;
        b=JufGdfZrp6w1fjfy5xRD5ch203XWj+FRWcY7itHQ5Fc9/9Xsv4CgitFvSq3Jy3jFWm
         FeP2/hPsCdGJMkTSK1mvTiUPhU1FeIVqCZWZ+36AdUCuVSD1YwZIwzXqyTISp6g1/kNU
         bU8oLQfsiM6NSuM1Kz0qveInD9Yd4n9L9EOiGplU55CvDihOeAAlrhnneInRQsihEDCw
         7loldDIt4D20NSbqognanfsLUVrQTDLH2wcJvaDbpZpw3Ihk4jTG7aQy642qtHjOXdFQ
         HdNncIiNETOP2lwr+EQrc0mPP9iaF4jNlB+6wbkeyIvZZ9Wmot0uQyi1A88IDJ5pDoUH
         FWSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWiNTlQYK7kABNEN4OdiJFMcbiAcUyncqraRloXGnInnXQdfP9xTccTvhXY5TxyI1Z/DnGp6OJKXmC1QqHw@vger.kernel.org
X-Gm-Message-State: AOJu0YxzyfWNz/3OC3nkSgc6MHNIIu1DINLPQfL0JXmOc8ahWqjYDJR/
	xWZsMEuGQ354u9Jqz75iGHQUvWtdx9Q29kf6mJYsYJ5rVUvgwLw6t+iwbx8a1uGxvvM=
X-Gm-Gg: ASbGncsAt/JGnxwwY5740jl0GCmvZoMG7ZhQfCvBRGMED21ZgpBC4HAGznHR4ctdMkQ
	E0z6ozmHq7fd8UG9it+LFoTmi7kCXbApMvJXz9fNR1AbJeNOquh/I48OBSlOzfNfq9czgi96CUP
	UBg8hpGBbybT90O739zRhhvBP/NH83XLAwLdyyN9khWBXvn/EOC39HBc7Eqetl0DcP7vluAHmCI
	Qw8iklMBt+EGHAZyNF1EPBznhJiAvv6r2Tnb/CFEgvH5HeVYVZlixnypye9dQonS5p+sPAxc+RU
	5UdHe9HgyqIwRjnM8MRgVOASARYB2iX2PuaqNXqllvumNDxsj4NiRPzJRYdEYlFqJFjVyp3ZjPo
	0yxIgR7Tnpu58E1lfDhlv/DZe3OLaUygLBvzT6E6IISbHyOI+KLTGc4wumtJKsouOS8w=
X-Google-Smtp-Source: AGHT+IH/gUeUf4a+LjvPsAKw42U6Jw2pmBzvctQUKX6vryQGuNHC73dD3y2nVLgM1qQW+g7uw5YxOg==
X-Received: by 2002:a05:600c:1c02:b0:46e:4e6d:79f4 with SMTP id 5b1f17b1804b1-47787085b43mr32791955e9.15.1762955751026;
        Wed, 12 Nov 2025 05:55:51 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2a6:e453:42d3:11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787e2b835sm37711685e9.2.2025.11.12.05.55.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 05:55:50 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 12 Nov 2025 14:55:36 +0100
Subject: [PATCH v4 07/10] arm64: select HAVE_SHARED_GPIOS for ARCH_QCOM
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-gpio-shared-v4-7-b51f97b1abd8@linaro.org>
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
In-Reply-To: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
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
 Takashi Iwai <tiwai@suse.com>, Alexey Klimov <alexey.klimov@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=787;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=90mV0HhkOk2X6mMXJGqXC5YmpVRGBZfIYfoK677b6nQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpFJHWKXa26OvbXIS4uHVQend8AfFjaKwOvW6+K
 RoSgKje/vqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaRSR1gAKCRAFnS7L/zaE
 w8FED/9S0v4o+f9rGc1s0XjtxWxXWXuNhwckzJpl54CVdCRP15Zt9niJgx99JnLVX1N+zdXNb2r
 bcQUImzoeX4vFqcEQmDElGa0VPK/jtIt692Iif0FFmMDx9gCqIQP6mQBUYAg5A2KRlHdJrCEBg/
 jbA0PjfGTb44eHjdclModiPVQszACjKZ/ZXeLEt9tkRtbxMDw7ejcyi8cEb582U+DxuKTIOVfox
 J9A541EE3wpE2mKBEvafm6T9EGQPzPKPAnO3h38+47EokVn/GMgcDB954UlKsfB4e9P/8g/c/KP
 Hd61CiZku177YQDBAUPoTJyxh4k6YnSgrlbHP+m3Rd6vvx8q/T1jkX19j3tC75jJVcJyeU3sZGa
 1J7xaTyvI50YiNZIcuzhIekT7k6h73SXyGHlr2nFXvrxHVMmfxIumWEsIAZjZfjB6tSpT5MB5ZN
 FeeVzl2+rKUM7sxp+Ar+gUGoeIzWaehG4UlbAhpCjNzHpjqeXXoHiZba+jpr4u8X/Qo7DmVUwhw
 Ja+LNPcgi2ikEL8fqramAAzy9xN87Ug6cX/EkhTCeJqmMMBaF01/U/Ig2piBAxtlXiEtmIRImIA
 qcOBn+9X6Iz611rrgSjwYrRQGCAOnAnvY0KNXrKWlSBudjWzAl4SlV+EzfCuQEvo9vxDTetF8Lq
 RSondTaSYnSH9qA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Some qualcomm platforms use shared GPIOs. Enable support for them by
selecting the Kconfig switch provided by GPIOLIB.

Acked-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm64/Kconfig.platforms | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 13173795c43d4f28e2d47acc700f80a165d44671..3dbff0261f0add0516d8cb3fd0f29e277af94f20 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -316,6 +316,7 @@ config ARCH_QCOM
 	select GPIOLIB
 	select PINCTRL
 	select HAVE_PWRCTRL if PCI
+	select HAVE_SHARED_GPIOS
 	help
 	  This enables support for the ARMv8 based Qualcomm chipsets.
 

-- 
2.51.0


