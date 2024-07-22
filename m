Return-Path: <linux-arm-msm+bounces-26821-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4BE939490
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 22:05:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 185771C2150D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 20:05:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 371E91BC2F;
	Mon, 22 Jul 2024 20:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jA0nmIth"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0767D17BD5;
	Mon, 22 Jul 2024 20:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721678699; cv=none; b=F2OTpDvQq3rTdPsKZ28wrFDX51ikSxl7hQMKRfT17mU0yCR6EpUO3wugoWHCk2r7ZCFdx9j6DY4P5CXV7iVshAPKTttlclXGUgMREzlX7VhpwoDKQRqapvf1uNspqLtcFdZ4EdHH8D1/fSuVgIndeXWXX588Vrsm2NGr8Bxcr2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721678699; c=relaxed/simple;
	bh=t2YdM5nJS/b4/cNWsWjNtGF3P1UP8SHi6e52q4MDjCw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=TFtO84lTW92OQe5MEOrps/+4kIkPHOIWac01mVJl5uXRpBtIyvou7vOBK8s0NUSNbYBaXkVDOkX510o6IyH9Wn5W3M0GytKcHSPmYgGHDZdcPLrr23tpG1+Qs97q2E6R7gSTy919hAB+le0OyEmvO8TKnj4vl6SiO6cnmdgFyY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jA0nmIth; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 838CEC116B1;
	Mon, 22 Jul 2024 20:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721678698;
	bh=t2YdM5nJS/b4/cNWsWjNtGF3P1UP8SHi6e52q4MDjCw=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=jA0nmIthlTIcCrCcd05tAYf8x+u4AtVDyyNFxHkJxqDsYq7akRGuReQnKC0917k3I
	 TWlJ2UKpSC/wHuGvc0QwaCsFS21Len+6NGnShCBZyLSGwHUW1ADaB0L4nJj2S//03h
	 /7ZHiut45AEfhjIWwFpJrcpFTaiHK+eaoNnOkg/fGjg2zLtahmLAVCxlrvj+7e7DJ5
	 +Xz49Z3F4iiYIolyJ1jMzUTbSLB+ab08MeqVC5ejyKR5OYSiPa5vBq2fYB1sRXBCjm
	 Oxn1LAHjn8imQK60ztosjuOXzkWSG5gkS3F1/Ync1lZAC1U8fw16DbRyb65L0alVhj
	 QQgtGjdaenAdQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 746AFC3DA5D;
	Mon, 22 Jul 2024 20:04:58 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Mon, 22 Jul 2024 22:05:01 +0200
Subject: [PATCH] arm64: dts: qcom: msm8916-longcheer-l8910: Add rear flash
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240722-x5_sy7802-v1-1-b2ffeeaf8d2d@apitzsch.eu>
X-B4-Tracking: v=1; b=H4sIAGy7nmYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDcyND3QrT+OJKcwsDI12DJHOTxERzc6NUg2QloPqCotS0zAqwWdGxtbU
 Aad18LVsAAAA=
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?St=C3=A9phane_Martins?= <stemartins@proton.me>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721678722; l=1600;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=3z8QU4g8ZpdKw7PLxFkOzP4TidQn21XO47XtCji7QEQ=;
 b=llK5B0kB3/LuUytgjFAglkv3f/qqys73Jtv2UyMzwpsZ+LHSuBFqEZp0SOZSHDZSzH9y2jaAu
 gPoGY5YgEfODDo83LQ2VPCGhRqCGgszkjMoiEfpRhXmCGG4AtlSIrEq
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Reply-To: git@apitzsch.eu

From: André Apitzsch <git@apitzsch.eu>

The phone has a Silergy SY7802 flash LED controller.

Tested-by: Stéphane Martins <stemartins@proton.me>
Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
 .../boot/dts/qcom/msm8916-longcheer-l8910.dts      | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8910.dts b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8910.dts
index 3b7fdb6797a9..2cc54eaf7202 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8910.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8910.dts
@@ -125,6 +125,26 @@ led@2 {
 			};
 		};
 	};
+
+	flash-led-controller@53 {
+		compatible = "silergy,sy7802";
+		reg = <0x53>;
+
+		enable-gpios = <&tlmm 16 GPIO_ACTIVE_HIGH>;
+
+		pinctrl-0 = <&camera_rear_flash_default>;
+		pinctrl-names = "default";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		led@0 {
+			reg = <0>;
+			function = LED_FUNCTION_FLASH;
+			color = <LED_COLOR_ID_WHITE>;
+			led-sources = <0>, <1>;
+		};
+	};
 };
 
 &blsp_i2c3 {
@@ -278,6 +298,13 @@ camera_front_flash_default: camera-front-flash-default-state {
 		bias-disable;
 	};
 
+	camera_rear_flash_default: camera-rear-flash-default-state {
+		pins = "gpio9", "gpio16", "gpio117";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	gpio_keys_default: gpio-keys-default-state {
 		pins = "gpio107";
 		function = "gpio";

---
base-commit: 933069701c1b507825b514317d4edd5d3fd9d417
change-id: 20240721-x5_sy7802-0b74aa772e0c

Best regards,
-- 
André Apitzsch <git@apitzsch.eu>



