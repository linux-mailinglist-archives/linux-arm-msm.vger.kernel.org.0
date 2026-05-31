Return-Path: <linux-arm-msm+bounces-110434-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6H57MZy0G2pVFgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110434-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 May 2026 06:10:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 574A56145A8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 May 2026 06:10:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5B877303938E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 May 2026 04:09:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3500306B08;
	Sun, 31 May 2026 04:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b="sT9FdjdF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from outbound7.mail.transip.nl (outbound7.mail.transip.nl [136.144.136.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6B82F549F;
	Sun, 31 May 2026 04:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.144.136.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780200561; cv=none; b=qm6IK3MVZ0eqWe2zWWe/U7BlkkW03T6Qc88lYaic6Kh6oW4gS4rRz/fFnLuExywadsQXF4yysoczzhssaG3ZG9JIWQtKDWwbgYDwj1hABxObK+N2tAqjxzJXFI1fo1CISgRJFVb0rrpHHS3x2JHjDp2RIrTd7DUT0Y4cBMwFW5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780200561; c=relaxed/simple;
	bh=uwlX8PMjADCDQEuq4aieXUonap0uly45GgLHHNp7B8s=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eDFqwhyoKZ1qpB9lvqZNY5QhQIQn485WsRcsAu+JnXXof6ZK8QOflUC/vV7BDPpDSE4+eUhQPIm9aPAP3YUH+KjA/MI4Lx9JuKXrsxaMsE1bOKWuxRJmkpFoZZXm8KwWN6VfQdR3Wi5lHcJSsKZhrbDqgTx++/5IwUxve5tSLY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org; spf=pass smtp.mailfrom=herrie.org; dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b=sT9FdjdF; arc=none smtp.client-ip=136.144.136.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=herrie.org
Received: from submission1.mail.transip.nl (unknown [10.100.4.70])
	by outbound7.mail.transip.nl (Postfix) with ESMTP id 4gSkB16LSlzQvvWt;
	Sun, 31 May 2026 06:09:13 +0200 (CEST)
Received: from herrie-desktop.. (180-93-184-31.ftth.glasoperator.nl [31.184.93.180])
	by submission1.mail.transip.nl (Postfix) with ESMTPA id 4gSkB108KYzJjhXv;
	Sun, 31 May 2026 06:09:13 +0200 (CEST)
From: Herman van Hazendonk <github.com@herrie.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Clark Williams <clrkwllms@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	Rob Herring <robh@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@kernel.org>,
	van Hazendonk <github.com@herrie.org>
Subject: [PATCH v2 1/2] dt-bindings: interrupt-controller: qcom: add msm8660-mpm
Date: Sun, 31 May 2026 06:09:10 +0200
Message-ID: <4cca687dba2d1c341613a13d3e4b4a156b0d5531.1780195817.git.github.com@herrie.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1780195817.git.github.com@herrie.org>
References: <cover.1780148149.git.github.com@herrie.org> <cover.1780195817.git.github.com@herrie.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: ClueGetter at submission1.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=herrie.org; t=1780200553; h=from:subject:to:references:
 in-reply-to:date:mime-version;
 bh=IOnVW/3WZHj8cYeEeQr7f0EyPtew8KoJY81FvzBRJSs=;
 b=sT9FdjdFDQe4uB/WL6B6ovQc6Vy5evEw/otAMlxYkJeeo2gKJPLVNoORpXJa7VW23j+VyI
 AlQg0evTYG+cUzlp2eKkvPyfv7W5bKgjfVkRg56kGsUIqde02ScWYcAFQloXvE4IJ9qKnh
 f4kg/ckLxNqq145ClZFkP/r49OJNVzk5NwfTauA6Kz41YMV60NL/tHDfQXA1R0+X9rXsP6
 RNCU3yeEU1F7naZUllYP6LR7kUJUxIYqASE5dAZ7n7/fmDz0vMresjxqgBVrE4gDG35Lhy
 3lGbhngyzvDdvs8mASztVhM2fvsX79aXRKx1aCevzHzUvkRyEirCD2Jhpk+KNA==
X-Report-Abuse-To: abuse@transip.nl
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[herrie.org:s=transip-a];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-110434-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[herrie.org];
	DKIM_TRACE(0.00)[herrie.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[github.com@herrie.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[herrie.org:email,herrie.org:mid,herrie.org:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,devicetree.org:url,1049d8:email]
X-Rspamd-Queue-Id: 574A56145A8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the binding for the Modem Power Manager (MPM) interrupt
controller on the MSM8x60 family (MSM8260/MSM8660/APQ8060). The MPM
is a small wake-capable interrupt aggregator that lets the SoC stay
in low-power states while a small set of GIC SPIs continues to be
monitored and can wake the system on an edge.

The binding describes its register region (in the RPM syscon), the
GIC SPI it raises on a wake event, the GIC mailbox it shares with
the RPM, and the per-pin wake-source mapping table.

Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
---
 .../qcom,msm8660-mpm.yaml                     | 122 ++++++++++++++++++
 1 file changed, 122 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/qcom,msm8660-mpm.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,msm8660-mpm.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,msm8660-mpm.yaml
new file mode 100644
index 000000000000..1288e83d75d6
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,msm8660-mpm.yaml
@@ -0,0 +1,122 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/qcom,msm8660-mpm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm MSM8x60 MPM wakeup interrupt controller
+
+maintainers:
+  - Herman van Hazendonk <github.com@herrie.org>
+
+description: |
+  The MSM Power Manager (MPM) on the MSM8x60 family (MSM8260/MSM8660/
+  APQ8060) is an always-on hardware block that keeps a set of wake
+  interrupts alive while the application processor is powered down.
+
+  The vMPM (virtual MPM) registers live INSIDE the RPM control block:
+  the request window (ENABLE, DETECT_CTL, POLARITY, CLEAR) starts at
+  RPM_BASE + 0x9d8 and the status window starts 0x420 above the
+  request window. The reg property points at this vMPM sub-region;
+  the qcom,rpm-msm8660 driver maps the surrounding RPM control area
+  for its own use, so the two mappings overlap but neither claims
+  exclusive ownership of the other's range.
+
+  Notification of new wake-source configuration is delivered via the
+  qcom-apcs-ipc mailbox (writing GCC + 0x008 bit 1).
+
+  This binding is MSM8x60-specific. Newer Qualcomm SoCs (sm6375, etc.)
+  use the qcom,mpm binding which assumes a dedicated MPM SRAM region
+  and an IPCC mailbox - neither holds on MSM8x60. The driver lives at
+  drivers/irqchip/irq-msm8660-mpm.c.
+
+allOf:
+  - $ref: /schemas/interrupt-controller.yaml#
+
+properties:
+  compatible:
+    const: qcom,msm8660-mpm
+
+  reg:
+    maxItems: 1
+    description: |
+      vMPM register window inside the RPM control block. Must cover
+      the request registers at offset 0 of the window and the status
+      registers at offset 0x420 of the window. A length of 0x440 is
+      sufficient for the four-word request banks and the status bank.
+
+  interrupts:
+    maxItems: 1
+    description:
+      IPC IRQ raised by MPM when one of the enabled wake sources fires.
+      On MSM8x60 this is wired to GIC SPI 2.
+
+  mboxes:
+    maxItems: 1
+    description:
+      Mailbox channel used to notify MPM that the vMPM request
+      registers have been updated. On MSM8x60 this is the
+      qcom-apcs-ipc mailbox channel 1 (writes GCC + 0x008 bit 1).
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 2
+    description:
+      First cell is the MPM pin number / parent GIC SPI; second cell
+      is the trigger type.
+
+  qcom,mpm-pin-count:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Total number of MPM pins exposed.
+
+  qcom,mpm-pin-map:
+    $ref: /schemas/types.yaml#/definitions/uint32-matrix
+    items:
+      items:
+        - description: MPM pin number
+        - description: GIC SPI number this pin maps to
+    description: |
+      List of (MPM-pin, GIC-SPI) tuples for wake sources that have a
+      corresponding GIC IRQ. Consumers route their interrupts through
+      the MPM hierarchical irqdomain to take advantage of these
+      mappings.
+
+      Raw wake pins like SDC3/4 DATx (pins 21-24) are NOT listed
+      here - they have no GIC SPI mapping and are accessed through
+      the msm8660_mpm_set_pin_wake() / msm8660_mpm_enable_pin() C API
+      by consumer drivers.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - mboxes
+  - interrupt-controller
+  - '#interrupt-cells'
+  - qcom,mpm-pin-count
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    soc {
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        msm8660_mpm: interrupt-controller@1049d8 {
+            compatible = "qcom,msm8660-mpm";
+            reg = <0x001049d8 0x440>;
+            interrupts = <GIC_SPI 2 IRQ_TYPE_EDGE_RISING>;
+            mboxes = <&gcc_ipc 1>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
+            interrupt-parent = <&intc>;
+            qcom,mpm-pin-count = <64>;
+            qcom,mpm-pin-map = <25 100>,
+                               <26 50>,
+                               <27 79>;
+        };
+    };
-- 
2.43.0


