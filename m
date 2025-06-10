Return-Path: <linux-arm-msm+bounces-60809-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE2BAD3A79
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 16:07:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D499C7AC8B6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 14:06:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CC4E2C1793;
	Tue, 10 Jun 2025 14:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZlQh/pQb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFDD82BFC95
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 14:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749564384; cv=none; b=DOdL0+MBL5+litFMWmSZwCQqKHxTAFDG55ZuJauzacyc+rps+YdUAA/miOj59DvCGG3aNw83czeq/D7m78x5D71JiS7r56xN+ftf+GUJ5J78jYeLw1C4hSFEzKXK2lvZJCcUx76ANCXavENsQh36Zjq2Sl6cnRjsqgtfLVTEvDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749564384; c=relaxed/simple;
	bh=GkWQl4AHuV9DjDU+IEnl4HWYAg7OOc0kIv/ZNv4aHT0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QuJ9mnyscesZkov9GW2/lUkwwwl9OUERiEOPigU3ShxyNjiNdsTnUrGuX/b89IIPcCrtz/yaQLsDrjWLQN21rHCWVwdeDLzWr+dkGpx6z/ZmNbNLxbAlGTNoIq4oJ34YIH7BoXF44szXnifTKXxk7+AbS1P/IaiVJXZY7vwjHKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZlQh/pQb; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45306433f71so1611715e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 07:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749564380; x=1750169180; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wAIPDns1zRlLkDTDA2ufc+iwOegg3wkdBuYVEqu/EmA=;
        b=ZlQh/pQbLY1crj1erQh/lf+GMQwqD/UpF4FkG9znKw1o430BucQUwRV0fTgsTs/uy+
         YoNgpZrKJ6qQHRdFYM+52RzB/RcdAyUpG5x/U2spNK2OAPFz5febtpvx1YmSA/57jV30
         sM7GNq8EVmjh0ycV1R3110Bc0Wvkg0Bzoij5hxCYunge0ZzXP00kY6faFyTqvVsyKNdt
         g3T0EaO6ZW6Om1+ZaJydTTzWQKGsgWYT/bqqOowqfFJbm5Fzvie9R4WhLAb+ArzMUVEt
         yB3Ds7KtU65NUIxPwmEAuSOioF/0qYDS0rGCriIqm+v+x4NIsgKF57tPOy5JzkA+XNOy
         zkQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749564380; x=1750169180;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wAIPDns1zRlLkDTDA2ufc+iwOegg3wkdBuYVEqu/EmA=;
        b=YTxrIDsL7UzgweFVvNzbNirogp5snzatltEszythhpFHaPkdJGfXbCFl4wj9FR+0RA
         ujvwZLnoDEUk3v2RuWF1DRCEUQaVJIzQQpxmdMWxQfZtfryTZun7CtcIV1FRHkJJ+p+4
         27sehofIA3mxmHP4NvO60jc6U+P87A2iFam3IJJZyQUHyQJi6AwPf45jTGsWOza6v5is
         NZVo9n+gW/jKs7rzulIA3NThMgcp0A8Jkd+I/OcItExE1mnuwZIUG2q25qZ8+e9VFmBr
         JMiHkm7KikOwjCu+9CPNGb/RvmBOtCIe8I90nkbLQyE9rNP+11E6C0GDTyJhE4MTjl2y
         0aNQ==
X-Gm-Message-State: AOJu0Yw0ui/Jn4YiwZXLkLpzFxPrZTZHcRwxPq9QmoAzf0Ye1XFNmUp/
	YIx5nurchA3gL6oCqpt+q8EIG0VeSxi0+dSkTzWWjyO3xtBDta77smhMXOj7NgS3PwI=
X-Gm-Gg: ASbGnctEo01ZPWXL9w68YCQxqBuAaB5ES9fbJy88+OP6LZKDVGg1w/gvYiwaUea86cE
	vjxBrCfUbDC+Yeyoyv8oqSAbDZ3hgz13p8o84O5alDhIYQnFWVDOlekMOf5DkdQ5slfUY0IGIcG
	mRUC35aYNOGfLWZvOGDqkX4fFpDI7Bz35U4Cg7v+B11b0+K9QRYWR5rFTOzhNESIvy1i0FgHl//
	onun/asGT1PCDyMqVYm2fJ8fPbCt/ZfjcjDEwwEYTaXlgqRFJtra3pEiUrZk2R6zAkH2Ode9ppK
	vbcyCgYKDG1jrNwDfrDPUb1qnDFaWld7h9Q7F5iF2jTfpEownX+Qd8VS5r5ybjvIS3nniU/+wxA
	IDx9OaQ==
X-Google-Smtp-Source: AGHT+IEbn++/TrlQ8CnGdJhD4PqH/f8v9pJKkPsUGPoPg26ZqqnyDuiERRk0NcOF/FZqryYt/0nGZQ==
X-Received: by 2002:a05:600c:45cc:b0:442:fac9:5e2f with SMTP id 5b1f17b1804b1-452948376a5mr57515675e9.2.1749564379711;
        Tue, 10 Jun 2025 07:06:19 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244df06sm12734469f8f.69.2025.06.10.07.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 07:06:19 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 10 Jun 2025 16:05:43 +0200
Subject: [PATCH v6 05/17] dt-bindings: display/msm: qcom,sm8750-mdss: Add
 SM8750
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-b4-sm8750-display-v6-5-ee633e3ddbff@linaro.org>
References: <20250610-b4-sm8750-display-v6-0-ee633e3ddbff@linaro.org>
In-Reply-To: <20250610-b4-sm8750-display-v6-0-ee633e3ddbff@linaro.org>
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
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoSDvD+Rk7RKM6CRwn07acUzUy/Qw/j8iRA5Rl2
 L7rNIsL5ZiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaEg7wwAKCRDBN2bmhouD
 1zC4D/4or9v+mISULfwXs1LzeqUR5hrBRkRa521RoqYo4Fl/I/Au3zOFb8phXx3PWTEv2csOqFT
 QLzHGvk24pAgh0yXI6RDcAOYDZXIUtIIvC/rEOlJsFhatn7ilXFvHPFpYCoiW0xICEhgaYVNhl/
 HqKo+3bqNDgSJn5W2J+PIYMHQ2z82CoeC4bMOxvvlrisncJz1SIVnW/IOs4OpAiJOnLKMWqxY3F
 k+GjqPGYJzyxwSHWHmPcotf9jfRsyG0zgVjXL40W4NZ8bFBjZ527+rQ9xfLa7/sU3Cj1VowFu/K
 BuBklqKhBiLGUXRvERqCDPoMOZtbNOW9TtaoI2X6cup+HrgT4cB/Gmed7BXv+X9p9EhtfEfhCPc
 kqCoZjWnBShM2tQ3AiYXZ+j+pzGl2YldSmqYA/gUivKwmYIa7moN6NeJlsJYQc6HV3kBZu9bxKd
 EYixlcgLNSEBOhpUJ4nHDERQygpJMuXWApEtb/8dFtL2iMuggAJ8xCA2xp19QySOnXQt8U9UkI/
 rCxh/3mDGAUAQjmbJRjYIqxdlHo0MlkNOWDrUsoTtgRlH8AZp/TAH9Ne1ltLgEjBnJ8h9RVUxFw
 ThpktnxurA0wkFsj+hwLvH/jExM9ov7nkJ/4icEVua94N6Czh8EuEuU8Buh6k/rWpJE/hRoA12b
 YmqclQYC2MFnKkQ==
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


