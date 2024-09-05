Return-Path: <linux-arm-msm+bounces-30976-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 247CA96DED5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 17:48:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 48AC41C24104
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 15:48:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 511241A08DC;
	Thu,  5 Sep 2024 15:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e9ZyYtsJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567E61A00EE
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Sep 2024 15:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725551236; cv=none; b=uXXvyeTWmXwRXIlmWOOSD7kNQK/xgFz4+3N4iACXhWiDR6lFVD2aJPbwVRcquq9GpcmZzWXUXfpYDml9bkPvu3LC4EXoOe+o76YDcDIBHYxKlPA6yTKieaS3QSsXLXHINJAXks89ooPS87RhtGcpw8gjDLneY0q5WitZUGW810I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725551236; c=relaxed/simple;
	bh=KUuGpMW8NKYuPsaEbqrUc/axEF5Gz67Z6Fj89bpEK2Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nxfWrAfuCqZbBKcO1qRvyaGkEL7RNTdQwy2OVgVr+OZ4dC4CBa9iz0nWvNoA4fT/kutZP658wncjqE3Es3LGJJ0Li6IxR92N+4amPzs/yRaZ+di0bVyrmn7kVImHPS+CqhqnEJjwp3I1KI/ETUNeMKPB5UKNNHxAYzNuyt4eu6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e9ZyYtsJ; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5c3c2405766so148698a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Sep 2024 08:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725551232; x=1726156032; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bP8SpDT2TDr9AwANQC/x2MBHLFmuP4RwzafqsXRNSiQ=;
        b=e9ZyYtsJfRScKqQsfJeXH7AABuxcsq7IEpbW0cnsK9J4kxptpMPitIudTi+Ug8MmM/
         CJz90XL7iyBqOcYlxnNLbUBJ8zn13yNIrRcZ2uaSl8xwoRS22wG9LCd3h3t2TfgnfIwY
         9I94jO5Q9O1xOkN2nRNrZr9snfS4MAQo0zchB53vG/EHCt9hI5wJ6Pb9gLY9idgLI6E5
         36E88LRLwqlVCN6l/lo0e5wSczngY4/evd2PMdw3vHNUB48t6TftvuO/3x2+jcCkGi1b
         EnVAVEESHIrVXTtGEYXqrIUQ5EMc9IE60sebGWdmhDf73QJAwW3dngHSE2o9HFl+JJLI
         HMjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725551232; x=1726156032;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bP8SpDT2TDr9AwANQC/x2MBHLFmuP4RwzafqsXRNSiQ=;
        b=AqFHA7kHT/pdfW1EtISAscPamzQ9pRiEB/lH6samsU95mkKiOQYbLsSbXKnRrPMezu
         Q6aPlfjiWFLFmukCkugJfxT0h+P4k5iYp8ZTAXRNHXR1lSd9GQewWoe0XjNcL9UaPFF6
         +gDoBfQOZTzssIOPuwkFsfmNAmEdzaOGxHKxuKZwHF6S5JkhkmcXB8BccO0KzzT1bKSq
         aMpESBJnZPgP8fyw8+t4eR7NIaz/dqvYPIEI/fRNUITE3I58qsFHPCpThjRcxgUQ/VpG
         Sfkc21xxKToeG9WOyMIgIbUICLvL9/v0Z8GIXJfwhfW+vjUGUwYpG6upCo1YmRPM/W8t
         hGeQ==
X-Gm-Message-State: AOJu0Yy6j6bBXJVua7GAJ7/oT27ZYiWoHoB5ivlDJY3ze4isF3D7lWO3
	nvYuw+dXJ3xeAPvmqmuJQan4aojuJg4586OK/GujgZ9xQNblqb5542hRUZ0rX7EgJZw8KJ4PYkj
	N
X-Google-Smtp-Source: AGHT+IHW7rTBxZ69zv6HoJGggPdaDM50xPXftTH9E9DXG5urnPsjfEJ9m6MDnZ41Et1jmtRRW93w6A==
X-Received: by 2002:a05:6402:35cd:b0:5be:ee5a:b3b8 with SMTP id 4fb4d7f45d1cf-5c22f8ffabemr8307488a12.3.1725551231666;
        Thu, 05 Sep 2024 08:47:11 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c3cc6a5a94sm1416858a12.90.2024.09.05.08.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 08:47:10 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 05 Sep 2024 17:46:56 +0200
Subject: [PATCH 4/4] arm64: dts: qcom: minor whitespace cleanup
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240905-dts-cleanup-v1-4-f4c5f7b2c8c2@linaro.org>
References: <20240905-dts-cleanup-v1-0-f4c5f7b2c8c2@linaro.org>
In-Reply-To: <20240905-dts-cleanup-v1-0-f4c5f7b2c8c2@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3869;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=KUuGpMW8NKYuPsaEbqrUc/axEF5Gz67Z6Fj89bpEK2Q=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBm2dJ2y4N8isA/Dc7UpNO4rYu766HNTfr5Sfgk7
 5Y7Fzq2TAWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZtnSdgAKCRDBN2bmhouD
 16p2D/4rSYbJQb5EQRXEPx9LcbI7wg9LNuq+Yrt9DklbAEG44YN54WWNRo3X2nHkE73fxU3KU0t
 DbbUWsED75H6tXEd51SD/dIyynBKsHb13LKLXre65okY8hUZ2bpMJsvT1tZJtg2lcbPeDGw4W5o
 yZw1BzLEmGA8UJMHjvHIXrYUat58ayK6lj9MaeR+0bsj8jznNOEqCW+nY5ShAHv4PW/76T4WLkK
 ebxz5xb0jE47fAvPurrszv0iHlOUsJXZBkyrJ6Bar1PKV5sjhPCgsy4fvvXSGSQoLG3IVFIvKk3
 sHX9qDyrRgRoPQbO3AWCGFZjwlba+jyimnL8HD1rV+DmU4Wdk4AwMEZWIA08l+RPBJGC5Uw3YUr
 2UaaZzTJ16psEZMVyKvmrQ0FJSGMAdGFzvg1hoqbN3ZulXVFvjvIk7aU9hlRsiezVXVpmEyvpT2
 9h2fjgjWlkW0Mx6bW/tFubFO+bu7pmnJYYSa2JJ8h0Uliy1N8SEagOv5LbhqnueDvPcNEopN7ja
 2TAUKauMXWAUTbs0EuPCUnm4ayFc4v8CgMtNbPm8Fsw9DAhXcHeZlT0kHV8kNByleLhKhVGhWpd
 vz9W2J+s5gMpUHQe5Ho554rbk5VZjuPl/7DKzTEwqE8e4c72bfn4Ljxmg5tgQmKKVfuXosG+OEC
 Lacm4GtoTKN5gVA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

The DTS code coding style expects exactly one space around '='
character.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/ipq9574.dtsi                 | 2 +-
 arch/arm64/boot/dts/qcom/msm8916-wingtech-wt86518.dts | 2 +-
 arch/arm64/boot/dts/qcom/msm8976.dtsi                 | 2 +-
 arch/arm64/boot/dts/qcom/qdu1000.dtsi                 | 2 +-
 arch/arm64/boot/dts/qcom/sc7280.dtsi                  | 2 +-
 arch/arm64/boot/dts/qcom/x1e80100.dtsi                | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
index 08a82a5cf667..14c7b3a78442 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
@@ -234,7 +234,7 @@ rng: rng@e3000 {
 		};
 
 		mdio: mdio@90000 {
-			compatible =  "qcom,ipq9574-mdio", "qcom,ipq4019-mdio";
+			compatible = "qcom,ipq9574-mdio", "qcom,ipq4019-mdio";
 			reg = <0x00090000 0x64>;
 			#address-cells = <1>;
 			#size-cells = <0>;
diff --git a/arch/arm64/boot/dts/qcom/msm8916-wingtech-wt86518.dts b/arch/arm64/boot/dts/qcom/msm8916-wingtech-wt86518.dts
index 3cfa80e38a9e..d6b03e08c34a 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-wingtech-wt86518.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-wingtech-wt86518.dts
@@ -57,7 +57,7 @@ &sound {
 	widgets = "Speaker", "Speaker",
 		  "Headphone", "Headphones";
 	pin-switches = "Speaker", "Headphones";
-	audio-routing =	"Speaker", "Speaker Amp OUT",
+	audio-routing = "Speaker", "Speaker Amp OUT",
 			"Speaker Amp IN", "HPH_R",
 			"Headphones", "Headphones Switch OUTL",
 			"Headphones", "Headphones Switch OUTR",
diff --git a/arch/arm64/boot/dts/qcom/msm8976.dtsi b/arch/arm64/boot/dts/qcom/msm8976.dtsi
index 06af6e5ec578..ed6ba4730cad 100644
--- a/arch/arm64/boot/dts/qcom/msm8976.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8976.dtsi
@@ -1193,7 +1193,7 @@ opp-600000000 {
 		apps_iommu: iommu@1ee0000 {
 			compatible = "qcom,msm8976-iommu", "qcom,msm-iommu-v2";
 			reg = <0x01ee0000 0x3000>;
-			ranges  = <0 0x01e20000 0x20000>;
+			ranges = <0 0x01e20000 0x20000>;
 
 			clocks = <&gcc GCC_SMMU_CFG_CLK>,
 				 <&gcc GCC_APSS_TCU_CLK>;
diff --git a/arch/arm64/boot/dts/qcom/qdu1000.dtsi b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
index 642ca8f0236b..6230fa39e42b 100644
--- a/arch/arm64/boot/dts/qcom/qdu1000.dtsi
+++ b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
@@ -921,7 +921,7 @@ usb_1_hsphy: phy@88e3000 {
 			reg = <0x0 0x088e3000 0x0 0x120>;
 			#phy-cells = <0>;
 
-			clocks =<&gcc GCC_USB2_CLKREF_EN>;
+			clocks = <&gcc GCC_USB2_CLKREF_EN>;
 			clock-names = "ref";
 
 			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 3d8410683402..8c8f409faf48 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -2718,7 +2718,7 @@ slimbam: dma-controller@3a84000 {
 			interrupts = <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>;
 			#dma-cells = <1>;
 			qcom,controlled-remotely;
-			num-channels  = <31>;
+			num-channels = <31>;
 			qcom,ee = <1>;
 			qcom,num-ees = <2>;
 			iommus = <&apps_smmu 0x1826 0x0>;
diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index a36076e3c56b..64be3a8ce0fc 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -3386,7 +3386,7 @@ gmu: gmu@3d6a000 {
 			reg = <0x0 0x03d6a000 0x0 0x35000>,
 			      <0x0 0x03d50000 0x0 0x10000>,
 			      <0x0 0x0b280000 0x0 0x10000>;
-			reg-names =  "gmu", "rscc", "gmu_pdc";
+			reg-names = "gmu", "rscc", "gmu_pdc";
 
 			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;

-- 
2.43.0


