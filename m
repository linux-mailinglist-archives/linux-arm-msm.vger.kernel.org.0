Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A2D252FF52
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 May 2022 22:27:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234929AbiEUU1W (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 21 May 2022 16:27:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237489AbiEUU1V (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 21 May 2022 16:27:21 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E70D059B8D
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 May 2022 13:27:18 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id br17so7236746lfb.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 May 2022 13:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wHh/OK6F8ppvDlOApSui2+PGOEdpoNPk06GZ+VH3tvM=;
        b=dhmx1hAJORYj3lgvpAbcLLLLDPSMxJBH4QPVAHYQDXDea/KptWMIoG4D/WkKwdBsvY
         ttUz73eWjBh/rpJPYL7dG3zGHXAXfugjS/OyK6C/qBk+IPOfF+hOMWsh5hWkyMczh4V/
         4dKig+trpS0r42jsbMWkL3/Z3+FjLUndemp9g6SitkpcKxADDT1A0FkMr3I9swGBbTGZ
         LGhVXdXK4S/iaMwNR6gTUasEGViN1Enq+qKSliGPbwZfsLHhK7t/yZXiI9uOjBWCn7+D
         t+Vbb9Hri7Xf0mNPCfjEiau4ADoOr/esEgoM05yfhzFGnzHKnAbW2XDALXb4AXXwgMzT
         DbQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wHh/OK6F8ppvDlOApSui2+PGOEdpoNPk06GZ+VH3tvM=;
        b=m7jJDxWBIG+SKqtEKLAsm6TG4t7tqIq4J8odAaDv0DAdKneiThWT08v1vUgTOVGoKA
         u4IVSZCdqB7GIXZXmF7a4AIj5V3zo99dqtEc3PkxaL4pu/d0Ow4IkJ7aybqIgLxnu4dS
         wZZ5RcvrvCxId6G4qOkYk7/LeM2sY8AWttm488VcZz3+Y2BtHR+eEui5Z2UC5+jg3GmD
         +Mxd1vTIS3Bevj/jclttV0tLmr7H295n/ZnlbpS0qjAVm5UVMXS8DzVM79QSt6xM16W3
         xU3JnnUrbX6sEnXUuOs1XEB3uoZ+wTmy/BIhVl5Ja3f1DN8C1HFNiZGAQvBPmCqW0GHQ
         W6EA==
X-Gm-Message-State: AOAM530jB3M8LkYnM9m2TZ5cd6dJMIwNo41DnQKbNS4zcMQ3DFWBw0Gd
        vg7Buv5uRytRSAUgdL1RuMVALg==
X-Google-Smtp-Source: ABdhPJxQiEwdqFFLiP/cSbC+3SbhDCgpUIMK9Rv32eH1T5ts053ZAZYOPGo7hpdnLtjQh12ClCwJWA==
X-Received: by 2002:a05:6512:b1b:b0:44a:9ae9:b9bf with SMTP id w27-20020a0565120b1b00b0044a9ae9b9bfmr11120145lfu.365.1653164837213;
        Sat, 21 May 2022 13:27:17 -0700 (PDT)
Received: from eriador.lan ([2001:470:dd84:abc0::8a5])
        by smtp.gmail.com with ESMTPSA id x1-20020ac259c1000000b004786291114fsm317773lfn.140.2022.05.21.13.27.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 May 2022 13:27:16 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: [PATCH v7 05/11] arm64: dts: qcom: sdm630: rename qusb2phy to qusb2phy0
Date:   Sat, 21 May 2022 23:27:02 +0300
Message-Id: <20220521202708.1509308-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220521202708.1509308-1-dmitry.baryshkov@linaro.org>
References: <20220521202708.1509308-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In preparation to adding second USB host/PHY pair, change first USB
PHY's label to qusb2phy0.

Suggested-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/sdm630.dtsi                  | 4 ++--
 arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts   | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
index 42af1fade461..00baacf28c63 100644
--- a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
@@ -224,7 +224,7 @@ &pon_resin {
 	linux,code = <KEY_VOLUMEUP>;
 };
 
-&qusb2phy {
+&qusb2phy0 {
 	status = "okay";
 
 	vdd-supply = <&vreg_l1b_0p925>;
diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 0ffd8e382d8c..f4d09784ff29 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -1254,13 +1254,13 @@ usb3_dwc3: usb@a800000 {
 				 * haven't seen any devices making use of it.
 				 */
 				maximum-speed = "high-speed";
-				phys = <&qusb2phy>;
+				phys = <&qusb2phy0>;
 				phy-names = "usb2-phy";
 				snps,hird-threshold = /bits/ 8 <0>;
 			};
 		};
 
-		qusb2phy: phy@c012000 {
+		qusb2phy0: phy@c012000 {
 			compatible = "qcom,sdm660-qusb2-phy";
 			reg = <0x0c012000 0x180>;
 			#phy-cells = <0>;
diff --git a/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts b/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
index dcbaacf18f66..9280c1f0c334 100644
--- a/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
+++ b/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
@@ -103,7 +103,7 @@ &pon_resin {
 	linux,code = <KEY_VOLUMEDOWN>;
 };
 
-&qusb2phy {
+&qusb2phy0 {
 	status = "okay";
 
 	vdd-supply = <&vreg_l1b_0p925>;
-- 
2.35.1

