Return-Path: <linux-arm-msm+bounces-88174-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 264DED07231
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 05:35:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6CF213032AAD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 04:34:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF6671DF751;
	Fri,  9 Jan 2026 04:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IrJROJk+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D441D1DA628
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jan 2026 04:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767933247; cv=none; b=DKaIdjvLR35Cmm9EZm5n1uGef4tc7re2HmZrxXZztsjJgMImpjz2fw4oHYVaYHJsh/B8PMgMm8iY7tA1zTB3BvSoIPFWbLVKzabSPRdKpTwwEJDsOrIhkuH4xzQQnpLOSK4mBDuurVOEfWbkxavmcECw2yrQ3OI34YvmOR+6wGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767933247; c=relaxed/simple;
	bh=6CTroWu+XlW4Pe26NwRGdZO3K7He7UAwJnEkjPAnyXE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EtET7M4bb98NVXmcslHoTFr4WGeJL1LFduGam6YGei520Ew5MTQJhb30MSmcb/Ncb3SlIJ2zpfMihBJJwbHCwBIDqBtDEk9Tn0t1EMyCb+j0lfltSmlyzbS+ZJ0LzLGox4Q203QLnVcQ3Y2xwrnwMo+uWa2bfu3lm4j7Pkyg8UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IrJROJk+; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-3fa11ba9ed5so2840850fac.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 20:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767933244; x=1768538044; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yv2OcUklkDaUC8z5bvTIXx2sL1RzjQqKUyDpP/CSXxk=;
        b=IrJROJk+dq9WJdFsGyQ29SPiCnqV7Ixk1hLZ69gPGES87ExmDrYYr07ejGssifByTf
         FK33W2f3r8BRJnKNoiyj+SsWw9KgQfKcPGhXT1Ikz/UCtXzIUJxamc11sGUvQEUtVxXp
         Kvp+U2OIQOB8aJFa6mr8LOVdavW5b+mj6Doou426SJUxtMcdGD0qXz/HXo3iQRAhJ011
         UzOSijW+3NXr1oa9bGlky4GgPhbclZxFzF5gbehwWWahbbte1DmJeuhDlYE1Evg9JT5b
         2JcxPLShw1Z99OK98IWm8QW6TtmBajMMlVBJcG7mlLGqnjfP6BQcWL/3hUeSrS6MfdOU
         Ummw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767933244; x=1768538044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Yv2OcUklkDaUC8z5bvTIXx2sL1RzjQqKUyDpP/CSXxk=;
        b=ilylmOkC4PPTwZSkMKlfBTPo0zt4CjO3drYHnC+72CW2gN4nRs5Sj+sUfJ6K8fEy4d
         MeJkeAh7Eb9SfO+ZBSXBtBKUSRFP9b+nER1qKcrEtyXwEvbIXkZqdZ2svkDgA371ZilW
         7/pRlTpt945tIgI8pS1A/FBoaTMVO0NZPU50itGhIwxXX+f3b/Px5rdpY7kixOoC/li7
         TWd3oXFxg14ZsvXGDl530fnUPkXKJGm9fSuSkaF45tepD2L6QeamQX+7FJFRFoSust6g
         /O/V4RfGo8NJRbBybyhMsMItxb4PR9PVytMznSgiRqAabEmBsUyNYZ9e2FUOzKK9pzCq
         sFeg==
X-Forwarded-Encrypted: i=1; AJvYcCXZq5Z9t4BHi0G/JoE/pDXDrQ0zMz0Ww/Yh4W7sRTT1wxR4quxRqtsnpyWsI1KRSgC4BKyOchZG/KFSsGyz@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3CEouS1vSPpyDe+uHjGZ4aPw4ZQmPnWjJVi489nZ61KWsAkpm
	g96jo4kCHyTvePyscx2d6dEktoXC9Lnry2UBp+TCZbIAqBhcLOuaWJPa
X-Gm-Gg: AY/fxX4RmcUamKMl9vUxnQWIHZFn3w5cx/SrvkIDTzQMTWAcYo+x1D9aorChqGzmz/k
	Awieu2bBVDkVA96Pkgi3vSCEBEL+WzqwW71CFSakZgf3HcKiYFmenF6uLHHUSvp702QlqGtnVYN
	3IohVt888gW/05fKcF+ha4W4GvnaauNZqzqUZVkU7oERVPZe1xATrmOKqnyh0dKbg0rHavJ4Zr8
	4jgHw6vC9yBrudYh6icQoY00V38S+BaDhVUakCfP+YV/UZRJ6CRUUXSEGqagKnduWH45GfVn7d8
	nUnu68iMOfsJyRIOFGi/mug27EKeQ7HI22Qfi96whn+GWV0Pd+XPce8fJmj1zA7TuwqnpErwiDT
	vQbW8j4AJQFjFr32GuEsdP5EOzQBUX/H/8/qeSsZd5/eqf+8cMoJClebLfdMpkwsZ7/4MEn6hw9
	XdT2gTH3RSrVZ4hcNHpI8rjcVy1/af0hNlNHVg64rPcew1Ip88148ugK1GItzua8kO2fSxs/BB2
	3r/e1eeAcLA6Etet/XRgg6Jc3vC
X-Google-Smtp-Source: AGHT+IGroLUwiC4TNVFK6YV5ceYfsvQ2nFZylqDDChsfcTZxW8Dl7KctCDE68MbWMANXH5vUhfX8Bw==
X-Received: by 2002:a05:6870:1701:b0:3ec:7649:f843 with SMTP id 586e51a60fabf-3ffc0b6b5e7mr4152897fac.38.1767933243556;
        Thu, 08 Jan 2026 20:34:03 -0800 (PST)
Received: from nukework.lan (c-98-57-15-22.hsd1.tx.comcast.net. [98.57.15.22])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3ffa515f4dasm6274421fac.21.2026.01.08.20.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 20:34:03 -0800 (PST)
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
To: andersson@kernel.org,
	krzk+dt@kernel.org,
	mturquette@baylibre.com,
	linux-remoteproc@vger.kernel.org,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandru Gagniuc <mr.nuke.me@gmail.com>
Cc: konradybcio@kernel.org,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v2 2/9] dt-bindings: remoteproc: qcom,ipq8074-wcss-pil: convert to DT schema
Date: Thu,  8 Jan 2026 22:33:37 -0600
Message-ID: <20260109043352.3072933-3-mr.nuke.me@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20260109043352.3072933-1-mr.nuke.me@gmail.com>
References: <20260109043352.3072933-1-mr.nuke.me@gmail.com>
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
 - Add Bjorn (SOC maintainer) as maintaner for binding
 - rename binding from ipq9574 to ipq8074
 - use a real person instead of placeholder as maintainer
 - drop redundant minItems and descriptions
 - merge if: clauses as suggested by Krzysztof
 - various other fixes suggested by Krzysztof
---
 .../remoteproc/qcom,ipq8074-wcss-pil.yaml     | 157 ++++++++++++++++++
 .../bindings/remoteproc/qcom,q6v5.txt         | 102 ------------
 2 files changed, 157 insertions(+), 102 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,ipq8074-wcss-pil.yaml
 delete mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,ipq8074-wcss-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,ipq8074-wcss-pil.yaml
new file mode 100644
index 000000000000..c9bdd46fc745
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,ipq8074-wcss-pil.yaml
@@ -0,0 +1,157 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm IPQ WCSS Peripheral Image Loader
+
+maintainers:
+  - Bjorn Andersson <andersson@kernel.org>
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
index 573a88b60677..000000000000
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


