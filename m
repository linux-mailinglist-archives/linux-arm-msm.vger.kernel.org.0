Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 579B0271513
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Sep 2020 16:49:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726401AbgITOtz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 20 Sep 2020 10:49:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726267AbgITOtz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 20 Sep 2020 10:49:55 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D1F6C061755;
        Sun, 20 Sep 2020 07:49:55 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id w5so10156227wrp.8;
        Sun, 20 Sep 2020 07:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Hei6sj5lGVKAkNipIDZoLNgw3wuVuVHq++DYxzcFE0M=;
        b=Up2aj3nmEOdOe/bD5Sq7+2cIxB7LAwT8pWsisJaG/NY3NalkggQRU0C5fpjbNbjHOf
         3PtHHC2jtIGSLxYdCYwjqJLwe3YkdVUxZHON2er7Q6HGuInXx1V+KphDD2d95NCXBhQ9
         UHjhvsoZlyowhD4FOMHyF0TLDNhg/5d8u6ShkxC2BRJpY77GUDpN0ngJlUHqCBXf+RPa
         ySyNKeJ7/W/zt+Cv8WjPC1ig9bFD6sAi9nV6a4Vdwirgq5H/GqSLU6gAj5qZCxcgVYbt
         3lM+8W9YhTfPZpFvDauY8kZ0m+IUS3F98Ha9anieoC9UDLjDob5F789BNUyrF73FADMV
         jp9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Hei6sj5lGVKAkNipIDZoLNgw3wuVuVHq++DYxzcFE0M=;
        b=NtMr+Fh8ZNnSVwbkSNmOScJ04dNgA/rCX2ZOeLi7v3+j2RvQtTjSrENqqF7xD9ImIf
         zUKHy0ZHRRua+yPYGUpdgZvKxB7e/nIcA2TpOWEzPgD4on4RSR789ISBWU5uUA54moON
         pUgZgrFhA725mEEQzZCcXzOVnyht2ugu+ehpNaI5N9TvOvGAXtUbZ05pRIbZIkHsX50o
         6khZNpr7oeLVDbuKJzDZWs/UxlofIBovDc2PVUpdUKBolIcP/GRjoKrHhBg3js2KKcWX
         hqfN9eX+Jt6Qs+SS9TfxxZC9283xsdA8fRh5o5uUlhhKDEaiN4zhVIj531ClAWGHaHib
         tZWA==
X-Gm-Message-State: AOAM533bwX7kiSKVC3XB5gS9QwBxPYzTwtcklc7/qmoNlX7GBwCb/nfD
        omp3s1V0ca2pkblU5ilrLm0=
X-Google-Smtp-Source: ABdhPJx2cHC/VPuCY1cPyWzXLy1DDrHdj6WWDnW7r+uLOenNchGbDDWQkXsxAL2V/eH39mu5A/zpzQ==
X-Received: by 2002:adf:9405:: with SMTP id 5mr24564081wrq.51.1600613393995;
        Sun, 20 Sep 2020 07:49:53 -0700 (PDT)
Received: from localhost (178-169-161-196.razgrad.ddns.bulsat.com. [178.169.161.196])
        by smtp.gmail.com with ESMTPSA id c25sm14629877wml.31.2020.09.20.07.49.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Sep 2020 07:49:53 -0700 (PDT)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        linux-arm-msm@vger.kernel.org,
        Iskren Chernev <iskren.chernev@gmail.com>
Subject: [PATCH RESEND 2/7] ARM: dts: qcom: msm8974-klte: Add support for touchkey
Date:   Sun, 20 Sep 2020 17:48:54 +0300
Message-Id: <20200920144859.813032-3-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200920144859.813032-1-iskren.chernev@gmail.com>
References: <20200920144859.813032-1-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
2.28.0

