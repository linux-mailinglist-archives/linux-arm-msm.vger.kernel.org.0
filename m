Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD10E6C75BE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Mar 2023 03:26:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231137AbjCXC0A (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Mar 2023 22:26:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231442AbjCXCZ7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Mar 2023 22:25:59 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CB332A999
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 19:25:58 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id t11so429202lfr.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 19:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679624756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5u+3+jogp8cfdDK08qvAQaulGryrDrWJaLCRSvsn4wM=;
        b=RJ7/b5p4tHfta4wI9C9bHoGr7Wweyzf962AJtHsqxJ69rVeBpGmvQZ4Rqy5LtnoF6O
         SGlqU+psCmffmpKrePLTbgrHWrUHkuh+BspZm7uDiyl1HhCCWQpnogL7XIx+Uq9HEKzr
         xutz++iY3imfMbUrMMDh3Ug1iDRRuSkK/cYvGkeA+82rViw8mQRa288abU2ellyq7Ol7
         gF8LP1aa4Wmm8zy7HLJ3GalOAibSASQe0mlubZ7SJgTu+Cey3qd2UKQnqO9uTcxiChUp
         H6ftRBiND2yyjZaLIXMxLGojsLEOB3es1aB0eu62pyZzQ2wMpjCDh1dcPZIFax7ohPZ3
         snRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679624756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5u+3+jogp8cfdDK08qvAQaulGryrDrWJaLCRSvsn4wM=;
        b=75DbpyU1YM8Pk/jVQ2NUXju+jsl+TSkmpCszn7Zg+alix9NeWFdb6o5UurMokHv4VJ
         z15X274nHSvYI6wpuVJHjw+LGLKQl4R9A2Uvrz+ccDiRmZirbpjYaHLpYj9uoQSUNX5P
         HpFz0SvDxNuyOaUratoCpCb9QX/0TsVCRRL14ZiyKHWm3ZjVlxK+6Kcvqb8n7/62m5Cf
         DS3fVLFxBrJH4IgEo2tqwcy0rmqCJdrLc8J3lkgtWXxVafqc8dQsBdMjy/TSdN+onnBW
         Fgj8ys0naTEBwygxS9b1R7cgP9SsSJeLsJhEQ3jG8GhA2f6+LTDki3OjEy12gUyemklB
         tA5g==
X-Gm-Message-State: AAQBX9dLFZJOu0aRGpTuC4wWqzFS8nP+je+qK+h4Da+wSFM2BuF5coHc
        EFBpx02waZ7U7cJKNDyV8fk6gQ==
X-Google-Smtp-Source: AKy350btoWzM1rQEWztGklnPwYnk8mmWOKpgvxuJnV4qh9aIyKz+OzbwLmAdguBSh1cxSICTCKM3sA==
X-Received: by 2002:ac2:52b8:0:b0:4dd:ad88:ba5c with SMTP id r24-20020ac252b8000000b004ddad88ba5cmr221155lfm.4.1679624756438;
        Thu, 23 Mar 2023 19:25:56 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id x4-20020a19f604000000b004db3aa3c542sm3162628lfe.47.2023.03.23.19.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 19:25:55 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 40/41] ARM: dts: qcom-sdx65: switch USB QMP PHY to new style of bindings
Date:   Fri, 24 Mar 2023 05:25:13 +0300
Message-Id: <20230324022514.1800382-41-dmitry.baryshkov@linaro.org>
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
 arch/arm/boot/dts/qcom-sdx65.dtsi | 29 +++++++++++------------------
 1 file changed, 11 insertions(+), 18 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-sdx65.dtsi b/arch/arm/boot/dts/qcom-sdx65.dtsi
index 192f9f94bc8b..87354317b9df 100644
--- a/arch/arm/boot/dts/qcom-sdx65.dtsi
+++ b/arch/arm/boot/dts/qcom-sdx65.dtsi
@@ -231,31 +231,24 @@ usb_hsphy: phy@ff4000 {
 
 		usb_qmpphy: phy@ff6000 {
 			compatible = "qcom,sdx65-qmp-usb3-uni-phy";
-			reg = <0x00ff6000 0x1c8>;
+			reg = <0x00ff6000 0x2000>;
 			status = "disabled";
-			#address-cells = <1>;
-			#size-cells = <1>;
-			ranges;
 
 			clocks = <&gcc GCC_USB3_PHY_AUX_CLK>,
 				 <&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
-				 <&gcc GCC_USB3_PRIM_CLKREF_EN>;
-			clock-names = "aux", "cfg_ahb", "ref";
+				 <&gcc GCC_USB3_PRIM_CLKREF_EN>,
+				 <&gcc GCC_USB3_PHY_PIPE_CLK>;
+			clock-names = "aux",
+				      "cfg_ahb",
+				      "ref",
+				      "pipe";
+			clock-output-names = "usb3_uni_phy_pipe_clk_src";
+			#clock-cells = <0>;
+			#phy-cells = <0>;
 
 			resets = <&gcc GCC_USB3PHY_PHY_BCR>,
 				 <&gcc GCC_USB3_PHY_BCR>;
 			reset-names = "phy", "common";
-
-			usb_ssphy: phy@ff6200 {
-				reg = <0x00ff6e00 0x160>,
-				      <0x00ff7000 0x1ec>,
-				      <0x00ff6200 0x1e00>;
-				#phy-cells = <0>;
-				#clock-cells = <0>;
-				clocks = <&gcc GCC_USB3_PHY_PIPE_CLK>;
-				clock-names = "pipe0";
-				clock-output-names = "usb3_uni_phy_pipe_clk_src";
-			};
 		};
 
 		system_noc: interconnect@1620000 {
@@ -392,7 +385,7 @@ usb_dwc3: usb@a600000 {
 				iommus = <&apps_smmu 0x1a0 0x0>;
 				snps,dis_u2_susphy_quirk;
 				snps,dis_enblslpm_quirk;
-				phys = <&usb_hsphy>, <&usb_ssphy>;
+				phys = <&usb_hsphy>, <&usb_qmpphy>;
 				phy-names = "usb2-phy", "usb3-phy";
 			};
 		};
-- 
2.30.2

