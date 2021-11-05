Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23C99445EB8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Nov 2021 04:34:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231543AbhKEDgr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Nov 2021 23:36:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232231AbhKEDgo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Nov 2021 23:36:44 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91535C061714
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 Nov 2021 20:34:05 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id i5so11680276wrb.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Nov 2021 20:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LinCUed6dIxikoNS7KFJ+3JCI78Tz1AdQIW+pID0/eA=;
        b=jeil5/Ytm2mvaY8XSZnLWxPeWhqmKgSh9bYWNYq0i2CaAv1AWRyOia0PjTy3okDuVh
         NDbNNToqWBc4xtxnVpHwOSGDz9RZxbQn+tk5OpwA4/md3fcjECoDBjAGbwTdOkPecb6o
         8BEmAlOyKZmXpU3WdvUBWl4dyu+O1Z+VEIWMhrG3w8ile4tYPI9IH3J8oR5pUP4T5nVi
         0DMYNntdNpeqK3/hCMT/x173/EktA+LVosy3ksYyLSWEpFDgkzsUgX6iodcMz2c1Hqpi
         0PmXz/dlenFw4JXIbK6hpo7R2cQ9LKYD+P+V0mdl1ZNLgSqZPtMICIEyXWB1vPQ/6K6L
         x4Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LinCUed6dIxikoNS7KFJ+3JCI78Tz1AdQIW+pID0/eA=;
        b=Vto7nSl/3gl0M0hjrLu5qYUg5IH4dpnLbvJ6JYFvE/x07XI09ZvlBQNPKCs/j/rqz1
         0EjZ6Sm5keNyUX3gzjpas4GFK0cWMLPj9JyBZbEjSNBw7EU6Bwt4z7zET9hC2YOTOJfL
         Cwep4JzQacH9NpGVJNLoXudDddBlhW6bQwtwy9vDPKjhZmP1aoNwg4uCFnKAk9Q1/0PS
         6Ej8WBUTmxN2pxn7SQ5vzKSER/pFa94cRF+UKnkTxy9aL7jUpbjSzSSsm4iIjDpJe4I4
         Vcpik7q8F5Hdg5/vn5/4ickLWjKsBHNYF4lAWf11lUbVcFnh+1woPnkXy/nxp2CvwmG4
         mj9Q==
X-Gm-Message-State: AOAM5339UYZ1DFfCi9knURkhlPBa/R1Pm121uie8camXTcdH62XAm+2H
        DD1CpIluSX2l/1/aKL2v2NSExg==
X-Google-Smtp-Source: ABdhPJw5jOtMGQWyzi5fbd8n6uazb1B6yalNWyNWEPliY8z462uMA0kpkGdlOk5WFnteotF5l4ApTw==
X-Received: by 2002:adf:dc43:: with SMTP id m3mr71499157wrj.66.1636083244216;
        Thu, 04 Nov 2021 20:34:04 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id l15sm2546296wme.47.2021.11.04.20.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Nov 2021 20:34:03 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, bjorn.andersson@linaro.org,
        robh+dt@kernel.org, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     wcheng@codeaurora.org, bryan.odonoghue@linaro.org
Subject: [PATCH v3 4/7] dt-bindings: usb: Add Qualcomm PMIC PDPHY controller YAML schema
Date:   Fri,  5 Nov 2021 03:35:55 +0000
Message-Id: <20211105033558.1573552-5-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211105033558.1573552-1-bryan.odonoghue@linaro.org>
References: <20211105033558.1573552-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a YAML binding for the power-delivery PHY silicon interface inside
Qualcomm's pm8150b hardware block.

The pdphy driver operates with a type-c driver inside of a high level
single TCPM device to provide overall TCPM functionality.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/usb/qcom,pmic-pdphy.yaml         | 92 +++++++++++++++++++
 1 file changed, 92 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/qcom,pmic-pdphy.yaml

diff --git a/Documentation/devicetree/bindings/usb/qcom,pmic-pdphy.yaml b/Documentation/devicetree/bindings/usb/qcom,pmic-pdphy.yaml
new file mode 100644
index 0000000000000..9774939f7260b
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/qcom,pmic-pdphy.yaml
@@ -0,0 +1,92 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/usb/qcom,pmic-pdphy.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Qualcomm PMIC based USB PDPHY driver
+
+maintainers:
+  - Bryan O'Donoghue <bryan.odonoghue@linaro.org>
+
+description: |
+  Qualcomm PMIC Power Delivery PHY driver
+
+properties:
+  compatible:
+    enum:
+      - qcom,pm8150b-pdphy
+
+  reg:
+    maxItems: 1
+    description: PDPHY base address
+
+  interrupts:
+    items:
+      - description: Sig TX - transmitted reset signal
+      - description: Sig RX - received reset signal
+      - description: TX completion
+      - description: RX completion
+      - description: TX fail
+      - description: TX discgard
+      - description: RX discgard
+      - description: Fast Role Swap event
+
+  interrupt-names:
+    items:
+      - const: sig-tx
+      - const: sig-rx
+      - const: msg-tx
+      - const: msg-rx
+      - const: msg-tx-failed
+      - const: msg-tx-discarded
+      - const: msg-rx-discarded
+      - const: fr-swap
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/usb/typec/tcpm/qcom,pmic-usb-pdphy.h>
+
+    pm8150b {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        pm8150b_pdphy: pdphy@1700 {
+            compatible = "qcom,pm8150b-pdphy";
+            reg = <0x1700>;
+            interrupts = <0x2 0x17 PMIC_PDPHY_SIG_TX_IRQ
+                          IRQ_TYPE_EDGE_RISING>,
+                         <0x2 0x17 PMIC_PDPHY_SIG_RX_IRQ
+                          IRQ_TYPE_EDGE_RISING>,
+                         <0x2 0x17 PMIC_PDPHY_MSG_TX_IRQ
+                          IRQ_TYPE_EDGE_RISING>,
+                         <0x2 0x17 PMIC_PDPHY_MSG_RX_IRQ
+                          IRQ_TYPE_EDGE_RISING>,
+                         <0x2 0x17 PMIC_PDPHY_MSG_TX_FAIL_IRQ
+                          IRQ_TYPE_EDGE_RISING>,
+                         <0x2 0x17 PMIC_PDPHY_MSG_TX_DISCARD_IRQ
+                          IRQ_TYPE_EDGE_RISING>,
+                         <0x2 0x17 PMIC_PDPHY_MSG_RX_DISCARD_IRQ
+                          IRQ_TYPE_EDGE_RISING>,
+                         <0x2 0x17 PMIC_PDPHY_FR_SWAP_IRQ
+                          IRQ_TYPE_EDGE_RISING>;
+            interrupt-names = "sig-tx",
+                              "sig-rx",
+                              "msg-tx",
+                              "msg-rx",
+                              "msg-tx-failed",
+                              "msg-tx-discarded",
+                              "msg-rx-discarded",
+                              "fr-swap";
+        };
+    };
+...
-- 
2.33.0

