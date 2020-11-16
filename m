Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C6E32B45FB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Nov 2020 15:35:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730195AbgKPOe5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Nov 2020 09:34:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730053AbgKPOet (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Nov 2020 09:34:49 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6BDAC0617A6
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2020 06:34:48 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id r17so18954610wrw.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2020 06:34:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HKpu/mfhoRJU/Ty4aWVBT1w8Lcm0NqmGtTgrnNU+3m4=;
        b=YkBUelOSpBiRyifoGS+HqRrltuJze4ewjB+Uav0dGptLWLk/TLDvGmRdHTN4V8AAeP
         BwT2v1DvC4tjokiypMhkhpt4rGdYkxOU5vfLq+/yqcc0inFtYub1/E/J2U5Kbe3LGFQH
         35sHgPUpFHjJBeD8BOvAQ55oIRhqznBpOEeYgvj6DEst3x2vcQmBJg7zJ/w+CmhArWn1
         OkNew+FzzKe2ymeGMyrQpm9O8oOZgsVfk5e/oeXiBWz+T1sBRranBTpWU41h3OxU9Vdg
         QNjtnmiizynEbHFcIZJvoG50v34xKLVNi3xD4i9XccMQ1sHzwmyDmZ0mLf9j5ZDT14Oi
         OWVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HKpu/mfhoRJU/Ty4aWVBT1w8Lcm0NqmGtTgrnNU+3m4=;
        b=UmQSClqw5v3Q02BlhJ8aGEiALNHxsmBX0VhDSbIkIdPy701nBwYsRfR7+sXFOVgIJS
         6/YFw7GqQ+QW1BBw6f2JVlE5fvAJLcs/lUF1+xxJa9uLm7avJ3BqQvQ9ewBP/clz7bKd
         GYPsRXc97R8wzlWVuAhaq5pCaWjarzkqohcsFz6loV+p4K7wpuBwMBvu0up/icqSdMiH
         +fFvEuDOpXDhzGx/heZozDwY89rm5Jc3lhTTP/Yfe2t3mbziQdtaIEJcL5p82oFOoiGL
         lngMZN6O9l1vNDzW4IRb3E3HzHrPD0xR5Qkvdix7LghwoXOKJsyv2wzRjonRqKxtd1Rj
         7lkw==
X-Gm-Message-State: AOAM532koG4KABh9bfNYtZPAzAYBoBvJY+JswTJS00o0bGIuhNXZ4GWp
        tH4u99kzKrE5KEb/7DSC1kYocw==
X-Google-Smtp-Source: ABdhPJzyufYNawFO6bVo47vpEmPShbevIysYYh76iUy27+DFowMZ5nPcdd7dOJ1R6zrTQq6x1Lezbw==
X-Received: by 2002:adf:e6c8:: with SMTP id y8mr19390059wrm.414.1605537287568;
        Mon, 16 Nov 2020 06:34:47 -0800 (PST)
Received: from srini-hackbox.lan (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.gmail.com with ESMTPSA id n10sm24013501wrx.9.2020.11.16.06.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 06:34:46 -0800 (PST)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     linus.walleij@linaro.org, bjorn.andersson@linaro.org,
        robh+dt@kernel.org
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v4 1/2] dt-bindings: pinctrl: qcom: Add sm8250 lpass lpi pinctrl bindings
Date:   Mon, 16 Nov 2020 14:34:31 +0000
Message-Id: <20201116143432.15809-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20201116143432.15809-1-srinivas.kandagatla@linaro.org>
References: <20201116143432.15809-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add device tree binding Documentation details for Qualcomm SM8250
LPASS(Low Power Audio Sub System) LPI(Low Power Island) pinctrl driver.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 .../pinctrl/qcom,lpass-lpi-pinctrl.yaml       | 132 ++++++++++++++++++
 1 file changed, 132 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-pinctrl.yaml
new file mode 100644
index 000000000000..704e761146ef
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-pinctrl.yaml
@@ -0,0 +1,132 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/qcom,lpass-lpi-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies, Inc. Low Power Audio SubSystem (LPASS)
+  Low Power Island (LPI) TLMM block
+
+maintainers:
+  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+
+description: |
+  This binding describes the Top Level Mode Multiplexer block found in the
+  LPASS LPI IP on most Qualcomm SoCs
+
+properties:
+  compatible:
+    const: qcom,sm8250-lpass-lpi-pinctrl
+
+  reg:
+    minItems: 2
+    maxItems: 2
+
+  clocks:
+    items:
+      - description: LPASS Core voting clock
+      - description: LPASS Audio voting clock
+
+  clock-names:
+    items:
+      - const: core
+      - const: audio
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    description: Specifying the pin number and flags, as defined in
+      include/dt-bindings/gpio/gpio.h
+    const: 2
+
+  gpio-ranges:
+    maxItems: 1
+
+#PIN CONFIGURATION NODES
+patternProperties:
+  '-pins$':
+    type: object
+    description:
+      Pinctrl node's client devices use subnodes for desired pin configuration.
+      Client device subnodes use below standard properties.
+    $ref: "/schemas/pinctrl/pincfg-node.yaml"
+
+    properties:
+      pins:
+        description:
+          List of gpio pins affected by the properties specified in this
+          subnode.
+        items:
+          oneOf:
+            - pattern: "^gpio([0-9]|[1-9][0-9])$"
+        minItems: 1
+        maxItems: 14
+
+      function:
+        enum: [ gpio, swr_tx_clk, qua_mi2s_sclk, swr_tx_data1, qua_mi2s_ws,
+                swr_tx_data2, qua_mi2s_data0, swr_rx_clk, qua_mi2s_data1,
+                swr_rx_data1, qua_mi2s_data2, swr_tx_data3, swr_rx_data2,
+                dmic1_clk, i2s1_clk, dmic1_data, i2s1_ws, dmic2_clk,
+                i2s1_data0, dmic2_data, i2s1_data1, i2s2_clk, wsa_swr_clk,
+                i2s2_ws, wsa_swr_data, dmic3_clk, i2s2_data0, dmic3_data,
+                i2s2_data1 ]
+        description:
+          Specify the alternative function to be configured for the specified
+          pins.
+
+      drive-strength:
+        enum: [2, 4, 6, 8, 10, 12, 14, 16]
+        default: 2
+        description:
+          Selects the drive strength for the specified pins, in mA.
+
+      slew-rate:
+        enum: [0, 1, 2, 3]
+        default: 0
+        description: |
+            0: No adjustments
+            1: Higher Slew rate (faster edges)
+            2: Lower Slew rate (slower edges)
+            3: Reserved (No adjustments)
+
+      bias-pull-down: true
+
+      bias-pull-up: true
+
+      bias-disable: true
+
+      output-high: true
+
+      output-low: true
+
+    required:
+      - pins
+      - function
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - gpio-controller
+  - '#gpio-cells'
+  - gpio-ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/sound/qcom,q6afe.h>
+    lpi_tlmm: pinctrl@33c0000 {
+        compatible = "qcom,sm8250-lpass-lpi-pinctrl";
+        reg = <0x33c0000 0x20000>,
+              <0x355a000 0x1000>;
+        clocks = <&q6afecc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+                 <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+        clock-names = "core", "audio";
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&lpi_tlmm 0 0 14>;
+    };
-- 
2.21.0

