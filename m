Return-Path: <linux-arm-msm+bounces-72977-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 215F7B51661
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 14:01:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BFD4B1C81737
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 12:02:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C0B93090F7;
	Wed, 10 Sep 2025 12:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b="bSKT7Xkb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-43170.protonmail.ch (mail-43170.protonmail.ch [185.70.43.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4516B241CB6
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 12:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757505690; cv=none; b=ocovFZsXqutSZ6/Jk7/5K4eagpYYR8YBfI9zgY/51fQy3mgWkrEky/vvrF4e1ZRZ0CXGxE8pYbQ3jMhAxv8u7kNJjCxqwxzn0ddeVxX3vUtS+YKSRHOJ1Ic14OVR0r8XxSGYIDRLwb1taStTR7GJxvX4F7jAXobOq21QYRbP5mU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757505690; c=relaxed/simple;
	bh=pD1AEKQjXf0zbSv1Q0FNq2EZxbMFJQOJHE/lVcm7Tpc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pZXWpeKV1ktkPtlXcdLmjnQM+kO5h37eHhU6oCHtDscsbgo3IstOw9f+sqWuJfGrBgmMZlKDYFwVv6a8SN1kirg+Oa/6MIxGbI+TLBSUH7BNfoF5cg+HVzMQuxAR2n0/VB+aYD2MOYZn6RfaKAN2hBBzkiD+bBRm9KKMaLe0iw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com; spf=pass smtp.mailfrom=vinarskis.com; dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b=bSKT7Xkb; arc=none smtp.client-ip=185.70.43.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vinarskis.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vinarskis.com;
	s=protonmail; t=1757505684; x=1757764884;
	bh=wSUr6lywRkV7++24dHfSjXCXpOsK5ZNcHOfkHUT/O9o=;
	h=From:Date:Subject:Message-Id:References:In-Reply-To:To:Cc:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=bSKT7XkbjnG588aNLU0ZpsIHA9HWKIjf0qk652mIBZXUh59banWFiTvS0BeJUaBXi
	 bCVJhegfgovBjo5JMgVcctgIvygwb2ZqCN5b2tHBEBfjUQBTYAfTflNEqHYNnMRMWD
	 low5lxjjhDWrQ0jUEB+t65a3U/NkuIYaTCQvZuuaBl2O9bkdRodgWulxxs65qabXns
	 BerWIeWUemum+zAzW1dzHpxV+7MCvWdWV7RPOSvMOeYzjryNjmoRw9S8lApzwo+G9E
	 OuD28y0uNNX1m7EGBZM49hgBRG2BmTM645a/ecb1LiGDYqYv6gX4XSwlqm50Q/ihu9
	 00G0Dik9XN4kA==
X-Pm-Submission-Id: 4cMK6B60Jqz2ScCx
From: Aleksandrs Vinarskis <alex@vinarskis.com>
Date: Wed, 10 Sep 2025 14:01:08 +0200
Subject: [PATCH v5 1/4] dt-bindings: leds: add generic LED consumer
 documentation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-leds-v5-1-bb90a0f897d5@vinarskis.com>
References: <20250910-leds-v5-0-bb90a0f897d5@vinarskis.com>
In-Reply-To: <20250910-leds-v5-0-bb90a0f897d5@vinarskis.com>
To: Hans de Goede <hansg@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Jean-Jacques Hiblot <jjhiblot@traphandler.com>, 
 Jacopo Mondi <jacopo@jmondi.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Daniel Thompson <danielt@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 threeway@gmail.com, Andy Shevchenko <andy.shevchenko@gmail.com>, 
 Aleksandrs Vinarskis <alex@vinarskis.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2711; i=alex@vinarskis.com;
 h=from:subject:message-id; bh=pD1AEKQjXf0zbSv1Q0FNq2EZxbMFJQOJHE/lVcm7Tpc=;
 b=owGbwMvMwCX2dl3hIv4AZgHG02pJDBkHM/rdFadwPqyT5p1mcf3nhNX/F+9JNXp3q07TSurTF
 q1jT86v7yhlYRDjYpAVU2Tp/vM1rWvR3LUM1zW+wcxhZQIZwsDFKQATybBkZJjEKibkun9X9SuD
 t3udNsxgSXqQ+L7jgtVjLrmQxDeZPQ0M/zTFVu3V/XRyq3td4tqtIjXpE80q87l3qWxi60uPNt0
 3nREA
X-Developer-Key: i=alex@vinarskis.com; a=openpgp;
 fpr=8E21FAE2D2967BB123303E8C684FD4BA28133815

Introduce common generic led consumer binding, where consumer defines
led(s) by phandle, as opposed to trigger-source binding where the
trigger source is defined in led itself.

Add already used in some schemas 'leds' parameter which expects
phandle-array. Additionally, introduce 'led-names' which could be used
by consumers to map LED devices to their respective functions.

Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
---
 .../devicetree/bindings/leds/leds-consumer.yaml    | 67 ++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/leds-consumer.yaml b/Documentation/devicetree/bindings/leds/leds-consumer.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..fe6a0faa1d3b8ff55e05dfdc7697ed2246f0cede
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-consumer.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/leds-consumer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Common leds consumer
+
+maintainers:
+  - Aleksandrs Vinarskis <alex@vinarskis.com>
+
+description:
+  Some LED defined in DT are required by other DT consumers, for example
+  v4l2 subnode may require privacy or flash LED. Unlike trigger-source
+  approach which is typically used as 'soft' binding, referencing LED
+  devices by phandle makes things simpler when 'hard' binding is desired.
+
+  Document LED properties that its consumers may define.
+
+select: true
+
+properties:
+  leds:
+    oneOf:
+      - type: object
+      - $ref: /schemas/types.yaml#/definitions/phandle-array
+        description:
+          A list of LED device(s) required by a particular consumer.
+        items:
+          maxItems: 1
+
+  led-names:
+    description:
+      A list of device name(s). Used to map LED devices to their respective
+      functions, when consumer requires more than one LED.
+
+additionalProperties: true
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/leds/common.h>
+
+    leds {
+        compatible = "gpio-leds";
+
+        privacy_led: privacy-led {
+            color = <LED_COLOR_ID_RED>;
+            default-state = "off";
+            function = LED_FUNCTION_INDICATOR;
+            gpios = <&tlmm 110 GPIO_ACTIVE_HIGH>;
+        };
+    };
+
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      v4l2_node: camera@36 {
+        reg = <0x36>;
+
+        leds = <&privacy_led>;
+        led-names = "privacy";
+      };
+    };
+
+...

-- 
2.48.1


