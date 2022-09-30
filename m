Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A18205F11FA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Sep 2022 20:53:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231514AbiI3SxB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Sep 2022 14:53:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232465AbiI3Swy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Sep 2022 14:52:54 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A81E116DDC1
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 11:52:52 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id d42so8254247lfv.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 11:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=kMnpWjv3xH0AQ6EcHb4BKirJyZECpvu2Ouogae6Oqyc=;
        b=vaop6mzyZ9jbIm5PXmDquP3+6Js7z36FeqxugpcwPtKQzwsg8dqBayK6+VSnWWGX0I
         fS75sMSWLR6Ru+d8cxBVBPj5yFSCrjtnyRfwwxQp+46H0xxjaPbBgn5qbbz8rIjOqRQU
         ghUiz99fdAQNkTRghXK/fQGeK1c5F0QvNSWbGzXMxPiEjRm+mdwN3Yy+abS2XEbFxfWR
         yOpuuC4YNjUQhS1jLw9y23wDMhaubbLUwUc7Pr/0eWb04rkgbENWVppEAvLmCqlwWuE2
         RDMszuPmJH6ZFUJOjjXV8pCeEXXo7gt8C866VpAuV2cjG4Hf7yy/TdTLBDnUcHcqj+I2
         81kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=kMnpWjv3xH0AQ6EcHb4BKirJyZECpvu2Ouogae6Oqyc=;
        b=w34nY0XL5LJeDZptzTjYCv2Xfr6aXDe+AdvjGN8VScg8a/n3HgoME5THoybzZkqljn
         YjEfVKnDMSg38MphVS+IXwO+33V001R/lc+tt5zQX2tzN7J4LjkucczvIw98EMrVzoHJ
         pnWwmvs0N/pWQJJIjsdaGa3VW1lorAU3t9VswqF1JOWVVf6GOPVcO3PiHuyUMCcsLB+a
         HAuu63eN3MSDYd6rHs65LAnfkSrzrLrpdX9GU+Pog1W3eokr69bNsIGOFYFbcvZrrHZ6
         ycQoN8Sns00zmBfyKl3f0KsFCordr5EQIojH9lTGO8Ttljx0UKVFR6eKNicxJbv3xVTa
         Se4Q==
X-Gm-Message-State: ACrzQf28ad4aJuFYye80SzXxqV4ylxBYWk7FnuugASnGS6xrMchOCnGx
        LrnLYPZ9SBio8tz7KbVQZ/629g==
X-Google-Smtp-Source: AMsMyM5s+0AKHiX+0AqOpfmeGoayfc7pP4zIaxJtfsn0IXb74p6mKCYZbiu/XfMsbANJ+jqvIZqxPA==
X-Received: by 2002:a05:6512:15a0:b0:49b:1eba:89d4 with SMTP id bp32-20020a05651215a000b0049b1eba89d4mr3467679lfb.188.1664563972018;
        Fri, 30 Sep 2022 11:52:52 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id i8-20020a056512006800b00492cfecf1c0sm374703lfo.245.2022.09.30.11.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 11:52:51 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 20/23] ARM: dts: qcom: msm8660: move pm8058 LED devices to the main DT file
Date:   Fri, 30 Sep 2022 21:52:33 +0300
Message-Id: <20220930185236.867655-21-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220930185236.867655-1-dmitry.baryshkov@linaro.org>
References: <20220930185236.867655-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Declare PM8058 LED devices in the main msm8660 DT file to allow them to
be used by other devices.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../arm/boot/dts/qcom-apq8060-dragonboard.dts | 12 +++------
 arch/arm/boot/dts/qcom-msm8660.dtsi           | 26 ++++++++++++++++++-
 2 files changed, 29 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-apq8060-dragonboard.dts b/arch/arm/boot/dts/qcom-apq8060-dragonboard.dts
index 573e4dc66bb0..dd409ff31e21 100644
--- a/arch/arm/boot/dts/qcom-apq8060-dragonboard.dts
+++ b/arch/arm/boot/dts/qcom-apq8060-dragonboard.dts
@@ -436,39 +436,35 @@ led@48 {
 					 * ambient light and proximity sensor
 					 * Capella Microsystems CM3605.
 					 */
-					compatible = "qcom,pm8058-keypad-led";
-					reg = <0x48>;
 					label = "pm8058:infrared:proximitysensor";
 					default-state = "off";
 					linux,default-trigger = "cm3605";
+					status = "okay";
 				};
 				led@131 {
-					compatible = "qcom,pm8058-led";
-					reg = <0x131>;
 					label = "pm8058:red";
 					color = <LED_COLOR_ID_RED>;
 					default-state = "off";
+					status = "okay";
 				};
 				led@132 {
 					/*
 					 * This is actually green too on my
 					 * board, but documented as yellow.
 					 */
-					compatible = "qcom,pm8058-led";
-					reg = <0x132>;
 					label = "pm8058:yellow";
 					color = <LED_COLOR_ID_YELLOW>;
 					default-state = "off";
 					linux,default-trigger = "mmc0";
+					status = "okay";
 				};
 				led@133 {
-					compatible = "qcom,pm8058-led";
-					reg = <0x133>;
 					label = "pm8058:green";
 					function = LED_FUNCTION_HEARTBEAT;
 					color = <LED_COLOR_ID_GREEN>;
 					default-state = "on";
 					linux,default-trigger = "heartbeat";
+					status = "okay";
 				};
 			};
 		};
diff --git a/arch/arm/boot/dts/qcom-msm8660.dtsi b/arch/arm/boot/dts/qcom-msm8660.dtsi
index ddce7d64ba99..35e90d188e05 100644
--- a/arch/arm/boot/dts/qcom-msm8660.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8660.dtsi
@@ -359,6 +359,12 @@ pm8058_gpio: gpio@150 {
 
 				};
 
+				pm8058_led48: led@48 {
+					compatible = "qcom,pm8058-keypad-led";
+					reg = <0x48>;
+					status = "disabled";
+				};
+
 				pm8058_mpps: mpps@50 {
 					compatible = "qcom,pm8058-mpp",
 						     "qcom,ssbi-mpp";
@@ -379,7 +385,25 @@ pwrkey@1c {
 					pull-up;
 				};
 
-				keypad@148 {
+				pm8058_led131: led@131 {
+					compatible = "qcom,pm8058-led";
+					reg = <0x131>;
+					status = "disabled";
+				};
+
+				pm8058_led132: led@132 {
+					compatible = "qcom,pm8058-led";
+					reg = <0x132>;
+					status = "disabled";
+				};
+
+				pm8058_led133: led@133 {
+					compatible = "qcom,pm8058-led";
+					reg = <0x133>;
+					status = "disabled";
+				};
+
+				pm8058_keypad: keypad@148 {
 					compatible = "qcom,pm8058-keypad";
 					reg = <0x148>;
 					interrupt-parent = <&pm8058>;
-- 
2.35.1

