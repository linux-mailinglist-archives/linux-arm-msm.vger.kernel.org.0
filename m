Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E287191583
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2020 17:00:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728429AbgCXP67 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Mar 2020 11:58:59 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:35775 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728300AbgCXP65 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Mar 2020 11:58:57 -0400
Received: by mail-wm1-f65.google.com with SMTP id m3so4110112wmi.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2020 08:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TBYaP2vsyfjpwpmYdocpG4qegwrjQ0C3wk8Hsfu1Y/w=;
        b=SsYgwQaUoSmYVCBWgE9BQzt3RCSVmqXMexs3Ypisb3v86af/zdjtm7+6dQ61ssgEOe
         9LMAgo/FP1YW6hOwLeTRJtSBad2V5g/rJ2p78jIgr+QZdjSR+0ZYDwbAmXC8+QYIQDVX
         H3i2n4b+Tp3orgL7YXDu4nC9Lg/RjYREGSOoS6k7Zzr/wztYxTGvVkRVxya2sVwIq+Fn
         o2sp/PAnCgg/ulkf/iYrOJpKrePmLMHa1Cf5kZ6jvgEektGhojyS9PfsWtJlFJpKHOJi
         YWK8fcYqB2mxAhToD0I/gohFiPkoEyS+WLQDr/LRj1VQwtvYcZhueB6PyuNJHmxR13Jw
         eytg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TBYaP2vsyfjpwpmYdocpG4qegwrjQ0C3wk8Hsfu1Y/w=;
        b=uCF36kg7Njjd/QgBEy0y3lgTEEDSAmTy/pI69eFPXSzfLQLCCTX+0NPEwZTeThY21l
         m2Z5ieNeLysHMXGzq2NmoQHHTrJbOiWUU/wb4nt36AK7peV0tlciJGDSWwysShpmQTLZ
         SK2+fRpHOIcJ5AvUcvwAG72ra26SdXvSXAIHmKKigqpnmxF7LOy+wToSTgRHU7UEB6Nt
         y3hGIs1JU5Wb08R8mW7RGpwUK10id3/nvUz+bdYqmiurU2lj16xssmv4VOBXLdMlbtsL
         fOLUgRBg8jfuqqW2sJA9ozmjAk90V6lcHzpjlpIPsaFBW1gET2dg3attK5066VBaM/Pz
         cozA==
X-Gm-Message-State: ANhLgQ3RgGxpNjgKCKwXctqHH/4EgAuuOjcdZVRRvidSGCvkEWjGcZHB
        VJP1JNLcmdF1+Fa7L5QN1KzvTQ==
X-Google-Smtp-Source: ADFU+vvYiq9W4c0hmv6urRGxwAanhG7SOtOWDVdqA2ynUrbzpq9wr12pHubZf8XKqIXJ6UOSsR9Xjg==
X-Received: by 2002:a7b:c20d:: with SMTP id x13mr6292071wmi.52.1585065533268;
        Tue, 24 Mar 2020 08:58:53 -0700 (PDT)
Received: from xps7590.local ([2a02:2450:102f:13b8:e15d:2127:89a:e5dc])
        by smtp.gmail.com with ESMTPSA id t124sm4993321wmg.13.2020.03.24.08.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 08:58:52 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        mark.rutland@arm.com, catalin.marinas@arm.com, will@kernel.org,
        shawnguo@kernel.org, olof@lixom.net, Anson.Huang@nxp.com,
        dinguyen@kernel.org, leonard.crestez@nxp.com,
        marcin.juszkiewicz@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Loic Poulain <loic.poulain@linaro.org>,
        Luca Weiss <luca@z3ntu.xyz>
Cc:     Robert Foss <robert.foss@linaro.org>
Subject: [v3 3/6] arm64: dts: sdm845: Add i2c-qcom-cci node
Date:   Tue, 24 Mar 2020 16:58:39 +0100
Message-Id: <20200324155843.10719-4-robert.foss@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200324155843.10719-1-robert.foss@linaro.org>
References: <20200324155843.10719-1-robert.foss@linaro.org>
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
index eb77aaa6a819..a6b6837c3d68 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -583,3 +583,7 @@ pinconf-rx {
 		bias-pull-up;
 	};
 };
+
+&cci {
+	status = "ok";
+};
diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index d42302b8889b..91a60847026f 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -5,6 +5,7 @@
  * Copyright (c) 2018, The Linux Foundation. All rights reserved.
  */
 
+#include <dt-bindings/clock/qcom,camcc-sdm845.h>
 #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
 #include <dt-bindings/clock/qcom,gcc-sdm845.h>
 #include <dt-bindings/clock/qcom,gpucc-sdm845.h>
@@ -1451,6 +1452,42 @@ tlmm: pinctrl@3400000 {
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
@@ -2608,6 +2645,61 @@ videocc: clock-controller@ab00000 {
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

