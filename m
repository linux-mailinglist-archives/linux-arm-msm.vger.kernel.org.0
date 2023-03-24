Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA29B6C75A9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Mar 2023 03:25:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231596AbjCXCZs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Mar 2023 22:25:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231405AbjCXCZn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Mar 2023 22:25:43 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70F592A170
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 19:25:39 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id c29so417191lfv.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 19:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679624738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yLL7LJ14YZdfMKG3+4RbHGFDAFwgLi7duB+SSwQ3Y0Y=;
        b=wDJ/PihJs4/kLTVgP/bGFV3pDgs9WsipwRaqMai+0Lg04Z4jVdr+TUUhcnVSVj3RuM
         OLytYmqlDc29iFABFv0hWeYADA+j8near6hnVuUBpPndQq7o2iVC0JQeTnyNpWjuTU3G
         foIHJonowN0q8Cjdrgb9pagB9Bp/9qI7j4rcI1vKuS+asveqjo3csEefnCiNzGg5rGmf
         MYGu8NcwMmAsxaFvgMAsPUeyT2t3hETSxrHlvWALFtfTCOAQoHpBN3vhSl4kGbefxpSR
         gPLFWjJKjziiz6fvzuQWSwrZE9a0rc0zAl2i1r7Dg5FBfY1WL5ToEk0qs3K3tDMbYKRk
         4mfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679624738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yLL7LJ14YZdfMKG3+4RbHGFDAFwgLi7duB+SSwQ3Y0Y=;
        b=t/qxv6cw10C0wYXZlMWVRIsho/mFkVcsVekDbSpWaWBMtLeSTtDDzRaXUifbIPJoZ/
         4CarBu+AdJBeOdGZzJqNsTcgAASmep+mbvK8JByA2N8FZW49YJuzvNaYarE/kqiXvkbz
         3MVtkRKGa6hgVq83XNCctkgSbVIX4CyQLLai+OMeXti3Q0NPEnRyy9SXmeLCX6vBZmXU
         D81qP96XFVTB1OA+BSCGF0csCLeYQBlbZZfLU8bNsqEmVkxxOpw3QXeSc+kqlrMOV2K9
         ynZ18Iu5zbe/sLaxgOostWPsyAWbbg38795+DDU9QNMKIICbHgt9XJfEcYgQPL4n09CH
         WBNQ==
X-Gm-Message-State: AAQBX9esGfneycIqOx2ARS7r6gtSr9aug4Hjn/aA4s3P6EV8FbG8xuu7
        zM5/YlZdZchk3M5pocLEOjdD4g==
X-Google-Smtp-Source: AKy350bFOtu8vzt2ufqTFuC1AUJuHE5YWWScm3BzL8AY9jzxP/7LGw4IELEAV57Uh2pg6zdAx5kR6A==
X-Received: by 2002:ac2:5ded:0:b0:4dd:af74:fe1a with SMTP id z13-20020ac25ded000000b004ddaf74fe1amr230996lfq.48.1679624737830;
        Thu, 23 Mar 2023 19:25:37 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id x4-20020a19f604000000b004db3aa3c542sm3162628lfe.47.2023.03.23.19.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 19:25:37 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 20/41] arm64: dts: qcom: sdm845: switch USB+DP QMP PHY to new style of bindings
Date:   Fri, 24 Mar 2023 05:24:53 +0300
Message-Id: <20230324022514.1800382-21-dmitry.baryshkov@linaro.org>
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
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 55 +++++++++-------------------
 1 file changed, 18 insertions(+), 37 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 10c53756a903..062790ef7bc9 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -17,6 +17,7 @@
 #include <dt-bindings/interconnect/qcom,osm-l3.h>
 #include <dt-bindings/interconnect/qcom,sdm845.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/phy/phy-qcom-qmp.h>
 #include <dt-bindings/phy/phy-qcom-qusb2.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/reset/qcom,sdm845-aoss.h>
@@ -3909,49 +3910,28 @@ usb_2_hsphy: phy@88e3000 {
 			nvmem-cells = <&qusb2s_hstx_trim>;
 		};
 
-		usb_1_qmpphy: phy@88e9000 {
+		usb_1_qmpphy: phy@88e8000 {
 			compatible = "qcom,sdm845-qmp-usb3-dp-phy";
-			reg = <0 0x088e9000 0 0x18c>,
-			      <0 0x088e8000 0 0x38>,
-			      <0 0x088ea000 0 0x40>;
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
-				#clock-cells = <1>;
-				#phy-cells = <0>;
-			};
+			#clock-cells = <1>;
+			#phy-cells = <1>;
 		};
 
 		usb_2_qmpphy: phy@88eb000 {
@@ -4024,7 +4004,7 @@ usb_1_dwc3: usb@a600000 {
 				iommus = <&apps_smmu 0x740 0>;
 				snps,dis_u2_susphy_quirk;
 				snps,dis_enblslpm_quirk;
-				phys = <&usb_1_hsphy>, <&usb_1_ssphy>;
+				phys = <&usb_1_hsphy>, <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
 				phy-names = "usb2-phy", "usb3-phy";
 			};
 		};
@@ -4492,8 +4472,9 @@ mdss_dp: displayport-controller@ae90000 {
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
@@ -4831,8 +4812,8 @@ dispcc: clock-controller@af00000 {
 				 <&dsi0_phy 1>,
 				 <&dsi1_phy 0>,
 				 <&dsi1_phy 1>,
-				 <&dp_phy 0>,
-				 <&dp_phy 1>;
+				 <&usb_1_qmpphy QMP_USB43DP_DP_LINK_CLK>,
+				 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
 			clock-names = "bi_tcxo",
 				      "gcc_disp_gpll0_clk_src",
 				      "gcc_disp_gpll0_div_clk_src",
-- 
2.30.2

