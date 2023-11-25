Return-Path: <linux-arm-msm+bounces-1922-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D004A7F8753
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Nov 2023 01:36:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 727C3B217A0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Nov 2023 00:36:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B8DA10EA;
	Sat, 25 Nov 2023 00:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MYNoJ++W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E253F1BD6;
	Fri, 24 Nov 2023 16:35:32 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-40b27726369so17263825e9.0;
        Fri, 24 Nov 2023 16:35:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700872531; x=1701477331; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MHiLFw1bIGohpGtROyp7CqLCgHPbQhHjoTE9dyN6vFM=;
        b=MYNoJ++WjyUQR7oZbprPpd/W1kjoOypyR9uH45lgCFTzi8SQn8ORZEswL+5aXmm0YU
         HYgj1rAMAVESk06onBC66hcftf4FzUAfYa1Wn5t0DT3Q8Ahs5qIR0uHPGMWo5M0tk18+
         gcoGszax6yWD5xsegyn9jd3F835O4D1T71iDh4woahYsrxadYdRp7RdN4P6FpX2Xl+zH
         9kJQ32xjrqoEeUzYpa4Wr7oLnadKyk7mbJaxmJls0H2vdTO6OI/jsjuLlF+tfHblXozN
         BT2+Xpn/bEwt1PXbOAzN4roL/372ceqQvgPHkysLmigGuy3ZwrqdHqdnMQPlGfYnrrxF
         KRaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700872531; x=1701477331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MHiLFw1bIGohpGtROyp7CqLCgHPbQhHjoTE9dyN6vFM=;
        b=GqCbhCC3OYeKSRmbu6RWKsfev7ffNkNqc+CJ8sMoo9OE89697BovB540sZ/lPJeDyl
         kUgG5ybSK+VAgfBWckzBJYMzqhg1sgchWAqHV3EFCvWflvNmzwDnTCngGAhyf3Nke/og
         TsaY919vRP9tk8XLo2ZTH4IJFVO4lxOlgR4qNhP7UcVBijJZtkTIQ/i3hs+9fP2GHOwA
         2JnudrjQBP6jSDwykWzR8Sg1Q0v/GSYu49gW98vmyeacwXUCuKYEoNSdMStJvuQ487QH
         oqs2SsN6ZVt399VOVKlO9Q5NqdIV1+841UWob5sXX5JG9pIoALMzIkAyr2MjtJjKNMOX
         fQKg==
X-Gm-Message-State: AOJu0YyieQ+9hMfPNbaTTiNw0GRts3VB2DYqpeqFpC7l6HxpfmL/89AG
	yxtKf+CpsW74QjIniNTsrs4=
X-Google-Smtp-Source: AGHT+IGLc1mlt385WXqXvC6FEasxlmbyfmfpQzHK0GhuUqCYjrLEyySLW33U0gTDlILd7OygLIsynA==
X-Received: by 2002:a05:600c:5252:b0:40b:36e7:1edf with SMTP id fc18-20020a05600c525200b0040b36e71edfmr3919226wmb.26.1700872531054;
        Fri, 24 Nov 2023 16:35:31 -0800 (PST)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.googlemail.com with ESMTPSA id u13-20020a05600c00cd00b00405718cbeadsm4268005wmm.1.2023.11.24.16.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 16:35:30 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	David Epping <david.epping@missinglinkelectronics.com>,
	Harini Katakam <harini.katakam@amd.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Robert Marko <robert.marko@sartura.hr>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [net-next RFC PATCH v2 09/11] dt-bindings: net: Document Qcom QCA807x PHY package
Date: Sat, 25 Nov 2023 01:11:25 +0100
Message-Id: <20231125001127.5674-10-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231125001127.5674-1-ansuelsmth@gmail.com>
References: <20231125001127.5674-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document Qcom QCA807x PHY package.

Qualcomm QCA807X Ethernet PHY is PHY package of 2 or 5
IEEE 802.3 clause 22 compliant 10BASE-Te, 100BASE-TX and
1000BASE-T PHY-s.

Document the required property to make the PHY package correctly
configure and work.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../devicetree/bindings/net/qcom,qca807x.yaml | 148 ++++++++++++++++++
 1 file changed, 148 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/qcom,qca807x.yaml

diff --git a/Documentation/devicetree/bindings/net/qcom,qca807x.yaml b/Documentation/devicetree/bindings/net/qcom,qca807x.yaml
new file mode 100644
index 000000000000..f6f07c77a639
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/qcom,qca807x.yaml
@@ -0,0 +1,148 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/qcom,qca807x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm QCA807X Ethernet PHY
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+  - Robert Marko <robert.marko@sartura.hr>
+
+description: |
+  Qualcomm QCA807X Ethernet PHY is PHY package of 2 or 5
+  IEEE 802.3 clause 22 compliant 10BASE-Te, 100BASE-TX and
+  1000BASE-T PHY-s.
+
+  They feature 2 SerDes, one for PSGMII or QSGMII connection with
+  MAC, while second one is SGMII for connection to MAC or fiber.
+
+  Both models have a combo port that supports 1000BASE-X and
+  100BASE-FX fiber.
+
+  Each PHY inside of QCA807x series has 4 digitally controlled
+  output only pins that natively drive LED-s for up to 2 attached
+  LEDs. Some vendor also use these 4 output for GPIO usage without
+  attaching LEDs.
+
+  Note that output pins can be set to drive LEDs OR GPIO, mixed
+  definition are not accepted.
+
+allOf:
+  - $ref: ethernet-phy-package.yaml#
+
+select:
+  properties:
+    $nodename:
+      pattern: "^ethernet-phy-package(@[a-f0-9]+)?$"
+
+  patternProperties:
+    ^ethernet-phy(@[a-f0-9]+)?$:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - ethernet-phy-id004d.d0b2
+              - ethernet-phy-id004d.d0b1
+
+      required:
+        - compatible
+
+  required:
+    - $nodename
+
+properties:
+  qcom,package-mode:
+    enum:
+      - qsgmii
+      - psgmii
+
+  qcom,tx-driver-strength:
+    enum: [140, 160, 180, 200, 220
+           240, 260, 280, 300, 320
+           400, 500, 600]
+
+patternProperties:
+  ^ethernet-phy(@[a-f0-9]+)?$:
+    $ref: /schemas/net/ethernet-phy.yaml#
+
+    properties:
+      gpio-controller:
+        description: set the output lines as GPIO instead of LEDs
+        type: boolean
+
+      '#gpio-cells':
+        description: number of GPIO cells for the PHY
+        const: 2
+
+    dependencies:
+      gpio-controller: ['#gpio-cells']
+
+    if:
+      required:
+        - gpio-controller
+    then:
+      properties:
+        leds: false
+
+    unevaluatedProperties: false
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/leds/common.h>
+
+    mdio {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ethernet-phy-package@0 {
+            #address-cells = <1>;
+            #size-cells = <0>;
+            reg = <0>;
+
+            qcom,package-mode = "qsgmii";
+
+            ethernet-phy@0 {
+                compatible = "ethernet-phy-id004d.d0b2";
+                reg = <0>;
+
+                leds {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    led@0 {
+                        reg = <0>;
+                        color = <LED_COLOR_ID_GREEN>;
+                        function = LED_FUNCTION_LAN;
+                        default-state = "keep";
+                    };
+                };
+            };
+
+            ethernet-phy@1 {
+                compatible = "ethernet-phy-id004d.d0b2";
+                reg = <1>;
+            };
+
+            ethernet-phy@2 {
+                compatible = "ethernet-phy-id004d.d0b2";
+                reg = <2>;
+
+                gpio-controller;
+                #gpio-cells = <2>;
+            };
+
+            ethernet-phy@3 {
+                compatible = "ethernet-phy-id004d.d0b2";
+                reg = <3>;
+            };
+
+            ethernet-phy@4 {
+                compatible = "ethernet-phy-id004d.d0b2";
+                reg = <4>;
+            };
+        };
+    };
-- 
2.40.1


