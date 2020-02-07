Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62F46155023
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2020 02:59:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727637AbgBGB7Z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Feb 2020 20:59:25 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:46116 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727613AbgBGB7Y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Feb 2020 20:59:24 -0500
Received: by mail-wr1-f66.google.com with SMTP id z7so732443wrl.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Feb 2020 17:59:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0eukBPHhSYKZW013Qc9yH34uLUMJB2iJ6o0kMxW1fIM=;
        b=r4mPChQblepdF42ueQQe0x+57Vj5/PtWN5yUjUSUpEjCJ7g2BNwj77bPfAAITVNPZ4
         Y5rY+lXHIag4tGbaKMm7YfL9LXUZfO3E+4MYOApq6s8HKGe4v7W2KKLc5C1WNh4L3noT
         l29NGuQJ7J2xpA0nRGj6GBwbwd197bNAwv9V1efxx5kk84gIgiw7KpGeenQXqUakNYFw
         ofcD3p4l4boMapy0sX/H2Vw8ftTfy0ERu7nBzUJ2jQxCQ1Uwkc+3/yCAptEyL/uqlwoR
         KOETDjAMOkNNftay0htyh2V2WD4wTOn0uR0c2XR6499CRoCV0HbISpYyCGXj/5haQeBJ
         z7bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0eukBPHhSYKZW013Qc9yH34uLUMJB2iJ6o0kMxW1fIM=;
        b=OMES+twvoxB6PLJ0caJRO5LUHBc2bnCmhqBkk+tpmds3qK+4lHxWcs0WqIPS0TwhT2
         DYWWSgd7pnsLGZMoYkvgpwQRFeQJ1BS8lxn49p/onHxxeYSJTBt5pqGdWyoLYu0HNGL8
         8fHRST1w3Z8oCE8qj45LNeF3d0iGkyqi4JEJOaFpmqyABJM8Jxj9mSrfLWVtEuSm0Dfl
         1CttqBga140uv1ovkCT2o7Ct+j9bz67ToHQ7pYdkGRI330x3dKx4I5gFXc3bkepGWPtc
         QA30Ac+Kfj20n7+nr12g0qgc5sfxshjFkAd+TRN+Bg3u3s/p4PGDT+GX4ns3jkKZZJvQ
         yN9A==
X-Gm-Message-State: APjAAAVmeAaGFpEQYrGriAPiteLNweDMKrK1qwlDPdMGvK2/T//4eXK9
        DSSVJ1H6sa2F4Sa2UUygtHcAIOYM8Vo=
X-Google-Smtp-Source: APXvYqzYEZDpiUvoVJAyzqEcpedOTqFsAxkZvThsniAwOXNG37rIGuCk0mXCQtopfslU3rETwgCzYg==
X-Received: by 2002:a5d:4a0f:: with SMTP id m15mr1187960wrq.415.1581040761187;
        Thu, 06 Feb 2020 17:59:21 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id a62sm1490095wmh.33.2020.02.06.17.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2020 17:59:20 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v4 11/18] arm64: dts: qcom: qcs404: Add USB devices and PHYs
Date:   Fri,  7 Feb 2020 01:59:00 +0000
Message-Id: <20200207015907.242991-12-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200207015907.242991-1-bryan.odonoghue@linaro.org>
References: <20200207015907.242991-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bjorn Andersson <bjorn.andersson@linaro.org>

QCS404 sports HS and SS USB controllers based on dwc3 block with two HS
PHYs and one SS PHY. Add nodes for these devices and enable them for
EVB board.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
Cc: Andy Gross <agross@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404.dtsi | 100 +++++++++++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index f5f0c4c9cb16..cdd153de35c4 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -272,6 +272,48 @@ rpm_msg_ram: memory@60000 {
 			reg = <0x00060000 0x6000>;
 		};
 
+		usb3_phy: phy@78000 {
+			compatible = "qcom,usb-ssphy";
+			reg = <0x00078000 0x400>;
+			#phy-cells = <0>;
+			clocks = <&rpmcc RPM_SMD_LN_BB_CLK>,
+				 <&gcc GCC_USB_HS_PHY_CFG_AHB_CLK>,
+				 <&gcc GCC_USB3_PHY_PIPE_CLK>;
+			clock-names = "ref", "ahb", "pipe";
+			resets = <&gcc GCC_USB3_PHY_BCR>,
+				 <&gcc GCC_USB3PHY_PHY_BCR>;
+			reset-names = "com", "phy";
+			status = "disabled";
+		};
+
+		usb2_phy_prim: phy@7a000 {
+			compatible = "qcom,usb-hs-28nm-femtophy";
+			reg = <0x0007a000 0x200>;
+			#phy-cells = <0>;
+			clocks = <&rpmcc RPM_SMD_LN_BB_CLK>,
+				 <&gcc GCC_USB_HS_PHY_CFG_AHB_CLK>,
+				 <&gcc GCC_USB2A_PHY_SLEEP_CLK>;
+			clock-names = "ref", "ahb", "sleep";
+			resets = <&gcc GCC_USB_HS_PHY_CFG_AHB_BCR>,
+				 <&gcc GCC_USB2A_PHY_BCR>;
+			reset-names = "phy", "por";
+			status = "disabled";
+		};
+
+		usb2_phy_sec: phy@7c000 {
+			compatible = "qcom,usb-hs-28nm-femtophy";
+			reg = <0x0007c000 0x200>;
+			#phy-cells = <0>;
+			clocks = <&rpmcc RPM_SMD_LN_BB_CLK>,
+				 <&gcc GCC_USB_HS_PHY_CFG_AHB_CLK>,
+				 <&gcc GCC_USB2A_PHY_SLEEP_CLK>;
+			clock-names = "ref", "ahb", "sleep";
+			resets = <&gcc GCC_QUSB2_PHY_BCR>,
+				 <&gcc GCC_USB2_HS_PHY_ONLY_BCR>;
+			reset-names = "phy", "por";
+			status = "disabled";
+		};
+
 		qfprom: qfprom@a4000 {
 			compatible = "qcom,qfprom";
 			reg = <0x000a4000 0x1000>;
@@ -379,6 +421,64 @@ glink-edge {
 			};
 		};
 
+		usb3: usb@7678800 {
+			compatible = "qcom,dwc3";
+			reg = <0x07678800 0x400>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&gcc GCC_USB30_MASTER_CLK>,
+				 <&gcc GCC_SYS_NOC_USB3_CLK>,
+				 <&gcc GCC_USB30_SLEEP_CLK>,
+				 <&gcc GCC_USB30_MOCK_UTMI_CLK>;
+			clock-names = "core", "iface", "sleep", "mock_utmi";
+			assigned-clocks = <&gcc GCC_USB20_MOCK_UTMI_CLK>,
+					  <&gcc GCC_USB30_MASTER_CLK>;
+			assigned-clock-rates = <19200000>, <200000000>;
+			status = "disabled";
+
+			dwc3@7580000 {
+				compatible = "snps,dwc3";
+				reg = <0x07580000 0xcd00>;
+				interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
+				phys = <&usb2_phy_sec>, <&usb3_phy>;
+				phy-names = "usb2-phy", "usb3-phy";
+				snps,has-lpm-erratum;
+				snps,hird-threshold = /bits/ 8 <0x10>;
+				snps,usb3_lpm_capable;
+				dr_mode = "otg";
+			};
+		};
+
+		usb2: usb@79b8800 {
+			compatible = "qcom,dwc3";
+			reg = <0x079b8800 0x400>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&gcc GCC_USB_HS_SYSTEM_CLK>,
+				 <&gcc GCC_PCNOC_USB2_CLK>,
+				 <&gcc GCC_USB_HS_INACTIVITY_TIMERS_CLK>,
+				 <&gcc GCC_USB20_MOCK_UTMI_CLK>;
+			clock-names = "core", "iface", "sleep", "mock_utmi";
+			assigned-clocks = <&gcc GCC_USB20_MOCK_UTMI_CLK>,
+					  <&gcc GCC_USB_HS_SYSTEM_CLK>;
+			assigned-clock-rates = <19200000>, <133333333>;
+			status = "disabled";
+
+			dwc3@78c0000 {
+				compatible = "snps,dwc3";
+				reg = <0x078c0000 0xcc00>;
+				interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
+				phys = <&usb2_phy_prim>;
+				phy-names = "usb2-phy";
+				snps,has-lpm-erratum;
+				snps,hird-threshold = /bits/ 8 <0x10>;
+				snps,usb3_lpm_capable;
+				dr_mode = "peripheral";
+			};
+		};
+
 		tlmm: pinctrl@1000000 {
 			compatible = "qcom,qcs404-pinctrl";
 			reg = <0x01000000 0x200000>,
-- 
2.25.0

