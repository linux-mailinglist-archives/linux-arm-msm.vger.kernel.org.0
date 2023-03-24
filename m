Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 117556C75A3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Mar 2023 03:25:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231419AbjCXCZf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Mar 2023 22:25:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231173AbjCXCZe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Mar 2023 22:25:34 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17048F940
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 19:25:32 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id k37so457182lfv.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 19:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679624730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zrnLZFJZjQTK78KKuTjB3tD/VQE3uKg65KwHoav209g=;
        b=eMIjiyDSEUs2NzMN4Gl1WogKuCkWMz8Bjr8aNPaqk9tkqVEaENmWB0V9SYu35RL5td
         9Kjq8emr3H+ekCADKc2esLSvzhKyMqC+bpv7bczugSIkpVSQnIuWv2rbVg5Ob1sM38Lz
         RrEusZkgCymvJWcp7OCrPU2SD2GKK9fH0syZX2hdN13incrLEK8/FfWfiJjB+7A2WzRR
         ohC39cHYnu5rgbm84Wo+ruEh9QvZTyDXCnCCWJaxFnZ2mvB4XWzll2U3f8zvc847zc07
         o5FFSiRcXNAMiP97zZtB1Dtd4HM5UieaguY1Xq4w0zr6JhS9/4jY6N3PE6Vps+Z96bba
         d3Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679624730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zrnLZFJZjQTK78KKuTjB3tD/VQE3uKg65KwHoav209g=;
        b=XMUAGrVxkc5mioqzA++chZKT8dCB1+yXimlPqud8K5JWO/syumi/VMnMHZwmv3RB+O
         qgi+qPqYDuro1dMMm7dg55G6i1gYqRPEbQSO8mlBBCu3mQ+HbIkoiY2wpyhzIt8s4Oq+
         eU0pmTqKBHQvvFUSsfaUcnNru7a8MSV4TtvrZO8vZJ8iEEmSULwxOEpqLL6J/7IYqEcb
         l7xZ//Y3RdcVErBAz5T8cIQ7LvQq7Vfo/w6HfDoaRtu1F6/kI4JFJvYkgblgR2MZ0+40
         PCvrKtijssQcCRnSMIAT5Bbaf/pFpXGVxBF6CNha6OroP5ONGdoiadUyHrMp78s5mRoY
         GbNw==
X-Gm-Message-State: AAQBX9dWc/yMMBaRLZE39Pwu61V94MnZDrYVHd5xstR2LCd/Paj0I6wM
        ySXNErmIJmWBbqdVavs16P65bA==
X-Google-Smtp-Source: AKy350Z4fGACFf9176McZnAi8nBpD0erIZxd1XtpsHmX8hwt/lPDkz168LAGrPeNoRCwatS3z1WVVQ==
X-Received: by 2002:ac2:5291:0:b0:4dd:9ddc:4463 with SMTP id q17-20020ac25291000000b004dd9ddc4463mr212058lfm.5.1679624730492;
        Thu, 23 Mar 2023 19:25:30 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id x4-20020a19f604000000b004db3aa3c542sm3162628lfe.47.2023.03.23.19.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 19:25:29 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 14/41] arm64: dts: qcom: sdm845: switch USB QMP PHY to new style of bindings
Date:   Fri, 24 Mar 2023 05:24:47 +0300
Message-Id: <20230324022514.1800382-15-dmitry.baryshkov@linaro.org>
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
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 31 +++++++++++-----------------
 1 file changed, 12 insertions(+), 19 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 2f32179c7d1b..10c53756a903 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -3956,33 +3956,26 @@ dp_phy: dp-phy@88ea200 {
 
 		usb_2_qmpphy: phy@88eb000 {
 			compatible = "qcom,sdm845-qmp-usb3-uni-phy";
-			reg = <0 0x088eb000 0 0x18c>;
+			reg = <0 0x088eb000 0 0x1000>;
 			status = "disabled";
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
 
 			clocks = <&gcc GCC_USB3_SEC_PHY_AUX_CLK>,
 				 <&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
 				 <&gcc GCC_USB3_SEC_CLKREF_CLK>,
-				 <&gcc GCC_USB3_SEC_PHY_COM_AUX_CLK>;
-			clock-names = "aux", "cfg_ahb", "ref", "com_aux";
+				 <&gcc GCC_USB3_SEC_PHY_COM_AUX_CLK>,
+				 <&gcc GCC_USB3_SEC_PHY_PIPE_CLK>;
+			clock-names = "aux",
+				      "cfg_ahb",
+				      "ref",
+				      "com_aux",
+				      "pipe";
+			clock-output-names = "usb3_uni_phy_pipe_clk_src";
+			#clock-cells = <0>;
+			#phy-cells = <0>;
 
 			resets = <&gcc GCC_USB3PHY_PHY_SEC_BCR>,
 				 <&gcc GCC_USB3_PHY_SEC_BCR>;
 			reset-names = "phy", "common";
-
-			usb_2_ssphy: phy@88eb200 {
-				reg = <0 0x088eb200 0 0x128>,
-				      <0 0x088eb400 0 0x1fc>,
-				      <0 0x088eb800 0 0x218>,
-				      <0 0x088eb600 0 0x70>;
-				#clock-cells = <0>;
-				#phy-cells = <0>;
-				clocks = <&gcc GCC_USB3_SEC_PHY_PIPE_CLK>;
-				clock-names = "pipe0";
-				clock-output-names = "usb3_uni_phy_pipe_clk_src";
-			};
 		};
 
 		usb_1: usb@a6f8800 {
@@ -4082,7 +4075,7 @@ usb_2_dwc3: usb@a800000 {
 				iommus = <&apps_smmu 0x760 0>;
 				snps,dis_u2_susphy_quirk;
 				snps,dis_enblslpm_quirk;
-				phys = <&usb_2_hsphy>, <&usb_2_ssphy>;
+				phys = <&usb_2_hsphy>, <&usb_2_qmpphy>;
 				phy-names = "usb2-phy", "usb3-phy";
 			};
 		};
-- 
2.30.2

