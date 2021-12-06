Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 010CF469251
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Dec 2021 10:25:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240642AbhLFJ3X (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Dec 2021 04:29:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240634AbhLFJ3X (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Dec 2021 04:29:23 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BA66C0613F8
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Dec 2021 01:25:55 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id f18-20020a17090aa79200b001ad9cb23022so5617995pjq.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Dec 2021 01:25:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=RXntCnFaEu15rLId3/xepqIAwJ07mxfKidhEo2IC6sM=;
        b=EHbZ1+EA3spWtN6fTXJBbaXwv8zGGBAJfOtE2wXTUeIF3/A8c680pjmjOxa/LFmIsl
         IrtghjKTvO+nrpeuftwb+O+Q3DhfUIcRyVuBwU/mO2Ri6DqSiqYAqjeLGY04u4fUPlYN
         qOXysCuebLQu1dilNo/y3U+V8i5qwfqUJOpeyQMuajlFHVmZR/v+aecbi+VVWEutXQtw
         VOctsW+hxS4kzQcD0AO3vXcyfaqVENTk5J5ZT8hwz8t6h4e3Wl2EOCW+tOGNeRMJE4Ph
         Pj2aD2X9l01wx5BuwbGIhpbR9ZZYJHQZ1sRbTbq4r2DRxt0a2KdT4QE13G9YI++dS6gd
         RJ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=RXntCnFaEu15rLId3/xepqIAwJ07mxfKidhEo2IC6sM=;
        b=QJLIX36n61e1lhvTsT1Aq9Lxe5NoGNjtbSE5eiknitDSgdAFUwSNb1xioMIm+YwVBY
         j8VOpADuBwlrIaB56Dr9MwJayzl1H6lLOiUqS6rhlzTeeosm61jcfyzb03MLo5pqQ/nJ
         y2RwltQw0BNVXuPMkUV50ywsAkuEFDvGIfKuYnejJ83YsQdFcyjbBRCS9TEqNROJ4KsC
         UKHqvsNuL2FqAQvv0fJuv8PUyORPX/6qdA/rCx3ZniEhbG/TtLnDgn0505DxCRT1saDD
         MCsr8ncGVn0gQJ4M7sRJcjEJ70tLEhXOl3lSlokMq5khrn8P8Lpvhyx6t1rq3kob48Ki
         iWlw==
X-Gm-Message-State: AOAM532Cxeyg+RbclDiH7WeoX341J1NBpWJdMV6v71kp911HB+Db/knQ
        vrd78zrENRzh4CkvnvBfeAPnqg==
X-Google-Smtp-Source: ABdhPJzWA5BAwx2xHVIIRvILBkwx+wV+nsgPlAdVCDWmVmbmuaY0F16M5gHy4cWPJ9Y1CF1EPTEF7A==
X-Received: by 2002:a17:90a:bb03:: with SMTP id u3mr35924507pjr.85.1638782754582;
        Mon, 06 Dec 2021 01:25:54 -0800 (PST)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id 38sm9165890pgl.73.2021.12.06.01.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Dec 2021 01:25:54 -0800 (PST)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>
Cc:     Maulik Shah <quic_mkshah@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH v4 1/2] dt-bindings: interrupt-controller: Add Qualcomm MPM support
Date:   Mon,  6 Dec 2021 17:25:34 +0800
Message-Id: <20211206092535.4476-2-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211206092535.4476-1-shawn.guo@linaro.org>
References: <20211206092535.4476-1-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

It adds DT binding support for Qualcomm MPM interrupt controller.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 .../interrupt-controller/qcom,mpm.yaml        | 72 +++++++++++++++++++
 1 file changed, 72 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/qcom,mpm.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,mpm.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,mpm.yaml
new file mode 100644
index 000000000000..22e87fe2eb8e
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,mpm.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/qcom,mpm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcom MPM Interrupt Controller
+
+maintainers:
+  - Shawn Guo <shawn.guo@linaro.org>
+
+description:
+  Qualcomm Technologies Inc. SoCs based on the RPM architecture have a
+  MSM Power Manager (MPM) that is in always-on domain. In addition to managing
+  resources during sleep, the hardware also has an interrupt controller that
+  monitors the interrupts when the system is asleep, wakes up the APSS when
+  one of these interrupts occur and replays it to GIC interrupt controller
+  after GIC becomes operational.
+
+allOf:
+  - $ref: /schemas/interrupt-controller.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: qcom,qcm2290-mpm
+
+  reg:
+    maxItems: 1
+    description:
+      Specifies the base address and size of vMPM registers in RPM MSG RAM.
+
+  interrupts:
+    maxItems: 1
+    description:
+      Specify the IRQ used by RPM to wakeup APSS.
+
+  mboxes:
+    maxItems: 1
+    description:
+      Specify the mailbox used to notify RPM for writing vMPM registers.
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 2
+    description:
+      The first cell is the MPM pin number for the interrupt, and the second
+      is the trigger type.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - mboxes
+  - interrupt-controller
+  - '#interrupt-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    mpm: interrupt-controller@45f01b8 {
+        compatible = "qcom,qcm2290-mpm";
+        interrupts = <GIC_SPI 197 IRQ_TYPE_EDGE_RISING>;
+        reg = <0x45f01b8 0x1000>;
+        mboxes = <&apcs_glb 1>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        interrupt-parent = <&intc>;
+    };
-- 
2.17.1

