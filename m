Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B65085271A3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 May 2022 16:11:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232942AbiENOKv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 14 May 2022 10:10:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232956AbiENOKt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 14 May 2022 10:10:49 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AB38140C1
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 May 2022 07:10:48 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id bu29so19031264lfb.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 May 2022 07:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GI298Kg9rc4h34nf3DAQdxeYL6loj33xP/T6q0BntqI=;
        b=liUhwWaOI+8GpSiMpcnF4elqYgD3fClPppVOUI0yqkJbxepo1vAKumyBmwi/rIF8+3
         5wY+f/xXyovKOzst6Yk1keLP7CndK/v3xpIUUOXnDyRGxOQTn3NrJLp6oYcbO2jgOYsr
         0SoI34hyyjnIInD9OWEhAlM/5IVLONRaDwZra4+xcb6l73kYKTwNHHnQGV3vWTJxjP1/
         ybNU8KEevi+WC+fvffXwbYwi6q87KKs/371JygH+L4Ux7WYlcyZtbKmSx6gk5Wv9e9jC
         4cNBuGvygwTmyv6xySi2J5q1uUDMj0/y+H1tNyYDqKxRcSnF2EVWEIMQzZ9hl4Vrq25h
         2miA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GI298Kg9rc4h34nf3DAQdxeYL6loj33xP/T6q0BntqI=;
        b=rH0Roe4866Cy734nBNa5yPIkgBgE7/AB1dzzpUwdrkHAB112yiofYuEfGKgv4rBplZ
         aiMuJAb6016E30B33zzN8J2vMB/16ObgmVk7MiL24HIHnKwemhXQbEadIRFLbATVglWZ
         0qZncqhLJG8EDvnTdNc5qhMaCyFP7cIeo/Jv8vwbD1vZPIMOmApPwwIyfAWdy+mZuq/H
         DW55gHqgThLc/HlCi3RBMV/yMP6znWvKEbpqTtokBpoz0iI2iiMHFuwYVE3bmQ4YIAOZ
         O5TdaOUFUevtNNVa80KUCsRvPRLqamGZBs6ry0DEIWDu/Hd5D6xPnHo5v0XGhAvjkUht
         7HiA==
X-Gm-Message-State: AOAM530382dfOadFKNU4rJwHdD/EWMeIIr4J1DgGtHmMrNrHJEC3Aj7R
        cjSI9EU6vSp37/x897bNEgYoag==
X-Google-Smtp-Source: ABdhPJzsl1YH8jYVIh2DSLs9a1OJoWcrwsk3ak1Iqj7QIitfzp79NqHlkyy8PYIOVx0Q9cquYQ5A8w==
X-Received: by 2002:a19:fc0e:0:b0:471:ff7d:ab35 with SMTP id a14-20020a19fc0e000000b00471ff7dab35mr6899089lfi.345.1652537446703;
        Sat, 14 May 2022 07:10:46 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id x9-20020a05651c104900b0024f3d1daedasm845912ljm.98.2022.05.14.07.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 May 2022 07:10:46 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v4 05/12] arm64: dts: qcom: sdm630: rename qusb2phy to qusb2phy0
Date:   Sat, 14 May 2022 17:10:34 +0300
Message-Id: <20220514141041.3158521-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220514141041.3158521-1-dmitry.baryshkov@linaro.org>
References: <20220514141041.3158521-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In preparation to adding second USB host/PHY pair, change first USB
PHY's label to qusb2phy0.

Suggested-by: Marijn Suijten <marijn.suijten@somainline.org>
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
index 5be0ec06ed86..eb8504e5735c 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -1250,13 +1250,13 @@ usb3_dwc3: usb@a800000 {
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

