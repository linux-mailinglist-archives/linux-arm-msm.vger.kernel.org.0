Return-Path: <linux-arm-msm+bounces-99356-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6CEiOKF2wWkQTQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99356-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 18:21:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A9A2F9C6B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 18:21:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E8677315AA1B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 16:28:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C61A73C13EC;
	Mon, 23 Mar 2026 16:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hB8Swm9v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E237F3BF676;
	Mon, 23 Mar 2026 16:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774283269; cv=none; b=PtqABDgeCewSsDGVyjI1yyswiYRb34K3cYNRPLaNI0AhRtPChzRlsv1WlcuurqgyI9zJKHbtYB5QuP+SFHcFt60+0jAzjJzO5P2VkfEea3K7F5GIbrB9pNB/YLeDimPw7OyoDvx3eUMOzc/fb2Z8vYjmRktZg/G0Wgq0pBPuoOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774283269; c=relaxed/simple;
	bh=g3MPYHVlkZCQvA9Zy+YSuQyqvzPyY8uwuh4XNrwuaJA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q8OhlyJozMJMIefEE6YOuRXs48N+eUCc0qG9W7MLanxeSKkZe0mVmyv7D5AJintwtc6lsbfPmY2yGUyoPHZzjfv7sbaZDAWuKUXSyIzVasrrnsbLvDdow0zOkmM9OuaotEIlY/jnlppddh33Hdn/Yj0N2xZAv2IUOBkcE7CysNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hB8Swm9v; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7458AC2BCF7;
	Mon, 23 Mar 2026 16:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774283268;
	bh=g3MPYHVlkZCQvA9Zy+YSuQyqvzPyY8uwuh4XNrwuaJA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=hB8Swm9vCd6XJ9u4gtSSRuNAh2MbGN6T6ufD46Q9KVGBbN1gQyQeqhZL3fgs9PqVf
	 YCkc0ikvr+UjB/uktjzaXSsHx7ro8nDfzTRECOhhf3WD4x3YKv/XNprJZ5brbTLgGf
	 1uydfPzPtzZ+Llv8zOzK6FofxVXQlY0646xrT8tm+w8tDTA/N/IJsxyPYSdzir4ywt
	 6YX0j1BdbIkFLTN25ZtTqTGJy2svHdcbKz1tgOYMoSL1KjTFS1w46yp8yaaM0Oo6Xm
	 ADNCzkQa6E5DDKPRhJkbiyBZg7OCU/A5X8k7Yn5Cfua7nb9sdVicirvz/CSdqChbq/
	 UmPJRGoObNeSw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A335F483D3;
	Mon, 23 Mar 2026 16:27:48 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Mon, 23 Mar 2026 11:27:48 -0500
Subject: [PATCH v4 6/6] arm64: dts: qcom: Add AYN Thor
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-ayn-qcs8550-v4-6-33a8ac3d53fa@gmail.com>
References: <20260323-ayn-qcs8550-v4-0-33a8ac3d53fa@gmail.com>
In-Reply-To: <20260323-ayn-qcs8550-v4-0-33a8ac3d53fa@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>, 
 Teguh Sobirin <teguh@sobir.in>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774283267; l=6394;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=BmPmblPxKaeXayk3gSNq8WjjO11aBPKzpiiIwmerg1Y=;
 b=Nxjgm1EtXE3dkujkuOMHNgT/gwSRThAQE+YyJ69kXrDA2mndgHdF8uD1Feud8wCfCcezuRdPp
 2Gj4kg+QSdqDqOrAsVyg7gSMXbe4vikLtu61il6MC7yfdpApg0b2/td
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com
X-Spamd-Result: default: False [1.34 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99356-lists,linux-arm-msm=lfdr.de,webgeek1234.gmail.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,sobir.in];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	HAS_REPLYTO(0.00)[webgeek1234@gmail.com]
X-Rspamd-Queue-Id: E2A9A2F9C6B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Teguh Sobirin <teguh@sobir.in>

The AYN Thor is a high-performance Android-based handheld gaming console
powered by the Qualcomm Snapdragon 8 Gen 2 processor featuring dual
AMOLED touchscreens.

Signed-off-by: Teguh Sobirin <teguh@sobir.in>
Co-developed-by: Aaron Kling <webgeek1234@gmail.com>
Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 arch/arm64/boot/dts/qcom/Makefile                |   1 +
 arch/arm64/boot/dts/qcom/qcs8550-ayntec-thor.dts | 230 +++++++++++++++++++++++
 2 files changed, 231 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 5ed85a8843c5ac5cf943f9d0c40ad6da7cba219c..5a35c99ac44a69117cba45f06b85097d53e175b9 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -173,6 +173,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcs8300-ride-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-aim300-aiot.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-ayntec-odin2mini.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-ayntec-odin2portal.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-ayntec-thor.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-r3.dtb
 
diff --git a/arch/arm64/boot/dts/qcom/qcs8550-ayntec-thor.dts b/arch/arm64/boot/dts/qcom/qcs8550-ayntec-thor.dts
new file mode 100644
index 0000000000000000000000000000000000000000..00f4032628df2e8d8729a1e93f5cf6dda9420a6d
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qcs8550-ayntec-thor.dts
@@ -0,0 +1,230 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025, Teguh Sobirin.
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include "qcs8550-ayntec-common.dtsi"
+
+&{/} {
+	model = "AYN Thor";
+	compatible = "ayntec,thor", "qcom,qcs8550", "qcom,sm8550";
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		pinctrl-0 = <&volume_up_n &key_ayn_n>;
+
+		key-ayn {
+			label = "AYN Key";
+			debounce-interval = <15>;
+			gpios = <&tlmm 41 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_F24>;
+			linux,can-disable;
+		};
+
+		switch-lid {
+			label = "Hall Lid Sensor";
+			gpios = <&tlmm 17 GPIO_ACTIVE_LOW>;
+			linux,input-type = <EV_SW>;
+			linux,code = <SW_LID>;
+			linux,can-disable;
+			wakeup-source;
+		};
+	};
+
+	vdd_bl_5v0: vdd-bl-5v0-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_bl_5v0";
+
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+
+		gpio = <&tlmm 52 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	vdd_disp_1v8: vdd-disp-1v8-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_disp_1v8";
+
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+
+		gpio = <&tlmm 70 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	vdd_disp1_2v8: vdd-disp1-2v8-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_disp1_2v8";
+
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+
+		gpio = <&tlmm 142 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	vdd_disp2_2v8: vdd-disp2-2v8-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_disp2_2v8";
+
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+
+		gpio = <&tlmm 143 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	vdd_ts_3v0: vdd-ts-3v0-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_ts_3v0";
+
+		regulator-min-microvolt = <3000000>;
+		regulator-max-microvolt = <3000000>;
+
+		gpio = <&tlmm 144 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	vdd_ts_1v8: vdd-ts-1v8-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_ts_1v8";
+
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+
+		gpio = <&tlmm 102 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+};
+
+&i2c4 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	touchscreen@38 {
+		compatible = "focaltech,ft5426";
+		reg = <0x38>;
+
+		interrupt-parent = <&tlmm>;
+		interrupts = <25 IRQ_TYPE_EDGE_FALLING>;
+
+		reset-gpios = <&tlmm 24 GPIO_ACTIVE_LOW>;
+
+		vcc-supply = <&vreg_l14b_3p2>;
+		iovcc-supply = <&vreg_l12b_1p8>;
+
+		pinctrl-0 = <&ts_p_rst_default &ts_p_int_default>;
+		pinctrl-1 = <&ts_p_rst_sleep &ts_p_int_sleep>;
+		pinctrl-names = "default", "sleep";
+
+		touchscreen-size-x = <1080>;
+		touchscreen-size-y = <1920>;
+		touchscreen-swapped-x-y;
+		touchscreen-inverted-x;
+	};
+};
+
+&i2c_hub_3 {
+	clock-frequency = <100000>;
+
+	status = "okay";
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	touchscreen@38 {
+		compatible = "focaltech,ft5452";
+		reg = <0x38>;
+
+		interrupt-parent = <&tlmm>;
+		interrupts = <15 IRQ_TYPE_EDGE_FALLING>;
+
+		reset-gpios = <&tlmm 14 GPIO_ACTIVE_LOW>;
+
+		vcc-supply = <&vdd_ts_3v0>;
+		iovcc-supply = <&vdd_ts_1v8>;
+
+		pinctrl-0 = <&ts_s_rst_default &ts_s_int_default>;
+		pinctrl-1 = <&ts_s_rst_sleep &ts_s_int_sleep>;
+		pinctrl-names = "default", "sleep";
+
+		touchscreen-size-x = <1080>;
+		touchscreen-size-y = <1240>;
+		touchscreen-swapped-x-y;
+		touchscreen-inverted-x;
+	};
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l3e_1p2>;
+
+	status = "okay";
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	panel@0 {
+		reg = <0>;
+
+		port {
+			panel0_in: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&panel0_in>;
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dsi0_phy {
+	vdds-supply = <&vreg_l1e_0p88>;
+	status = "okay";
+};
+
+&mdss_dsi1_out {
+	qcom,te-source = "mdp_vsync_s";
+};
+
+&pm8550_pwm {
+	multi-led {
+		status = "disabled";
+	};
+};
+
+&remoteproc_adsp {
+	firmware-name = "qcom/sm8550/ayntec/thor/adsp.mbn",
+			"qcom/sm8550/ayntec/thor/adsp_dtb.mbn";
+
+	status = "okay";
+};
+
+&spk_amp_l {
+	firmware-name = "qcom/sm8550/ayntec/thor/aw883xx_acf.bin";
+};
+
+&spk_amp_r {
+	firmware-name = "qcom/sm8550/ayntec/thor/aw883xx_acf.bin";
+};
+
+&tlmm {
+	key_ayn_n: key-ayn-n-state {
+		pins = "gpio41";
+		function = "gpio";
+		bias-pull-up;
+		output-disable;
+	};
+};

-- 
2.53.0



