Return-Path: <linux-arm-msm+bounces-85768-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D76BCCE720
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 05:34:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D148A303213E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 04:34:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 253A2284883;
	Fri, 19 Dec 2025 04:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aBPi/TdK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7248D242D9B
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 04:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766118874; cv=none; b=VxZQPsF6z5aXA/0hWXrSANFnFWV93fMPLsFbZHA4ozkc/TYS/UHFgsI300mibvgzAtmJBbdWcpbBAmE25cGRZckK0EAsiqVUuWOR1v8P4BbjGssei+Ay2BHbuufKcGEsCEuSHUI7D2I2gQTQK+C54FknOzjeIy7BP8/SDIZsiDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766118874; c=relaxed/simple;
	bh=B5Nh6kigFija2HmeT/lh1Fs7EgevojvjLkr3wL2y7jc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nLiWbIILh0qgarJeFqTbsZ+noFtqDUrtXMlyjRTFZjKF+lU9On46yY61dsioFy3ERGjco4p3SywdVJMWujBtLlWLr+jsy5XfZUkr07B25pG291k+z6PwkD4EQ5MhFMEZHXIvSSoVNUDCPlvyt5PkbDPZadLkX8jVNkj45CHKUPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aBPi/TdK; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-7881b67da53so11439247b3.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 20:34:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766118870; x=1766723670; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OLzZkCyOJoF6qRoHbrdjySEIeNcke908WdXs5RK2jks=;
        b=aBPi/TdKNA+uLYROYEnhPgXg2YP7HRQOC5gBn6dNFeN5vz0jXaDmxtf8d2m6sfIvQW
         pbuMdASdcGxcv8tUoYkbUF6SZD3tT8vQHCnGQjRwv+pAvs99jCMmq1wec1tkSzHGXXup
         lXl4aDjdvb3GXNEqmjhGZ8dFTjqP5FdddMA7NefQeT2fMv+P5e+yhcntojNv5kdWvD27
         wc+2B4kXKvliGOwQKmC2RVc9jWubUDHIrg1fLy9Y+Z8l2QO7SlZfuxR9Y8YKiTH6zop9
         0wV1uu2ejxuT1GyZEjweQoB/USrhHEw92kFYkrgcnAm+v+X2uWEByyWpaP0ffmEBuqD/
         nQSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766118870; x=1766723670;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OLzZkCyOJoF6qRoHbrdjySEIeNcke908WdXs5RK2jks=;
        b=Oa3PL56a5Quag2JRaJJ7GuWyDC8o9vkm3jbjK8I7cbMTWrWFla5+N0EJ0Envg8wZRq
         NkMgEjLF1DSdgsMPsH02xIRPmwnP1yyDfn/jxf9v5stTsKCN3i3V0auYQ4NSj1+bxuBi
         HxHc2ad/itIed9YxXoLNLRsT1iI+7JqaZoJRCeULAXzg9W+g7RvxjoZ2qZIihEm2/1Mx
         +Bdy5EUksMlcqGJLljtrppzrq6YCxhw+I+qdBxpzVcgxk9tlz54AM0EvHyeVvqvyLh3T
         cirvPsH+Nd5CpzyLPKq2hGWbjdrB3wDMvWQBjRiSLmvXmdRzhP8MLMyzW7CrnWi0Xux1
         8CjA==
X-Gm-Message-State: AOJu0YxT0y/ftJ9AdOCpvCwbOW0/t1iaSwQnpqhOUFlqz/E9tfIQfMEE
	OHo26LyFBFyLdl7ZjohMSHMPyNTDjXZLZ7cAcmqGj7Arx9rG5Gszye4g
X-Gm-Gg: AY/fxX4qw0B/FzUCAZsSOQWvMUHFEIISNGzeMGprbir8lPKdMaj+vHZIrs5P2V4O9hs
	Plsvoro4p2EoKOF+yzXpRhL+1hR+NtVGgu18r80NxZ0iX83vbR+w5gpThgcqQF+9UbDXdI57wIj
	iTw033wXx2q0pPI65f/WMZxPSrD62A3zr3qzf1oA/j7/Ta0wU2t+fD0B3XsqtzoC+bhK0LSd2Jm
	DplaVZEgIhRHj2XCvRcqITaTHaA9i5wHySwLdgw5gO3GUQQVNAv03Ve/K4CWwzY6cVaDaGk/Lp4
	JHuRKygmbLiuO634lnYaavd5nOG6EnJrRPk/J9sJoVBZgv7sM5A7x8wvpZ//kaS5i7hsm+OUzws
	vDQDzYG1e2pGW0ttfMKi9cvMajM7WYfoSgsNesEOgXLbOsahQS9zHZQ4S4A5QE+7FZzLqE2a2qm
	Nu37jN8kG7pKxvtoQRh20IAXkafo5zAdHroZCQd/Eut0SVA+EbWyIV/fSZPKTC+EZLaEsS+xebq
	N1wDNSk6cac0Uyla7QH/czKfjj6
X-Google-Smtp-Source: AGHT+IHwO+bcKdFSJ1MxZa5VAJDaPfkBY6j+bhjGdvTYU52B753PLX9O7ae7X/BJN8TinnoqQ8VWTQ==
X-Received: by 2002:a05:690c:6f8e:b0:78c:67b5:e7ba with SMTP id 00721157ae682-78fb3f4930fmr15913927b3.24.1766118870387;
        Thu, 18 Dec 2025 20:34:30 -0800 (PST)
Received: from nukework.lan (c-98-57-15-22.hsd1.tx.comcast.net. [98.57.15.22])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78fb452c441sm5610227b3.46.2025.12.18.20.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 20:34:28 -0800 (PST)
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org,
	krzk+dt@kernel.org,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandru Gagniuc <mr.nuke.me@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/9] dt-bindings: remoteproc: qcom,ipq8074-wcss-pil: convert to DT schema
Date: Thu, 18 Dec 2025 22:34:09 -0600
Message-ID: <20251219043425.888585-1-mr.nuke.me@gmail.com>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the QCS404 and IPQ WCSS Peripheral Image Loader bindings to DT
schema. The text bindngs incorrectly implied that IPQ8074 needs only
one qcom,smem-states entry. This is only true for QCS404. IPQ8074
requires both "stop" and "shutdown".

The example is to be added in a subsequent commit that adds the
IPQ9574 binding.

Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>

---
Changes since RFC
 - rename binding from ipq9574 to ipq8074
 - use a real person instead of placeholder as maintainer
 - drop redundant minItems and descriptions
 - merge if: clauses as suggested by Krzysztof
 - various other fixes suggested by Krzysztof

I used my name as a placeholder for the "maintainer" field. Krzysztof
mentioned to get the "SOC maintainer" using get_maintainer. I don't
know how to do that, and I don't see anyone listed for QCS404,
IPQ8074, or IPQ9574. The bindings apply to any of those SOCs.
---
 .../remoteproc/qcom,ipq8074-wcss-pil.yaml     | 156 ++++++++++++++++++
 .../bindings/remoteproc/qcom,q6v5.txt         | 102 ------------
 2 files changed, 156 insertions(+), 102 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,ipq8074-wcss-pil.yaml
 delete mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,ipq8074-wcss-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,ipq8074-wcss-pil.yaml
new file mode 100644
index 0000000000000..dea46cb9f93fe
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,ipq8074-wcss-pil.yaml
@@ -0,0 +1,156 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm IPQ WCSS Peripheral Image Loader
+
+maintainers:
+  - Alexandru Gagniuc <mr.nuke.me@gmail.com>
+
+description:
+  The IPQ WCSS peripheral image loader is used to load firmware on the Qualcomm
+  Q6 processor that exposes WiFi-6 devices to the OS via the AHB bus. It is
+  generally used by ath11k to start up the wireless firmware.
+
+properties:
+  compatible:
+    enum:
+      - qcom,ipq8074-wcss-pil
+      - qcom,qcs404-wcss-pil
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: qdsp6
+      - const: rmb
+
+  interrupts:
+    maxItems: 5
+
+  interrupt-names:
+    items:
+      - const: wdog
+      - const: fatal
+      - const: ready
+      - const: handover
+      - const: stop-ack
+
+  resets:
+    maxItems: 3
+
+  reset-names:
+    items:
+      - const: wcss_aon_reset
+      - const: wcss_reset
+      - const: wcss_q6_reset
+
+  clocks:
+    maxItems: 10
+
+  clock-names:
+    maxItems: 10
+
+  cx-supply:
+    description:
+      reference to the regulators used for the booting of the Hexagon core
+
+  memory-region:
+    maxItems: 1
+
+  qcom,halt-regs:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description:
+      A phandle reference to a syscon representing TCSR followed by the three
+      offsets within syscon for q6, wcss and nc halt registers.
+    items:
+      - items:
+          - description: phandle to TCSR_MUTEX registers
+          - description: offset to the Q6 halt register
+          - description: offset to the wcss halt register
+          - description: offset to the nc halt register
+
+  qcom,smem-states:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    maxItems: 2
+    description: States used by the AP to signal the remote processor
+
+  qcom,smem-state-names:
+    maxItems: 2
+    description:
+      Names of the states used by the AP to signal the remote processor
+
+  glink-edge:
+    $ref: /schemas/remoteproc/qcom,glink-edge.yaml#
+    description:
+      Qualcomm G-Link subnode which represents communication edge, channels
+      and devices related to the Modem.
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts-extended
+  - interrupt-names
+  - memory-region
+  - qcom,halt-regs
+  - qcom,smem-states
+  - qcom,smem-state-names
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,ipq8074-wcss-pil
+    then:
+      properties:
+        qcom,smem-states:
+          items:
+            - description: Shutdown Q6
+            - description: Stop Q6
+        qcom,smem-state-names:
+          items:
+            - const: shutdown
+            - const: stop
+        clock-names: false
+        clocks: false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,qcs404-wcss-pil
+    then:
+      properties:
+        qcom,smem-states:
+          maxItems: 1
+        qcom,smem-state-names:
+          items:
+            - const: stop
+        clocks:
+          minItems: 10
+          maxItems: 10
+        clock-names:
+          items:
+            - const: xo
+            - const: gcc_abhs_cbcr
+            - const: gcc_axim_cbcr
+            - const: lcc_ahbfabric_cbc
+            - const: tcsr_lcc_cbc
+            - const: lcc_abhs_cbc
+            - const: lcc_tcm_slave_cbc
+            - const: lcc_abhm_cbc
+            - const: lcc_axim_cbc
+            - const: lcc_bcr_sleep
+      required:
+        - clocks
+        - clock-names
+        - cx-supply
+
+additionalProperties: false
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
deleted file mode 100644
index 573a88b606773..0000000000000
--- a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
+++ /dev/null
@@ -1,102 +0,0 @@
-Qualcomm Hexagon Peripheral Image Loader
-
-This document defines the binding for a component that loads and boots firmware
-on the Qualcomm Hexagon core.
-
-- compatible:
-	Usage: required
-	Value type: <string>
-	Definition: must be one of:
-		    "qcom,ipq8074-wcss-pil"
-		    "qcom,qcs404-wcss-pil"
-
-- reg:
-	Usage: required
-	Value type: <prop-encoded-array>
-	Definition: must specify the base address and size of the qdsp6 and
-		    rmb register blocks
-
-- reg-names:
-	Usage: required
-	Value type: <stringlist>
-	Definition: must be "q6dsp" and "rmb"
-
-- interrupts-extended:
-	Usage: required
-	Value type: <prop-encoded-array>
-	Definition: reference to the interrupts that match interrupt-names
-
-- interrupt-names:
-	Usage: required
-	Value type: <stringlist>
-	Definition: must be "wdog", "fatal", "ready", "handover", "stop-ack"
-
-- clocks:
-	Usage: required
-	Value type: <phandle>
-	Definition: reference to the clocks that match clock-names
-
-- clock-names:
-	Usage: required
-	Value type: <stringlist>
-	Definition: The clocks needed depend on the compatible string:
-	qcom,ipq8074-wcss-pil:
-		    no clock names required
-	qcom,qcs404-wcss-pil:
-		    must be "xo", "gcc_abhs_cbcr", "gcc_abhs_cbcr",
-		    "gcc_axim_cbcr", "lcc_ahbfabric_cbc", "tcsr_lcc_cbc",
-		    "lcc_abhs_cbc", "lcc_tcm_slave_cbc", "lcc_abhm_cbc",
-		    "lcc_axim_cbc", "lcc_bcr_sleep"
-
-- resets:
-	Usage: required
-	Value type: <phandle>
-	Definition: reference to the list of 3 reset-controllers for the
-		    wcss sub-system
-
-- reset-names:
-	Usage: required
-	Value type: <stringlist>
-	Definition: must be "wcss_aon_reset", "wcss_reset", "wcss_q6_reset"
-		    for the wcss sub-system
-
-- memory-region:
-	Usage: required
-	Value type: <phandle>
-	Definition: reference to wcss reserved-memory region.
-
-For the compatible string below the following supplies are required:
-  "qcom,qcs404-wcss-pil"
-- cx-supply:
-	Usage: required
-	Value type: <phandle>
-	Definition: reference to the regulators to be held on behalf of the
-		    booting of the Hexagon core
-
-- qcom,smem-states:
-	Usage: required
-	Value type: <phandle>
-	Definition: reference to the smem state for requesting the Hexagon to
-		    shut down
-
-- qcom,smem-state-names:
-	Usage: required
-	Value type: <stringlist>
-	Definition: must be "stop"
-
-- qcom,halt-regs:
-	Usage: required
-	Value type: <prop-encoded-array>
-	Definition: a phandle reference to a syscon representing TCSR followed
-		    by the three offsets within syscon for q6, wcss and nc
-		    halt registers.
-
-- memory-region:
-	Usage: required
-	Value type: <phandle>
-	Definition: reference to the reserved-memory for the region
-
-The Hexagon node may also have an subnode named either "smd-edge" or
-"glink-edge" that describes the communication edge, channels and devices
-related to the Hexagon.  See ../soc/qcom/qcom,smd.yaml and
-../soc/qcom/qcom,glink.txt for details on how to describe these.
-- 
2.45.1


