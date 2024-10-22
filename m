Return-Path: <linux-arm-msm+bounces-35442-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AEFBC9AB27C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 17:48:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D00231C224E4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 15:48:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B56D61A3BC3;
	Tue, 22 Oct 2024 15:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eEkyIs+7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76FC41A01BE
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Oct 2024 15:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729612075; cv=none; b=FOvfuM7yQL4+XpMVzEpqlidmaliXXeodgEN/Qlu3uRTzBbSIOL81dxf/EdUc3kIE8Bzy/njP+FeIdNVCQhkOMVKkfXhyWQt2h/ekOu2F2FkFMEfSDld5A7cU8re1AclgjqyCOvl5BO2WPsPSfR177DfdE4YlY63i/cB3ChCNY78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729612075; c=relaxed/simple;
	bh=a13NbY+v/P+pxSVkHgPc9/8v/gp5YPf7t3CPFDjrcsw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=m2AWxhM//pZSm5b4wBkp0kQXSjq2dwgI0HZITUnIGl5o6QRVeV+kErNuCsI/BecMKK6Emb6aF4DqVnZEMGK3fmVt/4JgM4jqs4+VqZXak4nhNih891WJU9jxzL4w9wTRIiO1i6vyQufn01QZuva3ZtXzQIExy2Smft9dlqrtU3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eEkyIs+7; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-37ece998fe6so348005f8f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Oct 2024 08:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729612072; x=1730216872; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/i37KGSJH2cyKOYgiQHzdl8hUHnbxZvYWeriSe8Ki34=;
        b=eEkyIs+7UxYT0CHGFFtZMwD+LzAX8goYAnU12OR8AXNwefjWWTZcoeCK6WNYjRwEnS
         WD8dugeEOxMQpBzNRxwknKhtR2uD+NXczwj4JmuNOMdd5LH42il6f0YKvg8iUANMg54J
         YBXF2V4yZi9rMPoQ9UgTJQogUIbQbTt7ScKa/vjN8fQardRELwo1RWxOe8zxWgbUqkSe
         tvu2OY5T0dvt5NW0JaTWb5NJhFRMb7NTYUrvQ2fG9SPyXsYy+RUxOhyuJriYeq9v+CeF
         zIWx3X9+fyvoGfAm416V8R9VEwSY6+K4spWWB8+b39MVdJhvVxz86FTErOKXEekOfRVP
         6z5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729612072; x=1730216872;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/i37KGSJH2cyKOYgiQHzdl8hUHnbxZvYWeriSe8Ki34=;
        b=QOwyMtgy1AWt6oYvc+8hmUyqnpwpInaGZ25t00nZTaHrlDB8F6MbfPkYEnfu0WFecc
         NoDPqqKV9qAMcx/YcdQJ6opNGISfQtXlDOkMOff0nP8PU4a7URgDNHseMQesN5WGMTc2
         uoEJ11LEYxiOJVP8LnRhfb4vtosKmSCLilSFBhzsh98t9Mvx4W46kdHY5GVhknCQm7CT
         BB1T8ZFs8IjGd57VPZK2jbWkel0SSQchYhVHVCY+bZb22ONuAMZmoiAcqbKniOxUH0RA
         VRhbGZCaCBrhNv8IsrLW7S8jtPljjDhqrJWQI3ID+ulkxPkK8ro4lnPp8h8dHCM7WKKi
         fOKA==
X-Gm-Message-State: AOJu0YzzbIThqpTJh4BVS41ofX1rz22R/kvOElLj9YjDhl5PsloWW4lG
	FCdTrFEDb3U94HV3v9TpyLvrgSu8q3oj8extxVau+wYFqFEZVWutCSVhpMQy738=
X-Google-Smtp-Source: AGHT+IE0zZyVhD+43lbZMoBwIDAOYUcJm1NwSt3gC8ejPy6KPL7TRG4c6ozV091ZE8gZwscF1v9rNw==
X-Received: by 2002:a5d:6484:0:b0:37d:4988:a37e with SMTP id ffacd0b85a97d-37eab73d2fcmr4919973f8f.13.1729612071462;
        Tue, 22 Oct 2024 08:47:51 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cb66c725fesm3439959a12.87.2024.10.22.08.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 08:47:50 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 00/18] arm64: dts: qcom: change labels to lower-case
Date: Tue, 22 Oct 2024 17:47:25 +0200
Message-Id: <20241022-dts-qcom-label-v3-0-0505bc7d2c56@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA3JF2cC/3WMQQ6CMBBFr2K6dgwd1BZX3sO4aOkAkyDVljQaw
 t0trDTG5fv5700iUmCK4rSZRKDEkf2QodxuRN2ZoSVgl1lggftCowY3RnjU/ga9sdSDlpWuGqu
 01bXI0j1Qw881eLlm7jiOPrzWfpLL+jeVJBRgUVmFsswfde55MMHvfGjF0kr46Vc/Pmb/4MgYZ
 0o6Wvzy53l+Awgc9VftAAAA
X-Change-ID: 20240828-dts-qcom-label-81989fb78b8c
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Steev Klimaszewski <steev@kali.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6659;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=a13NbY+v/P+pxSVkHgPc9/8v/gp5YPf7t3CPFDjrcsw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnF8kRiVZeKyjU4SElDWF4xg8ukQRdxFvzWfEOs
 dXWOXINSdaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZxfJEQAKCRDBN2bmhouD
 14pjD/9JcZItFv03lkI9CCo45MsFrJKqnfGKz8q/+H/oNvpsTNiqHN4GeDa2wh4Q8S+KDeLRo9j
 FMXSpZch9aLnSYqX9F1rSbXBlLJz68TBPT0OEJLzdbN7l2sF51CZ/aDU11XJzvtNCpseajLWaLF
 oVelcndo5Q/ispvCxchtoWUXSSJWiBdZ8FvmDeoXijHRp5OhynjrAvwlRSCVTip729PZjbPczo/
 Pkrw4UlLPvOiTdubHr29eTCCn4gvINDmmuvTJ9DiztfHU/d6gbdA9sIBG5jPpkc/Y82b2NvaDIR
 /EWyhlw24155M4gyIxHhUxQEO+K4zrBbtRbiowyE3P5HHW/Z2p7DazmRvgaukqpAs+aaYI4pOQx
 aaIkIZUyabTcjRnS8J1TdIP1Pv+Z/Bxa+HDG+u7T+qkOzs8B17z0TXPeVA4Gf5y4CFa2Eh20YlE
 8yx/N6MKiwBItIvTLIMN8y0BlxXlqkjrFj2tAdVGeS9xmhsy16Ap3zQiRhJ1S9t8Mvh6tschDYd
 86EyGn9tBRrZG3Uis3RcBUJDlJftUe64XVVAWF+oDIG630cfqZPYFa/U1ly4IaWBnvrC30ycMTt
 RA7SRK6320E3IFIZJJsiGYYgtaMOwMKGI5Ouu8Gypp/MpxLISEVy70Z+hYu5THrcWwjp2c2v3uE
 i0vCMB6I2ALhoWQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Changes in v3:
- New patch #18
- Update also sc8280xp-microsoft-arcata.dts
- Tags
- Link to v2: https://lore.kernel.org/r/20240829-dts-qcom-label-v2-0-5deaada3e6b2@linaro.org

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
Krzysztof Kozlowski (18):
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
      ARM: dts: qcom: change labels to lower-case

 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi           |  36 +-
 arch/arm/boot/dts/qcom/qcom-apq8084.dtsi           |  20 +-
 arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi           |  10 +-
 arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi           |   6 +-
 arch/arm/boot/dts/qcom/qcom-mdm9615.dtsi           |   4 +-
 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi           |  34 +-
 arch/arm/boot/dts/qcom/qcom-msm8660.dtsi           |   6 +-
 arch/arm/boot/dts/qcom/qcom-msm8916-smp.dtsi       |   2 +-
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi           |   6 +-
 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi           |  36 +-
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
 .../boot/dts/qcom/sc8280xp-microsoft-arcata.dts    |  16 +-
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
 67 files changed, 2853 insertions(+), 2853 deletions(-)
---
base-commit: a1fc2f9ffe8386e254538ad0742194744b7d4a48
change-id: 20240828-dts-qcom-label-81989fb78b8c

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


