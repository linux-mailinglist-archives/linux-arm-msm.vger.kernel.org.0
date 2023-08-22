Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3102D7836ED
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Aug 2023 02:15:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231846AbjHVAOT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Aug 2023 20:14:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231829AbjHVAOL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Aug 2023 20:14:11 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5685CD5
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Aug 2023 17:14:01 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4ff8f2630e3so6142914e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Aug 2023 17:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692663240; x=1693268040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9TSiCQU8z8gMyHopnKHftqR+4tVxRcnW4JwBU1qA13I=;
        b=zB40YXN5uwrQl649pf84phkV3P66eysNju+PrIAnnWI3bqw9Sy7iu4czDx6NqoZO8U
         IyBPMpgUkPp+Ihg57MTzi0OV90rHIJx+sIU+SM86SeO78Y4rV0hTr3GAhGScL51Hgemz
         g2FK/cw9VUznFiW37htrIkpP38CkHFN+UhJh28SjE9OI0sF2esr62OZUeZ1sxQjx9dPC
         YnxpIg7qo+oRPI0RVFadfv9Z6uA2Ut+Lw1wnp3719umK3dFFKf8/OsLojFaY62RF55P1
         yamLQwjU3QSBzn8U6ICmS60z21zW1Pe0TlcO/3n3ZjGLkf1GYMxXqGgAXUyL2gJJV1sZ
         YDxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692663240; x=1693268040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9TSiCQU8z8gMyHopnKHftqR+4tVxRcnW4JwBU1qA13I=;
        b=X9LOeV1+8nvtbISWS9A60zeSfmcvR+COzH/hC6l5jqFyLBcsVtnx+FBOe+opwHTDV9
         7jMAvaHMtcB55l5m8V6sNXXB7tDs4ziP4Y3iuqMmro2PpZsA9eBS8waJ8hGaodK6PGZ2
         YvTPXj9FC4sDkYfTci5ZY9u05CbGA9iWQ9/tERGrHM0DHrDxxs2rxwYO4TLajpFuBo65
         qeFYQl9CecdCCzKo/8UqIg0VuhglM1MqVDFR0w1wa6cAvDJcAwuuIJLZpouyGQ0Utcuu
         tgQmnzWwdF0MYX0N0chCwSQ9b/SYGDAjWy1cUBlKu0xtefHL3MjMp56GR5a4BbZXgY6g
         njEQ==
X-Gm-Message-State: AOJu0YxfHgNuLNCGJ8FFV44vkEF/j2oucwKd3VZDlTV9vsYtVptUaKXF
        5BhciG1U4Oa/PJ0qoEMERQwOpQ==
X-Google-Smtp-Source: AGHT+IGCDurhfgGMWK3gQ+jgLNvjqB3VQsB3JdXpcL9G+xsYDfTwftcoiY3zPx5oGAo3cmxWxM7SBA==
X-Received: by 2002:a05:6512:b81:b0:4f8:6d53:a68f with SMTP id b1-20020a0565120b8100b004f86d53a68fmr6990296lfv.64.1692663240111;
        Mon, 21 Aug 2023 17:14:00 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id er23-20020a05651248d700b004fe36e673b8sm912024lfb.178.2023.08.21.17.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Aug 2023 17:13:59 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org
Subject: [PATCH v3 11/32] ARM: dts: qcom: mdm9615: fix PMIC node labels
Date:   Tue, 22 Aug 2023 03:13:28 +0300
Message-Id: <20230822001349.899298-12-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230822001349.899298-1-dmitry.baryshkov@linaro.org>
References: <20230822001349.899298-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Change PM8018 node labels to start with pm8018_ prefix, following other
Qualcomm PMIC device nodes.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-mdm9615-wp8548.dtsi |  2 +-
 arch/arm/boot/dts/qcom/qcom-mdm9615.dtsi        | 14 +++++++-------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-mdm9615-wp8548.dtsi b/arch/arm/boot/dts/qcom/qcom-mdm9615-wp8548.dtsi
index 92c8003dac25..dac3aa793f71 100644
--- a/arch/arm/boot/dts/qcom/qcom-mdm9615-wp8548.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-mdm9615-wp8548.dtsi
@@ -76,7 +76,7 @@ reset-out-pins {
 	};
 };
 
-&pmicgpio {
+&pm8018_gpio {
 	usb_vbus_5v_pins: usb-vbus-5v-state {
 		pins = "gpio4";
 		function = "normal";
diff --git a/arch/arm/boot/dts/qcom/qcom-mdm9615.dtsi b/arch/arm/boot/dts/qcom/qcom-mdm9615.dtsi
index fc4f52f9e9f7..c4cfbdbcdf14 100644
--- a/arch/arm/boot/dts/qcom/qcom-mdm9615.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-mdm9615.dtsi
@@ -263,7 +263,7 @@ qcom,ssbi@500000 {
 			reg = <0x500000 0x1000>;
 			qcom,controller-type = "pmic-arbiter";
 
-			pmicintc: pmic {
+			pm8018: pmic {
 				compatible = "qcom,pm8018", "qcom,pm8921";
 				interrupts = <GIC_PPI 226 IRQ_TYPE_LEVEL_HIGH>;
 				#interrupt-cells = <2>;
@@ -274,38 +274,38 @@ pmicintc: pmic {
 				pwrkey@1c {
 					compatible = "qcom,pm8018-pwrkey", "qcom,pm8921-pwrkey";
 					reg = <0x1c>;
-					interrupt-parent = <&pmicintc>;
+					interrupt-parent = <&pm8018>;
 					interrupts = <50 IRQ_TYPE_EDGE_RISING>,
 						     <51 IRQ_TYPE_EDGE_RISING>;
 					debounce = <15625>;
 					pull-up;
 				};
 
-				pmicmpp: mpps@50 {
+				pm8018_mpps: mpps@50 {
 					compatible = "qcom,pm8018-mpp", "qcom,ssbi-mpp";
 					interrupt-controller;
 					#interrupt-cells = <2>;
 					reg = <0x50>;
 					gpio-controller;
 					#gpio-cells = <2>;
-					gpio-ranges = <&pmicmpp 0 0 6>;
+					gpio-ranges = <&pm8018_mpps 0 0 6>;
 				};
 
 				rtc@11d {
 					compatible = "qcom,pm8018-rtc", "qcom,pm8921-rtc";
-					interrupt-parent = <&pmicintc>;
+					interrupt-parent = <&pm8018>;
 					interrupts = <39 IRQ_TYPE_EDGE_RISING>;
 					reg = <0x11d>;
 					allow-set-time;
 				};
 
-				pmicgpio: gpio@150 {
+				pm8018_gpio: gpio@150 {
 					compatible = "qcom,pm8018-gpio", "qcom,ssbi-gpio";
 					reg = <0x150>;
 					interrupt-controller;
 					#interrupt-cells = <2>;
 					gpio-controller;
-					gpio-ranges = <&pmicgpio 0 0 6>;
+					gpio-ranges = <&pm8018_gpio 0 0 6>;
 					#gpio-cells = <2>;
 				};
 			};
-- 
2.39.2

