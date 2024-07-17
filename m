Return-Path: <linux-arm-msm+bounces-26472-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 737D0933D82
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jul 2024 15:19:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2A4F82823D4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jul 2024 13:19:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A04AF1802AA;
	Wed, 17 Jul 2024 13:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bEjwr3Be"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ADF817E91B
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jul 2024 13:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721222383; cv=none; b=eRpHHV73vI/Zq4Ds7hagCNH7fbiDhSGbf4yP/VEPfDk+2kPzZUKyBGZ2kO7l/8CkCw3mdNCiiy3eqgRHKkYIYiGWOkaRNgUxwfR8HN9eqzhYqePYwJIOwVKIFY1WhWFF09AJP8kOh2QsULf0r7SArqD92H8DGztyU7c1CleH+kI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721222383; c=relaxed/simple;
	bh=Lpe5tdTvf6Hb4RKMDpmtXw70hfzTjmPX3MjIxnADx+s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OXOoiVQsXShqt/JlWqZ83b2OrmUhwDj1hL3AsMdR76j9Vntns65SW+qVB5uAuyW3GM70zeaZ72Eyj+/J5qeYEN/DjOLkreXHOckZGKhufwmQ2IeICH20RodIF2cbMuo2DMLsQnfQdj+MtL+f4PU6+uBl5nEygL39tTGmB/1nCgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bEjwr3Be; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-36785e72a48so3752632f8f.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jul 2024 06:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721222379; x=1721827179; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eq5/Igl7L/85n1P2T/eGC/F3bFZlI2k0nRRcpIhOjXg=;
        b=bEjwr3BeFlxhJcFEWeqXUyxSJfKmDRU+haqg6GDFiVU6Zq1xRQb5t56mf/NQUoe3uj
         LT7u+V0ni3757ISlefvJeRjNSP6z+OHhDPNHijgbCOEzMFp6WA4HEeEHorSoa+h2SYpx
         0E1TA61wdmkcOGC+BCqCA6K38eXemi4g0wM6kuAW90neKWGs57OveABX2poTmdrDjlkK
         xrkTWevPDDtVmFryOH+/UeR/ZelWIS9nEW85kw8u2kDO53q93rF6QGZ2FkBymRrclETL
         5jlw3P3xvwophnKjz/8DwwOvp+cPNq1Ms+Vd6q9s85L3JB7jKY0KXn/tAlz1gPPS91fI
         0LbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721222379; x=1721827179;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eq5/Igl7L/85n1P2T/eGC/F3bFZlI2k0nRRcpIhOjXg=;
        b=IEWw+A77XBFJSns+M3ikJ6BWcAcGQxTKFdI/DTcgBEsKv/I3rIw76ht6io7S+vTsTb
         tBRukXVx7v+GZ863u0S6+JQYRgk3gZG3ZDN0aRNnEN2OIbQzEJvXnnc/BHlyHmZjlOj9
         GVD1c2TpReYBKYxL4QWWsKFIdJMGbjWbTxkwviybya7eelExQ2A/zjDZ0CzUK0TWsgZL
         WIYf03qCVbV7alNH2N54jNLUgLAxlCPYSA5NTLMSiMAdxaQJ/vNaBO6mhaT+bz7WDfKI
         /Gdov036L98rtU6lRJJSnPqe9cIVGsI8+BvquzoNriGTCLVIcUIgebMEk98bADDl2V6o
         VONg==
X-Forwarded-Encrypted: i=1; AJvYcCXI/JVEheM309K0UtWqYEPPY5I0g3+rszcYxKEsRM69ldI544ez8iBdvbSAJ2oGW8w7w0SClB3CNezosuwoapwZkmWYi4jhcVz8036tJg==
X-Gm-Message-State: AOJu0YyTTuN0kf6daGHd2s04lo4EyWw0zohK10XzVjt1f+U7xvvYnDRO
	bnXhBYC5glKxtLM2U+rmK3ts01CUZ2YBi4YUFhg0DDUAJPC3pG73FKD8dLgN8NiTEuw0uBE+U1Q
	o
X-Google-Smtp-Source: AGHT+IFJOPCjoCEAqQXqG7fJlTnDNnYTfnz7sZOEN35qNW9L6yBnj/aToKm5F3qmoELE67uobm9WBQ==
X-Received: by 2002:adf:f645:0:b0:368:4226:4084 with SMTP id ffacd0b85a97d-3684226418amr383771f8f.6.1721222379478;
        Wed, 17 Jul 2024 06:19:39 -0700 (PDT)
Received: from rayyan-pc.broadband ([2a0a:ef40:ee7:2401:197d:e048:a80f:bc44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680daccbe9sm11625869f8f.59.2024.07.17.06.19.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 06:19:39 -0700 (PDT)
From: Rayyan Ansari <rayyan.ansari@linaro.org>
To: devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Rayyan Ansari <rayyan.ansari@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: bus: qcom,ebi2: convert to dtschema
Date: Wed, 17 Jul 2024 14:10:26 +0100
Message-ID: <20240717131030.51419-1-rayyan.ansari@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the bindings for the External Bus Interface on apq8060 and
msm8660 from the old text format to yaml.

Signed-off-by: Rayyan Ansari <rayyan.ansari@linaro.org>
---
 .../devicetree/bindings/bus/qcom,ebi2.txt     | 138 ----------
 .../devicetree/bindings/bus/qcom,ebi2.yaml    | 239 ++++++++++++++++++
 2 files changed, 239 insertions(+), 138 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/bus/qcom,ebi2.txt
 create mode 100644 Documentation/devicetree/bindings/bus/qcom,ebi2.yaml

diff --git a/Documentation/devicetree/bindings/bus/qcom,ebi2.txt b/Documentation/devicetree/bindings/bus/qcom,ebi2.txt
deleted file mode 100644
index 5058aa2c63b2..000000000000
--- a/Documentation/devicetree/bindings/bus/qcom,ebi2.txt
+++ /dev/null
@@ -1,138 +0,0 @@
-Qualcomm External Bus Interface 2 (EBI2)
-
-The EBI2 contains two peripheral blocks: XMEM and LCDC. The XMEM handles any
-external memory (such as NAND or other memory-mapped peripherals) whereas
-LCDC handles LCD displays.
-
-As it says it connects devices to an external bus interface, meaning address
-lines (up to 9 address lines so can only address 1KiB external memory space),
-data lines (16 bits), OE (output enable), ADV (address valid, used on some
-NOR flash memories), WE (write enable). This on top of 6 different chip selects
-(CS0 thru CS5) so that in theory 6 different devices can be connected.
-
-Apparently this bus is clocked at 64MHz. It has dedicated pins on the package
-and the bus can only come out on these pins, however if some of the pins are
-unused they can be left unconnected or remuxed to be used as GPIO or in some
-cases other orthogonal functions as well.
-
-Also CS1 and CS2 has -A and -B signals. Why they have that is unclear to me.
-
-The chip selects have the following memory range assignments. This region of
-memory is referred to as "Chip Peripheral SS FPB0" and is 168MB big.
-
-Chip Select                     Physical address base
-CS0 GPIO134                     0x1a800000-0x1b000000 (8MB)
-CS1 GPIO39 (A) / GPIO123 (B)    0x1b000000-0x1b800000 (8MB)
-CS2 GPIO40 (A) / GPIO124 (B)    0x1b800000-0x1c000000 (8MB)
-CS3 GPIO133                     0x1d000000-0x25000000 (128 MB)
-CS4 GPIO132                     0x1c800000-0x1d000000 (8MB)
-CS5 GPIO131                     0x1c000000-0x1c800000 (8MB)
-
-The APQ8060 Qualcomm Application Processor User Guide, 80-N7150-14 Rev. A,
-August 6, 2012 contains some incomplete documentation of the EBI2.
-
-FIXME: the manual mentions "write precharge cycles" and "precharge cycles".
-We have not been able to figure out which bit fields these correspond to
-in the hardware, or what valid values exist. The current hypothesis is that
-this is something just used on the FAST chip selects and that the SLOW
-chip selects are understood fully. There is also a "byte device enable"
-flag somewhere for 8bit memories.
-
-FIXME: The chipselects have SLOW and FAST configuration registers. It's a bit
-unclear what this means, if they are mutually exclusive or can be used
-together, or if some chip selects are hardwired to be FAST and others are SLOW
-by design.
-
-The XMEM registers are totally undocumented but could be partially decoded
-because the Cypress AN49576 Antioch Westbridge apparently has suspiciously
-similar register layout, see: http://www.cypress.com/file/105771/download
-
-Required properties:
-- compatible: should be one of:
-  "qcom,msm8660-ebi2"
-  "qcom,apq8060-ebi2"
-- #address-cells: should be <2>: the first cell is the chipselect,
-  the second cell is the offset inside the memory range
-- #size-cells: should be <1>
-- ranges: should be set to:
-  ranges = <0 0x0 0x1a800000 0x00800000>,
-           <1 0x0 0x1b000000 0x00800000>,
-           <2 0x0 0x1b800000 0x00800000>,
-           <3 0x0 0x1d000000 0x08000000>,
-           <4 0x0 0x1c800000 0x00800000>,
-           <5 0x0 0x1c000000 0x00800000>;
-- reg: two ranges of registers: EBI2 config and XMEM config areas
-- reg-names: should be "ebi2", "xmem"
-- clocks: two clocks, EBI_2X and EBI
-- clock-names: should be "ebi2x", "ebi2"
-
-Optional subnodes:
-- Nodes inside the EBI2 will be considered device nodes.
-
-The following optional properties are properties that can be tagged onto
-any device subnode. We are assuming that there can be only ONE device per
-chipselect subnode, else the properties will become ambiguous.
-
-Optional properties arrays for SLOW chip selects:
-- qcom,xmem-recovery-cycles: recovery cycles is the time the memory continues to
-  drive the data bus after OE is de-asserted, in order to avoid contention on
-  the data bus. They are inserted when reading one CS and switching to another
-  CS or read followed by write on the same CS. Valid values 0 thru 15. Minimum
-  value is actually 1, so a value of 0 will still yield 1 recovery cycle.
-- qcom,xmem-write-hold-cycles: write hold cycles, these are extra cycles
-  inserted after every write minimum 1. The data out is driven from the time
-  WE is asserted until CS is asserted. With a hold of 1 (value = 0), the CS
-  stays active for 1 extra cycle etc. Valid values 0 thru 15.
-- qcom,xmem-write-delta-cycles: initial latency for write cycles inserted for
-  the first write to a page or burst memory. Valid values 0 thru 255.
-- qcom,xmem-read-delta-cycles: initial latency for read cycles inserted for the
-  first read to a page or burst memory. Valid values 0 thru 255.
-- qcom,xmem-write-wait-cycles: number of wait cycles for every write access, 0=1
-  cycle. Valid values 0 thru 15.
-- qcom,xmem-read-wait-cycles: number of wait cycles for every read access, 0=1
-  cycle. Valid values 0 thru 15.
-
-Optional properties arrays for FAST chip selects:
-- qcom,xmem-address-hold-enable: this is a boolean property stating that we
-  shall hold the address for an extra cycle to meet hold time requirements
-  with ADV assertion.
-- qcom,xmem-adv-to-oe-recovery-cycles: the number of cycles elapsed before an OE
-  assertion, with respect to the cycle where ADV (address valid) is asserted.
-  2 means 2 cycles between ADV and OE. Valid values 0, 1, 2 or 3.
-- qcom,xmem-read-hold-cycles: the length in cycles of the first segment of a
-  read transfer. For a single read transfer this will be the time from CS
-  assertion to OE assertion. Valid values 0 thru 15.
-
-
-Example:
-
-ebi2@1a100000 {
-	compatible = "qcom,apq8060-ebi2";
-	#address-cells = <2>;
-	#size-cells = <1>;
-	ranges = <0 0x0 0x1a800000 0x00800000>,
-		 <1 0x0 0x1b000000 0x00800000>,
-		 <2 0x0 0x1b800000 0x00800000>,
-		 <3 0x0 0x1d000000 0x08000000>,
-		 <4 0x0 0x1c800000 0x00800000>,
-		 <5 0x0 0x1c000000 0x00800000>;
-	reg = <0x1a100000 0x1000>, <0x1a110000 0x1000>;
-	reg-names = "ebi2", "xmem";
-	clocks = <&gcc EBI2_2X_CLK>, <&gcc EBI2_CLK>;
-	clock-names = "ebi2x", "ebi2";
-	/* Make sure to set up the pin control for the EBI2 */
-	pinctrl-names = "default";
-	pinctrl-0 = <&foo_ebi2_pins>;
-
-	foo-ebi2@2,0 {
-		compatible = "foo";
-		reg = <2 0x0 0x100>;
-		(...)
-		qcom,xmem-recovery-cycles = <0>;
-		qcom,xmem-write-hold-cycles = <3>;
-		qcom,xmem-write-delta-cycles = <31>;
-		qcom,xmem-read-delta-cycles = <28>;
-		qcom,xmem-write-wait-cycles = <9>;
-		qcom,xmem-read-wait-cycles = <9>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/bus/qcom,ebi2.yaml b/Documentation/devicetree/bindings/bus/qcom,ebi2.yaml
new file mode 100644
index 000000000000..1b1fb3538e6e
--- /dev/null
+++ b/Documentation/devicetree/bindings/bus/qcom,ebi2.yaml
@@ -0,0 +1,239 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/bus/qcom,ebi2.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm External Bus Interface 2 (EBI2)
+
+description: |
+  The EBI2 contains two peripheral blocks: XMEM and LCDC. The XMEM handles any
+  external memory (such as NAND or other memory-mapped peripherals) whereas
+  LCDC handles LCD displays.
+
+  As it says it connects devices to an external bus interface, meaning address
+  lines (up to 9 address lines so can only address 1KiB external memory space),
+  data lines (16 bits), OE (output enable), ADV (address valid, used on some
+  NOR flash memories), WE (write enable). This on top of 6 different chip selects
+  (CS0 thru CS5) so that in theory 6 different devices can be connected.
+
+  Apparently this bus is clocked at 64MHz. It has dedicated pins on the package
+  and the bus can only come out on these pins, however if some of the pins are
+  unused they can be left unconnected or remuxed to be used as GPIO or in some
+  cases other orthogonal functions as well.
+
+  Also CS1 and CS2 has -A and -B signals. Why they have that is unclear to me.
+
+  The chip selects have the following memory range assignments. This region of
+  memory is referred to as "Chip Peripheral SS FPB0" and is 168MB big.
+
+  Chip Select                     Physical address base
+  CS0 GPIO134                     0x1a800000-0x1b000000 (8MB)
+  CS1 GPIO39 (A) / GPIO123 (B)    0x1b000000-0x1b800000 (8MB)
+  CS2 GPIO40 (A) / GPIO124 (B)    0x1b800000-0x1c000000 (8MB)
+  CS3 GPIO133                     0x1d000000-0x25000000 (128 MB)
+  CS4 GPIO132                     0x1c800000-0x1d000000 (8MB)
+  CS5 GPIO131                     0x1c000000-0x1c800000 (8MB)
+
+  The APQ8060 Qualcomm Application Processor User Guide, 80-N7150-14 Rev. A,
+  August 6, 2012 contains some incomplete documentation of the EBI2.
+
+  FIXME: the manual mentions "write precharge cycles" and "precharge cycles".
+  We have not been able to figure out which bit fields these correspond to
+  in the hardware, or what valid values exist. The current hypothesis is that
+  this is something just used on the FAST chip selects and that the SLOW
+  chip selects are understood fully. There is also a "byte device enable"
+  flag somewhere for 8bit memories.
+
+  FIXME: The chipselects have SLOW and FAST configuration registers. It's a bit
+  unclear what this means, if they are mutually exclusive or can be used
+  together, or if some chip selects are hardwired to be FAST and others are SLOW
+  by design.
+
+  The XMEM registers are totally undocumented but could be partially decoded
+  because the Cypress AN49576 Antioch Westbridge apparently has suspiciously
+  similar register layout, see: http://www.cypress.com/file/105771/download
+
+maintainers:
+  - Bjorn Andersson <andersson@kernel.org>
+
+properties:
+  compatible:
+    enum:
+      - qcom,apq8060-ebi2
+      - qcom,msm8660-ebi2
+
+  reg:
+    items:
+      - description: EBI2 config region
+      - description: XMEM config region
+
+  reg-names:
+    items:
+      - const: ebi2
+      - const: xmem
+
+  ranges: true
+
+  clocks:
+    items:
+      - description: EBI_2X clock
+      - description: EBI clock
+
+  clock-names:
+    items:
+      - const: ebi2x
+      - const: ebi2
+
+  '#address-cells':
+    const: 2
+
+  '#size-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - ranges
+  - clocks
+  - clock-names
+  - '#address-cells'
+  - '#size-cells'
+
+patternProperties:
+  "^.*@[0-5],[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      reg:
+        maxItems: 1
+
+      # SLOW chip selects
+      qcom,xmem-recovery-cycles:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: >
+          The time the memory continues to drive the data bus after OE
+          is de-asserted, in order to avoid contention on the data bus.
+          They are inserted when reading one CS and switching to another
+          CS or read followed by write on the same CS. Minimum value is
+          actually 1, so a value of 0 will still yield 1 recovery cycle.
+        minimum: 0
+        maximum: 15
+
+      qcom,xmem-write-hold-cycles:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: >
+          The extra cycles inserted after every write minimum 1. The
+          data out is driven from the time WE is asserted until CS is
+          asserted. With a hold of 1 (value = 0), the CS stays active
+          for 1 extra cycle, etc.
+        minimum: 0
+        maximum: 15
+
+      qcom,xmem-write-delta-cycles:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: >
+          The initial latency for write cycles inserted for the first
+          write to a page or burst memory.
+        minimum: 0
+        maximum: 255
+
+      qcom,xmem-read-delta-cycles:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: >
+          The initial latency for read cycles inserted for the first
+          read to a page or burst memory.
+        minimum: 0
+        maximum: 255
+
+      qcom,xmem-write-wait-cycles:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: >
+          The number of wait cycles for every write access.
+        minimum: 0
+        maximum: 15
+
+      qcom,xmem-read-wait-cycles:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: >
+          The number of wait cycles for every read access.
+        minimum: 0
+        maximum: 15
+
+
+      # FAST chip selects
+      qcom,xmem-address-hold-enable:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: >
+          Holds the address for an extra cycle to meet hold time
+          requirements with ADV assertion, when set to 1.
+        enum: [ 0, 1 ]
+
+      qcom,xmem-adv-to-oe-recovery-cycles:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: >
+          The number of cycles elapsed before an OE assertion, with
+          respect to the cycle where ADV (address valid) is asserted.
+        minimum: 0
+        maximum: 3
+
+      qcom,xmem-read-hold-cycles:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: >
+          The length in cycles of the first segment of a read transfer.
+          For a single read transfer this will be the time from CS
+          assertion to OE assertion.
+        minimum: 0
+        maximum: 15
+
+    required:
+      - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-msm8660.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/gpio/gpio.h>
+
+    external-bus@1a100000 {
+        compatible = "qcom,msm8660-ebi2";
+        reg = <0x1a100000 0x1000>, <0x1a110000 0x1000>;
+        reg-names = "ebi2", "xmem";
+        ranges = <0 0x0 0x1a800000 0x00800000>,
+                 <1 0x0 0x1b000000 0x00800000>,
+                 <2 0x0 0x1b800000 0x00800000>,
+                 <3 0x0 0x1d000000 0x08000000>,
+                 <4 0x0 0x1c800000 0x00800000>,
+                 <5 0x0 0x1c000000 0x00800000>;
+
+        clocks = <&gcc EBI2_2X_CLK>, <&gcc EBI2_CLK>;
+        clock-names = "ebi2x", "ebi2";
+
+        #address-cells = <2>;
+        #size-cells = <1>;
+
+        ethernet@2,0 {
+            compatible = "smsc,lan9221", "smsc,lan9115";
+            reg = <2 0x0 0x100>;
+
+            interrupts-extended = <&pm8058_gpio 7 IRQ_TYPE_EDGE_FALLING>,
+                                  <&tlmm 29 IRQ_TYPE_EDGE_RISING>;
+            reset-gpios = <&tlmm 30 GPIO_ACTIVE_LOW>;
+
+            phy-mode = "mii";
+            reg-io-width = <2>;
+            smsc,force-external-phy;
+            smsc,irq-push-pull;
+
+            /* SLOW chipselect config */
+            qcom,xmem-recovery-cycles = <0>;
+            qcom,xmem-write-hold-cycles = <3>;
+            qcom,xmem-write-delta-cycles = <31>;
+            qcom,xmem-read-delta-cycles = <28>;
+            qcom,xmem-write-wait-cycles = <9>;
+            qcom,xmem-read-wait-cycles = <9>;
+        };
+    };
-- 
2.45.2


