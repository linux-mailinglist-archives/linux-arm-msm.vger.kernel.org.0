Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5CB0E5B6E0B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Sep 2022 15:14:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230519AbiIMNOo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Sep 2022 09:14:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229853AbiIMNOk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Sep 2022 09:14:40 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11CE16150
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Sep 2022 06:14:37 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id x10so14318916ljq.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Sep 2022 06:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=LIzkEbGu39kfxmsoJvSbR7jzHjkXlGS1st2Otx8Z+Yk=;
        b=VwtdKLOb1t4FXhLrVWpMdxP48RC/EmgJwF27tSYMBlBaeLW5lRhOQO7+nFWdwne/o1
         p4Wc4dz9ZziEoF//X5jZYUlyu6Nv1xyL5W2dPy4RYhur1llX6dxU+r5+wyYrUm6MheW7
         zK2W8Zog7+e71+NAJsb4D9CdRimI9NpbruiHVbrZEb7GWxSnuc18cq/4LLlteQfxPFYS
         jXIjQVH3OxgLYlFCi8g7U840JlkT4XInGMzWlObIzsKqjF5AgWB3PNfEr+9SqL6shs5K
         5gUDJk7pMX1v8aJZL+EX3znWIALwMNMYT7Kd9iBWVhk9wu5qrJjKlO+FVHETyFfkGE3Y
         1sjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=LIzkEbGu39kfxmsoJvSbR7jzHjkXlGS1st2Otx8Z+Yk=;
        b=YQyaQmp5JB03+6O5NziuskwMz83FBeaXSY1CRyTatmiqWZIwsrfzsXrplBsesTygx4
         UvyONmBmzdyG8wNS6leuPYQOiJPZ6+7bFOwlJgtCmIexESKX9QnJ4Z46l/YarOYRQEKn
         poVUmaY+DyhxcMIPETICfSVSuG0vTTIP2hq/ZtNXGzpHpQKbVSTDfKblnXOMX+/YFrr+
         VBexiJJfcp6FZ3NVPPhxuPMxnm+KwM/Kyv8NtD4XeTZJ6sJzE/vXqL5h8Oml6qKH+7xj
         5SMVsRJdThnGffQ/25sMJC/ZUpdw7Cj20QztAynr1gtWtRAPGmF9/hE9l89+m5Itraqc
         FL4A==
X-Gm-Message-State: ACgBeo2yUvibP37aArGHEqTv0df4mkWL3g1+MF4/cRTzjRZxyGFX8XSq
        L6TRWprdfC4NlvdYVcGzjlku3BvCION2qg==
X-Google-Smtp-Source: AA6agR7nlR7IWFbNbc8HoHdVHrsolshq6dNXJujQbf8qq5HE7TyJyGI348Q48IdX+3HY4HBp+pFt1w==
X-Received: by 2002:a05:651c:553:b0:268:e0b3:479d with SMTP id q19-20020a05651c055300b00268e0b3479dmr9645021ljp.239.1663074874979;
        Tue, 13 Sep 2022 06:14:34 -0700 (PDT)
Received: from fedora.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id m25-20020a05651202f900b00492f5ad0ae7sm1703255lfq.43.2022.09.13.06.14.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 06:14:34 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     linux-arm-kernel@lists.infradead.org,
        Herman van Hazendonk <me@herrie.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 3/3] ARM: dts: qcom: Add TMA340 to APQ8060 DragonBoard
Date:   Tue, 13 Sep 2022 15:14:23 +0200
Message-Id: <20220913131423.304804-3-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220913131423.304804-1-linus.walleij@linaro.org>
References: <20220913131423.304804-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This adds the CY8CTMA340 Touchscreen to the APQ8060 DragonBoard.

Tested without display by issuing cat /dev/input/input/event3
which produces appropriate noise and interrupts on the dedicated
GPIO line.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 .../arm/boot/dts/qcom-apq8060-dragonboard.dts | 71 ++++++++++++++++++-
 1 file changed, 70 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-apq8060-dragonboard.dts b/arch/arm/boot/dts/qcom-apq8060-dragonboard.dts
index 70a1dd629c7a..b07a0ba9e734 100644
--- a/arch/arm/boot/dts/qcom-apq8060-dragonboard.dts
+++ b/arch/arm/boot/dts/qcom-apq8060-dragonboard.dts
@@ -159,6 +159,19 @@ data {
 				};
 			};
 
+			dragon_gsbi3_i2c_pins: gsbi3_i2c {
+				mux {
+					pins = "gpio43", "gpio44";
+					function = "gsbi3";
+				};
+				pinconf {
+					pins = "gpio43", "gpio44";
+					drive-strength = <8>;
+					/* These have external pull-up 2.2kOhm to 1.8V */
+					bias-disable;
+				};
+			};
+
 			dragon_gsbi8_i2c_pins: gsbi8_i2c {
 				mux {
 					pins = "gpio64", "gpio65";
@@ -240,6 +253,22 @@ irq {
 					bias-pull-up;
 				};
 			};
+
+			dragon_tma340_gpios: tma340 {
+				reset {
+					/* RESET line, TS_ATTN, WAKE_CTP */
+					pins = "gpio58";
+					function = "gpio";
+					drive-strength = <6>;
+					bias-disable;
+				};
+				irq {
+					pins = "gpio61"; /* IRQ line */
+					function = "gpio";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
 		};
 
 		qcom,ssbi@500000 {
@@ -444,6 +473,45 @@ led@133 {
 			};
 		};
 
+		gsbi@16200000 {
+			status = "okay";
+			qcom,mode = <GSBI_PROT_I2C>;
+
+			gsbi3_i2c: i2c@16280000 {
+				status = "okay";
+				pinctrl-names = "default";
+				pinctrl-0 = <&dragon_gsbi3_i2c_pins>;
+
+				touchscreen@24 {
+					compatible = "cypress,cy8ctma340";
+					reg = <0x24>;
+					/* Certainly we can do at least 400 kHz */
+					clock-frequency = <400000>;
+					/* IRQ on GPIO61 called /CTP_INT */
+					interrupt-parent = <&tlmm>;
+					interrupts = <61 IRQ_TYPE_EDGE_FALLING>;
+					/*
+					 * The I2C bus is using a PCA9306 level translator from L16A
+					 * to L2B so these two voltages are needed and L16A is
+					 * kind of the IO voltage, however L16Aisn't really fed to
+					 * the TMA340, which relies entirely on L2B (PM8901 L2).
+					 */
+					vcpin-supply = <&pm8058_l16>;
+					vdd-supply = <&pm8901_l2>;
+					/* GPIO58, called WAKE_CTP */
+					reset-gpios = <&tlmm 58 GPIO_ACTIVE_LOW>;
+					touchscreen-size-x = <480>;
+					touchscreen-size-y = <800>;
+					active-interval-ms = <0>;
+					touch-timeout-ms = <255>;
+					lowpower-interval-ms = <10>;
+					bootloader-key = /bits/ 8 <0x00 0x01 0x02 0x03 0x04 0x05 0x06 0x07>;
+					pinctrl-names = "default";
+					pinctrl-0 = <&dragon_tma340_gpios>;
+				};
+			};
+		};
+
 		gsbi@19800000 {
 			status = "okay";
 			qcom,mode = <GSBI_PROT_I2C>;
@@ -634,7 +702,8 @@ l1 {
 					bias-pull-down;
 				};
 				l2 {
-					regulator-min-microvolt = <2850000>;
+					/* TMA340 requires strictly 3.3V */
+					regulator-min-microvolt = <3300000>;
 					regulator-max-microvolt = <3300000>;
 					bias-pull-down;
 				};
-- 
2.37.3

