Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F1585B2681
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Sep 2022 21:10:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231381AbiIHTKx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Sep 2022 15:10:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231683AbiIHTKt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Sep 2022 15:10:49 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE4F7EC74E
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Sep 2022 12:10:47 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id bt10so29375945lfb.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Sep 2022 12:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=HVdq341qc5+icZx6rJfG+sKbXnffr8dv2xqJ2y1f0E8=;
        b=SqKHS3qC6dKqqz0SZ4QhMD7170tMi4hsxcqso6PGEktsIi/iscLUcEDhf0HVmQ6GTY
         0yYAFJODsR7dL8gI2clZA840HeMU7qf6uHHiFGNiPKNqUcPcNKD0ewfXbBxur1ZUbM+Q
         fBG6LCag9ORGIgA/Q3vtCGUn1XNW8DqjTgujF45L6PFzbyyFU4eGSvmxbmsqNtmO1VX6
         hN0gtpL1jFABUFpAA0ye1VahAdWHmaZKVW4Zj8gI0+i751Rtt9RPzixq2aRFcprGkzPL
         ArCbTn+p3SDntQbnvWEgxK8T+x4645zrjwirRmwyxadV8rH0lGVhNMsdftt2FZbHl0QZ
         ugXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=HVdq341qc5+icZx6rJfG+sKbXnffr8dv2xqJ2y1f0E8=;
        b=l5EzRg5M0d2ZwZizswhycdOqzWus+Zo02XlTEYVTwPKfE+UWYzOiFPxYniNpz1wgDs
         25MfbqDXfKc9WkUG/Hn8ipQGkYWjAjLlNh8tNXUzpKrWcyLggF0Dl908kX2e5cS+R/md
         a1JAlGKjFTL6HQTWVvzHe5OB9m45X4MWW031gwp0jGli0Y0ERYJvEz2hDLC4bZF5Q1Kh
         TuJ5OKJRqU3XhagNrzUZPlZU4XkO4Laq3g47h55YU783DHh/wRM+vlN8oAPGXizDFsD7
         gay9p0wFcJ+8BUaLZ5dYB8nht+Eo+yfMPRtWto6I9XPERxWZ6WtoeSDYh45k0cFDcvrG
         2FEQ==
X-Gm-Message-State: ACgBeo0AiPbo6SpvHhnVpcqA2pVVWhzEo3zgHZE/vcdDpZwKPFi/QzKA
        hLzrXrMbXi8CrqjEoCkteowBag==
X-Google-Smtp-Source: AA6agR7sEdL8i9AwMALZhwhTf2MNgS+QvLUAm9yEdJI4TItDdHhJTJZBpv1RWLnWIGxuDBTN2w2dTw==
X-Received: by 2002:a05:6512:159b:b0:497:4e2d:35c5 with SMTP id bp27-20020a056512159b00b004974e2d35c5mr3024707lfb.103.1662664246045;
        Thu, 08 Sep 2022 12:10:46 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id v17-20020a2e4811000000b0026ad316375esm634904lja.38.2022.09.08.12.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 12:10:45 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2 1/4] dt-bindings: clock: qcom: add bindings for dispcc on SM8450
Date:   Thu,  8 Sep 2022 22:10:41 +0300
Message-Id: <20220908191044.3538823-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220908191044.3538823-1-dmitry.baryshkov@linaro.org>
References: <20220908191044.3538823-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add device tree bindings for the display clock controller on Qualcomm
SM8450 platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/clock/qcom,sm8450-dispcc.yaml    |  97 +++++++++++++++++
 .../dt-bindings/clock/qcom,sm8450-dispcc.h    | 103 ++++++++++++++++++
 2 files changed, 200 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm8450-dispcc.yaml
 create mode 100644 include/dt-bindings/clock/qcom,sm8450-dispcc.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-dispcc.yaml
new file mode 100644
index 000000000000..7a872750b2c0
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-dispcc.yaml
@@ -0,0 +1,97 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,sm8450-dispcc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Display Clock & Reset Controller Binding for SM8450
+
+maintainers:
+  - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
+
+description: |
+  Qualcomm display clock control module which supports the clocks, resets and
+  power domains on SM8450.
+
+  See also:
+    dt-bindings/clock/qcom,sm8450-dispcc.h
+
+properties:
+  compatible:
+    enum:
+      - qcom,sm8450-dispcc
+
+  clocks:
+    minItems: 3
+    items:
+      - description: Board XO source
+      - description: Board Always On XO source
+      - description: Display's AHB clock
+      - description: sleep clock
+      - description: Byte clock from DSI PHY0
+      - description: Pixel clock from DSI PHY0
+      - description: Byte clock from DSI PHY1
+      - description: Pixel clock from DSI PHY1
+      - description: Link clock from DP PHY0
+      - description: VCO DIV clock from DP PHY0
+      - description: Link clock from DP PHY1
+      - description: VCO DIV clock from DP PHY1
+      - description: Link clock from DP PHY2
+      - description: VCO DIV clock from DP PHY2
+      - description: Link clock from DP PHY3
+      - description: VCO DIV clock from DP PHY3
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
+  power-domains:
+    description:
+      A phandle and PM domain specifier for the MMCX power domain.
+    maxItems: 1
+
+  required-opps:
+    description:
+      A phandle to an OPP node describing required MMCX performance point.
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - '#clock-cells'
+  - '#reset-cells'
+  - '#power-domain-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+    clock-controller@af00000 {
+      compatible = "qcom,sm8450-dispcc";
+      reg = <0x0af00000 0x10000>;
+      clocks = <&rpmhcc RPMH_CXO_CLK>,
+               <&rpmhcc RPMH_CXO_CLK_A>,
+               <&gcc GCC_DISP_AHB_CLK>,
+               <&sleep_clk>,
+               <&dsi0_phy 0>,
+               <&dsi0_phy 1>,
+               <&dsi1_phy 0>,
+               <&dsi1_phy 1>;
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+      #power-domain-cells = <1>;
+      power-domains = <&rpmhpd SM8450_MMCX>;
+      required-opps = <&rpmhpd_opp_low_svs>;
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,sm8450-dispcc.h b/include/dt-bindings/clock/qcom,sm8450-dispcc.h
new file mode 100644
index 000000000000..fd16ca894971
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,sm8450-dispcc.h
@@ -0,0 +1,103 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2022, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_DISP_CC_SM8450_H
+#define _DT_BINDINGS_CLK_QCOM_DISP_CC_SM8450_H
+
+/* DISP_CC clocks */
+#define DISP_CC_MDSS_AHB1_CLK					0
+#define DISP_CC_MDSS_AHB_CLK					1
+#define DISP_CC_MDSS_AHB_CLK_SRC				2
+#define DISP_CC_MDSS_BYTE0_CLK					3
+#define DISP_CC_MDSS_BYTE0_CLK_SRC				4
+#define DISP_CC_MDSS_BYTE0_DIV_CLK_SRC				5
+#define DISP_CC_MDSS_BYTE0_INTF_CLK				6
+#define DISP_CC_MDSS_BYTE1_CLK					7
+#define DISP_CC_MDSS_BYTE1_CLK_SRC				8
+#define DISP_CC_MDSS_BYTE1_DIV_CLK_SRC				9
+#define DISP_CC_MDSS_BYTE1_INTF_CLK				10
+#define DISP_CC_MDSS_DPTX0_AUX_CLK				11
+#define DISP_CC_MDSS_DPTX0_AUX_CLK_SRC				12
+#define DISP_CC_MDSS_DPTX0_CRYPTO_CLK				13
+#define DISP_CC_MDSS_DPTX0_LINK_CLK				14
+#define DISP_CC_MDSS_DPTX0_LINK_CLK_SRC				15
+#define DISP_CC_MDSS_DPTX0_LINK_DIV_CLK_SRC			16
+#define DISP_CC_MDSS_DPTX0_LINK_INTF_CLK			17
+#define DISP_CC_MDSS_DPTX0_PIXEL0_CLK				18
+#define DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC			19
+#define DISP_CC_MDSS_DPTX0_PIXEL1_CLK				20
+#define DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC			21
+#define DISP_CC_MDSS_DPTX0_USB_ROUTER_LINK_INTF_CLK		22
+#define DISP_CC_MDSS_DPTX1_AUX_CLK				23
+#define DISP_CC_MDSS_DPTX1_AUX_CLK_SRC				24
+#define DISP_CC_MDSS_DPTX1_CRYPTO_CLK				25
+#define DISP_CC_MDSS_DPTX1_LINK_CLK				26
+#define DISP_CC_MDSS_DPTX1_LINK_CLK_SRC				27
+#define DISP_CC_MDSS_DPTX1_LINK_DIV_CLK_SRC			28
+#define DISP_CC_MDSS_DPTX1_LINK_INTF_CLK			29
+#define DISP_CC_MDSS_DPTX1_PIXEL0_CLK				30
+#define DISP_CC_MDSS_DPTX1_PIXEL0_CLK_SRC			31
+#define DISP_CC_MDSS_DPTX1_PIXEL1_CLK				32
+#define DISP_CC_MDSS_DPTX1_PIXEL1_CLK_SRC			33
+#define DISP_CC_MDSS_DPTX1_USB_ROUTER_LINK_INTF_CLK		34
+#define DISP_CC_MDSS_DPTX2_AUX_CLK				35
+#define DISP_CC_MDSS_DPTX2_AUX_CLK_SRC				36
+#define DISP_CC_MDSS_DPTX2_CRYPTO_CLK				37
+#define DISP_CC_MDSS_DPTX2_LINK_CLK				38
+#define DISP_CC_MDSS_DPTX2_LINK_CLK_SRC				39
+#define DISP_CC_MDSS_DPTX2_LINK_DIV_CLK_SRC			40
+#define DISP_CC_MDSS_DPTX2_LINK_INTF_CLK			41
+#define DISP_CC_MDSS_DPTX2_PIXEL0_CLK				42
+#define DISP_CC_MDSS_DPTX2_PIXEL0_CLK_SRC			43
+#define DISP_CC_MDSS_DPTX2_PIXEL1_CLK				44
+#define DISP_CC_MDSS_DPTX2_PIXEL1_CLK_SRC			45
+#define DISP_CC_MDSS_DPTX3_AUX_CLK				46
+#define DISP_CC_MDSS_DPTX3_AUX_CLK_SRC				47
+#define DISP_CC_MDSS_DPTX3_CRYPTO_CLK				48
+#define DISP_CC_MDSS_DPTX3_LINK_CLK				49
+#define DISP_CC_MDSS_DPTX3_LINK_CLK_SRC				50
+#define DISP_CC_MDSS_DPTX3_LINK_DIV_CLK_SRC			51
+#define DISP_CC_MDSS_DPTX3_LINK_INTF_CLK			52
+#define DISP_CC_MDSS_DPTX3_PIXEL0_CLK				53
+#define DISP_CC_MDSS_DPTX3_PIXEL0_CLK_SRC			54
+#define DISP_CC_MDSS_ESC0_CLK					55
+#define DISP_CC_MDSS_ESC0_CLK_SRC				56
+#define DISP_CC_MDSS_ESC1_CLK					57
+#define DISP_CC_MDSS_ESC1_CLK_SRC				58
+#define DISP_CC_MDSS_MDP1_CLK					59
+#define DISP_CC_MDSS_MDP_CLK					60
+#define DISP_CC_MDSS_MDP_CLK_SRC				61
+#define DISP_CC_MDSS_MDP_LUT1_CLK				62
+#define DISP_CC_MDSS_MDP_LUT_CLK				63
+#define DISP_CC_MDSS_NON_GDSC_AHB_CLK				64
+#define DISP_CC_MDSS_PCLK0_CLK					65
+#define DISP_CC_MDSS_PCLK0_CLK_SRC				66
+#define DISP_CC_MDSS_PCLK1_CLK					67
+#define DISP_CC_MDSS_PCLK1_CLK_SRC				68
+#define DISP_CC_MDSS_ROT1_CLK					69
+#define DISP_CC_MDSS_ROT_CLK					70
+#define DISP_CC_MDSS_ROT_CLK_SRC				71
+#define DISP_CC_MDSS_RSCC_AHB_CLK				72
+#define DISP_CC_MDSS_RSCC_VSYNC_CLK				73
+#define DISP_CC_MDSS_VSYNC1_CLK					74
+#define DISP_CC_MDSS_VSYNC_CLK					75
+#define DISP_CC_MDSS_VSYNC_CLK_SRC				76
+#define DISP_CC_PLL0						77
+#define DISP_CC_PLL1						78
+#define DISP_CC_SLEEP_CLK					79
+#define DISP_CC_SLEEP_CLK_SRC					80
+#define DISP_CC_XO_CLK						81
+#define DISP_CC_XO_CLK_SRC					82
+
+/* DISP_CC resets */
+#define DISP_CC_MDSS_CORE_BCR					0
+#define DISP_CC_MDSS_CORE_INT2_BCR				1
+#define DISP_CC_MDSS_RSCC_BCR					2
+
+/* DISP_CC GDSCR */
+#define MDSS_GDSC				0
+#define MDSS_INT2_GDSC				1
+
+#endif
-- 
2.35.1

