Return-Path: <linux-arm-msm+bounces-23708-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1AD913537
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Jun 2024 18:50:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B0509B2199B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Jun 2024 16:50:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF214BE4A;
	Sat, 22 Jun 2024 16:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vPJUr+j9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D518F4E
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Jun 2024 16:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719074985; cv=none; b=j3JzIhmqIepd4oOU/HX6YM8V3q8uAM45CNb4qf0cQRlb8Xnk0WzvF4SAvloP1oLGcXOx33zSRcA0y3v5ql0s8929yp9H0JyZAHNICixWckEqqrGLz3/A+YdJP5H9S9ZNqmqZwMAwrGN26IjlOmGvh8Wo+PPBVHIvVVLrnk0+Er0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719074985; c=relaxed/simple;
	bh=Cm4xtFCjfl8FjuIbqKYI5P4CIm9sATlD66G+/fziS7w=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=O+75x3WyFN8Pp99gIOH2AEIiibacxP4smsEfpm+x1I2cRIV879ma2oqfGZ21IrKC0KA7WI96Bm0JJ7MI/L47xVbGZ4gkxADbN2XFxhDACiMv2SEhtXSP111DhnAVus3J/jiS2G2kD519gLpydkl604/hujo4aWc/grUKWo7gKkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vPJUr+j9; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-36532d177a0so1787780f8f.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 22 Jun 2024 09:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719074981; x=1719679781; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AybB+i8KbWZol+RgTqOdU1jMctlQSQjp11xSLGocANo=;
        b=vPJUr+j9wT/rqE4FOjB6LnLf+M9F/skXdSdILiwq5o8rDw/rCGdVGe6jIrlEtwcCoN
         TJ+/S5g3pjCvNQ4dWLO6QRunVmvGg5acjd/+V91VB3erEHZmuh57XSN/+78mH709CMJu
         DLvWyXJL+Nx7P95tIm48lJEt92ShNBBxLV0yjHiJE6fXdIMM+Mcz7PiRYe1J68YG5AOw
         8IZ1s0RCj0/i8mjxYDyWG7j0ZuVlwbLldLRwbsZSKnD1Wu4QS90cGVId4WBjnEwehqPY
         B+CCRSoVarStguKqf4fViXBCMh9igroqbSdPT19WP/KGFxGyCT6Z3usowdCcUY8ci4x+
         y0Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719074981; x=1719679781;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AybB+i8KbWZol+RgTqOdU1jMctlQSQjp11xSLGocANo=;
        b=NA6C6w7MKyHbd6sH3u4uWkK8c7EanvsVsHunfB89XYdKpoDMp53XifdQrMKDeLN7qz
         xjDgEGPR/wS206sEuC74gciLmHAtVhtBqrOYXJCtTUgpY8ySMDeC8eFiuxXfo/1/fpL4
         003aDvTAlM88q52z0VRvbmFgNaVLwKa1tvfzM6gQf7QUWo4uWPcLRWy9tTfovOczqbbY
         bVNjsMBLfvzAzK2Qlo/Y58DbKM9m1MfIw9YNOslfkgJTJ+s1tb6e8sCFTz+3LVmCG46O
         43FFq68m8xfwu84fPuZQ6RgHflMAL4bk14D07n280scgxr7U6X2ewt+qPdpDyQpl2z5C
         tAbg==
X-Gm-Message-State: AOJu0YxqNbASrL3XFdB2ofcnIvFhlapq8XQA/zEeBkIayTHGeMLp8jKo
	1cOUe58c+jjwgTVvlRQnWjiaTm+fhUVcoxq9CtAva5KrXmq0yjxiwHj9iEcXI80=
X-Google-Smtp-Source: AGHT+IGCZNmB3+OJV1zZoaz9wAZGIff/t9rY8ypSFM5zHuYIrouzpWW39eMRCaYe8lgy8HauU8Hsxg==
X-Received: by 2002:adf:ee0a:0:b0:364:4b4e:9304 with SMTP id ffacd0b85a97d-366e4f00af7mr885071f8f.43.1719074980562;
        Sat, 22 Jun 2024 09:49:40 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3663a8c8b27sm5030730f8f.104.2024.06.22.09.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jun 2024 09:49:39 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v4 0/2] pinctrl: qcom: add sm4250 lpi pinctrl
Date: Sat, 22 Jun 2024 17:49:29 +0100
Message-Id: <20240612-sm4250-lpi-v4-0-a0342e47e21b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJkAd2YC/3WNwQrCMBBEf0VyNpJs2lI9+R/iIUm37UJNy0aCU
 vrvprkJepwZ3rxVRGTCKC6HVTAmijSHHKrjQfjRhgEldTkLUFCpRoOMjwpqJaeFpNPWQeOMU7U
 SGXA2onRsgx93hB3s7cLY06sobiKBuOdupPic+V2sSZfllyBpqWSvz94Y1N43eJ0oWJ5PMw/lJ
 5n/rMmsbTuP0PagLHyx27Z9AK1wDaD7AAAA
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 alexey.klimov@linaro.org, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=892;
 i=srinivas.kandagatla@linaro.org; h=from:subject:message-id;
 bh=Cm4xtFCjfl8FjuIbqKYI5P4CIm9sATlD66G+/fziS7w=;
 b=owEBbQGS/pANAwAKAXqh/VnHNFU3AcsmYgBmdwCic81DKE1HKHDvWoZmgC3iyEvANPsBheNPm
 kCvtmp+G4qJATMEAAEKAB0WIQQi509axvzi9vce3Y16of1ZxzRVNwUCZncAogAKCRB6of1ZxzRV
 N90fCACxvihJ5l4s/krZLSV3F0J1sWihMzT2yuFvQV04aXnYm6tE8Yvpnp1DyOcqS9P7L+zuw/b
 K4siOG/6i63A/rEK6JahrGr9/PDNji2E5dSEzTzxGVBVGfJDg2R1FfIO7xPOklhQWtNc8pFwS8s
 +mbiF9qykLuPD6b9QGFHbBV3VVdUGVcplrBs2zJldg/8xMZaSxTfL/fR4RERXvJsXKWblqgthNv
 Kib5uY7PDllrdAN3jTCIx5+LFfX6TOlV2AAb4G5L/bBHjp9WF8MX17EtaOHYwy8fEpBHsXaeHbF
 mSX3RN0+OG22BeJ/H+qjMnEQwI4pPDAoAzhrGGRJPaRZpAcF
X-Developer-Key: i=srinivas.kandagatla@linaro.org; a=openpgp;
 fpr=ED6472765AB36EC43B3EF97AD77E3FC0562560D6

Add support for sm4250 lpi pinctrl.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
Changes in v4:
- update dt binding coding style
- Link to v3: https://lore.kernel.org/r/20240612-sm4250-lpi-v3-0-a8dce28f20a2@linaro.org

---
Srinivas Kandagatla (2):
      dt-bindings: pinctrl: qcom: Add SM4250 pinctrl
      pinctrl: qcom: Introduce SM4250 LPI pinctrl driver

 .../pinctrl/qcom,sm4250-lpass-lpi-pinctrl.yaml     | 118 +++++++++++
 drivers/pinctrl/qcom/Kconfig                       |   9 +
 drivers/pinctrl/qcom/Makefile                      |   1 +
 drivers/pinctrl/qcom/pinctrl-sm4250-lpass-lpi.c    | 236 +++++++++++++++++++++
 4 files changed, 364 insertions(+)
---
base-commit: 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0
change-id: 20240612-sm4250-lpi-b1ab26b3b050

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


