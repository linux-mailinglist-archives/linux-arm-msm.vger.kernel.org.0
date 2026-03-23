Return-Path: <linux-arm-msm+bounces-99090-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qLxTAfWfwGmLJQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99090-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 03:05:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8482EBCDE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 03:05:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9FCB1300CC16
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 02:05:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C10EF21CC58;
	Mon, 23 Mar 2026 02:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rbBE1/0X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A6FB2BD11;
	Mon, 23 Mar 2026 02:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774231524; cv=none; b=fNXo6Z39h8ebLTZEPkQs6HftXPUWle/XDH+iNcui8gBeeV6qVnitGQ/vuraa16+YyT9g3OCFtzbbSN+jNp+xu4qXQxW24nQfaO6r00v7I9bxUBpNgKXwrYC1yuChm7M07UCMj8EReahw5xZVHvFGXJWWcBT74aygsYjOBIvlvxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774231524; c=relaxed/simple;
	bh=q8Md1MrrvlzFIFnuZKgibqqJjmocGVWMY9cFxgRUu8Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WdIK7CRCZfP7VhgX2BFpJ3YDU1kfujvPOBVCOrCq07EwEpvogiUQVmoWt4yibZ0zyWvMmMbwIZK3HaSOTAgXSab8f7/pnj3KqiyYc57+NWtiqNpb/wrFDVnirIN3Rha9tXHfIZtYWfU2+WiKieI7KBbK3M6GjQbeAnrDsH0WOts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rbBE1/0X; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6266BC2BCB8;
	Mon, 23 Mar 2026 02:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774231524;
	bh=q8Md1MrrvlzFIFnuZKgibqqJjmocGVWMY9cFxgRUu8Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=rbBE1/0XnvpKRni7Aip2wgdJrkcQuvsRYN3kPo1AlV5sCKyy5G1f1lKxu8J7amm7G
	 yMsk35lvrTxBG8W0W26JdpCHtSDDx4tH8LTnVCLdeEsasuzoDnj0WdbSYFSw4vjqZx
	 0fWsIXX608Mp9uwUZTaRqH6ZZ6Rd/jf7OR96R8RyRQ/K+t74IpVl1/uQFQqzsHXiM6
	 SJ3fvxlAEOJm7hmNwXuFfnsDlhGZ4AeAwne1SYzIQ5xGw7t2CAJyyVisjpM7M+1VLD
	 QCmyNMXgrmDusTjSqgMWXDw2l7ftmkqyc0Q+BfG1eFVN5OXJB8pqHnUueXguNY8mVH
	 v53UMsDcqTZLg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50D5CD58CC3;
	Mon, 23 Mar 2026 02:05:24 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Sun, 22 Mar 2026 21:05:20 -0500
Subject: [PATCH v3 3/5] arm64: dts: qcom: Add AYN Odin 2 Mini
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260322-ayn-qcs8550-v3-3-4afa89c20888@gmail.com>
References: <20260322-ayn-qcs8550-v3-0-4afa89c20888@gmail.com>
In-Reply-To: <20260322-ayn-qcs8550-v3-0-4afa89c20888@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>, 
 Teguh Sobirin <teguh@sobir.in>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774231523; l=4407;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=xCqY67pFH+MrrX8l2lo2lmvT8hNfLzNQ+CeZqJyylEI=;
 b=c/FTJXyDP6ZowcLNX9cjtEIZEyNwkuYXiaMs7Xo2bvJWd6NlwbsC/2nBDoU+0HLvarXrG6sGq
 ZanraC/m9nrDBZxNIzbH9VTgp86mucvJVAM5jHPqM9krycFo0rJBXrG
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99090-lists,linux-arm-msm=lfdr.de,webgeek1234.gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,sobir.in];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[webgeek1234@gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_PROHIBIT(0.00)[0.0.0.48:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,0.0.0.1:email]
X-Rspamd-Queue-Id: 5A8482EBCDE
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
 arch/arm64/boot/dts/qcom/Makefile                  |   1 +
 .../boot/dts/qcom/qcs8550-ayntec-odin2mini.dts     | 140 +++++++++++++++++++++
 2 files changed, 141 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 02921a495b2cbabcbacc74fbbb99eafe1f6478ac..b42b7ef0a670b76234c063fa1aaf14a4691dba61 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -163,6 +163,7 @@ qcs8300-ride-el2-dtbs := qcs8300-ride.dtb monaco-el2.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs8300-ride-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-aim300-aiot.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-ayntec-odin2mini.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-r3.dtb
 
diff --git a/arch/arm64/boot/dts/qcom/qcs8550-ayntec-odin2mini.dts b/arch/arm64/boot/dts/qcom/qcs8550-ayntec-odin2mini.dts
new file mode 100644
index 0000000000000000000000000000000000000000..c2a1b85b66e314e277181f0036a0988060368243
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qcs8550-ayntec-odin2mini.dts
@@ -0,0 +1,140 @@
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
+
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
+
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
+
+	status = "okay";
+};
+
+&remoteproc_adsp {
+	firmware-name = "qcom/sm8550/ayntec/odin2mini/adsp.mbn",
+			"qcom/sm8550/ayntec/odin2mini/adsp_dtb.mbn";
+
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



