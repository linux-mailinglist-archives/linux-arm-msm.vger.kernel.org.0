Return-Path: <linux-arm-msm+bounces-29712-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A3A962090
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 09:18:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 52B50B21FB4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 07:18:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00E7515884A;
	Wed, 28 Aug 2024 07:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gEaGQrNF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD47158216
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Aug 2024 07:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724829477; cv=none; b=dhyfpN4mMNC0+KUKwqLcFXSuWcNL4+FoMelFheX1nAf2sriSL6u+yc7rCYD5LHAsKYdDJKEu0Nq4wy1FS2Ei/tVJ3GejwHEF61e7qdYV1F/hO5nEFA2jEVisOfxtIb0LxTA+CLefccz5ehDfG4J/nLxObxZCCmpHPsmJP53MTaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724829477; c=relaxed/simple;
	bh=/WfP7kNRzbVaCtwGYNYqsRhOm/D5rdo3FxEdbRMha5Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YNBDEhMWb8NNMWlmpNj2r/C8mADbwx2ILNEtuR+y6TCTBdCYhSvWqSg13Lnrvs6ynSGP93TvOe1Wb1BPpLZMoKrhvR+adEuJe9QE1HYTS6rqWREUPVZG0mi1drMsrzCi9E3SB4zNK3xBGfetjQ4RsGA38emtBWsdesHQPW2R+js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gEaGQrNF; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4280921baa2so7131385e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Aug 2024 00:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724829474; x=1725434274; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oJFsf2Kz2odTq3MNvYvN0o61H5lw7b2bcpixEQyhhaY=;
        b=gEaGQrNFd05OPeySHMdnTjjxGC1RT4Fj2gEggpaZZ+LlIi7no9nmioF11+8h8eUL5x
         F9kPVQXS8LijjsMTwDkjdjnGl6f7BsHWy6SAN9+M7SoJFmfhRR+augBTKFxU/s50qYh/
         DGIFuyebAMPx0mLYDX9Xc4DdPoiZhh6ZKhJTraixjb6eqHUeAsJdTnVZkyThflL5/Frx
         azQWMjeWxHb8oUvX3/fZwSE37mdaP6qg9W5mb8/cgBvaz/Tvt8RTRCMva1Y31DDVlD1C
         PBr7WOuVr9YBdOfAB3d52DpwoL7SSpj8DkZmXYXgjbb0NakUmJtPm7BE02Z+W2FDtHKw
         ySJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724829474; x=1725434274;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oJFsf2Kz2odTq3MNvYvN0o61H5lw7b2bcpixEQyhhaY=;
        b=GIG7kB7FDP0ki/Cdco7Gcqyx6mmaEPI8pGawo/Ucd2BlcX0McW/RJjd+nMIT6cT5mN
         yCelu8ql8xM8KxLek4jjMing/6+nOnCEb5Yew7OPp7sF8JctRnZufQuIbGCVI/ZMssuB
         YNe1TLdaeJc3zzPh19eJFukTCafLtfYJxSNquz44M31UfFMsjroAwXWae9v78vfznGcq
         IJhStXzJtXi0H68fZyLwjFDkChAIirxRcyOKrjnG5exUDybRodLxC6xoLENmYCa33iFz
         IuV9FkrJzyecQNYwl1zcQ5LLH1fEozgSjjzFGGWATpOZflbJO1dV5bHyAwAkMxxUYjtn
         p/WQ==
X-Gm-Message-State: AOJu0Yygnt9a6c1Rj88umNh7qxPcRQKH2xqNKF2O3xby4HFzjnrBczJR
	s9svS80sK4dTsDvfg7GxLuM+P+UNHzud8xxwP15KKdG52hVdcx55mhnTeUN6vVQ=
X-Google-Smtp-Source: AGHT+IFgfLCRU7/MjkSs5g45hWmEO9iCMt8Xjb2dX2iD1ZC9k8PC3G+zmAqpGbs3uBT1EiOGzW0uSQ==
X-Received: by 2002:a05:600c:3b90:b0:426:5dd5:f245 with SMTP id 5b1f17b1804b1-42acc8dedbfmr68233145e9.2.1724829474181;
        Wed, 28 Aug 2024 00:17:54 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37308200404sm14843476f8f.81.2024.08.28.00.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 00:17:53 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 00/16] arm64: dts: qcom: change labels to lower-case
Date: Wed, 28 Aug 2024 09:17:30 +0200
Message-Id: <20240828-dts-qcom-label-v1-0-b27b72130247@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAvPzmYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDCyML3ZSSYt3C5Pxc3ZzEpNQcXQtDSwvLtCRziySLZCWgpoKi1LTMCrC
 B0bG1tQDCBZZvYAAAAA==
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5000;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=/WfP7kNRzbVaCtwGYNYqsRhOm/D5rdo3FxEdbRMha5Y=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmzs8OR1E9v5Z2SUe+kyny01wZFZdBJPQs1gmmA
 HBdk9WBtu6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZs7PDgAKCRDBN2bmhouD
 18wlD/9zjctBMpxJU7rTHLBOdo4Wi3eIk7igLnJ+uKDw1qj6jwwEOxewPv9EY8+BKwC80da2qSC
 /q45kIWv3mCT9b6IPZUzMwZLJRHVenX7lOzn7zCib+kiiIOJC9Su92/PxuRLFkY0Iyx8Bb1I42v
 +lt78DLnJ0rnxlA5wZMTX0n+0/kMaz+1LwJVXzbu46z9lcPhUKxQWqcCZEx4GVABQ0//WLHWNsT
 aLe6ukvEn0YJBaOb8Jwx1o/fIWBqlNRhjjlKw/Mde82YdaoBBtaHRD3IlHIeAfmAGCBW7NF9pXf
 etndx779PdVe6BjNtWetpuTYOKZvinkSqs4NW2i3jnanyk/7HWGRUqTaYiyc7NP7jVQvfbuPqKk
 xzos9OmMcoVCp93E+U5RLmuK2u5IB6s0rMvorrADIlxNk3I2ROhoNREVT0xsfidgXd/xiJA9l0h
 9EM16+YmKhX4XPZbuAokmfor6LiW37DXPkhqGSxndzmIq8cL/BjssAgB9jiz7wJHiQLkBACU3UI
 A3wHDzxWpufAsY8KiAJTVmsRKegwkjiv3tid7IIyqxpXuve7/6gHFzmmLYNrapLEkM61rPLgR7f
 3mjSsbdsVeMo/zQ56ECll3BPwnZgJRjy4PrGKQlhmGYO/0tESgUDBe6LO0+9x+3wgOaF5JXZ8kA
 Iy7OCz3g5N1/WiA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

DTS coding style expects labels to be lowercase.  No functional impact.
Verified with comparing decompiled DTB (dtx_diff and fdtdump+diff).

I am splitting the patchset per few patches doing the same, because
otherwise diffs would be too big and would bounce from Patchwork/mailing
list.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (16):
      arm64: dts: qcom: ipq: change labels to lower-case
      arm64: dts: qcom: msm: change labels to lower-case
      arm64: dts: qcom: sc7180: change labels to lower-case
      arm64: dts: qcom: sc8280xp: change labels to lower-case
      arm64: dts: qcom: sc: change labels to lower-case
      arm64: dts: qcom: sm6115: change labels to lower-case
      arm64: dts: qcom: sm6350: change labels to lower-case
      arm64: dts: qcom: sm8150: change labels to lower-case
      arm64: dts: qcom: sm8350: change labels to lower-case
      arm64: dts: qcom: sm8250: change labels to lower-case
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
 arch/arm64/boot/dts/qcom/msm8939.dtsi              | 110 +++----
 arch/arm64/boot/dts/qcom/msm8953.dtsi              |  68 ++--
 arch/arm64/boot/dts/qcom/msm8976.dtsi              |  32 +-
 arch/arm64/boot/dts/qcom/msm8992-lg-h815.dts       |  12 +-
 arch/arm64/boot/dts/qcom/msm8992.dtsi              |   4 +-
 arch/arm64/boot/dts/qcom/msm8994.dtsi              |  52 +--
 arch/arm64/boot/dts/qcom/msm8996.dtsi              |  54 ++--
 arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi    |  32 +-
 arch/arm64/boot/dts/qcom/msm8998.dtsi              |  92 +++---
 arch/arm64/boot/dts/qcom/qcm2290.dtsi              |  68 ++--
 arch/arm64/boot/dts/qcom/qcs404.dtsi               |  68 ++--
 arch/arm64/boot/dts/qcom/qdu1000.dtsi              |  76 ++---
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts           |  10 +-
 arch/arm64/boot/dts/qcom/sa8775p.dtsi              | 168 +++++-----
 arch/arm64/boot/dts/qcom/sc7180-firmware-tfa.dtsi  |  84 ++---
 .../arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi |   8 +-
 .../boot/dts/qcom/sc7180-trogdor-homestar.dtsi     |   8 +-
 .../boot/dts/qcom/sc7180-trogdor-wormdingler.dtsi  |   8 +-
 arch/arm64/boot/dts/qcom/sc7180.dtsi               | 344 ++++++++++----------
 arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi |   6 +-
 arch/arm64/boot/dts/qcom/sc7280.dtsi               | 356 ++++++++++-----------
 arch/arm64/boot/dts/qcom/sc8180x.dtsi              | 146 ++++-----
 .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     |  16 +-
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             | 140 ++++----
 arch/arm64/boot/dts/qcom/sdm630.dtsi               | 152 ++++-----
 arch/arm64/boot/dts/qcom/sdm632.dtsi               |  26 +-
 arch/arm64/boot/dts/qcom/sdm660.dtsi               |  16 +-
 arch/arm64/boot/dts/qcom/sdm670.dtsi               | 140 ++++----
 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi         |  74 ++---
 arch/arm64/boot/dts/qcom/sdm845.dtsi               | 160 ++++-----
 arch/arm64/boot/dts/qcom/sdx75.dtsi                |  80 ++---
 arch/arm64/boot/dts/qcom/sm4250.dtsi               |  16 +-
 arch/arm64/boot/dts/qcom/sm4450.dtsi               | 142 ++++----
 arch/arm64/boot/dts/qcom/sm6115.dtsi               | 152 ++++-----
 arch/arm64/boot/dts/qcom/sm6125.dtsi               |  52 +--
 arch/arm64/boot/dts/qcom/sm6350.dtsi               | 172 +++++-----
 arch/arm64/boot/dts/qcom/sm6375.dtsi               | 142 ++++----
 arch/arm64/boot/dts/qcom/sm7125.dtsi               |  16 +-
 arch/arm64/boot/dts/qcom/sm7225.dtsi               |  16 +-
 arch/arm64/boot/dts/qcom/sm8150.dtsi               | 352 ++++++++++----------
 arch/arm64/boot/dts/qcom/sm8250.dtsi               | 348 ++++++++++----------
 arch/arm64/boot/dts/qcom/sm8350.dtsi               | 334 +++++++++----------
 arch/arm64/boot/dts/qcom/sm8450.dtsi               | 142 ++++----
 arch/arm64/boot/dts/qcom/sm8550.dtsi               | 144 ++++-----
 arch/arm64/boot/dts/qcom/sm8650.dtsi               | 142 ++++----
 arch/arm64/boot/dts/qcom/x1e80100.dtsi             | 192 +++++------
 52 files changed, 2597 insertions(+), 2597 deletions(-)
---
base-commit: c9795221fa7998bbe2298f904a4c80e0851bbb1d
change-id: 20240828-dts-qcom-label-81989fb78b8c

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


