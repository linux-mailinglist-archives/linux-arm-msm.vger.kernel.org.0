Return-Path: <linux-arm-msm+bounces-61740-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D5774ADEF9C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 16:35:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8D5267ABFFA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 14:33:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EC582ED86C;
	Wed, 18 Jun 2025 14:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qct/vvUT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C89C2ED175
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jun 2025 14:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750257209; cv=none; b=NVIGL9XbiC+FxS44Wpt4HZn8BekCpDV7oU33C5Eu/1dJIZna8fTl56+QwwzhIOLOQ68ItoNry+IPwM1KZDQPefoLHMbrbXIwWQWScVrPL466RZploEMAM00xdYlBiWsgWctudwSd5331e67lUhtRO4LS4PU3OY05HKOB1/pds/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750257209; c=relaxed/simple;
	bh=GkWQl4AHuV9DjDU+IEnl4HWYAg7OOc0kIv/ZNv4aHT0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UOxAziyq1a5L20fTMGL6Yt1igWiu+tvlcx/lS3mqOG+UIq6OCCM6/aYJQBK++BA7Sabpr/2UVbKBWDjOdYR9Pt6RiyYIkDnPGswKkkjKY4PzCekuC1xV7p5BWqiYjsmG6ubfwRSYkUopNvtzpVzFLtxcoWhC6ctmfQtZDnMDC8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qct/vvUT; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-606e757287aso1093594a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jun 2025 07:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750257206; x=1750862006; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wAIPDns1zRlLkDTDA2ufc+iwOegg3wkdBuYVEqu/EmA=;
        b=qct/vvUTpf9us5akPBHOj2JPu+HZnol0Rfci6pEJJ03OQFEo5aWseQLodUGoR38Jal
         emfv0WjAc/Z64VfTAy4xcUzPFLP6ft3HOBsIrty4Zgs/98KOpmxthf6ifgLdl/y7s92+
         XDo54SVbCPGSzhrpM5lp9GqewEKwwp6RJbXd+87a+9FZifSpNFjp7q5lVGCXkeaoJOgT
         shMVFU1YNAHJfISIhFpi0u1w2RKEoT67d78Aqr/8bjanXp5NOA/81jjN3LlaLYfY3MW7
         40roViX1AEvqDlFYW+7eTq82pWYJt0asE/e30ObLLzLqUlgQ+ucW2RKxqSat0RBV7htZ
         Wd7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750257206; x=1750862006;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wAIPDns1zRlLkDTDA2ufc+iwOegg3wkdBuYVEqu/EmA=;
        b=abn1dS+GeEbQP5Nc3xDfv4lwodCTh/i106TATg1jdpbxjnoUGQ4Rf2TcuPjpTtp045
         WT6OFtwk8TmHAfs/w829x71rFjbGnXKS+nC3f2slwi80z8oVBsLY6T9n1ou7oofMnI0s
         4E0TunyNLPiyFHS28M845H459i46+6imIeS4NzH0sbTvMmU6ZUcZhSr+YjPuyBXDFh26
         EKqaCrpXfgLTMezvBi897CBb+P0rV91igbE+m5uEGsR4yqYVzEPq4yMWg4fD+h5ayY3+
         aUIgT1rcEGBk9WoKS+eU+VhFf262HBZNUC1e7FLJxZqAeTyPAfobKT/FZhQWlUlOqauG
         aBEQ==
X-Gm-Message-State: AOJu0YxAHcCke+A1KIJraNJokNCsCxHCpkOcV0ViQyFlrumeMl8qkXCM
	eHSi3NnSndatQpFikpAYZY6sPyfVj0EgQAfV19u/eXiBEIbikezISKTcJ0doXzIv/pU=
X-Gm-Gg: ASbGncu6EX54lH4YBLBi9QKOQsAvnK/fkb4OJMvJWXhRsWDv/ROFWAIVeo5ffJSUO/X
	hrfHRD2Jj6o3QGX08vp9Ia7IMMoAgWqTWyaqhzP9cJiVND2OXxSb2MPqjmoB3SJRkklS9oCwpD6
	7hg2s9fOp4NysvA5Q/3y+taAyO3FUImNu+PkJJIASEiO1ELu2ZEVomlGJdeUZLNNuslPknrihxX
	+oRVawauMS0YxUClDjnKzXvBDsIjpX681zy8HpNOhdBLr1BQ9auCpkhyaRvd0oAOuC1KvZDtlyG
	fSDU5ego3QqM/Q+7wi6dEgfHyGem5HBnq7Kc5bRIT+HpXcPe61Iv9M90sC/DT6QpB6IHAUSEHkl
	Kzy6hZQs=
X-Google-Smtp-Source: AGHT+IF3RsutTvI1OrP1Po02j56SUXCqR1s2yKGNzCqtD0uJgbeCrUrWZJmXn0/KERTLp8hPAHdwEQ==
X-Received: by 2002:a17:907:6e90:b0:ad8:882e:38a with SMTP id a640c23a62f3a-adfad558903mr574806666b.14.1750257205431;
        Wed, 18 Jun 2025 07:33:25 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec81c0135sm1052257566b.47.2025.06.18.07.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 07:33:24 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 18 Jun 2025 16:32:34 +0200
Subject: [PATCH v7 05/13] dt-bindings: display/msm: qcom,sm8750-mdss: Add
 SM8750
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250618-b4-sm8750-display-v7-5-a591c609743d@linaro.org>
References: <20250618-b4-sm8750-display-v7-0-a591c609743d@linaro.org>
In-Reply-To: <20250618-b4-sm8750-display-v7-0-a591c609743d@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-clk@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=16871;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=GkWQl4AHuV9DjDU+IEnl4HWYAg7OOc0kIv/ZNv4aHT0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoUs4en5/AT8KVJzM0m51RdDVGuCve9PTS8GK4B
 DmTpyeG+2mJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaFLOHgAKCRDBN2bmhouD
 16YqD/9OmzjEPSw8LbB/jTQcIFmoCXaNU3F2WuoHbDsi+QIy4C/YV97qdVjSQCDJgK9dE+GEdvk
 aRaQqT5dXNaGxFY+oxY/P/WYRp1Ljd5JkCRK1PfhtSgQkb5oBPwtywsJlXIGw/AdkTUUSjk+Szh
 T+G+HG8y/2SvzTg8ReFf0pgLl2GS/FBBuhnZP0tmJdJR3JsVOlg/Rwxsttv6H3y8sDkYFDjJFSE
 WVT/jpeuJCoh2vj1mc1ItMSIpVMbrXO5xwz0y9wI4GS9dj6lgQM66uRhFcpjwfn4kiK/oP87o5Y
 Qw3ifoJlxCO+jA8Wey+9kC5eYH1CtO7l5OzMoCnGFWz+49AAjiBa7Dtlp7uSUU1FtE+1fA0yayy
 mffAeLs9yVcKVAk40zThdMKNcDvvluJrVkctNuepS1ttoIzW4dkFIFnaO+pe7OgyVbV1zK8ueyM
 jedARFi39H0AxB82J/ZJYVwW9f0d5v9PkHqGllbIDDVzM6yOiQIGzeLL2+LgvY/pIlz1OQ0ONpz
 RcaeVFiyRuN1McezTlbbItqdqKgyPTHjXENuaU57JMoiy0+IrOgtb/7QLBQV2ZHTjBEnc5RqZ9V
 BRNuxiRVCIR5Ak2uzzGVFeHDoJ8wErfmWiokMr79WijTnLseV+J/77jSXPuIg9iZseWrLZjLoJi
 1uerVm+jOj25qWA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Add MDSS/MDP display subsystem for Qualcomm SM8750 SoC, next generation
with two revisions up of the IP block comparing to SM8650.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Changes in v3:
1. Properly described interconnects
2. Use only one compatible and contains for the sub-blocks (Rob)
---
 .../bindings/display/msm/qcom,sm8750-mdss.yaml     | 470 +++++++++++++++++++++
 1 file changed, 470 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..72c70edc1fb01c61f8aad24fdb58bfb4f62a6e34
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml
@@ -0,0 +1,470 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/qcom,sm8750-mdss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SM8750 Display MDSS
+
+maintainers:
+  - Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
+
+description:
+  SM8650 MSM Mobile Display Subsystem(MDSS), which encapsulates sub-blocks like
+  DPU display controller, DSI and DP interfaces etc.
+
+$ref: /schemas/display/msm/mdss-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,sm8750-mdss
+
+  clocks:
+    items:
+      - description: Display AHB
+      - description: Display hf AXI
+      - description: Display core
+
+  iommus:
+    maxItems: 1
+
+  interconnects:
+    items:
+      - description: Interconnect path from mdp0 port to the data bus
+      - description: Interconnect path from CPU to the reg bus
+
+  interconnect-names:
+    items:
+      - const: mdp0-mem
+      - const: cpu-cfg
+
+patternProperties:
+  "^display-controller@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        const: qcom,sm8750-dpu
+
+  "^displayport-controller@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        contains:
+          const: qcom,sm8750-dp
+
+  "^dsi@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        contains:
+          const: qcom,sm8750-dsi-ctrl
+
+  "^phy@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        const: qcom,sm8750-dsi-phy-3nm
+
+required:
+  - compatible
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/interconnect/qcom,icc.h>
+    #include <dt-bindings/interconnect/qcom,sm8750-rpmh.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/phy/phy-qcom-qmp.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    display-subsystem@ae00000 {
+            compatible = "qcom,sm8750-mdss";
+            reg = <0x0ae00000 0x1000>;
+            reg-names = "mdss";
+
+            interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+
+            clocks = <&disp_cc_mdss_ahb_clk>,
+                     <&gcc_disp_hf_axi_clk>,
+                     <&disp_cc_mdss_mdp_clk>;
+
+            interconnects = <&mmss_noc MASTER_MDP QCOM_ICC_TAG_ALWAYS
+                             &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+                            <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+                             &config_noc SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
+            interconnect-names = "mdp0-mem",
+                                 "cpu-cfg";
+
+            resets = <&disp_cc_mdss_core_bcr>;
+
+            power-domains = <&mdss_gdsc>;
+
+            iommus = <&apps_smmu 0x800 0x2>;
+
+            interrupt-controller;
+            #interrupt-cells = <1>;
+
+            #address-cells = <1>;
+            #size-cells = <1>;
+            ranges;
+
+            display-controller@ae01000 {
+                compatible = "qcom,sm8750-dpu";
+                reg = <0x0ae01000 0x93000>,
+                      <0x0aeb0000 0x2008>;
+                reg-names = "mdp",
+                            "vbif";
+
+                interrupts-extended = <&mdss 0>;
+
+                clocks = <&gcc_disp_hf_axi_clk>,
+                         <&disp_cc_mdss_ahb_clk>,
+                         <&disp_cc_mdss_mdp_lut_clk>,
+                         <&disp_cc_mdss_mdp_clk>,
+                         <&disp_cc_mdss_vsync_clk>;
+                clock-names = "nrt_bus",
+                              "iface",
+                              "lut",
+                              "core",
+                              "vsync";
+
+                assigned-clocks = <&disp_cc_mdss_vsync_clk>;
+                assigned-clock-rates = <19200000>;
+
+                operating-points-v2 = <&mdp_opp_table>;
+
+                power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+                ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    port@0 {
+                        reg = <0>;
+
+                        dpu_intf1_out: endpoint {
+                            remote-endpoint = <&mdss_dsi0_in>;
+                        };
+                    };
+
+                    port@1 {
+                        reg = <1>;
+
+                        dpu_intf2_out: endpoint {
+                            remote-endpoint = <&mdss_dsi1_in>;
+                        };
+                    };
+
+                    port@2 {
+                        reg = <2>;
+
+                        dpu_intf0_out: endpoint {
+                            remote-endpoint = <&mdss_dp0_in>;
+                        };
+                    };
+                };
+
+                mdp_opp_table: opp-table {
+                    compatible = "operating-points-v2";
+
+                    opp-207000000 {
+                        opp-hz = /bits/ 64 <207000000>;
+                        required-opps = <&rpmhpd_opp_low_svs>;
+                    };
+
+                    opp-337000000 {
+                        opp-hz = /bits/ 64 <337000000>;
+                        required-opps = <&rpmhpd_opp_svs>;
+                    };
+
+                    opp-417000000 {
+                        opp-hz = /bits/ 64 <417000000>;
+                        required-opps = <&rpmhpd_opp_svs_l1>;
+                    };
+
+                    opp-532000000 {
+                        opp-hz = /bits/ 64 <532000000>;
+                        required-opps = <&rpmhpd_opp_nom>;
+                    };
+
+                    opp-575000000 {
+                        opp-hz = /bits/ 64 <575000000>;
+                        required-opps = <&rpmhpd_opp_nom_l1>;
+                    };
+                };
+            };
+
+            dsi@ae94000 {
+                compatible = "qcom,sm8750-dsi-ctrl", "qcom,mdss-dsi-ctrl";
+                reg = <0x0ae94000 0x400>;
+                reg-names = "dsi_ctrl";
+
+                interrupts-extended = <&mdss 4>;
+
+                clocks = <&disp_cc_mdss_byte0_clk>,
+                         <&disp_cc_mdss_byte0_intf_clk>,
+                         <&disp_cc_mdss_pclk0_clk>,
+                         <&disp_cc_mdss_esc0_clk>,
+                         <&disp_cc_mdss_ahb_clk>,
+                         <&gcc_disp_hf_axi_clk>,
+                         <&mdss_dsi0_phy 1>,
+                         <&mdss_dsi0_phy 0>,
+                         <&disp_cc_esync0_clk>,
+                         <&disp_cc_osc_clk>,
+                         <&disp_cc_mdss_byte0_clk_src>,
+                         <&disp_cc_mdss_pclk0_clk_src>;
+                clock-names = "byte",
+                              "byte_intf",
+                              "pixel",
+                              "core",
+                              "iface",
+                              "bus",
+                              "dsi_pll_pixel",
+                              "dsi_pll_byte",
+                              "esync",
+                              "osc",
+                              "byte_src",
+                              "pixel_src";
+
+                operating-points-v2 = <&mdss_dsi_opp_table>;
+
+                power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+                phys = <&mdss_dsi0_phy>;
+                phy-names = "dsi";
+
+                vdda-supply = <&vreg_l3g_1p2>;
+
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    port@0 {
+                        reg = <0>;
+
+                        mdss_dsi0_in: endpoint {
+                            remote-endpoint = <&dpu_intf1_out>;
+                        };
+                    };
+
+                    port@1 {
+                        reg = <1>;
+
+                        mdss_dsi0_out: endpoint {
+                            remote-endpoint = <&panel0_in>;
+                            data-lanes = <0 1 2 3>;
+                        };
+                    };
+                };
+
+                mdss_dsi_opp_table: opp-table {
+                    compatible = "operating-points-v2";
+
+                    opp-187500000 {
+                        opp-hz = /bits/ 64 <187500000>;
+                        required-opps = <&rpmhpd_opp_low_svs>;
+                    };
+
+                    opp-300000000 {
+                        opp-hz = /bits/ 64 <300000000>;
+                        required-opps = <&rpmhpd_opp_svs>;
+                    };
+
+                    opp-358000000 {
+                        opp-hz = /bits/ 64 <358000000>;
+                        required-opps = <&rpmhpd_opp_svs_l1>;
+                    };
+                };
+            };
+
+            mdss_dsi0_phy: phy@ae95000 {
+                compatible = "qcom,sm8750-dsi-phy-3nm";
+                reg = <0x0ae95000 0x200>,
+                      <0x0ae95200 0x280>,
+                      <0x0ae95500 0x400>;
+                reg-names = "dsi_phy",
+                            "dsi_phy_lane",
+                            "dsi_pll";
+
+                clocks = <&disp_cc_mdss_ahb_clk>,
+                         <&rpmhcc RPMH_CXO_CLK>;
+                clock-names = "iface",
+                              "ref";
+
+                vdds-supply = <&vreg_l3i_0p88>;
+
+                #clock-cells = <1>;
+                #phy-cells = <0>;
+            };
+
+            dsi@ae96000 {
+                compatible = "qcom,sm8750-dsi-ctrl", "qcom,mdss-dsi-ctrl";
+                reg = <0x0ae96000 0x400>;
+                reg-names = "dsi_ctrl";
+
+                interrupts-extended = <&mdss 5>;
+
+                clocks = <&disp_cc_mdss_byte1_clk>,
+                         <&disp_cc_mdss_byte1_intf_clk>,
+                         <&disp_cc_mdss_pclk1_clk>,
+                         <&disp_cc_mdss_esc1_clk>,
+                         <&disp_cc_mdss_ahb_clk>,
+                         <&gcc_disp_hf_axi_clk>,
+                         <&mdss_dsi1_phy 1>,
+                         <&mdss_dsi1_phy 0>,
+                         <&disp_cc_esync1_clk>,
+                         <&disp_cc_osc_clk>,
+                         <&disp_cc_mdss_byte1_clk_src>,
+                         <&disp_cc_mdss_pclk1_clk_src>;
+                clock-names = "byte",
+                              "byte_intf",
+                              "pixel",
+                              "core",
+                              "iface",
+                              "bus",
+                              "dsi_pll_pixel",
+                              "dsi_pll_byte",
+                              "esync",
+                              "osc",
+                              "byte_src",
+                              "pixel_src";
+
+                operating-points-v2 = <&mdss_dsi_opp_table>;
+
+                power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+                phys = <&mdss_dsi1_phy>;
+                phy-names = "dsi";
+
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    port@0 {
+                        reg = <0>;
+
+                        mdss_dsi1_in: endpoint {
+                            remote-endpoint = <&dpu_intf2_out>;
+                        };
+                    };
+
+                    port@1 {
+                        reg = <1>;
+
+                        mdss_dsi1_out: endpoint {
+                        };
+                    };
+                };
+            };
+
+            mdss_dsi1_phy: phy@ae97000 {
+                compatible = "qcom,sm8750-dsi-phy-3nm";
+                reg = <0x0ae97000 0x200>,
+                      <0x0ae97200 0x280>,
+                      <0x0ae97500 0x400>;
+                reg-names = "dsi_phy",
+                            "dsi_phy_lane",
+                            "dsi_pll";
+
+                clocks = <&disp_cc_mdss_ahb_clk>,
+                         <&rpmhcc RPMH_CXO_CLK>;
+                clock-names = "iface",
+                              "ref";
+
+                #clock-cells = <1>;
+                #phy-cells = <0>;
+            };
+
+            displayport-controller@af54000 {
+                compatible = "qcom,sm8750-dp", "qcom,sm8650-dp";
+                reg = <0xaf54000 0x104>,
+                      <0xaf54200 0xc0>,
+                      <0xaf55000 0x770>,
+                      <0xaf56000 0x9c>,
+                      <0xaf57000 0x9c>;
+
+                interrupts-extended = <&mdss 12>;
+
+                clocks = <&disp_cc_mdss_ahb_clk>,
+                         <&disp_cc_mdss_dptx0_aux_clk>,
+                         <&disp_cc_mdss_dptx0_link_clk>,
+                         <&disp_cc_mdss_dptx0_link_intf_clk>,
+                         <&disp_cc_mdss_dptx0_pixel0_clk>;
+                clock-names = "core_iface",
+                              "core_aux",
+                              "ctrl_link",
+                              "ctrl_link_iface",
+                              "stream_pixel";
+
+                assigned-clocks = <&disp_cc_mdss_dptx0_link_clk_src>,
+                                  <&disp_cc_mdss_dptx0_pixel0_clk_src>;
+                assigned-clock-parents = <&usb_dp_qmpphy QMP_USB43DP_DP_LINK_CLK>,
+                                         <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
+
+                operating-points-v2 = <&dp_opp_table>;
+
+                power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+                phys = <&usb_dp_qmpphy QMP_USB43DP_DP_PHY>;
+                phy-names = "dp";
+
+                #sound-dai-cells = <0>;
+
+                dp_opp_table: opp-table {
+                    compatible = "operating-points-v2";
+
+                    opp-192000000 {
+                        opp-hz = /bits/ 64 <192000000>;
+                        required-opps = <&rpmhpd_opp_low_svs_d1>;
+                    };
+
+                    opp-270000000 {
+                        opp-hz = /bits/ 64 <270000000>;
+                        required-opps = <&rpmhpd_opp_low_svs>;
+                    };
+
+                    opp-540000000 {
+                        opp-hz = /bits/ 64 <540000000>;
+                        required-opps = <&rpmhpd_opp_svs_l1>;
+                    };
+
+                    opp-810000000 {
+                        opp-hz = /bits/ 64 <810000000>;
+                        required-opps = <&rpmhpd_opp_nom>;
+                    };
+                };
+
+                ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    port@0 {
+                        reg = <0>;
+
+                        mdss_dp0_in: endpoint {
+                            remote-endpoint = <&dpu_intf0_out>;
+                        };
+                    };
+
+                    port@1 {
+                        reg = <1>;
+
+                        mdss_dp0_out: endpoint {
+                            remote-endpoint = <&usb_dp_qmpphy_dp_in>;
+                        };
+                    };
+                };
+            };
+        };

-- 
2.45.2


