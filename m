Return-Path: <linux-arm-msm+bounces-53315-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8D4A7D02F
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Apr 2025 22:17:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 66746188D643
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Apr 2025 20:17:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 256D720E707;
	Sun,  6 Apr 2025 20:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zflTqgnP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3C81B4121
	for <linux-arm-msm@vger.kernel.org>; Sun,  6 Apr 2025 20:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743970618; cv=none; b=if0rxSHjWJOW8cxTAHNPkwaQb2ZNrhqGTfgwIKttvtRF9BqW4OOO/fRV+GPiCjS8M+/jXGtZJhCmZF7wqFCeYNeZxbmzAHUgaPbV5AdZoJbQ6//m2xeTdjcpZu4FNuHY3bCpkPCjGL3PZK2CYUXgSlynPYlpfK5siq8LbsBEoeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743970618; c=relaxed/simple;
	bh=2VJ2L2j3W6F1CErco4gfdUL8lB1zo3mE3nNOQ4I6bJM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Uqw5GsUnRlmNlapLUg7Bz0ndUWU2Jty6KM0MvEMRN68ZIIJIFb4VsbsFtBxZ4OevX1CErT6LoZkSyErFmhWw65s1HtzHRtYZ9+f8jKVTm8UN2A5DgjPrvTkTjtM5fa81m7WEZQbCfyIl6EDn0bMMfLvIEW0hrpwKmOn+tbx/Mig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zflTqgnP; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-39973c72e8cso401713f8f.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Apr 2025 13:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743970614; x=1744575414; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nYJYCerL5QUzGevvLFCgEQM0pv0n0jatfNY5jPvYrVo=;
        b=zflTqgnPFooSVT/4+OpSKlm6qQxeX5wdtO+KSxVpdrBFI8J4x1extsO3RFObt35Hma
         0uSUKo79M9Qs92FcpPCR8LJpN9/3fn/KTVghCfZgN/PEIK7+vTY2ez6ffgpy5OuR+Pwp
         fD1YjNytnhkqwM0w0rAqQl0ofybjN8roRvQ/wMbfj9JDnLDRWdGwwuBT6d6r7MBogsX5
         ++q32jq62TCNnA4qXLWrnmYfn4A4pwea3HodXTHjKfd27XJJVpqlzDJI0gUSG3n0j+t1
         ulpft0pOTKZau4/bIYeq5nGRzSnbVmtc8ujDU+JIUfxloOUjgwW/muRKRdi3lB1fZ0va
         5Rpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743970614; x=1744575414;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nYJYCerL5QUzGevvLFCgEQM0pv0n0jatfNY5jPvYrVo=;
        b=Lfmd8r9fWzJ54bPNln4Lr3gblu8tOYMJ662MAdG/DAmZGhjUXu10Ja3IuQnRP17Edt
         tEpHRH+6BoPpQ3Mb7I24F+RV5zkYqU0aPo8yR0AUKLOMD0sYSsFkrPKmLcVrQmNFbFP+
         8Vf+nQfgcl/1PO5mFRIbDQDTU5iZEPwHRTHUt3XGADqszr+r9deUMhqUe1XT2o2GAHuF
         VJ/bJpcW6W3onZ83IAnArVs8APy74oiZTl6qfHC/1ksjFqjJ+LGCK0lGYIG1iVLOl5T4
         RmBnHgo+KyDWJ6d6CIwKvXiiAzfbJ1gx69u590IEB6COz5gsQmtZbvGjxPqueGHd+bJd
         mMBw==
X-Forwarded-Encrypted: i=1; AJvYcCWDAlCQifVPODzVAIXxEHqw6D8zxcOcz4L2LnhKL9+dkW50GemZG4+VtJv8pC1Quoh1eWOQqX0BUD4IQRk3@vger.kernel.org
X-Gm-Message-State: AOJu0Ywj8lptcxY+C7OyXUUQw9RiuhqkHF9FN6ryBpJtI0ZP1TYw7fcy
	+tO+RElUu7OtRHgzWmJZvdoTgA6n0LRWwaZaYpGVc59xIPv9xQm2nGxUMH8k6nE=
X-Gm-Gg: ASbGnctcYjwYADoP0cttv3jy/EHOLKUOEZf3VSCy8+bbrik/ns23TM+VTyx82+8F8M1
	6ymDiIOmplb5WQmen/w8W4Z3g7wJlfVMbothvvX0B3s3SoNDD5jla7tVqnZCQx5igBR6FhvHykz
	PWqKqiQckxPvu/uwtPQ9SYvs7e/kMrkSea0y8nlL/cjXAFjvCghdCy3bH29IrZ/0i/zYi/IZdT/
	YlRUZcmvprAEabP6rUwklE0m3pcIGX5WTqJtuOSe4gTg9/wuys2Rprq4TL6JvTgLhTUKxnTLVVR
	nj+ySD1iSGn/MTwpocWvBIPEQndtrFuvObBcdyVFu2UCRbDuomYn1HGlBHw+vnUd41X9e2LCBA=
	=
X-Google-Smtp-Source: AGHT+IHelx1mcjCqANXW6R3Y4bDFza5EFI6CfMf4TOgrpJ7bKxL39mUZMC8jl/GTiIN+xlEd/rXmaA==
X-Received: by 2002:a05:6000:420f:b0:39c:1258:17d6 with SMTP id ffacd0b85a97d-39cba9477c6mr2626485f8f.15.1743970614613;
        Sun, 06 Apr 2025 13:16:54 -0700 (PDT)
Received: from [192.168.1.26] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d68esm10295521f8f.67.2025.04.06.13.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 13:16:53 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 06 Apr 2025 22:16:40 +0200
Subject: [PATCH 2/4] extcon: axp288: Fix wakeup source leaks on device
 unbind
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250406-device-wakeup-leak-extcon-v1-2-8873eca57465@linaro.org>
References: <20250406-device-wakeup-leak-extcon-v1-0-8873eca57465@linaro.org>
In-Reply-To: <20250406-device-wakeup-leak-extcon-v1-0-8873eca57465@linaro.org>
To: MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Hans de Goede <hdegoede@redhat.com>, 
 Chen-Yu Tsai <wens@csie.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=752;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=2VJ2L2j3W6F1CErco4gfdUL8lB1zo3mE3nNOQ4I6bJM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBn8uEts1XIjx+ihcfWb+iUWLJZEOIrhmenUl6y2
 PjD9Y0AjM2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ/LhLQAKCRDBN2bmhouD
 11POD/sFFuXYlPOrlxry3fkB9pwLZ6UXYdmjYwfGr8U0f+aDHMTTIvQdr5N/XkREAkbJpbSkZ3V
 dYnvI76CUqpYM5whDORX0ABOZO6Eq0q26Pv7v8h/NtE4DMN285zTyXutRVH1CEYrJFI2KL1pLYh
 XVoCU/AYzYnu4CJYOrJibpKfR/yCe5bTJkBuvrZ/jbGtsS58MlKJyfGzmtABnuIHDzVGSRnFx6i
 AD4Xc7cpFElGr6Qgwrtk+hI2k6gq1Cdz3kchGYDBo81PJGI3S7keKjm7vBumTJEyHgASInBe4wT
 Z6SoiGd3ZXD4Ou64hntb2vHPotsXPTcdOCyNp7JMkQ09NM/OtKuP74EfcTgFfoV6Z3xd2qCxltP
 D+jS6tHPO5/7YblrFwbfCZ8EpsRpSviHHWMdcWx8ijxX3fITf3dzeUpCIj4kDCnnPz1h82KDeGF
 5hJ+qzkJn3suGVVxs4PTX6KDgQD8wsX7H2Wp6r7BanrdPqFJvAKPxio7g+n/xkzL5ZOTrhlP8HF
 XV/V6vJpjNFBGrC+8eyKj0ZPKxK19Ra2KyHERM3yc3aj3q0nHuCXTUb3arnx5eWFB3qHz9yVYYk
 20ZdQe9qzf87TMWty5dqtmJwE56alGl1c/Rum2LBjTwm4SsBOfDZoR9JY18+8te9piQOnP/z58x
 X7+6kfmT5t1DPzw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Device can be unbound, so driver must also release memory for the wakeup
source.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/extcon/extcon-axp288.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/extcon/extcon-axp288.c b/drivers/extcon/extcon-axp288.c
index d3bcbe839c095f126f0313a074681f1c900762c2..19856dddade62c5592701f8fd5842857ec24813a 100644
--- a/drivers/extcon/extcon-axp288.c
+++ b/drivers/extcon/extcon-axp288.c
@@ -470,7 +470,7 @@ static int axp288_extcon_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
-	device_init_wakeup(dev, true);
+	devm_device_init_wakeup(dev);
 	platform_set_drvdata(pdev, info);
 
 	return 0;

-- 
2.45.2


