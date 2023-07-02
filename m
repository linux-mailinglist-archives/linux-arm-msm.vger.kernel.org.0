Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FBCF744DE2
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jul 2023 15:43:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230017AbjGBNnj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 2 Jul 2023 09:43:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229758AbjGBNni (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 2 Jul 2023 09:43:38 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4CF910C1
        for <linux-arm-msm@vger.kernel.org>; Sun,  2 Jul 2023 06:43:34 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4fb73ba3b5dso5564893e87.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Jul 2023 06:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688305413; x=1690897413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UW1BeXnsj8l9AeP5Db+RRqvuFucuzqoNlT2iWDmh6Z0=;
        b=SyPTBtBTtKggNTTUZieK5jER74YxyPodDb/YMlLpt6kl9KqqQ7B9cXABTkRGOT/LOf
         944X1VY6gP1f0bJGd7mJ38wSQv9wwanhOrIugB6cRpvkEfYpe9TnX/HoBq9pODCelinP
         9K3uYVBcQBwT3TFW6nZa99UtqLeJpOhGyEfTFfyI/ufFjkzBiix84w8ax1Rs7SPMUQfV
         ou5Vlwvfj84jKEBuddJnYBx8++iKWiRsUJUge9ZfEzACheJ/+TC6eoDPR10qOQEwxChj
         d6hQ1oRM5b9EQ6KQjxUKEhnG7w/8vPdd1gFY5SXpPEdiXoY4Sc0DZ3KkDsgXZdQ0PKAK
         aITA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688305413; x=1690897413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UW1BeXnsj8l9AeP5Db+RRqvuFucuzqoNlT2iWDmh6Z0=;
        b=hVB+JOdyf2rgV/kbJUbSi1gMg2cwuCM635Nl1ilokwVcW4/w4+TIqh5oa0ovFBhDrv
         E8eDMuvX/cCCtZYG+h+tobYPXTuqCOBR/MXspuy8mgEF4SMiizmpdJ/uT3Ve4nS/THDp
         xeQGr098hIzghO3D1vUCmMSV8AaZsr9DG5kSs2veeF7NH0Q84L+rxtdiqU/AWaYiF74y
         BI8y0vbAKnLgRv5B20gK2zPVucyCrioCIBWjgTX1KSjcFZP4MjexrPlFyzAl/rjLazW1
         57+BVV6Qoz6fsYF2Wt607RFUWZTZD6MXF1d5A43Weew/hu1NnX7yZHPFt7HPE1WBb70M
         w+ew==
X-Gm-Message-State: ABy/qLaplrOiEVFp4uU3EHAw4lL71y8W+5wVDIn+h0hD0jZJTSb5m6bv
        ZIs/6ppZ9FTP+3mGKVhWPw4yXA==
X-Google-Smtp-Source: APBJJlHe3+FLkah8357K96/hn/SD46f78uqxflqke3rVj3VPfvBctd2g04KvOp0Q1NAj0Fjfac9pQg==
X-Received: by 2002:ac2:58e6:0:b0:4f8:4719:1f4a with SMTP id v6-20020ac258e6000000b004f847191f4amr4735360lfo.7.1688305413055;
        Sun, 02 Jul 2023 06:43:33 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d9-20020a2e96c9000000b002b6988ca476sm4310650ljj.101.2023.07.02.06.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jul 2023 06:43:32 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 15/27] ARM: dts: qcom: pm8058: reorder nodes
Date:   Sun,  2 Jul 2023 16:43:08 +0300
Message-Id: <20230702134320.98831-16-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230702134320.98831-1-dmitry.baryshkov@linaro.org>
References: <20230702134320.98831-1-dmitry.baryshkov@linaro.org>
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

Move pm8058 device nodes to follow the alphanumberic sorting order.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/pm8058.dtsi | 90 +++++++++++++++---------------
 1 file changed, 45 insertions(+), 45 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/pm8058.dtsi b/arch/arm/boot/dts/qcom/pm8058.dtsi
index ad581c3bcbd2..913a511719fa 100644
--- a/arch/arm/boot/dts/qcom/pm8058.dtsi
+++ b/arch/arm/boot/dts/qcom/pm8058.dtsi
@@ -8,15 +8,24 @@ pm8058: pmic {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		pm8058_gpio: gpio@150 {
-			compatible = "qcom,pm8058-gpio",
-				     "qcom,ssbi-gpio";
-			reg = <0x150>;
-			interrupt-controller;
-			#interrupt-cells = <2>;
-			gpio-controller;
-			gpio-ranges = <&pm8058_gpio 0 0 44>;
-			#gpio-cells = <2>;
+		pwrkey@1c {
+			compatible = "qcom,pm8058-pwrkey";
+			reg = <0x1c>;
+			interrupt-parent = <&pm8058>;
+			interrupts = <50 1>, <51 1>;
+			debounce = <15625>;
+			pull-up;
+		};
+
+		pm8058_led48: led@48 {
+			compatible = "qcom,pm8058-keypad-led";
+			reg = <0x48>;
+			status = "disabled";
+		};
+
+		vibrator@4a {
+			compatible = "qcom,pm8058-vib";
+			reg = <0x4a>;
 		};
 
 		pm8058_mpps: mpps@50 {
@@ -30,13 +39,22 @@ pm8058_mpps: mpps@50 {
 			#interrupt-cells = <2>;
 		};
 
-		pwrkey@1c {
-			compatible = "qcom,pm8058-pwrkey";
-			reg = <0x1c>;
-			interrupt-parent = <&pm8058>;
-			interrupts = <50 1>, <51 1>;
-			debounce = <15625>;
-			pull-up;
+		pm8058_led131: led@131 {
+			compatible = "qcom,pm8058-led";
+			reg = <0x131>;
+			status = "disabled";
+		};
+
+		pm8058_led132: led@132 {
+			compatible = "qcom,pm8058-led";
+			reg = <0x132>;
+			status = "disabled";
+		};
+
+		pm8058_led133: led@133 {
+			compatible = "qcom,pm8058-led";
+			reg = <0x133>;
+			status = "disabled";
 		};
 
 		pm8058_keypad: keypad@148 {
@@ -49,6 +67,17 @@ pm8058_keypad: keypad@148 {
 			row-hold = <91500>;
 		};
 
+		pm8058_gpio: gpio@150 {
+			compatible = "qcom,pm8058-gpio",
+				     "qcom,ssbi-gpio";
+			reg = <0x150>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			gpio-controller;
+			gpio-ranges = <&pm8058_gpio 0 0 44>;
+			#gpio-cells = <2>;
+		};
+
 		pm8058_xoadc: xoadc@197 {
 			compatible = "qcom,pm8058-adc";
 			reg = <0x197>;
@@ -109,35 +138,6 @@ rtc@1e8 {
 			interrupts = <39 1>;
 			allow-set-time;
 		};
-
-		vibrator@4a {
-			compatible = "qcom,pm8058-vib";
-			reg = <0x4a>;
-		};
-
-		pm8058_led48: led@48 {
-			compatible = "qcom,pm8058-keypad-led";
-			reg = <0x48>;
-			status = "disabled";
-		};
-
-		pm8058_led131: led@131 {
-			compatible = "qcom,pm8058-led";
-			reg = <0x131>;
-			status = "disabled";
-		};
-
-		pm8058_led132: led@132 {
-			compatible = "qcom,pm8058-led";
-			reg = <0x132>;
-			status = "disabled";
-		};
-
-		pm8058_led133: led@133 {
-			compatible = "qcom,pm8058-led";
-			reg = <0x133>;
-			status = "disabled";
-		};
 	};
 };
 
-- 
2.39.2

