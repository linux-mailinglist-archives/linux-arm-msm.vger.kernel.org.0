Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F9C3629723
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Nov 2022 12:18:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232672AbiKOLSp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Nov 2022 06:18:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229930AbiKOLSH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Nov 2022 06:18:07 -0500
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A471E286E0
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Nov 2022 03:17:37 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id y14so35213410ejd.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Nov 2022 03:17:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BI4uKN83KwpFv+aZH8WcfU1uC+N8zfagUkvOFMX2f/0=;
        b=lNtQkWNX3NrQKOEF5Mr4PbuDEt85Gj2gC46wbyDXU7FDD7TXpqfZ38119C3QpLsxRQ
         KvbRQzcanbZgVZUxau8P64Bi9tkgv4XR+Y5UvMiYWcU5/uNqHMG5R7YUsEMh8fDgxdTD
         HCptJW/NmulWVCimikzncdb4szFuDH6poqVSwhpcevKNP+xm8abae0Lw2Z3sbpNuFatU
         fRAVxuq791zKqmsXqxnVFZp0XURICJGnFsQGjdY8cGbHXwqOtu0hJw2AoB9uT2EUfH7G
         x+zpyboUlcOxf5RcjvEekqFWcLktrXX/g5g9TXk6mQeBAZePhzwdYNTbbYdwBz4DF0a3
         xZzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BI4uKN83KwpFv+aZH8WcfU1uC+N8zfagUkvOFMX2f/0=;
        b=YJjAtDxUTWhZkWWwHIr9McpF0KbBLWMAzk49IeGfCCzz/RU/JbQln1ZmC1ewRazYva
         QurfxGA06Un7ekzWIzYBVX8ktFniuBgdSEz1HTc3RlwmzA1DwapxUegam69XAlHJ0Y09
         cphQI3j6OTgPhx3FQxPNocwSmHttbOGI2Ro56GAozJmvtY0PMFWbuBVk9LA4HHNTHleT
         RfNVoIiuRg6ZQE2CVfuaMyBWXbji7XCLiJP8pzLvYp23DZJV0IirrBaunrR+4K7dIdAc
         ahWNoU2vdpPDTrRFBfYYEwDD8Gpj5vpSI7e5uvVcCqqKGCKKSItsZWe5fLJQxxnTNlnV
         wJ1w==
X-Gm-Message-State: ANoB5pnTQNjEvm/2uPvT0Vm62wX/qWFvBe7qs0Ot6qc8X0c2fHjv0Qjd
        xfA4ODi4+b8nbwofZ+UGlEqnUw==
X-Google-Smtp-Source: AA0mqf5KKHUA1FIRluZX/o1f38hjv2gpXLQtRG2aXDxYhJ5lL6/WuRc7/eS7/hgkqvNgnAmQI6C9kw==
X-Received: by 2002:a17:906:abd7:b0:7ad:b791:1390 with SMTP id kq23-20020a170906abd700b007adb7911390mr13163403ejb.279.1668511056003;
        Tue, 15 Nov 2022 03:17:36 -0800 (PST)
Received: from prec5560.. (freifunk-gw.bsa1-cpe1.syseleven.net. [176.74.57.43])
        by smtp.gmail.com with ESMTPSA id eg25-20020a056402289900b00457b5ba968csm5973519edb.27.2022.11.15.03.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 03:17:35 -0800 (PST)
From:   Robert Foss <robert.foss@linaro.org>
To:     robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, konrad.dybcio@somainline.org,
        quic_kalyant@quicinc.com, swboyd@chromium.org,
        robert.foss@linaro.org, angelogioacchino.delregno@somainline.org,
        loic.poulain@linaro.org, vkoul@kernel.org,
        quic_vpolimer@quicinc.com, dianders@chromium.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>,
        vinod.koul@linaro.org, quic_jesszhan@quicinc.com,
        andersson@kernel.org
Subject: [PATCH v2 01/12] dt-bindings: display: msm: Add qcom,sm8350-dpu binding
Date:   Tue, 15 Nov 2022 12:17:10 +0100
Message-Id: <20221115111721.891404-2-robert.foss@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221115111721.891404-1-robert.foss@linaro.org>
References: <20221115111721.891404-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Mobile Display Subsystem (MDSS) encapsulates sub-blocks
like DPU display controller, DSI etc. Add YAML schema for DPU device
tree bindings

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 .../bindings/display/msm/qcom,sm8350-dpu.yaml | 120 ++++++++++++++++++
 1 file changed, 120 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm8350-dpu.yaml

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8350-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8350-dpu.yaml
new file mode 100644
index 000000000000..120500395c9a
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8350-dpu.yaml
@@ -0,0 +1,120 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/qcom,sm8350-dpu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SM8350 Display DPU
+
+maintainers:
+  - Robert Foss <robert.foss@linaro.org>
+
+$ref: /schemas/display/msm/dpu-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,sm8350-dpu
+
+  reg:
+    items:
+      - description: Address offset and size for mdp register set
+      - description: Address offset and size for vbif register set
+
+  reg-names:
+    items:
+      - const: mdp
+      - const: vbif
+
+  clocks:
+    items:
+      - description: Display hf axi clock
+      - description: Display sf axi clock
+      - description: Display ahb clock
+      - description: Display lut clock
+      - description: Display core clock
+      - description: Display vsync clock
+
+  clock-names:
+    items:
+      - const: bus
+      - const: nrt_bus
+      - const: iface
+      - const: lut
+      - const: core
+      - const: vsync
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,dispcc-sm8350.h>
+    #include <dt-bindings/clock/qcom,gcc-sm8350.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interconnect/qcom,sm8350.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    display-controller@ae01000 {
+        compatible = "qcom,sm8350-dpu";
+        reg = <0x0ae01000 0x8f000>,
+              <0x0aeb0000 0x2008>;
+        reg-names = "mdp", "vbif";
+
+        clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
+                 <&gcc GCC_DISP_SF_AXI_CLK>,
+                 <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                 <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
+                 <&dispcc DISP_CC_MDSS_MDP_CLK>,
+                 <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+        clock-names = "bus",
+                      "nrt_bus",
+                      "iface",
+                      "lut",
+                      "core",
+                      "vsync";
+
+        assigned-clocks = <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+        assigned-clock-rates = <19200000>;
+
+        operating-points-v2 = <&mdp_opp_table>;
+        power-domains = <&rpmhpd SM8350_MMCX>;
+
+        interrupt-parent = <&mdss>;
+        interrupts = <0>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                dpu_intf1_out: endpoint {
+                    remote-endpoint = <&dsi0_in>;
+                };
+            };
+        };
+
+        mdp_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-200000000 {
+                opp-hz = /bits/ 64 <200000000>;
+                required-opps = <&rpmhpd_opp_low_svs>;
+            };
+
+            opp-300000000 {
+                opp-hz = /bits/ 64 <300000000>;
+                required-opps = <&rpmhpd_opp_svs>;
+            };
+
+            opp-345000000 {
+                opp-hz = /bits/ 64 <345000000>;
+                required-opps = <&rpmhpd_opp_svs_l1>;
+            };
+
+            opp-460000000 {
+                opp-hz = /bits/ 64 <460000000>;
+                required-opps = <&rpmhpd_opp_nom>;
+            };
+        };
+    };
+...
-- 
2.34.1

