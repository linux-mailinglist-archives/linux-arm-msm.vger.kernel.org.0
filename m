Return-Path: <linux-arm-msm+bounces-111509-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lkcvLgwUJGoM2wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111509-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 14:35:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 113E864D71B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 14:35:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=herrie.org header.s=transip-a header.b=E8jWLWLi;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111509-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111509-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 51262302C781
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jun 2026 12:35:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB96A3AA4E1;
	Sat,  6 Jun 2026 12:35:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from outbound1.mail.transip.nl (outbound1.mail.transip.nl [149.210.149.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C7939DBF4;
	Sat,  6 Jun 2026 12:34:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780749301; cv=none; b=hjiTvH0Yk/tVdFPk6uflSwz5KScdlvsrz2Wg0dY1sK+qdqG+vW6D9dK5QGDt4QwdBhRGNuTKdQg5AJCcfTzON/sKG9s5j4zNLeZZd0SLBSxFkuaUzDNzO/3GoRtiz7JEv+n09MecE3w6/K7tTNnTCgYVVWWnVj2twWzxKc45aZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780749301; c=relaxed/simple;
	bh=WcjFvnHfcTcqB9yYPO0c8PfV5juyBsPRpoH3M6GVa1c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O5v29S8KihHdabmjGbKHtlDiv96isLwk+3iJ5JegSxGmZwFdO21/UU5rMUUKjldND0fcfYXl7BsA7ZD0aQVr1a+TqVkmCKM6hA9j71S0qQUwlK8XzzYsEBqNj2+b5dCDPR9Mc/pZzNVGK26m0LNJxO0vPtMEt1YwkBL8+y55xbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org; spf=pass smtp.mailfrom=herrie.org; dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b=E8jWLWLi; arc=none smtp.client-ip=149.210.149.72
Received: from submission2.mail.transip.nl (unknown [10.100.4.71])
	by outbound1.mail.transip.nl (Postfix) with ESMTP id 4gXd6g4QJ9zRjfS;
	Sat,  6 Jun 2026 14:34:51 +0200 (CEST)
Received: from [127.0.1.1] (180-93-184-31.ftth.glasoperator.nl [31.184.93.180])
	by submission2.mail.transip.nl (Postfix) with ESMTPA id 4gXd6f50mzzJjhYD;
	Sat,  6 Jun 2026 14:34:50 +0200 (CEST)
From: Herman van Hazendonk <github.com@herrie.org>
Date: Sat, 06 Jun 2026 14:34:50 +0200
Subject: [PATCH v3 1/2] dt-bindings: interconnect: qcom: add msm8660 NoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260606-submit-interconnect-msm8660-v3-1-f9da0158cdf8@herrie.org>
References: <20260606-submit-interconnect-msm8660-v3-0-f9da0158cdf8@herrie.org>
In-Reply-To: <20260606-submit-interconnect-msm8660-v3-0-f9da0158cdf8@herrie.org>
To: Georgi Djakov <djakov@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Herman van Hazendonk <github.com@herrie.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780749289; l=12489;
 i=github.com@herrie.org; s=20240417; h=from:subject:message-id;
 bh=WcjFvnHfcTcqB9yYPO0c8PfV5juyBsPRpoH3M6GVa1c=;
 b=uLI0WzxynjgAYFl5OVteVDHkddzjTQIMoottyYwao+/jLpIy1Npx7rWfGr6EItK1uUhRYDZbB
 zZqKOybtEoQAYqQAUe0GL9DJfQcHjIsU0CsyKGg1wO4WoRzFZznXzhm
X-Developer-Key: i=github.com@herrie.org; a=ed25519;
 pk=YYxdq8fb5O9vhkW3n2dCH044FPZZO5718v/du7fRhFw=
X-Scanned-By: ClueGetter at submission2.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=herrie.org; t=1780749290; h=from:subject:to:cc:
 references:in-reply-to:date:mime-version:content-type;
 bh=JXv532PpSUgv7jXfBVY+ZLGyHOW65uFVJ7OQo/uQuJ0=;
 b=E8jWLWLi0QTWpR6KXj1YlNQKhKvJXRhflJrdRl5fLEn7m3RyYXUi/GHndcFv5fQSigixCz
 A2NzJlvgMFjaEthnyB/+ud+wQBoPlFiaQU6Xavb6Weff77YFtiF0YlfToX+ZvrX6si+1Ki
 lvaMpq2U5av/gbH/zG88uHr0Ix+DaJbS8lMXU7I7LldqHODvUBiqA6uuxBBpdhsyD7h5TW
 c/gZgvyRI1vDWqCKq8qbQp3mgFt/iPvrtxyGjVfoCqYdhTJ+RzckzqchEPo3Jn8LsEo288
 pilTWy/5eIXMUg+gjWlPAUtTaHtkeO27Ck/8qxeuyDXGY2EXkcZmZ29+23Y6og==
X-Report-Abuse-To: abuse@transip.nl
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[herrie.org:s=transip-a];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[github.com@herrie.org,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-111509-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[herrie.org:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DMARC_NA(0.00)[herrie.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:djakov@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-pm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:github.com@herrie.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[github.com@herrie.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,devicetree.org:url,herrie.org:mid,herrie.org:dkim,herrie.org:from_mime,herrie.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 113E864D71B

Add a dt-binding schema and an interconnect master/slave ID header for
the MSM8x60 family (MSM8260/MSM8660/APQ8060) Network-on-Chip.  The
chip exposes four NoC fabrics that the qnoc-msm8660 driver models:

  AFAB  - Applications fabric (Scorpion CPU + L2)
  SFAB  - System fabric (DMA, SPS, security)
  MMFAB - Multimedia fabric (MDP, GPU, camera, video, rotator)
  DFAB  - Daytona fabric (SDC, ADM master/slave)

The schema covers all four compatible strings, per-fabric clock-name
lists (bus / bus_a / ebi1 / ebi1_a for AFAB; bus / bus_a / smi /
smi_a for MMFAB; bus / bus_a for SFAB and DFAB), the required
qcom,rpm phandle through which the provider hands the arbitration
buffer to RPM firmware, and #interconnect-cells = <1>.

The ID header lists per-fabric master / slave / gateway indices
derived from the legacy vendor msm_bus_board_8660.c enums,
normalised to the upstream interconnect-framework naming convention.

Assisted-by: Claude:claude-opus-4-7 Sashiko:claude-haiku-4-5
Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
---
 .../bindings/interconnect/qcom,msm8660.yaml        | 166 +++++++++++++++++++++
 include/dt-bindings/interconnect/qcom,msm8660.h    | 156 +++++++++++++++++++
 2 files changed, 322 insertions(+)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,msm8660.yaml b/Documentation/devicetree/bindings/interconnect/qcom,msm8660.yaml
new file mode 100644
index 000000000000..ff28c7d46c32
--- /dev/null
+++ b/Documentation/devicetree/bindings/interconnect/qcom,msm8660.yaml
@@ -0,0 +1,166 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interconnect/qcom,msm8660.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm MSM8x60 family Network-On-Chip interconnect
+
+maintainers:
+  - Herman van Hazendonk <github.com@herrie.org>
+
+description: |
+  The Qualcomm MSM8x60 family (MSM8260/MSM8660/APQ8060) NoC is split into
+  four fabrics, each modelled as a separate interconnect provider:
+
+    APPSS fabric    Scorpion CPU cluster, L2 cache, EBI (DDR) memory.
+    System fabric   DMA controllers, modem and LPASS cross-domain links,
+                    security peripherals.
+    Multimedia fab  Display (MDP), GPU, camera (VFE), video codec (VPE),
+                    JPEG, with the SMI scratchpad as the local slave.
+    Daytona fabric  SDC1..SDC5 controllers and ADM master/slave channels.
+
+  Each provider programs fabric arbitration (per-master priority tier and
+  per-slave bandwidth vote) through RPM firmware via the qcom,rpm parent
+  controller, in addition to scaling its bus clocks via clk_set_rate.
+
+properties:
+  compatible:
+    enum:
+      - qcom,msm8660-apps-fabric
+      - qcom,msm8660-system-fabric
+      - qcom,msm8660-mmss-fabric
+      - qcom,msm8660-daytona-fabric
+
+  '#interconnect-cells':
+    const: 1
+    description:
+      Each consumer phandle takes the form <provider node-id> where node-id
+      indexes the per-fabric ID array in
+      <dt-bindings/interconnect/qcom,msm8660.h>.  qcom,rpm-common.yaml
+      permissively allows 2 cells (and 1 marked deprecated); pin this
+      provider to 1, which is what of_icc_xlate_onecell strictly expects.
+
+  clocks:
+    minItems: 2
+    maxItems: 4
+
+  clock-names:
+    minItems: 2
+    maxItems: 4
+
+  qcom,rpm:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the qcom,rpm node.  The interconnect provider hands the
+      per-fabric arbitration buffer to RPM firmware through this resource,
+      so a production device tree must point at the system RPM.
+
+required:
+  - compatible
+  - clocks
+  - clock-names
+  - qcom,rpm
+  - '#interconnect-cells'
+
+allOf:
+  - $ref: qcom,rpm-common.yaml#
+  - if:
+      properties:
+        compatible:
+          const: qcom,msm8660-apps-fabric
+    then:
+      properties:
+        clocks:
+          items:
+            - description: APPSS fabric bus clock (active vote)
+            - description: APPSS fabric bus clock (active+sleep vote)
+            - description: EBI1 (DDR) channel clock (active vote)
+            - description: EBI1 (DDR) channel clock (active+sleep vote)
+        clock-names:
+          items:
+            - const: bus
+            - const: bus_a
+            - const: ebi1
+            - const: ebi1_a
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,msm8660-system-fabric
+            - qcom,msm8660-daytona-fabric
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Fabric bus clock (active vote)
+            - description: Fabric bus clock (active+sleep vote)
+        clock-names:
+          items:
+            - const: bus
+            - const: bus_a
+  - if:
+      properties:
+        compatible:
+          const: qcom,msm8660-mmss-fabric
+    then:
+      properties:
+        clocks:
+          items:
+            - description: MMSS fabric bus clock (active vote)
+            - description: MMSS fabric bus clock (active+sleep vote)
+            - description: SMI scratchpad clock (active vote)
+            - description: SMI scratchpad clock (active+sleep vote)
+        clock-names:
+          items:
+            - const: bus
+            - const: bus_a
+            - const: smi
+            - const: smi_a
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmcc.h>
+
+    interconnect-afab {
+        compatible = "qcom,msm8660-apps-fabric";
+        clocks = <&rpmcc RPM_APPS_FABRIC_CLK>,
+                 <&rpmcc RPM_APPS_FABRIC_A_CLK>,
+                 <&rpmcc RPM_EBI1_CLK>,
+                 <&rpmcc RPM_EBI1_A_CLK>;
+        clock-names = "bus", "bus_a", "ebi1", "ebi1_a";
+        qcom,rpm = <&rpm>;
+        #interconnect-cells = <1>;
+    };
+
+    interconnect-sfab {
+        compatible = "qcom,msm8660-system-fabric";
+        clocks = <&rpmcc RPM_SYS_FABRIC_CLK>,
+                 <&rpmcc RPM_SYS_FABRIC_A_CLK>;
+        clock-names = "bus", "bus_a";
+        qcom,rpm = <&rpm>;
+        #interconnect-cells = <1>;
+    };
+
+    interconnect-mmfab {
+        compatible = "qcom,msm8660-mmss-fabric";
+        clocks = <&rpmcc RPM_MM_FABRIC_CLK>,
+                 <&rpmcc RPM_MM_FABRIC_A_CLK>,
+                 <&rpmcc RPM_SMI_CLK>,
+                 <&rpmcc RPM_SMI_A_CLK>;
+        clock-names = "bus", "bus_a", "smi", "smi_a";
+        qcom,rpm = <&rpm>;
+        #interconnect-cells = <1>;
+    };
+
+    interconnect-dfab {
+        compatible = "qcom,msm8660-daytona-fabric";
+        clocks = <&rpmcc RPM_DAYTONA_FABRIC_CLK>,
+                 <&rpmcc RPM_DAYTONA_FABRIC_A_CLK>;
+        clock-names = "bus", "bus_a";
+        qcom,rpm = <&rpm>;
+        #interconnect-cells = <1>;
+    };
+...
diff --git a/include/dt-bindings/interconnect/qcom,msm8660.h b/include/dt-bindings/interconnect/qcom,msm8660.h
new file mode 100644
index 000000000000..c9ce3f5a5276
--- /dev/null
+++ b/include/dt-bindings/interconnect/qcom,msm8660.h
@@ -0,0 +1,156 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Qualcomm MSM8x60 family (MSM8260/MSM8660/APQ8060) interconnect IDs
+ *
+ * Copyright (c) 2026 Herman van Hazendonk <github.com@herrie.org>
+ *
+ * Based on webOS kernel msm_bus_board_8660.c
+ * Copyright (c) 2010-2011, Code Aurora Forum. All rights reserved.
+ */
+
+#ifndef __DT_BINDINGS_INTERCONNECT_QCOM_MSM8660_H
+#define __DT_BINDINGS_INTERCONNECT_QCOM_MSM8660_H
+
+/*
+ * MSM8x60 has a fabric-based bus architecture:
+ * - APPSS Fabric: CPU and memory interface
+ * - System Fabric: System peripherals and DMA
+ * - MMSS Fabric: Multimedia subsystem (display, camera, video)
+ * - Daytona Fabric: Peripheral bus (SDCC, ADM DMA)
+ * - System FPB: System Fast Peripheral Bus
+ * - CPSS FPB: CPU Subsystem Fast Peripheral Bus
+ */
+
+/* APPSS Fabric - Apps processor fabric */
+#define AFAB_MAS_AMPSS_M0		0
+#define AFAB_MAS_AMPSS_M1		1
+#define AFAB_SLV_EBI_CH0		2
+#define AFAB_SLV_AMPSS_L2		3
+#define AFAB_TO_MMSS			4
+#define AFAB_TO_SYSTEM			5
+
+/* System Fabric - System bus */
+#define SFAB_MAS_APPSS			0
+#define SFAB_MAS_SPS			1
+#define SFAB_MAS_ADM0_PORT0		2
+#define SFAB_MAS_ADM0_PORT1		3
+#define SFAB_MAS_ADM1_PORT0		4
+#define SFAB_MAS_ADM1_PORT1		5
+#define SFAB_MAS_LPASS_PROC		6
+#define SFAB_MAS_MSS_PROCI		7
+#define SFAB_MAS_MSS_PROCD		8
+#define SFAB_MAS_MSS_MDM_PORT0		9
+#define SFAB_MAS_LPASS			10
+#define SFAB_MAS_MMSS_FPB		11
+#define SFAB_MAS_ADM1_CI		12
+#define SFAB_MAS_ADM0_CI		13
+#define SFAB_MAS_MSS_MDM_PORT1		14
+#define SFAB_MAS_USB_HS			15
+#define SFAB_TO_APPSS			16
+#define SFAB_TO_SYSTEM_FPB		17
+#define SFAB_TO_CPSS_FPB		18
+#define SFAB_SLV_SPS			19
+#define SFAB_SLV_SYSTEM_IMEM		20
+#define SFAB_SLV_AMPSS			21
+#define SFAB_SLV_MSS			22
+#define SFAB_SLV_LPASS			23
+#define SFAB_SLV_MMSS_FPB		24
+#define SFAB_TO_DFAB			25
+
+/* MMSS Fabric - Multimedia subsystem */
+#define MMFAB_MAS_MDP_PORT0		0
+#define MMFAB_MAS_MDP_PORT1		1
+#define MMFAB_MAS_ADM1_PORT0		2
+#define MMFAB_MAS_ROTATOR		3
+#define MMFAB_MAS_GRAPHICS_3D		4
+#define MMFAB_MAS_JPEG_DEC		5
+#define MMFAB_MAS_GRAPHICS_2D_CORE0	6
+#define MMFAB_MAS_VFE			7
+#define MMFAB_MAS_VPE			8
+#define MMFAB_MAS_JPEG_ENC		9
+#define MMFAB_MAS_GRAPHICS_2D_CORE1	10
+#define MMFAB_MAS_HD_CODEC_PORT0	11
+#define MMFAB_MAS_HD_CODEC_PORT1	12
+#define MMFAB_TO_APPSS			13
+#define MMFAB_SLV_SMI			14
+#define MMFAB_SLV_MM_IMEM		15
+
+/*
+ * Daytona Fabric (DFAB) - Peripheral bus
+ *
+ * DFAB connects slower peripherals (SDCC, ADM DMA) to the system fabric.
+ * The webOS kernel managed DFAB bandwidth via voter clocks (dfab_sdc*_clk,
+ * dfab_usb_hs_clk). In mainline, this is handled by the interconnect framework.
+ *
+ * USB HS is included as a DFAB voter for compatibility with the legacy clock
+ * voting mechanism. The webOS kernel comment said: "if usb link is in sps
+ * there is no need for usb pclk as daytona fabric clock will be used instead".
+ * This keeps DFAB clock stable when USB is active.
+ */
+#define DFAB_MAS_SDC1			0
+#define DFAB_MAS_SDC2			1
+#define DFAB_MAS_SDC3			2
+#define DFAB_MAS_SDC4			3
+#define DFAB_MAS_SDC5			4
+#define DFAB_MAS_ADM0_MASTER		5
+#define DFAB_MAS_ADM1_MASTER		6
+#define DFAB_TO_SFAB			7
+#define DFAB_SLV_SDC1			8
+#define DFAB_SLV_SDC2			9
+#define DFAB_SLV_SDC3			10
+#define DFAB_SLV_SDC4			11
+#define DFAB_SLV_SDC5			12
+#define DFAB_MAS_USB_HS			13
+#define DFAB_MAS_DSPS			14
+
+/* System FPB - Slow peripheral bus for system */
+#define SFPB_MAS_SYSTEM			0
+#define SFPB_MAS_SPDM			1
+#define SFPB_MAS_RPM			2
+#define SFPB_SLV_SPDM			3
+#define SFPB_SLV_RPM			4
+#define SFPB_SLV_RPM_MSG_RAM		5
+#define SFPB_SLV_MPM			6
+#define SFPB_SLV_PMIC1_SSBI1_A		7
+#define SFPB_SLV_PMIC1_SSBI1_B		8
+#define SFPB_SLV_PMIC1_SSBI1_C		9
+#define SFPB_SLV_PMIC2_SSBI2_A		10
+#define SFPB_SLV_PMIC2_SSBI2_B		11
+
+/* CPSS FPB - CPU subsystem fast peripheral bus */
+#define CFPB_MAS_SYSTEM			0
+#define CFPB_SLV_GSBI1_UART		1
+#define CFPB_SLV_GSBI2_UART		2
+#define CFPB_SLV_GSBI3_UART		3
+#define CFPB_SLV_GSBI4_UART		4
+#define CFPB_SLV_GSBI5_UART		5
+#define CFPB_SLV_GSBI6_UART		6
+#define CFPB_SLV_GSBI7_UART		7
+#define CFPB_SLV_GSBI8_UART		8
+#define CFPB_SLV_GSBI9_UART		9
+#define CFPB_SLV_GSBI10_UART		10
+#define CFPB_SLV_GSBI11_UART		11
+#define CFPB_SLV_GSBI12_UART		12
+#define CFPB_SLV_GSBI1_QUP		13
+#define CFPB_SLV_GSBI2_QUP		14
+#define CFPB_SLV_GSBI3_QUP		15
+#define CFPB_SLV_GSBI4_QUP		16
+#define CFPB_SLV_GSBI5_QUP		17
+#define CFPB_SLV_GSBI6_QUP		18
+#define CFPB_SLV_GSBI7_QUP		19
+#define CFPB_SLV_GSBI8_QUP		20
+#define CFPB_SLV_GSBI9_QUP		21
+#define CFPB_SLV_GSBI10_QUP		22
+#define CFPB_SLV_GSBI11_QUP		23
+#define CFPB_SLV_GSBI12_QUP		24
+#define CFPB_SLV_EBI2_NAND		25
+#define CFPB_SLV_USB_FS1		26
+#define CFPB_SLV_USB_FS2		27
+#define CFPB_SLV_TSIF			28
+#define CFPB_SLV_MSM_TSSC		29
+#define CFPB_SLV_MSM_PDM		30
+#define CFPB_SLV_MSM_DIMEM		31
+#define CFPB_SLV_MSM_TCSR		32
+#define CFPB_SLV_MSM_PRNG		33
+
+#endif /* __DT_BINDINGS_INTERCONNECT_QCOM_MSM8660_H */

-- 
2.43.0


