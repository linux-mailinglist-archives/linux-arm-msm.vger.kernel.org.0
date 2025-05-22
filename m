Return-Path: <linux-arm-msm+bounces-59074-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B07AC1251
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 19:41:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5C5B67B55A7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 17:40:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B3941A239A;
	Thu, 22 May 2025 17:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rOe4Hinx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448E81993B7
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 17:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747935659; cv=none; b=SoZOoEuBmS94797N6Wh4JvNm2Z9UQU1fq4L6G8k2TliP3p7XMo4Y+871nP3aAlzRVlDbWUeAunYQOCWI5StSQrMu/9wfnNwwtT0kN/2yiN2fvY3xu3xraEUgUFdhReu9s9uK/o23egObwFdrzgbLfVqOX42k8a6yRJBlLMzTEeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747935659; c=relaxed/simple;
	bh=Gx8rat0F5gGYg4tYeBd9EDyzRXpBbhu3rhNTcZhiZH0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CyF0qh/nS/EMHOhJEzsD9zwU8FcD6sR5d5APCbmorVb0XV7LJGgo5OgTaV0VBN6KvogU1oi80TcuL0vWZ9oqHWkg3GaiyyNebxtLoUnHKI2BMTxduO/sKpR1lDgyWk1IeNe7SXS6caPa3z2pkevCmPqzlJvWgWK9GY7Fgi543qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rOe4Hinx; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-441d437cfaaso52299865e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 10:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747935654; x=1748540454; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7NPUIJScbl2wo5u3vE+t7s0/ylzAg/M0wI+ubRZFTc8=;
        b=rOe4HinxoTlFgGf5eDTyYcj/Zuzhla5daG70e3i2i+QZ0KOUt65ainVzvnAEyAr57l
         /CO8JRKS7MBZwQARq4iT3IySEJ1ZqyLq/xGhAm6HPTKjx/u2ZpuXVMb6vVNQ13M1dnDi
         Cowk2iTizfOC7e7UVGXvxj764kH0wqvXNLLarjzsnZOr/RX5uDkhA26VYCM/DgVo9X+8
         LspNm4zF2mS4kd1li+F545nX9ZUBvCoacCxcPWxYH1gtdFv9yCQc0s6ZwYolHCZsK9b8
         A7M+uZqTpmBfggPXXDRa7hRKhjEvTUwDq33clwvWIXiVyNpmRnF5pqjIwqgNLPR1ZR9m
         HkNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747935654; x=1748540454;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7NPUIJScbl2wo5u3vE+t7s0/ylzAg/M0wI+ubRZFTc8=;
        b=VGZsMRLNMvZ4Jhmmm1Fzpv7KTrD3c5OeYJ6HfEKU9XXE5ZmzqePDxn8tAKWPqOKsGM
         pV38K4rp9GZoHOSEDJo7IYbT/81FrWxNBoZY8Cef0kt+5b+sdu4m/Hg7h644oLFcrjZC
         Q05BSF69hCTbMcCf6GHbHGyKrA8y3lg6o4NiyHDokUJfUzVRu81hZt32AApEjUAiGdkg
         Hih2XacsU5cQ7GC/PFm4hyT/f/kvSPYKJVexhFtkwOz+ArJHKDaJTILqhUmrrCkCYbUf
         w5e2UTqsW8t7kFUrkxyqiXF0QGllR/efeQe1OIWKV+NAl3Xgl67k+aZ50fI6P/ELgQgY
         e6dw==
X-Forwarded-Encrypted: i=1; AJvYcCVm5Oh2mGa6f0Cezkpj7Wur58nUOZymu4SLP4tSFpimQyj6vFEuoElIG7DInn04zHkox9AlMG9z9sv06luT@vger.kernel.org
X-Gm-Message-State: AOJu0YxHZXrHex5YAXbWTT3xnostOIe1RwlPqD1AeQUriQwX4TegccY7
	y3v+SQLhM2B+DSSYXGsJWadRoevUJ/i1tIr089z9E4w+18yYVCxBdZKoQPEPUZHPaYA=
X-Gm-Gg: ASbGnctk6cR2BP7rbCI4wF3FmkvuzRfOQ5Sfy61Bv6LN+rhZy5dk67UM8bowa0fYDL4
	TUHoBvxMjo/clr6lXN1A03XWUBZLYgDwYG2+2nOt8IkUo7/HNxCl+Y5rtLXOgeGlWtHcQZznb2l
	3Z70jlQRnSqRj4aK+WtdTURk3Mif1hZFnL2KeJINpdo9XtVrtZ0CXj7km0dk3RCzLnxn8CMin6O
	XCDYyqGbHfKDWQKi8ZhgwC4TRSPlSXvs4l/PQlgF/EBic/jWvFayRqmZI06Tt/kwFu5EU+Vacc7
	Me1sNB/0bcDkqApezWE9FVpRU7S5XQmqDGsmk+6lzc4738QZ1XunNFSgjQs=
X-Google-Smtp-Source: AGHT+IGGhVpRpV0KK+9csxjRQAa7427Mshc5zMSpLcRZ9lrj8a5WqdPgOzbFmkpOpGEFcPdmgHYleQ==
X-Received: by 2002:a05:600c:c8c:b0:442:f4a3:b5ec with SMTP id 5b1f17b1804b1-442fefd5f8dmr271581325e9.4.1747935654432;
        Thu, 22 May 2025 10:40:54 -0700 (PDT)
Received: from orion.home ([2a02:c7c:7213:c700:6c33:c245:91e5:a9f4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f7bae847sm109563195e9.36.2025.05.22.10.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 10:40:53 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH v3 00/12] qrb4210-rb2: add wsa audio playback and capture
 support
Date: Thu, 22 May 2025 18:40:50 +0100
Message-Id: <20250522-rb2_audio_v3-v3-0-9eeb08cab9dc@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKJhL2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHUUlJIzE
 vPSU3UzU4B8JSMDI1MDUyMj3aIko/jE0pTM/PgyY920tERDo5TkZDNDEwsloJaCotS0zAqwcdG
 xtbUAU/wbnV4AAAA=
X-Change-ID: 20250522-rb2_audio_v3-ffa12dcc6148
To: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>, 
 linux-sound@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.2

Rebased, updated, re-tested. This implements the playback support via the
following path: RX1 from DSP is connected to rxmacro which communicates
with wcd codec using soundwire. This goes into AUX input of wcd. Wcd codec
outputs analog audio into wsa8815 amplifier. Capturing works through vamacro
using one onboard DMIC which is directly connected to vamacro codec.

Changes since v2:
-- dropped [PATCH v2 08/14] dt-bindings: arm: qcom-soc: extend pattern matching
to support qcom,wsa881x and replaced with new one;
-- dropped [PATCH v2 14/14] ASoC: qcom: sm8250: force single channel via RX_1 output for qrb4210
-- reordered as suggested by Krzysztof;
-- updates to wsa881x-common.h registers descriptions and corresponding updates
to wsa881x-common.c (Konrad);
-- sorted subnodes in DT alphabetically as suggested by Konrad;
-- wsa881x bindings updates (as suggested by Krzysztof);
-- ASoC: dt-bindings: qcom: Add SM6115 LPASS rxmacro and vamacro codecs
is still present;
-- added "qcom,wsa8810" compatible to wsa881x-i2c.c;
-- wsa881x is still present in wsa881x_probe_common();

Second version:
https://lore.kernel.org/linux-arm-msm/20241212004727.2903846-1-alexey.klimov@linaro.org/

First version:
https://lore.kernel.org/linux-sound/20241101053154.497550-1-alexey.klimov@linaro.org/

---
Alexey Klimov (12):
      ASoC: dt-bindings: qcom: Add SM6115 LPASS rxmacro and vamacro codecs
      dt-bindings: arm: qcom-soc: ignore "wsa" from being selected as SoC component
      ASoC: dt-bindings: qcom,wsa881x: extend description to analog mode
      ASoC: codecs: lpass-rx-macro: add sm6115 compatible
      ASoC: codecs: wsa881x: split into common and soundwire drivers
      ASoC: codecs: add wsa881x-i2c amplifier codec driver
      arm64: dts: qcom: sm6115: add LPASS devices
      arm64: dts: qcom: sm4250: add description of soundwire and dmic pins
      arm64: dts: qcom: qrb4210-rb2: add wcd937x codec support
      arm64: dts: qcom: qrb4210-rb2: enable wsa881x amplifier
      arm64: dts: qcom: qrb4210-rb2: add WSA audio playback support
      arm64: dts: qcom: qrb4210-rb2: add VA capture support

 .../devicetree/bindings/arm/qcom-soc.yaml          |    2 +-
 .../bindings/sound/qcom,lpass-rx-macro.yaml        |   19 +
 .../bindings/sound/qcom,lpass-va-macro.yaml        |   22 +-
 .../devicetree/bindings/sound/qcom,wsa881x.yaml    |   66 +-
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts           |  113 ++
 arch/arm64/boot/dts/qcom/sm4250.dtsi               |   62 +
 arch/arm64/boot/dts/qcom/sm6115.dtsi               |  132 ++
 sound/soc/codecs/Kconfig                           |   15 +
 sound/soc/codecs/Makefile                          |    4 +
 sound/soc/codecs/lpass-rx-macro.c                  |    4 +-
 sound/soc/codecs/wsa881x-common.c                  |  193 +++
 sound/soc/codecs/wsa881x-common.h                  |  478 +++++++
 sound/soc/codecs/wsa881x-i2c.c                     | 1353 ++++++++++++++++++++
 sound/soc/codecs/wsa881x.c                         |  493 +------
 14 files changed, 2459 insertions(+), 497 deletions(-)
---
base-commit: 7bac2c97af4078d7a627500c9bcdd5b033f97718
change-id: 20250522-rb2_audio_v3-ffa12dcc6148

Best regards,
-- 
Alexey Klimov <alexey.klimov@linaro.org>


