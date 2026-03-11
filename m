Return-Path: <linux-arm-msm+bounces-97042-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sH3BCzSqsWmzEQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97042-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 18:45:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6B42682D9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 18:45:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 728A5303A6DA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 17:44:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 801B73E5580;
	Wed, 11 Mar 2026 17:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XG5NRu7X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6A63E51ED;
	Wed, 11 Mar 2026 17:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773251089; cv=none; b=X56qOzqkl9g5qp0vk6nyZOusVMgjeNAqCu9C2nZkmErWoIIi3lydEszbvdQ5BWXePP5Ayw1kf4NSCoVelNf8tahut5KcbgA/dc3pU4ZvV+ZvUKcbKOl7nm2253GSEqhRrx42fMI/03Xc4EBOv29j7SsnuZedCwsuDP6mrTE83vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773251089; c=relaxed/simple;
	bh=1od7Wlw1GbFWt7/++4XQHCLkhg+u9hUUYjChca///V8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BMRVjU3RY1Azp6pofGQPZLFNTkguTVNSAh6MN8jGXyzd8S0MZY/SUj8WElWbGHR4rZJiGnFEqRrLiEdkjiQ53YjgnlGG5MvdVWhcioXYkU7aQLzL90lrrZhM7bizuBDFnqwj8wwaVpGh6fHuxM4UOx2BfjtbJkhDI+RNCWrGpjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XG5NRu7X; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C6B2CC2BCB5;
	Wed, 11 Mar 2026 17:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773251088;
	bh=1od7Wlw1GbFWt7/++4XQHCLkhg+u9hUUYjChca///V8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=XG5NRu7X/i35jPG9GftMYaItr+0PDNX+UL59GIcR858gXixLDdx8L6ItWY1m8oRdG
	 8hhUYmQ+u2kItjtezN0uBGID2Yr1yOOzP0c+bQpOqHFRP1b0Ief24vDY6HpjHjw3ph
	 Keh1y+LaZPaJkPzXyIT6cuv8Znu4UbtTARb6V/E6R182rELxNAukHOFUkzBNuWNqtf
	 jbtQSZZmAHciuc6WsaoqYNXutSXZFU/gUyOE7rWmtDYWRvVpuxFpoymAV85rraHm2e
	 8QWkhfkQ0o+Rbe/KA9Juh06XdJwKNjZBPGhyJsSl5DUsBZjrBtva3/bkUSlsb53CF2
	 u7tAaqJsc/RXA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBBF91125858;
	Wed, 11 Mar 2026 17:44:48 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Wed, 11 Mar 2026 12:44:39 -0500
Subject: [PATCH v2 3/5] arm64: dts: qcom: Add AYN Odin 2 Mini
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-ayn-qcs8550-v2-3-e66986e0f0cb@gmail.com>
References: <20260311-ayn-qcs8550-v2-0-e66986e0f0cb@gmail.com>
In-Reply-To: <20260311-ayn-qcs8550-v2-0-e66986e0f0cb@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>, 
 Teguh Sobirin <teguh@sobir.in>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773251087; l=4783;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=xcEVqKMPSvcHvwAORvrNa8rHTg1+vl1NPzo/rpqSz8g=;
 b=umcND7W24lwLA+Z3PCRmZp7Yj2X2lBqEJmlVlYCD9cY44BS/zFpcni6OXtGpFU7195n8MEWAk
 MoFrhupKFJZCvmkwn9DRZ5JUfm0xxmPyuWaSPJ4yx+Vxh3Im06pYybO
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97042-lists,linux-arm-msm=lfdr.de,webgeek1234.gmail.com];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,sobir.in];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	HAS_REPLYTO(0.00)[webgeek1234@gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.1:email,0.0.0.48:email]
X-Rspamd-Queue-Id: 6D6B42682D9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Teguh Sobirin <teguh@sobir.in>

The AYN Odin 2 Mini is a high-performance Android-based handheld gaming
console powered by the Qualcomm Snapdragon 8 Gen 2 processor featuring a
5-inch mini-led touchscreen.

Signed-off-by: Teguh Sobirin <teguh@sobir.in>
Co-developed-by: Aaron Kling <webgeek1234@gmail.com>
Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |   2 +
 .../boot/dts/qcom/qcs8550-ayntec-odin2mini.dtso    | 147 +++++++++++++++++++++
 2 files changed, 149 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 5bb88dd7a31bbd8ee7078a880056cc1f35be494e..3dd5db42713b1d468d029518178a9df33af991c9 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -164,6 +164,8 @@ qcs8300-ride-el2-dtbs := qcs8300-ride.dtb monaco-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs8300-ride-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-aim300-aiot.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-ayntec-common.dtb
+qcs8550-ayntec-odin2mini-dtbs := qcs8550-ayntec-common.dtb qcs8550-ayntec-odin2mini.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-ayntec-odin2mini.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-r3.dtb
 
diff --git a/arch/arm64/boot/dts/qcom/qcs8550-ayntec-odin2mini.dtso b/arch/arm64/boot/dts/qcom/qcs8550-ayntec-odin2mini.dtso
new file mode 100644
index 0000000000000000000000000000000000000000..60b402a6b98857f56b04c44b053d5a46faf8c0a6
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qcs8550-ayntec-odin2mini.dtso
@@ -0,0 +1,147 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025, Teguh Sobirin.
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	model = "AYN Odin 2 Mini";
+	compatible = "ayntec,odin2mini", "qcom,qcs8550", "qcom,sm8550";
+
+	hdmi-out {
+		compatible = "hdmi-connector";
+		type = "d";
+		hpd-gpios = <&tlmm 9 GPIO_ACTIVE_HIGH>;
+		hdmi-pwr-supply = <&vdd_hdmi_1v8>;
+
+		port {
+			hdmi_con: endpoint {
+				remote-endpoint = <&lt8912_out>;
+			};
+		};
+	};
+
+	vcc_hdmi_1v8: vcc-hdmi-1v8-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_hdmi_1v8";
+
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+
+		gpio = <&tlmm 10 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	vdd_bl_5v0: vdd-bl-5v0-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_bl_5v0";
+
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+
+		gpio = <&tlmm 55 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	vdd_disp_2v8: vdd-disp-2v8-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_disp_2v8";
+
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+
+		gpio = <&tlmm 142 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	vdd_hdmi_1v8: vdd-hdmi-1v8-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_hdmi_1v8";
+
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+
+		gpio = <&tlmm 6 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+};
+
+&i2c_hub_0 {
+	clock-frequency = <100000>;
+	status = "okay";
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	lt8912_codec: hdmi-bridge@48 {
+		compatible = "lontium,lt8912b";
+		reg = <0x48> ;
+
+		reset-gpios = <&tlmm 7 GPIO_ACTIVE_LOW>;
+
+		vdd-supply = <&vdd_hdmi_1v8>;
+		vccmipirx-supply = <&vcc_hdmi_1v8>;
+		vccsysclk-supply = <&vcc_hdmi_1v8>;
+		vcclvdstx-supply = <&vcc_hdmi_1v8>;
+		vcchdmitx-supply = <&vcc_hdmi_1v8>;
+		vcclvdspll-supply = <&vcc_hdmi_1v8>;
+		vcchdmipll-supply = <&vcc_hdmi_1v8>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				hdmi_out_in: endpoint {
+					data-lanes = <1 2 3 4>;
+					remote-endpoint = <&mdss_dsi0_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				lt8912_out: endpoint {
+					remote-endpoint = <&hdmi_con>;
+				};
+			};
+		};
+	};
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l3e_1p2>;
+	status = "okay";
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&hdmi_out_in>;
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dsi0_phy {
+	vdds-supply = <&vreg_l1e_0p88>;
+	status = "okay";
+};
+
+&remoteproc_adsp {
+	firmware-name = "qcom/sm8550/ayntec/odin2mini/adsp.mbn",
+			"qcom/sm8550/ayntec/odin2mini/adsp_dtb.mbn";
+	status = "okay";
+};
+
+&spk_amp_l {
+	firmware-name = "qcom/sm8550/ayntec/odin2mini/aw883xx_acf.bin";
+};
+
+&spk_amp_r {
+	firmware-name = "qcom/sm8550/ayntec/odin2mini/aw883xx_acf.bin";
+};
+

-- 
2.53.0



