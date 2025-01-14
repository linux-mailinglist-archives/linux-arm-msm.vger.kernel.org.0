Return-Path: <linux-arm-msm+bounces-45016-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 83520A10902
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 15:19:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 281E21886F91
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 14:19:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88C661448C7;
	Tue, 14 Jan 2025 14:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jtxP+45+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CABF13212A;
	Tue, 14 Jan 2025 14:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736864338; cv=none; b=FcBTTM1/RExYo9i0vg9LGpvknxW1IHsBAbDPA6c4Ztm2HyyCKOqoPYWVlVFs6Tn9V2d4uRCBe5XGUCAzAgfl/OUSNZ2RqoPE1Tz8ictAi4yu3flAw5RRaV1nMmRVdwWbpDBbJWFVqIKoEPHzb3JV+ZrvuYdB/4s2XnX2mhQj6B0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736864338; c=relaxed/simple;
	bh=PdLXMpw6mCU+0JWw02u7MvqnmujtMCIwWZO18hYjTB0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KBhaN1XSV1Zvz5g6cIV941PgtRYCl0X1DBqKggFfoRO6O/QcIfqq4ZgRmpQy4GBy/jKd9fo3WZHgjTPc2LqNGSB34VNn2StEEpki1JLe4JhWYIAIRUrQS4W080XTHyh8hnM9KR2k5uhsQ9mXqB54V1l3qfdANIAaOktpRE3u+YU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jtxP+45+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 147D1C4CEEA;
	Tue, 14 Jan 2025 14:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736864338;
	bh=PdLXMpw6mCU+0JWw02u7MvqnmujtMCIwWZO18hYjTB0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=jtxP+45+YLcInoRFZgZw5jvX3sdHsRxvXIHNgpsPMIySFpugtmpLkXA2ZpfTx/Tpr
	 GUYEayl7kkp1EOdySqynrGaUArUcaULz2ZoPMTeqsAdOzvTITbuU8HSx3JlpRq9Rvc
	 IG5OGx2Ivty+rVPPlLwgsB/pz+SY1XHkkwoXq1cR8orPyl1fW/h6qrBN3K9Wi+DWIC
	 nvVoQBnpLciLkHOI5HVL1vWffZOyrSFfWZP3rSfCIsiu7ADE3lW1xK+47tWPOg08b5
	 iUEFvEH2pHk5NPtvGcnoYtNuswVkvD/WoV6xQOu7kI23Kk/RlXI5KfIHfXjDEjKInl
	 3WTno3xEaJoWw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BD26C02185;
	Tue, 14 Jan 2025 14:18:58 +0000 (UTC)
From: Ricky Cheung via B4 Relay <devnull+rcheung844.gmail.com@kernel.org>
Date: Tue, 14 Jan 2025 22:18:57 +0800
Subject: [PATCH v2 3/3] arm64: dts: qcom: msm8916-xiaoxun-jz0145-v33: Add
 initial device tree
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250114-xiaoxun-jz0145-v33-v2-3-8b42f77badfa@gmail.com>
References: <20250114-xiaoxun-jz0145-v33-v2-0-8b42f77badfa@gmail.com>
In-Reply-To: <20250114-xiaoxun-jz0145-v33-v2-0-8b42f77badfa@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Ricky Cheung <rcheung844@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736864336; l=2981;
 i=rcheung844@gmail.com; s=20250114; h=from:subject:message-id;
 bh=aIMQMh96vCDp6yLLJW7U1OCy3sPhGfKYSD82VLXOyKc=;
 b=4JTSz4foaOONNXGuNxSFhSWovoHrPa542F1OB/cYZsWaxwkGSO+Y8pgGAmFLxmyqPrDKI6brA
 JG+Mbwz4DhQDyAdopjLxRB0IV98twLvtdGNljcM2B09EqEP4kKhw3MS
X-Developer-Key: i=rcheung844@gmail.com; a=ed25519;
 pk=JjZsSnuDD1xuR4EXY4XGKELgToA++HxxheDlHU/41yI=
X-Endpoint-Received: by B4 Relay for rcheung844@gmail.com/20250114 with
 auth_id=323
X-Original-From: Ricky Cheung <rcheung844@gmail.com>
Reply-To: rcheung844@gmail.com

From: Ricky Cheung <rcheung844@gmail.com>

This commit implements support for the JZ0145 v33 WiFi/LTE dongle
based on MSM8916, which was sold by XiaoXun BiCheng Technology.

The stock bootloader could boot with this patch with lk2nd, but only
one CPU core would be enabled. Enablement for all CPU cores require
lk1st and d410c firmware files.

Currently supported / tested:
- All CPU cores
- Buttons
- LEDs
- Modem
- SDHC
- USB Device Mode

Although I do not have UART equipment on hand, UART should function
and is labelled on the PCB of this device.

Signed-off-by: Ricky Cheung <rcheung844@gmail.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  1 +
 .../boot/dts/qcom/msm8916-xiaoxun-jz0145-v33.dts   | 66 ++++++++++++++++++++++
 2 files changed, 67 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index ae002c7cf1268a6f848fefdfadbd746091ee517b..ce8d4a731645e012f1222a130f068b62cacaa514 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -58,6 +58,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-thwc-ufi001c.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-wingtech-wt86518.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-wingtech-wt86528.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-wingtech-wt88047.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-xiaoxun-jz0145-v33.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-yiming-uz801v3.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8929-wingtech-wt82918hd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8939-huawei-kiwi.dtb
diff --git a/arch/arm64/boot/dts/qcom/msm8916-xiaoxun-jz0145-v33.dts b/arch/arm64/boot/dts/qcom/msm8916-xiaoxun-jz0145-v33.dts
new file mode 100644
index 0000000000000000000000000000000000000000..7f1049e111b37213eeadc6a247d4cf21e7e0cd5f
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8916-xiaoxun-jz0145-v33.dts
@@ -0,0 +1,66 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/dts-v1/;
+
+#include "msm8916-ufi.dtsi"
+
+/ {
+	model = "JZ0145 v33 4G Modem Stick";
+	compatible = "xiaoxun,jz0145-v33", "qcom,msm8916";
+};
+
+&button_restart {
+	gpios = <&tlmm 37 GPIO_ACTIVE_HIGH>;
+};
+
+&led_b {
+	gpios = <&tlmm 8 GPIO_ACTIVE_HIGH>;
+};
+
+&led_g {
+	gpios = <&tlmm 7 GPIO_ACTIVE_HIGH>;
+};
+
+&led_r {
+	gpios = <&tlmm 6 GPIO_ACTIVE_HIGH>;
+};
+
+&mpss {
+	pinctrl-0 = <&sim_ctrl_default>;
+	pinctrl-names = "default";
+};
+
+&button_default {
+	pins = "gpio37";
+	bias-pull-down;
+};
+
+&gpio_leds_default {
+	pins = "gpio6", "gpio7", "gpio8";
+};
+
+/* This selects the external SIM card slot by default */
+&tlmm {
+	sim_ctrl_default: sim-ctrl-default-state {
+		esim-sel-pins {
+			pins = "gpio22", "gpio23";
+			function = "gpio";
+			bias-disable;
+			output-low;
+		};
+
+		sim-en-pins {
+			pins = "gpio1";
+			function = "gpio";
+			bias-disable;
+			output-low;
+		};
+
+		sim-sel-pins {
+			pins = "gpio20";
+			function = "gpio";
+			bias-disable;
+			output-high;
+		};
+	};
+};

-- 
2.47.1



