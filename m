Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7350B290B97
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Oct 2020 20:45:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392832AbgJPSpA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Oct 2020 14:45:00 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:60314 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2392822AbgJPSpA (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Oct 2020 14:45:00 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1602873899; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=0eH+1OgSsXnSb225dAqpRjr5BoBJrFYsU3/Xx7qp2Bg=; b=dUfKHk/gMIOmSFAJDd8gI9xwHod/l7Vln3J93W+Qgn5QUlxPV/EnYus4rK4Bapz/4JRANZOg
 u2UeKTe49FBRqBQP7cUkLFav7ycnBRaSJ8VLrY5+w9dUdfYtiBzStqX9Oy31ENErbcPwawjq
 b1kCR6Zlw1HNS6J9lNroIcODmm4=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 5f89e9f983370fa1c10bcc7a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 16 Oct 2020 18:44:09
 GMT
Sender: tdas=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 26557C43391; Fri, 16 Oct 2020 18:44:09 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from tdas-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id AE4F3C43382;
        Fri, 16 Oct 2020 18:44:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org AE4F3C43382
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=tdas@codeaurora.org
From:   Taniya Das <tdas@codeaurora.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Michael=20Turquette=20=C2=A0?= <mturquette@baylibre.com>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v3 3/4] dt-bindings: clock: Add YAML schemas for the QCOM Camera clock bindings.
Date:   Sat, 17 Oct 2020 00:13:34 +0530
Message-Id: <1602873815-1677-4-git-send-email-tdas@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1602873815-1677-1-git-send-email-tdas@codeaurora.org>
References: <1602873815-1677-1-git-send-email-tdas@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Camera Subsystem clock provider have a bunch of generic properties
that are needed in a device tree. Add a YAML schemas for those.

Add clock ids for camera clocks which are required to bring the camera
subsystem out of reset.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
---
 .../bindings/clock/qcom,sc7180-camcc.yaml          |  73 +++++++++++++
 include/dt-bindings/clock/qcom,camcc-sc7180.h      | 121 +++++++++++++++++++++
 2 files changed, 194 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sc7180-camcc.yaml
 create mode 100644 include/dt-bindings/clock/qcom,camcc-sc7180.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,sc7180-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sc7180-camcc.yaml
new file mode 100644
index 0000000..f49027e
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,sc7180-camcc.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,sc7180-camcc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Camera Clock & Reset Controller Binding for SC7180
+
+maintainers:
+  - Taniya Das <tdas@codeaurora.org>
+
+description: |
+  Qualcomm camera clock control module which supports the clocks, resets and
+  power domains on SC7180.
+
+  See also:
+  - dt-bindings/clock/qcom,camcc-sc7180.h
+
+properties:
+  compatible:
+    const: qcom,sc7180-camcc
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: Camera_ahb clock from GCC
+      - description: Camera XO clock from GCC
+
+  clock-names:
+    items:
+      - const: bi_tcxo
+      - const: iface
+      - const: xo
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
+    #include <dt-bindings/clock/qcom,gcc-sc7180.h>
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    clock-controller@ad00000 {
+      compatible = "qcom,sc7180-camcc";
+      reg = <0x0ad00000 0x10000>;
+      clocks = <&rpmhcc RPMH_CXO_CLK>,
+               <&gcc GCC_CAMERA_AHB_CLK>,
+               <&gcc GCC_CAMERA_XO_CLK>;
+      clock-names = "bi_tcxo", "iface", "xo";
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+      #power-domain-cells = <1>;
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,camcc-sc7180.h b/include/dt-bindings/clock/qcom,camcc-sc7180.h
new file mode 100644
index 0000000..ef7d3a0
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,camcc-sc7180.h
@@ -0,0 +1,121 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2020, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_CAM_CC_SC7180_H
+#define _DT_BINDINGS_CLK_QCOM_CAM_CC_SC7180_H
+
+/* CAM_CC clocks */
+#define CAM_CC_PLL2_OUT_EARLY					0
+#define CAM_CC_PLL0						1
+#define CAM_CC_PLL1						2
+#define CAM_CC_PLL2						3
+#define CAM_CC_PLL2_OUT_AUX					4
+#define CAM_CC_PLL3						5
+#define CAM_CC_CAMNOC_AXI_CLK					6
+#define CAM_CC_CCI_0_CLK					7
+#define CAM_CC_CCI_0_CLK_SRC					8
+#define CAM_CC_CCI_1_CLK					9
+#define CAM_CC_CCI_1_CLK_SRC					10
+#define CAM_CC_CORE_AHB_CLK					11
+#define CAM_CC_CPAS_AHB_CLK					12
+#define CAM_CC_CPHY_RX_CLK_SRC					13
+#define CAM_CC_CSI0PHYTIMER_CLK					14
+#define CAM_CC_CSI0PHYTIMER_CLK_SRC				15
+#define CAM_CC_CSI1PHYTIMER_CLK					16
+#define CAM_CC_CSI1PHYTIMER_CLK_SRC				17
+#define CAM_CC_CSI2PHYTIMER_CLK					18
+#define CAM_CC_CSI2PHYTIMER_CLK_SRC				19
+#define CAM_CC_CSI3PHYTIMER_CLK					20
+#define CAM_CC_CSI3PHYTIMER_CLK_SRC				21
+#define CAM_CC_CSIPHY0_CLK					22
+#define CAM_CC_CSIPHY1_CLK					23
+#define CAM_CC_CSIPHY2_CLK					24
+#define CAM_CC_CSIPHY3_CLK					25
+#define CAM_CC_FAST_AHB_CLK_SRC					26
+#define CAM_CC_ICP_APB_CLK					27
+#define CAM_CC_ICP_ATB_CLK					28
+#define CAM_CC_ICP_CLK						29
+#define CAM_CC_ICP_CLK_SRC					30
+#define CAM_CC_ICP_CTI_CLK					31
+#define CAM_CC_ICP_TS_CLK					32
+#define CAM_CC_IFE_0_AXI_CLK					33
+#define CAM_CC_IFE_0_CLK					34
+#define CAM_CC_IFE_0_CLK_SRC					35
+#define CAM_CC_IFE_0_CPHY_RX_CLK				36
+#define CAM_CC_IFE_0_CSID_CLK					37
+#define CAM_CC_IFE_0_CSID_CLK_SRC				38
+#define CAM_CC_IFE_0_DSP_CLK					39
+#define CAM_CC_IFE_1_AXI_CLK					40
+#define CAM_CC_IFE_1_CLK					41
+#define CAM_CC_IFE_1_CLK_SRC					42
+#define CAM_CC_IFE_1_CPHY_RX_CLK				43
+#define CAM_CC_IFE_1_CSID_CLK					44
+#define CAM_CC_IFE_1_CSID_CLK_SRC				45
+#define CAM_CC_IFE_1_DSP_CLK					46
+#define CAM_CC_IFE_LITE_CLK					47
+#define CAM_CC_IFE_LITE_CLK_SRC					48
+#define CAM_CC_IFE_LITE_CPHY_RX_CLK				49
+#define CAM_CC_IFE_LITE_CSID_CLK				50
+#define CAM_CC_IFE_LITE_CSID_CLK_SRC				51
+#define CAM_CC_IPE_0_AHB_CLK					52
+#define CAM_CC_IPE_0_AREG_CLK					53
+#define CAM_CC_IPE_0_AXI_CLK					54
+#define CAM_CC_IPE_0_CLK					55
+#define CAM_CC_IPE_0_CLK_SRC					56
+#define CAM_CC_JPEG_CLK						57
+#define CAM_CC_JPEG_CLK_SRC					58
+#define CAM_CC_LRME_CLK						59
+#define CAM_CC_LRME_CLK_SRC					60
+#define CAM_CC_MCLK0_CLK					61
+#define CAM_CC_MCLK0_CLK_SRC					62
+#define CAM_CC_MCLK1_CLK					63
+#define CAM_CC_MCLK1_CLK_SRC					64
+#define CAM_CC_MCLK2_CLK					65
+#define CAM_CC_MCLK2_CLK_SRC					66
+#define CAM_CC_MCLK3_CLK					67
+#define CAM_CC_MCLK3_CLK_SRC					68
+#define CAM_CC_MCLK4_CLK					69
+#define CAM_CC_MCLK4_CLK_SRC					70
+#define CAM_CC_BPS_AHB_CLK					71
+#define CAM_CC_BPS_AREG_CLK					72
+#define CAM_CC_BPS_AXI_CLK					73
+#define CAM_CC_BPS_CLK						74
+#define CAM_CC_BPS_CLK_SRC					75
+#define CAM_CC_SLOW_AHB_CLK_SRC					76
+#define CAM_CC_SOC_AHB_CLK					77
+#define CAM_CC_SYS_TMR_CLK					78
+
+/* CAM_CC power domains */
+#define BPS_GDSC						0
+#define IFE_0_GDSC						1
+#define IFE_1_GDSC						2
+#define IPE_0_GDSC						3
+#define TITAN_TOP_GDSC						4
+
+/* CAM_CC resets */
+#define CAM_CC_BPS_BCR						0
+#define CAM_CC_CAMNOC_BCR					1
+#define CAM_CC_CCI_0_BCR					2
+#define CAM_CC_CCI_1_BCR					3
+#define CAM_CC_CPAS_BCR						4
+#define CAM_CC_CSI0PHY_BCR					5
+#define CAM_CC_CSI1PHY_BCR					6
+#define CAM_CC_CSI2PHY_BCR					7
+#define CAM_CC_CSI3PHY_BCR					8
+#define CAM_CC_ICP_BCR						9
+#define CAM_CC_IFE_0_BCR					10
+#define CAM_CC_IFE_1_BCR					11
+#define CAM_CC_IFE_LITE_BCR					12
+#define CAM_CC_IPE_0_BCR					13
+#define CAM_CC_JPEG_BCR						14
+#define CAM_CC_LRME_BCR						15
+#define CAM_CC_MCLK0_BCR					16
+#define CAM_CC_MCLK1_BCR					17
+#define CAM_CC_MCLK2_BCR					18
+#define CAM_CC_MCLK3_BCR					19
+#define CAM_CC_MCLK4_BCR					20
+#define CAM_CC_TITAN_TOP_BCR					21
+
+#endif
--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.

