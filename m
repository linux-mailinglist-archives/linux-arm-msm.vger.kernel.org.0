Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1932617A838
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2020 15:54:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727101AbgCEOx7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Mar 2020 09:53:59 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:45549 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727053AbgCEOx6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Mar 2020 09:53:58 -0500
Received: by mail-wr1-f68.google.com with SMTP id v2so7362290wrp.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2020 06:53:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OmaQCGR2d/jCJOEqDz74ElNR+xHpYD15I1t0df1LVBM=;
        b=EMkNsNXwSLFK43B5vW8RP9Rz0sCrutRS7eF7B06ftRC4uJWvKCaBQA5orswU9UdcBH
         KxAaJ9nfxztkzzW7qqZ5jHMXo1rqyf7+wf1CAKIVtjTSzrZM67LBmkj82dmwhgMNhZol
         EhtPnvgU1FnokVczuAFUcarHCI+dGqOqPF9dKT4L4oQ1gVDnLLjQjr1zWblw4usYNyWS
         jAPJBXlTpiZa3GdrutFMvirbz3BHciU9gPp2JrXYxlHzpYJnNMCiyrZXLLW51U4QM6XC
         wbxRAP3nWFBGyRXDWiN0Ufu7lWIsmvJ3QKHq8mELB+ahig3SmwjXuIFTqnW3ZMPHW85a
         wAng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OmaQCGR2d/jCJOEqDz74ElNR+xHpYD15I1t0df1LVBM=;
        b=KCUQb8nckRqqlN1zg07TJto6uzeN5f/owCRcM7Awx0hYe3DMgsJdiVnFhl9uqy3Mcm
         eUkR8TR0OilicAhOH1TYCFEE3gJA8Qm7tRuvqfgVWHuBmnpwpQ6eGPNMVGcB/M1pwPFY
         p18beGJvTBwCCm5oPAm4Wlv5SY49FVkjDJYjPVqfdo6xQFmNvqz5JEnq6tTjYeAPaijY
         7s9LWcaoQq/iSuDLC+8fEm8HNmgx67M3bRHhqY05odpUQIgIBbjuqoYidOV0UudGI20U
         JfI71J9WLJy6/XeKupqhMssE6bwSAehzE6X/dkbc4fIfk5OBGnLLeOAx4uToZ4slDhWW
         zkCQ==
X-Gm-Message-State: ANhLgQ1DZy9n2Wykx/NqmvkstN04nTaRO2pnOF9SSL48YtiFqBZ9/qo5
        tjIbogcDVKKRi/uzUM2/2rjRzw==
X-Google-Smtp-Source: ADFU+vtZRDF5yv7ApxoautiIG6WRRPe+gCKcRkTSjflHb6UO4PHJzUZb+PFpIFuRjTSjC0Rbnd+tmg==
X-Received: by 2002:a05:6000:ca:: with SMTP id q10mr10452080wrx.78.1583420035477;
        Thu, 05 Mar 2020 06:53:55 -0800 (PST)
Received: from srini-hackbox.lan (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.gmail.com with ESMTPSA id f16sm35785985wrx.25.2020.03.05.06.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2020 06:53:54 -0800 (PST)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 3/4] arm64: dts: qcom: db845c: add analog audio support
Date:   Thu,  5 Mar 2020 14:53:43 +0000
Message-Id: <20200305145344.14670-4-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200305145344.14670-1-srinivas.kandagatla@linaro.org>
References: <20200305145344.14670-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch adds support to Analog audio via WSA881x speakers.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 113 +++++++++++++++++++++
 1 file changed, 113 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index 6e60e81f8db7..350d3ea60235 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -8,6 +8,8 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include <dt-bindings/sound/qcom,q6afe.h>
+#include <dt-bindings/sound/qcom,q6asm.h>
 #include "sdm845.dtsi"
 #include "pm8998.dtsi"
 #include "pmi8998.dtsi"
@@ -200,6 +202,41 @@
 	firmware-name = "qcom/sdm845/adsp.mdt";
 };
 
+
+&slim_msm {
+	ngd@1 {
+		wcd9340: codec@1{
+			clock-names = "extclk";
+			clocks = <&rpmhcc RPMH_LN_BB_CLK2>;
+			vdd-buck-supply = <&vreg_s4a_1p8>;
+			vdd-buck-sido-supply = <&vreg_s4a_1p8>;
+			vdd-tx-supply = <&vreg_s4a_1p8>;
+			vdd-rx-supply = <&vreg_s4a_1p8>;
+			vdd-io-supply = <&vreg_s4a_1p8>;
+
+			swm: swm@c85 {
+				left_spkr:wsa8810-left{
+					compatible = "sdw10217201000";
+					reg = <0 1>;
+					powerdown-gpios = <&wcdpinctrl 2 0>;
+					#thermal-sensor-cells = <0>;
+					sound-name-prefix = "SpkrLeft";
+					#sound-dai-cells = <0>;
+				};
+
+				right_spkr:wsa8810-right{
+					compatible = "sdw10217201000";
+					powerdown-gpios = <&wcdpinctrl 2 0>;
+					reg = <0 2>;
+					#thermal-sensor-cells = <0>;
+					sound-name-prefix = "SpkrRight";
+					#sound-dai-cells = <0>;
+				};
+			};
+		};
+	};
+};
+
 &apps_rsc {
 	pm8998-rpmh-regulators {
 		compatible = "qcom,pm8998-rpmh-regulators";
@@ -674,3 +711,79 @@
 		bias-pull-up;
 	};
 };
+
+/* QUAT I2S Uses 4 I2S SD Lines for audio on LT9611 HDMI Bridge */
+&q6afedai {
+	qi2s@22 {
+		reg = <22>;
+		qcom,sd-lines = <0 1 2 3>;
+	};
+};
+
+&sound {
+	compatible = "qcom,db845c-sndcard";
+	pinctrl-0 = <&quat_mi2s_active
+			 &quat_mi2s_sd0_active
+			 &quat_mi2s_sd1_active
+			 &quat_mi2s_sd2_active
+			 &quat_mi2s_sd3_active>;
+	pinctrl-names = "default";
+	model = "DB845c";
+	audio-routing =
+		"RX_BIAS", "MCLK",
+		"AMIC1", "MIC BIAS1",
+		"AMIC2", "MIC BIAS2",
+		"DMIC0", "MIC BIAS1",
+		"DMIC1", "MIC BIAS1",
+		"DMIC2", "MIC BIAS3",
+		"DMIC3", "MIC BIAS3",
+		"SpkrLeft IN", "SPK1 OUT",
+		"SpkrRight IN", "SPK2 OUT",
+		"MM_DL1",  "MultiMedia1 Playback",
+		"MM_DL2",  "MultiMedia2 Playback",
+		"MultiMedia3 Capture", "MM_UL3";
+
+	mm1-dai-link {
+		link-name = "MultiMedia1";
+		cpu {
+			sound-dai = <&q6asmdai  MSM_FRONTEND_DAI_MULTIMEDIA1>;
+		};
+	};
+
+	mm2-dai-link {
+		link-name = "MultiMedia2";
+		cpu {
+			sound-dai = <&q6asmdai  MSM_FRONTEND_DAI_MULTIMEDIA2>;
+		};
+	};
+
+	slim-dai-link {
+		link-name = "SLIM Playback";
+		cpu {
+			sound-dai = <&q6afedai SLIMBUS_0_RX>;
+		};
+
+		platform {
+			sound-dai = <&q6routing>;
+		};
+
+		codec {
+			sound-dai =  <&left_spkr>, <&right_spkr>, <&swm 0>, <&wcd9340 0>;
+		};
+	};
+
+	slimcap-dai-link {
+		link-name = "SLIM Capture";
+		cpu {
+			sound-dai = <&q6afedai SLIMBUS_0_TX>;
+		};
+
+		platform {
+			sound-dai = <&q6routing>;
+		};
+
+		codec {
+			sound-dai = <&wcd9340 1>;
+		};
+	};
+};
-- 
2.21.0

