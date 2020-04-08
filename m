Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A5AE1A22A2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2020 15:10:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729064AbgDHNKx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Apr 2020 09:10:53 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:43581 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729068AbgDHNKx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Apr 2020 09:10:53 -0400
Received: by mail-wr1-f68.google.com with SMTP id i10so1446519wrv.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2020 06:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=obuHiJ7084xLsI7nA8kFM9id9M8y90Fq0uWuJodV6eM=;
        b=zRpDOg2kCRpS2XrqM/rxkPss6quxnK/Q3m+TXbMd8OqPBShaw0PMZB8KBgGa8jSaL/
         7bKe0lPWSKYrm3QZxrrUXVmyT/1YrPcvuQJuGJwIU3U/cRtN8+lvWVMe7Qxa1JGRE4DM
         Pl1a0YmxgqNykLqKogP0YqTUUup2VK8cYwsZMtw3KPYmpUXMITclhbDjEDgPLFyQKMRR
         uTf21XTCL6BukVxPV/w79zked5DKzVmu5LHdJbsMo5W95XgBEAUGLsX1Fn09+qsY16GW
         k6DMRdnbsOFDWUXs9UpptmotPVrKNX6YWJ/4V4ihEjHy4+fpdZ1xxBseZQkegLCk3DP4
         nrxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=obuHiJ7084xLsI7nA8kFM9id9M8y90Fq0uWuJodV6eM=;
        b=i16eaAD+qtF9mvfV3zLNioFkqLL5LLaXpLyzmFa+jQ3TUhFgqCEfUKL6RuBcjYnI47
         KqYsIjUfCf3uxt/aA5jl2MvuVL9w+Q7dXL2kAAcfcQR+E/RyhRgQGL5oFS3xxTSyLBLq
         t/749eZOUsywfvcGRij41a7rVakaw3CCsKjSbpwx4RiOOkArnI5aaL3fEUFeJw6R33WZ
         +oe2W9+uqmn++hhxhRRD0J/M+ozQEYYVG06M1QmpA8ZF4Gr5T/QNDCLC2pCuS/h9EACG
         X9Hha+7iHVeieZx8RLHLWStmC+csqEaoLY8N3hEbB9jDyxKUtoEwFeNo6yqaaX+0/k1A
         30fQ==
X-Gm-Message-State: AGi0PuYSLItA+BCITiZR4yECySCPj47W8rID86pYS92Xql9S6yqK+Gqx
        2bjG0WEk3OEnVJw7MLA2M2Ndbw==
X-Google-Smtp-Source: APiQypLlRqe1vxdnbeesA/18275cB5NgKIQ/LqbHzPm4GlATdf7ZYGiIdlh3Pr/n9yCWR5fPyF2SWg==
X-Received: by 2002:a5d:4d87:: with SMTP id b7mr8112164wru.36.1586351450054;
        Wed, 08 Apr 2020 06:10:50 -0700 (PDT)
Received: from localhost.localdomain ([37.120.50.78])
        by smtp.gmail.com with ESMTPSA id f4sm18428044wrp.80.2020.04.08.06.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2020 06:10:49 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        catalin.marinas@arm.com, will@kernel.org, shawnguo@kernel.org,
        leoyang.li@nxp.com, Anson.Huang@nxp.com, olof@lixom.net,
        leonard.crestez@nxp.com, geert+renesas@glider.be,
        marcin.juszkiewicz@linaro.org, valentin.schneider@arm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Loic Poulain <loic.poulain@linaro.org>,
        Luca Weiss <luca@z3ntu.xyz>
Cc:     Robert Foss <robert.foss@linaro.org>
Subject: [PATCH v4 3/6] arm64: dts: sdm845: Add i2c-qcom-cci node
Date:   Wed,  8 Apr 2020 15:09:56 +0200
Message-Id: <20200408130959.2717409-4-robert.foss@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200408130959.2717409-1-robert.foss@linaro.org>
References: <20200408130959.2717409-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The sdm845 SOC ships with a CCI controller, which
has two CCI/I2C buses.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
 - Pad addresses to 8 bytes
 - Sort clock_camcc by address
 - Change cciX pinctrl node names
 - Remove pinmux/pinconf nodes from pinctrl nodes
 - Remove clk suffix from CCI node clock-names
 - Give CCI i2c-bus nodes labels

 arch/arm64/boot/dts/qcom/sdm845-db845c.dts |  4 +
 arch/arm64/boot/dts/qcom/sdm845.dtsi       | 92 ++++++++++++++++++++++
 2 files changed, 96 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index a2e05926b429..8644a2f6095a 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -866,3 +866,7 @@ pinconf-rx {
 		bias-pull-up;
 	};
 };
+
+&cci {
+	status = "ok";
+};
diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 8f926b5234d4..f3eb1dc11ac6 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -5,6 +5,7 @@
  * Copyright (c) 2018, The Linux Foundation. All rights reserved.
  */
 
+#include <dt-bindings/clock/qcom,camcc-sdm845.h>
 #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
 #include <dt-bindings/clock/qcom,gcc-sdm845.h>
 #include <dt-bindings/clock/qcom,gpucc-sdm845.h>
@@ -1813,6 +1814,42 @@ tlmm: pinctrl@3400000 {
 			gpio-ranges = <&tlmm 0 0 150>;
 			wakeup-parent = <&pdc_intc>;
 
+			cci0_default: cci0-default {
+				/* SDA, SCL */
+				pins = "gpio17", "gpio18";
+				function = "cci_i2c";
+
+				bias-pull-up;
+				drive-strength = <2>; /* 2 mA */
+			};
+
+			cci0_sleep: cci0-sleep {
+				/* SDA, SCL */
+				pins = "gpio17", "gpio18";
+				function = "cci_i2c";
+
+				drive-strength = <2>; /* 2 mA */
+				bias-pull-down;
+			};
+
+			cci1_default: cci1-default {
+				/* SDA, SCL */
+				pins = "gpio19", "gpio20";
+				function = "cci_i2c";
+
+				bias-pull-up;
+				drive-strength = <2>; /* 2 mA */
+			};
+
+			cci1_sleep: cci1-sleep {
+				/* SDA, SCL */
+				pins = "gpio19", "gpio20";
+				function = "cci_i2c";
+
+				drive-strength = <2>; /* 2 mA */
+				bias-pull-down;
+			};
+
 			qspi_clk: qspi-clk {
 				pinmux {
 					pins = "gpio95";
@@ -3194,6 +3231,61 @@ videocc: clock-controller@ab00000 {
 			#reset-cells = <1>;
 		};
 
+		cci: cci@ac4a000 {
+			compatible = "qcom,sdm845-cci";
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			reg = <0 0x0ac4a000 0 0x4000>;
+			interrupts = <GIC_SPI 460 IRQ_TYPE_EDGE_RISING>;
+			power-domains = <&clock_camcc TITAN_TOP_GDSC>;
+
+			clocks = <&clock_camcc CAM_CC_CAMNOC_AXI_CLK>,
+				<&clock_camcc CAM_CC_SOC_AHB_CLK>,
+				<&clock_camcc CAM_CC_SLOW_AHB_CLK_SRC>,
+				<&clock_camcc CAM_CC_CPAS_AHB_CLK>,
+				<&clock_camcc CAM_CC_CCI_CLK>,
+				<&clock_camcc CAM_CC_CCI_CLK_SRC>;
+			clock-names = "camnoc_axi",
+				"soc_ahb",
+				"slow_ahb_src",
+				"cpas_ahb",
+				"cci",
+				"cci_src";
+
+			assigned-clocks = <&clock_camcc CAM_CC_CAMNOC_AXI_CLK>,
+				<&clock_camcc CAM_CC_CCI_CLK>;
+			assigned-clock-rates = <80000000>, <37500000>;
+
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&cci0_default &cci1_default>;
+			pinctrl-1 = <&cci0_sleep &cci1_sleep>;
+
+			status = "disabled";
+
+			cci_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		clock_camcc: clock-controller@ad00000 {
+			compatible = "qcom,sdm845-camcc";
+			reg = <0 0x0ad00000 0 0x10000>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		mdss: mdss@ae00000 {
 			compatible = "qcom,sdm845-mdss";
 			reg = <0 0x0ae00000 0 0x1000>;
-- 
2.25.1

