Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60CC06129A6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Oct 2022 10:44:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230115AbiJ3Jnz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 30 Oct 2022 05:43:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230020AbiJ3Jnc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 30 Oct 2022 05:43:32 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7583D128;
        Sun, 30 Oct 2022 02:43:24 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id v130-20020a1cac88000000b003bcde03bd44so9088507wme.5;
        Sun, 30 Oct 2022 02:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QKLnyS1dI/VsC5RjU6rtIktExiExbn9qlM4kF/V4ru8=;
        b=imswqNBk7/ppbSvhOXm9lkvmZOiW58fdVDm3s9RBMTq2G+ZHknGO3uufh7PALfcEVf
         qcCw+Dyza1AXK0bawgxqOxqzXKS5B43e6BesgyP5k1zSsQbd2sPyGvkx5i3Gyw28vIk9
         dNZmUjnwhpHdrqchBh2ln6I4ma5PFwBPcYkZ9n/RhYlDKSz0CPmWarlXtZSKvmdxWtrl
         U8euep+V9TfQfpKSU3lEUO+OWcZmGDFWW+p4FQT/BNRI8eN1iSSOF3MVKj/BizRw8BD7
         QgpCZrIQfnmbnsBx4vGKpW5Q6Xwzqsk96QyfG0Mldl0LC6tF4U4/ors9vSBijLz99mIk
         ajiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QKLnyS1dI/VsC5RjU6rtIktExiExbn9qlM4kF/V4ru8=;
        b=VtnyU4E/pEbDS3JVZRZUW2NyYjC59+3DnB2uhN0HvM4csLAPjEpu7IEWjQJwx93txh
         1BFClPROwElc17n/ALSj9z2xgQ3N3BcVkGFmZKTv+N3kEYO8dSJyz0YN/+ZrAMV1joK8
         aozyNbO8Nnnx3eG9BUd5w/ClsnqVEXToG6++zy8vntBTxQYM4bb7+b4H9VcDwmVeZkJo
         DlOxMwfdCrARo+TdY1sC52R5sbJ//WdFqgVZzqRohLHF+gFGwfSSPthghKI2FqvWhT/M
         XA6gm/tLNpNnBML0nlu0WL8OJZYSqWuKySmKCJBBiB1cwqbbeiLCQ2zoKkrCS/wWE82r
         ivew==
X-Gm-Message-State: ACrzQf2b7Wwil7dih9NXo8w2U2EiGZt23fzm7dt1bPae46pjjsDNRlXB
        u4BGk875mxYLI7c1Gpfgxr8=
X-Google-Smtp-Source: AMsMyM7xKY50gq51AwQGooCmzb92oqhjWfoqtpJzjWJpuBNE0o4ojWB2Sp43spzNn4HuLN/GV8Zjmg==
X-Received: by 2002:a05:600c:231a:b0:3cf:69d4:72d6 with SMTP id 26-20020a05600c231a00b003cf69d472d6mr2708556wmo.32.1667123002926;
        Sun, 30 Oct 2022 02:43:22 -0700 (PDT)
Received: from localhost ([77.78.20.135])
        by smtp.gmail.com with ESMTPSA id h5-20020adff185000000b00236863c02f5sm3670568wro.96.2022.10.30.02.43.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Oct 2022 02:43:22 -0700 (PDT)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Iskren Chernev <iskren.chernev@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 6/8] arm64: dts: qcom: sm6115: Add basic soc dtsi
Date:   Sun, 30 Oct 2022 11:42:56 +0200
Message-Id: <20221030094258.486428-7-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221030094258.486428-1-iskren.chernev@gmail.com>
References: <20221030094258.486428-1-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for Qualcomm SM6115 SoC. This includes:
- GCC
- Pinctrl
- RPM (CC+PD)
- USB
- MMC
- UFS

Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 854 +++++++++++++++++++++++++++
 1 file changed, 854 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sm6115.dtsi

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
new file mode 100644
index 000000000000..0340ed21be05
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -0,0 +1,854 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (c) 2021, Iskren Chernev <iskren.chernev@gmail.com>
+ */
+
+#include <dt-bindings/clock/qcom,gcc-sm6115.h>
+#include <dt-bindings/clock/qcom,rpmcc.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/power/qcom-rpmpd.h>
+
+/ {
+	interrupt-parent = <&intc>;
+
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	chosen { };
+
+	clocks {
+		xo_board: xo-board {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+		};
+
+		sleep_clk: sleep-clk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+		};
+	};
+
+	cpus {
+		#address-cells = <2>;
+		#size-cells = <0>;
+
+		CPU0: cpu@0 {
+			device_type = "cpu";
+			compatible = "qcom,kryo260";
+			reg = <0x0 0x0>;
+			capacity-dmips-mhz = <1024>;
+			dynamic-power-coefficient = <100>;
+			enable-method = "psci";
+			next-level-cache = <&L2_0>;
+			L2_0: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+			};
+		};
+
+		CPU1: cpu@1 {
+			device_type = "cpu";
+			compatible = "qcom,kryo260";
+			reg = <0x0 0x1>;
+			capacity-dmips-mhz = <1024>;
+			dynamic-power-coefficient = <100>;
+			enable-method = "psci";
+			next-level-cache = <&L2_0>;
+		};
+
+		CPU2: cpu@2 {
+			device_type = "cpu";
+			compatible = "qcom,kryo260";
+			reg = <0x0 0x2>;
+			capacity-dmips-mhz = <1024>;
+			dynamic-power-coefficient = <100>;
+			enable-method = "psci";
+			next-level-cache = <&L2_0>;
+		};
+
+		CPU3: cpu@3 {
+			device_type = "cpu";
+			compatible = "qcom,kryo260";
+			reg = <0x0 0x3>;
+			capacity-dmips-mhz = <1024>;
+			dynamic-power-coefficient = <100>;
+			enable-method = "psci";
+			next-level-cache = <&L2_0>;
+		};
+
+		CPU4: cpu@100 {
+			device_type = "cpu";
+			compatible = "qcom,kryo260";
+			reg = <0x0 0x100>;
+			enable-method = "psci";
+			capacity-dmips-mhz = <1638>;
+			dynamic-power-coefficient = <282>;
+			next-level-cache = <&L2_1>;
+			L2_1: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+			};
+		};
+
+		CPU5: cpu@101 {
+			device_type = "cpu";
+			compatible = "qcom,kryo260";
+			reg = <0x0 0x101>;
+			capacity-dmips-mhz = <1638>;
+			dynamic-power-coefficient = <282>;
+			enable-method = "psci";
+			next-level-cache = <&L2_1>;
+		};
+
+		CPU6: cpu@102 {
+			device_type = "cpu";
+			compatible = "qcom,kryo260";
+			reg = <0x0 0x102>;
+			capacity-dmips-mhz = <1638>;
+			dynamic-power-coefficient = <282>;
+			enable-method = "psci";
+			next-level-cache = <&L2_1>;
+		};
+
+		CPU7: cpu@103 {
+			device_type = "cpu";
+			compatible = "qcom,kryo260";
+			reg = <0x0 0x103>;
+			capacity-dmips-mhz = <1638>;
+			dynamic-power-coefficient = <282>;
+			enable-method = "psci";
+			next-level-cache = <&L2_1>;
+		};
+
+		cpu-map {
+			cluster0 {
+				core0 {
+					cpu = <&CPU0>;
+				};
+
+				core1 {
+					cpu = <&CPU1>;
+				};
+
+				core2 {
+					cpu = <&CPU2>;
+				};
+
+				core3 {
+					cpu = <&CPU3>;
+				};
+			};
+
+			cluster1 {
+				core0 {
+					cpu = <&CPU4>;
+				};
+
+				core1 {
+					cpu = <&CPU5>;
+				};
+
+				core2 {
+					cpu = <&CPU6>;
+				};
+
+				core3 {
+					cpu = <&CPU7>;
+				};
+			};
+		};
+	};
+
+	firmware {
+		scm: scm {
+			compatible = "qcom,scm-sm6115", "qcom,scm";
+			#reset-cells = <1>;
+		};
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		/* We expect the bootloader to fill in the size */
+		reg = <0 0x80000000 0 0>;
+	};
+
+	pmu {
+		compatible = "arm,armv8-pmuv3";
+		interrupts = <GIC_PPI 6 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	psci {
+		compatible = "arm,psci-1.0";
+		method = "smc";
+	};
+
+	reserved_memory: reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		hyp_mem: memory@45700000 {
+			reg = <0x0 0x45700000 0x0 0x600000>;
+			no-map;
+		};
+
+		xbl_aop_mem: memory@45e00000 {
+			reg = <0x0 0x45e00000 0x0 0x140000>;
+			no-map;
+		};
+
+		sec_apps_mem: memory@45fff000 {
+			reg = <0x0 0x45fff000 0x0 0x1000>;
+			no-map;
+		};
+
+		smem_mem: memory@46000000 {
+			compatible = "qcom,smem";
+			reg = <0x0 0x46000000 0x0 0x200000>;
+			no-map;
+
+			hwlocks = <&tcsr_mutex 3>;
+			qcom,rpm-msg-ram = <&rpm_msg_ram>;
+		};
+
+		cdsp_sec_mem: memory@46200000 {
+			reg = <0x0 0x46200000 0x0 0x1e00000>;
+			no-map;
+		};
+
+		pil_modem_mem: memory@4ab00000 {
+			reg = <0x0 0x4ab00000 0x0 0x6900000>;
+			no-map;
+		};
+
+		pil_video_mem: memory@51400000 {
+			reg = <0x0 0x51400000 0x0 0x500000>;
+			no-map;
+		};
+
+		wlan_msa_mem: memory@51900000 {
+			reg = <0x0 0x51900000 0x0 0x100000>;
+			no-map;
+		};
+
+		pil_cdsp_mem: memory@51a00000 {
+			reg = <0x0 0x51a00000 0x0 0x1e00000>;
+			no-map;
+		};
+
+		pil_adsp_mem: memory@53800000 {
+			reg = <0x0 0x53800000 0x0 0x2800000>;
+			no-map;
+		};
+
+		pil_ipa_fw_mem: memory@56100000 {
+			reg = <0x0 0x56100000 0x0 0x10000>;
+			no-map;
+		};
+
+		pil_ipa_gsi_mem: memory@56110000 {
+			reg = <0x0 0x56110000 0x0 0x5000>;
+			no-map;
+		};
+
+		pil_gpu_mem: memory@56115000 {
+			reg = <0x0 0x56115000 0x0 0x2000>;
+			no-map;
+		};
+
+		cont_splash_memory: memory@5c000000 {
+			reg = <0x0 0x5c000000 0x0 0x00f00000>;
+			no-map;
+		};
+
+		dfps_data_memory: memory@5cf00000 {
+			reg = <0x0 0x5cf00000 0x0 0x0100000>;
+			no-map;
+		};
+
+		removed_mem: memory@60000000 {
+			reg = <0x0 0x60000000 0x0 0x3900000>;
+			no-map;
+		};
+	};
+
+	rpm-glink {
+		compatible = "qcom,glink-rpm";
+
+		interrupts = <GIC_SPI 194 IRQ_TYPE_EDGE_RISING>;
+		qcom,rpm-msg-ram = <&rpm_msg_ram>;
+		mboxes = <&apcs_glb 0>;
+
+		rpm_requests: rpm-requests {
+			compatible = "qcom,rpm-sm6115";
+			qcom,glink-channels = "rpm_requests";
+
+			rpmcc: clock-controller {
+				compatible = "qcom,rpmcc-sm6115", "qcom,rpmcc";
+				#clock-cells = <1>;
+			};
+
+			rpmpd: power-controller {
+				compatible = "qcom,sm6115-rpmpd";
+				#power-domain-cells = <1>;
+				operating-points-v2 = <&rpmpd_opp_table>;
+
+				rpmpd_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					rpmpd_opp_min_svs: opp1 {
+						opp-level = <RPM_SMD_LEVEL_MIN_SVS>;
+					};
+
+					rpmpd_opp_low_svs: opp2 {
+						opp-level = <RPM_SMD_LEVEL_LOW_SVS>;
+					};
+
+					rpmpd_opp_svs: opp3 {
+						opp-level = <RPM_SMD_LEVEL_SVS>;
+					};
+
+					rpmpd_opp_svs_plus: opp4 {
+						opp-level = <RPM_SMD_LEVEL_SVS_PLUS>;
+					};
+
+					rpmpd_opp_nom: opp5 {
+						opp-level = <RPM_SMD_LEVEL_NOM>;
+					};
+
+					rpmpd_opp_nom_plus: opp6 {
+						opp-level = <RPM_SMD_LEVEL_NOM_PLUS>;
+					};
+
+					rpmpd_opp_turbo: opp7 {
+						opp-level = <RPM_SMD_LEVEL_TURBO>;
+					};
+
+					rpmpd_opp_turbo_plus: opp8 {
+						opp-level = <RPM_SMD_LEVEL_TURBO_NO_CPR>;
+					};
+				};
+			};
+		};
+	};
+
+	soc: soc@0 {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0 0 0 0xffffffff>;
+
+		tcsr_mutex: hwlock@340000 {
+			compatible = "qcom,tcsr-mutex";
+			reg = <0x00340000 0x20000>;
+			#hwlock-cells = <1>;
+		};
+
+		tlmm: pinctrl@500000 {
+			compatible = "qcom,sm6115-tlmm";
+			reg = <0x00500000 0x400000>, <0x00900000 0x400000>, <0x00d00000 0x400000>;
+			reg-names = "west", "south", "east";
+			interrupts = <GIC_SPI 227 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			gpio-ranges = <&tlmm 0 0 121>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+
+			sdc1_state_on: sdc1-on-state {
+				clk-pins {
+					pins = "sdc1_clk";
+					bias-disable;
+					drive-strength = <16>;
+				};
+
+				cmd-pins {
+					pins = "sdc1_cmd";
+					bias-pull-up;
+					drive-strength = <10>;
+				};
+
+				data-pins {
+					pins = "sdc1_data";
+					bias-pull-up;
+					drive-strength = <10>;
+				};
+
+				rclk-pins {
+					pins = "sdc1_rclk";
+					bias-pull-down;
+				};
+			};
+
+			sdc1_state_off: sdc1-off-state {
+				clk-pins {
+					pins = "sdc1_clk";
+					bias-disable;
+					drive-strength = <2>;
+				};
+
+				cmd-pins {
+					pins = "sdc1_cmd";
+					bias-pull-up;
+					drive-strength = <2>;
+				};
+
+				data-pins {
+					pins = "sdc1_data";
+					bias-pull-up;
+					drive-strength = <2>;
+				};
+
+				rclk-pins {
+					pins = "sdc1_rclk";
+					bias-pull-down;
+				};
+			};
+
+			sdc2_state_on: sdc2-on-state {
+				clk-pins {
+					pins = "sdc2_clk";
+					bias-disable;
+					drive-strength = <16>;
+				};
+
+				cmd-pins {
+					pins = "sdc2_cmd";
+					bias-pull-up;
+					drive-strength = <10>;
+				};
+
+				data-pins {
+					pins = "sdc2_data";
+					bias-pull-up;
+					drive-strength = <10>;
+				};
+
+				sd-cd-pins {
+					pins = "gpio88";
+					function = "gpio";
+					bias-pull-up;
+					drive-strength = <2>;
+				};
+			};
+
+			sdc2_state_off: sdc2-off-state {
+				clk-pins {
+					pins = "sdc2_clk";
+					bias-disable;
+					drive-strength = <2>;
+				};
+
+				cmd-pins {
+					pins = "sdc2_cmd";
+					bias-pull-up;
+					drive-strength = <2>;
+				};
+
+				data-pins {
+					pins = "sdc2_data";
+					bias-pull-up;
+					drive-strength = <2>;
+				};
+
+				sd-cd-pins {
+					pins = "gpio88";
+					function = "gpio";
+					bias-disable;
+					drive-strength = <2>;
+				};
+			};
+		};
+
+		gcc: clock-controller@1400000 {
+			compatible = "qcom,gcc-sm6115";
+			reg = <0x01400000 0x1f0000>;
+			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>, <&sleep_clk>;
+			clock-names = "bi_tcxo", "sleep_clk";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
+		usb_1_hsphy: phy@1613000 {
+			compatible = "qcom,sm6115-qusb2-phy";
+			reg = <0x01613000 0x180>;
+			#phy-cells = <0>;
+
+			clocks = <&gcc GCC_AHB2PHY_USB_CLK>, <&rpmcc RPM_SMD_XO_CLK_SRC>;
+			clock-names = "cfg_ahb", "ref";
+
+			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
+			nvmem-cells = <&qusb2_hstx_trim>;
+
+			status = "disabled";
+		};
+
+		qfprom@1b40000 {
+			compatible = "qcom,sm6115-qfprom", "qcom,qfprom";
+			reg = <0x01b40000 0x7000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			qusb2_hstx_trim: hstx-trim@25b {
+				reg = <0x25b 0x1>;
+				bits = <1 4>;
+			};
+		};
+
+		spmi_bus: spmi@1c40000 {
+			compatible = "qcom,spmi-pmic-arb";
+			reg = <0x01c40000 0x1100>,
+			      <0x01e00000 0x2000000>,
+			      <0x03e00000 0x100000>,
+			      <0x03f00000 0xa0000>,
+			      <0x01c0a000 0x26000>;
+			reg-names = "core", "chnls", "obsrvr", "intr", "cnfg";
+			interrupt-names = "periph_irq";
+			interrupts = <GIC_SPI 183 IRQ_TYPE_LEVEL_HIGH>;
+			qcom,ee = <0>;
+			qcom,channel = <0>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+			interrupt-controller;
+			#interrupt-cells = <4>;
+		};
+
+		rpm_msg_ram: sram@45f0000 {
+			compatible = "qcom,rpm-msg-ram";
+			reg = <0x045f0000 0x7000>;
+		};
+
+		sdhc_1: mmc@4744000 {
+			compatible = "qcom,sm6115-sdhci", "qcom,sdhci-msm-v5";
+			reg = <0x04744000 0x1000>, <0x04745000 0x1000>, <0x04748000 0x8000>;
+			reg-names = "hc", "cqhci", "ice";
+
+			interrupts = <GIC_SPI 348 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 352 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hc_irq", "pwr_irq";
+
+			clocks = <&gcc GCC_SDCC1_AHB_CLK>,
+				 <&gcc GCC_SDCC1_APPS_CLK>,
+				 <&xo_board>,
+				 <&gcc GCC_SDCC1_ICE_CORE_CLK>;
+			clock-names = "iface", "core", "xo", "ice";
+
+			pinctrl-0 = <&sdc1_state_on>;
+			pinctrl-1 = <&sdc1_state_off>;
+			pinctrl-names = "default", "sleep";
+
+			bus-width = <8>;
+			status = "disabled";
+		};
+
+		sdhc_2: mmc@4784000 {
+			compatible = "qcom,sm6115-sdhci", "qcom,sdhci-msm-v5";
+			reg = <0x04784000 0x1000>;
+			reg-names = "hc";
+
+			interrupts = <GIC_SPI 350 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hc_irq", "pwr_irq";
+
+			clocks = <&gcc GCC_SDCC2_AHB_CLK>, <&gcc GCC_SDCC2_APPS_CLK>, <&xo_board>;
+			clock-names = "iface", "core", "xo";
+
+			pinctrl-0 = <&sdc2_state_on>;
+			pinctrl-1 = <&sdc2_state_off>;
+			pinctrl-names = "default", "sleep";
+
+			power-domains = <&rpmpd SM6115_VDDCX>;
+			operating-points-v2 = <&sdhc2_opp_table>;
+			iommus = <&apps_smmu 0x00a0 0x0>;
+			resets = <&gcc GCC_SDCC2_BCR>;
+
+			bus-width = <4>;
+			qcom,dll-config = <0x0007642c>;
+			qcom,ddr-config = <0x80040868>;
+			status = "disabled";
+
+			sdhc2_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-100000000 {
+					opp-hz = /bits/ 64 <100000000>;
+					required-opps = <&rpmpd_opp_low_svs>;
+				};
+
+				opp-202000000 {
+					opp-hz = /bits/ 64 <202000000>;
+					required-opps = <&rpmpd_opp_nom>;
+				};
+			};
+		};
+
+		ufs_mem_hc: ufs@4804000 {
+			compatible = "qcom,sm6115-ufshc", "qcom,ufshc", "jedec,ufs-2.0";
+			reg = <0x04804000 0x3000>, <0x04810000 0x8000>;
+			interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
+			phys = <&ufs_mem_phy_lanes>;
+			phy-names = "ufsphy";
+			lanes-per-direction = <1>;
+			#reset-cells = <1>;
+			resets = <&gcc GCC_UFS_PHY_BCR>;
+			reset-names = "rst";
+
+			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
+			iommus = <&apps_smmu 0x100 0>;
+
+			clocks = <&gcc GCC_UFS_PHY_AXI_CLK>,
+				 <&gcc GCC_SYS_NOC_UFS_PHY_AXI_CLK>,
+				 <&gcc GCC_UFS_PHY_AHB_CLK>,
+				 <&gcc GCC_UFS_PHY_UNIPRO_CORE_CLK>,
+				 <&rpmcc RPM_SMD_XO_CLK_SRC>,
+				 <&gcc GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
+				 <&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>,
+				 <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
+			clock-names = "core_clk",
+				      "bus_aggr_clk",
+				      "iface_clk",
+				      "core_clk_unipro",
+				      "ref_clk",
+				      "tx_lane0_sync_clk",
+				      "rx_lane0_sync_clk",
+				      "ice_core_clk";
+
+			freq-table-hz = <50000000 200000000>,
+					<0 0>,
+					<0 0>,
+					<37500000 150000000>,
+					<75000000 300000000>,
+					<0 0>,
+					<0 0>,
+					<0 0>;
+
+			status = "disabled";
+		};
+
+		ufs_mem_phy: phy@4807000 {
+			compatible = "qcom,sm6115-qmp-ufs-phy";
+			reg = <0x04807000 0x1c4>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+
+			clocks = <&gcc GCC_UFS_CLKREF_CLK>, <&gcc GCC_UFS_PHY_PHY_AUX_CLK>;
+			clock-names = "ref", "ref_aux";
+
+			resets = <&ufs_mem_hc 0>;
+			reset-names = "ufsphy";
+			status = "disabled";
+
+			ufs_mem_phy_lanes: phy@4807400 {
+				reg = <0x4807400 0x098>,
+				      <0x4807600 0x130>,
+				      <0x4807c00 0x16c>;
+				#phy-cells = <0>;
+			};
+		};
+
+		usb_1: usb@4ef8800 {
+			compatible = "qcom,sm6115-dwc3", "qcom,dwc3";
+			reg = <0x04ef8800 0x400>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+
+			clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
+				 <&gcc GCC_USB30_PRIM_MASTER_CLK>,
+				 <&gcc GCC_SYS_NOC_USB3_PRIM_AXI_CLK>,
+				 <&gcc GCC_USB30_PRIM_SLEEP_CLK>,
+				 <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
+				 <&gcc GCC_USB3_PRIM_CLKREF_CLK>;
+			clock-names = "cfg_noc", "core", "iface", "sleep", "mock_utmi", "xo";
+
+			assigned-clocks = <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
+					  <&gcc GCC_USB30_PRIM_MASTER_CLK>;
+			assigned-clock-rates = <19200000>, <66666667>;
+
+			interrupts = <GIC_SPI 260 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hs_phy_irq", "ss_phy_irq";
+
+			resets = <&gcc GCC_USB30_PRIM_BCR>;
+			power-domains = <&gcc GCC_USB30_PRIM_GDSC>;
+			qcom,select-utmi-as-pipe-clk;
+			status = "disabled";
+
+			usb_1_dwc3: usb@4e00000 {
+				compatible = "snps,dwc3";
+				reg = <0x04e00000 0xcd00>;
+				interrupts = <GIC_SPI 255 IRQ_TYPE_LEVEL_HIGH>;
+				phys = <&usb_1_hsphy>;
+				phy-names = "usb2-phy";
+				iommus = <&apps_smmu 0x120 0x0>;
+				snps,dis_u2_susphy_quirk;
+				snps,dis_enblslpm_quirk;
+				snps,has-lpm-erratum;
+				snps,hird-threshold = /bits/ 8 <0x10>;
+				snps,usb3_lpm_capable;
+				maximum-speed = "high-speed";
+				dr_mode = "peripheral";
+			};
+		};
+
+		apps_smmu: iommu@c600000 {
+			compatible = "qcom,sm6115-smmu-500", "arm,mmu-500";
+			reg = <0x0c600000 0x80000>;
+			#iommu-cells = <2>;
+			#global-interrupts = <1>;
+
+			interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		apcs_glb: mailbox@f111000 {
+			compatible = "qcom,sm6115-apcs-hmss-global";
+			reg = <0x0f111000 0x1000>;
+
+			#mbox-cells = <1>;
+		};
+
+		timer@f120000 {
+			compatible = "arm,armv7-timer-mem";
+			reg = <0x0f120000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clock-frequency = <19200000>;
+
+			frame@f121000 {
+				reg = <0x0f121000 0x1000>, <0x0f122000 0x1000>;
+				frame-number = <0>;
+				interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			frame@f123000 {
+				reg = <0x0f123000 0x1000>;
+				frame-number = <1>;
+				interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			frame@f124000 {
+				reg = <0x0f124000 0x1000>;
+				frame-number = <2>;
+				interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			frame@f125000 {
+				reg = <0x0f125000 0x1000>;
+				frame-number = <3>;
+				interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			frame@f126000 {
+				reg = <0x0f126000 0x1000>;
+				frame-number = <4>;
+				interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			frame@f127000 {
+				reg = <0x0f127000 0x1000>;
+				frame-number = <5>;
+				interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			frame@f128000 {
+				reg = <0x0f128000 0x1000>;
+				frame-number = <6>;
+				interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+		};
+
+		intc: interrupt-controller@f200000 {
+			compatible = "arm,gic-v3";
+			reg = <0x0f200000 0x10000>, <0x0f300000 0x100000>;
+			#interrupt-cells = <3>;
+			interrupt-controller;
+			interrupt-parent = <&intc>;
+			#redistributor-regions = <1>;
+			redistributor-stride = <0x0 0x20000>;
+			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 1 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 2 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 3 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 0 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
+	};
+};
-- 
2.38.1

