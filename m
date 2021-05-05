Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A60DF37362C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 May 2021 10:22:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230490AbhEEIXK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 May 2021 04:23:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229741AbhEEIXJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 May 2021 04:23:09 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71E71C061763
        for <linux-arm-msm@vger.kernel.org>; Wed,  5 May 2021 01:22:13 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id b14-20020a17090a6e0eb0290155c7f6a356so433193pjk.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 May 2021 01:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZvvR1l5zWhnCiSFTVSLKMPmtP+aPqUsrdD9rV7fyGQk=;
        b=lZpIaU18GoMD7xIbLu26GW0eja1C7rv3ubVocBG2UtQ+BpuYWNqt57Aocs1O7fAFpN
         HxwM0HOQ1nh2FLTZSBhHXBDkjNSUva1ld410WSuXwkshblzE/DRWHfxN3xITr9zExvpz
         iOdY25+m4rjtNDJ3VBDRIr3o0lak4lxdyQFJFQOuxZOd626I7Ub+ISJo58U9DcdRZezC
         OSrZuuCT/qYxhNBjlKWwIY9MjsKzcDWADmxDbI8yJLalStICvuLfifcqz6sfHHjk/gmr
         y8R9ECiYRl7yi8EVMaMl/pptmn3cRMNw8C7UYfpmsm5XMhMx0s1FXdlAHiZreltZh9tr
         rDhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZvvR1l5zWhnCiSFTVSLKMPmtP+aPqUsrdD9rV7fyGQk=;
        b=JKxhqd/9ssMNb785Es5xbsybveTUVxCb+mSgO41td12t6nbnfqFfnEcpfpkHaQ8rKo
         E+Dd1FopSZDdjcGU3ZY6RUB/R7z5Wzw8B4rw5fqQsJ0gU6+bKgK5MLHa6uzPkfBhQ1tm
         R4e9WsUp1EwaVa92r0Upp2gDpJz0VN6IWigRRRntd65XYzaYQOF6p2agrRAKnrhoMqr4
         nJrAR0y37Z9Vnwdiy+MM3pmsEi22nGX8yYe7/mnZGcESLysdLJlxWKTXdapd5sOdXpA7
         eESo32DTFdNHgAudLp+aYUTcR+YzR/bR6QNb9sFSyRthtrk5XujQ//SOaGQ6HjtOvCdK
         tXMQ==
X-Gm-Message-State: AOAM531tIooPp42EcG1UY9cumhbrgczbsaWZouCy/VrpVqs+VeeT1ztV
        n76KvY3oyBdwjeFFL8wqG4G0
X-Google-Smtp-Source: ABdhPJzL53zlnB5h2dfceV2M8LTTkKaz0hLTQHjBZQ+eIfg9dDQmyY/rhZcMa6rRIMSO1CjsEZl4/Q==
X-Received: by 2002:a17:903:230a:b029:ee:a909:4f92 with SMTP id d10-20020a170903230ab02900eea9094f92mr26648581plh.44.1620202932560;
        Wed, 05 May 2021 01:22:12 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:6d18:2fef:221f:3158:8c4c:ea90])
        by smtp.gmail.com with ESMTPSA id j27sm6417471pgb.54.2021.05.05.01.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 01:22:12 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     ohad@wizery.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, pillair@codeaurora.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH] dt-bindings: remoteproc: qcom: pas: Convert binding to YAML
Date:   Wed,  5 May 2021 13:52:00 +0530
Message-Id: <20210505082200.32635-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Convert Qualcomm ADSP Remoteproc devicetree binding to YAML.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 .../bindings/remoteproc/qcom,adsp.txt         | 228 --------
 .../bindings/remoteproc/qcom,adsp.yaml        | 534 ++++++++++++++++++
 2 files changed, 534 insertions(+), 228 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
deleted file mode 100644
index 229f908fd831..000000000000
--- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
+++ /dev/null
@@ -1,228 +0,0 @@
-Qualcomm ADSP Peripheral Image Loader
-
-This document defines the binding for a component that loads and boots firmware
-on the Qualcomm ADSP Hexagon core.
-
-- compatible:
-	Usage: required
-	Value type: <string>
-	Definition: must be one of:
-		    "qcom,msm8974-adsp-pil"
-		    "qcom,msm8996-adsp-pil"
-		    "qcom,msm8996-slpi-pil"
-		    "qcom,msm8998-adsp-pas"
-		    "qcom,msm8998-slpi-pas"
-		    "qcom,qcs404-adsp-pas"
-		    "qcom,qcs404-cdsp-pas"
-		    "qcom,qcs404-wcss-pas"
-		    "qcom,sc7180-mpss-pas"
-		    "qcom,sdm845-adsp-pas"
-		    "qcom,sdm845-cdsp-pas"
-                    "qcom,sdx55-mpss-pas"
-		    "qcom,sm8150-adsp-pas"
-		    "qcom,sm8150-cdsp-pas"
-		    "qcom,sm8150-mpss-pas"
-		    "qcom,sm8150-slpi-pas"
-		    "qcom,sm8250-adsp-pas"
-		    "qcom,sm8250-cdsp-pas"
-		    "qcom,sm8250-slpi-pas"
-		    "qcom,sm8350-adsp-pas"
-		    "qcom,sm8350-cdsp-pas"
-		    "qcom,sm8350-slpi-pas"
-		    "qcom,sm8350-mpss-pas"
-
-- interrupts-extended:
-	Usage: required
-	Value type: <prop-encoded-array>
-	Definition: reference to the interrupts that match interrupt-names
-
-- interrupt-names:
-	Usage: required
-	Value type: <stringlist>
-	Definition: The interrupts needed depends on the compatible
-		    string:
-	qcom,msm8974-adsp-pil:
-	qcom,msm8996-adsp-pil:
-	qcom,msm8996-slpi-pil:
-	qcom,msm8998-adsp-pas:
-	qcom,msm8998-slpi-pas:
-	qcom,qcs404-adsp-pas:
-	qcom,qcs404-cdsp-pas:
-	qcom,sdm845-adsp-pas:
-	qcom,sdm845-cdsp-pas:
-	qcom,sm8150-adsp-pas:
-	qcom,sm8150-cdsp-pas:
-	qcom,sm8150-slpi-pas:
-	qcom,sm8250-adsp-pas:
-	qcom,sm8250-cdsp-pas:
-	qcom,sm8250-slpi-pas:
-	qcom,sm8350-adsp-pas:
-	qcom,sm8350-cdsp-pas:
-	qcom,sm8350-slpi-pas:
-		    must be "wdog", "fatal", "ready", "handover", "stop-ack"
-	qcom,qcs404-wcss-pas:
-	qcom,sc7180-mpss-pas:
-        qcom,sdx55-mpss-pas:
-	qcom,sm8150-mpss-pas:
-	qcom,sm8350-mpss-pas:
-		    must be "wdog", "fatal", "ready", "handover", "stop-ack",
-		    "shutdown-ack"
-
-- firmware-name:
-	Usage: optional
-	Value type: <string>
-	Definition: must list the relative firmware image path for the
-		    Hexagon Core.
-
-- clocks:
-	Usage: required
-	Value type: <prop-encoded-array>
-	Definition: reference to the xo clock and optionally aggre2 clock to be
-		    held on behalf of the booting Hexagon core
-
-- clock-names:
-	Usage: required
-	Value type: <stringlist>
-	Definition: must be "xo" and optionally include "aggre2"
-
-- cx-supply:
-	Usage: required
-	Value type: <phandle>
-	Definition: reference to the regulator to be held on behalf of the
-		    booting Hexagon core
-
-- px-supply:
-	Usage: required
-	Value type: <phandle>
-	Definition: reference to the px regulator to be held on behalf of the
-		    booting Hexagon core
-
-- power-domains:
-	Usage: required
-	Value type: <phandle>
-	Definition: reference to power-domains that match the power-domain-names
-
-- power-domain-names:
-	Usage: required
-	Value type: <stringlist>
-	Definition: The power-domains needed depend on the compatible string:
-	qcom,msm8974-adsp-pil:
-	qcom,msm8996-adsp-pil:
-	qcom,msm8998-adsp-pas:
-		    must be "cx"
-	qcom,msm8996-slpi-pil:
-		    must be "ss_cx"
-	qcom,msm8998-slpi-pas:
-		    must be "ssc_cx"
-	qcom,qcs404-adsp-pas:
-		    must be "lpi_cx"
-	qcom,qcs404-cdsp-pas:
-	qcom,qcs404-wcss-pas:
-		    must be "mx"
-	qcom,sdm845-adsp-pas:
-	qcom,sdm845-cdsp-pas:
-	qcom,sm8150-adsp-pas:
-	qcom,sm8150-cdsp-pas:
-	qcom,sm8250-cdsp-pas:
-	qcom,sm8350-cdsp-pas:
-		    must be "cx", "load_state"
-	qcom,sc7180-mpss-pas:
-	qcom,sm8150-mpss-pas:
-	qcom,sm8350-mpss-pas:
-		    must be "cx", "load_state", "mss"
-        qcom,sdx55-mpss-pas:
-                    must be "cx", "mss"
-	qcom,sm8250-adsp-pas:
-	qcom,sm8350-adsp-pas:
-	qcom,sm8150-slpi-pas:
-	qcom,sm8250-slpi-pas:
-	qcom,sm8350-slpi-pas:
-		    must be "lcx", "lmx", "load_state"
-
-- memory-region:
-	Usage: required
-	Value type: <phandle>
-	Definition: reference to the reserved-memory for the ADSP
-
-- qcom,smem-states:
-	Usage: required
-	Value type: <phandle>
-	Definition: reference to the smem state for requesting the ADSP to
-		    shut down
-
-- qcom,smem-state-names:
-	Usage: required
-	Value type: <stringlist>
-	Definition: must be "stop"
-
-
-= SUBNODES
-The adsp node may have an subnode named either "smd-edge" or "glink-edge" that
-describes the communication edge, channels and devices related to the ADSP.
-See ../soc/qcom/qcom,smd.txt and ../soc/qcom/qcom,glink.txt for details on how
-to describe these.
-
-
-= EXAMPLE
-The following example describes the resources needed to boot control the
-ADSP, as it is found on MSM8974 boards.
-
-	adsp {
-		compatible = "qcom,msm8974-adsp-pil";
-
-		interrupts-extended = <&intc 0 162 IRQ_TYPE_EDGE_RISING>,
-				      <&adsp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
-				      <&adsp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
-				      <&adsp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
-				      <&adsp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
-		interrupt-names = "wdog",
-				  "fatal",
-				  "ready",
-				  "handover",
-				  "stop-ack";
-
-		clocks = <&rpmcc RPM_CXO_CLK>;
-		clock-names = "xo";
-
-		cx-supply = <&pm8841_s2>;
-
-		memory-region = <&adsp_region>;
-
-		qcom,smem-states = <&adsp_smp2p_out 0>;
-		qcom,smem-state-names = "stop";
-
-		smd-edge {
-			interrupts = <0 156 IRQ_TYPE_EDGE_RISING>;
-
-			qcom,ipc = <&apcs 8 8>;
-			qcom,smd-edge = <1>;
-		};
-	};
-
-The following example describes the resources needed to boot control the
-SLPI, as it is found on MSM8996 boards.
-
-	slpi {
-		compatible = "qcom,msm8996-slpi-pil";
-		interrupts-extended = <&intc 0 390 IRQ_TYPE_EDGE_RISING>,
-				      <&slpi_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
-				      <&slpi_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
-				      <&slpi_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
-				      <&slpi_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
-		interrupt-names = "wdog",
-				  "fatal",
-				  "ready",
-				  "handover",
-				  "stop-ack";
-
-		clocks = <&rpmcc MSM8996_RPM_SMD_XO_CLK_SRC>,
-		         <&rpmcc MSM8996_RPM_SMD_AGGR2_NOC_CLK>;
-		clock-names = "xo", "aggre2";
-
-		cx-supply = <&pm8994_l26>;
-		px-supply = <&pm8994_lvs2>;
-
-		memory-region = <&slpi_region>;
-		qcom,smem-states = <&slpi_smp2p_out 0>;
-		qcom,smem-state-names = "stop";
-        };
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
new file mode 100644
index 000000000000..9c07cfce0383
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
@@ -0,0 +1,534 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/qcom,adsp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm ADSP Peripheral Image Loader binding
+
+maintainers:
+  - Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+
+description:
+  This document defines the binding for a component that loads and boots
+  firmware on the Qualcomm ADSP Hexagon core.
+
+properties:
+  compatible:
+    enum:
+      - qcom,msm8974-adsp-pil
+      - qcom,msm8996-adsp-pil
+      - qcom,msm8996-slpi-pil
+      - qcom,msm8998-adsp-pas
+      - qcom,msm8998-slpi-pas
+      - qcom,qcs404-adsp-pas
+      - qcom,qcs404-cdsp-pas
+      - qcom,qcs404-wcss-pas
+      - qcom,sc7180-mpss-pas
+      - qcom,sdm845-adsp-pas
+      - qcom,sdm845-cdsp-pas
+      - qcom,sdx55-mpss-pas
+      - qcom,sm8150-adsp-pas
+      - qcom,sm8150-cdsp-pas
+      - qcom,sm8150-mpss-pas
+      - qcom,sm8150-slpi-pas
+      - qcom,sm8250-adsp-pas
+      - qcom,sm8250-cdsp-pas
+      - qcom,sm8250-slpi-pas
+      - qcom,sm8350-adsp-pas
+      - qcom,sm8350-cdsp-pas
+      - qcom,sm8350-slpi-pas
+      - qcom,sm8350-mpss-pas
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+    maxItems: 8
+
+  clock-names:
+    minItems: 1
+    maxItems: 8
+
+  interrupts:
+    minItems: 5
+    maxItems: 6
+
+  interrupt-names:
+    minItems: 5
+    maxItems: 6
+
+  resets:
+    minItems: 1
+    maxItems: 3
+
+  reset-names:
+    minItems: 1
+    maxItems: 3
+
+  cx-supply:
+    description: Phandle to the CX regulator
+
+  px-supply:
+    description: Phandle to the PX regulator
+
+  power-domains:
+    minItems: 1
+    maxItems: 3
+
+  power-domain-names:
+    minItems: 1
+    maxItems: 3
+
+  firmware-name:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: Firmware name for the Hexagon core
+
+  memory-region:
+    maxItems: 1
+    description: Reference to the reserved-memory for the Hexagon core
+
+  qcom,smem-states:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: States used by the AP to signal the Hexagon core
+    items:
+      - description: Stop the modem
+
+  qcom,smem-state-names:
+    $ref: /schemas/types.yaml#/definitions/string-array
+    description: The names of the state bits used for SMP2P output
+    items:
+      - const: stop
+
+  qcom,halt-regs:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description:
+      Phandle reference to a syscon representing TCSR followed by the
+      three offsets within syscon for q6, modem and nc halt registers.
+
+  smd-edge:
+    type: object
+    description:
+      Qualcomm Shared Memory subnode which represents communication edge,
+      channels and devices related to the ADSP.
+
+  glink-edge:
+    type: object
+    description:
+      Qualcomm G-Link subnode which represents communication edge, channels
+      and devices related to the ADSP.
+
+required:
+  - compatible
+  - clocks
+  - clock-names
+  - interrupts
+  - interrupt-names
+  - memory-region
+  - qcom,smem-states
+  - qcom,smem-state-names
+
+additionalProperties: false
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,msm8974-adsp-pil
+              - qcom,msm8996-adsp-pil
+              - qcom,msm8996-slpi-pil
+              - qcom,msm8998-adsp-pas
+              - qcom,qcs404-adsp-pas
+              - qcom,qcs404-wcss-pas
+              - qcom,sdm845-adsp-pas
+              - qcom,sdm845-cdsp-pas
+              - qcom,sm8150-adsp-pas
+              - qcom,sm8150-cdsp-pas
+              - qcom,sm8150-mpss-pas
+              - qcom,sm8150-slpi-pas
+              - qcom,sm8250-adsp-pas
+              - qcom,sm8250-cdsp-pas
+              - qcom,sm8250-slpi-pas
+              - qcom,sm8350-adsp-pas
+              - qcom,sm8350-cdsp-pas
+              - qcom,sm8350-slpi-pas
+              - qcom,sm8350-mpss-pas
+    then:
+      properties:
+        clocks:
+          items:
+            - description: XO clock
+        clock-names:
+          items:
+            - const: xo
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,msm8998-slpi-pas
+    then:
+      properties:
+        clocks:
+          items:
+            - description: XO clock
+            - description: AGGRE2 clock
+        clock-names:
+          items:
+            - const: xo
+            - const: aggre2
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,qcs404-cdsp-pas
+    then:
+      properties:
+        clocks:
+          items:
+            - description: XO clock
+            - description: SWAY clock
+            - description: TBU clock
+            - description: BIMC clock
+            - description: AHB AON clock
+            - description: Q6SS SLAVE clock
+            - description: Q6SS MASTER clock
+            - description: Q6 AXIM clock
+        clock-names:
+          items:
+            - const: xo
+            - const: sway
+            - const: tbu
+            - const: bimc
+            - const: ahb_aon
+            - const: q6ss_slave
+            - const: q6ss_master
+            - const: q6_axim
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sc7180-mpss-pas
+    then:
+      properties:
+        clocks:
+          items:
+            - description: XO clock
+            - description: IFACE clock
+            - description: BUS clock
+            - description: NAC clock
+            - description: SNOC AXI clock
+            - description: MNOC AXI clock
+        clock-names:
+          items:
+            - const: xo
+            - const: iface
+            - const: bus
+            - const: nav
+            - const: snoc_axi
+            - const: mnoc_axi
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,msm8974-adsp-pil
+              - qcom,msm8996-adsp-pil
+              - qcom,msm8996-slpi-pil
+              - qcom,msm8998-adsp-pas
+              - qcom,msm8998-slpi-pas
+              - qcom,qcs404-adsp-pas
+              - qcom,qcs404-cdsp-pas
+              - qcom,qcs404-wcss-pas
+              - qcom,sdm845-adsp-pas
+              - qcom,sdm845-cdsp-pas
+              - qcom,sm8150-adsp-pas
+              - qcom,sm8150-cdsp-pas
+              - qcom,sm8150-slpi-pas
+              - qcom,sm8250-adsp-pas
+              - qcom,sm8250-cdsp-pas
+              - qcom,sm8250-slpi-pas
+              - qcom,sm8350-adsp-pas
+              - qcom,sm8350-cdsp-pas
+              - qcom,sm8350-slpi-pas
+    then:
+      properties:
+        interrupts:
+          items:
+            - description: Watchdog interrupt
+            - description: Fatal interrupt
+            - description: Ready interrupt
+            - description: Handover interrupt
+            - description: Stop acknowledge interrupt
+        interrupt-names:
+          items:
+            - const: wdog
+            - const: fatal
+            - const: ready
+            - const: handover
+            - const: stop-ack
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sc7180-mpss-pas
+              - qcom,sdx55-mpss-pas
+              - qcom,sm8150-mpss-pas
+              - qcom,sm8350-mpss-pas
+    then:
+      properties:
+        interrupts:
+          items:
+            - description: Watchdog interrupt
+            - description: Fatal interrupt
+            - description: Ready interrupt
+            - description: Handover interrupt
+            - description: Stop acknowledge interrupt
+            - description: Shutdown acknowledge interrupt
+        interrupt-names:
+          items:
+            - const: wdog
+            - const: fatal
+            - const: ready
+            - const: handover
+            - const: stop-ack
+            - const: shutdown-ack
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,msm8974-adsp-pil
+    then:
+      required:
+        - cx-supply
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,msm8998-adsp-pas
+    then:
+      properties:
+        power-domains:
+          items:
+            - description: CX power domain
+        power-domain-names:
+          items:
+           - const: cx
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,msm8998-slpi-pas
+    then:
+      properties:
+        power-domains:
+          items:
+            - description: SSC-CX power domain
+        power-domain-names:
+          items:
+           - const: ssc_cx
+      required:
+        - px-supply
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sc7180-mpss-pas
+    then:
+      properties:
+        power-domains:
+          items:
+            - description: Load State power domain
+            - description: CX power domain
+            - description: MX power domain
+            - description: MSS power domain
+        power-domain-names:
+          items:
+           - const: load_state
+           - const: cx
+           - const: mx
+           - const: mss
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sm8150-adsp-pas
+              - qcom,sm8150-cdsp-pas
+    then:
+      properties:
+        power-domains:
+          items:
+            - description: Load State power domain
+            - description: CX power domain
+        power-domain-names:
+          items:
+           - const: load_state
+           - const: cx
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sm8150-mpss-pas
+              - qcom,sm8350-mpss-pas
+    then:
+      properties:
+        power-domains:
+          items:
+            - description: Load State power domain
+            - description: CX power domain
+            - description: MSS power domain
+        power-domain-names:
+          items:
+           - const: load_state
+           - const: cx
+           - const: mss
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sdx55-mpss-pas
+    then:
+      properties:
+        power-domains:
+          items:
+            - description: CX power domain
+            - description: MSS power domain
+        power-domain-names:
+          items:
+           - const: cx
+           - const: mss
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sm8150-slpi-pas
+              - qcom,sm8250-adsp-pas
+              - qcom,sm8250-slpi-pas
+              - qcom,sm8350-adsp-pas
+              - qcom,sm8350-slpi-pas
+    then:
+      properties:
+        power-domains:
+          items:
+            - description: Load State power domain
+            - description: LCX power domain
+            - description: LMX power domain
+        power-domain-names:
+          items:
+           - const: load_state
+           - const: lcx
+           - const: lmx
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sm8350-cdsp-pas
+    then:
+      properties:
+        power-domains:
+          items:
+            - description: Load State power domain
+            - description: CX power domain
+            - description: MXC power domain
+        power-domain-names:
+          items:
+           - const: load_state
+           - const: cx
+           - const: mxc
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,qcs404-cdsp-pas
+    then:
+      properties:
+        resets:
+          items:
+            - description: CDSP restart
+        reset-names:
+          items:
+            - const: restart
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sc7180-mpss-pas
+    then:
+      properties:
+        resets:
+          items:
+            - description: MSS restart
+            - description: PDC reset
+        reset-names:
+          items:
+            - const: mss_restart
+            - const: pdc_reset
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmcc.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    adsp {
+        compatible = "qcom,msm8974-adsp-pil";
+
+        interrupts-extended = <&intc 0 162 IRQ_TYPE_EDGE_RISING>,
+                      <&adsp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+                      <&adsp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+                      <&adsp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+                      <&adsp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
+        interrupt-names = "wdog",
+                  "fatal",
+                  "ready",
+                  "handover",
+                  "stop-ack";
+
+        clocks = <&rpmcc RPM_CXO_CLK>;
+        clock-names = "xo";
+
+        cx-supply = <&pm8841_s2>;
+
+        memory-region = <&adsp_region>;
+
+        qcom,smem-states = <&adsp_smp2p_out 0>;
+        qcom,smem-state-names = "stop";
+
+        smd-edge {
+            interrupts = <0 156 IRQ_TYPE_EDGE_RISING>;
+
+            qcom,ipc = <&apcs 8 8>;
+            qcom,smd-edge = <1>;
+        };
+    };
-- 
2.25.1

