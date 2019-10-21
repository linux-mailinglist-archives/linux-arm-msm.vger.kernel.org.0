Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE3B7DE3A8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2019 07:14:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725802AbfJUFOM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Oct 2019 01:14:12 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:36477 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726645AbfJUFNc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Oct 2019 01:13:32 -0400
Received: by mail-pg1-f196.google.com with SMTP id 23so7021452pgk.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Oct 2019 22:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=20aHMxbij8FJFTKqROAV7Z+Rskif7/iGK/zL9OH7uLs=;
        b=z1z4IYXz96qxq880Iwjgd+IYD7ELShq8e9Q3fDDdh9HK1wXlvjZLS1TZH1bnQA4Ql4
         Ogh4KlYgp1dit8TCYkIh7nnVc+RUmnIiBIsDBPaOM7fmZkr2brfoKpXTfzKp78yiQit4
         YXeAu3E6+zPTBzd1r5F3F0iAAqT2pd+WPU4lt4xCbIwGaeddgX3AseDnjDCKuNWl+Lsn
         Ky8t04CRCZ2rAlvSypPKsBFXORWH2NgsyRo9cAn3rEJIBRTtF6A/RIxQGpeiU7wBqDVU
         WNPQ2luI3fgLM5bn84jVgFRwwYprltg+WFRNk9D+QmlJZmHLXT3T2qUKKUkB7wzFS9Sr
         32CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=20aHMxbij8FJFTKqROAV7Z+Rskif7/iGK/zL9OH7uLs=;
        b=G3HBxaLmfn9mwsMQiomLBcAY8yMtuktUE/7zp7yE6nj2CMrvSeRNXwyUR3J7QbtkEv
         9GLA1A8he8+p4vjvr/+gOIrdfbQ+0piSQhn/qLGUvZKP19JenOk22kSXRZyhA/4by3rL
         Yy9NHsle6xQcENWl6jTItHttAjX8D12KYyJ7k7mwk1+1bivBLljr40V/C23xgaA5PPM6
         t6GFAysIvtHSkzZiolvrgXFcSTgAwKYD2WUV2z17aqIDd9J97MoKgz57B4Furjcv54+7
         Nlj6IyTSZvoEwde2p0DQ4VycRYkeaVLZgxo7RnZF7PgVqO7d39hCoQQ1vAciPL2Ac18u
         TviQ==
X-Gm-Message-State: APjAAAUl+FFLeHI3fl/YDpc6TKDHeeGBtzR4ElGbKk1ngshzwz/EHV5F
        Ai6ER2nnGZcKAEk2acri12svvQ==
X-Google-Smtp-Source: APXvYqzKNDTHv4ReWf/4B9uqWAUyRJU/KWHFPn7EDDwqK3fko6F+RvI9+UIOYBX+ipjT7f7rtlebYw==
X-Received: by 2002:a65:4608:: with SMTP id v8mr23253446pgq.366.1571634811304;
        Sun, 20 Oct 2019 22:13:31 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id h68sm15716862pfb.149.2019.10.20.22.13.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2019 22:13:30 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 04/11] arm64: dts: qcom: msm8996: Move regulators to db820c
Date:   Sun, 20 Oct 2019 22:13:15 -0700
Message-Id: <20191021051322.297560-5-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191021051322.297560-1-bjorn.andersson@linaro.org>
References: <20191021051322.297560-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As the definition of available PMICs and the names of their outputs are
board specifc move this to db820c.dtsi

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi | 308 ++++++++++---------
 arch/arm64/boot/dts/qcom/msm8996.dtsi        |  53 +---
 2 files changed, 156 insertions(+), 205 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
index 21e029afb27b..fc6273b0215d 100644
--- a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
@@ -513,163 +513,165 @@
 			gpios = <&pm8994_gpios 2 GPIO_ACTIVE_LOW>;
 		};
 	};
+};
 
-	rpm-glink {
-		rpm_requests {
-			pm8994-regulators {
-				vdd_l1-supply = <&pm8994_s3>;
-				vdd_l2_l26_l28-supply = <&pm8994_s3>;
-				vdd_l3_l11-supply = <&pm8994_s3>;
-				vdd_l4_l27_l31-supply = <&pm8994_s3>;
-				vdd_l5_l7-supply = <&pm8994_s5>;
-				vdd_l14_l15-supply = <&pm8994_s5>;
-				vdd_l20_l21-supply = <&pm8994_s5>;
-				vdd_l25-supply = <&pm8994_s3>;
-
-				s3 {
-					regulator-min-microvolt = <1300000>;
-					regulator-max-microvolt = <1300000>;
-				};
-
-				/**
-				 * 1.8v required on LS expansion
-				 * for mezzanine boards
-				 */
-				s4 {
-					regulator-min-microvolt = <1800000>;
-					regulator-max-microvolt = <1800000>;
-					regulator-always-on;
-				};
-				s5 {
-					regulator-min-microvolt = <2150000>;
-					regulator-max-microvolt = <2150000>;
-				};
-				s7 {
-					regulator-min-microvolt = <800000>;
-					regulator-max-microvolt = <800000>;
-				};
-
-				l1 {
-					regulator-min-microvolt = <1000000>;
-					regulator-max-microvolt = <1000000>;
-				};
-				l2 {
-					regulator-min-microvolt = <1250000>;
-					regulator-max-microvolt = <1250000>;
-				};
-				l3 {
-					regulator-min-microvolt = <850000>;
-					regulator-max-microvolt = <850000>;
-				};
-				l4 {
-					regulator-min-microvolt = <1225000>;
-					regulator-max-microvolt = <1225000>;
-				};
-				l6 {
-					regulator-min-microvolt = <1200000>;
-					regulator-max-microvolt = <1200000>;
-				};
-				l8 {
-					regulator-min-microvolt = <1800000>;
-					regulator-max-microvolt = <1800000>;
-				};
-				l9 {
-					regulator-min-microvolt = <1800000>;
-					regulator-max-microvolt = <1800000>;
-				};
-				l10 {
-					regulator-min-microvolt = <1800000>;
-					regulator-max-microvolt = <1800000>;
-				};
-				l11 {
-					regulator-min-microvolt = <1150000>;
-					regulator-max-microvolt = <1150000>;
-				};
-				l12 {
-					regulator-min-microvolt = <1800000>;
-					regulator-max-microvolt = <1800000>;
-				};
-				l13 {
-					regulator-min-microvolt = <1800000>;
-					regulator-max-microvolt = <2950000>;
-				};
-				l14 {
-					regulator-min-microvolt = <1800000>;
-					regulator-max-microvolt = <1800000>;
-				};
-				l15 {
-					regulator-min-microvolt = <1800000>;
-					regulator-max-microvolt = <1800000>;
-				};
-				l16 {
-					regulator-min-microvolt = <2700000>;
-					regulator-max-microvolt = <2700000>;
-				};
-				l17 {
-					regulator-min-microvolt = <2500000>;
-					regulator-max-microvolt = <2500000>;
-				};
-				l18 {
-					regulator-min-microvolt = <2700000>;
-					regulator-max-microvolt = <2900000>;
-				};
-				l19 {
-					regulator-min-microvolt = <3000000>;
-					regulator-max-microvolt = <3000000>;
-				};
-				l20 {
-					regulator-min-microvolt = <2950000>;
-					regulator-max-microvolt = <2950000>;
-					regulator-allow-set-load;
-				};
-				l21 {
-					regulator-min-microvolt = <2950000>;
-					regulator-max-microvolt = <2950000>;
-					regulator-allow-set-load;
-					regulator-system-load = <200000>;
-				};
-				l22 {
-					regulator-min-microvolt = <3300000>;
-					regulator-max-microvolt = <3300000>;
-				};
-				l23 {
-					regulator-min-microvolt = <2800000>;
-					regulator-max-microvolt = <2800000>;
-				};
-				l24 {
-					regulator-min-microvolt = <3075000>;
-					regulator-max-microvolt = <3075000>;
-				};
-				l25 {
-					regulator-min-microvolt = <1200000>;
-					regulator-max-microvolt = <1200000>;
-					regulator-allow-set-load;
-				};
-				l27 {
-					regulator-min-microvolt = <1000000>;
-					regulator-max-microvolt = <1000000>;
-				};
-				l28 {
-					regulator-min-microvolt = <925000>;
-					regulator-max-microvolt = <925000>;
-					regulator-allow-set-load;
-				};
-				l29 {
-					regulator-min-microvolt = <2800000>;
-					regulator-max-microvolt = <2800000>;
-				};
-				l30 {
-					regulator-min-microvolt = <1800000>;
-					regulator-max-microvolt = <1800000>;
-				};
-				l32 {
-					regulator-min-microvolt = <1800000>;
-					regulator-max-microvolt = <1800000>;
-				};
-			};
+&rpm_requests {
+	pm8994-regulators {
+		compatible = "qcom,rpm-pm8994-regulators";
+
+		vdd_l1-supply = <&pm8994_s3>;
+		vdd_l2_l26_l28-supply = <&pm8994_s3>;
+		vdd_l3_l11-supply = <&pm8994_s3>;
+		vdd_l4_l27_l31-supply = <&pm8994_s3>;
+		vdd_l5_l7-supply = <&pm8994_s5>;
+		vdd_l14_l15-supply = <&pm8994_s5>;
+		vdd_l20_l21-supply = <&pm8994_s5>;
+		vdd_l25-supply = <&pm8994_s3>;
+
+		pm8994_s3: s3 {
+			regulator-min-microvolt = <1300000>;
+			regulator-max-microvolt = <1300000>;
+		};
+
+		/**
+		 * 1.8v required on LS expansion
+		 * for mezzanine boards
+		 */
+		pm8994_s4: s4 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-always-on;
+		};
+		pm8994_s5: s5 {
+			regulator-min-microvolt = <2150000>;
+			regulator-max-microvolt = <2150000>;
+		};
+		pm8994_s7: s7 {
+			regulator-min-microvolt = <800000>;
+			regulator-max-microvolt = <800000>;
+		};
+
+		pm8994_l1: l1 {
+			regulator-min-microvolt = <1000000>;
+			regulator-max-microvolt = <1000000>;
+		};
+		pm8994_l2: l2 {
+			regulator-min-microvolt = <1250000>;
+			regulator-max-microvolt = <1250000>;
+		};
+		pm8994_l3: l3 {
+			regulator-min-microvolt = <850000>;
+			regulator-max-microvolt = <850000>;
+		};
+		pm8994_l4: l4 {
+			regulator-min-microvolt = <1225000>;
+			regulator-max-microvolt = <1225000>;
+		};
+		pm8994_l6: l6 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+		};
+		pm8994_l8: l8 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+		pm8994_l9: l9 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+		pm8994_l10: l10 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+		pm8994_l11: l11 {
+			regulator-min-microvolt = <1150000>;
+			regulator-max-microvolt = <1150000>;
+		};
+		pm8994_l12: l12 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+		pm8994_l13: l13 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2950000>;
+		};
+		pm8994_l14: l14 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+		pm8994_l15: l15 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+		pm8994_l16: l16 {
+			regulator-min-microvolt = <2700000>;
+			regulator-max-microvolt = <2700000>;
+		};
+		pm8994_l17: l17 {
+			regulator-min-microvolt = <2500000>;
+			regulator-max-microvolt = <2500000>;
+		};
+		pm8994_l18: l18 {
+			regulator-min-microvolt = <2700000>;
+			regulator-max-microvolt = <2900000>;
+		};
+		pm8994_l19: l19 {
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3000000>;
+		};
+		pm8994_l20: l20 {
+			regulator-min-microvolt = <2950000>;
+			regulator-max-microvolt = <2950000>;
+			regulator-allow-set-load;
+		};
+		pm8994_l21: l21 {
+			regulator-min-microvolt = <2950000>;
+			regulator-max-microvolt = <2950000>;
+			regulator-allow-set-load;
+			regulator-system-load = <200000>;
+		};
+		pm8994_l22: l22 {
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3300000>;
+		};
+		pm8994_l23: l23 {
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+		};
+		pm8994_l24: l24 {
+			regulator-min-microvolt = <3075000>;
+			regulator-max-microvolt = <3075000>;
+		};
+		pm8994_l25: l25 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-allow-set-load;
+		};
+		pm8994_l27: l27 {
+			regulator-min-microvolt = <1000000>;
+			regulator-max-microvolt = <1000000>;
+		};
+		pm8994_l28: l28 {
+			regulator-min-microvolt = <925000>;
+			regulator-max-microvolt = <925000>;
+			regulator-allow-set-load;
+		};
+		pm8994_l29: l29 {
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+		};
+		pm8994_l30: l30 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+		pm8994_l32: l32 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
 		};
 	};
+};
 
+/ {
 	usb2_id: usb2-id {
 		compatible = "linux,extcon-usb-gpio";
 		id-gpio = <&pmi8994_gpios 6 GPIO_ACTIVE_HIGH>;
diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index a297d3223161..48b5981d01b0 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -467,7 +467,7 @@
 
 		mboxes = <&apcs_glb 0>;
 
-		rpm_requests {
+		rpm_requests: rpm-requests {
 			compatible = "qcom,rpm-msm8996";
 			qcom,glink-channels = "rpm_requests";
 
@@ -509,57 +509,6 @@
 					};
 				};
 			};
-
-			pm8994-regulators {
-				compatible = "qcom,rpm-pm8994-regulators";
-
-				pm8994_s1: s1 {};
-				pm8994_s2: s2 {};
-				pm8994_s3: s3 {};
-				pm8994_s4: s4 {};
-				pm8994_s5: s5 {};
-				pm8994_s6: s6 {};
-				pm8994_s7: s7 {};
-				pm8994_s8: s8 {};
-				pm8994_s9: s9 {};
-				pm8994_s10: s10 {};
-				pm8994_s11: s11 {};
-				pm8994_s12: s12 {};
-
-				pm8994_l1: l1 {};
-				pm8994_l2: l2 {};
-				pm8994_l3: l3 {};
-				pm8994_l4: l4 {};
-				pm8994_l5: l5 {};
-				pm8994_l6: l6 {};
-				pm8994_l7: l7 {};
-				pm8994_l8: l8 {};
-				pm8994_l9: l9 {};
-				pm8994_l10: l10 {};
-				pm8994_l11: l11 {};
-				pm8994_l12: l12 {};
-				pm8994_l13: l13 {};
-				pm8994_l14: l14 {};
-				pm8994_l15: l15 {};
-				pm8994_l16: l16 {};
-				pm8994_l17: l17 {};
-				pm8994_l18: l18 {};
-				pm8994_l19: l19 {};
-				pm8994_l20: l20 {};
-				pm8994_l21: l21 {};
-				pm8994_l22: l22 {};
-				pm8994_l23: l23 {};
-				pm8994_l24: l24 {};
-				pm8994_l25: l25 {};
-				pm8994_l26: l26 {};
-				pm8994_l27: l27 {};
-				pm8994_l28: l28 {};
-				pm8994_l29: l29 {};
-				pm8994_l30: l30 {};
-				pm8994_l31: l31 {};
-				pm8994_l32: l32 {};
-			};
-
 		};
 	};
 
-- 
2.23.0

