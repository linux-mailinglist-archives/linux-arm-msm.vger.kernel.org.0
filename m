Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E5E42CE5AB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Dec 2020 03:25:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726740AbgLDCYr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Dec 2020 21:24:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726332AbgLDCYq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Dec 2020 21:24:46 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AB9AC061A4F
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Dec 2020 18:24:05 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id u18so5627521lfd.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Dec 2020 18:24:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=s4u4b45a8ETNbHAbxtaaDiyY6Pkn4TPDLXT1pEb3qYw=;
        b=WBm42TQzCuibOmA79Uc0/Bn6AJUtpOgB7hKkz835mW8u6304nBbfXYnSF27Zz2AqFi
         Xk9D2C+CKu3OJ9LSCgp0HvxaDyM2g5wmZsfrYfWUo44b8QeLR+xx29irk2L+k+gprikd
         B8S435lj6Kg6DbILI9lfWozClyZbgj6Wa55tvNtyzWU9z/MFpHOELq1fN94pNgfIy2Ox
         JeWulLfw0mMgcudf1EcZUzNNuzLrZ4X8dgbp8R16mEdDmjd+CVFnuT5ohLdRp6EC9XVv
         xe7G7wRhS3mgtE7LwOGU9JhXoJ6ZMGWuIJh7iMij8iI7L7o93j58V90jthP2WFeaD+/g
         0roQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=s4u4b45a8ETNbHAbxtaaDiyY6Pkn4TPDLXT1pEb3qYw=;
        b=h2ihdE3zbd5zXKM2KCA4+eQb1ZDrE4TJJKw/S74PKREVdyQOWrv6ahLrfUwOY+YYif
         g4EZs5bT9GLBLKclhaGjlt9MgfOlJC1zchRfaoluYvaSUauHxgy84gQQFFTK2SApQfva
         dp9CXLHzOhY2Mj0EjCqVu6fqSXN6SMVWWD298u1PtW5Z9oKdph2eVUB204bL4q00Oo5a
         XxGoVtdwGn426iTC9pGKqA8L0Ad7tboavCVgSx1bGbxEjK31PkZI3x+gzHfV87LrnL2G
         O4GcLwePeorLl33i7f5ajtZ4942MzgHYXxM1Sxu5sgnHqzktfEKrN9B5jZ3GZV+ZuKWD
         v5Pg==
X-Gm-Message-State: AOAM533tF1YZbm0Q2n37eYQvQm/t5uzbBUBF2CbYb1VYHDgmlU/EDMTT
        FzxDSwPnGWnVfJGQA6rP8rmy+g==
X-Google-Smtp-Source: ABdhPJwv3Ghgdzxbv2YOauXTWvW0fSmH/eSiGTyZ9eAoedSXNILNPJHOyTRLG3gbrzc8dBX2knyfcQ==
X-Received: by 2002:a19:c21a:: with SMTP id l26mr2657579lfc.590.1607048643764;
        Thu, 03 Dec 2020 18:24:03 -0800 (PST)
Received: from eriador.lumag.spb.ru ([188.162.64.117])
        by smtp.gmail.com with ESMTPSA id u13sm145569lji.12.2020.12.03.18.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 18:24:03 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2] dt-bindings: soc: qcom: convert qcom,smem bindings to yaml
Date:   Fri,  4 Dec 2020 05:24:01 +0300
Message-Id: <20201204022401.1054122-1-dmitry.baryshkov@linaro.org>
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
index 000000000000..867640c09932
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
+        rpm_msg_ram: memory@fc428000 {
+            compatible = "qcom,rpm-msg-ram";
+            reg = <0xfc428000 0x4000>;
+        };
+    };
+
+...
-- 
2.29.2

