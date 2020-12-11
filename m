Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A3DA2D6C63
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Dec 2020 01:28:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728577AbgLKAMI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Dec 2020 19:12:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729992AbgLKALl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Dec 2020 19:11:41 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7085EC0613CF
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Dec 2020 16:11:01 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id s11so8839525ljp.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Dec 2020 16:11:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+eTjMG6g5kysFviGDaQVeCwK/pz5fgQMRmsZivjOUoA=;
        b=DShQbq+w2xzrX37+xiexraWF91Aeul3s241f7OjzGXRblPbHmqx0DKgqs6fcOh8deP
         prgHsDatWHJn8La/kQmF7DMYVWK5+qLY1pBBh3aAgiM4ovl2Nv3sWanFq6HZKph+1N+q
         wdlh2vlSZQKYmTEwrLedmeZm6upwpYp/fmRx2/7W4cq30xZTOExLG91uETOONeg5O6Pc
         4E1XNge1lbRr8iBXMYWWBwT+FINQYlEff3U3VR3anF9ml7DNfaHrrJ+hlTVOj3cokN70
         lJIfvAtg6v3eXHFMSRcsWhwM4oaU/KfcqNo5KnsNmIwKLDPh2j2wVZmj72AjNyHZ709R
         yTHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+eTjMG6g5kysFviGDaQVeCwK/pz5fgQMRmsZivjOUoA=;
        b=I1RFNFVXqidpY1z5UTAVL/hPhuF8bNrsNt2bEGJhzEYb/EYtMa/eY2MfHQVAFZ7jfi
         k/LBwl2uAtqzBF8GwJbsBS0G+MzEeUgz+fPZwgaNvdDzmFpg8R0NeY0nsX4XVu9Uy78I
         DtfAItBagDt6TQ0Soa5w9wKdwKH2xMTV76T/h3MoSSKVl3DxAzyweiIyn9hG7fwNpB3G
         GgZL4NZJIWwqVfYVQOTKWKOi5HA0vRXrNIncVc4f7fyxVuu/PCe/HHraj+8HLEBM3/nJ
         J1NM9erdWmuQ2inACXIpgBjHMIqKzjJSQYbAYgNwPnfMQv4UdjA7cCzzK2OSSfAx8uJP
         hjnQ==
X-Gm-Message-State: AOAM530YQsBgdqA/3+rRGwARJzHPRNzws9THCjM0wcJl1uQuBTF1K98g
        a61S4zVQbqsEQj+sih8sWNprCg==
X-Google-Smtp-Source: ABdhPJwsF4TNIYkpxGUAo1eiox+cRw5n6NDoDtJ+QRj/ceiJSV8pHXaK3WdZhc7LFvsN8p7YG9sm0A==
X-Received: by 2002:a2e:b8d1:: with SMTP id s17mr4055048ljp.472.1607645459882;
        Thu, 10 Dec 2020 16:10:59 -0800 (PST)
Received: from eriador.lumag.spb.ru ([94.25.228.52])
        by smtp.gmail.com with ESMTPSA id k21sm776424ljb.43.2020.12.10.16.10.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 16:10:59 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v3] dt-bindings: soc: qcom: convert qcom,smem bindings to yaml
Date:   Fri, 11 Dec 2020 03:10:56 +0300
Message-Id: <20201211001057.3041604-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Convert soc/qcom/qcom,smem.txt bindings to YAML format.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/soc/qcom/qcom,smem.txt           | 57 ---------------
 .../bindings/soc/qcom/qcom,smem.yaml          | 73 +++++++++++++++++++
 2 files changed, 73 insertions(+), 57 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,smem.txt
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,smem.yaml

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,smem.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,smem.txt
deleted file mode 100644
index 9326cdf6e1b1..000000000000
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,smem.txt
+++ /dev/null
@@ -1,57 +0,0 @@
-Qualcomm Shared Memory Manager binding
-
-This binding describes the Qualcomm Shared Memory Manager, used to share data
-between various subsystems and OSes in Qualcomm platforms.
-
-- compatible:
-	Usage: required
-	Value type: <stringlist>
-	Definition: must be:
-		    "qcom,smem"
-
-- memory-region:
-	Usage: required
-	Value type: <prop-encoded-array>
-	Definition: handle to memory reservation for main SMEM memory region.
-
-- qcom,rpm-msg-ram:
-	Usage: required
-	Value type: <prop-encoded-array>
-	Definition: handle to RPM message memory resource
-
-- hwlocks:
-	Usage: required
-	Value type: <prop-encoded-array>
-	Definition: reference to a hwspinlock used to protect allocations from
-		    the shared memory
-
-= EXAMPLE
-The following example shows the SMEM setup for MSM8974, with a main SMEM region
-at 0xfa00000 and the RPM message ram at 0xfc428000:
-
-	reserved-memory {
-		#address-cells = <1>;
-		#size-cells = <1>;
-		ranges;
-
-		smem_region: smem@fa00000 {
-			reg = <0xfa00000 0x200000>;
-			no-map;
-		};
-	};
-
-	smem@fa00000 {
-		compatible = "qcom,smem";
-
-		memory-region = <&smem_region>;
-		qcom,rpm-msg-ram = <&rpm_msg_ram>;
-
-		hwlocks = <&tcsr_mutex 3>;
-	};
-
-	soc {
-		rpm_msg_ram: memory@fc428000 {
-			compatible = "qcom,rpm-msg-ram";
-			reg = <0xfc428000 0x4000>;
-		};
-	};
diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,smem.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,smem.yaml
new file mode 100644
index 000000000000..832bf54239c8
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,smem.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/soc/qcom/qcom,smem.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Qualcomm Shared Memory Manager binding
+
+maintainers:
+  - Andy Gross <agross@kernel.org>
+  - Bjorn Andersson <bjorn.andersson@linaro.org>
+
+description: |
+  This binding describes the Qualcomm Shared Memory Manager, used to share data
+  between various subsystems and OSes in Qualcomm platforms.
+
+properties:
+  compatible:
+    const: "qcom-smem"
+
+  memory-region:
+    maxItems: 1
+    description: handle to memory reservation for main SMEM memory region.
+
+  hwlocks:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: reference to a hwspinlock used to protect allocations from the shared memory
+
+  qcom,rpm-msg-ram:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: handle to RPM message memory resource
+
+required:
+  - compatible
+  - memory-region
+  - hwlocks
+
+additionalProperties: false
+
+examples:
+  - |
+    reserved-memory {
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+
+        smem_region: smem@fa00000 {
+            reg = <0xfa00000 0x200000>;
+            no-map;
+        };
+    };
+
+    smem {
+        compatible = "qcom,smem";
+
+        memory-region = <&smem_region>;
+        qcom,rpm-msg-ram = <&rpm_msg_ram>;
+
+        hwlocks = <&tcsr_mutex 3>;
+    };
+
+    soc {
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+
+        rpm_msg_ram: sram@fc428000 {
+            compatible = "qcom,rpm-msg-ram";
+            reg = <0xfc428000 0x4000>;
+        };
+    };
+
+...
-- 
2.29.2

