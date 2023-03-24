Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97C546C75A6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Mar 2023 03:25:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230489AbjCXCZk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Mar 2023 22:25:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230111AbjCXCZj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Mar 2023 22:25:39 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DC292A6E8
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 19:25:35 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id c29so417093lfv.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 19:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679624735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E1wZwowR3K0DmOyEW6wa2PnmcnTAkqbHRVOAsWUO9Wg=;
        b=RJs/pxq1jEfIdATi6/7DwE2tdRPM1hSGYlSoHCmMyD0IXfKODdXKoni0/lymECQhQP
         R4I4XoVIYzGLJj+opDywGDmIvWmPTF/GNkVpPLAg/iG2ewM4VcknZpPrddd9ra6U/CB9
         LZGJAddfKmGXyQ33/Mcbj57t1KEa7Q8OZTbc7JQf9tOJ2VGpcGJ7U7Z8M+gqhygi3qJP
         l/VGrLc2+ixGcv2zrWilG7uLTCu4VvE0Ko9XkrmsU6fpt3Xsayi01R0196CxnpdN7cpN
         X/mfomTVLmSct7FMc/VGvDwkrlBDLqkMvtJM8KUziphU0RXU9EuAlxsTuKfz0uKopFCA
         01Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679624735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E1wZwowR3K0DmOyEW6wa2PnmcnTAkqbHRVOAsWUO9Wg=;
        b=uUbW6BgAkLCDBZ3rLH4KtmIpNLdEHALy2xRBQ83hVkPif3fiIaw60gPcZQ7VhZrG82
         zAsHypKT6RUnwUlWlisgW/P6BpVtCaSWP9GmDa+uCXvAayQOYmnM1wcN28JBtKXsucL9
         zUIG+GayOfwDRer+d/QkvcaCVY7RsSo2CvkkTNX2DC3ZI/ep1XN68xjLKcCYg3js9qgh
         9yB/03zhCPvOP/MwlH7j+q/p2MK9Cko5h8fX1V7wv4hv9wkl0PnzedCPCoY2/NXC7YWF
         DXug42IaElJQgnSsnakW5R2rCUYJzDJq3Y1BnH/Y1vM/Oe7DaDD3IgQ/id2kuztwGoci
         XKFA==
X-Gm-Message-State: AAQBX9e90c9ZsQOkvANWbgVMvFH1BD46gaHnm3Jm2GNSMwBkr0y2glEd
        TyFY7awqkt2U/g7RRBNZsDsVIg==
X-Google-Smtp-Source: AKy350bcfrr433yyg/7M9umS3dOAxGN2NriqRx/DCCvyfOlFoSU0k/u7VR5Ax66njBSrY7nE/RUbmw==
X-Received: by 2002:a19:f00b:0:b0:4e8:6101:bce5 with SMTP id p11-20020a19f00b000000b004e86101bce5mr179035lfc.39.1679624735196;
        Thu, 23 Mar 2023 19:25:35 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id x4-20020a19f604000000b004db3aa3c542sm3162628lfe.47.2023.03.23.19.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 19:25:34 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 18/41] arm64: dts: qcom: sc7180: switch USB+DP QMP PHY to new style of bindings
Date:   Fri, 24 Mar 2023 05:24:51 +0300
Message-Id: <20230324022514.1800382-19-dmitry.baryshkov@linaro.org>
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
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 55 +++++++++-------------------
 1 file changed, 18 insertions(+), 37 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 3c799b564b64..369868f613bf 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -14,6 +14,7 @@
 #include <dt-bindings/interconnect/qcom,osm-l3.h>
 #include <dt-bindings/interconnect/qcom,sc7180.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/phy/phy-qcom-qmp.h>
 #include <dt-bindings/phy/phy-qcom-qusb2.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/reset/qcom,sdm845-aoss.h>
@@ -2713,49 +2714,28 @@ usb_1_hsphy: phy@88e3000 {
 			nvmem-cells = <&qusb2p_hstx_trim>;
 		};
 
-		usb_1_qmpphy: phy-wrapper@88e9000 {
+		usb_1_qmpphy: phy@88e8000 {
 			compatible = "qcom,sc7180-qmp-usb3-dp-phy";
-			reg = <0 0x088e9000 0 0x18c>,
-			      <0 0x088e8000 0 0x3c>,
-			      <0 0x088ea000 0 0x18c>;
+			reg = <0 0x088e8000 0 0x3000>;
 			status = "disabled";
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
 
 			clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
 				 <&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
 				 <&gcc GCC_USB3_PRIM_CLKREF_CLK>,
-				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>;
-			clock-names = "aux", "cfg_ahb", "ref", "com_aux";
+				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
+				 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
+			clock-names = "aux",
+				      "cfg_ahb",
+				      "ref",
+				      "com_aux",
+				      "usb3_pipe";
 
 			resets = <&gcc GCC_USB3_PHY_PRIM_BCR>,
 				 <&gcc GCC_USB3_DP_PHY_PRIM_BCR>;
 			reset-names = "phy", "common";
 
-			usb_1_ssphy: usb3-phy@88e9200 {
-				reg = <0 0x088e9200 0 0x128>,
-				      <0 0x088e9400 0 0x200>,
-				      <0 0x088e9c00 0 0x218>,
-				      <0 0x088e9600 0 0x128>,
-				      <0 0x088e9800 0 0x200>,
-				      <0 0x088e9a00 0 0x18>;
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
-				#clock-cells = <1>;
-				#phy-cells = <0>;
-			};
+			#clock-cells = <1>;
+			#phy-cells = <1>;
 		};
 
 		dc_noc: interconnect@9160000 {
@@ -2835,7 +2815,7 @@ usb_1_dwc3: usb@a600000 {
 				iommus = <&apps_smmu 0x540 0>;
 				snps,dis_u2_susphy_quirk;
 				snps,dis_enblslpm_quirk;
-				phys = <&usb_1_hsphy>, <&usb_1_ssphy>;
+				phys = <&usb_1_hsphy>, <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
 				phy-names = "usb2-phy", "usb3-phy";
 				maximum-speed = "super-speed";
 			};
@@ -3143,8 +3123,9 @@ mdss_dp: displayport-controller@ae90000 {
 					      "ctrl_link_iface", "stream_pixel";
 				assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
 						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
-				assigned-clock-parents = <&dp_phy 0>, <&dp_phy 1>;
-				phys = <&dp_phy>;
+				assigned-clock-parents = <&usb_1_qmpphy QMP_USB43DP_DP_LINK_CLK>,
+							 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
+				phys = <&usb_1_qmpphy QMP_USB43DP_DP_PHY>;
 				phy-names = "dp";
 
 				operating-points-v2 = <&dp_opp_table>;
@@ -3201,8 +3182,8 @@ dispcc: clock-controller@af00000 {
 				 <&gcc GCC_DISP_GPLL0_CLK_SRC>,
 				 <&dsi_phy 0>,
 				 <&dsi_phy 1>,
-				 <&dp_phy 0>,
-				 <&dp_phy 1>;
+				 <&usb_1_qmpphy QMP_USB43DP_DP_LINK_CLK>,
+				 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
 			clock-names = "bi_tcxo",
 				      "gcc_disp_gpll0_clk_src",
 				      "dsi0_phy_pll_out_byteclk",
-- 
2.30.2

