Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7AD0518869B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2020 14:58:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726735AbgCQN6P (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Mar 2020 09:58:15 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:53357 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726740AbgCQN55 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Mar 2020 09:57:57 -0400
Received: by mail-wm1-f68.google.com with SMTP id 25so21579391wmk.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2020 06:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KKC3ZGRiSdLIkKwV88qQTvKvn0/RzcGotU3LdLgzl1U=;
        b=N7mF7Hc3YT37vBthOqaQ3pRdnsShxabwSnxuPuRl4YdkOByMYhyWOOxAQuLqny4nLG
         m9VoUnfrLQVlv0U/yAYz9MGUaIbzI+ozA5/KesXNg5ctLdCtaBqCtlfRk/agPExFstUN
         XtUK/9SySZRxi/jmeaYecebvIOaWawFWXLz/ueivkDDXrVo+hXK9owzlqlsMVdYO2PRp
         BGCmt7AgmZKagoaRBVUdR1wmZ8twUJ0VEqq9gMjRB6ROpM4Y1Mf9+5qiXXuu40JmrfAi
         dPheCJiKS+xgScgz6Z3GkcaAnoh9E7VMjwn6qooE/4q6v1oY3InKmIAJ+XBq6z+pr0EY
         sUJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KKC3ZGRiSdLIkKwV88qQTvKvn0/RzcGotU3LdLgzl1U=;
        b=FqhrlABuHe4cCMIoRLVCngyvlKzogDJcHLp0kxH9nEv5vsSx4xaxLer6LXIhV/iTrU
         8rEiv7C59LhmqVWtuJfeTqInuUmR9jiwgJCe7O7IuY3FMZP9bGnIn9iKtNNohcHjlEGy
         bznt2AW7Nus7cO5AyPPMx/sfpgx2kz8DNQbs/XQ2hmBIo5yDUMlKNmx5HhHfNYyEGIQP
         VZqCx5Kz0An/fjd3e2ApaqG7+SQgUABAVUXbdhiwiLDe4//BOakHbSonCzj3sqOAv6L6
         /MHQXQr8XBrzgQwLYzEHuFHnq13CB/LHpjYdxvfp6lIDWtTXNUKMuLj5A7EjHcLsuEH+
         rn4w==
X-Gm-Message-State: ANhLgQ32jR97Wp/8fCelazvqkuVsEEv69RPmXhJ5VWZLrZ/Nf6dd6A0L
        c0uuuaN0LoV4zgSVFrK1ahm9QA==
X-Google-Smtp-Source: ADFU+vtzmvC3LVNiLYHnAHL2ZcThRB7+VYfJfGi1TFUAGXMsXDpg3P+/1X76mVZ64sIveKkAaijsuA==
X-Received: by 2002:a1c:1b0e:: with SMTP id b14mr5499298wmb.8.1584453474984;
        Tue, 17 Mar 2020 06:57:54 -0700 (PDT)
Received: from xps7590.local ([2a02:2450:102f:13b8:84f7:5c25:a9d8:81a1])
        by smtp.gmail.com with ESMTPSA id r3sm2976558wrn.35.2020.03.17.06.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2020 06:57:54 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        mark.rutland@arm.com, catalin.marinas@arm.com, will@kernel.org,
        shawnguo@kernel.org, olof@lixom.net, maxime@cerno.tech,
        Anson.Huang@nxp.com, dinguyen@kernel.org, leonard.crestez@nxp.com,
        marcin.juszkiewicz@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Loic Poulain <loic.poulain@linaro.org>
Cc:     Robert Foss <robert.foss@linaro.org>
Subject: [v2 3/6] arm64: dts: sdm845: Add i2c-qcom-cci node
Date:   Tue, 17 Mar 2020 14:57:37 +0100
Message-Id: <20200317135740.19412-4-robert.foss@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200317135740.19412-1-robert.foss@linaro.org>
References: <20200317135740.19412-1-robert.foss@linaro.org>
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
 -  Give CCI i2c-bus nodes labels


 arch/arm64/boot/dts/qcom/sdm845-db845c.dts |  4 +
 arch/arm64/boot/dts/qcom/sdm845.dtsi       | 92 ++++++++++++++++++++++
 2 files changed, 96 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index eb77aaa6a819..a6b6837c3d68 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -583,3 +583,7 @@
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
@@ -1451,6 +1452,42 @@
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
@@ -2608,6 +2645,61 @@
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
2.20.1

