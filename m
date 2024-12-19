Return-Path: <linux-arm-msm+bounces-42807-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0E89F7ED7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 17:05:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF8701883A15
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 16:05:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DA16226883;
	Thu, 19 Dec 2024 16:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KRn/LzPq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC602165F7;
	Thu, 19 Dec 2024 16:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734624336; cv=none; b=VzoPoVMzQoosr7Xu52BKokJJA4g20jmpbrRqSnaMt4FVwi19W2N7GGjVPK3qFGi7WaJx6jyRlwLfyFdmWeX0lhgJ6FezH0tcFRvqdv9wgjfvmPk/TRF9TFWVWFqWYdo9sSVGABusl98Uug1yLK+SiKM7ytuD7FBg59yhUDl6tpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734624336; c=relaxed/simple;
	bh=30HQjXPL9CwszPeQJkg6tvnIAkzcATAQF6HEPZrhWKc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=eSrgbQxQvViC4tCMtVHfbGg5SmPnqQqGhUxJr9HDVeSkVyJZiJwAHeyj0UrQeZqrlD1ZYibGtO5vKaryD9VyY+8UlvbcKftbNuQj8a1n5c/0VciI6B8EMZIRxZv7e24Ma9bpiUBQZFntY1exZwAZe8ZayOncUAvDIHkeJi/Uogs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KRn/LzPq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id AD144C4CECE;
	Thu, 19 Dec 2024 16:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734624335;
	bh=30HQjXPL9CwszPeQJkg6tvnIAkzcATAQF6HEPZrhWKc=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=KRn/LzPqr7BDjw7uiCbS7U9rpSW61rErqt594Otp33I56LibegVAFhqdu3/MEJBH+
	 1zvLG1LPCbfPXhgRYVgJVhyVQlfdPvUetdas0XvrhWpgLINLPu2tdFiMYnzSqMUy7v
	 wO4dsOr1uRHZnAPZZM2waMYiAlxUGfg7x4/Ty23G619z/TYRS6uPOi197qH8oDRCIK
	 mYwzd6nludSA7aLM+gdbuTNeNI+4cMKj8Qayfqidl/lFao13DWfYa7PSZzLGD1I961
	 E9DrjtHvKIKgC7oJ0xbg2i0eBTEEaGDFpG3QZvVh7g7ygRvCz3+TOFhXfAu0MVBKjC
	 WygvJn8349jNQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A854E77184;
	Thu, 19 Dec 2024 16:05:35 +0000 (UTC)
From: Anthony Ruhier via B4 Relay <devnull+aruhier.mailbox.org@kernel.org>
Date: Thu, 19 Dec 2024 17:05:08 +0100
Subject: [PATCH v3] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: Add lid
 switch
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241219-patch-lenovo-yoga-v3-1-9c4a79068141@mailbox.org>
X-B4-Tracking: v=1; b=H4sIADNEZGcC/32NQQ6CMBBFr2Jm7Rg61CiuvIdhUeoAkyBDWtJAC
 He3cgCX7yX//Q0iB+EIj9MGgZNE0TFDeT6B793YMco7M1BB1pCpcHKz73HgUZPiqp1Dc7P26gt
 XeCbIuylwK8vRfNWZe4mzhvW4SPSz/2qJ0KCtSnLc+qby9+fHydDoctHQQb3v+xfSqW6etAAAA
 A==
X-Change-ID: 20241219-patch-lenovo-yoga-17445c0a0ce2
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Maya Matuszczyk <maccraft123mc@gmail.com>, 
 Anthony Ruhier <aruhier@mailbox.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3018;
 i=aruhier@mailbox.org; h=from:subject:message-id;
 bh=uDmiSiifdArMxe2Gtww5z4PcJOuwqHEtKieS1LFlNuY=;
 b=owGbwMvMwCVW2Nrw47jsO3/G02pJDOkpLn7zm43WOgV3svQqGMy+rPPzzKMNskGXmjrD3AvOT
 K2/bZjYUcrCIMbFICumyFKyP0r4tkrHfYe1y1lg5rAygQxh4OIUgIncrWH4HxTdtC4xnPNX6rUp
 AoVp6XNePJ8Wc3Pu5xWHGR2ZbFP9+hl+MatPvlCitOz1OpmFc00NJ+1xtujYLTBx8qm51c8PCGR
 f5wUA
X-Developer-Key: i=aruhier@mailbox.org; a=openpgp;
 fpr=F4A378DD8D494AE48EBA554CB00FBC7D08D231D9
X-Endpoint-Received: by B4 Relay for aruhier@mailbox.org/default with
 auth_id=302
X-Original-From: Anthony Ruhier <aruhier@mailbox.org>
Reply-To: aruhier@mailbox.org

From: Anthony Ruhier <aruhier@mailbox.org>

Add the lid switch for the Lenovo Yoga Slim 7x.

Other x1e80100 laptops use the GPIO pin 92 only, however on the Yoga
Slim 7x this pin seems to be bridged with the pin 71. By default, the
pin 71 is set as output-high, which blocks any event on pin 92.

This patch sets the pin 71 as output-disable and sets the LID switch on
pin 92. This is aligned with how they're configured on Windows:
    GPIO  71 | 0xf147000 | in | func0 | hi | pull up   | 16 mA
    GPIO  92 | 0xf15c000 | in | func0 | lo | no pull   |  2 mA

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Maya Matuszczyk <maccraft123mc@gmail.com>
Signed-off-by: Anthony Ruhier <aruhier@mailbox.org>
---
Changes in v3:
- Changes the key order to respect the DTS coding style.
- Link to v2: https://lore.kernel.org/r/20241219-patch-lenovo-yoga-v2-1-4932aefcb9c8@mailbox.org

Changes in v2:
- Fixes patch format.
---
 .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
index ca5a808f2c7df66a861a933df407fd4bdaea3fe1..0beec4b0f3cc843d7d508e23d5037140a8d96ef6 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
@@ -6,6 +6,7 @@
 /dts-v1/;
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/gpio-keys.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
 #include "x1e80100.dtsi"
@@ -23,6 +24,21 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		pinctrl-0 = <&hall_int_n_default>;
+		pinctrl-names = "default";
+
+		switch-lid {
+			gpios = <&tlmm 92 GPIO_ACTIVE_LOW>;
+			linux,input-type = <EV_SW>;
+			linux,code = <SW_LID>;
+			wakeup-source;
+			wakeup-event-action = <EV_ACT_DEASSERTED>;
+		};
+	};
+
 	pmic-glink {
 		compatible = "qcom,x1e80100-pmic-glink",
 			     "qcom,sm8550-pmic-glink",
@@ -811,6 +827,28 @@ edp_reg_en: edp-reg-en-state {
 		bias-disable;
 	};
 
+	hall_int_n_default: hall-int-n-state {
+		lid-n-pins {
+			pins = "gpio92";
+			function = "gpio";
+			bias-disable;
+		};
+
+		/*
+		 * Pins 71 and 92 seem to be bridged together (pin 71 and 92 show the same
+		 * events). By default, pin 71 is set as output-high, which blocks any
+		 * event on pin 92. Output-disable on pin 71 is necessary to get events on
+		 * pin 92.
+		 * The purpose of pin 71 is not yet known; lid-pull is a supposition.
+		 */
+		lid-pull-n-pins {
+			pins = "gpio71";
+			function = "gpio";
+			bias-pull-up;
+			output-disable;
+		};
+	};
+
 	kybd_default: kybd-default-state {
 		pins = "gpio67";
 		function = "gpio";

---
base-commit: 78d4f34e2115b517bcbfe7ec0d018bbbb6f9b0b8
change-id: 20241219-patch-lenovo-yoga-17445c0a0ce2

Best regards,
-- 
Anthony Ruhier <aruhier@mailbox.org>



