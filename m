Return-Path: <linux-arm-msm+bounces-8258-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D195583C349
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 14:08:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 81836292AE2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 13:08:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3D4158115;
	Thu, 25 Jan 2024 13:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ksk4o+Cd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA8455795
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 13:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706188004; cv=none; b=gSupyO1GEQo0fjeN1yabftLTII171O8rmkPUShDHsLG82pzHsMKy0HEsmdlN1C0mQEzYZEfTkL2gewAUGoVEDNv0CTC+ss7Dvxev4H2g5F/l7FTc+jJOe3D2qKUt94x3b7sj/wkKwFIBNIFEVbml1CFKkWv5ZeBG7lUU7+neQm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706188004; c=relaxed/simple;
	bh=Vm8FYWkCbiN6pEEwfgqVnqgx6X6dabUYF1SQcOeQgi4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Bn+SW0LqDT9zoB8D+uo8Rt2fbnmkld0aA29V0LKZPkxjSPi0U7CV76qyUV0Jhs5lycHmbzP1zr6JjeODoMSXbzsj9/lLqvm8kG1v/eA9TNQbMevfhPajzM+tXsoojKpvC6hU41QdSMYRRIcK1y62L0bY6rLzrAfSlJoH8ZGcbbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ksk4o+Cd; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-558f523c072so7995610a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 05:06:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706188001; x=1706792801; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hz4UOUwLaTrVZVjKRBIuuQV1CZ1n1JSNcVoZKpZXtzg=;
        b=Ksk4o+CdSuwqgXZZ1vMSQQhoXKBocWFevZyu4NuT9i3uFKhB5ZquGNzcHPZMjuTfW7
         UepuOrSB+CKGVq/Lg6tb2Jq22em++JBoBQrxUqWKF96MB8H/bp1T9iB7CCWd6TBq33cP
         Rqz3Y+Dn+ySFKmNKR5axj7BB/pXlkdRvPX5jdrjH2VcCsvwNihDtxS0zRH0ty7HlRpPX
         Obqk9BnOcmA2WM1fInPh/ANB0u2bYGUr5c+9+UCZ/bJYAZHnoVHmdKH3q/NcYevxso+a
         y1TXk3BSUUQWvR2pjBFZqvTbZF7zqLwo8zUb/na514yY0GolgvoCcRrSW2CTJY6z7NoI
         0NyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706188001; x=1706792801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hz4UOUwLaTrVZVjKRBIuuQV1CZ1n1JSNcVoZKpZXtzg=;
        b=CWrVKM31eI7is24l9zCMqEih2bzyijYWbOC99Hn/TQSrrqpi++KO9rFLYS35djL9R6
         qxvY+efFg6lVbTytf5dHU69PpBp8Cifux4Mflo/64suhSz5rXi6JsJCczkvLgt5GZXXL
         uPqxdSRFRind9LefjXb+FjynNTkZY5O0y1AgXf+3hDzkskZUtNCip18K1WrWinMeDgg4
         vS/LgsHtGrPK1ReuK6Yo8Nq4l6Mby6Jxj/QsOGpIQ4wGGPfO0fEzQ88QvhLfC/tYBlxC
         s0594ilRqa/oTFvsbxxmBSPZ/2ZZK8r3cP2D5yrub49sWvSyywG9NU64b7m0yTKwfxSz
         Orsw==
X-Gm-Message-State: AOJu0Yx3ynGefKWX74nzeNcjNVSHZFZU6w6LhXWoKA0MB9umb5GahWk5
	jdGEqn3ah21AAdcldKayxnf5CZaHxeextZ4/2jD95xml6AX93sbAG1ch+tp3+YM=
X-Google-Smtp-Source: AGHT+IHm6+LA7xKQVSTlAszsDlUkRYqXhWF42y0uqkcwpk8+pO6DRmRsYDU9XLKhjy6W3WVccCpC/Q==
X-Received: by 2002:a50:99de:0:b0:55c:fd62:18a4 with SMTP id n30-20020a5099de000000b0055cfd6218a4mr283034edb.82.1706188001502;
        Thu, 25 Jan 2024 05:06:41 -0800 (PST)
Received: from krzk-bin.. ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id ig1-20020a056402458100b0055ca5ce62ddsm1873315edb.12.2024.01.25.05.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 05:06:40 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 6/6] arm64: dts: qcom: sm8650: describe all PCI MSI interrupts
Date: Thu, 25 Jan 2024 14:06:26 +0100
Message-Id: <20240125130626.390850-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240125130626.390850-1-krzysztof.kozlowski@linaro.org>
References: <20240125130626.390850-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Each group of MSI interrupts is mapped to the separate host interrupt.
Describe each of interrupts in the device tree for PCIe hosts.  Not
tested on hardware.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 2df77123a8c7..9fc4f3e37a8c 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -2213,8 +2213,16 @@ pcie0: pci@1c00000 {
 			      <0 0x60100000 0 0x100000>;
 			reg-names = "parf", "dbi", "elbi", "atu", "config";
 
-			interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "msi";
+			interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "msi0", "msi1", "msi2", "msi3",
+					  "msi4", "msi5", "msi6", "msi7";
 
 			clocks = <&gcc GCC_PCIE_0_AUX_CLK>,
 				 <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
@@ -2317,8 +2325,16 @@ pcie1: pci@1c08000 {
 				    "atu",
 				    "config";
 
-			interrupts = <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "msi";
+			interrupts = <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 374 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 375 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "msi0", "msi1", "msi2", "msi3",
+					  "msi4", "msi5", "msi6", "msi7";
 
 			clocks = <&gcc GCC_PCIE_1_AUX_CLK>,
 				 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
-- 
2.34.1


