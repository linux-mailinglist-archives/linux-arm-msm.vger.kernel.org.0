Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 377E5458A23
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Nov 2021 08:52:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238836AbhKVHz0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Nov 2021 02:55:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238829AbhKVHzZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Nov 2021 02:55:25 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8032C06173E
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Nov 2021 23:52:19 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id p18-20020a17090ad31200b001a78bb52876so16152982pju.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Nov 2021 23:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=dK9zEp2h1X8SwfyxTZtmguOz2O9z0yJUdo63B+VYpso=;
        b=umAo5D+2UV+4x5kE4QckX7B4F9sgB8RfPP4GyVrp7t9hzzRVjSJ5J1zZF602Ff93p2
         4YIBB7gFRZYsRCG7AaC+VCegbF6ygVHsEiQKaIN9l/bu7ZOP23n5sCGS5hncNLKq5i2l
         dxJdLCBXtmkSxMRZs0BzOugmt5cC+Ph3vZru+dhJ4zpLu7uge7STIgBsBmNHNZqaATg/
         nEpSuJe0EVRHq8hOBisIfrxS3K8RzwHAaGNLyZfxVWx6lF0aBarZkWFyXwU6NJiqIc0N
         CvmSlP2nZfxtsvFhm4YrhRA2SugjppfqLB6AfekF+95bDOxGNtAh/33V5o45FgXXKRXm
         +q3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=dK9zEp2h1X8SwfyxTZtmguOz2O9z0yJUdo63B+VYpso=;
        b=W9WQj5B3xu/fjLK3VMjpP4GKLVCkri7ESFo1X8sSbWuTVBsLnxYfcpUlyxi159szfX
         4VvrmJm+aC6bYKDUes33GK3riOHdv7gMfw+jc84dRfJ98sAyXUHYtjKdZ2l+9jJJw/1F
         HWPksOgwZ7clibT6+ZJBxijJcCoyDP+HlI9/RQXRWOLgBwx7D502R+7wsua+QCmrKP5q
         AnSmtYrVra2gR4Tn+RHfg316vQ3Mi7LtOgZZLGXe7Ygekka38tnq7JruIZhwbr0NkWQ8
         HJlHcC2isEYJz26LIzgHj7/AwncHxukIX1SWhnP9z2yZrszyJYUPbv2GjwneBBTaPvPP
         aN8Q==
X-Gm-Message-State: AOAM5311nSj4J5oFwRcLAW7lvm7pMfoecJ2JtpmpZUC4prFqW/J4mB5x
        CxFc7AGsyTmAAKznoE3DDE7//A==
X-Google-Smtp-Source: ABdhPJzOzkVUPasMbPEzWH+74a3EZA1yfI/chduJykoH5tERH9V4O9VFmcSB8DLrHanymaNXpuPVfg==
X-Received: by 2002:a17:90b:3e81:: with SMTP id rj1mr29325587pjb.111.1637567539249;
        Sun, 21 Nov 2021 23:52:19 -0800 (PST)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id bf13sm6355961pjb.47.2021.11.21.23.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Nov 2021 23:52:19 -0800 (PST)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH 1/2] dt-bindings: interrupt-controller: Add Qualcomm MPM support
Date:   Mon, 22 Nov 2021 15:52:06 +0800
Message-Id: <20211122075207.20114-2-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211122075207.20114-1-shawn.guo@linaro.org>
References: <20211122075207.20114-1-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

It adds DT binding support for Qualcomm MPM interrupt controller.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 .../interrupt-controller/qcom,mpm.yaml        | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/qcom,mpm.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,mpm.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,mpm.yaml
new file mode 100644
index 000000000000..32db89543f42
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,mpm.yaml
@@ -0,0 +1,69 @@
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
+    const: 3
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
+    mpm_intc: interrupt-controller@45f01b8 {
+        compatible = "qcom,qcm2290-mpm";
+        interrupts = <GIC_SPI 197 IRQ_TYPE_EDGE_RISING>;
+        reg = <0x45f01b8 0x1000>;
+        mboxes = <&apcs_glb 1>;
+        interrupt-controller;
+        #interrupt-cells = <3>;
+        interrupt-parent = <&intc>;
+    };
-- 
2.17.1

