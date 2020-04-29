Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7F731BD126
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2020 02:30:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726447AbgD2AaO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Apr 2020 20:30:14 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:49937 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726423AbgD2AaO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Apr 2020 20:30:14 -0400
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 28 Apr 2020 17:30:13 -0700
Received: from gurus-linux.qualcomm.com ([10.46.162.81])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP; 28 Apr 2020 17:30:13 -0700
Received: by gurus-linux.qualcomm.com (Postfix, from userid 383780)
        id 45E25AD9; Tue, 28 Apr 2020 17:30:13 -0700 (PDT)
From:   Guru Das Srinagesh <gurus@codeaurora.org>
To:     devicetree@vger.kernel.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
        David Collins <collinsd@codeaurora.org>,
        linux-kernel@vger.kernel.org,
        Guru Das Srinagesh <gurus@codeaurora.org>
Subject: [PATCH v1 1/2] dt-bindings: mfd: Document QTI I2C PMIC controller
Date:   Tue, 28 Apr 2020 17:30:11 -0700
Message-Id: <0960b5d17013124d9bbdbe7f28374b3d6c9c026e.1588115326.git.gurus@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1588115326.git.gurus@codeaurora.org>
References: <cover.1588115326.git.gurus@codeaurora.org>
In-Reply-To: <cover.1588115326.git.gurus@codeaurora.org>
References: <cover.1588115326.git.gurus@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Qualcomm Technologies, Inc. I2C PMIC Controller is used by
multi-function PMIC devices which communicate over the I2C bus.  The
controller enumerates all child nodes as platform devices, and
instantiates a regmap interface for them to communicate over the I2C
bus.

The controller also controls interrupts for all of the children platform
devices.  The controller handles the summary interrupt by deciphering
which peripheral triggered the interrupt, and which of the peripheral
interrupts were triggered.  Finally, it calls the interrupt handlers for
each of the virtual interrupts that were registered.

Signed-off-by: Guru Das Srinagesh <gurus@codeaurora.org>
---
Changes from v0:
- Fixed "FATAL ERROR: Unable to parse input tree" error thrown by `make
  dt_binding_check`.

 .../devicetree/bindings/mfd/qcom,i2c-pmic.yaml     | 86 ++++++++++++++++++++++
 1 file changed, 86 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/qcom,i2c-pmic.yaml

diff --git a/Documentation/devicetree/bindings/mfd/qcom,i2c-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,i2c-pmic.yaml
new file mode 100644
index 0000000..42482af
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/qcom,i2c-pmic.yaml
@@ -0,0 +1,86 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/qcom,i2c-pmic.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies, Inc. I2C PMIC Interrupt Controller Platform Independent Bindings
+
+description: |
+  The I2C PMIC Controller is used by multi-function PMIC devices which
+  communicate over the I2C bus. An I2C PMIC controller node typically contains
+  one or more child nodes representing the device's peripherals. Each of the
+  peripherals typically has its own driver on the platform bus and will be
+  enumerated by this controller. The controller exposes a regmap to the
+  peripherals to communicate over the I2C bus.
+
+  The controller also controls interrupts for all of the peripherals on the
+  bus. The controller takes a summary interrupt, deciphers which peripheral
+  triggered the interrupt, and which of the peripheral's interrupts were
+  triggered. Finally, it calls the handlers for each of the virtual interrupts
+  that were registered.
+
+  This document describes the common platform independent bindings that apply
+  to all I2C PMIC interrupt controllers.
+
+maintainers:
+  - Guru Das Srinagesh <gurus@codeaurora.org>
+
+properties:
+  compatible:
+    const: qcom,i2c-pmic
+
+  reg:
+    description: 7-bit I2C address of the device.
+    maxItems: 1
+
+  interrupts:
+    description: Summary interrupt specifier.
+
+  interrupt-controller:
+    description: Flag indicating that this device is an interrupt controller.
+
+  "#interrupt-cells":
+    description: Number of cells to encode an interrupt source.
+
+  qcom,periph-map:
+    description: |
+      A contiguous list of u32 arrays where each element specifies the base
+      address of a single peripheral within the chip. This provides a mapping
+      between the summary status register bits and peripheral addresses as each
+      bit in the summary status register represents a peripheral.
+
+      The number of arrays should match the number of summary registers with up
+      to 8 elements each. Within each array, One element per bit of the summary
+      status register in order from the least sigificant bit to the most
+      significant bit.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+
+  pinctrl-names:
+    const: default
+
+  pinctrl-0:
+    description: phandle of the pin configuration.
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+required:
+  - compatible
+  - reg
+
+examples:
+  - |
+    qcom,smb138x@8 {
+      compatible = "qcom,i2c-pmic";
+      reg = <0x8>;
+      interrupt-parent = <&tlmm_pinmux>;
+      interrupts = <83 0>;
+      interrupt-controller;
+      #interrupt-cells = <3>;
+      pinctrl-names = "default";
+      pinctrl-0 = <&smb_stat_active>;
+      #address-cells = <1>;
+      #size-cells = <0>;
+      qcom,periph-map = <0x10 0x11 0x12 0x13 0x14 0x16 0x36>;
+    };
+
+...
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

