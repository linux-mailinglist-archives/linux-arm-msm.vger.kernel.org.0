Return-Path: <linux-arm-msm+bounces-63331-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB09AF0E57
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 10:46:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 142331C24264
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 08:46:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0E4223F412;
	Wed,  2 Jul 2025 08:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="LtQPJkJt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D2023D288
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Jul 2025 08:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751445946; cv=none; b=aVxBmdjJ/HVvQ5peLVKuPD2RntOJexNaW3OPkL1+A4mDyIe5PmfnkNRlAKuNTQjYtruOWZdWkqWBWedTOLYqIfdQ9uTHkGcC3ZzneWtZkedBXm9Xlesy3gdbT/7+Dfz+h7/n6gD5gY9MLt3xIhi8meW4bjgakza70lcnN5n+fBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751445946; c=relaxed/simple;
	bh=9LWvmWcvTSZ0I/aQvXUMLaUEUgGhwL3FAKnRn6jpC1Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r7PqwIYrSCkELXMxx6+WbSEoMbXi+5RrWH9efEUDoF+Mqcdzmcty5J2iI6nJNWXnEiloDn6ktJab7MuF6n+U1sJL/Lmeq5QobWTJN3klqBKWO0M5qSjsmxiYXNcSS268hg1OoA+M3qW91HXX+EOvv5RYhHdKvj80WA07/Eq0Sgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=LtQPJkJt; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a5123c1533so2324122f8f.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jul 2025 01:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751445943; x=1752050743; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yl6c7WwMVNRDxT5GfujSd5D09Be8FqLB3a1ohzpgOYw=;
        b=LtQPJkJt5stbFmQrUgh0lIyQcpfW7s91R0fArzllTtVE6Q3puGYI2nXlb9aFoVIB0z
         qJS9IuUnfNx0aWmi89v8pIFMRGcskWkCPuKKelt5tKP65glB+M0tfI8XLNpTAq9FBzTO
         bcL4UOFp0IocgJvMxEZr+LUY5LxlOYVn15ZjmPXa8lUUqFIZWGaXtZ1FyWHwXf6LtAZt
         BC4lpZwg43HRq8ecNaIFNk+txD0eIOPATR+qhYJn1TZbwxjKQF5LhyaZEijMr4ugIih6
         MqAzWQ+cMWwvXLJ4kKYQ1hngBh1D64kzfip2v0ZZfzati/E+1mrYhD/5GOWxphFHlewH
         QgVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751445943; x=1752050743;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yl6c7WwMVNRDxT5GfujSd5D09Be8FqLB3a1ohzpgOYw=;
        b=b13lu7s0BXsz+Y6QrlQkKC0/bXw+SHE9QvDLM3jcq7CE5mdK8H73H3eUbd+goGHfiV
         WaI3m9HzGslNx6hBBseZsitTHKPPUjv4TybNHQVZpnKPUlOPSld827hhH6MJjufY6RHb
         t8NrQyMg0wl9r3ltuhW97niNXdOY/RSBIvCCgL1gGWBMEcbnazmCLOWE+7GrUM4Mr6CU
         PLjPknq2zd1wFsgaFrS5dxJJ+bh78W8jcCdRqbvoPeud9soJf8thypxkR9FzSBKjVNNz
         rtOV4rpZlbjnPUQ9p2V4B7LWRkX1mOCmpF3vuOsXem54JEsDBDk0avkIuq7YFTnvXI8Z
         l+Vw==
X-Forwarded-Encrypted: i=1; AJvYcCVS/mO9BcCRWWbeVlJ4kdjY/v75uskASC5Lkidtg94o1iPRHbA0xOF2sQH4XGv0Jpna5LzLHsRwmtptKamc@vger.kernel.org
X-Gm-Message-State: AOJu0YwoB8d3M320lGMopAjQtf4hqL34coi8zeIBtElrnfJbUgXKug2v
	6FErPsfM52h+263AczE3he6T/NS5uJFifnmQ7OelmYJfKPxT3kFmctPPI0po6TprNhQ=
X-Gm-Gg: ASbGncu9twTC06v+pFvDLyvE3jeVf5gi6i/yu6hRUQ8gXpy172G5faomb1gA3F7LH1V
	9OwkKBTx0MnV1Luov9HjJxaFmHpsB//WzqiixDG61K/o3Ik85vHKouj9/RbD+aAoe5GpUidnhgk
	pUfBy6eI6yAbNUB79yvHyGEChL8+9anYqMTwAVQArEA+B41u/4B+KMFkbhD69lBZ63CoVNrumZQ
	H4UJ9VvYNY29RPi3aIihBCGXfMHPl0A1IuP+D2w9wnqA8WfWnMERjKJAAFCEmdtSIa0IWGU/Duj
	nu4ZCbuuvmS+XT10SHpjjUu5J9Ahl7qSfK75pJ7UaetdB68YSXn/kA==
X-Google-Smtp-Source: AGHT+IHTgLceFYR99RZRppBDbDVsi2WUzj4C8vFzWgsGsV6+C/AnVIirveabiUSIuVfUUlVZQDfOuQ==
X-Received: by 2002:a05:6000:4206:b0:3a4:f723:3e73 with SMTP id ffacd0b85a97d-3b1ff8ff61fmr1220779f8f.16.1751445943202;
        Wed, 02 Jul 2025 01:45:43 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8827:d0e:25e:834a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e52a26sm15620571f8f.51.2025.07.02.01.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 01:45:42 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 02 Jul 2025 10:45:34 +0200
Subject: [PATCH RFC 4/5] pinctrl: qcom: sc8280xp: mark the `gpio` pin
 function as a non-strict function
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-pinctrl-gpio-pinfuncs-v1-4-ed2bd0f9468d@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=922;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=1/+I4enowG8VS5jwSCh4y4lBWL7WVy3t3eEb4hrt2qo=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoZPGwfbcxJHXjajKQw6T556GfUrm4ELzuUdvt0
 plctHc+8IqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGTxsAAKCRARpy6gFHHX
 cnggEACCkZldTWPBj6XEA8q59sHoG7IKGQGQ75a9bvAsWQ4BlD0/QxJpKgClf0wJ7HHKRoESdMP
 5sW2B0FMNMfPHDtt9kWk294WtALI3nDb8gJA0A6xEXR19G2zJvdWX87dcDUD5qerv3NyPJIRqdV
 ZEbw8gZJn9uzdjgYR/+nBPu0jKqlKH4vbzM2ci59iQDCB1jrRrzbJ3lh0jTr2KHotHjkeGl3fqR
 tfOjxjXN3E+PhLwy4+H+8eG+/Xfznrj75J9xU45k8Z465EWALI4+r2zaMu7O9DqXR6KtqA4CO1w
 E+igMLhOgh7F/mVvRBY0YyVallbfcYpx2LOO9w4X+kFsN7VGZnPNqtr+1XnXzTBLqA3N47kRcAc
 DpN8pFu1vX0xtJpJrPgSc25cUBbgSE1pRo3ALIRcxtmleO8FdaX5qVCi9OCR0O2uW/DXhUAdm00
 rO5vQHHbTP3Ogc1KqRAHY/y3CM7R0KTvyuXG37w8yBVujGSK2e11K5J/Le9X3wvAgALQnbUmcah
 WZXG3p6qR8xgMpEtM+vLaH9KyYz73G3miKNJtUwzCielXWYbDMrWrSPW6zKjumtJqXTiBEyKHj6
 9WgR4NONmLp2dfJwEXFFnrcQTRR6ALkIJ1O8HDOlOcRUq4NkQkWdecRHhNVoYJ7AO8cAHEZgECB
 ge5BD9KNvUzZLLg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Allow pins muxed to the "gpio" function to be requested as GPIOs even if
pinmux_ops say the controller should be strict.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-sc8280xp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-sc8280xp.c b/drivers/pinctrl/qcom/pinctrl-sc8280xp.c
index 6ccd7e5648d420072f7ce467d92ef0764a6d7764..352cb08bdc12cabed8a0c3b2b9616a56578c6a58 100644
--- a/drivers/pinctrl/qcom/pinctrl-sc8280xp.c
+++ b/drivers/pinctrl/qcom/pinctrl-sc8280xp.c
@@ -1527,7 +1527,7 @@ static const struct pinfunction sc8280xp_functions[] = {
 	MSM_PIN_FUNCTION(gcc_gp3),
 	MSM_PIN_FUNCTION(gcc_gp4),
 	MSM_PIN_FUNCTION(gcc_gp5),
-	MSM_PIN_FUNCTION(gpio),
+	MSM_GPIO_PIN_FUNCTION(gpio),
 	MSM_PIN_FUNCTION(hs1_mi2s),
 	MSM_PIN_FUNCTION(hs2_mi2s),
 	MSM_PIN_FUNCTION(hs3_mi2s),

-- 
2.48.1


