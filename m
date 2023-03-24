Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9C1B6C75A2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Mar 2023 03:25:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230132AbjCXCZb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Mar 2023 22:25:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231300AbjCXCZ3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Mar 2023 22:25:29 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31FDF298CA
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 19:25:27 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id t11so428142lfr.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 19:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679624726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LqvYdm/43YvQVXBtNz93LL3IkaXdxCUMKnG048HS57Y=;
        b=yzHXftT9hl6bEcVQVqDzz5NICZX7f/uJ6eUTaQ3J4OboeUv6kRjICsa1Sfmdz5fW8d
         oyhVYLSQE1K9rjCpXNFxu4y3YtVsrw/wM+wOlqp5j95LOV1NG+gEcLaCGYggql6qn3ZF
         gZReUDrkw/X/rnanOVfmj90JtFAjO607fl1Ti60zt0JzQaDJLnF8tXM1ItiUl/OwWz6i
         BpoJjra/pn6aFvzIvl2iX+vQTcxWOsWdB6FXjV72q8eL61yJjSYyR46dz4qOyrFvhehg
         0JOYT2YU+y/YH76IbTi/DNKA6hFYJ21lyo5hHGSLgDMfg6HOfPOk2tL8NRCU1sjgdpsV
         8ehg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679624726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LqvYdm/43YvQVXBtNz93LL3IkaXdxCUMKnG048HS57Y=;
        b=OTM4PWLdOn31+K/IRKmIm0ZJuOF8dLDkGOy9SASO298tSytrYSRUqguA8yaD0K0utq
         Q6d+CjPP5v7CAJR5DAYi+xDDjkK7WyQTqcPAnoSPIzDUYS4UXVLTruxnpKnPNU5ytgah
         wuvx9HTAd864lc42D17thC2e9vt2e8bqZpuvklQNqXWvC5XUXlOnDN7BHlfjXmqWiyix
         o77t3/CBN9yqpPeJ2ED1IuUGY4M48gJx6KnOqcNt7L0+lhA/+kkmiuRWdCIQtwfm7k6h
         FxBpodsGhgbpHWa4tQnl/M7HLjApvdP2lhOkd70KSoY7Osz5vQSGYxvRPooR74v6M9FD
         b33A==
X-Gm-Message-State: AAQBX9fZzdRam2ODWVxwzlhcz1RxHaGQO43XbbdodlfI52oN6n/K8kox
        KTVV5m7Sv50WNOlbE4oACYWGow==
X-Google-Smtp-Source: AKy350bEYOis7ki08Z57nxZEzZnPGXnxA0ZUubzpWmH6TtUfaYzvsWnJF3mfFXox2YXySXmFSidWVA==
X-Received: by 2002:a19:c202:0:b0:4d8:56db:1ce7 with SMTP id l2-20020a19c202000000b004d856db1ce7mr283294lfc.12.1679624726624;
        Thu, 23 Mar 2023 19:25:26 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id x4-20020a19f604000000b004db3aa3c542sm3162628lfe.47.2023.03.23.19.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 19:25:25 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 11/41] arm64: dts: qcom: ipq8074: switch USB QMP PHY to new style of bindings
Date:   Fri, 24 Mar 2023 05:24:44 +0300
Message-Id: <20230324022514.1800382-12-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230324022514.1800382-1-dmitry.baryshkov@linaro.org>
References: <20230324022514.1800382-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Change the USB QMP PHY to use newer style of QMP PHY bindings (single
resource region, no per-PHY subnodes).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/ipq8074.dtsi | 60 ++++++++++-----------------
 1 file changed, 22 insertions(+), 38 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
index fe37dcdc52c8..e7ac3f886611 100644
--- a/arch/arm64/boot/dts/qcom/ipq8074.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
@@ -113,32 +113,24 @@ soc: soc {
 
 		ssphy_1: phy@58000 {
 			compatible = "qcom,ipq8074-qmp-usb3-phy";
-			reg = <0x00058000 0x1c4>;
-			#address-cells = <1>;
-			#size-cells = <1>;
-			ranges;
+			reg = <0x00058000 0x1000>;
 
 			clocks = <&gcc GCC_USB1_AUX_CLK>,
 				<&gcc GCC_USB1_PHY_CFG_AHB_CLK>,
-				<&xo>;
-			clock-names = "aux", "cfg_ahb", "ref";
+				<&xo>,
+				<&gcc GCC_USB1_PIPE_CLK>;
+			clock-names = "aux",
+				      "cfg_ahb",
+				      "ref",
+				      "pipe";
+			clock-output-names = "usb3phy_1_cc_pipe_clk";
+			#clock-cells = <0>;
+			#phy-cells = <0>;
 
 			resets = <&gcc GCC_USB1_PHY_BCR>,
 				<&gcc GCC_USB3PHY_1_PHY_BCR>;
 			reset-names = "phy","common";
 			status = "disabled";
-
-			usb1_ssphy: phy@58200 {
-				reg = <0x00058200 0x130>,     /* Tx */
-				      <0x00058400 0x200>,     /* Rx */
-				      <0x00058800 0x1f8>,     /* PCS */
-				      <0x00058600 0x044>;     /* PCS misc */
-				#phy-cells = <0>;
-				#clock-cells = <0>;
-				clocks = <&gcc GCC_USB1_PIPE_CLK>;
-				clock-names = "pipe0";
-				clock-output-names = "usb3phy_1_cc_pipe_clk";
-			};
 		};
 
 		qusb_phy_1: phy@59000 {
@@ -156,32 +148,24 @@ qusb_phy_1: phy@59000 {
 
 		ssphy_0: phy@78000 {
 			compatible = "qcom,ipq8074-qmp-usb3-phy";
-			reg = <0x00078000 0x1c4>;
-			#address-cells = <1>;
-			#size-cells = <1>;
-			ranges;
+			reg = <0x00078000 0x1000>;
 
 			clocks = <&gcc GCC_USB0_AUX_CLK>,
 				<&gcc GCC_USB0_PHY_CFG_AHB_CLK>,
-				<&xo>;
-			clock-names = "aux", "cfg_ahb", "ref";
+				<&xo>,
+				<&gcc GCC_USB0_PIPE_CLK>;
+			clock-names = "aux",
+				      "cfg_ahb",
+				      "ref",
+				      "pipe";
+			clock-output-names = "usb3phy_0_cc_pipe_clk";
+			#clock-cells = <0>;
+			#phy-cells = <0>;
 
 			resets = <&gcc GCC_USB0_PHY_BCR>,
 				<&gcc GCC_USB3PHY_0_PHY_BCR>;
 			reset-names = "phy","common";
 			status = "disabled";
-
-			usb0_ssphy: phy@78200 {
-				reg = <0x00078200 0x130>,     /* Tx */
-				      <0x00078400 0x200>,     /* Rx */
-				      <0x00078800 0x1f8>,     /* PCS */
-				      <0x00078600 0x044>;     /* PCS misc */
-				#phy-cells = <0>;
-				#clock-cells = <0>;
-				clocks = <&gcc GCC_USB0_PIPE_CLK>;
-				clock-names = "pipe0";
-				clock-output-names = "usb3phy_0_cc_pipe_clk";
-			};
 		};
 
 		qusb_phy_0: phy@79000 {
@@ -609,7 +593,7 @@ dwc_0: usb@8a00000 {
 				compatible = "snps,dwc3";
 				reg = <0x8a00000 0xcd00>;
 				interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
-				phys = <&qusb_phy_0>, <&usb0_ssphy>;
+				phys = <&qusb_phy_0>, <&ssphy_0>;
 				phy-names = "usb2-phy", "usb3-phy";
 				snps,is-utmi-l1-suspend;
 				snps,hird-threshold = /bits/ 8 <0x0>;
@@ -651,7 +635,7 @@ dwc_1: usb@8c00000 {
 				compatible = "snps,dwc3";
 				reg = <0x8c00000 0xcd00>;
 				interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>;
-				phys = <&qusb_phy_1>, <&usb1_ssphy>;
+				phys = <&qusb_phy_1>, <&ssphy_1>;
 				phy-names = "usb2-phy", "usb3-phy";
 				snps,is-utmi-l1-suspend;
 				snps,hird-threshold = /bits/ 8 <0x0>;
-- 
2.30.2

