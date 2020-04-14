Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B94F51A8767
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2020 19:24:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407659AbgDNRXm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Apr 2020 13:23:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2407654AbgDNRXl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Apr 2020 13:23:41 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0088DC061A0C;
        Tue, 14 Apr 2020 10:23:40 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id l14so659294ljj.5;
        Tue, 14 Apr 2020 10:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=K+oWkwpXyNNFimgUSFgG1jkwmIfT4ADb+XI7Ut8Zv0Y=;
        b=QwwrqjZDHlh9J8PBS5HJxe9tmEvIlNakfU919mjjz+pdGr+vSKcobhO2gK40YWnkZA
         5x8jdsUPQ8eAbAawU0NWSXpR19j50meEnq+rTKGIFhwPC4ZDi4BFVxTTY4Rr9MeZy2l6
         ZMZmZgNRqWe8AbYRNEGkBACm33jeuOCJ8MYuILnW5yhuMzIjLNL0BrN0i2xmZbNdL20x
         McAkluZ6D3WLSGOX3dvGSjVwxbhk2jlwoe0V+koBM9VSEoECD4klA/pxoOkeu3vrSyuZ
         ephvcBzgtdjcNcJJVXggnAcGJeIqeNhhcMJw4U6k81Iz59bIqrHjn9DGtuYIZAxSO+W4
         /aSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=K+oWkwpXyNNFimgUSFgG1jkwmIfT4ADb+XI7Ut8Zv0Y=;
        b=KuyOLce1LVfwUpcOZWxyNM2V0A0LeHxNk+gFUG0HzAn0PNOPmCf9DcnscLsgWwHtU2
         mP4qxK6tMCNSg3l6ShDgcmX/wqqqZWNxEOJ96j/7KDLxXwHL9jCqddwutE8kVtILRbw0
         4TCBUXmO7PGS27wiAKwjT0klj/O6YryjKZy4G1JFm8Sz1poJRfsGyuGX44DVe1NaEJYF
         gjSlqoag9mrolKeZyyn0elU7/8CHL2SoK+nY7C6ue1AzexFN9+j4ynIuIQc62I6uAT0m
         X3/bicIUPn4QHlbyna8CtqoPotyEwvoykaT4WAgoCMR0BbIQoxu0X2CYUeHvf25pVKYu
         lx1g==
X-Gm-Message-State: AGi0PubLqlkcuN1hl99qHqSe59eUxTojPyz03uloDLJhUeecEGuJAzo2
        /os2TcWYWnp6AaD9ciL2QaTEg4eJfjbOZA==
X-Google-Smtp-Source: APiQypLAU1SjIDPk067UihTLYs9vY3h7H/v2/+JAsSR7mX9aKg/hiQe92RQvh8cukXPAlwKhAE7N/Q==
X-Received: by 2002:a2e:5746:: with SMTP id r6mr705204ljd.15.1586885018770;
        Tue, 14 Apr 2020 10:23:38 -0700 (PDT)
Received: from localhost ([213.191.183.145])
        by smtp.gmail.com with ESMTPSA id c21sm10687273lfh.16.2020.04.14.10.23.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2020 10:23:37 -0700 (PDT)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
        linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        Iskren Chernev <iskren.chernev@gmail.com>
Subject: [PATCH v2 3/3] ARM: dts: qcom: msm8974-klte: Add max77826 pmic node
Date:   Tue, 14 Apr 2020 20:22:50 +0300
Message-Id: <20200414172250.2363235-4-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200414172250.2363235-1-iskren.chernev@gmail.com>
References: <20200414172250.2363235-1-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This introduces the MAX77826 PMIC that powers some pheripherals on the
klte, like the touchpad, touchkeys and camera.

Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
---
 .../boot/dts/qcom-msm8974-samsung-klte.dts    | 110 ++++++++++++++++++
 arch/arm/boot/dts/qcom-msm8974.dtsi           |  11 ++
 2 files changed, 121 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts b/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
index eaa1001d0a46..d5697218caf6 100644
--- a/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
+++ b/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
@@ -21,4 +21,114 @@ serial@f991e000 {
 		status = "ok";
 	};
 
+	pinctrl@fd510000 {
+		i2c6_pins: i2c6 {
+			mux {
+				pins = "gpio29", "gpio30";
+				function = "blsp_i2c6";
+
+				drive-strength = <2>;
+				bias-disable;
+			};
+		};
+	};
+
+	i2c@f9928000 {
+		status = "okay";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&i2c6_pins>;
+
+		pmic@60 {
+			reg = <0x60>;
+			compatible = "maxim,max77826";
+
+			regulators {
+				max77826_ldo1: LDO1 {
+					regulator-min-microvolt = <1200000>;
+					regulator-max-microvolt = <1200000>;
+				};
+
+				max77826_ldo2: LDO2 {
+					regulator-min-microvolt = <1000000>;
+					regulator-max-microvolt = <1000000>;
+				};
+
+				max77826_ldo3: LDO3 {
+					regulator-min-microvolt = <1200000>;
+					regulator-max-microvolt = <1200000>;
+				};
+
+				max77826_ldo4: LDO4 {
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+				};
+
+				max77826_ldo5: LDO5 {
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+				};
+
+				max77826_ldo6: LDO6 {
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <3300000>;
+				};
+
+				max77826_ldo7: LDO7 {
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+				};
+
+				max77826_ldo8: LDO8 {
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <3300000>;
+				};
+
+				max77826_ldo9: LDO9 {
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+				};
+
+				max77826_ldo10: LDO10 {
+					regulator-min-microvolt = <2800000>;
+					regulator-max-microvolt = <2950000>;
+				};
+
+				max77826_ldo11: LDO11 {
+					regulator-min-microvolt = <2700000>;
+					regulator-max-microvolt = <2950000>;
+				};
+
+				max77826_ldo12: LDO12 {
+					regulator-min-microvolt = <2500000>;
+					regulator-max-microvolt = <3300000>;
+				};
+
+				max77826_ldo13: LDO13 {
+					regulator-min-microvolt = <3300000>;
+					regulator-max-microvolt = <3300000>;
+				};
+
+				max77826_ldo14: LDO14 {
+					regulator-min-microvolt = <3300000>;
+					regulator-max-microvolt = <3300000>;
+				};
+
+				max77826_ldo15: LDO15 {
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+				};
+
+				max77826_buck: BUCK {
+					regulator-min-microvolt = <1225000>;
+					regulator-max-microvolt = <1225000>;
+				};
+
+				max77826_buckboost: BUCKBOOST {
+					regulator-min-microvolt = <3400000>;
+					regulator-max-microvolt = <3400000>;
+				};
+			};
+		};
+	};
 };
diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index 2ea2308d91b3..51f5f904f9eb 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -974,6 +974,17 @@ blsp_i2c3: i2c@f9925000 {
 			#size-cells = <0>;
 		};
 
+		blsp_i2c6: i2c@f9928000 {
+			status = "disabled";
+			compatible = "qcom,i2c-qup-v2.1.1";
+			reg = <0xf9928000 0x1000>;
+			interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_QUP6_I2C_APPS_CLK>, <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
 		blsp_i2c8: i2c@f9964000 {
 			status = "disabled";
 			compatible = "qcom,i2c-qup-v2.1.1";
-- 
2.26.0

