Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 512462F9900
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Jan 2021 06:12:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730122AbhARFLh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Jan 2021 00:11:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730149AbhARFLe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Jan 2021 00:11:34 -0500
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2E9BC0613D6
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Jan 2021 21:10:19 -0800 (PST)
Received: by mail-pl1-x62f.google.com with SMTP id x12so7980097plr.10
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Jan 2021 21:10:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+qG5KxGmn1x3NMlOUnZ9AwjqdeDof7DzROnqOreWZ/w=;
        b=pGtuS9hCM35fxpSNt3tr7T0GSG/zaKvnIkfdTm+trgHjYrST4PqtT2dlLZtAqsGLRQ
         07HAxtZUk0HNKqcHspv6Jnw66/KgN6XRxGY9nlctXO/68/Iem3qjQB98x6coIvkEviv1
         in7hukOxmtlLh3YdhBW+daQsArrYCf+L1MtiehZoCfbj7L8OCaPHmvg8ocM8QQx/8QJJ
         pRICiEyXLGmW5AtCSKomE+oafQr97KPyd2tCu48a+hcPSGnlPjkUhXRDYbJzX/i0dN40
         aBUIw/vh6q19KWR/ZKB2cx6BlRZgiNWXvKhnpYDwgozxKdHdcMaR1QQ4Dci7NJFJbCEB
         4HHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+qG5KxGmn1x3NMlOUnZ9AwjqdeDof7DzROnqOreWZ/w=;
        b=pAVfmvgazAA55b9iL7askzi2g9swbGMpIAJB/M5LNCFwj7zKwJkwwqevWVnDvdNgJB
         S46tqrd1eiMpgr7oLYI7Wr0fPsIr70syKzX0yOCaKUKT21R9tiBo6/QyeJmk4M1Zx0mW
         RcTOIqBX6+7F/m64+po1MEi9tzwIaY7uKNOkbF6BebeJJ/MJAIzteuaouhAvhMQpSF43
         WRXLWJRBKlhShn6N8eFLjikSunwC8IbSo5knW8/YQwCEQo1trzHagydSTYWS2oX0wabD
         l5Czv+DLgLuTfcSxXVjQBhOOnBstBMB8YSHH0uc5csQ/7k1JQxpzaaiNXqOkXZ4buOCd
         FSzA==
X-Gm-Message-State: AOAM530pHZPqI+zjUe3duZwcI4wY/IrACYL5Y/dYQQ6n9eA15XS+TLuS
        /yNmifikaK/NENx2Ila8yxGeQYHXbKre
X-Google-Smtp-Source: ABdhPJyE8gzRPyILJ+1JbzR2/Nj4ei/rZfNu8hUyl4GnfVXROW0gvJAugukMiV7B8XsxfLxG9n4N9g==
X-Received: by 2002:a17:90a:5a03:: with SMTP id b3mr11240238pjd.1.1610946619165;
        Sun, 17 Jan 2021 21:10:19 -0800 (PST)
Received: from localhost.localdomain ([103.77.37.182])
        by smtp.gmail.com with ESMTPSA id j3sm14703571pjs.50.2021.01.17.21.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 21:10:18 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 2/7] ARM: dts: qcom: sdx55: Add USB3 and PHY support
Date:   Mon, 18 Jan 2021 10:40:00 +0530
Message-Id: <20210118051005.55958-3-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210118051005.55958-1-manivannan.sadhasivam@linaro.org>
References: <20210118051005.55958-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add devicetree nodes for enabling USB3 controller, Qcom QMP PHY and
SNPS HS PHY on SDX55.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm/boot/dts/qcom-sdx55.dtsi | 85 +++++++++++++++++++++++++++++++
 1 file changed, 85 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-sdx55.dtsi b/arch/arm/boot/dts/qcom-sdx55.dtsi
index 6ec7cf1a2367..98945900baa9 100644
--- a/arch/arm/boot/dts/qcom-sdx55.dtsi
+++ b/arch/arm/boot/dts/qcom-sdx55.dtsi
@@ -146,6 +146,48 @@ blsp1_uart3: serial@831000 {
 			status = "disabled";
 		};
 
+		usb_hsphy: phy@ff4000 {
+			compatible = "qcom,usb-snps-hs-7nm-phy";
+			reg = <0x00ff4000 0x114>;
+			status = "disabled";
+			#phy-cells = <0>;
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "ref";
+
+			resets = <&gcc GCC_QUSB2PHY_BCR>;
+		};
+
+		usb_qmpphy: phy@ff6000 {
+			compatible = "qcom,sdx55-qmp-usb3-uni-phy";
+			reg = <0x00ff6000 0x1c0>;
+			status = "disabled";
+			#clock-cells = <1>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+
+			clocks = <&gcc GCC_USB3_PHY_AUX_CLK>,
+				 <&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
+				 <&gcc GCC_USB3_PRIM_CLKREF_CLK>;
+			clock-names = "aux", "cfg_ahb", "ref";
+
+			resets = <&gcc GCC_USB3PHY_PHY_BCR>,
+				 <&gcc GCC_USB3_PHY_BCR>;
+			reset-names = "phy", "common";
+
+			usb_ssphy: phy@ff6200 {
+				reg = <0x00ff6200 0x170>,
+				      <0x00ff6400 0x200>,
+				      <0x00ff6800 0x800>;
+				#phy-cells = <0>;
+				#clock-cells = <0>;
+				clocks = <&gcc GCC_USB3_PHY_PIPE_CLK>;
+				clock-names = "pipe0";
+				clock-output-names = "usb3_uni_phy_pipe_clk_src";
+			};
+		};
+
 		qpic_bam: dma-controller@1b04000 {
 			compatible = "qcom,bam-v1.7.0";
 			reg = <0x01b04000 0x1c000>;
@@ -198,6 +240,49 @@ smem {
 			hwlocks = <&tcsr_mutex 3>;
 		};
 
+		usb: usb@a6f8800 {
+			compatible = "qcom,sdx55-dwc3", "qcom,dwc3";
+			reg = <0x0a6f8800 0x400>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+
+			clocks = <&gcc GCC_USB30_SLV_AHB_CLK>,
+				 <&gcc GCC_USB30_MASTER_CLK>,
+				 <&gcc GCC_USB30_MSTR_AXI_CLK>,
+				 <&gcc GCC_USB30_MOCK_UTMI_CLK>,
+				 <&gcc GCC_USB30_SLEEP_CLK>;
+			clock-names = "cfg_noc", "core", "iface", "mock_utmi",
+				      "sleep";
+
+			assigned-clocks = <&gcc GCC_USB30_MOCK_UTMI_CLK>,
+					  <&gcc GCC_USB30_MASTER_CLK>;
+			assigned-clock-rates = <19200000>, <200000000>;
+
+			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 198 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 158 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 157 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hs_phy_irq", "ss_phy_irq",
+					  "dm_hs_phy_irq", "dp_hs_phy_irq";
+
+			power-domains = <&gcc USB30_GDSC>;
+
+			resets = <&gcc GCC_USB30_BCR>;
+
+			usb_dwc3: dwc3@a600000 {
+				compatible = "snps,dwc3";
+				reg = <0x0a600000 0xcd00>;
+				interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
+				iommus = <&apps_smmu 0x1a0 0x0>;
+				snps,dis_u2_susphy_quirk;
+				snps,dis_enblslpm_quirk;
+				phys = <&usb_hsphy>, <&usb_ssphy>;
+				phy-names = "usb2-phy", "usb3-phy";
+			};
+		};
+
 		pdc: interrupt-controller@b210000 {
 			compatible = "qcom,sdx55-pdc", "qcom,pdc";
 			reg = <0x0b210000 0x30000>;
-- 
2.25.1

