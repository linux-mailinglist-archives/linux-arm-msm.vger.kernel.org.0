Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50D01496D3C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Jan 2022 19:09:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234671AbiAVSJj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 22 Jan 2022 13:09:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231812AbiAVSJi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 22 Jan 2022 13:09:38 -0500
Received: from mxd2.seznam.cz (mxd2.seznam.cz [IPv6:2a02:598:2::210])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC447C06173B;
        Sat, 22 Jan 2022 10:09:37 -0800 (PST)
Received: from email.seznam.cz
        by email-smtpc20a.ng.seznam.cz (email-smtpc20a.ng.seznam.cz [10.23.18.24])
        id 0830f116533ea57f09993d48;
        Sat, 22 Jan 2022 19:09:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seznam.cz; s=beta;
        t=1642874976; bh=SZEZUNTWi8R6VYtMkFN2UP5iKGpVnlFtClAOQ0TYYzY=;
        h=Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
         References:MIME-Version:Content-Transfer-Encoding:X-szn-frgn:
         X-szn-frgc;
        b=ok7LkY6p7Yadb0RYpsGr1zqWf7QQPRITqQEu+w4n8sC59oHNbf9F5kYRo+bMt27Dx
         /cOeFQ67EXOH6fz+dUM25u98SJ31l7k0/j4TiaO2VRjLMtVwenw5wkTiJNB6n70ibr
         PK4bPylB1frsf6hYy5JMzdvZNhlVYWcwFwK+JiTw=
Received: from localhost.localdomain (ip-244-214.dynamic.ccinternet.cz [185.148.214.244])
        by email-relay24.ng.seznam.cz (Seznam SMTPD 1.3.136) with ESMTP;
        Sat, 22 Jan 2022 19:06:50 +0100 (CET)  
From:   michael.srba@seznam.cz
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Saravana Kannan <saravanak@google.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Michael Srba <Michael.Srba@seznam.cz>
Subject: [PATCH 3/4] dt-bindings: bus: add device tree bindings for qcom,ssc-block-bus
Date:   Sat, 22 Jan 2022 19:04:12 +0100
Message-Id: <20220122180413.1480-3-michael.srba@seznam.cz>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220122180413.1480-1-michael.srba@seznam.cz>
References: <20220122180413.1480-1-michael.srba@seznam.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-szn-frgn: <fcb73316-6adc-4192-a706-8e7a2a6a6598>
X-szn-frgc: <0>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Michael Srba <Michael.Srba@seznam.cz>

 This patch adds bindings for the AHB bus which exposes the SCC block in
 the global address space. This bus (and the SSC block itself) is present
 on certain qcom SoCs.

 In typical configuration, this bus (as some of the clocks and registers
 that we need to manipulate) is not accessible to the OS, and the
 resources on this bus are indirectly accessed by communicating with a
 hexagon CPU core residing in the SSC block. In this configuration, the
 hypervisor is the one performing the bus initialization for the purposes
 of bringing the haxagon CPU core out of reset.

 However, it is possible to change the configuration, in which case this
 binding serves to allow the OS to initialize the bus.

Signed-off-by: Michael Srba <Michael.Srba@seznam.cz>
---
 .../bindings/bus/qcom,ssc-block-bus.yaml      | 156 ++++++++++++++++++
 1 file changed, 156 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/bus/qcom,ssc-block-bus.yaml

diff --git a/Documentation/devicetree/bindings/bus/qcom,ssc-block-bus.yaml b/Documentation/devicetree/bindings/bus/qcom,ssc-block-bus.yaml
new file mode 100644
index 000000000000..ff02b13618a6
--- /dev/null
+++ b/Documentation/devicetree/bindings/bus/qcom,ssc-block-bus.yaml
@@ -0,0 +1,156 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/bus/qcom,ssc-block-bus.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: The AHB Bus Providing a Global View of the SSC Block on (some) qcom SoCs
+
+maintainers:
+  - Michael Srba <Michael.Srba@seznam.cz>
+
+description: |
+  This binding describes the dependencies (clocks, resets, power domains) which
+  need to be turned on in a sequence before communication over the AHB bus
+  becomes possible.
+
+  Additionally, the reg property is used to pass to the driver the location of
+  two sadly undocumented registers which need to be poked as part of the sequence.
+
+  Currently, this binding is known to apply to msm8998. If the binding applies
+  in it's current form, the compatible should contain "qcom,ssc-block-bus-v1".
+  If the binding needs tweaking in order to apply to another SoC, this binding
+  shall be extended.
+
+
+properties:
+  compatible:
+    contains:
+      items:
+      - enum: [ qcom,ssc-block-bus-v1 ]
+      - const: qcom,ssc-block-bus
+    description:
+      Shall contain "qcom,ssc-block-bus"
+
+  reg:
+    description: |
+      Shall contain the addresses of the SSCAON_CONFIG0 and SSCAON_CONFIG1
+      registers
+    minItems: 2
+    maxItems: 2
+
+  reg-names:
+    minItems: 2
+    maxItems: 2
+    items:
+      - const: mpm_sscaon_config0
+      - const: mpm_sscaon_config1
+
+  '#address-cells':
+    enum: [ 1, 2 ]
+
+  '#size-cells':
+    enum: [ 1, 2 ]
+
+  ranges: true
+
+  clocks:
+    description: |
+      Clock phandles for the xo, aggre2, gcc_im_sleep, aggre2_north,
+      ssc_xo and ssc_ahbs clocks
+    minItems: 6
+    maxItems: 6
+
+  clock-names:
+    items:
+      - const: xo
+      - const: aggre2
+      - const: gcc_im_sleep
+      - const: aggre2_north
+      - const: ssc_xo
+      - const: ssc_ahbs
+
+  power-domains:
+    description: Power domain phandles for the ssc_cx and ssc_mx power domains
+    minItems: 2
+    maxItems: 2
+
+  power-domain-names:
+    items:
+      - const: ssc_cx
+      - const: ssc_mx
+
+  resets:
+    description: |
+      Reset phandles for the ssc_reset and ssc_bcr resets (note: ssc_bcr is the
+      branch control register associated with the ssc_xo and ssc_ahbs clocks)
+    minItems: 2
+    maxItems: 2
+
+  reset-names:
+    items:
+      - const: ssc_reset
+      - const: ssc_bcr
+
+  qcom,halt-regs:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description:
+      Phandle reference to a syscon representing TCSR followed by the
+      offset within syscon for the ssc AXI halt register.
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - '#address-cells'
+  - '#size-cells'
+  - ranges
+  - clocks
+  - clock-names
+  - power-domains
+  - power-domain-names
+  - resets
+  - reset-names
+  - qcom,halt-regs
+
+additionalProperties: true
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-msm8996.h>
+
+    &soc {
+        ssc_ahb_slave@0x10AC008 { // devices under this node are physically located in the SSC block, connected to an ssc-internal bus;
+            #address-cells = <1>;
+            #size-cells = <1>;
+            ranges;
+
+            compatible = "qcom,ssc-block-bus";
+            reg = <0x10AC008 0x4>, <0x10AC010 0x4>;
+            reg-names = "mpm_sscaon_config0", "mpm_sscaon_config1";
+
+            clocks = <&xo>,
+                     <&rpmcc RPM_SMD_AGGR2_NOC_CLK>,
+                     <&gcc GCC_IM_SLEEP>,
+                     <&gcc AGGRE2_SNOC_NORTH_AXI>,
+                     <&gcc SSC_XO>,
+                     <&gcc SSC_CNOC_AHBS_CLK>;
+            clock-names = "xo", "aggre2", "gcc_im_sleep", "aggre2_north", "ssc_xo", "ssc_ahbs";
+
+            resets = <&gcc GCC_SSC_RESET>, <&gcc GCC_SSC_BCR>;
+            reset-names = "ssc_reset", "ssc_bcr";
+
+            power-domains = <&rpmpd MSM8998_SSCCX>, <&rpmpd MSM8998_SSCMX>;
+            power-domain-names = "ssc_cx", "ssc_mx";
+
+            qcom,halt-regs = <&tcsr_mutex_regs 0x26000>;
+
+            ssc_tlmm: pinctrl@5e10000 {
+                compatible = "qcom,msm8998-ssc-tlmm-pinctrl";
+                reg = <0x5E10000 0x10000>;
+                gpio-controller;
+                #gpio-cells = <2>;
+                gpio-ranges = <&ssc_tlmm 0 0 20>;
+            };
+        };
+    };
-- 
2.34.1

