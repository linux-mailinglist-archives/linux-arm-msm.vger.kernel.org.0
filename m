Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9409420F6C8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2020 16:09:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388661AbgF3OJj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Jun 2020 10:09:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388638AbgF3OJg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Jun 2020 10:09:36 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D644C03E979;
        Tue, 30 Jun 2020 07:09:36 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id d18so10715489edv.6;
        Tue, 30 Jun 2020 07:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bVQQTJXU6hJpQRkzdM4lyDkk+cMKxAXFIqG0ygvRxok=;
        b=SfHGeyk6zmICdMn/GLsq7lSISJo9s3/S8rwrpOzB13OFCF0I6r5KZMet6mQsHyFz+I
         NzFMOnN8/ORWPd8s8LLIORnOlrlIiKm/+kjhPCmAh9KOZe6uGZd8AF94cl3sxYxaYi4o
         xbPRX46EC1MwRZi01MMC3aTCofKys6gaNZoy4Z1BbWIDBrVIyWCeWe92RpxXB4E4mCag
         HNJzAT12Gug/lQ1PrJptiYKhjuViP1pG0jiP4gpX1TjMlI5iBz7HsLTQAXfG3E4VTuXR
         RZh0Svd26sYt/6znK6nTqdfWzKsHYxsKFC21TzrAcL71koJu5ueQxISKnmofOUIpotFJ
         MR/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bVQQTJXU6hJpQRkzdM4lyDkk+cMKxAXFIqG0ygvRxok=;
        b=Jf1meEnvjrITefjbD/ploR2wozRYZjX1ZhMIb8tKwHDpR1CBcnxitxPoMWorcSCp1+
         5vk1/2qTIfxr4LstzeodJOWMERcDv8VVowix7O3HNOYNaSsuTv9L9w32E+PXLLO5m8pH
         ADiiLtL/2cxBd/t7xmbr5W8/RNbiahcAzaT+YqxD2i376qhH70jk8DzdIvki2AOZVzU4
         oTwLjDvlDuOtiqL/TYSTi/oOtDqvQcAGwg3Pc8Jue8cmiaElaSLVxYlqO7o79dJ6Ts8B
         eIsosxrY9JSO2giiuEh4tkREP0pN890SWPrVy+k6KTQIGgBaaDH60q+UpvVq69lNadst
         mS4A==
X-Gm-Message-State: AOAM532pWJxG0+aBwCK0pgVHn520Nd4r8SSvWK++4VC+K+J1ij8iSjhJ
        Vt21qA8h8toMDzaF7emZOPk=
X-Google-Smtp-Source: ABdhPJyz0OMfOW/Xa88VFynWcMy1NSyPgY8PeKveBacdGW+P36+12SjlNLo9CurpHIz7wWhMzVn5gw==
X-Received: by 2002:a50:cd53:: with SMTP id d19mr23730475edj.300.1593526175005;
        Tue, 30 Jun 2020 07:09:35 -0700 (PDT)
Received: from localhost ([213.191.183.145])
        by smtp.gmail.com with ESMTPSA id se16sm2093611ejb.93.2020.06.30.07.09.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2020 07:09:34 -0700 (PDT)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        linux-arm-msm@vger.kernel.org,
        Iskren Chernev <iskren.chernev@gmail.com>
Subject: [PATCH 2/7] ARM: dts: qcom: msm8974-klte: Add support for touchkey
Date:   Tue, 30 Jun 2020 17:09:07 +0300
Message-Id: <20200630140912.260294-3-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200630140912.260294-1-iskren.chernev@gmail.com>
References: <20200630140912.260294-1-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for the touchkey found on the Samsung Galaxy S5. The
touchkey is responsible for handling the application and back buttons
found around the home button.

Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
---
 .../boot/dts/qcom-msm8974-samsung-klte.dts    | 44 ++++++++++++++++++-
 1 file changed, 43 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts b/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
index 9520c6e7910ce..750e2f261139a 100644
--- a/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
+++ b/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
@@ -145,7 +145,7 @@ pma8084_l18: l18 {
 					};
 
 					pma8084_l19: l19 {
-						regulator-min-microvolt = <2900000>;
+						regulator-min-microvolt = <3300000>;
 						regulator-max-microvolt = <3300000>;
 					};
 
@@ -203,6 +203,31 @@ pma8084_l27: l27 {
 		};
 	};
 
+	i2c-gpio-touchkey {
+		compatible = "i2c-gpio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		sda-gpios = <&msmgpio 95 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+		scl-gpios = <&msmgpio 96 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&i2c_touchkey_pins>;
+
+		touchkey@20 {
+			compatible = "cypress,tm2-touchkey";
+			reg = <0x20>;
+
+			interrupt-parent = <&pma8084_gpios>;
+			interrupts = <6 IRQ_TYPE_EDGE_FALLING>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&touchkey_pin>;
+
+			vcc-supply = <&max77826_ldo15>;
+			vdd-supply = <&pma8084_l19>;
+
+			linux,keycodes = <KEY_APPSELECT KEY_BACK>;
+		};
+	};
+
 	/delete-node/ vreg-boost;
 };
 
@@ -268,6 +293,15 @@ mux {
 				bias-disable;
 			};
 		};
+
+		i2c_touchkey_pins: i2c-touchkey {
+			mux {
+				pins = "gpio95", "gpio96";
+				function = "gpio";
+				input-enable;
+				bias-pull-up;
+			};
+		};
 	};
 
 	sdhci@f9824900 {
@@ -418,6 +452,14 @@ gpio_keys_pin_a: gpio-keys-active {
 				bias-pull-up;
 				power-source = <PMA8084_GPIO_S4>;
 			};
+
+			touchkey_pin: touchkey-int-pin {
+				pins = "gpio6";
+				function = "normal";
+				bias-disable;
+				input-enable;
+				power-source = <PMA8084_GPIO_S4>;
+			};
 		};
 	};
 };
-- 
2.27.0

