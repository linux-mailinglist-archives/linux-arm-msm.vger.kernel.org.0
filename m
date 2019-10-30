Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D5662E99CE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2019 11:16:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726384AbfJ3KQA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Oct 2019 06:16:00 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:37673 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726046AbfJ3KP7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Oct 2019 06:15:59 -0400
Received: by mail-wr1-f68.google.com with SMTP id e11so1614124wrv.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Oct 2019 03:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bRWjTok3cpmeNtVxH6zc/st7z28BlZWUi3b8mpXF5U0=;
        b=dIv/d7gJcpOEWC1xWTFw2diyMpxZAL9inhvW98xziJlL8S5flMDpFWV0csaWJaWQ92
         BluWhytq+fc8o8A6OYpD+dPmPqZ/RkDz+gwLzb6rg3L6DfBajfIvqG4MXsX+nLLvUtoX
         Qq7uW7o2oFJCa3B55NuhdQHBCUy2z93njyhNj+g/gA88M4LM2iKT83TmZwgs4DkI4y6E
         mszp4gHs/u7Xkt4g121W4/r2n0cpmNhj0dsEnjaRZ5a22F/08XZbtu2oMfUu0Uba9DDW
         f7fSczLwYZKyMOv3UeBtHNXg4NMg9MYqVsgPL5eVYLG00x5/vpYa91rBMsO754uf4jji
         ox6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bRWjTok3cpmeNtVxH6zc/st7z28BlZWUi3b8mpXF5U0=;
        b=p1yIGzL2EwfCJqNrW63paXLzQ0MIewf1VmpxxfwtLfVZAWHBXPTf2LAIWMzcIgcZ3i
         GZ1/DNymrSxjZH0NywGWJKIkRp3LvYF40AcP1pGgSlhvdUGZZozLiMIink0OmRjD0MIY
         6qw6noRPjwCXdtbC69oKhkwGv4kTFOKtSIbHVSrJY2szhEjLu1FwU9qlAay2v1df3ekb
         Lil39iWZEie449yr2Dw+qVQTtTt7w/twJHQgegxopWKNcpmb279qdKP3SULdOuGsf+G8
         zKtKFJlc+aHxTO2E0AxJhva7w0yk0VOyfppEc9nnlLWHPAxqau+ilQXX0MkCC+9bdEJR
         /yMw==
X-Gm-Message-State: APjAAAUVlSa5v/JKhChyORXqlkRjyq/UEN2F0ShlmvZnNvGMKb1Mpblc
        0McBN0R8tYCDxCop5x8e24dCIGwHTNzpKw==
X-Google-Smtp-Source: APXvYqxeF/PukXETq4F5oK9NFZgfPCY5B5NiL2Av5xLntDJ7THjOYuQoCWT2mRaiFzGMcFpuAtTAJA==
X-Received: by 2002:adf:e942:: with SMTP id m2mr2012593wrn.26.1572430556898;
        Wed, 30 Oct 2019 03:15:56 -0700 (PDT)
Received: from localhost.localdomain ([212.45.67.2])
        by smtp.googlemail.com with ESMTPSA id u7sm4923842wre.59.2019.10.30.03.15.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 30 Oct 2019 03:15:56 -0700 (PDT)
From:   Georgi Djakov <georgi.djakov@linaro.org>
To:     robh+dt@kernel.org
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        mark.rutland@arm.com, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Georgi Djakov <georgi.djakov@linaro.org>
Subject: [PATCH] dt-bindings: interconnect: Convert qcom,qcs404 to DT schema
Date:   Wed, 30 Oct 2019 12:15:55 +0200
Message-Id: <20191030101555.10955-1-georgi.djakov@linaro.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Convert the qcom,qcs404 interconnect provider binding to DT schema.

Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
---
 .../bindings/interconnect/qcom,qcs404.txt     | 45 -----------
 .../bindings/interconnect/qcom,qcs404.yaml    | 77 +++++++++++++++++++
 2 files changed, 77 insertions(+), 45 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/interconnect/qcom,qcs404.txt
 create mode 100644 Documentation/devicetree/bindings/interconnect/qcom,qcs404.yaml

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,qcs404.txt b/Documentation/devicetree/bindings/interconnect/qcom,qcs404.txt
deleted file mode 100644
index c07d89812b73..000000000000
--- a/Documentation/devicetree/bindings/interconnect/qcom,qcs404.txt
+++ /dev/null
@@ -1,45 +0,0 @@
-Qualcomm QCS404 Network-On-Chip interconnect driver binding
------------------------------------------------------------
-
-Required properties :
-- compatible : shall contain only one of the following:
-			"qcom,qcs404-bimc"
-			"qcom,qcs404-pcnoc"
-			"qcom,qcs404-snoc"
-- #interconnect-cells : should contain 1
-
-reg : specifies the physical base address and size of registers
-clocks : list of phandles and specifiers to all interconnect bus clocks
-clock-names : clock names should include both "bus" and "bus_a"
-
-Example:
-
-soc {
-	...
-	bimc: interconnect@400000 {
-		reg = <0x00400000 0x80000>;
-		compatible = "qcom,qcs404-bimc";
-		#interconnect-cells = <1>;
-		clock-names = "bus", "bus_a";
-		clocks = <&rpmcc RPM_SMD_BIMC_CLK>,
-			<&rpmcc RPM_SMD_BIMC_A_CLK>;
-	};
-
-	pnoc: interconnect@500000 {
-		reg = <0x00500000 0x15080>;
-		compatible = "qcom,qcs404-pcnoc";
-		#interconnect-cells = <1>;
-		clock-names = "bus", "bus_a";
-		clocks = <&rpmcc RPM_SMD_PNOC_CLK>,
-			<&rpmcc RPM_SMD_PNOC_A_CLK>;
-	};
-
-	snoc: interconnect@580000 {
-		reg = <0x00580000 0x23080>;
-		compatible = "qcom,qcs404-snoc";
-		#interconnect-cells = <1>;
-		clock-names = "bus", "bus_a";
-		clocks = <&rpmcc RPM_SMD_SNOC_CLK>,
-			<&rpmcc RPM_SMD_SNOC_A_CLK>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/interconnect/qcom,qcs404.yaml b/Documentation/devicetree/bindings/interconnect/qcom,qcs404.yaml
new file mode 100644
index 000000000000..8d65c5f80679
--- /dev/null
+++ b/Documentation/devicetree/bindings/interconnect/qcom,qcs404.yaml
@@ -0,0 +1,77 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interconnect/qcom,qcs404.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm QCS404 Network-On-Chip interconnect
+
+maintainers:
+  - Georgi Djakov <georgi.djakov@linaro.org>
+
+description: |
+   The Qualcomm QCS404 interconnect providers support adjusting the
+   bandwidth requirements between the various NoC fabrics.
+
+properties:
+  reg:
+    maxItems: 1
+
+  compatible:
+    enum:
+      - qcom,qcs404-bimc
+      - qcom,qcs404-pcnoc
+      - qcom,qcs404-snoc
+
+  '#interconnect-cells':
+    const: 1
+
+  clock-names:
+    items:
+      - const: bus
+      - const: bus_a
+
+  clocks:
+    items:
+      - description: Bus Clock
+      - description: Bus A Clock
+
+required:
+  - compatible
+  - reg
+  - '#interconnect-cells'
+  - clock-names
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+      #include <dt-bindings/clock/qcom,rpmcc.h>
+
+      bimc: interconnect@400000 {
+              reg = <0x00400000 0x80000>;
+              compatible = "qcom,qcs404-bimc";
+              #interconnect-cells = <1>;
+              clock-names = "bus", "bus_a";
+              clocks = <&rpmcc RPM_SMD_BIMC_CLK>,
+                       <&rpmcc RPM_SMD_BIMC_A_CLK>;
+      };
+
+      pnoc: interconnect@500000 {
+             reg = <0x00500000 0x15080>;
+             compatible = "qcom,qcs404-pcnoc";
+             #interconnect-cells = <1>;
+             clock-names = "bus", "bus_a";
+             clocks = <&rpmcc RPM_SMD_PNOC_CLK>,
+                      <&rpmcc RPM_SMD_PNOC_A_CLK>;
+      };
+
+      snoc: interconnect@580000 {
+            reg = <0x00580000 0x23080>;
+            compatible = "qcom,qcs404-snoc";
+            #interconnect-cells = <1>;
+            clock-names = "bus", "bus_a";
+            clocks = <&rpmcc RPM_SMD_SNOC_CLK>,
+                     <&rpmcc RPM_SMD_SNOC_A_CLK>;
+      };
