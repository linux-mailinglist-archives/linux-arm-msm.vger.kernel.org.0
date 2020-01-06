Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF74B1314DC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2020 16:33:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726510AbgAFPdj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Jan 2020 10:33:39 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:35180 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726508AbgAFPdi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Jan 2020 10:33:38 -0500
Received: by mail-wm1-f67.google.com with SMTP id p17so15719585wmb.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jan 2020 07:33:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2FYYv2CkjElFAYjDohnfSrEmf3CiiM23ViUusDP3kSQ=;
        b=ad7ngc5bJlE2n14Gj3b6Nfl+1n/vamPfIE28LrpGnOINIuNlv4ZpkLTzsG01cjeOxD
         04NydcE/20B74uze1n0R3/D8WGh+AWEDrj/I4Zkf5UEFFGOHAjtsLJQyJx3cOW4vJnGh
         ZGk5OxsrjOualJD663Vd7hQiLdM3Zu+GusBfo+yBrwZGEUhGZncW/0uszYJKS42m3OlL
         AsrLDa0/GJiijYoQpPxmbu7niC1PQnjWA9gJWPTLgmA7bnPc2eDyFGTu9RZFmP+xnfO7
         vdcGtIcfrDj1j/6fB3flYaEuresllRrFb5UQ+6X8X06uXrBCxpO4MRqZvEndP4155hFL
         DT8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2FYYv2CkjElFAYjDohnfSrEmf3CiiM23ViUusDP3kSQ=;
        b=Hr93CpRxNOgDrY34XksAhMZ25HUdH9t164X36xONG/dFgKZQkApn/sUuVRMAW0iHbw
         x5nb26QB1SYMJ1DD1Stb/cRZXG+oXCNMzhX4tCn06Zn8R7kvsq/tTtDXcuxke75mCjGG
         3W1TJIK030EMkNzIYZZnuJVZfSyztOAVVqYJ9kH3RYCHFhE73zXpIsOVVvlnt+MO/p2t
         o+khGdeIJwmyBAywixe2nI4J7cZoMfHD5hH8hoTvd5neLlK4Em9/CQ9P4XtN8hJTo213
         YxC4zNNDHXgEBjYGMOEcvqrVcvVutf/h4/1hoSI1h55SJQcAPZp2GioB68J33L8XTjrG
         3yfw==
X-Gm-Message-State: APjAAAUc63YJXYoObeKyGpF8Jn961JSNMIgWSJtnHR+Zk1oe2irj4ZHf
        NaJsybLuClp3tTWIfIPBcjw1oe00tpQ=
X-Google-Smtp-Source: APXvYqwPv3zhWtJa0TFdN+kGJD964mS2gB2guJpl6uLx998eyRVoyp+IVBPYPpaNn/KJ8LusyT5lOg==
X-Received: by 2002:a05:600c:2298:: with SMTP id 24mr36197375wmf.65.1578324816974;
        Mon, 06 Jan 2020 07:33:36 -0800 (PST)
Received: from localhost.localdomain (93-137-254-179.adsl.net.t-com.hr. [93.137.254.179])
        by smtp.googlemail.com with ESMTPSA id m10sm73578046wrx.19.2020.01.06.07.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2020 07:33:36 -0800 (PST)
From:   Robert Marko <robert.marko@sartura.hr>
To:     agross@kernel.org, linux-arm-msm@vger.kernel.org
Cc:     John Crispin <john@phrozen.org>,
        Robert Marko <robert.marko@sartura.hr>,
        Luka Perkov <luka.perkov@sartura.hr>
Subject: [PATCH 3/3] ARM: dts: qcom: ipq4019: add USB devicetree nodes
Date:   Mon,  6 Jan 2020 16:33:25 +0100
Message-Id: <20200106153325.1281420-3-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200106153325.1281420-1-robert.marko@sartura.hr>
References: <20200106153325.1281420-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: John Crispin <john@phrozen.org>

Since we now have driver for the USB PHY, lets add the necessary nodes to DTSI.

Signed-off-by: John Crispin <john@phrozen.org>
Tested-by: Robert Marko <robert.marko@sartura.hr>
Cc: Luka Perkov <luka.perkov@sartura.hr>
---
 arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1.dtsi | 20 +++++
 arch/arm/boot/dts/qcom-ipq4019.dtsi           | 74 +++++++++++++++++++
 2 files changed, 94 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1.dtsi b/arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1.dtsi
index 418f9a022336..2ee5f05d5a43 100644
--- a/arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1.dtsi
@@ -109,5 +109,25 @@
 		wifi@a800000 {
 			status = "ok";
 		};
+
+		usb3_ss_phy: ssphy@9a000 {
+			status = "ok";
+		};
+
+		usb3_hs_phy: hsphy@a6000 {
+			status = "ok";
+		};
+
+		usb3: usb3@8af8800 {
+			status = "ok";
+		};
+
+		usb2_hs_phy: hsphy@a8000 {
+			status = "ok";
+		};
+
+		usb2: usb2@60f8800 {
+			status = "ok";
+		};
 	};
 };
diff --git a/arch/arm/boot/dts/qcom-ipq4019.dtsi b/arch/arm/boot/dts/qcom-ipq4019.dtsi
index b6e5203a210b..18e9c639514c 100644
--- a/arch/arm/boot/dts/qcom-ipq4019.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq4019.dtsi
@@ -564,5 +564,79 @@
 					  "legacy";
 			status = "disabled";
 		};
+
+		usb3_ss_phy: ssphy@9a000 {
+			compatible = "qcom,usb-ss-ipq4019-phy";
+			#phy-cells = <0>;
+			reg = <0x9a000 0x800>;
+			reg-names = "phy_base";
+			resets = <&gcc USB3_UNIPHY_PHY_ARES>;
+			reset-names = "por_rst";
+			status = "disabled";
+		};
+
+		usb3_hs_phy: hsphy@a6000 {
+			compatible = "qcom,usb-hs-ipq4019-phy";
+			#phy-cells = <0>;
+			reg = <0xa6000 0x40>;
+			reg-names = "phy_base";
+			resets = <&gcc USB3_HSPHY_POR_ARES>, <&gcc USB3_HSPHY_S_ARES>;
+			reset-names = "por_rst", "srif_rst";
+			status = "disabled";
+		};
+
+		usb3@8af8800 {
+			compatible = "qcom,dwc3";
+			reg = <0x8af8800 0x100>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&gcc GCC_USB3_MASTER_CLK>,
+				 <&gcc GCC_USB3_SLEEP_CLK>,
+				 <&gcc GCC_USB3_MOCK_UTMI_CLK>;
+			clock-names = "master", "sleep", "mock_utmi";
+			ranges;
+			status = "disabled";
+
+			dwc3@8a00000 {
+				compatible = "snps,dwc3";
+				reg = <0x8a00000 0xf8000>;
+				interrupts = <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>;
+				phys = <&usb3_hs_phy>, <&usb3_ss_phy>;
+				phy-names = "usb2-phy", "usb3-phy";
+				dr_mode = "host";
+			};
+		};
+
+		usb2_hs_phy: hsphy@a8000 {
+			compatible = "qcom,usb-hs-ipq4019-phy";
+			#phy-cells = <0>;
+			reg = <0xa8000 0x40>;
+			reg-names = "phy_base";
+			resets = <&gcc USB2_HSPHY_POR_ARES>, <&gcc USB2_HSPHY_S_ARES>;
+			reset-names = "por_rst", "srif_rst";
+			status = "disabled";
+		};
+
+		usb2@60f8800 {
+			compatible = "qcom,dwc3";
+			reg = <0x60f8800 0x100>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&gcc GCC_USB2_MASTER_CLK>,
+				 <&gcc GCC_USB2_SLEEP_CLK>,
+				 <&gcc GCC_USB2_MOCK_UTMI_CLK>;
+			clock-names = "master", "sleep", "mock_utmi";
+			ranges;
+			status = "disabled";
+
+			dwc3@6000000 {
+				compatible = "snps,dwc3";
+				reg = <0x6000000 0xf8000>;
+				interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>;
+				phys = <&usb2_hs_phy>;
+				phy-names = "usb2-phy";
+				dr_mode = "host";
+			};
+		};
 	};
 };
-- 
2.24.1

