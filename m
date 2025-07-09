Return-Path: <linux-arm-msm+bounces-64265-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB56AFEC47
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 16:41:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E19487AC966
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 14:39:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C66EB2E92DA;
	Wed,  9 Jul 2025 14:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="IGMb4xJ6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C932E8DFD
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Jul 2025 14:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752071959; cv=none; b=QAI7uxYwBT327MnbRDb0KOcJ2uC9YqCsujaYOLQATKsnnKXhrLwXcyGybZlWisqTgICkD7O/5vxv8ZSZQ1vV/YFWZbIHXhXKr8Orai70Q2ytY3fUDKHN1rXbc4odDs0hKr9arSMYWLvglfM75ZFXc1csMOcR3BP1mk1OCjcoEnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752071959; c=relaxed/simple;
	bh=SCS8lXlSiiBwXguGwY5sbzIz2soagvI/WfQi2qiMnqo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hROBRbZ+squr+HKw18XFHX4Z44C7JVvx78t2AYhks0yXKN980T9yBT3MbPKEOXjSEliHh98lSejv+g/sV1oMxBotCCSW+YwFzyh7IJx/BXdUcutN/ruz42rn5wSGCZIaSOfqP0h35+NEB+g5G/dRKcpQOautIn3bkU+7ywgIjRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=IGMb4xJ6; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-454b1d0a115so20174265e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Jul 2025 07:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752071956; x=1752676756; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UnZLud9yO6zOA+K6EV0Zq/kEr3WEEyX9xKA6hhGjpKg=;
        b=IGMb4xJ6nBMaL3s4vLs/M+xL1SSlgv3rK8YXtVm7YxihAuJxGq83tesxQnpZoDV872
         /E3FhmY/FNP4TXA0D6Mb8e2XpFdztTPD1GQakEQ51Rv2hv+JZwEPSbwm2jFdVluM2anM
         5W4EK1XVIQWPJh1meFGMpzJkppa58LFCCtBrBobeFviAiTeZAL2vWwWpxQKqKGONC/LV
         A4zbMda3x1Og37vIfcDZ2hMo0RS1DSaUojx83wAgEX0LQto+b0M3+bT5BCJ6vtr3VmFe
         He8nHWm4/DvrQHSO8SH8ZVdO9YIwxBajP44Iq0g7/GfmkIQ/Hn8U6CPmjD3NlyKXQe4N
         arQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752071956; x=1752676756;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UnZLud9yO6zOA+K6EV0Zq/kEr3WEEyX9xKA6hhGjpKg=;
        b=nIiCpi47XUUHd3BVKKJcHrZIZIGw+nFEZCCP/hg9KsfqM9rpjUcaQYA0r+O6oXG8Vt
         pHyfHPkhoqQsYQhWnI34k9PXXaRaTiOsE8WX0Xx0AMXw4kejwH4wMLoKx8N2qPse/FRL
         7/B4K4FrYnX3Eq5LKBtX8WRcn7xGRg5Y7S0E3KLBJnuO8LvrxU/+jIrOYw8KgPMEZTsV
         gvv6vPgngMGOgHZUIUKFw/Ia6UFDotLeyN0RPs8yDF1EOuCwSWoMsLas49I7gHGyRlWw
         Qw8N6kIamA28fh5gKiK2RuARgLJP1irkFuZ7xv2FGmZmhYlKMkPk2V7VNUHT83RTZwqB
         /FjA==
X-Forwarded-Encrypted: i=1; AJvYcCVh7Zmm1Iw6viNRe5ozcu4WU1QuAgvTTstyxoqdjTJH91gksccU2jAGaL/DbQTbuLK0IBIYFoqftlEvWWYq@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq/xuJ1oTLeXqnLPlbcwJc7G8v7JkSa3K0vpFmp5mSIBJihmfn
	UlCH/b62kZpH5zv6ee5i7bIS1xXtPC6xNUb4lbqV9uu4/zNCWe9TZHoDY5h9O8w4kls=
X-Gm-Gg: ASbGncs+HYfxPkQtlzW5cqYH6Q/wl3AKccIzEpA/w5fDIsCHQ2vwv+zo3UN8Dkw2F7Q
	2wmn9vz3u80iU0WC0PopNU9Z/qbOTUvNJhVUOzng6Fb/CIvAcKEOM3I7Kv8fsVUmhUCJk5UnSoH
	0k4el6gYvqOJmlX3h6Yf3mgoAAx4W1L25ZHE/lcOqkq51U8ZAO2ud87EO2jFVhjkgiTzP0Z1Ngb
	pJyI8/ni7Gn/B2oRIm/giNt1tdpNZOunxUg7lCO9/C8LOAkd/AYmLDHOPKEmyxhPFSuK/GefzVp
	+lOXVKnWp7spZHeW6KyFHOVPa0SBTebkDfYlC2Lk7bKlH3PggAIQUUQ=
X-Google-Smtp-Source: AGHT+IGq6DlUYoApEugH6cDhO6AeupjgahOv4gDk9/vuNfa2ylaW/Guo/o9ndLeOYxtCCVeM7IgCyA==
X-Received: by 2002:a05:600c:4692:b0:44b:1f5b:8c85 with SMTP id 5b1f17b1804b1-454d56af9e0mr29208915e9.13.1752071955911;
        Wed, 09 Jul 2025 07:39:15 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:b04e:cfc4:3bd9:6180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5dfbf56c9sm4480687f8f.79.2025.07.09.07.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 07:39:15 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 09 Jul 2025 16:39:06 +0200
Subject: [PATCH v2 10/12] pinctrl: qcom: add infrastructure for marking pin
 functions as GPIOs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-pinctrl-gpio-pinfuncs-v2-10-b6135149c0d9@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1694;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=UdZ2DBMT7xZXebRXGSH+ALcw7tXi9xCLUU0Hy5OPvAw=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBobn8HRwoShqLTGfiStGORsuza7OvA2QrMSBi9l
 ChFmBizpqSJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaG5/BwAKCRARpy6gFHHX
 cnosEACh6WbaTtFBq2fxmhuAoGjSt+Q6E5srezOcew+EQXK6B0xtC2/jrAK0kyIdTlCiI2Jpb3k
 muui8bz+61HhIfL3xVRg9x7DZmxPMEGBTLX0wgxKYWLoabpwPGZAEVTrRFObmGV0EF0Rcxdgqq8
 DO6+GW9hWm/5CFmta27hfXEkgVFGnBgWwOkdgCXjd7IqVBT9cHAFtwK0/7y4QakKJLNfOhHEcEB
 dz6FfKO18xUZ7x9h5Azd2WQPtOc9qC3zN1SqrF4iZfKL7gba49XoNAKSX2l+osa6BDjbL6nKInQ
 RsAckjuQxY3jcwhZoIdcsUpW4Br9HhwpeAsU57wYPkbp4V3K4D+ZJ36Lr422MaOevqy6GTmMOKO
 W7apzN2klYF6JSOjzeynE9221HkqjqEqSCLPAq/K2z6xzjDYDpjzvX+yG6UlMgCHuz5qretJjIY
 P9v4eiNvHWbfTnBNIkNvI0aw0kWzP/qJsenuHmmpR5l1XaV6O+ruecKbv9jpi47XhDD5N2gKVQA
 Ibq/uYr4pIV5r1VCgSDZ5Mq4JIialrRhxOSdKjWJZ7CLdkVuVnYNbj9f00oZ67TF8yghNdx/OzA
 Lw5AXW6E6RqHHrZwuRu88iGvgV0/k4Mgp7AIsiLAorpNJ8tIa02LLZe5E+sOzH53zortWOVYjQF
 /LwuyRHibnzRGZg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add a helper macro that wraps PINCTRL_GPIO_PINFUNCTION() for pinctrl-msm
pin functions and assign the .function_is_gpio() callback in pinmux_ops.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 1 +
 drivers/pinctrl/qcom/pinctrl-msm.h | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 965f0cceac56697bc4cdb851c8201db7508c042e..7010be8d1ace062fcf7743e539d2065d4aed856b 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -265,6 +265,7 @@ static const struct pinmux_ops msm_pinmux_ops = {
 	.get_functions_count	= pinmux_generic_get_function_count,
 	.get_function_name	= pinmux_generic_get_function_name,
 	.get_function_groups	= pinmux_generic_get_function_groups,
+	.function_is_gpio	= pinmux_generic_function_is_gpio,
 	.gpio_request_enable	= msm_pinmux_request_gpio,
 	.set_mux		= msm_pinmux_set_mux,
 };
diff --git a/drivers/pinctrl/qcom/pinctrl-msm.h b/drivers/pinctrl/qcom/pinctrl-msm.h
index d7dc0947bb161868c8f433dc2536719b8afc8bd8..4625fa5320a95a4d24e3a0c98a249e4f163dd4c7 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.h
+++ b/drivers/pinctrl/qcom/pinctrl-msm.h
@@ -29,6 +29,11 @@ struct pinctrl_pin_desc;
 					fname##_groups,		\
 					ARRAY_SIZE(fname##_groups))
 
+#define MSM_GPIO_PIN_FUNCTION(fname)				\
+	[msm_mux_##fname] = PINCTRL_GPIO_PINFUNCTION(#fname,	\
+					fname##_groups,		\
+					ARRAY_SIZE(fname##_groups))
+
 #define QCA_PIN_FUNCTION(fname)					\
 	[qca_mux_##fname] = PINCTRL_PINFUNCTION(#fname,		\
 					fname##_groups,		\

-- 
2.48.1


