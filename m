Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DE75290C13
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Oct 2020 21:04:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409148AbgJPTEq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Oct 2020 15:04:46 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:52583 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2409069AbgJPTEp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Oct 2020 15:04:45 -0400
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 16 Oct 2020 12:04:45 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 16 Oct 2020 12:04:43 -0700
X-QCInternal: smtphost
Received: from gokulsri-linux.qualcomm.com ([10.201.2.207])
  by ironmsg01-blr.qualcomm.com with ESMTP; 17 Oct 2020 00:34:29 +0530
Received: by gokulsri-linux.qualcomm.com (Postfix, from userid 432570)
        id 5F91721874; Sat, 17 Oct 2020 00:34:29 +0530 (IST)
From:   Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        sricharan@codeaurora.org, gokulsri@codeaurora.org
Subject: [PATCH RFC] bus: mhi: core: Enable unique QRTR node ID support
Date:   Sat, 17 Oct 2020 00:34:29 +0530
Message-Id: <1602875069-12514-2-git-send-email-gokulsri@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1602875069-12514-1-git-send-email-gokulsri@codeaurora.org>
References: <1602875069-12514-1-git-send-email-gokulsri@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On multi-mhi platforms, host WiFi driver and
QMI test driver needs to differntiate between
QMI packets received from multiple mhi devices.

With QCN9000 PCI cards, once SBL gets loaded, we
utilize ERRDBG2 register to write a unique value
per mhi device from device-tree that the device
utilizes to set a unique QRTR node ID and
instance ID for the QMI service. This helps QRTR
stack in differenting the packets in a multi-mhi
environment and can route them accordingly.

sample:
root@OpenWrt:/# qrtr-lookup
  Service Version Instance Node  Port
       69       1       40   40     2 ATH10k WLAN firmware service
       15       1        0   40     1 Test service
       69       1       39   39     2 ATH10k WLAN firmware service
       15       1        0   39     1 Test service

Here on column 4, 39 and 40 are the node IDs that
is unique per mhi device.

Signed-off-by: Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
---
 .../devicetree/bindings/mhi/qcom,mhi.yaml          | 36 ++++++++++++++++++++++
 drivers/bus/mhi/core/boot.c                        | 14 +++++++++
 2 files changed, 50 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mhi/qcom,mhi.yaml

diff --git a/Documentation/devicetree/bindings/mhi/qcom,mhi.yaml b/Documentation/devicetree/bindings/mhi/qcom,mhi.yaml
new file mode 100644
index 0000000..f763e9f
--- /dev/null
+++ b/Documentation/devicetree/bindings/mhi/qcom,mhi.yaml
@@ -0,0 +1,36 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/pci/qcom,pcie.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Qualcomm Modem Host Interface
+
+maintainers:
+  - Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
+
+properties:
+  qrtr-instance-id:
+    const: 32
+
+required:
+  - reg
+  - qrtr-instance-id
+
+examples:
+  - |
+    pcie: pci@10000000 {
+        compatible = "qcom,pcie-qcs404";
+        status = "ok";
+        perst-gpio = <&tlmm 58 0x1>;
+
+        pcie0_rp: pcie0_rp {
+            reg = <0 0 0 0 0>;
+            status = "ok";
+            mhi_0: qcom,mhi@0 {
+                reg = <0 0 0 0 0 >;
+                qrtr_instance_id = <0x20>;
+            };
+        };
+    };
diff --git a/drivers/bus/mhi/core/boot.c b/drivers/bus/mhi/core/boot.c
index 0b38014..7406f28 100644
--- a/drivers/bus/mhi/core/boot.c
+++ b/drivers/bus/mhi/core/boot.c
@@ -18,6 +18,9 @@
 #include <linux/wait.h>
 #include "internal.h"
 
+#define QRTR_INSTANCE_MASK	0x0000FFFF
+#define QRTR_INSTANCE_SHIFT	0
+
 /* Setup RDDM vector table for RDDM transfer and program RXVEC */
 void mhi_rddm_prepare(struct mhi_controller *mhi_cntrl,
 		      struct image_info *img_info)
@@ -445,6 +448,17 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
 		return;
 	}
 
+	if (!ret && mhi_cntrl->cntrl_dev->of_node) {
+		ret = of_property_read_u32(mhi_cntrl->cntrl_dev->of_node,
+					   "qrtr-instance-id", &instance);
+		if (!ret) {
+			instance &= QRTR_INSTANCE_MASK;
+			mhi_write_reg_field(mhi_cntrl, mhi_cntrl->bhi,
+					    BHI_ERRDBG2, QRTR_INSTANCE_MASK,
+					    QRTR_INSTANCE_SHIFT, instance);
+		}
+	}
+
 	if (mhi_cntrl->ee == MHI_EE_EDL)
 		return;
 
-- 
2.7.4

