Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5072C2CD8F2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Dec 2020 15:23:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730711AbgLCOWk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Dec 2020 09:22:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727822AbgLCOWk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Dec 2020 09:22:40 -0500
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56C9FC08E861
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Dec 2020 06:21:19 -0800 (PST)
Received: by mail-lf1-x144.google.com with SMTP id u18so2931499lfd.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Dec 2020 06:21:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KcRu/X3xJaaLM+ngoS1QVEM2mbS7z453C1cW9cVO+24=;
        b=jxALDj5S1uasxL4Wa21OAPLGRojIzp1++DhlKZo1tjxUfDKARgB6LaDMzfKm8RJqxJ
         1g76RY9AvwXMzJLD9peur1eJGxi086RRDTlcmJ7IwFx5h0jBcUwLeHSMBILa9IFiH3Hr
         8dQUb+hXxoBn6uld5cdwmWrLHh7/spKKHAv1MrrJV9UyfwSRiHI/O7AHpx6170PFUsV6
         7xXc/eg8i/uKVT78tLqq1Nz3LVsLc+Pw3MiMXPu4eTbbaxRPXYTfgpra4JtpHPtn1a+E
         MrVoOUnPocPJN1IH0g4MhloFIvD+a4R25zmuLJl2/hCPDWw/pEJY8T2fk+sVMz4MoZ90
         hbVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KcRu/X3xJaaLM+ngoS1QVEM2mbS7z453C1cW9cVO+24=;
        b=eEoRDQH0y1zqUtMguDaXuO30J+MEgz6ijBj6t1hJh63S+1qK53G2gp4PMBzO1TBbpG
         TGs52eCuWYWHRvDuuem7bvR7CVZ4UARu/3Prm3Ah9GJok2J63f3jz/BwI2aE1O30PZwz
         M3qywj0ma6Srg8hMtCKYFwWlzrUxzB5uFr1scTEwYal+wyCFq+MSjoEloUyp36IjLsFo
         cOF6KhORe2I53ZP/t3nLRZV+IlRQFnjxvSMEsR7UsjHKtLkbhoT7LrE8N68WXYBO8eBn
         jDXkBgmq8YTl2enUJBQs69rIiyBSPQVLopTJSwW2URYxTcipz9SVeiZnYeczlCkeA8Uv
         PhVg==
X-Gm-Message-State: AOAM5339D25JVuVvcCCPUDpgKQvsvozQqPnOFrDgnmK4FN0nv9JEaoOX
        Np28WPOPhUN5aAryRkJK5+cDlg==
X-Google-Smtp-Source: ABdhPJxMyzirZqfdZOxK5o3S2qn5MzfcDs3ikYYLY17umY4BSyxw+yNj3Y2g9j2XdgIabgoc6JdS+A==
X-Received: by 2002:a19:c815:: with SMTP id y21mr1372057lff.589.1607005277861;
        Thu, 03 Dec 2020 06:21:17 -0800 (PST)
Received: from eriador.lumag.spb.ru ([188.162.64.117])
        by smtp.gmail.com with ESMTPSA id k185sm575716lfd.294.2020.12.03.06.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 06:21:17 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 6/7] arm64: dts: qcom: qrb5165-rb5: add lt9611 HDMI bridge
Date:   Thu,  3 Dec 2020 17:21:04 +0300
Message-Id: <20201203142105.841666-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201203142105.841666-1-dmitry.baryshkov@linaro.org>
References: <20201203142105.841666-1-dmitry.baryshkov@linaro.org>
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
index 94d95dff48c4..1ade62d98f98 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -40,6 +40,17 @@ dc12v: dc12v-regulator {
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
 
@@ -66,6 +77,26 @@ bt {
 
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
@@ -418,7 +449,7 @@ &dsi0 {
 	ports {
 		port@1 {
 			endpoint {
-				//remote-endpoint = <&lt9611_a>;
+				remote-endpoint = <&lt9611_a>;
 				data-lanes = <0 1 2 3>;
 			};
 		};
@@ -444,6 +475,55 @@ &i2c4 {
 
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
@@ -504,6 +584,15 @@ &pm8150l_gpios {
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
@@ -735,6 +824,12 @@ &tlmm {
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

