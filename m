Return-Path: <linux-arm-msm+bounces-49049-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4311A40E37
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Feb 2025 12:04:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 157E07AC7E4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Feb 2025 11:03:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A919F20013A;
	Sun, 23 Feb 2025 11:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AiZFE3S0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0802D1632DD;
	Sun, 23 Feb 2025 11:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740308634; cv=none; b=lKrof09iYHaGBqVaAqRnHTOfhkM4kTGbmXlq3lwR50cFJ8xzjBcr8I9INo73WaSk1pzmnyQHx3ZxWaCyncH8xVPv0qc3wih4lnmkLTCaVC/zgBJwKzaxWc8g1wkdUeAOh/sRaOH1SgvrWDysnY1A2glfHKj+A+bkHuaFVmjVZMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740308634; c=relaxed/simple;
	bh=bAQ5hGSGVZ89re8ji1HvlmJKiFzkDdDEirHv7CVdNPk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Vb+HJqhlKPzkWE6rYPxyjaNAWg7cf87dfOsOqxOGR4x58DCn270zUWuVO3qHGvBqLcBcr1Gd6fNr+bAQWDp0e8DIUhXbF6R7OKEjKc1pQOG0dymQIfsrj1t+yoYAxZCjIzFMwLg/VV+8KnLf4gJzSghYXKCPVF2KK2CXFKP6CqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AiZFE3S0; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-220f048c038so66143955ad.2;
        Sun, 23 Feb 2025 03:03:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740308632; x=1740913432; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OLEuWjtyWikPu3nVb2TAxeXog5UNG8nNjnvu0n/sL0A=;
        b=AiZFE3S0magWmaEQ3bwjNY9RIliq6z+R8eh+gjuJbMpPpXpBfXrEzHvnleayfdMG4y
         GJTxRbo6O0d8fMwnsxHX9E4zXmMaddePBlwm4Il5KGZnmjqzINgJQeZemJjn65hMMEUs
         5xwsQJm9cYfkHq3unTWbgvicPnavai5IYxFvZNVpRloKGp4Dct5t9HGYJLgzxRl+JAQj
         1oBw1vpTHC5XlcwD3m69eOoFMA36Wceqzt/U3mr30bH2ZOdrCMN3orwVP23OQfh3YFhW
         JyR4iDEq1iYfoqa89qi3m0ItYQrDFv79JQ3z0LWui3w5H8032lI+CMhOepsvlN2P7bTm
         qx8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740308632; x=1740913432;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OLEuWjtyWikPu3nVb2TAxeXog5UNG8nNjnvu0n/sL0A=;
        b=Sui5hOb130AxS50VW/ZWuvkkbPpmFkwD23jv8tLjYdGwYg4QatN272Vjn4zBLMxjfy
         BJD5aEcchN6l9BCKk1PCK8aqF+bTTfYbGl5FwkdmRpC+U9C/E2ZyO9J16m2bTrrzEEoP
         L8/4Xx+gClSK/ElWJIn0+vBDsMEJtw6VtF8Ep7YQ7nZ7HfRG828XOvX/p0WFYMFCOqw9
         ujvmUX2xbW1LULRGFp9Fzn4sJpLpke9jX4ZYTsFobbbBME0ry8GnvXXLkto1qvoHCxUs
         ymYqV54f4tX8KhIbTOlDzHsmgg82flROChmTVchmRfhsoiUO13QXeMweae7JH7lvUxry
         F/eg==
X-Forwarded-Encrypted: i=1; AJvYcCUeFHzZcbvR52XuVMgsyEC5mRH3a5H+LyaDgnbh5GHqWeaxfly6VaqMKA1WPv3Z10YT2qr8oc8ZtboM@vger.kernel.org, AJvYcCWjyo0k6j5hjI/gUN6+DC9Xhu+bEo7ag59tNz+5dZn68Q54y5EuWjLjd38OFt2R4PvdijDc2LYOVgN6OUbobg==@vger.kernel.org, AJvYcCXqvhiFmPdWIjpbgJH5LPU7UcylsA5N6/TInuUW5Gx5F8R2fXPEZlECgg2dXcBK0ikGE4469He7B3FMSHgU@vger.kernel.org
X-Gm-Message-State: AOJu0YwkJLRY7JMw79oFXdxv0QVX3zI2TnaWVfW8pnwz3lw9QAbrVip7
	B1dphDuLuNuWZoj0eHojbgThkxMllhbDjf3nhcVwOS2UOsQoRB+l
X-Gm-Gg: ASbGncuRq8IgYhKtzRFXvTXQkvz5vFzlOYWmEBFmCqAemHsln98scTu3Om+kkacMawv
	lH/TlErO//qJMreJaVK7ax7SveXMVQNoQbRq9ah/hHTX/UaG+NZoIsCo76Lhdk1ZClg1oC5ox4T
	D0dL9e2e+VjqKIpiEuoG8Co3tsWiGiT8hFimc+3mxRcQTCzB/Efw1uLbJYULU+hzFKc18tzdmNd
	JwHjXekUNsnYWXm3K2xtFOth4FCqXwbpMSjAb2GYUhL3lEZWtLgwF25SPYQQ9SdD9/tt+U6G4cj
	wnKifWwJo6qeKC6vcUJytM30
X-Google-Smtp-Source: AGHT+IF/S9i2gZR0+7cEDMzQQLWBfZXv/3CjHSKq5MWnCtcsprzNBcrfoWf3kZ0bhlkDcYXumvgx/w==
X-Received: by 2002:a17:903:2290:b0:21f:3e2d:7d41 with SMTP id d9443c01a7336-2219ff33565mr162373505ad.11.1740308632124;
        Sun, 23 Feb 2025 03:03:52 -0800 (PST)
Received: from nuvole.. ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d5591e97sm161685045ad.244.2025.02.23.03.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 03:03:51 -0800 (PST)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Pengyu Luo <mitltlatltl@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: sc8280xp: Fix clock for spi0 to spi7
Date: Sun, 23 Feb 2025 19:01:51 +0800
Message-ID: <20250223110152.47192-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enabling spi6 caused boot loop on my device(Huawei Matebook E Go),

	&spi6 {
		pinctrl-0 = <&spi6_default>;
		pinctrl-names = "default";

		status = "okay";
	};

After looking into this, I found the clocks for spi0 to spi7 are
wrong, we can derive the correct clocks from the regular pattern
between spi8 to spi15, spi16 to spi23. Or we can verify it according
to the hex file of BSRC_QSPI.bin(From windows driver qcspi8280.cab)

000035d0: 0700 4445 5649 4345 0001 000a 005c 5f53  ..DEVICE.....\_S
000035e0: 422e 5350 4937 0003 0076 0001 000a 0043  B.SPI7...v.....C
000035f0: 4f4d 504f 4e45 4e54 0000 0008 0000 0000  OMPONENT........
00003600: 0000 0000 0003 0017 0001 0007 0046 5354  .............FST
00003610: 4154 4500 0000 0800 0000 0000 0000 0000  ATE.............
00003620: 0300 3d00 0100 1400 4449 5343 4f56 4552  ..=.....DISCOVER
00003630: 4142 4c45 5f50 5354 4154 4500 0100 0600  ABLE_PSTATE.....
00003640: 434c 4f43 4b00 0100 1700 6763 635f 7175  CLOCK.....gcc_qu
00003650: 7076 335f 7772 6170 305f 7336 5f63 6c6b  pv3_wrap0_s6_clk

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index a0ef8778b..3c0ce6855 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -1260,7 +1260,7 @@ spi0: spi@980000 {
 				reg = <0 0x00980000 0 0x4000>;
 				#address-cells = <1>;
 				#size-cells = <0>;
-				clocks = <&gcc GCC_QUPV3_WRAP2_S0_CLK>;
+				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
 				clock-names = "se";
 				interrupts = <GIC_SPI 601 IRQ_TYPE_LEVEL_HIGH>;
 				power-domains = <&rpmhpd SC8280XP_CX>;
@@ -1292,7 +1292,7 @@ spi1: spi@984000 {
 				reg = <0 0x00984000 0 0x4000>;
 				#address-cells = <1>;
 				#size-cells = <0>;
-				clocks = <&gcc GCC_QUPV3_WRAP2_S1_CLK>;
+				clocks = <&gcc GCC_QUPV3_WRAP0_S1_CLK>;
 				clock-names = "se";
 				interrupts = <GIC_SPI 602 IRQ_TYPE_LEVEL_HIGH>;
 				power-domains = <&rpmhpd SC8280XP_CX>;
@@ -1324,7 +1324,7 @@ spi2: spi@988000 {
 				reg = <0 0x00988000 0 0x4000>;
 				#address-cells = <1>;
 				#size-cells = <0>;
-				clocks = <&gcc GCC_QUPV3_WRAP2_S2_CLK>;
+				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
 				clock-names = "se";
 				interrupts = <GIC_SPI 603 IRQ_TYPE_LEVEL_HIGH>;
 				power-domains = <&rpmhpd SC8280XP_CX>;
@@ -1370,7 +1370,7 @@ spi3: spi@98c000 {
 				reg = <0 0x0098c000 0 0x4000>;
 				#address-cells = <1>;
 				#size-cells = <0>;
-				clocks = <&gcc GCC_QUPV3_WRAP2_S3_CLK>;
+				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
 				clock-names = "se";
 				interrupts = <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH>;
 				power-domains = <&rpmhpd SC8280XP_CX>;
@@ -1402,7 +1402,7 @@ spi4: spi@990000 {
 				reg = <0 0x00990000 0 0x4000>;
 				#address-cells = <1>;
 				#size-cells = <0>;
-				clocks = <&gcc GCC_QUPV3_WRAP2_S4_CLK>;
+				clocks = <&gcc GCC_QUPV3_WRAP0_S4_CLK>;
 				clock-names = "se";
 				interrupts = <GIC_SPI 605 IRQ_TYPE_LEVEL_HIGH>;
 				power-domains = <&rpmhpd SC8280XP_CX>;
@@ -1434,7 +1434,7 @@ spi5: spi@994000 {
 				reg = <0 0x00994000 0 0x4000>;
 				#address-cells = <1>;
 				#size-cells = <0>;
-				clocks = <&gcc GCC_QUPV3_WRAP2_S5_CLK>;
+				clocks = <&gcc GCC_QUPV3_WRAP0_S5_CLK>;
 				clock-names = "se";
 				interrupts = <GIC_SPI 606 IRQ_TYPE_LEVEL_HIGH>;
 				power-domains = <&rpmhpd SC8280XP_CX>;
@@ -1466,7 +1466,7 @@ spi6: spi@998000 {
 				reg = <0 0x00998000 0 0x4000>;
 				#address-cells = <1>;
 				#size-cells = <0>;
-				clocks = <&gcc GCC_QUPV3_WRAP2_S6_CLK>;
+				clocks = <&gcc GCC_QUPV3_WRAP0_S6_CLK>;
 				clock-names = "se";
 				interrupts = <GIC_SPI 607 IRQ_TYPE_LEVEL_HIGH>;
 				power-domains = <&rpmhpd SC8280XP_CX>;
@@ -1498,7 +1498,7 @@ spi7: spi@99c000 {
 				reg = <0 0x0099c000 0 0x4000>;
 				#address-cells = <1>;
 				#size-cells = <0>;
-				clocks = <&gcc GCC_QUPV3_WRAP2_S7_CLK>;
+				clocks = <&gcc GCC_QUPV3_WRAP0_S7_CLK>;
 				clock-names = "se";
 				interrupts = <GIC_SPI 608 IRQ_TYPE_LEVEL_HIGH>;
 				power-domains = <&rpmhpd SC8280XP_CX>;
-- 
2.48.1


