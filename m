Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C67AE52FF6E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 May 2022 22:35:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345780AbiEUUfa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 21 May 2022 16:35:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345748AbiEUUf1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 21 May 2022 16:35:27 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45229393C9
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 May 2022 13:35:25 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id br17so7257462lfb.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 May 2022 13:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Yz1Yzt/Sg0lXAFTAnGbUnGwgR0Ly0/Jt+YYR3V8OSOE=;
        b=dlEZSv5s71VcVS2besnHXfHlsOo0tHOofPv+jkwhIH9OeB7dS4JSrUGMLi15UrdcUK
         sqvOfJVboVKjL549dgv7WuIwTpIGUA/zFA90+cZaZf5T8ID27jLZXCMwKy8vgB4FXZ0u
         0MfdhHf/FV2l+9uNU6zweiFh/+VWPV/B7xPRQCdsJYwB1dYmdMzda6p0OC6qd9WjjTkP
         T15clFsohZ8yg/tBxpoQBfrcH+lWm/CVPe3PSa8Gcwg6ccUVdC0YPuDGkRWRQ+S4EbNJ
         T3htm6RI4Gmihp5iX/naGOzyYWnBMJzpwR/fQ8u2hUnn4VPUKPHtOCeHxCaXBqMlEWpK
         yinw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Yz1Yzt/Sg0lXAFTAnGbUnGwgR0Ly0/Jt+YYR3V8OSOE=;
        b=NfyPaPNBaEXL3KhR1Oj0pkgIAazzEzJZfl1Z5XNlY/wN2l1dLgYKKSCfleHzBq2T/v
         f8edU8LxVYr5dz7pDnJtkO2q8o2t1n629OyOh2NfHynI+EDlA0dUb06texrseUQGOGzz
         Yut5l9kFCWWE4A36ZM2TG2FvmSI7WTSuFW2vSxBaTs9EEq6jSfyDpnke18QD/KmXWHFG
         JC/nVmw25sjfHa2HJn6awFxcJxJPLhjnGJWlPS5MpOWC51mvx3zvzBfXNaQVK4Y3EKvb
         Bv1RbfQtlwd0UtM87Iko7k3FcYhOGdB5T6ghIwFu3EcqJjUsRcClXLFPzk3G04CF/zdA
         V9BQ==
X-Gm-Message-State: AOAM531u9YzMNH5G70mXPL2BPs00VRegH3SdD11os3nmqxISXqqVhrxJ
        CNOg8ihr1yHUc/nNQd52gRlP5CRRhuKRxQ==
X-Google-Smtp-Source: ABdhPJxjgkTeh0iVJd87GEvUXsIksDMH+1Y+WY+35yeeSQf4hV7oWvbSUoexUjdrir2ho9FPOdeuGQ==
X-Received: by 2002:a05:6512:b8d:b0:477:96e9:b959 with SMTP id b13-20020a0565120b8d00b0047796e9b959mr11739228lfv.563.1653165323405;
        Sat, 21 May 2022 13:35:23 -0700 (PDT)
Received: from eriador.lan ([2001:470:dd84:abc0::8a5])
        by smtp.gmail.com with ESMTPSA id q18-20020a056512211200b00477930c48dasm1179729lfr.184.2022.05.21.13.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 May 2022 13:35:22 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 1/4] arm64: dts: qcom: sdm660: move device nodes to sdm636
Date:   Sat, 21 May 2022 23:35:17 +0300
Message-Id: <20220521203520.1513565-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220521203520.1513565-1-dmitry.baryshkov@linaro.org>
References: <20220521203520.1513565-1-dmitry.baryshkov@linaro.org>
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

The sdm636 is a lighter version of sdm660. It lacks Turing DSP (cdsp)
and has slightly different CPU speed and Adreno version.

Reflect this by moving all common device nodes from sdm660.dtsi to
sdm636.dtsi and including the later file from the former one. Currently
this is implemented in the opposite direction, sdm636 includes sdm660,
thus adding cdsp support would require adding delete-node statements to
sdm636.dtsi.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm636.dtsi | 253 +++++++++++++++++++++++++--
 arch/arm64/boot/dts/qcom/sdm660.dtsi | 250 +-------------------------
 2 files changed, 250 insertions(+), 253 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm636.dtsi b/arch/arm64/boot/dts/qcom/sdm636.dtsi
index ae15d81fa3f9..0cf72f0def38 100644
--- a/arch/arm64/boot/dts/qcom/sdm636.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm636.dtsi
@@ -5,19 +5,248 @@
  * Copyright (c) 2020, Martin Botka <martin.botka1@gmail.com>
  */
 
-#include "sdm660.dtsi"
-
-/*
- * According to the downstream DTS,
- * 636 is basically a 660 except for
- * different CPU frequencies, Adreno
- * 509 instead of 512 and lack of
- * turing IP. These differences will
- * be addressed when the aforementioned
- * peripherals will be enabled upstream.
- */
+#include "sdm630.dtsi"
 
 &adreno_gpu {
 	compatible = "qcom,adreno-509.0", "qcom,adreno";
-	/* Adreno 509 shares the frequency table with 512 */
+	operating-points-v2 = <&gpu_sdm660_opp_table>;
+
+	gpu_sdm660_opp_table: opp-table {
+		compatible  = "operating-points-v2";
+
+		/*
+		 * 775MHz is only available on the highest speed bin
+		 * Though it cannot be used for now due to interconnect
+		 * framework not supporting multiple frequencies
+		 * at the same opp-level
+
+		opp-750000000 {
+			opp-hz = /bits/ 64 <750000000>;
+			opp-level = <RPM_SMD_LEVEL_TURBO>;
+			opp-peak-kBps = <5412000>;
+			opp-supported-hw = <0xCHECKME>;
+		};
+
+		* These OPPs are correct, but we are lacking support for the
+		* GPU regulator. Hence, disable them for now to prevent the
+		* platform from hanging on high graphics loads.
+
+		opp-700000000 {
+			opp-hz = /bits/ 64 <700000000>;
+			opp-level = <RPM_SMD_LEVEL_TURBO>;
+			opp-peak-kBps = <5184000>;
+			opp-supported-hw = <0xFF>;
+		};
+
+		opp-647000000 {
+			opp-hz = /bits/ 64 <647000000>;
+			opp-level = <RPM_SMD_LEVEL_NOM_PLUS>;
+			opp-peak-kBps = <4068000>;
+			opp-supported-hw = <0xFF>;
+		};
+
+		opp-588000000 {
+			opp-hz = /bits/ 64 <588000000>;
+			opp-level = <RPM_SMD_LEVEL_NOM>;
+			opp-peak-kBps = <3072000>;
+			opp-supported-hw = <0xFF>;
+		};
+
+		opp-465000000 {
+			opp-hz = /bits/ 64 <465000000>;
+			opp-level = <RPM_SMD_LEVEL_SVS_PLUS>;
+			opp-peak-kBps = <2724000>;
+			opp-supported-hw = <0xFF>;
+		};
+
+		opp-370000000 {
+			opp-hz = /bits/ 64 <370000000>;
+			opp-level = <RPM_SMD_LEVEL_SVS>;
+			opp-peak-kBps = <2188000>;
+			opp-supported-hw = <0xFF>;
+		};
+		*/
+
+		opp-266000000 {
+			opp-hz = /bits/ 64 <266000000>;
+			opp-level = <RPM_SMD_LEVEL_LOW_SVS>;
+			opp-peak-kBps = <1648000>;
+			opp-supported-hw = <0xFF>;
+		};
+
+		opp-160000000 {
+			opp-hz = /bits/ 64 <160000000>;
+			opp-level = <RPM_SMD_LEVEL_MIN_SVS>;
+			opp-peak-kBps = <1200000>;
+			opp-supported-hw = <0xFF>;
+		};
+	};
+};
+
+&CPU0 {
+	compatible = "qcom,kryo260";
+	capacity-dmips-mhz = <1024>;
+	/delete-property/ operating-points-v2;
+};
+
+&CPU1 {
+	compatible = "qcom,kryo260";
+	capacity-dmips-mhz = <1024>;
+	/delete-property/ operating-points-v2;
+};
+
+&CPU2 {
+	compatible = "qcom,kryo260";
+	capacity-dmips-mhz = <1024>;
+	/delete-property/ operating-points-v2;
+};
+
+&CPU3 {
+	compatible = "qcom,kryo260";
+	capacity-dmips-mhz = <1024>;
+	/delete-property/ operating-points-v2;
+};
+
+&CPU4 {
+	compatible = "qcom,kryo260";
+	capacity-dmips-mhz = <640>;
+	/delete-property/ operating-points-v2;
+};
+
+&CPU5 {
+	compatible = "qcom,kryo260";
+	capacity-dmips-mhz = <640>;
+	/delete-property/ operating-points-v2;
+};
+
+&CPU6 {
+	compatible = "qcom,kryo260";
+	capacity-dmips-mhz = <640>;
+	/delete-property/ operating-points-v2;
+};
+
+&CPU7 {
+	compatible = "qcom,kryo260";
+	capacity-dmips-mhz = <640>;
+	/delete-property/ operating-points-v2;
+};
+
+&gcc {
+	compatible = "qcom,gcc-sdm660";
+};
+
+&gpucc {
+	compatible = "qcom,gpucc-sdm660";
+};
+
+&mdp {
+	ports {
+		port@1 {
+			reg = <1>;
+			mdp5_intf2_out: endpoint {
+				remote-endpoint = <&dsi1_in>;
+			};
+		};
+	};
+};
+
+&mdss {
+	dsi1: dsi@c996000 {
+		compatible = "qcom,mdss-dsi-ctrl";
+		reg = <0x0c996000 0x400>;
+		reg-names = "dsi_ctrl";
+
+		/* DSI1 shares the OPP table with DSI0 */
+		operating-points-v2 = <&dsi_opp_table>;
+		power-domains = <&rpmpd SDM660_VDDCX>;
+
+		interrupt-parent = <&mdss>;
+		interrupts = <5>;
+
+		assigned-clocks = <&mmcc BYTE1_CLK_SRC>,
+					<&mmcc PCLK1_CLK_SRC>;
+		assigned-clock-parents = <&dsi1_phy 0>,
+						<&dsi1_phy 1>;
+
+		clocks = <&mmcc MDSS_MDP_CLK>,
+				<&mmcc MDSS_BYTE1_CLK>,
+				<&mmcc MDSS_BYTE1_INTF_CLK>,
+				<&mmcc MNOC_AHB_CLK>,
+				<&mmcc MDSS_AHB_CLK>,
+				<&mmcc MDSS_AXI_CLK>,
+				<&mmcc MISC_AHB_CLK>,
+				<&mmcc MDSS_PCLK1_CLK>,
+				<&mmcc MDSS_ESC1_CLK>;
+		clock-names = "mdp_core",
+					"byte",
+					"byte_intf",
+					"mnoc",
+					"iface",
+					"bus",
+					"core_mmss",
+					"pixel",
+					"core";
+
+		phys = <&dsi1_phy>;
+		phy-names = "dsi";
+
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				dsi1_in: endpoint {
+					remote-endpoint = <&mdp5_intf2_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				dsi1_out: endpoint {
+				};
+			};
+		};
+	};
+
+	dsi1_phy: dsi-phy@c996400 {
+		compatible = "qcom,dsi-phy-14nm-660";
+		reg = <0x0c996400 0x100>,
+				<0x0c996500 0x300>,
+				<0x0c996800 0x188>;
+		reg-names = "dsi_phy",
+				"dsi_phy_lane",
+				"dsi_pll";
+
+		#clock-cells = <1>;
+		#phy-cells = <0>;
+
+		clocks = <&mmcc MDSS_AHB_CLK>, <&rpmcc RPM_SMD_XO_CLK_SRC>;
+		clock-names = "iface", "ref";
+		status = "disabled";
+	};
+};
+
+&mmcc {
+	compatible = "qcom,mmcc-sdm660";
+	clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
+			<&sleep_clk>,
+			<&gcc GCC_MMSS_GPLL0_CLK>,
+			<&gcc GCC_MMSS_GPLL0_DIV_CLK>,
+			<&dsi0_phy 1>,
+			<&dsi0_phy 0>,
+			<&dsi1_phy 1>,
+			<&dsi1_phy 0>,
+			<0>,
+			<0>;
+};
+
+&tlmm {
+	compatible = "qcom,sdm660-pinctrl";
+};
+
+&tsens {
+	#qcom,sensors = <14>;
 };
diff --git a/arch/arm64/boot/dts/qcom/sdm660.dtsi b/arch/arm64/boot/dts/qcom/sdm660.dtsi
index c92f1cef3d3c..f51f5b27819f 100644
--- a/arch/arm64/boot/dts/qcom/sdm660.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm660.dtsi
@@ -7,248 +7,16 @@
  * Copyright (c) 2020, Martin Botka <martin.botka1@gmail.com>
  */
 
-#include "sdm630.dtsi"
+#include "sdm636.dtsi"
+
+/*
+ * According to the downstream DTS, 660 is basically a 660 except for different
+ * CPU frequencies, Adreno 512 instead of 509 and presens of turing IP. These
+ * differences will be addressed when the aforementioned peripherals will be
+ * enabled upstream.
+ */
 
 &adreno_gpu {
 	compatible = "qcom,adreno-512.0", "qcom,adreno";
-	operating-points-v2 = <&gpu_sdm660_opp_table>;
-
-	gpu_sdm660_opp_table: opp-table {
-		compatible  = "operating-points-v2";
-
-		/*
-		 * 775MHz is only available on the highest speed bin
-		 * Though it cannot be used for now due to interconnect
-		 * framework not supporting multiple frequencies
-		 * at the same opp-level
-
-		opp-750000000 {
-			opp-hz = /bits/ 64 <750000000>;
-			opp-level = <RPM_SMD_LEVEL_TURBO>;
-			opp-peak-kBps = <5412000>;
-			opp-supported-hw = <0xCHECKME>;
-		};
-
-		* These OPPs are correct, but we are lacking support for the
-		* GPU regulator. Hence, disable them for now to prevent the
-		* platform from hanging on high graphics loads.
-
-		opp-700000000 {
-			opp-hz = /bits/ 64 <700000000>;
-			opp-level = <RPM_SMD_LEVEL_TURBO>;
-			opp-peak-kBps = <5184000>;
-			opp-supported-hw = <0xFF>;
-		};
-
-		opp-647000000 {
-			opp-hz = /bits/ 64 <647000000>;
-			opp-level = <RPM_SMD_LEVEL_NOM_PLUS>;
-			opp-peak-kBps = <4068000>;
-			opp-supported-hw = <0xFF>;
-		};
-
-		opp-588000000 {
-			opp-hz = /bits/ 64 <588000000>;
-			opp-level = <RPM_SMD_LEVEL_NOM>;
-			opp-peak-kBps = <3072000>;
-			opp-supported-hw = <0xFF>;
-		};
-
-		opp-465000000 {
-			opp-hz = /bits/ 64 <465000000>;
-			opp-level = <RPM_SMD_LEVEL_SVS_PLUS>;
-			opp-peak-kBps = <2724000>;
-			opp-supported-hw = <0xFF>;
-		};
-
-		opp-370000000 {
-			opp-hz = /bits/ 64 <370000000>;
-			opp-level = <RPM_SMD_LEVEL_SVS>;
-			opp-peak-kBps = <2188000>;
-			opp-supported-hw = <0xFF>;
-		};
-		*/
-
-		opp-266000000 {
-			opp-hz = /bits/ 64 <266000000>;
-			opp-level = <RPM_SMD_LEVEL_LOW_SVS>;
-			opp-peak-kBps = <1648000>;
-			opp-supported-hw = <0xFF>;
-		};
-
-		opp-160000000 {
-			opp-hz = /bits/ 64 <160000000>;
-			opp-level = <RPM_SMD_LEVEL_MIN_SVS>;
-			opp-peak-kBps = <1200000>;
-			opp-supported-hw = <0xFF>;
-		};
-	};
-};
-
-&CPU0 {
-	compatible = "qcom,kryo260";
-	capacity-dmips-mhz = <1024>;
-	/delete-property/ operating-points-v2;
-};
-
-&CPU1 {
-	compatible = "qcom,kryo260";
-	capacity-dmips-mhz = <1024>;
-	/delete-property/ operating-points-v2;
-};
-
-&CPU2 {
-	compatible = "qcom,kryo260";
-	capacity-dmips-mhz = <1024>;
-	/delete-property/ operating-points-v2;
-};
-
-&CPU3 {
-	compatible = "qcom,kryo260";
-	capacity-dmips-mhz = <1024>;
-	/delete-property/ operating-points-v2;
-};
-
-&CPU4 {
-	compatible = "qcom,kryo260";
-	capacity-dmips-mhz = <640>;
-	/delete-property/ operating-points-v2;
-};
-
-&CPU5 {
-	compatible = "qcom,kryo260";
-	capacity-dmips-mhz = <640>;
-	/delete-property/ operating-points-v2;
-};
-
-&CPU6 {
-	compatible = "qcom,kryo260";
-	capacity-dmips-mhz = <640>;
-	/delete-property/ operating-points-v2;
-};
-
-&CPU7 {
-	compatible = "qcom,kryo260";
-	capacity-dmips-mhz = <640>;
-	/delete-property/ operating-points-v2;
-};
-
-&gcc {
-	compatible = "qcom,gcc-sdm660";
-};
-
-&gpucc {
-	compatible = "qcom,gpucc-sdm660";
-};
-
-&mdp {
-	ports {
-		port@1 {
-			reg = <1>;
-			mdp5_intf2_out: endpoint {
-				remote-endpoint = <&dsi1_in>;
-			};
-		};
-	};
-};
-
-&mdss {
-	dsi1: dsi@c996000 {
-		compatible = "qcom,mdss-dsi-ctrl";
-		reg = <0x0c996000 0x400>;
-		reg-names = "dsi_ctrl";
-
-		/* DSI1 shares the OPP table with DSI0 */
-		operating-points-v2 = <&dsi_opp_table>;
-		power-domains = <&rpmpd SDM660_VDDCX>;
-
-		interrupt-parent = <&mdss>;
-		interrupts = <5>;
-
-		assigned-clocks = <&mmcc BYTE1_CLK_SRC>,
-					<&mmcc PCLK1_CLK_SRC>;
-		assigned-clock-parents = <&dsi1_phy 0>,
-						<&dsi1_phy 1>;
-
-		clocks = <&mmcc MDSS_MDP_CLK>,
-				<&mmcc MDSS_BYTE1_CLK>,
-				<&mmcc MDSS_BYTE1_INTF_CLK>,
-				<&mmcc MNOC_AHB_CLK>,
-				<&mmcc MDSS_AHB_CLK>,
-				<&mmcc MDSS_AXI_CLK>,
-				<&mmcc MISC_AHB_CLK>,
-				<&mmcc MDSS_PCLK1_CLK>,
-				<&mmcc MDSS_ESC1_CLK>;
-		clock-names = "mdp_core",
-					"byte",
-					"byte_intf",
-					"mnoc",
-					"iface",
-					"bus",
-					"core_mmss",
-					"pixel",
-					"core";
-
-		phys = <&dsi1_phy>;
-		phy-names = "dsi";
-
-		status = "disabled";
-
-		ports {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			port@0 {
-				reg = <0>;
-				dsi1_in: endpoint {
-					remote-endpoint = <&mdp5_intf2_out>;
-				};
-			};
-
-			port@1 {
-				reg = <1>;
-				dsi1_out: endpoint {
-				};
-			};
-		};
-	};
-
-	dsi1_phy: dsi-phy@c996400 {
-		compatible = "qcom,dsi-phy-14nm-660";
-		reg = <0x0c996400 0x100>,
-				<0x0c996500 0x300>,
-				<0x0c996800 0x188>;
-		reg-names = "dsi_phy",
-				"dsi_phy_lane",
-				"dsi_pll";
-
-		#clock-cells = <1>;
-		#phy-cells = <0>;
-
-		clocks = <&mmcc MDSS_AHB_CLK>, <&rpmcc RPM_SMD_XO_CLK_SRC>;
-		clock-names = "iface", "ref";
-		status = "disabled";
-	};
-};
-
-&mmcc {
-	compatible = "qcom,mmcc-sdm660";
-	clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
-			<&sleep_clk>,
-			<&gcc GCC_MMSS_GPLL0_CLK>,
-			<&gcc GCC_MMSS_GPLL0_DIV_CLK>,
-			<&dsi0_phy 1>,
-			<&dsi0_phy 0>,
-			<&dsi1_phy 1>,
-			<&dsi1_phy 0>,
-			<0>,
-			<0>;
-};
-
-&tlmm {
-	compatible = "qcom,sdm660-pinctrl";
-};
-
-&tsens {
-	#qcom,sensors = <14>;
+	/* Adreno 512 shares the frequency table with 509 */
 };
-- 
2.35.1

