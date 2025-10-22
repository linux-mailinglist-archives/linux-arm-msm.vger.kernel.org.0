Return-Path: <linux-arm-msm+bounces-78334-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 952A2BFC1C5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 15:23:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3028B567EE7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 13:15:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C915634B66E;
	Wed, 22 Oct 2025 13:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="GVW4ye2X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0F334B429
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 13:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761138685; cv=none; b=WcH+r+avCUv5nybhp/ku5YuFv9pEF8I2zzHnthnhz7T7rqnxZI086qDejuTBA2BxB8bPr35KPbj3A1L1qpyaLz9lLccWNASz3dvo+G39hdnaPDpo8idY31qYU7eGlVnmWurfWGsbGS9eII9n4l118fzpzHFlbwefjqRsTA3ESJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761138685; c=relaxed/simple;
	bh=kA7iX9loqcR1iPNQOHLnQ9pDOo+AVwSl3LLk/F4br8U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NFEPqSpH8ZGzLaxu0Lp2hswbKc8LfU1tmFdfANEHtnuEeVaTc4rCm1QWJTwIM7fDdVUWrW+zabVcDMrg7WRx3QMmi8lyu9sKdK/o2TVPzrR6euErAEMUHJahfHS0MAh7q2CWd5AmEdXEdAX4z5FLH8Dt9irHnBw9qIbgu7BK/f8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=GVW4ye2X; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47118259fd8so43229295e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 06:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761138680; x=1761743480; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ndMaJDazpE5vfGfuGA/DbEp6kihBYbJYnxWQMZaUODQ=;
        b=GVW4ye2XC2mSzzm7rrhjJ+qKEEFXY+9D1iIrKlTJCLZ9F/JF+2asbuAevXxhHcWerU
         RpenGia5TNlCQZQuyyVZUksr/gvidtG2zIQf9avrQYL4+cMX21tJRO1lPLt6kjycs5zf
         NiFyQDitVvNsaMvvHk7FcYq6K+kAWWx/Dbw5FpG5uU3BMrv3YeXA179M9e3OAIyTge3w
         BqTbxh6JCNKGwbhjzbaZWTgJptGX+9SJZZkz8p9o5GxjFSnvPxruvrLQhta+TsBviTzq
         A9iAWInHFFIgR7sC9eJExGS+rzDV2IeOnUq3uTQHPfXZ1ajuvx8jCZ9djwhy2S1DYjrj
         93Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761138680; x=1761743480;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ndMaJDazpE5vfGfuGA/DbEp6kihBYbJYnxWQMZaUODQ=;
        b=dbuqTzdJakFl8iIef26SSun2eH4B9VApNOZuFHCTW48GzKHEgC123i9Y0djsmzqFLx
         CeC8uxdYr/+KN3+xdtkLG4/zKzJeMZ28dCxWO2ZJqnTHUgZfv2Mjk+XeuqwF25lovhnT
         mJJuO23NGTpXlZAL70HhL/nNImVoO5cmB0UVuPsCT9VZgxgi7tB+OXMZZbSLDmnoRD2q
         XjaL4JTVe9NY1ZfrP51KxTxCOEmhacWipElrEoccrohyvIaSae9++IdvHSK6S0pfzaSE
         M8B7Hpqgl/hxKZVw023r65TyOd1TjbdcaFx634jY7fOM+YFEAiQm5GCNRSXDLeKJ6AeA
         YUcw==
X-Forwarded-Encrypted: i=1; AJvYcCVj2Xh1p9vcN/XJYLvqUkyWKd9nIylXSFy5fUmtm3z1mAI6uQDKpJYgLB61WFbn8lr7WFtg++0Ln4QmmtUx@vger.kernel.org
X-Gm-Message-State: AOJu0YxeDZWE3wGxJkOJrA5//qdUnh/g36BP+0kMCzpprBlBHSHKb6ct
	S6NcNyfOrVegEOdJsDJesjBsVo5HG1YtKsAaoLJrqdk+wFOHvFejSoZZzPKXxMBcWEM=
X-Gm-Gg: ASbGncuXbryS4c1/4y2p52NQJnIBBYrpYKTaDDNmEuxnd76yBPmWE9cpBOBZwoLwIVg
	TTQAMDEhsIP8qlx1cVrkJOdPCFwu9SyxYwd8xUFV4KlKpM5FLhOwJeawYSkGcyFJ/FtLYYsdKBw
	73Zp1ZpHstmxF3taEZd9XbkvIUQv1bQW3/Mo49mntliw8x/GECxx3g2e8xqMWoXGPE9UckapJ97
	mLy6LW3MBpRukWitNyzQA/Q9Q63Wsa+2CPKZwSwOGhIPPli4IS/SvOTxPBxv8pCTdlzXohuBuTj
	CZG+INDdvIRG7qb05JrwrlTo3XPLOgy7XYOmIINYy+sJwwm41E3+NyFni0+meqMu0B0wF+KzGa6
	HG8BfETATnfTc18KV3VrMyiSpGWPC8fbv/NjkQwQk9hAckhZL6O9Zc8ipulv+eCPhGGpgDCg=
X-Google-Smtp-Source: AGHT+IElmfoCM4Q6owceAuIC32Swd+WBqF/ju4yk1O7IMXyO8uZfHXXvVXon02N5YX5wAalBpK6E0w==
X-Received: by 2002:a05:600c:820b:b0:46e:27fb:17f0 with SMTP id 5b1f17b1804b1-47117877244mr152930715e9.9.1761138680082;
        Wed, 22 Oct 2025 06:11:20 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:69df:73af:f16a:eada])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47496afd459sm38839905e9.1.2025.10.22.06.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 06:11:19 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 22 Oct 2025 15:10:48 +0200
Subject: [PATCH v2 09/10] ASoC: wsa883x: drop GPIOD_FLAGS_BIT_NONEXCLUSIVE
 flag from GPIO lookup
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251022-gpio-shared-v2-9-d34aa1fbdf06@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1242;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=xxM5DFs0HrWkdhU2lVlfFzKEyxjnJBr+LeYHk9Z5T9I=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo+NfewAfk5p+4oeOvjAnI585CCMJu5zdsTl5su
 CQCI6kaATOJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaPjX3gAKCRARpy6gFHHX
 cm3nD/9X6poJlB7hW4tB328EYqSDhizysWMNuFzzrMAB/gZ/dCtlUIbLV2FGSN4/hqWPj9FLVYa
 EfjcmFjHENOOZkS30hb0L5xxn1mh/rjIAWHwi3pbleTnKTDUoCF4W0wJ/Zs6ckL9JzdcWHVuuMA
 Az5VbXNST9iwIAUxWYdmAeAZ2AcD13/pqNrkGvH9uqEwQ3e+wEmMY512+R8xKRhlHPRJwhTR8dL
 5onGyAoPZdHP3Ob+9N9Hlxc4WyTB8rVa83OTlpu7Tag7fbqhRXzngDxUPwYsvABWFvWcdIg8IYC
 k42uNeJy0KNjseRxvzZxC1pyACVME7kz4ig6TJOmGVyfMCenQJ78AeaIqNIGlnKqr3viJE2kxzm
 UevcSl/ZfjTeBVfrRSgC5+3JzKpgYOX7mVPsxyrfPWh74V/Zq4Ba2Pjxbe7Ay4xY3aK+zTbjWrs
 Z58p+1vzp64cUQ+Rqm7Mh8U9+v4gMcbBexYEZFt1g9pqhawriddU5vyYGB724c1Qe49WoWGfae/
 mArKavWc7ccOhUfWgffapFXIglUnrG/NtQcJszys7vV+yPa+djWNZjQ94nRuNhU++rtbmNoDPYK
 77Gqebezf9XhV9ixSvIGqf6I1zHHkROLC5eYTZy6EdG9Saxw8sj7arI4mkuQke0mNuh060xP4OE
 zX/Whv3fFll6glA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This driver is only used on Qualcomm platforms which now select
HAVE_SHARED_GPIOS so this flag can be dropped.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 sound/soc/codecs/wsa883x.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
index ca4520ade79aa2c9377449e29cdd33e9e8dd28c5..ba60b4de6cab7740cd8aa70c89f6e03e1dc2dd12 100644
--- a/sound/soc/codecs/wsa883x.c
+++ b/sound/soc/codecs/wsa883x.c
@@ -1572,13 +1572,10 @@ static int wsa883x_get_reset(struct device *dev, struct wsa883x_priv *wsa883x)
 	if (IS_ERR(wsa883x->sd_reset))
 		return dev_err_probe(dev, PTR_ERR(wsa883x->sd_reset),
 				     "Failed to get reset\n");
-	/*
-	 * if sd_reset: NULL, so use the backwards compatible way for powerdown-gpios,
-	 * which does not handle sharing GPIO properly.
-	 */
+
+	 /* if sd_reset: NULL, so use the backwards compatible way for powerdown-gpios */
 	if (!wsa883x->sd_reset) {
 		wsa883x->sd_n = devm_gpiod_get_optional(dev, "powerdown",
-							GPIOD_FLAGS_BIT_NONEXCLUSIVE |
 							GPIOD_OUT_HIGH);
 		if (IS_ERR(wsa883x->sd_n))
 			return dev_err_probe(dev, PTR_ERR(wsa883x->sd_n),

-- 
2.48.1


