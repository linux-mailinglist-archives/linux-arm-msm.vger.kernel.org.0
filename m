Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72A0C1EB93B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2020 12:13:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728289AbgFBKKa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Jun 2020 06:10:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727032AbgFBKJq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Jun 2020 06:09:46 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80C7DC08C5C1
        for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jun 2020 03:09:46 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id x207so2947086pfc.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2020 03:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vautb822ZfqbgT9H1qhF7C4M74PWhQzgpsc/iQMPhyE=;
        b=MGUa5+DQjvlhtfr049c1/fZTWBfJSEvMFonHlxrFq/sQnDeuGeJcc19rbD1i2IUYFW
         wLdRgfi5usAEHgvKX+OpQiU8rU7Wukf4IBm7E1vRavICIGExstq2YzYucy2VItWJKOa+
         jeZPXSqL+224vtF1Uhg376HaG0Q77QkIazFNHY1K5ndrpRfNcOAE+wcbJszpvM3VA8b3
         yt4sy+m/l7mzThlR4/45Oxmf0iIzi3ZG4xs6tKIq/66HY8NrivhPSydQrhMaMdnSVgd5
         DZGaTpACkz+3blFLW4phCxLZByRK4jdSNCSvI1owaTzER2JWfPUn1eKbji0Gt/bMBP+7
         ZaGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vautb822ZfqbgT9H1qhF7C4M74PWhQzgpsc/iQMPhyE=;
        b=Sjvv3mIxILvjxRXCczHoGsj/repwBLhNhnpsM6CSCe6kaAsuj2iM086NQ3sDuzSGLn
         erWYrvL+lcwSToirKy+YqLm7VHfdjn4Jq3r44jyF3WoJ40JVPVlsxGPH+mt2+WT6zIsr
         aQwzNhwg8I2Kx4RmsJZkynuIOS9dtN4znL4VsX9qR7sa8fnbNNIjfV8rCwO6gRW3H7Ww
         06y7ZG1Z5aP9JbV0A02Uguix5+SOuBz3zMhr79V/GE1eclD4/EdzFKBwVE3pJMvanPBa
         cXdf9zNKOArfUOCwi2UtFn4+M7aGbaL4apPOiXY+DULgeTfv64UxJa+LUp64zFBSPMBu
         wGlw==
X-Gm-Message-State: AOAM5332o+hNb2uqQ2Lr3iKSkazSs58P96tv+ARHgf6do+MtMDfSYpzM
        bOMp2a8CwAMq35wh6O448pNbmg==
X-Google-Smtp-Source: ABdhPJyvrxxge7r1kiYD3PJFB7Ec7P66SkuqUcn7jCBYLTysyG8pMddjI4b3PuPNg2NaNhrHragmnw==
X-Received: by 2002:a62:9242:: with SMTP id o63mr24360759pfd.310.1591092585950;
        Tue, 02 Jun 2020 03:09:45 -0700 (PDT)
Received: from nagraj.local ([49.206.21.239])
        by smtp.gmail.com with ESMTPSA id d8sm1931276pgb.42.2020.06.02.03.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2020 03:09:45 -0700 (PDT)
From:   Sumit Semwal <sumit.semwal@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org
Cc:     nishakumari@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        kgunda@codeaurora.org, rnayak@codeaurora.org,
        Sumit Semwal <sumit.semwal@linaro.org>
Subject: [PATCH v4 2/5] dt-bindings: regulator: Add labibb regulator
Date:   Tue,  2 Jun 2020 15:39:21 +0530
Message-Id: <20200602100924.26256-3-sumit.semwal@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200602100924.26256-1-sumit.semwal@linaro.org>
References: <20200602100924.26256-1-sumit.semwal@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Nisha Kumari <nishakumari@codeaurora.org>

Adding the devicetree binding for labibb regulator.

Signed-off-by: Nisha Kumari <nishakumari@codeaurora.org>
Signed-off-by: Sumit Semwal <sumit.semwal@linaro.org>
 [sumits: cleanup as per review comments and update to yaml]
--
v2: updated for better compatible string and names.
v3: moved to yaml
v4: fixed dt_binding_check issues
---
 .../regulator/qcom-labibb-regulator.yaml      | 79 +++++++++++++++++++
 1 file changed, 79 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.yaml

diff --git a/Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.yaml
new file mode 100644
index 000000000000..178820ec04c7
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/qcom-labibb-regulator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm's LAB(LCD AMOLED Boost)/IBB(Inverting Buck Boost) Regulator
+
+maintainers:
+  - Sumit Semwal <sumit.semwal@linaro.org>
+
+description:
+  LAB can be used as a positive boost power supply and IBB can be used as a
+  negative boost power supply for display panels. Currently implemented for
+  pmi8998.
+
+allOf:
+  - $ref: "regulator.yaml#"
+
+properties:
+  compatible:
+    const: qcom,pmi8998-lab-ibb
+
+  lab:
+    type: object
+
+    properties:
+
+      interrupts:
+        maxItems: 1
+        description:
+          Short-circuit interrupt for lab.
+
+      interrupt-names:
+        const: sc-err
+
+    required:
+    - interrupts
+    - interrupt-names
+
+  ibb:
+    type: object
+
+    properties:
+
+      interrupts:
+        maxItems: 1
+        description:
+          Short-circuit interrupt for lab.
+
+      interrupt-names:
+        const: sc-err
+
+    required:
+    - interrupts
+    - interrupt-names
+
+required:
+  - compatible
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    labibb {
+      compatible = "qcom,pmi8998-lab-ibb";
+
+      lab {
+        interrupts = <0x3 0x0 IRQ_TYPE_EDGE_RISING>;
+        interrupt-names = "sc-err";
+      };
+
+      ibb {
+        interrupts = <0x3 0x2 IRQ_TYPE_EDGE_RISING>;
+        interrupt-names = "sc-err";
+      };
+    };
+
+...
-- 
2.26.2

