Return-Path: <linux-arm-msm+bounces-30011-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6609644C4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 14:40:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9CBBAB27D0D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 12:40:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 817EF1AD9E9;
	Thu, 29 Aug 2024 12:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AjLlydPq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45BF0192B66
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 12:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724934908; cv=none; b=V1wiGgZptb1AjQJhIm123GbmBX6nC1ofqPZV2EVr1txm8eak6yHJgwjIQ8mbAr/ApAdzzRlZ/r/qnW1EunLoGN3XA9Y8xVFv6C7GJYVmd46gbJkMD3vR1E/LSzNNlKgAHkCu4ioYfe+az30MWZjf7BYI5sBFchK3aQf6N4L1lHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724934908; c=relaxed/simple;
	bh=A94fbOmMnCooTL/B0tEnX125QpW9zvLEW8SCjKCx928=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ACTh6WzVf6+Ey9yEJ71GgcBzpDKo7ftvUdpEtYcL2F0P9PGQ6HEkju0kLGA1C73t5sZLmFHqDySg1xqyyqy2CdFYH+0/XALUtJiqOtcDjhjop6Zn8AV32YXWmYm8hFbPbq/gO4YncaHpB2jI66T/Wfom+ddRlHwyAUefEr4bbZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AjLlydPq; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-42802e90140so914005e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 05:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724934904; x=1725539704; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LCvf5VP3lL2Ujxo2dpmuPVrjXbHO8/j1viTpjIqCuHM=;
        b=AjLlydPqw1oGQJNYAQ+k6Vp1yhwzmduAatd1uIfsLIdv0BJx8kBeal0Cizu+oFuLtT
         RBNzAmWkVWnsjtNY5onhYnsBWln8C+WjwT5AJzxcx/JDEjR73CCEowWutpC2ktjXlkKS
         tCM06vxcLr4QLVuEo0xRjMfQm/WxvfyP+DGO/YxrAawQlJYQr+0wulnqfCbV+NHXZUoB
         FzSN0fMQG3nQy2wc3dChLe3X7VPwKEG+aUq26rZAFNi04KaLHBiRR5ui1PXhpRTJIxTI
         +JR7s1g7DivMbrGysdjKusGP8FX/VX7r/JK9D+A4sk8rP4gODmx3ytUcFa/EgLBSzRoV
         3TqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724934904; x=1725539704;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LCvf5VP3lL2Ujxo2dpmuPVrjXbHO8/j1viTpjIqCuHM=;
        b=UcBSKIZM1vwKofk+l4EE5dUWfzxHy3NVmjUdr3uNRDHVKD59qTUL+a6/zF2fEO/6xQ
         eatP0sX8xdo+pBO+f8TK4hr1gAHSIBuD5pk3JNX0eq/uT4m/ZNJ4t/hKiZdF3Pomrs04
         GcBW6Rnv3Xes32omN5bXTX1MbxISPgZWitUbfWFvmROIpybnmdWH0CS7T+3RfHt04n0g
         +KbRyO9ETtIGjct1KJ++gTJM3mEyBRvSZ4YiveSD1WaVyQBfro1SbFlb4CX0MVvSbcal
         KgM1jsBBEDwA3gG/NX6Yikh+NwHer4LIj3joB5QLkX31ODiu5gUfmX5oZ9NEqbTqbdtD
         NwrQ==
X-Gm-Message-State: AOJu0Yw4J7OJxftggUv8ptdJWFowa3BzgHjAfK7B6gT9n7UVWceRqKtC
	Yj4pfzQZ26P4NQOIVyLrziGKSvOGbNfzSh9UNgv5N2jLEmXetuftPcRfZQDO6a8=
X-Google-Smtp-Source: AGHT+IFSJzkxe4229qkDipmZwYXw+yxrKpJOs5rQ9G+PyiUQHkEg8mzTU3P5Q9L+1N+SX8cjrJJNDQ==
X-Received: by 2002:a05:600c:4f42:b0:427:f1a9:cb06 with SMTP id 5b1f17b1804b1-42bb01331ffmr13631705e9.0.1724934903443;
        Thu, 29 Aug 2024 05:35:03 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3749ee4a55fsm1322270f8f.10.2024.08.29.05.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 05:35:02 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 00/17] arm64: dts: qcom: change labels to lower-case
Date: Thu, 29 Aug 2024 14:34:35 +0200
Message-Id: <20240829-dts-qcom-label-v2-0-5deaada3e6b2@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANtq0GYC/3WMwQ7CIBAFf6XZs2sATaCe/A/TA1DaboJgoSGah
 n8Xe/c4L29mh+wSuQy3bofkCmWKoYE4dWAXHWaHNDYGwcSVKaFw3DKuNj7Ra+M8Kt6rfjJSGWW
 hSa/kJnofwcfQeKG8xfQ5+oX/1r+pwpGhEdJIwS/tI++egk7xHNMMQ631C+vv/mqtAAAA
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5744;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=A94fbOmMnCooTL/B0tEnX125QpW9zvLEW8SCjKCx928=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBm0GrjAf4U/m//+qZWTI3CKdLMfs4BqHSsd5PvC
 8abf0ElxqSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZtBq4wAKCRDBN2bmhouD
 1yACD/oD6BwxG5fDEJI4fkSLQG3Ta62Iq/kIOP8SQlt4TqH0iGKrm9YJ1Ke4zyUApwjqT3UFkAG
 uruUcBBKZkKojqTcG8NZWvzwMMQ/UlyXJcitMZv11poTx36ccUw249aanYNdt0ORrlkqxjoWQjb
 ezBs1mMVLINnSbIYFMuY6X5SlBufaAQ99/hp03SyGewmbKy+YDEqlaHIx+dyd+zD53QTN4vhH1R
 gGcFZEAyWMWaaSQGyKXxNbERmy54REAalF/oIspCmlivoBMq/NiJY+n2ioeWXuaj8P63RPf3wcy
 3BePTmHZ/A7U5cN53sRB7mtsYS5y2CqbPQevmPuijtpSi01EwXBsTW72jI7VL6qdroyXbnB0WGU
 XEBAKMIiidaxBLJNKvvD9hVh2ORbtn1J0Avr/WP3XoqPcm+H+42edUBqLeAo5KKpnwHBNsMXCj5
 NUL7HtPtEov+bNIwDskml0s+ROqelTMwirE9xZN10CEpUTb/oLjDjMAOAeDMBs7trISuvKVx2WG
 O/oFZfx0xhCuROcprSa1DzAJxPErjencpZZhYM1dp+4LncHVqoVj4Mtms3EdDOBp6DjSaLM+kjs
 t3MRsynNMLK7a2fMdJWdw1vnyPIdJ8QYn0+lodkP4hVYoAk4IjA8QOfQxG3AGdtjMHi78CHEaau
 MyXtplzEOmhnDMQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Changes in v2:
- New patch #3
- Several fixes as pointed out by Konrad - not entire part of labels was
  converted in v1 (e.g. LITTLE_CPU_SLEEP_0 -> little_cpu_SLEEP_0).
- Few more labels found for clusters/cpu sleep states and clk40m.
- So in total re-doing pattern matching. b4 is your friend for the
  changelog :)
- Link to v1: https://lore.kernel.org/r/20240828-dts-qcom-label-v1-0-b27b72130247@linaro.org

DTS coding style expects labels to be lowercase.  No functional impact.
Verified with comparing decompiled DTB (dtx_diff and fdtdump+diff).

I am splitting the patchset per few patches doing the same, because
otherwise diffs would be too big and would bounce from Patchwork/mailing
list.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (17):
      arm64: dts: qcom: ipq: change labels to lower-case
      arm64: dts: qcom: msm: change labels to lower-case
      arm64: dts: qcom: msm8992-libra: drop unused regulators labels
      arm64: dts: qcom: sc7180: change labels to lower-case
      arm64: dts: qcom: sc8280xp: change labels to lower-case
      arm64: dts: qcom: sc: change labels to lower-case
      arm64: dts: qcom: sm6115: change labels to lower-case
      arm64: dts: qcom: sm6350: change labels to lower-case
      arm64: dts: qcom: sm8150: change labels to lower-case
      arm64: dts: qcom: sm8250: change labels to lower-case
      arm64: dts: qcom: sm8350: change labels to lower-case
      arm64: dts: qcom: sm8450: change labels to lower-case
      arm64: dts: qcom: sm8550: change labels to lower-case
      arm64: dts: qcom: sm8650: change labels to lower-case
      arm64: dts: qcom: sm: change labels to lower-case
      arm64: dts: qcom: sdm: change labels to lower-case
      arm64: dts: qcom: change labels to lower-case

 arch/arm64/boot/dts/qcom/ipq5018.dtsi              |  10 +-
 arch/arm64/boot/dts/qcom/ipq5332.dtsi              |  18 +-
 arch/arm64/boot/dts/qcom/ipq6018.dtsi              |  26 +-
 arch/arm64/boot/dts/qcom/ipq8074.dtsi              |  18 +-
 arch/arm64/boot/dts/qcom/ipq9574.dtsi              |  50 +--
 arch/arm64/boot/dts/qcom/msm8916.dtsi              | 100 +++---
 arch/arm64/boot/dts/qcom/msm8939.dtsi              | 110 +++---
 arch/arm64/boot/dts/qcom/msm8953.dtsi              |  68 ++--
 arch/arm64/boot/dts/qcom/msm8976.dtsi              |  32 +-
 arch/arm64/boot/dts/qcom/msm8992-lg-h815.dts       |  12 +-
 arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts  |   4 +-
 arch/arm64/boot/dts/qcom/msm8992.dtsi              |   4 +-
 arch/arm64/boot/dts/qcom/msm8994.dtsi              |  52 +--
 arch/arm64/boot/dts/qcom/msm8996.dtsi              |  54 +--
 arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi    |  32 +-
 arch/arm64/boot/dts/qcom/msm8998.dtsi              |  92 ++---
 arch/arm64/boot/dts/qcom/qcm2290.dtsi              |  68 ++--
 arch/arm64/boot/dts/qcom/qcs404.dtsi               |  68 ++--
 arch/arm64/boot/dts/qcom/qdu1000.dtsi              |  86 ++---
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts           |  14 +-
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts           |   4 +-
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts           |   4 +-
 arch/arm64/boot/dts/qcom/sa8775p.dtsi              | 188 +++++------
 arch/arm64/boot/dts/qcom/sc7180-firmware-tfa.dtsi  |  84 ++---
 .../arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi |   8 +-
 .../boot/dts/qcom/sc7180-trogdor-homestar.dtsi     |   8 +-
 .../boot/dts/qcom/sc7180-trogdor-wormdingler.dtsi  |   8 +-
 arch/arm64/boot/dts/qcom/sc7180.dtsi               | 362 ++++++++++----------
 arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi |   6 +-
 arch/arm64/boot/dts/qcom/sc7280.dtsi               | 374 ++++++++++-----------
 arch/arm64/boot/dts/qcom/sc8180x.dtsi              | 164 ++++-----
 .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     |  16 +-
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             | 158 ++++-----
 arch/arm64/boot/dts/qcom/sdm630.dtsi               | 152 ++++-----
 arch/arm64/boot/dts/qcom/sdm632.dtsi               |  26 +-
 arch/arm64/boot/dts/qcom/sdm660.dtsi               |  16 +-
 arch/arm64/boot/dts/qcom/sdm670.dtsi               | 158 ++++-----
 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi         |  74 ++--
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts         |   4 +-
 arch/arm64/boot/dts/qcom/sdm845.dtsi               | 178 +++++-----
 arch/arm64/boot/dts/qcom/sdx75.dtsi                |  90 ++---
 arch/arm64/boot/dts/qcom/sm4250.dtsi               |  16 +-
 arch/arm64/boot/dts/qcom/sm4450.dtsi               | 160 ++++-----
 arch/arm64/boot/dts/qcom/sm6115.dtsi               | 152 ++++-----
 arch/arm64/boot/dts/qcom/sm6125.dtsi               |  52 +--
 arch/arm64/boot/dts/qcom/sm6350.dtsi               | 190 +++++------
 arch/arm64/boot/dts/qcom/sm6375.dtsi               | 160 ++++-----
 arch/arm64/boot/dts/qcom/sm7125.dtsi               |  16 +-
 arch/arm64/boot/dts/qcom/sm7225.dtsi               |  16 +-
 arch/arm64/boot/dts/qcom/sm8150.dtsi               | 370 ++++++++++----------
 arch/arm64/boot/dts/qcom/sm8250.dtsi               | 366 ++++++++++----------
 arch/arm64/boot/dts/qcom/sm8350.dtsi               | 352 +++++++++----------
 arch/arm64/boot/dts/qcom/sm8450.dtsi               | 160 ++++-----
 arch/arm64/boot/dts/qcom/sm8550.dtsi               | 162 ++++-----
 arch/arm64/boot/dts/qcom/sm8650.dtsi               | 156 ++++-----
 arch/arm64/boot/dts/qcom/x1e80100.dtsi             | 202 +++++------
 56 files changed, 2765 insertions(+), 2765 deletions(-)
---
base-commit: 1d875a0450232790dd662c9e44c2c0bd9c675636
change-id: 20240828-dts-qcom-label-81989fb78b8c

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


