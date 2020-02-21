Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D1A516797D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2020 10:35:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727074AbgBUJfa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Feb 2020 04:35:30 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:52621 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727926AbgBUJf3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Feb 2020 04:35:29 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1582277728; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=zvao9QwjNuld6femRd5qmfHH4dLsz5VX2JdoSaRTyBQ=; b=r/JIK6AUc9joWy8TePbol0AvooxFj/aN7TtrXwzmareFW7rV6wnE7oBk4JENaLOhnMBVSp6H
 +3pUaUiKwd9HiANTN+ZEhDbPQe8WqDImxuefIeaSz+cih4O/WE1/ZTTbwVChQTwNNkL0LOOI
 7CiDAuQ/AALR1V9KMrKMbYm5EBQ=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e4fa45d.7f03a33227d8-smtp-out-n03;
 Fri, 21 Feb 2020 09:35:25 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 7058EC4479F; Fri, 21 Feb 2020 09:35:25 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from okukatla1-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: okukatla)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 11D9FC43383;
        Fri, 21 Feb 2020 09:35:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 11D9FC43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=okukatla@codeaurora.org
From:   Odelu Kukatla <okukatla@codeaurora.org>
To:     georgi.djakov@linaro.org, daidavid1@codeaurora.org,
        bjorn.andersson@linaro.org, evgreen@google.com,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     sboyd@kernel.org, ilina@codeaurora.org, seansw@qti.qualcomm.com,
        elder@linaro.org, linux-arm-msm-owner@vger.kernel.org,
        Odelu Kukatla <okukatla@codeaurora.org>
Subject: [V3, 1/3] dt-bindings: interconnect: Add Qualcomm SC7180 DT bindings
Date:   Fri, 21 Feb 2020 15:00:48 +0530
Message-Id: <1582277450-27382-2-git-send-email-okukatla@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1582277450-27382-1-git-send-email-okukatla@codeaurora.org>
References: <1582277450-27382-1-git-send-email-okukatla@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Qualcomm SC7180 platform has several bus fabrics that could be
controlled and tuned dynamically according to the bandwidth demand.

Signed-off-by: Odelu Kukatla <okukatla@codeaurora.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/interconnect/qcom,sc7180.yaml         |  85 +++++++++++
 include/dt-bindings/interconnect/qcom,sc7180.h     | 161 +++++++++++++++++++++
 2 files changed, 246 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interconnect/qcom,sc7180.yaml
 create mode 100644 include/dt-bindings/interconnect/qcom,sc7180.h

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,sc7180.yaml b/Documentation/devicetree/bindings/interconnect/qcom,sc7180.yaml
new file mode 100644
index 0000000..2cb7d4e
--- /dev/null
+++ b/Documentation/devicetree/bindings/interconnect/qcom,sc7180.yaml
@@ -0,0 +1,85 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interconnect/qcom,sc7180.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title:  Qualcomm SC7180 Network-On-Chip Interconnect
+
+maintainers:
+  - Georgi Djakov <georgi.djakov@linaro.org>
+
+description: |
+   SC7180 interconnect providers support system bandwidth requirements through
+   RPMh hardware accelerators known as Bus Clock Manager (BCM). The provider is
+   able to communicate with the BCM through the Resource State Coordinator (RSC)
+   associated with each execution environment. Provider nodes must point to at
+   least one RPMh device child node pertaining to their RSC and each provider
+   can map to multiple RPMh resources.
+
+properties:
+  reg:
+    maxItems: 1
+
+  compatible:
+    enum:
+      - qcom,sc7180-aggre1-noc
+      - qcom,sc7180-aggre2-noc
+      - qcom,sc7180-camnoc-virt
+      - qcom,sc7180-compute-noc
+      - qcom,sc7180-config-noc
+      - qcom,sc7180-dc-noc
+      - qcom,sc7180-gem-noc
+      - qcom,sc7180-ipa-virt
+      - qcom,sc7180-mc-virt
+      - qcom,sc7180-mmss-noc
+      - qcom,sc7180-npu-noc
+      - qcom,sc7180-qup-virt
+      - qcom,sc7180-system-noc
+
+  '#interconnect-cells':
+    const: 1
+
+  qcom,bcm-voters:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: |
+      List of phandles to qcom,bcm-voter nodes that are required by
+      this interconnect to send RPMh commands.
+
+  qcom,bcm-voter-names:
+    $ref: /schemas/types.yaml#/definitions/string-array
+    description: |
+      Names for each of the qcom,bcm-voters specified.
+
+required:
+  - compatible
+  - reg
+  - '#interconnect-cells'
+  - qcom,bcm-voters
+
+additionalProperties: false
+
+examples:
+  - |
+      #include <dt-bindings/interconnect/qcom,sc7180.h>
+
+      config_noc: interconnect@1500000 {
+            compatible = "qcom,sc7180-config-noc";
+            reg = <0 0x01500000 0 0x28000>;
+            #interconnect-cells = <1>;
+            qcom,bcm-voters = <&apps_bcm_voter>;
+      };
+
+      system_noc: interconnect@1620000 {
+            compatible = "qcom,sc7180-system-noc";
+            reg = <0 0x01620000 0 0x17080>;
+            #interconnect-cells = <1>;
+            qcom,bcm-voters = <&apps_bcm_voter>;
+      };
+
+      mmss_noc: interconnect@1740000 {
+            compatible = "qcom,sc7180-mmss-noc";
+            reg = <0 0x01740000 0 0x1c100>;
+            #interconnect-cells = <1>;
+            qcom,bcm-voters = <&apps_bcm_voter>;
+      };
diff --git a/include/dt-bindings/interconnect/qcom,sc7180.h b/include/dt-bindings/interconnect/qcom,sc7180.h
new file mode 100644
index 0000000..f9970f6
--- /dev/null
+++ b/include/dt-bindings/interconnect/qcom,sc7180.h
@@ -0,0 +1,161 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Qualcomm SC7180 interconnect IDs
+ *
+ * Copyright (c) 2020, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef __DT_BINDINGS_INTERCONNECT_QCOM_SC7180_H
+#define __DT_BINDINGS_INTERCONNECT_QCOM_SC7180_H
+
+#define MASTER_A1NOC_CFG			0
+#define MASTER_QSPI			1
+#define MASTER_QUP_0			2
+#define MASTER_SDCC_2			3
+#define MASTER_EMMC			4
+#define MASTER_UFS_MEM			5
+#define SLAVE_A1NOC_SNOC			6
+#define SLAVE_SERVICE_A1NOC			7
+
+#define MASTER_A2NOC_CFG			0
+#define MASTER_QDSS_BAM			1
+#define MASTER_QUP_1			2
+#define MASTER_USB3			3
+#define MASTER_CRYPTO			4
+#define MASTER_IPA			5
+#define MASTER_QDSS_ETR			6
+#define SLAVE_A2NOC_SNOC			7
+#define SLAVE_SERVICE_A2NOC			8
+
+#define MASTER_CAMNOC_HF0_UNCOMP			0
+#define MASTER_CAMNOC_HF1_UNCOMP			1
+#define MASTER_CAMNOC_SF_UNCOMP			2
+#define SLAVE_CAMNOC_UNCOMP			3
+
+#define MASTER_NPU			0
+#define MASTER_NPU_PROC			1
+#define SLAVE_CDSP_GEM_NOC			2
+
+#define MASTER_SNOC_CNOC			0
+#define MASTER_QDSS_DAP			1
+#define SLAVE_A1NOC_CFG			2
+#define SLAVE_A2NOC_CFG			3
+#define SLAVE_AHB2PHY_SOUTH			4
+#define SLAVE_AHB2PHY_CENTER			5
+#define SLAVE_AOP			6
+#define SLAVE_AOSS			7
+#define SLAVE_BOOT_ROM			8
+#define SLAVE_CAMERA_CFG				9
+#define SLAVE_CAMERA_NRT_THROTTLE_CFG			10
+#define SLAVE_CAMERA_RT_THROTTLE_CFG			11
+#define SLAVE_CLK_CTL			12
+#define SLAVE_RBCPR_CX_CFG			13
+#define SLAVE_RBCPR_MX_CFG			14
+#define SLAVE_CRYPTO_0_CFG			15
+#define SLAVE_DCC_CFG			16
+#define SLAVE_CNOC_DDRSS			17
+#define SLAVE_DISPLAY_CFG			18
+#define SLAVE_DISPLAY_RT_THROTTLE_CFG			19
+#define SLAVE_DISPLAY_THROTTLE_CFG			20
+#define SLAVE_EMMC_CFG			21
+#define SLAVE_GLM					22
+#define SLAVE_GFX3D_CFG			23
+#define SLAVE_IMEM_CFG			24
+#define SLAVE_IPA_CFG			25
+#define SLAVE_CNOC_MNOC_CFG			26
+#define SLAVE_CNOC_MSS			27
+#define SLAVE_NPU_CFG			28
+#define SLAVE_NPU_DMA_BWMON_CFG			29
+#define SLAVE_NPU_PROC_BWMON_CFG			30
+#define SLAVE_PDM			31
+#define SLAVE_PIMEM_CFG			32
+#define SLAVE_PRNG			33
+#define SLAVE_QDSS_CFG			34
+#define SLAVE_QM_CFG			35
+#define SLAVE_QM_MPU_CFG			36
+#define SLAVE_QSPI_0			37
+#define SLAVE_QUP_0			38
+#define SLAVE_QUP_1			39
+#define SLAVE_SDCC_2			40
+#define SLAVE_SECURITY			41
+#define SLAVE_SNOC_CFG			42
+#define SLAVE_TCSR			43
+#define SLAVE_TLMM_WEST			44
+#define SLAVE_TLMM_NORTH			45
+#define SLAVE_TLMM_SOUTH			46
+#define SLAVE_UFS_MEM_CFG			47
+#define SLAVE_USB3			48
+#define SLAVE_VENUS_CFG			49
+#define SLAVE_VENUS_THROTTLE_CFG			50
+#define SLAVE_VSENSE_CTRL_CFG			51
+#define SLAVE_SERVICE_CNOC			52
+
+#define MASTER_CNOC_DC_NOC			0
+#define SLAVE_GEM_NOC_CFG			1
+#define SLAVE_LLCC_CFG			2
+
+#define MASTER_APPSS_PROC		0
+#define MASTER_SYS_TCU			1
+#define MASTER_GEM_NOC_CFG			2
+#define MASTER_COMPUTE_NOC			3
+#define MASTER_MNOC_HF_MEM_NOC			4
+#define MASTER_MNOC_SF_MEM_NOC			5
+#define MASTER_SNOC_GC_MEM_NOC			6
+#define MASTER_SNOC_SF_MEM_NOC			7
+#define MASTER_GFX3D			8
+#define SLAVE_MSS_PROC_MS_MPU_CFG			9
+#define SLAVE_GEM_NOC_SNOC			10
+#define SLAVE_LLCC			11
+#define SLAVE_SERVICE_GEM_NOC			12
+
+#define MASTER_IPA_CORE			0
+#define SLAVE_IPA_CORE			1
+
+#define MASTER_LLCC			0
+#define SLAVE_EBI1			1
+
+#define MASTER_CNOC_MNOC_CFG			0
+#define MASTER_CAMNOC_HF0			1
+#define MASTER_CAMNOC_HF1			2
+#define MASTER_CAMNOC_SF			3
+#define MASTER_MDP0			4
+#define MASTER_ROTATOR			5
+#define MASTER_VIDEO_P0			6
+#define MASTER_VIDEO_PROC			7
+#define SLAVE_MNOC_HF_MEM_NOC			8
+#define SLAVE_MNOC_SF_MEM_NOC			9
+#define SLAVE_SERVICE_MNOC			10
+
+#define MASTER_NPU_SYS			0
+#define MASTER_NPU_NOC_CFG			1
+#define SLAVE_NPU_CAL_DP0			2
+#define SLAVE_NPU_CP			3
+#define SLAVE_NPU_INT_DMA_BWMON_CFG			4
+#define SLAVE_NPU_DPM			5
+#define SLAVE_ISENSE_CFG			6
+#define SLAVE_NPU_LLM_CFG			7
+#define SLAVE_NPU_TCM			8
+#define SLAVE_NPU_COMPUTE_NOC			9
+#define SLAVE_SERVICE_NPU_NOC			10
+
+#define MASTER_QUP_CORE_0			0
+#define MASTER_QUP_CORE_1			1
+#define SLAVE_QUP_CORE_0			2
+#define SLAVE_QUP_CORE_1			3
+
+#define MASTER_SNOC_CFG			0
+#define MASTER_A1NOC_SNOC			1
+#define MASTER_A2NOC_SNOC			2
+#define MASTER_GEM_NOC_SNOC			3
+#define MASTER_PIMEM			4
+#define SLAVE_APPSS			5
+#define SLAVE_SNOC_CNOC			6
+#define SLAVE_SNOC_GEM_NOC_GC			7
+#define SLAVE_SNOC_GEM_NOC_SF			8
+#define SLAVE_IMEM			9
+#define SLAVE_PIMEM			10
+#define SLAVE_SERVICE_SNOC			11
+#define SLAVE_QDSS_STM			12
+#define SLAVE_TCU			13
+
+#endif
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
