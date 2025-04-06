Return-Path: <linux-arm-msm+bounces-53313-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B8BA7D028
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Apr 2025 22:16:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A7AD816E5D4
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Apr 2025 20:16:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC4AE1991C9;
	Sun,  6 Apr 2025 20:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RRuDVsMv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06DE3597A
	for <linux-arm-msm@vger.kernel.org>; Sun,  6 Apr 2025 20:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743970613; cv=none; b=kQ4aRDowxZh+Q2IkoOavzvGKpzYMe/AXVYGmDLWjRAa6b3FVIvsO0VgoumXTgZHK/mOnf2wyFIxs5UWqESuTFBkdNn1c50Gn0nWMME2G2d13ALasEGlsui3qUNXlrQrcfmoLYbEIaLC3uUrt7dRN4PNId9XmVnLhD5VXM3SKxJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743970613; c=relaxed/simple;
	bh=IynFeTWu2RIJzXLhbEL7Bz8oQAxmTkOW8hpdmpazhoQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=s8rzAT5nSIEvFuhcXmH3rhldEaBM2GFknWsqxCQB0anwDd6oDncDCpcmzC8yF5Att7UcOA90cQ92xYwu/6trohSjNDrOK0m/VlHe3UYUXYFBSM9r1HjkbzYyuzH2D4GYaxewinPCt8M7gwxm+fdJc52jl9rL/nltbJp45HS2Q0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RRuDVsMv; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3913290f754so447244f8f.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Apr 2025 13:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743970610; x=1744575410; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/dVyzSn8fSeihotin2QKk8FRBWW/ENbboLn0/pECTQU=;
        b=RRuDVsMvrZi1kojq4+yaJST+usXcde29sGmJi67LgMHvQR+MZsdLLjTewfvxddtS1v
         ryusXwuqto5W1NSfhV692LDk5qMjC2T+MsswbW/923/gCCiQFdNMQ24L5JzUdGMyIJP8
         YHxZi3g7H7rG12Gr8MlefjbLl9owvnpHeElLmm3z3HLfCwsR16cDLWDflME/zr4aQtTR
         g9cdg4MnypzuVCLa4314aZ8v2xuzUlIrVr7hdCOvZYrHUWRJxaipa1zEQCZvBPXqKH+w
         mapG23oNCxEM33ZQhlK7T0/1DcAptJOJMwyntK0SxprHhgIZ8WrpwLghPDyGp8ae/OGD
         UjRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743970610; x=1744575410;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/dVyzSn8fSeihotin2QKk8FRBWW/ENbboLn0/pECTQU=;
        b=SMz1/mcr9hrRCAZXoaPWgd7cyGrVSkMlTBH4W2mHAbEFHOC5nWqgUSrGIa7i4/w9fZ
         0Hhv3gR9D5CNWlKY0tsMe4Kid2H5mPT7RbJV1wgI/UAG6fE4x0SDjt8yoLeqOopvpMGP
         9vB6/c/ktwgP9HwtgqXRHvaktxGBPf67RHaILEudVmV4DpYWwrHE1mtvmq9pwWj34PNA
         H+zakq8sntgBg46Rp5ixMrTQ/9QVhEJ/NyXJz6pfHRuTSXwuzgl2GX7YZ2F8UVGX17+4
         QpO4xjJarsjIwwFnWao0zjZMuBMFJ2GufeDTmk5P5X9qb6IwMaV+XzyYx8GrrGym/eTk
         6I0w==
X-Forwarded-Encrypted: i=1; AJvYcCWI8g0fZIeK31HbH5zs8uoRzqxrGk41UOUIrK9fsD8Heb0jbf1GWbLpNpiEAubusuutrlD6q4Z3fOwXd//h@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5JeP45o00TvwHb0gkx9dgibeWcQbxviYqWLBKkaN0SoZM6FyG
	K1WyZ6saZPUnyPcoBz1G3Nru2dBUkVWhnYWDSlsVBwv8tiMmUOFfIfQGIF8SMWk=
X-Gm-Gg: ASbGncsSZBMpcBpLqKwy6yLhqbf39kcqqMOT+jk0c9pbABm73cyz8/qf4fEMW1W9xMR
	wGYsSNSWE3gwL5yDFBTQCGQVJ/0Hsu+JcyXsb8wM0GGVi9SZ2p/vtrMaMha4Fn54dARGwIe6HD2
	D19e6h2Wj9EMSkpIRcImw3yaiEuVKVLzKrARgomX1W4iKmDfMZ9m8yD/oa37FarpVZsJBjZc2KM
	g/DFzBdKsUl2M2vOwPDC68OiBHhVdOZrUDBl2Nb76GRvqUPkr7u1vj7quaWpOHcl6GyJ8X8WDTY
	ScGwr0rUKmZfST1MyPnosCq7mhW1YqCHn14vD2BqbJiKNmlrLnCOv71PhC/zUKU=
X-Google-Smtp-Source: AGHT+IFiIpvcOwBmgVnnknF4d+Z9EAYOHluJwv1KXZPNLWgwlIX3qotFRPLaaIcIsJj96kA9woECbA==
X-Received: by 2002:a05:6000:1ac8:b0:38d:d743:7d36 with SMTP id ffacd0b85a97d-39cba936342mr2974149f8f.10.1743970610172;
        Sun, 06 Apr 2025 13:16:50 -0700 (PDT)
Received: from [192.168.1.26] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d68esm10295521f8f.67.2025.04.06.13.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 13:16:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/4] extcon: Fix wakeup source leaks on device unbind
Date: Sun, 06 Apr 2025 22:16:38 +0200
Message-Id: <20250406-device-wakeup-leak-extcon-v1-0-8873eca57465@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACbh8mcC/x2MQQqEMBAEvyJzdiCGKLhfWTzEpNVBiZK4qyD+3
 eCxoKouSoiCRJ/iooi/JFlDhqosyE02jGDxmUkrXSujGvZZcuDDzvhtvMDOjHN3a2DvKm+Mbq3
 uDeV+ixjkfN/f7r4fZ3n6qWsAAAA=
X-Change-ID: 20250406-device-wakeup-leak-extcon-dc1d4429a2b4
To: MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Hans de Goede <hdegoede@redhat.com>, 
 Chen-Yu Tsai <wens@csie.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1016;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=IynFeTWu2RIJzXLhbEL7Bz8oQAxmTkOW8hpdmpazhoQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBn8uEr9D66aedCyUONRuEkOeAuxZZK90QD9AfiM
 Si+GkPkgZqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ/LhKwAKCRDBN2bmhouD
 15wGD/oCr01DUByCd9GYdB92Iq8CCUYdDMU+GQBupswesIlUU8J/2WxoPkr6Ka2bIFMzYCXTJH9
 yNfJShPuVZmnFh0njAuNjaZhZ3s9Wo/FIIgFEZXqiAVxeZasx0E1MIcX3vN8C5DKwJ7bdld2cF9
 zJc+e/URXfrL37O+nxq2J1jKH2bTz3tBfGFLr2CxzjXvBqQZFN4IM7vkLR1rN16uqU5wX8d2Yje
 5k6s+P3XClnFZQPAstYNa6jeIOTvHcZP+jJrNUGngNZDeS8uqdZQDttqRDAkIDdQp5HhsoTD84C
 SAlM32ipHYy5ZOz4D/PEFgQRotQA+6W0IDmflN1n/4HSctjbhKtR5rWBsKeTch+r3YTaDShwiG7
 NZEtLN9mWBA8hfKc7XJOzA0ibe1pvJSLhi5TqS8/GqiMnvwpINushLp3yR8mvEoB7vYA6u7PA2d
 F3IosXTD1o4q4r8vzuy83isq2YNYBQN6QhVdX4s+YlkEb5JK9VFuHCBg0oQ7a0T/FJAGXUz0oY3
 gbjgpZoCHWEGFinaYG1yUbZ/XR43auMmRVUns7WfeD62z+x4hIhPFVYXsqr6HbZRKTfvFZg4b4S
 Zis9yUOKHTDBWAWf8SUrdSjUatQ7hXRSwRm3FjgaDxrCf2xdCAKh9SjUi7QamQWhNmnK8Ju8R5+
 N9npqiP7DAELkbA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Device can be unbound, so driver must also release memory for the wakeup
source.  Use devm for driver already having devm interface and manually
disable wakeup for drivers still having remove() callback to keep
consistent ordering of cleanups.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (4):
      extcon: adc-jack: Fix wakeup source leaks on device unbind
      extcon: axp288: Fix wakeup source leaks on device unbind
      extcon: fsa9480: Fix wakeup source leaks on device unbind
      extcon: qcom-spmi-misc: Fix wakeup source leaks on device unbind

 drivers/extcon/extcon-adc-jack.c       | 1 +
 drivers/extcon/extcon-axp288.c         | 2 +-
 drivers/extcon/extcon-fsa9480.c        | 2 +-
 drivers/extcon/extcon-qcom-spmi-misc.c | 2 +-
 4 files changed, 4 insertions(+), 3 deletions(-)
---
base-commit: a4cda136f021ad44b8b52286aafd613030a6db5f
change-id: 20250406-device-wakeup-leak-extcon-dc1d4429a2b4

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


