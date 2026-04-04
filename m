Return-Path: <linux-arm-msm+bounces-101777-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OHZtOVUK0WlBEAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101777-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 14:55:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F55439B20B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 14:55:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8C7C9300C92C
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Apr 2026 12:55:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38EB729ACC5;
	Sat,  4 Apr 2026 12:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b="f8/yGA8c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-43172.protonmail.ch (mail-43172.protonmail.ch [185.70.43.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A0C71A9F82;
	Sat,  4 Apr 2026 12:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775307337; cv=none; b=kUZnytqWM8YyCR0/c7gagW1+ZBiTb7JVdqgi036iuH9fBAZ7qQRpjRy6KxTQOkJVxBM6JOZsRzZlrjrBmKyMTkvy5achBK42XutH4YZhv/JsKQHuh9tjAU0FMDjRdsOMgH6j5doU8pr2Oq1m7DE+O//9tfdyWptAHBS5LssIGek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775307337; c=relaxed/simple;
	bh=GnZlkOa02Sa3FmkLTT88zrR00iGn9pmuHBh26DpAt+U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DJzRl53xV3pMMxCPwyvNkUyHm9nx+Gz9Yf2NjurJJGdRZxaD74n+oIZmf9IJsZ9ZcV7RFeiNTxq4bt3n6F2KAXSzfr/Ze5NcvIoxb3Qn4afxKSUz+xZ7KOb2mA4k4oNduTaTIXNGkkv5ySUGDtJG0ZBV49URWD4PQWpFheSeSns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com; spf=pass smtp.mailfrom=vinarskis.com; dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b=f8/yGA8c; arc=none smtp.client-ip=185.70.43.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vinarskis.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vinarskis.com;
	s=protonmail2; t=1775307325; x=1775566525;
	bh=sRi1KPuMsI1gwp9T7EQ3mC3Tl5raZOsz946BsE6r7t4=;
	h=From:Date:Subject:Message-Id:References:In-Reply-To:To:Cc:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=f8/yGA8cJfcvyme6Fb/XL0GOcCBL9Yje7PGtza30Bu2ZLzilIHOBAkhyUgrpaG6kL
	 b0e8L4Mdum+5DMUQsrg9+vdYb0iyOeMwjfUTNNRJHkhY8X1kCXK5//I8aj5G9zMLi9
	 fMHoTWn+c9z7zJXH4Leu8MCjRT4sWt9rkB0jwwx5ulFssXrUxcv9hfeHIwq2dqtBs+
	 yA5w5HYdxOUgQ3AIGdMeULjKRVq82Iq4oivOSWu7/5DDHtM3fdCiopYLd6u3TAyIt1
	 6/VvuaUsxeu0Jp5ZqDo/qMv4BDyk7DDow713a5+oANTiHlBRJPAa0WUxwNjP5gCE0A
	 4HnLWRA5pmv/g==
X-Pm-Submission-Id: 4fnwYR0t07z1DDLg
From: Aleksandrs Vinarskis <alex@vinarskis.com>
Date: Sat, 04 Apr 2026 14:55:14 +0200
Subject: [PATCH v2 1/4] dt-bindings: platform: introduce EC for Dell XPS 13
 9345
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260404-dell-xps-9345-ec-v2-1-c977c3caa81f@vinarskis.com>
References: <20260404-dell-xps-9345-ec-v2-0-c977c3caa81f@vinarskis.com>
In-Reply-To: <20260404-dell-xps-9345-ec-v2-0-c977c3caa81f@vinarskis.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 laurentiu.tudor1@dell.com, Abel Vesa <abel.vesa@oss.qualcomm.com>, 
 Tobias Heider <tobias.heider@canonical.com>, Val Packett <val@packett.cool>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4692; i=alex@vinarskis.com;
 h=from:subject:message-id; bh=GnZlkOa02Sa3FmkLTT88zrR00iGn9pmuHBh26DpAt+U=;
 b=owGbwMvMwCX2dl3hIv4AZgHG02pJDJkXucz3Js3UXv9v/RrTSaaPDZXuPi5/+eY2n1jNXd4Sz
 giTa4InO0pZGMS4GGTFFFm6/3xN61o0dy3DdY1vMHNYmUCGMHBxCsBE1sxi+Ct59lTA89M/pnr9
 0NRYqjr/unHmtvDi4P3nWA6//Mo7v2kmwz9T7XcmidKuqp6Lbmi0356dsH7FfM2qG+8OTg/KCV8
 v/ZgVAA==
X-Developer-Key: i=alex@vinarskis.com; a=openpgp;
 fpr=8E21FAE2D2967BB123303E8C684FD4BA28133815
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[vinarskis.com,quarantine];
	R_DKIM_ALLOW(-0.20)[vinarskis.com:s=protonmail2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101777-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alex@vinarskis.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[vinarskis.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bewilderbeest.net:email,3b:email]
X-Rspamd-Queue-Id: 5F55439B20B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add bindings for Embedded Controller (EC) in Dell XPS 13 9345 (platform
codename 'tributo'). It may be partially or fully compatible with EC
found in Snapdragon-based Dell Latitude, Inspiron ('thena').

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
---
 .../embedded-controller/dell,xps13-9345-ec.yaml    | 91 ++++++++++++++++++++++
 MAINTAINERS                                        |  5 ++
 2 files changed, 96 insertions(+)

diff --git a/Documentation/devicetree/bindings/embedded-controller/dell,xps13-9345-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/dell,xps13-9345-ec.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..e14dbf2f1a6af8cc7511890fbef08c6c717c0aa6
--- /dev/null
+++ b/Documentation/devicetree/bindings/embedded-controller/dell,xps13-9345-ec.yaml
@@ -0,0 +1,91 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/embedded-controller/dell,xps13-9345-ec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Dell XPS 13 9345 Embedded Controller
+
+maintainers:
+  - Aleksandrs Vinarskis <alex@vinarskis.com>
+
+description:
+  The Dell XPS 13 9345 has an Embedded Controller (EC) which handles thermal
+  and power management. It is communicating with SoC over multiple i2c busses.
+  Among other things, it handles fan speed control, thermal shutdown, peripheral
+  power supply including trackpad, touch-row, display. For these functions, it
+  requires frequently updated thermal readings from onboard thermistors.
+
+properties:
+  compatible:
+    const: dell,xps13-9345-ec
+
+  reg:
+    const: 0x3b
+
+  interrupts:
+    maxItems: 1
+
+  io-channels:
+    description:
+      ADC channels connected to the 7 onboard thermistors on PMK8550.
+      EC requires frequent thermal readings of these channels to perform
+      automated fan speed control.
+    items:
+      - description: ADC channel for sys_therm0
+      - description: ADC channel for sys_therm1
+      - description: ADC channel for sys_therm2
+      - description: ADC channel for sys_therm3
+      - description: ADC channel for sys_therm4
+      - description: ADC channel for sys_therm5
+      - description: ADC channel for sys_therm6
+
+  io-channel-names:
+    items:
+      - const: sys_therm0
+      - const: sys_therm1
+      - const: sys_therm2
+      - const: sys_therm3
+      - const: sys_therm4
+      - const: sys_therm5
+      - const: sys_therm6
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - io-channels
+  - io-channel-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/iio/qcom,spmi-adc7-pm8350.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        embedded-controller@3b {
+            compatible = "dell,xps13-9345-ec";
+            reg = <0x3b>;
+            interrupts-extended = <&tlmm 66 IRQ_TYPE_LEVEL_LOW>;
+
+            io-channels = <&pmk8550_vadc PM8350_ADC7_GPIO3_100K_PU(1)>,
+                          <&pmk8550_vadc PM8350_ADC7_GPIO4_100K_PU(1)>,
+                          <&pmk8550_vadc PM8350_ADC7_AMUX_THM1_100K_PU(1)>,
+                          <&pmk8550_vadc PM8350_ADC7_AMUX_THM2_100K_PU(1)>,
+                          <&pmk8550_vadc PM8350_ADC7_AMUX_THM3_100K_PU(1)>,
+                          <&pmk8550_vadc PM8350_ADC7_AMUX_THM4_100K_PU(1)>,
+                          <&pmk8550_vadc PM8350_ADC7_AMUX_THM5_100K_PU(1)>;
+            io-channel-names = "sys_therm0",
+                               "sys_therm1",
+                               "sys_therm2",
+                               "sys_therm3",
+                               "sys_therm4",
+                               "sys_therm5",
+                               "sys_therm6";
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 96e0781f2201b41b976dfa69efd44d62c4ff0058..a5d175559f4468dfe363b319a1b08d3425f4d712 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7236,6 +7236,11 @@ S:	Maintained
 F:	Documentation/ABI/testing/sysfs-class-firmware-attributes
 F:	drivers/platform/x86/dell/dell-wmi-sysman/
 
+DELL XPS EMBEDDED CONTROLLER DRIVER
+M:	Aleksandrs Vinarskis <alex@vinarskis.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/embedded-controller/dell,xps13-9345-ec.yaml
+
 DELTA AHE-50DC FAN CONTROL MODULE DRIVER
 M:	Zev Weiss <zev@bewilderbeest.net>
 L:	linux-hwmon@vger.kernel.org

-- 
2.53.0


