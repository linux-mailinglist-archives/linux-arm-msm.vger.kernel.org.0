Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89D2C474CC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Jun 2019 15:30:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727229AbfFPN3r (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 16 Jun 2019 09:29:47 -0400
Received: from onstation.org ([52.200.56.107]:53638 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727044AbfFPN3r (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 16 Jun 2019 09:29:47 -0400
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id 004503E9CF;
        Sun, 16 Jun 2019 13:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1560691786;
        bh=irgUB032exacl9EYA4xT+dfR2io7zD/c3uZsKSwgy5I=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=OYoKc4HqpLshtGnVB7kd7XWU+6L07I0PT7ssQvmpyTma5MSXOAKSCL5arcC1EkP2b
         kW8jRyta7vpWqvCWgs+Mz2uBN+4/uRtnYDwtp5kmGhz98EawK7u4C7x0c1JopNbB8t
         +VUAh/E/+yeAG/TQP09owKC+zqjKpLrb0Eyd6BYc=
From:   Brian Masney <masneyb@onstation.org>
To:     agross@kernel.org, david.brown@linaro.org, robdclark@gmail.com,
        sean@poorly.run, robh+dt@kernel.org
Cc:     bjorn.andersson@linaro.org, airlied@linux.ie, daniel@ffwll.ch,
        mark.rutland@arm.com, jonathan@marek.ca,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
Subject: [PATCH 1/6] dt-bindings: soc: qcom: add On Chip MEMory (OCMEM) bindings
Date:   Sun, 16 Jun 2019 09:29:25 -0400
Message-Id: <20190616132930.6942-2-masneyb@onstation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190616132930.6942-1-masneyb@onstation.org>
References: <20190616132930.6942-1-masneyb@onstation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add device tree bindings for the On Chip Memory (OCMEM) that is present
on some Qualcomm Snapdragon SoCs.

Signed-off-by: Brian Masney <masneyb@onstation.org>
---
 .../bindings/soc/qcom/qcom,ocmem.yaml         | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,ocmem.yaml

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,ocmem.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,ocmem.yaml
new file mode 100644
index 000000000000..5e3ae6311a16
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,ocmem.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/qcom/qcom,ocmem.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: On Chip Memory (OCMEM) that is present on some Qualcomm Snapdragon SoCs.
+
+maintainers:
+  - Brian Masney <masneyb@onstation.org>
+
+description: |
+  The On Chip Memory (OCMEM) allocator allows various clients to allocate memory
+  from OCMEM based on performance, latency and power requirements. This is
+  typically used by the GPU, camera/video, and audio components on some
+  Snapdragon SoCs.
+
+properties:
+  compatible:
+    const: qcom,ocmem-msm8974
+
+  reg:
+    items:
+      - description: Control registers
+      - description: OCMEM address range
+
+  reg-names:
+    items:
+      - const: ocmem_ctrl_physical
+      - const: ocmem_physical
+
+  clocks:
+    items:
+      - description: Core clock
+      - description: Interface clock
+
+  clock-names:
+    items:
+      - const: core
+      - const: iface
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+
+examples:
+  - |
+      #include <dt-bindings/clock/qcom,rpmcc.h>
+      #include <dt-bindings/clock/qcom,mmcc-msm8974.h>
+
+      ocmem: ocmem@fdd00000 {
+        compatible = "qcom,ocmem-msm8974";
+
+        reg = <0xfdd00000 0x2000>,
+               <0xfec00000 0x180000>;
+        reg-names = "ocmem_ctrl_physical",
+                    "ocmem_physical";
+
+        clocks = <&rpmcc RPM_SMD_OCMEMGX_CLK>,
+                  <&mmcc OCMEMCX_OCMEMNOC_CLK>;
+        clock-names = "core",
+                      "iface";
+      };
-- 
2.20.1

