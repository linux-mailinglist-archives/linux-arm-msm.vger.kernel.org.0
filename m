Return-Path: <linux-arm-msm+bounces-40378-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3E69E46C6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 22:35:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E7C29162FFF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 21:35:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E28061B3955;
	Wed,  4 Dec 2024 21:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KxAtkHwP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F311946B3;
	Wed,  4 Dec 2024 21:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733348113; cv=none; b=PygTLvgDUWv2Bzh4lkqs6v6wwhe4eyLF3cQwftLok0v7cNEiFAAcEtbshurTnCRo5GIa19ECO5U7g091oEFsGn5kFwEbknBq5Js7wRV1IW/meYsMpGi3amvYk753EgOZzee6SWiqH9kYdXyyPHuuBXxcjjOAJMm6/RQn6uG0loU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733348113; c=relaxed/simple;
	bh=kROiM94VR9bhs8unDDPxON/vPAmMB0+SlnxeyQ097mk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V0Ya/Y0v9vzxoPiT+Q9tz6FARjpQIf+kzEN1Zv6sqddx95/MnB0qgZ/F7mHCBOEinEqmsIL7elOfWgu77y456FZOMXQNQU5DMooBfiU7h98sTZVxUgpRjyBh49QYsvSbPC2UN2p8Tg8U9UQA5iw9r4Aq8wT+zhy+/litZJL6cLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KxAtkHwP; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a9ec267b879so34654466b.2;
        Wed, 04 Dec 2024 13:35:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733348110; x=1733952910; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1MK9kM+QUYt759u7IDiYEjfkhyjIYyif4Y9G/TxZStg=;
        b=KxAtkHwPZ3mp875FfuzpsonCem7m8Qeddk2dvtG9osV8oWLWylW1Iveo6XkSknTyy1
         UAXFSSlKddVgiaAeGv9Sys2Ixeo0A60gCml5ExnsbRjJ9lxY2mF3HoCbsqjJecFdbNTn
         IeyAdFhkYq/f7HbZKbAL8gTFhfAL5Uj5cl/yfo8ezWaStgTp92xDYi9yT6Iz5lCaOgS6
         lvwCozGKZ8wzxAswQd6A3m//yXlR2dq2uYLoOUqr8yXa7fnT/g5tnpP5xWoFASS//fl1
         rivKfodXtT3SaxUp9Bzr2DwyrtpYJU0LkLsAbiuTIJ2YcMJFa1NxAfPHHhGCJTlMrKKA
         C8JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733348110; x=1733952910;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1MK9kM+QUYt759u7IDiYEjfkhyjIYyif4Y9G/TxZStg=;
        b=uUeH/hE3PhJgovvfUhs1+4I6R2+qfHp/qoj2UpZEwrU3IxK7za9T9eNqKGkr+vhxqd
         A+G2WcSUaPTP0x8m8tx+rODaX7nCf29CfVftYUealD9+P6YwGzk1qig2T0pLNtUlwYEM
         eCVPg3mLDlsrsGvu4DvurJXS1cOn5yooOVKzc8W8vfkHXISP2EIvrRmqWBViwra4jGR8
         gzndcaWRMzXGZElMnQiJN/CQXC0+VFEbn/EUw1TEz4wERWBTVuj/HXGH7aGAnyiz7zcU
         za/VCkpiBOqLG9UC0D5u3mujLPHh9f8FSpE/9b5nL5o6OijgiEh69as36+biOtw6Vq83
         wwgg==
X-Forwarded-Encrypted: i=1; AJvYcCV30VMN/GlH89IGE3eB1tBbuz7a8qIdLNUiEr61khlTOacp+Q8k6nP6ZW7SzM0CIY1E4CDaqFMrOKx9fI8=@vger.kernel.org, AJvYcCV7Khnwqq8S/jyMTflPutgPRz2BDVW1B5kWPhs029UjGAgKh/IvmdAdjGgKXiwYUCtgoRQTffusQQlPsUMW@vger.kernel.org, AJvYcCXZ+02gNZmwAxA6IdJYmc8mk8Vf92eB/MTc8S1M824KbtJCf3vITHRFEih12f8ghpXiebZh5qbGNDVX@vger.kernel.org
X-Gm-Message-State: AOJu0YyVTtlYc0TbfMfKDhZqFFL4ysmaaAqfw/pcE6rfXqqo0BJJpxVL
	ZEaqjUCMPEaIp2TVPLum5ltI+2WcwY2EnHnJMR+XsU4sXFHAKwu50/eQag==
X-Gm-Gg: ASbGncv/xFUCJWYpPFmys8RjAWpER/r+y3NGTN2vXaMKcvmFXJkP76I68FZOWc2Znue
	cjBbc5C5QRbJvxdvQLSGZdsRjn/NIMY6dvQDcrqjt5UBr0YRJRen0YSY96f8QjNnrE7FCbrabFX
	03SHU0Xz4Buq7IykGYKvCGQaUufDIcngtXCtssdRImuG8kQF7D79r3r9sRe5t3fehKevB70lSEG
	4lqu30GBQQ+J2bD/slalBfalY84HG5Tw3FrXXtaZFz9F5Dd
X-Google-Smtp-Source: AGHT+IFczzHm/8Qo57m7Hv4iW6tCxe2+aKwQwsavJDV6CBwTUeSvsUhDCx/W1/hLzAOoNJE5vS52ig==
X-Received: by 2002:a17:907:783:b0:a99:f6ee:1ee3 with SMTP id a640c23a62f3a-aa5f7f24766mr915947666b.43.1733348109840;
        Wed, 04 Dec 2024 13:35:09 -0800 (PST)
Received: from [127.0.1.1] ([46.53.242.72])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-aa62601b5ddsm4506966b.118.2024.12.04.13.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 13:35:09 -0800 (PST)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Thu, 05 Dec 2024 00:34:50 +0300
Subject: [PATCH v7 03/14] arm64: dts: qcom: sdm845: enable gmu
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241205-starqltechn_integration_upstream-v7-3-84f9a3547803@gmail.com>
References: <20241205-starqltechn_integration_upstream-v7-0-84f9a3547803@gmail.com>
In-Reply-To: <20241205-starqltechn_integration_upstream-v7-0-84f9a3547803@gmail.com>
To: cros-qcom-dts-watchers@chromium.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 Dzmitry Sankouski <dsankouski@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733348104; l=5144;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=kROiM94VR9bhs8unDDPxON/vPAmMB0+SlnxeyQ097mk=;
 b=3d8wrEfYC+slUHuwSCZnk+h2S7BFi+qmEo3HfAlDBmYMB1xu/3uQT/L3j8tGhCeTd2fSVnmYV
 NkFLuHD0RodCIwWvK9XXhcLj3Lg5gn17u+ut3ueoaOwqQUdd+575At1
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

Leave gmu enabled, because it's only probed when
GPU is.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
Changes in v5:
- delete gmu node from sdm850-lenovo-yoga-c630
  (it's imported from sdm845.dtsi)
---
 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi                   | 4 ----
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts                   | 4 ----
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts                      | 4 ----
 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi          | 4 ----
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts            | 4 ----
 arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi        | 4 ----
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi | 4 ----
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts           | 4 ----
 arch/arm64/boot/dts/qcom/sdm845.dtsi                         | 2 --
 arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts         | 4 ----
 10 files changed, 38 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
index 743c339ba108..b7e514f81f92 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
@@ -741,10 +741,6 @@ touchscreen@10 {
 	};
 };
 
-&gmu {
-	status = "okay";
-};
-
 &gpu {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index 1cc0f571e1f7..92f8cc7e2fed 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -444,10 +444,6 @@ &gcc {
 			   <GCC_LPASS_SWAY_CLK>;
 };
 
-&gmu {
-	status = "okay";
-};
-
 &gpi_dma0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
index 2391f842c903..d31efad8a321 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
@@ -414,10 +414,6 @@ &gcc {
 			   <GCC_LPASS_SWAY_CLK>;
 };
 
-&gmu {
-	status = "okay";
-};
-
 &gpu {
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index 46e25c53829a..8a0f154bffc3 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -345,10 +345,6 @@ &gcc {
 				<GCC_LPASS_SWAY_CLK>;
 };
 
-&gmu {
-	status = "okay";
-};
-
 &gpu {
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
index 486ce175e6bc..87fc4021e024 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
@@ -419,10 +419,6 @@ &gcc {
 			   <GCC_LPASS_SWAY_CLK>;
 };
 
-&gmu {
-	status = "okay";
-};
-
 &gpu {
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
index b02a1dc5fecd..a3a304e1ac87 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
@@ -415,10 +415,6 @@ &gcc {
 			<GCC_LPASS_SWAY_CLK>;
 };
 
-&gmu {
-	status = "okay";
-};
-
 &gpi_dma0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
index 617b17b2d7d9..f790eb73abdd 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
@@ -239,10 +239,6 @@ &gcc {
 			   <GCC_LPASS_SWAY_CLK>;
 };
 
-&gmu {
-	status = "okay";
-};
-
 &gpu {
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts
index e386b504e978..501575c9beda 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts
@@ -381,10 +381,6 @@ &gcc {
 				<GCC_LPASS_SWAY_CLK>;
 };
 
-&gmu {
-	status = "okay";
-};
-
 &gpi_dma0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 1ed794638a7c..e9d5565b52e2 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -4948,8 +4948,6 @@ gmu: gmu@506a000 {
 
 			operating-points-v2 = <&gmu_opp_table>;
 
-			status = "disabled";
-
 			gmu_opp_table: opp-table {
 				compatible = "operating-points-v2";
 
diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
index f18050848cd8..ca81f3664abd 100644
--- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
+++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
@@ -355,10 +355,6 @@ &gcc {
 			   <GCC_LPASS_SWAY_CLK>;
 };
 
-&gmu {
-	status = "okay";
-};
-
 &gpu {
 	status = "okay";
 	zap-shader {

-- 
2.39.5


