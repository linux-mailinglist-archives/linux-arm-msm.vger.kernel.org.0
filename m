Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7B7C2EA801
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jan 2021 10:50:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728006AbhAEJtN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jan 2021 04:49:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728699AbhAEJsh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jan 2021 04:48:37 -0500
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6C28C061387
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jan 2021 01:47:42 -0800 (PST)
Received: by mail-pl1-x62f.google.com with SMTP id e2so16060361plt.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jan 2021 01:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HMhTJmm/aJAOoL9aJNkUA9BuiVKtKAPPcxXpVi5YN0I=;
        b=Kd2FykxbC/3bScfgxQBMd485VKlyITJL9N76ml9I7ykeuwGse5CuNEIvB2xfb7XJ1p
         /jX2vfpErR92agoDxrS6OP6u50zDpMVSW59jUWM6GxzvNdLkyGmDhGQ+9vLJMoU/GPXE
         mzlNnpnfy6ce67U3tsRoOT57LOZ/ZMxJ3VopP/JdR7boZjdcDGXs3rYkAXBZF6JxbyxF
         g9euX6kuuRfHYw3SScUipfjtVltpwAr2zCz4YkM1/Q7ddLbQ7JYcj/h5ydsGA/vC29na
         VV8pLG5l1IIM0AY3QhdokoR19Q1NbbonZuitQ63V8rG1Zolgd4NYgeLtQ2iObHaMTvpb
         7ADg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HMhTJmm/aJAOoL9aJNkUA9BuiVKtKAPPcxXpVi5YN0I=;
        b=X9ROMiydFoiNV7JV+Xgvr4X6JPUm9O+6I1rNmITeYAZ9QwC9t+fDUD8dzHn+6rvBaT
         kIScobR9+EEyPU4SuVaNorivHmrtafCxxJYYvHKKrq3mp5vypN4DlH0/HytJThBb3Pl3
         +b7NKJK9V84wpWtC8BtvQvTMry3vCflafREHJopBVKiD3Aux4cUWSP6YJNIJy1NJDM3V
         m2vupqHnNW6qvNN+aCb7t1xmyfZlKoG2+/qwzGk7Ltp8as6p57HcDYhj5JeC1JupEToA
         lv5bbDYBWFvt9Xm7JcOjtl/8e3Zi77O7Lgx69QZGihlcGr21r3XO60NFUg2Ky/ickO8Y
         0UKA==
X-Gm-Message-State: AOAM531ZVweNDrsJi2Og6pT/5ex1yxpe8yBaB9kiidfxCFNw4kP8UNCe
        F+EhZeaDfKa0Qwctf0EEV2H/
X-Google-Smtp-Source: ABdhPJwD60AP4EPqH9IwpZA52jemObCnoqjeApb1Acfq2z3rnSYdeVyyRdyxqi8+aupewewNjRK+7w==
X-Received: by 2002:a17:902:a401:b029:dc:3e1d:234a with SMTP id p1-20020a170902a401b02900dc3e1d234amr54483154plq.48.1609840062211;
        Tue, 05 Jan 2021 01:47:42 -0800 (PST)
Received: from localhost.localdomain ([103.77.37.191])
        by smtp.gmail.com with ESMTPSA id f64sm60073921pfb.146.2021.01.05.01.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 01:47:41 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vinod Koul <vkoul@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 18/18] ARM: dts: qcom: sdx55-mtp: Add regulator nodes
Date:   Tue,  5 Jan 2021 15:16:36 +0530
Message-Id: <20210105094636.10301-19-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210105094636.10301-1-manivannan.sadhasivam@linaro.org>
References: <20210105094636.10301-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Vinod Koul <vkoul@kernel.org>

This adds the regulators found on SDX55 MTP.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm/boot/dts/qcom-sdx55-mtp.dts | 179 +++++++++++++++++++++++++++
 1 file changed, 179 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-sdx55-mtp.dts b/arch/arm/boot/dts/qcom-sdx55-mtp.dts
index 825cc7d0ba18..61e7d5d4bd48 100644
--- a/arch/arm/boot/dts/qcom-sdx55-mtp.dts
+++ b/arch/arm/boot/dts/qcom-sdx55-mtp.dts
@@ -6,6 +6,7 @@
 
 /dts-v1/;
 
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include "qcom-sdx55.dtsi"
 #include <arm64/qcom/pm8150b.dtsi>
 #include "qcom-pmx55.dtsi"
@@ -22,6 +23,184 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	vph_pwr: vph-pwr-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "vph_pwr";
+		regulator-min-microvolt = <3700000>;
+		regulator-max-microvolt = <3700000>;
+	};
+
+	vreg_bob_3p3: pmx55-bob {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_bob_3p3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		regulator-always-on;
+		regulator-boot-on;
+
+		vin-supply = <&vph_pwr>;
+	};
+
+	vreg_s7e_mx_0p752: pmx55-s7e {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_s7e_mx_0p752";
+		regulator-min-microvolt = <752000>;
+		regulator-max-microvolt = <752000>;
+
+		vin-supply = <&vph_pwr>;
+	};
+
+	vreg_vddpx_2: vddpx-2 {
+		compatible = "regulator-gpio";
+		regulator-name = "vreg_vddpx_2";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <2850000>;
+		enable-gpios = <&tlmm 98 GPIO_ACTIVE_HIGH>;
+		gpios = <&tlmm 100 GPIO_ACTIVE_HIGH>;
+		states = <1800000 0>, <2850000 1>;
+		startup-delay-us = <200000>;
+		enable-active-high;
+		regulator-boot-on;
+
+		vin-supply = <&vph_pwr>;
+	};
+};
+
+&apps_rsc {
+	pmx55-rpmh-regulators {
+		compatible = "qcom,pmx55-rpmh-regulators";
+		qcom,pmic-id = "e";
+
+		vdd-s1-supply = <&vph_pwr>;
+		vdd-s2-supply = <&vph_pwr>;
+		vdd-s3-supply = <&vph_pwr>;
+		vdd-s4-supply = <&vph_pwr>;
+		vdd-s5-supply = <&vph_pwr>;
+		vdd-s6-supply = <&vph_pwr>;
+		vdd-s7-supply = <&vph_pwr>;
+		vdd-l1-l2-supply = <&vreg_s2e_1p224>;
+		vdd-l3-l9-supply = <&vreg_s3e_0p824>;
+		vdd-l4-l12-supply = <&vreg_s4e_1p904>;
+		vdd-l5-l6-supply = <&vreg_s4e_1p904>;
+		vdd-l7-l8-supply = <&vreg_s3e_0p824>;
+		vdd-l10-l11-l13-supply = <&vreg_bob_3p3>;
+		vdd-l14-supply = <&vreg_s7e_mx_0p752>;
+		vdd-l15-supply = <&vreg_s2e_1p224>;
+		vdd-l16-supply = <&vreg_s4e_1p904>;
+
+		vreg_s2e_1p224: smps2 {
+			regulator-min-microvolt = <1280000>;
+			regulator-max-microvolt = <1400000>;
+		};
+
+		vreg_s3e_0p824: smps3 {
+			regulator-min-microvolt = <800000>;
+			regulator-max-microvolt = <1000000>;
+		};
+
+		vreg_s4e_1p904: smps4 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1960000>;
+		};
+
+		ldo1 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+		};
+
+		ldo2 {
+			regulator-min-microvolt = <1128000>;
+			regulator-max-microvolt = <1128000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+		};
+
+		ldo3 {
+			regulator-min-microvolt = <800000>;
+			regulator-max-microvolt = <800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+		};
+
+		ldo4 {
+			regulator-min-microvolt = <872000>;
+			regulator-max-microvolt = <872000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+		};
+
+		ldo5 {
+			regulator-min-microvolt = <1704000>;
+			regulator-max-microvolt = <1900000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+		};
+
+		ldo6 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+		};
+
+		ldo7 {
+			regulator-min-microvolt = <480000>;
+			regulator-max-microvolt = <900000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+		};
+
+		ldo8 {
+			regulator-min-microvolt = <480000>;
+			regulator-max-microvolt = <900000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+		};
+
+		ldo9 {
+			regulator-min-microvolt = <800000>;
+			regulator-max-microvolt = <800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+		};
+
+		ldo10 {
+			regulator-min-microvolt = <3088000>;
+			regulator-max-microvolt = <3088000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+		};
+
+		ldo11 {
+			regulator-min-microvolt = <1704000>;
+			regulator-max-microvolt = <2928000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+		};
+
+		ldo12 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+		};
+
+		ldo13 {
+			regulator-min-microvolt = <1704000>;
+			regulator-max-microvolt = <2928000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+		};
+
+		ldo14 {
+			regulator-min-microvolt = <600000>;
+			regulator-max-microvolt = <800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+		};
+
+		ldo15 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+		};
+
+		ldo16 {
+			regulator-min-microvolt = <1704000>;
+			regulator-max-microvolt = <1904000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+		};
+	};
 };
 
 &blsp1_uart3 {
-- 
2.25.1

