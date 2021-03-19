Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3788E342325
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Mar 2021 18:25:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230064AbhCSRYy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Mar 2021 13:24:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230042AbhCSRY0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Mar 2021 13:24:26 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9BDEC06174A;
        Fri, 19 Mar 2021 10:24:25 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id f3so2811737lfu.5;
        Fri, 19 Mar 2021 10:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cL+h4242+fAnn2Fd8FCYC3itCgT/thmFyDVyUCfdUfk=;
        b=kmGxqO3Gx87BB+rMyJf2qNLGm1+AM/5DWLtXfUZTbRPmRtyDtU3L7B6pAPTnxRK2vo
         A9NKZR0WIQedahu1Q/EXPzjrz97u90MjZ/RljTbnqcY4701iKpiPtHYRMGBWW9XJHjkA
         4yhz/6gXJjeV19P20FsK/aiGWQRDUG0xVWeACoke85nBBj4bGmMDIFOj0T/9zt4A2eSL
         KUx4O0bSboQUuHT8E5brVHUO1Cm/VOBmL7aC/bJf73QVYVp34pBdp7EDi4Rgz/G0DHP+
         uMObS+FJ8IosY2CxliDQb6h4Li9q4d9eRCjOYqNE8G/pC4j3lfsvlB/I9OWff0dTWsI5
         QbRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cL+h4242+fAnn2Fd8FCYC3itCgT/thmFyDVyUCfdUfk=;
        b=qBu02m7EsN43igxCVNi1JwoRI8AMqVKjn4yikG3t6NzXa/TGywritGYHSuTtjneYY7
         OSD3Ctz4ONU070o6hrJzNvNB0bl1Up/6Q5kggdhJQflgcyfbr9KACa9Q9NpXN9fqldPK
         I7oRMfWkaN1hSCxECnEaYSrfFB64nsO9CtPPkhkQ5e1DzsGfjEg8wRTzuX+tCyPdoKrn
         B11ZBU044KJD8E/waKMAn48KePswKSbi1WEsZ2W6cewOPilQxL6XjxvmTneWcJ/g/FFv
         4BorpxhyLJ4hwz0Z3WdARI2nz2NFPGoiwGVGYunHWFx6l26pT/XaBm2q84JyPqhO2mUN
         x8bw==
X-Gm-Message-State: AOAM531bY49vq08t2V4KB04iRiVcjRtq4JPYPYggRJhG+p5l1Hd+wDa8
        YN9Ef/u8sfWgk7YR5AAHAbo=
X-Google-Smtp-Source: ABdhPJxv7FY4FHc2MxQ91ziuV6XeF47+WQSWEbHL8Ufvts7U/F2ejWevquiCOJO9xoyaKzqFsY4fQA==
X-Received: by 2002:ac2:5144:: with SMTP id q4mr1480854lfd.145.1616174663260;
        Fri, 19 Mar 2021 10:24:23 -0700 (PDT)
Received: from localhost.localdomain ([2a01:540:2421:e100:198e:5123:d77b:1e2e])
        by smtp.gmail.com with ESMTPSA id y17sm693237lfb.132.2021.03.19.10.24.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Mar 2021 10:24:22 -0700 (PDT)
From:   nikitos.tr@gmail.com
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nikita Travkin <nikitos.tr@gmail.com>
Subject: [PATCH 1/2] dt-bindings: soc: qcom: Add bindings for Qualcomm Memshare service
Date:   Fri, 19 Mar 2021 22:23:20 +0500
Message-Id: <20210319172321.22248-2-nikitos.tr@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210319172321.22248-1-nikitos.tr@gmail.com>
References: <20210319172321.22248-1-nikitos.tr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Nikita Travkin <nikitos.tr@gmail.com>

Add DT bindings for memshare: QMI service that allocates
memory per remote processor request.

Signed-off-by: Nikita Travkin <nikitos.tr@gmail.com>
---
 .../bindings/soc/qcom/qcom,memshare.yaml      | 109 ++++++++++++++++++
 include/dt-bindings/soc/qcom,memshare.h       |  10 ++
 2 files changed, 119 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,memshare.yaml
 create mode 100644 include/dt-bindings/soc/qcom,memshare.h

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,memshare.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,memshare.yaml
new file mode 100644
index 000000000000..ebdf128b066c
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,memshare.yaml
@@ -0,0 +1,109 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/soc/qcom/qcom,memshare.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Qualcomm QMI Shared Memory Service
+
+description: |
+  This driver provides a QMI service that allows remote processors (like modem)
+  to request additional memory. It is used for applications like GPS in modem.
+
+maintainers:
+  - Nikita Travkin <nikitos.tr@gmail.com>
+
+properties:
+  compatible:
+    const: qcom,memshare
+
+  qcom,legacy-client:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Phandle to a memshare client node used for legacy requests.
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^.*@[0-9]+$":
+    type: object
+
+    properties:
+      reg:
+        description: Proc-ID for clients in this node.
+
+      qcom,qrtr-node:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: Node from which the requests are expected.
+
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
+    patternProperties:
+      "^.*@[0-9]+$":
+        type: object
+
+        properties:
+          reg:
+            description: ID of this client.
+
+          memory-region:
+            $ref: /schemas/types.yaml#/definitions/phandle
+            description: |
+              Reserved memory region that should be used for allocation.
+
+        required:
+          - reg
+
+    required:
+      - reg
+      - qcom,qrtr-node
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/soc/qcom,memshare.h>
+
+    reserved-memory {
+
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      gps_mem: gps@93c00000 {
+        reg = <0x0 0x93c00000 0x0 0x200000>;
+        no-map;
+      };
+    };
+
+    memshare {
+      compatible = "qcom,memshare";
+      qcom,legacy-client = <&memshare_gps>;
+
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      mpss@0 {
+        reg = <MEMSHARE_PROC_MPSS_V01>;
+        qcom,qrtr-node = <0>;
+
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        memshare_gps: gps@0 {
+          reg = <0>;
+          memory-region = <&gps_mem>;
+        };
+      };
+    };
+
+...
diff --git a/include/dt-bindings/soc/qcom,memshare.h b/include/dt-bindings/soc/qcom,memshare.h
new file mode 100644
index 000000000000..4cef1ef75d09
--- /dev/null
+++ b/include/dt-bindings/soc/qcom,memshare.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __DT_QCOM_MEMSHARE_H__
+#define __DT_QCOM_MEMSHARE_H__
+
+#define MEMSHARE_PROC_MPSS_V01 0
+#define MEMSHARE_PROC_ADSP_V01 1
+#define MEMSHARE_PROC_WCNSS_V01 2
+
+#endif /* __DT_QCOM_MEMSHARE_H__ */
-- 
2.27.0

