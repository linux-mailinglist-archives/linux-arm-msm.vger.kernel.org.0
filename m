Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD0BE20F6D8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2020 16:10:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388729AbgF3OKH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Jun 2020 10:10:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388654AbgF3OJi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Jun 2020 10:09:38 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6ED84C061755;
        Tue, 30 Jun 2020 07:09:38 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id ga4so20749001ejb.11;
        Tue, 30 Jun 2020 07:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=H/evTaw/z01ZGDeG0L9HG7odwSXvoYGd70EVEtMJgyw=;
        b=GQg6MbdtC7O/JksYFnsXCQUa7VM8GqRFaJ7o8tcCki5SbVvNanFklIHngwm1SCsdqC
         TiCNmopPL1Snjo7Fdp4DTuoud9uG2t5ZbHcB+yD2UD+nJPL6amp/HOxMecS6EZs6Ds3V
         cEGwKV7X36jt39dHe/Lhe7DxJtDdcoSS3BM1ufWuJhYrCUwaWl0kamfYurWYaGbaPLXs
         vVdxw3V1aSUlRPXyqc2mtIZ7pI7aaK2Z1ru9CkXNoq7zo7hJAAMzwv55RCLXIJbH9/SB
         TPhpEXceHaEjSDLRP/rNok1EhUfP8FXZnsD9Pqg0ZAxb+y9elKXyFHc4UeI/Lt8GYk/E
         X8XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=H/evTaw/z01ZGDeG0L9HG7odwSXvoYGd70EVEtMJgyw=;
        b=qKEmkcxd6EBBHDiigRWtySxHT+cID03D8BeAVH8oqusKDoQ3WWg15XW3nOkqt+gfbp
         lpBl3ogqtNKDDbWRVICyNbD66LBxXuVTZ0X/uBBP6M0Io8kjZm+DUmF+40BfjRGPAyyk
         LTSrqVKB/usRa6//tcND1sgTFtYVSaU1C3NXLZhvQiEW3hYwVr1pu9Og4A0SiQHLNZ+w
         kBaLI9blgu59MTV/55i1glQB3413u9qbkB9r2+dHbIFuYVDw7yx7VZmeShzzR/g+N+Fl
         cGBv0WDV1lcj0VJPKjAGSXvUjERCAnZvMCDIWGNAW7gH2WOBHG65G4XLOMDSVWDDMBIM
         JWIg==
X-Gm-Message-State: AOAM530U7CCpOsMhN7YdCYkP3Yu7zdP3Tl0ixgBl3IUA/+WMM6bUA4t3
        L+BH9HBoInWmKeQu/nkO58Y=
X-Google-Smtp-Source: ABdhPJxbREhkDAOSI8igfNmrRTf/zORHDkDfanfv8ux3Hn4L44dxoCoo9pmVHaHGHVli3Hb61tBPpQ==
X-Received: by 2002:a17:906:970a:: with SMTP id k10mr19194276ejx.236.1593526177178;
        Tue, 30 Jun 2020 07:09:37 -0700 (PDT)
Received: from localhost ([213.191.183.145])
        by smtp.gmail.com with ESMTPSA id n5sm2132704eja.70.2020.06.30.07.09.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2020 07:09:36 -0700 (PDT)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        linux-arm-msm@vger.kernel.org,
        Iskren Chernev <iskren.chernev@gmail.com>
Subject: [PATCH 3/7] ARM: dts: qcom: msm8974-klte: Add support for touchscreen
Date:   Tue, 30 Jun 2020 17:09:08 +0300
Message-Id: <20200630140912.260294-4-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200630140912.260294-1-iskren.chernev@gmail.com>
References: <20200630140912.260294-1-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for the touchscreen found on the Samsung Galaxy S5.

Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
---
 .../boot/dts/qcom-msm8974-samsung-klte.dts    | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts b/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
index 750e2f261139a..085636f182d01 100644
--- a/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
+++ b/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
@@ -284,6 +284,16 @@ cmd-data {
 			};
 		};
 
+		i2c2_pins: i2c2 {
+			mux {
+				pins = "gpio6", "gpio7";
+				function = "blsp_i2c2";
+
+				drive-strength = <2>;
+				bias-disable;
+			};
+		};
+
 		i2c6_pins: i2c6 {
 			mux {
 				pins = "gpio29", "gpio30";
@@ -342,6 +352,42 @@ phy@a {
 		};
 	};
 
+	i2c@f9924000 {
+		status = "okay";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&i2c2_pins>;
+
+		touchscreen@20 {
+			compatible = "syna,rmi4-i2c";
+			reg = <0x20>;
+
+			interrupt-parent = <&pma8084_gpios>;
+			interrupts = <8 IRQ_TYPE_EDGE_FALLING>;
+
+			vdd-supply = <&max77826_ldo13>;
+			vio-supply = <&pma8084_lvs2>;
+
+			pinctrl-names = "default";
+			pinctrl-0 = <&touch_pin>;
+
+			syna,startup-delay-ms = <100>;
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			rmi4-f01@1 {
+				reg = <0x1>;
+				syna,nosleep-mode = <1>;
+			};
+
+			rmi4-f12@12 {
+				reg = <0x12>;
+				syna,sensor-type = <1>;
+			};
+		};
+	};
+
 	i2c@f9928000 {
 		status = "okay";
 
@@ -460,6 +506,14 @@ touchkey_pin: touchkey-int-pin {
 				input-enable;
 				power-source = <PMA8084_GPIO_S4>;
 			};
+
+			touch_pin: touchscreen-int-pin {
+				pins = "gpio8";
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

