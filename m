Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 602D338913F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 May 2021 16:38:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354247AbhESOj3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 May 2021 10:39:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354325AbhESOjN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 May 2021 10:39:13 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD693C06138F
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 May 2021 07:37:51 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id b13-20020a17090a8c8db029015cd97baea9so3631561pjo.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 May 2021 07:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZOrjrBtPIyQIufzW+o4HH7ug0OM7ZtmcrQX7KbEW7to=;
        b=M545Dwsqv22D3WQyGr7vMn1jPt0IkVoocNJtCm5AcFzfF3vxsG5NQvHUcVSEWo5mtM
         rtY1srUqjp/4Snb5qn/0zVgceDUZcRJlM8caKj8cfd5vAsNdMAX2VEENGxo68qfvmVq5
         CJou73dz7fd1tjvcRKUxHV7jdWDnDup0C+8E6T/6vIqibeoGA1xwopcHKMxKDACQYPvN
         2fjl03bmmIg3GyfiYGlFCZs/x6v+ht/p7nvolKWB/GD0ldT3jhfWHMDqL1b+PT8UFViR
         q5IbrCaQKKmCJ4doz7QJDtiKVmDUI+ZhX2B4MIBqOvqZd18C2yVlMcL32bkluJDFgdUO
         P5kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZOrjrBtPIyQIufzW+o4HH7ug0OM7ZtmcrQX7KbEW7to=;
        b=n4qcjhkKOb+Cz2gcGAN6mOGKpc+eh0lrwQ3QhQw5PnKLyg0evHGkO27IEOSjJBj1zH
         LjmDDfKA3vNLlXYEi3++B2BNO9u2dWiMx/v4zR/M0t5homL3ImYrQl6Bzq5gR27LtfYu
         lq6U6QFVL89YAG/0ZpS/wKVd5jutwLzOn34Dx0zP/PD9/2dgOJahXtG6GIUhq43HtLQt
         izPyXMAT3ArB39SfxfoUuToKD5LUYOm5YPt/SXSxfEhleUdMMUBBJSKuLqEUXz0R9S87
         aSz9t2NqBHN7qFC89WqF1I/2TlVoHlx7t9dM4tz8sWNOQexbbhgSa6mH6iOXAVOnw6eG
         7L8w==
X-Gm-Message-State: AOAM530KF7yI/dtERk10XNvBg4mhOfbl3dKS6ZkR3uArY8t9/jNTCSLJ
        OGfCxacnbFYwzasPKecfCXXI9tY6Oj66dg==
X-Google-Smtp-Source: ABdhPJxmr+u2rkVp4m2hiqRLQaNgGpYGBaraMC0xioEZ1piRcVrBG+8u0r5P9Vx2Cl3l49L/iitVlQ==
X-Received: by 2002:a17:90b:4812:: with SMTP id kn18mr11859732pjb.188.1621435071241;
        Wed, 19 May 2021 07:37:51 -0700 (PDT)
Received: from localhost.localdomain.name ([122.177.135.250])
        by smtp.gmail.com with ESMTPSA id o24sm9239515pgl.55.2021.05.19.07.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 May 2021 07:37:50 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        bhupesh.linux@gmail.com
Subject: [PATCH v3 04/17] dt-bindings: qcom-qce: Convert bindings to yaml
Date:   Wed, 19 May 2021 20:06:47 +0530
Message-Id: <20210519143700.27392-5-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210519143700.27392-1-bhupesh.sharma@linaro.org>
References: <20210519143700.27392-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Convert Qualcomm QCE crypto devicetree binding to YAML.

Cc: Thara Gopinath <thara.gopinath@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Andy Gross <agross@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>
Cc: David S. Miller <davem@davemloft.net>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: dmaengine@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: linux-crypto@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: bhupesh.linux@gmail.com
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 .../devicetree/bindings/crypto/qcom-qce.txt   | 25 -------
 .../devicetree/bindings/crypto/qcom-qce.yaml  | 69 +++++++++++++++++++
 2 files changed, 69 insertions(+), 25 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/crypto/qcom-qce.txt
 create mode 100644 Documentation/devicetree/bindings/crypto/qcom-qce.yaml

diff --git a/Documentation/devicetree/bindings/crypto/qcom-qce.txt b/Documentation/devicetree/bindings/crypto/qcom-qce.txt
deleted file mode 100644
index fdd53b184ba8..000000000000
--- a/Documentation/devicetree/bindings/crypto/qcom-qce.txt
+++ /dev/null
@@ -1,25 +0,0 @@
-Qualcomm crypto engine driver
-
-Required properties:
-
-- compatible  : should be "qcom,crypto-v5.1"
-- reg         : specifies base physical address and size of the registers map
-- clocks      : phandle to clock-controller plus clock-specifier pair
-- clock-names : "iface" clocks register interface
-                "bus" clocks data transfer interface
-                "core" clocks rest of the crypto block
-- dmas        : DMA specifiers for tx and rx dma channels. For more see
-                Documentation/devicetree/bindings/dma/dma.txt
-- dma-names   : DMA request names should be "rx" and "tx"
-
-Example:
-	crypto@fd45a000 {
-		compatible = "qcom,crypto-v5.1";
-		reg = <0xfd45a000 0x6000>;
-		clocks = <&gcc GCC_CE2_AHB_CLK>,
-			 <&gcc GCC_CE2_AXI_CLK>,
-			 <&gcc GCC_CE2_CLK>;
-		clock-names = "iface", "bus", "core";
-		dmas = <&cryptobam 2>, <&cryptobam 3>;
-		dma-names = "rx", "tx";
-	};
diff --git a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
new file mode 100644
index 000000000000..a691cd08f372
--- /dev/null
+++ b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/crypto/qcom-qce.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm crypto engine driver
+
+maintainers:
+  - Bhupesh Sharma <bhupesh.sharma@linaro.org>
+
+description: |
+  This document defines the binding for the QCE crypto
+  controller found on Qualcomm parts.
+
+properties:
+  compatible:
+    const: qcom,crypto-v5.1
+
+  reg:
+    maxItems: 1
+    description: |
+      Specifies base physical address and size of the registers map.
+
+  clocks:
+    items:
+      - description: iface clocks register interface.
+      - description: bus clocks data transfer interface.
+      - description: core clocks rest of the crypto block.
+
+  clock-names:
+    items:
+      - const: iface
+      - const: bus
+      - const: core
+
+  dmas:
+    items:
+      - description: DMA specifiers for tx dma channel.
+      - description: DMA specifiers for rx dma channel.
+
+  dma-names:
+    items:
+      - const: rx
+      - const: tx
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - dmas
+  - dma-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-apq8084.h>
+    crypto-engine@fd45a000 {
+        compatible = "qcom,crypto-v5.1";
+        reg = <0xfd45a000 0x6000>;
+        clocks = <&gcc GCC_CE2_AHB_CLK>,
+                 <&gcc GCC_CE2_AXI_CLK>,
+                 <&gcc GCC_CE2_CLK>;
+        clock-names = "iface", "bus", "core";
+        dmas = <&cryptobam 2>, <&cryptobam 3>;
+        dma-names = "rx", "tx";
+    };
-- 
2.31.1

