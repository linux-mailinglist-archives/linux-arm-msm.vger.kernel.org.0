Return-Path: <linux-arm-msm+bounces-101252-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ANwnJNvLzGlFWwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101252-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 09:40:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE513761B3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 09:40:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6C201313DC2C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 07:34:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB5C638B7A7;
	Wed,  1 Apr 2026 07:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b="0nD6GMGM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-05.mail-europe.com (mail-05.mail-europe.com [85.9.206.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F75A38AC99
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 07:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.9.206.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775028844; cv=none; b=pEw8MCzLHY/SeWRT985z+Ghpr4cprV9cm6jZqw7S76JlnBxv6KOhfWmZiTlJGH6nAqEkaFRQa8QqHDK1NLwQtkhTtY8JEFyi0we6gYapHeWF6FknJn38sQGvXW4cz8u27gn25s6qZlfSlp8RhOatIl5HycmOAGVGnbX9a0PLg7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775028844; c=relaxed/simple;
	bh=HDf6IioTKtM2Yd1tpJQvPhXmt4BYp2pPyNCv8v9anSY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZZlLgkSUHpWVkkOlkJdvz+gAQmMJ/k0A54WeqAg3x86eIu1fNCgdrdBZH/LFs/bHqwHzNiEycl/PLs7HSD+XH4qTPVyRTkHl4jZcAG3MNkm5dxdlV+Dpr4/BzOFqk35t0p9NuH2MZXd3VafJOFajIlRLXzUhlcIFo3Q5jmomXbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com; spf=pass smtp.mailfrom=vinarskis.com; dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b=0nD6GMGM; arc=none smtp.client-ip=85.9.206.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vinarskis.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vinarskis.com;
	s=protonmail2; t=1775028831; x=1775288031;
	bh=Lwc3kbdW5NBfrKmN1gAR7uqJolBzBAqp7UUOoy4W31A=;
	h=From:Date:Subject:Message-Id:References:In-Reply-To:To:Cc:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=0nD6GMGMy4NktB9BIBAvXj6K/fJmg+VI2kQj/7yCdwghvZU4wxjX12UX0exaygZjN
	 vhEoBiG7d/koav0T25gphud4b0mZG2JQBXcbIZir1MHhHwUzjjlbCBnetY+CLZmKas
	 gKjs5gzZ5Oaeu7NIo309j87petARyMBQgoyubt3VC/g/uwfYAiWSgY3RXYHEQexzQk
	 1juF9uMo4H/eXInlhHSpj/wT4/ESpEKMiCf5tka6rd87D0rajKunYTd7AsKawOIeWz
	 EGvYtxqhgFAtXDGcrDfiyLESBN8HBzfajA3mSowe6TzFFVKWfntn9mncTGRHR4A8UI
	 pzXtRwHVVCqLw==
X-Pm-Submission-Id: 4flxYn3kJ7z1DDLb
gpg: Signature made Wed 01 Apr 2026 09:30:46 AM CEST
gpg: using EDDSA key 8BFCF5668AA29DAD00D728F6EDAE71A20F500310
gpg: Good signature from "Aleksandrs Vinarskis <alex@vinarskis.com>"
 [ultimate]
gpg: aka "Aleksandrs Vinarskis <alex.vinarskis@gmail.com>" [ultimate]
From: Aleksandrs Vinarskis <alex@vinarskis.com>
Date: Wed, 01 Apr 2026 09:33:10 +0200
Subject: [PATCH 1/4] dt-bindings: platform: introduce EC for Dell XPS 13
 9345
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-dell-xps-9345-ec-v1-1-afa5cacd49be@vinarskis.com>
References: <20260401-dell-xps-9345-ec-v1-0-afa5cacd49be@vinarskis.com>
In-Reply-To: <20260401-dell-xps-9345-ec-v1-0-afa5cacd49be@vinarskis.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 laurentiu.tudor1@dell.com, Abel Vesa <abel.vesa@oss.qualcomm.com>, 
 Tobias Heider <tobias.heider@canonical.com>, Val Packett <val@packett.cool>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4404; i=alex@vinarskis.com;
 h=from:subject:message-id; bh=HDf6IioTKtM2Yd1tpJQvPhXmt4BYp2pPyNCv8v9anSY=;
 b=owGbwMvMwCX2dl3hIv4AZgHG02pJDJlnTkW7pLZU8pVvFX5V33bw/vmNx1w3iy3j9FLQSc4pW
 LyUy/5tRykLgxgXg6yYIkv3n69pXYvmrmW4rvENZg4rE8gQBi5OAZjIJTuG/2keX3ymKkdsVm1K
 Efh/4FXv9o+HbohJWnC8KrgqO0+vtobhN7uggxhL8A/FoI7c0lNb1cz+c4Yb8M/qFiq1YxC79fA
 bBwA=
X-Developer-Key: i=alex@vinarskis.com; a=openpgp;
 fpr=8E21FAE2D2967BB123303E8C684FD4BA28133815
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[vinarskis.com,quarantine];
	R_DKIM_ALLOW(-0.20)[vinarskis.com:s=protonmail2];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101252-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alex@vinarskis.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[vinarskis.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bewilderbeest.net:email,vinarskis.com:dkim,vinarskis.com:email,vinarskis.com:mid,3b:email]
X-Rspamd-Queue-Id: DDE513761B3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add bindings for Embedded Controller (EC) in Dell XPS 13 9345 (platform
codename 'tributo'). It may be partially or fully compatible with EC
found in Snapdragon-based Dell Latitude, Inspiron ('thena').

Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
---
 .../embedded-controller/dell,xps13-9345-ec.yaml    | 86 ++++++++++++++++++++++
 MAINTAINERS                                        |  5 ++
 2 files changed, 91 insertions(+)

diff --git a/Documentation/devicetree/bindings/embedded-controller/dell,xps13-9345-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/dell,xps13-9345-ec.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..30dc6dcd8c9f0312fdb4eafdef96bf0ce4975798
--- /dev/null
+++ b/Documentation/devicetree/bindings/embedded-controller/dell,xps13-9345-ec.yaml
@@ -0,0 +1,86 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/embedded-controller/dell,xps13-9345-ec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Dell XPS 13 9345 Embedded Controller
+
+maintainers:
+  - Aleksandrs Vinarskis <alex@vinarskis.com>
+
+description:
+  The Dell XPS 13 9345 has an Embedded Controller (EC) which handles thermal and power
+  management. It is communicating with SoC over multiple i2c busses. Particular driver
+  is for EC subsystem that handles fan speed control, thermal shutdown, peripherals
+  supply including trackpad, touch-row, display.
+
+properties:
+  compatible:
+    const: dell,xps13-9345-ec
+
+  reg:
+    const: 0x3b
+
+  interrupts:
+    maxItems: 1
+
+  io-channels:
+    description:
+      ADC channels connected to the 7 onboard thermistors on PMK8550.
+      EC requires frequent thermal readings of these channels to perform
+      automated fan speed control.
+    items:
+      - description: ADC channel for sys_therm0
+      - description: ADC channel for sys_therm1
+      - description: ADC channel for sys_therm2
+      - description: ADC channel for sys_therm3
+      - description: ADC channel for sys_therm4
+      - description: ADC channel for sys_therm5
+      - description: ADC channel for sys_therm6
+
+  io-channel-names:
+    items:
+      - const: sys_therm0
+      - const: sys_therm1
+      - const: sys_therm2
+      - const: sys_therm3
+      - const: sys_therm4
+      - const: sys_therm5
+      - const: sys_therm6
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - io-channels
+  - io-channel-names
+
+additionalProperties: false
+
+examples:
+  - |+
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/iio/qcom,spmi-adc7-pm8350.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        embedded-controller@3b {
+            compatible = "dell,xps13-9345-ec";
+            reg = <0x3b>;
+            interrupts-extended = <&tlmm 66 IRQ_TYPE_LEVEL_LOW>;
+
+            io-channels = <&pmk8550_vadc PM8350_ADC7_GPIO3_100K_PU(1)>,
+                          <&pmk8550_vadc PM8350_ADC7_GPIO4_100K_PU(1)>,
+                          <&pmk8550_vadc PM8350_ADC7_AMUX_THM1_100K_PU(1)>,
+                          <&pmk8550_vadc PM8350_ADC7_AMUX_THM2_100K_PU(1)>,
+                          <&pmk8550_vadc PM8350_ADC7_AMUX_THM3_100K_PU(1)>,
+                          <&pmk8550_vadc PM8350_ADC7_AMUX_THM4_100K_PU(1)>,
+                          <&pmk8550_vadc PM8350_ADC7_AMUX_THM5_100K_PU(1)>;
+            io-channel-names = "sys_therm0", "sys_therm1", "sys_therm2",
+                               "sys_therm3", "sys_therm4", "sys_therm5",
+                               "sys_therm6";
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index ff935e197c2153a9c52c94d6ead1df54543a36d4..fe3f2fc4fbc087d8041f97708fbb93722f7d1882 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7236,6 +7236,11 @@ S:	Maintained
 F:	Documentation/ABI/testing/sysfs-class-firmware-attributes
 F:	drivers/platform/x86/dell/dell-wmi-sysman/
 
+DELL XPS EMBEDDED CONTROLLER DRIVER
+M:	Aleksandrs Vinarskis <alex@vinarskis.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/embedded-controller/dell,xps13-9345-ec.yaml
+
 DELTA AHE-50DC FAN CONTROL MODULE DRIVER
 M:	Zev Weiss <zev@bewilderbeest.net>
 L:	linux-hwmon@vger.kernel.org

-- 
2.53.0


