Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A14D2FDDF1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Jan 2021 01:32:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393228AbhAUAan (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Jan 2021 19:30:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403917AbhATXVd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Jan 2021 18:21:33 -0500
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45755C0613D6
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Jan 2021 14:35:50 -0800 (PST)
Received: by mail-oi1-x22f.google.com with SMTP id n186so57523oia.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Jan 2021 14:35:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Hhqf2NaDoAwafjN+FbMFW/z55kpjO3z6XcAsjlpq58w=;
        b=hOxpmNjXKsu04mfMLIgqrwT5PZL+yKH/z+dW9C77l9XsLnsS0HniXMjuaiefIG7+G5
         H6UMgzSfmcD6rtl1c3En0qIkzDAAS1y58uOukwWYK7bKyvAF+rXGruZhQepRREhxyz38
         L5nFlZ8XSGm13+cpHfmHZ5SvQcvIGI7jdNPFYdeEF+h88p6NLVSqFd8lnP6/SE7MI9GN
         xTmNE7hfn5CxPqVPwgb/FJqh+Gllxuq1xIHBPHB7gCMES2XWPqev1eEN0PuN3E2vc/9Y
         FHzMNyg3BZKA2zJVce1e1kftUA4Fj2tuRM1lqBaRTJzlTILn9RdYtFpIa3fC9xvEASne
         0vNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Hhqf2NaDoAwafjN+FbMFW/z55kpjO3z6XcAsjlpq58w=;
        b=KT//5ixULeFAm19VyojCrKqADZpH0zCBdMLctQBXJeloEMulN0sN2qolXmdbNveJZb
         Wn36+S3DE1mrG18vqimj2VInraGpfyKEgAOpcKzJ1dNa/S0XjtaMfEjBIHhmrwVv3ZRn
         sDiobilS3RqeYgJdqo+ym9Dag5UFgWnQjpBhd4isV4mPL6sAr/rtNx6f5EMfDYkqnEXR
         5ZySvKs8DChLmSL/oD5uF5WY1lAxK6ceADFn2cdSkRMSC/EWO+v+sqPacafkzpURPP50
         ujHOkDYSyfwId+dqis+QzzZc7h1OUdTqzvKtS61alngIkh0M79XDUsWgIDsJFWZu4wjd
         FuOA==
X-Gm-Message-State: AOAM531p/luRx1JrRMZz5ksY/4YP/7Gcf7w0jkegGuOhNEZeoagabiCu
        5v0V9z0+Sq3FXcxGowUK7yVcgwkjXyIBHA==
X-Google-Smtp-Source: ABdhPJwU148jKqk6OJQ18QdZztiyQlk5j6uh90/1KHM0XMOPkq7jRClr1vLf+7N8YfVJviQSuUScFw==
X-Received: by 2002:aca:db84:: with SMTP id s126mr4144061oig.91.1611182149456;
        Wed, 20 Jan 2021 14:35:49 -0800 (PST)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 186sm635075ood.6.2021.01.20.14.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jan 2021 14:35:48 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: clock: Add SC8180x GCC binding
Date:   Wed, 20 Jan 2021 14:35:55 -0800
Message-Id: <20210120223556.1610214-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add devicetree binding for the global clock controller found in the
Qualcomm SC8180x platform.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 .../bindings/clock/qcom,gcc-sc8180x.yaml      |  76 +++++
 include/dt-bindings/clock/qcom,gcc-sc8180x.h  | 309 ++++++++++++++++++
 2 files changed, 385 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-sc8180x.yaml
 create mode 100644 include/dt-bindings/clock/qcom,gcc-sc8180x.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sc8180x.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sc8180x.yaml
new file mode 100644
index 000000000000..f03ef96e57fa
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sc8180x.yaml
@@ -0,0 +1,76 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,gcc-sc8180x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Global Clock & Reset Controller Binding for SC8180x
+
+maintainers:
+  - Bjorn Andersson <bjorn.andersson@linaro.org>
+
+description: |
+  Qualcomm global clock control module which supports the clocks, resets and
+  power domains on SC8180x.
+
+  See also:
+  - dt-bindings/clock/qcom,gcc-sc8180x.h
+
+properties:
+  compatible:
+    const: qcom,gcc-sc8180x
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: Board active XO source
+      - description: Sleep clock source
+
+  clock-names:
+    items:
+      - const: bi_tcxo
+      - const: bi_tcxo_ao
+      - const: sleep_clk
+
+  '#clock-cells':
+    const: 1
+
+  '#reset-cells':
+    const: 1
+
+  '#power-domain-cells':
+    const: 1
+
+  reg:
+    maxItems: 1
+
+  protected-clocks:
+    description:
+      Protected clock specifier list as per common clock binding.
+
+required:
+  - compatible
+  - clocks
+  - clock-names
+  - reg
+  - '#clock-cells'
+  - '#reset-cells'
+  - '#power-domain-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    clock-controller@100000 {
+      compatible = "qcom,gcc-sc8180x";
+      reg = <0x00100000 0x1f0000>;
+      clocks = <&rpmhcc RPMH_CXO_CLK>,
+               <&rpmhcc RPMH_CXO_CLK_A>,
+               <&sleep_clk>;
+      clock-names = "bi_tcxo", "bi_tcxo_ao", "sleep_clk";
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+      #power-domain-cells = <1>;
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,gcc-sc8180x.h b/include/dt-bindings/clock/qcom,gcc-sc8180x.h
new file mode 100644
index 000000000000..e893415ae13d
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,gcc-sc8180x.h
@@ -0,0 +1,309 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2018-2019, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2021, Linaro Ltd.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GCC_SC8180X_H
+#define _DT_BINDINGS_CLK_QCOM_GCC_SC8180X_H
+
+#define GCC_AGGRE_NOC_PCIE_TBU_CLK				0
+#define GCC_AGGRE_UFS_CARD_AXI_CLK				1
+#define GCC_AGGRE_UFS_CARD_AXI_HW_CTL_CLK			2
+#define GCC_AGGRE_UFS_PHY_AXI_CLK				3
+#define GCC_AGGRE_UFS_PHY_AXI_HW_CTL_CLK			4
+#define GCC_AGGRE_USB3_MP_AXI_CLK				5
+#define GCC_AGGRE_USB3_PRIM_AXI_CLK				6
+#define GCC_AGGRE_USB3_SEC_AXI_CLK				7
+#define GCC_BOOT_ROM_AHB_CLK					8
+#define GCC_CAMERA_HF_AXI_CLK					9
+#define GCC_CAMERA_SF_AXI_CLK					10
+#define GCC_CFG_NOC_USB3_MP_AXI_CLK				11
+#define GCC_CFG_NOC_USB3_PRIM_AXI_CLK				12
+#define GCC_CFG_NOC_USB3_SEC_AXI_CLK				13
+#define GCC_CPUSS_AHB_CLK					14
+#define GCC_CPUSS_AHB_CLK_SRC					15
+#define GCC_CPUSS_RBCPR_CLK					16
+#define GCC_DDRSS_GPU_AXI_CLK					17
+#define GCC_DISP_HF_AXI_CLK					18
+#define GCC_DISP_SF_AXI_CLK					19
+#define GCC_EMAC_AXI_CLK					20
+#define GCC_EMAC_PTP_CLK					21
+#define GCC_EMAC_PTP_CLK_SRC					22
+#define GCC_EMAC_RGMII_CLK					23
+#define GCC_EMAC_RGMII_CLK_SRC					24
+#define GCC_EMAC_SLV_AHB_CLK					25
+#define GCC_GP1_CLK						26
+#define GCC_GP1_CLK_SRC						27
+#define GCC_GP2_CLK						28
+#define GCC_GP2_CLK_SRC						29
+#define GCC_GP3_CLK						30
+#define GCC_GP3_CLK_SRC						31
+#define GCC_GP4_CLK						32
+#define GCC_GP4_CLK_SRC						33
+#define GCC_GP5_CLK						34
+#define GCC_GP5_CLK_SRC						35
+#define GCC_GPU_GPLL0_CLK_SRC					36
+#define GCC_GPU_GPLL0_DIV_CLK_SRC				37
+#define GCC_GPU_MEMNOC_GFX_CLK					38
+#define GCC_GPU_SNOC_DVM_GFX_CLK				39
+#define GCC_NPU_AT_CLK						40
+#define GCC_NPU_AXI_CLK						41
+#define GCC_NPU_AXI_CLK_SRC					42
+#define GCC_NPU_GPLL0_CLK_SRC					43
+#define GCC_NPU_GPLL0_DIV_CLK_SRC				44
+#define GCC_NPU_TRIG_CLK					45
+#define GCC_PCIE0_PHY_REFGEN_CLK				46
+#define GCC_PCIE1_PHY_REFGEN_CLK				47
+#define GCC_PCIE2_PHY_REFGEN_CLK				48
+#define GCC_PCIE3_PHY_REFGEN_CLK				49
+#define GCC_PCIE_0_AUX_CLK					50
+#define GCC_PCIE_0_AUX_CLK_SRC					51
+#define GCC_PCIE_0_CFG_AHB_CLK					52
+#define GCC_PCIE_0_MSTR_AXI_CLK					53
+#define GCC_PCIE_0_PIPE_CLK					54
+#define GCC_PCIE_0_SLV_AXI_CLK					55
+#define GCC_PCIE_0_SLV_Q2A_AXI_CLK				56
+#define GCC_PCIE_1_AUX_CLK					57
+#define GCC_PCIE_1_AUX_CLK_SRC					58
+#define GCC_PCIE_1_CFG_AHB_CLK					59
+#define GCC_PCIE_1_MSTR_AXI_CLK					60
+#define GCC_PCIE_1_PIPE_CLK					61
+#define GCC_PCIE_1_SLV_AXI_CLK					62
+#define GCC_PCIE_1_SLV_Q2A_AXI_CLK				63
+#define GCC_PCIE_2_AUX_CLK					64
+#define GCC_PCIE_2_AUX_CLK_SRC					65
+#define GCC_PCIE_2_CFG_AHB_CLK					66
+#define GCC_PCIE_2_MSTR_AXI_CLK					67
+#define GCC_PCIE_2_PIPE_CLK					68
+#define GCC_PCIE_2_SLV_AXI_CLK					69
+#define GCC_PCIE_2_SLV_Q2A_AXI_CLK				70
+#define GCC_PCIE_3_AUX_CLK					71
+#define GCC_PCIE_3_AUX_CLK_SRC					72
+#define GCC_PCIE_3_CFG_AHB_CLK					73
+#define GCC_PCIE_3_MSTR_AXI_CLK					74
+#define GCC_PCIE_3_PIPE_CLK					75
+#define GCC_PCIE_3_SLV_AXI_CLK					76
+#define GCC_PCIE_3_SLV_Q2A_AXI_CLK				77
+#define GCC_PCIE_PHY_AUX_CLK					78
+#define GCC_PCIE_PHY_REFGEN_CLK_SRC				79
+#define GCC_PDM2_CLK						80
+#define GCC_PDM2_CLK_SRC					81
+#define GCC_PDM_AHB_CLK						82
+#define GCC_PDM_XO4_CLK						83
+#define GCC_PRNG_AHB_CLK					84
+#define GCC_QMIP_CAMERA_NRT_AHB_CLK				85
+#define GCC_QMIP_CAMERA_RT_AHB_CLK				86
+#define GCC_QMIP_DISP_AHB_CLK					87
+#define GCC_QMIP_VIDEO_CVP_AHB_CLK				88
+#define GCC_QMIP_VIDEO_VCODEC_AHB_CLK				89
+#define GCC_QSPI_1_CNOC_PERIPH_AHB_CLK				90
+#define GCC_QSPI_1_CORE_CLK					91
+#define GCC_QSPI_1_CORE_CLK_SRC					92
+#define GCC_QSPI_CNOC_PERIPH_AHB_CLK				93
+#define GCC_QSPI_CORE_CLK					94
+#define GCC_QSPI_CORE_CLK_SRC					95
+#define GCC_QUPV3_WRAP0_S0_CLK					96
+#define GCC_QUPV3_WRAP0_S0_CLK_SRC				97
+#define GCC_QUPV3_WRAP0_S1_CLK					98
+#define GCC_QUPV3_WRAP0_S1_CLK_SRC				99
+#define GCC_QUPV3_WRAP0_S2_CLK					100
+#define GCC_QUPV3_WRAP0_S2_CLK_SRC				101
+#define GCC_QUPV3_WRAP0_S3_CLK					102
+#define GCC_QUPV3_WRAP0_S3_CLK_SRC				103
+#define GCC_QUPV3_WRAP0_S4_CLK					104
+#define GCC_QUPV3_WRAP0_S4_CLK_SRC				105
+#define GCC_QUPV3_WRAP0_S5_CLK					106
+#define GCC_QUPV3_WRAP0_S5_CLK_SRC				107
+#define GCC_QUPV3_WRAP0_S6_CLK					108
+#define GCC_QUPV3_WRAP0_S6_CLK_SRC				109
+#define GCC_QUPV3_WRAP0_S7_CLK					110
+#define GCC_QUPV3_WRAP0_S7_CLK_SRC				111
+#define GCC_QUPV3_WRAP1_S0_CLK					112
+#define GCC_QUPV3_WRAP1_S0_CLK_SRC				113
+#define GCC_QUPV3_WRAP1_S1_CLK					114
+#define GCC_QUPV3_WRAP1_S1_CLK_SRC				115
+#define GCC_QUPV3_WRAP1_S2_CLK					116
+#define GCC_QUPV3_WRAP1_S2_CLK_SRC				117
+#define GCC_QUPV3_WRAP1_S3_CLK					118
+#define GCC_QUPV3_WRAP1_S3_CLK_SRC				119
+#define GCC_QUPV3_WRAP1_S4_CLK					120
+#define GCC_QUPV3_WRAP1_S4_CLK_SRC				121
+#define GCC_QUPV3_WRAP1_S5_CLK					122
+#define GCC_QUPV3_WRAP1_S5_CLK_SRC				123
+#define GCC_QUPV3_WRAP2_S0_CLK					124
+#define GCC_QUPV3_WRAP2_S0_CLK_SRC				125
+#define GCC_QUPV3_WRAP2_S1_CLK					126
+#define GCC_QUPV3_WRAP2_S1_CLK_SRC				127
+#define GCC_QUPV3_WRAP2_S2_CLK					128
+#define GCC_QUPV3_WRAP2_S2_CLK_SRC				129
+#define GCC_QUPV3_WRAP2_S3_CLK					130
+#define GCC_QUPV3_WRAP2_S3_CLK_SRC				131
+#define GCC_QUPV3_WRAP2_S4_CLK					132
+#define GCC_QUPV3_WRAP2_S4_CLK_SRC				133
+#define GCC_QUPV3_WRAP2_S5_CLK					134
+#define GCC_QUPV3_WRAP2_S5_CLK_SRC				135
+#define GCC_QUPV3_WRAP_0_M_AHB_CLK				136
+#define GCC_QUPV3_WRAP_0_S_AHB_CLK				137
+#define GCC_QUPV3_WRAP_1_M_AHB_CLK				138
+#define GCC_QUPV3_WRAP_1_S_AHB_CLK				139
+#define GCC_QUPV3_WRAP_2_M_AHB_CLK				140
+#define GCC_QUPV3_WRAP_2_S_AHB_CLK				141
+#define GCC_SDCC2_AHB_CLK					142
+#define GCC_SDCC2_APPS_CLK					143
+#define GCC_SDCC2_APPS_CLK_SRC					144
+#define GCC_SDCC4_AHB_CLK					145
+#define GCC_SDCC4_APPS_CLK					146
+#define GCC_SDCC4_APPS_CLK_SRC					147
+#define GCC_SYS_NOC_CPUSS_AHB_CLK				148
+#define GCC_TSIF_AHB_CLK					149
+#define GCC_TSIF_INACTIVITY_TIMERS_CLK				150
+#define GCC_TSIF_REF_CLK					151
+#define GCC_TSIF_REF_CLK_SRC					152
+#define GCC_UFS_CARD_2_AHB_CLK					153
+#define GCC_UFS_CARD_2_AXI_CLK					154
+#define GCC_UFS_CARD_2_AXI_CLK_SRC				155
+#define GCC_UFS_CARD_2_ICE_CORE_CLK				156
+#define GCC_UFS_CARD_2_ICE_CORE_CLK_SRC				157
+#define GCC_UFS_CARD_2_PHY_AUX_CLK				158
+#define GCC_UFS_CARD_2_PHY_AUX_CLK_SRC				159
+#define GCC_UFS_CARD_2_RX_SYMBOL_0_CLK				160
+#define GCC_UFS_CARD_2_RX_SYMBOL_1_CLK				161
+#define GCC_UFS_CARD_2_TX_SYMBOL_0_CLK				162
+#define GCC_UFS_CARD_2_UNIPRO_CORE_CLK				163
+#define GCC_UFS_CARD_2_UNIPRO_CORE_CLK_SRC			164
+#define GCC_UFS_CARD_AHB_CLK					165
+#define GCC_UFS_CARD_AXI_CLK					166
+#define GCC_UFS_CARD_AXI_CLK_SRC				167
+#define GCC_UFS_CARD_AXI_HW_CTL_CLK				168
+#define GCC_UFS_CARD_ICE_CORE_CLK				169
+#define GCC_UFS_CARD_ICE_CORE_CLK_SRC				170
+#define GCC_UFS_CARD_ICE_CORE_HW_CTL_CLK			171
+#define GCC_UFS_CARD_PHY_AUX_CLK				172
+#define GCC_UFS_CARD_PHY_AUX_CLK_SRC				173
+#define GCC_UFS_CARD_PHY_AUX_HW_CTL_CLK				174
+#define GCC_UFS_CARD_RX_SYMBOL_0_CLK				175
+#define GCC_UFS_CARD_RX_SYMBOL_1_CLK				176
+#define GCC_UFS_CARD_TX_SYMBOL_0_CLK				177
+#define GCC_UFS_CARD_UNIPRO_CORE_CLK				178
+#define GCC_UFS_CARD_UNIPRO_CORE_CLK_SRC			179
+#define GCC_UFS_CARD_UNIPRO_CORE_HW_CTL_CLK			180
+#define GCC_UFS_PHY_AHB_CLK					181
+#define GCC_UFS_PHY_AXI_CLK					182
+#define GCC_UFS_PHY_AXI_CLK_SRC					183
+#define GCC_UFS_PHY_AXI_HW_CTL_CLK				184
+#define GCC_UFS_PHY_ICE_CORE_CLK				185
+#define GCC_UFS_PHY_ICE_CORE_CLK_SRC				186
+#define GCC_UFS_PHY_ICE_CORE_HW_CTL_CLK				187
+#define GCC_UFS_PHY_PHY_AUX_CLK					188
+#define GCC_UFS_PHY_PHY_AUX_CLK_SRC				189
+#define GCC_UFS_PHY_PHY_AUX_HW_CTL_CLK				190
+#define GCC_UFS_PHY_RX_SYMBOL_0_CLK				191
+#define GCC_UFS_PHY_RX_SYMBOL_1_CLK				192
+#define GCC_UFS_PHY_TX_SYMBOL_0_CLK				193
+#define GCC_UFS_PHY_UNIPRO_CORE_CLK				194
+#define GCC_UFS_PHY_UNIPRO_CORE_CLK_SRC				195
+#define GCC_UFS_PHY_UNIPRO_CORE_HW_CTL_CLK			196
+#define GCC_USB30_MP_MASTER_CLK					197
+#define GCC_USB30_MP_MASTER_CLK_SRC				198
+#define GCC_USB30_MP_MOCK_UTMI_CLK				199
+#define GCC_USB30_MP_MOCK_UTMI_CLK_SRC				200
+#define GCC_USB30_MP_SLEEP_CLK					201
+#define GCC_USB30_PRIM_MASTER_CLK				202
+#define GCC_USB30_PRIM_MASTER_CLK_SRC				203
+#define GCC_USB30_PRIM_MOCK_UTMI_CLK				204
+#define GCC_USB30_PRIM_MOCK_UTMI_CLK_SRC			205
+#define GCC_USB30_PRIM_SLEEP_CLK				206
+#define GCC_USB30_SEC_MASTER_CLK				207
+#define GCC_USB30_SEC_MASTER_CLK_SRC				208
+#define GCC_USB30_SEC_MOCK_UTMI_CLK				209
+#define GCC_USB30_SEC_MOCK_UTMI_CLK_SRC				210
+#define GCC_USB30_SEC_SLEEP_CLK					211
+#define GCC_USB3_MP_PHY_AUX_CLK					212
+#define GCC_USB3_MP_PHY_AUX_CLK_SRC				213
+#define GCC_USB3_MP_PHY_COM_AUX_CLK				214
+#define GCC_USB3_MP_PHY_PIPE_0_CLK				215
+#define GCC_USB3_MP_PHY_PIPE_1_CLK				216
+#define GCC_USB3_PRIM_PHY_AUX_CLK				217
+#define GCC_USB3_PRIM_PHY_AUX_CLK_SRC				218
+#define GCC_USB3_PRIM_PHY_COM_AUX_CLK				219
+#define GCC_USB3_PRIM_PHY_PIPE_CLK				220
+#define GCC_USB3_SEC_PHY_AUX_CLK				221
+#define GCC_USB3_SEC_PHY_AUX_CLK_SRC				222
+#define GCC_USB3_SEC_PHY_COM_AUX_CLK				223
+#define GCC_USB3_SEC_PHY_PIPE_CLK				224
+#define GCC_VIDEO_AXI0_CLK					225
+#define GCC_VIDEO_AXI1_CLK					226
+#define GCC_VIDEO_AXIC_CLK					227
+#define GPLL0							228
+#define GPLL0_OUT_EVEN						229
+#define GPLL1							230
+#define GPLL4							231
+#define GPLL7							232
+#define GCC_PCIE_0_CLKREF_CLK					233
+#define GCC_PCIE_1_CLKREF_CLK					234
+#define GCC_PCIE_2_CLKREF_CLK					235
+#define GCC_PCIE_3_CLKREF_CLK					236
+#define GCC_USB3_PRIM_CLKREF_CLK				237
+#define GCC_USB3_SEC_CLKREF_CLK					238
+
+#define GCC_EMAC_BCR						0
+#define GCC_GPU_BCR						1
+#define GCC_MMSS_BCR						2
+#define GCC_NPU_BCR						3
+#define GCC_PCIE_0_BCR						4
+#define GCC_PCIE_0_PHY_BCR					5
+#define GCC_PCIE_1_BCR						6
+#define GCC_PCIE_1_PHY_BCR					7
+#define GCC_PCIE_2_BCR						8
+#define GCC_PCIE_2_PHY_BCR					9
+#define GCC_PCIE_3_BCR						10
+#define GCC_PCIE_3_PHY_BCR					11
+#define GCC_PCIE_PHY_BCR					12
+#define GCC_PDM_BCR						13
+#define GCC_PRNG_BCR						14
+#define GCC_QSPI_1_BCR						15
+#define GCC_QSPI_BCR						16
+#define GCC_QUPV3_WRAPPER_0_BCR					17
+#define GCC_QUPV3_WRAPPER_1_BCR					18
+#define GCC_QUPV3_WRAPPER_2_BCR					19
+#define GCC_QUSB2PHY_5_BCR					20
+#define GCC_QUSB2PHY_MP0_BCR					21
+#define GCC_QUSB2PHY_MP1_BCR					22
+#define GCC_QUSB2PHY_PRIM_BCR					23
+#define GCC_QUSB2PHY_SEC_BCR					24
+#define GCC_USB3_PHY_PRIM_SP0_BCR				25
+#define GCC_USB3_PHY_PRIM_SP1_BCR				26
+#define GCC_USB3_DP_PHY_PRIM_SP0_BCR				27
+#define GCC_USB3_DP_PHY_PRIM_SP1_BCR				28
+#define GCC_USB3_PHY_SEC_BCR					29
+#define GCC_USB3PHY_PHY_SEC_BCR					30
+#define GCC_SDCC2_BCR						31
+#define GCC_SDCC4_BCR						32
+#define GCC_TSIF_BCR						33
+#define GCC_UFS_CARD_2_BCR					34
+#define GCC_UFS_CARD_BCR					35
+#define GCC_UFS_PHY_BCR						36
+#define GCC_USB30_MP_BCR					37
+#define GCC_USB30_PRIM_BCR					38
+#define GCC_USB30_SEC_BCR					39
+#define GCC_USB_PHY_CFG_AHB2PHY_BCR				40
+#define GCC_VIDEO_AXIC_CLK_BCR					41
+#define GCC_VIDEO_AXI0_CLK_BCR					42
+#define GCC_VIDEO_AXI1_CLK_BCR					43
+#define GCC_USB3_DP_PHY_SEC_BCR					44
+
+/* GCC GDSCRs */
+#define EMAC_GDSC						0
+#define PCIE_0_GDSC						1
+#define PCIE_1_GDSC						2
+#define PCIE_2_GDSC						3
+#define PCIE_3_GDSC						4
+#define UFS_CARD_2_GDSC						5
+#define UFS_CARD_GDSC						6
+#define UFS_PHY_GDSC						7
+#define USB30_MP_GDSC						8
+#define USB30_PRIM_GDSC						9
+#define USB30_SEC_GDSC						10
+
+#endif
-- 
2.29.2

