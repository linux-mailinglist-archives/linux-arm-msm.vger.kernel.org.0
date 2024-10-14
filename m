Return-Path: <linux-arm-msm+bounces-34298-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB9399C651
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 11:47:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 449C2B20D9E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 09:47:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16AEE1581E0;
	Mon, 14 Oct 2024 09:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YKMH1B91"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A87156C5E
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Oct 2024 09:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728899263; cv=none; b=ER+f0eCS0Ost/lVEFPis5j0LAIFLlSBL/pE0EJOW1Ggn7AbKBgA2P3wmZTYR6LggZ8LkqLwLkx1JaGob7gWXkhSCW1ePpmV16BjwERi9yUP864Cjl5CO2VsaBRjHAVO/TlnaV+hnXb37ShJ1kySonL/Rp0iAvocnTDicXlgK+oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728899263; c=relaxed/simple;
	bh=IqKZMAUslYLawP8jtr1Z/wT6X4iLWbAXeXBaKhpWot8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lfKkINuBuuyTw3UtGms4E9TKcLtkgRvubWH/8SMFk0LXxvcI5JYMf5Hm8tSRnwWQiDYsPEz93Ub2RolkBlf93bG8mt5j975Q2mbhk3tNvYAQr20OYMqY7ri6atrNwpjyMYYOFSi7hBfhz2chEHl4hGqdK9r77l2qi7yhhjXzx0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YKMH1B91; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C18DDC4CED3;
	Mon, 14 Oct 2024 09:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728899262;
	bh=IqKZMAUslYLawP8jtr1Z/wT6X4iLWbAXeXBaKhpWot8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=YKMH1B91XihqUt7tJ1n6EvWlmfJz3cokgypHuzZhHzSobqFSvjpDQciGPV6zRwJYD
	 +OzTMo6DROrxqtyakEoY7KZGgPFBlCZHSNJL+O+Yfthb74BfTwrgx/hH27XwDrfKZH
	 6K/KP9ockcQZSo4DGrqtFpGCpvgg1W3WgGExPCbx0+z5aDvrIgKXX8YZfs6CBNjueS
	 tgv56AfeAxnYxSgG3mebh5pz5ppH9KzMOkbgiZmUcZRklc4w10OZlMOiPFX8NphavR
	 0Oa3KIJfiWkbgmOeVu7m3z3oUL+QiV2X6wHcSjumEHMVW/ckl9bTC3oFo5hBJbIBgc
	 p/INYDZLbvHDg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9C47CFC535;
	Mon, 14 Oct 2024 09:47:42 +0000 (UTC)
From: fangez via B4 Relay <devnull+quic_fangez.quicinc.com@kernel.org>
Date: Mon, 14 Oct 2024 17:47:31 +0800
Subject: [PATCH 5/6] dt-bindings: display/msm: Add QCS615 MDSS & DPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241014-add_display_support_for_qcs615-v1-5-4efa191dbdd4@quicinc.com>
References: <20241014-add_display_support_for_qcs615-v1-0-4efa191dbdd4@quicinc.com>
In-Reply-To: <20241014-add_display_support_for_qcs615-v1-0-4efa191dbdd4@quicinc.com>
To: kernel@quicinc.com, quic_lliu6@quicinc.com, quic_fangez@quicinc.com, 
 quic_xiangxuy@quicinc.com
Cc: linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728899260; l=12509;
 i=quic_fangez@quicinc.com; s=20241014; h=from:subject:message-id;
 bh=LHDFuyIDnaXeOMJz4rCHaktqQAlt6blDtn97pQhjIP4=;
 b=lWoWMPJlZzg+Fx/fg+VF8rE5n27ZytX24ycPYAb9TwgkwW5PGxjgMzaMdwgyIOIcdACDf4T8b
 ewx0vfLIiNvAiP9EibUQZgGUZWKeaEtN484tJqS+4bc2kuQ0RGZAX05
X-Developer-Key: i=quic_fangez@quicinc.com; a=ed25519;
 pk=tJv8Cz0npA34ynt53o5GaQfBC0ySFhyb2FGj+V2Use4=
X-Endpoint-Received: by B4 Relay for quic_fangez@quicinc.com/20241014 with
 auth_id=245
X-Original-From: fangez <quic_fangez@quicinc.com>
Reply-To: quic_fangez@quicinc.com

From: lliu6 <quic_lliu6@quicinc.com>

Add bindings for the display hardware on QCS615.

Signed-off-by: lliu6 <quic_lliu6@quicinc.com>
---
 .../bindings/display/msm/qcom,qcs615-dpu.yaml      | 117 +++++++++
 .../bindings/display/msm/qcom,qcs615-mdss.yaml     | 278 +++++++++++++++++++++
 2 files changed, 395 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,qcs615-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,qcs615-dpu.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..35339092cb4f905541a7f70f42166bd0b0b7dee7
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,qcs615-dpu.yaml
@@ -0,0 +1,117 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/qcom,qcs615-dpu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm QCS615 Display DPU
+
+maintainers:
+  - lliu6 <quic_lliu6@quicinc.com>
+
+$ref: /schemas/display/msm/dpu-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,qcs615-dpu
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
+      - description: Display ahb clock
+      - description: Display hf axi clock
+      - description: Display core clock
+      - description: Display vsync clock
+
+  clock-names:
+    items:
+      - const: iface
+      - const: bus
+      - const: core
+      - const: vsync
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,qcs615-dispcc.h>
+    #include <dt-bindings/clock/qcom,qcs615-gcc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interconnect/qcom,qcs615-rpmh.h>
+    #include <dt-bindings/interconnect/qcom,icc.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    display-controller@ae01000 {
+        compatible = "qcom,qcs615-dpu";
+        reg = <0x0ae01000 0x8f000>,
+              <0x0aeb0000 0x2008>;
+        reg-names = "mdp", "vbif";
+
+        clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                 <&gcc GCC_DISP_HF_AXI_CLK>,
+                 <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
+                 <&dispcc DISP_CC_MDSS_MDP_CLK>,
+                 <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+        clock-names = "iface", "bus", "lut" "core", "vsync";
+
+        assigned-clocks = <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+        assigned-clock-rates = <19200000>;
+
+        operating-points-v2 = <&mdp_opp_table>;
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
+	        dpu_intf0_out: endpoint {
+		};
+	    };
+
+            port@1 {
+		reg = <1>;
+		dpu_intf1_out: endpoint {
+		    remote-endpoint = <&mdss_dsi0_in>;
+		};
+	    };
+
+        };
+
+        mdp_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-375000000 {
+                opp-hz = /bits/ 64 <375000000>;
+                required-opps = <&rpmhpd_opp_svs_l1>;
+            };
+
+            opp-500000000 {
+                opp-hz = /bits/ 64 <500000000>;
+                required-opps = <&rpmhpd_opp_nom>;
+            };
+
+            opp-575000000 {
+                opp-hz = /bits/ 64 <575000000>;
+                required-opps = <&rpmhpd_opp_turbo>;
+            };
+
+            opp-650000000 {
+                opp-hz = /bits/ 64 <650000000>;
+                required-opps = <&rpmhpd_opp_turbo_l1>;
+            };
+        };
+    };
+...
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,qcs615-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,qcs615-mdss.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..fdad15c358892306dcb2c1b78319934c504cfc2b
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,qcs615-mdss.yaml
@@ -0,0 +1,278 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/qcom,qcs615-mdss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm QCS615 Display MDSS
+
+maintainers:
+  - lliu6 <quic_lliu6@quicinc.com>
+
+description:
+  Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
+  sub-blocks like DPU display controller, DSI and DP interfaces etc. Device tree
+  bindings of MDSS are mentioned for QCS615 target.
+
+$ref: /schemas/display/msm/mdss-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: qcom,qcs615-mdss
+
+  clocks:
+    items:
+      - description: Display AHB clock from gcc
+      - description: Display hf axi clock
+      - description: Display sf axi clock
+      - description: Display core clock
+
+  clock-names:
+    items:
+      - const: iface
+      - const: bus
+      - const: nrt_bus
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
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: qcom,qcs615-dpu
+
+  "^displayport-controller@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        contains:
+          const: qcom,qcs615-dp
+
+  "^dsi@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        items:
+          - const: qcom,qcs615-dsi-ctrl
+          - const: qcom,mdss-dsi-ctrl
+
+  "^phy@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: qcom,qcs615-dsi-phy-14nm
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,qcs615-dispcc.h>
+    #include <dt-bindings/clock/qcom,qcs615-gcc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interconnect/qcom,qcs615-rpmh.h>
+    #include <dt-bindings/interconnect/qcom,icc.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    display-subsystem@ae00000 {
+        compatible = "qcom,qcs615-mdss";
+        reg = <0x0ae00000 0x1000>;
+        reg-names = "mdss";
+
+	interconnects = <&mmss_noc MASTER_MDP0 0 &mc_virt SLAVE_EBI1 0>,
+			<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+			&config_noc SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
+	interconnect-names = "mdp0-mem", "cpu-cfg";
+
+        power-domains = <&dispcc MDSS_CORE_GDSC>;
+
+        clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                 <&gcc GCC_DISP_HF_AXI_CLK>,
+                 <&dispcc DISP_CC_MDSS_MDP_CLK>;
+
+        interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-controller;
+        #interrupt-cells = <1>;
+
+        iommus = <&apps_smmu 0x800 0x0>;
+
+        #address-cells = <2>;
+        #size-cells = <2>;
+        ranges;
+
+        display-controller@ae01000 {
+            compatible = "qcom,qcs615-dpu";
+            reg = <0x0ae01000 0x8f000>,
+                  <0x0aeb0000 0x2008>;
+            reg-names = "mdp", "vbif";
+
+            clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                     <&gcc GCC_DISP_HF_AXI_CLK>,
+		     <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
+                     <&dispcc DISP_CC_MDSS_MDP_CLK>,
+                     <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+            clock-names = "iface", "bus", "lut", "core", "vsync";
+
+            assigned-clocks = <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+            assigned-clock-rates = <19200000>;
+
+            operating-points-v2 = <&mdp_opp_table>;
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
+	            dpu_intf0_out: endpoint {
+		    };
+	        };
+
+                port@1 {
+		    reg = <1>;
+		    dpu_intf1_out: endpoint {
+		        remote-endpoint = <&mdss_dsi0_in>;
+		    };
+	        };
+
+            };
+
+            mdp_opp_table: opp-table {
+                compatible = "operating-points-v2";
+
+                opp-375000000 {
+                    opp-hz = /bits/ 64 <375000000>;
+                    required-opps = <&rpmhpd_opp_svs_l1>;
+                };
+
+                opp-500000000 {
+                    opp-hz = /bits/ 64 <500000000>;
+                    required-opps = <&rpmhpd_opp_nom>;
+                };
+
+                opp-575000000 {
+                    opp-hz = /bits/ 64 <575000000>;
+                    required-opps = <&rpmhpd_opp_turbo>;
+                };
+
+                opp-650000000 {
+                    opp-hz = /bits/ 64 <650000000>;
+                    required-opps = <&rpmhpd_opp_turbo_l1>;
+                };
+            };
+        };
+
+        dsi@ae94000 {
+            compatible = "qcom,qcs615-dsi-ctrl", "qcom,mdss-dsi-ctrl";
+            reg = <0x0ae94000 0x400>;
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
+            operating-points-v2 = <&dsi0_opp_table>;
+
+            phys = <&mdss_dsi0_phy>;
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
+                    mdss_dsi0_in: endpoint {
+                        remote-endpoint = <&dpu_intf1_out>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                    mdss_dsi0_out: endpoint {
+                    };
+                };
+            };
+
+            dsi0_opp_table: opp-table {
+                compatible = "operating-points-v2";
+
+                opp-164000000 {
+                    opp-hz = /bits/ 64 <164000000>;
+                    required-opps = <&rpmhpd_opp_low_svs>;
+                };
+
+                opp-187500000 {
+                    opp-hz = /bits/ 64 <187500000>;
+                    required-opps = <&rpmhpd_opp_svs>;
+                };
+
+                opp-225000000 {
+                    opp-hz = /bits/ 64 <225000000>;
+                    required-opps = <&rpmhpd_opp_svs_l1>;
+                };
+
+                opp-262500000 {
+                    opp-hz = /bits/ 64 <262500000>;
+                    required-opps = <&rpmhpd_opp_nom>;
+                };
+            };
+        };
+
+        mdss_dsi0_phy: phy@ae94400 {
+            compatible = "qcom,qcs615-dsi-phy-14nm";
+            reg = <0x0ae94400 0x100>,
+                  <0x0ae94500 0x300>,
+                  <0x0ae94800 0x188>;
+            reg-names = "dsi_phy",
+                        "dsi_phy_lane",
+                        "dsi_pll";
+
+            #clock-cells = <1>;
+            #phy-cells = <0>;
+
+            clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                     <&rpmhcc RPMH_CXO_CLK>;
+            clock-names = "iface", "ref";
+            vdds-supply = <&vreg_dsi_phy>;
+        };
+    };
+...

-- 
2.25.1



