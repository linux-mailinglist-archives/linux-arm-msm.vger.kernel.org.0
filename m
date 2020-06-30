Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C60A520F6D0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2020 16:10:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388732AbgF3OJu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Jun 2020 10:09:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388638AbgF3OJo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Jun 2020 10:09:44 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE044C061755;
        Tue, 30 Jun 2020 07:09:43 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id o18so16349067eje.7;
        Tue, 30 Jun 2020 07:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tl9JWQ8+j2DoVhTG+CwFOZrvxvIZ9+gVkhBo8fcxQrc=;
        b=e5jyJSNB6SHcJf/l2KeBi2t0RLs72qjp8/4xOzi1WV4pX8DpnqNXNv0BFP4Njv359K
         Whl6slgbEf9Ftlxow+ziSVVGQnSEqmzfWiTvFhnBN3ntlOk0amVPqy9gmqu4UeS61quA
         tQ7LlDsoIJQPoS2jNzn4kZSdpCv7EK2NaDLD0JOComaW2C308hLkXIynlAoeNgBk7/+i
         WF9ySiIvh6bxVgfFqOCsBOYhMsERt05i65lzKkqj6zeCDlEpgVRO5DMtAQ+aXs+6JTQb
         S3/TFk4w1sDNsRoz2gNk6LLxTVeMxLky64dqq6u7c3iYWFgj6ljFLsCI7IysYw/LPmdk
         g3mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tl9JWQ8+j2DoVhTG+CwFOZrvxvIZ9+gVkhBo8fcxQrc=;
        b=qkaB894MLnhGtt0d0tGhRcrV45XYmyZzlLYSAbuFS8ssBMT414eZm2PksYwVCw7wrr
         Oh+Pmja2Tc6zS+26dB+jwmJdU0QCwLMhsvnTFLo9umyWXIeMh86WMPffVJ4z/W5wzI84
         Pq3FNlk84vyPYZs7Re6pEPU1Efoq87h2ZyQuWdHRaRlKP7p+bDCa0naBbR2es3WV2Zo/
         fZclSB/tcbjaXaP9rWwB2cWrQ12ebmZ/uJpDT3Ouj5hoWLnu65WKp8AXArdwuZukKKhr
         BGH/lZJjarlntm+xpDqq367Jiuhlf+w0xE1NBgZPNxV32qRCXsPQjEliQ1ELnUcjnf70
         xzow==
X-Gm-Message-State: AOAM533Wdd0gV63tKsChKo69/BchzyegsahxjcvPo7POgmI/uIciRD2t
        +kFBDUI4y2MfvHRuj021SnfQsVpUnjc=
X-Google-Smtp-Source: ABdhPJzjzUnn8P5o+WV/Ymhan4pwv340Mg/Uk2F+BT4HxAwWEYY81Ndd3rkmEhEc3zIBmtQ1BPNKrA==
X-Received: by 2002:a17:906:8595:: with SMTP id v21mr19027398ejx.333.1593526182563;
        Tue, 30 Jun 2020 07:09:42 -0700 (PDT)
Received: from localhost ([213.191.183.145])
        by smtp.gmail.com with ESMTPSA id i10sm2833738edx.42.2020.06.30.07.09.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2020 07:09:41 -0700 (PDT)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        linux-arm-msm@vger.kernel.org,
        Iskren Chernev <iskren.chernev@gmail.com>
Subject: [PATCH 5/7] ARM: dts: qcom: msm8974-klte: Add gpio expander chip
Date:   Tue, 30 Jun 2020 17:09:10 +0300
Message-Id: <20200630140912.260294-6-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200630140912.260294-1-iskren.chernev@gmail.com>
References: <20200630140912.260294-1-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Samsung Galaxy S5 has a GPIO Expander chip, the PCAL6416A with 16
ports on a i2c bus. These pins are used for WiFi, NFC, IR among other
things.

Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
---
 .../boot/dts/qcom-msm8974-samsung-klte.dts    | 29 +++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts b/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
index 7b398da9b75ed..29099b83b231d 100644
--- a/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
+++ b/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
@@ -236,10 +236,25 @@ i2c-gpio-led {
 		scl-gpios = <&msmgpio 121 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 		sda-gpios = <&msmgpio 120 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 		pinctrl-names = "default";
-		pinctrl-0 = <&i2c_led_pins>;
+		pinctrl-0 = <&i2c_led_gpioex_pins>;
 
 		i2c-gpio,delay-us = <2>;
 
+		gpio_expander: gpio@20 {
+			compatible = "nxp,pcal6416";
+			reg = <0x20>;
+
+			gpio-controller;
+			#gpio-cells = <2>;
+
+			vcc-supply = <&pma8084_s4>;
+
+			pinctrl-names = "default";
+			pinctrl-0 = <&gpioex_pin>;
+
+			reset-gpios = <&msmgpio 145 GPIO_ACTIVE_LOW>;
+		};
+
 		led-controller@30 {
 			compatible = "panasonic,an30259a";
 			reg = <0x30>;
@@ -352,7 +367,7 @@ mux {
 			};
 		};
 
-		i2c_led_pins: i2c-led {
+		i2c_led_gpioex_pins: i2c-led-gpioex {
 			mux {
 				pins = "gpio120", "gpio121";
 				function = "gpio";
@@ -360,6 +375,16 @@ mux {
 				bias-pull-down;
 			};
 		};
+
+		gpioex_pin: gpioex {
+			res {
+				pins = "gpio145";
+				function = "gpio";
+
+				bias-pull-up;
+				drive-strength = <2>;
+			};
+		};
 	};
 
 	sdhci@f9824900 {
-- 
2.27.0

