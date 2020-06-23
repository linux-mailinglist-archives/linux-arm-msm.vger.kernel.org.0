Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E603020679F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2020 00:49:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389174AbgFWWtL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Jun 2020 18:49:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388957AbgFWWst (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Jun 2020 18:48:49 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEC08C061795;
        Tue, 23 Jun 2020 15:48:48 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id h15so245764wrq.8;
        Tue, 23 Jun 2020 15:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CmNC2Bn3o5ZHDXHiQCU50tdsYyPVrsvYkHpZV/07Wbc=;
        b=YosUTOomLdu1UlTkPUAKqkJC3J4sghWsuy1pKHG9nuMDuVp6Ud7JYeulz+kp8GtAQr
         siUvuHIro0lRPKa+7aZ/6hnc7CYa/CIwX0Tux8esYhF+R34UtcG8Ru1cP+SLNV7f/WVk
         bXyu10PbKx3UL1GKim14eDfy/nu+4i9rio6WhaqFYFTu5m/lfnmpuFXraHXhzRzBQz/m
         QTavo73oVgLN6/g0z9lcQAQyRObKWz2tvKjBd4MFpZZs4T2lvNPMxz7fmNtrtARxeu64
         YEgcM6LHyrztYX/HkGr7qM+40+n3r/9L84fDZGXAqHZgtdlo7ZkoYmt4hal8IC8ecvhJ
         bSTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CmNC2Bn3o5ZHDXHiQCU50tdsYyPVrsvYkHpZV/07Wbc=;
        b=IqZj0usVeWDRRt6f/yU2Kavdp3rmFKeuoPIXGBb7M3KxGcOubb2yCgQcFIb6OyUJz2
         PhQlmd3/2VTefBXSPB5a4GcAMOLyo2IN150v1CqvDPlbT6YzaEHCJT7hv0+Pv1wKMusK
         O8cmImXpri/9FaVYKd02XJ2gcTQikkUmVR7Bv1P3DjsUyUH+RaWILQ8alLWJf1arKN6I
         6Hk7kYxSD4PrLfIrZ/ttL22GP+lVG8KGPBtEwdeAJVZ2HBeiZyrbQpoornCMDv3rx9VB
         9+g1JwUv+Mf3rYiae7ulhDubvusCnma5JuIFNBvsoKuHVzdVXcDkN7j/N3SOabTNTRCh
         IZgg==
X-Gm-Message-State: AOAM531cXD4C30LqJs07bROVnfeoSNrsC1c7E2QMbt/2L4GpJRx8uZb8
        2x+2/5Tcl2o0firkYfMq6TcDwUgzC9c=
X-Google-Smtp-Source: ABdhPJyWV/u4v6H62EVp95qCQwecqFk1Xcpg4dP3u4tob2herzNN9TImhppQqtWzfyidMMsZ7t145A==
X-Received: by 2002:adf:f20a:: with SMTP id p10mr18814182wro.41.1592952527464;
        Tue, 23 Jun 2020 15:48:47 -0700 (PDT)
Received: from localhost.localdomain (abag196.neoplus.adsl.tpnet.pl. [83.6.170.196])
        by smtp.googlemail.com with ESMTPSA id g144sm5671179wme.2.2020.06.23.15.48.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2020 15:48:47 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     skrzynka@konradybcio.pl
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 11/12] arm64: dts: qcom: Move msm8994-smd-rpm contents to lg-bullhead.
Date:   Wed, 24 Jun 2020 00:48:10 +0200
Message-Id: <20200623224813.297077-12-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200623224813.297077-1-konradybcio@gmail.com>
References: <20200623224813.297077-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This was the only device using that dtsi, so no point
keeping it separate AND with a confusing name (bullhead
is based on msm8992 and the file contains regulator
values for that specific board).

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 .../dts/qcom/msm8992-bullhead-rev-101.dts     | 264 ++++++++++++++++-
 arch/arm64/boot/dts/qcom/msm8994-smd-rpm.dtsi | 268 ------------------
 2 files changed, 263 insertions(+), 269 deletions(-)
 delete mode 100644 arch/arm64/boot/dts/qcom/msm8994-smd-rpm.dtsi

diff --git a/arch/arm64/boot/dts/qcom/msm8992-bullhead-rev-101.dts b/arch/arm64/boot/dts/qcom/msm8992-bullhead-rev-101.dts
index 32670d5afdd6..893fc5b8fc34 100644
--- a/arch/arm64/boot/dts/qcom/msm8992-bullhead-rev-101.dts
+++ b/arch/arm64/boot/dts/qcom/msm8992-bullhead-rev-101.dts
@@ -47,4 +47,266 @@ ramoops@1ff00000 {
 	};
 };
 
-#include "msm8994-smd-rpm.dtsi"
+&smd_rpm {
+	rpm {
+		rpm_requests {
+			pm8994-regulators {
+
+				vdd_l1-supply = <&pm8994_s1>;
+				vdd_l2_26_28-supply = <&pm8994_s3>;
+				vdd_l3_11-supply = <&pm8994_s3>;
+				vdd_l4_27_31-supply = <&pm8994_s3>;
+				vdd_l5_7-supply = <&pm8994_s3>;
+				vdd_l6_12_32-supply = <&pm8994_s5>;
+				vdd_l8_16_30-supply = <&vreg_vph_pwr>;
+				vdd_l9_10_18_22-supply = <&vreg_vph_pwr>;
+				vdd_l13_19_23_24-supply = <&vreg_vph_pwr>;
+				vdd_l14_15-supply = <&pm8994_s5>;
+				vdd_l17_29-supply = <&vreg_vph_pwr>;
+				vdd_l20_21-supply = <&vreg_vph_pwr>;
+				vdd_l25-supply = <&pm8994_s5>;
+				vdd_lvs1_2 = <&pm8994_s4>;
+
+				s1 {
+					regulator-min-microvolt = <800000>;
+					regulator-max-microvolt = <800000>;
+				};
+
+				s2 {
+					/* TODO */
+				};
+
+				s3 {
+					regulator-min-microvolt = <1300000>;
+					regulator-max-microvolt = <1300000>;
+				};
+
+				s4 {
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+					regulator-allow-set-load;
+					regulator-system-load = <325000>;
+				};
+
+				s5 {
+					regulator-min-microvolt = <2150000>;
+					regulator-max-microvolt = <2150000>;
+				};
+
+				s7 {
+					regulator-min-microvolt = <1000000>;
+					regulator-max-microvolt = <1000000>;
+				};
+
+				l1 {
+					regulator-min-microvolt = <1000000>;
+					regulator-max-microvolt = <1000000>;
+				};
+
+				l2 {
+					regulator-min-microvolt = <1250000>;
+					regulator-max-microvolt = <1250000>;
+				};
+
+				l3 {
+					regulator-min-microvolt = <1200000>;
+					regulator-max-microvolt = <1200000>;
+				};
+
+				l4 {
+					regulator-min-microvolt = <1225000>;
+					regulator-max-microvolt = <1225000>;
+				};
+
+				l5 {
+					/* TODO */
+				};
+
+				l6 {
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+				};
+
+				l7 {
+					/* TODO */
+				};
+
+				l8 {
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+				};
+
+				l9 {
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+				};
+
+				l10 {
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+					qcom,init-voltage = <1800000>;
+				};
+
+				l11 {
+					regulator-min-microvolt = <1200000>;
+					regulator-max-microvolt = <1200000>;
+					qcom,init-voltage = <1200000>;
+				};
+
+				l12 {
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+					qcom,init-voltage = <1800000>;
+					proxy-supply = <&pm8994_l12>;
+					qcom,proxy-consumer-enable;
+					qcom,proxy-consumer-current = <10000>;
+					status = "okay";
+				};
+
+				l13 {
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <2950000>;
+					qcom,init-voltage = <2950000>;
+					status = "okay";
+				};
+
+				l14 {
+					regulator-min-microvolt = <1200000>;
+					regulator-max-microvolt = <1200000>;
+					qcom,init-voltage = <1200000>;
+					proxy-supply = <&pm8994_l14>;
+					qcom,proxy-consumer-enable;
+					qcom,proxy-consumer-current = <10000>;
+					status = "okay";
+				};
+
+				l15 {
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+					qcom,init-voltage = <1800000>;
+					status = "okay";
+				};
+
+				l16 {
+					regulator-min-microvolt = <2700000>;
+					regulator-max-microvolt = <2700000>;
+					qcom,init-voltage = <2700000>;
+					status = "okay";
+				};
+
+				l17 {
+					regulator-min-microvolt = <2700000>;
+					regulator-max-microvolt = <2700000>;
+					qcom,init-voltage = <2700000>;
+					status = "okay";
+				};
+
+				l18 {
+					regulator-min-microvolt = <3000000>;
+					regulator-max-microvolt = <3000000>;
+					regulator-always-on;
+					qcom,init-voltage = <3000000>;
+					qcom,init-ldo-mode = <1>;
+				};
+
+				l19 {
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+					qcom,init-voltage = <1800000>;
+					status = "okay";
+				};
+
+				l20 {
+					regulator-min-microvolt = <2950000>;
+					regulator-max-microvolt = <2950000>;
+					regulator-always-on;
+					regulator-boot-on;
+					regulator-allow-set-load;
+					regulator-system-load = <570000>;
+				};
+
+				l21 {
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+					regulator-always-on;
+					qcom,init-voltage = <1800000>;
+				};
+
+				l22 {
+					regulator-min-microvolt = <3100000>;
+					regulator-max-microvolt = <3100000>;
+					qcom,init-voltage = <3100000>;
+				};
+
+				l23 {
+					regulator-min-microvolt = <2800000>;
+					regulator-max-microvolt = <2800000>;
+					qcom,init-voltage = <2800000>;
+				};
+
+				l24 {
+					regulator-min-microvolt = <3075000>;
+					regulator-max-microvolt = <3150000>;
+					qcom,init-voltage = <3075000>;
+				};
+
+				l25 {
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+					qcom,init-voltage = <1800000>;
+				};
+
+				l26 {
+					/* TODO: value from downstream
+					regulator-min-microvolt = <987500>;
+					fails to apply */
+				};
+
+				l27 {
+					regulator-min-microvolt = <1050000>;
+					regulator-max-microvolt = <1050000>;
+					qcom,init-voltage = <1050000>;
+				};
+
+				l28 {
+					regulator-min-microvolt = <1000000>;
+					regulator-max-microvolt = <1000000>;
+					qcom,init-voltage = <1000000>;
+					proxy-supply = <&pm8994_l28>;
+					qcom,proxy-consumer-enable;
+					qcom,proxy-consumer-current = <10000>;
+				};
+
+				l29 {
+					/* TODO: Unsupported voltage range.
+					regulator-min-microvolt = <2800000>;
+					regulator-max-microvolt = <2800000>;
+					qcom,init-voltage = <2800000>;
+					*/
+				};
+
+				l30 {
+					/* TODO: get this verified
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+					qcom,init-voltage = <1800000>;
+					*/
+				};
+
+				l31 {
+					regulator-min-microvolt = <1262500>;
+					regulator-max-microvolt = <1262500>;
+					qcom,init-voltage = <1262500>;
+				};
+
+				l32 {
+					/* TODO: get this verified
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+					qcom,init-voltage = <1800000>;
+					*/
+				};
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/msm8994-smd-rpm.dtsi b/arch/arm64/boot/dts/qcom/msm8994-smd-rpm.dtsi
deleted file mode 100644
index 31e3eb6ab515..000000000000
--- a/arch/arm64/boot/dts/qcom/msm8994-smd-rpm.dtsi
+++ /dev/null
@@ -1,268 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/* Copyright (c) 2015, LGE Inc. All rights reserved.
- * Copyright (c) 2016, The Linux Foundation. All rights reserved.
- */
-
-&smd_rpm {
-	rpm {
-		rpm_requests {
-			pm8994-regulators {
-
-				vdd_l1-supply = <&pm8994_s1>;
-				vdd_l2_26_28-supply = <&pm8994_s3>;
-				vdd_l3_11-supply = <&pm8994_s3>;
-				vdd_l4_27_31-supply = <&pm8994_s3>;
-				vdd_l5_7-supply = <&pm8994_s3>;
-				vdd_l6_12_32-supply = <&pm8994_s5>;
-				vdd_l8_16_30-supply = <&vreg_vph_pwr>;
-				vdd_l9_10_18_22-supply = <&vreg_vph_pwr>;
-				vdd_l13_19_23_24-supply = <&vreg_vph_pwr>;
-				vdd_l14_15-supply = <&pm8994_s5>;
-				vdd_l17_29-supply = <&vreg_vph_pwr>;
-				vdd_l20_21-supply = <&vreg_vph_pwr>;
-				vdd_l25-supply = <&pm8994_s5>;
-				vdd_lvs1_2 = <&pm8994_s4>;
-
-				s1 {
-					regulator-min-microvolt = <800000>;
-					regulator-max-microvolt = <800000>;
-				};
-
-				s2 {
-					/* TODO */
-				};
-
-				s3 {
-					regulator-min-microvolt = <1300000>;
-					regulator-max-microvolt = <1300000>;
-				};
-
-				s4 {
-					regulator-min-microvolt = <1800000>;
-					regulator-max-microvolt = <1800000>;
-					regulator-allow-set-load;
-					regulator-system-load = <325000>;
-				};
-
-				s5 {
-					regulator-min-microvolt = <2150000>;
-					regulator-max-microvolt = <2150000>;
-				};
-
-				s7 {
-					regulator-min-microvolt = <1000000>;
-					regulator-max-microvolt = <1000000>;
-				};
-
-				l1 {
-					regulator-min-microvolt = <1000000>;
-					regulator-max-microvolt = <1000000>;
-				};
-
-				l2 {
-					regulator-min-microvolt = <1250000>;
-					regulator-max-microvolt = <1250000>;
-				};
-
-				l3 {
-					regulator-min-microvolt = <1200000>;
-					regulator-max-microvolt = <1200000>;
-				};
-
-				l4 {
-					regulator-min-microvolt = <1225000>;
-					regulator-max-microvolt = <1225000>;
-				};
-
-				l5 {
-					/* TODO */
-				};
-
-				l6 {
-					regulator-min-microvolt = <1800000>;
-					regulator-max-microvolt = <1800000>;
-				};
-
-				l7 {
-					/* TODO */
-				};
-
-				l8 {
-					regulator-min-microvolt = <1800000>;
-					regulator-max-microvolt = <1800000>;
-				};
-
-				l9 {
-					regulator-min-microvolt = <1800000>;
-					regulator-max-microvolt = <1800000>;
-				};
-
-				l10 {
-					regulator-min-microvolt = <1800000>;
-					regulator-max-microvolt = <1800000>;
-					qcom,init-voltage = <1800000>;
-				};
-
-				l11 {
-					regulator-min-microvolt = <1200000>;
-					regulator-max-microvolt = <1200000>;
-					qcom,init-voltage = <1200000>;
-				};
-
-				l12 {
-					regulator-min-microvolt = <1800000>;
-					regulator-max-microvolt = <1800000>;
-					qcom,init-voltage = <1800000>;
-					proxy-supply = <&pm8994_l12>;
-					qcom,proxy-consumer-enable;
-					qcom,proxy-consumer-current = <10000>;
-					status = "okay";
-				};
-
-				l13 {
-					regulator-min-microvolt = <1800000>;
-					regulator-max-microvolt = <2950000>;
-					qcom,init-voltage = <2950000>;
-					status = "okay";
-				};
-
-				l14 {
-					regulator-min-microvolt = <1200000>;
-					regulator-max-microvolt = <1200000>;
-					qcom,init-voltage = <1200000>;
-					proxy-supply = <&pm8994_l14>;
-					qcom,proxy-consumer-enable;
-					qcom,proxy-consumer-current = <10000>;
-					status = "okay";
-				};
-
-				l15 {
-					regulator-min-microvolt = <1800000>;
-					regulator-max-microvolt = <1800000>;
-					qcom,init-voltage = <1800000>;
-					status = "okay";
-				};
-
-				l16 {
-					regulator-min-microvolt = <2700000>;
-					regulator-max-microvolt = <2700000>;
-					qcom,init-voltage = <2700000>;
-					status = "okay";
-				};
-
-				l17 {
-					regulator-min-microvolt = <2700000>;
-					regulator-max-microvolt = <2700000>;
-					qcom,init-voltage = <2700000>;
-					status = "okay";
-				};
-
-				l18 {
-					regulator-min-microvolt = <3000000>;
-					regulator-max-microvolt = <3000000>;
-					regulator-always-on;
-					qcom,init-voltage = <3000000>;
-					qcom,init-ldo-mode = <1>;
-				};
-
-				l19 {
-					regulator-min-microvolt = <1800000>;
-					regulator-max-microvolt = <1800000>;
-					qcom,init-voltage = <1800000>;
-					status = "okay";
-				};
-
-				l20 {
-					regulator-min-microvolt = <2950000>;
-					regulator-max-microvolt = <2950000>;
-					regulator-always-on;
-					regulator-boot-on;
-					regulator-allow-set-load;
-					regulator-system-load = <570000>;
-				};
-
-				l21 {
-					regulator-min-microvolt = <1800000>;
-					regulator-max-microvolt = <1800000>;
-					regulator-always-on;
-					qcom,init-voltage = <1800000>;
-				};
-
-				l22 {
-					regulator-min-microvolt = <3100000>;
-					regulator-max-microvolt = <3100000>;
-					qcom,init-voltage = <3100000>;
-				};
-
-				l23 {
-					regulator-min-microvolt = <2800000>;
-					regulator-max-microvolt = <2800000>;
-					qcom,init-voltage = <2800000>;
-				};
-
-				l24 {
-					regulator-min-microvolt = <3075000>;
-					regulator-max-microvolt = <3150000>;
-					qcom,init-voltage = <3075000>;
-				};
-
-				l25 {
-					regulator-min-microvolt = <1800000>;
-					regulator-max-microvolt = <1800000>;
-					qcom,init-voltage = <1800000>;
-				};
-
-				l26 {
-					/* TODO: value from downstream
-					regulator-min-microvolt = <987500>;
-					fails to apply */
-				};
-
-				l27 {
-					regulator-min-microvolt = <1050000>;
-					regulator-max-microvolt = <1050000>;
-					qcom,init-voltage = <1050000>;
-				};
-
-				l28 {
-					regulator-min-microvolt = <1000000>;
-					regulator-max-microvolt = <1000000>;
-					qcom,init-voltage = <1000000>;
-					proxy-supply = <&pm8994_l28>;
-					qcom,proxy-consumer-enable;
-					qcom,proxy-consumer-current = <10000>;
-				};
-
-				l29 {
-					/* TODO: Unsupported voltage range.
-					regulator-min-microvolt = <2800000>;
-					regulator-max-microvolt = <2800000>;
-					qcom,init-voltage = <2800000>;
-					*/
-				};
-
-				l30 {
-					/* TODO: get this verified
-					regulator-min-microvolt = <1800000>;
-					regulator-max-microvolt = <1800000>;
-					qcom,init-voltage = <1800000>;
-					*/
-				};
-
-				l31 {
-					regulator-min-microvolt = <1262500>;
-					regulator-max-microvolt = <1262500>;
-					qcom,init-voltage = <1262500>;
-				};
-
-				l32 {
-					/* TODO: get this verified
-					regulator-min-microvolt = <1800000>;
-					regulator-max-microvolt = <1800000>;
-					qcom,init-voltage = <1800000>;
-					*/
-				};
-			};
-		};
-	};
-};
-- 
2.27.0

