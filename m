Return-Path: <linux-arm-msm+bounces-110440-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sFh2HJi0G2pVFgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110440-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 May 2026 06:10:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E029361459A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 May 2026 06:09:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C210030297B2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 May 2026 04:09:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F7D631B114;
	Sun, 31 May 2026 04:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b="j3F/qH3G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from outbound8.mail.transip.nl (outbound8.mail.transip.nl [136.144.136.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D12301474;
	Sun, 31 May 2026 04:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.144.136.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780200584; cv=none; b=akw0N7I0VvJCHprJskKy2ftiMVjvJCPdNwCQzjGTNtqr3r9HUrFH3ILmYJiW2QPou5ZTa//AhrdTExJqhUFgbtoxe55Xd20hd/iJSzivDjcmOs1l4rL7MPKD5Q7bCJ2vuizuSawF6dFIShebENPTJFlxkWuMJcjOiI2CMVUsjYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780200584; c=relaxed/simple;
	bh=mkFRdKwuUVef8l5jbZHd4TpVbtwCreqS1Vrc2PF1iTk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RAl8L+tj8vdaE5+Kl7+VuojgNhlyEvJn8W4+flCgPXUfsxfndbnMkyzh7S09CKJiMROID4YNAkQG2XqYspytFMxWfrA+gqSP18/9VWg7X/VJa7dAx8bTgdg8pmK0n4OY3RJ3z3imzqyjEJPeFB6Pss9GcM2K85natVfCrzWoix8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org; spf=pass smtp.mailfrom=herrie.org; dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b=j3F/qH3G; arc=none smtp.client-ip=136.144.136.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=herrie.org
Received: from submission4.mail.transip.nl (unknown [10.103.8.155])
	by outbound8.mail.transip.nl (Postfix) with ESMTP id 4gSkB84xfdzY75qw;
	Sun, 31 May 2026 06:09:20 +0200 (CEST)
Received: from herrie-desktop.. (180-93-184-31.ftth.glasoperator.nl [31.184.93.180])
	by submission4.mail.transip.nl (Postfix) with ESMTPA id 4gSkB74hLfz3R3nyZ;
	Sun, 31 May 2026 06:09:19 +0200 (CEST)
From: Herman van Hazendonk <github.com@herrie.org>
To: Amit Kucheria <amitk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Lukasz Luba <lukasz.luba@arm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Satya Priya <quic_c_skakit@quicinc.com>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	van Hazendonk <github.com@herrie.org>,
	Zhang Rui <rui.zhang@intel.com>
Subject: [PATCH v2 2/3] dt-bindings: thermal: qcom: add pm8901-temp-alarm
Date: Sun, 31 May 2026 06:09:15 +0200
Message-ID: <a6b05ef048fa94f8cbd73f612de5754f2f5733d0.1780197411.git.github.com@herrie.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1780197411.git.github.com@herrie.org>
References: <cover.1780148149.git.github.com@herrie.org> <cover.1780197411.git.github.com@herrie.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: ClueGetter at submission4.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=herrie.org; t=1780200560; h=from:subject:to:references:
 in-reply-to:date:mime-version;
 bh=idL6XwhXReC/2NUZIyb2R5aJeN5I6jIlHbCIEZ5aS2Y=;
 b=j3F/qH3GILh68AXwuwsdOUBCZcWNCDR3KoPHPg/rPJYAx4zAnX27ZkPCLBcSDbiXY9UZRm
 Fv7k6p8fM7Mo7rzq8DhzLcrpiEmIkC5JTGjGcAguzKxN3uKpfE87zipVKoDoZTFesVFPyy
 ZjbmPlhBEEOSFYssHpj1J2co4irXybgu71oFCrxdtbXSBhgKToSgwIX03kRzLLXQPYnQJ1
 BvI4m1cxnIO78rkcOhElKPQrYVtOTjVk5nCv29TppZXy9pVwKFzx/xmn5s/XPS+R2qkuuF
 qb1+/OjHvNGXuaUBTVzmv7DrcrKcxalf17dz50KU5Mr3GwwKmoBevITWrUsd2w==
X-Report-Abuse-To: abuse@transip.nl
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[herrie.org:s=transip-a];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-110440-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[herrie.org];
	FREEMAIL_TO(0.00)[kernel.org,vger.kernel.org,arm.com,quicinc.com,gmail.com,herrie.org,intel.com];
	DKIM_TRACE(0.00)[herrie.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[github.com@herrie.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_PROHIBIT(0.00)[0.0.0.0:email];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,herrie.org:email,herrie.org:mid,herrie.org:dkim,devicetree.org:url,0.0.0.23:email]
X-Rspamd-Queue-Id: E029361459A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the binding for the temperature-alarm block inside the Qualcomm
PM8901 PMIC (companion to the PM8058 on MSM8x60). The block has four
selectable thresholds and three escalating stages; the driver maps
these to representative millicelsius readings exposed to the
thermal-of framework, and a board DT can wire stage 3 as a critical
trip so the kernel issues orderly_poweroff() when the part overheats.

The binding describes the SSBI sub-node address (CTRL register
offset) and the two PMIC-internal interrupts the alarm raises:

  - TEMP_ALARM    (PM8901 IRQ block 6 bit 4 == hwirq 52),
                  asserted on every stage transition;
  - TEMP_HI_ALARM (PM8901 IRQ block 6 bit 5 == hwirq 53),
                  asserted when the high-temperature stage is reached.

The interrupts are sourced from the parent qcom,pm8901 PMIC's own
interrupt-controller (not the SoC GIC); the node references the core
/schemas/thermal/thermal-sensor.yaml so that the standard
#thermal-sensor-cells handling and other shared thermal-sensor
constraints are inherited automatically.

Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
---
 .../thermal/qcom,pm8901-temp-alarm.yaml       | 90 +++++++++++++++++++
 1 file changed, 90 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/thermal/qcom,pm8901-temp-alarm.yaml

diff --git a/Documentation/devicetree/bindings/thermal/qcom,pm8901-temp-alarm.yaml b/Documentation/devicetree/bindings/thermal/qcom,pm8901-temp-alarm.yaml
new file mode 100644
index 000000000000..5d9eaeab8326
--- /dev/null
+++ b/Documentation/devicetree/bindings/thermal/qcom,pm8901-temp-alarm.yaml
@@ -0,0 +1,90 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/thermal/qcom,pm8901-temp-alarm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm PM8901 PMIC Temperature Alarm
+
+maintainers:
+  - Herman van Hazendonk <github.com@herrie.org>
+
+description: |
+  PM8901 is a secondary PMIC paired with PM8058 on MSM8x60 family
+  (MSM8260/MSM8660/APQ8060) platforms. It exposes an over-temperature
+  alarm block at SSBI offset 0x23 (CTRL) with four selectable
+  thresholds and three escalating stages.
+
+  Unlike PM8058, there is no raw die-temperature ADC channel - the
+  driver decodes the stage + threshold pair into a representative
+  millicelsius value reported via the thermal-of framework.
+
+  Two PMIC-internal interrupts are exposed:
+
+    - TEMP_ALARM    (PM8901 IRQ block 6 bit 4 == hwirq 52): asserted
+                    on every stage transition;
+    - TEMP_HI_ALARM (PM8901 IRQ block 6 bit 5 == hwirq 53): asserted
+                    when the part enters the high-temperature stage.
+
+  Both line up on the parent qcom,pm8901 interrupt-controller.
+
+allOf:
+  - $ref: /schemas/thermal/thermal-sensor.yaml#
+
+properties:
+  compatible:
+    const: qcom,pm8901-temp-alarm
+
+  reg:
+    description: SSBI offset of the temp-alarm CTRL register.
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: Stage-transition alarm interrupt (TEMP_ALARM).
+      - description: Hi-temperature alarm interrupt (TEMP_HI_ALARM).
+
+  interrupt-names:
+    items:
+      - const: alarm
+      - const: hi-alarm
+
+  "#thermal-sensor-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    ssbi {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      pmic@0 {
+        compatible = "qcom,pm8901";
+        reg = <0>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+        #interrupt-cells = <2>;
+        interrupt-controller;
+        interrupt-parent = <&tlmm>;
+        interrupts = <31 IRQ_TYPE_EDGE_RISING>;
+
+        temp-alarm@23 {
+          compatible = "qcom,pm8901-temp-alarm";
+          reg = <0x23>;
+          interrupts = <52 IRQ_TYPE_EDGE_RISING>,
+                       <53 IRQ_TYPE_EDGE_RISING>;
+          interrupt-names = "alarm", "hi-alarm";
+          #thermal-sensor-cells = <0>;
+        };
+      };
+    };
-- 
2.43.0


