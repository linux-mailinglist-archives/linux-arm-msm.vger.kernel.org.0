Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF1E314AA89
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2020 20:33:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725955AbgA0Tdv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jan 2020 14:33:51 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:36558 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725893AbgA0Tdv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jan 2020 14:33:51 -0500
Received: by mail-wm1-f67.google.com with SMTP id p17so8338786wma.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2020 11:33:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2FYYv2CkjElFAYjDohnfSrEmf3CiiM23ViUusDP3kSQ=;
        b=wAio5wG9i21Smr/evuoOJw68w1Jcre1OYoBpokBTMEUo2+cZhYJNmiH0efklmr8prg
         UMW0c3WY1hrV2D8VTWnfW3rtc2j0W4pqyMVkZLxii/2/wBSvbfbVwEMDsVhLU5HWGfGk
         5FdDOESAIdOADVHeI8+3mwNiXlYKxzmL1qWKRP6UGYjRKtpedyWvwpMt5s2b/Hn3LGVl
         RYCvhbAOZ+EgTlKiJHxJ48FQ88+09eQ7qGOAXalsFgg43eK4q2Yyt0ytkZnKB9IMcvsm
         ePH6w+CBld8hr++KscrNUL7i95et9vlr68l4DZj8DJn37swlqLj5yEJUiWEtlrmQ75zw
         5ZkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2FYYv2CkjElFAYjDohnfSrEmf3CiiM23ViUusDP3kSQ=;
        b=icnpv2awGZVZ5OPjX4+DfO2LE258WDccirT27VeLa0hzHIEg+nqP1gkhKAXwLUooSw
         B1T9lYldovbs4SnS77mn8nL3Uy+x2ZP48tfvpdi1jUTJW4YQS3gxuMJCRMteCqpcW7Kj
         3nXgplU+SR30tYeOUVXrhxefAAccJGowKei9wekYViAihQ84visxBwRtzJj/io8DFsQz
         xrRcSKv6UeCJEGpX7NzmTPCn192TDANWPG1sHzR/gtRSu29Ve0OB2F2H4dQPaSXQLJp0
         WIZDV3AnXwF6Eejxb6QqQvotIv1xvgguAXw0QSfp53nvMp1OKIEMUrc4rynReHPLVqiP
         MslA==
X-Gm-Message-State: APjAAAXpIhaw+G/l2j7ASIcF5q3GYqC25ClGm1rFnVQOTDVQ25JbkUO6
        Gt8ABRUYfZBWIt07P2CTEEDdGL/7o5aC3A==
X-Google-Smtp-Source: APXvYqy20sy5WbBGen0Yojvg47+eb31eKDkNS63MJruij6e16HKZwoAfu9C8cirqyX0thsTUWeAO9g==
X-Received: by 2002:a7b:cb0a:: with SMTP id u10mr187817wmj.165.1580153629569;
        Mon, 27 Jan 2020 11:33:49 -0800 (PST)
Received: from localhost.localdomain ([188.252.202.167])
        by smtp.googlemail.com with ESMTPSA id c15sm21895211wrt.1.2020.01.27.11.33.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2020 11:33:49 -0800 (PST)
From:   Robert Marko <robert.marko@sartura.hr>
To:     john@phrozen.org, agross@kernel.org, linux-arm-msm@vger.kernel.org
Cc:     Robert Marko <robert.marko@sartura.hr>,
        Luka Perkov <luka.perkov@sartura.hr>
Subject: [PATCH v2 3/3] ARM: dts: qcom: ipq4019: add USB devicetree nodes
Date:   Mon, 27 Jan 2020 20:32:33 +0100
Message-Id: <20200127193230.1539233-3-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200127193230.1539233-1-robert.marko@sartura.hr>
References: <20200127193230.1539233-1-robert.marko@sartura.hr>
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

