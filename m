Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 372B51CB71F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2020 20:27:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727122AbgEHS10 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 May 2020 14:27:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727789AbgEHS10 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 May 2020 14:27:26 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C069CC05BD0A
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2020 11:27:24 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id 207so1237107pgc.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2020 11:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=FPmqoCXX36w4GNczlcEbzhCF5NhaIu3IfGEPKdSsIJg=;
        b=tEdh6teJdWxWwOZfwMnhMq2HWT1f4CEEU7n1RmhTwKCkHufLGPaswfGUAEV8ZpCWoo
         i0l7+VESYpg9DDsy24alcVpRwIIm64YZB/hu8vxML8DO1Uw3l33usrtChwu5VblA4JTR
         RKH33A/BAgobJ0PkLNflputiPlQzJvcUCY6U1C0U5rlJpwgHntmZzpl/+ysRAaZIgEqb
         7WzxLaAmjjKS1EPQaB5gR6Ek3tjVG5zALcfG77gELS5dqIhkzPmEAxUXqaK1T6PiiBXB
         EXUHs+a6NYAEZ/bzFuaPrpj8x2n5nrR4JQPNWJ/8F+amqVCpliEkWOTr+YTnTpC7jADk
         cqXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=FPmqoCXX36w4GNczlcEbzhCF5NhaIu3IfGEPKdSsIJg=;
        b=bzEdae4ID1nRlIrsjf7Wc3HTI0ZS7wkSZt+rpRtoXX2Ln6IYHuJcGB8r9W3xl5sssQ
         yALMPDOBMKdaFxFM6YA8gsHWLZjzdbY/L7Q5acqSVjS6M2LHy5bgeXT5umsSenIaT3ol
         A9iv+ZIUyDtbndC6Bc6/YAWrOnDx0t0z5D/wkyCLsIngkad52WxYK5u5w77qNmcozqHb
         ZsGL3RvaplPulyMktmyJlO03CKL8BOZh3RRyXOr/iNj0vhanam/caQSFxLOd+QIXou6h
         n2+Qvb+Jh23SsLg2bAJksM1RjoV5brAJ30/9xkHtoGQjKBquoBiX1jbZtWNmsUFn5ZrA
         CeSg==
X-Gm-Message-State: AGi0PuZ8zVwrH7NwR4Tsi4t5yJHUe+Zhon+/FoNYm7xoFsJxGCEA+oAp
        WCVBI1+RngHp46J37gIzt8AZ
X-Google-Smtp-Source: APiQypLpzEWwMMWWU3xte7NCk2pv5KpSKutlVWaAaQKWZaM8bP9nRqaJOgWFk1Z9X3nSnQFP6pj2lg==
X-Received: by 2002:a63:a1b:: with SMTP id 27mr3231310pgk.423.1588962444103;
        Fri, 08 May 2020 11:27:24 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:9e:e39a:a052:f8c0:a37b:3255])
        by smtp.gmail.com with ESMTPSA id y24sm2248379pfn.211.2020.05.08.11.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2020 11:27:23 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     jassisinghbrar@gmail.com, robh+dt@kernel.org
Cc:     bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 1/3] dt-bindings: mailbox: Add devicetree binding for Qcom IPCC
Date:   Fri,  8 May 2020 23:57:01 +0530
Message-Id: <20200508182703.29021-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200508182703.29021-1-manivannan.sadhasivam@linaro.org>
References: <20200508182703.29021-1-manivannan.sadhasivam@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add devicetree YAML binding for Qualcomm Inter-Processor Communication
Controller (IPCC) block.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 .../bindings/mailbox/qcom-ipcc.yaml           | 77 +++++++++++++++++++
 include/dt-bindings/mailbox/qcom-ipcc.h       | 33 ++++++++
 2 files changed, 110 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
 create mode 100644 include/dt-bindings/mailbox/qcom-ipcc.h

diff --git a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
new file mode 100644
index 000000000000..62e7bc8ceb0b
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
@@ -0,0 +1,77 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mailbox/qcom-ipcc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies, Inc. Inter-Processor Communication Controller
+
+maintainers:
+  - Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+
+description:
+  The Inter-Processor Communication Controller (IPCC) is a centralized hardware
+  to route interrupts across various subsystems. It involves a three-level
+  addressing scheme called protocol, client and signal. For example, consider an
+  entity on the Application Processor Subsystem (APSS) that wants to listen to
+  Modem's interrupts via Shared Memory Point to Point (SMP2P) interface. In such
+  a case, the client would be Modem (client-id is 2) and the signal would be
+  SMP2P (signal-id is 2). The SMP2P itself falls under the Multiprocessor (MPROC)
+  protocol (protocol-id is 0). Refer include/dt-bindings/mailbox/qcom-ipcc.h
+  for the list of such IDs.
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
+        #include <dt-bindings/mailbox/qcom-ipcc.h>
+
+        mailbox: qcom,ipcc@408000 {
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
diff --git a/include/dt-bindings/mailbox/qcom-ipcc.h b/include/dt-bindings/mailbox/qcom-ipcc.h
new file mode 100644
index 000000000000..b8c04f6df57c
--- /dev/null
+++ b/include/dt-bindings/mailbox/qcom-ipcc.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2018-2020, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef __DT_BINDINGS_MAILBOX_IPCC_H
+#define __DT_BINDINGS_MAILBOX_IPCC_H
+
+/* Signal IDs for MPROC protocol */
+#define IPCC_MPROC_SIGNAL_GLINK_QMP	0
+#define IPCC_MPROC_SIGNAL_SMP2P		2
+#define IPCC_MPROC_SIGNAL_PING		3
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
+
+#endif
-- 
2.17.1

