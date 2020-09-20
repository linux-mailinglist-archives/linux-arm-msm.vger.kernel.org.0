Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0726627151F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Sep 2020 16:50:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726501AbgITOuQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 20 Sep 2020 10:50:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726267AbgITOuQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 20 Sep 2020 10:50:16 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43F4FC061755;
        Sun, 20 Sep 2020 07:50:16 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id j2so10166135wrx.7;
        Sun, 20 Sep 2020 07:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Z/2uZ0pYs4z9cwjMhZc9o0Cxd7UZbdq55pRW4iZm16k=;
        b=R8BlIVOwsRdTH/sWcOXMzXJiav8nqd9EN21VdAk+Z2gdueMSiv9OWlxvkGOgnr2TlA
         VYFygauUaEUleThyTmm9JxVmkjKotBFsvY1fvxSujl9m9ubnZfw0L7UVuneTblcPqe5p
         6pVEkpXOEOIW4Ub9IknqxSGIeU6GuCOIzSIL5EOABSIvN3dPgtH9lYLdv3EU7knxzhA9
         Um0aTZu0O4IOQNrWhbmM9YKB78vylh6FdRvTnR/38yF2GOUYdp3RY/fei2Zka/1PV8CI
         1cnuHMRjJBJthENU3JF++kzvv92LzGSe+PhRGbXUXuJ4jiRXIPpjRPktoUIOYG3g9jiX
         2NVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Z/2uZ0pYs4z9cwjMhZc9o0Cxd7UZbdq55pRW4iZm16k=;
        b=hXgTE+LqOAUVzUllAzZmU/65VwPGY52thKg0iffVsgeHldyYbP+ar7RQac9KlsVIsm
         Gia1e3GiDuTmfRdGpp+R5jvdjOhodzFbSN6kC+fkIpDERFx7MYyGnS48KdaurdGHhFue
         mZAmOQ4O6AYLFOrAyquUKUVNMU22yPXIfkGos6JJwQnhtgs4XsptIHUtIbZvTUMHlURB
         gVkRoLf04FpGgfW18GFb5GBbOCD/OMDqss3jYg2nepgxdu+OZw9Gbjj1K+wSmImsMK7Z
         s8k+uYvCOHAZkRBrs1Psr96bX3t8vDJzgUXHdKRh/O9gAaIT9ysQ6aivJhlbYxiOg5QO
         iFyQ==
X-Gm-Message-State: AOAM530Npsg+7g2fgolyzE9F74cvYm4veS9a0iWqrBsyEw9BmIfofUhq
        ajrkxs/LBgiXkTanIitZsXE=
X-Google-Smtp-Source: ABdhPJzvpLai1gcqedwDYq06Zg4QTcRUOP/B04URAbVdVic+ZBM84Dbwj4jOcthzgdAE6tRMlceJmA==
X-Received: by 2002:a5d:40c4:: with SMTP id b4mr45060837wrq.151.1600613415003;
        Sun, 20 Sep 2020 07:50:15 -0700 (PDT)
Received: from localhost (178-169-161-196.razgrad.ddns.bulsat.com. [178.169.161.196])
        by smtp.gmail.com with ESMTPSA id q15sm15411842wrr.8.2020.09.20.07.50.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Sep 2020 07:50:14 -0700 (PDT)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        linux-arm-msm@vger.kernel.org,
        Iskren Chernev <iskren.chernev@gmail.com>
Subject: [PATCH RESEND 6/7] ARM: dts: qcom: msm8974-klte: Add support for wifi
Date:   Sun, 20 Sep 2020 17:48:58 +0300
Message-Id: <20200920144859.813032-7-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200920144859.813032-1-iskren.chernev@gmail.com>
References: <20200920144859.813032-1-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
2.28.0

