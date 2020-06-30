Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB44520F6D3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2020 16:10:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388726AbgF3OJu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Jun 2020 10:09:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388719AbgF3OJr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Jun 2020 10:09:47 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D28C6C061755;
        Tue, 30 Jun 2020 07:09:46 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id dp18so20793780ejc.8;
        Tue, 30 Jun 2020 07:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HCUkrsg5LqccPCpsSq8O97JgHCbLCI4g5FUt6XwYrsw=;
        b=mxQHsQlNnWhfJi1RiB2BKfC3ZhKzcWvlbho7Xx2zOPkND28P/EzJH6WfiaSrqzzSt9
         R/TSbs4OqcOAqMNOEuLzJxmEcs010al6hnwe9BulCPRw6wHPolD8DR6Yz/8u4lWiCRoH
         Dp57rAX9A+VJ1FsB0ZG1OaL01mR/UoETU/YibAwyE76fWkXwNduTinJwiUL1CfV2PoGs
         22nJZUtytJdn1ZzYjOLIZbgZaNZ6P3R+mMOZebB5XVvUUY9O/F6EIRlgOBx11ToVLLg4
         jfixu6YsqmaLzak23fmcqWJMsg0YZT1m5D1BxY31BfXZ7bXvTbdclcMzuFl0VVZq1qBd
         7jXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HCUkrsg5LqccPCpsSq8O97JgHCbLCI4g5FUt6XwYrsw=;
        b=HGXOxTJEYN5RXFzau6Au6+Xd4mT8CZK8mNVvSj1H6RLjRuL0drqp8v+ZvJsD6NQc8C
         vNHTz8qwlARfAhL2EECI8VJVOS/9SfqCp4ueFWM9lJd/d/oSW6i0n+wQrV29Hf9fq71z
         Xk6rqUDkH5vSLipS5IaZuc5zoTTIcAq3X88zT7LyY1lFSqSkAqOREaH/9yCL2Z8wCAJv
         STTGqaSXw+9lMfd3Lfak9RueZ2OKf4xtwtaW51AHuVm39mQnda5hTfRXXvVD4g/CKU5I
         Ji9DR3zP5saRRwxXxHxnSmCeHtgAqj64j8aHbLJZObsFkwh2RaCFGQLQVEp9SCrWRLtj
         fN5Q==
X-Gm-Message-State: AOAM533R8BC+0ardlxUWvMQNCmL3BT1F04iQLlPeYvyCJLxoipYM4v98
        uKeaa6Ljr1HXrDPJtU/sfbc=
X-Google-Smtp-Source: ABdhPJyiO7e3E5Q74z3QoxaMEb21ZfZSq4Uq8oxNstIfJ/lOp5jl8c6ZKXKTAxMLd5PUQGC32IF60Q==
X-Received: by 2002:a17:906:5502:: with SMTP id r2mr16652452ejp.316.1593526185586;
        Tue, 30 Jun 2020 07:09:45 -0700 (PDT)
Received: from localhost ([213.191.183.145])
        by smtp.gmail.com with ESMTPSA id ch2sm2943381edb.87.2020.06.30.07.09.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2020 07:09:44 -0700 (PDT)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        linux-arm-msm@vger.kernel.org,
        Iskren Chernev <iskren.chernev@gmail.com>
Subject: [PATCH 6/7] ARM: dts: qcom: msm8974-klte: Add support for wifi
Date:   Tue, 30 Jun 2020 17:09:11 +0300
Message-Id: <20200630140912.260294-7-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200630140912.260294-1-iskren.chernev@gmail.com>
References: <20200630140912.260294-1-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Samsung Galaxy S5 (klte), uses a Broadcom 4354 Chip connected on the
SDIO bus. The chip also requires a corresponding firmware + txt file[1].

[1] https://gitlab.com/postmarketOS/pmaports/-/blob/master/firmware/firmware-samsung-klte/APKBUILD

Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
---
 .../boot/dts/qcom-msm8974-samsung-klte.dts    | 74 +++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts b/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
index 29099b83b231d..989447beb4319 100644
--- a/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
+++ b/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
@@ -282,6 +282,17 @@ led@3 {
 		};
 	};
 
+	vreg_wlan: wlan-regulator {
+		compatible = "regulator-fixed";
+
+		regulator-name = "wl-reg";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&gpio_expander 8 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
 	/delete-node/ vreg-boost;
 };
 
@@ -338,6 +349,20 @@ cmd-data {
 			};
 		};
 
+		sdhc3_pin_a: sdhc3-pin-active {
+			clk {
+				pins = "sdc2_clk";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			cmd-data {
+				pins = "sdc2_cmd", "sdc2_data";
+				drive-strength = <6>;
+				bias-pull-up;
+			};
+		};
+
 		i2c2_pins: i2c2 {
 			mux {
 				pins = "gpio6", "gpio7";
@@ -385,6 +410,16 @@ res {
 				drive-strength = <2>;
 			};
 		};
+
+		wifi_pin: wifi {
+			int {
+				pins = "gpio92";
+				function = "gpio";
+
+				input-enable;
+				bias-pull-down;
+			};
+		};
 	};
 
 	sdhci@f9824900 {
@@ -400,6 +435,36 @@ sdhci@f9824900 {
 		pinctrl-0 = <&sdhc1_pin_a>;
 	};
 
+	sdhci@f98a4900 {
+		status = "okay";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		max-frequency = <100000000>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&sdhc3_pin_a>;
+
+		vmmc-supply = <&vreg_wlan>;
+		vqmmc-supply = <&pma8084_s4>;
+
+		bus-width = <4>;
+		non-removable;
+
+		wifi@1 {
+			reg = <1>;
+			compatible = "brcm,bcm4329-fmac";
+
+			interrupt-parent = <&msmgpio>;
+			interrupts = <92 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "host-wake";
+
+			pinctrl-names = "default";
+			pinctrl-0 = <&wlan_sleep_clk_pin &wifi_pin>;
+		};
+	};
+
 	usb@f9a55000 {
 		status = "ok";
 
@@ -587,6 +652,15 @@ touch_pin: touchscreen-int-pin {
 				input-enable;
 				power-source = <PMA8084_GPIO_S4>;
 			};
+
+			wlan_sleep_clk_pin: wlan-sleep-clk-pin {
+				pins = "gpio16";
+				function = "func2";
+
+				output-high;
+				power-source = <PMA8084_GPIO_S4>;
+				qcom,drive-strength = <PMIC_GPIO_STRENGTH_HIGH>;
+			};
 		};
 	};
 };
-- 
2.27.0

