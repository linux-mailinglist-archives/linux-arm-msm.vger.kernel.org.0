Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A1952DAB09
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Dec 2020 11:46:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727278AbgLOKqb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Dec 2020 05:46:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726512AbgLOKqb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Dec 2020 05:46:31 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9B33C06179C
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Dec 2020 02:45:44 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id m25so38053246lfc.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Dec 2020 02:45:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Iok9EZ300tDruZZYjnl3X8mUSfTtvO4yXdZM94ezV7M=;
        b=TQfMQEkCi5npD/TRrgyZVSl+lqnjZaPFZ6pc7kuAKUwCWyl7deTiKkrQFqXOIKdgmU
         em4GJMLyMaCuQFDTBxwTZ+JrNIuDIIr13FtSRSZp4Dbdco14Gh08OhYKQuDr8hucxuJE
         gcKuIQ3y2QfvlRUY3HZ1aptqOv9EJn7jnO42kt5REje0YRg5LJp1KsdY45+Dpdj+rylO
         qqV4H+twFnE5ufqeyF14JfiZ9q5uGV8xSmPuLG3qZz3caGiNZB+stvQ/DbAZUvyPL0B8
         tCJU3BIO54qLJaKA5dPgWGaewuyrLib/eBb6R8RKMzpQ2EwKIXbVveINcsg5YrA9+Jm8
         4r9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Iok9EZ300tDruZZYjnl3X8mUSfTtvO4yXdZM94ezV7M=;
        b=o3WY/Qoh3zRnMs4WutUxG4tO0imHYchsqEOsYhFoB5hYZEM+GomvKqqkQMlQsuaMwN
         EXUJ7w4nfdHgZESFFZg28H/lOYksBK83txxA1/Ow0WtXkTskvCTRuD8KC36Ne8ij+aMm
         wIkP8oCLcdxwNVM1Wsu4B+B/uDrrpvOHAD0mH3x0wZ0Ka6rRj5+4jfCcbzzG/50wR2Af
         ZrdLRgXDyNVvdInNiinhK+TbzEV2hjh0DIORsxql1BQcbXTVCOMWx79rQ1mHOVrJL5ik
         cK9N9k/ZS+2xPrcNla68TlCBrcSgKXeYqENbxfmFYtZoxJHIdWDn6YhFgCOQn37gD5y4
         euLg==
X-Gm-Message-State: AOAM530nRZbiClb0Ci9Oy374IfiOXquOkrTFSvTNMLALCpnDFSyW7tNt
        jkieZmXuOy9MKBmdRqprHv7lMA==
X-Google-Smtp-Source: ABdhPJwE8dbYd/hT7rKyjepf1/GaHTNY1SG+P2v5Gg4vTWPV6UHUGOolRra1l94Be5HLozMPjs2plA==
X-Received: by 2002:a19:4196:: with SMTP id o144mr12351668lfa.342.1608029140741;
        Tue, 15 Dec 2020 02:45:40 -0800 (PST)
Received: from eriador.lumag.spb.ru ([188.162.65.209])
        by smtp.gmail.com with ESMTPSA id a15sm162749lfg.27.2020.12.15.02.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Dec 2020 02:45:40 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v4] dt-bindings: soc: qcom: convert qcom,smem bindings to yaml
Date:   Tue, 15 Dec 2020 13:45:37 +0300
Message-Id: <20201215104537.768914-1-dmitry.baryshkov@linaro.org>
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
 .../bindings/soc/qcom/qcom,smem.yaml          | 72 +++++++++++++++++++
 2 files changed, 72 insertions(+), 57 deletions(-)
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
index 000000000000..f7e17713b3d8
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,smem.yaml
@@ -0,0 +1,72 @@
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
+    const: qcom,smem
+
+  memory-region:
+    maxItems: 1
+    description: handle to memory reservation for main SMEM memory region.
+
+  hwlocks:
+    maxItems: 1
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

