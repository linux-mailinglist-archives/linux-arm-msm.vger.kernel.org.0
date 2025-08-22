Return-Path: <linux-arm-msm+bounces-70412-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B60B31706
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 14:08:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9369B1D20A38
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 12:07:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1B4E2FFDD7;
	Fri, 22 Aug 2025 12:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s2THA9m4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04DDC2FC002
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 12:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755864286; cv=none; b=nd880DZBhUbUObosfAax7w7Xy+ntG28F+iJBmEA9yUa+ur3l+mSjgk/Dn79tuY/jmO65YFqR1ffkt9Q4XDz0KIqEqsjrYhdpSWkwLy+asICEn4pWQRQ/i6v8uNQ9cjoWjYaTv2vkPeffI/YHp57W5Kb9EBacWSeZTX/T5bRLK1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755864286; c=relaxed/simple;
	bh=YfwUCTa2vLs6jZ72tCoTV8kUwTghYPV1ExqufjKClkw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KFr50AMzHwR2sn4x21uyVRAkdnk7ueyeq0YRj/js7Ll4yO25se+LFEZ+dpYxVjqXwUq2ccjqkz4+KROToiHmr5R37443Sf8U4t54MtfkaOfDymmXpVOllzq8K0zaI85fvwLmzO2lUFkdVeELymNiPqScXqrXH2t0JN8K+SOXDck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s2THA9m4; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6188b657548so204918a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 05:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755864280; x=1756469080; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4R/MUVVeMY0qW91OUFPswxj6DXQqkZLdEmSggQdRI/0=;
        b=s2THA9m4rZH8nc1TyQCAElOmHV5cgYZWRPSM7WurDhegbJDrwuuqEhhfvofNDTR7um
         6m3RhYs3AGYsmFpFkhw/ZF5v69YMlgqnba24rl/kKc0hPg+DhE1XdrzQYZaGw1kaWVhE
         Dwd9YCT0j2mytvxStQWM28U69aO9ZJ6h6AiXM2tHmJAcKBmdo3wMzMfWDSQjWDBy9GoN
         K1E2EmPbhPtqKJNijdCcdghsqtE81VOIisUEVYbv4yHacfycPtrNVgFW6zaxA9aGw084
         Y+dMUhJtORS5n8Xi/CPkvgi+T9gWNtbf/p6GLK8MaZuKSCL3SbY4aGzNYgJEOhWpBBjD
         2Z9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755864280; x=1756469080;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4R/MUVVeMY0qW91OUFPswxj6DXQqkZLdEmSggQdRI/0=;
        b=SfTxpYsZrHRP/MTndVsk+g/qBLg1ZQKWj+doSRKWe2vrn7Rj1RkF8+u9aQQ3wZP9Xu
         F7AS1Tigz5vTB+/Yme+v7TgM67ySc5rJVDKn8XChaARrOon0nXRWj3vObCthXQ8GUCOx
         EwQaqKr8vmEChXFlxRmCo/x3W49npb1BQ0l3wXj/64D6JddA9UYxOnpcnY1rpe1Hu8Df
         L2DGVvRHfHSXTAXWTDiZnt6nZ3GozqG/zjwICqryXLfhe8deP02iSX8DqkSqRZ+jyRXh
         uzKfrxmdBQU/1DGFYC3ySPbr65FSaK2VcaNPJQ8DU6aUuhiRfUzpE3/8Vjxsip4TILqq
         EBzw==
X-Gm-Message-State: AOJu0YxKa9y23V2eL9agQ+y0O3KbjNbopWkfAztA080MXXoPTMxzPJ4T
	mTj2RUt8NVGMBUv+2vzbn/eucqMsuObf+fbf6MDB6925IPx2QZT3VrmtHiNrg5gjkkw=
X-Gm-Gg: ASbGncsCCNZl/e0KjNEwo0fgst9AA5a7hmNGXJSTvFOitJZVylxNcrH85DYfxrhjpNY
	pPEMS3SbopApTfVhUzyBn7hlWpyHc5wvySsEsDR8rqUM8RqVJmaT9fpdQoPCW0Mhx75glKJRP8a
	G4WL2MwiVzK6fvch/6EuIfKI8H7PzY5N6ZMoDJ53DRdMdHKhY+U7ZXD+8swH356zFourdnCpOsp
	9dAPYRPquuLnx3FDYFrkaghnKnbQUzAk5pv60sK2aX6vxBwH11NcjOc/GwubhBwS53PKtg8a1Zh
	LQJnHtjE7kzbGsYwiee0qnc7lkO1MovMYT3SbyGbv21T/D8VWHQiPfaSHmgfXoM+iitd/R/6oop
	oiQoPGN15cgX1K9pSVIrMPNiKml8oAJIwLfsVZCw=
X-Google-Smtp-Source: AGHT+IHtBnOUuGiSiACJDok39R1KWM7jIh51JGHqq2dcNEU558bCqkbcZGWYamqFBrnNkAruzkP8Nw==
X-Received: by 2002:a05:6402:1d4b:b0:61b:6c51:4005 with SMTP id 4fb4d7f45d1cf-61c1b6ec271mr1030396a12.6.1755864280017;
        Fri, 22 Aug 2025 05:04:40 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61a757b9b39sm6690444a12.48.2025.08.22.05.04.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 05:04:39 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 22 Aug 2025 14:04:10 +0200
Subject: [PATCH 10/15] arm64: dts: qcom: Use GIC_SPI for interrupt-map for
 readability
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-dts-interrupt-address-cells-v1-10-d54d44b74460@linaro.org>
References: <20250822-dts-interrupt-address-cells-v1-0-d54d44b74460@linaro.org>
In-Reply-To: <20250822-dts-interrupt-address-cells-v1-0-d54d44b74460@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=42528;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=YfwUCTa2vLs6jZ72tCoTV8kUwTghYPV1ExqufjKClkw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoqFzDtXdxTq98D5oITaO4TyLVMlBqCCOSRS5zM
 BkZGdq1qluJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKhcwwAKCRDBN2bmhouD
 12Q5EACGYqG5i1gL/eCs1gKmZkw/NKYzlwqmzahHJRCSoebY721KpZ2NBX4a63EGZsTCrn75Hx2
 EaWATJI9igwVFX/BHESFC4BgNMIj/8MyHvT9kWiu/okNFtq8YLXNppZGPkbLMmbt6T0LH+oIw1/
 fxN01Q+dLjc/JmNKYbZrZ4EQwzzGEixhILxiMw0+IWwBjeLbBoOEeJSouh74rZpus79bR0go90s
 YiwqJhDgywuTuTRV+OGLvmzIDOLq9PDV7h11mPCcDh99h+DZmaPFc9XTylrmmovkLW3P/kFk+S2
 0n/D8CB+E7ehuBQxNGVmdfTkY0L32sjZmmfACHlTAvWqLspxKEiTwEuR6MgbenItbIUuq2MJaZN
 76/h4WfK/w0/FBrf9hJdUhsUdZyhliZJQrvgKo7dKe213GUzL82MKGtj30eQr6VipHvjYqAXNmO
 0gxyg05365u5R3uqCe7c9gllOr4g0UIBMCBwU6BKLpfSHpaLMR/n6xL+oXwWUoUs9XUfIB/P3HF
 lMC8x4Lq+zStm7QKhZ4qMNjuOychyu534saekLdTPn5kIBnXSDD5eILFBP3l6/FXAY+4DHn8jO8
 wEbItxyKtqsKOPkzGLiZxlijwdOC3iEDCeXeQvyYfRi2Hp8uXRrfPRTiONDBvvLc29p/ntaPDvX
 Yu9X7pQFexA47+A==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Decoding interrupt-map is tricky, because it consists of five
components.  Use known GIC_SPI define in final interrupt specifier
component makes easier to read.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/ipq5018.dtsi  | 16 +++++++-------
 arch/arm64/boot/dts/qcom/ipq5332.dtsi  | 16 +++++++-------
 arch/arm64/boot/dts/qcom/ipq5424.dtsi  | 32 +++++++++++++--------------
 arch/arm64/boot/dts/qcom/ipq6018.dtsi  |  8 +++----
 arch/arm64/boot/dts/qcom/ipq8074.dtsi  | 16 +++++++-------
 arch/arm64/boot/dts/qcom/ipq9574.dtsi  | 32 +++++++++++++--------------
 arch/arm64/boot/dts/qcom/msm8996.dtsi  | 24 ++++++++++----------
 arch/arm64/boot/dts/qcom/sar2130p.dtsi | 16 +++++++-------
 arch/arm64/boot/dts/qcom/sc7280.dtsi   | 16 +++++++-------
 arch/arm64/boot/dts/qcom/sc8180x.dtsi  | 32 +++++++++++++--------------
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 40 +++++++++++++++++-----------------
 arch/arm64/boot/dts/qcom/sdm845.dtsi   | 16 +++++++-------
 arch/arm64/boot/dts/qcom/sm8150.dtsi   | 16 +++++++-------
 arch/arm64/boot/dts/qcom/sm8250.dtsi   | 24 ++++++++++----------
 arch/arm64/boot/dts/qcom/sm8350.dtsi   | 16 +++++++-------
 arch/arm64/boot/dts/qcom/sm8450.dtsi   | 16 +++++++-------
 arch/arm64/boot/dts/qcom/sm8550.dtsi   | 16 +++++++-------
 arch/arm64/boot/dts/qcom/sm8650.dtsi   | 16 +++++++-------
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 24 ++++++++++----------
 19 files changed, 196 insertions(+), 196 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
index 4ddb56d63f8f9a963cb49bc20e0a78b2d3490344..46c797a9b79ef79f026b4093f782bdf87e79688d 100644
--- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
@@ -745,10 +745,10 @@ pcie1: pcie@80000000 {
 
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0x7>;
-			interrupt-map = <0 0 0 1 &intc 0 0 142 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 2 &intc 0 0 143 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 3 &intc 0 0 144 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 4 &intc 0 0 145 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-map = <0 0 0 1 &intc 0 GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 2 &intc 0 GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &intc 0 GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &intc 0 GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>;
 
 			clocks = <&gcc GCC_SYS_NOC_PCIE1_AXI_CLK>,
 				 <&gcc GCC_PCIE1_AXI_M_CLK>,
@@ -846,10 +846,10 @@ pcie0: pcie@a0000000 {
 
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0x7>;
-			interrupt-map = <0 0 0 1 &intc 0 0 75 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 2 &intc 0 0 78 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 3 &intc 0 0 79 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 4 &intc 0 0 83 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-map = <0 0 0 1 &intc 0 GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 2 &intc 0 GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &intc 0 GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &intc 0 GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
 
 			clocks = <&gcc GCC_SYS_NOC_PCIE0_AXI_CLK>,
 				 <&gcc GCC_PCIE0_AXI_M_CLK>,
diff --git a/arch/arm64/boot/dts/qcom/ipq5332.dtsi b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
index bd28c490415ff61624f6ff0461d79e975f2c397f..45fc512a3bab221c0d99f819294abf63369987da 100644
--- a/arch/arm64/boot/dts/qcom/ipq5332.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
@@ -632,10 +632,10 @@ pcie1: pcie@18000000 {
 
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0x7>;
-			interrupt-map = <0 0 0 1 &intc 0 0 412 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 2 &intc 0 0 413 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 3 &intc 0 0 414 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 4 &intc 0 0 415 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-map = <0 0 0 1 &intc 0 GIC_SPI 412 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 2 &intc 0 GIC_SPI 413 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &intc 0 GIC_SPI 414 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &intc 0 GIC_SPI 415 IRQ_TYPE_LEVEL_HIGH>;
 
 			clocks = <&gcc GCC_PCIE3X2_AXI_M_CLK>,
 				 <&gcc GCC_PCIE3X2_AXI_S_CLK>,
@@ -736,10 +736,10 @@ pcie0: pcie@20000000 {
 
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0x7>;
-			interrupt-map = <0 0 0 1 &intc 0 0 35 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 2 &intc 0 0 36 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 3 &intc 0 0 37 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 4 &intc 0 0 38 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-map = <0 0 0 1 &intc 0 GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 2 &intc 0 GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &intc 0 GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &intc 0 GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
 
 			clocks = <&gcc GCC_PCIE3X1_0_AXI_M_CLK>,
 				 <&gcc GCC_PCIE3X1_0_AXI_S_CLK>,
diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
index b1a86b54c30f30fbb66057cf4e79ada6ebc29d89..67877fbbdf3a0dcb587e696ed4241f1075000366 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
@@ -856,10 +856,10 @@ pcie3: pcie@40000000 {
 
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0x0 0x0 0x0 0x7>;
-			interrupt-map = <0 0 0 1 &intc 0 479 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 2 &intc 0 480 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 3 &intc 0 481 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 4 &intc 0 482 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-map = <0 0 0 1 &intc GIC_SPI 479 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 2 &intc GIC_SPI 480 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &intc GIC_SPI 481 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &intc GIC_SPI 482 IRQ_TYPE_LEVEL_HIGH>;
 
 			clocks = <&gcc GCC_PCIE3_AXI_M_CLK>,
 				 <&gcc GCC_PCIE3_AXI_S_CLK>,
@@ -959,10 +959,10 @@ pcie2: pcie@50000000 {
 
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0x0 0x0 0x0 0x7>;
-			interrupt-map = <0 0 0 1 &intc 0 464 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 2 &intc 0 465 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 3 &intc 0 466 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 4 &intc 0 467 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-map = <0 0 0 1 &intc GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 2 &intc GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &intc GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &intc GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>;
 
 			clocks = <&gcc GCC_PCIE2_AXI_M_CLK>,
 				 <&gcc GCC_PCIE2_AXI_S_CLK>,
@@ -1062,10 +1062,10 @@ pcie1: pcie@60000000 {
 
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0x0 0x0 0x0 0x7>;
-			interrupt-map = <0 0 0 1 &intc 0 449 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 2 &intc 0 450 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 3 &intc 0 451 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 4 &intc 0 452 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-map = <0 0 0 1 &intc GIC_SPI 449 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 2 &intc GIC_SPI 450 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &intc GIC_SPI 451 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &intc GIC_SPI 452 IRQ_TYPE_LEVEL_HIGH>;
 
 			clocks = <&gcc GCC_PCIE1_AXI_M_CLK>,
 				 <&gcc GCC_PCIE1_AXI_S_CLK>,
@@ -1165,10 +1165,10 @@ pcie0: pcie@70000000 {
 
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0x0 0x0 0x0 0x7>;
-			interrupt-map = <0 0 0 1 &intc 0 434 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 2 &intc 0 435 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 3 &intc 0 436 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 4 &intc 0 437 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-map = <0 0 0 1 &intc GIC_SPI 434 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 2 &intc GIC_SPI 435 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &intc GIC_SPI 436 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &intc GIC_SPI 437 IRQ_TYPE_LEVEL_HIGH>;
 
 			clocks = <&gcc GCC_PCIE0_AXI_M_CLK>,
 				 <&gcc GCC_PCIE0_AXI_S_CLK>,
diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
index bfe59b0208415902c69fd0c0c7565d97997d4207..40f1c262126eff3761430a47472b52d27f961040 100644
--- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
@@ -906,10 +906,10 @@ pcie0: pcie@20000000 {
 
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0x7>;
-			interrupt-map = <0 0 0 1 &intc 0 0 0 75 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
-					<0 0 0 2 &intc 0 0 0 78 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
-					<0 0 0 3 &intc 0 0 0 79 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
-					<0 0 0 4 &intc 0 0 0 83 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
+			interrupt-map = <0 0 0 1 &intc 0 0 GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
+					<0 0 0 2 &intc 0 0 GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
+					<0 0 0 3 &intc 0 0 GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
+					<0 0 0 4 &intc 0 0 GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
 
 			clocks = <&gcc GCC_SYS_NOC_PCIE0_AXI_CLK>,
 				 <&gcc GCC_PCIE0_AXI_M_CLK>,
diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
index fffb47ec244899cf45984adbe8c4f9820bef5c5f..256e12cf6d54417582a8b50e061f40719a4004a1 100644
--- a/arch/arm64/boot/dts/qcom/ipq8074.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
@@ -867,13 +867,13 @@ pcie1: pcie@10000000 {
 					  "global";
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0x7>;
-			interrupt-map = <0 0 0 1 &intc 0 0 142
+			interrupt-map = <0 0 0 1 &intc 0 GIC_SPI 142
 					 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
-					<0 0 0 2 &intc 0 0 143
+					<0 0 0 2 &intc 0 GIC_SPI 143
 					 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
-					<0 0 0 3 &intc 0 0 144
+					<0 0 0 3 &intc 0 GIC_SPI 144
 					 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
-					<0 0 0 4 &intc 0 0 145
+					<0 0 0 4 &intc 0 GIC_SPI 145
 					 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
 
 			clocks = <&gcc GCC_SYS_NOC_PCIE1_AXI_CLK>,
@@ -955,13 +955,13 @@ pcie0: pcie@20000000 {
 					  "global";
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0x7>;
-			interrupt-map = <0 0 0 1 &intc 0 0 75
+			interrupt-map = <0 0 0 1 &intc 0 GIC_SPI 75
 					 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
-					<0 0 0 2 &intc 0 0 78
+					<0 0 0 2 &intc 0 GIC_SPI 78
 					 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
-					<0 0 0 3 &intc 0 0 79
+					<0 0 0 3 &intc 0 GIC_SPI 79
 					 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
-					<0 0 0 4 &intc 0 0 83
+					<0 0 0 4 &intc 0 GIC_SPI 83
 					 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
 
 			clocks = <&gcc GCC_SYS_NOC_PCIE0_AXI_CLK>,
diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
index 815b5f9540b80e91e81e02a97b20c0426f40b003..f66617f187cafeb55b06c761a52122bc6097f9b6 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
@@ -946,10 +946,10 @@ pcie1: pcie@10000000 {
 
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0x7>;
-			interrupt-map = <0 0 0 1 &intc 0 0 35 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 2 &intc 0 0 49 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 3 &intc 0 0 84 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 4 &intc 0 0 85 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-map = <0 0 0 1 &intc 0 GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 2 &intc 0 GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &intc 0 GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &intc 0 GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
 
 			clocks = <&gcc GCC_PCIE1_AXI_M_CLK>,
 				 <&gcc GCC_PCIE1_AXI_S_CLK>,
@@ -1032,10 +1032,10 @@ pcie3: pcie@18000000 {
 
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0x7>;
-			interrupt-map = <0 0 0 1 &intc 0 0 189 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 2 &intc 0 0 190 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 3 &intc 0 0 191 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 4 &intc 0 0 192 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-map = <0 0 0 1 &intc 0 GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 2 &intc 0 GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &intc 0 GIC_SPI 191 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &intc 0 GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>;
 
 			clocks = <&gcc GCC_PCIE3_AXI_M_CLK>,
 				 <&gcc GCC_PCIE3_AXI_S_CLK>,
@@ -1118,10 +1118,10 @@ pcie2: pcie@20000000 {
 
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0x7>;
-			interrupt-map = <0 0 0 1 &intc 0 0 164 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 2 &intc 0 0 165 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 3 &intc 0 0 186 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 4 &intc 0 0 187 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-map = <0 0 0 1 &intc 0 GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 2 &intc 0 GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &intc 0 GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &intc 0 GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>;
 
 			clocks = <&gcc GCC_PCIE2_AXI_M_CLK>,
 				 <&gcc GCC_PCIE2_AXI_S_CLK>,
@@ -1203,10 +1203,10 @@ pcie0: pci@28000000 {
 
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0x7>;
-			interrupt-map = <0 0 0 1 &intc 0 0 75 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 2 &intc 0 0 78 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 3 &intc 0 0 79 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 4 &intc 0 0 83 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-map = <0 0 0 1 &intc 0 GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 2 &intc 0 GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &intc 0 GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &intc 0 GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
 
 			clocks = <&gcc GCC_PCIE0_AXI_M_CLK>,
 				 <&gcc GCC_PCIE0_AXI_S_CLK>,
diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index b5aab21ac5250029ee60987a1e64871ba4e2be6d..c75b522f6eba66afeb71be5d81624183641bde71 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -1928,10 +1928,10 @@ pcie0: pcie@600000 {
 						  "msi7";
 				#interrupt-cells = <1>;
 				interrupt-map-mask = <0 0 0 0x7>;
-				interrupt-map = <0 0 0 1 &intc 0 244 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
-						<0 0 0 2 &intc 0 245 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
-						<0 0 0 3 &intc 0 247 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
-						<0 0 0 4 &intc 0 248 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
+				interrupt-map = <0 0 0 1 &intc GIC_SPI 244 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
+						<0 0 0 2 &intc GIC_SPI 245 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
+						<0 0 0 3 &intc GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
+						<0 0 0 4 &intc GIC_SPI 248 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
 
 				pinctrl-names = "default", "sleep";
 				pinctrl-0 = <&pcie0_state_on>;
@@ -2005,10 +2005,10 @@ pcie1: pcie@608000 {
 						  "msi7";
 				#interrupt-cells = <1>;
 				interrupt-map-mask = <0 0 0 0x7>;
-				interrupt-map = <0 0 0 1 &intc 0 272 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
-						<0 0 0 2 &intc 0 273 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
-						<0 0 0 3 &intc 0 274 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
-						<0 0 0 4 &intc 0 275 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
+				interrupt-map = <0 0 0 1 &intc GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
+						<0 0 0 2 &intc GIC_SPI 273 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
+						<0 0 0 3 &intc GIC_SPI 274 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
+						<0 0 0 4 &intc GIC_SPI 275 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
 
 				pinctrl-names = "default", "sleep";
 				pinctrl-0 = <&pcie1_state_on>;
@@ -2080,10 +2080,10 @@ pcie2: pcie@610000 {
 						  "msi7";
 				#interrupt-cells = <1>;
 				interrupt-map-mask = <0 0 0 0x7>;
-				interrupt-map = <0 0 0 1 &intc 0 142 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
-						<0 0 0 2 &intc 0 143 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
-						<0 0 0 3 &intc 0 144 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
-						<0 0 0 4 &intc 0 145 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
+				interrupt-map = <0 0 0 1 &intc GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
+						<0 0 0 2 &intc GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
+						<0 0 0 3 &intc GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
+						<0 0 0 4 &intc GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
 
 				pinctrl-names = "default", "sleep";
 				pinctrl-0 = <&pcie2_state_on>;
diff --git a/arch/arm64/boot/dts/qcom/sar2130p.dtsi b/arch/arm64/boot/dts/qcom/sar2130p.dtsi
index 38f7869616ff01ece3799ced15c39375d629e364..96c4d2e06d9a9ec22d968c1e4bbb5723f18223d1 100644
--- a/arch/arm64/boot/dts/qcom/sar2130p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sar2130p.dtsi
@@ -1303,10 +1303,10 @@ pcie0: pcie@1c00000 {
 					  "global";
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0x7>;
-			interrupt-map = <0 0 0 1 &intc 0 0 0 149 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
-					<0 0 0 2 &intc 0 0 0 150 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
-					<0 0 0 3 &intc 0 0 0 151 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
-					<0 0 0 4 &intc 0 0 0 152 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
+			interrupt-map = <0 0 0 1 &intc 0 0 GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
+					<0 0 0 2 &intc 0 0 GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
+					<0 0 0 3 &intc 0 0 GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
+					<0 0 0 4 &intc 0 0 GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
 
 			clocks = <&gcc GCC_PCIE_0_AUX_CLK>,
 				 <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
@@ -1422,10 +1422,10 @@ pcie1: pcie@1c08000 {
 					  "global";
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0x7>;
-			interrupt-map = <0 0 0 1 &intc 0 0 0 434 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
-					<0 0 0 2 &intc 0 0 0 435 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
-					<0 0 0 3 &intc 0 0 0 438 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
-					<0 0 0 4 &intc 0 0 0 439 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
+			interrupt-map = <0 0 0 1 &intc 0 0 GIC_SPI 434 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
+					<0 0 0 2 &intc 0 0 GIC_SPI 435 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
+					<0 0 0 3 &intc 0 0 GIC_SPI 438 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
+					<0 0 0 4 &intc 0 0 GIC_SPI 439 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
 
 			clocks = <&gcc GCC_PCIE_1_AUX_CLK>,
 				 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 0dd6a5c91d109c78333f6b90104fa51fcf3bd64c..8561fc21722991860f59b5406ad084c2a30d3003 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -2240,10 +2240,10 @@ pcie0: pcie@1c00000 {
 					  "global";
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0x7>;
-			interrupt-map = <0 0 0 1 &intc 0 0 0 149 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 2 &intc 0 0 0 150 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 3 &intc 0 0 0 151 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 4 &intc 0 0 0 152 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-map = <0 0 0 1 &intc 0 0 GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 2 &intc 0 0 GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &intc 0 0 GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &intc 0 0 GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>;
 
 			clocks = <&gcc GCC_PCIE_0_PIPE_CLK>,
 				 <&gcc GCC_PCIE_0_PIPE_CLK_SRC>,
@@ -2369,10 +2369,10 @@ pcie1: pcie@1c08000 {
 					  "global";
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0x7>;
-			interrupt-map = <0 0 0 1 &intc 0 0 0 434 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 2 &intc 0 0 0 435 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 3 &intc 0 0 0 438 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 4 &intc 0 0 0 439 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-map = <0 0 0 1 &intc 0 0 GIC_SPI 434 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 2 &intc 0 0 GIC_SPI 435 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &intc 0 0 GIC_SPI 438 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &intc 0 0 GIC_SPI 439 IRQ_TYPE_LEVEL_HIGH>;
 
 			clocks = <&gcc GCC_PCIE_1_PIPE_CLK>,
 				 <&gcc GCC_PCIE_1_PIPE_CLK_SRC>,
diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index 15a75def6204a35d5852e73d66fd3052e38e7863..ae27a055eeeeb52a9a73f573f553abb0d6bd0d02 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -1740,10 +1740,10 @@ pcie0: pcie@1c00000 {
 					  "global";
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0x7>;
-			interrupt-map = <0 0 0 1 &intc 0 149 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
-					<0 0 0 2 &intc 0 150 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
-					<0 0 0 3 &intc 0 151 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
-					<0 0 0 4 &intc 0 152 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
+			interrupt-map = <0 0 0 1 &intc GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
+					<0 0 0 2 &intc GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
+					<0 0 0 3 &intc GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
+					<0 0 0 4 &intc GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
 
 			clocks = <&gcc GCC_PCIE_0_PIPE_CLK>,
 				 <&gcc GCC_PCIE_0_AUX_CLK>,
@@ -1859,10 +1859,10 @@ pcie3: pcie@1c08000 {
 					  "global";
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0x7>;
-			interrupt-map = <0 0 0 1 &intc 0 434 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
-					<0 0 0 2 &intc 0 435 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
-					<0 0 0 3 &intc 0 438 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
-					<0 0 0 4 &intc 0 439 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
+			interrupt-map = <0 0 0 1 &intc GIC_SPI 434 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
+					<0 0 0 2 &intc GIC_SPI 435 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
+					<0 0 0 3 &intc GIC_SPI 438 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
+					<0 0 0 4 &intc GIC_SPI 439 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
 
 			clocks = <&gcc GCC_PCIE_3_PIPE_CLK>,
 				 <&gcc GCC_PCIE_3_AUX_CLK>,
@@ -1979,10 +1979,10 @@ pcie1: pcie@1c10000 {
 					  "global";
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0x7>;
-			interrupt-map = <0 0 0 1 &intc 0 747 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
-					<0 0 0 2 &intc 0 746 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
-					<0 0 0 3 &intc 0 745 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
-					<0 0 0 4 &intc 0 744 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
+			interrupt-map = <0 0 0 1 &intc GIC_SPI 747 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
+					<0 0 0 2 &intc GIC_SPI 746 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
+					<0 0 0 3 &intc GIC_SPI 745 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
+					<0 0 0 4 &intc GIC_SPI 744 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
 
 			clocks = <&gcc GCC_PCIE_1_PIPE_CLK>,
 				 <&gcc GCC_PCIE_1_AUX_CLK>,
@@ -2099,10 +2099,10 @@ pcie2: pcie@1c18000 {
 					  "global";
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0x7>;
-			interrupt-map = <0 0 0 1 &intc 0 663 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
-					<0 0 0 2 &intc 0 662 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
-					<0 0 0 3 &intc 0 661 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
-					<0 0 0 4 &intc 0 660 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
+			interrupt-map = <0 0 0 1 &intc GIC_SPI 663 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
+					<0 0 0 2 &intc GIC_SPI 662 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
+					<0 0 0 3 &intc GIC_SPI 661 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
+					<0 0 0 4 &intc GIC_SPI 660 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
 
 			clocks = <&gcc GCC_PCIE_2_PIPE_CLK>,
 				 <&gcc GCC_PCIE_2_AUX_CLK>,
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 421693208af0d5baeaa14ba2bbf29cbbc677e732..cd2049fbfa01aaae10876f4b33410a33effa3ce2 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -1809,10 +1809,10 @@ pcie4: pcie@1c00000 {
 
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0x7>;
-			interrupt-map = <0 0 0 1 &intc 0 0 GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 2 &intc 0 0 GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 3 &intc 0 0 GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 4 &intc 0 0 GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-map = <0 0 0 1 &intc 0 GIC_SPI GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 2 &intc 0 GIC_SPI GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &intc 0 GIC_SPI GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &intc 0 GIC_SPI GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>;
 
 			clocks = <&gcc GCC_PCIE_4_AUX_CLK>,
 				 <&gcc GCC_PCIE_4_CFG_AHB_CLK>,
@@ -1922,10 +1922,10 @@ pcie3b: pcie@1c08000 {
 
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0x7>;
-			interrupt-map = <0 0 0 1 &intc 0 0 GIC_SPI 526 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 2 &intc 0 0 GIC_SPI 527 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 3 &intc 0 0 GIC_SPI 528 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 4 &intc 0 0 GIC_SPI 529 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-map = <0 0 0 1 &intc 0 GIC_SPI GIC_SPI 526 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 2 &intc 0 GIC_SPI GIC_SPI 527 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &intc 0 GIC_SPI GIC_SPI 528 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &intc 0 GIC_SPI GIC_SPI 529 IRQ_TYPE_LEVEL_HIGH>;
 
 			clocks = <&gcc GCC_PCIE_3B_AUX_CLK>,
 				 <&gcc GCC_PCIE_3B_CFG_AHB_CLK>,
@@ -2033,10 +2033,10 @@ pcie3a: pcie@1c10000 {
 
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0x7>;
-			interrupt-map = <0 0 0 1 &intc 0 0 GIC_SPI 499 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 2 &intc 0 0 GIC_SPI 542 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 3 &intc 0 0 GIC_SPI 543 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 4 &intc 0 0 GIC_SPI 544 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-map = <0 0 0 1 &intc 0 GIC_SPI GIC_SPI 499 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 2 &intc 0 GIC_SPI GIC_SPI 542 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &intc 0 GIC_SPI GIC_SPI 543 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &intc 0 GIC_SPI GIC_SPI 544 IRQ_TYPE_LEVEL_HIGH>;
 
 			clocks = <&gcc GCC_PCIE_3A_AUX_CLK>,
 				 <&gcc GCC_PCIE_3A_CFG_AHB_CLK>,
@@ -2147,10 +2147,10 @@ pcie2b: pcie@1c18000 {
 
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0x7>;
-			interrupt-map = <0 0 0 1 &intc 0 0 GIC_SPI 375 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 2 &intc 0 0 GIC_SPI 434 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 3 &intc 0 0 GIC_SPI 435 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 4 &intc 0 0 GIC_SPI 438 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-map = <0 0 0 1 &intc 0 GIC_SPI GIC_SPI 375 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 2 &intc 0 GIC_SPI GIC_SPI 434 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &intc 0 GIC_SPI GIC_SPI 435 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &intc 0 GIC_SPI GIC_SPI 438 IRQ_TYPE_LEVEL_HIGH>;
 
 			clocks = <&gcc GCC_PCIE_2B_AUX_CLK>,
 				 <&gcc GCC_PCIE_2B_CFG_AHB_CLK>,
@@ -2258,10 +2258,10 @@ pcie2a: pcie@1c20000 {
 
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0x7>;
-			interrupt-map = <0 0 0 1 &intc 0 0 GIC_SPI 530 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 2 &intc 0 0 GIC_SPI 531 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 3 &intc 0 0 GIC_SPI 532 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 4 &intc 0 0 GIC_SPI 533 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-map = <0 0 0 1 &intc 0 GIC_SPI GIC_SPI 530 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 2 &intc 0 GIC_SPI GIC_SPI 531 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &intc 0 GIC_SPI GIC_SPI 532 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &intc 0 GIC_SPI GIC_SPI 533 IRQ_TYPE_LEVEL_HIGH>;
 
 			clocks = <&gcc GCC_PCIE_2A_AUX_CLK>,
 				 <&gcc GCC_PCIE_2A_CFG_AHB_CLK>,
diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 828b55cb6baf10458feae8f53c04663ef958601e..258f964f39172b319c07e483eff2d9b50371c73c 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -2347,10 +2347,10 @@ pcie0: pcie@1c00000 {
 					  "global";
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0x7>;
-			interrupt-map = <0 0 0 1 &intc 0 0 0 149 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
-					<0 0 0 2 &intc 0 0 0 150 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
-					<0 0 0 3 &intc 0 0 0 151 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
-					<0 0 0 4 &intc 0 0 0 152 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
+			interrupt-map = <0 0 0 1 &intc 0 0 GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
+					<0 0 0 2 &intc 0 0 GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
+					<0 0 0 3 &intc 0 0 GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
+					<0 0 0 4 &intc 0 0 GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
 
 			clocks = <&gcc GCC_PCIE_0_PIPE_CLK>,
 				 <&gcc GCC_PCIE_0_AUX_CLK>,
@@ -2472,10 +2472,10 @@ pcie1: pcie@1c08000 {
 					  "global";
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0x7>;
-			interrupt-map = <0 0 0 1 &intc 0 0 0 434 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
-					<0 0 0 2 &intc 0 0 0 435 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
-					<0 0 0 3 &intc 0 0 0 438 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
-					<0 0 0 4 &intc 0 0 0 439 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
+			interrupt-map = <0 0 0 1 &intc 0 0 GIC_SPI 434 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
+					<0 0 0 2 &intc 0 0 GIC_SPI 435 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
+					<0 0 0 3 &intc 0 0 GIC_SPI 438 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
+					<0 0 0 4 &intc 0 0 GIC_SPI 439 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
 
 			clocks = <&gcc GCC_PCIE_1_PIPE_CLK>,
 				 <&gcc GCC_PCIE_1_AUX_CLK>,
diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 12e7b74cde520009d73d381adfa1deeb8788621b..6860816db6d27f3449b270df0a22aff868775ed4 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -1866,10 +1866,10 @@ pcie0: pcie@1c00000 {
 					  "global";
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0x7>;
-			interrupt-map = <0 0 0 1 &intc 0 149 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
-					<0 0 0 2 &intc 0 150 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
-					<0 0 0 3 &intc 0 151 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
-					<0 0 0 4 &intc 0 152 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
+			interrupt-map = <0 0 0 1 &intc GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
+					<0 0 0 2 &intc GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
+					<0 0 0 3 &intc GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
+					<0 0 0 4 &intc GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
 
 			clocks = <&gcc GCC_PCIE_0_PIPE_CLK>,
 				 <&gcc GCC_PCIE_0_AUX_CLK>,
@@ -1981,10 +1981,10 @@ pcie1: pcie@1c08000 {
 					  "global";
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0x7>;
-			interrupt-map = <0 0 0 1 &intc 0 434 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
-					<0 0 0 2 &intc 0 435 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
-					<0 0 0 3 &intc 0 438 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
-					<0 0 0 4 &intc 0 439 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
+			interrupt-map = <0 0 0 1 &intc GIC_SPI 434 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
+					<0 0 0 2 &intc GIC_SPI 435 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
+					<0 0 0 3 &intc GIC_SPI 438 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
+					<0 0 0 4 &intc GIC_SPI 439 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
 
 			clocks = <&gcc GCC_PCIE_1_PIPE_CLK>,
 				 <&gcc GCC_PCIE_1_AUX_CLK>,
diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 8e0eb802d68e9670a10cd6e227bd1eccbd872866..6591b8172e089453b02208fbcd7a40abbf42e4f9 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -2163,10 +2163,10 @@ pcie0: pcie@1c00000 {
 					  "global";
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0x7>;
-			interrupt-map = <0 0 0 1 &intc 0 149 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
-					<0 0 0 2 &intc 0 150 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
-					<0 0 0 3 &intc 0 151 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
-					<0 0 0 4 &intc 0 152 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
+			interrupt-map = <0 0 0 1 &intc GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
+					<0 0 0 2 &intc GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
+					<0 0 0 3 &intc GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
+					<0 0 0 4 &intc GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
 
 			clocks = <&gcc GCC_PCIE_0_PIPE_CLK>,
 				 <&gcc GCC_PCIE_0_AUX_CLK>,
@@ -2285,10 +2285,10 @@ pcie1: pcie@1c08000 {
 					  "global";
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0x7>;
-			interrupt-map = <0 0 0 1 &intc 0 434 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
-					<0 0 0 2 &intc 0 435 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
-					<0 0 0 3 &intc 0 438 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
-					<0 0 0 4 &intc 0 439 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
+			interrupt-map = <0 0 0 1 &intc GIC_SPI 434 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
+					<0 0 0 2 &intc GIC_SPI 435 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
+					<0 0 0 3 &intc GIC_SPI 438 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
+					<0 0 0 4 &intc GIC_SPI 439 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
 
 			clocks = <&gcc GCC_PCIE_1_PIPE_CLK>,
 				 <&gcc GCC_PCIE_1_AUX_CLK>,
@@ -2412,10 +2412,10 @@ pcie2: pcie@1c10000 {
 					  "global";
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0x7>;
-			interrupt-map = <0 0 0 1 &intc 0 290 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
-					<0 0 0 2 &intc 0 415 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
-					<0 0 0 3 &intc 0 416 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
-					<0 0 0 4 &intc 0 417 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
+			interrupt-map = <0 0 0 1 &intc GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
+					<0 0 0 2 &intc GIC_SPI 415 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
+					<0 0 0 3 &intc GIC_SPI 416 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
+					<0 0 0 4 &intc GIC_SPI 417 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
 
 			clocks = <&gcc GCC_PCIE_2_PIPE_CLK>,
 				 <&gcc GCC_PCIE_2_AUX_CLK>,
diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index acaf40298f2e353e81793639522d0b0c52f6179f..de1fae97ce447b47db1fab3abaa6456478fe04b3 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -1551,10 +1551,10 @@ pcie0: pcie@1c00000 {
 					  "global";
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0x7>;
-			interrupt-map = <0 0 0 1 &intc 0 149 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
-					<0 0 0 2 &intc 0 150 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
-					<0 0 0 3 &intc 0 151 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
-					<0 0 0 4 &intc 0 152 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
+			interrupt-map = <0 0 0 1 &intc GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
+					<0 0 0 2 &intc GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
+					<0 0 0 3 &intc GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
+					<0 0 0 4 &intc GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
 
 			clocks = <&gcc GCC_PCIE_0_AUX_CLK>,
 				 <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
@@ -1662,10 +1662,10 @@ pcie1: pcie@1c08000 {
 					  "global";
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0x7>;
-			interrupt-map = <0 0 0 1 &intc 0 434 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
-					<0 0 0 2 &intc 0 435 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
-					<0 0 0 3 &intc 0 438 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
-					<0 0 0 4 &intc 0 439 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
+			interrupt-map = <0 0 0 1 &intc GIC_SPI 434 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
+					<0 0 0 2 &intc GIC_SPI 435 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
+					<0 0 0 3 &intc GIC_SPI 438 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
+					<0 0 0 4 &intc GIC_SPI 439 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
 
 			clocks = <&gcc GCC_PCIE_1_AUX_CLK>,
 				 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 2baef6869ed7c17efb239e86013c15ef6ef5f48f..b31c09ec61a989c8e90a23559d540c2eea2265c3 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -1987,10 +1987,10 @@ pcie0: pcie@1c00000 {
 					  "global";
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0x7>;
-			interrupt-map = <0 0 0 1 &intc 0 0 0 149 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
-					<0 0 0 2 &intc 0 0 0 150 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
-					<0 0 0 3 &intc 0 0 0 151 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
-					<0 0 0 4 &intc 0 0 0 152 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
+			interrupt-map = <0 0 0 1 &intc 0 0 GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
+					<0 0 0 2 &intc 0 0 GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
+					<0 0 0 3 &intc 0 0 GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
+					<0 0 0 4 &intc 0 0 GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
 
 			interconnects = <&pcie_noc MASTER_PCIE_0 QCOM_ICC_TAG_ALWAYS
 					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
@@ -2151,10 +2151,10 @@ pcie1: pcie@1c08000 {
 					  "global";
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0x7>;
-			interrupt-map = <0 0 0 1 &intc 0 0 0 434 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
-					<0 0 0 2 &intc 0 0 0 435 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
-					<0 0 0 3 &intc 0 0 0 438 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
-					<0 0 0 4 &intc 0 0 0 439 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
+			interrupt-map = <0 0 0 1 &intc 0 0 GIC_SPI 434 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
+					<0 0 0 2 &intc 0 0 GIC_SPI 435 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
+					<0 0 0 3 &intc 0 0 GIC_SPI 438 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
+					<0 0 0 4 &intc 0 0 GIC_SPI 439 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
 
 			interconnects = <&pcie_noc MASTER_PCIE_1 QCOM_ICC_TAG_ALWAYS
 					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 38d139d1dd4a994287c03d064ca01d59a11ac771..4a04b027f2f5a89aefcaddd01dd461cb87598db1 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -1981,10 +1981,10 @@ pcie0: pcie@1c00000 {
 					  "global";
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0x7>;
-			interrupt-map = <0 0 0 1 &intc 0 0 0 149 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
-					<0 0 0 2 &intc 0 0 0 150 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
-					<0 0 0 3 &intc 0 0 0 151 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
-					<0 0 0 4 &intc 0 0 0 152 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
+			interrupt-map = <0 0 0 1 &intc 0 0 GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
+					<0 0 0 2 &intc 0 0 GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
+					<0 0 0 3 &intc 0 0 GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
+					<0 0 0 4 &intc 0 0 GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
 
 			clocks = <&gcc GCC_PCIE_0_AUX_CLK>,
 				 <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
@@ -2142,10 +2142,10 @@ pcie1: pcie@1c08000 {
 					  "global";
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0x7>;
-			interrupt-map = <0 0 0 1 &intc 0 0 0 434 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
-					<0 0 0 2 &intc 0 0 0 435 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
-					<0 0 0 3 &intc 0 0 0 438 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
-					<0 0 0 4 &intc 0 0 0 439 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
+			interrupt-map = <0 0 0 1 &intc 0 0 GIC_SPI 434 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
+					<0 0 0 2 &intc 0 0 GIC_SPI 435 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
+					<0 0 0 3 &intc 0 0 GIC_SPI 438 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
+					<0 0 0 4 &intc 0 0 GIC_SPI 439 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
 
 			clocks = <&gcc GCC_PCIE_1_AUX_CLK>,
 				 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index d6794901f06b50e8629afd081cb7d229ea342f84..7ffdd26ff6143b5b72c1b9dd97ff26898b7ff91b 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -3629,10 +3629,10 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			iommu-map = <0     &apps_smmu 0x1400 0x1>,
 				    <0x100 &apps_smmu 0x1401 0x1>;
 
-			interrupt-map = <0 0 0 1 &intc 0 0 0 149 IRQ_TYPE_LEVEL_HIGH 0>,
-					<0 0 0 2 &intc 0 0 0 150 IRQ_TYPE_LEVEL_HIGH 0>,
-					<0 0 0 3 &intc 0 0 0 151 IRQ_TYPE_LEVEL_HIGH 0>,
-					<0 0 0 4 &intc 0 0 0 152 IRQ_TYPE_LEVEL_HIGH 0>;
+			interrupt-map = <0 0 0 1 &intc 0 0 GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH 0>,
+					<0 0 0 2 &intc 0 0 GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH 0>,
+					<0 0 0 3 &intc 0 0 GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH 0>,
+					<0 0 0 4 &intc 0 0 GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH 0>;
 			interrupt-map-mask = <0 0 0 0x7>;
 			#interrupt-cells = <1>;
 
@@ -3809,10 +3809,10 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			iommu-map = <0     &apps_smmu 0x1480 0x1>,
 				    <0x100 &apps_smmu 0x1481 0x1>;
 
-			interrupt-map = <0 0 0 1 &intc 0 0 0 434 IRQ_TYPE_LEVEL_HIGH 0>,
-					<0 0 0 2 &intc 0 0 0 435 IRQ_TYPE_LEVEL_HIGH 0>,
-					<0 0 0 3 &intc 0 0 0 438 IRQ_TYPE_LEVEL_HIGH 0>,
-					<0 0 0 4 &intc 0 0 0 439 IRQ_TYPE_LEVEL_HIGH 0>;
+			interrupt-map = <0 0 0 1 &intc 0 0 GIC_SPI 434 IRQ_TYPE_LEVEL_HIGH 0>,
+					<0 0 0 2 &intc 0 0 GIC_SPI 435 IRQ_TYPE_LEVEL_HIGH 0>,
+					<0 0 0 3 &intc 0 0 GIC_SPI 438 IRQ_TYPE_LEVEL_HIGH 0>,
+					<0 0 0 4 &intc 0 0 GIC_SPI 439 IRQ_TYPE_LEVEL_HIGH 0>;
 			interrupt-map-mask = <0 0 0 0x7>;
 			#interrupt-cells = <1>;
 
diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index f293b13ecc0ce426661187ac793f147d12434fcb..e61c9010a3f2febadaffcaf935fa1fd1b658a5ad 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -3404,10 +3404,10 @@ pcie6a: pci@1bf8000 {
 
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0x7>;
-			interrupt-map = <0 0 0 1 &intc 0 0 0 843 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 2 &intc 0 0 0 844 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 3 &intc 0 0 0 845 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 4 &intc 0 0 0 772 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-map = <0 0 0 1 &intc 0 0 GIC_SPI 843 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 2 &intc 0 0 GIC_SPI 844 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &intc 0 0 GIC_SPI 845 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &intc 0 0 GIC_SPI 772 IRQ_TYPE_LEVEL_HIGH>;
 
 			clocks = <&gcc GCC_PCIE_6A_AUX_CLK>,
 				 <&gcc GCC_PCIE_6A_CFG_AHB_CLK>,
@@ -3536,10 +3536,10 @@ pcie5: pci@1c00000 {
 
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0x7>;
-			interrupt-map = <0 0 0 1 &intc 0 0 0 70 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 2 &intc 0 0 0 71 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 3 &intc 0 0 0 72 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 4 &intc 0 0 0 73 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-map = <0 0 0 1 &intc 0 0 GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 2 &intc 0 0 GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &intc 0 0 GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &intc 0 0 GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
 
 			clocks = <&gcc GCC_PCIE_5_AUX_CLK>,
 				 <&gcc GCC_PCIE_5_CFG_AHB_CLK>,
@@ -3666,10 +3666,10 @@ pcie4: pci@1c08000 {
 
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0x7>;
-			interrupt-map = <0 0 0 1 &intc 0 0 0 149 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 2 &intc 0 0 0 150 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 3 &intc 0 0 0 151 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 4 &intc 0 0 0 152 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-map = <0 0 0 1 &intc 0 0 GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 2 &intc 0 0 GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &intc 0 0 GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &intc 0 0 GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>;
 
 			clocks = <&gcc GCC_PCIE_4_AUX_CLK>,
 				 <&gcc GCC_PCIE_4_CFG_AHB_CLK>,

-- 
2.48.1


