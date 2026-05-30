Return-Path: <linux-arm-msm+bounces-110385-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eEk0FJLuGmqF9wgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110385-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 16:05:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EB87560D44B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 16:05:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 01362308FE41
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 14:00:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9AC92F6586;
	Sat, 30 May 2026 14:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b="D6IqTu8P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from outbound10.mail.transip.nl (outbound10.mail.transip.nl [136.144.136.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531323C2D;
	Sat, 30 May 2026 14:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.144.136.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780149645; cv=none; b=WfhanK9oCxv7Aove5dM3/tyeWj5m11qBW9H6Sy1ojc/wNiiy5a0XQM7rsvjsWclcZkt1ZAZjZzgh28rzNUb/eBXwKcaOyPtkNYn9maAbt/v/zp4UIjNRMyb29+g+U5UuWrYw/+N7ti02mAxk5Zm6giq26J0ZCqm8753IlTMLBIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780149645; c=relaxed/simple;
	bh=QkJA79Oa/BfdmoMoCt+60OKH9R+eQABEywYnRJyQVWA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oSO1JFenD57jLzBhP+/q1eBjuIm+OBboYUhIrQ/lfQczfhCfIVLAOD9vv/Wy/hw1NPuQBmbPS8uUkKJB69OUrTBO7SJ16zTZupOMA0b10aGeSfM2nYvuY0oFj1HJHH58zVaYGtQ7lnCq1ArVOhQylKkffiWtqsvwONDrRTAeYGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org; spf=pass smtp.mailfrom=herrie.org; dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b=D6IqTu8P; arc=none smtp.client-ip=136.144.136.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=herrie.org
Received: from submission1.mail.transip.nl (unknown [10.100.4.70])
	by outbound10.mail.transip.nl (Postfix) with ESMTP id 4gSMLy3BSfzTPPDm;
	Sat, 30 May 2026 16:00:42 +0200 (CEST)
Received: from herrie-desktop.. (180-93-184-31.ftth.glasoperator.nl [31.184.93.180])
	by submission1.mail.transip.nl (Postfix) with ESMTPA id 4gSMLx3VDyzJjhXx;
	Sat, 30 May 2026 16:00:41 +0200 (CEST)
From: Herman van Hazendonk <github.com@herrie.org>
To: Amit Kucheria <amitk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Lukasz Luba <lukasz.luba@arm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	van Hazendonk <github.com@herrie.org>,
	Zhang Rui <rui.zhang@intel.com>
Subject: [PATCH 1/2] dt-bindings: thermal: qcom: add pm8901-temp-alarm
Date: Sat, 30 May 2026 16:00:39 +0200
Message-ID: <386f3cef9d50d61f588f99706d9f979c56f8bab8.1780148149.git.github.com@herrie.org>
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
X-Scanned-By: ClueGetter at submission1.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=herrie.org; t=1780149641; h=from:subject:to:references:
 in-reply-to:date:mime-version:content-type;
 bh=DHgPgSc9IYtPxtaNkKbuQyCXlh0YF9woSduy3LC3tjY=;
 b=D6IqTu8Pt6BoBEWAx5ZiczoMj09ZBRU2W0j12xjC2n/olABK5anstRHDBiNT1R6+9acYs3
 wZ3asD8WZONHlMoxqVQtCKMpoGEFoCeFA6tGPWjWNepHI7C9YvvTK2m8qAwMVtCuIgOrgY
 a9SRP9H9uWmTLYnef0bNrW7piNBEinDrLUMhIAq6SjSJLC7IOUijRyzpEUPZZX6rtAHrhz
 tNrI4TGCBjaK6bST+P5GNbB5ioVsVf7Ogqr4AyJUz+4AtTur+F6yhhlUcmvuqwJbf9ajYu
 wmmeOGpfVyLelHOWZBwdywNlFCmct/kEg8dhg9xJ+0lutqEMBSGTmtDJQ5P6/w==
X-Report-Abuse-To: abuse@transip.nl
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[herrie.org:s=transip-a];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-110385-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,vger.kernel.org,arm.com,gmail.com,herrie.org,intel.com];
	DMARC_NA(0.00)[herrie.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[github.com@herrie.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[herrie.org:+];
	DBL_PROHIBIT(0.00)[0.0.0.23:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,herrie.org:email,herrie.org:mid,herrie.org:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: EB87560D44B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the binding for the temperature-alarm block inside the Qualcomm
PM8901 PMIC (companion to the PM8058 on MSM8x60). The driver exposes
the PM8901 die-temperature trip stages (105 / 125 / 145 C) to the
thermal framework via a thermal-zone, with stage 3 wired as a
critical trip so the kernel issues orderly_poweroff() when the part
overheats.

The binding describes the SSBI sub-node address, the GIC interrupt
the alarm raises on a stage transition, and the parent PMIC
reference.

Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
---
 .../thermal/qcom,pm8901-temp-alarm.yaml       | 79 +++++++++++++++++++
 1 file changed, 79 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/thermal/qcom,pm8901-temp-alarm.yaml

diff --git a/Documentation/devicetree/bindings/thermal/qcom,pm8901-temp-alarm.yaml b/Documentation/devicetree/bindings/thermal/qcom,pm8901-temp-alarm.yaml
new file mode 100644
index 000000000000..569943b4aedc
--- /dev/null
+++ b/Documentation/devicetree/bindings/thermal/qcom,pm8901-temp-alarm.yaml
@@ -0,0 +1,79 @@
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
+  alarm block at SSBI offset
+  0x23 (CTRL) / 0x24 (PWM) with four selectable thresholds and three
+  escalating stages. Unlike PM8058, there is no raw die-temperature
+  ADC channel — the driver decodes the stage + threshold pair into a
+  representative millicelsius value.
+
+  Two PMIC-internal interrupts are exposed: a stage-transition alarm
+  (TEMP_ALARM, PM8901 IRQ block 6 bit 4 == 52) and a hi-temp alarm
+  (TEMP_HI_ALARM, block 6 bit 5 == 53).
+
+  The driver registers a thermal-of sensor; board DTs declare trip
+  points and a critical-trip action against it.
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
+  - "#thermal-sensor-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    ssbi {
+      pmic {
+        compatible = "qcom,pm8901";
+        #interrupt-cells = <2>;
+        interrupt-controller;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        pm8901_temp: temp-alarm@23 {
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


