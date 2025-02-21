Return-Path: <linux-arm-msm+bounces-48960-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA67A3FB89
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 17:38:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F12057A1DBD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 16:32:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A5BF1F3FD9;
	Fri, 21 Feb 2025 16:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="frlin4gN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4482F1F1506
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 16:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740155598; cv=none; b=BMxbY8aYWMoi0DpVtWhi+brdxK/awTC6A5G5Ly4+EIaQRt1T0K8expnVBgy8Nb62sCHUkKFHLKytfdPxhjEfz1goNPZHfneapUCj454p62uBbfvAEJHPdrVwhJ/AScfZcukpJDwZY7Yq7NdA4V9kuiagZ7DHEctjyGAdTjvTl6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740155598; c=relaxed/simple;
	bh=/Lbwx3pXIBOzZ9K1ARAeyYlgTeCQRSC2zkOImuhUOnQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FpzCqYKFqGCkZa5LBW+f4tg3hFPoswI38FQB7EEqjURAzrjx0sIrJGCq/T62gtuIMZZTEgN06+ScprNQ7iK4PNwgJMepHzb1txf7hTvweoS8aK4jfFr9S1BGA0HbPNcLx5ulBmXWpyj5uTqOAZ839LBhoO+Gunk1BRBnn7MO3/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=frlin4gN; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ab7d8953b48so34570766b.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 08:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740155593; x=1740760393; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Txn+toELfUJErOZaS1LgqKzYevUXNkzkLhfJ3LGkqHE=;
        b=frlin4gNZqmAg3voEUoR0+Duejv1aUwu7zUEhchegUXjiV3OybZEMv+6V9XUQsDtuG
         YfgO+jznvO09Udl//iF5uZSapZ8IIX8+M1Qy2JeXQlCF2ToRvbpWQfEfUFzUwwIIYfoe
         7ZTY4XPhObNzW4haMZgXLqO/kLcHSSe1RVILbXlPmpAvkQdrhCVvXwDwxOtHEw7S9lfm
         q44zh0TZ6R5zhTgKsCxvYfx4Iwg5+t8a6zjojf48wlkdS/3cC6EDTAe2vAsXNkZMI1Y8
         TyAgEFIOYMCxhX9mQKYeKJjVWY3bb/G/iLp1VLzeEfKjiskZlw3BKWZASnKF9SpCiWrM
         /sxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740155593; x=1740760393;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Txn+toELfUJErOZaS1LgqKzYevUXNkzkLhfJ3LGkqHE=;
        b=Pje7Dty2iSU11aUXqGA2ZYhosp06prEDHqHVlS663AfIx/t38HpH2w8LZ9xiJCuWaj
         uWXzMx+KgRap6/p+xi9baXT7M51m8TEytAdvPPvf08l5RikgjLwkxzZ3xoZixCHUk548
         3fyGcqit9MZ4kbnjFDAeKKBlzZUUCLewPwH71NVMJTgyIGAKPqe1RKjxaqYuEkDPnOZA
         vvgfrvtnG6LgvsOfkQDWHBqEAhxcXzn6V89BBhOIWN3hqVh1HbBDY06NElsloI7JK7FA
         FOzVSLtf1xBeNhA3mPcl7D2s45b262TD1BuVdaNOqivnGqkAx+6zCPa/t+QdtaB+3bIS
         Zf3w==
X-Gm-Message-State: AOJu0Yx78chJ8f/0A9sUxEo4bbhQ3gSk2Bfmnon9c5jMzrVfIcqtFjYt
	0IlxLcjFKvVz+/GhNrx5pPduXE8QS31ziUudg9n1C/4zreLFJu8ogQOBklef7UE=
X-Gm-Gg: ASbGncsNIjaam5nz8r47RgEUPogBJEQsqzKjLEGpRHqRwIJRPfk2P2tMslain/9650K
	2GhmGeg7nChmaH4INC7hz0EK7b57iN9RT/fAKpH+aAMS/pHsp+WzmGVsCymZYlWienwO8vqUt/P
	lq7GZBC+Tcn93KzcEKC476FSkm+JxRsV8vcGaspZjkiD01vqHA9Tdj3ul3Gh+PZRYQ+LGs10IpB
	QfyZrEMM5Ol1rUEpWMepCHdfVUigNQ9lQT+FQnhCQ1DlgL7T9kxo4O6Jqdp39tlvCqCK9hkkmC8
	C5QjnXR4pwp2qi93z/mCHjnmlKK4C94tM4xWQ4QP/y5k0MTeFpDMwj/wcIGXFAdGSL7AGhcdfyK
	U
X-Google-Smtp-Source: AGHT+IFNz5goLLYbyGUJ5rltKM7CJtsNlMcGOCp46v/Nmfn7aZJhJs2UTEUhPPZlg3lIJdRdr/+2bw==
X-Received: by 2002:a17:907:74a:b0:aa5:a60:ad6a with SMTP id a640c23a62f3a-abc09e32bebmr125519266b.8.1740155593495;
        Fri, 21 Feb 2025 08:33:13 -0800 (PST)
Received: from [127.0.1.1] (78-11-220-99.static.ip.netia.com.pl. [78.11.220.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abba4fc0c29sm906814066b.157.2025.02.21.08.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 08:33:12 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH RFC v3 0/3] arm64: dts: qcom: sm8750: Add modem
Date: Fri, 21 Feb 2025 17:33:04 +0100
Message-Id: <20250221-b4-sm8750-modem-v3-0-462dae7303c7@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMCquGcC/03MQQ7CIBQE0KuQv5YEPrTFbpt4ALemC4RfZUFbQ
 RuTpneXqDEuZybzVsiUAmVo2QqJlpDDNJagdgzc1Y4X4sGXDCiwEoiSnzXP0TSV4HHyFLlDaaX
 xe2wGhPKaEw3h+RZPcDx00H/KRLdH0e/f5Ye3rNBaSsQ/2vk8c2Vs7bDWyirfLgr6bXsBAFDfP
 K8AAAA=
X-Change-ID: 20250221-b4-sm8750-modem-c21a18d927f2
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1630;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=/Lbwx3pXIBOzZ9K1ARAeyYlgTeCQRSC2zkOImuhUOnQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnuKrEnN0DZnuDMIFSW/hKrX/ItMzIVp6Lk1SWN
 sTW2lWJT9CJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ7iqxAAKCRDBN2bmhouD
 17qED/9ekqZTXWoOT0WCzV4BFTnHKaCjdlBV17j1OSLv/tCiWw8v+kpDrCogZGOd27B1ngL2AgK
 izaBL0OIEbzxFRdWkAXrph0nSoStty6/HPHBbFRvscnNt/fclFlh2P8700wW44Zcx/fOZQQ+HLe
 8oNdSQgWlOlK4Y7AnWW1b8tmMTgZFIGbWzsW9O7OAsl8PGLQkBfO/MMjD+f1AdP4t8awTu/Ep7A
 qd0nYRZI+gubYdQeyBRe1/17W3HibM2zsii8donaFKvWeXrHWocB6LXT04FZClEIaFDFAgJSWBy
 FcGlwv26+sGvZTnNpgaVfbQ32EX6ukrRo8U7A4HPat8tBn9rvaNjhhh8C5zCuEO+XN+j7a4PTbj
 g4t3YHOMOjypmyswLbLKSfdsRZATGFiBDhTHBnp6GFG9G37IX3EjAQYfhGkqmo7XdDtH+ns389n
 pCCgzMQtrcl0xgJcAsmKLwn/DMd2pIRxeEPxKK82OziEDeDTz3ytlmZ2fCqrk1qdn98ILSNCSm6
 BOXK117NAnfRPPdVLhrG5jUILnfyaTjjhwPn8QZzaAdYPmpJq5S4WgSHARR1+UBDnfx5VvZRjvt
 juLbCUr4jKMQvk03cxZLcAp6eVb90EwKKhltcxFvZlcWxBgVH6AUFom6a23Rx7fZsEb2Mr7Icke
 SdYoNbKYniWYylA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

RFC because modem on MTP8750 crashes after booting for unknown reasons.

Changes in v3:
- Split modem to separate patchset and series
- Link to v2: https://lore.kernel.org/r/20250220-b4-sm8750-cdsp-v2-0-a70dd2d04419@linaro.org

Changes in v2 (from previous patchset - combined CDSP and modem):
- Fix CDSP and MPSS PAS address space range.
- Re-order nodes for correct placement.
- Rb tags.
- Link to v1: https://lore.kernel.org/r/20241122-b4-sm8750-cdsp-v1-0-9a69a889d1b7@linaro.org

Context of this depends on:
https://lore.kernel.org/linux-devicetree/20250221-b4-sm8750-cdsp-v3-0-fe2891beeef7@linaro.org/

Bindings for remoteproc:
https://lore.kernel.org/linux-devicetree/20250221160300.160404-1-krzysztof.kozlowski@linaro.org/T/#t

Best regards,
Krzysztof

---
Krzysztof Kozlowski (3):
      arm64: dts: qcom: sm8750: Add Modem / MPSS
      arm64: dts: qcom: sm8750-mtp: Enable modem
      arm64: dts: qcom: sm8750-qrd: Enable modem

 arch/arm64/boot/dts/qcom/sm8750-mtp.dts |  8 +++
 arch/arm64/boot/dts/qcom/sm8750-qrd.dts |  7 +++
 arch/arm64/boot/dts/qcom/sm8750.dtsi    | 92 +++++++++++++++++++++++++++++++++
 3 files changed, 107 insertions(+)
---
base-commit: 149ab95f2124c154a7dce75696a42fd4f4322f1d
change-id: 20250221-b4-sm8750-modem-c21a18d927f2
prerequisite-change-id: 20241122-b4-sm8750-cdsp-38a6c2643a3d:v3
prerequisite-patch-id: adf6f31202c8e8018cac2ed89bcd4785238eccb5
prerequisite-patch-id: 0db026e778de21511d106b767563962611f8bef4
prerequisite-patch-id: 15e5b1ae1b582c1e813615113de69631824dddb3

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


