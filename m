Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09AE23A09F4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jun 2021 04:22:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232103AbhFICYs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Jun 2021 22:24:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232565AbhFICYs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Jun 2021 22:24:48 -0400
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E733C0617A8
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Jun 2021 19:22:54 -0700 (PDT)
Received: by mail-qt1-x82e.google.com with SMTP id p21so5146095qtw.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jun 2021 19:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=15CdY0r5RnxftkFZJ6yhdJWHPVIzarpaUkI6fo0sN8U=;
        b=Gh1INC/ZuAFqHbFIVwJLH027TUdIsa9wkgOqZth2FgceEpQD/IOsqwNmEAlI88V+b2
         l9K/tfNVh1NeQREfuzDSXal2BqWlmnawKMdO5c4zSlMAobqYBBaDJiG07TDc41yzPFZY
         Jwjjgfuv+5HCY+PSbt49oScnWAijaZT8v7joG305GXnybn/aS6E3I+MJ4/zQ9zh/J3AW
         usupaDtffOjAnJM/l6aSkZzh3RmpTOKf1o/Sn8D6Tqj7F+yZuRDApePEUIoGKyIUiVkY
         /4NInJnvln2BEfrt0kt6qtl4PGmPbCDu21ywUsN+eA2d3Yhn0aTQIwrIWhx0w8n+VSiu
         DSjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=15CdY0r5RnxftkFZJ6yhdJWHPVIzarpaUkI6fo0sN8U=;
        b=MKWDrU47sXYgi5AFeShfIKgGwlGst60qTvTZLG3NpD7z4swhaY2nCUpTybbTyeCXk+
         6Yv6ZyajriH4cShd323aXqPd4TK3XeqEKX5lWzhlNCozK2RhZ6u4w76TH767oYkwVHMj
         RJMykVr+10mCQJT1jUgK2RRSloOhiZ5s50EH3nKCcnjavBErmH3woyKtuyJWKARxt4GW
         EC1o98mT3LVTkg2KGD8qatxxPNd4laL1cfQHl6kDjerPECJoHDSDROkof9zWMqIn4DG1
         AmMEN3PsREeG69vk2fMK/kwBfSt2CmY/w65uYFowrPpqtp8k8d17KEaBr3y9uyFlg0iN
         lo2w==
X-Gm-Message-State: AOAM531K6vHW7R2+KxUUla6yaMGM2QImM3dL2StcB1roOnvH6c0yWhEz
        NJ7WMTNgzmYZY7BELakxuF+0t1S1dIhFPfR9+ElwKg==
X-Google-Smtp-Source: ABdhPJz4qgAr/+xk+3/cMiRADKD4dDhJEAaQvHrwhv1HgBZ+D2JTxPdOAzlxUjr+AJTFSNwgnAXwcQ==
X-Received: by 2002:a05:622a:104b:: with SMTP id f11mr7685024qte.220.1623205373346;
        Tue, 08 Jun 2021 19:22:53 -0700 (PDT)
Received: from localhost.localdomain (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
        by smtp.gmail.com with ESMTPSA id h6sm7004657qtr.73.2021.06.08.19.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 19:22:53 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     robert.foss@linaro.org, andrey.konovalov@linaro.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 2/3] dt-bindings: clock: add QCOM SM8250 camera clock bindings
Date:   Tue,  8 Jun 2021 22:20:47 -0400
Message-Id: <20210609022051.2171-3-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210609022051.2171-1-jonathan@marek.ca>
References: <20210609022051.2171-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add device tree bindings for camera clock controller for
Qualcomm Technology Inc's SM8250 SoC.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 .../bindings/clock/qcom,camcc-sm8250.yaml     |  68 +++++++++
 include/dt-bindings/clock/qcom,camcc-sm8250.h | 138 ++++++++++++++++++
 2 files changed, 206 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,camcc-sm8250.yaml
 create mode 100644 include/dt-bindings/clock/qcom,camcc-sm8250.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,camcc-sm8250.yaml b/Documentation/devicetree/bindings/clock/qcom,camcc-sm8250.yaml
new file mode 100644
index 0000000000000..9f239c3960d1d
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,camcc-sm8250.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,camcc-sm8250.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Camera Clock & Reset Controller Binding for SM8250
+
+maintainers:
+  - Jonathan Marek <jonathan@marek.ca>
+
+description: |
+  Qualcomm camera clock control module which supports the clocks, resets and
+  power domains on SM8250.
+
+  See also dt-bindings/clock/qcom,camcc-sm8250.h
+
+properties:
+  compatible:
+    const: qcom,sm8250-camcc
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: Sleep clock source
+
+  clock-names:
+    items:
+      - const: bi_tcxo
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
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - '#clock-cells'
+  - '#reset-cells'
+  - '#power-domain-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    clock-controller@ad00000 {
+      compatible = "qcom,sm8250-camcc";
+      reg = <0x0ad00000 0x10000>;
+      clocks = <&rpmhcc RPMH_CXO_CLK>,
+               <&sleep_clk>;
+      clock-names = "bi_tcxo", "sleep_clk";
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+      #power-domain-cells = <1>;
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,camcc-sm8250.h b/include/dt-bindings/clock/qcom,camcc-sm8250.h
new file mode 100644
index 0000000000000..383ead17608da
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,camcc-sm8250.h
@@ -0,0 +1,138 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2018-2021, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_CAM_CC_SM8250_H
+#define _DT_BINDINGS_CLK_QCOM_CAM_CC_SM8250_H
+
+/* CAM_CC clocks */
+#define CAM_CC_BPS_AHB_CLK		0
+#define CAM_CC_BPS_AREG_CLK		1
+#define CAM_CC_BPS_AXI_CLK		2
+#define CAM_CC_BPS_CLK			3
+#define CAM_CC_BPS_CLK_SRC		4
+#define CAM_CC_CAMNOC_AXI_CLK		5
+#define CAM_CC_CAMNOC_AXI_CLK_SRC	6
+#define CAM_CC_CAMNOC_DCD_XO_CLK	7
+#define CAM_CC_CCI_0_CLK		8
+#define CAM_CC_CCI_0_CLK_SRC		9
+#define CAM_CC_CCI_1_CLK		10
+#define CAM_CC_CCI_1_CLK_SRC		11
+#define CAM_CC_CORE_AHB_CLK		12
+#define CAM_CC_CPAS_AHB_CLK		13
+#define CAM_CC_CPHY_RX_CLK_SRC		14
+#define CAM_CC_CSI0PHYTIMER_CLK		15
+#define CAM_CC_CSI0PHYTIMER_CLK_SRC	16
+#define CAM_CC_CSI1PHYTIMER_CLK		17
+#define CAM_CC_CSI1PHYTIMER_CLK_SRC	18
+#define CAM_CC_CSI2PHYTIMER_CLK		19
+#define CAM_CC_CSI2PHYTIMER_CLK_SRC	20
+#define CAM_CC_CSI3PHYTIMER_CLK		21
+#define CAM_CC_CSI3PHYTIMER_CLK_SRC	22
+#define CAM_CC_CSI4PHYTIMER_CLK		23
+#define CAM_CC_CSI4PHYTIMER_CLK_SRC	24
+#define CAM_CC_CSI5PHYTIMER_CLK		25
+#define CAM_CC_CSI5PHYTIMER_CLK_SRC	26
+#define CAM_CC_CSIPHY0_CLK		27
+#define CAM_CC_CSIPHY1_CLK		28
+#define CAM_CC_CSIPHY2_CLK		29
+#define CAM_CC_CSIPHY3_CLK		30
+#define CAM_CC_CSIPHY4_CLK		31
+#define CAM_CC_CSIPHY5_CLK		32
+#define CAM_CC_FAST_AHB_CLK_SRC		33
+#define CAM_CC_FD_CORE_CLK		34
+#define CAM_CC_FD_CORE_CLK_SRC		35
+#define CAM_CC_FD_CORE_UAR_CLK		36
+#define CAM_CC_GDSC_CLK			37
+#define CAM_CC_ICP_AHB_CLK		38
+#define CAM_CC_ICP_CLK			39
+#define CAM_CC_ICP_CLK_SRC		40
+#define CAM_CC_IFE_0_AHB_CLK		41
+#define CAM_CC_IFE_0_AREG_CLK		42
+#define CAM_CC_IFE_0_AXI_CLK		43
+#define CAM_CC_IFE_0_CLK		44
+#define CAM_CC_IFE_0_CLK_SRC		45
+#define CAM_CC_IFE_0_CPHY_RX_CLK	46
+#define CAM_CC_IFE_0_CSID_CLK		47
+#define CAM_CC_IFE_0_CSID_CLK_SRC	48
+#define CAM_CC_IFE_0_DSP_CLK		49
+#define CAM_CC_IFE_1_AHB_CLK		50
+#define CAM_CC_IFE_1_AREG_CLK		51
+#define CAM_CC_IFE_1_AXI_CLK		52
+#define CAM_CC_IFE_1_CLK		53
+#define CAM_CC_IFE_1_CLK_SRC		54
+#define CAM_CC_IFE_1_CPHY_RX_CLK	55
+#define CAM_CC_IFE_1_CSID_CLK		56
+#define CAM_CC_IFE_1_CSID_CLK_SRC	57
+#define CAM_CC_IFE_1_DSP_CLK		58
+#define CAM_CC_IFE_LITE_AHB_CLK		59
+#define CAM_CC_IFE_LITE_AXI_CLK		60
+#define CAM_CC_IFE_LITE_CLK		61
+#define CAM_CC_IFE_LITE_CLK_SRC		62
+#define CAM_CC_IFE_LITE_CPHY_RX_CLK	63
+#define CAM_CC_IFE_LITE_CSID_CLK	64
+#define CAM_CC_IFE_LITE_CSID_CLK_SRC	65
+#define CAM_CC_IPE_0_AHB_CLK		66
+#define CAM_CC_IPE_0_AREG_CLK		67
+#define CAM_CC_IPE_0_AXI_CLK		68
+#define CAM_CC_IPE_0_CLK		69
+#define CAM_CC_IPE_0_CLK_SRC		70
+#define CAM_CC_JPEG_CLK			71
+#define CAM_CC_JPEG_CLK_SRC		72
+#define CAM_CC_MCLK0_CLK		73
+#define CAM_CC_MCLK0_CLK_SRC		74
+#define CAM_CC_MCLK1_CLK		75
+#define CAM_CC_MCLK1_CLK_SRC		76
+#define CAM_CC_MCLK2_CLK		77
+#define CAM_CC_MCLK2_CLK_SRC		78
+#define CAM_CC_MCLK3_CLK		79
+#define CAM_CC_MCLK3_CLK_SRC		80
+#define CAM_CC_MCLK4_CLK		81
+#define CAM_CC_MCLK4_CLK_SRC		82
+#define CAM_CC_MCLK5_CLK		83
+#define CAM_CC_MCLK5_CLK_SRC		84
+#define CAM_CC_MCLK6_CLK		85
+#define CAM_CC_MCLK6_CLK_SRC		86
+#define CAM_CC_PLL0			87
+#define CAM_CC_PLL0_OUT_EVEN		88
+#define CAM_CC_PLL0_OUT_ODD		89
+#define CAM_CC_PLL1			90
+#define CAM_CC_PLL1_OUT_EVEN		91
+#define CAM_CC_PLL2			92
+#define CAM_CC_PLL2_OUT_MAIN		93
+#define CAM_CC_PLL3			94
+#define CAM_CC_PLL3_OUT_EVEN		95
+#define CAM_CC_PLL4			96
+#define CAM_CC_PLL4_OUT_EVEN		97
+#define CAM_CC_SBI_AHB_CLK		98
+#define CAM_CC_SBI_AXI_CLK		99
+#define CAM_CC_SBI_CLK			100
+#define CAM_CC_SBI_CPHY_RX_CLK		101
+#define CAM_CC_SBI_CSID_CLK		102
+#define CAM_CC_SBI_CSID_CLK_SRC		103
+#define CAM_CC_SBI_DIV_CLK_SRC		104
+#define CAM_CC_SBI_IFE_0_CLK		105
+#define CAM_CC_SBI_IFE_1_CLK		106
+#define CAM_CC_SLEEP_CLK		107
+#define CAM_CC_SLEEP_CLK_SRC		108
+#define CAM_CC_SLOW_AHB_CLK_SRC		109
+#define CAM_CC_XO_CLK_SRC		110
+
+/* CAM_CC resets */
+#define CAM_CC_BPS_BCR			0
+#define CAM_CC_ICP_BCR			1
+#define CAM_CC_IFE_0_BCR		2
+#define CAM_CC_IFE_1_BCR		3
+#define CAM_CC_IPE_0_BCR		4
+#define CAM_CC_SBI_BCR			5
+
+/* CAM_CC GDSCRs */
+#define BPS_GDSC			0
+#define IPE_0_GDSC			1
+#define SBI_GDSC			2
+#define IFE_0_GDSC			3
+#define IFE_1_GDSC			4
+#define TITAN_TOP_GDSC			5
+
+#endif
-- 
2.26.1

