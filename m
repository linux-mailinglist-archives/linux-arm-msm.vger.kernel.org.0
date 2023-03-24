Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C27976C75AA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Mar 2023 03:25:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231614AbjCXCZt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Mar 2023 22:25:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231442AbjCXCZo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Mar 2023 22:25:44 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AD102A160
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 19:25:40 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id y20so423892lfj.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 19:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679624738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pppVv+6kKCHtnAIWUvbmud9NL4WA01bTwzvL+s4jXKs=;
        b=CdZuellBrXJEJegDe5R6XM+D637FfIhXQLxvL8szs+4Ni6rQpMT6R/aOBhqjxunJb0
         AxaYuUaMX2XnmgK5TP2T0xOGMvPW3/tSoI1ENRYtfc/MJEOgX34UPjZOPZGuUMnsJTv/
         MoSToqup/Rd+aNy/uDGD8goqP57rZgYSvywpXsNO0O+9TqO3IqEo9mr5ANLg19RatJAf
         0tee+Qy3joZod8ymQ90Ybm0ez4tuusfCEw0YVoLohNDyFOIISvg1V9hCIKH09Cefa+L3
         2CGWcN6kjaxDdLjV0qQjDHUkd9Dn9Rv+xAxS0BkF5B6iqSVREO8PWEUQ1UUQPvLq6K7s
         RzQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679624738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pppVv+6kKCHtnAIWUvbmud9NL4WA01bTwzvL+s4jXKs=;
        b=K1YZ9hmacKOBCCYPxSBGEhigUNC4KkriHfZiCErOn3y2xwoK4K1z8QkaA/f6wyWf21
         x6+jQKjKWiMqVvboQtDAeOX/7DBybc5SdGZAPbmuLk4f5AYW+rIjNz0uTUXW/T9BTL/7
         ufoKuLNLzSFnTK4ovgB29YdYLPj3s4+oLPZhXOq0NBC4P3la5sPWIlmCWJeJ09ExBJ5p
         B74x+c88cfeuTwZRm7JqdO28/5fcaCSni1T8YpAkCBj6bqrlOy2f1WikJ31QgwyQo7ss
         GsuLpnayNwgEMGWA3gHJlpnsMjg/qVgEoHMfqr5BwETTA/mjOmZ+FToEG41+Ruv9y1FV
         Vg3g==
X-Gm-Message-State: AAQBX9enYKTYX8UXx4f1J4WOIwiwVmrcio1g6R0jzBR6Z7kORytNuaKc
        gc34/BjFE0vcH1z2cCQ8TSlvoA==
X-Google-Smtp-Source: AKy350Yc5f0wpwRUe9CcRaH6OqEsephSuLCrP84G1vtcrMzH6qWhHXUga8lcLLS4gzUjOsPwbCrvKw==
X-Received: by 2002:a05:6512:51b:b0:4dd:a718:31dd with SMTP id o27-20020a056512051b00b004dda71831ddmr234232lfb.12.1679624738634;
        Thu, 23 Mar 2023 19:25:38 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id x4-20020a19f604000000b004db3aa3c542sm3162628lfe.47.2023.03.23.19.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 19:25:38 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 21/41] arm64: dts: qcom: sm8250: switch USB+DP QMP PHY to new style of bindings
Date:   Fri, 24 Mar 2023 05:24:54 +0300
Message-Id: <20230324022514.1800382-22-dmitry.baryshkov@linaro.org>
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
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 49 ++++++++--------------------
 1 file changed, 14 insertions(+), 35 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 0b9ca147c1b4..e7b1c9fc13c5 100644
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
+				      "ref_clk_src",
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
@@ -3707,7 +3686,7 @@ usb_1_dwc3: usb@a600000 {
 				iommus = <&apps_smmu 0x0 0x0>;
 				snps,dis_u2_susphy_quirk;
 				snps,dis_enblslpm_quirk;
-				phys = <&usb_1_hsphy>, <&usb_1_ssphy>;
+				phys = <&usb_1_hsphy>, <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
 				phy-names = "usb2-phy", "usb3-phy";
 			};
 		};
@@ -4397,8 +4376,8 @@ dispcc: clock-controller@af00000 {
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

