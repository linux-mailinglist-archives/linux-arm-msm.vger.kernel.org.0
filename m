Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4BFE05B6E5B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Sep 2022 15:29:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232259AbiIMN3I (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Sep 2022 09:29:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232262AbiIMN24 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Sep 2022 09:28:56 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2A08192B3
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Sep 2022 06:28:53 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id i26so20086076lfp.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Sep 2022 06:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=AYTfQ/8q3iOQdS6L9K3xlP1uJArjxjNbvxSZu1MZ7EM=;
        b=DE4iKxqoTDPejTExePSFXK/2OfDip3djKHppXwKk4uZ2MWwXGAJxCf4J+1+xjTNern
         m6ljgWfq+cMgGItjL1md4hqC557+KVFAyBFZcdh1w9XE6PvYY7QY4M2oYhhpPjSl7jdV
         W/jA1HO+dRrbkwi6ssaoOkm2fGwgNO6kgCEB8eBdg84Nqitf8ubBLUk1de4uOVJIEOWm
         zTNxjiqP0yDGCzy3e/oQG1b1/WWy7fXH+kzdqkOetrwyN08YOXQkcfsAdiFNWy/mV1ZB
         YqEfCg71vDnXmfUyYU0XVFL1c78hgRsXxvgdkDq7wkQUXAm/+xt5o7vfrViEjvv9VTQ0
         V3uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=AYTfQ/8q3iOQdS6L9K3xlP1uJArjxjNbvxSZu1MZ7EM=;
        b=vUE8YDuyRX1bm1CpZ+esFqpffmk1b7NThWnM8aNZWVd4ofhcGPkrad/K02w8oFQZ2T
         G9jqIsLw1m9qWP9bWmWvUwejH/FbctlIepp9+Gf1VcUbDiZibMUK1g7qUqBPQikQXpY+
         bIV3z1FlQNT54XKYCXI0tz/N91jnnQr4M0vfJJPpxScLdJMSdKQhQFx3ztFePZMD4rut
         wZzJEUIbOe9bKOY4vKmVZboPIWogYuw0xn7I4uC4W63+THULraSGOSXmw2SXpkh0KzIs
         ZMW0+rVCDQGCacZ0uRwVZqobCJBQqQFIkZPXZen+XsTeyZuLMAdB0dyYxj4TV1Z4NsDm
         eOMA==
X-Gm-Message-State: ACgBeo0VCCWVZ3pplV3duvECVlzbE3aaicbRckOcog35fTbkcg90GeLe
        DIEJk1AlcbPnYRKRCCs3guTlyZ2rudLkww==
X-Google-Smtp-Source: AA6agR483PCG2TD8xo8Aj2d6SBmKk5wcL/H7nHpe8uYJdUFKvRXhcRRp1llXDBvuEv2aSUySXuMxgw==
X-Received: by 2002:a05:6512:b08:b0:492:87ad:5f5c with SMTP id w8-20020a0565120b0800b0049287ad5f5cmr11580688lfu.293.1663075731565;
        Tue, 13 Sep 2022 06:28:51 -0700 (PDT)
Received: from fedora.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id b15-20020a056512024f00b00498f871f33fsm1713802lfo.86.2022.09.13.06.28.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 06:28:50 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     linux-arm-kernel@lists.infradead.org,
        Herman van Hazendonk <me@herrie.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 1/3] ARM: dts: qcom-msm8660: Add GSBI1 SPI bus
Date:   Tue, 13 Sep 2022 15:28:44 +0200
Message-Id: <20220913132846.305716-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.37.3
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

GSBI1 can be used to enable an external SPI bus on e.g. the
APQ8060. On the DragonBoard APQ8060 this SPI bus is used to
talk to the LCD display.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/boot/dts/qcom-msm8660.dtsi | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8660.dtsi b/arch/arm/boot/dts/qcom-msm8660.dtsi
index 63a501c63cf8..5640c02db852 100644
--- a/arch/arm/boot/dts/qcom-msm8660.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8660.dtsi
@@ -131,6 +131,31 @@ gcc: clock-controller@900000 {
 			reg = <0x900000 0x4000>;
 		};
 
+		gsbi1: gsbi@16000000 {
+			compatible = "qcom,gsbi-v1.0.0";
+			cell-index = <12>;
+			reg = <0x16000000 0x100>;
+			clocks = <&gcc GSBI1_H_CLK>;
+			clock-names = "iface";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			status = "disabled";
+
+			syscon-tcsr = <&tcsr>;
+
+			gsbi1_spi: spi@16080000 {
+				compatible = "qcom,spi-qup-v1.1.1";
+				reg = <0x16080000 0x1000>;
+				interrupts = <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gcc GSBI1_QUP_CLK>, <&gcc GSBI1_H_CLK>;
+				clock-names = "core", "iface";
+				status = "disabled";
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		gsbi6: gsbi@16500000 {
 			compatible = "qcom,gsbi-v1.0.0";
 			cell-index = <12>;
-- 
2.37.3

