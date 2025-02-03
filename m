Return-Path: <linux-arm-msm+bounces-46824-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D5AA26598
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 22:30:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BE2F4162C7C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 21:30:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6056E211474;
	Mon,  3 Feb 2025 21:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JK2NiJkJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F4021146C;
	Mon,  3 Feb 2025 21:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738618177; cv=none; b=SgnDDDIot/zsritswnk4yjEZrbLjGfBud0qtfOhmom0zs2QP2OUOy16ui0JXlP9Cfr4YbLdgKEEVtWDB+CQpl5dljZgCzuMlVROIOcU4njzlT3UlAPMTJoZ+tFGnn31uQVFR9lEI/tj+o4aKL4ErIiczkcuDZHP1wdKFu7U8XUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738618177; c=relaxed/simple;
	bh=cGkVbIvG/XxxfatOLtOOWpw1ze9gCGpJh6mDqiLiBfk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GhoMk43NP1ZG4OwKpq8Lfx1S9A3W9Jmqnq/pMjBcSfmvtDPUc25yREY1i6Q/9Wx17HV614aJAZMvaVSrgivk7P1NSBVi7abq1zw+e7kcs06kcn1AP7Lw+srKyIaMitdky12cZB4TkpZSuYklWpxUdPQpwZ/3yEBGheU58O+NzK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JK2NiJkJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D761C4CEE4;
	Mon,  3 Feb 2025 21:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738618176;
	bh=cGkVbIvG/XxxfatOLtOOWpw1ze9gCGpJh6mDqiLiBfk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JK2NiJkJCMwecG43ZQb8jKCxFNvHo/NgS2l/fqpkYER+gg9Ec6N3MBVfMkIp0OwFM
	 V7YGfb100Rh3pI9kqDbXIZ7h4uc+oGi8guNy/5bNz/AvxJRfdleVcsjRfAASRTpaVt
	 2UdPgqlc1T6inuInp0so9hvmkdJRTk1Zb4hGPoQEZ1dmL9mMVuonD3kheF7KCHVPja
	 sAoG724u6WX9tZDcuNhpxokIJizwebziOxjVsMWuBvUYKR3EyrPmLbUjex2BhuF67+
	 vgOQq6SqITBppXiygN4BrdHfaJrFrAU18c7x/ZxH/bgR5R3sBEvdXF7qLF0dz0J7h8
	 DIe72yGParx7w==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Mon, 03 Feb 2025 15:29:14 -0600
Subject: [PATCH 2/4] dt-bindings: memory-controllers: qcom,ebi2: Split out
 child node properties
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-dt-lan9115-fix-v1-2-eb35389a7365@kernel.org>
References: <20250203-dt-lan9115-fix-v1-0-eb35389a7365@kernel.org>
In-Reply-To: <20250203-dt-lan9115-fix-v1-0-eb35389a7365@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Marek Vasut <marex@denx.de>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Shawn Guo <shawnguo@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, netdev@vger.kernel.org
X-Mailer: b4 0.15-dev

In order to validate devices in child nodes, the device schemas need to
reference any child node properties. In order to do that, the properties
for child nodes need to be included in mc-peripheral-props.yaml.

"reg: { maxItems: 1 }" was also incorrect. It's up to the device schemas
how many reg entries they have.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../memory-controllers/mc-peripheral-props.yaml    |  1 +
 .../qcom,ebi2-peripheral-props.yaml                | 91 ++++++++++++++++++++++
 .../bindings/memory-controllers/qcom,ebi2.yaml     | 84 --------------------
 3 files changed, 92 insertions(+), 84 deletions(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/mc-peripheral-props.yaml b/Documentation/devicetree/bindings/memory-controllers/mc-peripheral-props.yaml
index 00deeb09f87d..11bc8a33d022 100644
--- a/Documentation/devicetree/bindings/memory-controllers/mc-peripheral-props.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/mc-peripheral-props.yaml
@@ -36,6 +36,7 @@ allOf:
   - $ref: st,stm32-fmc2-ebi-props.yaml#
   - $ref: ingenic,nemc-peripherals.yaml#
   - $ref: intel,ixp4xx-expansion-peripheral-props.yaml#
+  - $ref: qcom,ebi2-peripheral-props.yaml#
   - $ref: ti,gpmc-child.yaml#
   - $ref: fsl/fsl,imx-weim-peripherals.yaml
 
diff --git a/Documentation/devicetree/bindings/memory-controllers/qcom,ebi2-peripheral-props.yaml b/Documentation/devicetree/bindings/memory-controllers/qcom,ebi2-peripheral-props.yaml
new file mode 100644
index 000000000000..29f8c30e8a88
--- /dev/null
+++ b/Documentation/devicetree/bindings/memory-controllers/qcom,ebi2-peripheral-props.yaml
@@ -0,0 +1,91 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/memory-controllers/qcom,ebi2-peripheral-props.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Peripheral Properties for Qualcomm External Bus Interface 2 (EBI2)
+
+maintainers:
+  - Bjorn Andersson <andersson@kernel.org>
+
+properties:
+  # SLOW chip selects
+  qcom,xmem-recovery-cycles:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: >
+      The time the memory continues to drive the data bus after OE
+      is de-asserted, in order to avoid contention on the data bus.
+      They are inserted when reading one CS and switching to another
+      CS or read followed by write on the same CS. Minimum value is
+      actually 1, so a value of 0 will still yield 1 recovery cycle.
+    minimum: 0
+    maximum: 15
+
+  qcom,xmem-write-hold-cycles:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: >
+      The extra cycles inserted after every write minimum 1. The
+      data out is driven from the time WE is asserted until CS is
+      asserted. With a hold of 1 (value = 0), the CS stays active
+      for 1 extra cycle, etc.
+    minimum: 0
+    maximum: 15
+
+  qcom,xmem-write-delta-cycles:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: >
+      The initial latency for write cycles inserted for the first
+      write to a page or burst memory.
+    minimum: 0
+    maximum: 255
+
+  qcom,xmem-read-delta-cycles:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: >
+      The initial latency for read cycles inserted for the first
+      read to a page or burst memory.
+    minimum: 0
+    maximum: 255
+
+  qcom,xmem-write-wait-cycles:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: >
+      The number of wait cycles for every write access.
+    minimum: 0
+    maximum: 15
+
+  qcom,xmem-read-wait-cycles:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: >
+      The number of wait cycles for every read access.
+    minimum: 0
+    maximum: 15
+
+
+  # FAST chip selects
+  qcom,xmem-address-hold-enable:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: >
+      Holds the address for an extra cycle to meet hold time
+      requirements with ADV assertion, when set to 1.
+    enum: [ 0, 1 ]
+
+  qcom,xmem-adv-to-oe-recovery-cycles:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: >
+      The number of cycles elapsed before an OE assertion, with
+      respect to the cycle where ADV (address valid) is asserted.
+    minimum: 0
+    maximum: 3
+
+  qcom,xmem-read-hold-cycles:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: >
+      The length in cycles of the first segment of a read transfer.
+      For a single read transfer this will be the time from CS
+      assertion to OE assertion.
+    minimum: 0
+    maximum: 15
+
+additionalProperties: true
diff --git a/Documentation/devicetree/bindings/memory-controllers/qcom,ebi2.yaml b/Documentation/devicetree/bindings/memory-controllers/qcom,ebi2.yaml
index c782bfd7af92..3e6da1ba460e 100644
--- a/Documentation/devicetree/bindings/memory-controllers/qcom,ebi2.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/qcom,ebi2.yaml
@@ -105,90 +105,6 @@ patternProperties:
   "^.*@[0-5],[0-9a-f]+$":
     type: object
     additionalProperties: true
-    properties:
-      reg:
-        maxItems: 1
-
-      # SLOW chip selects
-      qcom,xmem-recovery-cycles:
-        $ref: /schemas/types.yaml#/definitions/uint32
-        description: >
-          The time the memory continues to drive the data bus after OE
-          is de-asserted, in order to avoid contention on the data bus.
-          They are inserted when reading one CS and switching to another
-          CS or read followed by write on the same CS. Minimum value is
-          actually 1, so a value of 0 will still yield 1 recovery cycle.
-        minimum: 0
-        maximum: 15
-
-      qcom,xmem-write-hold-cycles:
-        $ref: /schemas/types.yaml#/definitions/uint32
-        description: >
-          The extra cycles inserted after every write minimum 1. The
-          data out is driven from the time WE is asserted until CS is
-          asserted. With a hold of 1 (value = 0), the CS stays active
-          for 1 extra cycle, etc.
-        minimum: 0
-        maximum: 15
-
-      qcom,xmem-write-delta-cycles:
-        $ref: /schemas/types.yaml#/definitions/uint32
-        description: >
-          The initial latency for write cycles inserted for the first
-          write to a page or burst memory.
-        minimum: 0
-        maximum: 255
-
-      qcom,xmem-read-delta-cycles:
-        $ref: /schemas/types.yaml#/definitions/uint32
-        description: >
-          The initial latency for read cycles inserted for the first
-          read to a page or burst memory.
-        minimum: 0
-        maximum: 255
-
-      qcom,xmem-write-wait-cycles:
-        $ref: /schemas/types.yaml#/definitions/uint32
-        description: >
-          The number of wait cycles for every write access.
-        minimum: 0
-        maximum: 15
-
-      qcom,xmem-read-wait-cycles:
-        $ref: /schemas/types.yaml#/definitions/uint32
-        description: >
-          The number of wait cycles for every read access.
-        minimum: 0
-        maximum: 15
-
-
-      # FAST chip selects
-      qcom,xmem-address-hold-enable:
-        $ref: /schemas/types.yaml#/definitions/uint32
-        description: >
-          Holds the address for an extra cycle to meet hold time
-          requirements with ADV assertion, when set to 1.
-        enum: [ 0, 1 ]
-
-      qcom,xmem-adv-to-oe-recovery-cycles:
-        $ref: /schemas/types.yaml#/definitions/uint32
-        description: >
-          The number of cycles elapsed before an OE assertion, with
-          respect to the cycle where ADV (address valid) is asserted.
-        minimum: 0
-        maximum: 3
-
-      qcom,xmem-read-hold-cycles:
-        $ref: /schemas/types.yaml#/definitions/uint32
-        description: >
-          The length in cycles of the first segment of a read transfer.
-          For a single read transfer this will be the time from CS
-          assertion to OE assertion.
-        minimum: 0
-        maximum: 15
-
-    required:
-      - reg
 
 additionalProperties: false
 

-- 
2.47.2


