Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A0A57BEF35
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Oct 2023 01:34:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234610AbjJIXeP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Oct 2023 19:34:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379054AbjJIXeO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Oct 2023 19:34:14 -0400
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D801DA;
        Mon,  9 Oct 2023 16:34:12 -0700 (PDT)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-5a7a7e9357eso10355547b3.0;
        Mon, 09 Oct 2023 16:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696894451; x=1697499251; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=js7b6ifiaylHlLfWSsqXvfXjUm7wOn0FIewreiaJc7E=;
        b=atmgjyykPhSYBeAuBIyGuhqidjDND6eKhJIZRbMzcFGrhPFzdoGkIun2ZWnbZ4+Xlv
         VwQhNrnUgXS+M6sTRNyL656+6h9MnztFd2wxrTk9mrT+JK+6Gjn8nozy3pKMXB1typK7
         vfT51A7/0z2+aYJaMZxtOpIoOMf+G6n1VSN3AkRjy2pyALJONwDvZ8+cVUnkJ1hV27ek
         ScGddgYUv59mG7mxXBXW+xIYDxY5YA3ElSfnrHdXjAOu4SjzSOxi1fQ/YBheH1xsPuRs
         2vZKqkOo2dG5S2Tf10I1D6S1etalO4RQOH9D02HpBVikrxKpGHdn+Q/xl7Hh9yR+sgdG
         3mHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696894451; x=1697499251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=js7b6ifiaylHlLfWSsqXvfXjUm7wOn0FIewreiaJc7E=;
        b=YxrzPh0OjhA9gbUunxvpULyNMxjSWDv24hwsdL8g7n08WF3DxoOYFVd6jnXq2bmhB9
         /X9A6iUKjN7lgCikeEnXlkbRkmHGbM+deHmZ1K7cbjHiG+7zDY/+jHzJrcEmJddjumLF
         6aA/HzkjOOeDpma7vBnma/WcwDD/ccPF4mZPyhj1vCI5wjyfkT4m7szFGBBYHO7/Q0Gu
         ePtD/ZaG5JN+zjiQhLQx5H1XjIbLE62pBexN8GU1pjTo91L9jipzjbjqBdg6sYWcMdBi
         SRVMq4FzhuJh98F5hCv//A5LyAmVohj0D9dxLMVuSYe28tnTDyf5pcRnSqOdN+DGOs86
         zpjw==
X-Gm-Message-State: AOJu0Yz5YeD6M00AIFIGj0b05cipq/TlLg887bRMGk6HXnmgNnjbnJ+7
        W6LnU4/QyElmVxqmIIST/Fk=
X-Google-Smtp-Source: AGHT+IHwRc38SswzCvslp2PZM7pDwElXeZmMIhllnhb9DwtrJ1Bt5hlbjRkEeAUmVLWY40UeuxmUaA==
X-Received: by 2002:a81:71c4:0:b0:59b:cff1:a8eb with SMTP id m187-20020a8171c4000000b0059bcff1a8ebmr17180862ywc.34.1696894451033;
        Mon, 09 Oct 2023 16:34:11 -0700 (PDT)
Received: from localhost ([2607:fea8:529e:7800::1d3d])
        by smtp.gmail.com with ESMTPSA id a2-20020ac844a2000000b00419cce4a5ffsm3971077qto.82.2023.10.09.16.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 16:34:10 -0700 (PDT)
From:   Richard Acayan <mailingradian@gmail.com>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Vinod Polimera <quic_vpolimer@quicinc.com>,
        Ryan McCann <quic_rmccann@quicinc.com>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Liu Shixin <liushixin2@huawei.com>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v3 6/6] arm64: dts: qcom: sdm670: add display subsystem
Date:   Mon,  9 Oct 2023 19:33:44 -0400
Message-ID: <20231009233337.485054-14-mailingradian@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231009233337.485054-8-mailingradian@gmail.com>
References: <20231009233337.485054-8-mailingradian@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Snapdragon 670 has a display subsystem for controlling and
outputting to the display. Add support for it in the device tree.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm670.dtsi | 292 +++++++++++++++++++++++++++
 1 file changed, 292 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index 84cd2e39266f..b62b4ff4c621 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -6,6 +6,7 @@
  * Copyright (c) 2022, Richard Acayan. All rights reserved.
  */
 
+#include <dt-bindings/clock/qcom,dispcc-sdm845.h>
 #include <dt-bindings/clock/qcom,gcc-sdm845.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/dma/qcom-gpi.h>
@@ -400,6 +401,30 @@ cpu6_opp10: opp-1996800000 {
 		};
 	};
 
+	dsi_opp_table: opp-table-dsi {
+		compatible = "operating-points-v2";
+
+		opp-19200000 {
+			opp-hz = /bits/ 64 <19200000>;
+			required-opps = <&rpmhpd_opp_min_svs>;
+		};
+
+		opp-180000000 {
+			opp-hz = /bits/ 64 <180000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+		};
+
+		opp-275000000 {
+			opp-hz = /bits/ 64 <275000000>;
+			required-opps = <&rpmhpd_opp_svs>;
+		};
+
+		opp-358000000 {
+			opp-hz = /bits/ 64 <358000000>;
+			required-opps = <&rpmhpd_opp_svs_l1>;
+		};
+	};
+
 	psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
@@ -1352,6 +1377,273 @@ spmi_bus: spmi@c440000 {
 			#interrupt-cells = <4>;
 		};
 
+		mdss: display-subsystem@ae00000 {
+			compatible = "qcom,sdm670-mdss";
+			reg = <0 0x0ae00000 0 0x1000>;
+			reg-names = "mdss";
+
+			power-domains = <&dispcc MDSS_GDSC>;
+
+			clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+				 <&dispcc DISP_CC_MDSS_MDP_CLK>;
+			clock-names = "iface", "core";
+
+			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
+
+			interconnects = <&mmss_noc MASTER_MDP_PORT0 0 &mem_noc SLAVE_EBI_CH0 0>,
+					<&mmss_noc MASTER_MDP_PORT1 0 &mem_noc SLAVE_EBI_CH0 0>;
+			interconnect-names = "mdp0-mem", "mdp1-mem";
+
+			iommus = <&apps_smmu 0x880 0x8>,
+				 <&apps_smmu 0xc80 0x8>;
+
+			status = "disabled";
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			mdss_mdp: display-controller@ae01000 {
+				compatible = "qcom,sdm670-dpu";
+				reg = <0 0x0ae01000 0 0x8f000>,
+				      <0 0x0aeb0000 0 0x2008>;
+				reg-names = "mdp", "vbif";
+
+				clocks = <&gcc GCC_DISP_AXI_CLK>,
+					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&dispcc DISP_CC_MDSS_AXI_CLK>,
+					 <&dispcc DISP_CC_MDSS_MDP_CLK>,
+					 <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+				clock-names = "gcc-bus", "iface", "bus", "core", "vsync";
+
+				assigned-clocks = <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+				assigned-clock-rates = <19200000>;
+				operating-points-v2 = <&mdp_opp_table>;
+				power-domains = <&rpmhpd SDM670_CX>;
+
+				interrupt-parent = <&mdss>;
+				interrupts = <0>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						dpu_intf0_out: endpoint {
+							remote-endpoint = <&mdss_dsi0_in>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+						dpu_intf1_out: endpoint {
+							remote-endpoint = <&mdss_dsi1_in>;
+						};
+					};
+				};
+
+				mdp_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-19200000 {
+						opp-hz = /bits/ 64 <19200000>;
+						required-opps = <&rpmhpd_opp_min_svs>;
+					};
+
+					opp-171428571 {
+						opp-hz = /bits/ 64 <171428571>;
+						required-opps = <&rpmhpd_opp_low_svs>;
+					};
+
+					opp-358000000 {
+						opp-hz = /bits/ 64 <358000000>;
+						required-opps = <&rpmhpd_opp_svs_l1>;
+					};
+
+					opp-430000000 {
+						opp-hz = /bits/ 64 <430000000>;
+						required-opps = <&rpmhpd_opp_nom>;
+					};
+				};
+			};
+
+			mdss_dsi0: dsi@ae94000 {
+				compatible = "qcom,sdm670-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
+				reg = <0 0x0ae94000 0 0x400>;
+				reg-names = "dsi_ctrl";
+
+				interrupt-parent = <&mdss>;
+				interrupts = <4>;
+
+				clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
+					 <&dispcc DISP_CC_MDSS_BYTE0_INTF_CLK>,
+					 <&dispcc DISP_CC_MDSS_PCLK0_CLK>,
+					 <&dispcc DISP_CC_MDSS_ESC0_CLK>,
+					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&dispcc DISP_CC_MDSS_AXI_CLK>;
+				clock-names = "byte",
+					      "byte_intf",
+					      "pixel",
+					      "core",
+					      "iface",
+					      "bus";
+				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
+				assigned-clock-parents = <&mdss_dsi0_phy 0>,
+							 <&mdss_dsi0_phy 1>;
+
+				operating-points-v2 = <&dsi_opp_table>;
+				power-domains = <&rpmhpd SDM670_CX>;
+
+				phys = <&mdss_dsi0_phy>;
+
+				status = "disabled";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						mdss_dsi0_in: endpoint {
+							remote-endpoint = <&dpu_intf0_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+						mdss_dsi0_out: endpoint {
+						};
+					};
+				};
+			};
+
+			mdss_dsi0_phy: phy@ae94400 {
+				compatible = "qcom,dsi-phy-10nm";
+				reg = <0 0x0ae94400 0 0x200>,
+				      <0 0x0ae94600 0 0x280>,
+				      <0 0x0ae94a00 0 0x1e0>;
+				reg-names = "dsi_phy",
+					    "dsi_phy_lane",
+					    "dsi_pll";
+
+				#clock-cells = <1>;
+				#phy-cells = <0>;
+
+				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&rpmhcc RPMH_CXO_CLK>;
+				clock-names = "iface", "ref";
+
+				status = "disabled";
+			};
+
+			mdss_dsi1: dsi@ae96000 {
+				compatible = "qcom,sdm670-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
+				reg = <0 0x0ae96000 0 0x400>;
+				reg-names = "dsi_ctrl";
+
+				interrupt-parent = <&mdss>;
+				interrupts = <5>;
+
+				clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK>,
+					 <&dispcc DISP_CC_MDSS_BYTE1_INTF_CLK>,
+					 <&dispcc DISP_CC_MDSS_PCLK1_CLK>,
+					 <&dispcc DISP_CC_MDSS_ESC1_CLK>,
+					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&dispcc DISP_CC_MDSS_AXI_CLK>;
+				clock-names = "byte",
+					      "byte_intf",
+					      "pixel",
+					      "core",
+					      "iface",
+					      "bus";
+				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_PCLK1_CLK_SRC>;
+				assigned-clock-parents = <&mdss_dsi1_phy 0>, <&mdss_dsi1_phy 1>;
+
+				operating-points-v2 = <&dsi_opp_table>;
+				power-domains = <&rpmhpd SDM670_CX>;
+
+				phys = <&mdss_dsi1_phy>;
+
+				status = "disabled";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						mdss_dsi1_in: endpoint {
+							remote-endpoint = <&dpu_intf1_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+						mdss_dsi1_out: endpoint {
+						};
+					};
+				};
+			};
+
+			mdss_dsi1_phy: phy@ae96400 {
+				compatible = "qcom,dsi-phy-10nm";
+				reg = <0 0x0ae96400 0 0x200>,
+				      <0 0x0ae96600 0 0x280>,
+				      <0 0x0ae96a00 0 0x10e>;
+				reg-names = "dsi_phy",
+					    "dsi_phy_lane",
+					    "dsi_pll";
+
+				#clock-cells = <1>;
+				#phy-cells = <0>;
+
+				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&rpmhcc RPMH_CXO_CLK>;
+				clock-names = "iface", "ref";
+
+				status = "disabled";
+			};
+		};
+
+		dispcc: clock-controller@af00000 {
+			compatible = "qcom,sdm845-dispcc";
+			reg = <0 0x0af00000 0 0x10000>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_DISP_GPLL0_CLK_SRC>,
+				 <&gcc GCC_DISP_GPLL0_DIV_CLK_SRC>,
+				 <&mdss_dsi0_phy 0>,
+				 <&mdss_dsi0_phy 1>,
+				 <&mdss_dsi1_phy 0>,
+				 <&mdss_dsi1_phy 1>,
+				 <0>,
+				 <0>;
+			clock-names = "bi_tcxo",
+				      "gcc_disp_gpll0_clk_src",
+				      "gcc_disp_gpll0_div_clk_src",
+				      "dsi0_phy_pll_out_byteclk",
+				      "dsi0_phy_pll_out_dsiclk",
+				      "dsi1_phy_pll_out_byteclk",
+				      "dsi1_phy_pll_out_dsiclk",
+				      "dp_link_clk_divsel_ten",
+				      "dp_vco_divided_clk_src_mux";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		apps_smmu: iommu@15000000 {
 			compatible = "qcom,sdm670-smmu-500", "qcom,smmu-500", "arm,mmu-500";
 			reg = <0 0x15000000 0 0x80000>;
-- 
2.42.0

