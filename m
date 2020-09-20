Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BCBF271518
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Sep 2020 16:50:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726470AbgITOuE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 20 Sep 2020 10:50:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726267AbgITOuE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 20 Sep 2020 10:50:04 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25995C061755;
        Sun, 20 Sep 2020 07:50:04 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id b79so10045933wmb.4;
        Sun, 20 Sep 2020 07:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=h2wWpICzgnNUz1U0TQzbZBt177gfOvZMnGNmP05J8cY=;
        b=N/wVTkBYQwtZjNi60vjmgaP1A7JP7SF/XQd8nZtFsowysn1TwIILJ+cEXD/6nDrADq
         1v3m1+m67JIWMiU9DqSrkwWQS3TEe2T/JHeSdJd580zen3W5Ar2uThhBdF89cBxD2m6j
         lX2UTYzu2uGR6LkETLuN3sOw0qh4wSWqdsRTCIkzuPEOwTY/2UiLVzh7vWQy0DsHri9c
         18sAJQxt2iD+Eznl3yHVUxNPwNRmME17VxoKN6h/CSU0F4tfEZKHsrdAVNhwxA0YnlUa
         oJuBYTX0YqrLigO8hUxbjcEN0/+VR7rh94RexZdQ1xafN3jEDaLb09aS9S9g1JgMBI0A
         fbSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=h2wWpICzgnNUz1U0TQzbZBt177gfOvZMnGNmP05J8cY=;
        b=Bga2ZcUq+zrG4WngowrRKqFzGtKAFtDik9l9OhEKvQKPIMADp4e3v1ASWRa8rLileP
         O1aA9FbJ8gNrW+XSy2Nh5qJLhSCqSi2yLE02RCqH4SIsT4nb8FCZRYj4cL7o615z/KlP
         zE10Xv4L7pRaOi6NxjmKegd3AIDCr7PmxpbUIpgb5d1mWFr2+G8GXWFMIr8Friy48aST
         NOGLM8iqQUJkQWFXGRHD91J72UYsWf3NFyCI9OB1R3Utr9SUD9IKRuoWb46TIX6ZhKbr
         UXrpsOuJGuaZi/iscSmcNKl0pRc5wg67s9eZ2yad+GT+kgGiL2vG74I/bzHJm/PPHXk0
         Nz9Q==
X-Gm-Message-State: AOAM532YVHluPJWuYiWJ5+u28N4vrDPDsogn4o/+IK2Z0KFPFPk9HCKR
        7ouCGefV96UlRegbBI/4+DY=
X-Google-Smtp-Source: ABdhPJxUuiEpxPZ8JuzC8LXtmeIjEbHzKB52yyYj3bRnVGXtKxynRR7X0jEFu4M+jkRds9uWuGN0Bg==
X-Received: by 2002:a1c:152:: with SMTP id 79mr25588950wmb.90.1600613402896;
        Sun, 20 Sep 2020 07:50:02 -0700 (PDT)
Received: from localhost (178-169-161-196.razgrad.ddns.bulsat.com. [178.169.161.196])
        by smtp.gmail.com with ESMTPSA id g8sm14090878wmd.12.2020.09.20.07.50.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Sep 2020 07:50:02 -0700 (PDT)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        linux-arm-msm@vger.kernel.org,
        Iskren Chernev <iskren.chernev@gmail.com>
Subject: [PATCH RESEND 4/7] ARM: dts: qcom: msm8974-klte: Add support for led
Date:   Sun, 20 Sep 2020 17:48:56 +0300
Message-Id: <20200920144859.813032-5-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200920144859.813032-1-iskren.chernev@gmail.com>
References: <20200920144859.813032-1-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The klte uses a Panasonic AN30259A LED controller for it's indicator
led.

Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
---
 .../boot/dts/qcom-msm8974-samsung-klte.dts    | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts b/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
index 085636f182d01..7b398da9b75ed 100644
--- a/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
+++ b/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
@@ -4,6 +4,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
+#include <dt-bindings/leds/common.h>
 
 / {
 	model = "Samsung Galaxy S5";
@@ -228,6 +229,44 @@ touchkey@20 {
 		};
 	};
 
+	i2c-gpio-led {
+		compatible = "i2c-gpio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		scl-gpios = <&msmgpio 121 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+		sda-gpios = <&msmgpio 120 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&i2c_led_pins>;
+
+		i2c-gpio,delay-us = <2>;
+
+		led-controller@30 {
+			compatible = "panasonic,an30259a";
+			reg = <0x30>;
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			led@1 {
+				reg = <1>;
+				function = LED_FUNCTION_STATUS;
+				color = <LED_COLOR_ID_RED>;
+			};
+
+			led@2 {
+				reg = <2>;
+				function = LED_FUNCTION_STATUS;
+				color = <LED_COLOR_ID_GREEN>;
+			};
+
+			led@3 {
+				reg = <3>;
+				function = LED_FUNCTION_STATUS;
+				color = <LED_COLOR_ID_BLUE>;
+			};
+		};
+	};
+
 	/delete-node/ vreg-boost;
 };
 
@@ -312,6 +351,15 @@ mux {
 				bias-pull-up;
 			};
 		};
+
+		i2c_led_pins: i2c-led {
+			mux {
+				pins = "gpio120", "gpio121";
+				function = "gpio";
+				input-enable;
+				bias-pull-down;
+			};
+		};
 	};
 
 	sdhci@f9824900 {
-- 
2.28.0

