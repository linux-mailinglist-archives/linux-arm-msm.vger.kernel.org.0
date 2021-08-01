Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23D473DCB2C
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Aug 2021 12:35:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231912AbhHAKfQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 1 Aug 2021 06:35:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231765AbhHAKfO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 1 Aug 2021 06:35:14 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14C2FC06175F;
        Sun,  1 Aug 2021 03:35:06 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id oz16so25896650ejc.7;
        Sun, 01 Aug 2021 03:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1dtsfb4yXRBekCSMvEOa1vRUt///RNqiJjfCJ8QpGbU=;
        b=pjACiLGSCXTJSJv22MBLIM50SjXhplaV8tlIOewPrXPyJy3syZ7iXYUrEnV5d3UzPq
         cvVxjbxw5TA8Rg98/TLXmOQ3RsAPrhnM356v1XXIbhe/OnW8PvaVGYNSBwObpsGwflM9
         bJnbQTfzeE8W78vJare9aOE7JQ9pZ1wlMYFG0TMwiJumkau+n57V/d9y2VFe/5AyLapS
         xlbBvAKjTGKZ6hxHiKHZ12nIv7+fHd3jD3K35Ryt0tjeScXrOGjLj/OmhVTW0QsVhK2w
         MCdw+lqCyduMkMY4y/nWWYPUZC50wOFF15W+G55l4lufO1gWnAjwwbyM3UfSUWZuVeYs
         mQeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1dtsfb4yXRBekCSMvEOa1vRUt///RNqiJjfCJ8QpGbU=;
        b=LuQMtYgNExJYoRuug0lAWPJjXj8pq59e3Vru0KYpw5Zyp8UHbjSvKHijXgP80J+PHg
         wSuOMO903EccXACJ0n8whWxsX5UMzmp4dlelzqUwKxm59RuoXI/uLInjRWhKWRG/qi+j
         Sd9gDzQ99g6AUKnLpvy2iRd0CBLWYQstbxNvGjuI0GUqCQAutSOn43AXfDGoWVRuqjov
         9ksz3giqGnM0fRDR6sMDAFLcs918S+a+28UbD0DL0Tn6hs7cjET2G39IucdDsWTzBWdT
         g9TT8FGc/va9fOyqb/II1d/k/xqegfenzEY2SxF+BOas8OEeuDD0DmGheD/vvYJetl7x
         64cA==
X-Gm-Message-State: AOAM530QGTjtprManlX1JNvavOt+SkUOQxlMTmmVAw5P72FKxn7rVL/k
        uklvvEMjWpcY0wlYvHU51IY=
X-Google-Smtp-Source: ABdhPJyibM+9WfIZoro/oujKgcVvAm9v7kWLqKzV+t6Xa7lG2a9DCaR/gS/vn34fdWfg8PgrTu0dbA==
X-Received: by 2002:a17:906:c447:: with SMTP id ck7mr10780040ejb.18.1627814104650;
        Sun, 01 Aug 2021 03:35:04 -0700 (PDT)
Received: from localhost (178-169-161-196.razgrad.ddns.bulsat.com. [178.169.161.196])
        by smtp.gmail.com with ESMTPSA id bm26sm2877940ejb.16.2021.08.01.03.35.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Aug 2021 03:35:04 -0700 (PDT)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Iskren Chernev <iskren.chernev@gmail.com>
Subject: [PATCH v3 1/2] dt-bindings: clk: qcom: gcc-sm6115: Document SM6115 GCC
Date:   Sun,  1 Aug 2021 13:34:47 +0300
Message-Id: <20210801103448.3329333-2-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210801103448.3329333-1-iskren.chernev@gmail.com>
References: <20210801103448.3329333-1-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add device tree bindings for global clock controller on SM6115 and
SM4250 SoCs (pin and software compatible).

Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
---
 .../bindings/clock/qcom,gcc-sm6115.yaml       |  74 +++++++
 include/dt-bindings/clock/qcom,gcc-sm6115.h   | 201 ++++++++++++++++++
 2 files changed, 275 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-sm6115.yaml
 create mode 100644 include/dt-bindings/clock/qcom,gcc-sm6115.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sm6115.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sm6115.yaml
new file mode 100644
index 000000000000..c8c9eb82b9b4
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sm6115.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,gcc-sm6115.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Global Clock & Reset Controller Binding for SM6115 and SM4250
+
+maintainers:
+  - Iskren Chernev <iskren.chernev@gmail.com>
+
+description: |
+  Qualcomm global clock control module which supports the clocks, resets and
+  power domains on SM4250/6115.
+
+  See also:
+  - dt-bindings/clock/qcom,gcc-sm6115.h
+
+properties:
+  compatible:
+    const: qcom,gcc-sm6115
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: Sleep clock source
+      - description: PLL test clock source (Optional clock)
+
+  clock-names:
+    items:
+      - const: bi_tcxo
+      - const: sleep_clk
+      - const: core_bi_pll_test_se # Optional clock
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
+    #include <dt-bindings/clock/qcom,rpmcc.h>
+    clock-controller@1400000 {
+        compatible = "qcom,gcc-sm6115";
+        reg = <0x01400000 0x1f0000>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+        #power-domain-cells = <1>;
+        clock-names = "bi_tcxo", "sleep_clk";
+        clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>, <&sleep_clk>;
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,gcc-sm6115.h b/include/dt-bindings/clock/qcom,gcc-sm6115.h
new file mode 100644
index 000000000000..b91a7b460433
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,gcc-sm6115.h
@@ -0,0 +1,201 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2019-2021, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GCC_SM6115_H
+#define _DT_BINDINGS_CLK_QCOM_GCC_SM6115_H
+
+/* GCC clocks */
+#define GPLL0							0
+#define GPLL0_OUT_AUX2						1
+#define GPLL0_OUT_MAIN						2
+#define GPLL10							3
+#define GPLL10_OUT_MAIN						4
+#define GPLL11							5
+#define GPLL11_OUT_MAIN						6
+#define GPLL3							7
+#define GPLL4							8
+#define GPLL4_OUT_MAIN						9
+#define GPLL6							10
+#define GPLL6_OUT_MAIN						11
+#define GPLL7							12
+#define GPLL7_OUT_MAIN						13
+#define GPLL8							14
+#define GPLL8_OUT_MAIN						15
+#define GPLL9							16
+#define GPLL9_OUT_MAIN						17
+#define GCC_CAMSS_CSI0PHYTIMER_CLK				18
+#define GCC_CAMSS_CSI0PHYTIMER_CLK_SRC				19
+#define GCC_CAMSS_CSI1PHYTIMER_CLK				20
+#define GCC_CAMSS_CSI1PHYTIMER_CLK_SRC				21
+#define GCC_CAMSS_CSI2PHYTIMER_CLK				22
+#define GCC_CAMSS_CSI2PHYTIMER_CLK_SRC				23
+#define GCC_CAMSS_MCLK0_CLK					24
+#define GCC_CAMSS_MCLK0_CLK_SRC					25
+#define GCC_CAMSS_MCLK1_CLK					26
+#define GCC_CAMSS_MCLK1_CLK_SRC					27
+#define GCC_CAMSS_MCLK2_CLK					28
+#define GCC_CAMSS_MCLK2_CLK_SRC					29
+#define GCC_CAMSS_MCLK3_CLK					30
+#define GCC_CAMSS_MCLK3_CLK_SRC					31
+#define GCC_CAMSS_NRT_AXI_CLK					32
+#define GCC_CAMSS_OPE_AHB_CLK					33
+#define GCC_CAMSS_OPE_AHB_CLK_SRC				34
+#define GCC_CAMSS_OPE_CLK					35
+#define GCC_CAMSS_OPE_CLK_SRC					36
+#define GCC_CAMSS_RT_AXI_CLK					37
+#define GCC_CAMSS_TFE_0_CLK					38
+#define GCC_CAMSS_TFE_0_CLK_SRC					39
+#define GCC_CAMSS_TFE_0_CPHY_RX_CLK				40
+#define GCC_CAMSS_TFE_0_CSID_CLK				41
+#define GCC_CAMSS_TFE_0_CSID_CLK_SRC				42
+#define GCC_CAMSS_TFE_1_CLK					43
+#define GCC_CAMSS_TFE_1_CLK_SRC					44
+#define GCC_CAMSS_TFE_1_CPHY_RX_CLK				45
+#define GCC_CAMSS_TFE_1_CSID_CLK				46
+#define GCC_CAMSS_TFE_1_CSID_CLK_SRC				47
+#define GCC_CAMSS_TFE_2_CLK					48
+#define GCC_CAMSS_TFE_2_CLK_SRC					49
+#define GCC_CAMSS_TFE_2_CPHY_RX_CLK				50
+#define GCC_CAMSS_TFE_2_CSID_CLK				51
+#define GCC_CAMSS_TFE_2_CSID_CLK_SRC				52
+#define GCC_CAMSS_TFE_CPHY_RX_CLK_SRC				53
+#define GCC_CAMSS_TOP_AHB_CLK					54
+#define GCC_CAMSS_TOP_AHB_CLK_SRC				55
+#define GCC_CFG_NOC_USB3_PRIM_AXI_CLK				56
+#define GCC_CPUSS_AHB_CLK					57
+#define GCC_CPUSS_GNOC_CLK					60
+#define GCC_DISP_AHB_CLK					61
+#define GCC_DISP_GPLL0_DIV_CLK_SRC				62
+#define GCC_DISP_HF_AXI_CLK					63
+#define GCC_DISP_THROTTLE_CORE_CLK				64
+#define GCC_DISP_XO_CLK						65
+#define GCC_GP1_CLK						66
+#define GCC_GP1_CLK_SRC						67
+#define GCC_GP2_CLK						68
+#define GCC_GP2_CLK_SRC						69
+#define GCC_GP3_CLK						70
+#define GCC_GP3_CLK_SRC						71
+#define GCC_GPU_CFG_AHB_CLK					72
+#define GCC_GPU_GPLL0_CLK_SRC					73
+#define GCC_GPU_GPLL0_DIV_CLK_SRC				74
+#define GCC_GPU_IREF_CLK					75
+#define GCC_GPU_MEMNOC_GFX_CLK					76
+#define GCC_GPU_SNOC_DVM_GFX_CLK				77
+#define GCC_GPU_THROTTLE_CORE_CLK				78
+#define GCC_GPU_THROTTLE_XO_CLK					79
+#define GCC_PDM2_CLK						80
+#define GCC_PDM2_CLK_SRC					81
+#define GCC_PDM_AHB_CLK						82
+#define GCC_PDM_XO4_CLK						83
+#define GCC_PRNG_AHB_CLK					84
+#define GCC_QMIP_CAMERA_NRT_AHB_CLK				85
+#define GCC_QMIP_CAMERA_RT_AHB_CLK				86
+#define GCC_QMIP_DISP_AHB_CLK					87
+#define GCC_QMIP_GPU_CFG_AHB_CLK				88
+#define GCC_QMIP_VIDEO_VCODEC_AHB_CLK				89
+#define GCC_QUPV3_WRAP0_CORE_2X_CLK				90
+#define GCC_QUPV3_WRAP0_CORE_CLK				91
+#define GCC_QUPV3_WRAP0_S0_CLK					92
+#define GCC_QUPV3_WRAP0_S0_CLK_SRC				93
+#define GCC_QUPV3_WRAP0_S1_CLK					94
+#define GCC_QUPV3_WRAP0_S1_CLK_SRC				95
+#define GCC_QUPV3_WRAP0_S2_CLK					96
+#define GCC_QUPV3_WRAP0_S2_CLK_SRC				97
+#define GCC_QUPV3_WRAP0_S3_CLK					98
+#define GCC_QUPV3_WRAP0_S3_CLK_SRC				99
+#define GCC_QUPV3_WRAP0_S4_CLK					100
+#define GCC_QUPV3_WRAP0_S4_CLK_SRC				101
+#define GCC_QUPV3_WRAP0_S5_CLK					102
+#define GCC_QUPV3_WRAP0_S5_CLK_SRC				103
+#define GCC_QUPV3_WRAP_0_M_AHB_CLK				104
+#define GCC_QUPV3_WRAP_0_S_AHB_CLK				105
+#define GCC_SDCC1_AHB_CLK					106
+#define GCC_SDCC1_APPS_CLK					107
+#define GCC_SDCC1_APPS_CLK_SRC					108
+#define GCC_SDCC1_ICE_CORE_CLK					109
+#define GCC_SDCC1_ICE_CORE_CLK_SRC				110
+#define GCC_SDCC2_AHB_CLK					111
+#define GCC_SDCC2_APPS_CLK					112
+#define GCC_SDCC2_APPS_CLK_SRC					113
+#define GCC_SYS_NOC_CPUSS_AHB_CLK				114
+#define GCC_SYS_NOC_UFS_PHY_AXI_CLK				115
+#define GCC_SYS_NOC_USB3_PRIM_AXI_CLK				116
+#define GCC_UFS_PHY_AHB_CLK					117
+#define GCC_UFS_PHY_AXI_CLK					118
+#define GCC_UFS_PHY_AXI_CLK_SRC					119
+#define GCC_UFS_PHY_ICE_CORE_CLK				120
+#define GCC_UFS_PHY_ICE_CORE_CLK_SRC				121
+#define GCC_UFS_PHY_PHY_AUX_CLK					122
+#define GCC_UFS_PHY_PHY_AUX_CLK_SRC				123
+#define GCC_UFS_PHY_RX_SYMBOL_0_CLK				124
+#define GCC_UFS_PHY_TX_SYMBOL_0_CLK				125
+#define GCC_UFS_PHY_UNIPRO_CORE_CLK				126
+#define GCC_UFS_PHY_UNIPRO_CORE_CLK_SRC				127
+#define GCC_USB30_PRIM_MASTER_CLK				128
+#define GCC_USB30_PRIM_MASTER_CLK_SRC				129
+#define GCC_USB30_PRIM_MOCK_UTMI_CLK				130
+#define GCC_USB30_PRIM_MOCK_UTMI_CLK_SRC			131
+#define GCC_USB30_PRIM_MOCK_UTMI_POSTDIV_CLK_SRC		132
+#define GCC_USB30_PRIM_SLEEP_CLK				133
+#define GCC_USB3_PRIM_CLKREF_CLK				134
+#define GCC_USB3_PRIM_PHY_AUX_CLK_SRC				135
+#define GCC_USB3_PRIM_PHY_COM_AUX_CLK				136
+#define GCC_USB3_PRIM_PHY_PIPE_CLK				137
+#define GCC_VCODEC0_AXI_CLK					138
+#define GCC_VENUS_AHB_CLK					139
+#define GCC_VENUS_CTL_AXI_CLK					140
+#define GCC_VIDEO_AHB_CLK					141
+#define GCC_VIDEO_AXI0_CLK					142
+#define GCC_VIDEO_THROTTLE_CORE_CLK				143
+#define GCC_VIDEO_VCODEC0_SYS_CLK				144
+#define GCC_VIDEO_VENUS_CLK_SRC					145
+#define GCC_VIDEO_VENUS_CTL_CLK					146
+#define GCC_VIDEO_XO_CLK					147
+#define GCC_AHB2PHY_CSI_CLK					148
+#define GCC_AHB2PHY_USB_CLK					149
+#define GCC_BIMC_GPU_AXI_CLK					150
+#define GCC_BOOT_ROM_AHB_CLK					151
+#define GCC_CAM_THROTTLE_NRT_CLK				152
+#define GCC_CAM_THROTTLE_RT_CLK					153
+#define GCC_CAMERA_AHB_CLK					154
+#define GCC_CAMERA_XO_CLK					155
+#define GCC_CAMSS_AXI_CLK					156
+#define GCC_CAMSS_AXI_CLK_SRC					157
+#define GCC_CAMSS_CAMNOC_ATB_CLK				158
+#define GCC_CAMSS_CAMNOC_NTS_XO_CLK				159
+#define GCC_CAMSS_CCI_0_CLK					160
+#define GCC_CAMSS_CCI_CLK_SRC					161
+#define GCC_CAMSS_CPHY_0_CLK					162
+#define GCC_CAMSS_CPHY_1_CLK					163
+#define GCC_CAMSS_CPHY_2_CLK					164
+#define GCC_UFS_CLKREF_CLK					165
+#define GCC_DISP_GPLL0_CLK_SRC					166
+
+/* GCC resets */
+#define GCC_QUSB2PHY_PRIM_BCR					0
+#define GCC_QUSB2PHY_SEC_BCR					1
+#define GCC_SDCC1_BCR						2
+#define GCC_UFS_PHY_BCR						3
+#define GCC_USB30_PRIM_BCR					4
+#define GCC_USB_PHY_CFG_AHB2PHY_BCR				5
+#define GCC_VCODEC0_BCR						6
+#define GCC_VENUS_BCR						7
+#define GCC_VIDEO_INTERFACE_BCR					8
+#define GCC_USB3PHY_PHY_PRIM_SP0_BCR				9
+#define GCC_USB3_PHY_PRIM_SP0_BCR				10
+#define GCC_SDCC2_BCR						11
+
+/* Indexes for GDSCs */
+#define GCC_CAMSS_TOP_GDSC			0
+#define GCC_UFS_PHY_GDSC			1
+#define GCC_USB30_PRIM_GDSC			2
+#define GCC_VCODEC0_GDSC			3
+#define GCC_VENUS_GDSC				4
+#define HLOS1_VOTE_TURING_MMU_TBU1_GDSC		5
+#define HLOS1_VOTE_TURING_MMU_TBU0_GDSC		6
+#define HLOS1_VOTE_MM_SNOC_MMU_TBU_RT_GDSC	7
+#define HLOS1_VOTE_MM_SNOC_MMU_TBU_NRT_GDSC	8
+
+#endif
-- 
2.32.0

