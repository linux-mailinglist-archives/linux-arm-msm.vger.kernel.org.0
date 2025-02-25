Return-Path: <linux-arm-msm+bounces-49235-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51477A43961
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 10:26:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5DC183BC35F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 09:20:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EC2B260A3D;
	Tue, 25 Feb 2025 09:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VytEYfiR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1F6260A54;
	Tue, 25 Feb 2025 09:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740475196; cv=none; b=KT60vLOHcnB0y+m5v3EH/EMzOLiamzGh1lTy4/QDo6NhsYlJQLiZg0GvAmLJY85U4DouTLRDMTtRq7kyJ5xKUyfP8cLxfM4HthWP7D+3E/o6qIlws7AUqbw4Nn+7boG3BBDRs4DTsmfvhYJDwijH2ZUg6vTd2MRxJr1wZvrZMl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740475196; c=relaxed/simple;
	bh=mxjeNY/gI1DEE5UWt79KGSeGfVjKaB/ATptNamQXRwU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=UXSPD37G6LIXmxZZLfqFl3+3IcTcxQjUyrN4bh/fY98Wu58IB3wVbSwn11oElHsR43F8Ybo/dKwem47g4Njxuu2wqMB+B3J0G0xYNShrP+oNYlIrcjsIZ7Y3DilpluEy/CfdoRrtimjmjk6zScs7eHaiHdAx2Hfju+u9Tip/NyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VytEYfiR; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-222e8d07dc6so33347435ad.1;
        Tue, 25 Feb 2025 01:19:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740475194; x=1741079994; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Nj3QvJrkZQTbm/14d0IKWFHBOShY4xnuFmDq9qgKrl0=;
        b=VytEYfiRHf6StH3SVyWkCqKqSuE9EuzJVKOn9+z+O2MJWo2CcXOBY+K1Emz5jQ8ND8
         X7TwLCrZe88HhOcTdxnzGemQpUSQIlTzJ5lXpyJUmcjefq3iGw3S7cq+sNZvRVrIa/Xs
         Zzttm43FZC2Dpt13UjV2TlGcQcOv5JRoJqU5rkqbewoejc61TkcSA5VTbDNUbYWVuUqF
         4b2TFDKA+HjWYWqI0XIIfFJ5oOFPBnPZkVO1tzanhWXnTn7voXviJvcOlE4rIPcY2FGE
         on8QWDPkTThmIndLdj70U9Jttt5AzxlVghWn1U240sWfWEfy6U4QGQXQAlw9RY+Wdrtb
         /Wyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740475194; x=1741079994;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nj3QvJrkZQTbm/14d0IKWFHBOShY4xnuFmDq9qgKrl0=;
        b=xRxAanGUf5YZp6Qgs3nrY8WxVB6b76QICdjKrGo0v9G3qjzlvp+10W3PGL9PagiTaC
         nAMp8IPJKDRDfpm8eNMg3WVJAl7oxWbUOlhKJxAGMpp1Otk9twzCgd6WYYGSZaLKQCm5
         f6DSQNyCQ4PEi7KxnI6Syx+SuAsPYYQr6r8mZyFEtShO8SrHDAQJeEFjudjlv1qx7QTu
         mfJmiTRGvUrZBMENSVY/i6jG9flbysI652tQwE1SZaiXDhoFSAKs0RefwHP/ETPb3/Nk
         OeUGxwMvsWsOWS9TDmzwhcphOhyAdOq4RONr8GK1xGnXGUjsCj66Ga0K+lPGqH/JRkqs
         D1iw==
X-Forwarded-Encrypted: i=1; AJvYcCX8E3TaOPOvwxOiP1IB3QI5M7nl5OUUrRaUc4VQGSNilCAqGQLYxImwz0tIBgHaNbWsi6xmcuRN2eHP@vger.kernel.org, AJvYcCXNNrC72xRc8yUgLMSjd+pnv2+PMCFWygv83DOK9gmheb1pBXDrHhTJxjkvnFH7cG1W+R7a3Wkid9AN0kLU@vger.kernel.org
X-Gm-Message-State: AOJu0YwVKqncetKOADVITlDxhTZADtO2Niu5yNWDBYvZ/7xsxtuFQl2Z
	NtiXYO46DfrbLyuOOXmV7RUvNQmSrjPu5tLgSnaKAyK56CjZcHSG2Usku0yX5Og=
X-Gm-Gg: ASbGnct2KXp4N2b8djb7fTwBCbht5qAl1c0JgCkdrfz+bORM3EliI5SOGKE+B2pp3yv
	O+MG4bztH2cc+nxrDw6igusejIYwMc7IO6540gr7di9b650JYd05PxJaY2z7wwvtD2PCTiOA/UE
	o8B3hB36ey7d6hm+Uq2IAMs0XgtJUIFyGiMdV8tDfOgTSwzpYq1ZqZghMhTzGi+MbvZi1kCycEM
	gfAk5TxkSYw6VlEug8Ji1kqoyuIuqGfVTUFNBU70pTgrjJy4UaonvUM1k9hQI9RXZ1t6ZOvqTLl
	F73LmvSLhhCA+M0k7gQ6t2BDkwI=
X-Google-Smtp-Source: AGHT+IE9YBdCkNq/S4TjozYMNc2eD/oYxsI6+U8AdO2NGvsUJBfklT61ZkIl1cuk5oEXWFTnMRX1eg==
X-Received: by 2002:a17:903:2ec6:b0:21f:6ce8:29df with SMTP id d9443c01a7336-2218c3cfab6mr358683895ad.3.1740475193891;
        Tue, 25 Feb 2025 01:19:53 -0800 (PST)
Received: from [127.0.1.1] ([2601:644:8501:1640:4148:75aa:e7ad:9664])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2230a000542sm9679975ad.17.2025.02.25.01.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 01:19:53 -0800 (PST)
From: Rudraksha Gupta <guptarud@gmail.com>
Date: Tue, 25 Feb 2025 01:19:44 -0800
Subject: [PATCH] ARM: dts: qcom: msm8960: add tsens
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-expressatt-tsens-v1-1-024bee5f2047@gmail.com>
X-B4-Tracking: v=1; b=H4sIAC+LvWcC/x2MQQqAIBAAvxJ7TjBRk74SHSS32ouFKyGIf086D
 sNMBcZEyLAMFRK+xHTHDtM4wH75eKKg0BmUVEYqZQSWJyGzz1lkxshC2qCtcbM3TkPPuj6o/Mt
 1a+0DrixKuWIAAAA=
X-Change-ID: 20250225-expressatt-tsens-06d46587a584
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, wctrl <wctrl@proton.me>, 
 Rudraksha Gupta <guptarud@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740475192; l=2826;
 i=guptarud@gmail.com; s=20250208; h=from:subject:message-id;
 bh=mxjeNY/gI1DEE5UWt79KGSeGfVjKaB/ATptNamQXRwU=;
 b=G8RELbz18xURPb3s3D2SAYZXoJ8dZZ8e1UejFDFquMrE8XFzPZ9SvLdkdq48f4c5n5aDGhRsm
 Vktv5b5qCWfCeCJ0pnaO8FNRqv8QJ7YFD8n4FvTsegWQll0pHzISbln
X-Developer-Key: i=guptarud@gmail.com; a=ed25519;
 pk=5lJNaiR/Bu7edToWFLriO5zXOrVqSQWrBKbAKwuEw04=

Copy tsens node from ap8064 and adjust some values

Co-developed-by: wctrl <wctrl@proton.me>
Signed-off-by: wctrl <wctrl@proton.me>
Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
---
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 62 +++++++++++++++++++++++++++++++-
 1 file changed, 61 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
index 865fe7cc39511d7cb9ec5c4b12100404f77e2989..167953605447bfaa0d33b0e41b581220f86c72e6 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
@@ -52,6 +52,40 @@ memory@80000000 {
 		reg = <0x80000000 0>;
 	};
 
+	thermal-zones {
+		cpu0-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens 0>;
+			coefficients = <1199 0>;
+
+			trips {
+				cpu_alert0: trip0 {
+					temperature = <60000>;
+					hysteresis = <10000>;
+					type = "passive";
+				};
+			};
+		};
+
+		cpu1-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens 1>;
+			coefficients = <1132 0>;
+
+			trips {
+				cpu_alert1: trip0 {
+					temperature = <60000>;
+					hysteresis = <10000>;
+					type = "passive";
+				};
+			};
+		};
+	};
+
 	cpu-pmu {
 		compatible = "qcom,krait-pmu";
 		interrupts = <GIC_PPI 10 0x304>;
@@ -115,6 +149,20 @@ timer@200a000 {
 			cpu-offset = <0x80000>;
 		};
 
+		qfprom: efuse@700000 {
+			compatible = "qcom,qfprom";
+			reg = <0x00700000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			tsens_calib: calib@404 {
+				reg = <0x404 0x10>;
+			};
+			tsens_backup: backup-calib@414 {
+				reg = <0x414 0x10>;
+			};
+		};
+
 		msmgpio: pinctrl@800000 {
 			compatible = "qcom,msm8960-pinctrl";
 			gpio-controller;
@@ -127,7 +175,7 @@ msmgpio: pinctrl@800000 {
 		};
 
 		gcc: clock-controller@900000 {
-			compatible = "qcom,gcc-msm8960";
+			compatible = "qcom,gcc-msm8960", "syscon";
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			reg = <0x900000 0x4000>;
@@ -135,6 +183,18 @@ gcc: clock-controller@900000 {
 				 <&pxo_board>,
 				 <&lcc PLL4>;
 			clock-names = "cxo", "pxo", "pll4";
+
+			tsens: thermal-sensor {
+				compatible = "qcom,msm8960-tsens";
+
+				nvmem-cells = <&tsens_calib>, <&tsens_backup>;
+				nvmem-cell-names = "calib", "calib_backup";
+				interrupts = <GIC_SPI 178 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "uplow";
+
+				#qcom,sensors = <5>;
+				#thermal-sensor-cells = <1>;
+			};
 		};
 
 		lcc: clock-controller@28000000 {

---
base-commit: ffd294d346d185b70e28b1a28abe367bbfe53c04
change-id: 20250225-expressatt-tsens-06d46587a584

Best regards,
-- 
Rudraksha Gupta <guptarud@gmail.com>


