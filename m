Return-Path: <linux-arm-msm+bounces-71296-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB1BB3CFD3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 Aug 2025 00:21:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5433F5E5376
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Aug 2025 22:21:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED3C62673B7;
	Sat, 30 Aug 2025 22:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bFr3+C+7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C71258EDF;
	Sat, 30 Aug 2025 22:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756592491; cv=none; b=cQZv1cu1O928v2t/Il6/+gHzcL7j2QSTQMqBR+43XUmyvA+6tUlYl9PPSb5e7T3Kq66j++TRi5fR+zvgdW0L4J1BLk0udZHrmO+CO7Z9l3gBVOuIriV9iwK0tgOxdBiYMzAzffbUV1LerhBqt/V8R6OepIgaKfAkPckH+w2hNuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756592491; c=relaxed/simple;
	bh=4VKfVT3I8DaBzxZttRBkoDhbOeWOmCZY/Gu7cAz8rKk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iG+ljA6FS0KPMHIYHFO9pk7pEsC9NxLryCm9Wk1CAMnvA9atwAqRbo7E5ZPe/6eBnRgJbj6UPsgOuPRGF4otziTD/WT1LuHYZEwjhDORJBXLKMKBniTSIjmf9bDKLTcGiUbqP/fg0j3/WelKREjm7MeCN+GU/P8fSCNddfejR9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bFr3+C+7; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-afcb7322da8so604480366b.0;
        Sat, 30 Aug 2025 15:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756592488; x=1757197288; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D6MFTTmmrKhHwzeBfzYKhPuh9THrsl4NpWB/GL/MmNA=;
        b=bFr3+C+7C1r9JgPoYxCSR1e0R1LztIOofQ7UhFqwXVIx9wRz+C1SIhP40fhI9j0n5j
         weQCUma0pQeB7JVrxGGoFEGw5FhK2FdpdFjP+LOp9+Na4vqHtDcoXMWQ4qrHVBQQ6qkr
         QOk+N1R9b1sx8cwJq+M03/6cr6Tc6LkGNmSj0kKUTYJxV2UP67KOhZph+Bl1+GiZn5Tm
         e3hWzrNCZofd3dxvgrRYdiKqGLS/RqE8FQ7wClUA1CGCmve6jDiqsS9u63epKdY0qHJ7
         q0+meF/bC/ziIZ00AGKY7h0AdK7LcvwghC1xCyUFjEjKQj0tKEMfm/RQ5OVSVnwKfoDM
         h5hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756592488; x=1757197288;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D6MFTTmmrKhHwzeBfzYKhPuh9THrsl4NpWB/GL/MmNA=;
        b=YBVk7exZ0XxyEWqZLMt++Dj9wBSw1AZ0rtBKmnW+Sb4GsTF1Y7/x4Rik4mnUjZOGvH
         1HSlOT97Srof2rlzms8wlC4diIF72+QFYxm6oaLPCFiYWibb35oRJVi9hkyg2NnLttb9
         /GyKTTP0YYgXMymb/xowuDiounhg0IcwPk/dX6/YX1zDG00Xjl8g7t8ahoblziTFdsQe
         KX9GNmdk0+SPx8BXKdILHS76yPO1kbkr7JpHUlau7CHDuDVTf2DxDeXARwC7rODRMzkZ
         l5Fq7A12ui12n4ZUkNcf7L/2JjuRz/kaOEXQTsJY9Ka43STGclrtcaiBD8goINikVsbU
         8gMw==
X-Forwarded-Encrypted: i=1; AJvYcCUG1rMCwKH8URgYe72CI08TM0N5buN9YpQw9Z/wQcNinFs3PzwYAKnoQ32E59RcEXPx/09DirTIPC1/@vger.kernel.org, AJvYcCXJwEImhGXYn3xN13G17AlAmhiPGWnCiqyur1mLJFNfSSKry+NEkifbt2XXlTQKAF2YJtSt4AXBq5ZEyA2akQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywt6iYCWBt4Jx2rsh6dGvhwvFTFMuLXQk7EyJq8kVAzXqp9o935
	HjQ+y2m5sz2pRgoWH4wjnKYNVnkJ6yWFo9bzuwda+F/qMa5h6mq0zUDg
X-Gm-Gg: ASbGnct3oR3iyYZZATYbcdTMUr8AEXvL3Z2Svd9H6hdoLhpgri/RUVa5wPrQaJ4NzHR
	+pPUdSrvQY7aIaGAegnFGiWoW6R8Go9KkprEHv8ISMJTEytrRTdjV4GsULujDHH1uxAAgt17QhK
	Tr6er0I6OkbHv5/1+E8KG3OBHCXWaigvyi/vEbDsYeViVO3pDHq0PZfre1j7BMR/PFK74k0ZCQ1
	ejoX9ohQRdCmgmXycRKSJ0gFBvparDu3nC0XdQejljN0T1jbHaTV8/ue+jQP/V0tZ3yqai0WQWE
	R4rM+G+LMAhRPjP7GFk3gUWBYEpYNeAYCuMB/NSItt4XXnH4WoLXTRC7MqrgEHQfFADvsW+yfOj
	emFc+BZgAn8vghSUu8v8D
X-Google-Smtp-Source: AGHT+IGfFSgtxcpKYmv/w5r01kKycrsLuR0sQc/bc+raRF/3d8gHN6rZNoIXJCIuwAjgcENoBeFOcA==
X-Received: by 2002:a17:907:7e86:b0:afe:ad18:8662 with SMTP id a640c23a62f3a-b01d8c74c8emr314742466b.23.1756592488174;
        Sat, 30 Aug 2025 15:21:28 -0700 (PDT)
Received: from [127.0.1.1] ([46.53.240.27])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-b016e56a4e2sm241201366b.26.2025.08.30.15.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 15:21:27 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Sun, 31 Aug 2025 01:21:22 +0300
Subject: [PATCH 2/2] arch: arm64: sdm845: starqltechn: fix max77705
 interrupts
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250831-starqltechn-correct_max77705_nodes-v1-2-5f2af9d13dad@gmail.com>
References: <20250831-starqltechn-correct_max77705_nodes-v1-0-5f2af9d13dad@gmail.com>
In-Reply-To: <20250831-starqltechn-correct_max77705_nodes-v1-0-5f2af9d13dad@gmail.com>
To: Chanwoo Choi <cw00.choi@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756592484; l=2119;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=4VKfVT3I8DaBzxZttRBkoDhbOeWOmCZY/Gu7cAz8rKk=;
 b=HMSKrqlVMCEizKgHWhGYlbxEhQwb+7Lq58vFREjceJ133p+uhw4VCCTpGpqJpQoyZlVjPCPi4
 NAcuUkQwEJBDLYfS+c8sHmBg0XSL05NdrOgC/SNlr/4FavRS4X/VatW
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

Since max77705 has a register, which indicates interrupt source, it acts
as an interrupt controller.

Use max77705 as an interrupt controller for charger and fuelgauge
subdevices.

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
index 03b63b987a18..7ccab6ba7d21 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
@@ -10,6 +10,7 @@
 #include <dt-bindings/input/linux-event-codes.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/mfd/max77705.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include <dt-bindings/sound/qcom,q6afe.h>
 #include <dt-bindings/sound/qcom,q6asm.h>
@@ -584,14 +585,16 @@ &uart9 {
 &i2c14 {
 	status = "okay";
 
-	pmic@66 {
+	max77705: pmic@66 {
 		compatible = "maxim,max77705";
 		reg = <0x66>;
 		interrupt-parent = <&pm8998_gpios>;
 		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-controller;
 		pinctrl-0 = <&pmic_int_default>;
 		pinctrl-names = "default";
 		#address-cells = <1>;
+		#interrupt-cells = <2>;
 		#size-cells = <0>;
 
 		leds {
@@ -631,8 +634,8 @@ max77705_charger: charger@69 {
 		reg = <0x69>;
 		compatible = "maxim,max77705-charger";
 		monitored-battery = <&battery>;
-		interrupt-parent = <&pm8998_gpios>;
-		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-parent = <&max77705>;
+		interrupts = <MAX77705_IRQ_CHG IRQ_TYPE_LEVEL_LOW>;
 
 	};
 
@@ -641,8 +644,8 @@ fuel-gauge@36 {
 		compatible = "maxim,max77705-battery";
 		power-supplies = <&max77705_charger>;
 		maxim,rsns-microohm = <5000>;
-		interrupt-parent = <&pm8998_gpios>;
-		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-parent = <&max77705>;
+		interrupts = <MAX77705_IRQ_FG IRQ_TYPE_LEVEL_LOW>;
 	};
 };
 

-- 
2.39.5


