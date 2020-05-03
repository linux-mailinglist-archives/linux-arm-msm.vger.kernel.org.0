Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 099101C2F24
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 May 2020 22:18:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729134AbgECUSv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 3 May 2020 16:18:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729126AbgECUSs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 3 May 2020 16:18:48 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8928FC061A10
        for <linux-arm-msm@vger.kernel.org>; Sun,  3 May 2020 13:18:48 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id y24so6485848wma.4
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 May 2020 13:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tb3r3LLHiDvQU/geLRLcXEdsYq1xx71bVzm8FyyX0qk=;
        b=qK4+PH8gAuxxYW6vY+QwqkLlzXnoZZDmmEC2OHGNWzXcHTiNqdr5nIoawbibHaJeI/
         X5cYWxqYUxbh6d+fBMgY1XTVyDx9jknb8H3M1cg+WDkG44qSjSQC1a1IFe4ODH9Mzwqz
         Nj1QioFnZnDVPVP6JMmHMZqAtRDJaX9nMd+xEdI0fkfl0ZyvKG61gi/z6YhcGfIx8bdC
         TP+BzD9PdmtD3Z3J3Y3NGuMWmqNjhDL3fSpf6Ko2P76ND3RLAfSv3cM8Ut/ZblR1czuF
         HhYYImgi7MJq1LBkrLDsOdAN9STfEJS5NQR1qQgIgHzV0sP5hZu3JHQMdI4gA5r7xkdu
         2ixQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tb3r3LLHiDvQU/geLRLcXEdsYq1xx71bVzm8FyyX0qk=;
        b=e7vR3DIO2mLqyGyWEXsN63McRYaCKqFMb5T8/Q8RDVeeVYQ8m9T+BleuS3Bz8r+ofE
         B4nstgv8j6/udj3+zMEHso6p/C9Gu5srIdT8wKExDuc+6yLEir0ft503fGbgvPgSJpj/
         yDwfVWUU0G5jHKeaXxE0v/TIvBIxYvwj84lBx+m9TqBDCaZJb4wMaYPac0eDQMloJtqb
         8Y42i45J4Zb+CgWfNG7Hfit5baZiMhNYPt6vKb7ewD8KCF3iehJEVeimooutjQH31qmT
         q+/olv5AXTVUYergrQyLbWARVpBS2AzwkFCrPuEPsoRpDGG+OEai5wVnfBloFAd7k+T5
         LWEA==
X-Gm-Message-State: AGi0PuYIwgGrNghjqMorOw8hGwTw2Fbce82qpJWxh8QwB9HL9Klao7n+
        Tx2KLjs8miVO1NA3Yk1oZ5JLlhdsWHs+SQ==
X-Google-Smtp-Source: APiQypL/T037e5y4XoEbr/sP2JQyNPPRlgUEcRstSaCZZ4+hQ1VKBypsZNmHZNa3WInjxXp4ZtAwOA==
X-Received: by 2002:a05:600c:224a:: with SMTP id a10mr11270741wmm.174.1588537127283;
        Sun, 03 May 2020 13:18:47 -0700 (PDT)
Received: from localhost.localdomain ([2a0e:b107:830:0:47e5:c676:4796:5818])
        by smtp.googlemail.com with ESMTPSA id 19sm9891624wmo.3.2020.05.03.13.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2020 13:18:46 -0700 (PDT)
From:   Robert Marko <robert.marko@sartura.hr>
To:     agross@kernel.org, bjorn.andersson@linaro.org, kishon@ti.com,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org, vkoul@kernel.org
Cc:     John Crispin <john@phrozen.org>,
        Robert Marko <robert.marko@sartura.hr>,
        Luka Perkov <luka.perkov@sartura.hr>
Subject: [PATCH v7 3/3] ARM: dts: qcom: ipq4019: add USB devicetree nodes
Date:   Sun,  3 May 2020 22:18:24 +0200
Message-Id: <20200503201823.531757-3-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200503201823.531757-1-robert.marko@sartura.hr>
References: <20200503201823.531757-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: John Crispin <john@phrozen.org>

Since we now have driver for the USB PHY, lets add the necessary nodes to DTSI.

Signed-off-by: John Crispin <john@phrozen.org>
Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Cc: Luka Perkov <luka.perkov@sartura.hr>
---
Changes from v6 to v7:
* Remove changes to qcom-ipq4019-ap.dk01.1.dtsi
It has slipped in unwanted, we only want to add
nodes to the DTSI.

 arch/arm/boot/dts/qcom-ipq4019.dtsi | 74 +++++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-ipq4019.dtsi b/arch/arm/boot/dts/qcom-ipq4019.dtsi
index bfa9ce4c6e69..ee45253361cb 100644
--- a/arch/arm/boot/dts/qcom-ipq4019.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq4019.dtsi
@@ -604,5 +604,79 @@
 				reg = <4>;
 			};
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
2.26.2

