Return-Path: <linux-arm-msm+bounces-18785-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8E78B58D6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Apr 2024 14:44:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BEF3D2845E6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Apr 2024 12:44:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8F2E56768;
	Mon, 29 Apr 2024 12:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SAlHzqr6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5198C2D0
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Apr 2024 12:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714394629; cv=none; b=E4FDldFYAZqEBvfbnQoLyq6IMvHg0qdZaaSmtWG84bo5NiS3Jmaz3QJBmaOgem7/lOGnBFFTpX9OT0V6cIRy7wi4xVKtZYlpOI/SMOebBlaFK8KFvSetQGpqOc77E+dqnUbCKaa3plUKvLjzf+WNrI8JPQnR5fcbuZfM7T6npzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714394629; c=relaxed/simple;
	bh=AYTeRuvHJlMLRQito12OMFplU5LKMWC583mTfDv8bzM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tlbDPdZsWDPYEwMP3wgrW1oI886vATOs7KhjJu/AsR8pgd9amvxXpHaQUVLsy1BpIDUSrGWFSayZSM5jwJ0W4hSAoOaOHO0dxf5jHtfTmkTE3ssHkja9NQ3OB7tIojxY8dka/3z4Fd3k/hNSEJdiWy9CXMaH0pKBl7jXKGHGd7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SAlHzqr6; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2db6f5977e1so51219371fa.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Apr 2024 05:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714394624; x=1714999424; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X98w+dsAmZ1edpw2dvQtNUW63fW6JMB3gSJvixOmib4=;
        b=SAlHzqr6L4vSWF3/QE90KrwOj+zRjK2s+TpNX90g7F/jbMXiONxPSGhbumI4GmLC02
         7abzjzMgAWL0Sijok89/y9xDiaxH2X1Olj6CCJYt+aqzZFZPcgE7uzeSQUbzOeosOBM5
         lheoc0Dy0SFSscY5Oowh6MIm+H0DM66w24fX42uWySc8pfX23LsAraYPLsjjGf4BKiXE
         OMktFLsFjzx/EqEQ7/Tc5AU+uWzD4Dn+J7TKUfV6EwBox5Pi9/+jdki6eufOHsXSPSGu
         HMv5S09CBippNiLxRy55BrradgGJoaJWNoQp6WBaUyAvIBxtcUrmS+cmzzCOHeTSO6HL
         OlQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714394624; x=1714999424;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X98w+dsAmZ1edpw2dvQtNUW63fW6JMB3gSJvixOmib4=;
        b=M2alkixg20N9iyTtSc+nX8h+wmGHyXp3WAaWlQv9t/TOL4J91/IiN4IdEWjdcUD16x
         8eLFkzgUx5d8QDmHE6VLXA8WUOZMwINHJMD8hwQT87ujynFcLo6mSvpyxvv1nhY25QfM
         JPaXY6QmB22uCJ50LPNG+bJf5J+6HaGj3irPE2+5UJhVcrxwcflc1/WG/yJ2TMr/u8bn
         NvOrM/05SSdku5HMIhfE7PnQ2cl5WbANhydMWjWjYJXjcZKQvactJZQClufhuZrltss1
         jc602EUcm3o7W9tarMB/Iy8QaPxNt2Qms0r6YbVdmFqclZl9VYfNMkkBRD56yrZ5t8zu
         nc+Q==
X-Gm-Message-State: AOJu0Yw9wspSPzOupiDVgfnRFE27t/K4MCJuARsIttyEbDT6t7Nc/gTn
	8ir5ILOTZSl6w76ySa34zpRdxSf91X5brIkzI7Y3lhYOxvRcwJoVDyOSoIY+FCk=
X-Google-Smtp-Source: AGHT+IE4+SQp+d+oRxY6HdxQTk+/7Isuty9mmBbPQ6H+zh5OOVPEIx8L377wSdccFUahcgdmc+ghRA==
X-Received: by 2002:a05:6512:3b2a:b0:51d:d630:365a with SMTP id f42-20020a0565123b2a00b0051dd630365amr1769777lfv.54.1714394623891;
        Mon, 29 Apr 2024 05:43:43 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id h18-20020a0565123c9200b0051d94297380sm467538lfv.241.2024.04.29.05.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 05:43:43 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 00/12] arm64: dts: qcom: move common USB-related properties
 to SoC dtsi
Date: Mon, 29 Apr 2024 15:43:37 +0300
Message-Id: <20240429-usb-link-dtsi-v1-0-87c341b55cdf@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPmVL2YC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDEyNT3dLiJN2czLxs3ZSS4kxdY+M0U0NDIwtzQ0sjJaCegqLUtMwKsHn
 RsbW1ADS2NCJfAAAA
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3248;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=AYTeRuvHJlMLRQito12OMFplU5LKMWC583mTfDv8bzM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmL5X9kY3GaRty1HkyJcheHSz2A5QWi6g43gu3r
 9qPnOdyTBiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZi+V/QAKCRCLPIo+Aiko
 1UiwB/91GPxr8RtEjFFInoKLXkk7uYm1BtoyLMYWWsNA6JRDpQaCCgPm8eBo6XOxb+oWWXQHeEv
 aO3ao8nVf/d8tTlwadUT5Y8ItSNIwfTureRqwgS+qEwAXmc5Iezfw5RqyZWguH3OOUujmGQUotM
 Pie98vrbX3i6IzkInefl/68mTFxJQLPKbrAKb5ZBGNotATI3ljn+bM3Yt8ok/slKd1GdDW3ItTW
 PExRpApPLTwXXMuT7MJbh+fIEOAjA7oTCAqL4BR+hMQUpOQxfS142PdX5EztOQrTLLf6mRv/vTT
 dGsJ6ynLZLbVXSZUiXZJOSgqib+4nqn2cDXHzym6Co8+2huL
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Move common USB-related properties and nodes (e.g. PHY's
orientation-switch, generic endpoint connections) to the SoC file. If
the board has different needs, it has to override these generic
usecases.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Dmitry Baryshkov (12):
      arm64: dts: qcom: sm8150: move USB graph to the SoC dtsi
      arm64: dts: qcom: sm8350: move USB graph to the SoC dtsi
      arm64: dts: qcom: sm8450: move USB graph to the SoC dtsi
      arm64: dts: qcom: sm8550: move USB graph to the SoC dtsi
      arm64: dts: qcom: sm8650: move USB graph to the SoC dtsi
      arm64: dts: qcom: sm8350: move PHY's orientation-switch to SoC dtsi
      arm64: dts: qcom: sm8450: move PHY's orientation-switch to SoC dtsi
      arm64: dts: qcom: sm8550: move PHY's orientation-switch to SoC dtsi
      arm64: dts: qcom: sm8650: move PHY's orientation-switch to SoC dtsi
      arm64: dts: qcom: sm8650-mtp: connect USB-C SS port to QMP PHY
      arm64: dts: qcom: delete wrong usb-role-switch properties
      arm64: dts: qcom: x1e80100: drop wrong usb-role-switch properties

 .../boot/dts/qcom/msm8953-motorola-potter.dts      |  1 +
 arch/arm64/boot/dts/qcom/msm8953-xiaomi-daisy.dts  |  1 +
 arch/arm64/boot/dts/qcom/msm8953-xiaomi-mido.dts   |  1 +
 arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts |  1 +
 arch/arm64/boot/dts/qcom/msm8953-xiaomi-vince.dts  |  1 +
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts           |  1 +
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts           |  1 -
 arch/arm64/boot/dts/qcom/sdm450-motorola-ali.dts   |  1 +
 arch/arm64/boot/dts/qcom/sdm632-motorola-ocean.dts |  1 +
 .../arm64/boot/dts/qcom/sm4250-oneplus-billie2.dts |  1 +
 arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts    |  1 +
 arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dts  |  1 +
 arch/arm64/boot/dts/qcom/sm8150-hdk.dts            | 13 -----------
 arch/arm64/boot/dts/qcom/sm8150.dtsi               |  4 ++++
 arch/arm64/boot/dts/qcom/sm8250.dtsi               |  2 ++
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts            | 27 +++-------------------
 arch/arm64/boot/dts/qcom/sm8350.dtsi               | 13 +++++++++++
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts            | 27 +++-------------------
 arch/arm64/boot/dts/qcom/sm8450.dtsi               | 13 +++++++++++
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts            | 15 ------------
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts            | 15 ------------
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts            | 15 ------------
 .../dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts    |  9 --------
 arch/arm64/boot/dts/qcom/sm8550.dtsi               |  6 +++++
 arch/arm64/boot/dts/qcom/sm8650-mtp.dts            | 10 ++++----
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts            | 15 ------------
 arch/arm64/boot/dts/qcom/sm8650.dtsi               |  6 +++++
 arch/arm64/boot/dts/qcom/x1e80100-crd.dts          |  3 ---
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts          |  3 ---
 29 files changed, 66 insertions(+), 142 deletions(-)
---
base-commit: dee9d87bf6c3cb70771fbc057d507bc6bd24a604
change-id: 20240425-usb-link-dtsi-33f511287192

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


