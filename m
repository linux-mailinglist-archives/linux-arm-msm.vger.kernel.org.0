Return-Path: <linux-arm-msm+bounces-42802-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB8A9F7E58
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 16:49:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 179F7166939
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 15:49:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51A45225768;
	Thu, 19 Dec 2024 15:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s2kXW96h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2285781727;
	Thu, 19 Dec 2024 15:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734623346; cv=none; b=B/Of7Kyrt0Vol541ayqLgUXdyxkCN83Dv8kb0kCRdT7JmsHWifcjwGxgxHLzFAF3IwjTKhhLPqvVfwoGh6oboGL+5bIjDpTyrsYVQAPp3/Lb3/NIxvRKAQwz3PM42vCtBePtmJirvf+Xbck0WY6H0hRUlLBSBF7E0VB5RWuY5gE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734623346; c=relaxed/simple;
	bh=Q9EatBeXOgnS8u4CAtiI0yDyAfkFtckFF3q/C/FAGr0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=UUYz52J08ioiI/q2HYJyahrcv1cKTfQcbQ/ad5RxjOi9pMgHmkq+apr6oLOJiq0maIQflSWwAE9Jov+OFbHVByUDtoJq5xxOuFJi+Vgq2DPFuA7lOGbu/TvHUDoH/ZS9nxXmerY/iD2Xp/3H8v5778dgcierZWW6zVItywy+TEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s2kXW96h; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 90578C4CECE;
	Thu, 19 Dec 2024 15:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734623345;
	bh=Q9EatBeXOgnS8u4CAtiI0yDyAfkFtckFF3q/C/FAGr0=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=s2kXW96hP5WBezLGckf4H0JzcvizzFjgDg5QfuAaJg6PH7Jv7h92VqIgIqzGn1E8O
	 VTODPvvGW6PwNuWJ1mdBsjI2+8jvQ9swB8EN3k8U+2xX8kpSufmFLgQew9UYCOyxZw
	 FKzGvORdBp+TEh8HpLAZtYVB+X0kaSwWi9fia3hqU5VKdXMfpnB7ET5cdWU+Ty0GFI
	 Po39KEg7s4pRaCbRaYLX38E3PaPU2VpMSAsAP315pxYPlohsux5yYR7xU6wgAVaFe2
	 esKXTb+0YLn0Q+1KLUKRTYiQtayaDgHiKpwmtgBcrO8tkNYO8GoNUFOZIf44Ubud2j
	 k51y03fTeGYwA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81826E77184;
	Thu, 19 Dec 2024 15:49:05 +0000 (UTC)
From: Anthony Ruhier via B4 Relay <devnull+aruhier.mailbox.org@kernel.org>
Date: Thu, 19 Dec 2024 16:49:04 +0100
Subject: [PATCH v2] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: Add lid
 switch
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241219-patch-lenovo-yoga-v2-1-4932aefcb9c8@mailbox.org>
X-B4-Tracking: v=1; b=H4sIAG9AZGcC/x3MQQqAIBBA0avErBvQwYi6SrQQm3IgNDSiCO+et
 HyL/1/InIQzjM0LiS/JEkMFtQ04b8PGKEs1kCKjSQ942NN53DnEK+ITN4u6N6ZzyirHBLU7Eq9
 y/89pLuUD0SiCVWMAAAA=
X-Change-ID: 20241219-patch-lenovo-yoga-17445c0a0ce2
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Anthony Ruhier <aruhier@mailbox.org>, 
 Maya Matuszczyk <maccraft123mc@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2730;
 i=aruhier@mailbox.org; h=from:subject:message-id;
 bh=TTMO6JsOBuxC/vkZ9rwpeM21isvIooWgkodHAdZY6GU=;
 b=owGbwMvMwCVW2Nrw47jsO3/G02pJDOkpDgVtahl7TtuZb3k67aY7i/IbuVcb1h6u1I/7dKqFp
 fL55yrDjlIWBjEuBlkxRZaS/VHCt1U67jusXc4CM4eVCWQIAxenAEyEwYzhn8HcSxtjVh65vd+q
 n6X1lzbD2cjFnXfyDoRsXLFswcV49lWMDD1Oq7asmdoa+4i/ZqXKs+VChgs1c6S3SqTfeJuS6VO
 9kB8A
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

Signed-off-by: Anthony Ruhier <aruhier@mailbox.org>
---
Changes in v2:
- Fixes patch format.

Tested-by: Maya Matuszczyk <maccraft123mc@gmail.com>
---
 .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
index ca5a808f2c7df66a861a933df407fd4bdaea3fe1..311202aa9015a30f1d70108bb214d427f811dc3b 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
@@ -6,6 +6,7 @@
 /dts-v1/;
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/gpio-keys.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
 #include "x1e80100.dtsi"
@@ -19,6 +20,21 @@ aliases {
 		serial0 = &uart21;
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
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
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



