Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B45944BF6A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Nov 2021 12:00:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231495AbhKJLCp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Nov 2021 06:02:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231487AbhKJLCo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Nov 2021 06:02:44 -0500
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E02D1C06127A
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Nov 2021 02:59:56 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id b13so2723057plg.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Nov 2021 02:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DQqprj5LG6fM+PnCA7QJB2prIZNlY3Ax3gSE2z4dNwU=;
        b=eiu8AHmDAI97fZsoLR9/XsptFE0RJMPgDGXqW69j/pRQPpdajZlgHb/KZdKu4IWngq
         63P0LtdCoTudc7xlCgWF+79CFFiPIJCxMXgOzkfi4boYeQfAgKqNhegPyZSu4xelYIeP
         RC9dXW6iStMXhu1VkyJxDBH7nc2YVCg5UGnSvF7rzpMY2FTDzo/bYTT2Eufynx2QB8EX
         wEv1+084riEg50HJuhp2AZaFJlyYsZjDIFUHLsnpWAWYGHB19c1IOIw4iAdGTca2CZrb
         6bv/BoV1B5h4zqD9/hCuHRiSSzrwI3DXltBD+Xwz6vK8yzBEWEst4fiI6ZKTN5Vj+C2J
         mizg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DQqprj5LG6fM+PnCA7QJB2prIZNlY3Ax3gSE2z4dNwU=;
        b=rO0tohDIilCMsyUvgVyzNiTiH26nC2nNbXAcJBdR3I7tnhvhuLZj+4OR/ya26xgu8f
         6yALGI7fOvkUfIzTD5r9sBI4Ro1unFs2JYBKzlOhWnJrDCTlo6rTV0SSlP/meBPLSiyh
         60IJ718kZFhr2Kdi6ZD3ZumCOC2Cx5+ju2SvgTsopwfyrksmPKE006CAfAweR7hX02iR
         TPY9ehBmcOEuM3jjtxVV9mwqvEKM+kmlZ2m9XUNct/nOJwBXnqyeSdXX0JW64pjwbDbC
         YLvm5QC7MN/2I+EfNHGDcCevbw33DKlFwoTkn5kuavg13sr9/YQaKbW/CEYOarnZyRfW
         WuNA==
X-Gm-Message-State: AOAM5314+ZTl5gthWux0Ts9tSgDHglaFX66VBltsg14ga+fCmaASRpVl
        QVBqI/47iuRSlZaw4N2QufRAuapmFXM6vA==
X-Google-Smtp-Source: ABdhPJzBJKPodrTJGYontibHgSmatnRgOIH2MHmjmMSV1tKT33Qkk2cM7Atp/dLq5tLJrVfoRPFVKg==
X-Received: by 2002:a17:90b:4f85:: with SMTP id qe5mr15629740pjb.167.1636541996221;
        Wed, 10 Nov 2021 02:59:56 -0800 (PST)
Received: from localhost.name ([122.161.52.143])
        by smtp.gmail.com with ESMTPSA id e11sm5585282pjl.20.2021.11.10.02.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 02:59:55 -0800 (PST)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, agross@kernel.org, herbert@gondor.apana.org.au,
        davem@davemloft.net, stephan@gerhold.net,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v5 03/22] dt-bindings: qcom-bam: Convert binding to YAML
Date:   Wed, 10 Nov 2021 16:29:03 +0530
Message-Id: <20211110105922.217895-4-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211110105922.217895-1-bhupesh.sharma@linaro.org>
References: <20211110105922.217895-1-bhupesh.sharma@linaro.org>
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
 .../devicetree/bindings/dma/qcom_bam_dma.txt  | 50 ----------
 .../devicetree/bindings/dma/qcom_bam_dma.yaml | 91 +++++++++++++++++++
 2 files changed, 91 insertions(+), 50 deletions(-)
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
index 000000000000..3ca222bd10bd
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/qcom_bam_dma.yaml
@@ -0,0 +1,91 @@
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
+      - qcom,bam-v1.3.0 # for APQ8064, IPQ8064 and MSM8960
+      - qcom,bam-v1.4.0 # for MSM8974, APQ8074 and APQ8084
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
+    description:
+      Indicates supported number of DMA channels in a remotely controlled bam.
+
+  "#dma-cells":
+    const: 1
+    description: The single cell represents the channel index.
+
+  qcom,ee:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 7
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

