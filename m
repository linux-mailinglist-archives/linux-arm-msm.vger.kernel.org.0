Return-Path: <linux-arm-msm+bounces-27420-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2921D94150B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 17:02:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C819F1F24634
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 15:02:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7F941A2571;
	Tue, 30 Jul 2024 15:02:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ns.iliad.fr (ns.iliad.fr [212.27.33.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A58992A1C7;
	Tue, 30 Jul 2024 15:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.33.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722351723; cv=none; b=p3XekySY4eAcNWCz5ZAdK42pFcsE1+vVxOJLrBMHYXjcOkbBnJMiEnktaf7/CUsjAnW3TvrLMNxDu6kmLMiwnDcU6OhuvOH4RO4R+cYqB/tXpvZWL5F768qTPyOFIwaFdojae4EIePQRNJXHMXl3Jb9Qpp88FHg8S1PO/qEVdhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722351723; c=relaxed/simple;
	bh=j3rmh0DGZ8+bmHqgmYw6+xg7idEmJUNOYW1dYFfhCyg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HFGauu2aqD6kwRMrcPD23F0e1LMYpZLlXsV/qHkAotBpp1KFjy7OZgTEIOwI91DKsr7m3UC+vn+DOqh7Mz2ilw4PVHv5m5CS4yxf+S84zxbAiFf+pgThkP/m2Czh7OyWtTu8pUzzV6wQaQRQi4EyrqK28sltiVhFAoxOCH+rq90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=srs.iliad.fr; arc=none smtp.client-ip=212.27.33.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=srs.iliad.fr
Received: from ns.iliad.fr (localhost [127.0.0.1])
	by ns.iliad.fr (Postfix) with ESMTP id 555F720C96;
	Tue, 30 Jul 2024 17:01:51 +0200 (CEST)
Received: from [127.0.1.1] (freebox.vlq16.iliad.fr [213.36.7.13])
	by ns.iliad.fr (Postfix) with ESMTP id 42AE42057C;
	Tue, 30 Jul 2024 17:01:51 +0200 (CEST)
From: Marc Gonzalez <mgonzalez@freebox.fr>
Date: Tue, 30 Jul 2024 17:01:31 +0200
Subject: [PATCH v4 1/2] dt-bindings: display: bridge: add TI TDP158
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240730-tdp158-v4-1-da69001bdea2@freebox.fr>
References: <20240730-tdp158-v4-0-da69001bdea2@freebox.fr>
In-Reply-To: <20240730-tdp158-v4-0-da69001bdea2@freebox.fr>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Arnaud Vrac <avrac@freebox.fr>, 
 Pierre-Hugues Husson <phhusson@freebox.fr>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Marc Gonzalez <mgonzalez@freebox.fr>
X-Mailer: b4 0.13.0

TDP158 is an AC-coupled DVI / HDMI to TMDS level shifting Redriver.
It supports DVI 1.0, HDMI 1.4b and 2.0b.
It supports 4 TMDS channels, HPD, and a DDC interface.
It supports dual power supply rails (1.1V on VDD, 3.3V on VCC)
for power reduction. Several methods of power management are
implemented to reduce overall power consumption.
It supports fixed receiver EQ gain using I2C or pin strap to
compensate for different lengths input cable or board traces.

Features

- AC-coupled TMDS or DisplayPort dual-mode physical layer input
to HDMI 2.0b TMDS physical layer output supporting up to 6Gbps
data rate, compatible with HDMI 2.0b electrical parameters
- DisplayPort dual-mode standard version 1.1
- Programmable fixed receiver equalizer up to 15.5dB
- Global or independent high speed lane control, pre-emphasis
and transmit swing, and slew rate control
- I2C or pin strap programmable
- Configurable as a DisplayPort redriver through I2C
- Full lane swap on main lanes
- Low power consumption (200 mW at 6Gbps, 8 mW in shutdown)

https://www.ti.com/lit/ds/symlink/tdp158.pdf

Like the TFP410, the TDP158 can be set up in 2 different ways:
1) hard-coding its configuration settings using pin-strapping resistors
2) placing it on an I2C bus, and defer set-up until run-time

The mode is selected via pin 8 = I2C_EN
I2C_EN high = I2C Control Mode
I2C_EN low  = Pin Strap Mode

On our board, I2C_EN is pulled high.

Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
---
 .../bindings/display/bridge/ti,tdp158.yaml         | 57 ++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/ti,tdp158.yaml b/Documentation/devicetree/bindings/display/bridge/ti,tdp158.yaml
new file mode 100644
index 0000000000000..fe3de1534efc1
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/ti,tdp158.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/ti,tdp158.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI TDP158 HDMI to TMDS Redriver
+
+maintainers:
+  - Arnaud Vrac <avrac@freebox.fr>
+  - Pierre-Hugues Husson <phhusson@freebox.fr>
+
+properties:
+  compatible:
+    const: ti,tdp158
+
+# The reg property is required if and only if the device is connected
+# to an I2C bus. In pin strap mode, reg must not be specified.
+  reg:
+    description: I2C address of the device
+
+# Pin 36 = Operation Enable / Reset Pin
+# OE = L: Power Down Mode
+# OE = H: Normal Operation
+# Internal weak pullup - device resets on H to L transitions
+  enable-gpios:
+    description: GPIO controlling bridge enable
+
+  vcc-supply:
+    description: Power supply 3.3V
+
+  vdd-supply:
+    description: Power supply 1.1V
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Bridge input
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Bridge output
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - vcc-supply
+  - vdd-supply
+  - ports
+
+additionalProperties: false

-- 
2.34.1


