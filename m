Return-Path: <linux-arm-msm+bounces-102361-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +AjUKnev1mk7HQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102361-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 21:41:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5628E3C34CC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 21:41:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1A448301C583
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2026 19:41:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8C8A3803DC;
	Wed,  8 Apr 2026 19:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oEAVn5Wl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC4237E2EE;
	Wed,  8 Apr 2026 19:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775677287; cv=none; b=pryPgPftGw2Ih/CC45hdWN81fTJ+1tvmIv0y4LpyuvTkxGMMdCnUUJ6l4xP0hZ13ftJ9PolXpA28i7I5l54jVsJjAoPom7Xjo6o8aI7H9vpj3BpUr22i4pWKd/SvPDRBAAqB/FrkNw2rxP7Ffcw94I9wrRCyyi4yHSgiT26OtXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775677287; c=relaxed/simple;
	bh=NeSCiMEZyJwSno9m1y6kMznWpANlGARY13Gpbdwlkn8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bS+oCg+siolb80Y+cB3crfSo3VhAUo994CdJBHyc2rTFXyDLoWCUvrFouLzXN7MlYEWjhzp8drh0f5fdiNUizwHnPz+3RyouBuvrcze1/5rt+CoVgsmLJ/B+hVMaYDwI6FbIrmzxxG+EUElbLKoyYCa/y2gk2ewFDKQXcsvAunc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oEAVn5Wl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5129EC2BCB0;
	Wed,  8 Apr 2026 19:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775677287;
	bh=NeSCiMEZyJwSno9m1y6kMznWpANlGARY13Gpbdwlkn8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=oEAVn5WllBP4IUeN36sojuJmlFWtDWh5NFM2MozRK/frldtb3ZQkXE4Cduy0cWRx4
	 vYfuK91uVQzNiIOrKcepV2cH5MiNPygxreQ9o9UWQI/xyIhrjgv0wPb0fHrTGhnNwa
	 r0tozEL/8WGso+DbqkS4MuWBDINGUtJ3+8y3nGxhaMRCQ292Dk7ubVxmy5h2kTdQK/
	 zW8i9whFhlXsqrMJErGbMy7R/9hOqy6Y8FhndXsbUszQgiLlwDLZRILMFtvQOT25QS
	 ksUlv+F2W823Na8YxalyJ11Hryc4+HcyJfsnoZFJ7VMnNWB20qd7Tmz+SKcsDDn1nw
	 KZv2kbwWEm4Iw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48F8B10F9968;
	Wed,  8 Apr 2026 19:41:27 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Wed, 08 Apr 2026 14:41:28 -0500
Subject: [PATCH v5 5/6] arm64: dts: qcom: Add AYN Odin 2 Portal
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260408-ayn-qcs8550-v5-5-c90abeb7a152@gmail.com>
References: <20260408-ayn-qcs8550-v5-0-c90abeb7a152@gmail.com>
In-Reply-To: <20260408-ayn-qcs8550-v5-0-c90abeb7a152@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>, 
 Teguh Sobirin <teguh@sobir.in>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775677286; l=3427;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=2+SChY6IQHBKh8njjJBPKeyneYyYCGd/QTq8yhLM+4k=;
 b=Woe42hFR9yvCxBywCB+rnup0xs+mj2NQmxeNXaK65s6rky1z9q2/RLQQgfAm2wN+Pxwgcbg5n
 7aVngrtsTpiAMsYvOawANHvjAPfrhbFxeX9Go4jWcDZ3d4BB64iSET+
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102361-lists,linux-arm-msm=lfdr.de,webgeek1234.gmail.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,sobir.in,oss.qualcomm.com];
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
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	HAS_REPLYTO(0.00)[webgeek1234@gmail.com]
X-Rspamd-Queue-Id: 5628E3C34CC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Teguh Sobirin <teguh@sobir.in>

The AYN Odin 2 Portal is a high-performance Android-based handheld gaming
console powered by the Qualcomm Snapdragon 8 Gen 2 processor featuring a
7-inch OLED touchscreen.

Signed-off-by: Teguh Sobirin <teguh@sobir.in>
Co-developed-by: Aaron Kling <webgeek1234@gmail.com>
Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  1 +
 .../boot/dts/qcom/qcs8550-ayntec-odin2portal.dts   | 84 ++++++++++++++++++++++
 2 files changed, 85 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index aceb84a060f80e..6bfc4554580bd5 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -185,6 +185,7 @@ qcs8300-ride-el2-dtbs := qcs8300-ride.dtb monaco-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs8300-ride-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-aim300-aiot.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-ayntec-odin2mini.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-ayntec-odin2portal.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-r3.dtb
 
diff --git a/arch/arm64/boot/dts/qcom/qcs8550-ayntec-odin2portal.dts b/arch/arm64/boot/dts/qcom/qcs8550-ayntec-odin2portal.dts
new file mode 100644
index 00000000000000..bd6ba0ab941d33
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qcs8550-ayntec-odin2portal.dts
@@ -0,0 +1,84 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025, Teguh Sobirin.
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include "qcs8550-ayntec-common.dtsi"
+
+&{/} {
+	model = "AYN Odin 2 Portal";
+	compatible = "ayntec,odin2portal", "qcom,qcs8550", "qcom,sm8550";
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
+		touchscreen-inverted-y;
+	};
+};
+
+&remoteproc_adsp {
+	firmware-name = "qcom/sm8550/ayntec/odin2portal/adsp.mbn",
+			"qcom/sm8550/ayntec/odin2portal/adsp_dtb.mbn";
+
+	status = "okay";
+};
+
+&spk_amp_l {
+	firmware-name = "qcom/sm8550/ayntec/odin2portal/aw883xx_acf.bin";
+};
+
+&spk_amp_r {
+	firmware-name = "qcom/sm8550/ayntec/odin2portal/aw883xx_acf.bin";
+};
+

-- 
2.53.0



