Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34C703B7D0F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jun 2021 07:51:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230005AbhF3Fxs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Jun 2021 01:53:48 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:25432 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229874AbhF3Fxs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Jun 2021 01:53:48 -0400
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 29 Jun 2021 22:51:20 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 29 Jun 2021 22:51:17 -0700
X-QCInternal: smtphost
Received: from c-skakit-linux.ap.qualcomm.com (HELO c-skakit-linux.qualcomm.com) ([10.242.51.242])
  by ironmsg02-blr.qualcomm.com with ESMTP; 30 Jun 2021 11:20:53 +0530
Received: by c-skakit-linux.qualcomm.com (Postfix, from userid 2344709)
        id C144F5149; Wed, 30 Jun 2021 11:20:51 +0530 (IST)
From:   satya priya <skakit@codeaurora.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     kgunda@codeaurora.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, satya priya <skakit@codeaurora.org>
Subject: [PATCH V5 1/2] dt-bindings: pinctrl: qcom-pmic-gpio: Convert qcom pmic gpio bindings to YAML
Date:   Wed, 30 Jun 2021 11:20:40 +0530
Message-Id: <1625032241-3458-2-git-send-email-skakit@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1625032241-3458-1-git-send-email-skakit@codeaurora.org>
References: <1625032241-3458-1-git-send-email-skakit@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Convert Qualcomm PMIC GPIO bindings from .txt to .yaml format.

Signed-off-by: satya priya <skakit@codeaurora.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
Changes in V2:
 - As per Rob's comments fixed bot erros.
 - Moved this patch to end of the series so that other patches are not
   blocked on this.

Changes in V3:
 - As per Rob's comments, added maxItems for reg and interrupts.
   Added reference of "pinmux-node.yaml" and "pincfg-node.yaml".
   Made 'additionalProperties' as false.

Changes in V4:
 - As per Rob's comments, added description for interrupts, defined
   constraints for "qcom,drive-strength", dropped description for function
   property.

Changes in RESEND V4:
 - Rebased on linux-next and sent.

Changes in V5:
 - Fixed Bjorn's comments on [1]

 [1] https://lore.kernel.org/patchwork/patch/1434144/

 .../devicetree/bindings/pinctrl/qcom,pmic-gpio.txt | 288 ---------------------
 .../bindings/pinctrl/qcom,pmic-gpio.yaml           | 259 ++++++++++++++++++
 2 files changed, 259 insertions(+), 288 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
deleted file mode 100644
index 161216d..0000000
--- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
+++ /dev/null
@@ -1,288 +0,0 @@
-Qualcomm PMIC GPIO block
-
-This binding describes the GPIO block(s) found in the 8xxx series of
-PMIC's from Qualcomm.
-
-- compatible:
-	Usage: required
-	Value type: <string>
-	Definition: must be one of:
-		    "qcom,pm8005-gpio"
-		    "qcom,pm8018-gpio"
-		    "qcom,pm8038-gpio"
-		    "qcom,pm8058-gpio"
-		    "qcom,pm8916-gpio"
-		    "qcom,pm8917-gpio"
-		    "qcom,pm8921-gpio"
-		    "qcom,pm8941-gpio"
-		    "qcom,pm8950-gpio"
-		    "qcom,pm8994-gpio"
-		    "qcom,pm8998-gpio"
-		    "qcom,pma8084-gpio"
-		    "qcom,pmi8950-gpio"
-		    "qcom,pmi8994-gpio"
-		    "qcom,pmi8998-gpio"
-		    "qcom,pms405-gpio"
-		    "qcom,pm660-gpio"
-		    "qcom,pm660l-gpio"
-		    "qcom,pm8150-gpio"
-		    "qcom,pm8150b-gpio"
-		    "qcom,pm8350-gpio"
-		    "qcom,pm8350b-gpio"
-		    "qcom,pm8350c-gpio"
-		    "qcom,pmk8350-gpio"
-		    "qcom,pm7325-gpio"
-		    "qcom,pmr735a-gpio"
-		    "qcom,pmr735b-gpio"
-		    "qcom,pm6150-gpio"
-		    "qcom,pm6150l-gpio"
-		    "qcom,pm8008-gpio"
-		    "qcom,pmx55-gpio"
-
-		    And must contain either "qcom,spmi-gpio" or "qcom,ssbi-gpio"
-		    if the device is on an spmi bus or an ssbi bus respectively
-
-- reg:
-	Usage: required
-	Value type: <prop-encoded-array>
-	Definition: Register base of the GPIO block and length.
-
-- interrupts:
-	Usage: required
-	Value type: <prop-encoded-array>
-	Definition: Must contain an array of encoded interrupt specifiers for
-		    each available GPIO
-
-- gpio-controller:
-	Usage: required
-	Value type: <none>
-	Definition: Mark the device node as a GPIO controller
-
-- #gpio-cells:
-	Usage: required
-	Value type: <u32>
-	Definition: Must be 2;
-		    the first cell will be used to define gpio number and the
-		    second denotes the flags for this gpio
-
-Please refer to ../gpio/gpio.txt and ../interrupt-controller/interrupts.txt for
-a general description of GPIO and interrupt bindings.
-
-Please refer to pinctrl-bindings.txt in this directory for details of the
-common pinctrl bindings used by client devices, including the meaning of the
-phrase "pin configuration node".
-
-The pin configuration nodes act as a container for an arbitrary number of
-subnodes. Each of these subnodes represents some desired configuration for a
-pin or a list of pins. This configuration can include the
-mux function to select on those pin(s), and various pin configuration
-parameters, as listed below.
-
-
-SUBNODES:
-
-The name of each subnode is not important; all subnodes should be enumerated
-and processed purely based on their content.
-
-Each subnode only affects those parameters that are explicitly listed. In
-other words, a subnode that lists a mux function but no pin configuration
-parameters implies no information about any pin configuration parameters.
-Similarly, a pin subnode that describes a pullup parameter implies no
-information about e.g. the mux function.
-
-The following generic properties as defined in pinctrl-bindings.txt are valid
-to specify in a pin configuration subnode:
-
-- pins:
-	Usage: required
-	Value type: <string-array>
-	Definition: List of gpio pins affected by the properties specified in
-		    this subnode.  Valid pins are:
-		    gpio1-gpio4 for pm8005
-		    gpio1-gpio6 for pm8018
-		    gpio1-gpio12 for pm8038
-		    gpio1-gpio40 for pm8058
-		    gpio1-gpio4 for pm8916
-		    gpio1-gpio38 for pm8917
-		    gpio1-gpio44 for pm8921
-		    gpio1-gpio36 for pm8941
-		    gpio1-gpio8 for pm8950 (hole on gpio3)
-		    gpio1-gpio22 for pm8994
-		    gpio1-gpio26 for pm8998
-		    gpio1-gpio22 for pma8084
-		    gpio1-gpio2 for pmi8950
-		    gpio1-gpio10 for pmi8994
-		    gpio1-gpio12 for pms405 (holes on gpio1, gpio9 and gpio10)
-		    gpio1-gpio10 for pm8150 (holes on gpio2, gpio5, gpio7
-					     and gpio8)
-		    gpio1-gpio12 for pm8150b (holes on gpio3, gpio4, gpio7)
-		    gpio1-gpio12 for pm8150l (hole on gpio7)
-		    gpio1-gpio10 for pm8350
-		    gpio1-gpio8 for pm8350b
-		    gpio1-gpio9 for pm8350c
-		    gpio1-gpio4 for pmk8350
-		    gpio1-gpio10 for pm7325
-		    gpio1-gpio4 for pmr735a
-		    gpio1-gpio4 for pmr735b
-		    gpio1-gpio10 for pm6150
-		    gpio1-gpio12 for pm6150l
-		    gpio1-gpio2 for pm8008
-		    gpio1-gpio11 for pmx55 (holes on gpio3, gpio7, gpio10
-					    and gpio11)
-
-- function:
-	Usage: required
-	Value type: <string>
-	Definition: Specify the alternative function to be configured for the
-		    specified pins.  Valid values are:
-		    "normal",
-		    "paired",
-		    "func1",
-		    "func2",
-		    "dtest1",
-		    "dtest2",
-		    "dtest3",
-		    "dtest4",
-		    And following values are supported by LV/MV GPIO subtypes:
-		    "func3",
-		    "func4"
-
-- bias-disable:
-	Usage: optional
-	Value type: <none>
-	Definition: The specified pins should be configured as no pull.
-
-- bias-pull-down:
-	Usage: optional
-	Value type: <none>
-	Definition: The specified pins should be configured as pull down.
-
-- bias-pull-up:
-	Usage: optional
-	Value type: <empty>
-	Definition: The specified pins should be configured as pull up.
-
-- qcom,pull-up-strength:
-	Usage: optional
-	Value type: <u32>
-	Definition: Specifies the strength to use for pull up, if selected.
-		    Valid values are; as defined in
-		    <dt-bindings/pinctrl/qcom,pmic-gpio.h>:
-		    1: 30uA                     (PMIC_GPIO_PULL_UP_30)
-		    2: 1.5uA                    (PMIC_GPIO_PULL_UP_1P5)
-		    3: 31.5uA                   (PMIC_GPIO_PULL_UP_31P5)
-		    4: 1.5uA + 30uA boost       (PMIC_GPIO_PULL_UP_1P5_30)
-		    If this property is omitted 30uA strength will be used if
-		    pull up is selected
-
-- bias-high-impedance:
-	Usage: optional
-	Value type: <none>
-	Definition: The specified pins will put in high-Z mode and disabled.
-
-- input-enable:
-	Usage: optional
-	Value type: <none>
-	Definition: The specified pins are put in input mode.
-
-- output-high:
-	Usage: optional
-	Value type: <none>
-	Definition: The specified pins are configured in output mode, driven
-		    high.
-
-- output-low:
-	Usage: optional
-	Value type: <none>
-	Definition: The specified pins are configured in output mode, driven
-		    low.
-
-- power-source:
-	Usage: optional
-	Value type: <u32>
-	Definition: Selects the power source for the specified pins. Valid
-		    power sources are defined per chip in
-		    <dt-bindings/pinctrl/qcom,pmic-gpio.h>
-
-- qcom,drive-strength:
-	Usage: optional
-	Value type: <u32>
-	Definition: Selects the drive strength for the specified pins. Value
-		    drive strengths are:
-		    0: no (PMIC_GPIO_STRENGTH_NO)
-		    1: high (PMIC_GPIO_STRENGTH_HIGH) 0.9mA @ 1.8V - 1.9mA @ 2.6V
-		    2: medium (PMIC_GPIO_STRENGTH_MED) 0.6mA @ 1.8V - 1.25mA @ 2.6V
-		    3: low (PMIC_GPIO_STRENGTH_LOW) 0.15mA @ 1.8V - 0.3mA @ 2.6V
-		    as defined in <dt-bindings/pinctrl/qcom,pmic-gpio.h>
-
-- drive-push-pull:
-	Usage: optional
-	Value type: <none>
-	Definition: The specified pins are configured in push-pull mode.
-
-- drive-open-drain:
-	Usage: optional
-	Value type: <none>
-	Definition: The specified pins are configured in open-drain mode.
-
-- drive-open-source:
-	Usage: optional
-	Value type: <none>
-	Definition: The specified pins are configured in open-source mode.
-
-- qcom,analog-pass:
-	Usage: optional
-	Value type: <none>
-	Definition: The specified pins are configured in analog-pass-through mode.
-
-- qcom,atest:
-	Usage: optional
-	Value type: <u32>
-	Definition: Selects ATEST rail to route to GPIO when it's configured
-		    in analog-pass-through mode.
-		    Valid values are 1-4 corresponding to ATEST1 to ATEST4.
-
-- qcom,dtest-buffer:
-	Usage: optional
-	Value type: <u32>
-	Definition: Selects DTEST rail to route to GPIO when it's configured
-		    as digital input.
-		    Valid values are 1-4 corresponding to DTEST1 to DTEST4.
-
-Example:
-
-	pm8921_gpio: gpio@150 {
-		compatible = "qcom,pm8921-gpio", "qcom,ssbi-gpio";
-		reg = <0x150 0x160>;
-		interrupts = <192 1>, <193 1>, <194 1>,
-			     <195 1>, <196 1>, <197 1>,
-			     <198 1>, <199 1>, <200 1>,
-			     <201 1>, <202 1>, <203 1>,
-			     <204 1>, <205 1>, <206 1>,
-			     <207 1>, <208 1>, <209 1>,
-			     <210 1>, <211 1>, <212 1>,
-			     <213 1>, <214 1>, <215 1>,
-			     <216 1>, <217 1>, <218 1>,
-			     <219 1>, <220 1>, <221 1>,
-			     <222 1>, <223 1>, <224 1>,
-			     <225 1>, <226 1>, <227 1>,
-			     <228 1>, <229 1>, <230 1>,
-			     <231 1>, <232 1>, <233 1>,
-			     <234 1>, <235 1>;
-
-		gpio-controller;
-		#gpio-cells = <2>;
-
-		pm8921_gpio_keys: gpio-keys {
-			volume-keys {
-				pins = "gpio20", "gpio21";
-				function = "normal";
-
-				input-enable;
-				bias-pull-up;
-				drive-push-pull;
-				qcom,drive-strength = <PMIC_GPIO_STRENGTH_NO>;
-				power-source = <PM8921_GPIO_S4>;
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
new file mode 100644
index 0000000..22c58de
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
@@ -0,0 +1,259 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/qcom,pmic-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm PMIC GPIO block
+
+maintainers:
+  - Bjorn Andersson <bjorn.andersson@linaro.org>
+
+description:
+  This binding describes the GPIO block(s) found in the 8xxx series of
+  PMIC's from Qualcomm.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - qcom,pm660-gpio
+          - qcom,pm660l-gpio
+          - qcom,pm6150-gpio
+          - qcom,pm6150l-gpio
+          - qcom,pm7325-gpio
+          - qcom,pm8005-gpio
+          - qcom,pm8008-gpio
+          - qcom,pm8018-gpio
+          - qcom,pm8038-gpio
+          - qcom,pm8058-gpio
+          - qcom,pm8150-gpio
+          - qcom,pm8150b-gpio
+          - qcom,pm8350-gpio
+          - qcom,pm8350b-gpio
+          - qcom,pm8350c-gpio
+          - qcom,pm8916-gpio
+          - qcom,pm8917-gpio
+          - qcom,pm8921-gpio
+          - qcom,pm8941-gpio
+          - qcom,pm8950-gpio
+          - qcom,pm8994-gpio
+          - qcom,pm8998-gpio
+          - qcom,pma8084-gpio
+          - qcom,pmi8950-gpio
+          - qcom,pmi8994-gpio
+          - qcom,pmi8998-gpio
+          - qcom,pmk8350-gpio
+          - qcom,pmr735a-gpio
+          - qcom,pmr735b-gpio
+          - qcom,pms405-gpio
+          - qcom,pmx55-gpio
+
+      - enum:
+          - qcom,spmi-gpio
+          - qcom,ssbi-gpio
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    minItems: 1
+    maxItems: 44
+    description: |
+        Must contain an array of encoded interrupt specifiers for
+        each available GPIO
+
+  '#interrupt-cells':
+    const: 2
+
+  interrupt-controller: true
+
+  gpio-controller: true
+
+  gpio-ranges:
+    maxItems: 1
+
+  '#gpio-cells':
+    const: 2
+    description: |
+        The first cell will be used to define gpio number and the
+        second denotes the flags for this gpio
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - gpio-controller
+  - '#gpio-cells'
+  - gpio-ranges
+
+patternProperties:
+  '.*':
+    anyOf:
+      - $ref: "pinmux-node.yaml"
+      - $ref: "pincfg-node.yaml"
+      - patternProperties:
+          ".*":
+            $ref: "#/$defs/gpio-pinctrl-state"
+
+$defs:
+  gpio-pinctrl-state:
+    type: object
+    anyOf:
+      - $ref: "pinmux-node.yaml"
+      - $ref: "pincfg-node.yaml"
+    properties:
+      pins:
+        description: |
+            List of gpio pins affected by the properties specified in
+            this subnode.  Valid pins are
+                 - gpio1-gpio10 for pm6150
+                 - gpio1-gpio12 for pm6150l
+                 - gpio1-gpio10 for pm7325
+                 - gpio1-gpio4 for pm8005
+                 - gpio1-gpio2 for pm8008
+                 - gpio1-gpio6 for pm8018
+                 - gpio1-gpio12 for pm8038
+                 - gpio1-gpio40 for pm8058
+                 - gpio1-gpio10 for pm8150 (holes on gpio2, gpio5,
+                                            gpio7 and gpio8)
+                 - gpio1-gpio12 for pm8150b (holes on gpio3, gpio4
+                                             and gpio7)
+                 - gpio1-gpio12 for pm8150l (hole on gpio7)
+                 - gpio1-gpio4 for pm8916
+                 - gpio1-gpio10 for pm8350
+                 - gpio1-gpio8 for pm8350b
+                 - gpio1-gpio9 for pm8350c
+                 - gpio1-gpio38 for pm8917
+                 - gpio1-gpio44 for pm8921
+                 - gpio1-gpio36 for pm8941
+                 - gpio1-gpio8 for pm8950 (hole on gpio3)
+                 - gpio1-gpio22 for pm8994
+                 - gpio1-gpio26 for pm8998
+                 - gpio1-gpio22 for pma8084
+                 - gpio1-gpio2 for pmi8950
+                 - gpio1-gpio10 for pmi8994
+                 - gpio1-gpio4 for pmk8350
+                 - gpio1-gpio4 for pmr735a
+                 - gpio1-gpio4 for pmr735b
+                 - gpio1-gpio12 for pms405 (holes on gpio1, gpio9
+                                            and gpio10)
+                 - gpio1-gpio11 for pmx55 (holes on gpio3, gpio7, gpio10
+                                            and gpio11)
+
+        items:
+          pattern: "^gpio([0-9]+)$"
+
+      function:
+        items:
+          - enum:
+              - normal
+              - paired
+              - func1
+              - func2
+              - dtest1
+              - dtest2
+              - dtest3
+              - dtest4
+              - func3  # supported by LV/MV GPIO subtypes
+              - func4  # supported by LV/MV GPIO subtypes
+
+      bias-disable: true
+      bias-pull-down: true
+      bias-pull-up: true
+
+      qcom,pull-up-strength:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: |
+            Specifies the strength to use for pull up, if selected.
+            Valid values are defined in
+            <dt-bindings/pinctrl/qcom,pmic-gpio.h>
+            If this property is omitted 30uA strength will be used
+            if pull up is selected
+
+      bias-high-impedance: true
+      input-enable: true
+      output-high: true
+      output-low: true
+      power-source: true
+
+      qcom,drive-strength:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: |
+            Selects the drive strength for the specified pins
+            Valid drive strength values are defined in
+            <dt-bindings/pinctrl/qcom,pmic-gpio.h>
+        enum: [0, 1, 2, 3]
+
+      drive-push-pull: true
+      drive-open-drain: true
+      drive-open-source: true
+
+      qcom,analog-pass:
+        $ref: /schemas/types.yaml#/definitions/flag
+        description: |
+            The specified pins are configured in
+            analog-pass-through mode.
+
+      qcom,atest:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: |
+            Selects ATEST rail to route to GPIO when it's
+            configured in analog-pass-through mode.
+        enum: [1, 2, 3, 4]
+
+      qcom,dtest-buffer:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: |
+            Selects DTEST rail to route to GPIO when it's
+            configured as digital input.
+        enum: [1, 2, 3, 4]
+
+    required:
+      - pins
+      - function
+
+    additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
+
+    pm8921_gpio: gpio@150 {
+      compatible = "qcom,pm8921-gpio", "qcom,ssbi-gpio";
+      reg = <0x150 0x160>;
+      interrupts = <192 1>, <193 1>, <194 1>,
+                   <195 1>, <196 1>, <197 1>,
+                   <198 1>, <199 1>, <200 1>,
+                   <201 1>, <202 1>, <203 1>,
+                   <204 1>, <205 1>, <206 1>,
+                   <207 1>, <208 1>, <209 1>,
+                   <210 1>, <211 1>, <212 1>,
+                   <213 1>, <214 1>, <215 1>,
+                   <216 1>, <217 1>, <218 1>,
+                   <219 1>, <220 1>, <221 1>,
+                   <222 1>, <223 1>, <224 1>,
+                   <225 1>, <226 1>, <227 1>,
+                   <228 1>, <229 1>, <230 1>,
+                   <231 1>, <232 1>, <233 1>,
+                   <234 1>, <235 1>;
+
+      gpio-controller;
+      gpio-ranges = <&pm8921_gpio 0 0 44>;
+      #gpio-cells = <2>;
+
+      pm8921_gpio_keys: gpio-keys {
+        volume-keys {
+          pins = "gpio20", "gpio21";
+          function = "normal";
+
+          input-enable;
+          bias-pull-up;
+          drive-push-pull;
+          qcom,drive-strength = <PMIC_GPIO_STRENGTH_NO>;
+          power-source = <PM8921_GPIO_S4>;
+        };
+      };
+    };
+...
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

