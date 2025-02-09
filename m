Return-Path: <linux-arm-msm+bounces-47334-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E7FBFA2E15E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 00:09:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 94E4A164BCD
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Feb 2025 23:09:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C3732253A1;
	Sun,  9 Feb 2025 23:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JCY/vAUx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D843015B543;
	Sun,  9 Feb 2025 23:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739142556; cv=none; b=A3hHTbAsr0+6ON18fb+D6nBCX1hmPLZ02ydldwc+PhzH+hOEfIGPlSBLi5mt9o+3IX5t34EX37k9j/w0PUxTBlNXyyLOGHadkIGEeaYtLJBC1Z8WupfXlZbyNuYaiS5jjXcypIAX7yF85CvxhOJ5UZc88+uYP0iFI8ganSWRC2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739142556; c=relaxed/simple;
	bh=KMwcijjYIkqknr1RJA0AEYym4KFYUsa5FAimz5DwX2A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=d6+3LEG1n1t4t9MLjnhZyLm9b8xjV7kZVAufi45a2dTp/yGg7fadzaIt8nHCwIQH0FjXWb6oAmWAuxVE65HMsRVr4C3lCxnDN4qF/t9d9p2ZkSLD1D+hTnFemD72t1+yOTwOcYJXgyTxVkwoKRg9HrWTFr1BMWAsxGYtOvq2EwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JCY/vAUx; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-21f710c17baso17003655ad.1;
        Sun, 09 Feb 2025 15:09:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739142554; x=1739747354; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8IXi/hHsMcCmdLo1eIMLKnn5dPNL6MrIhk9hMN8gFzQ=;
        b=JCY/vAUx7mCXbr35f3zhcuMrXWuVn6zA+D0PazkmqGjFUGhKrVKFAbe9zRdpaiyo27
         WOcytDUmE6mqPBTp1fz9HgRR6qbrCcNKXetj70Y8pWoxEYbU7N1VLcRAVTIPZUuY3rG1
         lHyvLfAS347rC3/bApb9dXzfjtsxf2Tg1jce7JgeyUi7vYd/hnql8L3QwONWl9S8wQP/
         HyujD+YuungvBpGxv5Mbnu4alx8vQSmGRpQV7M0cViMj1PKeWf2GHhz9e7+y/aNQful2
         Fc3zqW5jzAGorRnxPzVLTuub6SsdXDKNU05DZIyJK/FpKmpsSQOHhFVOXkousQBBqj1J
         uwsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739142554; x=1739747354;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8IXi/hHsMcCmdLo1eIMLKnn5dPNL6MrIhk9hMN8gFzQ=;
        b=Fk+YfbcxF7azfeXXN59xp2oEM5T3tUXxzJ2ebCUkech6EjoJ1HahcwKB4FQcAaweFa
         UpBbDnkapXYt/mBdTe7836LQGqpKPWB570wiMp+2h+92JWJ/m7UBQ6o69OuzLHXD82RH
         02gkL8vFEBhPma0yDtUlcaEvEye0iXCESBoEQnJ+pzr42hgN0juirTR5UlWBy4M97pWY
         Q3P/ZDOouZIU+S+zUHhbf6ExivXSSwwCT/CFjx6VMzUgC1lA4foR+IZXw2JyGqPuZ5nQ
         M47UoUQtSOUtjBaQnY/L8LR21/r7w7RPdst6QFVvB5nWqoVFFoa3L/YUcxxY4bf9gQby
         8mgg==
X-Forwarded-Encrypted: i=1; AJvYcCUrXvgTHIPxp8zgVT3tQ7lsRBc1+V/IaS/F4zf4IIh1cS2AqqfJWCZREaq6Urc/pb+GTB6yGF5JKwPg@vger.kernel.org, AJvYcCWwjgujQDeKxnyW94ahxHNqkLZ8beZMaehsXVS5CkVEYKc8h+FJn1Mehob6p7bv12H0TmWEy1C92YwPvTuN@vger.kernel.org
X-Gm-Message-State: AOJu0YwFah24JAyOe6+dB0TGK7YzpjNieNawrXA2TLAprPrGNqjWYuXH
	fhsOXiF5DXzs0rnsFWneJUO4jid2DElr5I3yAu67eqmB99z2KWuqs24XCUqsDzM=
X-Gm-Gg: ASbGncsbVTyTldosy6WEz5hvKOmJqeVos4drdACpcdaccbi0VaTeufJ3oH5/WOYIc+d
	q2/G/wO5pFGPGL4QQ9GaFF95NQjFZ8bbClkjW7NTatk8G02YJIu+W8t4Bo8YBXfjTZpCOclO3PT
	+c82ceLL36AcpWcd8g8ZAycIWirrmchDoVhVcgXEEKT4unxC1I68DrOSY9pULEIN+3ar9N+6NF/
	76wt6HE1u3fSjdTiqobQ9cfNK005qxnzESirpQzyH2gEwwbuklN++4KUYNy51ME7wxeG47XDIbj
	dep89PrVCMc+XG6v
X-Google-Smtp-Source: AGHT+IG8CZzMIDmmfTQmrntPKFgrkV3pAYVih+6B/kUePdRSYaxfp4Xv1f/QqdB/6Wme9vMTYrozhQ==
X-Received: by 2002:a17:903:2309:b0:21a:8382:fcbb with SMTP id d9443c01a7336-21f4e700f9bmr190696555ad.25.1739142553719;
        Sun, 09 Feb 2025 15:09:13 -0800 (PST)
Received: from [127.0.1.1] ([2601:644:8501:1640:bbd6:1924:5148:8562])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fa09b3f803sm7276350a91.32.2025.02.09.15.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 15:09:13 -0800 (PST)
From: Rudraksha Gupta <guptarud@gmail.com>
Date: Sun, 09 Feb 2025 15:09:12 -0800
Subject: [PATCH v2] ARM: dts: qcom: msm8960: Add BAM
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250209-expressatt-bam-v2-1-e6c01c5d8292@gmail.com>
X-B4-Tracking: v=1; b=H4sIAJc1qWcC/3WMyw6CMBBFf4XM2poyPCyu/A/DopYRJhFqOk2DI
 fy7lb3Lc2/O2UAoMAlciw0CJRb2SwY8FeAmu4ykeMgMqLHRqI2i9R1IxMaoHnZWg6ahM21lW2w
 hS/l88noE733miSX68Dn6qfytf1OpVKUyl64mZ5qqrvE2zpZfZ+dn6Pd9/wL5Lgw2rAAAAA==
X-Change-ID: 20250208-expressatt-bam-d0ed9863a626
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sam Day <me@samcday.com>, 
 Rudraksha Gupta <guptarud@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739142552; l=2712;
 i=guptarud@gmail.com; s=20250208; h=from:subject:message-id;
 bh=KMwcijjYIkqknr1RJA0AEYym4KFYUsa5FAimz5DwX2A=;
 b=9VEVuyzfKKohphvy1jz3yYwfVgCgvJPj7hN674TgkUMval7Oz8eBffBF53blCFYHLAOXc8D4b
 CjLLrNcbAUuClTWo+u7YP2qnAJWOBtHGMrGjDryM5Tv4or23v0CCAUw
X-Developer-Key: i=guptarud@gmail.com; a=ed25519;
 pk=5lJNaiR/Bu7edToWFLriO5zXOrVqSQWrBKbAKwuEw04=

Copy bam nodes from qcom-ipq8064.dtsi and change
the reg values to match msm8960.

Co-developed-by: Sam Day <me@samcday.com>
Signed-off-by: Sam Day <me@samcday.com>
Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
---
Changes in v2:
- Reorganize sdcc{3,1}bam to be after sdcc{3,1} respectively
- Link to v1: https://lore.kernel.org/r/20250208-expressatt-bam-v1-1-8794ec853442@gmail.com
---
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 28 ++++++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
index 865fe7cc39511d7cb9ec5c4b12100404f77e2989..a5ef9269b78b25b404e1ab11e6eff2639f16b446 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
@@ -279,7 +279,7 @@ sdcc3: mmc@12180000 {
 			compatible = "arm,pl18x", "arm,primecell";
 			arm,primecell-periphid = <0x00051180>;
 			status = "disabled";
-			reg = <0x12180000 0x8000>;
+			reg = <0x12180000 0x2000>;
 			interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&gcc SDC3_CLK>, <&gcc SDC3_H_CLK>;
 			clock-names = "mclk", "apb_pclk";
@@ -289,13 +289,25 @@ sdcc3: mmc@12180000 {
 			max-frequency = <192000000>;
 			no-1-8-v;
 			vmmc-supply = <&vsdcc_fixed>;
+			dmas = <&sdcc3bam 2>, <&sdcc3bam 1>;
+			dma-names = "tx", "rx";
+		};
+
+		sdcc3bam: dma-controller@12182000 {
+			compatible = "qcom,bam-v1.3.0";
+			reg = <0x12182000 0x2000>;
+			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc SDC3_H_CLK>;
+			clock-names = "bam_clk";
+			#dma-cells = <1>;
+			qcom,ee = <0>;
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
@@ -305,6 +317,18 @@ sdcc1: mmc@12400000 {
 			cap-sd-highspeed;
 			cap-mmc-highspeed;
 			vmmc-supply = <&vsdcc_fixed>;
+			dmas = <&sdcc1bam 2>, <&sdcc1bam 1>;
+			dma-names = "tx", "rx";
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
 		};
 
 		tcsr: syscon@1a400000 {

---
base-commit: ffd294d346d185b70e28b1a28abe367bbfe53c04
change-id: 20250208-expressatt-bam-d0ed9863a626

Best regards,
-- 
Rudraksha Gupta <guptarud@gmail.com>


