Return-Path: <linux-arm-msm+bounces-32851-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0746D98B712
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2024 10:36:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 836F8B222C2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2024 08:36:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38C6719C579;
	Tue,  1 Oct 2024 08:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="lTnCdc6c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43555199FD2
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Oct 2024 08:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727771756; cv=none; b=DJrFBzPQa914TmzJ/QpwPHdfQdkzT4ZNnTsEjaY2zQ9Tu/RlU6r7qThCreX/2B5cs0WjzxwrCxmD0Y6P++zaD+3h6BZUcUJ1DUoOqATKfYuSqzRnG4SIYGS18sfit7X84U8O9Uja21nEhzzIONQ0J5Xs6d7gCL5yD7lP1K+2u3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727771756; c=relaxed/simple;
	bh=8zGh0kEmV1zxwa3UDG+uvR3v7BKGI+RhSkGnZ8K3K8A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VIQmwYWk4D7sc8YdAnsgHq77SW83qqT9mhRaBpmKBmZRKavVKcVSS9TKAfmWmh+tLgxfTmfqxJDEA4YX+aQOiVeVOMid4pDpYNIJovAPs21QHB2q0vrvLQVG/jLAIby5NDmqtHeZHTj8iwy12tlNkt3eefINsLt9DCYi2wAZxiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=lTnCdc6c; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-537a399e06dso6021322e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Oct 2024 01:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1727771751; x=1728376551; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jUp1+1xtRJBJdIV6DSCD7fKdIiiuv6C/815+UMMRw1I=;
        b=lTnCdc6cEO5Mxq2tZHa1lzMlOW9WYXis83DclrClyBQtthr2eWUFcmz3fbIER5ba2Z
         lr5jRZfBCn/RBX2Bl2YE52VYVCyCyrf7Zl0ovS6Xn8fhwf3OKtHh5Kx5aBv17AEfpEE9
         4OzVWCab+Zth+9idzJvLs07ZJvwNKflhK2TFxSCLTPTSCLT4i0nztciTg+JvR7d0U+qu
         a53TKxyYo7dU9rB48s/s012F/7hBmAkzsGUMxnrVtvsOnLfnso3ytePKS2D6L/10ZKn+
         rGQQ2B3Ttt3fYuyIHigyXJMFfRDDiv2Cne16XODBKuLpOeCHInB7e3BEYTQirpTEQSjs
         GAkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727771751; x=1728376551;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jUp1+1xtRJBJdIV6DSCD7fKdIiiuv6C/815+UMMRw1I=;
        b=CVcIUNl7uPUFVaP8Dwm85RIqmc0eq+L5DerPqCMVXTn6/4maTn1mB8PLIrNokvZ3iJ
         S+lT7GWcRN1InXzOzV50D3pZXiRwmGExib55WAUrjwq0iuunPiFEaQprnv7636HzIO3k
         +PWTJHKEViXisn7snEZHFmLjP3yfiO0uDq1vBzJSVEzhTrWVdvNlPtRoP6DR9er1JmNS
         TrRM0SAjNdy2yWE1wsnAqo2Zfy+gq2LTS6Py6Szb0bzXvvg733/6KF56hBXa61fZhzTg
         zJtrUcogMOdLu09aD7Gp6hjTbtt7oQXVrD9GCDI/sUh8uW0vqH4R0WtSSNNRjeb5Lxg0
         qw/g==
X-Gm-Message-State: AOJu0Yy1zTufg7LtofIFZVRP9kEQM1SYkCaYXYRPsy+3S28IJe/tVBGl
	9kgFGoGbpSDIh9igMB2EIfStaA3Ze/JgNCkSbkSTkz9wMnK/+3ZkWy5jaOA3KsuaRXysLsXvBRg
	1
X-Google-Smtp-Source: AGHT+IFTkGvNYK2a0K4iJqJ6WKb6onvmxPAJCp9ewXHevNyJRgZ67BYCm/URXwMiEX9+e1lBpv+vUw==
X-Received: by 2002:a05:6512:4006:b0:535:63a9:9d8c with SMTP id 2adb3069b0e04-5389fc3987fmr7056545e87.17.1727771751061;
        Tue, 01 Oct 2024 01:35:51 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:b926:7e5e:6e5b:896])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd565e881sm11231406f8f.44.2024.10.01.01.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 01:35:50 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v7 0/2] arm64: dts: qcom: extend the register range for ICE
 on sm8[56]50
Date: Tue, 01 Oct 2024 10:35:29 +0200
Message-Id: <20241001-wrapped-keys-dts-v7-0-a668519b7ffe@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFG0+2YC/32NQQ6CMBBFr0Jm7ZgC2ior72FY1HYKEw0lU4ISw
 t2tHMDle8l/f4VEwpSgKVYQmjlxHDKYQwGut0NHyD4zVKo6qavS+BY7juTxSUtCPyV8mLr21p1
 Lr0rIs1Eo8GdP3tvMPacpyrI/zPpn/8RmjQrroKqLcaHUhm4vHqzEY5QO2m3bvqCtI/ixAAAA
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Om Prakash Singh <quic_omprsing@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Gaurav Kashyap <quic_gaurkash@quicinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1156;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=8zGh0kEmV1zxwa3UDG+uvR3v7BKGI+RhSkGnZ8K3K8A=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBm+7RikEGYnNtFyI1lxfef6VHr+GD0L+E1TpWJu
 rUj7NeL6c6JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZvu0YgAKCRARpy6gFHHX
 crWcD/9d5peSt8Pm5aQ1pPbxdcCylLYOfEBbW2f2WEVAGcs5sSV8aV70uTqYEpLP801Vc1QSgGi
 1/4dxjLlPtnq9njzA4vf/Bp0/pHujrpZv5FuKacwxxx6LQCfiuTlPJvy4l2FMCoCDZ7ThNVa5C5
 klwrl3gosy9kX8eLxoFMEiifK2fHPJUSr5E12tG3cT+UClo2T5SB/pFmurhlc2mpSE8D+5xCr3G
 tC1ARRtWzoSyN39IYH0ZlBI69dyEY2vSszGTmDFBpIvX0PNdD3Cirj5CBPzYUfMMeyAWQ8rd0//
 yzW2exISaMcieu+4qSW6I8Y04j28VqRVr/N3diBMHe3TEmhXg5FfJfNrmIPykaSHNh9lWtdXHNz
 9uZnkd04Yo6x6IXmTJYGMIhI8N7PXnv7aYvcXFfLBH11T697hbpY3402TcNr17htOysR2AbsQHp
 u/EoVqxAsaYaDXGmtkuYHgxji+9WT62OAmysuRm2G/7pAxH7xHd+7wLUFSji28Knzfs3w5Tb/Ip
 mRE4vf3KUJ8q2ph1cZn+oLS3IrmirAgD7/npjIJz8+GZUBrhQaZSUpeJgL4Vhe7WRI9SgL5vrML
 J5Iwjrmma+ZtJBHHPxXYdx6GxN0rQOXD9Biq8SrJ1ymMeB1P1yfooVOiXCGxXAekunXs31anZFD
 BKYH5dkYR4vZ7YA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

The following changes extend the register range for ICE IPs on sm8550
and sm8650 in order to cover the registers used for wrapped key support
on these platforms.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Changes in v7:
- bring the ICE register range up to its full size of 0x18000
- Link to v6: https://lore.kernel.org/r/20240906-wrapped-keys-dts-v6-0-3f0287cf167e@linaro.org

Changes in v6:
- split out the DT changes into a separate series
- remove the new DT property from the series
- rework commit messages
Link to v5: https://lore.kernel.org/lkml/20240617005825.1443206-1-quic_gaurkash@quicinc.com/

---
Bartosz Golaszewski (2):
      arm64: dts: qcom: sm8650: extend the register range for UFS ICE
      arm64: dts: qcom: sm8550: extend the register range for UFS ICE

 arch/arm64/boot/dts/qcom/sm8550.dtsi | 3 ++-
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)
---
base-commit: 77df9e4bb2224d8ffbddec04c333a9d7965dad6c
change-id: 20240906-wrapped-keys-dts-b733dac51d01

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


