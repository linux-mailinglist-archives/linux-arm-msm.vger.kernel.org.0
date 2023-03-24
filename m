Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C62796C75B3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Mar 2023 03:25:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231405AbjCXCZy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Mar 2023 22:25:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230111AbjCXCZv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Mar 2023 22:25:51 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 104582A147
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 19:25:50 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id j11so371189lfg.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 19:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679624748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jyV21pkybTMZlIa57CVH2y8JOnNfS0VKEQ8YPK4dmbQ=;
        b=pHPWjnUqGMC5T8p3asbRTNB0CMkqMn5zWRHgY+kdSoR5vCDK3JSey3JGL7wJf07ij/
         1WsqiPTUdilg4Jpqu6atCoLOUwT9oDBHtf9UlRlK810TiSVNCUuRGqgJaSQuSVA3pzdL
         1A5giebpBf2Ytph7w83BRuRmU7T2c+imPHFqhIl/4dQcAzqO8+FNSWtSw5VxXEOcirEA
         WXWvCTaAxS1oZzA95gZe1ocXY2ce58dqL9hFqPoq5DFPSY0iOVvRxgUogGEaYD6AOL6q
         c2AoJYEexJgg+Lk/xst3Y4nD1R4t/oqi8cuPGPISowjkFnrxyolCIvUOjAshwuCLk011
         mT3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679624748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jyV21pkybTMZlIa57CVH2y8JOnNfS0VKEQ8YPK4dmbQ=;
        b=gdVTJt9f5oHHea9paF41qeQGLUSkyi/icCTdtF4FU5UDlYUQd3iW9Z3+nxUzBFPxJL
         BZsCvXWGJfVs4QpZEAVsrz7Gn/CzhKj1PHORtrGdVJ+NMAGKIorBTKNlJ6kmlNEJGe80
         DTZ1mAH8B30veVGxT+u3809P8rOX0WampFPNJpw3exwShYN1CBk3iBPJy1F/a3PT6f6n
         guKTB+urtLnkEtvUFWgBRDkge9SiToSm1F2OQeIBIl7lh+GSvr/2PMPe5N3KSjBedVu9
         LGUTRNOOJIqwt5VN4suW8dYfW9PzaLDeWQDFrO6bj8wTmihSAQm9CnPayZbT7zZ1oOSu
         yT/Q==
X-Gm-Message-State: AAQBX9eLUe4pBRoy/v9WpQYobQI+avsEnoHQrt3O/6jUtzpAREr/87oe
        md8RmtWZFw0LwqWUa+hqqPlnDw==
X-Google-Smtp-Source: AKy350Yk8c6tRDBxz6XfFexnnxPNLgbeffko2iMHzVECttekJo6LVucGeaiX23Xk+OVVBcWZyhzmMA==
X-Received: by 2002:ac2:446d:0:b0:4ea:8892:58dd with SMTP id y13-20020ac2446d000000b004ea889258ddmr193916lfl.59.1679624748429;
        Thu, 23 Mar 2023 19:25:48 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id x4-20020a19f604000000b004db3aa3c542sm3162628lfe.47.2023.03.23.19.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 19:25:48 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 31/41] arm64: dts: qcom: ipq6018: switch PCIe QMP PHY to new style of bindings
Date:   Fri, 24 Mar 2023 05:25:04 +0300
Message-Id: <20230324022514.1800382-32-dmitry.baryshkov@linaro.org>
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

Change the PCIe QMP PHY to use newer style of QMP PHY bindings (single
resource region, no per-PHY subnodes).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/ipq6018.dtsi | 32 ++++++++++-----------------
 1 file changed, 12 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
index ff540bfcc062..9a2daab5ff15 100644
--- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
@@ -255,33 +255,25 @@ qusb_phy_0: qusb@79000 {
 
 		pcie_phy: phy@84000 {
 			compatible = "qcom,ipq6018-qmp-pcie-phy";
-			reg = <0x0 0x00084000 0x0 0x1bc>; /* Serdes PLL */
+			reg = <0x0 0x00084000 0x0 0x1000>;
 			status = "disabled";
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
 
 			clocks = <&gcc GCC_PCIE0_AUX_CLK>,
-				<&gcc GCC_PCIE0_AHB_CLK>;
-			clock-names = "aux", "cfg_ahb";
+				<&gcc GCC_PCIE0_AHB_CLK>,
+				<&gcc GCC_PCIE0_PIPE_CLK>;
+			clock-names = "aux",
+				      "cfg_ahb",
+				      "pipe";
+
+			clock-output-names = "gcc_pcie0_pipe_clk_src";
+			#clock-cells = <0>;
+
+			#phy-cells = <0>;
 
 			resets = <&gcc GCC_PCIE0_PHY_BCR>,
 				<&gcc GCC_PCIE0PHY_PHY_BCR>;
 			reset-names = "phy",
 				      "common";
-
-			pcie_phy0: phy@84200 {
-				reg = <0x0 0x00084200 0x0 0x16c>, /* Serdes Tx */
-				      <0x0 0x00084400 0x0 0x200>, /* Serdes Rx */
-				      <0x0 0x00084800 0x0 0x1f0>, /* PCS: Lane0, COM, PCIE */
-				      <0x0 0x00084c00 0x0 0xf4>; /* pcs_misc */
-				#phy-cells = <0>;
-
-				clocks = <&gcc GCC_PCIE0_PIPE_CLK>;
-				clock-names = "pipe0";
-				clock-output-names = "gcc_pcie0_pipe_clk_src";
-				#clock-cells = <0>;
-			};
 		};
 
 		mdio: mdio@90000 {
@@ -728,7 +720,7 @@ pcie0: pci@20000000 {
 			#address-cells = <3>;
 			#size-cells = <2>;
 
-			phys = <&pcie_phy0>;
+			phys = <&pcie_phy>;
 			phy-names = "pciephy";
 
 			ranges = <0x81000000 0x0 0x00000000 0x0 0x20200000 0x0 0x10000>,
-- 
2.30.2

