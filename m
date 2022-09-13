Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9948A5B6E5C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Sep 2022 15:29:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232236AbiIMN3N (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Sep 2022 09:29:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232297AbiIMN26 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Sep 2022 09:28:58 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA1B957558
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Sep 2022 06:28:55 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id a3so8107416lfk.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Sep 2022 06:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=DQIW4wvUgD0lYAn0kE2/YaEvgt08S3ejHQvW4rHtlsM=;
        b=BqQsL4vv77G226GHE44y8wumZo2NJxLP3kASbmVvQiJ1Dm7BP5kbcAp6g4MDfRdLh+
         HjGGS7lv6rdgCUXbu+ntjl83/2PALC6PVx50ET0JSdIEvYqZxFR6stgE9WZa+Z8nqySi
         Ry8CV3WeuVAstbtMlJA6BXnVCDhkVdxeWbL4usaOEAP7eXetgNhM/azjpRZHIx7MeRks
         yFjv4Zie90bmQNmIejP0z006+xQYSKGzYupGDvaKRPfH49qrGDywC/kXikhSAfwFpZDP
         bptGA7WodoV3/OV0NgMCOX7dtZB1GMFXp+UjUfkdoPxs95bGuxIdbqDYkQTsVbDH4aHt
         AtSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=DQIW4wvUgD0lYAn0kE2/YaEvgt08S3ejHQvW4rHtlsM=;
        b=R0LVIZfpiOEX6pR7OZdg4pGdzUe9UG05KQpdHzCCjKMcc9TQ9oAlG4Od59l5Sy/iCD
         N3zRaDtM0PALrkM4A0ZDt/kmT2ZQ8ClNBYvoG3pcyL+kUZry//LYHGP6xmGwznaBYkMh
         j+y+Vc6wdZeJaDCZNcsu5UlBB8ZOCRBq7ni9YBBMApFWsnsiFBzs0GYHvM0RCkQQ0KX/
         z/6gkZHmiDqM8jb6zkXJG7LbWGTZHE2hfEhCbDcGl23H/zT6qn1i/mgULtzxqEgWt2Y9
         l4/89FIxDNQ0rJUTREChTvxSud0YkiL1H/mokZqJOb1n8Qq1ttgj5LNz4niXedvXGuvV
         XapQ==
X-Gm-Message-State: ACgBeo0ODKOw+YiOCTRLYCLuhiQHB43P3/zyMuolQVJozkVMMVnXwtp/
        FCLxQlAowzis86LEC6ncbj88bmWzeKrcEA==
X-Google-Smtp-Source: AA6agR4w3GachcoeDopTu5wm18DDPhKT0gFmW3AsjCZpdndDoRy4xM3BEimfg2glZEQTxxxwUYh7Bg==
X-Received: by 2002:a05:6512:3503:b0:496:517:5818 with SMTP id h3-20020a056512350300b0049605175818mr9820908lfs.186.1663075733610;
        Tue, 13 Sep 2022 06:28:53 -0700 (PDT)
Received: from fedora.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id b15-20020a056512024f00b00498f871f33fsm1713802lfo.86.2022.09.13.06.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 06:28:52 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     linux-arm-kernel@lists.infradead.org,
        Herman van Hazendonk <me@herrie.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 2/3] ARM: dts: qcom-msm8660: Add GSBI3 I2C bus
Date:   Tue, 13 Sep 2022 15:28:45 +0200
Message-Id: <20220913132846.305716-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220913132846.305716-1-linus.walleij@linaro.org>
References: <20220913132846.305716-1-linus.walleij@linaro.org>
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

GSBI3 can be used to enable an external I2C bus on e.g. the
APQ8060. On the DragonBoard APQ8060 this I2C bus is used to
talk to the Cypress CY8CTMA340 CYTTSP touchscreen.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/boot/dts/qcom-msm8660.dtsi | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8660.dtsi b/arch/arm/boot/dts/qcom-msm8660.dtsi
index 5640c02db852..f3131bee752e 100644
--- a/arch/arm/boot/dts/qcom-msm8660.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8660.dtsi
@@ -156,6 +156,31 @@ gsbi1_spi: spi@16080000 {
 			};
 		};
 
+		gsbi3: gsbi@16200000 {
+			compatible = "qcom,gsbi-v1.0.0";
+			cell-index = <12>;
+			reg = <0x16200000 0x100>;
+			clocks = <&gcc GSBI3_H_CLK>;
+			clock-names = "iface";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+
+			syscon-tcsr = <&tcsr>;
+			status = "disabled";
+
+			gsbi3_i2c: i2c@16280000 {
+				compatible = "qcom,i2c-qup-v1.1.1";
+				reg = <0x16280000 0x1000>;
+				interrupts = <GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gcc GSBI3_QUP_CLK>, <&gcc GSBI3_H_CLK>;
+				clock-names = "core", "iface";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+		};
+
 		gsbi6: gsbi@16500000 {
 			compatible = "qcom,gsbi-v1.0.0";
 			cell-index = <12>;
-- 
2.37.3

