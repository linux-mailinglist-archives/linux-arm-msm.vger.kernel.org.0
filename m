Return-Path: <linux-arm-msm+bounces-45021-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D4895A109C2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 15:47:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 735BB7A3137
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 14:46:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43E5A154C17;
	Tue, 14 Jan 2025 14:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PjuYS0NC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06CD61494A5;
	Tue, 14 Jan 2025 14:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736866015; cv=none; b=FEeWLKgf6FOBfiVQx6hjSGttnQPjZuTG014kSSOoT05caAggEGNC4u3Ch0Zb3T74uQSamoztnyhL7V7aKaqFm5SnZ+OhvYdmjuxFFSM+U3PBy8Rvw+nanzynhHToBbOJTaUEudS5a3JwqqP55z9fFxfm9Q4d7q2rDOvf1O6WVSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736866015; c=relaxed/simple;
	bh=PdLXMpw6mCU+0JWw02u7MvqnmujtMCIwWZO18hYjTB0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Qtd7ItLi3vvww8GXckB0w9lN8KsN+qR/oW/zPFGWuJtOZEqEJQjHLIj1zS6WUO2mD8gt5f16LJYLCh2a5va405iARJ1CdwpLecntveoMle+cyU2KPZAGau+GUwDHQ4JTVubXXfEC1OyPoC2G+voSCvbTMfBAK8Vb6N07JI7Oc4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PjuYS0NC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9478CC4CEE4;
	Tue, 14 Jan 2025 14:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736866014;
	bh=PdLXMpw6mCU+0JWw02u7MvqnmujtMCIwWZO18hYjTB0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=PjuYS0NCNwOj6OsLBtJ9g5/Fgb2qLUXbEO6jfero59q61XDL0nRz4exBL5SfWeQft
	 4CdrxxJOSsjrTCimg34q7DFLxsKzwJ059M0UPonIAh/BlAlTzgII6cnhx8bAtsPOlY
	 nabsSLayOHB9/dzaEU5DlXQaZlRIkZYJs7WEKUqJDEJsv4pxuj0RJglDorM0A+Sz+C
	 Sr+q1vBKjYYg7HH/LDWFz9woVRxoMQpzFh8ViAQlx7CeMrQrli2HeguZHhKsXZf7b3
	 oEsvEO37w890HVQ6aYiTHdPNdyt/UUtZBW3wLKnIHBUIV2358DH+Dg20/GpjbL7HY4
	 N2mLTzHAe0YHg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89040C02185;
	Tue, 14 Jan 2025 14:46:54 +0000 (UTC)
From: Ricky Cheung via B4 Relay <devnull+rcheung844.gmail.com@kernel.org>
Date: Tue, 14 Jan 2025 22:46:50 +0800
Subject: [PATCH RESEND v2 3/3] arm64: dts: qcom:
 msm8916-xiaoxun-jz0145-v33: Add initial device tree
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250114-xiaoxun-jz0145-v33-v2-3-495e986579ce@gmail.com>
References: <20250114-xiaoxun-jz0145-v33-v2-0-495e986579ce@gmail.com>
In-Reply-To: <20250114-xiaoxun-jz0145-v33-v2-0-495e986579ce@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Ricky Cheung <rcheung844@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736866013; l=2981;
 i=rcheung844@gmail.com; s=20250114; h=from:subject:message-id;
 bh=aIMQMh96vCDp6yLLJW7U1OCy3sPhGfKYSD82VLXOyKc=;
 b=Q9gCbGyNmj2MC/WTb3BTCarJrM+iQpvKWnQeA+GZ9Kdo/XuMKmuIhBvGAtL7sLBax9LU/zDK0
 JEjkA+kIma0APajAAMo+AtZS8/gtPNjKeqX/tG1tdAE1m+AGgSdYx6T
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



