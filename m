Return-Path: <linux-arm-msm+bounces-110383-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SNJuJinuGmqD9wgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110383-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 16:03:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD8260D36D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 16:03:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 98329306EF2A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 14:00:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 724AD2D877B;
	Sat, 30 May 2026 14:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b="R2ZU+Zmh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from outbound0.mail.transip.nl (outbound0.mail.transip.nl [149.210.149.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35FE3C2D;
	Sat, 30 May 2026 14:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.210.149.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780149630; cv=none; b=Z0qVe2ICp7cGA9gWmNQZWUI1d2F6NrtKhylN2OR0cjGBu2AQZUp+HYdkw/KYO3ilX7bYFA2GKA/zSL+60XhHjs+DL458SObkR1t3Hs0qM06v+GM2gK5e5Aj6X4AYblt6iu4esXdn4yIa1+xg5r1N1WsUDYLXa4hpc1f6Og9UMtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780149630; c=relaxed/simple;
	bh=Yb+0/p09x1DfCW4pKBdS97kKZFb1oKkKoNJzx9qMEW0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DTjYGCZmkuzKnNzirUnTiMRPreVwVpon7IySAP8Vhb4KGgrDQwPVQLaH8Uvlc57lvdwI5awyycDyf2j7GW5qQMcFnCQ01Abh4TppGLnKOTfxVXuUEhpsigQDAZvpako+9G9nZ5GYqThnTTjVm+o0MqFwZ6R+hDXcU02iw3wm42s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org; spf=pass smtp.mailfrom=herrie.org; dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b=R2ZU+Zmh; arc=none smtp.client-ip=149.210.149.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=herrie.org
Received: from submission13.mail.transip.nl (unknown [10.103.8.164])
	by outbound0.mail.transip.nl (Postfix) with ESMTP id 4gSMLc6qdPzxNpt;
	Sat, 30 May 2026 16:00:24 +0200 (CEST)
Received: from herrie-desktop.. (180-93-184-31.ftth.glasoperator.nl [31.184.93.180])
	by submission13.mail.transip.nl (Postfix) with ESMTPA id 4gSMLc0wJ8z3fCxJ9;
	Sat, 30 May 2026 16:00:24 +0200 (CEST)
From: Herman van Hazendonk <github.com@herrie.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	van Hazendonk <github.com@herrie.org>
Subject: [PATCH 1/2] dt-bindings: interrupt-controller: qcom: add msm8660-mpm
Date: Sat, 30 May 2026 16:00:22 +0200
Message-ID: <d64594cea7a2ebdff8fc0b1d7b0ac1fd5124d2e2.1780148149.git.github.com@herrie.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1780148149.git.github.com@herrie.org>
References: <cover.1780148149.git.github.com@herrie.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: ClueGetter at submission13.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=herrie.org; t=1780149624; h=from:subject:to:references:
 in-reply-to:date:mime-version:content-type;
 bh=4zDvoJdsXNhZm0T2YJYAS1qLjeW2yZwyVMRRS0bJuW8=;
 b=R2ZU+ZmhuwNy1rWGfrPq6uIhOwqqx/ZHqKp+hqEUt4xtiRMHytTQkUL2ZkkbbleoQJyN6v
 yikgiJR1PWW9aMqmZOyGu6p9CGO9n4meHiQCNA+Z7FYVg/vGu4UJ5ahQYRQJ4+y6+0ixzT
 szPadFXqST6qeO1xGmKCeEMKK7GbMDhZY2TwQTCbYLFcFxZdR1TIi1t3S9rtbcFnaV3JjF
 1KvyOg8iEBVUpdOAcX623qunnMLs4dMcEFKjp0j7OIYcZjESSqxQ1aWAEH+tNQLYNMaeW8
 0xq5fNtbnPnATWJMRDSY0WnLjaT1Xz0luM9uO/2phld58OXcaJmCn0jGgRuDag==
X-Report-Abuse-To: abuse@transip.nl
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[herrie.org:s=transip-a];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-110383-lists,linux-arm-msm=lfdr.de];
	DMARC_NA(0.00)[herrie.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[herrie.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[github.com@herrie.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,herrie.org:email,herrie.org:mid,herrie.org:dkim,devicetree.org:url]
X-Rspamd-Queue-Id: EAD8260D36D
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
index 000000000000..72f9c2be03b2
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
+  On MSM8x60 the vMPM registers live INSIDE the RPM control block
+  (request regs at RPM_BASE + 0x9d8, status at RPM_BASE + 0xdf8), with
+  notification of new wake-source configuration delivered via the
+  qcom-apcs-ipc mailbox (writing GCC + 0x008 bit 1).
+
+  This binding is MSM8x60-specific. Newer Qualcomm SoCs (sm6375, etc.)
+  use the qcom,mpm binding which assumes a dedicated MPM SRAM region
+  and an IPCC mailbox — neither holds on MSM8x60. The driver lives at
+  drivers/irqchip/irq-msm8660-mpm.c.
+
+allOf:
+  - $ref: /schemas/interrupt-controller.yaml#
+
+properties:
+  compatible:
+    const: qcom,msm8660-mpm
+
+  interrupts:
+    maxItems: 1
+    description:
+      IPC IRQ raised by MPM when one of the enabled wake sources fires.
+      On MSM8x60 this is wired to GIC SPI 2.
+
+  qcom,rpm-syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the RPM control block exposed as a syscon. The vMPM
+      registers are accessed at offsets within this block.
+
+  qcom,mpm-offset:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Offset of the vMPM register window within the RPM syscon. On
+      MSM8x60 this is 0x9d8. Status registers are at this offset + 0x420
+      (== 0xdf8 from RPM base).
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
+      here — they have no GIC SPI mapping and are accessed through
+      the msm8660_mpm_set_pin_wake() / msm8660_mpm_enable_pin() C API
+      by consumer drivers.
+
+required:
+  - compatible
+  - interrupts
+  - qcom,rpm-syscon
+  - qcom,mpm-offset
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
+        msm8660_mpm: interrupt-controller {
+            compatible = "qcom,msm8660-mpm";
+            qcom,rpm-syscon = <&rpm>;
+            qcom,mpm-offset = <0x9d8>;
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


