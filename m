Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29EB52C6EC1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Nov 2020 05:10:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731627AbgK1Dnp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Nov 2020 22:43:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731497AbgK1Dme (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Nov 2020 22:42:34 -0500
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4272C0613D3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2020 19:42:33 -0800 (PST)
Received: by mail-oi1-x243.google.com with SMTP id k26so7997768oiw.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2020 19:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VLzI5Wn/zg0+hFTpN0tfFuoZOdepE3gNmagFCGpxFho=;
        b=bsgMmnrdHRiS8lyAW0qKzwKxG7IRz0pyurV2KveZCcEjeBxdOlmGtxd/hBuyfNQxdk
         RwbQWYud0LiVEAzDdapcxo62iiAF6Gy8kITq5elUQA8uzlDvaHxCzcMt0YjyoWXmdC61
         VAl5S58kNSj6rTQvAUgOi0/Rew+c1jqVcR1dQHzUWixL+oEshV59MAxpLXMdxR+z77iY
         gct/t/WuP52+IF2j1X3kfxCJ5jb/oPoq/GmwJIIuNCV7OOra8h58rtiwlO9wPjk+5J60
         oDYCF0CjlhnNyPyK4dwLtMjud2fW7q4W0lw9vWEEEu2Zh7yU9lL17anVivo7Sz+vOtuG
         lqMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VLzI5Wn/zg0+hFTpN0tfFuoZOdepE3gNmagFCGpxFho=;
        b=O1wKok6GP7kCvv57dcsrXIaWvERs3ofNdtpBfCuNh7Uq319a059H2RGVb077ri+PPW
         GdYdB4gG+nNbbQvmPmdzHMYQdQJLXUFaV4R+L8teaGZMHHGZYr5UzSJwcns50ytCOioq
         PIjuCSfiKTyfMH4NfZJKJtSC43qIIV1JAhQB4ydWSOCUeSnYuXW5bGDasRqVUwJiZ2TR
         8vrlzsJHHVuUmJXe3JQyD6PNTpXNJv9LRhYD0lollvxbB6Rj6g9ZfVDxj6B5hBlIrVpV
         B3yV8h32e/iUC0XfPbSGu0N1LuUeF+9MbSQkLltXDJmckq3ojvIFYeg/VAv9NibNy4fi
         Vdgg==
X-Gm-Message-State: AOAM533+txbAljS+nrCb56Gt5CnYLpfuxr61h6dBZrAvTgLJmee5U6VK
        jV7bGHnEFUjUUYMkYd2c+xymTg==
X-Google-Smtp-Source: ABdhPJxYizHts0zDI4I57tR3Sgn1uC10yhK4HwAqDdm6kDXTWibGVghdEr4DZn0iT2eDvEOnDTVBZg==
X-Received: by 2002:aca:570c:: with SMTP id l12mr7832632oib.105.1606534952912;
        Fri, 27 Nov 2020 19:42:32 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id t17sm6279198oie.57.2020.11.27.19.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 19:42:32 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Steev Klimaszewski <steev@kali.org>,
        Shawn Guo <shawn.guo@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: c630: Define eDP bridge and panel
Date:   Fri, 27 Nov 2020 21:42:31 -0600
Message-Id: <20201128034231.89750-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Lenovo Yoga C630 drives the Boe NV133FHM-N61 eDP display from DSI
using a TI SN65DSI86 bridge chip on I2C 10. Define the bridge and eDP
panel and enable the display blocks.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 100 ++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
index f956dbf664c1..bdd5d92ee6c3 100644
--- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
+++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
@@ -44,6 +44,26 @@ mode {
 			linux,code = <SW_TABLET_MODE>;
 		};
 	};
+
+	panel {
+		compatible = "boe,nv133fhm-n61";
+		no-hpd;
+
+		ports {
+			port {
+				panel_in_edp: endpoint {
+					remote-endpoint = <&sn65dsi86_out>;
+				};
+			};
+		};
+	};
+
+	sn65dsi86_refclk: sn65dsi86-refclk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+
+		clock-frequency = <19200000>;
+	};
 };
 
 &adsp_pas {
@@ -260,6 +280,25 @@ &cdsp_pas {
 	status = "okay";
 };
 
+&dsi0 {
+	status = "okay";
+	vdda-supply = <&vreg_l26a_1p2>;
+
+	ports {
+		port@1 {
+			endpoint {
+				remote-endpoint = <&sn65dsi86_in_a>;
+				data-lanes = <0 1 2 3>;
+			};
+		};
+	};
+};
+
+&dsi0_phy {
+	status = "okay";
+	vdds-supply = <&vreg_l1a_0p875>;
+};
+
 &gcc {
 	protected-clocks = <GCC_QSPI_CORE_CLK>,
 			   <GCC_QSPI_CORE_CLK_SRC>,
@@ -328,6 +367,45 @@ tsc1: hid@10 {
 	};
 };
 
+&i2c10 {
+	status = "okay";
+	clock-frequency = <400000>;
+
+	sn65dsi86: bridge@2c {
+		compatible = "ti,sn65dsi86";
+		reg = <0x2c>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&sn65dsi86_pin_active>;
+
+		enable-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
+
+		vpll-supply = <&vreg_l14a_1p88>;
+		vccio-supply = <&vreg_l14a_1p88>;
+
+		clocks = <&sn65dsi86_refclk>;
+		clock-names = "refclk";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				sn65dsi86_in_a: endpoint {
+					remote-endpoint = <&dsi0_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				sn65dsi86_out: endpoint {
+					remote-endpoint = <&panel_in_edp>;
+				};
+			};
+		};
+	};
+};
+
 &i2c11 {
 	status = "okay";
 	clock-frequency = <400000>;
@@ -344,10 +422,26 @@ ecsh: hid@5c {
 	};
 };
 
+&mdss {
+	status = "okay";
+};
+
+&mdss_mdp {
+	status = "okay";
+};
+
 &mss_pil {
 	firmware-name = "qcom/LENOVO/81JL/qcdsp1v2850.mbn", "qcom/LENOVO/81JL/qcdsp2850.mbn";
 };
 
+&qup_i2c10_default {
+	pinconf {
+		pins = "gpio55", "gpio56";
+		drive-strength = <2>;
+		bias-disable;
+	};
+};
+
 &qup_i2c12_default {
 	drive-strength = <2>;
 	bias-disable;
@@ -454,6 +548,12 @@ codec {
 &tlmm {
 	gpio-reserved-ranges = <0 4>, <81 4>;
 
+	sn65dsi86_pin_active: sn65dsi86-enable {
+		pins = "gpio96";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	i2c3_hid_active: i2c2-hid-active {
 		pins = "gpio37";
 		function = "gpio";
-- 
2.29.2

