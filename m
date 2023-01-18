Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4447C671F72
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 15:24:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231404AbjAROY2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Jan 2023 09:24:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231183AbjAROYK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Jan 2023 09:24:10 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5944936FE5
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 06:08:37 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id l41-20020a05600c1d2900b003daf986faaeso1601064wms.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 06:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bx/DAW03noFrc1PICdBkc/NXXz/tHyppwlLuXwi64TM=;
        b=hvbXVUeUUnUl4MWabwfDQpHX+pJIYrx2KFNij/WjYoRWsPeHLhbwUf62tiumd/Fz5P
         g+n23hr36YA8fhJYf31OTgPBjWfA93y9isUTcPx7I6nByADWvI5tU1zD1TQ2iRhVM8z0
         Q8B8sObIqtIwaBlD8qZL40dgRM/DWn8+ol/ZBnu3W1V7QXQOK9ZB/0LuYWAEjzaOeDtW
         alXvupsn9T+80142HaF0D8CtkchQO7VUiBV81iCDyDddqoRtCYSMOdiNvwVq+FCh+7Oq
         Zy5XrwMJKt5zcinmKDs+fJyMKP0x7qOwKGYLUnqumsBcOG2qe4fWfOXnuvo2HtwSEPZ4
         4Slw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bx/DAW03noFrc1PICdBkc/NXXz/tHyppwlLuXwi64TM=;
        b=JTmW26YKGBcBl6LHv5Ki4TNHepTriO0cBC7cBaBTKi3BSe5Uw+8InCwPmN+582rft+
         PdR3KV1n7OUaBW03n/QKHAdSduRWZvqjQW9r6repPDw0lCyfD29cpqU1WdtoDkiaTzU1
         pbcjpTG7S3+XNYVXXdOz75XRPkskkOCFvwKMIspucWF+r41KiSx9fiCF7/YiPdZIn6+J
         w5IOEw/oV94JpAllBYr0uykiJUko35+HfWvjDlxvi2RpWJYW9w1RMY8fUueOdAGOAT0y
         lYLn/U6IaYkAyHUg7rEMfF2jlVvuEOmDI7TzPJX6Z6hrSyNFXlqGUynZZmr+T0OMHyuE
         lByw==
X-Gm-Message-State: AFqh2komsRao7nOA+N07zCdQTNdDDYCUnDrAKDmn0OMAznpPiYc6rUyB
        Mv8m+q4x5F0xZ4c2rTLbLn0PHg==
X-Google-Smtp-Source: AMrXdXvgHVnJXbiqHOEn0YTkvFOrsNnufeGAnarFpFOZUt3oxxgPxSS/oKLvjA+MHgtd4iP7W/nprA==
X-Received: by 2002:a05:600c:3583:b0:3d9:719a:8f7d with SMTP id p3-20020a05600c358300b003d9719a8f7dmr6666750wmq.35.1674050915768;
        Wed, 18 Jan 2023 06:08:35 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:1866:5d91:a429:aba])
        by smtp.gmail.com with ESMTPSA id m27-20020a05600c3b1b00b003db012d49b7sm3193431wms.2.2023.01.18.06.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 06:08:35 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 1/2] dt-bindings: interconnect: qcom: document the interconnects for sa8775p
Date:   Wed, 18 Jan 2023 15:08:24 +0100
Message-Id: <20230118140825.242544-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230118140825.242544-1-brgl@bgdev.pl>
References: <20230118140825.242544-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add a DT binding document for the RPMh interconnects on Qualcomm sa8775p
platforms.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../interconnect/qcom,sa8775p-rpmh.yaml       |  50 ++++
 .../interconnect/qcom,sa8775p-rpmh.h          | 231 ++++++++++++++++++
 2 files changed, 281 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interconnect/qcom,sa8775p-rpmh.yaml
 create mode 100644 include/dt-bindings/interconnect/qcom,sa8775p-rpmh.h

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,sa8775p-rpmh.yaml b/Documentation/devicetree/bindings/interconnect/qcom,sa8775p-rpmh.yaml
new file mode 100644
index 000000000000..672c7aaa8ed7
--- /dev/null
+++ b/Documentation/devicetree/bindings/interconnect/qcom,sa8775p-rpmh.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interconnect/qcom,sa8775p-rpmh.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm RPMh Network-On-Chip Interconnect on SA8875P
+
+maintainers:
+  - Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+description: |
+  RPMh interconnect providers support system bandwidth requirements through
+  RPMh hardware accelerators known as Bus Clock Manager (BCM).
+
+  See also:: include/dt-bindings/interconnect/qcom,sa8775p.h
+
+properties:
+  compatible:
+    enum:
+      - qcom,sa8775p-aggre1-noc
+      - qcom,sa8775p-aggre2-noc
+      - qcom,sa8775p-clk-virt
+      - qcom,sa8775p-config-noc
+      - qcom,sa8775p-dc-noc
+      - qcom,sa8775p-gem-noc
+      - qcom,sa8775p-gpdsp-anoc
+      - qcom,sa8775p-lpass-ag-noc
+      - qcom,sa8775p-mc-virt
+      - qcom,sa8775p-mmss-noc
+      - qcom,sa8775p-nspa-noc
+      - qcom,sa8775p-nspb-noc
+      - qcom,sa8775p-pcie-anoc
+      - qcom,sa8775p-system-noc
+
+required:
+  - compatible
+
+allOf:
+  - $ref: qcom,rpmh-common.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    aggre1_noc: interconnect-aggre1-noc {
+        compatible = "qcom,sa8775p-aggre1-noc";
+        #interconnect-cells = <2>;
+        qcom,bcm-voters = <&apps_bcm_voter>;
+    };
diff --git a/include/dt-bindings/interconnect/qcom,sa8775p-rpmh.h b/include/dt-bindings/interconnect/qcom,sa8775p-rpmh.h
new file mode 100644
index 000000000000..f21c39d0928e
--- /dev/null
+++ b/include/dt-bindings/interconnect/qcom,sa8775p-rpmh.h
@@ -0,0 +1,231 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2022, Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2023, Linaro Limited
+ */
+
+#ifndef __DT_BINDINGS_INTERCONNECT_QCOM_SA8775P_H
+#define __DT_BINDINGS_INTERCONNECT_QCOM_SA8775P_H
+
+/* aggre1_noc */
+#define MASTER_QUP_3			0
+#define MASTER_EMAC			1
+#define MASTER_EMAC_1			2
+#define MASTER_SDC			3
+#define MASTER_UFS_MEM			4
+#define MASTER_USB2			5
+#define MASTER_USB3_0			6
+#define MASTER_USB3_1			7
+#define SLAVE_A1NOC_SNOC		8
+
+/* aggre2_noc */
+#define MASTER_QDSS_BAM			0
+#define MASTER_QUP_0			1
+#define MASTER_QUP_1			2
+#define MASTER_QUP_2			3
+#define MASTER_CNOC_A2NOC		4
+#define MASTER_CRYPTO_CORE0		5
+#define MASTER_CRYPTO_CORE1		6
+#define MASTER_IPA			7
+#define MASTER_QDSS_ETR_0		8
+#define MASTER_QDSS_ETR_1		9
+#define MASTER_UFS_CARD			10
+#define SLAVE_A2NOC_SNOC		11
+
+/* clk_virt */
+#define MASTER_QUP_CORE_0		0
+#define MASTER_QUP_CORE_1		1
+#define MASTER_QUP_CORE_2		2
+#define MASTER_QUP_CORE_3		3
+#define SLAVE_QUP_CORE_0		4
+#define SLAVE_QUP_CORE_1		5
+#define SLAVE_QUP_CORE_2		6
+#define SLAVE_QUP_CORE_3		7
+
+/* config_noc */
+#define MASTER_GEM_NOC_CNOC		0
+#define MASTER_GEM_NOC_PCIE_SNOC	1
+#define SLAVE_AHB2PHY_0			2
+#define SLAVE_AHB2PHY_1			3
+#define SLAVE_AHB2PHY_2			4
+#define SLAVE_AHB2PHY_3			5
+#define SLAVE_ANOC_THROTTLE_CFG		6
+#define SLAVE_AOSS			7
+#define SLAVE_APPSS			8
+#define SLAVE_BOOT_ROM			9
+#define SLAVE_CAMERA_CFG		10
+#define SLAVE_CAMERA_NRT_THROTTLE_CFG	11
+#define SLAVE_CAMERA_RT_THROTTLE_CFG	12
+#define SLAVE_CLK_CTL			13
+#define SLAVE_CDSP_CFG			14
+#define SLAVE_CDSP1_CFG			15
+#define SLAVE_RBCPR_CX_CFG		16
+#define SLAVE_RBCPR_MMCX_CFG		17
+#define SLAVE_RBCPR_MX_CFG		18
+#define SLAVE_CPR_NSPCX			19
+#define SLAVE_CRYPTO_0_CFG		20
+#define SLAVE_CX_RDPM			21
+#define SLAVE_DISPLAY_CFG		22
+#define SLAVE_DISPLAY_RT_THROTTLE_CFG	23
+#define SLAVE_DISPLAY1_CFG		24
+#define SLAVE_DISPLAY1_RT_THROTTLE_CFG  25
+#define SLAVE_EMAC_CFG			26
+#define SLAVE_EMAC1_CFG			27
+#define SLAVE_GP_DSP0_CFG		28
+#define SLAVE_GP_DSP1_CFG		29
+#define SLAVE_GPDSP0_THROTTLE_CFG	30
+#define SLAVE_GPDSP1_THROTTLE_CFG	31
+#define SLAVE_GPU_TCU_THROTTLE_CFG	32
+#define SLAVE_GFX3D_CFG			33
+#define SLAVE_HWKM			34
+#define SLAVE_IMEM_CFG			35
+#define SLAVE_IPA_CFG			36
+#define SLAVE_IPC_ROUTER_CFG		37
+#define SLAVE_LPASS			38
+#define SLAVE_LPASS_THROTTLE_CFG	39
+#define SLAVE_MX_RDPM			40
+#define SLAVE_MXC_RDPM			41
+#define SLAVE_PCIE_0_CFG		42
+#define SLAVE_PCIE_1_CFG		43
+#define SLAVE_PCIE_RSC_CFG		44
+#define SLAVE_PCIE_TCU_THROTTLE_CFG	45
+#define SLAVE_PCIE_THROTTLE_CFG		46
+#define SLAVE_PDM			47
+#define SLAVE_PIMEM_CFG			48
+#define SLAVE_PKA_WRAPPER_CFG		49
+#define SLAVE_QDSS_CFG			50
+#define SLAVE_QM_CFG			51
+#define SLAVE_QM_MPU_CFG		52
+#define SLAVE_QUP_0			53
+#define SLAVE_QUP_1			54
+#define SLAVE_QUP_2			55
+#define SLAVE_QUP_3			56
+#define SLAVE_SAIL_THROTTLE_CFG		57
+#define SLAVE_SDC1			58
+#define SLAVE_SECURITY			59
+#define SLAVE_SNOC_THROTTLE_CFG		60
+#define SLAVE_TCSR			61
+#define SLAVE_TLMM			62
+#define SLAVE_TSC_CFG			63
+#define SLAVE_UFS_CARD_CFG		64
+#define SLAVE_UFS_MEM_CFG		65
+#define SLAVE_USB2			66
+#define SLAVE_USB3_0			67
+#define SLAVE_USB3_1			68
+#define SLAVE_VENUS_CFG			69
+#define SLAVE_VENUS_CVP_THROTTLE_CFG	70
+#define SLAVE_VENUS_V_CPU_THROTTLE_CFG	71
+#define SLAVE_VENUS_VCODEC_THROTTLE_CFG	72
+#define SLAVE_DDRSS_CFG			73
+#define SLAVE_GPDSP_NOC_CFG		74
+#define SLAVE_CNOC_MNOC_HF_CFG		75
+#define SLAVE_CNOC_MNOC_SF_CFG		76
+#define SLAVE_PCIE_ANOC_CFG		77
+#define SLAVE_SNOC_CFG			78
+#define SLAVE_BOOT_IMEM			79
+#define SLAVE_IMEM			80
+#define SLAVE_PIMEM			81
+#define SLAVE_PCIE_0			82
+#define SLAVE_PCIE_1			83
+#define SLAVE_QDSS_STM			84
+#define SLAVE_TCU			85
+
+/* dc_noc */
+#define MASTER_CNOC_DC_NOC		0
+#define SLAVE_LLCC_CFG			1
+#define SLAVE_GEM_NOC_CFG		2
+
+/* gem_noc */
+#define MASTER_GPU_TCU			0
+#define MASTER_PCIE_TCU			1
+#define MASTER_SYS_TCU			2
+#define MASTER_APPSS_PROC		3
+#define MASTER_COMPUTE_NOC		4
+#define MASTER_COMPUTE_NOC_1		5
+#define MASTER_GEM_NOC_CFG		6
+#define MASTER_GPDSP_SAIL		7
+#define MASTER_GFX3D			8
+#define MASTER_MNOC_HF_MEM_NOC		9
+#define MASTER_MNOC_SF_MEM_NOC		10
+#define MASTER_ANOC_PCIE_GEM_NOC	11
+#define MASTER_SNOC_GC_MEM_NOC		12
+#define MASTER_SNOC_SF_MEM_NOC		13
+#define SLAVE_GEM_NOC_CNOC		14
+#define SLAVE_LLCC			15
+#define SLAVE_GEM_NOC_PCIE_CNOC		16
+#define SLAVE_SERVICE_GEM_NOC_1		17
+#define SLAVE_SERVICE_GEM_NOC_2		18
+#define SLAVE_SERVICE_GEM_NOC		19
+#define SLAVE_SERVICE_GEM_NOC2		20
+
+/* gpdsp_anoc */
+#define MASTER_DSP0			0
+#define MASTER_DSP1			1
+#define SLAVE_GP_DSP_SAIL_NOC		2
+
+/* lpass_ag_noc */
+#define MASTER_CNOC_LPASS_AG_NOC	0
+#define MASTER_LPASS_PROC		1
+#define SLAVE_LPASS_CORE_CFG		2
+#define SLAVE_LPASS_LPI_CFG		3
+#define SLAVE_LPASS_MPU_CFG		4
+#define SLAVE_LPASS_TOP_CFG		5
+#define SLAVE_LPASS_SNOC		6
+#define SLAVE_SERVICES_LPASS_AML_NOC	7
+#define SLAVE_SERVICE_LPASS_AG_NOC	8
+
+/* mc_virt */
+#define MASTER_LLCC			0
+#define SLAVE_EBI1			1
+
+/*mmss_noc */
+#define MASTER_CAMNOC_HF		0
+#define MASTER_CAMNOC_ICP		1
+#define MASTER_CAMNOC_SF		2
+#define MASTER_MDP0			3
+#define MASTER_MDP1			4
+#define MASTER_MDP_CORE1_0		5
+#define MASTER_MDP_CORE1_1		6
+#define MASTER_CNOC_MNOC_HF_CFG		7
+#define MASTER_CNOC_MNOC_SF_CFG		8
+#define MASTER_VIDEO_P0			9
+#define MASTER_VIDEO_P1			10
+#define MASTER_VIDEO_PROC		11
+#define MASTER_VIDEO_V_PROC		12
+#define SLAVE_MNOC_HF_MEM_NOC		13
+#define SLAVE_MNOC_SF_MEM_NOC		14
+#define SLAVE_SERVICE_MNOC_HF		15
+#define SLAVE_SERVICE_MNOC_SF		16
+
+/* nspa_noc */
+#define MASTER_CDSP_NOC_CFG		0
+#define MASTER_CDSP_PROC		1
+#define SLAVE_HCP_A			2
+#define SLAVE_CDSP_MEM_NOC		3
+#define SLAVE_SERVICE_NSP_NOC		4
+
+/* nspb_noc */
+#define MASTER_CDSPB_NOC_CFG		0
+#define MASTER_CDSP_PROC_B		1
+#define SLAVE_CDSPB_MEM_NOC		2
+#define SLAVE_HCP_B			3
+#define SLAVE_SERVICE_NSPB_NOC		4
+
+/* pcie_anoc */
+#define MASTER_PCIE_0			0
+#define MASTER_PCIE_1			1
+#define SLAVE_ANOC_PCIE_GEM_NOC		2
+
+/* system_noc */
+#define MASTER_GIC_AHB			0
+#define MASTER_A1NOC_SNOC		1
+#define MASTER_A2NOC_SNOC		2
+#define MASTER_LPASS_ANOC		3
+#define MASTER_SNOC_CFG			4
+#define MASTER_PIMEM			5
+#define MASTER_GIC			6
+#define SLAVE_SNOC_GEM_NOC_GC		7
+#define SLAVE_SNOC_GEM_NOC_SF		8
+#define SLAVE_SERVICE_SNOC		9
+
+#endif /* __DT_BINDINGS_INTERCONNECT_QCOM_SA8775P_H */
-- 
2.37.2

