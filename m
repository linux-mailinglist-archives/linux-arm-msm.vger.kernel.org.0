Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BAE2B744DD2
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jul 2023 15:43:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229990AbjGBNnc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 2 Jul 2023 09:43:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229981AbjGBNnb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 2 Jul 2023 09:43:31 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A75CE55
        for <linux-arm-msm@vger.kernel.org>; Sun,  2 Jul 2023 06:43:28 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2b69f1570b2so58449401fa.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Jul 2023 06:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688305407; x=1690897407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ln6L/vHcWTV14oQdypcRlQSAyNKGvMJzR40sasCVs78=;
        b=IavMO9JO0JHSyzaFS8weEhseQdfmKG2P2ykAtnLToAnVHclithjD4uOBIUMopUiub4
         69+cz05HHvmhTFLhi/b2QiAf56Wt/27ZJyjeu6AJZciYwnMe9pWKzGQ/Gx1kMhaGE00r
         4UltAfn+JxVtmdjdo3ppEHPLPI0Dmu7vm4qcDFwzaEU8wnAlxc1Qlkr8r7JYD8s+eqqs
         hiQRCjhcxQC2cYjXmlm8Je8TrkI0klB8DZNr4Tkx6KthTWaqfI8yE5sA8kcX/2VmTIaW
         ctH+73AAfTHefsLLTAWuNic8X7GFgAoCvfneqm7lV3mczeVM644odFFg/hAE8g0jBRKb
         kUpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688305407; x=1690897407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ln6L/vHcWTV14oQdypcRlQSAyNKGvMJzR40sasCVs78=;
        b=X88LG/6sOi11+aPNom5L82VWRg6m8mgMrRe4jSATBMzXDEnbpmNpn8lVO3a3fapF90
         cC0EV7Ij/0Fv/r4L4xUadUIqS1HjGI1Ad+aJZEyhg9dL+tN+syXv0UaPnTwn32SRM3I6
         7aHYeaurY7/g4zjW6A4rdKFvaR9O3xHT31qszDJ7NvyPAwEHgVFCuKwhQtNjxgg7KDoV
         DWBfpyuhM58+H/cn/dC0rd2MOqPqksB2lktsbGyY2i2BQnwmp+SBBZkqfs21Pt84eREN
         QOdrMBV+2NupcWdSWhw0eOiLU3pP6wFZwMmcKbIS6+5XmO4q4WXK/vc2CL9tTQprkSqC
         gFTg==
X-Gm-Message-State: ABy/qLa/3dKXwhetFja/fa+mNuDPbE66PI75icw/F2dfsKasoo49M6VO
        gEVRQJLmjQwBKanF1KAE8BdacQ==
X-Google-Smtp-Source: APBJJlG2tvgx/dL36Cib1ByWTuYkw+bbkktmEjvh5eg9EeOOzpkqUlqwPq4dgEmsgiLmt912dD0vMw==
X-Received: by 2002:a2e:94d7:0:b0:2b6:dd78:2a8e with SMTP id r23-20020a2e94d7000000b002b6dd782a8emr2046031ljh.50.1688305407002;
        Sun, 02 Jul 2023 06:43:27 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d9-20020a2e96c9000000b002b6988ca476sm4310650ljj.101.2023.07.02.06.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jul 2023 06:43:26 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 07/27] ARM: dts: qcom: apq8064: fix PMIC node labels
Date:   Sun,  2 Jul 2023 16:43:00 +0300
Message-Id: <20230702134320.98831-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230702134320.98831-1-dmitry.baryshkov@linaro.org>
References: <20230702134320.98831-1-dmitry.baryshkov@linaro.org>
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

Change PM8921 node labels to start with pm8921_ prefix, following other
Qualcomm PMIC device nodes.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
index 4f4393e11580..5ffb960d09b4 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
@@ -332,13 +332,13 @@ scm {
 	 */
 	iio-hwmon {
 		compatible = "iio-hwmon";
-		io-channels = <&xoadc 0x00 0x01>, /* Battery */
-			    <&xoadc 0x00 0x02>, /* DC in (charger) */
-			    <&xoadc 0x00 0x04>, /* VPH the main system voltage */
-			    <&xoadc 0x00 0x0b>, /* Die temperature */
-			    <&xoadc 0x00 0x0c>, /* Reference voltage 1.25V */
-			    <&xoadc 0x00 0x0d>, /* Reference voltage 0.625V */
-			    <&xoadc 0x00 0x0e>; /* Charger temperature */
+		io-channels = <&pm8921_xoadc 0x00 0x01>, /* Battery */
+			      <&pm8921_xoadc 0x00 0x02>, /* DC in (charger) */
+			      <&pm8921_xoadc 0x00 0x04>, /* VPH the main system voltage */
+			      <&pm8921_xoadc 0x00 0x0b>, /* Die temperature */
+			      <&pm8921_xoadc 0x00 0x0c>, /* Reference voltage 1.25V */
+			      <&pm8921_xoadc 0x00 0x0d>, /* Reference voltage 0.625V */
+			      <&pm8921_xoadc 0x00 0x0e>; /* Charger temperature */
 	};
 
 	soc: soc {
@@ -714,7 +714,7 @@ ssbi@500000 {
 			reg = <0x00500000 0x1000>;
 			qcom,controller-type = "pmic-arbiter";
 
-			pmicintc: pmic {
+			pm8921: pmic {
 				compatible = "qcom,pm8921";
 				interrupt-parent = <&tlmm_pinmux>;
 				interrupts = <74 8>;
@@ -749,7 +749,7 @@ pm8921_mpps: mpps@50 {
 
 				rtc@11d {
 					compatible = "qcom,pm8921-rtc";
-					interrupt-parent = <&pmicintc>;
+					interrupt-parent = <&pm8921>;
 					interrupts = <39 1>;
 					reg = <0x11d>;
 					allow-set-time;
@@ -758,16 +758,16 @@ rtc@11d {
 				pwrkey@1c {
 					compatible = "qcom,pm8921-pwrkey";
 					reg = <0x1c>;
-					interrupt-parent = <&pmicintc>;
+					interrupt-parent = <&pm8921>;
 					interrupts = <50 1>, <51 1>;
 					debounce = <15625>;
 					pull-up;
 				};
 
-				xoadc: xoadc@197 {
+				pm8921_xoadc: xoadc@197 {
 					compatible = "qcom,pm8921-adc";
 					reg = <0x197>;
-					interrupts-extended = <&pmicintc 78 IRQ_TYPE_EDGE_RISING>;
+					interrupts-extended = <&pm8921 78 IRQ_TYPE_EDGE_RISING>;
 					#address-cells = <2>;
 					#size-cells = <0>;
 					#io-channel-cells = <2>;
-- 
2.39.2

