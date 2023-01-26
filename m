Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9520C67CBD1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jan 2023 14:15:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236512AbjAZNO5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Jan 2023 08:14:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236541AbjAZNOv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Jan 2023 08:14:51 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC72D69516
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 05:14:29 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id c4-20020a1c3504000000b003d9e2f72093so3224213wma.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 05:14:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UW4W+o70uSUPWzafPm8Zcno0SWy4B2fWSrXRBEOO7Yk=;
        b=wxrXDmPibWvDrG66uIFNhEwtG/F0Pqwxz8Nr+64qPGJBwdPxngwGEaOuItuLa6li1f
         82XQbYeswla/vJUSrXF0a+7aPPrtPskuHbxD0Ob9612uYenH/aCwC/Gq9+Mh9rs6WGIj
         9L5HaoCddMyRGOWkujCO6Zh8BVAWM7sohdQ2fYlF7r1B0TTA9pJW1tZcgVrYcxIkM7XD
         PybKAPrpYADZhFcMudu/E15c1U8316IIgiawpG1NJEXhRAS73dcsCxDlzGexdfa1Wn0B
         ycOV7ta5Yam1TtqRLLTsVTM0pvWIQnHKfBMqwslM5DgwE/lHTf0sdhAgNsGeD2Ym6uFb
         PnLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UW4W+o70uSUPWzafPm8Zcno0SWy4B2fWSrXRBEOO7Yk=;
        b=1j1akxV+n0UKaa4W7BEgxdyWz3hwnOdzzKzaEzE6kiqvqhLKl4ExF7Jec9H7Eux2Am
         76VvrRaGxDw6gbWilNd+01SACeDJZ83WptdvLdMH2FLV/WWsVz5ejLRzyRcBI78Pewx/
         UCYCeG+S4cqyK/RcZfgrtOHAOTvmLDVMRHg2EY8lt4QKYQmcrFfwvxS29X1+3WFo+9+k
         /KbeFGHjAA8bwq8t4Fam9fCptrcCo5D3ptDotaUytVN342UignHSF7qLHEJ3UAaTVXts
         mq8a6LZyUdgf7pxQ3t4x86RJGhHhWNVLgQm815a04VF9pWIAFGffEpji5uJtooczsZjK
         7JWw==
X-Gm-Message-State: AFqh2kqm1WixNlZTi7Y7Xu6yvCqVOW4lEmc+3UDtL8kNepgAOuBNjigg
        dYGWp8yvMEUNldtCFWXxxhTUTw==
X-Google-Smtp-Source: AMrXdXt4vyeyQhc/DG85w8kIZbt5WTKi9Yo0uDjPfeIwyjRdV+Hv1gNPNhREY7r5Yd1SiPZc3Uoa1A==
X-Received: by 2002:a05:600c:21c4:b0:3da:fcf1:d4cc with SMTP id x4-20020a05600c21c400b003dafcf1d4ccmr35486870wmj.30.1674738868418;
        Thu, 26 Jan 2023 05:14:28 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id 18-20020a05600c26d200b003da28dfdedcsm1719804wmv.5.2023.01.26.05.14.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 05:14:27 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "vkoul@kernel.org" <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-phy@lists.infradead.org
Subject: [PATCH v3 7/8] arm64: dts: qcom: sm8550: Add USB PHYs and controller nodes
Date:   Thu, 26 Jan 2023 15:14:14 +0200
Message-Id: <20230126131415.1453741-8-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230126131415.1453741-1-abel.vesa@linaro.org>
References: <20230126131415.1453741-1-abel.vesa@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add USB host controller and PHY nodes.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---

Changes since v2:
 * none

NOTE: This patch has been already merged. It is here only to provide
context for the rest of the patchset. There is a change with respect to the
clocks, but that will be sent as a separate/individual fix patch.

 arch/arm64/boot/dts/qcom/sm8550.dtsi | 92 +++++++++++++++++++++++++++-
 1 file changed, 91 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 4daf1f03d79f..6801454bbe10 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -13,6 +13,7 @@
 #include <dt-bindings/mailbox/qcom-ipcc.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
+#include <dt-bindings/phy/phy-qcom-qmp.h>
 #include <dt-bindings/thermal/thermal.h>
 
 / {
@@ -652,7 +653,7 @@ gcc: clock-controller@100000 {
 				 <&ufs_mem_phy 0>,
 				 <&ufs_mem_phy 1>,
 				 <&ufs_mem_phy 2>,
-				 <0>;
+				 <&usb_dp_qmpphy QMP_USB43DP_USB3_PIPE_CLK>;
 		};
 
 		ipcc: mailbox@408000 {
@@ -1924,6 +1925,95 @@ opp-202000000 {
 			};
 		};
 
+		usb_1_hsphy: phy@88e3000 {
+			compatible = "qcom,sm8550-snps-eusb2-phy";
+			reg = <0x0 0x088e3000 0x0 0x154>;
+			#phy-cells = <0>;
+
+			clocks = <&tcsr TCSR_USB2_CLKREF_EN>;
+			clock-names = "ref";
+
+			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
+
+			status = "disabled";
+		};
+
+		usb_dp_qmpphy: phy@88e8000 {
+			compatible = "qcom,sm8550-qmp-usb3-dp-phy";
+			reg = <0x0 0x088e8000 0x0 0x3000>;
+
+			clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
+				 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
+			clock-names = "aux", "ref", "com_aux", "usb3_pipe";
+
+			power-domains = <&gcc USB3_PHY_GDSC>;
+
+			resets = <&gcc GCC_USB3_DP_PHY_PRIM_BCR>,
+				 <&gcc GCC_USB3_PHY_PRIM_BCR>;
+			reset-names = "phy", "common";
+
+			#clock-cells = <1>;
+			#phy-cells = <1>;
+
+			status = "disabled";
+		};
+
+		usb_1: usb@a6f8800 {
+			compatible = "qcom,sm8550-dwc3", "qcom,dwc3";
+			reg = <0x0 0x0a6f8800 0x0 0x400>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
+				 <&gcc GCC_USB30_PRIM_MASTER_CLK>,
+				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
+				 <&gcc GCC_USB30_PRIM_SLEEP_CLK>,
+				 <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
+				 <&rpmhcc TCSR_USB3_CLKREF_EN>;
+			clock-names = "cfg_noc",
+				      "core",
+				      "iface",
+				      "sleep",
+				      "mock_utmi",
+				      "xo";
+
+			assigned-clocks = <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
+					  <&gcc GCC_USB30_PRIM_MASTER_CLK>;
+			assigned-clock-rates = <19200000>, <200000000>;
+
+			interrupts-extended = <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 17 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 15 IRQ_TYPE_EDGE_RISING>,
+					      <&pdc 14 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "hs_phy_irq",
+					  "ss_phy_irq",
+					  "dm_hs_phy_irq",
+					  "dp_hs_phy_irq";
+
+			power-domains = <&gcc USB30_PRIM_GDSC>;
+			required-opps = <&rpmhpd_opp_nom>;
+
+			resets = <&gcc GCC_USB30_PRIM_BCR>;
+
+			status = "disabled";
+
+			usb_1_dwc3: usb@a600000 {
+				compatible = "snps,dwc3";
+				reg = <0x0 0x0a600000 0x0 0xcd00>;
+				interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
+				iommus = <&apps_smmu 0x40 0x0>;
+				snps,dis_u2_susphy_quirk;
+				snps,dis_enblslpm_quirk;
+				snps,usb3_lpm_capable;
+				phys = <&usb_1_hsphy>,
+				       <&usb_dp_qmpphy QMP_USB43DP_USB3_PHY>;
+				phy-names = "usb2-phy", "usb3-phy";
+			};
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sm8550-pdc", "qcom,pdc";
 			reg = <0 0x0b220000 0 0x30000>, <0 0x174000f0 0 0x64>;
-- 
2.34.1

