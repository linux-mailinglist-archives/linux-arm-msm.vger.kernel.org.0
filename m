Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B128270D692
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 May 2023 10:03:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235783AbjEWIDh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 May 2023 04:03:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235459AbjEWIDg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 May 2023 04:03:36 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B758E66
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 01:03:02 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-50be17a1eceso1002605a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 01:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684828866; x=1687420866;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V6UYCV2JDfzsNJnmS3Bbj17NdMSkLSS7S4V5QFNcT+Q=;
        b=QczuKZBywe/LU71fI5SIgDLkr3VsmL+fsClXZkaABp8dcyCQ/E6DpV0tMP8unJUhP5
         OEWAzcWK9qvfSdpg5RI7Dx95lgv6HQsCPSWlp1FRhGzH9wCiQPnLJtDwW96RYj6y3rRI
         GTwlIV1MAB/1JKdUCPyh65Fi+GTLQRG1YhnJ/H8/BrNTueP4EgyCD5BDNWdk4OL22rpt
         8iHHerG+3QA+fcEKBdv2pCfJsOXhISetD0uNTe0eD5+FKnIdHIDhnp39o5b5JU81pZY5
         3+KgTimobh9MLtAjO6GmaSc7xe7+QLa8KYsPKOa9IboQbNotWxLH2/8EqsK3sOO0bWwW
         uaaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684828866; x=1687420866;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V6UYCV2JDfzsNJnmS3Bbj17NdMSkLSS7S4V5QFNcT+Q=;
        b=EgPro95Pr22I6e+NVJyKhp2GaNSje/kAGd71ZPSjFwhMGAHHi+bwx4shXlBa3zjtca
         NSQFGr5Q9LpUJS5IpH/RLYIGtszGtft+2hJzsXtLtPMsrrsQtEGHzmNZjFvldMu4Sj9I
         O3fkrafDEj3ebrOJk6Wu+T+ConC9VCIO3pXVHbdAsKCp+NoZkiARKzumaj46lvGiR1NG
         eMMbsah0ZsreGsenzfFqVkosTJdICQbEQp/e1RP8owzuYaGLSBU0zgzoaK7nr7nfwNS4
         iCKpFJE5AH+jLNCqPnG24CNWTYI1dzeso2qtnr7fQ3exKLmijOW7ohNfeWc8ZDC4FKQT
         imKw==
X-Gm-Message-State: AC+VfDyxXeR4SQiRf1Ptw5KcryoOokQApRpg+6X9OB6VNCsW9UvoXABO
        2rkgZGBbOiEcE2o4qljd5Jc4zM0ax4N9Yx8zEJo=
X-Google-Smtp-Source: ACHHUZ6NPTXmi51AZqEK19gDPZXXTOVFjqfqD4alGPL4WvXtO9ef+rLe+IFhMObmNpAx6tr4DG6O3g==
X-Received: by 2002:ac2:52ad:0:b0:4f3:87d7:f7a4 with SMTP id r13-20020ac252ad000000b004f387d7f7a4mr4126071lfm.62.1684828013648;
        Tue, 23 May 2023 00:46:53 -0700 (PDT)
Received: from [192.168.1.101] (abyk138.neoplus.adsl.tpnet.pl. [83.9.30.138])
        by smtp.gmail.com with ESMTPSA id t9-20020ac25489000000b004eb0c51780bsm1257070lfk.29.2023.05.23.00.46.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 00:46:53 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 23 May 2023 09:46:16 +0200
Subject: [PATCH v5 05/12] dt-bindings: display/msm: Add SM6375 MDSS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230411-topic-straitlagoon_mdss-v5-5-998b4d2f7dd1@linaro.org>
References: <20230411-topic-straitlagoon_mdss-v5-0-998b4d2f7dd1@linaro.org>
In-Reply-To: <20230411-topic-straitlagoon_mdss-v5-0-998b4d2f7dd1@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684828003; l=7042;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=ue7+w9cyuFPdfGbv/PRzJm40XzZEvHOKg8S5H0i+ojw=;
 b=3jNzrMwFnLFNRUsaFHmHuJWV7rcfLH0iyYSmv67jmeb8Jcx0ojkH2WdbzX3guA+98EYnfyeez
 zhIE83O8keQDtZo2cMkzf7IEjRdr7x8esa3GhnH4vo8GDOy31n5wjX3
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Document the SM6375 MDSS.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../bindings/display/msm/qcom,sm6375-mdss.yaml     | 216 +++++++++++++++++++++
 1 file changed, 216 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6375-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6375-mdss.yaml
new file mode 100644
index 000000000000..3aa4f0470c95
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6375-mdss.yaml
@@ -0,0 +1,216 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/qcom,sm6375-mdss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SM6375 Display MDSS
+
+maintainers:
+  - Konrad Dybcio <konrad.dybcio@linaro.org>
+
+description:
+  SM6375 MSM Mobile Display Subsystem (MDSS), which encapsulates sub-blocks
+  like DPU display controller, DSI and DP interfaces etc.
+
+$ref: /schemas/display/msm/mdss-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: qcom,sm6375-mdss
+
+  clocks:
+    items:
+      - description: Display AHB clock from gcc
+      - description: Display AHB clock
+      - description: Display core clock
+
+  clock-names:
+    items:
+      - const: iface
+      - const: ahb
+      - const: core
+
+  iommus:
+    maxItems: 1
+
+  interconnects:
+    maxItems: 2
+
+  interconnect-names:
+    maxItems: 2
+
+patternProperties:
+  "^display-controller@[0-9a-f]+$":
+    type: object
+    properties:
+      compatible:
+        const: qcom,sm6375-dpu
+
+  "^dsi@[0-9a-f]+$":
+    type: object
+    properties:
+      compatible:
+        items:
+          - const: qcom,sm6375-dsi-ctrl
+          - const: qcom,mdss-dsi-ctrl
+
+  "^phy@[0-9a-f]+$":
+    type: object
+    properties:
+      compatible:
+        const: qcom,sm6375-dsi-phy-7nm
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmcc.h>
+    #include <dt-bindings/clock/qcom,sm6375-gcc.h>
+    #include <dt-bindings/clock/qcom,sm6375-dispcc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    display-subsystem@5e00000 {
+        compatible = "qcom,sm6375-mdss";
+        reg = <0x05e00000 0x1000>;
+        reg-names = "mdss";
+
+        power-domains = <&dispcc MDSS_GDSC>;
+
+        clocks = <&gcc GCC_DISP_AHB_CLK>,
+                 <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                 <&dispcc DISP_CC_MDSS_MDP_CLK>;
+        clock-names = "iface", "ahb", "core";
+
+        interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-controller;
+        #interrupt-cells = <1>;
+
+        iommus = <&apps_smmu 0x820 0x2>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+
+        display-controller@5e01000 {
+            compatible = "qcom,sm6375-dpu";
+            reg = <0x05e01000 0x8e030>,
+                  <0x05eb0000 0x2008>;
+            reg-names = "mdp", "vbif";
+
+            clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
+                     <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                     <&dispcc DISP_CC_MDSS_ROT_CLK>,
+                     <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
+                     <&dispcc DISP_CC_MDSS_MDP_CLK>,
+                     <&dispcc DISP_CC_MDSS_VSYNC_CLK>,
+                     <&gcc GCC_DISP_THROTTLE_CORE_CLK>;
+            clock-names = "bus",
+                          "iface",
+                          "rot",
+                          "lut",
+                          "core",
+                          "vsync",
+                          "throttle";
+
+            assigned-clocks = <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+            assigned-clock-rates = <19200000>;
+
+            operating-points-v2 = <&mdp_opp_table>;
+            power-domains = <&rpmpd SM6375_VDDCX>;
+
+            interrupt-parent = <&mdss>;
+            interrupts = <0>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    dpu_intf1_out: endpoint {
+                        remote-endpoint = <&dsi0_in>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                    dpu_intf2_out: endpoint {
+                        remote-endpoint = <&dsi1_in>;
+                    };
+                };
+            };
+        };
+
+        dsi@5e94000 {
+            compatible = "qcom,sm6375-dsi-ctrl", "qcom,mdss-dsi-ctrl";
+            reg = <0x05e94000 0x400>;
+            reg-names = "dsi_ctrl";
+
+            interrupt-parent = <&mdss>;
+            interrupts = <4>;
+
+            clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
+                     <&dispcc DISP_CC_MDSS_BYTE0_INTF_CLK>,
+                     <&dispcc DISP_CC_MDSS_PCLK0_CLK>,
+                     <&dispcc DISP_CC_MDSS_ESC0_CLK>,
+                     <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                     <&gcc GCC_DISP_HF_AXI_CLK>;
+            clock-names = "byte",
+                          "byte_intf",
+                          "pixel",
+                          "core",
+                          "iface",
+                          "bus";
+
+            assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>,
+                              <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
+            assigned-clock-parents = <&mdss_dsi0_phy 0>, <&mdss_dsi0_phy 1>;
+
+            operating-points-v2 = <&dsi_opp_table>;
+            power-domains = <&rpmpd SM6375_VDDMX>;
+
+            phys = <&mdss_dsi0_phy>;
+            phy-names = "dsi";
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    dsi0_in: endpoint {
+                        remote-endpoint = <&dpu_intf1_out>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                    dsi0_out: endpoint {
+                    };
+                };
+            };
+        };
+
+        mdss_dsi0_phy: phy@5e94400 {
+            compatible = "qcom,sm6375-dsi-phy-7nm";
+            reg = <0x05e94400 0x200>,
+                  <0x05e94600 0x280>,
+                  <0x05e94900 0x264>;
+            reg-names = "dsi_phy",
+                        "dsi_phy_lane",
+                        "dsi_pll";
+
+            #clock-cells = <1>;
+            #phy-cells = <0>;
+
+            clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                     <&rpmcc RPM_SMD_XO_CLK_SRC>;
+            clock-names = "iface", "ref";
+        };
+    };
+...

-- 
2.40.1

