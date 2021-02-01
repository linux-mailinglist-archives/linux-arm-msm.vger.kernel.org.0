Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AFA230A602
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Feb 2021 11:59:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233491AbhBAK6L (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Feb 2021 05:58:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233471AbhBAK5z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Feb 2021 05:57:55 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D28D2C06174A;
        Mon,  1 Feb 2021 02:57:14 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id y187so12779205wmd.3;
        Mon, 01 Feb 2021 02:57:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4I8ErFOno3uwCucPYSZXnpLUqg3DiJdUblt9zB0jwOM=;
        b=QlkEIXciFbfLfRpiLtCue9HgvRPzl9NFRdum3W8/OI1oPiRQSg684AMiig7HHOeZdV
         SgvgfXTcN9kolL6qfo/TIok+1TsdKh0Z0MuA+UA2+x2P96LrSmJZ0q8bf0wOpiQ3Qhg7
         Ag35KY0GdXSQEGNp796qXU3W2Jbs8U8rzJP6l59QjoN51OpAYC4gEP4YaeGNMMyaKAmQ
         B4ls73yFXMQCPbQIPmTZwEU9KhPutepkHISm4G/qbSwsc3GlCU2oQYVRC6y8ffJzs1jH
         /ViPRx/V9mYb36eBX1cn7LcOr8jcgXrr3ocMsYjtlBvxgvK7A1udYqBjayi3Y8cWJhYr
         8Uqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4I8ErFOno3uwCucPYSZXnpLUqg3DiJdUblt9zB0jwOM=;
        b=fgudWPLQAdYwCKSMEIybB93qcQI7kICHb+VLRnE4dSfPjBz5gfzZq/tw0oieWWsGNs
         zVKxJmMi3+p5WVConBRpb658srqj00lnocJGnQqmTUDxdM4hzc26vewWH6fty52AjYXU
         DiIdllr5l9gE2hzbBVcFJwDfcUbAZteaa6Lr54FOvjhC+kpvUiwC4A6XvtkOI4aSYNuB
         Di3JORVB8aNYNIS/ANH0LvNuG/DuK6ULDVK5EYgDP+SreqsNUVLx6Tlhmo4K5IMATjf7
         BLCcoPQmzZSBJDtMAwgGN65rnAbELn8b5YQRqNtFS1jFgizA3xOos5t/ioS4W2bBFPpV
         CYlA==
X-Gm-Message-State: AOAM530Mj4nUX1beqdU13UBiddCwJ9xVqxK0AG4VntUQrzeMcnx6s/+B
        ilJqRUhsE9rQThSZqY/0C6w=
X-Google-Smtp-Source: ABdhPJwz1qaGuuIjwj5DHzR1UQztWVHtbiU13RneKBe4MPLPsnmkF/uebiMWbrzoxEjB2mJlv4rB6w==
X-Received: by 2002:a1c:2587:: with SMTP id l129mr14089772wml.13.1612177033669;
        Mon, 01 Feb 2021 02:57:13 -0800 (PST)
Received: from localhost (178-169-161-196.razgrad.ddns.bulsat.com. [178.169.161.196])
        by smtp.gmail.com with ESMTPSA id m11sm20200367wmc.15.2021.02.01.02.57.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Feb 2021 02:57:13 -0800 (PST)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Iskren Chernev <iskren.chernev@gmail.com>,
        Samuel Pascua <pascua.samuel.14@gmail.com>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>,
        Brian Masney <masneyb@onstation.org>,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH v5 3/4] ARM: dts: qcom: msm8974-klte: add support for display
Date:   Mon,  1 Feb 2021 12:56:56 +0200
Message-Id: <20210201105657.1642825-3-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210201105657.1642825-1-iskren.chernev@gmail.com>
References: <20210201105657.1642825-1-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Samuel Pascua <pascua.samuel.14@gmail.com>

Add initial support for the display found on the Samsung Galaxy 5 (klte)
phone. This is based on work from Jonathan Marek & Brian Masney.

Signed-off-by: Samuel Pascua <pascua.samuel.14@gmail.com>
[iskren.chernev@gmail.com: add reset gpio, regulators]
Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
---
On downstream the panel uses a regulator and an enable pin, but it is hinted
that the enable pin is actually another regulator, so wrap the enable pin into
a regulator and put the two new regulator in the panel node.

 .../boot/dts/qcom-msm8974-samsung-klte.dts    | 95 +++++++++++++++++++
 1 file changed, 95 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts b/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
index 86be4ae743f4..d042c7cbab71 100644
--- a/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
+++ b/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
@@ -298,6 +298,20 @@ vreg_wlan: wlan-regulator {
 		enable-active-high;
 	};
 
+	vreg_panel: panel-regulator {
+		compatible = "regulator-fixed";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&panel_en_pin>;
+
+		regulator-name = "panel-vddr-reg";
+		regulator-min-microvolt = <1500000>;
+		regulator-max-microvolt = <1500000>;
+
+		gpio = <&pma8084_gpios 14 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
 	/delete-node/ vreg-boost;
 };
 
@@ -453,6 +467,16 @@ int {
 				bias-pull-down;
 			};
 		};
+
+		panel_te_pin: panel {
+			te {
+				pins = "gpio12";
+				function = "mdp_vsync";
+
+				drive-strength = <2>;
+				bias-disable;
+			};
+		};
 	};
 
 	sdhc_1: sdhci@f9824900 {
@@ -701,6 +725,60 @@ fuelgauge@36 {
 	adreno@fdb00000 {
 		status = "ok";
 	};
+
+	mdss@fd900000 {
+		status = "ok";
+
+		mdp@fd900000 {
+			status = "ok";
+		};
+
+		dsi@fd922800 {
+			status = "ok";
+
+			vdda-supply = <&pma8084_l2>;
+			vdd-supply = <&pma8084_l22>;
+			vddio-supply = <&pma8084_l12>;
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			ports {
+				port@1 {
+					endpoint {
+						remote-endpoint = <&panel_in>;
+						data-lanes = <0 1 2 3>;
+					};
+				};
+			};
+
+			panel: panel@0 {
+				reg = <0>;
+				compatible = "samsung,s6e3fa2";
+
+				pinctrl-names = "default";
+				pinctrl-0 = <&panel_te_pin &panel_rst_pin>;
+
+				iovdd-supply = <&pma8084_lvs4>;
+				vddr-supply = <&vreg_panel>;
+
+				reset-gpios = <&pma8084_gpios 17 GPIO_ACTIVE_LOW>;
+				te-gpios = <&msmgpio 12 GPIO_ACTIVE_HIGH>;
+
+				port {
+					panel_in: endpoint {
+						remote-endpoint = <&dsi0_out>;
+					};
+				};
+			};
+		};
+
+		dsi-phy@fd922a00 {
+			status = "ok";
+
+			vddio-supply = <&pma8084_l12>;
+		};
+	};
 };
 
 &spmi_bus {
@@ -730,6 +808,14 @@ touch_pin: touchscreen-int-pin {
 				power-source = <PMA8084_GPIO_S4>;
 			};
 
+			panel_en_pin: panel-en-pin {
+				pins = "gpio14";
+				function = "normal";
+				bias-pull-up;
+				power-source = <PMA8084_GPIO_S4>;
+				qcom,drive-strength = <PMIC_GPIO_STRENGTH_LOW>;
+			};
+
 			wlan_sleep_clk_pin: wlan-sleep-clk-pin {
 				pins = "gpio16";
 				function = "func2";
@@ -739,6 +825,15 @@ wlan_sleep_clk_pin: wlan-sleep-clk-pin {
 				qcom,drive-strength = <PMIC_GPIO_STRENGTH_HIGH>;
 			};
 
+			panel_rst_pin: panel-rst-pin {
+				pins = "gpio17";
+				function = "normal";
+				bias-disable;
+				power-source = <PMA8084_GPIO_S4>;
+				qcom,drive-strength = <PMIC_GPIO_STRENGTH_LOW>;
+			};
+
+
 			fuelgauge_pin: fuelgauge-int-pin {
 				pins = "gpio21";
 				function = "normal";
-- 
2.30.0

