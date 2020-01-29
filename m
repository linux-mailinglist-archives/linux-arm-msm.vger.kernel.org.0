Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2811414D388
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jan 2020 00:20:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726962AbgA2XUm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Jan 2020 18:20:42 -0500
Received: from onstation.org ([52.200.56.107]:33854 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726945AbgA2XUm (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Jan 2020 18:20:42 -0500
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id 0144944629;
        Wed, 29 Jan 2020 23:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1580340041;
        bh=Sx/KO7XyX/pIJYp26UdESo4GO2ech2ruspU1aP6GoDc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ZCtomq9YUJ0AW9MnZ+nevOqgTcaoQ3FF2DPwSuELFWrT2Ch6Ch6p7eSy62bUkz0SH
         F3SQ3/L0o8SC554f8YxsdoFbeHa0At1+obhiybXQwLnNtS6xXRjhlElM9UMlF1zPtU
         G1vodqhw8uID8PxOYrxd1dCqG2TfV3jxQZuzGzqs=
From:   Brian Masney <masneyb@onstation.org>
To:     bjorn.andersson@linaro.org
Cc:     agross@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        jonathan@marek.ca
Subject: [PATCH 3/3] ARM: dts: qcom: msm8974-hammerhead: add support for bluetooth
Date:   Wed, 29 Jan 2020 18:20:31 -0500
Message-Id: <20200129232031.34538-4-masneyb@onstation.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200129232031.34538-1-masneyb@onstation.org>
References: <20200129232031.34538-1-masneyb@onstation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Jonathan Marek <jonathan@marek.ca>

Add support for the bluetooth found on the Nexus 5 phone.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
[masneyb@onstation.org: formatting cleanups; remove sleep clock; patch
 extracted from much larger out of tree patch.]
Signed-off-by: Brian Masney <masneyb@onstation.org>
---
 .../qcom-msm8974-lge-nexus5-hammerhead.dts    | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts b/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
index 3487daf98e81..32b474bfeec3 100644
--- a/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
+++ b/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
@@ -12,6 +12,7 @@ / {
 
 	aliases {
 		serial0 = &blsp1_uart1;
+		serial1 = &blsp2_uart10;
 	};
 
 	chosen {
@@ -355,6 +356,57 @@ te {
 				bias-disable;
 			};
 		};
+
+		bt_pin: bt {
+			hostwake {
+				pins = "gpio42";
+				function = "gpio";
+			};
+
+			devwake {
+				pins = "gpio62";
+				function = "gpio";
+			};
+
+			shutdown {
+				pins = "gpio41";
+				function = "gpio";
+			};
+		};
+
+		blsp2_uart10_pin_a: blsp2-uart10-pin-active {
+			tx {
+				pins = "gpio53";
+				function = "blsp_uart10";
+
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			rx {
+				pins = "gpio54";
+				function = "blsp_uart10";
+
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			cts {
+				pins = "gpio55";
+				function = "blsp_uart10";
+
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			rts {
+				pins = "gpio56";
+				function = "blsp_uart10";
+
+				drive-strength = <2>;
+				bias-disable;
+			};
+		};
 	};
 
 	sdhci@f9824900 {
@@ -418,6 +470,25 @@ volume-down {
 		};
 	};
 
+	serial@f9960000 {
+		status = "ok";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&blsp2_uart10_pin_a>;
+
+		bluetooth {
+			compatible = "brcm,bcm43438-bt";
+			max-speed = <3000000>;
+
+			pinctrl-names = "default";
+			pinctrl-0 = <&bt_pin>;
+
+			host-wakeup-gpios = <&msmgpio 42 GPIO_ACTIVE_HIGH>;
+			device-wakeup-gpios = <&msmgpio 62 GPIO_ACTIVE_HIGH>;
+			shutdown-gpios = <&msmgpio 41 GPIO_ACTIVE_HIGH>;
+		};
+	};
+
 	i2c@f9967000 {
 		status = "ok";
 		pinctrl-names = "default";
-- 
2.24.1

