Return-Path: <linux-arm-msm+bounces-21961-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 214868FF016
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 17:12:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7330DB275F5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 15:08:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E59A1990D0;
	Thu,  6 Jun 2024 14:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c6EmfmRf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916EF197549;
	Thu,  6 Jun 2024 14:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717685253; cv=none; b=Y5wJxuu8/bEchUUImcwoXRPnwVolgmFZOlrgWP/14w23PxuJrRWhjq+BstKtf//KHH7qeDK+5AahB6vYQ6+IkHDaIU6jTbZQ+LljJmYRhw1OXZ/xtU41awUh/fDbtOdAhBIPcSEEYYjzEf91rh8aJZ1bcXx2tJ+zWdNEhIKzfRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717685253; c=relaxed/simple;
	bh=xpT4FS9NOMDZSBdsbHHC+PXphhpeO2mr4WXvX4mj0HU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=TYsiER/Tm+3wCD/1pXhwDU0DZr1a7JsPwt9GoOKJUMcqEYiD6QN2LzzjuR44sxNU8hkftBRqCWB7b7xWuenpkphKy+DSiSU4iVchQ5r+ygJAkd74lKfeyJ2gg60AGPkA//VFley6QjtErhzDMybTUCc++RRavJjBnVR3Gdxyrfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c6EmfmRf; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-35e816b735aso1155594f8f.0;
        Thu, 06 Jun 2024 07:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717685250; x=1718290050; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m3rVR4Thyo9aNwCQlgqCXd6hXabtEKHJTsbPaJcS5Vg=;
        b=c6EmfmRfgByqiI8lJ63L6FbRCHeLqJ+ZaoCrKBwzvfqqMCnBoG+yA+KomRvV6O0+OP
         ufh5XjomzyG31zLTdbN7J5Iqc5TYmqMfSiUwDMsIaA1TFVXwFWbPbijqlktikoZl3PCA
         xB9Qs95t1cZPhB9YHVi5aen9hzhKcOnA11stL8gPFR4FGHDOIdJKJRiQrCG5PrKJ0GNI
         LQm7Um72BSEPXqmWrzrjBeT6uYymITV4yxW48WVcdqiJ3j0Mnp7Tk+wfWW7eTSJexFA6
         dKJnHgUyz870xKMNWOv4tVeLeetiQXJ2YbtGCA7EYYXqY7sDE4sTRSlhl/HoeiSMKA48
         nKDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717685250; x=1718290050;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m3rVR4Thyo9aNwCQlgqCXd6hXabtEKHJTsbPaJcS5Vg=;
        b=uGMDoAr2/knOd/2Bf5/RHvNycR/PVZi9r1z65tXmhXFFmS0yp0MrIjcIiPdd98/a7B
         qeSogL0EdNytHsw0ddZDwdVgBK3yvbn0YyhEb7nAeEB7MbN9qWKEeJeQebuuFboBp+Kh
         hB82x9+pP8TMOtyzu0gYzpO7C1D2MfDj0xZrktFqQS5sSL65r7VNNheQK+/GyuL6kmRw
         9sSQ8gc60FKIkh2tf+JLvEdBj6KuQMa0BCY+69BYB1hReAhZBOA3tyKDFXltGXp4D3Y7
         e8sTFKVXtkm94NlAevZCDDPQPfYRQhbpem09SPdxfqtPEdVaDdtmGejkF8H2T0zl5y/1
         FyIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUo5KserPd0Ik2/M1kzQ8etf/uCvyhKATKWUtM8mMJVwQ0idSphSPPjjUlDLz/DdCXPoB3+x2VasayW2bIsn5pNYXlpgqIerzzgKHWPRtV/RuYwZkx6E15L9BcTecubvPm3s24SZdyTgw==
X-Gm-Message-State: AOJu0YwNPLxH5nKKHt3RYFffhIXW9ANiBIv/Sy9BM/njjYQMYtHEfVld
	vJwn5liUfTCPm5ClF/f3r9IE0FV6IhMkwBPO8ODPZ7YSou9eCNYlFnbd0cJZ
X-Google-Smtp-Source: AGHT+IEJ5sosaLGENXHCZsNFvHmechI1Fl7am07tRLUpuE2qDbgBo25pGxeSacHewsGWwOrReUBIZA==
X-Received: by 2002:adf:f2c8:0:b0:354:fb80:b515 with SMTP id ffacd0b85a97d-35e8ef65ea7mr3955508f8f.47.1717685249782;
        Thu, 06 Jun 2024 07:47:29 -0700 (PDT)
Received: from [192.168.1.130] (51B6DB6F.dsl.pool.telekom.hu. [81.182.219.111])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35ef5e989easm1739751f8f.78.2024.06.06.07.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 07:47:29 -0700 (PDT)
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>
Date: Thu, 06 Jun 2024 16:47:28 +0200
Subject: [PATCH] arm64: dts: qcom: pm660: Add rradc, charger
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240606-pm660-charger-rrdac-v1-1-a95d4da24f3b@gmail.com>
X-B4-Tracking: v=1; b=H4sIAP/LYWYC/x2MSQqAMAwAvyI5G4gLpfUr4qG0qebgQgoiFP9u8
 TgMMwUyq3CGqSmgfEuW86jQtQ2EzR8ro8TK0FM/kiGD124MYXW6sqJq9AGZaEjJjc4GC7W8lJM
 8/3Ve3vcDKNiPGGUAAAA=
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aboothahir U <aboothahirpkd@gmail.com>, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>
X-Mailer: b4 0.13.0

From: Aboothahir U <aboothahirpkd@gmail.com>

Add charger to PM660 PMIC. Readings from round-robin ADC
are needed for charger to function, so add it as well.

Signed-off-by: Aboothahir U <aboothahirpkd@gmail.com>
Signed-off-by: Barnabás Czémán <trabarni@gmail.com>
---
 arch/arm64/boot/dts/qcom/pm660.dtsi | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm660.dtsi b/arch/arm64/boot/dts/qcom/pm660.dtsi
index 98dc04962fe3..ed2c8e485cdd 100644
--- a/arch/arm64/boot/dts/qcom/pm660.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm660.dtsi
@@ -74,6 +74,23 @@ pon_resin: resin {
 			};
 		};
 
+		pm660_charger: charger@1000 {
+			compatible = "qcom,pm660-charger";
+			reg = <0x1000>;
+
+			interrupts = <0x0 0x13 0x4 IRQ_TYPE_EDGE_BOTH>,
+				     <0x0 0x12 0x2 IRQ_TYPE_EDGE_BOTH>,
+				     <0x0 0x16 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x0 0x13 0x6 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "usb-plugin", "bat-ov", "wdog-bark", "usbin-icl-change";
+
+			io-channels = <&pm660_rradc 3>,
+				      <&pm660_rradc 4>;
+			io-channel-names = "usbin_i", "usbin_v";
+
+			status = "disabled";
+		};
+
 		pm660_temp: temp-alarm@2400 {
 			compatible = "qcom,spmi-temp-alarm";
 			reg = <0x2400>;
@@ -181,6 +198,14 @@ channel@85 {
 			};
 		};
 
+		pm660_rradc: adc@4500 {
+			compatible = "qcom,pm660-rradc";
+			reg = <0x4500>;
+			#io-channel-cells = <1>;
+
+			status = "disabled";
+		};
+
 		pm660_gpios: gpio@c000 {
 			compatible = "qcom,pm660-gpio", "qcom,spmi-gpio";
 			reg = <0xc000>;

---
base-commit: ee78a17615ad0cfdbbc27182b1047cd36c9d4d5f
change-id: 20240606-pm660-charger-rrdac-e003ff9498c8

Best regards,
-- 
Barnabás Czémán <trabarni@gmail.com>


