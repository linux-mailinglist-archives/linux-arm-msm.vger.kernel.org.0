Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C00CE1B60DB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2020 18:26:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729655AbgDWQ0g (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Apr 2020 12:26:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729677AbgDWQ0R (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Apr 2020 12:26:17 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 523A6C09B047
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2020 09:26:17 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id h12so1774072pjz.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2020 09:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/4hIQYv+cnSS5EBGhZrnbHDmqNcfJlnFh0NWx4Ib4eI=;
        b=EN7xq6iEwFMMRDScYJX4R/Ta53ZSC0FDklRkZeKgCHMZvUgbMxutCRrbtadKrJvM/z
         V4O4a+547nJUceAip8Ffs7+bp3mh3Ot8sBYwbabojDLrAIsAQj5UuGYhKtYeLh1FHR/0
         4mhWoHHnc19bzVnX9m7V0zR5d7pG+Q71Hk0AE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/4hIQYv+cnSS5EBGhZrnbHDmqNcfJlnFh0NWx4Ib4eI=;
        b=pgX2DlBsEEf5k0bU53ozLQiU33XvPAuzxapivADyI+ySQp7iSqTw5JnfVA7PzGha0E
         qX31iYIJxxqExPtgMlopgsKZP1gJaxbyK1esmqdncbAKKixDc24H/XjZO1KCgTTa0Jga
         BW/BtppGbEeVnDIiVmC0lQ2k1oWtyPRLmHdmwg4M9z2XmtdIOsX1pttHIdf70USLVJOu
         0zr1BOSwD8b9ZdxthQnAwHzfQAVq4ByYkGrKXDFBD+Q/oU+1BDjcItBntG3RUKZ3FlG5
         ur6z+b3AjGrLzQpNElGnyJaEOl5o60FymTajCijG/1UMcOaf9S/x3+0M0oNcJrnymHNl
         Bx6Q==
X-Gm-Message-State: AGi0PuZtel1LrZoVZoeRSmyj8LWPWt4RTxVAFsd7lCxz6Lae77Oq9Iow
        e+inXXUcPOOt6qM9rv0n688tnA==
X-Google-Smtp-Source: APiQypKJqc/xWptDnPAfXZkkwjKZxi26AxbtpB+sJapp1IZZIOoie02b5zsLDEMW2wO9+x8m0NYkqA==
X-Received: by 2002:a17:902:7148:: with SMTP id u8mr4269899plm.13.1587659176752;
        Thu, 23 Apr 2020 09:26:16 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id d12sm2841927pfq.36.2020.04.23.09.26.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2020 09:26:16 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
        narmstrong@baylibre.com, a.hajda@samsung.com,
        Laurent.pinchart@ideasonboard.com, spanda@codeaurora.org
Cc:     swboyd@chromium.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, jeffrey.l.hugo@gmail.com,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        robdclark@chromium.org, jernej.skrabec@siol.net, jonas@kwiboo.se,
        bjorn.andersson@linaro.org,
        Douglas Anderson <dianders@chromium.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/6] dt-bindings: drm/bridge: ti-sn65dsi86: Convert to yaml
Date:   Thu, 23 Apr 2020 09:25:46 -0700
Message-Id: <20200423092431.v3.4.Ifcdc4ecb12742a27862744ee1e8753cb95a38a7f@changeid>
X-Mailer: git-send-email 2.26.1.301.g55bc3eb7cb9-goog
In-Reply-To: <20200423162548.129661-1-dianders@chromium.org>
References: <20200423162548.129661-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This moves the bindings over, based a lot on toshiba,tc358768.yaml.
Unless there's someone known to be better, I've set the maintainer in
the yaml as the first person to submit bindings.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v3: None
Changes in v2:
- specification => specifier.
- power up => power.
- Added back missing suspend-gpios.
- data-lanes and lane-polarities are are the right place now.
- endpoints don't need to be patternProperties.
- Specified more details for data-lanes and lane-polarities.
- Added old example back in, fixing bugs in it.
- Example i2c bus is just called "i2c", not "i2c1" now.

 .../bindings/display/bridge/ti,sn65dsi86.txt  |  87 ------
 .../bindings/display/bridge/ti,sn65dsi86.yaml | 279 ++++++++++++++++++
 2 files changed, 279 insertions(+), 87 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.txt
 create mode 100644 Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.txt b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.txt
deleted file mode 100644
index 8ec4a7f2623a..000000000000
--- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.txt
+++ /dev/null
@@ -1,87 +0,0 @@
-SN65DSI86 DSI to eDP bridge chip
---------------------------------
-
-This is the binding for Texas Instruments SN65DSI86 bridge.
-http://www.ti.com/general/docs/lit/getliterature.tsp?genericPartNumber=sn65dsi86&fileType=pdf
-
-Required properties:
-- compatible: Must be "ti,sn65dsi86"
-- reg: i2c address of the chip, 0x2d as per datasheet
-- enable-gpios: gpio specification for bridge_en pin (active high)
-
-- vccio-supply: A 1.8V supply that powers up the digital IOs.
-- vpll-supply: A 1.8V supply that powers up the displayport PLL.
-- vcca-supply: A 1.2V supply that powers up the analog circuits.
-- vcc-supply: A 1.2V supply that powers up the digital core.
-
-Optional properties:
-- interrupts-extended: Specifier for the SN65DSI86 interrupt line.
-
-- gpio-controller: Marks the device has a GPIO controller.
-- #gpio-cells    : Should be two. The first cell is the pin number and
-                   the second cell is used to specify flags.
-                   See ../../gpio/gpio.txt for more information.
-- #pwm-cells : Should be one. See ../../pwm/pwm.yaml for description of
-               the cell formats.
-
-- clock-names: should be "refclk"
-- clocks: Specification for input reference clock. The reference
-	  clock rate must be 12 MHz, 19.2 MHz, 26 MHz, 27 MHz or 38.4 MHz.
-
-- data-lanes: See ../../media/video-interface.txt
-- lane-polarities: See ../../media/video-interface.txt
-
-- suspend-gpios: specification for GPIO1 pin on bridge (active low)
-
-Required nodes:
-This device has two video ports. Their connections are modelled using the
-OF graph bindings specified in Documentation/devicetree/bindings/graph.txt.
-
-- Video port 0 for DSI input
-- Video port 1 for eDP output
-
-Example
--------
-
-edp-bridge@2d {
-	compatible = "ti,sn65dsi86";
-	#address-cells = <1>;
-	#size-cells = <0>;
-	reg = <0x2d>;
-
-	enable-gpios = <&msmgpio 33 GPIO_ACTIVE_HIGH>;
-	suspend-gpios = <&msmgpio 34 GPIO_ACTIVE_LOW>;
-
-	interrupts-extended = <&gpio3 4 IRQ_TYPE_EDGE_FALLING>;
-
-	vccio-supply = <&pm8916_l17>;
-	vcca-supply = <&pm8916_l6>;
-	vpll-supply = <&pm8916_l17>;
-	vcc-supply = <&pm8916_l6>;
-
-	clock-names = "refclk";
-	clocks = <&input_refclk>;
-
-	ports {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		port@0 {
-			reg = <0>;
-
-			edp_bridge_in: endpoint {
-				remote-endpoint = <&dsi_out>;
-			};
-		};
-
-		port@1 {
-			reg = <1>;
-
-			edp_bridge_out: endpoint {
-				data-lanes = <2 1 3 0>;
-				lane-polarities = <0 1 0 1>;
-				remote-endpoint = <&edp_panel_in>;
-			};
-		};
-	};
-}
diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
new file mode 100644
index 000000000000..6d7d40ad45ac
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
@@ -0,0 +1,279 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/ti,sn65dsi86.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SN65DSI86 DSI to eDP bridge chip
+
+maintainers:
+  - Sandeep Panda <spanda@codeaurora.org>
+
+description: |
+  The Texas Instruments SN65DSI86 bridge takes MIPI DSI in and outputs eDP.
+  http://www.ti.com/general/docs/lit/getliterature.tsp?genericPartNumber=sn65dsi86&fileType=pdf
+
+properties:
+  compatible:
+    const: ti,sn65dsi86
+
+  reg:
+    const: 0x2d
+
+  enable-gpios:
+    maxItems: 1
+    description: GPIO specifier for bridge_en pin (active high).
+
+  suspend-gpios:
+    maxItems: 1
+    description: GPIO specifier for GPIO1 pin on bridge (active low).
+
+  vccio-supply:
+    description: A 1.8V supply that powers the digital IOs.
+
+  vpll-supply:
+    description: A 1.8V supply that powers the DisplayPort PLL.
+
+  vcca-supply:
+    description: A 1.2V supply that powers the analog circuits.
+
+  vcc-supply:
+    description: A 1.2V supply that powers the digital core.
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+    description:
+      Clock specifier for input reference clock. The reference clock rate must
+      be 12 MHz, 19.2 MHz, 26 MHz, 27 MHz or 38.4 MHz.
+
+  clock-names:
+    const: refclk
+
+  gpio-controller: true
+  '#gpio-cells':
+    const: 2
+    description:
+      First cell is pin number, second cell is flags.  GPIO pin numbers are
+      1-based to match the datasheet.  See ../../gpio/gpio.txt for more
+      information.
+
+  '#pwm-cells':
+    const: 1
+    description: See ../../pwm/pwm.yaml for description of the cell formats.
+
+  ports:
+    type: object
+
+    properties:
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
+      port@0:
+        type: object
+        additionalProperties: false
+
+        description:
+          Video port for MIPI DSI input
+
+        properties:
+          reg:
+            const: 0
+
+          endpoint:
+            type: object
+            additionalProperties: false
+
+            properties:
+              remote-endpoint: true
+
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+                items:
+                  enum:
+                    - 0
+                    - 1
+                    - 2
+                    - 3
+                description: See ../../media/video-interface.txt
+
+              lane-polarities:
+                minItems: 1
+                maxItems: 4
+                items:
+                  enum:
+                    - 0
+                    - 1
+                description: See ../../media/video-interface.txt
+
+            dependencies:
+              data-lanes: [lane-polarities]
+
+        required:
+          - reg
+
+      port@1:
+        type: object
+        additionalProperties: false
+
+        description:
+          Video port for eDP output (panel or connector).
+
+        properties:
+          reg:
+            const: 1
+
+          endpoint:
+            type: object
+            additionalProperties: false
+
+            properties:
+              remote-endpoint: true
+
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+                items:
+                  enum:
+                    - 0
+                    - 1
+                    - 2
+                    - 3
+                description: See ../../media/video-interface.txt
+
+              lane-polarities:
+                minItems: 1
+                maxItems: 4
+                items:
+                  enum:
+                    - 0
+                    - 1
+                description: See ../../media/video-interface.txt
+
+            dependencies:
+              data-lanes: [lane-polarities]
+
+        required:
+          - reg
+
+    required:
+      - "#address-cells"
+      - "#size-cells"
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - enable-gpios
+  - vccio-supply
+  - vpll-supply
+  - vcca-supply
+  - vcc-supply
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      bridge@2d {
+        compatible = "ti,sn65dsi86";
+        reg = <0x2d>;
+
+        interrupt-parent = <&tlmm>;
+        interrupts = <10 IRQ_TYPE_LEVEL_HIGH>;
+
+        enable-gpios = <&tlmm 102 GPIO_ACTIVE_HIGH>;
+
+        vpll-supply = <&src_pp1800_s4a>;
+        vccio-supply = <&src_pp1800_s4a>;
+        vcca-supply = <&src_pp1200_l2a>;
+        vcc-supply = <&src_pp1200_l2a>;
+
+        clocks = <&rpmhcc RPMH_LN_BB_CLK2>;
+        clock-names = "refclk";
+
+        ports {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          port@0 {
+            reg = <0>;
+            endpoint {
+              remote-endpoint = <&dsi0_out>;
+            };
+          };
+
+          port@1 {
+            reg = <1>;
+            endpoint {
+              remote-endpoint = <&panel_in_edp>;
+            };
+          };
+        };
+      };
+    };
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      bridge@2d {
+        compatible = "ti,sn65dsi86";
+        reg = <0x2d>;
+
+        enable-gpios = <&msmgpio 33 GPIO_ACTIVE_HIGH>;
+        suspend-gpios = <&msmgpio 34 GPIO_ACTIVE_LOW>;
+
+        interrupts-extended = <&gpio3 4 IRQ_TYPE_EDGE_FALLING>;
+
+        vccio-supply = <&pm8916_l17>;
+        vcca-supply = <&pm8916_l6>;
+        vpll-supply = <&pm8916_l17>;
+        vcc-supply = <&pm8916_l6>;
+
+        clock-names = "refclk";
+        clocks = <&input_refclk>;
+
+        ports {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          port@0 {
+            reg = <0>;
+
+            edp_bridge_in: endpoint {
+              remote-endpoint = <&dsi_out>;
+            };
+          };
+
+          port@1 {
+            reg = <1>;
+
+            edp_bridge_out: endpoint {
+              data-lanes = <2 1 3 0>;
+              lane-polarities = <0 1 0 1>;
+              remote-endpoint = <&edp_panel_in>;
+            };
+          };
+        };
+      };
+    };
-- 
2.26.1.301.g55bc3eb7cb9-goog

