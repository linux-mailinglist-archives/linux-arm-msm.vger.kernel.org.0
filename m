Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4A1F445EBA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Nov 2021 04:34:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232197AbhKEDgr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Nov 2021 23:36:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232220AbhKEDgp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Nov 2021 23:36:45 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5DB5C061203
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 Nov 2021 20:34:06 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id 77-20020a1c0450000000b0033123de3425so8684027wme.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Nov 2021 20:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bqnyUfsYYPNQeEjNNd0ONT4yS5Ioj9JRLh97+jvvDrA=;
        b=GT4ozU+PJYK2bPgxbTJv4jKYnJyF3vms4fiRo20p/wL8XI4sgVJJLcBQbldQUOKmQg
         BP6ZsbD1veHbfFbKmCyK0aIP29IwCKsgj52+8kiDyQey5buSvMTlHBGQlPH80h38YmrB
         qZ9L8GI8h2PvsRegII1B08soUixAdwbMSedxjSE7aJP4A83Boiue7e4IhyNLCdcFzGem
         B5nekgJKUXu+l9Z4hvf0yUFa9Exv7AFzo95VYfvaT2g3I8KsmTxTi2SBhxseR/E6Xag5
         JyWgw1+urjh2gSES95SRpTXBHf3HvJQK04CXcKnX01uHiUBzwX4NbfP2YT3dTKgpZ4sa
         sScQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bqnyUfsYYPNQeEjNNd0ONT4yS5Ioj9JRLh97+jvvDrA=;
        b=GhqN7hX7unLxk7h45kfBGn8bo6lZ+JE/EpFOhVl7PZzMKb+SrQoxmGrpiFkawzEhwE
         zGy42XD0fUc3Dd57X1b4KRAKpPoJqoF36o2gQXJ3b+k3WCKHWZc/DtITipMXPy/NXjcG
         tX7NaZPiI1FVHZWTBieNJ5gcgNEnOcF9xMaSihfPSn4Evw+fx8EHEUs112YNNh85y0Nn
         nYmM6yKc1SW0NfcPdOPRaP0bZQFyRePi5ihuD1ggywbUcfGOg9YcemSotjB4sLiGYMQP
         IPPACQQC6a8G6Bc2MP+/vbA8ylenvjwMnW8hpfvGzHACIMIKyvpmFSQ+30iuUcQUI9i1
         atMw==
X-Gm-Message-State: AOAM5300kNkgJECXB/xJQGvXGJMOGpTe/hX/HrVxVaferr4SYR7d4a4G
        nxXJhQflmY12qIh+3EsoEFDP/A==
X-Google-Smtp-Source: ABdhPJxKMXbhnHmXf7bDM8k22SeoiU0oYRut5rKKQXbiVgxlGcUfENOSmh6oerDdCcSrpV5gExNUlg==
X-Received: by 2002:a7b:cb17:: with SMTP id u23mr27744194wmj.183.1636083245256;
        Thu, 04 Nov 2021 20:34:05 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id l15sm2546296wme.47.2021.11.04.20.34.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Nov 2021 20:34:04 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, bjorn.andersson@linaro.org,
        robh+dt@kernel.org, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     wcheng@codeaurora.org, bryan.odonoghue@linaro.org
Subject: [PATCH v3 5/7] dt-bindings: usb: Add Qualcomm PMIC TCPM YAML schema
Date:   Fri,  5 Nov 2021 03:35:56 +0000
Message-Id: <20211105033558.1573552-6-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211105033558.1573552-1-bryan.odonoghue@linaro.org>
References: <20211105033558.1573552-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a YAML description for the pm8150b-tcpm driver. The pm8150b-tcpm
encapsulates a type-c block and a pdphy block into one block presented to
the tcpm Linux API.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/usb/qcom,pmic-tcpm.yaml          | 68 +++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/qcom,pmic-tcpm.yaml

diff --git a/Documentation/devicetree/bindings/usb/qcom,pmic-tcpm.yaml b/Documentation/devicetree/bindings/usb/qcom,pmic-tcpm.yaml
new file mode 100644
index 0000000000000..29ab7e2d678e1
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/qcom,pmic-tcpm.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/usb/qcom,pmic-tcpm.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Qualcomm PMIC TCPM Driver
+
+maintainers:
+  - Bryan O'Donoghue <bryan.odonoghue@linaro.org>
+
+description: |
+  Qualcomm PMIC Type-C Port Manager Driver
+
+properties:
+  compatible:
+    enum:
+      - qcom,pm8150b-tcpm
+
+  pmic_tcpm_typec:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      A phandle to the typec port hardware driver.
+
+  pmic_tcpm_pdphy:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      A phandle to the type-c pdphy hardware driver.
+
+required:
+  - compatible
+  - pmic_tcpm_typec
+  - pmic_tcpm_pdphy
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/usb/pd.h>
+    #include <dt-bindings/usb/typec/tcpm/qcom,pmic-usb-typec.h>
+    #include <dt-bindings/usb/typec/tcpm/qcom,pmic-usb-pdphy.h>
+
+    pm8150b_tcpm: pmic-tcpm {
+        compatible = "qcom,pm8150b-tcpm";
+
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        pmic_tcpm_typec = <&pm8150b_typec>;
+        pmic_tcpm_pdphy = <&pm8150b_pdphy>;
+
+        connector {
+            compatible = "usb-c-connector";
+
+            power-role = "source";
+            data-role = "dual";
+            self-powered;
+
+            source-pdos = <PDO_FIXED(5000, 3000,
+                           PDO_FIXED_DUAL_ROLE |
+                           PDO_FIXED_USB_COMM |
+                           PDO_FIXED_DATA_SWAP)>;
+
+        };
+    };
+
+...
-- 
2.33.0

