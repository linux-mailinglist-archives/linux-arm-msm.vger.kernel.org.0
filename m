Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94E564F23D5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Apr 2022 08:58:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231287AbiDEHAE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Apr 2022 03:00:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231279AbiDEHAD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Apr 2022 03:00:03 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 723D87EB1A
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Apr 2022 23:58:03 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id k2so6517400edj.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Apr 2022 23:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rZjzJt+Q8s0uR/epyUUgNkOPcmNYhHsDThvqQmb3yM0=;
        b=XNqE8cT5km1IRQCmYI0+cH0RJ2tSZ6isknZo+hF6RhJro3d2JX3yzlMx0Hh01Zg450
         81Pxqe7d+jroaCvlwQqGlJxx5i9v6EKYWhPT6h412Rsk9+xjhUqPmX/nqjEjfHDBjHZc
         1pAMEaSWxmPZMyxizF83shYPF/zSQ7IFvD6mDWGqG+zz+jtIum3pRLlGjJfSw/G+Xk5H
         syIcLEmrjkqesMkLLlwI8tD58FEGqTPDTXHcNgPh+rEZ4ah1C3SBtp0q9+nSe36B8grW
         lZyYVZywvrqIkf+sjK8GnVpAjgKhIwgTfbLmU3Qtl1lN9MEmDCP8JzLvHFD6Q23PBS0E
         3y0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rZjzJt+Q8s0uR/epyUUgNkOPcmNYhHsDThvqQmb3yM0=;
        b=Ge26/tDpP4/hMXOR5ZE/e27rv1G86BrTIosLaEkgTPk7sXdrsrl8uKxWc6AmsTE0UN
         B8LpmSyaSZYzw05bJMe5eBuJftowPfMeMvF3BxswICatjJPA/b/SSiTNP3REBAdBEehE
         hfLBHzyA6wa2sN/kXJhLFP11i3rOV+qEC9ilOSeuIuNHhEghr/l8k4jVIGnUAVe0RM1x
         EDRCX57oTnrptiSPHeTdyP+yfTgW6lpHQdt2YoINxCOA5BF/rFS19c+0BZaR18HemJ52
         etrhGoTWXQkb4KJ+OFX+h2NLKGULHfjxU/KHneyGamOLNTG5PJMBZ23CfKWwSZwJF8Vi
         vlbg==
X-Gm-Message-State: AOAM530EOOHEX7DRL48Fo7YnRKMrHoPBhTuU882l/ks0c9mqHAbLoOBK
        ka1VExMWLsngaqEj6Uf7PtR+kw==
X-Google-Smtp-Source: ABdhPJwtLene0gBYBGEDpU/h4AN+tVDgiEWPDJVTbZ7vUrtzPzJNi/rHzoRDGrp3Hfc6UuVuqbcZvw==
X-Received: by 2002:a05:6402:40c9:b0:419:4b81:162e with SMTP id z9-20020a05640240c900b004194b81162emr2057548edb.380.1649141881907;
        Mon, 04 Apr 2022 23:58:01 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id f17-20020a056402355100b0041925e80963sm6367419edd.41.2022.04.04.23.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Apr 2022 23:58:01 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v2 3/3] dt-bindings: soc: qcom,wcnss: convert to dtschema
Date:   Tue,  5 Apr 2022 08:57:52 +0200
Message-Id: <20220405065752.27389-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220405065752.27389-1-krzysztof.kozlowski@linaro.org>
References: <20220405065752.27389-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Convert the Qualcomm WCNSS bindings to DT Schema.

Changes against original bindings: fix qcom,smd-channels and
qcom,smem-states names (how they are used in DTS and driver), enforce
child node naming of bluetooth and wifi.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>

---

Changes since v1:
1. Use proper maxItems, not items-maxItems.
2. Add Rob's tag.
---
 .../bindings/soc/qcom/qcom,wcnss.txt          | 131 -----------------
 .../bindings/soc/qcom/qcom,wcnss.yaml         | 137 ++++++++++++++++++
 2 files changed, 137 insertions(+), 131 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,wcnss.txt
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,wcnss.yaml

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,wcnss.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,wcnss.txt
deleted file mode 100644
index 1382b64e1381..000000000000
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,wcnss.txt
+++ /dev/null
@@ -1,131 +0,0 @@
-Qualcomm WCNSS Binding
-
-This binding describes the Qualcomm WCNSS hardware. It consists of control
-block and a BT, WiFi and FM radio block, all using SMD as command channels.
-
-- compatible:
-	Usage: required
-	Value type: <string>
-	Definition: must be: "qcom,wcnss",
-
-- qcom,smd-channel:
-	Usage: required
-	Value type: <string>
-	Definition: standard SMD property specifying the SMD channel used for
-		    communication with the WiFi firmware.
-		    Should be "WCNSS_CTRL".
-
-- qcom,mmio:
-	Usage: required
-	Value type: <prop-encoded-array>
-	Definition: reference to a node specifying the wcnss "ccu" and "dxe"
-		    register blocks. The node must be compatible with one of
-		    the following:
-		    "qcom,riva",
-		    "qcom,pronto"
-
-- firmware-name:
-	Usage: optional
-	Value type: <string>
-	Definition: specifies the relative firmware image path for the WLAN NV
-		    blob. Defaults to "wlan/prima/WCNSS_qcom_wlan_nv.bin" if
-		    not specified.
-
-= SUBNODES
-The subnodes of the wcnss node are optional and describe the individual blocks in
-the WCNSS.
-
-== Bluetooth
-The following properties are defined to the bluetooth node:
-
-- compatible:
-	Usage: required
-	Value type: <string>
-	Definition: must be:
-		    "qcom,wcnss-bt"
-
-- local-bd-address:
-	Usage: optional
-	Value type: <u8 array>
-	Definition: see Documentation/devicetree/bindings/net/bluetooth.txt
-
-== WiFi
-The following properties are defined to the WiFi node:
-
-- compatible:
-	Usage: required
-	Value type: <string>
-	Definition: must be one of:
-		    "qcom,wcnss-wlan",
-
-- interrupts:
-	Usage: required
-	Value type: <prop-encoded-array>
-	Definition: should specify the "rx" and "tx" interrupts
-
-- interrupt-names:
-	Usage: required
-	Value type: <stringlist>
-	Definition: must contain "rx" and "tx"
-
-- qcom,smem-state:
-	Usage: required
-	Value type: <prop-encoded-array>
-	Definition: should reference the tx-enable and tx-rings-empty SMEM states
-
-- qcom,smem-state-names:
-	Usage: required
-	Value type: <stringlist>
-	Definition: must contain "tx-enable" and "tx-rings-empty"
-
-= EXAMPLE
-The following example represents a SMD node, with one edge representing the
-"pronto" subsystem, with the wcnss device and its wcn3680 BT and WiFi blocks
-described; as found on the 8974 platform.
-
-smd {
-	compatible = "qcom,smd";
-
-	pronto-edge {
-		interrupts = <0 142 1>;
-
-		qcom,ipc = <&apcs 8 17>;
-		qcom,smd-edge = <6>;
-
-		wcnss {
-			compatible = "qcom,wcnss";
-			qcom,smd-channels = "WCNSS_CTRL";
-
-			#address-cells = <1>;
-			#size-cells = <1>;
-
-			qcom,mmio = <&pronto>;
-
-			bt {
-				compatible = "qcom,wcnss-bt";
-
-				/* BD address 00:11:22:33:44:55 */
-				local-bd-address = [ 55 44 33 22 11 00 ];
-			};
-
-			wlan {
-				compatible = "qcom,wcnss-wlan";
-
-				interrupts = <0 145 0>, <0 146 0>;
-				interrupt-names = "tx", "rx";
-
-				qcom,smem-state = <&apps_smsm 10>, <&apps_smsm 9>;
-				qcom,smem-state-names = "tx-enable", "tx-rings-empty";
-			};
-		};
-	};
-};
-
-soc {
-	pronto: pronto {
-		compatible = "qcom,pronto";
-
-		reg = <0xfb204000 0x2000>, <0xfb202000 0x1000>, <0xfb21b000 0x3000>;
-		reg-names = "ccu", "dxe", "pmu";
-	};
-};
diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,wcnss.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,wcnss.yaml
new file mode 100644
index 000000000000..d891ecfb2691
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,wcnss.yaml
@@ -0,0 +1,137 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/qcom/qcom,wcnss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm WCNSS
+
+maintainers:
+  - Andy Gross <agross@kernel.org>
+  - Bjorn Andersson <bjorn.andersson@linaro.org>
+
+description:
+  The Qualcomm WCNSS hardware consists of control block and a BT, WiFi and FM
+  radio block, all using SMD as command channels.
+
+properties:
+  compatible:
+    const: qcom,wcnss
+
+  firmware-name:
+    $ref: /schemas/types.yaml#/definitions/string
+    default: "wlan/prima/WCNSS_qcom_wlan_nv.bin"
+    description:
+      Relative firmware image path for the WLAN NV blob.
+
+  qcom,mmio:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: |
+      Reference to a node specifying the wcnss "ccu" and "dxe" register blocks.
+      The node must be compatible with one of the following::
+           - qcom,riva"
+           - qcom,pronto"
+
+  qcom,smd-channels:
+    $ref: /schemas/types.yaml#/definitions/string
+    const: WCNSS_CTRL
+    description:
+      Standard SMD property specifying the SMD channel used for communication
+      with the WiFi firmware.
+
+  bluetooth:
+    type: object
+    additionalProperties: false
+    properties:
+      compatible:
+        const: qcom,wcnss-bt
+
+      local-bd-address:
+        $ref: /schemas/types.yaml#/definitions/uint8-array
+        maxItems: 6
+        description:
+          See Documentation/devicetree/bindings/net/bluetooth.txt
+
+    required:
+      - compatible
+
+  wifi:
+    additionalProperties: false
+    type: object
+    properties:
+      compatible:
+        const: qcom,wcnss-wlan
+
+      interrupts:
+        maxItems: 2
+
+      interrupt-names:
+        items:
+          - const: tx
+          - const: rx
+
+      qcom,smem-states:
+        $ref: /schemas/types.yaml#/definitions/phandle-array
+        maxItems: 2
+        description:
+          Should reference the tx-enable and tx-rings-empty SMEM states.
+
+      qcom,smem-state-names:
+        $ref: /schemas/types.yaml#/definitions/string-array
+        items:
+          - const: tx-enable
+          - const: tx-rings-empty
+        description:
+          Names of SMEM states.
+
+    required:
+      - compatible
+      - interrupts
+      - interrupt-names
+      - qcom,smem-states
+      - qcom,smem-state-names
+
+required:
+  - compatible
+  - qcom,mmio
+  - qcom,smd-channels
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    smd-edge {
+        interrupts = <GIC_SPI 142 IRQ_TYPE_EDGE_RISING>;
+
+        qcom,ipc = <&apcs 8 17>;
+        qcom,smd-edge = <6>;
+        qcom,remote-pid = <4>;
+
+        label = "pronto";
+
+        wcnss {
+            compatible = "qcom,wcnss";
+            qcom,smd-channels = "WCNSS_CTRL";
+
+            qcom,mmio = <&pronto>;
+
+            bluetooth {
+                compatible = "qcom,wcnss-bt";
+                /* BD address 00:11:22:33:44:55 */
+                local-bd-address = [ 55 44 33 22 11 00 ];
+            };
+
+            wifi {
+                compatible = "qcom,wcnss-wlan";
+
+                interrupts = <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
+                             <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
+                interrupt-names = "tx", "rx";
+
+                qcom,smem-states = <&apps_smsm 10>, <&apps_smsm 9>;
+                qcom,smem-state-names = "tx-enable", "tx-rings-empty";
+            };
+        };
+    };
-- 
2.32.0

