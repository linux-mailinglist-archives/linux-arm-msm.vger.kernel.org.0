Return-Path: <linux-arm-msm+bounces-47244-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C80A2D84F
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Feb 2025 20:21:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 409C57A31C8
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Feb 2025 19:20:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 676E91A4E77;
	Sat,  8 Feb 2025 19:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YfcjDBqm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA7A4241123;
	Sat,  8 Feb 2025 19:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739042504; cv=none; b=ToCnb9CU7rNWczFmmd3yYDzgvGUzBQxyfLMvb6KmgJXuzt9qo2PXX9763NT2jJDT6ePsyPNIPhBQcC2eZwV9+FGPKULNhU1voO6TpGGac25ZiqRm/WetelKaMCi1pFR0T5wv1mvIv1UB9hUPDshvZgh/5Bhl8OEwQhY19U25rlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739042504; c=relaxed/simple;
	bh=iMXsquLiNInvf7kdoUI7ZQnK+Dak+aBaViiO4cdyBCk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Y8QhhkaSFy67+1OqTITfZBqI0GbMy7ZxxNlbwJg026ajnZcxWqRsnkRqY9lR7RU/uCAQ0ndUQxfRRbxVuRGzODCiIgCxhxnoxZHBXni0u1pPmwYsmW1BydrgI94tQ964/9HipUdRzoEwZmWTt8ZXDc2zHG5oQnxrj+mF0ogV07I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YfcjDBqm; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2fa2c1ab145so2873735a91.3;
        Sat, 08 Feb 2025 11:21:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739042502; x=1739647302; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KP726WVpnAvgA4hBisOqsFl8+0IcozWfI1ZCbgDWnEU=;
        b=YfcjDBqmyGVlDaT0MuTMtIdkCWZERxeJESdJ3ORXxwY7suA4FnQ24oucthne3TFWb9
         prK+c3KjayUY+zm7/Exa+Z8AGA4aR3LTj0LMDl0hzq3xK70xrI/mIrgWpy/gNhfMjQDY
         hAS9ZbkLu/2WvkJHYJymBx9SY/L2mxcaBr9Ik7K3gJp59YVP3eamQ+lnGnflMtl/tF1n
         x7TjzLsKqg3XPUIEJNMJUN+/asFxRxAItp9GesSuThxZlWTKjZdbKZ7fXUtimxrC4G3V
         iC6U4fRWqUVOusT0+dqLdDXwHGWEXlN+IDWoGbmkAbO8mn7LfXbpT/UbwQipp/GHhRKA
         eXdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739042502; x=1739647302;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KP726WVpnAvgA4hBisOqsFl8+0IcozWfI1ZCbgDWnEU=;
        b=Ip17IIodX0EYJNFFPmpe+/BAO0jwD/vGb6JmBwr4KcfMG9k9I/LtHe5oEzgK/ElSa8
         ssULqQU3Tqa5/C3az03stsp/HYpzIM+BCmXSq0EFUgELjJOaS4Zs5cevgO5gsAdoDNF5
         O20YyycxUt98rNUnv8SQAdPQZpEbFNU7xlRPbHhM0GyUK0wycHhJIOViL0MfKxaEjEh/
         uZmw4oOJIEN6XvVtkPhndvM89+UoZ3MyFkXdAWTiM9u6Jl8WHJriW8sR54ioApsyXR2n
         T0Qf43USm1CHJvnElKyWRaj0/ZR/wxPfxqPg/JQu+J9rl6hmE+tYxaCf2abXDmCV5+q/
         eldw==
X-Forwarded-Encrypted: i=1; AJvYcCUcJIax++v0VSCQABqUNpvbDZ1bcD9H8+rnKU83UspWn8ZVV2xT1eCeT+iHrVnAKvd4M8XIfWfG0ZeQ@vger.kernel.org, AJvYcCVqySQVjTP9gw9aJZ5xvkgwdGIQTdDnoJLei8iEOUZRNwq2F8raBgPnPVsDguxZi/N2GBLSPaEzoiEX1aYv@vger.kernel.org
X-Gm-Message-State: AOJu0Yyy9Mb2puVw2+z8g0v4PItDFUDUOJ4V27gmgpALUo9bOVSTEf+t
	N2lesGdRjB8JCxnJTf7D7FkJ1C/QpG8x3z5Vo7SWI9SaDwv2lRWG
X-Gm-Gg: ASbGncuhRtVcgy129D4Qz/QMnfgkrpe8vPS4nIEuGsaHoowCT4gqshHz3WZOOawga3X
	nXlAdrx1abRj+Yw2nwjXl6IXsFODRoDvRkZsK8qt6qXg5ao+AUZLE5ZfFec35IItUYlWEpeebli
	0mnKCn2aJ0GC6UDejKbFh9zQh1g5pLiIP+WaOGYDUszObXw43aG4G7JNRMfYWV6ynpwUW6/cdxt
	QmvPvLgxdOn8JuimYVGwJZxNUBSCHSTbGv2KyzpJ1u1sHV0QBe4/eDwbyescZ3X8OYdjBJ2z0Ox
	uEDpuhETa4gWX2+6
X-Google-Smtp-Source: AGHT+IEhPvU5kKDVx5pcbTWvsNkBC1U+XQzxE3Brhr3P+xZgT8CJQi13Vz3XzrFW7Lg1CCzAXAjjeQ==
X-Received: by 2002:a17:90b:4d81:b0:2fa:1f1b:3db7 with SMTP id 98e67ed59e1d1-2fa24272512mr14373903a91.18.1739042501989;
        Sat, 08 Feb 2025 11:21:41 -0800 (PST)
Received: from [127.0.1.1] ([2601:644:8501:1640:c33f:1f4e:5d2d:f75c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f9c316f36fsm10016327a91.1.2025.02.08.11.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 11:21:41 -0800 (PST)
From: Rudraksha Gupta <guptarud@gmail.com>
Date: Sat, 08 Feb 2025 11:21:40 -0800
Subject: [PATCH] ARM: dts: qcom: msm8960: Add BAM
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250208-expressatt-bam-v1-1-8794ec853442@gmail.com>
X-B4-Tracking: v=1; b=H4sIAMOup2cC/x2MQQqAIBAAvyJ7TjAjsb4SHSy32kMWroQQ/j3pO
 AwzLzBGQoZRvBDxIaYrVGgbAevhwo6SfGXQSvdKKysx3xGZXUpycaf0Cv1gTeeMNlCjKjfK/3C
 aS/kAc54sfGAAAAA=
X-Change-ID: 20250208-expressatt-bam-d0ed9863a626
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Rudraksha Gupta <guptarud@gmail.com>, 
 Sam Day <me@samcday.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739042501; l=2914;
 i=guptarud@gmail.com; s=20250208; h=from:subject:message-id;
 bh=iMXsquLiNInvf7kdoUI7ZQnK+Dak+aBaViiO4cdyBCk=;
 b=oNmxmYGWwb4W9GBoD0RL310se9ayZddp5PNHrRCyfTtos4JhM/d7fLklZho5Uh94IV169uk8m
 LTQIUDFhI6NAjizmU4IlR1aLgSThT2vThosnxmI8iDhHMevG8TgePH8
X-Developer-Key: i=guptarud@gmail.com; a=ed25519;
 pk=5lJNaiR/Bu7edToWFLriO5zXOrVqSQWrBKbAKwuEw04=

Copy bam nodes from qcom-ipq8064.dtsi and change
the regulator values to match msm8960.

Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
Co-developed-by: Sam Day <me@samcday.com>
Signed-off-by: Sam Day <me@samcday.com>
---
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 28 ++++++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
index 865fe7cc39511d7cb9ec5c4b12100404f77e2989..01eed68c8f89b547ff0c173b2ca85a54efa29b7f 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
@@ -275,11 +275,31 @@ rng@1a500000 {
 			clock-names = "core";
 		};
 
+		sdcc3bam: dma-controller@12182000 {
+			compatible = "qcom,bam-v1.3.0";
+			reg = <0x12182000 0x2000>;
+			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc SDC3_H_CLK>;
+			clock-names = "bam_clk";
+			#dma-cells = <1>;
+			qcom,ee = <0>;
+		};
+
+		sdcc1bam: dma-controller@12402000 {
+			compatible = "qcom,bam-v1.3.0";
+			reg = <0x12402000 0x2000>;
+			interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc SDC1_H_CLK>;
+			clock-names = "bam_clk";
+			#dma-cells = <1>;
+			qcom,ee = <0>;
+		};
+
 		sdcc3: mmc@12180000 {
 			compatible = "arm,pl18x", "arm,primecell";
 			arm,primecell-periphid = <0x00051180>;
 			status = "disabled";
-			reg = <0x12180000 0x8000>;
+			reg = <0x12180000 0x2000>;
 			interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&gcc SDC3_CLK>, <&gcc SDC3_H_CLK>;
 			clock-names = "mclk", "apb_pclk";
@@ -289,13 +309,15 @@ sdcc3: mmc@12180000 {
 			max-frequency = <192000000>;
 			no-1-8-v;
 			vmmc-supply = <&vsdcc_fixed>;
+			dmas = <&sdcc3bam 2>, <&sdcc3bam 1>;
+			dma-names = "tx", "rx";
 		};
 
 		sdcc1: mmc@12400000 {
 			status = "disabled";
 			compatible = "arm,pl18x", "arm,primecell";
 			arm,primecell-periphid = <0x00051180>;
-			reg = <0x12400000 0x8000>;
+			reg = <0x12400000 0x2000>;
 			interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&gcc SDC1_CLK>, <&gcc SDC1_H_CLK>;
 			clock-names = "mclk", "apb_pclk";
@@ -305,6 +327,8 @@ sdcc1: mmc@12400000 {
 			cap-sd-highspeed;
 			cap-mmc-highspeed;
 			vmmc-supply = <&vsdcc_fixed>;
+			dmas = <&sdcc1bam 2>, <&sdcc1bam 1>;
+			dma-names = "tx", "rx";
 		};
 
 		tcsr: syscon@1a400000 {

---
base-commit: ffd294d346d185b70e28b1a28abe367bbfe53c04
change-id: 20250208-expressatt-bam-d0ed9863a626

Best regards,
-- 
Rudraksha Gupta <guptarud@gmail.com>


