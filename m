Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E6936C91F8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Mar 2023 01:57:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230223AbjCZA5r (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 25 Mar 2023 20:57:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230292AbjCZA5n (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 25 Mar 2023 20:57:43 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7647BBBBF
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Mar 2023 17:57:42 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id c29so6954019lfv.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Mar 2023 17:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679792260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gMntj6TuHar/tK/rMvH+oM0+d4fFWN/I+xIIuk8XA7E=;
        b=mNcKLxzbKkeyfypKW0XK6C4kF4J9BkE6MLDnk1m+toQ7PUONstIk4Dn+MrjZMyEfMB
         hQ/7tktjXa/ikNDu1P/U0kAhUK7/uQ2QkI6YF2idy568mIInGh8QW8q6/RbFqEwg2hGV
         g2MiI5vLmKR6QXZNHsycu8MJmGQ9NmJYWcFOGdO069pRINl/4qN2Qzudu22KWBE2Qi98
         HkBEOrf2XlMSdy8RHSZ3TzbtKLRCAdhKwvf21R7ns4u2gjp0bfdbtOZl0oWHP65IUzHI
         eyABq+z1dmLtwwnRV1QbeWJktJwD0M5cB+NpCZIfFK98u8+eskibQ2g3eU/SSFgFEzDM
         jw1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679792260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gMntj6TuHar/tK/rMvH+oM0+d4fFWN/I+xIIuk8XA7E=;
        b=mkHPfdvbRC7Fp3JJk0pgbjDiYLTNNgJWq8rS/dEKfTbhWDhecsi2/OKzsUQ6Z8HEKm
         Q5oznVgw70tYIbudY+Ow3Oo0gzp3eZ1vJy/NoT55etsG+cTGQ+3cb5c84OF/TDBlPr40
         yVEs0NZjVnj/p4Cn/dcwr4IGMSmQ8D9zuYaCdNXWLl6ETnSfaJI/GmzTIoyUrLhICarq
         NHGnlPHjQ9Me69pVOl9GihUg2kVEebH8B9OlIX93YCu5ge5pZDoZIR6RmMP9tAN9HXkq
         OrksaeylG0O5HUr4TN8hoMuvUo5nnqI0dwHnxjDCu/z208N+tPwb4Dhxv1n2ztjxvJjB
         lglw==
X-Gm-Message-State: AO0yUKWp8kG4im0Vz+PGz3/gokSuy8keB3RfIlT/vslB8xEaezrs3GDU
        J3DsqUIwLNXk+dLlz8zq6mjljQ==
X-Google-Smtp-Source: AK7set+tXss/KQPkKKa8TUVsWQSFAMl0QiO3RUK7Huie8FamxrGCoi/vvd6Fkma9W4J8XVOLlE2LOg==
X-Received: by 2002:a05:6512:b83:b0:4da:ffa0:3f21 with SMTP id b3-20020a0565120b8300b004daffa03f21mr4710412lfv.14.1679792260725;
        Sat, 25 Mar 2023 17:57:40 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id n13-20020ac242cd000000b004e7fa99f3f4sm3996858lfl.265.2023.03.25.17.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Mar 2023 17:57:40 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan+linaro@kernel.org>,
        devicetree@vger.kernel.org
Subject: [PATCH v2 9/9] arm64: dts: qcom: sm8250: switch USB+DP QMP PHY to new style of bindings
Date:   Sun, 26 Mar 2023 03:57:33 +0300
Message-Id: <20230326005733.2166354-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230326005733.2166354-1-dmitry.baryshkov@linaro.org>
References: <20230326005733.2166354-1-dmitry.baryshkov@linaro.org>
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
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 49 ++++++++--------------------
 1 file changed, 14 insertions(+), 35 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 7b78761f2041..24b51fb373b4 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -15,6 +15,7 @@
 #include <dt-bindings/interconnect/qcom,osm-l3.h>
 #include <dt-bindings/interconnect/qcom,sm8250.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
+#include <dt-bindings/phy/phy-qcom-qmp.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/soc/qcom,apr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
@@ -3527,48 +3528,26 @@ usb_2_hsphy: phy@88e4000 {
 			resets = <&gcc GCC_QUSB2PHY_SEC_BCR>;
 		};
 
-		usb_1_qmpphy: phy@88e9000 {
+		usb_1_qmpphy: phy@88e8000 {
 			compatible = "qcom,sm8250-qmp-usb3-dp-phy";
-			reg = <0 0x088e9000 0 0x200>,
-			      <0 0x088e8000 0 0x40>,
-			      <0 0x088ea000 0 0x200>;
+			reg = <0 0x088e8000 0 0x3000>;
 			status = "disabled";
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
 
 			clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
 				 <&rpmhcc RPMH_CXO_CLK>,
-				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>;
-			clock-names = "aux", "ref_clk_src", "com_aux";
+				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
+				 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
+			clock-names = "aux",
+				      "ref",
+				      "com_aux",
+				      "usb3_pipe";
 
 			resets = <&gcc GCC_USB3_DP_PHY_PRIM_BCR>,
 				 <&gcc GCC_USB3_PHY_PRIM_BCR>;
 			reset-names = "phy", "common";
 
-			usb_1_ssphy: usb3-phy@88e9200 {
-				reg = <0 0x088e9200 0 0x200>,
-				      <0 0x088e9400 0 0x200>,
-				      <0 0x088e9c00 0 0x400>,
-				      <0 0x088e9600 0 0x200>,
-				      <0 0x088e9800 0 0x200>,
-				      <0 0x088e9a00 0 0x100>;
-				#clock-cells = <0>;
-				#phy-cells = <0>;
-				clocks = <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
-				clock-names = "pipe0";
-				clock-output-names = "usb3_phy_pipe_clk_src";
-			};
-
-			dp_phy: dp-phy@88ea200 {
-				reg = <0 0x088ea200 0 0x200>,
-				      <0 0x088ea400 0 0x200>,
-				      <0 0x088eaa00 0 0x200>,
-				      <0 0x088ea600 0 0x200>,
-				      <0 0x088ea800 0 0x200>;
-				#phy-cells = <0>;
-				#clock-cells = <1>;
-			};
+			#clock-cells = <1>;
+			#phy-cells = <1>;
 		};
 
 		usb_2_qmpphy: phy@88eb000 {
@@ -3713,7 +3692,7 @@ usb_1_dwc3: usb@a600000 {
 				iommus = <&apps_smmu 0x0 0x0>;
 				snps,dis_u2_susphy_quirk;
 				snps,dis_enblslpm_quirk;
-				phys = <&usb_1_hsphy>, <&usb_1_ssphy>;
+				phys = <&usb_1_hsphy>, <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
 				phy-names = "usb2-phy", "usb3-phy";
 			};
 		};
@@ -4403,8 +4382,8 @@ dispcc: clock-controller@af00000 {
 				 <&dsi0_phy 1>,
 				 <&dsi1_phy 0>,
 				 <&dsi1_phy 1>,
-				 <&dp_phy 0>,
-				 <&dp_phy 1>;
+				 <&usb_1_qmpphy QMP_USB43DP_DP_LINK_CLK>,
+				 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
 			clock-names = "bi_tcxo",
 				      "dsi0_phy_pll_out_byteclk",
 				      "dsi0_phy_pll_out_dsiclk",
-- 
2.30.2

