Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 32F8A744F21
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jul 2023 19:44:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230142AbjGBRnh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 2 Jul 2023 13:43:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230141AbjGBRnK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 2 Jul 2023 13:43:10 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D45D0E5E
        for <linux-arm-msm@vger.kernel.org>; Sun,  2 Jul 2023 10:43:08 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2b6a662b9adso53815841fa.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Jul 2023 10:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688319787; x=1690911787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OZsRJjn/U6tZT4/5EPkI8glRuIiduAZK+U1re19Ckmc=;
        b=zo2DumS4TLYmSnM0EO/CSQQ5FvpnW5jnGmpWpedfh1I+zmpUZrznJ3282O4IWgPKqS
         H74sQ5HM5BuQifM3IXb8/6TH1mfAILfFlIBnXDyuBVeG5Uytwy12emLSxdtn794TWf9P
         SqNPRDAKP/B8DOoH8oep79NLwFi7JSaLI3jeLvV+Bsb0HzFvhMQDZ2LMmU0KrBRGdcoi
         rQXqjOY3OD7xPGe6h5RN/Y2Uw9i2xkpUkast1Au64kKF8IWerfNi1ZgGrNQvxDynmap5
         0atfGyovx8eq3cdb/Z00FMtyGpSb3Dy2KxyGlCdwNayMDgjDIIdm6YBEZRa/5isIN62J
         tVWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688319787; x=1690911787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OZsRJjn/U6tZT4/5EPkI8glRuIiduAZK+U1re19Ckmc=;
        b=Zn6xuGi7ReXRPD4G+rSZCPy/aJIE59y2A63leG8gxv/Gmmp4RKs4IY4AgfWsXrCMkP
         NAb72tG7H2965vaBjDMXNURC9xh/ayzla2k60U/YlbzOVWxYccsvwE0aZiCVgaNag8GT
         YfSEBQTZfcTw4qsI7frSIfRCUq+a4Dz7G1XgXZixAZD5Ld0Fqa9fagQXUhEvCI5ke1zw
         YDohEPAOKAOqtZdXiirxtrNNq74bhgDalTcLWhFBPIueCL1rAhOVOeMjgIwH5XN45lK3
         RmRWSRTruNqFa7X6qeSroTdgz9fNCGa+GAMmMhnw2idEm+C5/SkxT2LFPx621esKmSKK
         n3PQ==
X-Gm-Message-State: ABy/qLbQ08ZertpkCTAZDEpmufTAPhsaFvEBkGnPeT2QRBjdfw1KD4Se
        QUCf79+hjbUxYou/y5wtxHa4CQ==
X-Google-Smtp-Source: APBJJlGjbvR754lTt7F5r4F/RM/CN6QroT5zPLhCLAcvwy6eNTKgAwI+AcMRayhBNYF/nvbPGxdC3A==
X-Received: by 2002:a2e:9dd3:0:b0:2b6:dbc5:5ca4 with SMTP id x19-20020a2e9dd3000000b002b6dbc55ca4mr2100083ljj.16.1688319787169;
        Sun, 02 Jul 2023 10:43:07 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id v23-20020a2e9917000000b002b6daa3fa2csm1372550lji.69.2023.07.02.10.43.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jul 2023 10:43:06 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Ilia Lin <ilia.lin@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Georgi Djakov <djakov@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        Christian Marangi <ansuelsmth@gmail.com>,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH v3 21/28] ARM: dts: qcom: apq8064: add L2 cache scaling
Date:   Sun,  2 Jul 2023 20:42:39 +0300
Message-Id: <20230702174246.121656-22-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230702174246.121656-1-dmitry.baryshkov@linaro.org>
References: <20230702174246.121656-1-dmitry.baryshkov@linaro.org>
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

Populate L2 cache node with clock, supplies and OPP information to
facilitate scaling L2 frequency.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../dts/qcom/qcom-apq8064-asus-nexus7-flo.dts |   5 +
 .../boot/dts/qcom/qcom-apq8064-cm-qs600.dts   |   5 +
 .../boot/dts/qcom/qcom-apq8064-ifc6410.dts    |   5 +
 .../qcom-apq8064-sony-xperia-lagan-yuga.dts   |   5 +
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi      | 100 +++++++++++++++++-
 5 files changed, 119 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts b/arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts
index 1d6fb840dc60..30c2ece74ffb 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts
@@ -78,6 +78,11 @@ reboot-mode {
 	};
 };
 
+&L2 {
+	vdd-mem-supply = <&pm8921_l24>;
+	vdd-dig-supply = <&pm8921_s3>;
+};
+
 &dsi0 {
 	vdda-supply = <&pm8921_l2>;/*VDD_MIPI1 to 4*/
 	vdd-supply = <&pm8921_l8>;
diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064-cm-qs600.dts b/arch/arm/boot/dts/qcom/qcom-apq8064-cm-qs600.dts
index ee0090e03fb3..7452097e6c6b 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064-cm-qs600.dts
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064-cm-qs600.dts
@@ -35,6 +35,11 @@ v3p3_fixed: regulator-v3p3 {
 	};
 };
 
+&L2 {
+	vdd-mem-supply = <&pm8921_l24>;
+	vdd-dig-supply = <&pm8921_s3>;
+};
+
 &gsbi1 {
 	qcom,mode = <GSBI_PROT_I2C>;
 	status = "okay";
diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dts b/arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dts
index ddb092710275..80ef3dac6983 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dts
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dts
@@ -69,6 +69,11 @@ ext_3p3v: regulator-ext-3p3v {
 	};
 };
 
+&L2 {
+	vdd-mem-supply = <&pm8921_l24>;
+	vdd-dig-supply = <&pm8921_s3>;
+};
+
 &gsbi1 {
 	qcom,mode = <GSBI_PROT_I2C>;
 	status = "okay";
diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064-sony-xperia-lagan-yuga.dts b/arch/arm/boot/dts/qcom/qcom-apq8064-sony-xperia-lagan-yuga.dts
index 26f1e81e2bf5..748a65c0ece3 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064-sony-xperia-lagan-yuga.dts
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064-sony-xperia-lagan-yuga.dts
@@ -57,6 +57,11 @@ key-volume-up {
 	};
 };
 
+&L2 {
+	vdd-mem-supply = <&pm8921_l24>;
+	vdd-dig-supply = <&pm8921_s3>;
+};
+
 &gsbi5 {
 	qcom,mode = <GSBI_PROT_I2C_UART>;
 	status = "okay";
diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
index c212215800d0..860f8981e8db 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
@@ -2,6 +2,7 @@
 /dts-v1/;
 
 #include <dt-bindings/clock/qcom,gcc-msm8960.h>
+#include <dt-bindings/clock/qcom,krait-cc.h>
 #include <dt-bindings/clock/qcom,lcc-msm8960.h>
 #include <dt-bindings/reset/qcom,gcc-msm8960.h>
 #include <dt-bindings/clock/qcom,mmcc-msm8960.h>
@@ -81,9 +82,106 @@ CPU3: cpu@3 {
 		};
 
 		L2: l2-cache {
-			compatible = "cache";
+			compatible = "qcom,krait-l2-cache", "cache";
 			cache-level = <2>;
 			cache-unified;
+			clocks = <&kraitcc KRAIT_L2>;
+			#interconnect-cells = <1>;
+			operating-points-v2 = <&l2_opp_table>;
+
+			l2_opp_table: opp-table-l2 {
+				compatible = "operating-points-v2";
+
+				opp-384000000 {
+					opp-hz = /bits/ 64 <384000000>;
+					opp-microvolt = <1050000 1050000 1150000>,
+							<950000 950000 1150000>;
+				};
+
+				opp-432000000 {
+					opp-hz = /bits/ 64 <432000000>;
+					opp-microvolt = <1050000 1050000 1150000>,
+							<1050000 1050000 1150000>;
+				};
+
+				opp-486000000 {
+					opp-hz = /bits/ 64 <486000000>;
+					opp-microvolt = <1050000 1050000 1150000>,
+							<1050000 1050000 1150000>;
+				};
+
+				opp-540000000 {
+					opp-hz = /bits/ 64 <540000000>;
+					opp-microvolt = <1050000 1050000 1150000>,
+							<1050000 1050000 1150000>;
+				};
+
+				opp-594000000 {
+					opp-hz = /bits/ 64 <594000000>;
+					opp-microvolt = <1050000 1050000 1150000>,
+							<1050000 1050000 1150000>;
+				};
+
+				opp-648000000 {
+					opp-hz = /bits/ 64 <648000000>;
+					opp-microvolt = <1050000 1050000 1150000>,
+							<1050000 1050000 1150000>;
+				};
+
+				opp-702000000 {
+					opp-hz = /bits/ 64 <702000000>;
+					opp-microvolt = <1150000 1150000 1150000>,
+							<1150000 1150000 1150000>;
+				};
+
+				opp-756000000 {
+					opp-hz = /bits/ 64 <756000000>;
+					opp-microvolt = <1150000 1150000 1150000>,
+							<1150000 1150000 1150000>;
+				};
+
+				opp-810000000 {
+					opp-hz = /bits/ 64 <810000000>;
+					opp-microvolt = <1150000 1150000 1150000>,
+							<1150000 1150000 1150000>;
+				};
+
+				opp-864000000 {
+					opp-hz = /bits/ 64 <864000000>;
+					opp-microvolt = <1150000 1150000 1150000>,
+							<1150000 1150000 1150000>;
+				};
+
+				opp-918000000 {
+					opp-hz = /bits/ 64 <918000000>;
+					opp-microvolt = <1150000 1150000 1150000>,
+							<1150000 1150000 1150000>;
+				};
+
+				opp-972000000 {
+					opp-hz = /bits/ 64 <972000000>;
+					opp-microvolt = <1150000 1150000 1150000>,
+							<1150000 1150000 1150000>;
+				};
+
+				opp-1026000000 {
+					opp-hz = /bits/ 64 <1026000000>;
+					opp-microvolt = <1150000 1150000 1150000>,
+							<1150000 1150000 1150000>;
+				};
+
+				opp-1080000000 {
+					opp-hz = /bits/ 64 <1080000000>;
+					opp-microvolt = <1150000 1150000 1150000>,
+							<1150000 1150000 1150000>;
+				};
+
+				opp-1134000000 {
+					opp-hz = /bits/ 64 <1134000000>;
+					opp-microvolt = <1150000 1150000 1150000>,
+							<1150000 1150000 1150000>;
+				};
+			};
 		};
 
 		idle-states {
-- 
2.39.2

