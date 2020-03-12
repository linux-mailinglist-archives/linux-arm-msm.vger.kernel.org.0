Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 01C8B183310
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2020 15:30:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727731AbgCLOav (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Mar 2020 10:30:51 -0400
Received: from mail-wr1-f43.google.com ([209.85.221.43]:36903 "EHLO
        mail-wr1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727718AbgCLOav (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Mar 2020 10:30:51 -0400
Received: by mail-wr1-f43.google.com with SMTP id 6so7761410wre.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2020 07:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Avkf50vmIXVLn6vftt8SeIEwKsLAXThhjPmhmV2jMv0=;
        b=jgrChhvTkmqOK/HunW66SirMl/ynwIK6Aeod19ZbOXj6bEX/phSlSiC5vD2OtZWrVz
         8lVfAAu2i5M+sFpr54NOgqEvPfO3XOK/hR9BF0+Or+jMIBHDkTOEAU26s9cL8Ma0DekB
         1hkbYg4mlcEEmQN7OkgBMjVdgsb1KqfCLPxRQDrN/VEROg5hesseT+r0olW+OvhUcs+q
         U16MHvf4JgGOuxb3rKXVytWFMTubvZeSAg1e198v0MRFKRO4XywUz2MD+UkOWAPO7cWs
         QSZ6l94A0TUiYpz23tB7wzF+P9JeN0m0dPhlf1Yu/H+RBC7+FwDZSTTDAePIzo0N67Ez
         bdiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Avkf50vmIXVLn6vftt8SeIEwKsLAXThhjPmhmV2jMv0=;
        b=M/0+eeU6VyeZdojJ81ptdhBmKxZi+qhNmVFormQzjLvY7aVIvNkeNKEAAPvn9R1Xpj
         9h3h5OokFd0dYYGxdYo2woHMXhzYs+4Fbrif9iaTpjFFg1C0xAZsGJlTrDfuU3SK28Sm
         uwuGxeFEd4UH4bjeSMWlAb03CLsMYm9+WsUHRXc1o0KdeRlQtUqwMvbSKthlaZBWOWzx
         AGL2z/fmEhug7YuFml5w1Jc5lyLCafgfCfF8IDomJewrznk491DHy0sw7sW7diG/OSdB
         9jLjiAcFUHiSBt1ZWNiTPJE02/ZqD5FDiKSVBV4dC17PG7b9dJUXAhhkdqzDu2vPFd65
         wn3w==
X-Gm-Message-State: ANhLgQ2/Sh3v5ewI06+acU2UiW31cHdG++ykJ6eLuwRD993+b1yhr9BI
        pDEsw82Oob1zvC9hkik2OZpt4A==
X-Google-Smtp-Source: ADFU+vsXVtVEuVdxGV3DL215cc14Vmb07eGBnvaa7iMqhEAt7kSzEw36/IKC+StZ02WGLY/NpcRSog==
X-Received: by 2002:a5d:640a:: with SMTP id z10mr6984140wru.301.1584023448654;
        Thu, 12 Mar 2020 07:30:48 -0700 (PDT)
Received: from srini-hackbox.lan (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.gmail.com with ESMTPSA id v8sm72860454wrw.2.2020.03.12.07.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2020 07:30:47 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 5/5] arm64: dts: qcom: db845c: add analog audio support
Date:   Thu, 12 Mar 2020 14:30:24 +0000
Message-Id: <20200312143024.11059-6-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200312143024.11059-1-srinivas.kandagatla@linaro.org>
References: <20200312143024.11059-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch adds support to Analog audio via WSA881x speakers.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 159 +++++++++++++++++++++
 1 file changed, 159 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index 6e60e81f8db7..94aa9227ca51 100644
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
@@ -200,6 +202,40 @@
 	firmware-name = "qcom/sdm845/adsp.mdt";
 };
 
+
+&wcd9340{
+	pinctrl-0 = <&wcd_intr_default>;
+	pinctrl-names = "default";
+	clock-names = "extclk";
+	clocks = <&rpmhcc RPMH_LN_BB_CLK2>;
+	reset-gpios = <&tlmm 64 0>;
+	vdd-buck-supply = <&vreg_s4a_1p8>;
+	vdd-buck-sido-supply = <&vreg_s4a_1p8>;
+	vdd-tx-supply = <&vreg_s4a_1p8>;
+	vdd-rx-supply = <&vreg_s4a_1p8>;
+	vdd-io-supply = <&vreg_s4a_1p8>;
+
+	swm: swm@c85 {
+		left_spkr: wsa8810-left{
+			compatible = "sdw10217201000";
+			reg = <0 1>;
+			powerdown-gpios = <&wcdgpio 2 GPIO_ACTIVE_HIGH>;
+			#thermal-sensor-cells = <0>;
+			sound-name-prefix = "SpkrLeft";
+			#sound-dai-cells = <0>;
+		};
+
+		right_spkr: wsa8810-right{
+			compatible = "sdw10217201000";
+			powerdown-gpios = <&wcdgpio 2 GPIO_ACTIVE_HIGH>;
+			reg = <0 2>;
+			#thermal-sensor-cells = <0>;
+			sound-name-prefix = "SpkrRight";
+			#sound-dai-cells = <0>;
+		};
+	};
+};
+
 &apps_rsc {
 	pm8998-rpmh-regulators {
 		compatible = "qcom,pm8998-rpmh-regulators";
@@ -535,6 +571,15 @@
 		function = "gpio";
 		bias-pull-up;
 	};
+
+	wcd_intr_default: wcd_intr_default {
+		pins = <54>;
+		function = "gpio";
+
+		input-enable;
+		bias-pull-down;
+		drive-strength = <2>;
+	};
 };
 
 &uart6 {
@@ -674,3 +719,117 @@
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
+&q6asmdai {
+	dai@0 {
+		reg = <0>;
+		direction = <2>;
+	};
+
+	dai@1 {
+		reg = <1>;
+		direction = <2>;
+	};
+
+	dai@2 {
+		reg = <2>;
+		direction = <1>;
+	};
+
+	dai@3 {
+		reg = <3>;
+		direction = <2>;
+		is-compress-dai;
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
+		"MM_DL4",  "MultiMedia4 Playback",
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
+	mm3-dai-link {
+		link-name = "MultiMedia3";
+		cpu {
+			sound-dai = <&q6asmdai  MSM_FRONTEND_DAI_MULTIMEDIA3>;
+		};
+	};
+
+	mm4-dai-link {
+		link-name = "MultiMedia4";
+		cpu {
+			sound-dai = <&q6asmdai  MSM_FRONTEND_DAI_MULTIMEDIA4>;
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

