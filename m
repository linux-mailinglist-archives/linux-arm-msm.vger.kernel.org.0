Return-Path: <linux-arm-msm+bounces-45013-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F519A108BB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 15:11:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A6F67168E06
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 14:11:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28D7613FD83;
	Tue, 14 Jan 2025 14:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tbQWzb0l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E8B13C3D3;
	Tue, 14 Jan 2025 14:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736863882; cv=none; b=NPvpy741Hb+CbzmWjmBFAjDOrkBHMNL02p8K87M54i9H1RLzLwaMPtBZyvyYAgDkykBL48bVzUbZw9UfhPaTIHs3X1BJTXmsgrECOua1J5DdRlHE9wlwAN5g+LOr/BV4k4eynvvXakBIuk+FE3BIqSXTixwO2IiP4jULyvP+UPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736863882; c=relaxed/simple;
	bh=SzgaLH47i8Fl4TwxX9pjbIuQJnVn2ovdLScqBdOV78E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YrlmoRT7pdflweEQPd/lIj0NMFrlt5yPC94ROSbxF9EAdR+1HlRVLIYg0H7+CAlxSnT4h4gYV9fR4UL6vmz1VqjQrjQyxxVadsFjO9CtiYjoCaGIJrXZfb7IMWfIlO8awCt93t7CT8YH2YLDiUDl1NtM46He8lqyoLPA3t5/0jE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tbQWzb0l; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 74763C4CEE8;
	Tue, 14 Jan 2025 14:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736863881;
	bh=SzgaLH47i8Fl4TwxX9pjbIuQJnVn2ovdLScqBdOV78E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=tbQWzb0lK7zF4QnRpLWZlaFDR3L4K0zaEH6T6dgA75/dPafp/qXs/SO4GlfiEC28n
	 Gcra5g4/PKzu9V1dd3NI+P7Pnh7OeJV7pPY0TA9C7v9RCCSG78Js3mTnsSazrZnuLi
	 UQlTj9HLqbI8WeFpfx0m0BZkeat1T4BjFXH1JhRsEzhyEgd/A/Jsp4wUl6m48j03R5
	 byhezLeN8z8dpqZyJDnx9HuaHSZATu3U0HAZ1ubmmSyY1FReokQQBs6IzseCyp3YOO
	 L33ClNnR1he7nKAWfzcLm24VJ8RY1ydXb7tAaNogCksdF32auSaqe8BnoK1mgpryvm
	 mxzq3miB5miaw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ABBEC02183;
	Tue, 14 Jan 2025 14:11:21 +0000 (UTC)
From: Ricky Cheung via B4 Relay <devnull+rcheung844.gmail.com@kernel.org>
Date: Tue, 14 Jan 2025 22:11:20 +0800
Subject: [PATCH 3/3] arm64: dts: qcom: msm8916-xiaoxun-jz0145-v33: Add
 initial device tree
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250114-xiaoxun-jz0145-v33-v1-3-dc51f7ce3bd8@gmail.com>
References: <20250114-xiaoxun-jz0145-v33-v1-0-dc51f7ce3bd8@gmail.com>
In-Reply-To: <20250114-xiaoxun-jz0145-v33-v1-0-dc51f7ce3bd8@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Ricky Cheung <rcheung844@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736863880; l=2981;
 i=rcheung844@gmail.com; s=20250114; h=from:subject:message-id;
 bh=zknxHLh/0yD6xrk03GtNYivOjkwjH1tCp9FwILMCT+8=;
 b=kSCS7SQZPecgrWAfh5fmzsRHNmCikB5YdyEti+49Kze6EDGs1IzIPKQ6fAh1W0KLm0EMCpOu6
 0aVNtRfbl3FAeS9ewBgxwUE8RKnRo8/rwAXlugPpbByWzjlk6a713G7
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
index ae002c7cf1268a6f848fefdfadbd746091ee517b..b41bf312ebb6ed9c216ec3887e5dc128209d3f4f 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -58,6 +58,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-thwc-ufi001c.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-wingtech-wt86518.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-wingtech-wt86528.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-wingtech-wt88047.dtb
+dtb-$(CONFIG_ARCH_QCOM) += msm8916-xiaoxun-jz0145-v33.dtb
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



