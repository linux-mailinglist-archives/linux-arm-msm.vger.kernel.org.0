Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C4DA42BE0F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Oct 2021 12:56:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231533AbhJMK6c (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Oct 2021 06:58:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232851AbhJMK6T (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Oct 2021 06:58:19 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC5F7C061753
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Oct 2021 03:56:15 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id om14so1881012pjb.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Oct 2021 03:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=B378ZdVVtjD4xYBqAMBHoetTzP75Wth9+eLC8a1D4q8=;
        b=Y9uMELLDjzHAqYLrSPszp0KriFvDliJZS38cdn1i/uZmUMvfcEhgnTxfK6dRDQKmB1
         ffC3BCC0nePccJLA63Oe9QPY605rpe8z19o/BWHQTgfMYzFEn3LAIVqNvXIxxxKNjkAH
         AnlpJoiqjK2qbxWzhlPSmyoA5xtwDv75hy4gEUhn1YgAOxBinzXt/BcJdDCEfN+mRX9H
         EzsW/tgDlZ3onrRMeJ7KVoFAqEWHA1efGs9CYO/yoSMVshNms5A0+I6QwaVTGAxiV6BJ
         yzEiyJjkh9guJBWhglCX3xmOcOKhFCj9/8ipViZHeiExgLmFcm9PZMVPz0EUAodbS70Y
         X2pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=B378ZdVVtjD4xYBqAMBHoetTzP75Wth9+eLC8a1D4q8=;
        b=3K3btHnEVNnP0bmXeqhfdwg0RePe+ZCHTmq4zbvCum3I7dHlgyx8wemB9nBVafpxuw
         819BSDnGw1NGW898lDhrJAdCaYivrWL0xh8SlUAK1ILwtCJ8+nlpO2dPL2qithqmGjtZ
         Malc96pQV3LA329vAK2TLkjYH3z8QkKEIk+fDT1eFNJekR0nq/HKzXNMgim6pPIghpVj
         X7GMK7IaPx1QdVY4AzN8oBnYZX+z87AWN5Zi0OI2h6HfVBJMxoFQoThbpgrBCdQA5QOD
         lG8wZMlV8kezQrLwukYTxUjbq4IMMWpAgbYwJ/vvRUEfJBX7ZnHBu/LZTcPTW+Tn8Rgc
         sUEg==
X-Gm-Message-State: AOAM531PmPjI304tD/qBCQ7Ed8ngEkN76fkBHH1PNp7+N2J43TcXcbr7
        xJ0nXvxLnIbrozk9gfPCLASUBcV+FCndpA==
X-Google-Smtp-Source: ABdhPJwKFYRHSWkB4YIFoNRT/vuVna5d+mOQWaMtuHWzoDzQJ0YOzK8zOS1uz9pL45KN1OPkT7mtQA==
X-Received: by 2002:a17:90b:3581:: with SMTP id mm1mr12516617pjb.93.1634122575175;
        Wed, 13 Oct 2021 03:56:15 -0700 (PDT)
Received: from localhost.name ([122.161.48.68])
        by smtp.gmail.com with ESMTPSA id b13sm6155351pjl.15.2021.10.13.03.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Oct 2021 03:56:14 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, agross@kernel.org, herbert@gondor.apana.org.au,
        davem@davemloft.net, Thara Gopinath <thara.gopinath@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v4 04/20] dt-bindings: qcom-bam: Convert binding to YAML
Date:   Wed, 13 Oct 2021 16:25:25 +0530
Message-Id: <20211013105541.68045-5-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211013105541.68045-1-bhupesh.sharma@linaro.org>
References: <20211013105541.68045-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Convert Qualcomm BAM DMA devicetree binding to YAML.

Cc: Thara Gopinath <thara.gopinath@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 .../devicetree/bindings/dma/qcom_bam_dma.txt  | 50 -----------
 .../devicetree/bindings/dma/qcom_bam_dma.yaml | 89 +++++++++++++++++++
 2 files changed, 89 insertions(+), 50 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/dma/qcom_bam_dma.txt
 create mode 100644 Documentation/devicetree/bindings/dma/qcom_bam_dma.yaml

diff --git a/Documentation/devicetree/bindings/dma/qcom_bam_dma.txt b/Documentation/devicetree/bindings/dma/qcom_bam_dma.txt
deleted file mode 100644
index cf5b9e44432c..000000000000
--- a/Documentation/devicetree/bindings/dma/qcom_bam_dma.txt
+++ /dev/null
@@ -1,50 +0,0 @@
-QCOM BAM DMA controller
-
-Required properties:
-- compatible: must be one of the following:
- * "qcom,bam-v1.4.0" for MSM8974, APQ8074 and APQ8084
- * "qcom,bam-v1.3.0" for APQ8064, IPQ8064 and MSM8960
- * "qcom,bam-v1.7.0" for MSM8916
-- reg: Address range for DMA registers
-- interrupts: Should contain the one interrupt shared by all channels
-- #dma-cells: must be <1>, the cell in the dmas property of the client device
-  represents the channel number
-- clocks: required clock
-- clock-names: must contain "bam_clk" entry
-- qcom,ee : indicates the active Execution Environment identifier (0-7) used in
-  the secure world.
-- qcom,controlled-remotely : optional, indicates that the bam is controlled by
-  remote proccessor i.e. execution environment.
-- num-channels : optional, indicates supported number of DMA channels in a
-  remotely controlled bam.
-- qcom,num-ees : optional, indicates supported number of Execution Environments
-  in a remotely controlled bam.
-
-Example:
-
-	uart-bam: dma@f9984000 = {
-		compatible = "qcom,bam-v1.4.0";
-		reg = <0xf9984000 0x15000>;
-		interrupts = <0 94 0>;
-		clocks = <&gcc GCC_BAM_DMA_AHB_CLK>;
-		clock-names = "bam_clk";
-		#dma-cells = <1>;
-		qcom,ee = <0>;
-	};
-
-DMA clients must use the format described in the dma.txt file, using a two cell
-specifier for each channel.
-
-Example:
-	serial@f991e000 {
-		compatible = "qcom,msm-uart";
-		reg = <0xf991e000 0x1000>
-			<0xf9944000 0x19000>;
-		interrupts = <0 108 0>;
-		clocks = <&gcc GCC_BLSP1_UART2_APPS_CLK>,
-			<&gcc GCC_BLSP1_AHB_CLK>;
-		clock-names = "core", "iface";
-
-		dmas = <&uart-bam 0>, <&uart-bam 1>;
-		dma-names = "rx", "tx";
-	};
diff --git a/Documentation/devicetree/bindings/dma/qcom_bam_dma.yaml b/Documentation/devicetree/bindings/dma/qcom_bam_dma.yaml
new file mode 100644
index 000000000000..32b47e3b7769
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/qcom_bam_dma.yaml
@@ -0,0 +1,89 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/dma/qcom_bam_dma.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: QCOM BAM DMA controller binding
+
+maintainers:
+  - Bhupesh Sharma <bhupesh.sharma@linaro.org>
+
+description: |
+  This document defines the binding for the BAM DMA controller
+  found on Qualcomm parts.
+
+allOf:
+  - $ref: "dma-controller.yaml#"
+
+properties:
+  compatible:
+    enum:
+      - qcom,bam-v1.4.0 # for MSM8974, APQ8074 and APQ8084
+      - qcom,bam-v1.3.0 # for APQ8064, IPQ8064 and MSM8960
+      - qcom,bam-v1.7.0 # for MSM8916
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: bam_clk
+
+  interrupts:
+    minItems: 1
+    maxItems: 31
+
+  num-channels:
+    maximum: 31
+    description: |
+      Indicates supported number of DMA channels in a remotely controlled bam.
+
+  "#dma-cells":
+    const: 1
+    description: The single cell represents the channel index.
+
+  qcom,ee:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Indicates the active Execution Environment identifier (0-7)
+      used in the secure world.
+
+  qcom,controlled-remotely:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      Indicates that the bam is controlled by remote proccessor i.e.
+      execution environment.
+
+  qcom,num-ees:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 31
+    default: 2
+    description:
+      Indicates supported number of Execution Environments in a
+      remotely controlled bam.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - "#dma-cells"
+  - qcom,ee
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-msm8974.h>
+    dma-controller@f9984000 {
+        compatible = "qcom,bam-v1.4.0";
+        reg = <0xf9984000 0x15000>;
+        interrupts = <0 94 0>;
+        clocks = <&gcc GCC_BAM_DMA_AHB_CLK>;
+        clock-names = "bam_clk";
+        #dma-cells = <1>;
+        qcom,ee = <0>;
+    };
-- 
2.31.1

