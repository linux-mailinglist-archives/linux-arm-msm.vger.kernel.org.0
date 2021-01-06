Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4582A2EBE04
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Jan 2021 13:57:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726959AbhAFMzn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Jan 2021 07:55:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726884AbhAFMzh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Jan 2021 07:55:37 -0500
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBDABC061379
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Jan 2021 04:54:53 -0800 (PST)
Received: by mail-pf1-x42c.google.com with SMTP id s21so1638740pfu.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Jan 2021 04:54:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ATR9yRNBQQTnbKCfntyTDHLVwzrGaXdBCPAvcP9FhJU=;
        b=Scevy0bILl2yBVR8ByQXwgtx90/CV1F8Fn2s8NsQAtDYvdj/BQ5VQSLZWrkGieBajo
         D9WnNOptSQxak+2W6M3NoKyD0E7kZwuCIOgk9kGHfoXoFZxbGZjyeHE2lWfRek4FzpAU
         NOQKQhuYtOkF50NxuhcvLDCMI7mhCURQGvfqxbOZ84RV3UQz/r6OzRMFDU1sxYBM4F1p
         6C2+S7/zAOA0Kcx86Yo/xHAW64gR4iU8x72mpQ4MusU4iHJTWJ+i/imFe6sksvn/VU2i
         VGSZA4nLTpVYWvSHAPvj9K0QIJkIpGwcgmUC8PXEIYyr32y7I/1Rpu900r0Rdbp1uhEz
         ++xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ATR9yRNBQQTnbKCfntyTDHLVwzrGaXdBCPAvcP9FhJU=;
        b=NVfqVHs0rFX9vLrQBjHBBkFbijFkRKiadq1UDn9PHf5d6S9qVus79cCnWcdvj8WVGK
         gUsDw+Ms1RcCM8fXjd54LWaqB5GeLi5FIpPZBKhg9u9VPyEaxMhbXD6nt+BXTEVmx3bu
         A62O3s7GxX2gnEG2dM3UtK8obHyb/KtYwTtq8n+2CfJFcXNlOyqr5ZEUeNVJFwiPU/vg
         dcJpC65mBZZDgpHx7Wo1RBsg5DS+iqHQeFlAOqj4duVYfCQO04n/ACm0W+p2A3Sex2Xk
         OOBcc+US6VdTHbUSKxor3bBbVmLM+L5aCtRYBoDG064lrJVvPtOvOfFl8UzF+PGgpD0v
         6ZLg==
X-Gm-Message-State: AOAM533xOHghe485oPk0UJ33mpYQKVR6qDdNj+lO39zmjqoI5LPuuZM6
        0MAV+cGU7Q7NuW3h8XUh9btz
X-Google-Smtp-Source: ABdhPJyG7ZXnSUw9wylD8jNDsy7YobQYtV4evLzXy+EAvXl2kqTrSneZQ+vR9kBuVnFQJGOcCv2gYA==
X-Received: by 2002:aa7:868e:0:b029:19e:3ac9:f622 with SMTP id d14-20020aa7868e0000b029019e3ac9f622mr3960247pfo.37.1609937693223;
        Wed, 06 Jan 2021 04:54:53 -0800 (PST)
Received: from localhost.localdomain ([2409:4072:6102:e7a2:51f0:bf72:bf80:ec88])
        by smtp.gmail.com with ESMTPSA id n128sm2918182pga.55.2021.01.06.04.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jan 2021 04:54:52 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vinod Koul <vkoul@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 18/18] ARM: dts: qcom: sdx55-mtp: Add regulator nodes
Date:   Wed,  6 Jan 2021 18:23:22 +0530
Message-Id: <20210106125322.61840-19-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210106125322.61840-1-manivannan.sadhasivam@linaro.org>
References: <20210106125322.61840-1-manivannan.sadhasivam@linaro.org>
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
 arch/arm/boot/dts/qcom-sdx55-mtp.dts | 164 +++++++++++++++++++++++++++
 1 file changed, 164 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-sdx55-mtp.dts b/arch/arm/boot/dts/qcom-sdx55-mtp.dts
index 5b247f628d18..96b6a295f813 100644
--- a/arch/arm/boot/dts/qcom-sdx55-mtp.dts
+++ b/arch/arm/boot/dts/qcom-sdx55-mtp.dts
@@ -7,6 +7,7 @@
 /dts-v1/;
 
 #include "qcom-sdx55.dtsi"
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include <arm64/qcom/pm8150b.dtsi>
 #include "qcom-pmx55.dtsi"
 
@@ -43,6 +44,169 @@ mpss_adsp_mem: memory@90c00000 {
 			reg = <0x90c00000 0xd400000>;
 		};
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

