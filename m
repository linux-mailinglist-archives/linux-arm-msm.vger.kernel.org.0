Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BDA6B17A833
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2020 15:54:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727049AbgCEOx4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Mar 2020 09:53:56 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:38113 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726920AbgCEOx4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Mar 2020 09:53:56 -0500
Received: by mail-wm1-f67.google.com with SMTP id u9so6066734wml.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2020 06:53:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NZ7f1myPGQf1DoR42KxOe8pTxCjM3hFRYpDvoMalEOA=;
        b=QdKzIUgmwdhX724jS+brwi/J/R8CBiUb3H/haYKJBv6Zxn4Zg0OPNbqO36K40CmHzm
         7L/woWigYf6abgtBFBpo55sa66fIs39eeQbZykyxE0MZTdNYUtoYjP31AuZ4zl3f+rQF
         +hgN+j6jN2zEJGdKVJNfjDtmLnekrSSa90p+LUVTrOEPhUEydflPRj8TgHrn4sbJUtRZ
         VZUqCjX8gRqKSTFF6HWjDwb3tH0zdPIJBffuSHchRVOmaR/k9cN5UguUPdZ1NkI+tLIY
         eVkHxOpslByCBpmi4dNDJeDCxLY5jOEozwOmaPE+H4oH+fayFV5pg1ZukB3cwnKWhuMX
         axhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NZ7f1myPGQf1DoR42KxOe8pTxCjM3hFRYpDvoMalEOA=;
        b=uZKFClF+gr9g93hhBGgvPHu6LxAWiEKPfFCAPfiwDDUudXHUs/Zjr7S9cCvpGkSUgg
         Cqf/EtS0pmi8BUgjWf2VJSGy1kNvifmlD37ChcPDPBv8aR2DVrlIQ3JE5osJxBtWTKpB
         6lqJnQu7npE8Ni8vt2ZH+cFzw2RhyWEMZqeUBE3Q90VAs14B7LVq/u5zEY9Y81zkN+Q2
         hP56VuB4CYzwWEuWMyMHPTGC47sBn1D2DEeurJ5kaSrfRpEnerciugngtN0pI+N+qtvE
         fSJNywsyhgny9wwbJkZyE7hB4q04AvAS9WwpHFQBKkpeEg7/fEpMEq6UEPSVURWH3LnU
         C3Jw==
X-Gm-Message-State: ANhLgQ3TNuoLGt1Zu66Fu8XV08z5ZJuiQ94u8uJpdkk3vKgcJihLsfHp
        uM812nmufQaR7+gw3nU7RZJ7eA==
X-Google-Smtp-Source: ADFU+vswFLg81FZz+Z63OuHgMeaCL8C/3J7JNHb2rtfws3Lt107rI1819D3V21AJeeeqnqyAhi7IDw==
X-Received: by 2002:a05:600c:21c6:: with SMTP id x6mr9819945wmj.17.1583420032188;
        Thu, 05 Mar 2020 06:53:52 -0800 (PST)
Received: from srini-hackbox.lan (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.gmail.com with ESMTPSA id f16sm35785985wrx.25.2020.03.05.06.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2020 06:53:51 -0800 (PST)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 1/4] arm64: dts: qcom: sdm845: Add ADSP audio support
Date:   Thu,  5 Mar 2020 14:53:41 +0000
Message-Id: <20200305145344.14670-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200305145344.14670-1-srinivas.kandagatla@linaro.org>
References: <20200305145344.14670-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch adds support to basic dsp audio, codec, slimbus
and soundwire controller DT nodes.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 338 +++++++++++++++++++++++++++
 1 file changed, 338 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 061f49faab19..705d8a0c3a1e 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -20,6 +20,7 @@
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 #include <dt-bindings/clock/qcom,gcc-sdm845.h>
 #include <dt-bindings/thermal/thermal.h>
+#include <dt-bindings/soc/qcom,apr.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -491,6 +492,54 @@
 			label = "lpass";
 			qcom,remote-pid = <2>;
 			mboxes = <&apss_shared 8>;
+			apr {
+				compatible = "qcom,apr-v2";
+				qcom,glink-channels = "apr_audio_svc";
+				qcom,apr-domain = <APR_DOMAIN_ADSP>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				qcom,intents = <512 20>;
+
+				q6core {
+					reg = <APR_SVC_ADSP_CORE>;
+					compatible = "qcom,q6core";
+				};
+
+				q6afe: q6afe {
+					compatible = "qcom,q6afe";
+					reg = <APR_SVC_AFE>;
+					q6afedai: dais {
+						compatible = "qcom,q6afe-dais";
+						#address-cells = <1>;
+						#size-cells = <0>;
+						#sound-dai-cells = <1>;
+
+						qi2s@22 {
+							reg = <22>;
+							qcom,sd-lines = <0 1 2 3>;
+						};
+					};
+				};
+
+				q6asm: q6asm {
+					compatible = "qcom,q6asm";
+					reg = <APR_SVC_ASM>;
+					q6asmdai: dais {
+						compatible = "qcom,q6asm-dais";
+						#sound-dai-cells = <1>;
+						iommus = <&apps_smmu 0x1821 0x0>;
+					};
+				};
+
+				q6adm: q6adm {
+					compatible = "qcom,q6adm";
+					reg = <APR_SVC_ADM>;
+					q6routing: routing {
+						compatible = "qcom,q6adm-routing";
+						#sound-dai-cells = <0>;
+					};
+				};
+			};
 			fastrpc {
 				compatible = "qcom,fastrpc";
 				qcom,glink-channels = "fastrpcglink-apps-dsp";
@@ -513,6 +562,9 @@
 		};
 	};
 
+	sound: sound {
+	};
+
 	cdsp_pas: remoteproc-cdsp {
 		compatible = "qcom,sdm845-cdsp-pas";
 
@@ -1782,6 +1834,142 @@
 				};
 			};
 
+			quat_mi2s_sleep: quat_mi2s_sleep {
+				mux {
+					pins = "gpio58", "gpio59";
+					function = "gpio";
+				};
+
+				config {
+					pins = "gpio58", "gpio59";
+					drive-strength = <2>;   /* 2 mA */
+					bias-pull-down;         /* PULL DOWN */
+					input-enable;
+				};
+			};
+
+			quat_mi2s_active: quat_mi2s_active {
+				mux {
+					pins = "gpio58", "gpio59";
+					function = "qua_mi2s";
+				};
+
+				config {
+					pins = "gpio58", "gpio59";
+					drive-strength = <8>;   /* 8 mA */
+					bias-disable;           /* NO PULL */
+					output-high;
+				};
+			};
+
+			quat_mi2s_sd0_sleep: quat_mi2s_sd0_sleep {
+				mux {
+					pins = "gpio60";
+					function = "gpio";
+				};
+
+				config {
+					pins = "gpio60";
+					drive-strength = <2>;   /* 2 mA */
+					bias-pull-down;         /* PULL DOWN */
+					input-enable;
+				};
+			};
+
+			quat_mi2s_sd0_active: quat_mi2s_sd0_active {
+				mux {
+					pins = "gpio60";
+					function = "qua_mi2s";
+				};
+
+				config {
+					pins = "gpio60";
+					drive-strength = <8>;   /* 8 mA */
+					bias-disable;           /* NO PULL */
+				};
+			};
+
+			quat_mi2s_sd1_sleep: quat_mi2s_sd1_sleep {
+				mux {
+					pins = "gpio61";
+					function = "gpio";
+				};
+
+				config {
+					pins = "gpio61";
+					drive-strength = <2>;   /* 2 mA */
+					bias-pull-down;         /* PULL DOWN */
+					input-enable;
+				};
+			};
+
+			quat_mi2s_sd1_active: quat_mi2s_sd1_active {
+				mux {
+					pins = "gpio61";
+					function = "qua_mi2s";
+				};
+
+				config {
+					pins = "gpio61";
+					drive-strength = <8>;   /* 8 mA */
+					bias-disable;           /* NO PULL */
+				};
+			};
+
+			quat_mi2s_sd2_sleep: quat_mi2s_sd2_sleep {
+				mux {
+					pins = "gpio62";
+					function = "gpio";
+				};
+
+				config {
+					pins = "gpio62";
+					drive-strength = <2>;   /* 2 mA */
+					bias-pull-down;         /* PULL DOWN */
+					input-enable;
+				};
+			};
+
+			quat_mi2s_sd2_active: quat_mi2s_sd2_active {
+				mux {
+					pins = "gpio62";
+					function = "qua_mi2s";
+				};
+
+				config {
+					pins = "gpio62";
+					drive-strength = <8>;   /* 8 mA */
+					bias-disable;           /* NO PULL */
+				};
+			};
+
+			quat_mi2s_sd3_sleep: quat_mi2s_sd3_sleep {
+				mux {
+					pins = "gpio63";
+					function = "gpio";
+				};
+
+				config {
+					pins = "gpio63";
+					drive-strength = <2>;   /* 2 mA */
+					bias-pull-down;         /* PULL DOWN */
+					input-enable;
+				};
+			};
+
+			quat_mi2s_sd3_active: quat_mi2s_sd3_active {
+				mux {
+					pins = "gpio63";
+					function = "qua_mi2s";
+				};
+
+				config {
+					pins = "gpio63";
+					drive-strength = <8>;   /* 8 mA */
+					bias-disable;           /* NO PULL */
+				};
+			};
+
 			qup_i2c12_default: qup-i2c12-default {
 				pinmux {
 					pins = "gpio49", "gpio50";
@@ -2049,6 +2237,59 @@
 					function = "qup15";
 				};
 			};
+
+			wcd_intr_default: wcd_intr_default{
+				pinmux {
+					pins = "gpio54";
+					function = "gpio";
+				};
+
+				pinconf {
+					pins = "gpio54";
+					drive-strength = <2>; /* 2 mA */
+					bias-pull-down; /* pull down */
+					input-enable;
+				};
+			};
+
+			cdc_reset_sleep: cdc_reset_sleep {
+				pinmux {
+					pins = "gpio64";
+					function = "gpio";
+				};
+				pinconf {
+					pins = "gpio64";
+					drive-strength = <2>;
+					bias-disable;
+					output-low;
+				};
+			};
+
+			cdc_reset_active:cdc_reset_active {
+				pinmux {
+					pins = "gpio64";
+					function = "gpio";
+				};
+				pinconf {
+					pins = "gpio64";
+					drive-strength = <8>;
+					bias-pull-down;
+					output-high;
+				};
+			};
+
+			audio_slimclk:slim_clk {
+				pinmux {
+					pins = "gpio70";
+					function = "gpio";
+				};
+				pinconf {
+					pins = "gpio70";
+					drive-strength = <16>;
+					bias-pull-down;
+					output-high;
+				};
+			};
 		};
 
 		mss_pil: remoteproc@4080000 {
@@ -2602,6 +2843,91 @@
 			status = "disabled";
 		};
 
+		slim_msm: slim@171c0000 {
+			compatible = "qcom,slim-ngd-v2.1.0";
+			reg = <0 0x171c0000 0 0x2C000>;
+			reg-names = "ctrl";
+			interrupts = <0 163 IRQ_TYPE_LEVEL_HIGH>;
+
+			qcom,apps-ch-pipes = <0x780000>;
+			qcom,ea-pc = <0x270>;
+			status = "okay";
+			dmas =	<&slimbam 3>, <&slimbam 4>,
+				<&slimbam 5>, <&slimbam 6>;
+			dma-names = "rx", "tx", "tx2", "rx2";
+
+			iommus = <&apps_smmu 0x1806 0x0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			ngd@1 {
+				reg = <1>;
+				#address-cells = <1>;
+				#size-cells = <1>;
+
+				wcd9340_ifd: tas-ifd {
+					compatible = "slim217,250";
+					reg  = <0 0>;
+				};
+
+				wcd9340: codec@1{
+					pinctrl-0 = <&wcd_intr_default>;
+					pinctrl-names = "default";
+					compatible = "slim217,250";
+					reg  = <1 0>;
+					reset-gpios = <&tlmm 64 0>;
+					slim-ifc-dev  = <&wcd9340_ifd>;
+
+					#sound-dai-cells = <1>;
+
+					interrupt-parent = <&tlmm>;
+					interrupts = <54 IRQ_TYPE_LEVEL_HIGH>;
+					interrupt-controller;
+					#interrupt-cells = <1>;
+
+					#clock-cells = <0>;
+					clock-frequency = <9600000>;
+					clock-output-names = "mclk";
+					qcom,micbias1-millivolt = <1800>;
+					qcom,micbias2-millivolt = <1800>;
+					qcom,micbias3-millivolt = <1800>;
+					qcom,micbias4-millivolt = <1800>;
+
+					#address-cells = <1>;
+					#size-cells = <1>;
+
+					wcdpinctrl: wcd-pinctrl@42 {
+						compatible = "qcom,wcd9340-gpio";
+						gpio-controller;
+						#gpio-cells = <2>;
+						reg = <0x42 0x2>;
+					};
+
+					swm: swm@c85 {
+						compatible = "qcom,soundwire-v1.3.0";
+						reg = <0xc85 0x40>;
+						interrupt-parent = <&wcd9340>;
+						interrupts = <20 IRQ_TYPE_EDGE_RISING>;
+						interrupt-names = "soundwire";
+
+						qcom,dout-ports	= <6>;
+						qcom,din-ports	= <2>;
+						qcom,ports-sinterval-low =/bits/ 8  <0x07 0x1F 0x3F 0x7 0x1F 0x3F 0x0F 0x0F>;
+						qcom,ports-offset1 = /bits/ 8 <0x01 0x02 0x0C 0x6 0x12 0x0D 0x07 0x0A >;
+						qcom,ports-offset2 = /bits/ 8 <0x00 0x00 0x1F 0x00 0x00 0x1F 0x00 0x00>;
+
+						#sound-dai-cells = <1>;
+						clocks = <&wcd9340>;
+						clock-names = "iface";
+                                                #address-cells = <2>;
+                                                #size-cells = <0>;
+
+
+					};
+				};
+			};
+		};
+
 		usb_1_hsphy: phy@88e2000 {
 			compatible = "qcom,sdm845-qusb2-phy";
 			reg = <0 0x088e2000 0 0x400>;
@@ -3446,6 +3772,18 @@
 			};
 		};
 
+		slimbam: bamdma@17184000 {
+			compatible = "qcom,bam-v1.7.0";
+			qcom,controlled-remotely;
+			reg = <0 0x17184000 0 0x2a000>;
+			num-channels  = <31>;
+			interrupts = <0 164 IRQ_TYPE_LEVEL_HIGH>;
+			#dma-cells = <1>;
+			qcom,ee = <1>;
+			qcom,num-ees = <2>;
+			iommus = <&apps_smmu 0x1806 0x0>;
+		};
+
 		timer@17c90000 {
 			#address-cells = <2>;
 			#size-cells = <2>;
-- 
2.21.0

