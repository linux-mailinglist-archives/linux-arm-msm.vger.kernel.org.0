Return-Path: <linux-arm-msm+bounces-63332-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D091AF0E5A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 10:46:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 24ED77ADE89
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 08:45:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E890A23BD0B;
	Wed,  2 Jul 2025 08:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="XSAmOdkb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4DA223E320
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Jul 2025 08:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751445947; cv=none; b=BzmRdfOXbnTdqc69zhs9+ndMC9gSTnF1VGbDin2NSNRwt4CH4nWSRWqw+y2J4M/MKcFciIxVULaK6vhbM1dnswNbFseXY1MyIm5ZhV9q4xd7crqYYu0XwCYpeIDkhM5PwhS8znod8g3C6Zef722+KC8lPFDvAjvWOT3pDoHYbVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751445947; c=relaxed/simple;
	bh=4eNoEGYPEAvMXGMHyppT2sA734wCqZlMj9KGAuScq7c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EeT/WRuWKdQShzsdnOs67KLDqpKgtg/y/tfv94HGCnICXd25phUNL60h3JbhydYYIhwAgLLd7Hk4q0r2N4MT2U5sbCeBLZtOtTwVuLGKlMPe8k1Db68RHGTMgBCXMCRG60wOZr0ah2XnhwGnhOe1cQql9S61xXTHKwO5GNHIy/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=XSAmOdkb; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3ab112dea41so2275047f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jul 2025 01:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751445942; x=1752050742; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6hyBpvkXpsdyLCbyc77Y+t4FiY7HzT+n8f5AUiNbkS8=;
        b=XSAmOdkb0iCHxvWPGS2+g3BI3AkPfSHOBj7vWe0K1/UBWGytU/A3dCCpPtmKZlU82X
         K2snVrjI87anyvoommt8K+D9vFb77d2qEs4Kd3JQC/Ci2Sy4ei97Ge2H2Ioh9SawaU6k
         RcBFogiwJZOn7xSaoNcOBvP1i6v2OLkA73e4gJblh94lTKVKGLDqJjnUECh0OMfWRW0c
         d67iomjCzXoW922hbad5Id6soVV3xRfuHVKuswFIx1sK3n7fyZfg4oVru69OsDWrMr5V
         OVvwPyrSU/moVrlT9EgU+SbfFt7pmr4Z1KhT5U/VIeQ6teN+zgpF/qY/AC6h7Q8eLMgx
         tA+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751445942; x=1752050742;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6hyBpvkXpsdyLCbyc77Y+t4FiY7HzT+n8f5AUiNbkS8=;
        b=R8QzSO4EtziLu0ld94yoEUXjXJCAsBp4bnE+Aq+LXIiD8XgOqeVkbHesYJNKXD9QWP
         9MrGiUMiZxf6Z+sHuj7r2SNvUzFtUpUDVToXPGmXcxjFEMz6Kjm79qUN7DO7KwqT5ehR
         TNekVcErDFDxtGh77q/4AdZNXbU4r+aC0irk0ENAeMVOhGrSZL43PATTR5oiWftUFPXk
         7Eq+G2ifgGm25TmNMpGERao19sXjHjxN45HDk6InlulrRnkBh4UNv+nt5W1FzWQdX1VD
         uBmgPlKbbuRk7znE4anCjJwkNFPrM2d0Rfdf6RerqB55ivqScoNH955IpEJO1BS1ji09
         u+wA==
X-Forwarded-Encrypted: i=1; AJvYcCUVYcNiVAHr7P7JYOBSQ2avUOKUj6aww+GUXbAdJok3XmAWNmS5/Uj7JAAxV/AeSfGDtx+cYirH1E5KmIkj@vger.kernel.org
X-Gm-Message-State: AOJu0YywSfpbvmrO7Yl996FS1QqPY/FevlC5vqnjCOD5fMxhYOIWbLT5
	/lRFAx7EpnH7h4BlTgClcsyq09oT1IbERwTcKHvhzIxWQFIWHX3XCKGX0yZY2A2zWFIqGyiOBuj
	Cq5zqlXQ=
X-Gm-Gg: ASbGnctLhS3RNoYl+hpmsRAJcKxriDhG4CYxnJ5KiChcNnnVTJm7l9DYZRQZ0fXOYRN
	PaIVZOJwiTNIRsHTcDkd6lH+teux99EMYS0m+pjhF67RVRlCw8qPRpVFDNepuIZqNUh0pLxbFQq
	BZqH7tKOaiH196qEb4fukAOsnUDXcM4SSGjcJzb1MWgjI/kGBw+l4fhiFFGoyGFQ9mwmu3qhDO4
	X5Vx4Bs5qD3GaTNvDBKUECex6iosDl8Yd2enIClxGTudiXA8/H1AAaPa6Y0Em+WcBb5pu/QdApj
	ZGh4SreEla/cwKlllC8SVjHiS5S99yLvuPAlIRaTbsu1MU8KVCMbTQ==
X-Google-Smtp-Source: AGHT+IHJb3z8M860dK3fs2rS4Q0akrg1/3Gw8aQy4UrD9Q8p6MNxb6Rzpc3c2JwhJLChEPk7Vbp8pQ==
X-Received: by 2002:a05:6000:41f5:b0:3a4:f722:f00b with SMTP id ffacd0b85a97d-3b1fdc22160mr1402479f8f.11.1751445941970;
        Wed, 02 Jul 2025 01:45:41 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8827:d0e:25e:834a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e52a26sm15620571f8f.51.2025.07.02.01.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 01:45:41 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 02 Jul 2025 10:45:33 +0200
Subject: [PATCH RFC 3/5] pinctrl: qcom: sm8650: mark the `gpio` pin
 function as a non-strict function
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-pinctrl-gpio-pinfuncs-v1-3-ed2bd0f9468d@linaro.org>
References: <20250702-pinctrl-gpio-pinfuncs-v1-0-ed2bd0f9468d@linaro.org>
In-Reply-To: <20250702-pinctrl-gpio-pinfuncs-v1-0-ed2bd0f9468d@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Alexey Klimov <alexey.klimov@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=893;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=jRdYxCj7D4STZwFqPe35Zw19hML7V+rAMKmzg1nGymI=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoZPGwugmFNm2faShHzwUW2ioHIDM0QHXxYXhBQ
 cEfPt6JajyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGTxsAAKCRARpy6gFHHX
 cqaHEADW2WyAalEo0uVymxsrwbmVC7EBQCEm3JVHFeIGx9KBJv00oeqEpBN3YGiOC8bx9sLcP+q
 SDZrt8xcnOoZJkZjp0jOzvRITM+KQUFCEH/IWbFZk8+IsdnooEI810bUnxK31paCbJQ3kB4GcxC
 yP0yGWKNAGjAqGeGUdteBQAFMkDt9MlYJqB7NGzy1pa/fzFICTkQzjO/LQ0RFiilIcYkTs3/N4u
 Zh8ZwKeZa1LGCBfHLOCqfP+Df2Kx9UmNveHuWjhBZ6a9w04mjwvXEoHMZ13wqr4pb0l0nBKmac/
 a9UsGe1TrPD8BaS3bM1Md3CRkah2qOmieCB2M3Q+Vs4wclifXFUTMtQ4U3ZxoY5tEGGmTa/oBWY
 u3zKgpVL6rXI3rOpLgc6nG53fvRNAqH1MbE1LVSL3AG/33CQd4lOlNE3rDKDfvMT7eNkRA/gd5P
 ksFKpwVo+uWhpt1JdOsPNMXmKRfJ0t+HpREgwF2SH39ga24cAkILm10b4RPp/FLW5U6C5Xk8UGB
 CIoQB6MLtMOLVL5TlULcuTNFdkF0hveBB9GgExczGYbVayh06LLJndx/xJcXYCFGQgsAJ49L3GA
 30rdLrtAwM7s2AhflMuez0Dnpx1p6sbCYhaG9y3MuoRcpnslNHsOQ11msg0Ovg5bnf46YMy6I+3
 Ca+EdcsC5CmCh6Q==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Allow pins muxed to the "gpio" function to be requested as GPIOs even if
pinmux_ops say the controller should be strict.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-sm8650.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-sm8650.c b/drivers/pinctrl/qcom/pinctrl-sm8650.c
index 449a0077f4b10666ecd9dfaae8e0057a91e181a6..4ab0e75079cd5dec1d86835dae30c9a09455c7f3 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8650.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8650.c
@@ -1328,7 +1328,7 @@ static const char *const vsense_trigger_mirnat_groups[] = {
 };
 
 static const struct pinfunction sm8650_functions[] = {
-	MSM_PIN_FUNCTION(gpio),
+	MSM_GPIO_PIN_FUNCTION(gpio),
 	MSM_PIN_FUNCTION(aoss_cti),
 	MSM_PIN_FUNCTION(atest_char),
 	MSM_PIN_FUNCTION(atest_usb),

-- 
2.48.1


