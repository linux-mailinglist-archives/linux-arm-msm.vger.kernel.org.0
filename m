Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3225B2B2328
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Nov 2020 18:59:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726315AbgKMR75 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Nov 2020 12:59:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725959AbgKMR74 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Nov 2020 12:59:56 -0500
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F32AFC0617A6;
        Fri, 13 Nov 2020 09:59:55 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id s30so15199709lfc.4;
        Fri, 13 Nov 2020 09:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7IqPKnon9PBFfN82ZaDympHcSxyFLtqdhUCBmIyNsiE=;
        b=YWa73Fb/upJ8f/XPEQaCmiVDRymeUjtUc6TfiGM5tYZUY+DvySHzJCuc+CBeH2oReC
         ggth6z8+VTvQ43rqRJsE5sOQXZrGIJJabdNH9L3M7KKt+/PkHSMUeRXov8qnTMwLNUni
         Zm/ybvm52NHFyz4HzufSN/xWxhulUOzMxdeWu9qloKi4hZ6HFT3LxqR39YgvoE0aZpuM
         Bdp25fIQIXWBDfqwAOmYGNbcWVRQcv5BQ5o8C51svAarwtBpRdpwfkNVJF38rklHQI6r
         WgM/pJDBcUKaITDHhL0n0LHiru+zIEfP+EflmIL7109bWnfqgdbhnaSLGPTM4ZyldjeZ
         lCOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7IqPKnon9PBFfN82ZaDympHcSxyFLtqdhUCBmIyNsiE=;
        b=bHkMOiiteDZp3ARjWq40uJoFISxMzIrQYOPcBGO3z9vCWtKvelI6ijKJmObOmXQTlk
         51H2HjHeXD8xyHVcvXzxwNhjvj0XkhvR6OB2Byek18RbbQx2Q9SW7vkzMDTQQBN5drU4
         2xnD21SZkfmkRKAgYUTu2hu0nyVuOXSbqN5okdtewAmCtzqSk1ppuM6HbqZp7Wf0cduj
         h04q8E6uIHgfo80BleM+RK+ceIgJvS7kdsrZo3nxKiBdaMnM4DOVvLrPlXEoRB/fGBzO
         07HX1vV/xBnz+byeqOy/gVlhS8ol0MPvz2NEhbhp+se8UoD5UgY2bwlaG51r4Oay3C6Z
         uwUg==
X-Gm-Message-State: AOAM530tfMO2N3XhOg/hnqRhgikY8tDV9mwq8F5oNJcSPj4x5dfIp2XG
        guvY5BLJmOhwft8OqF6xeTQ=
X-Google-Smtp-Source: ABdhPJxcHK0RJvuhMRiiaf6+gECsOeUDo8V0/2RvUtwpporqEadoUATOKR1B2ZMgt+6D4/IctOJpVw==
X-Received: by 2002:a19:dca:: with SMTP id 193mr1316421lfn.107.1605290394239;
        Fri, 13 Nov 2020 09:59:54 -0800 (PST)
Received: from localhost.localdomain ([2a01:540:2326:b00:1d75:252:b367:4629])
        by smtp.gmail.com with ESMTPSA id c1sm1629363lfj.222.2020.11.13.09.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2020 09:59:53 -0800 (PST)
From:   nikitos.tr@gmail.com
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     robh+dt@kernel.org, stephan@gerhold.net, Michael.Srba@seznam.cz,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Nikita Travkin <nikitos.tr@gmail.com>
Subject: [PATCH 4/6] arm64: dts: qcom: msm8916-longcheer-l8150: Add flash LED
Date:   Fri, 13 Nov 2020 22:59:15 +0500
Message-Id: <20201113175917.189123-4-nikitos.tr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201113175917.189123-1-nikitos.tr@gmail.com>
References: <20201113175917.189123-1-nikitos.tr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Nikita Travkin <nikitos.tr@gmail.com>

L8150 uses SGM3785 Flash LED driver. It is similar to SGM3140 but
can also be controlled with PWM. Since SoC doesn't have PWM, add
led to the device tree using sgm3140 driver.

Signed-off-by: Nikita Travkin <nikitos.tr@gmail.com>
---
 .../boot/dts/qcom/msm8916-longcheer-l8150.dts | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
index 79a2475e3cd5..2b8670dd4b71 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
@@ -6,6 +6,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/leds/common.h>
 
 / {
 	model = "Longcheer L8150";
@@ -65,6 +66,21 @@ reg_ctp: regulator-ctp {
 		pinctrl-names = "default";
 		pinctrl-0 = <&ctp_pwr_en_default>;
 	};
+
+	flash-led-controller {
+		compatible = "sgmicro,sgm3140";
+		flash-gpios = <&msmgpio 31 GPIO_ACTIVE_HIGH>;
+		enable-gpios = <&msmgpio 32 GPIO_ACTIVE_HIGH>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&camera_flash_default>;
+
+		flash_led: led {
+			function = LED_FUNCTION_FLASH;
+			color = <LED_COLOR_ID_WHITE>;
+			flash-max-timeout-us = <250000>;
+		};
+	};
 };
 
 &blsp_i2c2 {
@@ -286,6 +302,14 @@ l18 {
 };
 
 &msmgpio {
+	camera_flash_default: camera-flash-default {
+		pins = "gpio31", "gpio32";
+		function = "gpio";
+
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	ctp_pwr_en_default: ctp-pwr-en-default {
 		pins = "gpio17";
 		function = "gpio";
-- 
2.25.1

