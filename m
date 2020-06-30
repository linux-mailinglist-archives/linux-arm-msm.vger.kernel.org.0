Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8416620F6CA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2020 16:09:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388713AbgF3OJp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Jun 2020 10:09:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388702AbgF3OJl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Jun 2020 10:09:41 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E994CC061755;
        Tue, 30 Jun 2020 07:09:40 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id b15so16357354edy.7;
        Tue, 30 Jun 2020 07:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=H4LGdvk0FVAQdM2GrebNjyfNyEq8Tyh1403AEfTeuTk=;
        b=CgFsxulLT0QQqHs4gyD5P8rHQCAJk17YgCsWjk+6SgJCzjvgFW3ByQtPLmLiqXnV+y
         gE32V9IZqQp75Iz3wioCM+HwDnRw0I5kkq2xT8MqyLc1zbb9UeoJcqTwtGT47RPaBCbC
         6LZejaYMIkv9156vCdZi/konj55KEyIUpD80Y5xIEGvys1u9kyOkXC+Zlu1Jbczk0q0r
         +k+CS2PTkYwz9TiBGb9yInY+M/QJYV0Oe4kKuRzYB2691aRBvBwCl/JFEhCGdJWEz4hq
         C7EPzu5zeVx3YD6oVTjpdf8dHMBb/3KSrujZlk5/Yt6V7J1azELw5AjNZNRlQxOHblse
         rwVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=H4LGdvk0FVAQdM2GrebNjyfNyEq8Tyh1403AEfTeuTk=;
        b=WcSs68ZczFRVyKtZmuFIKGZRTdyk94wlQ7EzrddFuaZu56ajE8vy2enNEw0zOLd3qb
         vqlsR1hgccXv8cT3XHZs5qxxqj7zT5hM8tFkW1fa87AIBo/eZVqmDqogGCBV0ij6M+YF
         vcF2d/Qet83cJfv621gyuZb+iN8V8gOOcCmLwUD/4qhrQZt3A63TAsHGNXK2AFi+tWzE
         CnbTVYpIFFzOsOkLmz+Xv+UTMPFtIhFedx/rpaQueRIHgsaSTimm57myYzxO2wdzFBme
         nIq+fcr3oRVmqHKooMfqcYiVmzKwWxtjtTkxlAN1G9d/IDVWHEnyQwmvWgTc8OeIWH5D
         Ig2Q==
X-Gm-Message-State: AOAM532eLQ37TyjVSWJah3u6OmpHygAbRP/fjNqzu28vESw0V4x5X3jH
        /8shDhffxP6DYzk3fI8uB4Q=
X-Google-Smtp-Source: ABdhPJwT2VUnfj3SZl74nR2WzGYIkpyKPP1BljDzQ4r+Kh5w2A0iN4qN9Uc95LlIfhtiQG8HuZcwXQ==
X-Received: by 2002:aa7:c614:: with SMTP id h20mr23233979edq.29.1593526179698;
        Tue, 30 Jun 2020 07:09:39 -0700 (PDT)
Received: from localhost ([213.191.183.145])
        by smtp.gmail.com with ESMTPSA id y7sm2844372edq.25.2020.06.30.07.09.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2020 07:09:39 -0700 (PDT)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        linux-arm-msm@vger.kernel.org,
        Iskren Chernev <iskren.chernev@gmail.com>
Subject: [PATCH 4/7] ARM: dts: qcom: msm8974-klte: Add support for led
Date:   Tue, 30 Jun 2020 17:09:09 +0300
Message-Id: <20200630140912.260294-5-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200630140912.260294-1-iskren.chernev@gmail.com>
References: <20200630140912.260294-1-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
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
2.27.0

