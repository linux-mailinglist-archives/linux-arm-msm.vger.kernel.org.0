Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 044AA20766E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2020 17:04:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404137AbgFXPBo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Jun 2020 11:01:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404127AbgFXPBl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Jun 2020 11:01:41 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A16BFC061573;
        Wed, 24 Jun 2020 08:01:40 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id v3so2640596wrc.1;
        Wed, 24 Jun 2020 08:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fWvZOvlYgj/coFGSAGsn1+I2qlc/ybmGUpAsWaUKE1k=;
        b=d/Rv4owG3Od3+8wp4LGTCqPxMCq5f5D7uwYXahyFtircWW2IgHhWrBsniOeeNm+Y+U
         nhLt/esAV5+D8kNWsgyEdg0ooMagxjs2XSuT8Of4WRwO3Cm3/IIQdISNyjygSBBa3k+Z
         qYaCTtTDaBeyC6WoLvD6qWhQHr3FvW8UXkYm8UgIiitek9N9Gtyr2Xd13RGymP0EBFCV
         629PkQpDEq6r2dTX91dpNVrrVJFGu7LHRqfmtNVhFxtjx2aPseM7DcxYOTsX42uYUGV9
         47JHpCWyNs9FNVa8qYE+atBm7acPVBPChA30QfuMwtHn7iDs3mCyrlsbLUB7f/G5ilE3
         63NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fWvZOvlYgj/coFGSAGsn1+I2qlc/ybmGUpAsWaUKE1k=;
        b=iB0SGYpe8p+7fxEYMt0AlmxWDcovK+H3u/MOHuzC3W+QTpd5X5MYjKavXNDqWdf9IN
         apCFwqyZdysrZlJfmzSA5C2o8aFdeVWBQLuHFirctlopLzf17OaFwDE1SfikqoKXAz0q
         JD/D1sZhnWA6iQ4v25h7ABVjIJ4NTNie9tnaKreIKrsCrBYLLAFDlbOnA2qT+r5h77v6
         21b5LxXxgu6YvtPmdEFsE950+PjGHEkP7pbeFFqNPZ00LUt5PwJOmvXEOG83DBp7jf2M
         jkdvsPuHB9iRb+AfJfhuGHyjkVSoQoYNMAJ93/1CbgFo1sPP4ZbzWhOre3DNm8b/Stuf
         K7cQ==
X-Gm-Message-State: AOAM532X6axDbWHkV3M6hbcHoqtboCaxRUxrUJtRpkQuo5oBvxGzM0H4
        vCVih/LYCZeinZrMQeGVL9Q=
X-Google-Smtp-Source: ABdhPJxne3UGP/Ze1tGQDTkX5UwUXBiI9qVCaIOpB7P+eQrl7ayulWTjzyJ7GJSp1QOgCyQTiBkymg==
X-Received: by 2002:adf:8067:: with SMTP id 94mr30116164wrk.427.1593010899232;
        Wed, 24 Jun 2020 08:01:39 -0700 (PDT)
Received: from localhost.localdomain (abag196.neoplus.adsl.tpnet.pl. [83.6.170.196])
        by smtp.googlemail.com with ESMTPSA id s8sm21339390wru.38.2020.06.24.08.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2020 08:01:38 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     skrzynka@konradybcio.pl
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 7/8] arm64: dts: qcom: Move msm8994-smd-rpm contents to lg-bullhead.
Date:   Wed, 24 Jun 2020 17:01:05 +0200
Message-Id: <20200624150107.76234-8-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200624150107.76234-1-konradybcio@gmail.com>
References: <20200624150107.76234-1-konradybcio@gmail.com>
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
 .../dts/qcom/msm8992-bullhead-rev-101.dts     | 225 ++++++++++++++-
 arch/arm64/boot/dts/qcom/msm8994-smd-rpm.dtsi | 268 ------------------
 2 files changed, 224 insertions(+), 269 deletions(-)
 delete mode 100644 arch/arm64/boot/dts/qcom/msm8994-smd-rpm.dtsi

diff --git a/arch/arm64/boot/dts/qcom/msm8992-bullhead-rev-101.dts b/arch/arm64/boot/dts/qcom/msm8992-bullhead-rev-101.dts
index 32670d5afdd6..a2de69292d28 100644
--- a/arch/arm64/boot/dts/qcom/msm8992-bullhead-rev-101.dts
+++ b/arch/arm64/boot/dts/qcom/msm8992-bullhead-rev-101.dts
@@ -47,4 +47,227 @@ ramoops@1ff00000 {
 	};
 };
 
-#include "msm8994-smd-rpm.dtsi"
+&rpm_requests {
+	pm8994-regulators {
+		compatible = "qcom,rpm-pm8994-regulators";
+
+		vdd_l1-supply = <&pm8994_s1>;
+		vdd_l2_26_28-supply = <&pm8994_s3>;
+		vdd_l3_11-supply = <&pm8994_s3>;
+		vdd_l4_27_31-supply = <&pm8994_s3>;
+		vdd_l5_7-supply = <&pm8994_s3>;
+		vdd_l6_12_32-supply = <&pm8994_s5>;
+		vdd_l8_16_30-supply = <&vreg_vph_pwr>;
+		vdd_l9_10_18_22-supply = <&vreg_vph_pwr>;
+		vdd_l13_19_23_24-supply = <&vreg_vph_pwr>;
+		vdd_l14_15-supply = <&pm8994_s5>;
+		vdd_l17_29-supply = <&vreg_vph_pwr>;
+		vdd_l20_21-supply = <&vreg_vph_pwr>;
+		vdd_l25-supply = <&pm8994_s5>;
+		vdd_lvs1_2 = <&pm8994_s4>;
+
+		pm8994_s1: s1 {
+			regulator-min-microvolt = <800000>;
+			regulator-max-microvolt = <800000>;
+		};
+
+		pm8994_s2: s2 {
+			/* TODO */
+		};
+
+		pm8994_s3: s3 {
+			regulator-min-microvolt = <1300000>;
+			regulator-max-microvolt = <1300000>;
+		};
+
+		pm8994_s4: s4 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-allow-set-load;
+			regulator-system-load = <325000>;
+		};
+
+		pm8994_s5: s5 {
+			regulator-min-microvolt = <2150000>;
+			regulator-max-microvolt = <2150000>;
+		};
+
+		pm8994_s7: s7 {
+			regulator-min-microvolt = <1000000>;
+			regulator-max-microvolt = <1000000>;
+		};
+
+		pm8994_l1: l1 {
+			regulator-min-microvolt = <1000000>;
+			regulator-max-microvolt = <1000000>;
+		};
+
+		pm8994_l2: l2 {
+			regulator-min-microvolt = <1250000>;
+			regulator-max-microvolt = <1250000>;
+		};
+
+		pm8994_l3: l3 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+		};
+
+		pm8994_l4: l4 {
+			regulator-min-microvolt = <1225000>;
+			regulator-max-microvolt = <1225000>;
+		};
+
+		pm8994_l5: l5 {
+			/* TODO */
+		};
+
+		pm8994_l6: l6 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm8994_l7: l7 {
+			/* TODO */
+		};
+
+		pm8994_l8: l8 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm8994_l9: l9 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm8994_l10: l10 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm8994_l11: l11 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+		};
+
+		pm8994_l12: l12 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm8994_l13: l13 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2950000>;
+		};
+
+		pm8994_l14: l14 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+		};
+
+		pm8994_l15: l15 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm8994_l16: l16 {
+			regulator-min-microvolt = <2700000>;
+			regulator-max-microvolt = <2700000>;
+		};
+
+		pm8994_l17: l17 {
+			regulator-min-microvolt = <2700000>;
+			regulator-max-microvolt = <2700000>;
+		};
+
+		pm8994_l18: l18 {
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3000000>;
+		};
+
+		pm8994_l19: l19 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm8994_l20: l20 {
+			regulator-min-microvolt = <2950000>;
+			regulator-max-microvolt = <2950000>;
+			regulator-always-on;
+			regulator-boot-on;
+			regulator-allow-set-load;
+			regulator-system-load = <570000>;
+		};
+
+		pm8994_l21: l21 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-always-on;
+		};
+
+		pm8994_l22: l22 {
+			regulator-min-microvolt = <3100000>;
+			regulator-max-microvolt = <3100000>;
+		};
+
+		pm8994_l23: l23 {
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+		};
+
+		pm8994_l24: l24 {
+			regulator-min-microvolt = <3075000>;
+			regulator-max-microvolt = <3150000>;
+		};
+
+		pm8994_l25: l25 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm8994_l26: l26 {
+			/* TODO: value from downstream
+			regulator-min-microvolt = <987500>;
+			fails to apply */
+		};
+
+		pm8994_l27: l27 {
+			regulator-min-microvolt = <1050000>;
+			regulator-max-microvolt = <1050000>;
+		};
+
+		pm8994_l28: l28 {
+			regulator-min-microvolt = <1000000>;
+			regulator-max-microvolt = <1000000>;
+		};
+
+		pm8994_l29: l29 {
+			/* TODO: Unsupported voltage range.
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+			qcom,init-voltage = <2800000>;
+			*/
+		};
+
+		pm8994_l30: l30 {
+			/* TODO: get this verified
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			qcom,init-voltage = <1800000>;
+			*/
+		};
+
+		pm8994_l31: l31 {
+			regulator-min-microvolt = <1262500>;
+			regulator-max-microvolt = <1262500>;
+		};
+
+		pm8994_l32: l32 {
+			/* TODO: get this verified
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			qcom,init-voltage = <1800000>;
+			*/
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

