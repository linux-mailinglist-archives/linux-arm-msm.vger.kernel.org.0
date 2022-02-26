Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B25244C582D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Feb 2022 21:57:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229634AbiBZUvP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Feb 2022 15:51:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229635AbiBZUvP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Feb 2022 15:51:15 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5116C263429
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Feb 2022 12:50:39 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id j7so15093412lfu.6
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Feb 2022 12:50:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DIUQ9vZwSQIRd11hX6G1x3Kd7/D01rfTeUvmmz3aaR8=;
        b=OcyM7LyeuxRQNM+OxiZYaQnRSLtXmrOK+39/Uni9b/iG2DkqptuAQhXAm1u5Xi60Q3
         Piqf7xln1CpN4fE8n/UlWfgKZG+X8E5KL/vCj2qot431uI2zOWoGmMSwwtoJqkw3udBE
         de0cGWTE6P1hQm5wSiJH4wBAeNlzvfDyUa74N31IoKcpKtmLLPvyrUVkGkBMyS9BuC54
         7k6owc2ELvhnMy0CdjzFK5y7p+US9xnZgA6W3zHl1aViCcmR4Ag0dAaHljQtCvFthwF2
         gv+/HC/7woEThn6DYaDlThcVz7Fcg/5oPvFTlG35Dmsv5XURds6AU9JVKLyGKExOt8xE
         KWQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DIUQ9vZwSQIRd11hX6G1x3Kd7/D01rfTeUvmmz3aaR8=;
        b=LfUZ7yHisnaZV0FJ9zP3fBT+pmOEqAl2YCvM2DaK+XgdMDXG4VU2OQriMwMVNobvMn
         vZ+l37pFHtImMY8q0WwubmPoLLCqe1TK9Md4unURv3zleQhTa58cQEzU+d4r8zFw32J3
         dVz8Wyrw0yXMag0eaJyK1BVKdsa5+081k3/I40AZiff1AnRT3cbgDtM0lG2rCNs1Ufmu
         nvFtVXsTyR1l61ESF6MpsN462YA+yR6N49VA1bwbRk5xmmQGI05ztTH/QQZPa11K1TkT
         ny3vWFjePtDXzs9wUs2n+ZcIQopsifyhylBg7l0mjnE0GfWjLfYi/rM78LqdTlbsIuke
         lkUQ==
X-Gm-Message-State: AOAM530GBv5TW7NlMwf9WTQpmAqIyEysMuGMYMyYu+adQ3eSMPLyZ651
        6Z9Sh48/2lRkz8BUdBMRflvANMwkOqZktw==
X-Google-Smtp-Source: ABdhPJxyNlE7jxVx5CVZDvNcySLSJQmOp556tLd/mbhLGraFuz4+74FEOLrIS/DOdJeFwumj0qHNsg==
X-Received: by 2002:a05:6512:c09:b0:442:d4fa:9bce with SMTP id z9-20020a0565120c0900b00442d4fa9bcemr8773459lfu.483.1645908638110;
        Sat, 26 Feb 2022 12:50:38 -0800 (PST)
Received: from umbar.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id m27-20020ac24adb000000b004433bbaa3fdsm527162lfp.174.2022.02.26.12.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Feb 2022 12:50:37 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 2/7] arm64: dts: qcom: pm8350b: add temp sensor and thermal zone config
Date:   Sat, 26 Feb 2022 23:50:30 +0300
Message-Id: <20220226205035.1826360-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220226205035.1826360-1-dmitry.baryshkov@linaro.org>
References: <20220226205035.1826360-1-dmitry.baryshkov@linaro.org>
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

Add temp-alarm device tree node and a default configuration for the
corresponding thermal zone for this PMIC. Temperatures are based on
downstream values.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/pm8350b.dtsi | 31 +++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm8350b.dtsi b/arch/arm64/boot/dts/qcom/pm8350b.dtsi
index b23bb1d49a4d..f1d1d4c8edf8 100644
--- a/arch/arm64/boot/dts/qcom/pm8350b.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8350b.dtsi
@@ -6,6 +6,30 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/spmi/spmi.h>
 
+/ {
+	thermal-zones {
+		pm8350b_thermal: pm8350c-thermal {
+			polling-delay-passive = <100>;
+			polling-delay = <0>;
+			thermal-sensors = <&pm8350b_temp_alarm>;
+
+			trips {
+				pm8350b_trip0: trip0 {
+					temperature = <95000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				pm8350b_crit: pm8350c-crit {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+	};
+};
+
 &spmi_bus {
 	pm8350b: pmic@3 {
 		compatible = "qcom,pm8350b", "qcom,spmi-pmic";
@@ -13,6 +37,13 @@ pm8350b: pmic@3 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		pm8350b_temp_alarm: temp-alarm@a00 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0xa00>;
+			interrupts = <0x3 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
 		pm8350b_gpios: gpio@8800 {
 			compatible = "qcom,pm8350b-gpio";
 			reg = <0x8800>;
-- 
2.30.2

