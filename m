Return-Path: <linux-arm-msm+bounces-64262-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A2BAFEC3B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 16:40:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 957321C2396C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 14:40:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 457482E8894;
	Wed,  9 Jul 2025 14:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Be+aQYQg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655B62E765C
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Jul 2025 14:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752071956; cv=none; b=phsLcHsOc/XwGWrlUxja2jLAt2OWeoQJDrgmrlkDmqpM2u9sxdRTOINeaFbg/xK7FdPbCqCoTtokvFnTWEZVtRGPgQDjNyTEiEMXkHnAucGA7BCM5+O+HenyBlDJYZxKQwMqo2H0GKTV/iEEvFzi8qmHl53ohlnapI1ozUn7HVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752071956; c=relaxed/simple;
	bh=8lmT4FAvHEBzOnT23SmIKUh0G7/c903gt8c19QL2q5E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RAuuFJfuyUK98vZvRQbR/CcLISAFbTfcPExy9hkvvG1W3FlBACEVvlkA9XY/ON7teUkHbCrNluLbehTat9of3PGX+MNsmJu6xvPZLXl6l8yETY+agwMclD9anuE3/Ki95FOilx0Sxub4TEL3pmNhq2AnqDFbmHROYX2I13IRm8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Be+aQYQg; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a53359dea5so9944f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Jul 2025 07:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752071953; x=1752676753; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x8ey9NMRGy4AiZwmJyOR1WiN+5ZFsdSP2HmllASZgf8=;
        b=Be+aQYQgOk0+oLjKwMqMzB4BOVr0eeZJv+1QNi5b5GcY5CHRJ26znPaOWxWHGyext0
         ZWYCkyFVWD2iN/M7B8+SMqa2wh3MQo18D4d5YdV2/5Ofph9uq385x1fYFOEux5qOZ8/B
         EALrIaspUTzBoBzkgLRUjXTyHaICtBZGfIengkF0gbv7qIlD6fAsGfgsfSFQSAmNCrLq
         y+Rf92L7DNvBv/XbUeIkb17ZSFyS1SmRmk7XDiKGHXDYaoX/V5SanKGdbM8myLhJcQsV
         CeAENqZfl1kZo8by7w4m/v3T9v2+/3ogw0db02fLp7NklG06ue8KcmXUE6k1PFRb6xQW
         YTfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752071953; x=1752676753;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x8ey9NMRGy4AiZwmJyOR1WiN+5ZFsdSP2HmllASZgf8=;
        b=PacdnwlGGporGF94/K7J7v6smM7eG6+bdgYCbkwBiAw2d5Bkh5iRaEF6BLIaG3V8ry
         aX2GE/nOp2eXrxk9I7cJN/bSeTYGXfGYpySOUsIwPJRx5Z7yFQ3vKwtAOdzrdAMon8x6
         1RiFz451NU2c/fa1cS7yunxJsShTl35z7Jbti8iGQRJmInRyvmG5Ob65MSxtdUXpwVML
         +pxn/rS/ttkaDs+2ejZPqVIOu+7jvRZZoUPp0QDQgtDBqO8Yu20Ia0ZCeN/079v0rAqd
         tdvsrR8gx4hzRFl2qCoct0RJpWrvDlhjiVkb7AlusBen3Nz5gcnTnwRSij7Mv2oofoid
         HuhA==
X-Forwarded-Encrypted: i=1; AJvYcCWlc71MDH7S2/ickMwEft2RVJZXGjtkjiGSFY8mhtn/Oi0LViCHB28fk6Ju3VU76d6BNfcxyfCG7g6w/BnU@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8GCt1ASjn5t3H6LuGUhf5RYpxiC4X4S9NPS+4/L3/1x/MOrzq
	rJhXqhZbpg91u3d00SPuGyMdFkQVy95RES8Mpqc5JyP6ot9dMM4LHmDZN1Yhtd8jack=
X-Gm-Gg: ASbGncvJDRZD6kd16Zd2tlfhmDYhrEfxRq6pX33UV7z2qB6CBncEXArTjExwO2OWsDF
	6W6UFCKByQGGbnZzXJZsliei+aJw4ucx7k4cH3iRKkeUeHaOf6NLcIuIEOO7tI7gI8oh86YoGKF
	Hm0+eHiui4SWtepHz9dmdfXGah+mGIPe5oGTFU1bvCg/CZ8LcmTHw37XWmWxn6gBnRfHVGXgY7Z
	32lKs0nTQdbdZ6eO3mkoCYHAAyUmzdiRXIHD2yanuFhUgrD7OO5juPGsTtpxScDZMmQcasGfI4Y
	Y5A7jP58VK4hxZJSzWoeO5E8hg0tJ4mQ/H/YliUOrrXmcZOSLbWKEfs=
X-Google-Smtp-Source: AGHT+IH3JCiCUC5c3XPIoOn/lwfsnlnFKxhmqDsjCf0hOTa7Cg0njC1QzAhTmTwKPyb++TonrRxASg==
X-Received: by 2002:a05:6000:40ca:b0:3a4:d0ed:257b with SMTP id ffacd0b85a97d-3b5e451f6efmr2623517f8f.22.1752071952665;
        Wed, 09 Jul 2025 07:39:12 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:b04e:cfc4:3bd9:6180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5dfbf56c9sm4480687f8f.79.2025.07.09.07.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 07:39:12 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 09 Jul 2025 16:39:03 +0200
Subject: [PATCH v2 07/12] pinctrl: ingenic: use
 pinmux_generic_add_pinfunction()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-pinctrl-gpio-pinfuncs-v2-7-b6135149c0d9@linaro.org>
References: <20250709-pinctrl-gpio-pinfuncs-v2-0-b6135149c0d9@linaro.org>
In-Reply-To: <20250709-pinctrl-gpio-pinfuncs-v2-0-b6135149c0d9@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Paul Cercueil <paul@crapouillou.net>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1164;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=RexboHfrKQGDmnvTaw3YKGHfHVL9lqQo9zvQU03k7E0=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBobn8GW0/9aJ4zVPgkXtZsFWkirehUErNCokHOB
 GM4zjrDxK6JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaG5/BgAKCRARpy6gFHHX
 cgwSD/9/4lUKLCEf8Fa4AaNseE6CWV+E9Z14n3smQ5mQ/ks1VymZ+aeYTaSTOCsNxzGrQvwD/cS
 ggTqjv1l2MRMz0l4RWO/hxM0JeAhC1Hhd0sKiC5tCwYojVEdjThlxXid8ZmtKDwfHe/MjjmbXNP
 s3rT1zZqOzFOOsRda92Rs23PrEsdv+iJXSfocwFjngs2jFUhkTuETOAnxwTCqSfE/T9T0IC5I+S
 k4cOXqGjO7dJwFgOha+cGo/TuoraJMCjVIOfDkovwpSef/el199HneLeoy83qvc4wnMVFYz1Lo5
 Fim7dRjRvWRSKAo2+ap+ZA58nznsGsEeXRUacClWRUhxBPkXg4Hj1zB9XA/LrR4nK4UChs6wHm1
 JdqJfbaHEXn2ozdOb69Gw8DYGWEWqnDbR+zSVHuW5raVVf9ER8IMgW6wHyJsDoPccoG1uAW4luG
 c5ZGqi7MJcVnAZhOTu3MuEIZJ9OpZJc9lgjpZ3BUoOQZKEeec+YXCjhhXSc7gDQk04I4pyE2+JO
 rwkEP6vSDYZ5mXbF7GBhHFSAjzcG80VzO7tJHpmMX4T4Jq6tgeamAMW2P+BwwMrnW4jsf6Y2n6q
 4kM2iu24T1qrY0R0V/54Hxucotv8iIK8ArMfVwMO3fhHbHjmgg2EmdNcHt+cvTNUdKIYLGksuBL
 n96DY/nkn8jEC7g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Instead of passing individual fields of struct pinfunction to
pinmux_generic_add_function(), use pinmux_generic_add_pinfunction() and
pass the entire structure directly.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/pinctrl-ingenic.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index 3c660471ec6911ee494f45d2ffc13c4dc496fd2e..79119cf20efcf8cc701647d9ff979c2b71bf7589 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -4574,9 +4574,8 @@ static int __init ingenic_pinctrl_probe(struct platform_device *pdev)
 		const struct function_desc *function = &chip_info->functions[i];
 		const struct pinfunction *func = &function->func;
 
-		err = pinmux_generic_add_function(jzpc->pctl, func->name,
-						  func->groups, func->ngroups,
-						  function->data);
+		err = pinmux_generic_add_pinfunction(jzpc->pctl, func,
+						     function->data);
 		if (err < 0) {
 			dev_err(dev, "Failed to register function %s\n", func->name);
 			return err;

-- 
2.48.1


