Return-Path: <linux-arm-msm+bounces-24359-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C86919925
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 22:35:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A6094B21723
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 20:35:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D554A193079;
	Wed, 26 Jun 2024 20:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="Ap7TFOhZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (static.95.144.75.5.clients.your-server.de [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E746E5FD;
	Wed, 26 Jun 2024 20:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719434118; cv=none; b=dha7K5sqE2S5YCg1he2bFH/0F4E8bv2oLlPrFHucPOF0po7mnLkTAvGp7k7HQuWw4QXGMFQNHs3vGCRoFAlOjQyigQbBCZ2Dsw99d8bxyczz+Y5eFzqg0MFwXZKrT0lkOrM8/oYzJxVdoYaEgZOLrp02Eop55dCN8N/zQs+2U5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719434118; c=relaxed/simple;
	bh=pWcHcvfr3kqdBm/E+Ur/7UMdIL3vFaFG3L6PX9vs6js=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OHwMmHn6zyLweWN00djL+bXGv4LaChTXYNSw5rDExQ8xJM3+gv1iYC9NnaG9Kw0htYTz5JJjZAbVQQI9t2uZ84xrKvDkFxRiD8C0eiZjaG/Wt36tyoEvtXztsQSOIJPNQ2ei8/+WblDLWCrciga7WIU2Dz87egHRxOUIMma9NC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=Ap7TFOhZ; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from [192.168.1.130] (BC2492F3.dsl.pool.telekom.hu [188.36.146.243])
	by mail.mainlining.org (Postfix) with ESMTPSA id 26D60E44DC;
	Wed, 26 Jun 2024 20:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1719434114;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VNElI6LrZpyQThn0ZE8harhLAafAKOTTyhrSfItX7qs=;
	b=Ap7TFOhZ4RvUk6dkrOkLMiZp0Tk2WbnSW9zmIqO+/nwZQWNu5x8Ph4jjc3/HuWnqpepOF8
	pD5f2yfT9CS74/jxtiLtePU9uvkjEEgXBqTBX8iYNvAKgEcDKG/xC/SzmGzaREVOX/mFkV
	ITm3ODdJanThdkG5OB3t8uixTBD64f5TT31SVerZBLya+pNYWhJ2WL21CffyFtG+u3q+gR
	NkOPWs9bHG3a4yw8sDo7PiSBpZro8EeUjqdPzDgXN+x4YC3ZwV8faCftn5xQmv3AQovQKN
	ZnF3naOD07GrsYR8JlfMPqP5Llo/pbSYx4AnHWtsIbmSzDrut/7flpaNp6kTVw==
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Wed, 26 Jun 2024 22:35:01 +0200
Subject: [PATCH 1/2] dt-bindings: interconnect: qcom: Add Qualcomm MSM8953
 NoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240626-msm8953-interconnect-v1-1-eeb31a2231b0@mainlining.org>
References: <20240626-msm8953-interconnect-v1-0-eeb31a2231b0@mainlining.org>
In-Reply-To: <20240626-msm8953-interconnect-v1-0-eeb31a2231b0@mainlining.org>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 Vladimir Lypak <vladimir.lypak@gmail.com>
X-Mailer: b4 0.14.0

From: Vladimir Lypak <vladimir.lypak@gmail.com>

Add the device-tree bindings for interconnect providers
used on MSM8953 platform.

Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 .../bindings/interconnect/qcom,msm8953.yaml        | 100 +++++++++++++++++++++
 include/dt-bindings/interconnect/qcom,msm8953.h    |  93 +++++++++++++++++++
 2 files changed, 193 insertions(+)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,msm8953.yaml b/Documentation/devicetree/bindings/interconnect/qcom,msm8953.yaml
new file mode 100644
index 000000000000..c24339f37233
--- /dev/null
+++ b/Documentation/devicetree/bindings/interconnect/qcom,msm8953.yaml
@@ -0,0 +1,100 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interconnect/qcom,msm8953.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm MSM8953 Network-On-Chip interconnect
+
+maintainers:
+  - Barnabas Czeman <barnabas.czeman@mainlining.org>
+
+description: |
+  The Qualcomm MSM8953 interconnect providers support adjusting the
+  bandwidth requirements between the various NoC fabrics.
+
+  See also:
+  - dt-bindings/interconnect/qcom,msm8953.h
+
+allOf:
+  - $ref: qcom,rpm-common.yaml#
+  - if:
+      properties:
+        compatible:
+          const: qcom,msm8953-pcnoc
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: PCNOC USB3 AXI Clock.
+
+        clock-names:
+          const: pcnoc_usb3_axi
+
+      required:
+        - compatible
+        - reg
+        - clocks
+        - clock-names
+        - '#interconnect-cells'
+
+properties:
+  compatible:
+    enum:
+      - qcom,msm8953-bimc
+      - qcom,msm8953-pcnoc
+      - qcom,msm8953-snoc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    maxItems: 1
+
+  '#interconnect-cells':
+    const: 2
+
+patternProperties:
+  '^interconnect-[a-z0-9\-]+$':
+    type: object
+    $ref: qcom,rpm-common.yaml#
+    unevaluatedProperties: false
+    description:
+      The interconnect providers do not have a separate QoS register space,
+      but share parent's space.
+
+    properties:
+      compatible:
+        const: qcom,msm8953-snoc-mm
+
+    required:
+      - compatible
+      - '#interconnect-cells'
+
+required:
+  - compatible
+  - reg
+  - '#interconnect-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+      #include <dt-bindings/clock/qcom,gcc-msm8953.h>
+
+      snoc: interconnect@580000 {
+          compatible = "qcom,msm8953-snoc";
+          reg = <0x580000 0x16080>;
+
+          #interconnect-cells = <2>;
+
+          snoc_mm: interconnect-snoc {
+              compatible = "qcom,msm8953-snoc-mm";
+
+              #interconnect-cells = <2>;
+          };
+      };
diff --git a/include/dt-bindings/interconnect/qcom,msm8953.h b/include/dt-bindings/interconnect/qcom,msm8953.h
new file mode 100644
index 000000000000..12564c434af7
--- /dev/null
+++ b/include/dt-bindings/interconnect/qcom,msm8953.h
@@ -0,0 +1,93 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Qualcomm MSM8953 interconnect IDs
+ */
+
+#ifndef __DT_BINDINGS_INTERCONNECT_QCOM_MSM8953_H
+#define __DT_BINDINGS_INTERCONNECT_QCOM_MSM8953_H
+
+/* BIMC fabric */
+#define MAS_APPS_PROC		0
+#define MAS_OXILI		1
+#define MAS_SNOC_BIMC_0		2
+#define MAS_SNOC_BIMC_2		3
+#define MAS_SNOC_BIMC_1		4
+#define MAS_TCU_0		5
+#define SLV_EBI			6
+#define SLV_BIMC_SNOC		7
+
+/* PCNOC fabric */
+#define MAS_SPDM		0
+#define MAS_BLSP_1		1
+#define MAS_BLSP_2		2
+#define MAS_USB3		3
+#define MAS_CRYPTO		4
+#define MAS_SDCC_1		5
+#define MAS_SDCC_2		6
+#define MAS_SNOC_PCNOC		7
+#define PCNOC_M_0		8
+#define PCNOC_M_1		9
+#define PCNOC_INT_1		10
+#define PCNOC_INT_2		11
+#define PCNOC_S_0		12
+#define PCNOC_S_1		13
+#define PCNOC_S_2		14
+#define PCNOC_S_3		15
+#define PCNOC_S_4		16
+#define PCNOC_S_6		17
+#define PCNOC_S_7		18
+#define PCNOC_S_8		19
+#define PCNOC_S_9		20
+#define SLV_SPDM		21
+#define SLV_PDM			22
+#define SLV_TCSR		23
+#define SLV_SNOC_CFG		24
+#define SLV_TLMM		25
+#define SLV_MESSAGE_RAM		26
+#define SLV_BLSP_1		27
+#define SLV_BLSP_2		28
+#define SLV_PRNG		29
+#define SLV_CAMERA_SS_CFG	30
+#define SLV_DISP_SS_CFG		31
+#define SLV_VENUS_CFG		32
+#define SLV_GPU_CFG		33
+#define SLV_SDCC_1		34
+#define SLV_SDCC_2		35
+#define SLV_CRYPTO_0_CFG	36
+#define SLV_PMIC_ARB		37
+#define SLV_USB3		38
+#define SLV_IPA_CFG		39
+#define SLV_TCU			40
+#define SLV_PCNOC_SNOC		41
+
+/* SNOC fabric */
+#define MAS_QDSS_BAM		0
+#define MAS_BIMC_SNOC		1
+#define MAS_PCNOC_SNOC		2
+#define MAS_IPA			3
+#define MAS_QDSS_ETR		4
+#define QDSS_INT		5
+#define SNOC_INT_0		6
+#define SNOC_INT_1		7
+#define SNOC_INT_2		8
+#define SLV_KPSS_AHB		9
+#define SLV_WCSS		10
+#define SLV_SNOC_BIMC_1		11
+#define SLV_IMEM		12
+#define SLV_SNOC_PCNOC		13
+#define SLV_QDSS_STM		14
+#define SLV_CATS_1		15
+#define SLV_LPASS		16
+
+/* SNOC-MM fabric */
+#define MAS_JPEG		0
+#define MAS_MDP			1
+#define MAS_VENUS		2
+#define MAS_VFE0		3
+#define MAS_VFE1		4
+#define MAS_CPP			5
+#define SLV_SNOC_BIMC_0		6
+#define SLV_SNOC_BIMC_2		7
+#define SLV_CATS_0		8
+
+#endif /* __DT_BINDINGS_INTERCONNECT_QCOM_MSM8953_H */

-- 
2.45.2


