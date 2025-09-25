Return-Path: <linux-arm-msm+bounces-75186-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 76028BA13A9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 21:39:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 493A57BAE5A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 19:37:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAF5731DDB8;
	Thu, 25 Sep 2025 19:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jUV3oltr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E48FD31D723
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 19:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758829128; cv=none; b=Unxl1l4j78/zEgTKUBLGbia7YbyrpDYLTOHWnZQimE3OzEqqCw5QvX1YAkMDAntaRFYCEJ292QxB/C7Ad3uTkejEkxpUz1nw1wQ9ATSK17HiBVzsOJyA1T61kj5OwsgHZUvRvBdeZLq6Ry/Fu3MAb0LszpQz1yHX/feAl8tkEzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758829128; c=relaxed/simple;
	bh=dVbJZqbx8Eys3tgEwO5LcQs4Xy1WsMcwLflFeobXXmQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TPPB46P/qVqvGIxWaRdy0wL1Jp8szP0OZmCTWG++uYClDOp8R96Ix3DtfD2TUNOtZt6/wJkGdEdUi0EImjf8Ub68JBfcdUNBf6DJDwIPlCnKS6NWvZ7oyqxpiOGk6GpdWb1p+DhEtGaQFOCdBwWsESkehJ2wR6oExxAEXlsqQhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jUV3oltr; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-62ec5f750f7so2158984a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 12:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758829125; x=1759433925; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZtIsrQ2ambOQN/Zv6YQaNMBcFiHnqO9loLrmuJgo088=;
        b=jUV3oltrwUXZm38MTEIRWSI8VtZIXCll7wweuPnNq1XegHzyHKcfkY4hSSRSBr47do
         9b9bVBcaLiTuLo3VMx7iFPyaxd+AB77LEL84ONJ0arjKwv3alwX3NZSGHDPali3EZwfO
         2ArUHDMiR7SF2UVAqW9PxV3th4Z8q7SGJ8yQ2Ky3CpR95izuEkblKB4eFqGy9kKF9K4h
         pOBV55ggNcXXNgS8C64vbstWsh1j/WCIj+G7sIq3lFrO3IGEXqyUK1JH7N2+2KqSePh9
         P8JhVGtXFUbdVdiaCXj9Qr+/zrrFca/k1JO3lefDQN+QF71MeIaeuJkMVH582D9kA0LZ
         3s/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758829125; x=1759433925;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZtIsrQ2ambOQN/Zv6YQaNMBcFiHnqO9loLrmuJgo088=;
        b=dYotP0gkef/lXZ+bWiZ/p8RWJhDIX6LWWasXo/rZm2oHez1QOpo3ApcYgdsR6X9bMz
         DHi07azYHE1Iv8HalEc0QBCz3NjvnvFDEEZ26CktKijeSZ27Ml0yvKabylr33Sn/Uurg
         dgBzhbX37oA30NzLIwdfgtCFdszHnM41snWCpq6wPB7L7a6yD4sXjNW6p8UYyumD+1oq
         FGhCfwRVmgsrgmz09x/NoqYA0x+Yi6Vg6tEi4biBVOkAdVyPmFzh9WP1gY+MX0RuDlfs
         Wkdtla/fPerV5VROkUskETQM3YxwTA8CpUlf46NW2YbNmwf90KXe8gRZ6BijbVy8DOEI
         lccg==
X-Forwarded-Encrypted: i=1; AJvYcCUFjLQ5CohrNCTLmjqejRd4imUtkZTE5qboUUxri60Nfv8E5pC3f5/0v4OVlZvFbV32oTYtjM++B+399qU/@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5ZmCWTe0BZZlneuUXOORHs2S9LeJ3LSVpTFL4NPUcV/5H65YO
	bpUhBSoVcZPaA8mc4a/qbqhR4z9AKHe2tNSGOFjRSO/tjbaLPqa6/G2GXZbCsA==
X-Gm-Gg: ASbGncu0u/nFLp2y0jzvKDRaatiY5hONBWxPhku6EG/E+N8ta3bj37v993UBjaEodrs
	JgQErHRaTgdsJb7dJSX74g6zkgGMuLVqyFtcvZ493lS+ECKtu/eumAzFOGdZ+2kP3t+XbsLM+JE
	58S0tYqyftUe7lWL5PpT5Wqz7XrvrkbU9oP0d153ofVylC8PH/LyKX50rs1JJKBQSSSnRfJ/qht
	AWFoyZupWihI4bghsaVA72ButvpIZWHQk0vLC6QW5gSD9L6cSvg3MXIZ0s05dxdudoK25bkEfqS
	3SWkkHa0YMkoWJLU/8B8y9S9Vis9uITAllleAGK30Z/NAdFXWi7SWVVWb6cjPaT5Ty0QD3Xjo6H
	SNZktm3ikvLDMGtIIIKLr
X-Google-Smtp-Source: AGHT+IGIaoI0QIGsptEmy/zUDPGWEwozC0jFD+1UjA2IM++0FbcXdq1jKF7H9wPnN5ACaE4kEPmI+w==
X-Received: by 2002:a17:907:96a1:b0:b07:c1df:875 with SMTP id a640c23a62f3a-b34bd444342mr547091466b.56.1758829125020;
        Thu, 25 Sep 2025 12:38:45 -0700 (PDT)
Received: from [127.0.1.1] ([46.53.240.27])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-b353efa4c35sm222820766b.26.2025.09.25.12.38.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 12:38:44 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Thu, 25 Sep 2025 22:38:38 +0300
Subject: [PATCH v4 2/3] arch: arm64: dts: qcom: sdm845-starqltechn: fix
 max77705 interrupts
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-starqltechn-correct_max77705_nodes-v4-2-93b706bdda58@gmail.com>
References: <20250925-starqltechn-correct_max77705_nodes-v4-0-93b706bdda58@gmail.com>
In-Reply-To: <20250925-starqltechn-correct_max77705_nodes-v4-0-93b706bdda58@gmail.com>
To: Chanwoo Choi <cw00.choi@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758829121; l=2156;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=dVbJZqbx8Eys3tgEwO5LcQs4Xy1WsMcwLflFeobXXmQ=;
 b=mVEtkmNzsfTC01FP2fTvSRSvf7ttZJ0Q0FdpjVqxp4AtggXQFuRoBmOlN15PMhn+y2RP5fiZQ
 VVW40DjkNSbDznm8s3L4ldoiHKEgqGOTBhNNEtRGuOdn+JfRaPZyBkF
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

Since max77705 has a register, which indicates interrupt source, it acts
as an interrupt controller.

Direct MAX77705's subdevices to use the IC's internal interrupt
controller, instead of listening to every interrupt fired by the
chip towards the host device.

Fixes: 7a88a931d095 ("arm64: dts: qcom: sdm845-starqltechn: add max77705 PMIC")
Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
Changes for v2:
- fix commit message to be more clear

Changes for v2:
- fix commit msg header prefix to 'arm64: dts: qcom: sdm845-starqltechn:'
- remove binding header for interrupt numbers
- make interrupt-cells 1, because irq trigger type is not used
---
 arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
index 45c7aa0f602d..41c93c801703 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
@@ -599,13 +599,15 @@ &uart9 {
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
+		#interrupt-cells = <1>;
 
 		leds {
 			compatible = "maxim,max77705-rgb";
@@ -644,8 +646,8 @@ max77705_charger: charger@69 {
 		reg = <0x69>;
 		compatible = "maxim,max77705-charger";
 		monitored-battery = <&battery>;
-		interrupt-parent = <&pm8998_gpios>;
-		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-parent = <&max77705>;
+		interrupts = <0>;
 	};
 
 	fuel-gauge@36 {
@@ -653,8 +655,8 @@ fuel-gauge@36 {
 		compatible = "maxim,max77705-battery";
 		power-supplies = <&max77705_charger>;
 		maxim,rsns-microohm = <5000>;
-		interrupt-parent = <&pm8998_gpios>;
-		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-parent = <&max77705>;
+		interrupts = <2>;
 	};
 };
 

-- 
2.39.5


