Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D7631DADE9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2020 10:49:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726827AbgETItJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 May 2020 04:49:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726805AbgETItJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 May 2020 04:49:09 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34266C05BD43
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2020 01:49:09 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id k7so917979pjs.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2020 01:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=d5AjCUOK5C/NKP2sQDKv/MsqrelpSGqalm8Xcnpaauo=;
        b=Y0susyFhHLNV45TA02G25odGkgkumbqIHVgPdZmyF+Fq28Dn1hMdsxfmb0sHNhrGmv
         oKFtW8iQc4rgkDx79cWtiqcmuplZTOnUqQxGYpieqO2hD5993B2EfpUpU9rWn7iIpIpK
         ERcv64HkzMPwt/k2zs2UICW4AH3nTk+NwFu8Llw3orhzKT6zyEA/lLqT9EHToxTtvskB
         uEV5aM5uEYw6IA9qu81bHddQlmyersnzarXyDMEuB4ykzm36INc6FmXf6wW6IJ6+OqYJ
         MoVPxOvUaWMRHnUDpMiePkHnPi9UVG1Op9FlrBxyB00MzJUk9LoUj9jqd59fEn9u8iJY
         NZRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=d5AjCUOK5C/NKP2sQDKv/MsqrelpSGqalm8Xcnpaauo=;
        b=RQq0GZVaICRu6mSIW4OrJXmtttxG0DjAe6gv7FqiMK5Ri/6wg+YxpD6U5mFh4VDDoh
         h3GbHghFa3rC+UsAnxj1Z5FG5XvQ7RlCLzwQ6GC2CnBkXuScxzSlvmZVwchkdxvhl7Pk
         HITTjo5KluRaqG8/sI34sr5iXKtIGfSMCzA1FpuRhG9Hnx3OZ0wnJNNfGtTj2/mHxsz7
         8w76JmYMs6iJHkvOPwyOrNtG0N3vuUze8nscnosl3cjMh0/rOerbKcLozFt749iq3pev
         U6UVCrP3hJnRO+wZLr+hWrZ/HCAqgN12FC+/QkhKrsh/miVncxA5G/lDNXT1C/4SJfqa
         poNA==
X-Gm-Message-State: AOAM530YTe2gfHlFUqyUyvZhpy96ngFWo1NNDpO5oIujKt6lV6mriWAO
        83D63k3jW4fxDZjd1Bga3/8h
X-Google-Smtp-Source: ABdhPJz9kKWzD15RzkikcFrtmaZx5Ic6Hx1VlxXZ0TjqgjTZrh3e8YR8vYENwHtmYB5CBh0GdvVVzQ==
X-Received: by 2002:a17:902:ea8a:: with SMTP id x10mr3573442plb.255.1589964548543;
        Wed, 20 May 2020 01:49:08 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:91e:dd0a:7c30:1f7e:ebdb:aa2a])
        by smtp.gmail.com with ESMTPSA id a5sm1629332pfk.210.2020.05.20.01.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2020 01:49:07 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     jassisinghbrar@gmail.com, robh+dt@kernel.org
Cc:     bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 1/3] dt-bindings: mailbox: Add devicetree binding for Qcom IPCC
Date:   Wed, 20 May 2020 14:18:52 +0530
Message-Id: <20200520084854.19729-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.26.GIT
In-Reply-To: <20200520084854.19729-1-manivannan.sadhasivam@linaro.org>
References: <20200520084854.19729-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add devicetree YAML binding for Qualcomm Inter-Processor Communication
Controller (IPCC) block.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 .../bindings/mailbox/qcom-ipcc.yaml           | 80 +++++++++++++++++++
 include/dt-bindings/mailbox/qcom-ipcc.h       | 33 ++++++++
 2 files changed, 113 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
 create mode 100644 include/dt-bindings/mailbox/qcom-ipcc.h

diff --git a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
new file mode 100644
index 000000000000..4ac2123d9193
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
@@ -0,0 +1,80 @@
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
+    items:
+      - enum:
+        - qcom,sm8250-ipcc
+      - const: qcom,ipcc
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
+        mailbox@408000 {
+                compatible = "qcom,sm8250-ipcc", "qcom,ipcc";
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
index 000000000000..4c23eefed5f3
--- /dev/null
+++ b/include/dt-bindings/mailbox/qcom-ipcc.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause */
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
2.26.GIT

