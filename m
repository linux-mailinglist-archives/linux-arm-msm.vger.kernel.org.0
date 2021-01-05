Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E15D2EAAD2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jan 2021 13:30:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730274AbhAEM25 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jan 2021 07:28:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730259AbhAEM24 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jan 2021 07:28:56 -0500
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FFEBC06138D
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jan 2021 04:27:56 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id s15so16277332plr.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jan 2021 04:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HMhTJmm/aJAOoL9aJNkUA9BuiVKtKAPPcxXpVi5YN0I=;
        b=IQCnViu6Gscw70F3M40CJz7CWKD+hMrlxpGVlQ4Y/o/Z5LQPcPVPvQUfoyrE+5M5sB
         5qsyfMFezh/8aYezZD/+eIqWVjLC9d7PWJjjcRfQhEOkkbekZv9HXdrRk1qvJCcEbRal
         5S1A2KMpknVZ2g+zyrFFgEkcAZ/bqL5F0a13nkR7sBm1w1VUAUsVbAHat/lzQY1YfN6P
         6se9CnfOY+vlmp9AJDgzRM12GBpMSY8y4YHVX3agSgrePdgifzrPFDzgvkud4m/1+Ut3
         HdmS0a23US4esyzFsQnY7EOkEUZnOi4rZ2AtJrFpyQGUTJjGNYXf4s7xOiZ/fV/bcg2J
         ACrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HMhTJmm/aJAOoL9aJNkUA9BuiVKtKAPPcxXpVi5YN0I=;
        b=JMjnrzDyFeCsJLk4ZOsoJpg9RaK/hvjBL6heM9TCYUyfhhngmjwCRONi5QWLZyztGz
         TOgDSqoEeEbDY2aZxy4zCRw6BG6wWjdOONKgseBPRQrNxaMj19CksD2G/qV2uoauJiZB
         CAZSwj71JackVV3g39iS7Vk2PSwtOg1GNhFUXdxBsNw3ItZttIgFFf0DCd7HZuLPH0BV
         tJIaspOsxamOj5GwF5dRig6dh1Af9mgwY31rO9tL4Z5lfSW9hGAVOaL0i7Tl5v3K8bSO
         OEWyHbUMyQ50g5Na//PrZLNMQ0FLb64LgX7/Oj0sotBI/rL6I6hzLZiSpofhmSgAjzDD
         rchQ==
X-Gm-Message-State: AOAM532uVTuhi4l2M3El9M3AN3J26mFoQvKrUBzRjjjWWnXTTk+PQUtA
        opOok7NyhYVsoqR1Nvdmgv4J
X-Google-Smtp-Source: ABdhPJynMcTi+qPSgTqiFxHAuFVh6C/rwoaelZubZHfobNX+jtdW+qrsv8rlTZ3w9HTCPttnvnuUFQ==
X-Received: by 2002:a17:90a:a012:: with SMTP id q18mr3745238pjp.223.1609849675759;
        Tue, 05 Jan 2021 04:27:55 -0800 (PST)
Received: from localhost.localdomain ([103.77.37.191])
        by smtp.gmail.com with ESMTPSA id t22sm64745402pgm.18.2021.01.05.04.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 04:27:55 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vinod Koul <vkoul@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 18/18] ARM: dts: qcom: sdx55-mtp: Add regulator nodes
Date:   Tue,  5 Jan 2021 17:56:49 +0530
Message-Id: <20210105122649.13581-19-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210105122649.13581-1-manivannan.sadhasivam@linaro.org>
References: <20210105122649.13581-1-manivannan.sadhasivam@linaro.org>
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

