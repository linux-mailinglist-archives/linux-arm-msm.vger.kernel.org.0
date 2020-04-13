Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 269351A6A2A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2020 18:45:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731749AbgDMQpU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Apr 2020 12:45:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1731735AbgDMQpN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Apr 2020 12:45:13 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 880D2C0A3BDC;
        Mon, 13 Apr 2020 09:45:13 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id 131so7017530lfh.11;
        Mon, 13 Apr 2020 09:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2YVpEsdAD3gdou5O12iibPQ3XhGh37dAHJSGf0NXN0w=;
        b=YP83sfYkJzjjL19EAeyMmpmI97iR/GfkRrCy6ay6bm3o6v6P9RxZbQiSkOfz+GbOmY
         DTqA1h9WVANaT5ADT/C+SLfLBfwZCEsrB9bsHsTNBIEQyZ18pOBwJmbvApGhxBhY86KK
         67jaP7Y031u5l3u7dBNCAYL+Bhv0alpKIjvw0/1dW3bISdLgMwxZz0b07ZsiOap82ulA
         7ulpP1iRJECuGuPeXn840GpJJ3JzhJctzeYYEsZkL+1biT4EKtLUug2DMKTnvmAsS0dP
         ysjZWFSHzAybk9J8CT4rOHJ3w1S1qxgeMeNdtEZva3xr8iAOa5ej2s357w2AaPS0h0US
         VEKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2YVpEsdAD3gdou5O12iibPQ3XhGh37dAHJSGf0NXN0w=;
        b=r28lMVNblZZeTmm9KI5NHmUks5fRu3985SM+vs2WIiXOv15yk/hZMIAOKBzbBwlZ54
         IxJzvOo6yZ8DxDs9athPeMEVcVrYJ04wdfaHjxXtNs3CgJkzjJQxtIgB3RNfEhsqZ5Oe
         ug6wwfHCRFxHwwgwrWWHeJKVdmExen1Xq0cLwTxsat/KdDAdH0Q7uxKLuVeVr11OfFNl
         Xq90MaXgX2ZZzKgJ7coOtLPfNbYaAdcGU2/hXbnvvmZYQstwZBVLgMyAcPx6RIV1CT81
         8grQ5iXrapT6wiVI1ieXdCLRFnhPJnqYqpT9ayCjtj5EE0e4qcD1mKCLrBiz04iponwd
         aBYg==
X-Gm-Message-State: AGi0PuZ9zPrv7hu11SxGrj0l8mKosuP/taVVRjn4gZwRSz8Llm1DsBA3
        UI1wQdhEsSUuN0VdCQ7xzy/HOOhG6t8S8g==
X-Google-Smtp-Source: APiQypJniJ22q9ejT6dHNBXLjaeOMXx81p9W4vXAMZiLxguhcg8uVdZVBz7Hmz6Om+kNT50l6LRtYA==
X-Received: by 2002:a05:6512:1109:: with SMTP id l9mr2428352lfg.12.1586796311588;
        Mon, 13 Apr 2020 09:45:11 -0700 (PDT)
Received: from localhost ([213.191.183.145])
        by smtp.gmail.com with ESMTPSA id f4sm2256280lfa.24.2020.04.13.09.45.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2020 09:45:10 -0700 (PDT)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
        linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        Iskren Chernev <iskren.chernev@gmail.com>
Subject: [PATCH 3/3] ARM: dts: qcom: msm8974-klte: Add max77826 pmic node
Date:   Mon, 13 Apr 2020 19:44:40 +0300
Message-Id: <20200413164440.1138178-4-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200413164440.1138178-1-iskren.chernev@gmail.com>
References: <20200413164440.1138178-1-iskren.chernev@gmail.com>
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
index eaa1001d0a46..f6d3a9dcf0de 100644
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
+			compatible = "maxim,max77826-regulator";
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

