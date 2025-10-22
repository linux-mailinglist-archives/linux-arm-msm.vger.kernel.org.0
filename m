Return-Path: <linux-arm-msm+bounces-78332-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 46AB7BFC144
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 15:17:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE5D31896577
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 13:15:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5362134B402;
	Wed, 22 Oct 2025 13:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="e9bgORKN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA4830FC2A
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 13:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761138680; cv=none; b=jx/Llyjn5gWbltyLfU0d+d1y1teNYOpwopYfFfNO+UV6ibyb+kpPEA6+HiX6s/BdvfuWnW38ix0dF2I/oC8TU0YDpLMxq2KJdeLGiWy3NkqZyVv9Tg32HzajUiRGygplCFcE62q6KWmPhF3jV5vgU9m/R1KAShqVSwIndSLsRno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761138680; c=relaxed/simple;
	bh=qcX1d63axfEm3RBwV296f+6+sRglnyR7jSQ67K8y59Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KkTY96ZtvzhQxVqP1lQ72EidA3GYJZD6bcY2yFjxjt5HWzn1Z3hhNt+0okyZO0MsC763XxfG4mD/v+emxEmfbZjG4/o3efeOoXa9vPCqzGkYzA7EUnJ61rTzSQukjCaEv0YCT3dkC6jwCUw3GLqogOwF2RqvJHnEuOo0gnEmyJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=e9bgORKN; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4712c6d9495so14692185e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 06:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761138676; x=1761743476; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ibo0NSWbl5C+bQQFmoxlAmjW8oHbuGgT0ysyiGqJH04=;
        b=e9bgORKNCvinL7GOYPu8YvUoJxoTl2TGNlE3olouBYpCj8UDZYpe50mTaaEIhMsdHx
         zgAgE3bththrbsAwdyfLI42nCYipcSIdpUXNye+DOPXbqsS8LMOWKMsjvZ4Gj+VhJJuo
         AYhfr7eP2G0a3d8xVqY9rNRxIph4adv45tjOK8d1oKM/uGvs5U03N5N0VHCkhGXhe9Bw
         /S5WppusOM1yuK+QfHmYLMM6LxZlSwpThS62/jv0W4EjFWOMCQNby2fERzbU/zgMTpyn
         npJf6sU8GVvLQXK/5S4KiChq8f5o2qToi6/IiMeu1513ZoeJxkJT1bqUXuUAlipaXUsR
         Oj8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761138676; x=1761743476;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ibo0NSWbl5C+bQQFmoxlAmjW8oHbuGgT0ysyiGqJH04=;
        b=GfrSGd+TnAfRWl5osVdHD4NkVA2GTbi0XpyzoxjXxy+0wkEIvI+9BQzs8KpxdKrKI6
         E4rBgYyP4G3jeLAcMaPFQ3RlqJIfFxcaOndevz6w6kQ+vC252i8cWvvsPDrG7eIbqo30
         TsXz+tnuGghkdcNB3xsCpxZdZWcw/+XfmrgB3xUK/GdQSHtgm5upUMtrJM0nNYLHEtRY
         YIz+5OuO1iWrccRWuIjePZr1XeFdddgV0XzYn5ghfk0l3xcbZP6a0FnjCLJgJMBEea0J
         FztV6py52a5Xffwwh85B0bVswgVi6SJa1W1dSjAHYWX6TSZqFqGhdmnZmfjaUdt0v4QI
         Jv9A==
X-Forwarded-Encrypted: i=1; AJvYcCU8kHrQ4ouQc2+R+fKuDJGHeSxDxcaEcMJFr/Gsl1kAZVq+r57K3NzOlx4xb8sjj/61ZU7oWeNi0LnEEO7H@vger.kernel.org
X-Gm-Message-State: AOJu0YxnYRVc7hQqANnmgoKRdJ55WwymzJN6qvdBhO3FnIiH5+0/M24x
	2AXI1JV7CZayiouCl79rnYfeAgElQJ5o5uf+LQlsDAi5DZvCQ5f7lg32ehSxdpuuztw=
X-Gm-Gg: ASbGncv3KSRH9bFblu9vQrrtCZrx1b4N/X53la9jvhM4LhjMaQ2QJl5F00jydXA6TBn
	nDiWvvh2eDT5sJv+izl2Mo/+pmMEwyo7y/+tg/evOXA15K1jK/L8+jDRDg1FMizfP/ChGuWquyz
	4cGPX+OtIBLP/mWGd67RZbPVlQ3sIIT7JCeADkMGAZ6EYU0TjRZy5kzGQOuoVsWityJlmZKixBT
	gqJQKFyuIKpieGL9e7/gLdo9LRgAGLoSqRUhzZxllSI8RNcEt7GxsTtVTlqyCcF64dEhKEIT1jZ
	4F34q3K+M6jL/4feMPkSrgdmv971Li+ehQO+IeVNh+qNfbo4k1VdxuMJp8tYGox4npJBySR4j75
	we3fhDWqdPH0XCgNq32NgGg7gU0KTTCYQMvAi0nch7AyE3G8gHUZKpWcf+53LDWs5M8gT0T0=
X-Google-Smtp-Source: AGHT+IF0wOtT5w+tdQQmrXZnXXSDYjp97opprFhrYP7Wm2xrNoUtmZ/FuBkt9NLdeFl+hYiIXGovig==
X-Received: by 2002:a05:600c:6085:b0:471:133c:4b9a with SMTP id 5b1f17b1804b1-4711786c79emr179394635e9.6.1761138675738;
        Wed, 22 Oct 2025 06:11:15 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:69df:73af:f16a:eada])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47496afd459sm38839905e9.1.2025.10.22.06.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 06:11:14 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 22 Oct 2025 15:10:46 +0200
Subject: [PATCH v2 07/10] arm64: select HAVE_SHARED_GPIOS for ARCH_QCOM
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251022-gpio-shared-v2-7-d34aa1fbdf06@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=735;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=LQ6GmHpD/iWFySPYiWNs4nA4WFevXV0FDAv5KxrY5e0=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo+NfekSMiWGzrKtKuLqKr9X/aFL7erEPkinVg0
 Ya0yCZDb8qJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaPjX3gAKCRARpy6gFHHX
 cgEvD/sF0UNAC5n2ObDj20Wt2u2qe866svdBJRyT7vFi324TFqRE3bSjbOk9y/3g6LFT/ehBXIn
 g5lxm2qJ147ZK9Sm3UfKI3Kvwqq1sBLnhdGtoihARXjAn+De38GcqhOl24nvHJlvM9tGkHnnxNN
 YGp6a8Meo66SYHnbicVDA6n3CuHl85/Jpr9pIgpE1xll9bGifkT1okSqdNiE99fbZMpvt6LRnxK
 xuKuyzK3N5G9ZKUB/l1WzvlsTJNqCtn98hSufn9wJ1C/kQjZGVjh05hyf/Ww5pY5Ko8ntxmwMVu
 XT0raHo2LULYRMGPBYbXxASf1rtF31mIDi3XbCa4Aqq1sfdZmyhuiu7ikz/4peZ4Ls3MctkBan1
 PoFpHPK+X63q/Hui+iiIi7tiOrrLqQZmxyLyjCvlo04Z9IEUpp/ud5HmrpJEuc644DxLiknre+L
 C8/oJIZXPrMTpOvenMbanP06CADPW96Q4Xm6+eeL9j8/RvPVpkgwOi3LFJLfVUl5rswQjX2ODUV
 A+VhtQakOsX5i8Y/AU89XVDQExM28exRzPlc7qjo3j7O5s4cy3ZbzdlWBi68i1D5qmEJqXnC2WH
 bcq/Tv7Ul5b4jALao342Nt1r5rbCVZWQMqMTT8gaLmNjlS2rVvnKrWUfri+/WeiJhW1/rTAvX3V
 liFuFefP2GjBr9Q==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Some qualcomm platforms use shared GPIOs. Enable support for them by
selecting the Kconfig switch provided by GPIOLIB.

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
2.48.1


