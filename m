Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC9072C6251
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Nov 2020 10:56:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726999AbgK0J4C (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Nov 2020 04:56:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726826AbgK0J4B (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Nov 2020 04:56:01 -0500
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9D7DC0613D4
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2020 01:55:59 -0800 (PST)
Received: by mail-lf1-x143.google.com with SMTP id a9so6249560lfh.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2020 01:55:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1tSZCM1rFRClI+8OSMPYPttqmqC9FZJKpAoW1UjVOOE=;
        b=MfT6/sb85L3ZUEsBVRtZrqxKGlT+enH4yCKpi+SUNggE46/uIkquaFOanCZijX5ot5
         aMDjKZ/zwqTFo53KdggfavdiQoETaMuV5NuRJtf/92DdxVdExEf4HXBOOoqKi8Oa83gu
         yNYH+Uv07LYBpL2UHOiXw5pERYzt3obSIp3SeoWqYJSlnPh+lCNBIM94tEr1P51RyNhU
         tvNBPgCjdXmE2N+WUR+5WAA7Bi4H3uwCUPwz+Zi1v/Se9FSkJFEf/BDhXiyVZ97D4l/O
         LtBZY50uFWmjRrPAR5eYZ9YpFWg6k9ibBLvTdge2iUkroz2J9zINzhwTBnYvO2JnwlSg
         8NKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1tSZCM1rFRClI+8OSMPYPttqmqC9FZJKpAoW1UjVOOE=;
        b=oo/h24oZtZC0q0FbYw/f7hk3wYtCH43f8Nvk+5khSywPhGbza+OoaQGt/7I0pFP7fq
         W4zixZlSGBaOQbHwGQ8pzVVVQL9hjGAXoMbRH54H7Tq2yuTjv7FwMS0uJOcZOcxtFEle
         2TkHMNssqv2BLDTJnTU7Kh9ZB7bSFymXVTOgMWeytO9YnQs2/zl2ibRc/QJiOVB4rsGg
         pFVK2x9FE8EXQdMjGAbOylcdlOSGaPxgWhFfP4yeNxqR3mqcYQqDB7z/tkjq/MWfFWXB
         U9EAv/AFMc0LzVHf8+MrXkHDyNe5eFsUcXV1ow51g/vGDxjEZjM3HShDmsCg3dinYdD0
         1O1g==
X-Gm-Message-State: AOAM532Y+V3BToLOPNk7Lk8ewGBAcReYnUbT0UkgWsVb6dkMymqQfb3b
        w+sIVIDkeyXUvYYNsbfU3UqlVpILctQ0iA==
X-Google-Smtp-Source: ABdhPJw/n2GliKyJDCqlN5uwvKXoWIAoGiT4o0lrhKskWCg5uhXfpI2Kt+/ZLduzvT00lFlFCuLxBg==
X-Received: by 2002:a19:915:: with SMTP id 21mr3059877lfj.528.1606470958373;
        Fri, 27 Nov 2020 01:55:58 -0800 (PST)
Received: from eriador.lumag.spb.ru ([188.162.64.79])
        by smtp.gmail.com with ESMTPSA id x25sm628477lfn.99.2020.11.27.01.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 01:55:57 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 6/7] arm64: dts: qcom: qrb5165-rb5: add lt9611 HDMI bridge
Date:   Fri, 27 Nov 2020 12:55:47 +0300
Message-Id: <20201127095548.128217-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201127095548.128217-1-dmitry.baryshkov@linaro.org>
References: <20201127095548.128217-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add device tree node for the lontium lt9611ux DSI-HDMI bridge.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 97 +++++++++++++++++++++++-
 1 file changed, 96 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index 70e11705e9f6..2c3eb3771ded 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -33,6 +33,17 @@ dc12v: dc12v-regulator {
 		regulator-always-on;
 	};
 
+	hdmi-out {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con: endpoint {
+				remote-endpoint = <&lt9611_out>;
+			};
+		};
+	};
+
 	leds {
 		compatible = "gpio-leds";
 
@@ -59,6 +70,26 @@ bt {
 
 	};
 
+	lt9611_1v2: lt9611-vdd12-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "LT9611_1V2";
+
+		vin-supply = <&vdc_3v3>;
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+	};
+
+	lt9611_3v3: lt9611-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "LT9611_3V3";
+
+		vin-supply = <&vdc_3v3>;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
 	vbat: vbat-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "VBAT";
@@ -411,7 +442,7 @@ &dsi0 {
 	ports {
 		port@1 {
 			endpoint {
-				//remote-endpoint = <&lt9611_a>;
+				remote-endpoint = <&lt9611_a>;
 				data-lanes = <0 1 2 3>;
 			};
 		};
@@ -437,6 +468,55 @@ &i2c4 {
 
 &i2c5 {
 	status = "okay";
+	clock-frequency = <400000>;
+
+	lt9611_codec: hdmi-bridge@2b {
+		compatible = "lontium,lt9611uxc";
+		reg = <0x2b>;
+		#sound-dai-cells = <1>;
+
+		interrupts-extended = <&tlmm 63 IRQ_TYPE_EDGE_FALLING>;
+
+		reset-gpios = <&pm8150l_gpios 5 GPIO_ACTIVE_HIGH>;
+
+		vdd-supply = <&lt9611_1v2>;
+		vcc-supply = <&lt9611_3v3>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&lt9611_irq_pin &lt9611_rst_pin>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				lt9611_a: endpoint {
+					remote-endpoint = <&dsi0_out>;
+				};
+			};
+
+#if 0
+			port@1 {
+				reg = <1>;
+
+				lt9611_b: endpoint {
+					remote-endpoint = <&dsi1_out>;
+				};
+			};
+#endif
+
+			port@2 {
+				reg = <2>;
+
+				lt9611_out: endpoint {
+					remote-endpoint = <&hdmi_con>;
+				};
+			};
+
+		};
+	};
 };
 
 /* LS-I2C1 */
@@ -497,6 +577,15 @@ &pm8150l_gpios {
 		"PM_GPIO-B",
 		"NC",
 		"PM3003A_MODE";
+
+	lt9611_rst_pin: lt9611-rst-pin {
+		pins = "gpio5";
+		function = "normal";
+
+		output-high;
+		input-disable;
+		power-source = <0>;
+	};
 };
 
 &pm8150_rtc {
@@ -718,6 +807,12 @@ &tlmm {
 		"HST_WLAN_UART_TX",
 		"HST_WLAN_UART_RX";
 
+	lt9611_irq_pin: lt9611-irq {
+		pins = "gpio63";
+		function = "gpio";
+		bias-disable;
+	};
+
 	sdc2_default_state: sdc2-default {
 		clk {
 			pins = "sdc2_clk";
-- 
2.29.2

