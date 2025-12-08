Return-Path: <linux-arm-msm+bounces-84659-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 42FE1CAD1DB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Dec 2025 13:26:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2F96130161E5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Dec 2025 12:26:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0874930102B;
	Mon,  8 Dec 2025 12:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j3OFyOS6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C34CC2F28FB;
	Mon,  8 Dec 2025 12:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765196775; cv=none; b=hebKWoRvrF3NkFs9g3pmQjzTmX/Yygb5gyNNwAs/ASvjghB8MLL5+kEgWLBdT87Irv4RrvwhjDKDIpVdFRNGHkNisABY+7XIl6w6GNIhOQVrxlgEoZnDFVilFeAqrqWHggnZSG40wol2HKtDPyW3JK6WJH3Axwr2YAyBRBxLHLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765196775; c=relaxed/simple;
	bh=u3U7pkyTwnB7c2Os5WO75v40qCVDPhanlFJnWJJ1KxQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jTHUqlKWZNhejb1ocFz8sDXCJKlWuWTQCpZVq0Nl0DHW1hu4j96TljGB0rJON9g32W0RcJcngfA+Ee+HVm2EMMKxiormet1IMF6vi4zPxBfdYNQgtJy85im4DJOrv/f1MsN+RKfTT5cwlF3XNfShr26oV+m+tpWrYyGWnPVz+Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j3OFyOS6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 72E50C16AAE;
	Mon,  8 Dec 2025 12:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765196775;
	bh=u3U7pkyTwnB7c2Os5WO75v40qCVDPhanlFJnWJJ1KxQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=j3OFyOS6wAyQIAWyI6Ofz1E/WOk/MTQ/gnNgiXSqrKdEiDbTzGETvkqy8oTuLfcmN
	 g0Vzq36AHJg+Rhn8JC0J4zKvFK6g2oVr3j1yBcFi+Xv7eY37qxa6ylFGicr9szcLJi
	 ebzFzf+oW8ZxFv3LU7Zn0Lc8KGKmMCzgqeMCi/HsKiNySKaYFo9vMI3466M/fjaKjW
	 rs0anIoTyXzCfyBy52DuWwdmgNYRh9xZSrBbV5o+3/dkp9M95ScC7SmriJzhV+tb/B
	 AMDQ6YvCBbwNZXpoC1OxpUK9DgeiSzOrcC8AnooCydh1OMpiGgs59N9JBmQmrovpKQ
	 iJy7h/GW6Fnyw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EA70D3B7E2;
	Mon,  8 Dec 2025 12:26:15 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Mon, 08 Dec 2025 16:25:34 +0400
Subject: [PATCH v6 2/8] dt-bindings: remoteproc: qcom: document hexagon
 based WCSS secure PIL
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251208-ipq5018-wifi-v6-2-d0ce2facaa5f@outlook.com>
References: <20251208-ipq5018-wifi-v6-0-d0ce2facaa5f@outlook.com>
In-Reply-To: <20251208-ipq5018-wifi-v6-0-d0ce2facaa5f@outlook.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Manikanta Mylavarapu <quic_mmanikan@quicinc.com>, 
 Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765196772; l=5640;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=DYA2zq1ePczBFUG9d6EFsq6Fency+GX6+e/U5k4kiBg=;
 b=FoIbyAIfKP5UJ/b/XgHhcBYhgz4fYbYN3MvsXoJ2UzpHVqIDAc2jmNpNPA7S6lSzATZ226zUA
 hVOykxLNjqwBDCnwGbHwhB+GQpYtLwRW81QrCw3sVCDyU0rxFt1fKbg
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
Reply-To: george.moussalem@outlook.com

From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>

Add new binding document for hexagon based WCSS secure PIL remoteproc.
IPQ5018, IPQ5332, IPQ5424 and IPQ9574 follow secure PIL remoteproc.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Signed-off-by: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
---
 .../bindings/remoteproc/qcom,wcss-sec-pil.yaml     | 176 +++++++++++++++++++++
 1 file changed, 176 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,wcss-sec-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,wcss-sec-pil.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..ec454c070ba59e763edce5190c966e8608714eaf
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,wcss-sec-pil.yaml
@@ -0,0 +1,176 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/qcom,wcss-sec-pil.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm WCSS Secure Peripheral Image Loader
+
+maintainers:
+  - Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
+
+description:
+  Wireless Connectivity Subsystem (WCSS) Secure Peripheral Image Loader loads
+  firmware and power up QDSP6 remoteproc on the Qualcomm IPQ series SoC.
+
+properties:
+  compatible:
+    enum:
+      - qcom,ipq5018-wcss-sec-pil
+      - qcom,ipq5332-wcss-sec-pil
+      - qcom,ipq5424-wcss-sec-pil
+      - qcom,ipq9574-wcss-sec-pil
+
+  reg:
+    maxItems: 1
+
+  firmware-name:
+    maxItems: 1
+    description: Firmware name for the Hexagon core
+
+  interrupts:
+    items:
+      - description: Watchdog interrupt
+      - description: Fatal interrupt
+      - description: Ready interrupt
+      - description: Handover interrupt
+      - description: Stop acknowledge interrupt
+
+  interrupt-names:
+    items:
+      - const: wdog
+      - const: fatal
+      - const: ready
+      - const: handover
+      - const: stop-ack
+
+  clocks:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+
+  clock-names:
+    $ref: /schemas/types.yaml#/definitions/string-array
+
+  mboxes:
+    items:
+      - description: A phandle to the TMECom mailbox device node
+
+  qcom,smem-states:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: States used by the AP to signal the remote processor
+    items:
+      - description: Stop Q6
+      - description: Shutdown Q6
+
+  qcom,smem-state-names:
+    description:
+      Names of the states used by the AP to signal the remote processor
+    items:
+      - const: stop
+      - const: shutdown
+
+  memory-region:
+    items:
+      - description: Q6 reserved region
+
+  glink-edge:
+    $ref: /schemas/remoteproc/qcom,glink-edge.yaml#
+    description:
+      Qualcomm G-Link subnode which represents communication edge, channels
+      and devices related to the Modem.
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - firmware-name
+  - interrupts
+  - interrupt-names
+  - qcom,smem-states
+  - qcom,smem-state-names
+  - memory-region
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,ipq5018-wcss-sec-pil
+    then:
+      properties:
+        clocks:
+          items:
+            - description: sleep clock
+            - description: AHB interconnect clock
+        clock-names:
+          items:
+            - const: sleep
+            - const: interconnect
+      required:
+        - clocks
+        - clock-names
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,ipq5332-wcss-sec-pil
+    then:
+      properties:
+        clocks:
+          items:
+            - description: sleep clock
+        clock-names:
+          items:
+            - const: sleep
+      required:
+        - clocks
+        - clock-names
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,ipq5424-wcss-sec-pil
+              - qcom,ipq9574-wcss-sec-pil
+    then:
+      properties:
+        clocks: false
+        clock-names: false
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/qcom,ipq5424-gcc.h>
+    remoteproc@d100000 {
+      compatible = "qcom,ipq5424-wcss-sec-pil";
+      reg = <0x0d100000 0x4040>;
+      firmware-name = "ath12k/IPQ5424/hw1.0/q6_fw0.mbn";
+      interrupts-extended = <&intc GIC_SPI 508 IRQ_TYPE_EDGE_RISING>,
+                            <&wcss_smp2p_in 0 IRQ_TYPE_NONE>,
+                            <&wcss_smp2p_in 1 IRQ_TYPE_NONE>,
+                            <&wcss_smp2p_in 2 IRQ_TYPE_NONE>,
+                            <&wcss_smp2p_in 3 IRQ_TYPE_NONE>;
+      interrupt-names = "wdog",
+                        "fatal",
+                        "ready",
+                        "handover",
+                        "stop-ack";
+
+      mboxes = <&tmel_qmp 0>;
+      qcom,smem-states = <&wcss_smp2p_out 1>,
+                         <&wcss_smp2p_out 0>;
+      qcom,smem-state-names = "stop",
+                              "shutdown";
+
+      memory-region = <&q6_region>;
+
+      glink-edge {
+        interrupts = <GIC_SPI 500 IRQ_TYPE_EDGE_RISING>;
+        label = "rtr";
+        qcom,remote-pid = <1>;
+        mboxes = <&apcs_glb 8>;
+      };
+    };

-- 
2.52.0



