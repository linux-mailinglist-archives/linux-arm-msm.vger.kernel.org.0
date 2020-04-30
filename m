Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46ACF1BF051
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2020 08:31:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726476AbgD3GbI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Apr 2020 02:31:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726337AbgD3GbI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Apr 2020 02:31:08 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA804C035495
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2020 23:31:06 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id 7so3261708pjo.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2020 23:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=dZjd4h4yhOmM5NOjj2GXWk2elbRPKbCxZOjy1xnvEzo=;
        b=qF6hgZB25hqGbunddGpblJXgTIHuFfM9NxEQn81J9IPRWk00tmRcTXY0+aln/v4O+s
         FZI4zbQ7bikN8NJ/Npci5wGRKHhEUEPMfGkBeekJ5hTAwZg5UzZkzDiJiFSbu5uKH+M/
         RUH67CYO+lGeOO/fIcxrmIru4NBM+XBOdGJlxj9cGkG0+DyUUNA7/eZxPZSjOT+wnGjZ
         xzuNlMtRiRH5YC3sMtadq5UEslN9/MGgFPG1hQJ+kzVZsaS4oYBkjmDWyVNMCCEw+r2Y
         tc5SO0khPU7cvI0Pxh8jXCECKvhPMQzvydWigKezRvaMq1YDvGV0Rv/LsOXRJ4vyYSN3
         9lBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=dZjd4h4yhOmM5NOjj2GXWk2elbRPKbCxZOjy1xnvEzo=;
        b=Hp5MCTDRF64I3xoBZq9kKWYHMMvcnvpclANAG+rJb35vI80JK88e6h2nQsbqq7LBUU
         GbOR+kqTDbrEMI7imz7odtDJp5rXSJCXpJ0r0/a01xcwQSiEpetOW3g57+d9/p+evpmK
         bQs8I+ZjkSNTBkoImnddPO01v3v58KYfoDSgA7sdxxf4py0iS+D/Dud1Gy5fLx00VNye
         55T+75kHuBTAWACMXoanRaGyi6ghh+Sj2ZDeozojQ2cKLqTnMHjLlKS3FdL1EDiclUJ5
         l/cGwo+TL0y0BWyQKhxnTpND87NGdPjQgLMBRsIRRKj9VCIsymjyVnq5bkHpmxMOliFb
         uaXw==
X-Gm-Message-State: AGi0PuZ9AzpFHi3bTdVxQXtvLLYDY2rH3SU5ZA30UtP3EBWo9i+s9ds/
        +pMrrh1s2TiPLx0+jLFBMoEZ
X-Google-Smtp-Source: APiQypJ8J196J+2qmCZmnvhVKQfJOcUcAxx630UMLybVqNinADyOQQJodGsfIyKPEx3LHw4fhcuR9Q==
X-Received: by 2002:a17:902:b945:: with SMTP id h5mr2241918pls.224.1588228265856;
        Wed, 29 Apr 2020 23:31:05 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:6081:946c:419e:a71:7237:1613])
        by smtp.gmail.com with ESMTPSA id m7sm2676772pfb.48.2020.04.29.23.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2020 23:31:05 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     jassisinghbrar@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 1/2] dt-bindings: soc: qcom: Add devicetree binding for Qcom IPCC
Date:   Thu, 30 Apr 2020 12:00:53 +0530
Message-Id: <20200430063054.18879-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add devicetree YAML binding for Qualcomm Inter-Processor Communication
Controller (IPCC) block.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 .../bindings/soc/qcom/qcom,ipcc.yaml          | 85 +++++++++++++++++++
 include/dt-bindings/soc/qcom,ipcc.h           | 38 +++++++++
 2 files changed, 123 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,ipcc.yaml
 create mode 100644 include/dt-bindings/soc/qcom,ipcc.h

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,ipcc.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,ipcc.yaml
new file mode 100644
index 000000000000..48b281181401
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,ipcc.yaml
@@ -0,0 +1,85 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/qcom/qcom,ipcc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies, Inc. Inter-Processor Communication Controller
+
+maintainers:
+  - Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+
+description:
+  The Inter-Processor Communication Controller (IPCC) is a centralized hardware
+  to route the interrupts across various subsystems. It involves a three-level
+  addressing scheme called protocol, client and signal. For example, consider an
+  entity on the Application Processor Subsystem (APSS) that wants to listen to
+  Modem's interrupts via Shared Memory Point to Point (SMP2P) interface. In such
+  a case, the client would be Modem (client-id is 2) and the signal would be
+  SMP2P (signal-id is 2). The SMP2P itself falls under the Multiprocessor (MPROC)
+  protocol (protocol-id is 0). Refer include/dt-bindings/soc/qcom/qcom,ipcc.h
+  for the list of such IDs.
+
+  One of the duties of this interrupt controller driver is to forward the
+  interrupts to the correct entities on the APSS. The children inheriting the
+  interrupt-controller would be mentioning the client-id and signal-id it's
+  interested in.
+
+  On the other hand, sending an interrupt to a subsystem is done through the
+  mailbox interface, which again requires client-id and signal-id.
+
+properties:
+  compatible:
+    const: "qcom,ipcc"
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 3
+    description:
+      The first cell is the client-id, the second cell is the signal-id and the
+      third cell is the interrupt type.
+
+  "#mbox-cells":
+    const: 2
+    description:
+      The first cell is the client-id, and the second cell is the signal-id.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-controller
+  - "#interrupt-cells"
+  - "#mbox-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+        #include <dt-bindings/interrupt-controller/arm-gic.h>
+        #include <dt-bindings/soc/qcom,ipcc.h>
+
+        ipcc_mproc: qcom,ipcc@408000 {
+                compatible = "qcom,ipcc";
+                reg = <0x408000 0x1000>;
+                interrupts = <GIC_SPI 229 IRQ_TYPE_LEVEL_HIGH>;
+                interrupt-controller;
+                #interrupt-cells = <3>;
+                #mbox-cells = <2>;
+        };
+
+        smp2p-modem {
+                compatible = "qcom,smp2p";
+                interrupts-extended = <&ipcc_mproc IPCC_CLIENT_MPSS
+                                IPCC_MPROC_SIGNAL_SMP2P IRQ_TYPE_EDGE_RISING>;
+                mboxes = <&ipcc_mproc IPCC_CLIENT_MPSS IPCC_MPROC_SIGNAL_SMP2P>;
+
+                /* Other SMP2P fields */
+        };
diff --git a/include/dt-bindings/soc/qcom,ipcc.h b/include/dt-bindings/soc/qcom,ipcc.h
new file mode 100644
index 000000000000..2926cdb4cb48
--- /dev/null
+++ b/include/dt-bindings/soc/qcom,ipcc.h
@@ -0,0 +1,38 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2018-2019, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef __DT_BINDINGS_QCOM_IPCC_H
+#define __DT_BINDINGS_QCOM_IPCC_H
+
+/* Signal IDs for MPROC protocol */
+#define IPCC_MPROC_SIGNAL_GLINK_QMP	0
+#define IPCC_MPROC_SIGNAL_SMP2P		2
+#define IPCC_MPROC_SIGNAL_PING		3
+#define IPCC_MPROC_SIGNAL_MAX		4 /* Used by driver only */
+
+#define IPCC_COMPUTE_L0_SIGNAL_MAX	32 /* Used by driver only */
+#define IPCC_COMPUTE_L1_SIGNAL_MAX	32 /* Used by driver only */
+
+/* Client IDs */
+#define IPCC_CLIENT_AOP			0
+#define IPCC_CLIENT_TZ			1
+#define IPCC_CLIENT_MPSS		2
+#define IPCC_CLIENT_LPASS		3
+#define IPCC_CLIENT_SLPI		4
+#define IPCC_CLIENT_SDC			5
+#define IPCC_CLIENT_CDSP		6
+#define IPCC_CLIENT_NPU			7
+#define IPCC_CLIENT_APSS		8
+#define IPCC_CLIENT_GPU			9
+#define IPCC_CLIENT_CVP			10
+#define IPCC_CLIENT_CAM			11
+#define IPCC_CLIENT_VPU			12
+#define IPCC_CLIENT_PCIE0		13
+#define IPCC_CLIENT_PCIE1		14
+#define IPCC_CLIENT_PCIE2		15
+#define IPCC_CLIENT_SPSS		16
+#define IPCC_CLIENT_MAX			17 /* Used by driver only */
+
+#endif
-- 
2.17.1

